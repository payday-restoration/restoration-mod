if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local init_original = RaycastWeaponBase.init
	local setup_original = RaycastWeaponBase.setup

	function RaycastWeaponBase:init(...)
		init_original(self, ...)
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


local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	end
	local result = {}
	local hit_unit
	local spread_x, spread_y = self:_get_spread(user_unit)
	local ray_distance = shoot_through_data and shoot_through_data.ray_distance or self._weapon_range or 20000
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()
	local theta = math.random() * 360
	local ax = math.sin(theta) * (math.random() * spread_x) * (spread_mul or 1)
	local ay = math.cos(theta) * (math.random() * spread_y) * (spread_mul or 1)
	mvector3.set(mvec_spread_direction, direction)
	mvector3.add(mvec_spread_direction, right * math.rad(ax))
	mvector3.add(mvec_spread_direction, up * math.rad(ay))
	mvector3.set(mvec_to, mvec_spread_direction)
	mvector3.multiply(mvec_to, ray_distance)
	mvector3.add(mvec_to, from_pos)
	local damage = self:_get_current_damage(dmg_mul)
	local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
	local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	if shoot_through_data and shoot_through_data.has_hit_wall then
		if not col_ray then
			return result
		end
		mvector3.set(mvec1, col_ray.ray)
		mvector3.multiply(mvec1, -5)
		mvector3.add(mvec1, col_ray.position)
		local ray_blocked = World:raycast("ray", mvec1, shoot_through_data.from, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report")
		if ray_blocked then
			return result
		end
	end
	local autoaim, suppression_enemies = self:check_autoaim(from_pos, direction)
	if self._autoaim then
		local weight = 0.1
		if col_ray and (col_ray.unit:in_slot(managers.slot:get_mask("enemies")) or col_ray.unit:in_slot(managers.slot:get_mask("players"))) then
			self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			damage = self:get_damage_falloff(damage, col_ray, user_unit)
			hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
		elseif autoaim then
			local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
			if autohit_mul then
				autohit_chance = autohit_chance * autohit_mul
			end
			if autohit_chance > math.random() then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
				damage = self:get_damage_falloff(damage, autoaim, user_unit)
				hit_unit = self._bullet_class:on_collision(autoaim, self._unit, user_unit, damage)
				col_ray = autoaim
			else
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		elseif col_ray then
			damage = self:get_damage_falloff(damage, col_ray, user_unit)
			hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
		end
		self._shot_fired_stats_table.hit = hit_unit and true or false
		if (not shoot_through_data or hit_unit) and (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
			self._shot_fired_stats_table.skip_bullet_count = shoot_through_data and true
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	elseif col_ray then
		damage = self:get_damage_falloff(damage, col_ray, user_unit)
		hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
	end
	if suppression_enemies and self._suppression then
		result.enemies_in_cone = suppression_enemies
	end
	if hit_unit and hit_unit.type == "death" and self:is_category(tweak_data.achievement.easy_as_breathing.weapon_type) then
		local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
		if unit_type and not CopDamage.is_civilian(unit_type) then
			self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1
			if self._kills_without_releasing_trigger >= tweak_data.achievement.easy_as_breathing.count then
				managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
			end
		end
	end
	if (col_ray and col_ray.distance > 600 or not col_ray) and alive(self._obj_fire) then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
		local trail = World:effect_manager():spawn(self._trail_effect_table)
		if col_ray then
			World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
		end
	end
	result.hit_enemy = hit_unit
	if self._alert_events then
		result.rays = {col_ray}
	end
	repeat
		if col_ray and col_ray.unit then
			local kills
			if hit_unit then
				local killed = hit_unit.type == "death"
				local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
				dmg_mul = ( dmg_mul or 1 )
				local is_enemy = unit_type ~= "civilian" and unit_type ~= "civilian_female" and unit_type ~= "bank_manager"
				kills = ( shoot_through_data and shoot_through_data.kills or 0 ) + ( killed and is_enemy and 1 or 0 )
			end
			self._shoot_through_data.kills = kills
			if ( col_ray.distance < 0.1 ) or ( ray_distance - col_ray.distance < 50 ) then
					break
			end
			local has_hit_wall = shoot_through_data and shoot_through_data.has_hit_wall
			local has_passed_shield = shoot_through_data and shoot_through_data.has_passed_shield
			local is_shoot_through, is_shield, is_wall
			if hit_unit then
			else
				local is_world_geometry = col_ray.unit:in_slot( managers.slot:get_mask( "world_geometry" ) )
				if is_world_geometry then
					is_shoot_through = not col_ray.body:has_ray_type( Idstring( "ai_vision" ) )
					
					if not is_shoot_through then
						if has_hit_wall or not self._can_shoot_through_wall then
							break
						end
						is_wall = true
					end
				else
					if self._can_shoot_through_shield ~= true then
						break
					end
					is_shield = col_ray.unit:in_slot( 8 ) and alive( col_ray.unit:parent() )
				end
			end
			
			if not hit_unit and not is_shoot_through and not is_shield and not is_wall then
				break
			end
			
			local ray_from_unit = (hit_unit or is_shield) and col_ray.unit
			
			--THIS IS THE SHIET YOU WANT, NIGGAAAAAAAAAAAAAA
			if is_shield then
				local unit_type = col_ray.unit:parent():base() and col_ray.unit:parent():base()._tweak_table
				if unit_type == "shield" then
					dmg_mul = ( dmg_mul or 1 ) * 0.6
				elseif  unit_type == "phalanx_minion" then
					dmg_mul = ( dmg_mul or 1 ) * 0.05
				elseif  unit_type == "phalanx_vip" then
					dmg_mul = ( dmg_mul or 1 ) * 0.05
				end
			end

			self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
			self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
			self._shoot_through_data.ray_from_unit = ray_from_unit
			self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
			mvector3.set(self._shoot_through_data.from, mvec_spread_direction)
			mvector3.multiply(self._shoot_through_data.from, is_shield and 5 or 40)
			mvector3.add(self._shoot_through_data.from, col_ray.position)
			managers.game_play_central:queue_fire_raycast(Application:time() + 0.0125, self._unit, user_unit, self._shoot_through_data.from, mvec_spread_direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, self._shoot_through_data)
		end
	until true
	if self._shoot_through_data and hit_unit and col_ray and self._shoot_through_data.kills and 0 < self._shoot_through_data.kills and hit_unit.type == "death" then
		local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
		local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass
		for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
			multi_kill = not achievement_data.multi_kill or self._shoot_through_data.kills == achievement_data.multi_kill
			enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
			obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and self._shoot_through_data.has_hit_wall or achievement_data.obstacle == "shield" and self._shoot_through_data.has_passed_shield
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
	if not tweak_data.achievement.tango_4.difficulty or table.contains(tweak_data.achievement.tango_4.difficulty, Global.game_settings.difficulty) then
		if self._has_gadget and table.contains(self._has_gadget, "wpn_fps_upg_o_45rds") and hit_unit and hit_unit.type == "death" and managers.player:player_unit():movement():current_state():in_steelsight() and col_ray.unit:base() and col_ray.unit:base()._tweak_table ~= "civilian" and col_ray.unit:base()._tweak_table ~= "civilian_female" then
			if self._tango_4_data then
				if self._gadget_on == self._tango_4_data.last_gadget_state then
					self._tango_4_data = nil
				else
					self._tango_4_data.last_gadget_state = self._gadget_on
					self._tango_4_data.count = self._tango_4_data.count + 1
				end
				if self._tango_4_data and self._tango_4_data.count >= tweak_data.achievement.tango_4.count then
					managers.achievment:_award_achievement(tweak_data.achievement.tango_4, "tango_4")
				end
			else
				self._tango_4_data = {
					count = 1,
					last_gadget_state = self._gadget_on
				}
			end
		elseif self._tango_4_data and not shoot_through_data then
			self._tango_4_data = nil
		end
	end
	return result
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
			
			if ammo_max then
				multiplier_max = multiplier_max * ammo_max
			end
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1)
			
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
		for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
			if gadget and gadget.ammo_base then
				local p, a = _add_ammo(gadget:ammo_base(), ratio, add_amount_override)
				picked_up = p or picked_up
				add_amount = add_amount + a
			end
		end
		return picked_up, add_amount
	end

	function RaycastWeaponBase:clip_full()
		if tweak_data.weapon[self._name_id].tactical_reload == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 1
		elseif tweak_data.weapon[self._name_id].tactical_akimbo == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 2
		else
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip()
		end
	end
	
	function RaycastWeaponBase:can_reload()
		if tweak_data.weapon[self._name_id].uses_clip == true and ( (self:get_ammo_max_per_clip() == tweak_data.weapon[self._name_id].clip_capacity and self:get_ammo_remaining_in_clip() > 0 ) or self:get_ammo_remaining_in_clip() > self:get_ammo_max_per_clip() - tweak_data.weapon[self._name_id].clip_capacity) then
			return false
		elseif self:get_ammo_total() > self:get_ammo_remaining_in_clip() then
			return true
		end
	end
	function RaycastWeaponBase:on_reload()
		local ammo_base = self._reload_ammo_base or self:ammo_base()
		if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif self:get_ammo_remaining_in_clip() > 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 2))
		elseif self:get_ammo_remaining_in_clip() == 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif tweak_data.weapon[self._name_id].uses_clip == true and self:get_ammo_remaining_in_clip() <= self:get_ammo_max_per_clip()  then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + tweak_data.weapon[self._name_id].clip_capacity))
		elseif self._setup.expend_ammo and not managers.enemy:is_enemy(self._setup.user_unit) then
			ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip()))
		else
			ammo_base:set_ammo_remaining_in_clip(ammo_base:get_ammo_max_per_clip())
			ammo_base:set_ammo_total(ammo_base:get_ammo_max_per_clip())
		end
		managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
		self._reload_ammo_base = nil
	end

	local raycast_current_damage_orig = RaycastWeaponBase._get_current_damage
	function RaycastWeaponBase:_get_current_damage(dmg_mul)
	   if self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase") then
 	       dmg_mul = dmg_mul / managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
  	   end
  	   return raycast_current_damage_orig(self, dmg_mul)
	end

end