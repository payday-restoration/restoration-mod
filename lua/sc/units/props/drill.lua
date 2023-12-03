Drill.on_hit_autorepair_chance = 0.75

Hooks:PostHook(Drill, "start", "res_start", function(self)
	managers.groupai:state():set_area_min_police_force(self._unit:key(), 3, self._unit:position())
end)

Hooks:PostHook(Drill, "done", "res_done", function(self)
	managers.groupai:state():set_area_min_police_force(self._unit:key())
end)

function Drill:_register_sabotage_SO()
	if self._sabotage_SO_id or not managers.navigation:is_data_ready() or not self._unit:timer_gui() or not self._unit:timer_gui()._can_jam or not self._sabotage_align_obj_name then
		return
	end

	local field_pos = self._nav_tracker:field_position()
	local field_z = self._nav_tracker:field_z() - 25
	local height = self._pos.z - field_z
	local act_anim = "sabotage_device_" .. (height > 100 and "high" or height > 60 and "mid" or "low")
	local align_obj = self._unit:get_object(Idstring(self._sabotage_align_obj_name))
	local objective_rot = align_obj:rotation()
	local objective_pos = align_obj:position()
	self._SO_area = managers.groupai:state():get_area_from_nav_seg_id(self._nav_tracker:nav_segment())
	local followup_objective = {
		attitude = "avoid",
		scan = true,
		stance = "hos",
		type = "defend_area",
		interrupt_health = 1,
		interrupt_dis = 500,
		nav_seg = self._nav_tracker:nav_segment(),
		area = self._SO_area
	}
	local objective = {
		type = "act",
		interrupt_health = 1,
		stance = "hos",
		haste = "run",
		scan = true,
		chatter_type = self.is_drill and "sabotagedrill" or "sabotagegear",
		interrupt_dis = 800,
		nav_seg = self._nav_tracker:nav_segment(),
		area = self._SO_area,
		pos = objective_pos,
		rot = objective_rot,
		fail_clbk = callback(self, self, "on_sabotage_SO_failed"),
		complete_clbk = callback(self, self, "on_sabotage_SO_completed"),
		action_start_clbk = callback(self, self, "on_sabotage_SO_started"),
		followup_objective = followup_objective,
		action = {
			align_sync = true,
			type = "act",
			body_part = 1,
			variant = act_anim,
			blocks = {
				light_hurt = -1,
				action = -1,
				aim = -1
			}
		}
	}
	local so_descriptor = {
		interval = 0,
		search_dis_sq = 1000000,
		AI_group = "enemies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective,
		search_pos = field_pos,
		verification_clbk = callback(self, self, "clbk_sabotage_SO_verification"),
		access = managers.navigation:convert_access_filter_to_number({
			"gangster",
			"security",
			"security_patrol",
			"cop",
			"fbi",
			"swat",
			"murky",
			"sniper",
			"spooc",
			"tank",
			"taser"
		}),
		admin_clbk = callback(self, self, "on_sabotage_SO_administered")
	}
	self._sabotage_SO_id = "drill_sabotage" .. tostring(self._unit:key())

	managers.groupai:state():add_special_objective(self._sabotage_SO_id, so_descriptor)
end

function Drill:on_sabotage_SO_started(saboteur)
	if not self._saboteur or self._saboteur:key() ~= saboteur:key() then
		debug_pause_unit(self._unit, "[Drill:on_sabotage_SO_started] wrong saboteur", self._unit, saboteur, self._saboteur)
	end
	
	local can_stun = false
	
	if self._skill_upgrades.auto_repair_level_2 and self._skill_upgrades.auto_repair_level_2 > 0 then
		can_stun = true
	end	
	
	local stun_roll = math.rand(1)
	local stun_chance = tweak_data.upgrades.player_drill_stun_chance or 0.5
	
	if can_stun and stun_roll <= stun_chance then	
		local pos = saboteur:position()
		local normal = math.UP
		local range = 50
		local slot_mask = managers.slot:get_mask("explosion_targets")

		local hit_units, splinters = managers.explosion:detect_and_tase({
			player_damage = 0,
			tase_strength = "heavy",
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			curve_pow = 3,
			damage = 10,
			ignore_unit = self._unit,
			alert_radius = 1
		})
		
		saboteur:sound():play("gl_electric_explode", nil, true)

		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)		
		
		self._saboteur = nil
		
		self:_register_sabotage_SO()		
	else
		self._saboteur = nil

		self._unit:timer_gui():set_jammed(true)

		if self.is_drill and not self._bain_report_sabotage_clbk_id then
			self._bain_report_sabotage_clbk_id = "Drill_bain_report_sabotage" .. tostring(self._unit:key())

			managers.enemy:add_delayed_clbk(self._bain_report_sabotage_clbk_id, callback(self, self, "clbk_bain_report_sabotage"), TimerManager:game():time() + 2 + 4 * math.random())
		end	
	end
end

Hooks:PostHook(Drill, "on_sabotage_SO_completed", "RR_on_sabotage_SO_completed", function(self, saboteur)
	saboteur:sound():say(self.is_drill and "e05" or "e06", true)
end)

Hooks:PostHook(Drill, "destroy", "res_destroy", function(self)
	managers.groupai:state():set_area_min_police_force(self._unit:key())
end)

-- Make autorepair reroll everytime the drill is jammed and fix swapped values
Hooks:PreHook(Drill, "set_jammed", "shc_set_jammed", function (self, jammed)

	if Network:is_server() and jammed and not self._jammed then
		local current_auto_repair_level_1 = self._skill_upgrades.auto_repair_level_1 or 0
		local current_auto_repair_level_2 = self._skill_upgrades.auto_repair_level_2 or 0
		local drill_autorepair_chance = 0

		if current_auto_repair_level_1 > 0 then
			drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_1[1]
		end
		if current_auto_repair_level_2 > 0 then
			drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_2[1]
		end

		self:set_autorepair(math.random() < drill_autorepair_chance, true)
	end
end)

-- Reduce time it takes for autorepair to kick in
function Drill:set_autorepair(state, jammed)
	self._autorepair = state

	if self._autorepair_clbk_id then
		managers.enemy:remove_delayed_clbk(self._autorepair_clbk_id)
		self._autorepair_clbk_id = nil
	end

	if state and (self._jammed or jammed) then
		self._autorepair_clbk_id = "Drill_autorepair" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._autorepair_clbk_id, callback(self, self, "clbk_autorepair"), TimerManager:game():time() + 5 + 5 * math.random())
	end
end