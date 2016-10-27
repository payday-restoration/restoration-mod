if restoration.Options:GetValue("SC/SCWeapon") then

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
			return 0
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

	--Muzzle flash stuff
	local old_update_stats_values = NewRaycastWeaponBase._update_stats_values
	
	function NewRaycastWeaponBase:_update_stats_values()
		old_update_stats_values(self)
		
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

		end
		

		--ROF Multiplier perks--{

		self._block_eq_aced = managers.weapon_factory:has_perk("fire_mode_auto", self._factory_id, self._blueprint)
		self._db_charge = managers.weapon_factory:has_perk("db_charge", self._factory_id, self._blueprint)
		--}
				
		self:_check_laser()
		
	end
				
	function NewRaycastWeaponBase:_check_laser()
		self._laser_data = nil
		if self._has_gadget then
			local factory = tweak_data.weapon.factory
			for _, part_id in ipairs(self._has_gadget) do
				if factory.parts[part_id].sub_type == "laser" then
					self._laser_data = {}
					self._laser_data.part_id = part_id
					self._laser_data.unit = self._parts and self._parts[part_id] and alive(self._parts[part_id].unit) and self._parts[part_id].unit
				else
				end
			end
		end
	end
		
	function NewRaycastWeaponBase:_is_laser_on()
		if not self._laser_data or not self._laser_data.unit then
			return false
		end
		return self._laser_data.unit:base():is_on()
	end

	function NewRaycastWeaponBase:_get_spread(user_unit)
		local current_state = user_unit:movement()._current_state
		local spread_multiplier = self:spread_multiplier(current_state)
		local player_state = managers.player:current_state()
		if player_state == "bipod" then
			--spread_multiplier = 0
		end
		if current_state and current_state._unit_deploy_position then
			spread = 0
		end
		if self._hipfire_mod and not current_state:in_steelsight() or current_state._unit_deploy_position then
			spread_multiplier = spread_multiplier * self._hipfire_mod
		end
		return self._spread * spread_multiplier
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
		local multiplier = 1
		
		multiplier = multiplier * self._reload_speed_mult
		
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
			if morale_boost_bonus then
				multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
			end
		end
		return multiplier
	end

	function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
		local multiplier = 1
				
		multiplier = multiplier * self._ads_speed_mult

		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
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