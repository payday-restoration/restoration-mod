if restoration.Options:GetValue("SC/SC") then

local player_damage_melee = PlayerDamage.damage_melee
function PlayerDamage:damage_melee(attack_data)
	if attack_data then
		if alive(attack_data.attacker_unit) then
			if tostring(attack_data.attacker_unit:base()._tweak_table) == "boom" then
				--Soon
				--managers.player:set_player_state("incapacitated")
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
	self._last_bullet_damage = attack_data.damage
	local next_allowed_dmg_t_old = self._next_allowed_dmg_t
	
	local result = damage_bullet_original(self, attack_data, ...)
	
	if self._next_allowed_dmg_t ~= next_allowed_dmg_t_old then
		self._last_received_dmg = self._last_bullet_damage
	end
	
	return result
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