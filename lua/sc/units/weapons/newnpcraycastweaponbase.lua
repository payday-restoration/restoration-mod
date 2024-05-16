Hooks:PostHook(NewNPCRaycastWeaponBase, "init", "res_init", function(self)
	if not self._flashlight_data and self._unit:get_object(Idstring("a_effect_flashlight")) then
		local effect = self._unit:effect_spawner(Idstring("flashlight"))
		if not effect then return end -- effect failed to spawn for whatever reason, most likely the object is missing the effect spawner

		local light = World:create_light("spot|specular")
		local light_object = self._unit:get_object(Idstring("a_effect_flashlight"))

		self._light = light
		self._flashlight_data = {
			light = light,
			effect = effect
		}
		light:set_far_range(400)
		light:set_spot_angle_end(25)
		light:set_multiplier(2)
		light:link(light_object)
		light:set_rotation(Rotation(light_object:rotation():z(), -light_object:rotation():x(), -light_object:rotation():y()))
		light:set_enable(false)
	end
end)

local setup_original = NewNPCRaycastWeaponBase.setup
function NewNPCRaycastWeaponBase:setup(setup_data, ...)
	setup_original(self, setup_data, ...)
	self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)

	local user_unit = setup_data.user_unit

	if user_unit then
		if user_unit:in_slot(16) then
			self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16, 22)
		end
	end
end

Hooks:PostHook(NewNPCRaycastWeaponBase, "destroy", "res_destroy", function(self)
	if alive(self._light) then
		World:delete_light(self._light)
	end
end)

local ai_vision_ids = Idstring("ai_vision")
local bulletproof_ids = Idstring("bulletproof")
local mvec_to = Vector3()
local mvec_spread = Vector3()

function NewNPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player)
	if not self._check_ap_and_masks then
		self._check_ap_and_masks = true

		--Apply bot boosts if not done yet.
		if not self._use_armor_piercing then
			if self._is_team_ai and managers.player:has_category_upgrade("team", "crew_ai_ap_ammo") then
				self._use_armor_piercing = true
				self._shield_knock = true
				self._damage = self._damage * managers.player:upgrade_value("team", "crew_ai_ap_ammo")
			end
		end

		self._wall_mask = managers.slot:get_mask("world_geometry", "vehicles")
		self._shield_mask = managers.slot:get_mask("enemy_shield_check")
		self._enemy_mask = managers.slot:get_mask("enemies")
	end

	local char_hit = nil
	local result = {}
	local ray_distance = self._weapon_range or 20000

	mvector3.set(mvec_to, direction)
	mvector3.multiply(mvec_to, ray_distance)
	mvector3.add(mvec_to, from_pos)

	local damage = self._damage

	if dmg_mul then
		damage = damage * dmg_mul
	end

	local ray_hits = World:raycast_all("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	local units_hit = {}
	local unique_hits = {}

	for i, hit in ipairs(ray_hits) do
		if not units_hit[hit.unit:key()] then
			units_hit[hit.unit:key()] = true
			unique_hits[#unique_hits + 1] = hit
			hit.hit_position = hit.position

			if hit.unit:in_slot(self._wall_mask) then
				local hard_surface = hit.body:has_ray_type(ai_vision_ids) or hit.body:has_ray_type(bulletproof_ids)

				if hard_surface then
					break
				end
			elseif hit.unit:in_slot(self._shield_mask) or hit.unit:in_slot(self._enemy_mask) then
				break
			end
		end
	end

	local furthest_hit = unique_hits[#unique_hits]

	if #unique_hits > 0 then
		local hit_player = false

		for _, hit in ipairs(unique_hits) do
			if self._hit_player and not hit_player and shoot_player then
				local player_hit_ray = deep_clone(hit)
				local player_hit = self:damage_player(player_hit_ray, from_pos, direction, result)

				if player_hit then
					hit_player = true
					char_hit = true

					local damaged_player = InstantBulletBase:on_hit_player(player_hit_ray, self._unit, user_unit, damage)

					if damaged_player then
						hit.unit = managers.player:player_unit()
						hit.body = hit.unit:body("inflict_reciever")
						hit.position = mvector3.copy(hit.body:position())
						hit.hit_position = hit.position
						hit.distance = mvector3.direction(hit.ray, mvector3.copy(from_pos), mvector3.copy(hit.position))
						hit.normal = -hit.ray
						furthest_hit = hit

						break
					end	
				end
			end

			local hit_char = InstantBulletBase:on_collision(hit, self._unit, user_unit, damage)

			if hit_char then
				char_hit = true

				if hit_char.type and hit_char.type == "death" then
					if self:is_category("shotgun") then
						managers.game_play_central:do_shotgun_push(hit.unit, hit.position, hit.ray, hit.distance, user_unit)
					end

					if user_unit:unit_data().mission_element then
						user_unit:unit_data().mission_element:event("killshot", user_unit)
					end
				end
			end
		end
	else
		if self._hit_player and shoot_player then
			local player_hit, player_ray_data = self:damage_player(nil, from_pos, direction, result)

			if player_hit then
				local damaged_player = InstantBulletBase:on_hit_player(player_ray_data, self._unit, user_unit, damage)

				if damaged_player then
					char_hit = true

					player_ray_data.unit = managers.player:player_unit()
					player_ray_data.body = player_ray_data.unit:body("inflict_reciever")
					player_ray_data.position = mvector3.copy(player_ray_data.body:position())
					player_ray_data.hit_position = player_ray_data.position
					player_ray_data.distance = mvector3.direction(player_ray_data.ray, mvector3.copy(from_pos), mvector3.copy(player_ray_data.position))
					player_ray_data.normal = -player_ray_data.ray
					furthest_hit = player_ray_data
				end	
			end
		end
	end

	result.hit_enemy = char_hit

	if alive(self._obj_fire) then
		if furthest_hit and furthest_hit.distance > 600 or not furthest_hit then
			local trail_direction = furthest_hit and furthest_hit.ray or direction
			local right = trail_direction:cross(math.UP):normalized()
			local up = trail_direction:cross(right):normalized()
			local name_id = self.non_npc_name_id and self:non_npc_name_id() or self._name_id
			local num_rays = (tweak_data.weapon[name_id] or {}).rays or 1

			for v = 1, num_rays, 1 do
				mvector3.set(mvec_spread, trail_direction)

				if v > 1 then
					local spread_x, spread_y = self:_get_spread(user_unit)
					local theta = math.random() * 360
					local ax = math.sin(theta) * math.random() * spread_x
					local ay = math.cos(theta) * math.random() * (spread_y or spread_x)

					mvector3.add(mvec_spread, right * math.rad(ax))
					mvector3.add(mvec_spread, up * math.rad(ay))
				end

				self:_spawn_trail_effect(mvec_spread, furthest_hit)
			end
		end
	end

	if self._alert_events then
		result.rays = unique_hits
	end

	return result
end

function NewNPCRaycastWeaponBase:_sound_autofire_start(nr_shots)
	self._sound_fire:stop()

	local tweak_data = tweak_data.weapon[self._name_id or "new_m4"]
	local tweak_sound = tweak_data and tweak_data.sounds
	local prefix = (tweak_sound and tweak_sound.prefix) or "new_m4"
	local sound_name = prefix .. self._setup.user_sound_variant .. self._voice .. (nr_shots and "_" .. tostring(nr_shots) .. "shot" or "_loop")
	local sound = self._sound_fire:post_event(sound_name, callback(self, self, "_on_auto_fire_stop"), nil, "end_of_event")

	if not sound then
		sound_name = prefix .. "1" .. self._voice .. "_end"
		sound = self._sound_fire:post_event(sound_name)
	end
end

function NewNPCRaycastWeaponBase:_sound_autofire_end()
	local tweak_data = tweak_data.weapon[self._name_id or "new_m4"]
	local tweak_sound = tweak_data and tweak_data.sounds
	local prefix = (tweak_sound and tweak_sound.prefix) or "new_m4"
	local sound_name = prefix .. self._setup.user_sound_variant .. self._voice .. "_end"
	local sound = self._sound_fire:post_event(sound_name)

	if not sound then
		sound_name = prefix .. "1" .. self._voice .. "_end"
		sound = self._sound_fire:post_event(sound_name)
	end
end

function NewNPCRaycastWeaponBase:_sound_singleshot()
	local tweak_data = tweak_data.weapon[self._name_id or "new_m4"]
	local tweak_sound = tweak_data and tweak_data.sounds
	local prefix = (tweak_sound and tweak_sound.prefix) or "new_m4"
	local sound_name = prefix .. self._setup.user_sound_variant .. self._voice .. "_1shot"
	local sound = self._sound_fire:post_event(sound_name)

	if not sound then
		sound_name = prefix .. "1" .. self._voice .. "_1shot"
		sound = self._sound_fire:post_event(sound_name)
	end
end