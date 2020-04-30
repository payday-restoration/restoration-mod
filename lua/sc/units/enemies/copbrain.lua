local old_init = CopBrain.init
local old_update = CopBrain.update
local logic_variants = {
	security = {
		idle = CopLogicIdle,
		attack = CopLogicAttack,
		travel = CopLogicTravel,
		inactive = CopLogicInactive,
		intimidated = CopLogicIntimidated,
		arrest = CopLogicArrest,
		guard = CopLogicGuard,
		flee = CopLogicFlee,
		sniper = CopLogicSniper,
		trade = CopLogicTrade,
		phalanx = CopLogicPhalanxMinion
	}
}
local security_variant = logic_variants.security
function CopBrain:init(unit)
	old_init(self, unit)
	CopBrain._logic_variants.dave = security_variant
	CopBrain._logic_variants.cop_civ = security_variant
	CopBrain._logic_variants.cop_forest = security_variant
	CopBrain._logic_variants.fbi_female = security_variant
	CopBrain._logic_variants.hrt = security_variant
	CopBrain._logic_variants.fbi_swat_vet = security_variant
	CopBrain._logic_variants.swat_titan = security_variant
	CopBrain._logic_variants.swat_assault = security_variant
	CopBrain._logic_variants.city_swat_titan = security_variant
	CopBrain._logic_variants.city_swat_titan_assault = security_variant
	CopBrain._logic_variants.skeleton_swat_titan = security_variant
	CopBrain._logic_variants.weekend = security_variant
	CopBrain._logic_variants.weekend_dmr = security_variant
	CopBrain._logic_variants.weekend_lmg = security_variant
	CopBrain._logic_variants.omnia = security_variant
	CopBrain._logic_variants.omnia_heavy = security_variant
	CopBrain._logic_variants.boom = security_variant
	CopBrain._logic_variants.boom_summers = security_variant
	CopBrain._logic_variants.taser_summers = clone(security_variant)
	CopBrain._logic_variants.medic_summers = security_variant
	CopBrain._logic_variants.fbi_vet = security_variant
	CopBrain._logic_variants.fbi_vet_boss = security_variant
	CopBrain._logic_variants.vetlod = security_variant	
	CopBrain._logic_variants.meme_man = security_variant	
	CopBrain._logic_variants.meme_man_shield = clone(security_variant)
	CopBrain._logic_variants.meme_man_shield.attack = ShieldLogicAttack
	CopBrain._logic_variants.meme_man_shield.intimidated = nil
	CopBrain._logic_variants.meme_man_shield.flee = nil	
	CopBrain._logic_variants.spring = clone(security_variant)
	CopBrain._logic_variants.spring.attack = TankCopLogicAttack
	CopBrain._logic_variants.summers = clone(security_variant)
	CopBrain._logic_variants.summers.attack = TankCopLogicAttack
	CopBrain._logic_variants.tank_titan = clone(security_variant)
	CopBrain._logic_variants.tank_titan.attack = TankCopLogicAttack
	CopBrain._logic_variants.tank_titan_assault = clone(security_variant)
	CopBrain._logic_variants.tank_titan_assault.attack = TankCopLogicAttack
	CopBrain._logic_variants.spring.phalanx = CopLogicPhalanxVip
	CopBrain._logic_variants.summers.phalanx = CopLogicPhalanxVip
	CopBrain._logic_variants.taser_summers.attack = TaserLogicAttack
	CopBrain._logic_variants.omnia_lpf = security_variant
	CopBrain._logic_variants.tank_biker = clone(security_variant)
	CopBrain._logic_variants.tank_biker.attack = TankCopLogicAttack
	CopBrain._logic_variants.biker_guard = security_variant
	CopBrain._logic_variants.phalanx_minion_assault = clone(security_variant)
	CopBrain._logic_variants.phalanx_minion_assault.attack = ShieldLogicAttack
	CopBrain._logic_variants.phalanx_minion_assault.intimidated = nil
	CopBrain._logic_variants.phalanx_minion_assault.flee = nil
	CopBrain._logic_variants.spooc_titan = clone(security_variant)
	CopBrain._logic_variants.spooc_titan.idle = SpoocLogicIdle
	CopBrain._logic_variants.spooc_titan.attack = SpoocLogicAttack
	CopBrain._logic_variants.taser_titan = clone(security_variant)
	CopBrain._logic_variants.autumn = clone(security_variant)
end

--Thanks Rokk--
Hooks:PostHook(CopBrain, "convert_to_criminal", "SCCopBrainDoConvert", function(self)
	
	self._unit:unit_data().is_convert = true
	
	--Ugly hack to be able to call converts
	--Kill me now
	if not SC._converts then
		SC._converts = {}
	end   
	table.insert(SC._converts, self._unit)
	
end)

function CopBrain:on_nav_link_unregistered(element_id)
	if self._logic_data.pathing_results then
		local failed_search_ids = nil

		for path_name, path in pairs(self._logic_data.pathing_results) do
			if type(path) == "table" and path[1] and type(path[1]) ~= "table" then
				for i, nav_point in ipairs(path) do
					if not nav_point.x and nav_point.script_data and nav_point:script_data().element._id == element_id then
						failed_search_ids = failed_search_ids or {}
						failed_search_ids[path_name] = true

						break
					end
				end
			end
		end

		if failed_search_ids then
			for search_id, _ in pairs(failed_search_ids) do
				self._logic_data.pathing_results[search_id] = "failed"
			end
		end
	end

	local paths = self._current_logic._get_all_paths and self._current_logic._get_all_paths(self._logic_data)

	if not paths then
		return
	end

	local verified_paths = {}

	for path_name, path in pairs(paths) do
		local path_is_ok = true

		for i, nav_point in ipairs(path) do
			if not nav_point.x and nav_point.script_data and nav_point:script_data().element._id == element_id then
				path_is_ok = false

				break
			end
		end

		if path_is_ok then
			verified_paths[path_name] = path
		end
	end

	self._current_logic._set_verified_paths(self._logic_data, verified_paths)
end

function CopBrain:convert_to_criminal(mastermind_criminal)
	self._logic_data.is_converted = true
	self._logic_data.group = nil
	local mover_col_body = self._unit:body("mover_blocker")

	mover_col_body:set_enabled(false)

	local attention_preset = PlayerMovement._create_attention_setting_from_descriptor(self, tweak_data.attention.settings.team_enemy_cbt, "team_enemy_cbt")

	self._attention_handler:override_attention("enemy_team_cbt", attention_preset)

	local health_multiplier = 1
	local damage_multiplier = 1

	if alive(mastermind_criminal) then
		--mastermind_criminal:sound():say("v21", false)
		health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_health_multiplier") or 1)
		health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_health_multiplier") or 1)
		damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_damage_multiplier") or 1)
		damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_damage_multiplier") or 1)
	else
		--managers.player:speak("v21", false, nil)
		health_multiplier = health_multiplier * managers.player:upgrade_value("player", "convert_enemies_health_multiplier", 1)
		health_multiplier = health_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_health_multiplier", 1)
		damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "convert_enemies_damage_multiplier", 1)
		damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_damage_multiplier", 1)
	end
	
	

	self._unit:character_damage():convert_to_criminal(health_multiplier)

	self._logic_data.attention_obj = nil

	CopLogicBase._destroy_all_detected_attention_object_data(self._logic_data)

	self._SO_access = managers.navigation:convert_access_flag(tweak_data.character.russian.access)
	self._logic_data.SO_access = self._SO_access
	self._logic_data.SO_access_str = tweak_data.character.russian.access
	self._slotmask_enemies = managers.slot:get_mask("enemies")
	self._logic_data.enemy_slotmask = self._slotmask_enemies
	local equipped_w_selection = self._unit:inventory():equipped_selection()

	if equipped_w_selection then
		self._unit:inventory():remove_selection(equipped_w_selection, true)
	end
	
	World:effect_manager():spawn({
		effect = Idstring("effects/payday2/particles/impacts/money_impact_pd2"),
		position = self._unit:movement():m_pos()
	})

	local weap_name = self._unit:base():default_weapon_name()

	TeamAIInventory.add_unit_by_name(self._unit:inventory(), weap_name, true)

	local weapon_unit = self._unit:inventory():equipped_unit()

	weapon_unit:base():add_damage_multiplier(damage_multiplier)
	self:set_objective(nil)
	self:set_logic("idle", nil)

	self._logic_data.objective_complete_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_complete")
	self._logic_data.objective_failed_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_failed")

	managers.groupai:state():on_criminal_jobless(self._unit)
	self._unit:base():set_slot(self._unit, 16)
	self._unit:movement():set_stance("hos")

	local action_data = {
		clamp_to_graph = true,
		type = "act",
		body_part = 1,
		variant = "attached_collar_enter",
		blocks = {
			heavy_hurt = -1,
			hurt = -1,
			action = -1,
			light_hurt = -1,
			walk = -1
		}
	}

	self._unit:brain():action_request(action_data)
	self._unit:sound():say("cn1", true, nil)
	managers.network:session():send_to_peers_synched("sync_unit_converted", self._unit)
end
			
function CopBrain:on_suppressed(state)
	self._logic_data.is_suppressed = state or nil

	if self._current_logic.on_suppressed_state then
		self._current_logic.on_suppressed_state(self._logic_data)

		if self._logic_data.char_tweak.chatter.suppress then 
			if managers.groupai:state():chk_assault_active_atm()then
			local roll = math.rand(1, 100)
			local chance_heeeeelpp = 50
				if roll <= chance_heeeeelpp then
					self._unit:sound():say("hlp", true) 
					--log(" assault panic works")
				else --hopefully some variety here now
					self._unit:sound():say("lk3a", true) 
					--log(" assault panic works")
				end	
			else		
			   self._unit:sound():say("lk3b", true) --calmer lines for when the assault is off
			   --log("between assault panic works")
			end
		end
	end
end

function CopBrain:begin_alarm_pager(reset)
	if not reset and self._alarm_pager_has_run then
		return
	end
	
	--Suspicion Increase from a pager call
	managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.02
	managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
	managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
	managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.02
	managers.groupai:state():_delay_whisper_suspicion_mul_decay()		

	self._alarm_pager_has_run = true
	self._alarm_pager_data = {
		total_nr_calls = math.random(tweak_data.player.alarm_pager.nr_of_calls[1], tweak_data.player.alarm_pager.nr_of_calls[2]),
		nr_calls_made = 0
	}
	local call_delay = math.lerp(tweak_data.player.alarm_pager.first_call_delay[1], tweak_data.player.alarm_pager.first_call_delay[2], math.random())
	self._alarm_pager_data.pager_clbk_id = "pager" .. tostring(self._unit:key())

	managers.enemy:add_delayed_clbk(self._alarm_pager_data.pager_clbk_id, callback(self, self, "clbk_alarm_pager"), TimerManager:game():time() + call_delay)
end
	
function CopBrain:on_alarm_pager_interaction(status, player)
	if not managers.groupai:state():whisper_mode() then
		return
	end

	local is_dead = self._unit:character_damage():dead()
	local pager_data = self._alarm_pager_data

	if not pager_data then
		return
	end

	if status == "started" then
		self._unit:sound():stop()
		self._unit:interaction():set_outline_flash_state(nil, true)

		if pager_data.pager_clbk_id then
			managers.enemy:remove_delayed_clbk(pager_data.pager_clbk_id)

			pager_data.pager_clbk_id = nil
		end
	elseif status == "complete" then
		local nr_previous_bluffs = managers.groupai:state():get_nr_successful_alarm_pager_bluffs()
		local has_upgrade = nil

		if player:base().is_local_player then
			has_upgrade = managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff")
		else
			has_upgrade = player:base():upgrade_value("player", "corpse_alarm_pager_bluff")
		end

		local chance_table = tweak_data.player.alarm_pager[has_upgrade and "bluff_success_chance_w_skill" or "bluff_success_chance"]
		local chance_index = math.min(nr_previous_bluffs + 1, #chance_table)
		local is_last = chance_table[math.min(chance_index + 1, #chance_table)] == 0
		local rand_nr = math.random()
		local success = chance_table[chance_index] > 0 and rand_nr < chance_table[chance_index]

		self._unit:sound():stop()

		if success then
			managers.groupai:state():on_successful_alarm_pager_bluff()

			local cue_index = is_last and 4 or 1

			if is_dead then
				self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_fooled_" .. tostring(cue_index)), nil, true)
			else
				self._unit:sound():play(self:_get_radio_id("dsp_radio_fooled_" .. tostring(cue_index)), nil, true)
			end

			if is_last then
				-- Nothing
			end
		else
			self._unit:interaction():set_active(false, true)
			
			--Unconvincing pager response
			managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.15
			managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
			managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
			managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.25
			managers.groupai:state():_delay_whisper_suspicion_mul_decay()					

			if is_dead then
				self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_fooled_4"), nil, true)
			else
				self._unit:sound():play(self:_get_radio_id("dsp_radio_fooled_4"), nil, true)
			end
		end

		self:end_alarm_pager()
		managers.mission:call_global_event("player_answer_pager")

		if not self:_chk_enable_bodybag_interaction() then
			self._unit:interaction():set_active(false, true)
		end
	elseif status == "interrupted" then
		--Suspicion Increase from an interrupted pager
		managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.2
		managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
		managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.7
		managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.3
		managers.groupai:state():_delay_whisper_suspicion_mul_decay()		
		
		--Tutorial Heists will sound an alarm to prevent a soft lock
		local job = Global.level_data and Global.level_data.level_id
		
		if job == "short1_stage1" or job == "short1_stage2" then 
			managers.groupai:state():on_police_called("sys_police_alerted")
			managers.groupai:state():set_point_of_no_return_timer(10, 0)
		end			
		
		self._unit:interaction():set_active(false, true)
		self._unit:sound():stop()

		if is_dead then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end
		
		self._unit:interaction():set_tweak_data("corpse_dispose")
		self._unit:interaction():set_active(true, true)						

		self:end_alarm_pager()
	end
end	

function CopBrain:clbk_alarm_pager(ignore_this, data)
	local pager_data = self._alarm_pager_data
	local clbk_id = pager_data.pager_clbk_id
	pager_data.pager_clbk_id = nil

	if not managers.groupai:state():whisper_mode() then
		self:end_alarm_pager()

		return
	end

	if pager_data.nr_calls_made == 0 then
		if managers.groupai:state():is_ecm_jammer_active("pager") then
			self:end_alarm_pager()
			self:begin_alarm_pager(true)

			return
		end

		self._unit:sound():stop()

		if self._unit:character_damage():dead() then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_query_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_query_1"), nil, true)
		end

		self._unit:interaction():set_tweak_data("corpse_alarm_pager")
		self._unit:interaction():set_active(true, true)
	elseif pager_data.nr_calls_made < pager_data.total_nr_calls then
		self._unit:sound():stop()

		if self._unit:character_damage():dead() then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end
	elseif pager_data.nr_calls_made == pager_data.total_nr_calls then
		self._unit:interaction():set_active(false, true)
		
		if is_dead then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end			

		--Suspicion Increase from a dropped pager
		managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.2
		managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
		managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.7
		managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.3
		managers.groupai:state():_delay_whisper_suspicion_mul_decay()		

		--Tutorial Heists will sound an alarm to prevent a soft lock
		local job = Global.level_data and Global.level_data.level_id
		
		if job == "short1_stage1" or job == "short1_stage2" then 
			managers.groupai:state():on_police_called("sys_police_alerted")
			managers.groupai:state():set_point_of_no_return_timer(10, 0)
		end

		self._unit:sound():stop()

		self:end_alarm_pager()
		
		self._unit:interaction():set_tweak_data("corpse_dispose")
		self._unit:interaction():set_active(true, true)			
	end

	if pager_data.nr_calls_made == pager_data.total_nr_calls - 1 then
		self._unit:interaction():set_outline_flash_state(true, true)
	end

	pager_data.nr_calls_made = pager_data.nr_calls_made + 1

	if pager_data.nr_calls_made <= pager_data.total_nr_calls then
		local duration_settings = tweak_data.player.alarm_pager.call_duration[math.min(#tweak_data.player.alarm_pager.call_duration, pager_data.nr_calls_made)]
		local call_delay = math.lerp(duration_settings[1], duration_settings[2], math.random())
		self._alarm_pager_data.pager_clbk_id = clbk_id

		managers.enemy:add_delayed_clbk(self._alarm_pager_data.pager_clbk_id, callback(self, self, "clbk_alarm_pager"), TimerManager:game():time() + call_delay)
	end
end	