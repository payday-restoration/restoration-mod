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

function FlameBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets")
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

function InstantBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound, already_ricocheted)
	if Network:is_client() and not blank and user_unit ~= managers.player:player_unit() then
		blank = true
	end

	local hit_unit = col_ray.unit
	local is_shield = hit_unit:in_slot(managers.slot:get_mask("enemy_shield_check")) and alive(hit_unit:parent())

	if alive(weapon_unit) and is_shield and weapon_unit:base()._shield_knock then
		local enemy_unit = hit_unit:parent()

		if enemy_unit:character_damage() and enemy_unit:character_damage().dead and not enemy_unit:character_damage():dead() then
			if enemy_unit:base():char_tweak() then
				if enemy_unit:base():char_tweak().damage.shield_knocked and not enemy_unit:character_damage():is_immune_to_shield_knockback() then
					local knock_chance = math.sqrt(0.03 * damage) --Makes a nice curve.

					if knock_chance < math.random() then
						local damage_info = {
							damage = 0,
							type = "shield_knock",
							variant = "melee",
							col_ray = col_ray,
							result = {
								variant = "melee",
								type = "shield_knock"
							}
						}

						enemy_unit:character_damage():_call_listeners(damage_info)
					end
				end
			end
		end
	end

	local play_impact_flesh = not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood

	if hit_unit:damage() and managers.network:session() and col_ray.body:extension() and col_ray.body:extension().damage then
		local damage_body_extension = true
		local character_unit = nil

		if hit_unit:character_damage() then
			character_unit = hit_unit
		elseif is_shield and hit_unit:parent():character_damage() then
			character_unit = hit_unit:parent()
		end

		if character_unit and character_unit:character_damage().is_friendly_fire and character_unit:character_damage():is_friendly_fire(user_unit) then
			damage_body_extension = false
		end

		--do a friendly fire check if the unit hit is a character or a character's shield before damaging the body extension that was hit
		if damage_body_extension then
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			damage = network_damage / 163.84

			if sync_damage then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				col_ray.body:extension().damage:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
				col_ray.body:extension().damage:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, damage)

				if alive(weapon_unit) and weapon_unit:base().categories and weapon_unit:base():categories() then
					for _, category in ipairs(weapon_unit:base():categories()) do
						col_ray.body:extension().damage:damage_bullet_type(category, user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					end
				end
			end
		end
	end

	local result = nil

	if alive(weapon_unit) and hit_unit:character_damage() and hit_unit:character_damage().damage_bullet then
		local is_alive = not hit_unit:character_damage():dead()

		if not blank then
			local knock_down = weapon_unit:base()._knock_down and weapon_unit:base()._knock_down > 0 and math.random() < weapon_unit:base()._knock_down

			result = self:give_impact_damage(col_ray, weapon_unit, user_unit, damage, weapon_unit:base()._use_armor_piercing, false, knock_down, weapon_unit:base()._stagger, weapon_unit:base()._variant)
		end

		local is_dead = hit_unit:character_damage():dead()

		if not is_dead then
			if not result or result == "friendly_fire" then
				play_impact_flesh = false
			end
		end

		local push_multiplier = self:_get_character_push_multiplier(weapon_unit, is_alive and is_dead)

		managers.game_play_central:physics_push(col_ray, push_multiplier)
	else
		managers.game_play_central:physics_push(col_ray)
	end

	if play_impact_flesh then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end

	return result
end

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

--Original mod by 90e, uploaded by DarKobalt.
--Reverb fixed by Doctor Mister Cool, aka Didn'tMeltCables, aka DinoMegaCool
--New version uploaded and maintained by Offyerrocker.
--Totally not stolen for resmod 

local afsf_blacklist = {
	["saw"] = true,
	["saw_secondary"] = true,
	["flamethrower_mk2"] = true,
	["m134"] = true,
	["mg42"] = true,
	["shuno"] = true,
	["system"] = true
}

function RaycastWeaponBase:_soundfix_should_play_normal()
	local name_id = self:get_name_id() or "xX69dank420blazermachineXx" 
	if not self._setup.user_unit == managers.player:player_unit() then
		return true
	elseif afsf_blacklist[name_id] then
		return true
	elseif not tweak_data.weapon[name_id].sounds.fire_single then
		return true
	end
	
end

local orig_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound(...)
	if self:_soundfix_should_play_normal() then
		orig_fire_sound(self,...)
	end
end

local orig_fire = RaycastWeaponBase.fire
function RaycastWeaponBase:fire(...)
	local result = orig_fire(self, ...)
	if self:_soundfix_should_play_normal() then
		return result
	end

	if result and self._setup.user_unit == managers.player:player_unit() then
		self:play_tweak_data_sound("fire_single","fire")
		self:play_tweak_data_sound("stop_fire")
	end
	
	return result
end

local orig_stop_shooting = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting(...)
	if self:_soundfix_should_play_normal() then
		orig_stop_shooting(self,...)
	end
end