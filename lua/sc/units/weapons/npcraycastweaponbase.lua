local mvec_to = Vector3()
local mvec_spread = Vector3()

local init_original = NPCRaycastWeaponBase.init
local setup_original = NPCRaycastWeaponBase.setup

Hooks:PostHook(NPCRaycastWeaponBase, "init", "res_init", function(self)
	self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)

	local weapon_tweak = tweak_data.weapon[self._name_id]
	if weapon_tweak.armor_piercing then
		self._use_armor_piercing = true
	end

	local trail = Idstring("effects/particles/weapons/weapon_trail")
	if weapon_tweak and weapon_tweak.sniper_trail then
		trail = Idstring("effects/particles/weapons/sniper_trail_sc")
	elseif weapon_tweak and weapon_tweak.titan_trail then
		trail = Idstring("effects/particles/weapons/titan_trail_sc")
	end

	self._trail_effect_table = {
		effect = trail,
		position = Vector3(),
		normal = Vector3()
	}

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

function NPCRaycastWeaponBase:setup(setup_data, ...)
	setup_original(self, setup_data, ...)
	self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)
	local user_unit = setup_data.user_unit
	if user_unit then
		if user_unit:in_slot(16) then
			self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16, 22)
		end
	end		
end

Hooks:PostHook(NPCRaycastWeaponBase, "destroy", "res_destroy", function(self)
	if alive(self._light) then
		World:delete_light(self._light)
	end
end)

function NPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray)
	self._obj_fire:m_position(self._trail_effect_table.position)
	mvector3.set(self._trail_effect_table.normal, direction)

	local trail = World:effect_manager():spawn(self._trail_effect_table)

	if col_ray then
		World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
	end
end

local mvec_to = Vector3()
local mvec_spread = Vector3()

function NPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local result = {}
	local hit_unit = nil
	local miss, extra_spread = self:_check_smoke_shot(user_unit, target_unit)

	if miss then
		result.guaranteed_miss = miss

		mvector3.spread(direction, math.rand(unpack(extra_spread)))
	end

	mvector3.set(mvec_to, direction)
	mvector3.multiply(mvec_to, 20000)
	mvector3.add(mvec_to, from_pos)

	local damage = self._damage * (dmg_mul or 1)
	local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	local player_hit, player_ray_data = nil
	
	if shoot_player and self._hit_player then
		player_hit, player_ray_data = self:damage_player(col_ray, from_pos, direction, result)

		if player_hit then
			InstantBulletBase:on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
		end
	end

	local char_hit = nil

	if not player_hit and col_ray then
		char_hit = InstantBulletBase:on_collision(col_ray, self._unit, user_unit, damage)
	end

	if (not col_ray or col_ray.unit ~= target_unit) and target_unit and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(tweak_data.weapon[self._name_id].suppression)
	end

	if not col_ray or col_ray.distance > 600 or result.guaranteed_miss then
		local num_rays = (tweak_data.weapon[self._name_id] or {}).rays or 1

		for i = 1, num_rays, 1 do
			mvector3.set(mvec_spread, direction)

			if i > 1 then
				mvector3.spread(mvec_spread, self:_get_spread(user_unit))
			end

			self:_spawn_trail_effect(mvec_spread, col_ray)
		end
	end

	result.hit_enemy = char_hit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	self:_cleanup_smoke_shot()

	return result
end

function NPCRaycastWeaponBase:_sound_autofire_end()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound.prefix .. self._setup.user_sound_variant .. self._voice .. "_end"
	local sound = self._sound_fire:post_event(sound_name)

	if not sound then
		sound_name = tweak_sound.prefix .. "1" .. self._voice .. "_end"
		sound = self._sound_fire:post_event(sound_name)
	end		
end	

function NPCRaycastWeaponBase:set_asu_laser_enabled(state)
	if state then
		if alive(self._laser_unit) then
			return
		end

		local spawn_rot = self._obj_fire:rotation()
		local spawn_pos = self._obj_fire:position()
		spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
		self._laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_asu_laser/wpn_asu_laser"), spawn_pos, spawn_rot)

		self._unit:link(self._obj_fire:name(), self._laser_unit)
		self._laser_unit:base():set_npc()
		self._laser_unit:base():set_on()
		--need something that sets the dot to yellow
		--self._laser_unit:base():set_color_by_theme("turret_module_rearming")
		self._laser_unit:base():set_max_distace(0)
	elseif alive(self._laser_unit) then
		self._laser_unit:set_slot(0)

		self._laser_unit = nil
	end
end