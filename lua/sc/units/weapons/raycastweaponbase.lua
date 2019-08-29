if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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
				elseif hit.unit:in_slot(shield_mask) and hit.unit:name():key() == 'af254947f0288a6c' and not self._can_shoot_through_titan_shield  then
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

	local mvec_to = Vector3()
	local mvec_spread_direction = Vector3()

	function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
		if self:gadget_overrides_weapon_functions() then
			return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
		end
		local result = {}
		local spread_x, spread_y = self:_get_spread(user_unit)
		local ray_distance = self:weapon_range()
		local right = direction:cross(Vector3(0, 0, 1)):normalized()
		local up = direction:cross(right):normalized()
		local r = math.pow(math.random(), tweak_data.weapon.spread.dispersion)
		local theta = math.random() * 360
		local ax = math.tan(r * spread_x * (spread_mul or 1)) * math.cos(theta)
		local ay = math.tan(r * spread_y * (spread_mul or 1)) * math.sin(theta) * -1

		mvector3.set(mvec_spread_direction, direction)
		mvector3.add(mvec_spread_direction, right * ax)
		mvector3.add(mvec_spread_direction, up * ay)
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, ray_distance)
		mvector3.add(mvec_to, from_pos)

		local damage = self:_get_current_damage(dmg_mul)
		local ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to)
		local hit_anyone = false
		local auto_hit_candidate, suppression_enemies = self:check_autoaim(from_pos, direction)

		if suppression_enemies and self._suppression then
			result.enemies_in_cone = suppression_enemies
		end

		if self._autoaim then
			local weight = 0.1

			if auto_hit_candidate and not hit_enemy then
				local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)

				if autohit_mul then
					autohit_chance = autohit_chance * autohit_mul
				end

				if math.random() < autohit_chance then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)

					mvector3.set(mvec_to, from_pos)
					mvector3.add_scaled(mvec_to, auto_hit_candidate.ray, ray_distance)

					ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to)
				end
			end

			if hit_enemy then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			elseif auto_hit_candidate then
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		end

		local hit_count = 0
		local cop_kill_count = 0
		local hit_through_wall = false
		local hit_through_shield = false
		local hit_result = nil

		for _, hit in ipairs(ray_hits) do
			damage = self:get_damage_falloff(damage, hit, user_unit)
			hit_result = self._bullet_class:on_collision(hit, self._unit, user_unit, damage)

			if hit_result and hit_result.type == "death" then
				local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
				local is_civilian = unit_type and CopDamage.is_civilian(unit_type)

				if not is_civilian then
					cop_kill_count = cop_kill_count + 1
				end

				if self:is_category(tweak_data.achievement.easy_as_breathing.weapon_type) and not is_civilian then
					self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1

					if tweak_data.achievement.easy_as_breathing.count <= self._kills_without_releasing_trigger then
						managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
					end
				end
			end

			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1
			end

			if hit.unit:in_slot(managers.slot:get_mask("world_geometry")) then
				hit_through_wall = true
			elseif hit.unit:in_slot(managers.slot:get_mask("enemy_shield_check")) then
				hit_through_shield = hit_through_shield or alive(hit.unit:parent())
			end

			if hit_result and hit_result.type == "death" and cop_kill_count > 0 then
				local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
				local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass = nil

				for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
					multi_kill = not achievement_data.multi_kill or cop_kill_count == achievement_data.multi_kill
					enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
					obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and hit_through_wall or achievement_data.obstacle == "shield" and hit_through_shield
					weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
					weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
					weapon_type_pass = not achievement_data.weapon_type or self:is_category(achievement_data.weapon_type)

					if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass and weapon_type_pass then
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						elseif achievement_data.award then
							managers.achievment:award(achievement_data.award)
						elseif achievement_data.challenge_stat then
							managers.challenge:award_progress(achievement_data.challenge_stat)
						elseif achievement_data.trophy_stat then
							managers.custom_safehouse:award(achievement_data.trophy_stat)
						elseif achievement_data.challenge_award then
							managers.challenge:award(achievement_data.challenge_award)
						end
					end
				end
			end
		end

		if not tweak_data.achievement.tango_4.difficulty or table.contains(tweak_data.achievement.tango_4.difficulty, Global.game_settings.difficulty) then
			if self._gadgets and table.contains(self._gadgets, "wpn_fps_upg_o_45rds") and cop_kill_count > 0 and managers.player:player_unit():movement():current_state():in_steelsight() then
				if self._tango_4_data then
					if self._gadget_on == self._tango_4_data.last_gadget_state then
						self._tango_4_data = nil
					else
						self._tango_4_data.last_gadget_state = self._gadget_on
						self._tango_4_data.count = self._tango_4_data.count + 1
					end

					if self._tango_4_data and tweak_data.achievement.tango_4.count <= self._tango_4_data.count then
						managers.achievment:_award_achievement(tweak_data.achievement.tango_4, "tango_4")
					end
				else
					self._tango_4_data = {
						count = 1,
						last_gadget_state = self._gadget_on
					}
				end
			elseif self._tango_4_data then
				self._tango_4_data = nil
			end
		end

		result.hit_enemy = hit_anyone

		if self._autoaim then
			self._shot_fired_stats_table.hit = hit_anyone
			self._shot_fired_stats_table.hit_count = hit_count

			if (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
				managers.statistics:shot_fired(self._shot_fired_stats_table)
			end
		end

		local furthest_hit = ray_hits[#ray_hits]

		if (furthest_hit and furthest_hit.distance > 600 or not furthest_hit) and alive(self._obj_fire) then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)

			local trail = World:effect_manager():spawn(self._trail_effect_table)

			if furthest_hit then
				World:effect_manager():set_remaining_lifetime(trail, math.clamp((furthest_hit.distance - 600) / 10000, 0, furthest_hit.distance))
			end
		end

		if self._alert_events then
			result.rays = ray_hits
		end

		return result
	end
	
end