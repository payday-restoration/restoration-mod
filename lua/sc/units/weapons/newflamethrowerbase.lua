function NewFlamethrowerBase:setup_default()
	self:kill_effects()

	local unit = self._unit
	local nozzle_obj = unit:get_object(Idstring("fire"))
	self._nozzle_obj = nozzle_obj
	local name_id = self._name_id
	local weap_tweak = tweak_data.weapon[name_id]
	local flame_effect_range = weap_tweak.flame_max_range
	self._damage_near = tweak_data.weapon[self._name_id].damage_near
	self._damage_far = tweak_data.weapon[self._name_id].damage_far
	self._rays = tweak_data.weapon[self._name_id].rays or 9	
	self._range = flame_effect_range
	self._flame_max_range = flame_effect_range
	self._flame_radius = weap_tweak.flame_radius or 40
	local flame_effect = weap_tweak.flame_effect
	self._bullet_class = FlameBulletBase
	
	if flame_effect then
		self._last_effect_t = -100
		self._flame_effect_collection = {}
		self._flame_effect_ids = Idstring(flame_effect)
		self._flame_max_range_sq = flame_effect_range * flame_effect_range
		local effect_duration = weap_tweak.single_flame_effect_duration
		self._single_flame_effect_duration = effect_duration
		self._single_flame_effect_cooldown = effect_duration * 0.1
	else
		self._last_effect_t = nil
		self._flame_effect_collection = nil
		self._flame_effect_ids = nil
		self._flame_max_range_sq = nil
		self._single_flame_effect_duration = nil
		self._single_flame_effect_cooldown = nil

		print("[NewFlamethrowerBase:setup_default] No flame effect defined for tweak data ID ", name_id)
	end

	local effect_manager = self._effect_manager
	local pilot_effect = weap_tweak.pilot_effect

	if pilot_effect then
		local parent_obj = nil
		local parent_name = weap_tweak.pilot_parent_name

		if parent_name then
			parent_obj = unit:get_object(Idstring(parent_name))

			if not parent_obj then
				print("[NewFlamethrowerBase:setup_default] No pilot parent object found with name ", parent_name, "in unit ", unit)
			end
		end

		parent_obj = parent_obj or nozzle_obj
		local force_synch = self.is_npc and not self:is_npc()
		local pilot_offset = weap_tweak.pilot_offset or nil
		local normal = weap_tweak.pilot_normal or Vector3(0, 0, 1)
		local pilot_effect_id = effect_manager:spawn({
			effect = Idstring(pilot_effect),
			parent = parent_obj,
			force_synch = force_synch,
			position = pilot_offset,
			normal = normal
		})
		self._pilot_effect = pilot_effect_id
		local state = (not self._enabled or not self._visible) and true or false

		effect_manager:set_hidden(pilot_effect_id, state)
		effect_manager:set_frozen(pilot_effect_id, state)
	else
		self._pilot_effect = nil
	end

	local nozzle_effect = weap_tweak.nozzle_effect

	if nozzle_effect then
		self._last_fire_t = -100
		self._nozzle_expire_t = weap_tweak.nozzle_expire_time or 0.2
		local force_synch = self.is_npc and not self:is_npc()
		local normal = weap_tweak.nozzle_normal or Vector3(0, 1, 0)
		local nozzle_effect_id = effect_manager:spawn({
			effect = Idstring(nozzle_effect),
			parent = nozzle_obj,
			force_synch = force_synch,
			normal = normal
		})
		self._nozzle_effect = nozzle_effect_id

		effect_manager:set_hidden(nozzle_effect_id, true)
		effect_manager:set_frozen(nozzle_effect_id, true)

		self._showing_nozzle_effect = false
	else
		self._last_fire_t = nil
		self._nozzle_expire_t = nil
		self._nozzle_effect = nil
		self._showing_nozzle_effect = nil
	end

	if Global.game_settings and Global.game_settings.one_down then
		self._bullet_slotmask = self._bullet_slotmask + 3
	else
		self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:setup:weapon_slot_mask", self._bullet_slotmask)
		self._bullet_slotmask = managers.modifiers:modify_value("RaycastWeaponBase:setup:weapon_slot_mask", self._bullet_slotmask)
	end
end

function NewFlamethrowerBase:run_and_shoot_allowed()
	local allowed = NewFlamethrowerBase.super.run_and_shoot_allowed(self)
	return allowed or managers.player:has_category_upgrade("shotgun", "hip_run_and_shoot")
end

function NewFlamethrowerBase:_update_stats_values()
	NewFlamethrowerBase.super._update_stats_values(self)

	--Set range multipliers.
	self._damage_near_mul = 1
	self._damage_far_mul = 1
	local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
	for part_id, stats in pairs(custom_stats) do
		if stats.damage_near_mul then
			self._damage_near_mul = self._damage_near_mul * stats.damage_near_mul
		end
		if stats.damage_far_mul then
			self._damage_far_mul = self._damage_far_mul * stats.damage_far_mul
		end
	end

	--Effect range, set to longest possible falloff distance.
	self._range = tweak_data.weapon.stat_info.damage_falloff.max * self._damage_far_mul
end

function NewFlamethrowerBase:get_damage_falloff(damage, col_ray, user_unit)
	if managers.player:has_category_upgrade("player", "headshot_no_falloff") and self:is_single_shot() and self:is_category("assault_rifle", "snp") and col_ray and col_ray.unit and col_ray.unit:character_damage() and col_ray.unit:character_damage()._ids_head_body_name and col_ray.body and col_ray.body:name() and col_ray.body:name() == col_ray.unit:character_damage()._ids_head_body_name then
		
	end
	if self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase") then
		return damage
	end
	--Initialize base info.
	local distance = col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
	local current_state = user_unit:movement()._current_state
	local damage_falloff = self:weapon_tweak_data().damage_falloff
	local falloff_start = damage_falloff and damage_falloff.start_dist or 3000
	local falloff_end = damage_falloff and damage_falloff.end_dist or 6000
	
	--[[
	log("falloff_start : " .. tostring( falloff_start /100 ))
	log("falloff_end : " .. tostring( falloff_end /100 ))
	
	
	log("falloff_start_mult : " .. tostring( self._damage_near_mul ))
	log("falloff_end_mult : " .. tostring( self._damage_far_mul ))
	--]]
	
	if current_state then
		--Get ADS multiplier.
		if current_state:in_steelsight() then
			for _, category in ipairs(self:categories()) do
				falloff_start = falloff_start * managers.player:upgrade_value(category, "steelsight_range_inc", 1)
				falloff_end = falloff_end * managers.player:upgrade_value(category, "steelsight_range_inc", 1)
			end
		end
	end
	--Apply global range multipliers.
	falloff_start = falloff_start * (1 + 1 - managers.player:get_property("desperado", 1))
	falloff_end = falloff_end * (1 + 1 - managers.player:get_property("desperado", 1))
	
	--[[
	log("falloff_start AFTER MULTS : " .. tostring( (falloff_start * self._damage_near_mul) / 100 ))
	log("falloff_end AFTER MULTS: " .. tostring( (falloff_end * self._damage_far_mul )/ 100))
	--]]
	
	falloff_start = falloff_start * self._damage_near_mul
	falloff_end = falloff_end * self._damage_far_mul
	
	--Cache falloff values for usage in hitmarkers.
	self.near_falloff_distance = falloff_start
	self.far_falloff_distance = falloff_end
	
	--Minimum damage multiplier when taking falloff into account
	local minimum_damage = damage_falloff and damage_falloff.min_mult or 0.3
	
	--[[
	log("DAMAGE: " .. tostring( damage * 10 ))
	log("DAMAGE MIN: " .. tostring( damage * minimum_damage * 10 ))
	log("HIT AT: " .. tostring( distance / 100 ) .. " METERS")
	log("DAMAGE DONE: " .. tostring( (math.max((1 - math.min(1, math.max(0, distance - falloff_start) / (falloff_end - falloff_start))) * damage, minimum_damage * damage)) * 10 ) .. "\n\n")
	--]]
	
	--Compute final damage.
	return math.lerp(damage, minimum_damage * damage, math.min(1, math.max(0, distance - falloff_start) / (falloff_end - falloff_start)))
end

local mvec_temp = Vector3()
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()
function NewFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result
	local hit_enemies = {}
	local hit_objects = {}
	local hit_something, col_rays
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
		else
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_wall
			if add_shoot_through_bullet then
				hit_objects[col_ray.unit:key()] = hit_objects[col_ray.unit:key()] or {}
				table.insert(hit_objects[col_ray.unit:key()], col_ray)
			else
				self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
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
		mvector3.multiply(mvec_to, 1400)
		mvector3.add(mvec_to, from_pos)
		local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
		local col_ray = ray_from_unit or World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
		if col_rays then
			if col_ray then
				table.insert(col_rays, col_ray)
			else
				local ray_to = mvector3.copy(mvec_to)
				local spread_direction = mvector3.copy(mvec_spread_direction)
				table.insert(col_rays, {position = ray_to, ray = spread_direction})
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
					if autohit_chance > math.random() then
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
			local dist_sq
			for _, col_ray in ipairs(col_rays) do
				dist_sq = mvector3.distance_sq(mvec_temp, col_ray.position)
				if closest_dist_sq > dist_sq then
					closest_dist_sq = dist_sq
					center_ray = col_ray
				end
			end
		end
		NewFlamethrowerBase.super._fire_raycast(self, user_unit, from_pos, center_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
	end
	for _, col_ray in pairs(hit_enemies) do
		local damage = self:get_damage_falloff(damage, col_ray, user_unit)
		if damage > 0 then
			local my_result
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall
			if add_shoot_through_bullet then
				my_result = NewFlamethrowerBase.super._fire_raycast(self, user_unit, from_pos, col_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data)
			else
				my_result = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
			if my_result and my_result.type == "death" then
				--managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance)
			end
		end
	end
	if dodge_enemies and self._suppression then
		for enemy_data, dis_error in pairs(dodge_enemies) do
			enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
		end
	end
	if not result then
		result = {}
		result.hit_enemy = next(hit_enemies) and true or false
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
	for _, _ in pairs(hit_enemies) do
		managers.statistics:shot_fired({
			hit = true,
			weapon_unit = self._unit,
			skip_bullet_count = true
		})
	end
	
	self:_spawn_flame_effect(mvec_to, direction)
	
	return result
end