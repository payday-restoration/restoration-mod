local mvec_spread_direction = Vector3()

function WeaponUnderbarrelLauncher:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	self._ammo_data = {
		launcher_grenade = self.launcher_projectile
	}
	local unit = nil
	local spread_x, spread_y = weapon_base:_get_spread(user_unit)
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()
	local r = math.pow(math.random(), tweak_data.weapon.spread.dispersion)
	local theta = math.random() * 360
	local ax = math.tan(r * spread_x * (spread_mul or 1)) * math.cos(theta)
	local ay = math.tan(r * spread_y * (spread_mul or 1)) * math.sin(theta) * -1

	mvector3.set(mvec_spread_direction, direction)
	mvector3.add(mvec_spread_direction, right * ax)
	mvector3.add(mvec_spread_direction, up * ay)

	local projectile_type = self.launcher_projectile
	local projectile_type_index = tweak_data.blackmarket:get_index_from_projectile_id(projectile_type)

	self:_adjust_throw_z(mvec_spread_direction)

	mvec_spread_direction = mvec_spread_direction * 1
	local spawn_offset = self:_get_spawn_offset()
	self._dmg_mul = dmg_mul or 1

	if not self._client_authoritative then
		if Network:is_client() then
			managers.network:session():send_to_host("request_throw_projectile", projectile_type_index, from_pos, mvec_spread_direction)
		else
			unit = ProjectileBase.throw_projectile(projectile_type, from_pos, mvec_spread_direction, managers.network:session():local_peer():id())
		end
	else
		unit = ProjectileBase.throw_projectile(projectile_type, from_pos, mvec_spread_direction, managers.network:session():local_peer():id())
	end

	managers.statistics:shot_fired({
		hit = false,
		weapon_unit = weapon_base._unit
	})
	self:on_shot()
	weapon_base:check_bullet_objects()

	return {}
end