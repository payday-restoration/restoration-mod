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

function CoreBodyDamage:damage_damage(attack_unit, normal, position, direction, damage, unevadable)
	local object_damage_mult = alive(attack_unit) and attack_unit:inventory():equipped_unit():base():weapon_tweak_data().object_damage_mult or 1
	damage = damage * object_damage_mult
	damage = self:damage_endurance("damage", attack_unit, normal, position, direction, damage, Vector3(0, 0, 0))
	return self._unit_extension:damage_damage(attack_unit, self._body, normal, position, direction, damage, unevadable)
end