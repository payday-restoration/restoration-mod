local old_update_stats_values = ShotgunBase._update_stats_values

function ShotgunBase:_update_stats_values(disallow_replenish, ammo_data)
	ShotgunBase.super._update_stats_values(self, disallow_replenish, ammo_data)
	self:setup_default()

	self._is_real_shotgun = false --Stop the HX25 from mooching off of shotgun skills.
	for _, category in ipairs(self:categories()) do
		if category == "shotgun" then
			self._is_real_shotgun = true
			break
		end
	end

	self._damage_near_mul = 1
	self._damage_far_mul = 1

	if self._ammo_data then
		if self._ammo_data.rays ~= nil then
			self._rays = self._ammo_data.rays
		end
		--[[
		if self._ammo_data.damage_near_mul ~= nil then
			self._damage_near_mul = self._damage_near_mul * self._ammo_data.damage_near_mul
		end
		if self._ammo_data.damage_far_mul ~= nil then
			self._damage_far_mul = self._damage_far_mul * self._ammo_data.damage_far_mul
		end
		--]]
	end
	local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
	for part_id, stats in pairs(custom_stats) do
		--[[
		if stats.damage_near_mul then
			self._damage_near_mul = self._damage_near_mul * stats.damage_near_mul
		end
		if stats.damage_far_mul then
			self._damage_far_mul = self._damage_far_mul * stats.damage_far_mul
		end
		]]
		if stats.falloff_start_mult then
			self._damage_near_mul = self._damage_near_mul * stats.falloff_start_mult
		end
	
		if stats.falloff_end_mult then
			self._damage_far_mul = self._damage_far_mul * stats.falloff_end_mult
		end
	end


	self._range = tweak_data.weapon.stat_info.damage_falloff.max * self._damage_far_mul
	
	if self._ammo_data then
		if self._ammo_data.rays ~= 1 and self._is_real_shotgun then
			self._rays = self._rays + managers.player:upgrade_value("shotgun", "extra_rays", 0)
		end
	end
end

local mvec_temp = Vector3()
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()

function ShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result = nil
	local hit_enemies = {}
	local hit_objects = {}
	local hit_something, col_rays = nil

	if self._alert_events then
		col_rays = {}
	end

	local damage = self:_get_current_damage(dmg_mul)
	local autoaim, dodge_enemies = self:check_autoaim(from_pos, direction, self._range)
	local weight = 0.1
	local enemy_died = false

	local function hit_enemy(col_ray)
		if col_ray.unit:character_damage() then
			local enemy_key = col_ray.unit:key()

			if not hit_enemies[enemy_key] or col_ray.unit:character_damage().is_head and col_ray.unit:character_damage():is_head(col_ray.body) then
				hit_enemies[enemy_key] = col_ray
			end

			if not col_ray.unit:character_damage().is_head then
				self._bullet_class:on_collision_effects(col_ray, self._unit, user_unit, damage)
			end
		else
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_wall

			if add_shoot_through_bullet then
				hit_objects[col_ray.unit:key()] = hit_objects[col_ray.unit:key()] or {}

				table.insert(hit_objects[col_ray.unit:key()], col_ray)
			else
				self._bullet_class:on_collision(col_ray, self._unit, user_unit, (self._bullet_class.id and self._bullet_class.id == "explosive" and damage / (self._rays or 1)) or damage)
			end
		end
	end

	local spread_x, spread_y = self:_get_spread(user_unit)
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()

	mvector3.set(mvec_direction, direction)

	for i = 1, shoot_through_data and 1 or self._rays do
		local r = math.random()
		local theta = math.random() * 360
		local ax = math.tan(r * spread_x * (spread_mul or 1)) * math.cos(theta)
		local ay = math.tan(r * spread_y * (spread_mul or 1)) * math.sin(theta) * -1

		mvector3.set(mvec_spread_direction, mvec_direction)
		mvector3.add(mvec_spread_direction, right * ax)
		mvector3.add(mvec_spread_direction, up * ay)
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, 20000)
		mvector3.add(mvec_to, from_pos)

		local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
		local col_ray = ray_from_unit or World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)

		if col_rays then
			if col_ray then
				table.insert(col_rays, col_ray)
			else
				local ray_to = mvector3.copy(mvec_to)
				local spread_direction = mvector3.copy(mvec_spread_direction)

				table.insert(col_rays, {
					position = ray_to,
					ray = spread_direction
				})
			end
		end

		if self._autoaim and autoaim then
			if col_ray and col_ray.unit:in_slot(managers.slot:get_mask("enemies")) then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)

				hit_enemy(col_ray)

				autoaim = false
			else
				autoaim = false
				local autohit = self:check_autoaim(from_pos, direction, self._range)

				if autohit then
					local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)

					if math.random() < autohit_chance then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)
						hit_something = true

						hit_enemy(autohit)
					else
						self._autohit_current = self._autohit_current / (1 + weight)
					end
				elseif col_ray then
					hit_something = true

					hit_enemy(col_ray)
				end
			end
		elseif col_ray then
			hit_something = true

			hit_enemy(col_ray)
		end
	end

	for _, col_rays in pairs(hit_objects) do
		local center_ray = col_rays[1]

		if #col_rays > 1 then
			mvector3.set_static(mvec_temp, center_ray)

			for _, col_ray in ipairs(col_rays) do
				mvector3.add(mvec_temp, col_ray.position)
			end

			mvector3.divide(mvec_temp, #col_rays)

			local closest_dist_sq = mvector3.distance_sq(mvec_temp, center_ray.position)
			local dist_sq = nil

			for _, col_ray in ipairs(col_rays) do
				dist_sq = mvector3.distance_sq(mvec_temp, col_ray.position)

				if dist_sq < closest_dist_sq then
					closest_dist_sq = dist_sq
					center_ray = col_ray
				end
			end
		end

		ShotgunBase.super._fire_raycast(self, user_unit, from_pos, center_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
	end

	local kill_data = {
		kills = 0,
		headshots = 0,
		civilian_kills = 0
	}

	for _, col_ray in pairs(hit_enemies) do
		local damage = self:get_damage_falloff(damage, col_ray, user_unit)

		if damage > 0 then
			local my_result = nil
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall

			if add_shoot_through_bullet then
				my_result = ShotgunBase.super._fire_raycast(self, user_unit, from_pos, col_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
			else
				my_result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end

			my_result = managers.mutators:modify_value("ShotgunBase:_fire_raycast", my_result)

			if my_result and my_result.type == "death" then
				managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)

				kill_data.kills = kill_data.kills + 1

				if col_ray.body and col_ray.body:name() == Idstring("head") then
					kill_data.headshots = kill_data.headshots + 1
				end

				if col_ray.unit and col_ray.unit:base() and (col_ray.unit:base()._tweak_table == "civilian" or col_ray.unit:base()._tweak_table == "civilian_female") then
					kill_data.civilian_kills = kill_data.civilian_kills + 1
				end
			end
		end
	end

	if dodge_enemies and self._suppression then
		for enemy_data, dis_error in pairs(dodge_enemies) do
			if not enemy_data.unit:movement():cool() then -- cannot suppress ppl who have no idea that there is combat
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
			end
		end
	end

	if not result then
		result = {
			hit_enemy = next(hit_enemies) and true or false
		}

		if self._alert_events then
			result.rays = #col_rays > 0 and col_rays
		end
	end

	if not shoot_through_data then
		managers.statistics:shot_fired({
			hit = false,
			weapon_unit = self._unit
		})
	end

	for _, d in pairs(hit_enemies) do
		managers.statistics:shot_fired({
			skip_bullet_count = true,
			hit = true,
			weapon_unit = self._unit
		})
	end

	for key, data in pairs(tweak_data.achievement.shotgun_single_shot_kills) do
		if data.headshot and data.count <= kill_data.headshots - kill_data.civilian_kills or data.count <= kill_data.kills - kill_data.civilian_kills then
			local should_award = true

			if data.blueprint then
				local missing_parts = false

				for _, part_or_parts in ipairs(data.blueprint) do
					if type(part_or_parts) == "string" then
						if not table.contains(self._blueprint or {}, part_or_parts) then
							missing_parts = true

							break
						end
					else
						local found_part = false

						for _, part in ipairs(part_or_parts) do
							if table.contains(self._blueprint or {}, part) then
								found_part = true

								break
							end
						end

						if not found_part then
							missing_parts = true

							break
						end
					end
				end

				if missing_parts then
					should_award = false
				end
			end

			if should_award then
				managers.achievment:_award_achievement(data, key)
			end
		end
	end

	return result
end

--Stops Hx25 from working with this skill.
function ShotgunBase:run_and_shoot_allowed()
	local allowed = ShotgunBase.super.run_and_shoot_allowed(self)

	return allowed or managers.player:has_category_upgrade("shotgun", "hip_run_and_shoot") and self._is_real_shotgun
end

function ShotgunBase:fire_rate_multiplier()
	local multiplier = self._fire_rate_multiplier or 1
	multiplier = multiplier * (self:weapon_tweak_data().fire_rate_multiplier or 1)
	if managers.player:has_activate_temporary_upgrade("temporary", "headshot_fire_rate_mult") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "headshot_fire_rate_mult", 1)
	end
	--Took hipfire RoF bonus from OVK, and true to their name, it looks to be a bit overkill on the sanity checks, but w/e
	local user_unit = self._setup and self._setup.user_unit --I'd like to know an instance where you can even shoot at all without there being a user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	if current_state and not current_state:in_steelsight() then
		multiplier = multiplier * managers.player:upgrade_value("shotgun", "hip_rate_of_fire", 1)
	end
	if self:in_burst_mode() or self._macno then
		local no_burst_mult = multiplier
		multiplier = multiplier * (self._burst_fire_rate_multiplier or 1)
		if self._macno or (self._burst_rounds_remaining and self._burst_rounds_remaining < 1) and not self:weapon_tweak_data().BURST_SLAM then
			local fire_rate = self:weapon_tweak_data().fire_mode_data and self:weapon_tweak_data().fire_mode_data.fire_rate
			local delay = self._burst_delay --and self._burst_delay / (fire_rate / multiplier)
			local next_fire = self._macno and self._i_know or ((delay or fire_rate or 0) / no_burst_mult)
			local current_state_name = managers.player:current_state()
			local og_next_fire = current_state_name and current_state_name == "tased" and self._next_fire_allowed
			self._next_fire_allowed = og_next_fire or (math.max(self._next_fire_allowed, self._unit:timer():time() + next_fire))
			self._macno = nil
			self._fire_rate_init_cancel = nil
			multiplier = self:weapon_tweak_data().fire_rate_multiplier or 1
		end
	end	

	local init_mult = self._fire_rate_init_mult
	if self._fire_rate_init_count and self:fire_mode() ~= "single" and not self:in_burst_mode() then
		if (self._fire_rate_init_count > self._shots_fired) then
			self._fire_rate_init_progress = true
			if self._fire_rate_init_ramp_up then
				local init_ramp_up_add = (1 - self._fire_rate_init_mult ) / self._fire_rate_init_count  * self._shots_fired + init_mult
				init_mult =  init_ramp_up_add
			end
			multiplier = multiplier * init_mult
		elseif (self._fire_rate_init_count < self._shots_fired) then
			self._fire_rate_init_progress = nil
		end
	end

	return multiplier
end