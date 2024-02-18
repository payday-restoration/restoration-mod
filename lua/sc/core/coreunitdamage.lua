-- Make bulldozer armor scale with difficulty and increase planks durability
Hooks:PostHook(CoreBodyDamage, "init", "sh_init", function (self)
	if not self._body_element then
		return
	end

	if self._unit:character_damage() and self._unit:character_damage().IS_TANK then
		if self._body_element._name:find("glass") then
			self._body_element._damage_multiplier = tweak_data.character.tank_glass_damage_mul or self._body_element._damage_multiplier
		else
			self._body_element._damage_multiplier = tweak_data.character.tank_armor_damage_mul or self._body_element._damage_multiplier
		end
	elseif self._body_element._name == "planks_body" then
		self._body_element._damage_multiplier = 0.4
	end
end)