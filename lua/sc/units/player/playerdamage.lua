local mvec1 = Vector3()
PlayerDamage._UPPERS_COOLDOWN = tweak_data.upgrades.values.first_aid_kit.uppers_cooldown

function PlayerDamage:init(unit)
	self._lives_init = tweak_data.player.damage.LIVES_INIT
	--No longer check for one_down.
	self._lives_init = managers.modifiers:modify_value("PlayerDamage:GetMaximumLives", self._lives_init)
	self._unit = unit
	self._max_health_reduction = managers.player:upgrade_value("player", "max_health_reduction", 1)
	self._healing_reduction = managers.player:upgrade_value("player", "healing_reduction", 1)
	self._revives = Application:digest_value(0, true)
	self._uppers_elapsed = 0

	self:replenish() --Sets a number of things, mostly resetting armor, health, and ui stuff. Vanilla code.

	local player_manager = managers.player
	self._bleed_out_health = Application:digest_value(tweak_data.player.damage.BLEED_OUT_HEALTH_INIT * player_manager:upgrade_value("player", "bleed_out_health_multiplier", 1), true)
	self._god_mode = Global.god_mode
	self._invulnerable = false
	self._mission_damage_blockers = {}
	self._gui = Overlay:newgui()
	self._ws = self._gui:create_screen_workspace()
	self._focus_delay_mul = 1
	self._dmg_interval = tweak_data.player.damage.MIN_DAMAGE_INTERVAL

	--Crimespree damage interval scaling
	if Global.game_settings and Global.game_settings.incsmission then
		log("Old Grace Period = " .. tostring(self._dmg_interval))
		--Get crime spree level.
		local crime_spree_level = 0
		local grace_scaling = tweak_data.crime_spree.grace_scaling
		
		if Network:is_server() or Global.game_settings.single_player then
			crime_spree_level = managers.crime_spree:spree_level() or 0
		else
			crime_spree_level = managers.crime_spree:get_peer_spree_level(1) or 0
		end

		--Change grace period.
		if crime_spree_level > grace_scaling.min_level then
			self._dmg_interval = math.max(self._dmg_interval - math.floor((crime_spree_level - grace_scaling.min_level) / grace_scaling.level_interval) * grace_scaling.amount, 0)
		end
		log("EVIL Grace Period = " .. tostring(self._dmg_interval))
	end

	self._next_allowed_dmg_t = Application:digest_value(-100, true)
	self._last_received_dmg = 0
	self._next_allowed_sup_t = -100
	self._last_received_sup = 0
	self._supperssion_data = {}
	self._inflict_damage_body = self._unit:body("inflict_reciever")

	self._inflict_damage_body:set_extension(self._inflict_damage_body:extension() or {})

	local body_ext = PlayerBodyDamage:new(self._unit, self, self._inflict_damage_body)
	self._inflict_damage_body:extension().damage = body_ext

	managers.sequence:add_inflict_updator_body("fire", self._unit:key(), self._inflict_damage_body:key(), self._inflict_damage_body:extension().damage)

	--Load alternate heal over time tweakdata if player is using Infiltrator or Rogue.
	if player_manager:has_category_upgrade("player", "melee_stacking_heal") then
		self._doh_data = tweak_data.upgrades.melee_to_hot_data or {}
		self._hot_amount = managers.player:upgrade_value("player", "heal_over_time", 0)
	elseif player_manager:has_category_upgrade("player", "dodge_stacking_heal") then
		self._doh_data = tweak_data.upgrades.dodge_to_hot_data or {}
		self._hot_amount = managers.player:upgrade_value("player", "heal_over_time", 0)
	else 
		self._doh_data = tweak_data.upgrades.damage_to_hot_data or {}
		self._hot_amount = managers.player:upgrade_value("player", "damage_to_hot", 0)
	end

	self._damage_to_hot_stack = {}
	self._armor_stored_health = 0
	self._can_take_dmg_timer = 0
	self._regen_on_the_side_timer = 0
	self._regen_on_the_side = false
	self._interaction = managers.interaction
	self._armor_regen_mul = managers.player:upgrade_value("player", "armor_regen_time_mul", 1)
	self._dire_need = managers.player:has_category_upgrade("player", "armor_depleted_stagger_shot")
	self._has_damage_speed = managers.player:has_inactivate_temporary_upgrade("temporary", "damage_speed_multiplier")
	self._has_damage_speed_team = managers.player:upgrade_value("player", "team_damage_speed_multiplier_send", 0) ~= 0

	--Unique resmod stuff.
	self._dodge_points = 0.0 --The player's dodge stat, gets set by set_dodge_points once players enter their standard state.
	self._dodge_meter = 0.0 --Amount of dodge built up as meter. Caps at '150' dodge.
	self._dodge_meter_prev = 0.0 --dodge in meter from previous frame.
	self._in_smoke_bomb = 0.0 --Sicario tracking stuff; 0 = not in smoke, 1 = inside smoke, 2 = inside own smoke. Tfw no explicit enum support in lua :(
	self._can_survive_one_hit = player_manager:has_category_upgrade("player", "survive_one_hit") --Yakuza ability to survive at 1 hp before going down.
	self._keep_health_on_revive = false --Used for cloaker kicks and taser downs, stops reviving from changing player health.
	self._biker_armor_regen_t = 0.0 --Used to track the time until the next biker armor regen tick.
	self._melee_push_multiplier = 1 - math.min(math.max(player_manager:upgrade_value("player", "resist_melee_push", 0.0) * self:_max_armor(), 0.0), 0.95) --Stun Resistance melee push resist.
	self._deflection = 1 - managers.player:body_armor_value("deflection", nil, 0) - managers.player:get_deflection_from_skills() --Damage reduction for health.
	self.tase_time = 0 --Titan Taser slow cooldown.
	managers.player:set_damage_absorption("absorption_addend", managers.player:upgrade_value("player", "damage_absorption_addend", 0))

	--The rest of this is unchanged vanilla code.
	local function revive_player()
		self:revive(true)
	end

	managers.player:register_message(Message.RevivePlayer, self, revive_player)

	self._current_armor_fill = 0
	local has_swansong_skill = player_manager:has_category_upgrade("temporary", "berserker_damage_multiplier")
	self._current_state = nil
	self._listener_holder = unit:event_listener()

	if player_manager:has_category_upgrade("player", "damage_to_armor") then
		local damage_to_armor_data = player_manager:upgrade_value("player", "damage_to_armor", nil)
		local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]

		if damage_to_armor_data and armor_data then
			local idx = armor_data.upgrade_level
			self._damage_to_armor = {
				armor_value = damage_to_armor_data[idx][1],
				target_tick = damage_to_armor_data[idx][2],
				elapsed = 0
			}

			local function on_damage(damage_info)
				local attacker_unit = damage_info and damage_info.attacker_unit

				if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
					attacker_unit = attacker_unit:base():thrower_unit()
				end

				if self._unit == attacker_unit then
					local time = Application:time()

					if self._damage_to_armor.target_tick < time - self._damage_to_armor.elapsed then
						self._damage_to_armor.elapsed = time

						self:restore_armor(self._damage_to_armor.armor_value, true)
					end
				end
			end

			CopDamage.register_listener("on_damage", {"on_damage"}, on_damage)
		end
	end

	self._listener_holder:add("on_use_armor_bag", {"on_use_armor_bag"}, callback(self, self, "_on_use_armor_bag_event"))

	if self:_init_armor_grinding_data() then

		function self._on_damage_callback_func()
			return callback(self, self, "_on_damage_armor_grinding")
		end

		self:_add_on_damage_event()
		self._listener_holder:add("on_enter_bleedout", {"on_enter_bleedout"}, callback(self, self, "_on_enter_bleedout_event"))

		if has_swansong_skill then
			self._listener_holder:add("on_enter_swansong", {"on_enter_swansong"}, callback(self, self, "_on_enter_swansong_event"))
			self._listener_holder:add("on_exit_swansong", {"on_enter_bleedout"}, callback(self, self, "_on_exit_swansong_event"))
		end

		self._listener_holder:add("on_revive", {"on_revive"}, callback(self, self, "_on_revive_event"))
	else
		self:_init_standard_listeners()
	end

	if player_manager:has_category_upgrade("temporary", "revive_damage_reduction") then
		self._listener_holder:add("combat_medic_damage_reduction", {"on_revive"}, callback(self, self, "_activate_combat_medic_damage_reduction"))
	end

	if player_manager:has_category_upgrade("player", "revive_damage_reduction") and player_manager:has_category_upgrade("player", "revive_damage_reduction") then

		local function on_revive_interaction_start()
			managers.player:set_property("revive_damage_reduction", player_manager:upgrade_value("player", "revive_damage_reduction"), 1)
		end


		local function on_exit_interaction()
			managers.player:remove_property("revive_damage_reduction")
		end


		local function on_revive_interaction_success()
			managers.player:activate_temporary_upgrade("temporary", "revive_damage_reduction")
		end

		self._listener_holder:add("on_revive_interaction_start", {"on_revive_interaction_start"}, on_revive_interaction_start)
		self._listener_holder:add("on_revive_interaction_interrupt", {"on_revive_interaction_interrupt"}, on_exit_interaction)
		self._listener_holder:add("on_revive_interaction_success", {"on_revive_interaction_success"}, on_revive_interaction_success)
	end

	managers.mission:add_global_event_listener("player_regenerate_armor", {"player_regenerate_armor"}, callback(self, self, "_regenerate_armor"))
	managers.mission:add_global_event_listener("player_force_bleedout", {"player_force_bleedout"}, callback(self, self, "force_into_bleedout", false))

	local level_tweak = tweak_data.levels[managers.job:current_level_id()]

	if level_tweak and level_tweak.is_safehouse and not level_tweak.is_safehouse_combat then
		self:set_mission_damage_blockers("damage_fall_disabled", true)
		self:set_mission_damage_blockers("invulnerable", true)
	end
	
	self._delayed_damage = {
		epsilon = 0.001,
		chunks = {}
	}

	self:clear_delayed_damage()
end

--General function to deal with god mode and stuff. Uses same checks as vanilla damage_bullet().
--Not to be confused with vanilla function using similar name.
function PlayerDamage:can_take_damage(attack_data, damage_info)
	if not self:_chk_can_take_dmg() then
		return false
	elseif self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end
		self:_call_listeners(damage_info)
		return false
	elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)
		return false
	elseif self:incapacitated() then
		return false
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return false
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return false
	elseif self._unit:movement():current_state().immortal then
		return false
	elseif self._revive_miss and math.random() < self._revive_miss then
		self:play_whizby(attack_data.col_ray.position)
		return false
	end
	return true
end

function PlayerDamage:damage_melee(attack_data)
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}

	--Nearly reduntant, but is needed for unique melee events to not break in some cases.
	if not self:can_take_damage(attack_data, damage_info) and not self:_chk_can_take_dmg() then
		return
	end

	local player_unit = managers.player:player_unit()

	--Handles unique events to resmod enemies.
	if alive(attack_data.attacker_unit) then
		if tostring(attack_data.attacker_unit:base()._tweak_table) == "summers" or tostring(attack_data.attacker_unit:base()._tweak_table) == "fbi_vet_boss" then
			if alive(player_unit) then
				player_unit:movement():on_non_lethal_electrocution()
				managers.player:set_player_state("tased")
			end
		elseif tostring(attack_data.attacker_unit:base()._tweak_table) == "autumn" then
			if alive(player_unit) then
				--only the host can currently handle cloaking and decloaking without causing issues, disabling for now
				--attack_data.attacker_unit:damage():run_sequence_simple("decloak")
				--attack_data.attacker_unit:movement():set_uncloaked(true)
				attack_data.attacker_unit:sound():say("i03", true, nil, true)
				managers.player:set_player_state("arrested")
			end			
		end		
	end


	local pm = managers.player
	local can_counter_strike = pm:has_category_upgrade("player", "counter_strike_melee")

	if can_counter_strike and self._unit:movement():current_state().in_melee and self._unit:movement():current_state():in_melee() then
		self._unit:movement():current_state():discharge_melee()

		return "countered"
	end

	local blood_effect = attack_data.melee_weapon and attack_data.melee_weapon == "weapon"
	blood_effect = blood_effect or attack_data.melee_weapon and tweak_data.weapon.npc_melee[attack_data.melee_weapon] and tweak_data.weapon.npc_melee[attack_data.melee_weapon].player_blood_effect or false

	if blood_effect then
		local pos = mvec1

		mvector3.set(pos, self._unit:camera():forward())
		mvector3.multiply(pos, 20)
		mvector3.add(pos, self._unit:camera():position())

		local rot = self._unit:camera():rotation():z()

		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/particles/impacts/blood/blood_impact_a"),
			position = pos,
			normal = rot
		})
	end

	local dmg_mul = pm:damage_reduction_skill_multiplier("melee")
	attack_data.damage = attack_data.damage * dmg_mul

	self._unit:sound():play("melee_hit_body", nil, nil)

	local result = self:damage_bullet(attack_data)
	local vars = {
		"melee_hit",
		"melee_hit_var2"
	}

	--Apply changes to melee push camera effect, cap effects of it so even players with insane armor can tell they were meleed.
	self._unit:camera():play_shaker(vars[math.random(#vars)], math.max(1 * self._melee_push_multiplier, 0.2))

	if pm:current_state() == "bipod" then
		self._unit:movement()._current_state:exit(nil, "standard")
		pm:set_player_state("standard")
	end

	--Apply changes to melee push, this *can* be reduced to 0.
	mvector3.multiply(attack_data.push_vel, _melee_push_multiplier)
	self._unit:movement():push(attack_data.push_vel)

	return result
end

Hooks:PostHook(PlayerDamage, "_regenerated" , "ResRegenerated" , function(self, no_messiah)
	--Apply new method to handle refilling messiah charges.
	if no_messiah then
		managers.player:refill_messiah_charges()
	end

	--Remove What Doesn't Kill DA.
	managers.player:set_damage_absorption(
		"down_absorption",
		0
	)
end)

function PlayerDamage:damage_bullet(attack_data, ...)
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	
	--Vanilla checks just encased into a function for reuse.
	if not self:can_take_damage(attack_data, damage_info) then
		return
	end
	
	--These are done after god mode checks now, just to save time.
	--Also done before DR calcs, so that DR going away never causes grace piercing.
	local pm = managers.player
	self._last_received_dmg = attack_data.damage
	self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)

	self._last_bullet_damage = attack_data.damage
	local next_allowed_dmg_t_old = self._next_allowed_dmg_t
	
	if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
		self._last_received_dmg = self._last_bullet_damage
	end

	local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
	attack_data.damage = attack_data.damage * dmg_mul
	attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
	attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)

	local damage_absorption = pm:damage_absorption()
	if damage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
	end
	
	self:fill_dodge_meter(self._dodge_points) --Getting attacked fills your dodge meter by your dodge stat.
	if self._dodge_meter >= 1.0 then --Dodge attacks if your meter is at '100'.
		self._unit:sound():play("pickup_fak_skill") --PLEASE PLEASE PLEASE REPLACE WITH BETTER SOUND IN THE FUTURE!!!
		if attack_data.damage > 0 then
			self:fill_dodge_meter(-1.0) --If attack is dodged, subtract '100' from the meter.
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())
		self._last_received_dmg = 10000.0 --Makes the grace period from dodging effectively impossible to pierce.
		managers.player:send_message(Message.OnPlayerDodge) --Call skills that listen for dodging.
		return	
	end

	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end

	if 0 < self:get_real_armor() then
		self._unit:sound():play("player_hit")
	else
		self._unit:sound():play("player_hit_permadamage")
		self:fill_dodge_meter(pm:upgrade_value("player", "health_damage_bonus_dodge", 0) * self._dodge_points)
	end
	
	local shake_armor_multiplier = pm:body_armor_value("damage_shake") * pm:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + pm:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier
	
	self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)
	managers.rumble:play("damage_bullet")
	
	self:_hit_direction(attack_data.attacker_unit:position())
	pm:check_damage_carry(attack_data)
	
	attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data)
	
	if self._bleed_out then
		self:_bleed_out_damage(attack_data)
		return
	end
	
	if not attack_data.ignore_suppression and not self:is_suppressed() then
		return
	end
	
	self:_check_chico_heal(attack_data) --Remind Ravi to add friendly fire checks to this later.

	local armor_reduction_multiplier = 0
	
	if 0 >= self:get_real_armor() then
		armor_reduction_multiplier = 1
	end
	
	local health_subtracted = self:_calc_armor_damage(attack_data)
	
	if attack_data.armor_piercing then
		attack_data.damage = attack_data.damage - health_subtracted
		if not _G.IS_VR then --Add screen effect to signify armor piercing attack.
			managers.hud:activate_effect_screen(0.75, {1, 0.2, 0})
		end
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end
	
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
	
	--Unique kill taunt stuff.
	if not self._bleed_out and health_subtracted > 0 then
		self:_send_damage_drama(attack_data, health_subtracted)
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "spring" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_spring", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_common", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)			
	end
	
	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
	
	--Titan Taser shenanigans.
	local _time = math.floor(TimerManager:game():time())
	local player_unit = managers.player:player_unit()
	if alive(attack_data.attacker_unit) then
		if attack_data.attacker_unit:base()._tweak_table == "taser_titan" and self.tase_time < _time or attack_data.attacker_unit:base()._tweak_table == "taser_summers" and self.tase_time < _time then
			if alive(player_unit) then
				if not self._unit:movement():current_state().driving then
					attack_data.attacker_unit:sound():say("post_tasing_taunt")
					--player_unit:movement():on_non_lethal_electrocution() --old titan taser effect.
					--managers.player:set_player_state("tased")
					managers.player:activate_titan_tased() --Apply slow from titan taser.
					attack_data.damage = attack_data.damage * 0
					self.tase_time = _time + 3 --Update cooldown
				end
			end
		end		
	end
	
	return 
end

--This mechanic is disabled to give players predictable armor regen.
function PlayerDamage:_upd_suppression(t, dt)
	--nothing
end

function PlayerDamage:revive(silent)
	if Application:digest_value(self._revives, false) == 0 then
		self._revive_health_multiplier = nil
		return
	end
	local arrested = self:arrested()
	managers.player:set_player_state("standard")
	if not silent then
		PlayerStandard.say_line(self, "s05x_sin")
	end
	self._bleed_out = false
	self._incapacitated = nil
	self._downed_timer = nil
	self._downed_start_time = nil

	--Skip this if player was also downed by a cloaker kick/taser shock.
	if not arrested and not self._keep_health_on_revive then
		if managers.player:has_category_upgrade("player", "health_revive_max") then		
			self:set_health(self:_max_health() * tweak_data.player.damage.REVIVE_HEALTH_STEPS_W_SKILL[self._revive_health_i] * (self._revive_health_multiplier or 1) * managers.player:upgrade_value("player", "revived_health_regain", 1))
		else
			self:set_health(self:_max_health() * tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i] * (self._revive_health_multiplier or 1) * managers.player:upgrade_value("player", "revived_health_regain", 1))
		end
		
		self:set_armor(self:_max_armor())
		self._revive_health_i = math.min(#tweak_data.player.damage.REVIVE_HEALTH_STEPS, self._revive_health_i + 1)
		self._revive_miss = 2
		managers.player:deactivate_db_regen() --End DB health regen because downed.
	end
	self._keep_health_on_revive = false --reset cloaker kick/taser shock flag.
	self:_regenerate_armor()
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	managers.hud:pd_stop_progress()
	self._revive_health_multiplier = nil
	self._listener_holder:call("on_revive")
	if managers.player:has_inactivate_temporary_upgrade("temporary", "revived_damage_resist") then
		managers.player:activate_temporary_upgrade("temporary", "revived_damage_resist")
	end
	if managers.player:has_inactivate_temporary_upgrade("temporary", "increased_movement_speed") then
		managers.player:activate_temporary_upgrade("temporary", "increased_movement_speed")
	end
	if managers.player:has_inactivate_temporary_upgrade("temporary", "swap_weapon_faster") then
		managers.player:activate_temporary_upgrade("temporary", "swap_weapon_faster")
	end
	if managers.player:has_inactivate_temporary_upgrade("temporary", "reload_weapon_faster") then
		managers.player:activate_temporary_upgrade("temporary", "reload_weapon_faster")
	end
	if managers.player:has_category_upgrade("player", "dodge_on_revive") then --Rogue dodge meter bonus on revive.
		self:fill_dodge_meter(3.0, true)
	end

	--Update What Doesn't Kill
	managers.player:set_damage_absorption(
		"down_absorption",
		managers.player:upgrade_value("player", "damage_absorption_low_revives", 0) * self:get_missing_revives()
	)
end

--First Aid Kit healing.
function PlayerDamage:band_aid_health()
	if managers.platform:presence() == "Playing" and (self:arrested() or self:need_revive()) then
		return
	end

	self:change_health(tweak_data.upgrades.values.first_aid_kit.heal_amount * self._healing_reduction)
	self._said_hurt = false
end

--Doctor Bag Healing.
function PlayerDamage:recover_health()
	if managers.platform:presence() == "Playing" and (self:arrested() or self:need_revive()) then
		return
	end

	self:restore_health(tweak_data.upgrades.values.doctor_bag.heal_amount) --Initial % heal.
	managers.player:activate_db_regen() --Start heal over time.
end

--Returns number of lives used up. Is relied on for What Doesn't Kill calcs.
function PlayerDamage:get_missing_revives()
	return self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0) - self:get_revives()
end

function PlayerDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
	attack_data.damage = attack_data.damage * self._deflection --Apply Deflection DR.

	if managers.player:has_category_upgrade("player", "dodge_stacking_heal") and attack_data.damage > 0.0 then --End Rogue health regen.
		self._damage_to_hot_stack = {}
	end
	
	attack_data.damage = attack_data.damage * managers.player:upgrade_value("player", "real_health_damage_reduction", 1)
	self:change_health(-attack_data.damage)
	health_subtracted = health_subtracted - self:get_real_health()
	
	local trigger_skills = table.contains({
		"bullet",
		"explosion",
		"melee",
		"delayed_tick"
	}, attack_data.variant)

	if self:get_real_health() == 0 and trigger_skills then
		self:_chk_cheat_death()
	end
	
	self:_damage_screen()
	self:_check_bleed_out(trigger_skills)
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	managers.statistics:health_subtracted(health_subtracted)
	return health_subtracted
end

function PlayerDamage:clbk_kill_taunt_spring(attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		self._kill_taunt_clbk_id = nil

		attack_data.attacker_unit:sound():say("a02")
	end
end		

function PlayerDamage:clbk_kill_taunt_tase(attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		self._kill_taunt_clbk_id = nil

		attack_data.attacker_unit:sound():say("post_tasing_taunt")
	end
end		

function PlayerDamage:clbk_kill_taunt_common(attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		if not attack_data.attacker_unit:base()._tweak_table then
			return
		end
		self._kill_taunt_clbk_id = nil

		attack_data.attacker_unit:sound():say("i03")
	end
end	

--Make lock picking skill affect arrested time.
function PlayerDamage:on_arrested()
	self._bleed_out = false
	self._arrested_timer = tweak_data.player.damage.ARRESTED_TIME * managers.player:upgrade_value("player", "pick_lock_easy_speed_multiplier", 1)
	self._arrested_paused_counter = 0

	managers.hud:pd_start_timer({time = self._arrested_timer})
	managers.hud:on_arrested()
end

Hooks:PostHook(PlayerDamage, "damage_tase" , "ResTaserTaunts" , function(self, attack_data)
	if cur_state == "tased" then
		if attack_data.attacker_unit:base()._tweak_table == "taser" or attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
		   attack_data.attacker_unit:sound():say("post_tasing_taunt")
		end
	end	
end)

function PlayerDamage:_max_armor()
	local max_armor = self:_raw_max_armor()

	--Stoic deletes armor.
	if managers.player:has_category_upgrade("player", "armor_to_health_conversion") then
		max_armor = 0
	end

	return max_armor
end

function PlayerDamage:_update_regenerate_timer(t, dt)
	local regenerate_timer_tick = dt * (self._regenerate_speed or 1)

	--Smoke grenade armor regen bonus.
	if self._in_smoke_bomb > 0 then
		regenerate_timer_tick = regenerate_timer_tick * tweak_data.upgrades.smoke_screen_armor_regen[1]
	end

	self._regenerate_timer = math.max(self._regenerate_timer - regenerate_timer_tick, 0)

	if self._regenerate_timer <= 0 then
		self:_regenerate_armor()
	end
end

function PlayerDamage:set_dodge_points()
	self._dodge_points = (tweak_data.player.damage.DODGE_INIT 
		+managers.player:body_armor_value("dodge")
		+managers.player:skill_dodge_chance(false, false, false))
		or 0.0
	if self._dodge_points > 0 then
		managers.hud:unhide_dodge_panel(self._dodge_points)
	end
end

function PlayerDamage:get_dodge_points()
	return self._dodge_points
end

--Adds to/Subtracts from dodge meter and updates hud element.
function PlayerDamage:fill_dodge_meter(dodge_added, overfill)
	if self._dodge_points > 0 and not self:is_downed() then
		if overfill or (self._dodge_meter >= 1.5 and dodge_added < 0) then
			self._dodge_meter = math.max(self._dodge_meter + dodge_added, 0.0)
		elseif self._dodge_meter < 1.5 then
			self._dodge_meter = math.max(math.min(self._dodge_meter + dodge_added, 1.5), 0.0)
		end
	elseif self:is_downed() then
		self._dodge_meter = 0.0
	end
end

function PlayerDamage:fill_dodge_meter_yakuza(percent_added)
	self:fill_dodge_meter(percent_added * self._dodge_points * (1 - self:health_ratio()))
end

--Called when players get kicked/tased. Applies damage and sets flag to true.
function PlayerDamage:cloak_or_shock_incap(damage)
	self:change_health(-1.0 * damage * managers.player:upgrade_value("player", "spooc_damage_resist", 1.0) or 0.0)

	if self:get_real_health() == 0 then
		self:change_health(0.1)
	end
	self._keep_health_on_revive = true
end

Hooks:PostHook(PlayerDamage, "update" , "ResDamageInfoUpdate" , function(self, unit, t, dt)
	local pm = managers.player
	self._in_smoke_bomb = 0.0
	for _, smoke_screen in ipairs(pm._smoke_screen_effects or {}) do
		if smoke_screen:is_in_smoke(self._unit) then
			if smoke_screen:mine() then
				self._in_smoke_bomb = 2.0
			else
				self._in_smoke_bomb = 1.0
			end
		end
	end

	--Add passive dodge increases. Start with bot dodge boost.
	local passive_dodge = pm:upgrade_value("team", "crew_add_dodge", 0)

	--Yakuza capstone skill.
	if self:health_ratio() < 0.5 then
		passive_dodge = passive_dodge + (1 - self:health_ratio()) * pm:upgrade_value("player", "dodge_regen_damage_health_ratio_multiplier", 0)
	end

	--Sicario capstone skill.
	if self._in_smoke_bomb == 2.0 then
		passive_dodge = passive_dodge + pm:upgrade_value("player", "sicario_multiplier", 0)
	end

	if self._unit:movement():crouching() then --Burglar capstone skill.
		passive_dodge = passive_dodge + pm:upgrade_value("player", "crouch_dodge_chance", 0)
	elseif self._unit:movement():running() then --Duck and Cover aced.
		passive_dodge = passive_dodge + pm:upgrade_value("player", "run_dodge_chance", 0)
	elseif self._unit:movement():zipline_unit() then
		passive_dodge = passive_dodge + pm:upgrade_value("player", "on_zipline_dodge_chance", 0)
	end

	self:fill_dodge_meter(self._dodge_points * dt * passive_dodge) --Apply passive dodge to meter.

	if self._dodge_meter ~= self._dodge_meter_prev then
		managers.hud:set_dodge_value(math.min(self._dodge_meter, 1.5)) --Update UI element once per frame.
		self._dodge_meter_prev = self._dodge_meter
	end

	--Biker Armor Regen
	if pm:has_category_upgrade("player", "biker_armor_regen") then
		self:tick_biker_armor_regen(dt)
	end
end)

--Deals with resmod's health regen changes.
function PlayerDamage:_upd_health_regen(t, dt)
	if self._health_regen_update_timer then
		self._health_regen_update_timer = self._health_regen_update_timer - dt

		if self._health_regen_update_timer <= 0 then
			self._health_regen_update_timer = nil
		end
	end

	if not self._health_regen_update_timer then
		local max_health = self:_max_health()

		if self:get_real_health() < max_health then
			self:restore_health(managers.player:health_regen() * max_health + managers.player:fixed_health_regen(), true)

			self._health_regen_update_timer = 4
		end
	end

	if #self._damage_to_hot_stack > 0 then
		repeat
			local next_doh = self._damage_to_hot_stack[1]
			local done = not next_doh or TimerManager:game():time() < next_doh.next_tick

			if not done then
				local regen_rate = self._hot_amount

				self:restore_health(regen_rate, true)

				next_doh.ticks_left = next_doh.ticks_left - 1

				if next_doh.ticks_left == 0 then
					table.remove(self._damage_to_hot_stack, 1)
				else
					next_doh.next_tick = next_doh.next_tick + (self._doh_data.tick_time or 1)
				end

				table.sort(self._damage_to_hot_stack, function (x, y)
					return x.next_tick < y.next_tick
				end)
			end
		until done
	end
end


Hooks:PreHook(PlayerDamage, "_check_bleed_out", "ResYakuzaCaptstoneCheck", function(self, can_activate_berserker, ignore_movement_state)
	if self._check_berserker_done then --Deals with swan song shenanigans.
		if self._can_survive_one_hit then
			self._can_survive_one_hit = false
		end
	end
	if self:get_real_health() == 0 and not self._check_berserker_done then --If you would be in bleedout but you dont want to, then don't.
		if self._can_survive_one_hit then
			self:change_health(0.1)
			self._can_survive_one_hit = false
			self:restore_armor(tweak_data.upgrades.values.survive_one_hit_armor[1])
		else
			self._can_survive_one_hit = managers.player:has_category_upgrade("player", "survive_one_hit")
		end
	end
end)

--Starts biker regen when there is missing armor.
Hooks:PostHook(PlayerDamage, "_calc_armor_damage", "ResBikerCooldown", function(self, attack_data)
	if self._biker_armor_regen_t == 0.0 and managers.player:has_category_upgrade("player", "biker_armor_regen") then
		self._biker_armor_regen_t = managers.player:upgrade_value("player", "biker_armor_regen")[2]
	end
end)

function PlayerDamage:tick_biker_armor_regen(amount)
	if self:get_real_armor() == self:_max_armor() then --End biker regen when armor returns.
		self._biker_armor_regen_t = 0.0
		return
	end

	self._biker_armor_regen_t = self._biker_armor_regen_t - amount
	if self._biker_armor_regen_t <= 0.0 then
		self:restore_armor(managers.player:upgrade_value("player", "biker_armor_regen")[1])
		self._biker_armor_regen_t = self._biker_armor_regen_t + managers.player:upgrade_value("player", "biker_armor_regen")[2]
	end
end

--Adds special case for infinite messiah.
function PlayerDamage:consume_messiah_charge()
	if managers.player:has_category_upgrade("player", "infinite_messiah") then
		return true
	elseif self:got_messiah_charges() then
		self._messiah_charges = self._messiah_charges - 1
		return true
	end

	return false
end

--Applies custody penalties to players on spawn in.
function PlayerDamage:exit_custody(down_timer)
	if (Application:editor() or managers.platform:presence() == "Playing") and (self:arrested() or self:need_revive()) then
		self:revive(true)
	end

	self:set_health(self:_max_health())
	self:_send_set_health()
	self:_set_health_effect()

	self._said_hurt = false
	self._revives = Application:digest_value(tweak_data.player.damage.CUSTODY_LIVES, true)
	self._revive_health_i = 1

	managers.environment_controller:set_last_life(false)

	self._down_time = down_timer
	self._messiah_charges = managers.player:upgrade_value("player", "pistol_revive_from_bleed_out", 0)
	managers.player:refill_messiah_charges()

	managers.player:set_damage_absorption(
		"down_absorption",
		managers.player:upgrade_value("player", "damage_absorption_low_revives", 0) * self:get_missing_revives()
	)
	self:_regenerate_armor()
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	SoundDevice:set_rtpc("shield_status", 100)
	SoundDevice:set_rtpc("downed_state_progression", 0)
end