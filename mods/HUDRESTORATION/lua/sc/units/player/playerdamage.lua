if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local player_damage_melee = PlayerDamage.damage_melee
function PlayerDamage:damage_melee(attack_data)
	if attack_data then
		if alive(attack_data.attacker_unit) then
			if tostring(attack_data.attacker_unit:base()._tweak_table) == "summers" then
				managers.player:set_player_state("tased")
			end
		end
	end
	player_damage_melee(self, attack_data)
end

--Only consume Ex-President health if you lost health. Rokk wuz here.
function PlayerDamage:set_armor(armor)   
	if self._armor and self:get_real_armor() == 0 and armor ~= 0 and self:health_ratio() < 1 then
		self:consume_armor_stored_health()
	end
	self._armor = Application:digest_value(math.clamp(armor, 0, self:_max_armor()), true)
end

--Lets you heal with full HP--
function PlayerDamage.full_revives(self)
	return Application:digest_value(self._revives, false) >= tweak_data.player.damage.LIVES_INIT + managers.player:upgrade_value("player", "additional_lives", 0)
end

local old_player_regenerated = PlayerDamage._regenerated
function PlayerDamage:_regenerated(no_messiah)
	old_player_regenerated(self, no_messiah)
	if not no_messiah then
		--Nice function name DMC--
		managers.player:fadjfbasjhas()
	end
end

local damage_bullet_original = PlayerDamage.damage_bullet
local _chk_dmg_too_soon_original = PlayerDamage._chk_dmg_too_soon

function PlayerDamage:damage_bullet(attack_data, ...)
	if not self:_chk_can_take_dmg() then
		RestorationCore.log_shit("SC: Bullet, cant take damage")
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	local pm = managers.player
	local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
	RestorationCore.log_shit("SC: Bullet, starting damage: " .. attack_data.damage)
	attack_data.damage = attack_data.damage * dmg_mul
	attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
	attack_data.damage = managers.crime_spree:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
	local damage_absorption = pm:get_best_cocaine_damage_absorption()
	if damage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
	end
	local hostage_absorption = pm:damage_absorption()
	if hostage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - hostage_absorption)
	end
	if managers.enemy:is_enemy(attack_data.attacker_unit) then
		local dicks = tweak_data.character[attack_data.attacker_unit:base()._tweak_table]
		RestorationCore.log_shit("SC DICKS: " .. tostring(dicks.use_factory))
		if dicks.use_factory then
			attack_data.damage = attack_data.damage * 1
		end
	end
	RestorationCore.log_shit("SC: Bullet, ending damage: " .. attack_data.damage)
	if self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end
		self:_call_listeners(damage_info)
		return
	elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)
		RestorationCore.log_shit("SC: Bullet, Invulnerable")
		return
	elseif self:incapacitated() then
		RestorationCore.log_shit("SC: Bullet, Incapacitated")
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		RestorationCore.log_shit("SC: Bullet, Friendly Fire")
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		RestorationCore.log_shit("SC: Bullet, Damage is too soon")
		return
	elseif self._unit:movement():current_state().immortal then
		RestorationCore.log_shit("SC: Bullet, I AM IMMORTAL")
		return
	elseif self._revive_miss and math.random() < self._revive_miss then
		RestorationCore.log_shit("SC: Bullet, Whizzing by like shitty bumper stickers")
		self:play_whizby(attack_data.col_ray.position)
		return
	end
	self._last_received_dmg = attack_data.damage
	self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
	local dodge_roll = math.random()
	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = pm:body_armor_value("dodge")
	local skill_dodge_chance = pm:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance
	local smoke_dodge = 0
	for _, smoke_screen in ipairs(managers.player._smoke_screen_effects or {}) do
		if smoke_screen:is_in_smoke(self._unit) then
			smoke_dodge = tweak_data.projectiles.smoke_screen_grenade.dodge_chance
		end
	end
	dodge_value = 1 - (1 - dodge_value) * (1 - smoke_dodge)
	if dodge_roll < dodge_value then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())
		self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
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
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + tweak_data.timespeed.downed.fade_in + tweak_data.timespeed.downed.sustain + tweak_data.timespeed.downed.fade_out)
	end
	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
	self._last_bullet_damage = attack_data.damage
	local next_allowed_dmg_t_old = self._next_allowed_dmg_t
	
	if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
		self._last_received_dmg = self._last_bullet_damage
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

function PlayerDamage:revive(helped_self)
	if Application:digest_value(self._revives, false) == 0 then
		self._revive_health_multiplier = nil
		return
	end
	local arrested = self:arrested()
	managers.player:set_player_state("standard")
	if not helped_self then
		PlayerStandard.say_line(self, "s05x_sin")
	end
	self._bleed_out = false
	self._incapacitated = nil
	self._downed_timer = nil
	self._downed_start_time = nil
	if not arrested then
    		if managers.player:has_category_upgrade("player", "health_revive_max") then		
			self:set_health(self:_max_health() * 1)
		else
			self:set_health(self:_max_health() * tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i] * (self._revive_health_multiplier or 1))
		end		self:set_armor(self:_total_armor())
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
		managers.hint:show_hint("skill_stockholm_syndrome_trade")
	end
end

function PlayerDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
	attack_data.damage = attack_data.damage * managers.player:upgrade_value("player", "real_health_damage_reduction", 1)
	self:change_health(-attack_data.damage)
	health_subtracted = health_subtracted - self:get_real_health()
	local bullet_or_explosion_or_melee = attack_data.variant and (attack_data.variant == "bullet" or attack_data.variant == "explosion") or attack_data.variant == "melee"
	if self:get_real_health() == 0 and bullet_or_explosion_or_melee then
		self:_chk_cheat_death()
    	end
    	self:_damage_screen()
    	self:_check_bleed_out(bullet_or_explosion_or_melee)
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

end