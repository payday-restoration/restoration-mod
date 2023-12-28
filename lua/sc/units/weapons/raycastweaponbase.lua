local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_len = mvector3.length
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_len_sq = mvector3.length_sq
local math_clamp = math.clamp
local math_lerp = math.lerp
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_rot1 = Rotation()

local init_original = RaycastWeaponBase.init
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
	
	self._shield_pierce_damage_mult = 0.5
end

local setup_original = RaycastWeaponBase.setup
function RaycastWeaponBase:setup(...)
	setup_original(self, ...)
	
	--self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)

	--Use stability stat to get the moving accuracy penalty.
	if self._current_stats_indices and self._current_stats_indices.recoil then
		self._spread_moving = tweak_data.weapon.stats.spread_moving[self._current_stats_indices.recoil] or 0
	else --Fallback method for getting stability moving accuracy penalty, in case the indices somehow don't get set.
		log("Using fallback")
		local moving_spread_index = 0
		local recoil_table = tweak_data.weapon.stats.recoil
		for i = 0, 100, 1 do
			if recoil_table[i] == self._recoil then
				moving_spread_index = i
				break
			end
		end
		self._spread_moving = tweak_data.weapon.stats.spread_moving[moving_spread_index] or 0
	end

	--Trackers for MG Specialist Ace
	for _, category in ipairs(self:weapon_tweak_data().categories) do
		if managers.player:has_category_upgrade(category, "full_auto_free_ammo") then
			self._bullets_until_free = managers.player:upgrade_value(category, "full_auto_free_ammo")
			break
		end
	end
	self._shots_without_releasing_trigger = 0
	self._no_cheevo_kills_without_releasing_trigger = 0
end

function RaycastWeaponBase:get_damage_type()
	if self._rays and self._rays == 1 then
		return self:weapon_tweak_data().damage_type_single_ray
	else
		return self:weapon_tweak_data().damage_type or "normal"
	end
end

function RaycastWeaponBase:can_shoot_through_titan_shield()
	return self._can_shoot_through_titan_shield
end

function RaycastWeaponBase:can_shoot_through_enemy_unlim()
	return self._can_shoot_through_enemy_unlim
end

function RaycastWeaponBase:_collect_hits(from, to)
	local setup_data = {
		stop_on_impact = self:bullet_class().stop_on_impact,
		can_shoot_through_wall = self:can_shoot_through_wall(),
		can_shoot_through_shield = self:can_shoot_through_shield(),
		can_shoot_through_titan_shield = self:can_shoot_through_titan_shield(),
		can_shoot_through_enemy = self:can_shoot_through_enemy(),
		can_shoot_through_enemy_unlim = self:can_shoot_through_enemy_unlim(),
		armor_piercing_chance = self:armor_piercing_chance(),
		has_hit_enemy = nil,
		has_hit_wall = nil,
		bullet_slotmask = self._bullet_slotmask,
		enemy_mask = self.enemy_mask,
		wall_mask = self.wall_vehicle_mask,
		shield_mask = self.shield_mask,
		ignore_units = self._setup.ignore_units
	}

	return RaycastWeaponBase.collect_hits(from, to, setup_data)
end

local armour = {
	-- Tans
	[Idstring("body_plate"):key()] = true,
	-- Dozer
	[Idstring("body_helmet"):key()] = true,
	[Idstring("body_helmet_plate"):key()] = true,
	[Idstring("body_helmet_glass"):key()] = true,
	[Idstring("body_armor_chest"):key()] = true,
	[Idstring("body_armor_stomache"):key()] = true,
	[Idstring("body_armor_back"):key()] = true,
	[Idstring("body_armor_throat"):key()] = true,
	[Idstring("body_armor_neck"):key()] = true,
	-- Sosa
	[Idstring("body_vest"):key()] = true,
	[Idstring("body_ammo"):key()] = true,
}

--Minor fixes and making Winters unpiercable.
function RaycastWeaponBase.collect_hits(from, to, setup_data)
	setup_data = setup_data or {}
	local ray_hits = nil
	local hit_enemy = false
	local ignore_unit = setup_data.ignore_units or {}
	local enemy_mask = setup_data.enemy_mask
	local bullet_slotmask = setup_data.bullet_slotmask or managers.slot:get_mask("bullet_impact_targets")

	if setup_data.stop_on_impact then
		ray_hits = {}
		local hit = World:raycast("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit)

		if hit then
			table.insert(ray_hits, hit)

			hit_enemy = hit.unit:in_slot(enemy_mask)
		end

		return ray_hits, hit_enemy, hit_enemy and {
			[hit.unit:key()] = hit.unit
		} or nil
	end

	local can_shoot_through_wall = setup_data.can_shoot_through_wall
	local can_shoot_through_shield = setup_data.can_shoot_through_shield
	local can_shoot_through_titan_shield = setup_data.can_shoot_through_titan_shield
	local can_shoot_through_enemy = setup_data.can_shoot_through_enemy
	local can_shoot_through_enemy_unlim = setup_data.can_shoot_through_enemy_unlim
	local armor_piercing_chance = setup_data.armor_piercing_chance or 0
	local wall_mask = setup_data.wall_mask
	local shield_mask = setup_data.shield_mask
	local ai_vision_ids = Idstring("ai_vision")
	local bulletproof_ids = Idstring("bulletproof")

	--Just set this immediately.
	local ray_hits = can_shoot_through_wall and World:raycast_wall("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit, "thickness", 40, "thickness_mask", wall_mask)
		or World:raycast_all("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit)

	local unique_hits = {}
	local enemies_hit = {}
	local unit, u_key, is_enemy = nil
	local units_hit = {}
	local in_slot_func = Unit.in_slot
	local has_ray_type_func = Body.has_ray_type

	for i, hit in ipairs(ray_hits) do
		unit = hit.unit
		u_key = unit:key()
		if not units_hit[u_key] then
			units_hit[u_key] = true
			unique_hits[#unique_hits + 1] = hit
			hit.hit_position = hit.position
			is_enemy = in_slot_func(unit, enemy_mask)
			if is_enemy then
				enemies_hit[u_key] = unit
				hit_enemy = true
			end

			if (setup_data.has_hit_enemy or not can_shoot_through_enemy and is_enemy) or (armour[hit.body:name():key()] and armor_piercing_chance <= 0 ) then
				break
			elseif setup_data.has_hit_wall or (not can_shoot_through_wall and in_slot_func(unit, wall_mask) and (has_ray_type_func(hit.body, ai_vision_ids) or has_ray_type_func(hit.body, bulletproof_ids))) then
				break
			elseif not can_shoot_through_shield and hit.unit:in_slot(shield_mask) then
				break
			elseif hit.unit:in_slot(shield_mask) and (hit.unit:name():key() == 'af254947f0288a6c' or hit.unit:name():key() == '15cbabccf0841ff8') and not can_shoot_through_titan_shield then --Titan shields
				break
			elseif hit.unit:in_slot(shield_mask) and hit.unit:name():key() == '4a4a5e0034dd5340' then --Winters being a shit.
				break						
			end
			
			setup_data.has_hit_wall = setup_data.has_hit_wall or hit.unit:in_slot(wall_mask)
			setup_data.has_hit_enemy = not can_shoot_through_enemy_unlim and (setup_data.has_hit_enemy or hit_enemy)
		end
	end

	return unique_hits, hit_enemy, hit_enemy and enemies_hit or nil
end	

local raycast_current_damage_orig = RaycastWeaponBase._get_current_damage
function RaycastWeaponBase:_get_current_damage(dmg_mul)
   if self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase") then
	   dmg_mul = dmg_mul / managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
   end
   return raycast_current_damage_orig(self, dmg_mul)
end

local ids_volley = Idstring("volley")
function RaycastWeaponBase:get_object_damage_mult()
	if self._fire_mode and self._fire_mode == ids_volley then
		local fire_mode_data = self:weapon_tweak_data().fire_mode_data
		local volley_fire_mode = fire_mode_data and fire_mode_data.volley
		return volley_fire_mode and volley_fire_mode.object_damage_mult or 0.75
	elseif self._rays and self._rays == 1 and self:weapon_tweak_data().object_damage_mult_single_ray then
		return self:weapon_tweak_data().object_damage_mult_single_ray
	else
		return self:weapon_tweak_data().object_damage_mult or 1
	end
end

function RaycastWeaponBase:is_knock_down()
	if not self._knock_down or not self:is_category("smg", "lmg") then
		return false
	end

	local knock_down = self._knock_down

	if knock_down and managers.player._current_state == "bipod" then
		knock_down = knock_down * 2
	end

	return knock_down > 0 and math.random() < knock_down
end

function RaycastWeaponBase:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
	if not self:can_shield_knock() or not hit_unit:in_slot(self.shield_mask) then
		return false
	end

	local enemy_unit = hit_unit:parent()
	local char_dmg_ext = alive(enemy_unit) and enemy_unit:character_damage()

	if not char_dmg_ext then
		return false
	end

	if char_dmg_ext.is_immune_to_shield_knockback and char_dmg_ext:is_immune_to_shield_knockback() then --
		return false
	end

	local dmg_ratio = math.min(damage, self.SHIELD_MIN_KNOCK_BACK)
	dmg_ratio = dmg_ratio / self.SHIELD_MIN_KNOCK_BACK + 1
	local rand = math.random() * dmg_ratio

	if self.SHIELD_KNOCK_BACK_CHANCE < rand then
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

		return true
	end

	return false
end

--Refactored from vanilla code for consistency and simplicity.
function RaycastWeaponBase:add_ammo(ratio, add_amount_override)

	local previous_total_ammo = self:get_ammo_total() -- "Ammo Pickup in HUD" compatibilty

	local _add_ammo = function(ammo_base, ratio, add_amount_override)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return false, 0
		end

		local ammo_gained_raw = add_amount_override or math.lerp(ammo_base._ammo_pickup[1], ammo_base._ammo_pickup[2], math.random()) * (ratio or 1) + (ammo_base._ammo_overflow or 0)
		if ammo_gained_raw <= 0 then --Handle weapons with 0 pickup.
			return false, 0
		end

		local ammo_gained = math.max(0, math.floor(ammo_gained_raw))

		--Apply akimbo rounding.
		if self.AKIMBO then
			local akimbo_rounding = ammo_gained % 2 + #self._fire_callbacks
			ammo_gained = ammo_gained + akimbo_rounding
		end

		ammo_base._ammo_overflow = math.max(ammo_gained_raw - ammo_gained, 0)
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

	if picked_up then -- "Ammo Pickup in HUD" compatibilty
		local max_ammo = self:get_ammo_max()
		local current_total_ammo = self:get_ammo_total()
		local actual_add_amount = current_total_ammo - previous_total_ammo
		local use_index = self:selection_index()
		Hooks:Call("show_ammo_pickup_amount", self, actual_add_amount, use_index, add_amount, previous_total_ammo, current_total_ammo)
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
	local r = math.random()
	local theta = math.random() * 360
	local ax = math.tan(r * spread_x * (spread_mul or 1)) * math.cos(theta)
	local ay = math.tan(r * (spread_y or spread_x) * (spread_mul or 1)) * math.sin(theta) * -1

	mvector3.set(mvec_spread_direction, direction)
	mvector3.add(mvec_spread_direction, right * ax)
	mvector3.add(mvec_spread_direction, up * ay)
	mvector3.set(mvec_to, mvec_spread_direction)
	mvector3.multiply(mvec_to, ray_distance)
	mvector3.add(mvec_to, from_pos)

	local ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)

	if self._autoaim and self._autohit_data then
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

				if math.random() < autohit_chance then
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

	local hit_count = 0
	local hit_anyone = false
	local cop_kill_count = 0
	local hit_through_wall = false
	local hit_through_shield = false
	local shield_damage_reduction_applied = false
	local is_civ_f = CopDamage.is_civilian
	local damage = self:_get_current_damage(dmg_mul)

	if self:fire_mode() == "auto" and self._no_cheevo_kills_without_releasing_trigger > 0 then
		managers.hud:start_buff("body_expertise", (tweak_data.upgrades.automatic_kills_to_damage_reset_t or 0))
	end

	for _, hit in ipairs(ray_hits) do
		local dmg = self:get_damage_falloff(damage, hit, user_unit)

		local hit_unit = hit and hit.unit
		local is_alive = hit_unit and hit_unit:character_damage() and not hit_unit:character_damage():dead()
		local track_body_expert = nil
		local stacks = (self._automatic_kills_to_damage_max_stacks and math.min(self._no_cheevo_kills_without_releasing_trigger, self._automatic_kills_to_damage_max_stacks)) or 0
		
		if is_alive and self:fire_mode() == "auto" and self._automatic_kills_to_damage_max_stacks then
			track_body_expert = true
			if self._no_cheevo_kills_without_releasing_trigger > 0 then
				dmg = dmg * (1 + (self._automatic_kills_to_damage_dmg_mult * stacks))
			end
		end
		
		--[[
		if self:fire_mode() == "auto" and self._shoot_through_enemy_max_stacks and hit_count <= self._shoot_through_enemy_max_stacks then
			damage = damage * self._shoot_through_enemy_dmg_mult
		end
		--]]

		if dmg > 0 then
			local hit_result = self:bullet_class():on_collision(hit, self._unit, user_unit, dmg)
			hit_through_wall = hit_through_wall or hit.unit:in_slot(self.wall_mask)
			hit_through_shield = hit_through_shield or hit.unit:in_slot(self.shield_mask) and alive(hit.unit:parent())

			if hit.unit:in_slot(managers.slot:get_mask("world_geometry")) then
				hit_through_wall = true
				shield_damage_reduction_applied = false
			elseif hit.unit:in_slot(managers.slot:get_mask("enemy_shield_check")) then
				hit_through_shield = hit_through_shield or alive(hit.unit:parent())
				shield_damage_reduction_applied = false
			end
			
			if hit_through_shield and not shield_damage_reduction_applied then
				damage = damage * (self._shield_pierce_damage_mult or 0.5)
				shield_damage_reduction_applied = true
			end
			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1

				if hit_result.type == "death" then
					local unit_base = hit.unit:base()
					local unit_type = unit_base and unit_base._tweak_table
					local is_civilian = unit_type and is_civ_f(unit_type)

					if not is_civilian then
						cop_kill_count = cop_kill_count + 1
					end

					if track_body_expert then
						self._no_cheevo_kills_without_releasing_trigger = self._no_cheevo_kills_without_releasing_trigger + 1
						managers.hud:start_buff("body_expertise", (tweak_data.upgrades.automatic_kills_to_damage_reset_t or 0))
						managers.hud:set_stacks("body_expertise", (stacks == 0 and 1) or math.min(stacks + 1, self._automatic_kills_to_damage_max_stacks))
					end

					self:_check_kill_achievements(cop_kill_count, unit_base, unit_type, is_civilian, hit_through_wall, hit_through_shield)
				end
			end
		end
	end

	self:_check_tango_achievements(cop_kill_count)

	result.hit_enemy = hit_anyone

	if self._autoaim then
		self._shot_fired_stats_table.hit = hit_anyone
		self._shot_fired_stats_table.hit_count = hit_count

		if (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	end

	local furthest_hit = ray_hits[#ray_hits]

	if (not furthest_hit or furthest_hit.distance > 200) and alive(self._obj_fire) then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)

		local trail = World:effect_manager():spawn(self._trail_effect_table)

		if furthest_hit then
			World:effect_manager():set_remaining_lifetime(trail, math.clamp((furthest_hit.distance - 100) / 10000, 0, furthest_hit.distance))
		end
	end

	if result.enemies_in_cone == nil then
		result.enemies_in_cone = self._suppression and self:check_suppression(from_pos, direction, enemies_hit) or nil
	elseif enemies_hit and self._suppression then
		result.enemies_in_cone = result.enemies_in_cone or {}
		local all_enemies = managers.enemy:all_enemies()

		for u_key, enemy in pairs(enemies_hit) do
			if all_enemies[u_key] then
				result.enemies_in_cone[u_key] = {
					error_mul = 1,
					unit = enemy
				}
			end
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
	["money"] = true,
	["system"] = true
}

function RaycastWeaponBase:_soundfix_should_play_normal()
	local name_id = self:get_name_id() or "xX69dank420blazermachineXx" 
	if not self._setup.user_unit == managers.player:player_unit() then
		return true
	elseif afsf_blacklist[name_id] or tweak_data.weapon[name_id].sounds.no_fix then
		return true
	elseif not tweak_data.weapon[name_id].sounds.fire_single then
		return true
	end
	
end

local orig_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound(...)
	if self:_soundfix_should_play_normal() then
		orig_fire_sound(self,...)
		if self:_get_sound_event(self:fire_mode() == "auto" and not self:weapon_tweak_data().sounds.fire_single2 and "fire_auto2" or "fire_single2", "fire2") then
			self:play_tweak_data_sound(self:fire_mode() == "auto" and not self:weapon_tweak_data().sounds.fire_single2 and "fire_auto2" or "fire_single2", "fire2")
		end
		if self:_get_sound_event(self:fire_mode() == "auto" and not self:weapon_tweak_data().sounds.fire_single3 and "fire_auto3" or "fire_single3", "fire3") then
			self:play_tweak_data_sound(self:fire_mode() == "auto" and not self:weapon_tweak_data().sounds.fire_single3 and "fire_auto3" or "fire_single3", "fire3")
		end
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

	if self._autoaim and self._active_modify_mutator then
		self._active_modify_mutator:check_modify_weapon(self)
	end

	local is_player = self._setup.user_unit == managers.player:player_unit()
	local consume_ammo = not managers.player:has_active_temporary_property("bullet_storm") and (not managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") or not managers.player:has_category_upgrade("player", "berserker_no_ammo_cost")) or not is_player
	local ammo_usage = self:ammo_usage() or 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		if category == "grenade_launcher" or category == "rocket_launcher" then
			consume_ammo = true
		end
	end
	if self._no_bulletstorm then
		consume_ammo = true
	end
	--MG Specialist Skill
	if is_player and self._shots_without_releasing_trigger then
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

		local mutator = nil

		if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
			mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)
		end

		if mutator and mutator.get_free_ammo_chance and mutator:get_free_ammo_chance() then
			ammo_usage = 0
		end

		local ammo_in_clip = base:get_ammo_remaining_in_clip()
		local remaining_ammo = ammo_in_clip - ammo_usage

		if remaining_ammo < 0 then
			ammo_usage = ammo_usage + remaining_ammo
			remaining_ammo = 0
		end

		if ammo_in_clip > 0 and remaining_ammo <= (self.AKIMBO and 1 or 0) then
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

		base:set_ammo_remaining_in_clip(ammo_in_clip - ammo_usage)
		self:use_ammo(base, ammo_usage)
	end

	local user_unit = self._setup.user_unit

	self:_check_ammo_total(user_unit)

	for i = 1, ammo_usage do
		if alive(self._obj_fire) then
			self:_spawn_muzzle_effect(from_pos, direction)
		end
		self:_spawn_shell_eject_effect()
	end

	if self:weapon_tweak_data().muzzleflash_mod then
		for i = 1, self:weapon_tweak_data().muzzleflash_mod do
			if alive(self._obj_fire) then
				self:_spawn_muzzle_effect(from_pos, direction)
			end
		end
	end

	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit, ammo_usage)

	if self._alert_events and ray_res.rays then
		self:_check_alert(ray_res.rays, from_pos, direction, user_unit)
	end

	self:_build_suppression(ray_res.enemies_in_cone, suppr_mul)
	managers.player:send_message(Message.OnWeaponFired, nil, self._unit, ray_res)

	--Autofire soundfix integration.
	if self:_soundfix_should_play_normal() then
		if self._bullets_fired then
			if self._bullets_fired == 1 and self:weapon_tweak_data().sounds.fire_single then
				self:play_tweak_data_sound("stop_fire")
				if self:_get_sound_event("stop_fire2") then
					self:play_tweak_data_sound("stop_fire2")
				end
				if self:_get_sound_event("stop_fire3") then
					self:play_tweak_data_sound("stop_fire3")
				end
				self:play_tweak_data_sound("fire_auto", "fire")
				if self:_get_sound_event("fire_auto2", "fire2") then
					self:play_tweak_data_sound("fire_auto2", "fire2")
				end
				if self:_get_sound_event("fire_auto3", "fire3") then
					self:play_tweak_data_sound("fire_auto3", "fire3")
				end
			end
			self._bullets_fired = self._bullets_fired + 1
		end
		return ray_res
	end
	
	local name_id = self:get_name_id() or "xX69dank420blazermachineXx" 
	if ray_res and self._setup.user_unit == managers.player:player_unit() and not tweak_data.weapon[name_id].sounds.no_fix then
		self:play_tweak_data_sound("fire_single","fire")
		if self:_get_sound_event("fire_single2", "fire2") then
			self:play_tweak_data_sound("fire_single2", "fire2")
		end
		if self:_get_sound_event("fire_single3", "fire3") then
			self:play_tweak_data_sound("fire_single3", "fire3")
		end
		self:play_tweak_data_sound("stop_fire")
		if self:_get_sound_event("stop_fire2") then
			self:play_tweak_data_sound("stop_fire2")
		end
		if self:_get_sound_event("stop_fire3") then
			self:play_tweak_data_sound("stop_fire3")
		end
	end
	
	return ray_res
end

local orig_stop_shooting = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting(...)
	if self._shots_without_releasing_trigger then
		self._shots_without_releasing_trigger = 0
	end
	if self:_get_sound_event("stop_fire2") then
		--self._sound_fire:stop()
		self:play_tweak_data_sound("stop_fire2")
	end
	if self:_get_sound_event("stop_fire3") then
		--self._sound_fire:stop()
		self:play_tweak_data_sound("stop_fire3")
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
		mul = mul * tweak_data.weapon.stat_info.shotgun_spread_increase or 1
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
	local multiplier = tweak_data.weapon.stat_info.stance_spread_mults[current_state:get_movement_state()] * self:conditional_accuracy_multiplier(current_state)
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

function RaycastWeaponBase:tweak_data_anim_play(anim, speed_multiplier, set_offset, set_offset2)
	local animation = self:_get_tweak_data_weapon_animation(anim)
	if animation then
		self:anim_play(animation, speed_multiplier, set_offset, set_offset2)

		return true
	end

	return false
end

function RaycastWeaponBase:anim_play(anim, speed_multiplier, set_offset, set_offset2)
	if anim then
		local length = self._unit:anim_length(Idstring(anim))
		local reload_fix_mult2 = self:weapon_tweak_data().reload_fix_mult2
		speed_multiplier = speed_multiplier or 1
		if reload_fix_mult2 then
			speed_multiplier = speed_multiplier * (reload_fix_mult2 * (1 / speed_multiplier))
		end

		self._unit:anim_stop(Idstring(anim))
		self._unit:anim_play_to(Idstring(anim), length, speed_multiplier)

		local offset = self:_get_anim_start_offset(anim) or set_offset2

		if offset then
			self._unit:anim_set_time(Idstring(anim), offset)
		end
	end
end

--[[
function InstantBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound, already_ricocheted)
	blank = blank or Network:is_client() and user_unit ~= managers.player:player_unit() 

	local hit_unit = col_ray.unit

	-- MUST be done at the start of the function because you may shoot a destructible body and it'll get respawned into a slotmask the decal effect won't find
	-- i.e, you shoot a dozer's armour and destroy it, it gets moved into the slotmask for debris and therefore won't be found for the decal impact so you get a blood impact instead
	-- so the decal effect must be queued before damage is applied
	if not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood and (not hit_unit:character_damage().is_friendly_fire or not hit_unit:character_damage():is_friendly_fire(user_unit)) then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end

	local is_shield = hit_unit:in_slot(managers.slot:get_mask("enemy_shield_check")) and alive(hit_unit:parent())
	if alive(weapon_unit) and is_shield and weapon_unit:base()._shield_knock then
		local enemy_unit = hit_unit:parent()

		if enemy_unit:character_damage() and enemy_unit:character_damage().dead and not enemy_unit:character_damage():dead() then
			if enemy_unit:base():char_tweak() then
				if enemy_unit:base():char_tweak().damage.shield_knocked and not enemy_unit:character_damage():is_immune_to_shield_knockback() then
					local knock_chance = math.sqrt(0.03 * damage) --Makes a nice curve.

					if knock_chance > math.random() then
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
			local object_damage_mult = alive(weapon_unit) and weapon_unit.base and weapon_unit:base().get_object_damage_mult and weapon_unit:base():get_object_damage_mult() or 1
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			damage = network_damage / 163.84

			if sync_damage then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage * object_damage_mult))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				col_ray.body:extension().damage:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
				col_ray.body:extension().damage:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, damage * object_damage_mult)

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
		local was_alive = not hit_unit:character_damage():dead()
		if not blank then
			local knock_down
			local can_knock_down = weapon_unit:base()._knock_down
			if can_knock_down and managers.player._current_state == "bipod" then
				can_knock_down = can_knock_down * 2
			end
			if weapon_unit:base():is_category("smg", "lmg") then
				knock_down = can_knock_down and can_knock_down > 0 and math.random() < can_knock_down
			end				
			result = self:give_impact_damage(col_ray, weapon_unit, user_unit, damage, weapon_unit:base()._use_armor_piercing, false, knock_down, weapon_unit:base()._stagger, weapon_unit:base()._variant)
		end

		local push_multiplier = self:_get_character_push_multiplier(weapon_unit, was_alive and hit_unit:character_damage():dead())
		managers.game_play_central:physics_push(col_ray, push_multiplier)
	else
		managers.game_play_central:physics_push(col_ray)
	end

	return result
end
--]]

function InstantBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil

	if user_unit and self:chk_friendly_fire(hit_unit, user_unit) then
		return "friendly_fire"
	end

	weapon_unit = alive(weapon_unit) and weapon_unit or nil
	local endurance_alive_chk = false

	if hit_unit:damage() then
		local body_dmg_ext = col_ray.body:extension() and col_ray.body:extension().damage

		if body_dmg_ext then
			local object_damage_mult = weapon_unit and weapon_unit.base and weapon_unit:base().get_object_damage_mult and weapon_unit:base():get_object_damage_mult() or 1
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			local body_damage = network_damage / 163.84

			if sync_damage and managers.network:session() then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit and user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage * object_damage_mult))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				endurance_alive_chk = true
				local weap_cats = weapon_unit and weapon_unit:base().categories and weapon_unit:base():categories()

				body_dmg_ext:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
				body_dmg_ext:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, body_damage * object_damage_mult)

				if weap_cats and hit_unit:alive() then
					for _, category in ipairs(weap_cats) do
						body_dmg_ext:damage_bullet_type(category, user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					end
				end
			end
		end
	end

	if endurance_alive_chk and not hit_unit:alive() then
		return
	end

	local do_shotgun_push, result, do_push, push_mul = nil
	local hit_dmg_ext = hit_unit:character_damage()
	local play_impact_flesh = not hit_dmg_ext or not hit_dmg_ext._no_blood

	if not blank and weapon_unit then
		local weap_base = weapon_unit:base()

		if weap_base and weap_base.chk_shield_knock then
			weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
		end

		if hit_dmg_ext and hit_dmg_ext.damage_bullet then
			local was_alive = not hit_dmg_ext:dead()
			local armor_piercing, knock_down, stagger, variant = nil

			if weap_base then
				armor_piercing = weap_base.has_armor_piercing and weap_base:has_armor_piercing()
				knock_down = weap_base.is_knock_down and weap_base:is_knock_down()
				stagger = weap_base.is_stagger and weap_base:is_stagger()
				variant = weap_base.variant and weap_base:variant()
			end

			result = self:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, false, knock_down, stagger, variant)

			if result ~= "friendly_fire" then
				local has_died = hit_dmg_ext:dead()
				do_push = true
				push_mul = self:_get_character_push_multiplier(weapon_unit, was_alive and has_died)

				if weap_base and result and result.type == "death" and weap_base.should_shotgun_push and weap_base:should_shotgun_push() then
					do_shotgun_push = true
				end
			else
				play_impact_flesh = false
			end
		else
			do_push = true
		end
	else
		do_push = true
	end

	if do_push then
		managers.game_play_central:physics_push(col_ray, push_mul)
	end

	if do_shotgun_push then
		--managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)
	end

	--Unsure if the old version of playing impact effects will work with the new stuff, leaving the new stuff as-is for now
	if play_impact_flesh then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end

	return result
end

--[[
function DOTBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local result = DOTBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, self.NO_BULLET_INPACT_SOUND)
	local hit_unit = col_ray.unit

	if result and hit_unit:character_damage() and hit_unit:character_damage().damage_dot and not hit_unit:character_damage():dead() and alive(weapon_unit) then
		result = self:start_dot_damage(col_ray, weapon_unit, self:_dot_data_by_weapon(weapon_unit), alive(weapon_unit) and weapon_unit:base():get_name_id(), user_unit)
	end

	return result
end

function DOTBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id, user_unit)
	dot_data = dot_data or self.DOT_DATA
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance
	local dot_length = dot_data.dot_length

	if dot_data.use_weapon_damage_falloff and alive(weapon_unit) then
		dot_length = weapon_unit:base():get_damage_falloff(dot_length, col_ray, user_unit, true)
	end

	managers.dot:add_doted_enemy(col_ray.unit, TimerManager:game():time(), weapon_unit, dot_length, dot_data.dot_damage, hurt_animation, self.VARIANT, weapon_id)
end
--]]

FlameBulletBase.VARIANT = "bullet"

--Fire no longer memes on shields.
function FlameBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets")
end	

--Add shield knocking to FlameBulletBase
function FlameBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil

	if user_unit and self:chk_friendly_fire(hit_unit, user_unit) then
		return "friendly_fire"
	end

	weapon_unit = alive(weapon_unit) and weapon_unit or nil
	local endurance_alive_chk = false

	local is_shield = hit_unit:in_slot(managers.slot:get_mask("enemy_shield_check")) and alive(hit_unit:parent())

	--Give DB Shield Knock if the player has the skill.
	if alive(weapon_unit) and is_shield and weapon_unit:base()._shield_knock then
		local enemy_unit = hit_unit:parent()

		if enemy_unit:character_damage() and enemy_unit:character_damage().dead and not enemy_unit:character_damage():dead() then
			if enemy_unit:base():char_tweak() then
				if enemy_unit:base():char_tweak().damage.shield_knocked and not enemy_unit:character_damage():is_immune_to_shield_knockback() then
					local knock_chance = math.sqrt(0.03 * damage) --Makes a nice curve.

					if knock_chance > math.random() then
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

	if hit_unit:damage() then
		local body_dmg_ext = col_ray.body:extension() and col_ray.body:extension().damage

		if body_dmg_ext then
			local rays = weapon_unit and weapon_unit.base and ((not weapon_unit:base():weapon_tweak_data().alt_shotgunraycast and weapon_unit:base()._rays) or 1)
			local object_damage_mult = (weapon_unit and weapon_unit.base and weapon_unit:base().get_object_damage_mult and weapon_unit:base():get_object_damage_mult() or 1) / rays
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			local body_damage = network_damage / 163.84

			if sync_damage and managers.network:session() then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit and user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage * object_damage_mult))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				endurance_alive_chk = true
				local weap_cats = weapon_unit and weapon_unit:base().categories and weapon_unit:base():categories()

				body_dmg_ext:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)

				if hit_unit:alive() then
					body_dmg_ext:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, body_damage * object_damage_mult)
				end

				if weap_cats and hit_unit:alive() then
					for _, category in ipairs(weap_cats) do
						body_dmg_ext:damage_bullet_type(category, user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					end
				end
			end
		end
	end

	if endurance_alive_chk and not hit_unit:alive() then
		return
	end

	local do_shotgun_push, result, do_push, push_mul = nil
	local hit_dmg_ext = hit_unit:character_damage()
	local play_impact_flesh = not hit_dmg_ext or not hit_dmg_ext._no_blood

	if not blank and weapon_unit then
		local weap_base = weapon_unit:base()

		if weap_base and weap_base.chk_shield_knock then
			weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
		end

		if hit_dmg_ext and hit_dmg_ext.damage_fire then
			local was_alive = not hit_dmg_ext:dead()
			local armor_piercing, knock_down, stagger, variant = nil

			if weap_base then
				armor_piercing = weap_base.has_armor_piercing and weap_base:has_armor_piercing()
				knock_down = weap_base.is_knock_down and weap_base:is_knock_down()
				stagger = weap_base.is_stagger and weap_base:is_stagger()
				variant = weap_base.variant and weap_base:variant()
			end

			result = self:give_fire_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, false, knock_down, stagger, variant)

			if result ~= "friendly_fire" then
				local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()

				if ammo_data and ammo_data.push_units then
					local has_died = hit_dmg_ext:dead()
					do_push = true
					push_mul = self:_get_character_push_multiplier(weapon_unit, was_alive and has_died)

					if result and result.type == "death" and weap_base.should_shotgun_push and weap_base:should_shotgun_push() then
						do_shotgun_push = true
					end
				end
			else
				play_impact_flesh = false
			end
		else
			local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()
			do_push = ammo_data and ammo_data.push_units
		end
	elseif weapon_unit then
		local weap_base = weapon_unit:base()
		local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()
		do_push = ammo_data and ammo_data.push_units
	end

	if do_push then
		managers.game_play_central:physics_push(col_ray, push_mul)
	end

	if do_shotgun_push then
		managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)
	end

	--Play Impact flesh is never true on fire bullets. No need for this conditional.

	--DB Always plays impact sound and effects.
	self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)

	return result
end

function FlameBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id, user_unit, defense_data)
	local target_unit = col_ray.unit

	if not alive(target_unit) then
		return
	end

	local target_base_ext = target_unit:base()
	local char_tweak = target_base_ext and target_base_ext.char_tweak and target_base_ext:char_tweak()
	local flammable = char_tweak and char_tweak.flammable ~= false
	local can_dot = flammable
	local chance = dot_data.dot_trigger_chance
	local weap_base = weapon_unit and weapon_unit.base and weapon_unit:base()

	if not can_dot then
		return
	end

	if dot_data.use_weapon_damage_falloff_chance then
		if weap_base and weap_base.get_damage_falloff then
			chance = weap_base:get_damage_falloff(chance, col_ray, user_unit)
		end
	end

	can_dot = not chance or math.random() <= chance or false

	if not can_dot then
		return
	end

	local weapon = nil
	local attacker = alive(user_unit) and user_unit or nil
	local distance = mvector3.distance(attacker:position(), target_unit:position())

	if attacker then
		local base_ext = attacker:base()

		if base_ext and base_ext.thrower_unit then
			attacker = base_ext:thrower_unit()
			attacker = alive(attacker) and attacker or nil
			weapon = user_unit
		end
	end

	if dot_data.dot_trigger_max_distance then
		if not attacker then
			return
		end

		can_dot = distance <= dot_data.dot_trigger_max_distance
	end

	if not can_dot then
		return
	end

	weapon = weapon or alive(weapon_unit) and weapon_unit or nil

	if not weapon_id and weapon then
		local base_ext = weapon:base()
		weapon_id = base_ext and base_ext.get_name_id and base_ext:get_name_id()
	end

	local data = {
		unit = target_unit,
		dot_data = dot_data,
		weapon_id = weapon_id,
		weapon_unit = weapon,
		attacker_unit = attacker
	}

	local char_dmg_ext = target_unit:character_damage()
	local friendly_fire = char_dmg_ext:is_friendly_fire(attacker)

	if not friendly_fire then 
		managers.fire:add_doted_enemy(data)
	end

	if dot_data.dot_stun_max_distance and weap_base and weap_base.near_falloff_distance and distance > weap_base.near_falloff_distance then
		return
	end

	if not friendly_fire and char_tweak and char_tweak.use_animation_on_fire_damage ~= false then
		if char_dmg_ext.get_last_time_unit_got_fire_damage and char_dmg_ext.force_hurt then
			local last_fire_t = char_dmg_ext:get_last_time_unit_got_fire_damage()
			local t = TimerManager:game():time()

			if not last_fire_t or t - last_fire_t > (char_tweak.fire_animation_cooldown or 1) then
				local damage_info = nil

				if type(defense_data) == "table" and defense_data.attack_data then
					damage_info = defense_data.attack_data
					damage_info.type = "fire_hurt"

					if damage_info.result then
						damage_info.result.type = "fire_hurt"
						damage_info.result.variant = dot_data.variant or self.VARIANT
					else
						damage_info.result = {
							type = "fire_hurt",
							variant = dot_data.variant or self.VARIANT
						}
					end
				else
					damage_info = {
						damage = 0,
						type = "fire_hurt",
						variant = dot_data.variant or self.VARIANT,
						col_ray = col_ray,
						result = {
							type = "fire_hurt",
							variant = dot_data.variant or self.VARIANT
						}
					}
				end

				char_dmg_ext:force_hurt(damage_info)
			end
		end
	end
end


BleedBulletBase = BleedBulletBase or class(DOTBulletBase)
BleedBulletBase.VARIANT = "bleed"
ProjectilesBleedBulletBase = ProjectilesBleedBulletBase or class(BleedBulletBase)
ProjectilesBleedBulletBase.NO_BULLET_INPACT_SOUND = false

--Allow easier hotloading of data.
--[[
function ProjectilesBleedBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local result = DOTBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, self.NO_BULLET_INPACT_SOUND)
	local hit_unit = col_ray.unit

	if result and hit_unit:character_damage() and hit_unit:character_damage().damage_dot and not hit_unit:character_damage():dead() and alive(weapon_unit) then
		local dot_data = tweak_data.projectiles[weapon_unit:base()._projectile_entry].dot_data

		if not dot_data then
			return
		end

		local dot_type_data = tweak_data:get_dot_type_data(dot_data.type)

		if not dot_type_data then
			return
		end

		result = self:start_dot_damage(col_ray, nil, {
			dot_damage = dot_type_data.dot_damage,
			dot_length = dot_data.custom_length or dot_type_data.dot_length
		})
	end

	return result
end

function BleedBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id)
	dot_data = dot_data or self.DOT_DATA
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance

	--Add range limits for Flechette shotguns.
	local can_apply_dot = true
	if alive(weapon_unit) then
		weap_base = weapon_unit:base()
		if weap_base.near_dot_distance then
			can_apply_dot = weap_base.far_dot_distance + weap_base.near_dot_distance > (col_ray.distance or 0)
		end
	end

	if can_apply_dot == true then
		managers.dot:add_doted_enemy(col_ray.unit, TimerManager:game():time(), weapon_unit, dot_data.dot_length, dot_data.dot_damage, hurt_animation, self.VARIANT, weapon_id)
 	end
end
--]]

--Adds a blood splat effect every time the bleed deals damage.
function BleedBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, hurt_animation, weapon_id)
	--Movement() can return nil, but can also itself be nil. Very fun!
	if alive(col_ray.unit) and col_ray.unit.movement and col_ray.unit:movement() and col_ray.unit:movement()._obj_spine then
		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/particles/impacts/blood/blood_impact_a"),
			position = col_ray.unit:movement()._obj_spine:position(),
			normal = Vector3(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
		})
	end
	
	local action_data = {
		variant = variant or self.VARIANT,
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = attacker_unit,
		col_ray = col_ray,
		hurt_animation = hurt_animation,
		weapon_id = weapon_id
	}
	local defense_data = nil
	local char_dmg_ext = col_ray and alive(col_ray.unit) and col_ray.unit:character_damage()

	if char_dmg_ext and char_dmg_ext.damage_dot then
		defense_data = char_dmg_ext:damage_dot(action_data)
	end

	return defense_data
end

function InstantExplosiveBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil
	weapon_unit = alive(weapon_unit) and weapon_unit or nil

	if not user_unit or not self:chk_friendly_fire(hit_unit, user_unit) then
		if not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood then
			self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
		end

		if not blank and weapon_unit then
			local weap_base = weapon_unit:base()

			if weap_base and weap_base.chk_shield_knock then
				weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
			end
		end
	end

	if not blank and weapon_unit then
		mvec3_set(tmp_vec1, col_ray.position)
		mvec3_set(tmp_vec2, col_ray.ray)
		mvec3_norm(tmp_vec2)
		mvec3_mul(tmp_vec2, 20)
		mvec3_sub(tmp_vec1, tmp_vec2)
		local overkill = managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
		self.super:on_collision(col_ray, weapon_unit, user_unit, (damage * 0.5) * overkill, blank, no_sound)
		self:on_collision_server(tmp_vec1, col_ray.normal, damage * 0.5, user_unit, weapon_unit, managers.network:session():local_peer():id())

		return {
			variant = "explosion",
			col_ray = col_ray
		}
	end

	return nil
end

function InstantExplosiveBulletBase:on_collision_server(position, normal, damage, user_unit, weapon_unit, owner_peer_id, owner_selection_index)
	local slot_mask = managers.slot:get_mask("explosion_targets")

	managers.explosion:play_sound_and_effects(position, normal, self.RANGE, self.EFFECT_PARAMS)

	managers.explosion:give_local_player_dmg(position, self.RANGE, damage * self.PLAYER_DMG_MUL, user_unit) --Funny vanilla code doesn't call this and works off of magic because reasons idk.
	local hit_units, splinters, results = managers.explosion:detect_and_give_dmg({
		hit_pos = position,
		range = self.RANGE,
		collision_slotmask = slot_mask,
		curve_pow = self.CURVE_POW,
		damage = damage,
		player_damage = damage * self.PLAYER_DMG_MUL,
		alert_radius = self.ALERT_RADIUS,
		ignore_unit = weapon_unit,
		user = user_unit,
		owner = weapon_unit
	})
	local network_damage = math.ceil(damage * 163.84)

	managers.network:session():send_to_peers_synched("sync_explode_bullet", position, normal, math.min(16384, network_damage), owner_peer_id)

	if managers.network:session():local_peer():id() == owner_peer_id then
		local enemies_hit = (results.count_gangsters or 0) + (results.count_cops or 0)
		local enemies_killed = (results.count_gangster_kills or 0) + (results.count_cop_kills or 0)

		managers.statistics:shot_fired({
			hit = false,
			weapon_unit = weapon_unit
		})

		for i = 1, enemies_hit do
			managers.statistics:shot_fired({
				skip_bullet_count = true,
				hit = true,
				weapon_unit = weapon_unit
			})
		end

		local weapon_pass, weapon_type_pass, count_pass, all_pass = nil

		for achievement, achievement_data in pairs(tweak_data.achievement.explosion_achievements) do
			weapon_pass = not achievement_data.weapon or true
			weapon_type_pass = not achievement_data.weapon_type or weapon_unit:base() and weapon_unit:base().weapon_tweak_data and weapon_unit:base():is_category(achievement_data.weapon_type)
			count_pass = not achievement_data.count or achievement_data.count <= (achievement_data.kill and enemies_killed or enemies_hit)
			all_pass = weapon_pass and weapon_type_pass and count_pass

			if all_pass and achievement_data.award then
				managers.achievment:award(achievement_data.award)
			end
		end
	else
		local peer = managers.network:session():peer(owner_peer_id)
		local SYNCH_MIN = 0
		local SYNCH_MAX = 31
		local count_cops = math.clamp(results.count_cops, SYNCH_MIN, SYNCH_MAX)
		local count_gangsters = math.clamp(results.count_gangsters, SYNCH_MIN, SYNCH_MAX)
		local count_civilians = math.clamp(results.count_civilians, SYNCH_MIN, SYNCH_MAX)
		local count_cop_kills = math.clamp(results.count_cop_kills, SYNCH_MIN, SYNCH_MAX)
		local count_gangster_kills = math.clamp(results.count_gangster_kills, SYNCH_MIN, SYNCH_MAX)
		local count_civilian_kills = math.clamp(results.count_civilian_kills, SYNCH_MIN, SYNCH_MAX)

		managers.network:session():send_to_peer_synched(peer, "sync_explosion_results", count_cops, count_gangsters, count_civilians, count_cop_kills, count_gangster_kills, count_civilian_kills, owner_selection_index)
	end
end

function InstantExplosiveBulletBase:on_collision_client(position, normal, damage, user_unit)
	managers.explosion:give_local_player_dmg(position, self.RANGE, damage * self.PLAYER_DMG_MUL, user_unit) --Passes in the unit that actually made the attack.
	managers.explosion:explode_on_client(position, normal, user_unit, damage, self.RANGE, self.CURVE_POW, self.EFFECT_PARAMS)
end

function ConcussiveInstantBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, ...)
	if col_ray.unit:character_damage().on_concussion then
		local conc_tweak = alive(weapon_unit) and weapon_unit:base().concussion_tweak and weapon_unit:base():concussion_tweak()
		local conc_mul = conc_tweak and conc_tweak.mul or tweak_data.character.concussion_multiplier
		local sound_tweak = conc_tweak and conc_tweak.sound_duration
		local sound_eff_mul = sound_tweak and sound_tweak.mul or 0.3
		local distance = mvector3.distance(col_ray.unit:position(), user_unit:position())

		local unit_tweak = alive(user_unit) and user_unit.base and user_unit:base() and user_unit:base().char_tweak and user_unit:base():char_tweak()
		local dt_sgunner_range = unit_tweak and unit_tweak.dt_sgunner and unit_tweak.dt_sgunner.range
		local conc_max_range = dt_sgunner_range or (conc_tweak and conc_tweak.max_range) or 1000

		if distance < conc_max_range then
			managers.environment_controller:set_concussion_grenade(col_ray.unit:movement():m_head_pos(), true, 0, 0, conc_mul, true, true)
			col_ray.unit:character_damage():on_concussion(sound_eff_mul, false, sound_tweak)
		end
	elseif Network:is_server() and col_ray.unit:character_damage().stun_hit then
		local function can_stun(hit_unit)
			local brain_ext = hit_unit:brain()

			if brain_ext and brain_ext.is_hostage and brain_ext:is_hostage() then
				return false
			end

			local base_ext = hit_unit:base()

			if base_ext and base_ext.char_tweak and base_ext:char_tweak().immune_to_concussion then
				return false
			end

			return true
		end

		if can_stun(col_ray.unit) then
			local action_data = {
				variant = "stun",
				damage = 0,
				attacker_unit = user_unit,
				weapon_unit = weapon_unit,
				col_ray = col_ray
			}

			col_ray.unit:character_damage():stun_hit(action_data)
		end
	end

	return self.super.give_impact_damage(self, col_ray, weapon_unit, user_unit, damage, ...)
end