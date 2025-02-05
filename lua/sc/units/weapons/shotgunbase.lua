local ids_single = Idstring("single")
local ids_auto = Idstring("auto")
local ids_burst = Idstring("burst")
local ids_volley = Idstring("volley")
local mvec3_add = mvector3.add
local mvec3_cpy = mvector3.copy
local mvec3_cross = mvector3.cross
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_set = mvector3.set
local math_cos = math.cos
local math_rad = math.rad
local math_random = math.random
local math_sin = math.sin

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
local mvec_right = Vector3()
local mvec_up = Vector3()
local mvec_ax = Vector3()
local mvec_ay = Vector3()

function ShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	end

	self._volley_recoil_mul = nil
	if self._fire_mode == ids_volley then
		local ammo_usage_ratio = math.clamp(ammo_usage > 0 and ammo_usage / (self._volley_ammo_usage or ammo_usage) or 1, 0, 1)
		local rays = math.ceil(ammo_usage_ratio * (self._volley_rays or 1))
		spread_mul = spread_mul * (self._volley_spread_mul or 1)
		dmg_mul = dmg_mul * (self._volley_damage_mul or 1)
		self._volley_recoil_mul = rays or 1
		local result = {
			rays = {}
		}

		for i = 1, rays do
			local raycast_res = ShotgunBase.super.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

			if raycast_res.enemies_in_cone then
				result.enemies_in_cone = result.enemies_in_cone or {}

				table.map_append(result.enemies_in_cone, raycast_res.enemies_in_cone)
			end

			result.hit_enemy = result.hit_enemy or raycast_res.hit_enemy

			table.list_append(result.rays, raycast_res.rays or {})
		end

		managers.statistics:shot_fired({
			hit = result and result.hit_enemy,
			weapon_unit = self._unit
		})
		
		return result
	elseif self:weapon_tweak_data().alt_shotgunraycast then
			local rays = self._rays or 1
			dmg_mul = dmg_mul / rays
			local result = {
				rays = {}
			}
	
			for i = 1, rays do
				local raycast_res = ShotgunBase.super.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	
				if raycast_res.enemies_in_cone then
					result.enemies_in_cone = result.enemies_in_cone or {}
	
					table.map_append(result.enemies_in_cone, raycast_res.enemies_in_cone)
				end
	
				result.hit_enemy = result.hit_enemy or raycast_res.hit_enemy
	
				table.list_append(result.rays, raycast_res.rays or {})
			end

			managers.statistics:shot_fired({
				hit = result and result.hit_enemy,
				weapon_unit = self._unit
			})

			return result
	elseif self:weapon_tweak_data().use_newraycast_fire then
		return ShotgunBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	end
	
	local result = {}
	local all_hits = {}
	local hit_effects = {}
	local all_enemies_hit = {}
	local alert_rays = self._alert_events and {}
	local all_hits_lookup = {}
	local alert_rays_lookup = alert_rays and {}

	local function on_hit(ray_hits)
		for _, hit in ipairs(ray_hits) do
			local unit_key = hit.unit:key()
			local char_dmg_ext = hit.unit:character_damage()

			if not char_dmg_ext then
				if not hit.unit:in_slot(self.shield_mask) then
					all_hits[#all_hits + 1] = hit

					if alert_rays then
						alert_rays[#alert_rays + 1] = hit
					end
				elseif not all_hits_lookup[unit_key] then
					all_hits_lookup[unit_key] = #all_hits + 1
					all_hits[#all_hits + 1] = hit

					if alert_rays then
						alert_rays_lookup[unit_key] = #alert_rays + 1
						alert_rays[#alert_rays + 1] = hit
					end
				else
					local base_ext = hit.unit:base()

					if base_ext and base_ext.chk_body_hit_priority and base_ext:chk_body_hit_priority(all_hits[all_hits_lookup[unit_key]].body, hit.body) then
						hit_effects[#hit_effects + 1] = all_hits[all_hits_lookup[unit_key]]
						all_hits[all_hits_lookup[unit_key]] = hit

						if alert_rays then
							alert_rays[alert_rays_lookup[unit_key]] = hit
						end
					else
						hit_effects[#hit_effects + 1] = hit
					end
				end
			elseif not all_hits_lookup[unit_key] then
				all_hits_lookup[unit_key] = #all_hits + 1
				all_hits[#all_hits + 1] = hit

				if alert_rays then
					alert_rays_lookup[unit_key] = #alert_rays + 1
					alert_rays[#alert_rays + 1] = hit
				end
			elseif char_dmg_ext.chk_body_hit_priority and char_dmg_ext:chk_body_hit_priority(all_hits[all_hits_lookup[unit_key]].body, hit.body) then
				if not char_dmg_ext.is_head then
					hit_effects[#hit_effects + 1] = all_hits[all_hits_lookup[unit_key]]
				end

				all_hits[all_hits_lookup[unit_key]] = hit

				if alert_rays then
					alert_rays[alert_rays_lookup[unit_key]] = hit
				end
			elseif not char_dmg_ext.is_head then
				hit_effects[#hit_effects + 1] = hit
			end
		end
	end

	local ray_distance = self:weapon_range(user_unit)
	local can_autoaim = self._autoaim and self._autohit_data and true or false
	local spread_x, spread_y = self:_get_spread(user_unit)
	spread_y = spread_y or spread_x

	spread_mul = spread_mul or 1

	mvec3_cross(mvec_right, direction, math.UP)
	mvec3_norm(mvec_right)
	mvec3_cross(mvec_up, direction, mvec_right)
	mvec3_norm(mvec_up)

	for i = 1, self._rays do
		mvec3_set(mvec_ax, mvec_right)
		mvec3_set(mvec_ay, mvec_up)
		mvec3_set(mvec_spread_direction, direction)

		local r = math_random()
		local theta = math_random() * 360
		spread_x = math_max(math_min(spread_x * spread_mul, 90), -90)
		spread_y = math_max(math_min(spread_y * spread_mul, 90), -90)

		mvec3_mul(mvec_ax, math_cos(theta) * math_tan(r * spread_x))
		mvec3_mul(mvec_ay, math_sin(theta) * math_tan(r * spread_y))
		mvec3_add(mvec_spread_direction, mvec_ax)
		mvec3_add(mvec_spread_direction, mvec_ay)
		mvec3_set(mvec_to, mvec_spread_direction)
		mvec3_mul(mvec_to, ray_distance)
		mvec3_add(mvec_to, from_pos)

		local ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)
		if can_autoaim then
			can_autoaim = false
			local weight = 0.1

			if hit_enemy then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			else
				local auto_hit_candidate, enemies_to_suppress = self:check_autoaim(from_pos, direction, nil, nil, nil, true)
				result.enemies_in_cone = enemies_to_suppress or false

				if auto_hit_candidate then
					local autohit_chance = self:get_current_autohit_chance_for_roll()

					if autohit_mul then
						autohit_chance = autohit_chance * autohit_mul
					end

					if math_random() < autohit_chance then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)

						mvec3_set(mvec_spread_direction, auto_hit_candidate.ray)
						mvec3_set(mvec_to, mvec_spread_direction)
						mvec3_mul(mvec_to, ray_distance)
						mvec3_add(mvec_to, from_pos)

						ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)
					end
				end

				if hit_enemy then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)
				elseif auto_hit_candidate then
					self._autohit_current = self._autohit_current / (1 + weight)
				end
			end
		end

		if hit_enemy then
			for u_key, enemy in pairs(enemies_hit) do
				all_enemies_hit[u_key] = enemy
			end
		end

		if ray_hits and next(ray_hits) then
			on_hit(ray_hits)

			result.hit_enemy = result.hit_enemy or ray_hits[#ray_hits].unit:character_damage() and true or false
		end
	end

	local function sort_f(a, b)
		return a.distance < b.distance
	end

	table.sort(all_hits, sort_f)
	table.sort(hit_effects, sort_f)

	if alert_rays then
		table.sort(alert_rays, sort_f)
	end

	local hit_count = 0
	local hit_anyone = false
	local cop_kill_count = 0
	local kill_data = {
		kills = 0,
		headshots = 0,
		civilian_kills = 0
	}
	local bullet_class = self:bullet_class()
	local damage = self:_get_current_damage(dmg_mul)
	local check_additional_achievements = self._ammo_data and self._ammo_data.check_additional_achievements

	for _, hit in ipairs(hit_effects) do
		bullet_class:on_collision_effects(hit, self._unit, user_unit, damage)
	end

	local hit_through_wall = false
	local hit_through_shield = false
	local is_civ_f = CopDamage.is_civilian

	for _, hit in ipairs(all_hits) do
		local dmg = self:get_damage_falloff(damage, hit, user_unit)

		if dmg > 0 then
			local hit_result = bullet_class:on_collision(hit, self._unit, user_unit, dmg)
			hit_result = managers.mutators:modify_value("ShotgunBase:_fire_raycast", hit_result)

			if check_additional_achievements then
				hit_through_wall = hit_through_wall or hit.unit:in_slot(self.wall_mask)
				hit_through_shield = hit_through_shield or hit.unit:in_slot(self.shield_mask) and alive(hit.unit:parent())
			end

			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1

				if hit_result.type == "death" then
					kill_data.kills = kill_data.kills + 1
					local unit_base = hit.unit:base()
					local unit_type = unit_base and unit_base._tweak_table
					local is_civilian = unit_type and is_civ_f(unit_type)

					if is_civilian then
						kill_data.civilian_kills = kill_data.civilian_kills + 1
					else
						cop_kill_count = cop_kill_count + 1
					end

					if check_additional_achievements then
						self:_check_kill_achievements(cop_kill_count, unit_base, unit_type, is_civilian, hit_through_wall, hit_through_shield)
					end
				end
			end
		end
	end

	if check_additional_achievements then
		self:_check_tango_achievements(cop_kill_count)
	end

	self:_check_one_shot_shotgun_achievements(kill_data)

	if result.enemies_in_cone == nil then
		result.enemies_in_cone = self._suppression and self:check_suppression(from_pos, direction, all_enemies_hit) or nil
	elseif all_enemies_hit and self._suppression then
		result.enemies_in_cone = result.enemies_in_cone or {}
		local all_enemies = managers.enemy:all_enemies()

		for u_key, enemy in pairs(all_enemies_hit) do
			if all_enemies[u_key] then
				result.enemies_in_cone[u_key] = {
					error_mul = 1,
					unit = enemy
				}
			end
		end
	end

	if alert_rays then
		result.rays = alert_rays
	end

	if self._autoaim then
		self._shot_fired_stats_table.hit = hit_anyone
		self._shot_fired_stats_table.hit_count = hit_count

		if not self._ammo_data or not self._ammo_data.ignore_statistic then
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	end

	return result
end

--Stops Hx25 from working with this skill.
function ShotgunBase:run_and_shoot_allowed()
	local allowed = ShotgunBase.super.run_and_shoot_allowed(self)

	return allowed or managers.player:has_category_upgrade("shotgun", "hip_run_and_shoot") and self._is_real_shotgun
end

function ShotgunBase:fire_rate_multiplier( ignore_anims )
	local multiplier = self._fire_rate_multiplier or 1
	multiplier = multiplier * (self:weapon_tweak_data().fire_rate_multiplier or 1)
	if managers.player:has_activate_temporary_upgrade("temporary", "headshot_fire_rate_mult") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "headshot_fire_rate_mult", 1)
	end
	if self._rof_mult and ignore_anims then
		return multiplier / self._rof_mult
	end
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
	
	if self._alt_fire_active then
		multiplier = multiplier * self._alt_rof_mult
	end
	
	if self:can_toggle_firemode() and self:fire_mode() == "single" and not self:in_burst_mode() then
		multiplier = multiplier * 0.85
	end


	return multiplier
end