if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	InstantRicochetBulletBase = InstantRicochetBulletBase or class(InstantBulletBase)
	InstantRicochetBulletBase.TRAIL_EFFECT = Idstring("effects/particles/weapons/sniper_trail")
	local idstr_trail = Idstring("trail")
	local idstr_simulator_length = Idstring("simulator_length")
	local idstr_size = Idstring("size")
	local reflect_result = Vector3()
	local mvec3_set = mvector3.set
	local mvec3_add = mvector3.add
	local mvec3_dot = mvector3.dot
	local mvec3_sub = mvector3.subtract
	local mvec3_mul = mvector3.multiply
	local mvec3_norm = mvector3.normalize
	local mvec3_dir = mvector3.direction
	local mvec3_set_l = mvector3.set_length
	local mvec3_len = mvector3.length
	local math_clamp = math.clamp
	local math_lerp = math.lerp
	local tmp_vec1 = Vector3()
	local tmp_vec2 = Vector3()
	local tmp_rot1 = Rotation()
	function InstantRicochetBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
		local from_pos, to_pos, ignore_unit, latest_data
		from_pos = user_unit:position() + Vector3(0, 0, 150)
		to_pos = col_ray.hit_position
		ignore_unit = user_unit
		RestorationCore.log_shit("RICOCHET BULLET FIRED!")
		for i = 1, tweak_data.ammo.ricochet.max_ricochets + 1 do
			RestorationCore.log_shit("SC: Ricochet #" .. i)
			if i > 1 then
				local weapon_base = alive(weapon_unit) and weapon_unit:base()
				if weapon_base and weapon_base.check_autoaim then
					local autoaim = weapon_base:check_autoaim(from_pos, reflect_result, nil, nil, tweak_data.ammo.ricochet.autohit, true, user_unit)
					if autoaim then
						mvector3.set(reflect_result, autoaim.ray)
						col_ray = autoaim
					end
				end
				if not self._trail_length then
					self._trail_length = World:effect_manager():get_initial_simulator_var_vector2(self.TRAIL_EFFECT, idstr_trail, idstr_simulator_length, idstr_size)
				end
				local trail = World:effect_manager():spawn({
					effect = self.TRAIL_EFFECT,
					position = from_pos,
					normal = reflect_result
				})
				if col_ray then
					mvector3.set_y(self._trail_length, col_ray.distance)
					World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, self._trail_length)
				end
			end
			mvector3.set_zero(reflect_result)
			mvector3.set(reflect_result, col_ray.ray)
			mvector3.add(reflect_result, -2 * col_ray.ray:dot(col_ray.normal) * col_ray.normal)
			local ang = math.abs(mvector3.angle(col_ray.ray, reflect_result))
			local can_ricochet = not (ang < tweak_data.ammo.ricochet.angles[1]) and not (ang > tweak_data.ammo.ricochet.angles[2])
			mvector3.spread(reflect_result, math.random(tweak_data.ammo.ricochet.spread_angle[1], tweak_data.ammo.ricochet.spread_angle[2]))
			from_pos = col_ray.hit_position + col_ray.normal
			ignore_unit = col_ray.unit
			latest_data = InstantRicochetBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, no_sound)
			managers.game_play_central:play_impact_sound_and_effects({col_ray = col_ray, no_sound = no_sound})
			if not can_ricochet then
				RestorationCore.log_shit("SC: Can't ricochet!")
				return latest_data
			end
			RestorationCore.log_shit("SC: Able to ricochet!")
			if alive(col_ray.unit) and col_ray.unit:character_damage() then
				RestorationCore.log_shit("SC: Ricocheting to unit!")
				return latest_data
			else
				local ray_data = World:raycast("ray", from_pos, from_pos + reflect_result * 50000, "slot_mask", self:bullet_slotmask())
				if ray_data then
					col_ray = ray_data
					to_pos = col_ray.hit_position
				else
					to_pos = false
					break
				end
			end
		end
		return latest_data
	end

	function RaycastWeaponBase:check_autoaim(from_pos, direction, max_dist, use_aim_assist, autohit_override_data, ricochet, my_unit)
		local autohit = use_aim_assist and self._aim_assist_data or self._autohit_data
		autohit = autohit_override_data or autohit
		local autohit_near_angle = autohit.near_angle
		local autohit_far_angle = autohit.far_angle
		local far_dis = autohit.far_dis
		local closest_error, closest_ray
		local tar_vec = tmp_vec1
		local ignore_units = self._setup.ignore_units
		local slotmask = self._bullet_slotmask
		local enemies
		if ricochet then
			enemies = World:find_units_quick(my_unit, "sphere", from_pos, max_dist, managers.slot:get_mask("all_criminals"))
		else
			enemies = managers.enemy:all_enemies()
		end
		local suppression_near_angle = 50
		local suppression_far_angle = 5
		local suppression_enemies
		for u_key, enemy_data in pairs(enemies) do
			local enemy = enemy_data.unit
			if ricochet then
				enemy = enemy_data
			end
			if ricochet or (enemy:base():lod_stage() == 1 and not enemy:in_slot(16)) then
				local com = enemy:movement():m_com()
				mvec3_set(tar_vec, com)
				mvec3_sub(tar_vec, from_pos)
				local tar_aim_dot = mvec3_dot(direction, tar_vec)
				if tar_aim_dot > 0 and (not max_dist or max_dist > tar_aim_dot) then
					local tar_vec_len = math_clamp(mvec3_norm(tar_vec), 1, far_dis)
					local error_dot = mvec3_dot(direction, tar_vec)
					local error_angle = math.acos(error_dot)
					local dis_lerp = math.pow(tar_aim_dot / far_dis, 0.25)
					local suppression_min_angle = math_lerp(suppression_near_angle, suppression_far_angle, dis_lerp)
					if error_angle < suppression_min_angle then
						suppression_enemies = suppression_enemies or {}
						local percent_error = error_angle / suppression_min_angle
						suppression_enemies[enemy_data] = percent_error
					end
					local autohit_min_angle = math_lerp(autohit_near_angle, autohit_far_angle, dis_lerp)
					if error_angle < autohit_min_angle then
						local percent_error = error_angle / autohit_min_angle
						if not closest_error or closest_error > percent_error then
							tar_vec_len = tar_vec_len + 100
							mvec3_mul(tar_vec, tar_vec_len)
							mvec3_add(tar_vec, from_pos)
							local vis_ray = World:raycast("ray", from_pos, tar_vec, "slot_mask", slotmask, "ignore_unit", ignore_units)
							if vis_ray and vis_ray.unit:key() == u_key and (not closest_error or closest_error > error_angle) then
								closest_error = error_angle
								closest_ray = vis_ray
								mvec3_set(tmp_vec1, com)
								mvec3_sub(tmp_vec1, from_pos)
								local d = mvec3_dot(direction, tmp_vec1)
								mvec3_set(tmp_vec1, direction)
								mvec3_mul(tmp_vec1, d)
								mvec3_add(tmp_vec1, from_pos)
								mvec3_sub(tmp_vec1, com)
								closest_ray.distance_to_aim_line = mvec3_len(tmp_vec1)
							end
						end
					end
				end
			end
		end
		return closest_ray, suppression_enemies
	end

	function InstantRicochetBulletBase:play_impact_sound_and_effects(col_ray, no_sound)
	end

	local init_original = RaycastWeaponBase.init
	local setup_original = RaycastWeaponBase.setup

	function RaycastWeaponBase:init(...)
		init_original(self, ...)
		
		self._shoot_through_data = {
			kills = 0,
			from = Vector3()
		}
		
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)
	end

	function RaycastWeaponBase:setup(...)
		setup_original(self, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)
	end

	function RaycastWeaponBase:_weapon_tweak_data_id()
		local override_gadget = self:gadget_overrides_weapon_functions()
		if override_gadget then
			return override_gadget.name_id
		end
		return self._name_id
	end
	
	function FlameBulletBase:bullet_slotmask()
		return managers.slot:get_mask("bullet_impact_targets")
	end	

	function RaycastWeaponBase:set_laser_enabled(state)
		if state then
			if alive(self._laser_unit) then
				return
			end
			local spawn_rot = self._obj_fire:rotation()
			local spawn_pos = self._obj_fire:position()
			spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
			self._laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_npc_upg_fl_ass_smg_sho_peqbox/wpn_npc_upg_fl_ass_smg_sho_peqbox"), spawn_pos, spawn_rot)
			self._unit:link(self._obj_fire:name(), self._laser_unit)
			self._laser_unit:base():set_npc()
			self._laser_unit:base():set_on()
			self._laser_unit:base():set_color_by_theme("cop_sniper")
			self._laser_unit:base():set_max_distace(10000)
		elseif alive(self._laser_unit) then
			self._laser_unit:set_slot(0)
			self._laser_unit = nil
		end
	end
	
	function RaycastWeaponBase:_collect_hits(from, to)
		local can_shoot_through = self._can_shoot_through_wall or self._can_shoot_through_shield or self._can_shoot_through_enemy
		local ray_hits = nil
		local hit_enemy = false
		local enemy_mask = managers.slot:get_mask("enemies")
		local wall_mask = managers.slot:get_mask("world_geometry", "vehicles")
		local shield_mask = managers.slot:get_mask("enemy_shield_check")
		local ai_vision_ids = Idstring("ai_vision")
		ray_hits = self._can_shoot_through_wall and World:raycast_wall("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "thickness", 40, "thickness_mask", wall_mask) or World:raycast_all("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
		local units_hit = {}
		local unique_hits = {}

		for i, hit in ipairs(ray_hits) do
			if not units_hit[hit.unit:key()] then
				units_hit[hit.unit:key()] = true
				unique_hits[#unique_hits + 1] = hit
				local hit_enemy = hit_enemy or hit.unit:in_slot(enemy_mask)
				local weak_body = hit.body:has_ray_type(ai_vision_ids)

				if not self._can_shoot_through_enemy and hit_enemy then
					break
				elseif has_hit_wall or (not self._can_shoot_through_wall and hit.unit:in_slot(wall_mask) and weak_body) then
					break
				elseif not self._can_shoot_through_shield and hit.unit:in_slot(shield_mask) then
					break
				elseif hit.unit:in_slot(shield_mask) and hit.unit:name():key() == 'af254947f0288a6c' then
					break
				elseif hit.unit:in_slot(shield_mask) and hit.unit:name():key() == '4a4a5e0034dd5340' then
					break						
				end
				
				local has_hit_wall = has_hit_wall or hit.unit:in_slot(wall_mask)
				
			end
		end

		return unique_hits, hit_enemy
	end	
	
	local raycast_current_damage_orig = RaycastWeaponBase._get_current_damage
	function RaycastWeaponBase:_get_current_damage(dmg_mul)
	   if self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase") then
 	       dmg_mul = dmg_mul / managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
  	   end
  	   return raycast_current_damage_orig(self, dmg_mul)
	end
	
end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
		local _add_ammo = function(ammo_base, ratio, add_amount_override)
			if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
				return false, 0
			end
			local multiplier_min = 1
			local multiplier_max = 1
			local ammo_min = ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_min_mul
			local ammo_max = ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_max_mul
			if ammo_min then
				multiplier_min = multiplier_min * ammo_min
			end
			multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1)
			multiplier_min = multiplier_min + managers.player:crew_ability_upgrade_value("crew_scavenge", 0)
			
			if ammo_max then
				multiplier_max = multiplier_max * ammo_max
			end
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1)
			multiplier_max = multiplier_max + managers.player:crew_ability_upgrade_value("crew_scavenge", 0)
			
			local add_amount = add_amount_override
			local picked_up = true

			if not add_amount then
				local rng_ammo = math.lerp(ammo_base._ammo_pickup[1] * multiplier_min, ammo_base._ammo_pickup[2] * multiplier_max, math.random())
				picked_up = rng_ammo > 0
				add_amount = math.max(0, math.round(rng_ammo))
			end
			add_amount = math.floor(add_amount * (ratio or 1))
			ammo_base:set_ammo_total(math.clamp(ammo_base:get_ammo_total() + add_amount, 0, ammo_base:get_ammo_max()))
			return picked_up, add_amount
		end
		local picked_up, add_amount
		picked_up, add_amount = _add_ammo(self, ratio, add_amount_override)
		
		if self.AKIMBO then
			local akimbo_rounding = self:get_ammo_total() % 2 + #self._fire_callbacks
	
			if akimbo_rounding > 0 then
				_add_ammo(self, nil, akimbo_rounding)
			end
		end		
		
		for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
			if gadget and gadget.ammo_base then
				local p, a = _add_ammo(gadget:ammo_base(), ratio, add_amount_override)
				picked_up = p or picked_up
				add_amount = add_amount + a
			end
		end
		return picked_up, add_amount
	end
	
end