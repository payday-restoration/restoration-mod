--Kill
function BowWeaponBase:charge_fail()
	return false
end

--Kills adjust_z scaling with charge
function BowWeaponBase:_adjust_throw_z(m_vec)
end

--Uncharged shots deal less damage
function BowWeaponBase:projectile_damage_multiplier()
	return math.lerp(0.5, 1, self:charge_multiplier())
end

--Uncharged shots have less velocity
function BowWeaponBase:projectile_speed_multiplier()
	return math.lerp(0.25, 1, self:charge_multiplier())
end

--Overkill literally made bows aim at 1/2 speed
function BowWeaponBase:enter_steelsight_speed_multiplier(mult_only)
	return BowWeaponBase.super.enter_steelsight_speed_multiplier(self, mult_only)
end
