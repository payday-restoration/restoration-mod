local init_original = RaycastWeaponBase.init
local setup_original = RaycastWeaponBase.setup

function RaycastWeaponBase:init(...)
	init_original(self, ...)
	
	self._shoot_through_data = {
		kills = 0,
		from = Vector3()
	}
	
	--self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)

	if Global.game_settings and Global.game_settings.one_down then
		self._bullet_slotmask = self._bullet_slotmask + 3
	else
		self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:setup:weapon_slot_mask", self._bullet_slotmask)
		self._bullet_slotmask = managers.modifiers:modify_value("RaycastWeaponBase:setup:weapon_slot_mask", self._bullet_slotmask)
	end
end

function RaycastWeaponBase:setup(...)
	setup_original(self, ...)
	--self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)

	--Use stability stat to get the moving accuracy penalty.
	if self._current_stats_indices and self._current_stats_indices.recoil then
		self._spread_moving = tweak_data.weapon.stats.spread_moving[self._current_stats_indices.recoil] or 0
	else --Fallback method for getting stability moving accuracy penalty, in case the indices somehow don't get set.
		local moving_spread_index = 0
		local recoil_table = tweak_data.weapon.stats.recoil
		for i = 0, 25, 1 do
			if recoil_table[i] == self._recoil then
				moving_spread_index = i
				break
			end
		end
		self._spread_moving = tweak_data.weapon.stats.spread_moving[moving_spread_index] or 0
	end

	self._bullets_until_free = nil
	for _, category in ipairs(self:weapon_tweak_data().categories) do
		if managers.player:has_category_upgrade(category, "full_auto_free_ammo") then
			self._bullets_until_free = managers.player:upgrade_value(category, "full_auto_free_ammo")
			break
		end
	end
	self._shots_without_releasing_trigger = 0

	self._ammo_overflow = 0 --Amount of non-integer ammo picked up.
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
					if weapon_unit:base()._is_team_ai then
						knock_chance = knock_chance * 0.25 --Bots have reduced knock chances. Usually hovers around 10%, weapons like the Thanatos cap around 25%.
					end

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
			--Knock down skill now checks for whether or not a bipod is active.
			local knock_down = weapon_unit:base()._knock_down and managers.player._current_state == "bipod" and weapon_unit:base()._knock_down > 0 and math.random() < weapon_unit:base()._knock_down
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

--Refactored from vanilla code for consistency and simplicity.
function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
	local _add_ammo = function(ammo_base, ratio, add_amount_override)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return false, 0
		end

		local ammo_gained_raw = add_amount_override or math.lerp(ammo_base._ammo_pickup[1], ammo_base._ammo_pickup[2], math.random()) * (ratio or 1) + self._ammo_overflow
		if ammo_gained_raw <= 0 then --Handle weapons with 0 pickup.
			return false, 0
		end

		local ammo_gained = math.max(0, math.floor(ammo_gained_raw))

		--Apply akimbo rounding.
		if self.AKIMBO then
			local akimbo_rounding = ammo_gained % 2 + #self._fire_callbacks
			ammo_gained = ammo_gained + akimbo_rounding
		end

		self._ammo_overflow = math.max(ammo_gained_raw - ammo_gained, 0)
		ammo_base:set_ammo_total(math.clamp(ammo_base:get_ammo_total() + ammo_gained, 0, ammo_base:get_ammo_max()))
		return true, ammo_gained
	end

	local picked_up, add_amount
	picked_up, add_amount = _add_ammo(self, ratio, add_amount_override)
	
	--Weapons with other weapons attached. Basically, The Little Friend.
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

		--Damage reduction when shooting through shields.
		--self._shield_damage_mult to be sorted out later, will be useful for setting it per gun if wanted in the future.
		if hit_through_shield then
			damage = damage * (self._shield_damage_mult or 0.5)
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

--Adds auto fire sound fix and MG Specialist skill.
function RaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost_buff") then
		managers.player:deactivate_temporary_upgrade("temporary", "no_ammo_cost_buff")

		if managers.player:has_category_upgrade("temporary", "no_ammo_cost") then
			managers.player:activate_temporary_upgrade("temporary", "no_ammo_cost")
		end
	end

	local is_player = self._setup.user_unit == managers.player:player_unit()
	local consume_ammo = not managers.player:has_active_temporary_property("bullet_storm") and (not managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") or not managers.player:has_category_upgrade("player", "berserker_no_ammo_cost")) or not is_player

	--MG Specialist Skill
	if self._shots_without_releasing_trigger then
		self._shots_without_releasing_trigger = self._shots_without_releasing_trigger + 1
		if self._bullets_until_free and self._shots_without_releasing_trigger % self._bullets_until_free == 0 then
			consume_ammo = false
		end
	end

	if consume_ammo and (is_player or Network:is_server()) then
		local base = self:ammo_base()

		if base:get_ammo_remaining_in_clip() == 0 then
			return
		end

		local ammo_usage = 1

		if is_player then
			for _, category in ipairs(self:weapon_tweak_data().categories) do
				if managers.player:has_category_upgrade(category, "consume_no_ammo_chance") then
					local roll = math.rand(1)
					local chance = managers.player:upgrade_value(category, "consume_no_ammo_chance", 0)

					if roll < chance then
						ammo_usage = 0

						print("NO AMMO COST")
					end
				end
			end
		end

		local mag = base:get_ammo_remaining_in_clip()
		local remaining_ammo = mag - ammo_usage

		if mag > 0 and remaining_ammo <= (self.AKIMBO and 1 or 0) then
			local w_td = self:weapon_tweak_data()

			if w_td.animations and w_td.animations.magazine_empty then
				self:tweak_data_anim_play("magazine_empty")
			end

			if w_td.sounds and w_td.sounds.magazine_empty then
				self:play_tweak_data_sound("magazine_empty")
			end

			if w_td.effects and w_td.effects.magazine_empty then
				self:_spawn_tweak_data_effect("magazine_empty")
			end

			self:set_magazine_empty(true)
		end

		base:set_ammo_remaining_in_clip(base:get_ammo_remaining_in_clip() - ammo_usage)
		self:use_ammo(base, ammo_usage)
	end

	local user_unit = self._setup.user_unit

	self:_check_ammo_total(user_unit)

	if alive(self._obj_fire) then
		self:_spawn_muzzle_effect(from_pos, direction)
	end

	self:_spawn_shell_eject_effect()

	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)

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

	--Autofire soundfix integration.
	if self:_soundfix_should_play_normal() then
		return ray_res
	end

	if ray_res and self._setup.user_unit == managers.player:player_unit() then
		self:play_tweak_data_sound("fire_single","fire")
		self:play_tweak_data_sound("stop_fire")
	end

	return ray_res
end

local orig_stop_shooting = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting(...)
	if self._shots_without_releasing_trigger then
		self._shots_without_releasing_trigger = 0
	end

	if self:_soundfix_should_play_normal() then
		orig_stop_shooting(self,...)
	end
end


--Multipliers for overall spread.
function RaycastWeaponBase:conditional_accuracy_multiplier(current_state)
	local mul = 1

	--Multi-pellet spread increase.
	if self._rays and self._rays > 1 then
		mul = mul * tweak_data.weapon.stat_info.shotgun_spread_increase
	end

	if not current_state then
		return mul
	end

	local pm = managers.player

	if current_state:in_steelsight() then
		for _, category in ipairs(self:categories()) do
			mul = mul * pm:upgrade_value(category, "steelsight_accuracy_inc", 1)
		end
	else
		for _, category in ipairs(self:categories()) do
			mul = mul * pm:upgrade_value(category, "hip_fire_spread_multiplier", 1)
		end
	end

	mul = mul * pm:get_property("desperado", 1)

	return mul
end

--Multiplier for movement penalty to spread.
function RaycastWeaponBase:moving_spread_penalty_reduction()
	local spread_multiplier = 1
	for _, category in ipairs(self:weapon_tweak_data().categories) do
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "move_spread_multiplier", 1)
	end
	return spread_multiplier
end

--Simpler spread function. Determines area bullets can hit then converts that to the max degrees by which the rays can fire.
function RaycastWeaponBase:_get_spread(user_unit)
	local current_state = user_unit:movement()._current_state
	if not current_state then
		return 0, 0
	end

	--Get spread area from accuracy stat.
	local spread_area = math.max(self._spread + 
		managers.blackmarket:accuracy_index_addend(self._name_id, self:categories(), self._silencer, current_state, self:fire_mode(), self._blueprint) * tweak_data.weapon.stat_info.spread_per_accuracy, 0.05)
	
	--Moving penalty to spread, based on stability stat- added to total area.
	if current_state._moving then
		--Get spread area from stability stat.
		local moving_spread = math.max(self._spread_moving + managers.blackmarket:stability_index_addend(self:categories(), self._silencer) * tweak_data.weapon.stat_info.spread_per_stability, 0)
		--Add moving spread penalty reduction.
		moving_spread = moving_spread * self:moving_spread_penalty_reduction()
		spread_area = spread_area + moving_spread
	end

	--Apply skill and stance multipliers to overall spread area.
	local multiplier = tweak_data.weapon.stats.stance_mults[current_state:get_movement_state()] * self:conditional_accuracy_multiplier(current_state)
	spread_area = spread_area * multiplier


	--Convert spread area to degrees.
	local spread_x = math.sqrt((spread_area)/math.pi)
	local spread_y = spread_x

	return spread_x, spread_y
end

function RaycastWeaponBase:remove_ammo(percent)
	local total_ammo = self:get_ammo_total()
	local max_ammo = self:get_ammo_max()
	local ammo = math.max(math.floor(total_ammo - max_ammo * percent), 0)

	self:set_ammo_total(ammo)

	local ammo_in_clip = self:get_ammo_remaining_in_clip()

	if self:get_ammo_total() < ammo_in_clip then
		self:set_ammo_remaining_in_clip(ammo)
	end

	return total_ammo - ammo
end