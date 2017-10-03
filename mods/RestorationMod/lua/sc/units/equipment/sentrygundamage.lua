if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function SentryGunDamage:_apply_damage(damage, dmg_shield, dmg_body, is_local)
		if dmg_shield and self._shield_health > 0 then
			local damage_percent
			local shield_dmg = damage ~= "death" and damage or self._SHIELD_HEALTH_INIT
			if tweak_data.weapon[self._unit:base():get_name_id()].SHIELD_DAMAGE_CLAMP then
				shield_dmg = math.min(shield_dmg, tweak_data.weapon[self._unit:base():get_name_id()].SHIELD_DAMAGE_CLAMP)
			end
			if is_local then
				shield_dmg = (self._sync_shield_dmg_leftover or 0) + shield_dmg * tweak_data.weapon[self._unit:base():get_name_id()].SHIELD_DMG_MUL
				local health_init_percent = self._SHIELD_HEALTH_INIT_PERCENT
				damage_percent = math.clamp(shield_dmg / health_init_percent, 0, self._HEALTH_GRANULARITY)
				local leftover_percent = damage_percent - math.floor(damage_percent)
				self._sync_shield_dmg_leftover = leftover_percent * health_init_percent
				damage_percent = math.floor(damage_percent)
				shield_dmg = damage_percent * health_init_percent
			end
			if shield_dmg > 0 then
				if shield_dmg >= self._shield_health then
					self._shield_health = 0
					self._sync_shield_dmg_leftover = 0
					if self._shield_destroyed_sequence_name then
						self._unit:damage():run_sequence_simple(self._shield_destroyed_sequence_name)
					end
					if self._shield_destroyed_snd_event then
						self._unit:sound_source():post_event(self._shield_destroyed_snd_event)
					end
				else
					self._shield_health = self._shield_health - shield_dmg
				end
				if not dmg_body then
					return damage_percent
				end
			end
		end
		if dmg_body then
			local damage_percent
			local body_damage = damage ~= "death" and damage or self._HEALTH_INIT
			if is_local then
				body_damage = body_damage + (self._sync_body_dmg_leftover or 0)
				local health_init_percent = self._HEALTH_INIT_PERCENT
				damage_percent = math.clamp(body_damage / health_init_percent, 0, self._HEALTH_GRANULARITY)
				local leftover_percent = damage_percent - math.floor(damage_percent)
				self._sync_body_dmg_leftover = leftover_percent * health_init_percent
				damage_percent = math.floor(damage_percent)
				body_damage = damage_percent * health_init_percent
			end
			if body_damage == 0 then
				return
			end
			local previous_health_ratio = self:health_ratio()
			if body_damage >= self._health then
				self:die()
			else
				self._health = self._health - body_damage
			end
			if not self._dead and previous_health_ratio >= 0.75 and self:health_ratio() < 0.75 and self._damaged_sequence_name then
				self._unit:damage():run_sequence_simple(self._damaged_sequence_name)
			end
			return damage_percent
		end
	end

end