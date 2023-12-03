local ids_single = Idstring("single")
local ids_auto = Idstring("auto")
local ids_burst = Idstring("burst")
local ids_volley = Idstring("volley")

--Adds ability to define per weapon category AP skills.
Hooks:PostHook(NewRaycastWeaponBase, "init", "ResExtraSkills", function(self)
	--Since armor piercing chance is no longer used, lets use weapon category to determine armor piercing baseline.
	if self:is_category("bow", "crossbow", "saw") then
		self._use_armor_piercing = true
	end

	self._skill_global_ap = (managers.player:has_category_upgrade("player", "ap_bullets") and managers.player:upgrade_value("player", "ap_bullets", 1)) or nil

	for _, category in ipairs(self:categories()) do
		if managers.player:has_category_upgrade(category, "automatic_kills_to_damage") then
			self._automatic_kills_to_damage_max_stacks = managers.player:upgrade_value(category, "automatic_kills_to_damage")[1]
			self._automatic_kills_to_damage_dmg_mult = managers.player:upgrade_value(category, "automatic_kills_to_damage")[2]
		end
	end

	local fire_mode_data = self:weapon_tweak_data().fire_mode_data or {}
	local volley_fire_mode = fire_mode_data.volley

	self._shield_knock = managers.player:has_category_upgrade("player", "bullet_shield_knock")

	if volley_fire_mode then
		self._volley_spread_mul = volley_fire_mode.spread_mul or 1
		self._volley_damage_mul = volley_fire_mode.damage_mul or 1
		self._volley_damage_mul_step = volley_fire_mode.damage_mul_step or nil
		self._volley_ammo_usage = volley_fire_mode.ammo_usage or 1
		self._volley_rays = volley_fire_mode.rays or 1
	end

end)

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
	
	--Handle guns that can hold bullets in the chamber.
	local original_on_reload = NewRaycastWeaponBase.on_reload
	function NewRaycastWeaponBase:on_reload(...)
		if not self._setup.expend_ammo then
			original_on_reload(self, ...)

			return
		end

		local ammo_base = self._reload_ammo_base or self:ammo_base()

		if ammo_base:weapon_tweak_data().uses_clip == true then
			if ammo_base:get_ammo_remaining_in_clip() <= ammo_base:get_ammo_max_per_clip()  then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip(), ammo_base:get_ammo_remaining_in_clip() +  ammo_base:weapon_tweak_data().clip_capacity))
			end
		else
			if ammo_base:get_ammo_remaining_in_clip() > 0 and ammo_base:weapon_tweak_data().tactical_reload == 1 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 1))

			elseif ammo_base:get_ammo_remaining_in_clip() > 1 and ammo_base:weapon_tweak_data().tactical_reload == 2 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 2))
			elseif ammo_base:get_ammo_remaining_in_clip() == 1 and ammo_base:weapon_tweak_data().tactical_reload == 2 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 1))

			elseif ammo_base:get_ammo_remaining_in_clip() >= 3 and ammo_base:weapon_tweak_data().tactical_reload == 3 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 3))
			elseif ammo_base:get_ammo_remaining_in_clip() == 2 and ammo_base:weapon_tweak_data().tactical_reload == 3 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 2))
			elseif ammo_base:get_ammo_remaining_in_clip() == 1 and ammo_base:weapon_tweak_data().tactical_reload == 3 then
				ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip() + 1))

			elseif ammo_base:get_ammo_remaining_in_clip() > 0 and not ammo_base:weapon_tweak_data().tactical_reload then
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

		local user_unit = managers.player:player_unit()

		if user_unit then
			user_unit:movement():current_state():send_reload_interupt()
		end

		if not self._ignore_reload_objects then
			self:set_reload_objects_visible(false)
		end

		self._reload_objects = {}
	end
	
	function NewRaycastWeaponBase:reload_expire_t(is_not_empty)
		if self._use_shotgun_reload then
			local shotgun_reload_tweak = self:_get_shotgun_reload_tweak_data(is_not_empty)
			if shotgun_reload_tweak and shotgun_reload_tweak.reload_queue then
				local ammo_total = self:get_ammo_total()
				local ammo_max_per_clip = self:get_ammo_max_per_clip() + (not self._started_reload_empty and self:weapon_tweak_data().tactical_reload and 1 or 0)
				local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
				local ammo_to_reload = math.min(ammo_total - ammo_remaining_in_clip, ammo_max_per_clip - ammo_remaining_in_clip)
				local reload_expire_t = 0
				local queue_index = 0
				local queue_data = nil
				local queue_num = #shotgun_reload_tweak.reload_queue

				while ammo_to_reload > 0 do
					if queue_index == queue_num then
						reload_expire_t = reload_expire_t + (shotgun_reload_tweak.reload_queue_wrap or 0)
					end

					queue_index = queue_index % queue_num + 1
					queue_data = shotgun_reload_tweak.reload_queue[queue_index]
					reload_expire_t = reload_expire_t + queue_data.expire_t or 0.5666666666666667
					ammo_to_reload = ammo_to_reload - (queue_data.reload_num or 1)
				end

				return reload_expire_t
			else
				local reload_count = math.ceil(self:max_bullets_to_reload(not is_not_empty or self._started_reload_empty) / (shotgun_reload_tweak and shotgun_reload_tweak.reload_num or 1))
				return reload_count * self:reload_shell_expire_t(is_not_empty)
			end
		end
		
	end
	
	function NewRaycastWeaponBase:max_bullets_to_reload(from_empty)
		local max_per_mag = self:get_ammo_max_per_clip()
		if not from_empty and self:weapon_tweak_data().tactical_reload then
			max_per_mag = max_per_mag + self:weapon_tweak_data().tactical_reload or 1
		end
		return math.min(self:get_ammo_total(), max_per_mag) - self:get_ammo_remaining_in_clip()
	end	
	
	function NewRaycastWeaponBase:update_reloading(t, dt, time_left)
		if self._use_shotgun_reload and self._next_shell_reloded_t and t > self._next_shell_reloded_t then
			local speed_multiplier = self:reload_speed_multiplier()
			local shotgun_reload_tweak = self:_get_shotgun_reload_tweak_data(not self._started_reload_empty)
			local ammo_to_reload = 1
			local next_queue_data = nil

			if shotgun_reload_tweak and shotgun_reload_tweak.reload_queue then
				self._shotgun_queue_index = self._shotgun_queue_index % #shotgun_reload_tweak.reload_queue + 1

				if self._shotgun_queue_index == #shotgun_reload_tweak.reload_queue then
					self._next_shell_reloded_t = self._next_shell_reloded_t + (shotgun_reload_tweak.reload_queue_wrap or 0)
				end

				local queue_data = shotgun_reload_tweak.reload_queue[self._shotgun_queue_index]
				ammo_to_reload = queue_data and queue_data.reload_num or 1
				next_queue_data = shotgun_reload_tweak.reload_queue[self._shotgun_queue_index + 1]
				self._next_shell_reloded_t = self._next_shell_reloded_t + (next_queue_data and next_queue_data.expire_t or 0.5666666666666667) / speed_multiplier
			else
				self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t(not self._started_reload_empty) / speed_multiplier
				ammo_to_reload = shotgun_reload_tweak and shotgun_reload_tweak.reload_num or 1
			end
			
			if ammo_to_reload > 1 then
				ammo_to_reload = math.min(ammo_to_reload, self:get_ammo_max_per_clip() - self:get_ammo_remaining_in_clip())
				ammo_to_reload = math.min(ammo_to_reload, self:get_ammo_total() - self:get_ammo_remaining_in_clip())
			end

			if not self._started_reload_empty and self:weapon_tweak_data().tactical_reload then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + ammo_to_reload))
			else
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + ammo_to_reload))
			end

			managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)

			if not next_queue_data or not next_queue_data.skip_update_ammo then
				self:update_ammo_objects()
			end

			return true
		end
	end

end

NewRaycastWeaponBase.DEFAULT_BURST_SIZE = 3
NewRaycastWeaponBase.IDSTRING_SINGLE = Idstring("single")
NewRaycastWeaponBase.IDSTRING_AUTO = Idstring("auto")

--Multipliers for overall spread.
function NewRaycastWeaponBase:conditional_accuracy_multiplier(current_state)
	local mul = 1
	local multi_ray = self._rays and self._rays > 1

	--Multi-pellet spread increase.
	if multi_ray then
		mul = mul * tweak_data.weapon.stat_info.shotgun_spread_increase or 1
	end

	local pm = managers.player

	mul = mul * pm:get_property("desperado", 1)

	if not current_state then
		return mul
	end

	local is_moving = current_state._moving or current_state:in_air()
	local full_steelsight = current_state:full_steelsight()

	if full_steelsight then
		if multi_ray then
			mul = mul * tweak_data.weapon.stat_info.shotgun_spread_increase_ads or 1
			
			for _, category in ipairs(self:categories()) do
				local multishot_spread = tweak_data[category] and tweak_data[category].ads_multishot_spread_mult or 1
				mul = mul * multishot_spread
			end
		end
		
		if self:weapon_tweak_data().always_hipfire or self.AKIMBO then
			mul = mul * tweak_data.weapon.stat_info.hipfire_only_spread_increase or 1
		end

		if not is_moving then
			for _, category in ipairs(self:categories()) do
				local stationary_spread = tweak_data[category] and tweak_data[category].ads_stationary_spread_mult or 1
				mul = mul * stationary_spread
			end
		end

		for _, category in ipairs(self:categories()) do
			mul = mul * pm:upgrade_value(category, "steelsight_accuracy_inc", 1)
		end
	else
		for _, category in ipairs(self:categories()) do
			mul = mul * pm:upgrade_value(category, "hip_fire_spread_multiplier", 1)
		end
	end

	return mul
end

--Multiplier for movement penalty to spread.
function NewRaycastWeaponBase:moving_spread_penalty_reduction()
	local spread_multiplier = 1
	for _, category in ipairs(self:categories()) do
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "move_spread_multiplier", 1)
	end
	return spread_multiplier
end

--Simpler spread function. Determines area bullets can hit then converts that to the max degrees by which the rays can fire.
function NewRaycastWeaponBase:_get_spread(user_unit)
	local current_state = user_unit:movement()._current_state
	
	if not current_state then
		return 0, 0
	end
	
	--Get spread area from accuracy stat.
	local spread_area = math.max(self._spread + 
		managers.blackmarket:accuracy_index_addend(self._name_id, self:categories(), self._silencer, current_state, self:fire_mode(), self._blueprint) * tweak_data.weapon.stat_info.spread_per_accuracy, 0.05)
	
	--Moving penalty to spread, based on stability stat- added to total area.
	if current_state._moving or current_state:in_air() then
		--Get spread area from stability stat.
		local moving_spread = math.max(self._spread_moving + managers.blackmarket:stability_index_addend(self:categories(), self._silencer) * tweak_data.weapon.stat_info.spread_per_stability, 0)
		local moving_spread_mult = 1
		for _, category in ipairs(self:categories()) do
			local ms_mult = tweak_data[category] and tweak_data[category].moving_spread_mult or 1
			moving_spread_mult = moving_spread_mult * ms_mult
		end
		moving_spread = moving_spread * moving_spread_mult
		if current_state:full_steelsight() and not self:weapon_tweak_data().always_hipfire then
			local ads_moving_spread_mult = 1
			if self._ads_moving_mult then
				ads_moving_spread_mult = ads_moving_spread_mult * self._ads_moving_mult
			end
			for _, category in ipairs(self:categories()) do
				local adsms_mult = tweak_data[category] and tweak_data[category].ads_moving_spread_mult or 1
				ads_moving_spread_mult = ads_moving_spread_mult * adsms_mult
			end
			moving_spread = moving_spread * ads_moving_spread_mult
		else
			local hipfire_moving_spread_mult = 1
			for _, category in ipairs(self:categories()) do
				local hms_mult = tweak_data[category] and tweak_data[category].hipfire_moving_spread_mult or 1
				hipfire_moving_spread_mult = hipfire_moving_spread_mult * hms_mult
			end
			moving_spread = moving_spread * hipfire_moving_spread_mult
		end
		--Add moving spread penalty reduction.
		moving_spread = moving_spread * self:moving_spread_penalty_reduction()
		spread_area = spread_area + moving_spread
	end

	if current_state:_is_using_bipod() then
		spread_area = spread_area / 2
	end

	--Apply skill and stance multipliers to overall spread area.
	local multiplier = tweak_data.weapon.stat_info.stance_spread_mults[current_state:get_movement_state()] * self:conditional_accuracy_multiplier(current_state)

	if not current_state:full_steelsight() then
		local hipfire_spread_mult = 1
		for _, category in ipairs(self:categories()) do
			local hip_mult = tweak_data[category] and tweak_data[category].hipfire_spread_mult or 1
			hipfire_spread_mult = hipfire_spread_mult * hip_mult
		end
		if self._hipfire_mult then
			hipfire_spread_mult = hipfire_spread_mult * self._hipfire_mult
		end
		multiplier = multiplier * hipfire_spread_mult
	end

	if self:in_burst_mode() then
		if self._burst_fire_ads_spread_multiplier and current_state:full_steelsight() then
			multiplier = multiplier * self._burst_fire_ads_spread_multiplier
		else
			multiplier = multiplier * (self._burst_fire_spread_multiplier or 1)
		end
	end

	if self._alt_fire_active and self._alt_fire_data then
		multiplier = multiplier * (self._alt_fire_data.spread_mul or 1)
	end

	spread_area = spread_area * multiplier

	--Convert spread area to degrees.
	local spread_x = math.sqrt((spread_area)/math.pi)
	local spread_y = spread_x
	
	if self._spread_multiplier then
		spread_x = spread_x * self._spread_multiplier[1]
		spread_y = spread_y * self._spread_multiplier[2]
	end


	return spread_x, spread_y
end

function NewRaycastWeaponBase:recoil_wait()
	local tweak_is_auto = tweak_data.weapon[self._name_id].FIRE_MODE == "auto"
	local weapon_is_auto = self:fire_mode() == "auto"

	local multiplier = tweak_is_auto == weapon_is_auto and 1 or 2

	return self:weapon_fire_rate() * multiplier
end

local start_shooting_original = NewRaycastWeaponBase.start_shooting
local stop_shooting_original = NewRaycastWeaponBase.stop_shooting
local _fire_sound_original = NewRaycastWeaponBase._fire_sound
local trigger_held_original = NewRaycastWeaponBase.trigger_held
local trigger_pressed_original = NewRaycastWeaponBase.trigger_pressed
local recoil_multiplier_original = NewRaycastWeaponBase.recoil_multiplier

NewRaycastWeaponBase._SPIN_UP_T = 0.5
NewRaycastWeaponBase._SPIN_DOWN_T = 0.75

function NewRaycastWeaponBase:start_shooting(...)
	start_shooting_original(self, ...)
	if self._name_id == "m134" or self._name_id == "shuno" or self:weapon_tweak_data().spin_up_t then
		self:_start_spin()
	end
end

function NewRaycastWeaponBase:stop_shooting(...)
	stop_shooting_original(self, ...)
	self._shooting = nil
	self._shots_fired = 0
	if self._fire_rate_init_progress then
		self._fire_rate_init_progress = nil
		self._fire_rate_init_cancel = true
		self._next_fire_allowed = self._next_fire_allowed + self._burst_delay
	end
	if self._name_id == "m134" or self._name_id == "shuno" or self:weapon_tweak_data().spin_up_t then
		self._vulcan_firing = nil
		self:_stop_spin()
	end
end

function NewRaycastWeaponBase:_fire_sound(...)
	if (self._name_id ~= "m134" and self._name_id ~= "shuno" and not self:weapon_tweak_data().spin_up_t) or self._vulcan_firing then
		if self._fire_mode == ids_volley and self:weapon_tweak_data().sounds.fire_volley then
			self:play_tweak_data_sound("fire_volley", "fire")
			return
		end
		NewRaycastWeaponBase.super._fire_sound(self)
	end
end

function NewRaycastWeaponBase:trigger_held(...)
	if self._name_id == "m134" or self._name_id == "shuno" or self:weapon_tweak_data().spin_up_t then
		self:update_spin()
		local fired
		local spin_up_t = (self:weapon_tweak_data().spin_up_t or NewRaycastWeaponBase._SPIN_UP_T) * self._spin_up_mult
		local spin_up_semi = self._fire_mode == ids_single and self:weapon_tweak_data().spin_up_semi
		if self._next_fire_allowed <= self._unit:timer():time() then
			if not self:weapon_tweak_data().spin_up_shoot then
				self._next_fire_allowed = self._next_fire_allowed + (tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate or 0) / self:fire_rate_multiplier()
			end
			if self._spin_done then
				if self:weapon_tweak_data().spin_up_shoot then
					self._next_fire_allowed = self._next_fire_allowed + (tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate or 0) / self:fire_rate_multiplier() + ((not spin_up_semi and not self:weapon_tweak_data().ads_spool and not self._vulcan_firing and spin_up_t) or 0)
				end
				fired = self:fire(...)
				if fired then
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
	local mult = recoil_multiplier_original(self, ...)

	mult = mult * (self._volley_recoil_mul or 1)
	self._volley_recoil_mul = nil

	if self:in_burst_mode() then
		if self._burst_fire_last_recoil_multiplier and (self._burst_rounds_remaining and self._burst_rounds_remaining < 1) then
			mult = mult * (self._burst_fire_last_recoil_multiplier or 1)
		elseif self._burst_fire_recoil_multiplier then
			mult = mult * (self._burst_fire_recoil_multiplier or 1)
		--elseif self._delayed_burst_recoil and self:burst_rounds_remaining() then
			--mult = 0
		end
	end
	
	if (self._fire_mode == ids_auto or self:weapon_tweak_data().spin_up_semi) and (self._name_id == "m134" or self._name_id == "shuno" or self:weapon_tweak_data().spin_up_t) and not self._vulcan_firing then
		return 0
	end

	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	if current_state then
		local is_moving = current_state._moving or current_state:in_air()
		local full_steelsight = current_state:full_steelsight()
		if full_steelsight then
			local weapon_stats = tweak_data.weapon.stats
			local base_zoom = weapon_stats.zoom and weapon_stats.zoom[1]
			local current_zoom = self:zoom()
			local percent_reduction = self:weapon_tweak_data().zoom_recoil_reduction or 0.05
			local zoom_mult = base_zoom and current_zoom and (1 + (((base_zoom / current_zoom) - 1) * percent_reduction))
			if zoom_mult then
				mult = mult / zoom_mult
			end
			if is_moving then
				for _, category in ipairs(self:categories()) do
					local ads_moving_recoil = tweak_data[category] and tweak_data[category].ads_moving_recoil or 1
					mult = mult * ads_moving_recoil
				end
			end
		end
	end

	return mult
end

local on_enabled_original = NewRaycastWeaponBase.on_enabled
function NewRaycastWeaponBase:on_enabled(...)
	self:cancel_burst()
	return on_enabled_original(self, ...)
end

local on_disabled_original = NewRaycastWeaponBase.on_disabled
function NewRaycastWeaponBase:on_disabled(...)
	self:cancel_burst()
	return on_disabled_original(self, ...)
end

local start_reload_original = NewRaycastWeaponBase.start_reload
function NewRaycastWeaponBase:start_reload(...)
	self:cancel_burst()
	return start_reload_original(self, ...)
end

function NewRaycastWeaponBase:_start_spin()
	if not self._spinning then
		local t = self._unit:timer():time()
		local spin_up_t = (self:weapon_tweak_data().spin_up_t or NewRaycastWeaponBase._SPIN_UP_T) * self._spin_up_mult
		local spin_down_t = (self:weapon_tweak_data().spin_down_t or NewRaycastWeaponBase._SPIN_DOWN_T) * self._spin_up_mult
		self._spin_up_start_t = t
		if self._spin_down_start_t and spin_down_t > 0 then
			self._spin_up_start_t = self._spin_up_start_t - (1 - math.clamp(t - self._spin_down_start_t, 0 , spin_down_t) / spin_down_t) * spin_up_t
		end
		if self:weapon_tweak_data().sounds.spin_start and (self._fire_mode == ids_auto or self:weapon_tweak_data().spin_up_semi) then
			self:play_tweak_data_sound("spin_start")
		end
		self._next_spin_animation_t = t
		self._spinning = true
		self._spin_down_start_t = nil
	end
end

function NewRaycastWeaponBase:_stop_spin()
	if self._spinning and not self._in_steelsight then
		local t = self._unit:timer():time()
		local spin_up_t = (self:weapon_tweak_data().spin_up_t or NewRaycastWeaponBase._SPIN_UP_T) * self._spin_up_mult
		local spin_down_t = (self:weapon_tweak_data().spin_down_t or NewRaycastWeaponBase._SPIN_DOWN_T) * self._spin_up_mult
		self._spin_down_start_t = t
		if self._spin_up_start_t and spin_up_t > 0 then
			self._spin_down_start_t = self._spin_down_start_t - (1 - math.clamp(t - self._spin_up_start_t, 0 , spin_up_t) / spin_up_t) * spin_down_t
		end
		if self:weapon_tweak_data().sounds.spin_end then
			self:play_tweak_data_sound("spin_end")
		end
		self._spinning = nil
		self._spin_up_start_t = nil
		self._spin_done = nil
		self._vulcan_firing = nil
	end
end

function NewRaycastWeaponBase:update_spin()
	if not self._spin_done and self._spinning then
		local t = self._unit:timer():time()
		local spin_up_t = (self:weapon_tweak_data().spin_up_t or NewRaycastWeaponBase._SPIN_UP_T) * self._spin_up_mult
		if (self._spin_up_start_t + spin_up_t) <= t then
			self._spin_done = true
			self._spin_up_start_t = nil
			self._spin_down_start_t = nil
		end
	end
	
	if self._spinning and not self._vulcan_firing then
		local t = self._unit:timer():time()
		if t >= self._next_spin_animation_t and self:weapon_tweak_data().spin_up_anims then
			self:tweak_data_anim_play("fire", self:fire_rate_multiplier())
			self._next_spin_animation_t = t + (tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate or 0) / self:fire_rate_multiplier()
		end
	end
end

function NewRaycastWeaponBase:vulcan_enter_steelsight()
	self._in_steelsight = true
	self:_start_spin()
end

function NewRaycastWeaponBase:vulcan_exit_steelsight()
	self._in_steelsight = nil
	if not self._vulcan_firing then
		self:_stop_spin()
	end
end

--Returns the weapon's current concealment stat.
function NewRaycastWeaponBase:get_concealment()
	local result = self._current_concealment or self._concealment
	if result then
		return math.max(result, 0)
	else
		log("Error: Missing concealment information")
		return 20
	end
	
end

--Le stats face
local old_update_stats_values = NewRaycastWeaponBase._update_stats_values	
function NewRaycastWeaponBase:_update_stats_values(disallow_replenish, ammo_data)
	old_update_stats_values(self, disallow_replenish, ammo_data)
	
	local recoil_values = self:weapon_tweak_data().recoil_values
	self._recoil_speed = recoil_values and recoil_values[1] or { 90, 60 }
	self._recoil_center_speed = math.clamp(recoil_values and recoil_values[2] or 7.5, 1, 10)
	self._recoil_recovery = math.clamp(recoil_values and recoil_values[3] or 0.5, 0, 1)

	self._reload_speed_mult = self:weapon_tweak_data().reload_speed_multiplier or 1
	self._ads_speed_mult = self._ads_speed_mult or  1
	self._flame_max_range = self:weapon_tweak_data().flame_max_range or nil
	self._autograph_multiplier = self:weapon_tweak_data().autograph_multiplier or nil
	self._ignore_reload_objects = self:weapon_tweak_data().ignore_reload_objects or nil
	self._ammo_data = ammo_data or managers.weapon_factory:get_ammo_data_from_weapon(self._factory_id, self._blueprint) or {}
	
	self._deploy_anim_override = self:weapon_tweak_data().deploy_anim_override or nil
	self._deploy_ads_stance_mod = self:weapon_tweak_data().deploy_ads_stance_mod or {translation = Vector3(0, 0, 0), rotation = Rotation(0, 0, 0)}		
		
	self._can_shoot_through_enemy_unlim = self:weapon_tweak_data().can_shoot_through_enemy_unlim or false --No limit enemy piercing
	self._can_shoot_through_titan_shield = self:weapon_tweak_data().can_shoot_through_titan_shield or false --implementing Heavy AP
	self._shield_pierce_damage_mult = self:weapon_tweak_data().shield_pierce_damage_mult or 0.5

	self._warsaw = self:weapon_tweak_data().warsaw
	self._nato = self:weapon_tweak_data().nato
	self._plasma_b = self:weapon_tweak_data().plasma_b
	self._terminator = self:weapon_tweak_data().terminator

	if not self:is_npc() then
		local weapon = {
			factory_id = self._factory_id,
			blueprint = self._blueprint
		}
		self._current_concealment = managers.blackmarket:calculate_weapon_concealment(weapon) + managers.blackmarket:get_silencer_concealment_modifiers(weapon)

		self._burst_rounds_remaining = 0
		self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto")
		self._auto_fire_range_multiplier = self:weapon_tweak_data().AUTO_FIRE_RANGE_MULTIPLIER
		self._single_fire_range_multiplier = self:weapon_tweak_data().SINGLE_FIRE_RANGE_MULTIPLIER
		
		self._has_burst_fire = (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false

		--self._has_burst_fire = (not self._locked_fire_mode or managers.weapon_factor:has_perk("fire_mode_burst", self._factory_id, self._blueprint) or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
		--self._locked_fire_mode = self._locked_fire_mode or managers.weapon_factor:has_perk("fire_mode_burst", self._factory_id, self._blueprint) and Idstring("burst")
		self._burst_size = self:weapon_tweak_data().BURST_FIRE or NewRaycastWeaponBase.DEFAULT_BURST_SIZE or 3
		self._adaptive_burst_size = self:weapon_tweak_data().ADAPTIVE_BURST_SIZE ~= false
		self._burst_fire_rate_multiplier = (self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER and self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER * 1.05) or 1.05 --small mult to help alliviate frame rounding
		self._burst_fire_recoil_multiplier = self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER or 0.8
		self._burst_fire_last_recoil_multiplier = self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER or 1
		self._burst_fire_spread_multiplier = self:weapon_tweak_data().BURST_FIRE_SPREAD_MULTIPLIER or 1
		self._burst_fire_ads_spread_multiplier = self:weapon_tweak_data().BURST_FIRE_ADS_SPREAD_MULTIPLIER
		self._burst_fire_range_multiplier = self:weapon_tweak_data().BURST_FIRE_RANGE_MULTIPLIER
		--self._delayed_burst_recoil = self:weapon_tweak_data().DELAYED_BURST_RECOIL
		self._burst_delay = self:weapon_tweak_data().BURST_DELAY or (self.AKIMBO and 0.03) or 0.09
		self._lock_burst = self._lock_burst or self:weapon_tweak_data().LOCK_BURST
		if self._lock_burst then
			self:_set_burst_mode(true, true)
		end
		self._auto_burst = self:weapon_tweak_data().AUTO_BURST
		
		self._burst_rounds_fired = 0

		self._single_fire_ap_add = self:weapon_tweak_data().SINGLE_FIRE_AP_ADD or 0
	
		self._fire_rate_init_count = self:weapon_tweak_data().fire_rate_init_count or nil
		self._fire_rate_init_mult = self:weapon_tweak_data().fire_rate_init_mult and self:weapon_tweak_data().fire_rate_init_mult * 1.01 or 1
		self._fire_rate_init_ramp_up = self:weapon_tweak_data().fire_rate_init_ramp_up or nil
		self._fire_rate_init_ramp_up_add = 0
	else	
		self._has_burst_fire = false
		self._can_shoot_through_titan_shield = false --to prevent npc abuse
	end	
	
	self._hs_mult = self._hs_mult or self:weapon_tweak_data().hs_mult or 1
	self._ene_hs_mult = self._ene_hs_mult or self:weapon_tweak_data().ene_hs_mult or 1

	self._shots_fired = 0

	local primary_category = self:weapon_tweak_data().categories and self:weapon_tweak_data().categories[1]
	self._movement_penalty = self:weapon_tweak_data().weapon_movement_penalty or tweak_data.upgrades.weapon_movement_penalty[primary_category] or 1

	local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
	if not self._custom_stats_done then
		--Set range/rof multipliers to 1 to make anything else that changes them fuck off
		self._damage_near_mul = 1
		self._damage_far_mul = 1
		self._damage_min_mult = 1
		self._duration_falloff_start_mult = 1
		self._duration_falloff_end_mult = 1

		self._rof_mult = 1
		self._alt_rof_mult = 1
		self._ads_rof_mult = 1
		self._hip_rof_mult = 1
		self._spin_up_mult = 1

		self._alt_dmg_mult = 1

		self._movement_speed_add = 0

		self._hipfire_mult = 1
		self._ads_moving_mult = 1

		if not self:is_npc() then
			self._descope_on_fire = self:weapon_tweak_data().descope_on_fire
			self._rms = self:weapon_tweak_data().rms
			self._sms = self:weapon_tweak_data().sms
			self._smt = self._sms and self:weapon_tweak_data().fire_mode_data and ((self:weapon_tweak_data().fire_mode_data.fire_rate * 5) * (self:weapon_tweak_data().smt_mult or 1))
		end

		for part_id, stats in pairs(custom_stats) do
			if stats.ads_speed_mult then
				self._ads_speed_mult = self._ads_speed_mult * stats.ads_speed_mult
			end
			if self._flame_max_range and stats.flame_max_range_set then
				self._flame_max_range = stats.flame_max_range_set
				NewRaycastWeaponBase.flame_max_range = stats.flame_max_range_set
			end
			if stats.block_b_storm or (stats.bullet_class and stats.bullet_class == "InstantExplosiveBulletBase") then
				self._no_bulletstorm = true
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
			if stats.g11_burst then
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = 4.565217	
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.2
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.1
				self:weapon_tweak_data().BURST_DELAY = 0.15
				self:weapon_tweak_data().LOCK_BURST = nil
			end	
			if stats.funco_chan then
				self:weapon_tweak_data().BURST_FIRE = 3
				self:weapon_tweak_data().BURST_DELAY = 0.08
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
			end	
			if stats.s7_flexfire then
				self:weapon_tweak_data().can_shoot_through_titan_shield = false
			end	
			if stats.hailstorm then
				self:weapon_tweak_data().BURST_FIRE = 3	
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.33
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1
				self:weapon_tweak_data().BURST_DELAY = 0.25
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().LOCK_BURST = true
				self:weapon_tweak_data().can_shoot_through_shield = false
				self:weapon_tweak_data().armor_piercing_chance = 0.5
			end			
			if stats.mk32 then
				self:weapon_tweak_data().BURST_FIRE = 2
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.5
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1
				self:weapon_tweak_data().BURST_DELAY = 0.6
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().LOCK_BURST = true
			end

			if stats.avelyn then
				self:weapon_tweak_data().BURST_FIRE = 3
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 1
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1
				self:weapon_tweak_data().BURST_DELAY = 0.2
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().LOCK_BURST = true
			end			

			if stats.tekna_burst then
				self:weapon_tweak_data().BURST_FIRE = 3	
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.5
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.1
				self:weapon_tweak_data().BURST_DELAY = 0.15
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().LOCK_BURST = true
			end

			if stats.widowmaker then
				self:weapon_tweak_data().tactical_reload = nil
				self:weapon_tweak_data().BURST_FIRE = 2
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = 12
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.1
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().LOCK_BURST = true
			end	

			if stats.wmtx_burst then
				self:weapon_tweak_data().CAN_TOGGLE_FIREMODE = false
				self:weapon_tweak_data().BURST_FIRE = 2
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = 10
				self:weapon_tweak_data().BURST_DELAY = 0.5
				self:weapon_tweak_data().BURST_FIRE_RANGE_MULTIPLIER = 0.75
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.75
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.5
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false			
			end		

			if stats.beretta_burst then
				self:weapon_tweak_data().BURST_FIRE = 3	
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = 1.57142857
			end	

			if stats.type99_stats then
				--have to do this due to how this thing is set up, can't have both equipped anyways
				tweak_data.weapon.system.reload_speed_multiplier = 1.13 * 1.1
				tweak_data.weapon.system.timers = tweak_data.weapon.system.timers or {}
				tweak_data.weapon.system.timers.reload_empty = 8
				tweak_data.weapon.system.timers.reload_not_empty = 8
				tweak_data.weapon.system.timers.reload_exit_empty = 0.8
				tweak_data.weapon.system.timers.reload_exit_not_empty = 0.8
			end	
	
			if stats.m16_burst then
				local burst_mult = ((self:weapon_tweak_data().fire_mode_data and self:weapon_tweak_data().fire_mode_data.fire_rate) and self:weapon_tweak_data().fire_mode_data.fire_rate / 0.066666) or 1
				self:weapon_tweak_data().CAN_TOGGLE_FIREMODE = false
				self:weapon_tweak_data().FIRE_MODE = "single"	
				self:weapon_tweak_data().BURST_FIRE = 3	
				self:weapon_tweak_data().BURST_DELAY = 0.08
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = burst_mult
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.75
				self:weapon_tweak_data().BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1
				self:_set_burst_mode(true, true)
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false			
			end		
			if stats.croon then
				self:weapon_tweak_data().BURST_USE_AUTO_LOGIC = true
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = 200
			end	

			if stats.xr2_auto then
				self:weapon_tweak_data().BURST_FIRE = false	
				self:weapon_tweak_data().CAN_TOGGLE_FIREMODE = true
				self:weapon_tweak_data().FIRE_MODE = "auto"				
			end
			if stats.xr2_rapidfire then
				self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER = (self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1.888888) * 1.11764
				self:weapon_tweak_data().BURST_FIRE_RECOIL_MULTIPLIER = 0.95
			end		
	
			if stats.beer_burst then
				self:weapon_tweak_data().BURST_FIRE = false
				self:weapon_tweak_data().BURST_FIRE_DEFAULT = nil
				self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = nil				
				self:weapon_tweak_data().CAN_TOGGLE_FIREMODE = true
				self:weapon_tweak_data().FIRE_MODE = "auto"	
			end	
			if stats.disable_steelsight_recoil_anim then
				self._disable_steelsight_recoil_anim = true
			end					
			
	
			if stats.is_pistol then
				if self:weapon_tweak_data().categories then
					self:weapon_tweak_data().categories = {"pistol"}
				end
			end
	
			if stats.hs_mult then		
				self._hs_mult = (self._hs_mult or 1) * stats.hs_mult
			end
			if stats.descope_on_fire then		
				self._descope_on_fire = stats.descope_on_fire
			end
			if stats.duration_falloff_start_mult then		
				self._duration_falloff_start_mult = self._duration_falloff_start_mult * stats.duration_falloff_start_mult
			end
			if stats.duration_falloff_end_mult then		
				self._duration_falloff_end_mult = self._duration_falloff_end_mult * stats.duration_falloff_end_mult
			end
			if stats.falloff_start_mult then
				self._damage_near_mul = self._damage_near_mul * stats.falloff_start_mult
			end
			if stats.falloff_end_mult then
				self._damage_far_mul = self._damage_far_mul * stats.falloff_end_mult
			end
			if stats.damage_min_mult then
				self._damage_min_mult = self._damage_min_mult * stats.damage_min_mult
			end
			if stats.rof_mult then
				self._rof_mult = self._rof_mult * stats.rof_mult
			end
			if stats.alt_rof_mult then
				self._alt_rof_mult = self._alt_rof_mult * stats.alt_rof_mult
			end
			if stats.ads_rof_mult then
				self._ads_rof_mult = self._ads_rof_mult * stats.ads_rof_mult
			end
			if stats.hip_rof_mult then
				self._hip_rof_mult = self._hip_rof_mult * stats.hip_rof_mult
			end
			if stats.spin_up_mult then
				self._spin_up_mult = self._spin_up_mult * stats.spin_up_mult
			end

			if stats.ignore_rof_mult_anims then
				self._ignore_rof_mult_anims = stats.ignore_rof_mult_anims
			end

			if stats.alt_dmg_mult then
				self._alt_dmg_mult = self._alt_dmg_mult * stats.alt_dmg_mult
			end

			if stats.ene_hs_mult_add then
				self._ene_hs_mult = self._ene_hs_mult + stats.ene_hs_mult_add
			end

			if stats.natascha then		
				self._natascha = stats.natascha
			end

			if stats.starwars then
				if restoration.Options:GetValue("OTHER/GCGPYPMMSAC") then
					self._cbfd_to_add_this_check_elsewhere = true
				else
					self._starwars = true
				end
			end
			if stats.empire then
				self._empire = true
			end
			if stats.republic then
				self._republic = true
			end
			if stats.techno_union then
				self._techno_union = true
			end
			if stats.mandalorian then
				self._mandalorian = true
			end
			if stats.regen_rate then
				self._regen_rate = stats.regen_rate
			end	
			if stats.regen_rate_overheat then
				self._regen_rate_overheat = stats.regen_rate_overheat
			end	
			if stats.regen_ammo_time then
				self._regen_ammo_time = stats.regen_ammo_time
			end	
			if stats.overheat_pen then
				self._overheat_pen = stats.overheat_pen
			end	
			if stats.muzzleflash then
				self._muzzle_effect_pls = stats.muzzleflash
			end
			if stats.trail_effect then
				self._trail_effect_pls = stats.trail_effect
			end
			if stats.should_reload_immediately then
				self._should_reload_immediately = stats.should_reload_immediately
			end
			if stats.hip_mult then
				self._hipfire_mult = self._hipfire_mult * stats.hip_mult
			end
			if stats.ads_moving_mult then
				self._ads_moving_mult = self._ads_moving_mult * stats.ads_moving_mult
			end
			if stats.fire2 then
				self:weapon_tweak_data().sounds.fire2 = stats.fire2
			end
			if stats.stop_fire2 then
				self:weapon_tweak_data().sounds.stop_fire2 = stats.stop_fire2
			end
			if stats.lock_burst then
				self._lock_burst = true
			end
			if stats.big_scope then
				self._has_big_scope = true
			end
			if stats.movement_speed_add then
				self._movement_speed_add = self._movement_speed_add + stats.movement_speed_add
			end
			if stats.sks_clip then
				if self:weapon_tweak_data().timers then
					self:weapon_tweak_data().timers.reload_exit_not_empty = 1.2
				end
				self:weapon_tweak_data().tactical_reload = nil
				self:ammo_base():weapon_tweak_data().tactical_reload = nil
			end
			if stats.no_chamber then
				self:weapon_tweak_data().tactical_reload = nil
				self:ammo_base():weapon_tweak_data().tactical_reload = nil
			end

			if not self:is_npc() then
				if stats.sms then
					if not self._sms then
						self._sms = stats.sms
					else
						self._sms = self._sms + (1 * (stats.sms - 1))
					end
					self._smt = self:weapon_tweak_data().fire_mode_data and ((self:weapon_tweak_data().fire_mode_data.fire_rate * 5) * (self:weapon_tweak_data().smt_mult or 1))
				end
				if stats.rms then
					if not self._rms then
						self._rms = stats.rms
					else
						self._rms = self._rms + (1 * (stats.rms - 1))
					end
				end
			end
		end
	self._custom_stats_done = true --stops from repeating and hiking up the effects of the multiplicative stats
	end

	if self._movement_speed_add then
		self._movement_penalty = math.max(self._movement_penalty + self._movement_speed_add, 0.1)
	end

	for part_id, stats in pairs(custom_stats) do
		if stats.can_shoot_through_wall ~= nil then
			self._can_shoot_through_wall = stats.can_shoot_through_wall
		end
		if stats.can_shoot_through_enemy ~= nil then
			self._can_shoot_through_enemy = stats.can_shoot_through_enemy
		end
		if stats.can_shoot_through_shield ~= nil then
			self._can_shoot_through_shield = stats.can_shoot_through_shield
		end
		if stats.can_shoot_through_titan_shield ~= nil then
			self._can_shoot_through_titan_shield = stats.can_shoot_through_titan_shield
		end
		if stats.can_shoot_through_enemy_unlim ~= nil then
			self._can_shoot_through_enemy_unlim = stats.can_shoot_through_enemy_unlim
		end
		if stats.armor_piercing_override then
			self._armor_piercing_chance = stats.armor_piercing_override
		end
		if stats.dot_data_name and self._ammo_data then
			self._ammo_data.dot_data_name = stats.dot_data_name
		end
		if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
			if stats.ammo_pickup_min_mul then
				self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
			end

			if stats.ammo_pickup_max_mul then
				self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
			end
		end
	end

	if self._cbfd_to_add_this_check_elsewhere then
		self._sound_fire:set_switch("suppressed", "regular")
	end

	if self._ammo_data and self._ammo_data.muzzleflash == nil and self._muzzle_effect_table and self._muzzle_effect_pls then
		self._muzzle_effect_table.effect = Idstring(self._muzzle_effect_pls)
	end

	local ignore_tracer = nil
	if self._trail_effect_table then
		if self._starwars == true then
			self._use_shell_ejection_effect = nil
			ignore_tracer = true
			if self._empire then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_e" .. ((self:is_npc() and "_npc") or "" ))
			elseif self._republic then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_r" .. ((self:is_npc() and "_npc") or ""))
			elseif self._techno_union then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_t" .. ((self:is_npc() and "_npc") or ""))
			elseif self._mandalorian then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_m" .. ((self:is_npc() and "_npc") or ""))
			else
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail" .. ((self:is_npc() and "_npc") or ""))
			end
		elseif self._trail_effect_pls then
			self._trail_effect_table.effect = Idstring(self._trail_effect_pls)
		elseif self._terminator then
			self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_t" .. ((self:is_npc() and "_npc") or ""))
			ignore_tracer = true
		elseif self._plasma_b then
			self._trail_effect_table.effect = Idstring("_dmc/effects/plasma_b_trail")
			ignore_tracer = true
		elseif self._nato then
			self._trail_effect_table.effect = Idstring("_dmc/effects/nato_trail")
		elseif self._warsaw then
			self._trail_effect_table.effect = Idstring("_dmc/effects/warsaw_trail")
		elseif self._large_tracers then
			self._trail_effect_table.effect = Idstring("_dmc/effects/large_trail")
		end 
		
		pewpewpewpew = os.date("%m%d")
		if pewpewpewpew == "0401" and not ignore_tracer then
			self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_m" .. ((self:is_npc() and "_npc") or ""))
			if self._nato then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail" .. ((self:is_npc() and "_npc") or ""))
			elseif self._warsaw then
				self._trail_effect_table.effect = Idstring("_dmc/effects/sterwers_trail_e" .. ((self:is_npc() and "_npc") or ""))
			end
		end
	end	

	if self._has_burst_fire and self:weapon_tweak_data().BURST_FIRE_DEFAULT then 
		self:_set_burst_mode(true, true)
	end

	self._fire_rate_multiplier = managers.blackmarket:fire_rate_multiplier(self._name_id, self:categories(), self._silencer, nil, current_state, self._blueprint)
	self._fire_rate_multiplier = self._fire_rate_multiplier * self._rof_mult


	self._has_scope = managers.weapon_factory:has_perk("scope", self._factory_id, self._blueprint)

	self:precalculate_ammo_pickup()
end

function NewRaycastWeaponBase:armor_piercing_chance()
	local final_ap = 0
	local skill_ap = self._skill_global_ap or 0
	local is_single = self._single_fire_ap_add and self:fire_mode() == "single" and not self:in_burst_mode()
	for _, category in ipairs(self:categories()) do
		if managers.player:has_category_upgrade(category, "ap_bullets") then
			skill_ap = skill_ap + managers.player:upgrade_value(category, "ap_bullets", 1)
		end
	end
	skill_ap = skill_ap + ((is_single and self._single_fire_ap_add) or 0)
	if self._fire_mode == ids_volley then
		local fire_mode_data = self:weapon_tweak_data().fire_mode_data
		local volley_fire_mode = fire_mode_data and fire_mode_data.volley
		local volley_ap = volley_fire_mode and volley_fire_mode.armor_piercing_chance or 0
		final_ap = math.min(volley_ap + skill_ap, 1)
		return final_ap or 0
	else
		final_ap = math.min((self._armor_piercing_chance or 0) + skill_ap, 1)
		return final_ap or 0
	end
end

function NewRaycastWeaponBase:should_reload_immediately()
	return self._should_reload_immediately or self:weapon_tweak_data().should_reload_immediately
end

function NewRaycastWeaponBase:tweak_data_anim_play(anim, speed_multiplier, set_offset, set_offset2)
	if self._starwars then
		return
	end
	local orig_anim = anim
	local unit_anim = self:_get_tweak_data_weapon_animation(orig_anim)
	local effect_manager = World:effect_manager()

	if self._active_animation_effects[anim] then
		for _, effect in ipairs(self._active_animation_effects[anim]) do
			World:effect_manager():kill(effect)
		end
	end

	self._active_animation_effects[anim] = {}
	local data = tweak_data.weapon.factory[self._factory_id]

	if data.animations and data.animations[unit_anim] then
		local anim_name = data.animations[unit_anim]
		local ids_anim_name = Idstring(anim_name)
		local length = self._unit:anim_length(ids_anim_name)
		speed_multiplier = speed_multiplier or 1

		self._unit:anim_stop(ids_anim_name)
		self._unit:anim_play_to(ids_anim_name, length, speed_multiplier)

		local offset = self:_get_anim_start_offset(anim_name) or set_offset2

		if offset then
			self._unit:anim_set_time(ids_anim_name, offset)
		end
	end

	if data.animation_effects and data.animation_effects[unit_anim] then
		local effect_table = data.animation_effects[unit_anim]

		if effect_table then
			effect_table = clone(effect_table)
			effect_table.parent = effect_table.parent and self._unit:get_object(effect_table.parent)
			local effect = effect_manager:spawn(effect_table)

			table.insert(self._active_animation_effects[anim], effect)
		end
	end

	for part_id, data in pairs(self._parts) do
		if data.unit and data.animations and data.animations[unit_anim] then
			local anim_name = data.animations[unit_anim]
			local ids_anim_name = Idstring(anim_name)
			local length = data.unit:anim_length(ids_anim_name)
			speed_multiplier = speed_multiplier or 1

			data.unit:anim_stop(ids_anim_name)
			data.unit:anim_play_to(ids_anim_name, length, speed_multiplier)

			local offset = self:_get_anim_start_offset(anim_name) or set_offset

			if offset then
				data.unit:anim_set_time(ids_anim_name, offset)
			end
		end

		if data.unit and data.animation_effects and data.animation_effects[unit_anim] then
			local effect_table = data.animation_effects[unit_anim]

			if effect_table then
				effect_table = clone(effect_table)
				effect_table.parent = effect_table.parent and data.unit:get_object(effect_table.parent)
				local effect = effect_manager:spawn(effect_table)

				table.insert(self._active_animation_effects[anim], effect)
			end
		end
	end

	self:set_reload_objects_visible(true, anim)
	NewRaycastWeaponBase.super.tweak_data_anim_play(self, orig_anim, speed_multiplier)

	return true
end


function NewRaycastWeaponBase:tweak_data_anim_offset(anim, offset, second_gun)
	if self._starwars then
		return
	end
	local unit_anim = anim
	local data = tweak_data.weapon.factory[self._factory_id]
	if second_gun and alive(self._second_gun) then
		if data.animations and data.animations[unit_anim] then
			local anim_name = data.animations[unit_anim]
			local ids_anim_name = Idstring(anim_name)
			self._second_gun:base()._unit:anim_set_time(ids_anim_name, offset)
		end
		for part_id, data in pairs(self._second_gun:base()._parts) do
			if data.animations and data.animations[unit_anim] then
				local anim_name = data.animations[unit_anim]
				local ids_anim_name = Idstring(anim_name)
				data.unit:anim_set_time(ids_anim_name, offset)
			end
		end
	else
		if data.animations and data.animations[unit_anim] then
			local anim_name = data.animations[unit_anim]
			local ids_anim_name = Idstring(anim_name)
			self._unit:anim_set_time(ids_anim_name, offset)
		end
	
		for part_id, data in pairs(self._parts) do
			if data.animations and data.animations[unit_anim] then
				local anim_name = data.animations[unit_anim]
				local ids_anim_name = Idstring(anim_name)
				data.unit:anim_set_time(ids_anim_name, offset)
			end
		end
	end
	return true
end

function NewRaycastWeaponBase:precalculate_ammo_pickup()
	--Precalculate ammo pickup values.
	if self:weapon_tweak_data().AMMO_PICKUP then
		self._ammo_pickup = {self:weapon_tweak_data().AMMO_PICKUP[1], self:weapon_tweak_data().AMMO_PICKUP[2]} --Get base gun ammo pickup.

		--Pickup multiplier from skills.
		local pickup_multiplier = managers.player:upgrade_value("player", "fully_loaded_pick_up_multiplier", 1)

		for _, category in ipairs(self:categories()) do
			pickup_multiplier = pickup_multiplier + managers.player:upgrade_value(category, "pick_up_multiplier", 1) - 1
		end
		
		--Sharpeyed Team AI bonus, since now Enduring is a base thing
		pickup_multiplier = pickup_multiplier + managers.player:crew_ability_upgrade_value("crew_scavenge", 1) - 1

		--Apply multiplier from skills and ammo.
		self._ammo_pickup[1] = self._ammo_pickup[1] * pickup_multiplier * ((self._ammo_data and self._ammo_data.ammo_pickup_min_mul) or 1)
		self._ammo_pickup[2] = self._ammo_pickup[2] * pickup_multiplier * ((self._ammo_data and self._ammo_data.ammo_pickup_max_mul) or 1)
	end
end
					
--[[	fire rate multipler in-game stuff	]]--
function NewRaycastWeaponBase:fire_rate_multiplier( ignore_anims )
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
	if current_state then 
		if current_state:in_steelsight() then
			multiplier = multiplier * self._ads_rof_mult
		else
			multiplier = multiplier * self._hip_rof_mult
		end
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
		multiplier = multiplier * 0.8
	end

	return multiplier
end

local fire_original = NewRaycastWeaponBase.fire
function NewRaycastWeaponBase:fire(...)
	local result = fire_original(self, ...)
	self._shots_fired = self._shots_fired + 0.5 --increases in half increments due to the double call bug for this function
	if result and not self.AKIMBO and self:in_burst_mode() then
		if self:clip_empty() then
			self:cancel_burst()
		else
			self._burst_rounds_fired = self._burst_rounds_fired + 0.5
			self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 0.5
			if self._burst_rounds_remaining <= 0 then
				self:cancel_burst()
			end
		end
	end
	if self._disable_steelsight_recoil_anim then
		local camera = self._setup.user_unit:camera() and alive(self._setup.user_unit:camera():camera_unit()) and self._setup.user_unit:camera():camera_unit()
		if camera and managers.player:player_unit():movement():current_state():in_steelsight() then
			camera:play_redirect(Idstring("idle"))
		end
	end
	return result
end	

local toggle_firemode_original = NewRaycastWeaponBase.toggle_firemode
function NewRaycastWeaponBase:toggle_firemode(...)
	return self._has_burst_fire and not self._locked_fire_mode and not self._lock_burst and not self:gadget_overrides_weapon_functions() and self:_check_toggle_burst() or toggle_firemode_original(self, ...)
end

function NewRaycastWeaponBase:can_toggle_firemode()
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("can_toggle_firemode")
	end

	if self._toggable_fire_modes then
		return #self._toggable_fire_modes > 1
	end

	return not self._lock_burst and self._burst_rounds_remaining <= 0 and not self._macno and tweak_data.weapon[self._name_id].CAN_TOGGLE_FIREMODE
end


function NewRaycastWeaponBase:can_reload()
	if self:ammo_base()._starwars then
		return false
	else
		return self:ammo_base():get_ammo_remaining_in_clip() < self:ammo_base():get_ammo_total()
	end
end

function NewRaycastWeaponBase:_check_toggle_burst()
	if not self:is_npc() and not self._lock_burst and self._burst_rounds_remaining == 0 then
		if self:in_burst_mode() then
			self:_set_burst_mode(false, self.AKIMBO and not self._has_auto)
			return true
		elseif (self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE) or (self._fire_mode == NewRaycastWeaponBase.IDSTRING_AUTO and not self:can_toggle_firemode()) then
			self:_set_burst_mode(true, self.AKIMBO)
			return true
		end
	end
end


function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
	self._in_burst_mode = status
	self._fire_mode = NewRaycastWeaponBase["IDSTRING_" .. (status and "SINGLE" or self._has_auto and "AUTO" or "SINGLE")]
	
	if not skip_sound then
		self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
	end
	
	self:cancel_burst(nil, true)
end

function NewRaycastWeaponBase:can_use_burst_mode()
	return self._has_burst_fire
end

function NewRaycastWeaponBase:in_burst_mode()
	if self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE and self._in_burst_mode and not self:gadget_overrides_weapon_functions() then
		managers.hud:set_teammate_weapon_firemode_burst(self:selection_index())
		return true --self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE and self._in_burst_mode and not self:gadget_overrides_weapon_functions()
	else
		return false --self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE and self._in_burst_mode and not self:gadget_overrides_weapon_functions()
	end
end

function NewRaycastWeaponBase:burst_rounds_remaining()
	return self._burst_rounds_remaining > 0 and self._burst_rounds_remaining or false
end

function NewRaycastWeaponBase:cancel_burst(soft_cancel, macno)
	if self._adaptive_burst_size or not soft_cancel then
		if self._burst_rounds_remaining and self._burst_rounds_remaining > 0 and macno then
			self._macno = true
			self:play_sound("alarm_kosugi_on_slow_fade")
			self:play_sound("alarm_kosugi_off")
			if not self._i_know then
				self._i_know = 1
				managers.hud:show_hint( { text = "DON'T EVEN THINK ABOUT USING AUTOFIRE, OR I'LL KNOW" } )
			else
				self._i_know = self._i_know + 1
				if self._i_know == 5 then
					managers.hud:show_hint( { text = "TRYING TO BYPASS THE BURST DELAY MAKES THIS LONGER EACH TIME, FYI" } )
				end
			end
		end
		self._burst_rounds_remaining = 0
		if self._delayed_burst_recoil and self._burst_rounds_fired > 0 then
			self._setup.user_unit:movement():current_state():force_recoil_kick(self, self._burst_rounds_fired)
		end
		self._burst_rounds_fired = 0
	end
end	

--[[	Reload stuff	]]--
function NewRaycastWeaponBase:reload_speed_multiplier()
	if self._current_reload_speed_multiplier then
		return self._current_reload_speed_multiplier
	end
	local multiplier = self._reload_speed_mult
		
	for _, category in ipairs(self:categories()) do
		multiplier = multiplier * managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)

	if self:get_ammo_remaining_in_clip() ~= 0 then
		if self:weapon_tweak_data().reload_not_empty_speed_multiplier then
			multiplier = multiplier * self:weapon_tweak_data().reload_not_empty_speed_multiplier
		end
	end
	
	if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()

		if morale_boost_bonus then
			multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
		end
		
		if self._setup.user_unit:movement():next_reload_speed_multiplier() then
			multiplier = multiplier * self._setup.user_unit:movement():next_reload_speed_multiplier()
		end
	end
	
	if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1)
	end
	if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1)
	end
	multiplier = multiplier * managers.player:get_property("shock_and_awe_reload_multiplier", 1)
	multiplier = multiplier * managers.player:get_temporary_property("bloodthirst_reload_speed", 1)
	multiplier = multiplier * managers.player:upgrade_value("team", "crew_faster_reload", 1)

	multiplier = multiplier * self:reload_speed_stat()
	multiplier = managers.modifiers:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)

	--MERCENARY DECK
	if managers.player:has_category_upgrade("player","kmerc_reload_speed_per_max_armor") then
		local player = managers.player:local_player()
		if alive(player) then
			local dmg_ext = player:character_damage() 
			if dmg_ext then
				local rate_bonus = managers.player:upgrade_value("player","kmerc_reload_speed_per_max_armor",0)
				local rate_armor = tweak_data.upgrades.values.player.kmerc_generic_bonus_per_max_armor_rate
				local max_armor = dmg_ext:_max_armor()
				local bonus = math.floor(max_armor / rate_armor) * rate_bonus
				log(tostring( bonus ))
				multiplier = multiplier + bonus
			end
		end
	end

	return multiplier
end

function NewRaycastWeaponBase:enter_steelsight_speed_multiplier( mult_only )
	local multiplier = 1
	local ads_time = self:weapon_tweak_data().ads_speed or 0.200
	
	if not mult_only then
		multiplier = multiplier / ( ads_time / tweak_data.player.TRANSITION_DURATION)
	end

	multiplier = multiplier / self._ads_speed_mult
	
	for _, category in ipairs(self:categories()) do
		multiplier = multiplier / (1 + 1 - managers.player:upgrade_value(category, "enter_steelsight_speed_multiplier", 1))
	end
	
	multiplier = multiplier / ( 1 + 1 - managers.player:upgrade_value("weapon", "enter_steelsight_speed_multiplier", 1))
	
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
	ammo = math.round(ammo)
	return ammo
end

function NewRaycastWeaponBase:weapon_range()
	return self._weapon_range or 50000
end

function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
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
		if self._volley_damage_mul and self._volley_damage_mul_step and self._volley_ammo_usage then
			local dmg_mul_step = self._volley_damage_mul / self._volley_ammo_usage
			dmg_mul = ammo_usage > 0 and ammo_usage * dmg_mul_step
		end
		local result = {
			rays = {}
		}

		for i = 1, rays do
			local raycast_res = NewRaycastWeaponBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

			if raycast_res.enemies_in_cone then
				result.enemies_in_cone = result.enemies_in_cone or {}

				table.map_append(result.enemies_in_cone, raycast_res.enemies_in_cone)
			end

			result.hit_enemy = result.hit_enemy or raycast_res.hit_enemy

			table.list_append(result.rays, raycast_res.rays or {})
		end

		return result
	end

	return NewRaycastWeaponBase.super._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
end


function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit, dot_only)
	local is_rapidfire = self._burst_fire_range_multiplier and self:in_burst_mode()
	local is_fullauto = self._auto_fire_range_multiplier and not self:is_single_shot()
	local is_single = self:is_single_shot() and not self:in_burst_mode()
	local main_category = self.AKIMBO and self:categories()[2] or self:categories()[1]
	local damage_min_bonus = 1
	local check_col_ray_head = col_ray and col_ray.unit and col_ray.unit:character_damage() and col_ray.unit:character_damage()._ids_head_body_name and col_ray.body and col_ray.body:name() and col_ray.body:name() == col_ray.unit:character_damage()._ids_head_body_name
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
		for v, category in ipairs(self:categories()) do
			if current_state:in_steelsight() then
				falloff_start = falloff_start * managers.player:upgrade_value(category, "steelsight_range_inc", 1)
				falloff_end = falloff_end * managers.player:upgrade_value(category, "steelsight_range_inc", 1)
			end
			if ((self.AKIMBO and v == 2) or v == 1) and category == main_category then
				damage_min_bonus = damage_min_bonus * managers.player:upgrade_value(category, "damage_min_bonus", 1)
			end
		end
		if current_state:_is_using_bipod() then
			falloff_start = falloff_start * 1.3
			falloff_end = falloff_end * 1.3
		end
	end

	local firemode_range_mod = (is_rapidfire and self._burst_fire_range_multiplier) or (is_fullauto and self._auto_fire_range_multiplier) or (is_single and self._single_fire_range_multiplier) or 1
	falloff_start = falloff_start * firemode_range_mod
	falloff_end = falloff_end * firemode_range_mod
	
	if self._alt_fire_active and self._alt_fire_data and self._alt_fire_data.range_mul then
		falloff_start = falloff_start * self._alt_fire_data.range_mul
		falloff_end = falloff_end * self._alt_fire_data.range_mul
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

	if dot_only then
		falloff_start = falloff_start * self._duration_falloff_start_mult
		falloff_end = falloff_end * self._duration_falloff_end_mult
	end
	
	--Cache falloff values for usage in hitmarkers.
	self.near_falloff_distance = falloff_start
	self.far_falloff_distance = falloff_end

	if not self:in_burst_mode() and not is_rapidfire and ((self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase")) or 
		(managers.player:has_category_upgrade("player", "headshot_no_falloff") and self:is_single_shot() and self:is_category("assault_rifle", "snp") and check_col_ray_head)) then
		return damage
	end
	
	--Minimum damage multiplier when taking falloff into account
	local minimum_damage = damage_falloff and damage_falloff.min_mult or 0.3
	
	--Have a harsher falloff for Shotguns
	if self._rays and self._rays > 1 then
		if damage_falloff and damage_falloff.ignore_rays then
		else
			minimum_damage = 0.05 * damage_min_bonus
		end
	end

	minimum_damage = ( minimum_damage * (self._damage_min_mult or 1)) / managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
	
	--[[
	log("DAMAGE: " .. tostring( damage * 10 ))
	log("DAMAGE MIN: " .. tostring( damage * minimum_damage * 10 ))
	log("HIT AT: " .. tostring( distance / 100 ) .. " METERS")
	log("DAMAGE DONE: " .. tostring( (math.max((1 - math.min(1, math.max(0, distance - falloff_start) / (falloff_end - falloff_start))) * damage, minimum_damage * damage)) * 10 ) .. "\n\n")
	--]]
	
	--Compute final damage.
	return math.lerp(damage, minimum_damage * damage, math.min(1, math.max(0, distance - falloff_start) / (falloff_end - falloff_start)))
end


function NewRaycastWeaponBase:reload_exit_expire_t()
	if not self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.reload_exit_empty or nil
	end
	return self:weapon_tweak_data().timers.shotgun_reload_exit_empty or 0.7
end

function NewRaycastWeaponBase:reload_not_empty_exit_expire_t()
	if not self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.reload_exit_not_empty or nil
	end
	return self:weapon_tweak_data().timers.shotgun_reload_exit_not_empty or 0.3
end

function NewRaycastWeaponBase:exit_run_speed_multiplier()
	local multiplier = 1
	local sprintout_anim_time = self:weapon_tweak_data().sprintout_anim_time or 0.4
	local ads_speed = self:weapon_tweak_data().ads_speed or 0.200

	for _, category in ipairs(self:categories()) do
		multiplier = multiplier * managers.player:upgrade_value(category, "exit_run_speed_multiplier", 1)
	end
	multiplier = multiplier * managers.player:upgrade_value("weapon", "exit_run_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)

	--multiplier = multiplier / ( (self:weapon_tweak_data().sprintout_time or 0.300) / (self:weapon_tweak_data().sprintout_anim_time or 0.350) )
	multiplier = multiplier / ( (ads_speed / self:enter_steelsight_speed_multiplier(true)) * 1 / sprintout_anim_time )
	return multiplier
end


local scope_colors = {
	green = Color(0, 1, 0),
	greenmid = Color(1, 0.5, 0),
	greenlow = Color(1, 0, 0),
	greenno = Color(1, 0, 1),
	red = Color(1, 0, 0),
	redmid = Color(1, 0, 1),
	redlow = Color(0, 0, 1),
	redno = Color(0, 1, 1),
	off = Color(0, 0, 0, 0),
}
function NewRaycastWeaponBase:set_scope_range_distance(distance)
	if not self._assembly_complete then
		return
	end
	
	local damage_falloff = self:weapon_tweak_data().damage_falloff
	local green_display = self:weapon_tweak_data().green_display
	local falloff_start = damage_falloff and damage_falloff.start_dist or 3000
	local falloff_end = damage_falloff and damage_falloff.end_dist or 6000
	falloff_start = falloff_start * (self._damage_near_mul or 1)
	falloff_end = falloff_end * (self._damage_near_mul or 1)
	local is_visible = nil
	local is_player = self._setup.user_unit == managers.player:player_unit()
	local steelsight_swap_state = false

	if is_player then
		steelsight_swap_state = self._setup.user_unit:camera() and alive(self._setup.user_unit:camera():camera_unit()) and self._setup.user_unit:camera():camera_unit():base():get_steelsight_swap_state() or false
	end

	if self._scopes and self._parts then
		local part = nil

		for i, part_id in ipairs(self._scopes) do
			part = self._parts[part_id]   

			local digital_gui = part and part.unit:digital_gui()

			is_visible = (part.steelsight_visible == nil or part.steelsight_visible == steelsight_swap_state) or nil

			if digital_gui and digital_gui.number_set then
				part.unit:digital_gui():number_set(distance and math.round(distance) or false, false)
				if distance then
					if (distance * 100) < falloff_start then
						part.unit:digital_gui()._title_text:set_color( not is_visible and scope_colors.off or green_display and scope_colors.green or scope_colors.red )
					elseif (distance * 100) > falloff_start and (distance * 100) < falloff_end then
						part.unit:digital_gui()._title_text:set_color( not is_visible and scope_colors.off or green_display and scope_colors.greenmid or scope_colors.redmid )
					elseif (distance * 100) > falloff_end then
						part.unit:digital_gui()._title_text:set_color( not is_visible and scope_colors.off or green_display and scope_colors.greenlow or scope_colors.redlow )
					end
				else
					part.unit:digital_gui()._title_text:set_color( not is_visible and scope_colors.off or green_display and scope_colors.greenno or scope_colors.redno )
				end
			end

			local digital_gui_upper = part and part.unit:digital_gui_upper()

			if digital_gui_upper and digital_gui_upper.number_set then
				part.unit:digital_gui_upper():number_set(distance and math.round(distance) or false, false)
				if distance then
					if (distance * 100) < falloff_start then
						part.unit:digital_gui_upper()._title_text:set_color( not is_visible and scope_colors.off or scope_colors.green )
					elseif (distance * 100) > falloff_start and (distance * 100) < falloff_end then
						part.unit:digital_gui_upper()._title_text:set_color( not is_visible and scope_colors.off or scope_colors.greenmid )
					elseif (distance * 100) > falloff_end then
						part.unit:digital_gui_upper()._title_text:set_color( not is_visible and scope_colors.off or scope_colors.greenlow )
					end
				else
					part.unit:digital_gui_upper()._title_text:set_color( not is_visible and scope_colors.off or scope_colors.greenno )
				end
			end
		end
	end
end

function NewRaycastWeaponBase:damage_multiplier()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	local multiplier = managers.blackmarket:damage_multiplier(self._name_id, self:categories(), self._silencer, nil, current_state, self._blueprint)

	if self._alt_fire_active and self._alt_fire_data then
		multiplier = multiplier * (self._alt_fire_data.damage_mul or 1)
		multiplier = multiplier * self._alt_dmg_mult
	end

	return multiplier
end

--Fix for reload objects not appearing
function NewRaycastWeaponBase:set_reload_objects_visible(visible, anim)
	local data = tweak_data.weapon.factory[self._factory_id]
	local ignore_reload_objects_empty = self:weapon_tweak_data().ignore_reload_objects_empty
	local ignore_reload_objects_not_empty = self:weapon_tweak_data().ignore_reload_objects_not_empty
	local reload_objects = anim and data.reload_objects and data.reload_objects[anim]
	if not anim or (anim and ( (not ignore_reload_objects_not_empty and anim == "reload_not_empty") or (not ignore_reload_objects_empty and anim == "reload") )) then
		if reload_objects then
			self._reload_objects[self._name_id] = reload_objects
		elseif self._reload_objects then
			reload_objects = self._reload_objects[self.name_id]
		end
	
		if reload_objects then
			self:set_objects_visible(self._unit, reload_objects, visible)
		end
	
		for part_id, part in pairs(self._parts) do
			local reload_objects = anim and part.reload_objects and part.reload_objects[anim]
	
			if reload_objects then
				self._reload_objects[part_id] = reload_objects
			elseif self._reload_objects then
				reload_objects = self._reload_objects[part_id]
			end
	
			if reload_objects and part.unit then
				self:set_objects_visible(part.unit, reload_objects, visible)
			end
		end
	end
end

--Fix to remember burst mode
function NewRaycastWeaponBase:record_fire_mode()
	self._recorded_fire_modes = self._recorded_fire_modes or {}
	self._recorded_burst_mode = self:in_burst_mode()
	self._recorded_fire_modes[self:_weapon_tweak_data_id()] = self._fire_mode
end

function NewRaycastWeaponBase:get_recorded_fire_mode(id)
	if self._recorded_fire_modes and self._recorded_fire_modes[self:_weapon_tweak_data_id()] then
		if self._recorded_burst_mode and self._recorded_burst_mode == true then
			self:_set_burst_mode(true, true)
		end
		return self._recorded_fire_modes[self:_weapon_tweak_data_id()]
	end

	return nil
end

--Maybe hopefully fix the ammo eff. aced skill crash
function NewRaycastWeaponBase:_update_bullet_objects(ammo_func)
	if self._bullet_objects and not self:is_npc() then
		for i, objects in pairs(self._bullet_objects) do
			for _, object in ipairs(objects) do
				local ammo_base = self:ammo_base()
				local ammo = ammo_base[ammo_func](ammo_base)
				if alive(object[1]) then
					if object[1].set_visibility then
						object[1]:set_visibility(i <= ammo)
					end
				end
			end
		end
	end
end

function NewRaycastWeaponBase:get_object_damage_mult()
	if self._fire_mode == ids_volley then
		local fire_mode_data = self:weapon_tweak_data().fire_mode_data
		local volley_fire_mode = fire_mode_data and fire_mode_data.volley
		return volley_fire_mode and volley_fire_mode.object_damage_mult or 0.75
	elseif self._rays and self._rays == 1 and self:weapon_tweak_data().object_damage_mult_single_ray then
		return self:weapon_tweak_data().object_damage_mult_single_ray
	else
		return self:weapon_tweak_data().object_damage_mult or 1
	end
end

function NewRaycastWeaponBase:can_shoot_through_titan_shield()
	local fire_mode_data = self._fire_mode_data[self._fire_mode:key()]

	return fire_mode_data and fire_mode_data.can_shoot_through_titan_shield or self._can_shoot_through_titan_shield
end
function NewRaycastWeaponBase:can_shoot_through_enemy_unlim()
	local fire_mode_data = self._fire_mode_data[self._fire_mode:key()]

	return fire_mode_data and fire_mode_data.can_shoot_through_enemy_unlim or self._can_shoot_through_enemy_unlim
end


function NewRaycastWeaponBase:can_shoot_through_enemy()
	local can_shoot_through_enemy = nil
	--[[
	if self:fire_mode() == "auto" then
		for _, category in ipairs(self:categories()) do
			if managers.player:has_category_upgrade(category, "automatic_can_shoot_through_enemy") then
				can_shoot_through_enemy = true
				self._shoot_through_enemy_max_stacks = managers.player:upgrade_value(category, "automatic_can_shoot_through_enemy")[1]
				self._shoot_through_enemy_dmg_mult = managers.player:upgrade_value(category, "automatic_can_shoot_through_enemy")[2]
			end
		end
	end
	--]]
	if self._ammo_data and self._ammo_data.bullet_class ~= "InstantExplosiveBulletBase" then
		for _, category in ipairs(self:categories()) do
			if managers.player:has_category_upgrade(category, "can_shoot_through_enemy") then
				if self._rays > 1 then
					can_shoot_through_enemy = true
					break --you can already do it, stop the checks
				end
			end
		end
	end

	return can_shoot_through_enemy or self._can_shoot_through_enemy
end


-- 10th Anniversary Mutator Ammo
function NewRaycastWeaponBase:ammo_type_buff_add(ammo_id, ammo_buff_data)
	if self._buffs_data and self._buffs_data[ammo_id] then
		return
	end

	local change_data = {}

	if ammo_buff_data.extra_collisions then
		for class_name, collision_data in pairs(ammo_buff_data.extra_collisions) do
			local bullet_class = CoreSerialize.string_to_classtable(class_name)

			if bullet_class then
				self._extra_collisions = self._extra_collisions or {}
				self._extra_collisions[#self._extra_collisions + 1] = {
					bullet_class = bullet_class,
					dmg_mul = collision_data.dmg_mul,
					fire_dot_data = collision_data.fire_dot_data
				}
				change_data.collisions = change_data.collisions or {}

				table.insert(change_data.collisions, #self._extra_collisions)
			end
		end
	end

	if next(change_data) then
		self._buffs_data = self._buffs_data or {}
		self._buffs_data[ammo_id] = change_data
	end
end

function NewRaycastWeaponBase:ammo_type_buff_remove(ammo_id)
	local buff_data = self._buffs_data and self._buffs_data[ammo_id]

	if not buff_data then
		return
	end

	self._buffs_data[ammo_id] = nil

	if not next(self._buffs_data) then
		self._buffs_data = nil
	end

	if self._extra_collisions then
		for i, col_i in ipairs(buff_data.collisions) do
			self._extra_collisions[col_i] = nil
		end

		if not next(self._extra_collisions) then
			self._extra_collisions = nil
		end
	end
end

function NewRaycastWeaponBase:extra_collisions()
	return self._extra_collisions
end