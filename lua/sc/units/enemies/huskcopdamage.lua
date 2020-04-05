if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
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
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, nil)
		end
	end

	function HuskCopDamage:heal_unit(...)
		return CopDamage.heal_unit(self, ...)
	end
end
