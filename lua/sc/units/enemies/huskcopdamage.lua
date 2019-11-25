if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function HuskCopDamage:damage_bullet(attack_data)
		if self._dead or self._invulnerable then
			return
		end

		local attacker_unit = attack_data.attacker_unit
		local attacker_base = alive(attacker_unit) and attacker_unit.base and attacker_unit:base()
		if attacker_base.is_local_player then
			return HuskCopDamage.super.damage_bullet(self, attack_data)
		end

		return self:is_friendly_fire(attacker_unit) and 'friendly_fire' or nil
	end

	local old_death = HuskCopDamage.die
	function HuskCopDamage:die(variant)
		old_death(self, variant)
		if self._unit:base():char_tweak().ends_assault_on_death then
			managers.hud:set_buff_enabled("vip", false)
		end
		if self._unit:contour() then
			self._unit:contour():remove("omnia_heal", false)
			self._unit:contour():remove("medic_show", false)
		end 	
		
		if self._unit:base():has_tag("tank_titan") or self._unit:base():has_tag("shield_titan") or self._unit:base():has_tag("captain") or self._unit:base():has_tag("lpf") then
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
		end	
	end

	function HuskCopDamage:heal_unit(...)
		return CopDamage.heal_unit(self, ...)
	end
end