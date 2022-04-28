
--Kills adjust_z scaling with charge
function BowWeaponBase:_adjust_throw_z(m_vec)
end

--Uncharged shots deal less damage
function BowWeaponBase:projectile_damage_multiplier()
	return math.lerp(0.0001, 1, self:charge_multiplier())
end

--Uncharged shots have less velocity (failed shots also drop closer to you)
function BowWeaponBase:projectile_speed_multiplier()
	return math.lerp(0.0001, 1, self:charge_multiplier())
end
