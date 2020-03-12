if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local setup_original = NewNPCRaycastWeaponBase.setup

	function NewNPCRaycastWeaponBase:setup(setup_data, ...)
		setup_original(self, setup_data, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)
		local user_unit = setup_data.user_unit
		if user_unit then
			if user_unit:in_slot(16) then
				self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16, 22)
			end

			if self._is_team_ai and managers.player:has_category_upgrade("team", "crew_ai_ap_ammo") then
				self._use_armor_piercing = true
			end
		end				
	end
	
	local mvec_to = Vector3()
	local mvec_spread = Vector3()
	local mvec1 = Vector3()

	function NewNPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, shoot_through_data)
		local result = {}
		local hit_unit = nil
		local ray_distance = shoot_through_data and shoot_through_data.ray_distance or self._weapon_range or 20000

		mvector3.set(mvec_to, direction)
		mvector3.multiply(mvec_to, ray_distance)
		mvector3.add(mvec_to, from_pos)

		local damage = self._damage * (dmg_mul or 1)
		local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
		local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)

		if shoot_through_data and shoot_through_data.has_hit_wall then
			if not col_ray then
				return result
			end

			mvector3.set(mvec1, col_ray.ray)
			mvector3.multiply(mvec1, -5)
			mvector3.add(mvec1, col_ray.position)

			local ray_blocked = World:raycast("ray", mvec1, shoot_through_data.from, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report")

			if ray_blocked then
				return result
			end
		end

		local right = direction:cross(math.UP):normalized()
		local up = direction:cross(right):normalized()

		if col_ray then
			if col_ray.unit:in_slot(self._character_slotmask) then
				hit_unit = InstantBulletBase:on_collision(col_ray, self._unit, user_unit, damage)
			elseif shoot_player and self._hit_player and self:damage_player(col_ray, from_pos, direction) then
				InstantBulletBase:on_hit_player(col_ray, self._unit, user_unit, self._damage * (dmg_mul or 1))
			else
				hit_unit = InstantBulletBase:on_collision(col_ray, self._unit, user_unit, damage)
			end
		elseif shoot_player and self._hit_player then
			local hit, ray_data = self:damage_player(col_ray, from_pos, direction)

			if hit then
				InstantBulletBase:on_hit_player(ray_data, self._unit, user_unit, damage)
			end
		end

		if not col_ray or col_ray.distance > 600 then
			local name_id = self.non_npc_name_id and self:non_npc_name_id() or self._name_id
			local num_rays = (tweak_data.weapon[name_id] or {}).rays or 1

			for i = 1, num_rays, 1 do
				mvector3.set(mvec_spread, direction)

				if i > 1 then
					local spread_x, spread_y = self:_get_spread(user_unit)
					local theta = math.random() * 360
					local ax = math.sin(theta) * math.random() * spread_x
					local ay = math.cos(theta) * math.random() * (spread_y or spread_x)

					mvector3.add(mvec_spread, right * math.rad(ax))
					mvector3.add(mvec_spread, up * math.rad(ay))
				end

				self:_spawn_trail_effect(mvec_spread, col_ray)
			end
		end

		result.hit_enemy = hit_unit

		if self._alert_events then
			result.rays = {
				col_ray
			}
		end

		if col_ray and col_ray.unit then
			--Temp
			local ap_skill = false

			repeat
				if hit_unit and not ap_skill then
					break
				end

				if col_ray.distance < 0.1 or ray_distance - col_ray.distance < 50 then
					break
				end

				local has_hit_wall = shoot_through_data and shoot_through_data.has_hit_wall
				local has_passed_shield = shoot_through_data and shoot_through_data.has_passed_shield
				local is_shoot_through, is_shield, is_wall = nil

				if not hit_unit then
					local is_world_geometry = col_ray.unit:in_slot(managers.slot:get_mask("world_geometry"))

					if is_world_geometry then
						is_shoot_through = not col_ray.body:has_ray_type(Idstring("ai_vision"))

						if not is_shoot_through then
							if has_hit_wall or not ap_skill then
								break
							end

							is_wall = true
						end
					else
						if not ap_skill then
							break
						end

						is_shield = col_ray.unit:in_slot(8) and alive(col_ray.unit:parent())
					end
				end

				if not hit_unit and not is_shoot_through and not is_shield and not is_wall then
					break
				end

				local ray_from_unit = (hit_unit or is_shield) and col_ray.unit
				self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
				self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
				self._shoot_through_data.ray_from_unit = ray_from_unit
				self._shoot_through_data.ray_distance = ray_distance - col_ray.distance

				mvector3.set(self._shoot_through_data.from, direction)
				mvector3.multiply(self._shoot_through_data.from, is_shield and 5 or 40)
				mvector3.add(self._shoot_through_data.from, col_ray.position)
				managers.game_play_central:queue_fire_raycast(Application:time() + 0.0125, self._unit, user_unit, self._shoot_through_data.from, mvector3.copy(direction), dmg_mul, shoot_player, self._shoot_through_data)
			until true
		end

		return result
	end
	
end