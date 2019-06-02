if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function NewRaycastWeaponBase:get_add_head_shot_mul()
		if self:is_category("smg", "lmg", "assault_rifle", "minigun") and self._fire_mode == ids_auto then
			return self._add_head_shot_mul
		end
		return nil
	end

end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	if _G.IS_VR then
		--I might have to do something unique for VR, but we'll see.
	else
		function NewRaycastWeaponBase:clip_full()
			if self:ammo_base():weapon_tweak_data().tactical_reload then
				return self:ammo_base():get_ammo_remaining_in_clip() == self:ammo_base():get_ammo_max_per_clip() + self:ammo_base():weapon_tweak_data().tactical_reload
			else
				return self:ammo_base():get_ammo_remaining_in_clip() == self:ammo_base():get_ammo_max_per_clip()
			end
		end
				
		function NewRaycastWeaponBase:on_reload()
			local ammo_base = self._reload_ammo_base or self:ammo_base()
			if ammo_base:weapon_tweak_data().uses_clip == true then
				if ammo_base:get_ammo_remaining_in_clip() <= ammo_base:get_ammo_max_per_clip()  then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip(), ammo_base:get_ammo_remaining_in_clip() +  ammo_base:weapon_tweak_data().clip_capacity))
				end
			else
				if ammo_base:get_ammo_remaining_in_clip() > 0 and  ammo_base:weapon_tweak_data().tactical_reload == 1 then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 1))
				elseif ammo_base:get_ammo_remaining_in_clip() > 1 and  ammo_base:weapon_tweak_data().tactical_reload == 2 then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 2))
				elseif ammo_base:get_ammo_remaining_in_clip() == 1 and  ammo_base:weapon_tweak_data().tactical_reload == 2 then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 1))
				elseif ammo_base:get_ammo_remaining_in_clip() > 0 and not  ammo_base:weapon_tweak_data().tactical_reload then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip()))
				elseif self._setup.expend_ammo then
					ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip()))
				else
					ammo_base:set_ammo_remaining_in_clip(ammo_base:get_ammo_max_per_clip())
					ammo_base:set_ammo_total(ammo_base:get_ammo_max_per_clip())
				end
			end
			managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
			self._reload_ammo_base = nil
		end
		
		function NewRaycastWeaponBase:reload_expire_t()
			if self._use_shotgun_reload then
				local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
				if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
					return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
				else
					return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
				end
			end
			return nil
		end
		
		function NewRaycastWeaponBase:update_reloading(t, dt, time_left)
			if self._use_shotgun_reload and t > self._next_shell_reloded_t then
				local speed_multiplier = self:reload_speed_multiplier()
				self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
				if self:get_ammo_remaining_in_clip() > 0 and  self:weapon_tweak_data().tactical_reload == 1 then
					self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
					return true
				else
					self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
					return true
				end
				managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
				return true
			end
		end	
	end

	function NewRaycastWeaponBase:_get_spread(user_unit)
		local current_state = user_unit:movement()._current_state
		if not current_state then
			return 0, 0
		end
		local spread_values = tweak_data.weapon[self._name_id].spread
		if not spread_values then
			return 0, 0
		end
		local cond_spread_addend = self:conditional_accuracy_addend(current_state) or 0
		local spread_addend = (self:spread_index_addend(current_state) or 0) + cond_spread_addend
		local current_spread_value = spread_values[current_state:get_movement_state()]
		local new_spread = self._current_stats_indices.spread + spread_addend
		new_spread = math.clamp(new_spread, 1, #tweak_data.weapon.stats.spread)
		self._spread = tweak_data.weapon.stats.spread[new_spread]
		local spread_x, spread_y
		if type(current_spread_value) == "number" then
			spread_x = self._spread --self:_get_spread_from_number(user_unit, current_state, current_spread_value)
			spread_y = spread_x
		else
			spread_x, spread_y = self:_get_spread_from_table(user_unit, current_state, current_spread_value)
		end
		if self._spread_multiplier then
			spread_x = spread_x * self._spread_multiplier[1]
			spread_y = spread_y * self._spread_multiplier[2]
		end
		local spread_mult = 1
		spread_mult = spread_mult * self:spread_multiplier(current_state)
		spread_mult = spread_mult * self:conditional_accuracy_multiplier(current_state)
		spread_x = spread_x * spread_mult
		spread_y = spread_y * spread_mult
		return spread_x, spread_y
	end
	
	local start_shooting_original = RaycastWeaponBase.start_shooting
	local stop_shooting_original = RaycastWeaponBase.stop_shooting
	local _fire_sound_original = RaycastWeaponBase._fire_sound
	local trigger_held_original = RaycastWeaponBase.trigger_held
	local recoil_multiplier_original = NewRaycastWeaponBase.recoil_multiplier

	RaycastWeaponBase._SPIN_UP_T = 0.5
	RaycastWeaponBase._SPIN_DOWN_T = 0.75

	function RaycastWeaponBase:start_shooting(...)
		start_shooting_original(self, ...)
		
		if self._name_id == "m134" then
			self:_start_spin()
		end
	end

	function RaycastWeaponBase:stop_shooting(...)
		stop_shooting_original(self, ...)

		if self._name_id == "m134" then
			self:_stop_spin()
			self._vulcan_firing = nil
		end
	end

	function RaycastWeaponBase:_fire_sound(...)
		if self._name_id ~= "m134" or self._vulcan_firing then
			return _fire_sound_original(self, ...)
		end
	end

	function RaycastWeaponBase:trigger_held(...)
		if self._name_id == "m134" then
			self:update_spin()
			local fired
			if self._next_fire_allowed <= self._unit:timer():time() then
				if self._spin_done then
					fired = self:fire(...)
					if fired then
						self._next_fire_allowed = self._next_fire_allowed + (tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate or 0) / self:fire_rate_multiplier()
						if not self._vulcan_firing then
							self._vulcan_firing = true
							self:_fire_sound()
						end
					end
				end
			end
			return fired
		end
		
		return trigger_held_original(self, ...)
	end

	function NewRaycastWeaponBase:recoil_multiplier(...)
		if self._name_id == "m134" and not self._vulcan_firing then
			--return 0
		end

		return recoil_multiplier_original(self, ...)
	end


	function RaycastWeaponBase:_start_spin()
		if not self._spinning then
			local t = self._unit:timer():time()
			self._spin_up_start_t = t
			if self._spin_down_start_t and RaycastWeaponBase._SPIN_DOWN_T > 0 then
				self._spin_up_start_t = self._spin_up_start_t - (1 - math.clamp(t - self._spin_down_start_t, 0 , RaycastWeaponBase._SPIN_DOWN_T) / RaycastWeaponBase._SPIN_DOWN_T) * RaycastWeaponBase._SPIN_UP_T
			end
			
			self._next_spin_animation_t = t
			self._spinning = true
			self._spin_down_start_t = nil
		end
	end

	function RaycastWeaponBase:_stop_spin()
		if self._spinning and not self._in_steelsight then
			local t = self._unit:timer():time()
			self._spin_down_start_t = t
			if self._spin_up_start_t and RaycastWeaponBase._SPIN_UP_T > 0 then
				self._spin_down_start_t = self._spin_down_start_t - (1 - math.clamp(t - self._spin_up_start_t, 0 , RaycastWeaponBase._SPIN_UP_T) / RaycastWeaponBase._SPIN_UP_T) * RaycastWeaponBase._SPIN_DOWN_T
			end
			
			self._spinning = nil
			self._spin_up_start_t = nil
			self._spin_done = nil
			self._vulcan_firing = nil
		end
	end

	function RaycastWeaponBase:update_spin()
		if not self._spin_done and self._spinning then
			local t = self._unit:timer():time()
			if (self._spin_up_start_t + RaycastWeaponBase._SPIN_UP_T) <= t then
				self._spin_done = true
				self._spin_up_start_t = nil
				self._spin_down_start_t = nil
			end
		end
		
		if self._spinning and not self._vulcan_firing then
			local t = self._unit:timer():time()
			if t >= self._next_spin_animation_t then
				self:tweak_data_anim_play("fire", self:fire_rate_multiplier())
				self._next_spin_animation_t = t + (tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate or 0) / self:fire_rate_multiplier()
			end
		end
	end
	
	function RaycastWeaponBase:vulcan_enter_steelsight()
		self._in_steelsight = true
		self:_start_spin()
	end
	
	function RaycastWeaponBase:vulcan_exit_steelsight()
		self._in_steelsight = nil
		if not self._shooting then
			self:_stop_spin()
		end
	end

	--Le stats face
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values	
	function NewRaycastWeaponBase:_update_stats_values(disallow_replenish)
		old_update_stats_values(self, disallow_replenish)
		
		self._reload_speed_mult = self._reload_speed_mult or 1
		self._ads_speed_mult = self._ads_speed_mult or 1
		self._rof_mult = 1
		self._hipfire_mod = 1
		self._flame_max_range = self:weapon_tweak_data().flame_max_range or nil
		
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.reload_speed_mult then
				self._reload_speed_mult = self._reload_speed_mult * stats.reload_speed_mult
			end
			if stats.ads_speed_mult then
				self._ads_speed_mult = self._ads_speed_mult * stats.ads_speed_mult
			end
			if stats.rof_mult then
				self._rof_mult = self._rof_mult * stats.rof_mult
			end
			if stats.hipfire_mod then
				self._hipfire_mod = self._hipfire_mod * stats.hipfire_mod 
			end
			if self._flame_max_range and stats.flame_max_range_set then
				self._flame_max_range = stats.flame_max_range_set
				NewRaycastWeaponBase.flame_max_range = stats.flame_max_range_set
			end
			if stats.block_b_storm then
				if not self:weapon_tweak_data().sub_category then
					 self:weapon_tweak_data().sub_category = {}
				end
				self:weapon_tweak_data().sub_category = "grenade_launcher"
			end
			if stats.disable_steelsight_stance then
				if self:weapon_tweak_data().animations then
					self:weapon_tweak_data().animations.has_steelsight_stance = false
				end
			end

			if stats.is_drum_aa12 then
				if self:weapon_tweak_data().animations then
					self:weapon_tweak_data().animations.reload_name_id = "aa12"
				end
			end

			if stats.is_mag_akm then
				if self:weapon_tweak_data().animations then
					self:weapon_tweak_data().animations.reload_name_id = "akm"
				end
			end

			if stats.use_pistol_kick then
				if self:weapon_tweak_data().kick then
					self:weapon_tweak_data().kick.standing = {
									0.6,
									0.8,
									-0.5,
									0.5
					}
					self:weapon_tweak_data().kick.crouching = {
									0.6,
									0.8,
									-0.5,
									0.5
					}
					self:weapon_tweak_data().kick.steelsight = {
									0.6,
									0.8,
									-0.5,
									0.5
					}
				end
			end

			if stats.use_auto_kick then
				if self:weapon_tweak_data().kick then
					self:weapon_tweak_data().kick.standing = {
									0.6,
									0.8,
									-1,
									1
					}
					self:weapon_tweak_data().kick.crouching = {
									0.6,
									0.8,
									-1,
									1
					}
					self:weapon_tweak_data().kick.steelsight = {
									0.6,
									0.8,
									-1,
									1
					}
				end
			end
			
			if stats.use_heavy_kick then
				if self:weapon_tweak_data().kick then
					self:weapon_tweak_data().kick.standing = {
									1.9,
									2,
									-0.2,
									0.2
					}
					self:weapon_tweak_data().kick.crouching = {
									1.9,
									2,
									-0.2,
									0.2
					}
					self:weapon_tweak_data().kick.steelsight = {
									1.9,
									2,
									-0.2,
									0.2
					}
				end
			end			

		end
							
	end
						
	--[[	fire rate multipler in-game stuff	]]--
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mult or 1
				
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			if (self._name_id == "tec9" or self._name_id == "c96") and self._block_eq_aced then
			else
				multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
			end
		end
		return multiplier
	end
	
	--[[	Reload stuff	]]--
	function NewRaycastWeaponBase:reload_speed_multiplier()
		if self._current_reload_speed_multiplier then
			return self._current_reload_speed_multiplier
		end
		local multiplier = 1
		multiplier = multiplier * self._reload_speed_mult
			
		for _, category in ipairs(self:weapon_tweak_data().categories) do
			multiplier = multiplier * managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
		
		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			if self._setup.user_unit:movement():next_reload_speed_multiplier() then
				multiplier = multiplier + 1 - self._setup.user_unit:movement():next_reload_speed_multiplier()
			end
		end
		
		if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
			multiplier = multiplier * (managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1))
		end
		if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
			multiplier = multiplier * (managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1))
		end
		multiplier = multiplier * (managers.player:get_property("shock_and_awe_reload_multiplier", 1))
		multiplier = multiplier * (managers.player:get_temporary_property("bloodthirst_reload_speed", 1))
		multiplier = multiplier * (managers.player:upgrade_value("team", "crew_faster_reload", 1))
		
		multiplier = multiplier * self:reload_speed_stat()
		multiplier = managers.modifiers:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)
	
		return multiplier
	end

	function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
		local multiplier = 1
		local categories = self:weapon_tweak_data().categories
		for _, category in ipairs(categories) do
			multiplier = multiplier * managers.player:upgrade_value(category, "enter_steelsight_speed_multiplier", 1)
		end
				
		multiplier = multiplier * self._ads_speed_mult

		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
		
		return multiplier
	end

	function NewRaycastWeaponBase:calculate_ammo_max_per_clip()
		local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX + (self._extra_ammo or 0)
    		ammo = ammo * managers.player:upgrade_value(self._name_id, "clip_ammo_increase", 1)
    		if not self:upgrade_blocked("weapon", "clip_ammo_increase") then
        		ammo = ammo * managers.player:upgrade_value("weapon", "clip_ammo_increase", 1)
    		end
    		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "clip_ammo_increase") then
    			ammo = ammo * managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "clip_ammo_increase", 1)
    		end
    		ammo = math.floor(ammo)
    		return ammo
	end

end