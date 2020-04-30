local mvec_to = Vector3()
local mvec_spread = Vector3()

local init_original = NPCRaycastWeaponBase.init
local setup_original = NPCRaycastWeaponBase.setup

function NPCRaycastWeaponBase:init(...)
	init_original(self, ...)
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
end

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

function NPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray)
	self._obj_fire:m_position(self._trail_effect_table.position)
	mvector3.set(self._trail_effect_table.normal, direction)

	local trail = World:effect_manager():spawn(self._trail_effect_table)

	if col_ray then
		World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
	end
end

Hooks:PostHook(NPCRaycastWeaponBase, "init", "flamethrower_mk2_flamer_init", function(self)
	if self._name_id and self._name_id == "flamethrower_mk2_flamer" then
		self._flamethrower_init = true
		self._use_shell_ejection_effect = false
		self._use_trails = false
		self._rays = 9
		self._range = 1400
		self._flame_max_range = 1500
		self._single_flame_effect_duration = 1
		self._bullet_class = FlameBulletBase
		self._bullet_slotmask = managers.slot:get_mask("bullet_impact_targets_no_criminals")
		self._blank_slotmask = self._bullet_class:blank_slotmask()
		
		self:set_ammo_max(tweak_data.weapon[self._name_id].AMMO_MAX)
		self:set_ammo_total(self:get_ammo_max())
		self:set_ammo_max_per_clip(tweak_data.weapon[self._name_id].CLIP_AMMO_MAX)
		self:set_ammo_remaining_in_clip(self:get_ammo_max_per_clip())
		self._damage = tweak_data.weapon[self._name_id].DAMAGE
	end
end)

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
	
	if self._flamethrower_init then
		if not self._check_shooting_expired then
			self:play_tweak_data_sound("fire")
		end

		self._check_shooting_expired = {
			check_t = Application:time() + 0.3
		}

		self._unit:set_extension_update_enabled(Idstring("base"), true)
		self._unit:flamethrower_effect_extension():_spawn_muzzle_effect(self._obj_fire:position(), direction)			
	end

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

	if self._flamethrower_init then
		if not sound then
			sound = self._sound_fire:post_event("flamethrower_npc_fire_stop")
		end
	else
		if not sound then
			sound_name = tweak_sound.prefix .. "1" .. self._voice .. "_end"
			sound = self._sound_fire:post_event(sound_name)
		end		
	end
end	
