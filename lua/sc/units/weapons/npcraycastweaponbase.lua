local mvec_to = Vector3()
local mvec_spread = Vector3()

local init_original = NPCRaycastWeaponBase.init
local setup_original = NPCRaycastWeaponBase.setup
local idstr_trail = Idstring("trail")
local idstr_simulator_length = Idstring("simulator_length")
local idstr_size = Idstring("size")


Hooks:PostHook(NPCRaycastWeaponBase, "init", "res_init", function(self)
	self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)

	local weapon_tweak = tweak_data.weapon[self._name_id]
	if weapon_tweak.armor_piercing then
		self._use_armor_piercing = true
	end
	
	local bullet_class = tweak_data.weapon[self._name_id].bullet_class
	
	if bullet_class ~= nil then
		bullet_class = CoreSerialize.string_to_classtable(bullet_class)

		if bullet_class then
			self._bullet_class = bullet_class
		else
			Application:error("[NPCRaycastWeaponBase:init] Unexisting class for bullet_class string ", weap_tweak.bullet_class, "defined for tweak data ID ", name_id)

			self._bullet_class = InstantBulletBase
		end
	else
		self._bullet_class = InstantBulletBase
	end	

	local trail = weapon_tweak.trail_effect or Idstring("effects/particles/weapons/weapon_trail")

	self._use_sniper_trail = weapon_tweak.use_sniper_trail

	self._trail_effect_table = {
		effect = trail,
		position = Vector3(),
		normal = Vector3()
	}
	self._trail_length = World:effect_manager():get_initial_simulator_var_vector2(Idstring("effects/particles/weapons/sniper_trail"), idstr_trail, idstr_simulator_length, idstr_size)


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

	if alive(self._asu_laser_unit) then
		self._asu_laser_unit:set_slot(0)
		self._asu_laser_unit = nil
	end
end)

function NPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray, user_unit)
	self._obj_fire:m_position(self._trail_effect_table.position)
	mvector3.set(self._trail_effect_table.normal, direction)

	local trail = World:effect_manager():spawn(self._trail_effect_table)

	if col_ray then
		mvector3.set_y(self._trail_length, col_ray.distance)
		if self._use_sniper_trail then
			World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, self._trail_length)
		else
			World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0,  col_ray.distance))
		end
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
			self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
		end
	end

	local char_hit = nil

	if not player_hit and col_ray then
		char_hit = self._unit:base():bullet_class():on_collision(col_ray, self._unit, user_unit, damage)
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

			local char_tweak = not self._set_trail and alive(user_unit) and user_unit.base and user_unit:base().char_tweak and user_unit:base():char_tweak()
			if char_tweak then
				if char_tweak.dt_suppress then
					self._trail_effect_table.effect = Idstring("_dmc/effects/knockback_trail")
				elseif char_tweak.dt_sgunner or char_tweak.slowing_bullets then
					self._trail_effect_table.effect = Idstring("_dmc/effects/concussion_trail")
				end
				self._set_trail = true
			end

			self:_spawn_trail_effect(mvec_spread, col_ray, user_unit)
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

function NPCRaycastWeaponBase:trigger_held(...)
	local fired = nil

	if self._next_fire_allowed <= Application:time() then
		fired = self:fire(...)

		if fired then
			self._next_fire_allowed = self._next_fire_allowed + ((tweak_data.weapon[self._name_id].auto and tweak_data.weapon[self._name_id].auto.fire_rate) or 1)
		end
	end

	return fired
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
		if alive(self._asu_laser_unit) then
			return
		end

		local attachment_point = self._unit:get_object(Idstring("a_laser")) or self._obj_fire
		local spawn_rot = attachment_point:rotation()
		local spawn_pos = attachment_point:position()
		if attachment_point == self._obj_fire then
			spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
		end

		self._asu_laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_asu_laser/wpn_asu_laser"), spawn_pos, spawn_rot)
		
		self._unit:link(attachment_point:name(), self._asu_laser_unit)
		self._asu_laser_unit:base():set_npc()
		self._asu_laser_unit:base():set_on()
		self._asu_laser_unit:base():set_color_by_theme("asu_laser")
		self._asu_laser_unit:base():set_max_distace(0)
	elseif alive(self._asu_laser_unit) then
		self._asu_laser_unit:set_slot(0)

		self._asu_laser_unit = nil
	end
end

function NPCRaycastWeaponBase:set_laser_enabled(state)
	if state then
		if alive(self._laser_unit) then
			return
		end

		local attachment_point = self._unit:get_object(Idstring("a_laser")) or self._obj_fire
		local spawn_rot = attachment_point:rotation()
		local spawn_pos = attachment_point:position()
		if attachment_point == self._obj_fire then
			spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
		end

		self._laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_npc_upg_fl_ass_smg_sho_peqbox/wpn_npc_upg_fl_ass_smg_sho_peqbox"), spawn_pos, spawn_rot)
		
		self._unit:link(attachment_point:name(), self._laser_unit)
		self._laser_unit:base():set_npc()
		self._laser_unit:base():set_on()
		self._laser_unit:base():set_color_by_theme("cop_sniper")
		self._laser_unit:base():set_max_distace(10000)
	elseif alive(self._laser_unit) then
		self._laser_unit:set_slot(0)

		self._laser_unit = nil
	end
end

--Original weapon base made by Crackdown and all who contributed, updated/changed as necessary.
NPCGrenadeLauncherBaseBoss = NPCGrenadeLauncherBaseBoss or class(NPCRaycastWeaponBase)

function NPCGrenadeLauncherBaseBoss:init(unit)
	NPCGrenadeLauncherBaseBoss.super.init(self, unit)
	self._grenade_cooldown = 0
	self._grenade_cooldown_max = tweak_data.weapon[self._name_id].gl_cooldown_max or 0
	self._firing_status = 0
	self._speaking_cooldown = tweak_data.weapon[self._name_id].gl_speaking_cooldown or 0
	self._speak_cool = 0
end

function NPCGrenadeLauncherBaseBoss:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, shoot_through_data)
	local t = TimerManager:main():time()
	--So we can use this base for several types of Grenade/Rocket Launchers
	local projectile = tweak_data.weapon[self._name_id].projectile
	
	if self._grenade_cooldown > t or self._speak_cool > t then
		return {}
	end
	if self._firing_status == 0 then
		self._firing_status = 1
		if tweak_data.weapon[self._name_id].gl_voiceline then
			user_unit:sound():say("use_gas", true, nil, true)
			self._speak_cool = t + self._speaking_cooldown
		end
		return {}
	else
		if not Network:is_client() then
			local unit = nil
			local mvec_from_pos = Vector3()
			local mvec_direction = Vector3()
			mvector3.set(mvec_from_pos, from_pos)
			mvector3.set(mvec_direction, direction)
			mvector3.multiply(mvec_direction, 100)
			
			mvector3.add(mvec_from_pos, mvec_direction)
			if not self._client_authoritative then
				unit = ProjectileBase.throw_projectile_npc(projectile, mvec_from_pos, direction)
			end
			self._firing_status = 0
			self._grenade_cooldown = t + self._grenade_cooldown_max
			self._play_fire_sound = true
			return {}
		end
	end
	return {}
end

function NPCGrenadeLauncherBaseBoss:singleshot(...)
	local fired = self:fire(...)

	if self._play_fire_sound then
		self._play_fire_sound = nil
		self:_sound_singleshot()
	end

	return fired
end

function NPCGrenadeLauncherBaseBoss:trigger_held(...)
	local fired = nil
	
	if self._grenade_cooldown <= Application:time() then
		fired = self:fire(...)
	end

	return fired
end

function NPCGrenadeLauncherBaseBoss:auto_trigger_held(...)
	local fired = nil
	
	if self._grenade_cooldown <= Application:time() then
		fired = self:fire(...)
	end

	return fired
end

function NPCGrenadeLauncherBaseBoss:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local user_unit = self._setup.user_unit

	self:_check_ammo_total(user_unit)

	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)

	if self._play_fire_sound then 
		if alive(self._obj_fire) then
			self:_spawn_muzzle_effect(from_pos, direction)
		end

		self:_spawn_shell_eject_effect()
	end

	if self._alert_events and ray_res.rays then
		self:_check_alert(ray_res.rays, from_pos, direction, user_unit)
	end

	if ray_res.enemies_in_cone then
		for enemy_data, dis_error in pairs(ray_res.enemies_in_cone) do
			if not enemy_data.unit:movement():cool() then
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
			end
		end
	end

	managers.player:send_message(Message.OnWeaponFired, nil, self._unit, ray_res)
	
	if self:weapon_tweak_data().has_fire_animation then
		self:tweak_data_anim_play("fire")
	end

	return ray_res
end
