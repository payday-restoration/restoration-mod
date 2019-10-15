if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	function PlayerDamage:init(unit)
		self._lives_init = tweak_data.player.damage.LIVES_INIT
		self._lives_init = managers.modifiers:modify_value("PlayerDamage:GetMaximumLives", self._lives_init)
		self._unit = unit
		self._max_health_reduction = managers.player:upgrade_value("player", "max_health_reduction", 1)
		self._healing_reduction = managers.player:upgrade_value("player", "healing_reduction", 1)
		self._revives = Application:digest_value(0, true)
		self._uppers_elapsed = 0

		self:replenish()

		local player_manager = managers.player
		self._bleed_out_health = Application:digest_value(tweak_data.player.damage.BLEED_OUT_HEALTH_INIT * player_manager:upgrade_value("player", "bleed_out_health_multiplier", 1), true)
		self._god_mode = Global.god_mode
		self._invulnerable = false
		self._mission_damage_blockers = {}
		self._gui = Overlay:newgui()
		self._ws = self._gui:create_screen_workspace()
		self._focus_delay_mul = 1
		self._dmg_interval = tweak_data.player.damage.MIN_DAMAGE_INTERVAL
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

		--Load alternate heal over time tweakdata if player is using Infiltrator.
		if player_manager:has_category_upgrade("player", "melee_to_heal") then
			self._doh_data = tweak_data.upgrades.melee_to_hot_data or {}
			self._hot_amount = managers.player:upgrade_value("player", "heal_over_time", 0)
		elseif player_manager:has_category_upgrade("player", "dodge_to_heal") then
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

		self._dodge_points = 0.0
		self._dodge_meter = 0.0 --Amount of dodge built up as meter. Caps at '150' dodge.
		self._in_smoke_bomb = 0.0 --0 = not in smoke, 1 = inside smoke, 2 = inside own smoke.
		self._can_survive_one_hit = player_manager:has_category_upgrade("player", "survive_one_hit")

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
	end
	PlayerDamage._UPPERS_COOLDOWN = 60
	
	local player_damage_melee = PlayerDamage.damage_melee
	function PlayerDamage:damage_melee(attack_data)
		local player_unit = managers.player:player_unit()
		if attack_data then
			if alive(attack_data.attacker_unit) then
				if tostring(attack_data.attacker_unit:base()._tweak_table) == "summers" or tostring(attack_data.attacker_unit:base()._tweak_table) == "taser_titan" then
					if alive(player_unit) then
						if self._invulnerable or self._mission_damage_blockers.invulnerable or self._god_mode or self:incapacitated() or self._unit:movement():current_state().immortal or self._unit:movement():current_state().driving then
						else
							player_unit:movement():on_non_lethal_electrocution()
							managers.player:set_player_state("tased")
						end
					end
				elseif tostring(attack_data.attacker_unit:base()._tweak_table) == "autumn" then
					if alive(player_unit) then
						if self._invulnerable or self._mission_damage_blockers.invulnerable or self._god_mode or self:incapacitated() or self._unit:movement():current_state().immortal or self._unit:movement():current_state().driving then
						else
							attack_data.attacker_unit:damage():run_sequence_simple("decloak")
							attack_data.attacker_unit:sound():say("i03", true, nil, true)
							managers.player:set_player_state("arrested")
						end
					end				
				end		
			end
		end
		player_damage_melee(self, attack_data)
	end
	
	local orig_dmg_xpl = PlayerDamage.damage_explosion
    function PlayerDamage:damage_explosion(attack_data,...)
        local attacker_unit = attack_data and attack_data.attacker_unit
        if attacker_unit then
            log("RES DEBUG STUFF: attacker team id is [" .. tostring(attacker_unit:movement():team().id) .. "], own team id is [" .. tostring(self._unit:movement():team().id) .. "]")
            if (attacker_unit:movement():team().id == self._unit:movement():team().id) or (self._unit == attacker_unit) then 
                return
            end
        end
        return orig_dmg_xpl(self,attack_data,...)
	end 
	
	--Lets you heal with full HP--
	function PlayerDamage.full_revives(self)
		return Application:digest_value(self._revives, false) >= tweak_data.player.damage.LIVES_INIT + managers.player:upgrade_value("player", "additional_lives", 0)
	end

	local old_player_regenerated = PlayerDamage._regenerated
	function PlayerDamage:_regenerated(no_messiah)
		old_player_regenerated(self, no_messiah)
		if not no_messiah then
			managers.player:refill_messiah_charges()
		end
	end

	local damage_bullet_original = PlayerDamage.damage_bullet
	local _chk_dmg_too_soon_original = PlayerDamage._chk_dmg_too_soon

	function PlayerDamage:damage_bullet(attack_data, ...)
		if not self:_chk_can_take_dmg() then
			restoration.log_shit("SC: Bullet, cant take damage")
			return
		end
		local damage_info = {
			result = {type = "hurt", variant = "bullet"},
			attacker_unit = attack_data.attacker_unit
		}
		local pm = managers.player
		local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
		restoration.log_shit("SC: Bullet, starting damage: " .. attack_data.damage)
		attack_data.damage = attack_data.damage * dmg_mul
		attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
		attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
		local damage_absorption = pm:damage_absorption()
		if damage_absorption > 0 then
			attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
		end
		if managers.enemy:is_enemy(attack_data.attacker_unit) then
			local dicks = tweak_data.character[attack_data.attacker_unit:base()._tweak_table]
			restoration.log_shit("SC DICKS: " .. tostring(dicks.use_factory))
			if dicks.use_factory then
				attack_data.damage = attack_data.damage * 1
			end
		end
		restoration.log_shit("SC: Bullet, ending damage: " .. attack_data.damage)
		if self._god_mode then
			if attack_data.damage > 0 then
				self:_send_damage_drama(attack_data, attack_data.damage)
			end
			self:_call_listeners(damage_info)
			return
		elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
			self:_call_listeners(damage_info)
			restoration.log_shit("SC: Bullet, Invulnerable")
			return
		elseif self:incapacitated() then
			restoration.log_shit("SC: Bullet, Incapacitated")
			return
		elseif self:is_friendly_fire(attack_data.attacker_unit) then
			restoration.log_shit("SC: Bullet, Friendly Fire")
			return
		elseif self:_chk_dmg_too_soon(attack_data.damage) then
			restoration.log_shit("SC: Bullet, Damage is too soon")
			return
		elseif self._unit:movement():current_state().immortal then
			restoration.log_shit("SC: Bullet, I AM IMMORTAL")
			return
		elseif self._revive_miss and math.random() < self._revive_miss then
			restoration.log_shit("SC: Bullet, Whizzing by like shitty bumper stickers")
			self:play_whizby(attack_data.col_ray.position)
			return
		end
		self._last_received_dmg = attack_data.damage
		self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
		self:fill_dodge_meter(self._dodge_points) --Getting attacked fills your dodge meter by your dodge stat.
		if self._dodge_meter >= 1.0 then --Dodge attacks if your meter is at '100'.
			self._unit:sound():play("pickup_fak_skill") --Feel free to replace if you know a better sound.
			if attack_data.damage > 0 then
				self:fill_dodge_meter(-1.0)
				self:_send_damage_drama(attack_data, 0)
				if pm:has_category_upgrade("player", "dodge_to_heal") then --Rogue health regen.
					self:add_damage_to_hot()
				end
			end
			self:_call_listeners(damage_info)
			self:play_whizby(attack_data.col_ray.position)
			self:_hit_direction(attack_data.attacker_unit:position())
			self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
			self._last_received_dmg = 10000.0 --SC pls no 10000 damage units.
			managers.player:send_message(Message.OnPlayerDodge)
			return	
		end

		if attack_data.attacker_unit:base()._tweak_table == "tank" then
			managers.achievment:set_script_data("dodge_this_fail", true)
		end
		if 0 < self:get_real_armor() then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
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
		self:_check_chico_heal(attack_data)

		local armor_reduction_multiplier = 0
		if 0 >= self:get_real_armor() then
			armor_reduction_multiplier = 1
		end
		local health_subtracted = self:_calc_armor_damage(attack_data)
		if attack_data.armor_piercing then
			attack_data.damage = attack_data.damage - health_subtracted
		else
			attack_data.damage = attack_data.damage * armor_reduction_multiplier
		end
		health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
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
		self._last_bullet_damage = attack_data.damage
		local next_allowed_dmg_t_old = self._next_allowed_dmg_t
		
		if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
			self._last_received_dmg = self._last_bullet_damage
		end
		
		local _time = math.floor(TimerManager:game():time())
		self.tase_time = self.tase_time or 0
		local player_unit = managers.player:player_unit()
		if attack_data then
			if alive(attack_data.attacker_unit) then
				if attack_data.attacker_unit:base()._tweak_table == "taser_titan" and self.tase_time < _time or attack_data.attacker_unit:base()._tweak_table == "taser_summers" and self.tase_time < _time then
					if alive(player_unit) then
						if not self._unit:movement():is_taser_attack_allowed() then
						else
							attack_data.attacker_unit:sound():say("post_tasing_taunt")
							player_unit:movement():on_non_lethal_electrocution()
							managers.player:set_player_state("tased")
							attack_data.damage = attack_data.damage * 0
							self.tase_time = _time + 10
						end
					end
				end		
			end
		end		
		
		return 
	end

	function PlayerDamage:_chk_dmg_too_soon(damage, ...)
		return _chk_dmg_too_soon_original(self, self._last_bullet_damage or damage, ...)
	end

	function PlayerDamage:_upd_suppression(t, dt)
		local data = self._supperssion_data
		if not managers.player:has_category_upgrade("player", "suppression_resist") then
			if data.value then
				if t > data.decay_start_t then
					data.value = data.value - dt
					if data.value <= 0 then
						data.value = nil
						data.decay_start_t = nil
						managers.environment_controller:set_suppression_value(0, 0)
					end
				elseif data.value == tweak_data.player.suppression.max_value and self._regenerate_timer then
					self._listener_holder:call("suppression_max")
				end
				if data.value then
					managers.environment_controller:set_suppression_value(self:effective_suppression_ratio(), self:suppression_ratio())
				end
			end
		end
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
		if not arrested then
			if managers.player:has_category_upgrade("player", "health_revive_max") then		
				self:set_health(self:_max_health() * tweak_data.player.damage.REVIVE_HEALTH_STEPS_W_SKILL[self._revive_health_i] * (self._revive_health_multiplier or 1) * managers.player:upgrade_value("player", "revived_health_regain", 1))
			else
				self:set_health(self:_max_health() * tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i] * (self._revive_health_multiplier or 1) * managers.player:upgrade_value("player", "revived_health_regain", 1))
			end		
			
			self:set_armor(self:_max_armor())
			self._revive_health_i = math.min(#tweak_data.player.damage.REVIVE_HEALTH_STEPS, self._revive_health_i + 1)
			--self._down_time = math.max(tweak_data.player.damage.DOWNED_TIME_MIN, self._down_time - tweak_data.player.damage.DOWNED_TIME_DEC)
			self._revive_miss = 2
		end
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
		if managers.player:has_category_upgrade("player", "dodge_on_revive") then
			self:fill_dodge_meter(3.0, true)
		end
		self._can_survive_one_hit = managers.player:has_category_upgrade("player", "survive_one_hit")
	end

	function PlayerDamage:band_aid_health()
		if managers.platform:presence() == "Playing" and (self:arrested() or self:need_revive()) then
			return
		end
		self:change_health(self:_max_health() * self._healing_reduction)
		self._said_hurt = false
		if math.rand(1) < managers.player:upgrade_value("first_aid_kit", "downs_restore_chance", 0) then
			self._revives = Application:digest_value(math.min(self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0), Application:digest_value(self._revives, false) + 1), true)
			self._revive_health_i = math.max(self._revive_health_i - 1, 1)
			managers.environment_controller:set_last_life(1 >= Application:digest_value(self._revives, false))
		end
	end

	function PlayerDamage:_calc_health_damage(attack_data)
		local health_subtracted = 0
		health_subtracted = self:get_real_health()
		
		if managers.player:has_category_upgrade("player", "no_deflection") then		
			--Nothing
		else
			--Deflection--
			if managers.blackmarket:equipped_armor() == "level_7" then
				attack_data.damage = attack_data.damage * 0.85
			elseif managers.blackmarket:equipped_armor() == "level_6" then
				attack_data.damage = attack_data.damage * 0.85
			elseif managers.blackmarket:equipped_armor() == "level_5" then
				attack_data.damage = attack_data.damage * 0.8
			elseif managers.blackmarket:equipped_armor() == "level_4" then
				attack_data.damage = attack_data.damage * 0.85		
			elseif managers.blackmarket:equipped_armor() == "level_3" then
				attack_data.damage = attack_data.damage * 0.9	
			elseif managers.blackmarket:equipped_armor() == "level_2" then
				attack_data.damage = attack_data.damage * 0.95		
			else
				attack_data.damage = attack_data.damage * 1
			end
		end

		if managers.player:has_category_upgrade("player", "dodge_to_heal") and attack_data.damage > 0.0 then --Rogue health regen.
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

	function PlayerDamage:on_arrested()
		self._bleed_out = false
		self._arrested_timer = tweak_data.player.damage.ARRESTED_TIME * managers.player:upgrade_value("player", "pick_lock_easy_speed_multiplier", 1)
		self._arrested_paused_counter = 0

		managers.hud:pd_start_timer({time = self._arrested_timer})
		managers.hud:on_arrested()
	end
	
	function PlayerDamage:damage_tase(attack_data)
	    if self._god_mode then
	    	return
	    end
        
	    local cur_state = self._unit:movement():current_state_name()
        
	    if cur_state ~= "tased" and cur_state ~= "fatal" then
	    	self:on_tased(false)
        
	    	self._tase_data = attack_data
        
	    	managers.player:set_player_state("tased")
        
	    	local damage_info = {
	    		result = {
	    			variant = "tase",
	    			type = "hurt"
	    		}
	    	}
        
	    	self:_call_listeners(damage_info)
        
	    	if attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
	    		attack_data.attacker_unit:sound():say("post_tasing_taunt")
     
	    		if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.its_alive_its_alive.mask then
	    			managers.achievment:award_progress(tweak_data.achievement.its_alive_its_alive.stat)
	    		end
	    	end
	    end
		if cur_state == "tased" then
		    if attack_data.attacker_unit:base()._tweak_table == "taser" or attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
		       attack_data.attacker_unit:sound():say("post_tasing_taunt")
			end
		end	
    end

	function PlayerDamage:_max_armor()
		local max_armor = self:_raw_max_armor()

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
	end

	--Adds to/Subtracts from dodge meter and updates hud element.
	function PlayerDamage:fill_dodge_meter(dodge_added, overfill)
		if self._dodge_points > 0 and not self:is_downed() then
			if overfill or (self._dodge_meter >= 1.5 and dodge_added < 0) then
				self._dodge_meter = math.max(self._dodge_meter + dodge_added, 0.0)
			elseif self._dodge_meter < 1.5 then
				self._dodge_meter = math.max(math.min(self._dodge_meter + dodge_added, 1.5), 0.0)
			end
			managers.hud:set_dodge_value(math.min(self._dodge_meter, 1.5), self._dodge_points) --Goes through Hudmanager.lua then HUDtemp.lua.
		end
	end

	function PlayerDamage:fill_dodge_meter_yakuza(percent_added)
		self:fill_dodge_meter(percent_added * self._dodge_points * (1 - self:health_ratio()))
	end

	Hooks:PostHook(PlayerDamage, "update" , "ResDodgeMeterMovementUpdate" , function(self, unit, t, dt)
		self._in_smoke_bomb = 0.0
		for _, smoke_screen in ipairs(managers.player._smoke_screen_effects or {}) do
			if smoke_screen:is_in_smoke(self._unit) then
				if smoke_screen:mine() then
					self._in_smoke_bomb = 2.0
				else
					self._in_smoke_bomb = 1.0
				end
			end
		end

		--Add passive dodge increases.
		local passive_dodge = 0.0

		--Yakuza capstone skill.
		if self:health_ratio() < 0.5 then
			passive_dodge = passive_dodge + (1 - self:health_ratio()) * managers.player:upgrade_value("player", "dodge_regen_damage_health_ratio_multiplier", 0)
		end

		--Sicario capstone skill.
		if self._in_smoke_bomb == 2.0 then
			passive_dodge = passive_dodge + managers.player:upgrade_value("player", "sicario_multiplier", 0)
		end

		--Burglar capstone skill.
		if self._unit:movement():crouching() then
			passive_dodge = passive_dodge + managers.player:upgrade_value("player", "crouch_dodge_chance", 0)
		end

		--Duck and Cover aced.
		if self._unit:movement():running() then
			passive_dodge = passive_dodge + managers.player:upgrade_value("player", "run_dodge_chance", 0)
		elseif self._unit:movement():zipline_unit() then
			passive_dodge = passive_dodge + managers.player:upgrade_value("player", "on_zipline_dodge_chance", 0)
		end

		self:fill_dodge_meter(self._dodge_points * dt * passive_dodge)
	end)

	Hooks:PostHook(PlayerDamage, "on_downed" , "ResDodgeMeterOnDown" , function(self)
		self:fill_dodge_meter(-self._dodge_meter)
	end)

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
				self:restore_health(managers.player:health_regen(), false)
				self:restore_health(managers.player:fixed_health_regen(self:health_ratio()), true)

				self._health_regen_update_timer = 5
			end
		end

		if #self._damage_to_hot_stack > 0 then
			repeat
				local next_doh = self._damage_to_hot_stack[1]
				local done = not next_doh or TimerManager:game():time() < next_doh.next_tick

				if not done then
					local regen_rate = self._hot_amount --All this for a single line change so stacking health regen isn't coupled to grinder. :)

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
		if self:get_real_health() == 0 and not self._check_berserker_done then
			if self._can_survive_one_hit then
				self:change_health(0.1)
				self._can_survive_one_hit = false
				self:restore_armor(tweak_data.upgrades.values.survive_one_hit_armor[1])
			end
		end
	end)
end