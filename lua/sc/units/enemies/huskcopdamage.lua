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

	if self._unit:base():char_tweak().die_sound_event then
		self._unit:sound():play(self._unit:base():char_tweak().die_sound_event, nil, nil)
	else
		if self._unit:base():char_tweak()["custom_voicework"] then
			local voicelines = _G.voiceline_framework.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
			if voicelines and voicelines["death"] then
				local line_to_use = voicelines.death[math.random(#voicelines.death)]
				self._unit:base():play_voiceline(line_to_use, true)
			end
		end
	end
end

function HuskCopDamage:heal_unit(...)
	return CopDamage.heal_unit(self, ...)
end