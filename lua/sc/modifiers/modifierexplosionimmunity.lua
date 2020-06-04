ModifierExplosionImmunity.default_value = "explosive_resist"

function ModifierExplosionImmunity:modify_value(id, value, unit)
    if id == "CopDamage:DamageExplosion" and unit:base():has_tag("tank") then
        local resist = self:value() / 100 
		return value * resist
	end

	return value
end