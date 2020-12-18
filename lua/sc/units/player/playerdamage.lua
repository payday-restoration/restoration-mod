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

	--Unique resmod stuff, needs to be declared earlier.
	self._temp_health = 0 --Hitman temporary health.
	self._health_without_temp = 0 --Health below temp hp. Needed for correct max health calculations.
	self._next_temp_health_decay_t = 0 --When to hit hitman temp health with decay next.

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
	--change grace period in cs
	self._dmg_interval = managers.modifiers:modify_value("PlayerDamage:CheckingGrace", self._dmg_interval)

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
		self._hot_type = "infiltrator"
		self._doh_data = tweak_data.upgrades.melee_to_hot_data or {}
		self._hot_amount = managers.player:upgrade_value("player", "heal_over_time", 0)
	elseif player_manager:has_category_upgrade("player", "dodge_stacking_heal") then
		self._hot_type = "rogue"
		self._doh_data = tweak_data.upgrades.dodge_to_hot_data or {}
		self._hot_amount = managers.player:upgrade_value("player", "heal_over_time", 0)
	else 
		self._hot_type = "grinder"
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
	self._deflection = 1 - player_manager:body_armor_value("deflection", nil, 0) - player_manager:get_deflection_from_skills() --Damage reduction for health. Crashes here mean there is a syntax error in playermanager.
	self._unpierceable = player_manager:has_category_upgrade("player", "unpierceable_armor")
	managers.player:set_damage_absorption("absorption_addend", managers.player:upgrade_value("player", "damage_absorption_addend", 0))
	managers.player:set_damage_absorption("full_armor_absorption", managers.player:upgrade_value("player", "armor_full_damage_absorb", 0) * self:_max_armor())

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

	if player_manager:has_category_upgrade("player", "revive_damage_reduction") and player_manager:has_category_upgrade("player", "revive_damage_reduction") then

		local function on_revive_interaction_start()
			managers.player:set_property("revive_damage_reduction", player_manager:upgrade_value("player", "revive_damage_reduction"), 1)
			managers.hud:remove_skill("revive_damage_reduction")
			managers.hud:add_skill("revive_damage_reduction")
		end

		local function on_exit_interaction()
			managers.player:remove_property("revive_damage_reduction")
			if not managers.player:has_activate_temporary_upgrade("temporary", "revive_damage_reduction") then
				managers.hud:remove_skill("revive_damage_reduction")
			end
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

function PlayerDamage:is_friendly_fire(unit)
	if not unit then
		return false
	end

	if unit:movement():team() ~= self._unit:movement():team() and unit:movement():friendly_fire() then
		return false
	end

	local friendly_fire = nil

	if Global.game_settings and Global.game_settings.one_down and unit:base() and unit:base().is_husk_player then
		friendly_fire = false
	else
		friendly_fire = not unit:movement():team().foes[self._unit:movement():team().id]
		friendly_fire = managers.mutators:modify_value("PlayerDamage:FriendlyFire", friendly_fire)
		friendly_fire = managers.modifiers:modify_value("PlayerDamage:FriendlyFire", friendly_fire)
	end

	return friendly_fire
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

--Now has damage_bullet integrated into it with melee specific changes.
function PlayerDamage:damage_melee(attack_data)
	local attacker_char_tweak = tweak_data.character[attack_data.attacker_unit:base()._tweak_table]
	local damage_info = {
		result = {type = "hurt", variant = "melee"},
		attacker_unit = attack_data.attacker_unit
	}
	
	self._attacker_char_tweak = attacker_char_tweak
	
	local pm = managers.player

	if not self:can_take_damage(attack_data, damage_info) or not self:_chk_can_take_dmg() then
		return
	end

	if self._unit:movement():current_state().in_melee and self._unit:movement():current_state():in_melee() and not tweak_data.blackmarket.melee_weapons[managers.blackmarket:equipped_melee_weapon()].chainsaw then
		if attack_data.attacker_unit and alive(attack_data.attacker_unit) and attack_data.attacker_unit:base() and not attack_data.attacker_unit:base().is_husk_player then
			local is_dozer = attack_data.attacker_unit:base().has_tag and attack_data.attacker_unit:base():has_tag("tank")

			--prevent the player from countering Dozers or other players through FF, for obvious reasons
			if not is_dozer then
				self._unit:movement():current_state():discharge_melee()

				return "countered"
			end
		end
	end
	
	--Unit specific shenanigans.
	local _time = math.floor(TimerManager:game():time())
	local player_unit = managers.player:player_unit()
	if alive(attack_data.attacker_unit) and not self._unit:movement():current_state().driving then
		--Titan Taser tase.
		if alive(player_unit) and self._attacker_char_tweak.tase_on_melee then
			attack_data.attacker_unit:sound():say("post_tasing_taunt")
			attack_data.variant = "taser_tased" --they give you an actual tase on a melee attack.
		elseif alive(player_unit) and self._attacker_char_tweak.cuff_on_melee then
			if attack_data.attacker_unit:base()._tweak_table == "autumn" then
				attack_data.attacker_unit:sound():say("i03", true, nil, true)
			end
			pm:set_player_state("arrested")
		end
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

	--These are done after god mode checks now, just to save time.
	--Also done before DR calcs, so that DR going away never causes grace piercing.
	self._last_received_dmg = attack_data.damage
	self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)

	self._last_bullet_damage = attack_data.damage
	local next_allowed_dmg_t_old = self._next_allowed_dmg_t
	
	if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
		self._last_received_dmg = self._last_bullet_damage
	end

	if attack_data.damage > 0 then
		attack_data.damage = attack_data.damage * pm:damage_reduction_skill_multiplier("melee")
		attack_data.damage = pm:modify_value("damage_taken", attack_data.damage, attack_data)
		local damage_absorption = pm:damage_absorption()
		if damage_absorption > 0 then
			attack_data.damage = math.max(0.1, attack_data.damage - damage_absorption)
		end
	end

	
	--Can't dodge melee.

	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end

	if 0 < self:get_real_armor() then
		self._unit:sound():play("melee_hit_body", nil, nil)
	else
		self._unit:sound():play("player_hit_permadamage")
	end
	
	local shake_armor_multiplier = pm:body_armor_value("damage_shake") * pm:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + pm:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier
	
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
	attack_data.damage = attack_data.damage * armor_reduction_multiplier	
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)

	--Unique kill taunt stuff.
	if alive(attack_data.attacker_unit) then
		if not self._bleed_out and health_subtracted > 0 then
			self:_send_damage_drama(attack_data, health_subtracted)
		elseif self._bleed_out then
			if attack_data.attacker_unit:base()._tweak_table == "tank" then
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)
			elseif attack_data.attacker_unit:base()._tweak_table == "spring" then
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_spring", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
			elseif attack_data.attacker_unit:base()._tweak_table == "taser" then
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
			elseif attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
			else
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_common", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)			
			end
			self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		end
	end
	
	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)

	local vars = {
		"melee_hit",
		"melee_hit_var2"
	}

	--Apply changes to melee push camera effect, cap effects of it so even players with insane armor can tell they were meleed.
	self._unit:camera():play_shaker(vars[math.random(#vars)], math.max(1 * self._melee_push_multiplier, 0.2))

	local tase_player = attack_data.variant == "taser_tased"

	if tase_player then
		if pm:current_state() == "standard" or pm:current_state() == "carry" or pm:current_state() == "bipod" then
			if pm:current_state() == "bipod" then
				self._unit:movement()._current_state:exit(nil, "tased")
			end

			self._unit:movement():on_non_lethal_electrocution()
			pm:set_player_state("tased")
		end
	elseif pm:current_state() == "bipod" then
		self._unit:movement()._current_state:exit(nil, "standard")
		pm:set_player_state("standard")
	end

	--Apply changes to melee push, this *can* be reduced to 0. Also don't allow players in bleedout to be pushed.
	if not self._bleed_out then
		mvector3.multiply(attack_data.push_vel, self._melee_push_multiplier)
		self._unit:movement():push(attack_data.push_vel)
	end

	return
end

function PlayerDamage:damage_explosion(attack_data)
	if not self:_chk_can_take_dmg() or self:incapacitated() then
		return
	end

	local attack_pos = attack_data.position or attack_data.col_ray.position or attack_data.attacker_unit and alive(attack_data.attacker_unit) and attack_data.attacker_unit:position()
	local distance = mvector3.distance(attack_pos, self._unit:position())

	if not attack_data.range then
		attack_data.range = distance
	end

	if attack_data.range < distance then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	end

	local damage_info = {
		result = {
			variant = "explosion",
			type = "hurt"
		}
	}

	if self._god_mode or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self._unit:movement():current_state().immortal then
		return
	end

	local pm = managers.player
	local damage = attack_data.damage or 1
	attack_data.damage = damage
	attack_data.damage = attack_data.damage * (1 - distance / attack_data.range)

	if attack_data.damage > 0 then
		attack_data.damage = pm:modify_value("damage_taken", attack_data.damage, attack_data)
		attack_data.damage = managers.modifiers:modify_value("PlayerDamage:OnTakeExplosionDamage", attack_data.damage)
		attack_data.damage = attack_data.damage * pm:damage_reduction_skill_multiplier("explosion")
		local damage_absorption = pm:damage_absorption()
		if damage_absorption > 0 then
			attack_data.damage = math.max(0.1, attack_data.damage - damage_absorption)
		end
	end


	if attack_data.attacker_unit and alive(attack_data.attacker_unit) then
		self:_hit_direction(attack_data.attacker_unit:position())
	end

	if self._bleed_out then
		if attack_data.damage == 0 then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
		end

		self:_bleed_out_damage(attack_data)

		return
	else
		if self:get_real_armor() > 0 or attack_data.damage == 0 then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
		end

		--explosion pushing, re-enable if you want
		--[[if attack_data.damage ~= 0 then
			local push_vec = self._unit:movement():m_head_pos() - attack_pos
			mvector3.normalize(push_vec)

			local final_damage = attack_data.damage
			local max_damage = 40
			local dmg_lerp_value = math.clamp(final_damage, 1, max_damage) / max_damage
			local push_force = math.lerp(300, 3000, dmg_lerp_value)

			self._unit:movement():push(push_vec * push_force)
		end]]
	end

	self:_check_chico_heal(attack_data)

	local armor_reduction_multiplier = 0
	
	if 0 >= self:get_real_armor() then
		armor_reduction_multiplier = 1
	end
	
	local health_subtracted = self:_calc_armor_damage(attack_data)
	
	if not self._unpierceable then
		attack_data.damage = attack_data.damage - health_subtracted
		if not _G.IS_VR then --Add screen effect to signify armor piercing attack.
			managers.hud:activate_effect_screen(0.75, {1, 0.2, 0})
		end
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end
	
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)

	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
end

function PlayerDamage:damage_fire(attack_data)
	if not self:_chk_can_take_dmg() or self:incapacitated() then
		return
	end

	local attack_pos = attack_data.position or attack_data.col_ray.position or attack_data.attacker_unit and alive(attack_data.attacker_unit) and attack_data.attacker_unit:position()
	local distance = mvector3.distance(attack_pos, self._unit:position())

	if not attack_data.range then
		attack_data.range = distance
	end

	if attack_data.range < distance then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	end

	local damage_info = {
		result = {
			variant = "fire",
			type = "hurt"
		}
	}

	local damage = attack_data.damage or 1
	attack_data.damage = damage

	if self._god_mode or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self._unit:movement():current_state().immortal then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end

	if attack_data.attacker_unit and alive(attack_data.attacker_unit) then
		self:_hit_direction(attack_data.attacker_unit:position())
	end

	local pm = managers.player

	self._last_received_dmg = attack_data.damage
	self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)

	if attack_data.damage > 0 then
		attack_data.damage = attack_data.damage * pm:damage_reduction_skill_multiplier("fire")
		attack_data.damage = pm:modify_value("damage_taken", attack_data.damage, attack_data)
		local damage_absorption = pm:damage_absorption()
		if damage_absorption > 0 then
			attack_data.damage = math.max(0.1, attack_data.damage - damage_absorption)
		end
	end

	if self._bleed_out then
		if attack_data.damage == 0 then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
		end

		self:_bleed_out_damage(attack_data)

		return
	else
		if self:get_real_armor() > 0 or attack_data.damage == 0 then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
		end
	end

	self:_check_chico_heal(attack_data)

	local armor_reduction_multiplier = 0

	if self:get_real_armor() <= 0 then
		armor_reduction_multiplier = 1
	end

	local health_subtracted = self:_calc_armor_damage(attack_data)

	attack_data.damage = attack_data.damage * armor_reduction_multiplier
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)

	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
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

	if attack_data.damage > 0 then
		attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
		attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage, attack_data.attacker_unit:base()._tweak_table)
		attack_data.damage = attack_data.damage * pm:damage_reduction_skill_multiplier("bullet")
		attack_data.damage = pm:modify_value("damage_taken", attack_data.damage, attack_data)
		local damage_absorption = pm:damage_absorption()
		if damage_absorption > 0 then
			attack_data.damage = math.max(0.1, attack_data.damage - damage_absorption)
		end
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
	
	if attack_data.armor_piercing and not self._unpierceable then
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

	local hit_pos = mvector3.copy(self._unit:movement():m_com())
    local attack_dir = nil
    local attacker_unit = attack_data.attacker_unit

    if attacker_unit then
        attack_dir = hit_pos - attacker_unit:position()
        mvector3.normalize(attack_dir)
    else
        attack_dir = self._unit:rotation():y()
    end

    managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	
	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
	
	--Attacks with slow debuffs.
	if alive(attack_data.attacker_unit) and tweak_data.character[attack_data.attacker_unit:base()._tweak_table] and tweak_data.character[attack_data.attacker_unit:base()._tweak_table].slowing_bullets and alive(self._unit) and not self._unit:movement():current_state().driving then
		local slow_data = tweak_data.character[attack_data.attacker_unit:base()._tweak_table].slowing_bullets
		if slow_data.taunt then
			attack_data.attacker_unit:sound():say("post_tasing_taunt")
		end
		managers.player:apply_slow_debuff(slow_data.duration, slow_data.power) --Apply slow from titan taser.
	end
	
	return 
end

--Ignore deflection, just like it should for all other forms of DR.
function PlayerDamage:damage_killzone(attack_data)
	local damage_info = {
		result = {
			variant = "killzone",
			type = "hurt"
		}
	}

	if self._god_mode or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self._unit:movement():current_state().immortal then
		return
	end
	self._unit:sound():play("player_hit")

	if attack_data.instant_death then
		self:set_armor(0)
		self:set_health(0)
		self:_send_set_armor()
		self:_send_set_health()
		managers.hud:set_player_health({
			current = self:get_real_health(),
			total = self:_max_health(),
			revives = Application:digest_value(self._revives, false)
		})
		self:_set_health_effect()
		self:_damage_screen()
		self:_check_bleed_out(nil)
	else
		self:_hit_direction(attack_data.col_ray.origin)

		if self._bleed_out then
			return
		end

		attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data)

		self:_check_chico_heal(attack_data)


		local armor_reduction_multiplier = 0
		if self:get_real_armor() <= 0 then
			armor_reduction_multiplier = 1
		end

		local health_subtracted = self:_calc_armor_damage(attack_data)
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
		--Ignore deflection.
		health_subtracted = health_subtracted + self:_calc_health_damage_no_deflection(attack_data)
	end

	self:_call_listeners(damage_info)
end

--Include deflection in calcs. Doesn't work in cases where armor is pierced, but I can't be assed to fix it.
--Also ignores temp hp in max health calcs. Not important for now, but may be in the future.
function PlayerDamage:_check_chico_heal(attack_data)
	if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") then
		local dmg_to_hp_ratio = managers.player:temporary_upgrade_value("temporary", "chico_injector", 0)

		if managers.player:has_category_upgrade("player", "chico_injector_low_health_multiplier") then
			local upg_values = managers.player:upgrade_value("player", "chico_injector_low_health_multiplier")

			if self:health_ratio() < upg_values[1] then
				dmg_to_hp_ratio = dmg_to_hp_ratio + upg_values[2]
			end
		end

		local health_received = attack_data.damage * dmg_to_hp_ratio

		if self._armor_broken then
			health_received = health_received * self._deflection
		end

		if managers.player:has_category_upgrade("player", "chico_injector_health_to_speed") and self:_max_health_orig() < self:get_real_health() + health_received then
			self._injector_overflow = self._injector_overflow or 0
			local diff = self:_max_health_orig() - self:get_real_health()

			self:restore_health(diff, true)

			health_received = health_received - diff
			self._injector_overflow = self._injector_overflow + health_received
			local upg_values = managers.player:upgrade_value("player", "chico_injector_health_to_speed")
			local times = math.floor(self._injector_overflow / upg_values[1])

			managers.player:speed_up_grenade_cooldown(upg_values[2] * times)

			self._injector_overflow = self._injector_overflow - upg_values[1] * times
		else
			self:restore_health(health_received, true)
		end
	end
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
		self:set_health(self:_max_health() * (tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i] + managers.player:upgrade_value("player", "extra_revive_health", 0)) * (self._revive_health_multiplier or 1) * managers.player:upgrade_value("player", "revived_health_regain", 1))
		
		self:set_armor(self:_max_armor())
		self._revive_health_i = math.min(#tweak_data.player.damage.REVIVE_HEALTH_STEPS, self._revive_health_i + 1)
		self._revive_miss = 2
	end
	self._keep_health_on_revive = false --reset cloaker kick/taser shock flag.
	self:_regenerate_armor()
	local revive_temp_health = managers.player:upgrade_value("player", "revive_temp_health", 0) * self._max_health_reduction
	self:_change_temp_health(revive_temp_health)
	local max_health = self:_max_health()
	self._health = Application:digest_value(math.clamp(self._health_without_temp + self._temp_health, 0, max_health), true)
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
	if managers.player:has_category_upgrade("player", "dodge_on_revive") then --Rogue dodge meter bonus on revive.
		self:fill_dodge_meter(3.0, true)
	end
	if managers.player:has_category_upgrade("player", "revive_reload") then
		managers.player:reload_weapons()
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

function PlayerDamage:_calc_health_damage_no_deflection(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
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

function PlayerDamage:_calc_health_damage(attack_data)
	local deflection = self._deflection
	if self:has_temp_health() then --Hitman deflection bonus.
		deflection = deflection - managers.player:upgrade_value("player", "temp_health_deflection", 0)
	end

	attack_data.damage = attack_data.damage * deflection --Apply Deflection DR.

	return self:_calc_health_damage_no_deflection(attack_data)
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

--Init function for dodge points to cache the value.
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
	if self._dodge_points and self._dodge_points > 0 and not self:is_downed() then
		if overfill or (self._dodge_meter >= 1.5 and dodge_added < 0) then
			self._dodge_meter = math.max(self._dodge_meter + dodge_added, 0.0)
		elseif self._dodge_meter < 1.5 then
			self._dodge_meter = math.max(math.min(self._dodge_meter + dodge_added, 1.5), 0.0)
		end
	elseif self:is_downed() then
		self._dodge_meter = 0.0
	end
end

--Adjusts dodge meter fill based on health ratio, used for Yakuza stuff.
function PlayerDamage:fill_dodge_meter_yakuza(percent_added)
	self:fill_dodge_meter(percent_added * self._dodge_points * (1 - self:health_ratio()))
end

--Called when players get kicked/tased. Applies damage and sets flag to true.
function PlayerDamage:cloak_or_shock_incap(damage)
	damage = damage * managers.player:damage_reduction_skill_multiplier("kick_or_shock")
	local damage_absorption = managers.player:damage_absorption()
	if damage_absorption > 0 then
		damage = math.max(0.1, damage - damage_absorption)
	end
	
	local deflection = self._deflection
	if self:has_temp_health() then --Hitman deflection bonus.
		deflection = deflection - managers.player:upgrade_value("player", "temp_health_deflection", 0)
	end

	self:change_health(-1.0 * deflection * damage or 0.0)

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

	--Hitman temporary hp drain over time.
	if self:has_temp_health() and self._next_temp_health_decay_t < t then
		self._next_temp_health_decay_t = t + 1
		self:change_health(-math.min(tweak_data.upgrades.temp_health_decay, self._temp_health))
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
		local base_max_health = self:_max_health_orig() --Stops temp health from increasing % regen. 
		local real_max_health = self:_max_health_orig() + self._temp_health
		if self:get_real_health() < real_max_health then
			--No need to do health nonsense twice.
			self:restore_health(managers.player:health_regen() * base_max_health + managers.player:fixed_health_regen(), true)
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

	managers.hud:set_stacks(self._hot_type, #self._damage_to_hot_stack)
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

--Starts biker regen when there is missing armor. Also notifies ex-pres when armor has broken to get around dumb interaction with bullseye.
Hooks:PostHook(PlayerDamage, "_calc_armor_damage", "ResBikerCooldown", function(self, attack_data)
	if self._biker_armor_regen_t == 0.0 and managers.player:has_category_upgrade("player", "biker_armor_regen") then
		self._biker_armor_regen_t = managers.player:upgrade_value("player", "biker_armor_regen")[2]
	end

	if self:get_real_armor() == 0 then
		self._armor_broken = true
	end
end)

--Whether the player can proc Sneaky Bastard.
function PlayerDamage:can_dodge_heal()
	if self._can_dodge_heal then
		self._can_dodge_heal = nil
		return true
	end

	return nil
end

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
	self._revives = Application:digest_value(tweak_data.player.damage.CUSTODY_LIVES, true)
	self._down_time = down_timer
	self._messiah_charges = managers.player:upgrade_value("player", "pistol_revive_from_bleed_out", 0)
	managers.player:refill_messiah_charges()

	managers.player:set_damage_absorption(
		"down_absorption",
		managers.player:upgrade_value("player", "damage_absorption_low_revives", 0) * self:get_missing_revives()
	)
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
end

--Restores one life. Used by Enduring.
function PlayerDamage:add_revive()
	self._revives = Application:digest_value(math.min(self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0), Application:digest_value(self._revives, false) + 1), true)
	self._revive_health_i = math.max(self._revive_health_i - 1, 1)
	managers.environment_controller:set_last_life(Application:digest_value(self._revives, false) <= 1)
	managers.player:set_damage_absorption(
		"down_absorption",
		managers.player:upgrade_value("player", "damage_absorption_low_revives", 0) * self:get_missing_revives()
	)
end

--Make Ex-Pres only consume stored health that actually goes to healing.
function PlayerDamage:consume_armor_stored_health(amount)
	if self._armor_stored_health and not self._dead and not self._bleed_out and not self._check_berserker_done then
		local old_health = self:get_real_health()
		self:change_health(self._armor_stored_health)
		local new_health = self:get_real_health()
		self._armor_stored_health = self._armor_stored_health - (new_health - old_health)
	end

	self:update_armor_stored_health()
end

--Lets hitman piggy bank off of ex-pres UI elements.
local max_armor_stored_health_orig = PlayerDamage.max_armor_stored_health
function PlayerDamage:max_armor_stored_health()
	if managers.player:has_category_upgrade("player", "store_temp_health") then
		return managers.player:upgrade_value("player", "store_temp_health")[1]
	else
		return max_armor_stored_health_orig(self)
	end
end

--Turns stored health from hitman into temporary health.
function PlayerDamage:consume_temp_stored_health()
	if self._armor_stored_health and not self._dead and not self._bleed_out and not self._check_berserker_done then
		self._next_temp_health_decay_t = Application:time() + 1
		self._armor_stored_health = math.min(self._armor_stored_health * self._max_health_reduction + self._temp_health, tweak_data.upgrades.temp_health_max * self._max_health_reduction) - self._temp_health
		self._health_without_temp = self:get_real_health() - self._temp_health
		self:_change_temp_health(self._armor_stored_health)
		local max_health = self:_max_health()
		self._health = Application:digest_value(math.clamp(self._health_without_temp + self._temp_health, 0, max_health), true)
		self:_send_set_health()
		self:_set_health_effect()
		managers.hud:set_player_health({
			current = self:get_real_health(),
			total = self:_max_health(),
			revives = Application:digest_value(self._revives, false)
		})
		self:clear_armor_stored_health()
	end
end

--Generic function for changing the amount of health to be treated as temp health.
function PlayerDamage:_change_temp_health(amount)
	self._temp_health = math.max(self._temp_health + amount, 0)
	self:_check_update_max_health()
	managers.hud:set_teammate_delayed_damage(HUDManager.PLAYER_PANEL, self._temp_health)
end

--Returns whether or not the player has temporary health.
function PlayerDamage:has_temp_health()
	return self._temp_health > 0
end

--Changes to the core health system are moslty done to support temp health.
--Original method for getting max health. Is overwritten to support temp health, but certain cases (mostly involving healing) require the old code.
function PlayerDamage:_max_health_orig()
	local max_health = self:_raw_max_health()

	if managers.player:has_category_upgrade("player", "armor_to_health_conversion") then
		local max_armor = self:_raw_max_armor()
		local conversion_factor = managers.player:upgrade_value("player", "armor_to_health_conversion") * 0.01
		max_health = max_health + max_armor * conversion_factor
	end

	return max_health
end

--Makes modifications to handle temporary HP properly.
function PlayerDamage:set_health(health)
	self:_check_update_max_health()

	local prev_health = self._health and Application:digest_value(self._health, false) or health

	--Add temp hp to max health.
	local max_health = self:_max_health_orig() * self._max_health_reduction + self._temp_health
	health = math.clamp(health, 0, max_health) --Removed useless floor before clamp.

	if health < prev_health and self._temp_health > 0 then --Reduce temp health if health was reduced.
		self:_change_temp_health(health - prev_health)
	end

	self._health_without_temp = health - self._temp_health --Keep this updated to ensure that _max_health() remains accurate.
	self._health = Application:digest_value(health, true)

	self:_send_set_health()
	self:_set_health_effect()

	if self._said_hurt and self:get_real_health() / self:_max_health() > 0.2 then
		self._said_hurt = false
	end

	if self:health_ratio() < 0.3 then
		self._heartbeat_start_t = TimerManager:game():time()
		self._heartbeat_t = self._heartbeat_start_t + tweak_data.vr.heartbeat_time
	end

	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})

	return prev_health ~= Application:digest_value(self._health, false)
end

--Use old max health function to ignore temporary HP for % healing.
function PlayerDamage:restore_health(health_restored, is_static, chk_health_ratio)
	if chk_health_ratio and managers.player:is_damage_health_ratio_active(self:health_ratio()) and not self:is_downed() then
		return false
	end

	if is_static then
		return self:change_health(health_restored * self._healing_reduction)
	else
		local max_health = self:_max_health_orig() --Just use the original function.

		return self:change_health(max_health * health_restored * self._healing_reduction)
	end
end

--Hack to let temp hp go above normal hp, mostly important for displaying properly in the HUD.
function PlayerDamage:_max_health()
	return math.max(self:_max_health_orig(), self._temp_health + self._health_without_temp) 
end

--New trigger for ex-pres. Now occurs when armor regen kicks in any time after armor has been broken. Ignores partial regen from stuff like Bullseye.
--Also includes trigger for Hitman dodge regen bonus.
Hooks:PreHook(PlayerDamage, "_regenerate_armor", "ResTriggerExPres", function(self, no_sound)
	if self._armor_broken then
		if managers.player:has_category_upgrade("player", "armor_health_store_amount") then
			self:consume_armor_stored_health()
		end
		self._armor_broken = nil
	end
	self:fill_dodge_meter(managers.player:upgrade_value("player", "armor_regen_dodge", 0) * (self._dodge_points or 0))
end)

--Remove old ex-pres stuff.
function PlayerDamage:set_armor(armor)
	self:_check_update_max_armor()

	armor = math.clamp(armor, 0, self:_max_armor())

	if self._armor then
		local current_armor = self:get_real_armor()

		if current_armor ~= 0 and armor == 0 then
			self._can_dodge_heal = true
		end

		if armor == self:_max_armor() then
			managers.player:set_damage_absorption(
				"full_armor_absorption",
				managers.player:upgrade_value("player", "armor_full_damage_absorb", 0) * self:_max_armor()
			)
		else
			managers.player:set_damage_absorption(
				"full_armor_absorption",
				0
			)
		end

		if current_armor ~= 0 and armor == 0 and self._dire_need then
			local function clbk()
				return self:is_regenerating_armor()
			end

			managers.player:add_coroutine(PlayerAction.DireNeed, PlayerAction.DireNeed, clbk, managers.player:upgrade_value("player", "armor_depleted_stagger_shot", 0))
		end
	end

	self._armor = Application:digest_value(armor, true)
end

--For people like SC that enjoy being blinded when taking damage
if restoration and restoration.Options:GetValue("OTHER/RestoreHitFlash") then
	local _hit_direction_actual = PlayerDamage._hit_direction
	function PlayerDamage:_hit_direction(position_vector, ...)
		if position_vector then
			local dir = (self._unit:camera():position() - position_vector):normalized()
			local infront = math.dot(self._unit:camera():forward(), dir)
			if infront < -0.9 then
				managers.environment_controller:hit_feedback_front()
			elseif infront > 0.9 then
				managers.environment_controller:hit_feedback_back()
			else
				local polar = self._unit:camera():forward():to_polar_with_reference(-dir, Vector3(0, 0, 1))
				local direction = Vector3(polar.spin, polar.pitch, 0):normalized()
				if math.abs(direction.x) > math.abs(direction.y) then
					if 0 > direction.x then
						managers.environment_controller:hit_feedback_left()
					else
						managers.environment_controller:hit_feedback_right()
					end
				elseif 0 > direction.y then
					managers.environment_controller:hit_feedback_up()
				else
					managers.environment_controller:hit_feedback_down()
				end
			end
		end
		return _hit_direction_actual(self, position_vector, ...)
	end
end