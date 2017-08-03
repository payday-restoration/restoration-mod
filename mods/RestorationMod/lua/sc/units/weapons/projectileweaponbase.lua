function ProjectileWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local unit
	local spread_x, spread_y = self:_get_spread(user_unit)
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()
	local theta = math.random() * 360
	local ax = math.sin(theta) * (math.random() * spread_x) * (spread_mul or 1)
	local ay = math.cos(theta) * (math.random() * spread_y) * (spread_mul or 1)
	mvector3.set(mvec_spread_direction, direction)
	mvector3.add(mvec_spread_direction, right * math.rad(ax))
	mvector3.add(mvec_spread_direction, up * math.rad(ay))
	RestorationCore.log_shit("SC: PREPARING PROJECTILE")
	
	local projectile_type_index = self._projectile_type_index or 2
	RestorationCore.log_shit("SC: projectile_type_index: " .. projectile_type_index)
	if self._ammo_data and self._ammo_data.launcher_grenade then
		RestorationCore.log_shit("SC: found launcher grenade")
		if self:weapon_tweak_data().projectile_type_indices and self:weapon_tweak_data().projectile_type_indices[self._ammo_data.launcher_grenade] then
			RestorationCore.log_shit("SC: type indices~~~")
			projectile_type_index = self:weapon_tweak_data().projectile_type_indices[self._ammo_data.launcher_grenade]
			RestorationCore.log_shit("SC: projectile_type_index indices: " .. projectile_type_index)
		else
			RestorationCore.log_shit("SC: getting dat index")
			projectile_type_index = tweak_data.blackmarket:get_index_from_projectile_id(self._ammo_data.launcher_grenade)
			RestorationCore.log_shit("SC: projectile_type_index proj id: " .. projectile_type_index)
		end
	end
	self:_adjust_throw_z(mvec_spread_direction)
	mvec_spread_direction = mvec_spread_direction * self:projectile_speed_multiplier()
	local spawn_offset = self:_get_spawn_offset()
	self._dmg_mul = dmg_mul or 1
	if not self._client_authoritative then
		if Network:is_client() then
			managers.network:session():send_to_host("request_throw_projectile", projectile_type_index, from_pos, mvec_spread_direction)
		else
			unit = ProjectileBase.throw_projectile(projectile_type_index, from_pos, mvec_spread_direction, managers.network:session():local_peer():id())
		end
	else
		unit = ProjectileBase.throw_projectile(projectile_type_index, from_pos, mvec_spread_direction, managers.network:session():local_peer():id())
	end
	managers.statistics:shot_fired({
		hit = false,
		weapon_unit = self._unit
	})
	return {}
end