-- Make bulldozer armor stronger (Thanks hoppip!)

Hooks:PostHook(CoreBodyDamage, "init", "sh_init", function (self, hit_body)
	if self._body_element and self._unit:character_damage() and self._unit:character_damage().IS_TANK then
		if not CoreBodyDamage._tank_armor_multiplier then
			CoreBodyDamage._tank_armor_multiplier = 1 / 4
			CoreBodyDamage._tank_glass_multiplier = 1 / math.max(1, 4 * 0.5)
		end
		self._body_element._damage_multiplier = self._body_element._name:find("glass") and CoreBodyDamage._tank_glass_multiplier or CoreBodyDamage._tank_armor_multiplier
	end
end)
