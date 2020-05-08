function NewRaycastWeaponBase:get_add_head_shot_mul()
	if self:is_category("smg", "lmg", "assault_rifle", "minigun", "pistol") and self._fire_mode == ids_auto then
		return self._add_head_shot_mul
	end
	return nil
end

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

		local user_unit = managers.player:player_unit()

		if user_unit then
			user_unit:movement():current_state():send_reload_interupt()
		end

		self:set_reload_objects_visible(false)

		self._reload_objects = {}
	end
	
	function NewRaycastWeaponBase:reload_expire_t()
		if self._use_shotgun_reload then
			local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
			if self._started_reload_empty or self:weapon_tweak_data().tactical_reload ~= 1 then
				return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
			else
				return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
			end
		end
		return nil
	end
	
	function NewRaycastWeaponBase:update_reloading(t, dt, time_left)
		if self._use_shotgun_reload and t > self._next_shell_reloded_t then
			local speed_multiplier = self:reload_speed_multiplier()
			self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
			if self._started_reload_empty or self:weapon_tweak_data().tactical_reload ~= 1 then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
				return true
			else
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
				return true
			end
			managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
			return true
		end
	end	
end

NewRaycastWeaponBase.DEFAULT_BURST_SIZE = 3
NewRaycastWeaponBase.IDSTRING_SINGLE = Idstring("single")
NewRaycastWeaponBase.IDSTRING_AUTO = Idstring("auto")

function NewRaycastWeaponBase:conditional_accuracy_multiplier(current_state)
	local mul = 1

	if not current_state then
		return mul
	end

	local pm = managers.player

	--Will do this in a more proper way some other time.
	if current_state:in_steelsight() and self:is_category("assault_rifle", "smg", "snp") --[[and self:is_single_shot()]] then
		mul = mul + 1 - pm:upgrade_value("player", "single_shot_accuracy_inc", 1)
	end

	if current_state:in_steelsight() then
		for _, category in ipairs(self:categories()) do
			mul = mul + 1 - managers.player:upgrade_value(category, "steelsight_accuracy_inc", 1)
		end
	end

	if current_state._moving then
		mul = mul + 1 - pm:upgrade_value("player", "weapon_movement_stability", 1)
	end

	mul = mul + 1 - pm:get_property("desperado", 1)

	return self:_convert_add_to_mul(mul)
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
		spread_x = self._spread * current_spread_value --self:_get_spread_from_number(user_unit, current_state, current_spread_value)
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
	
	if managers.player:current_state() == "bipod" then
		spread_mult = spread_mult * 0.5
	end
	
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
	local mult = 1
	if self._delayed_burst_recoil and self:in_burst_mode() and self:burst_rounds_remaining() then
		mult = 0
	end
	
	if self._name_id == "m134" and not self._vulcan_firing then
		return 0
	end

	return recoil_multiplier_original(self, ...)
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

--Returns the weapon's current concealment stat.
function RaycastWeaponBase:get_concealment()
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
function NewRaycastWeaponBase:_update_stats_values(disallow_replenish)
	old_update_stats_values(self, disallow_replenish)
	
	self._reload_speed_mult = self._reload_speed_mult or 1
	self._ads_speed_mult = self._ads_speed_mult or 1
	self._rof_mult = 1
	self._hipfire_mod = 1
	self._flame_max_range = self:weapon_tweak_data().flame_max_range or nil
	
	self._deploy_anim_override = self:weapon_tweak_data().deploy_anim_override or nil
	self._deploy_ads_stance_mod = self:weapon_tweak_data().deploy_ads_stance_mod or {translation = Vector3(0, 0, 0), rotation = Rotation(0, 0, 0)}		
		
	self._can_shoot_through_titan_shield = self:weapon_tweak_data().can_shoot_through_titan_shield or false --implementing Heavy AP
	if self:weapon_tweak_data().heavy_AP then --for convenience
		self._can_shoot_through_titan_shield = true
		self._can_shoot_through_shield = true
		self._can_shoot_through_wall = true
		self._can_shoot_through_enemies = true
		self:weapon_tweak_data().armor_piercing_chance = 1
	end

	if self:weapon_tweak_data().standard_AP then --for convenience
		self._can_shoot_through_titan_shield = false
		self._can_shoot_through_shield = true
		self._can_shoot_through_wall = true
		self._can_shoot_through_enemies = true
		self:weapon_tweak_data().armor_piercing_chance = 1
	end

	if self:weapon_tweak_data().no_AP then --for convenience
		self._can_shoot_through_titan_shield = false
		self._can_shoot_through_shield = false
		self._can_shoot_through_wall = false
		self._can_shoot_through_enemies = false
		self:weapon_tweak_data().armor_piercing_chance = 0
	end
	
	if not self:is_npc() then
		local weapon = {
			factory_id = self._factory_id,
			blueprint = self._blueprint
		}
		self._current_concealment = managers.blackmarket:calculate_weapon_concealment(weapon) + managers.blackmarket:get_silencer_concealment_modifiers(weapon)

		self._burst_rounds_remaining = 0
		self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto")
		
		self._has_burst_fire = (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
		
		--self._has_burst_fire = (not self._locked_fire_mode or managers.weapon_factor:has_perk("fire_mode_burst", self._factory_id, self._blueprint) or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false
		--self._locked_fire_mode = self._locked_fire_mode or managers.weapon_factor:has_perk("fire_mode_burst", self._factory_id, self._blueprint) and Idstring("burst")
		self._burst_size = self:weapon_tweak_data().BURST_FIRE or NewRaycastWeaponBase.DEFAULT_BURST_SIZE
		self._adaptive_burst_size = self:weapon_tweak_data().ADAPTIVE_BURST_SIZE ~= false
		self._burst_fire_rate_multiplier = self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1
		self._delayed_burst_recoil = self:weapon_tweak_data().DELAYED_BURST_RECOIL
		
		self._burst_rounds_fired = 0
	else
		self._can_shoot_through_titan_shield = false --to prevent npc abuse
	end		
	
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
		
		if stats.beretta_burst then
			self:weapon_tweak_data().BURST_FIRE = 3	
			self:weapon_tweak_data().ADAPTIVE_BURST_SIZE = false	
		end			

		if stats.can_shoot_through_titan_shield then
			self._can_shoot_through_titan_shield = true
		end

		if stats.is_pistol then
			if self:weapon_tweak_data().categories then
				self:weapon_tweak_data().categories = {"pistol"}
			end
		end

		if stats.heavy_AP then --for convenience
			self._can_shoot_through_titan_shield = true
			self._can_shoot_through_shield = true
			self._can_shoot_through_wall = true
			self._can_shoot_through_enemies = true
			self:weapon_tweak_data().armor_piercing_chance = 1
		end

		if stats.standard_AP then --for convenience
			self._can_shoot_through_titan_shield = false
			self._can_shoot_through_shield = true
			self._can_shoot_through_wall = true
			self._can_shoot_through_enemies = true
			self:weapon_tweak_data().armor_piercing_chance = 1
		end

		if stats.no_AP then --for convenience
			self._can_shoot_through_titan_shield = false
			self._can_shoot_through_shield = false
			self._can_shoot_through_wall = false
			self._can_shoot_through_enemies = false
			self:weapon_tweak_data().armor_piercing_chance = 0
		end

		--Leaving in case we ever want to give pistols their own kick
		if stats.use_pistol_kick then
			if self:weapon_tweak_data().kick then
				self:weapon_tweak_data().kick.standing = {
								0.6,
								0.8,
								-1,
								1
				}
				self:weapon_tweak_data().kick.crouching = {
								0.40002,
								0.53336,
								-0.6667,
								0.6667
				}
				self:weapon_tweak_data().kick.steelsight = {
								0.40002,
								0.53336,
								-0.6667,
								0.6667
				}
			end
		end

		--Basically give it new_m4 kick
		if stats.use_auto_kick then
			if self:weapon_tweak_data().kick then
				self:weapon_tweak_data().kick.standing = {
								0.6,
								0.8,
								-1,
								1
				}
				self:weapon_tweak_data().kick.crouching = {
								0.40002,
								0.53336,
								-0.6667,
								0.6667
				}
				self:weapon_tweak_data().kick.steelsight = {
								0.40002,
								0.53336,
								-0.6667,
								0.6667
				}
			end
		end
		
		--Ditto, give it Huntsman kick profile
		if stats.use_heavy_kick then
			if self:weapon_tweak_data().kick then
				self:weapon_tweak_data().kick.standing = {
								1.5,
								1.58,
								-0.16,
								0.16
				}
				self:weapon_tweak_data().kick.crouching = {
								1.06,
								1.12,
								-0.11,
								-0.11
				}
				self:weapon_tweak_data().kick.steelsight = {
								1.06,
								1.12,
								-0.11,
								-0.11
				}
			end
		end	

		--Flamethrower stuff, since fire DOT data doesn't like being changed in a normal custom stat
		if stats.use_rare_dot then
			if self:weapon_tweak_data().fire_dot_data then
				self:weapon_tweak_data().fire_dot_data = {
					dot_damage = 0.5,
					dot_trigger_max_distance = 999999,
					dot_trigger_chance = 50,
					dot_length = 6.1,
					dot_tick_period = 0.5
				}					
			end
		end		

		--Worst way to eat a steak, seriously what the fuck's wrong with you
		if stats.use_well_done_dot then
			if self:weapon_tweak_data().fire_dot_data then
				self:weapon_tweak_data().fire_dot_data = {
					dot_damage = 2,
					dot_trigger_max_distance = 999999,
					dot_trigger_chance = 50,
					dot_length = 1.6,
					dot_tick_period = 0.5
				}					
			end
		end					

	end
						
end
					
--[[	fire rate multipler in-game stuff	]]--
function NewRaycastWeaponBase:fire_rate_multiplier()
	local multiplier = self._rof_mult or 1
	
	if self:in_burst_mode() then
		multiplier = multiplier * (self._burst_fire_rate_multiplier or 1)
	end		
			
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

local fire_original = NewRaycastWeaponBase.fire
function NewRaycastWeaponBase:fire(...)
	local result = fire_original(self, ...)
	
	if result and not self.AKIMBO and self:in_burst_mode() then
		if self:clip_empty() then
			self:cancel_burst()
		else
			self._burst_rounds_fired = self._burst_rounds_fired + 1
			self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 1
			if self._burst_rounds_remaining <= 0 then
				self:cancel_burst()
			end
		end
	end
	
	return result
end	

local toggle_firemode_original = NewRaycastWeaponBase.toggle_firemode
function NewRaycastWeaponBase:toggle_firemode(...)
	return self._has_burst_fire and not self._locked_fire_mode and not self:gadget_overrides_weapon_functions() and self:_check_toggle_burst() or toggle_firemode_original(self, ...)
end

function NewRaycastWeaponBase:_check_toggle_burst()
	if self:in_burst_mode() then
		self:_set_burst_mode(false, self.AKIMBO and not self._has_auto)
		return true
	elseif (self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE) or (self._fire_mode == NewRaycastWeaponBase.IDSTRING_AUTO and not self:can_toggle_firemode()) then
		self:_set_burst_mode(true, self.AKIMBO)
		return true
	end
end

function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
	self._in_burst_mode = status
	self._fire_mode = NewRaycastWeaponBase["IDSTRING_" .. (status and "SINGLE" or self._has_auto and "AUTO" or "SINGLE")]
	
	if not skip_sound then
		self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
	end
	
	self:cancel_burst()
end

function NewRaycastWeaponBase:can_use_burst_mode()
	return self._has_burst_fire
end

function NewRaycastWeaponBase:in_burst_mode()
	return self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE and self._in_burst_mode and not self:gadget_overrides_weapon_functions()
end

function NewRaycastWeaponBase:burst_rounds_remaining()
	return self._burst_rounds_remaining > 0 and self._burst_rounds_remaining or false
end

function NewRaycastWeaponBase:cancel_burst(soft_cancel)
	if self._adaptive_burst_size or not soft_cancel then
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
