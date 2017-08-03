if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function PlayerStandard:_start_action_intimidate(t, secondary)
	if not self._intimidate_t or t - self._intimidate_t > tweak_data.player.movement_state.interaction_delay then
		local skip_alert = managers.groupai:state():whisper_mode()
		local voice_type, plural, prime_target = self:_get_unit_intimidation_action(not secondary, not secondary, true, false, true, nil, nil, nil, secondary)
		if prime_target and prime_target.unit and prime_target.unit.base and (prime_target.unit:base().unintimidateable or prime_target.unit:anim_data() and prime_target.unit:anim_data().unintimidateable) then
			return
		end
		local interact_type, sound_name
		local sound_suffix = plural and "plu" or "sin"
		if voice_type == "stop" then
			interact_type = "cmd_stop"
			sound_name = "f02x_" .. sound_suffix
		elseif voice_type == "stop_cop" then
			interact_type = "cmd_stop"
			sound_name = "l01x_" .. sound_suffix
		elseif voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
			interact_type = "cmd_point"
			if voice_type == "mark_cop_quiet" then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
			elseif tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
			end
			if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
				prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
				managers.network:session():send_to_peers_synched("spot_enemy", prime_target.unit)
			end
		elseif voice_type == "down" then
			interact_type = "cmd_down"
			sound_name = "f02x_" .. sound_suffix
			self._shout_down_t = t
		elseif voice_type == "down_cop" then
			interact_type = "cmd_down"
			sound_name = "l02x_" .. sound_suffix
		elseif voice_type == "cuff_cop" then
			interact_type = "cmd_down"
			sound_name = "l03x_" .. sound_suffix
		elseif voice_type == "down_stay" then
			interact_type = "cmd_down"
			if self._shout_down_t and t < self._shout_down_t + 2 then
				sound_name = "f03b_any"
			else
				sound_name = "f03a_" .. sound_suffix
			end
		elseif voice_type == "come" then
			interact_type = "cmd_come"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
			if static_data then
				local character_code = static_data.ssuffix
				sound_name = "f21" .. character_code .. "_sin"
			else
				sound_name = "f38_any"
			end
		elseif voice_type == "revive" then
			interact_type = "cmd_get_up"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
			if not static_data then
				return
			end
			local character_code = static_data.ssuffix
			sound_name = "f36x_any"
			if math.random() < self._ext_movement:rally_skill_data().revive_chance then
				prime_target.unit:interaction():interact(self._unit)
			end
			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "boost" then
			interact_type = "cmd_gogo"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
			if not static_data then
				return
			end
			local character_code = static_data.ssuffix
			sound_name = "g18"
			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "escort" then
			interact_type = "cmd_point"
			sound_name = "f41_" .. sound_suffix
		elseif voice_type == "escort_keep" or voice_type == "escort_go" then
			interact_type = "cmd_point"
			sound_name = "f40_any"
		elseif voice_type == "bridge_codeword" then
			sound_name = "bri_14"
			interact_type = "cmd_point"
		elseif voice_type == "bridge_chair" then
			sound_name = "bri_29"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_interrogate" then
			sound_name = "f46x_any"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_escort" then
			sound_name = "f41_any"
			interact_type = "cmd_point"
		elseif voice_type == "mark_camera" then
			sound_name = "f39_any"
			interact_type = "cmd_point"
			prime_target.unit:contour():add("mark_unit", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "mark_turret" then
			sound_name = "f44x_any"
			interact_type = "cmd_point"
			local type = prime_target.unit:base().get_type and prime_target.unit:base():get_type()
			prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(type), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "ai_stay" then
			sound_name = "f48x_any"
			interact_type = "cmd_stop"
		end
		self:_do_action_intimidate(t, interact_type, sound_name, skip_alert)
	end
end

function PlayerStandard:_update_omniscience(t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("player", "standstill_omniscience") or managers.player:current_state() == "civilian" or self:_interacting() or self._ext_movement:has_carry_restriction() or self:is_deploying() or self:_changing_weapon() or self:_is_throwing_projectile() or self:_is_meleeing() or self:_on_zipline() or self._moving or self:running() or self:_is_reloading() or self:in_air() or self:in_steelsight() or self:is_equipping() or self:shooting() or not tweak_data.player.omniscience
	if action_forbidden then
		if self._state_data.omniscience_t then
			self._state_data.omniscience_t = nil
		end
		return
	end
	self._state_data.omniscience_t = self._state_data.omniscience_t or t + tweak_data.player.omniscience.start_t
	if t >= self._state_data.omniscience_t then
		local sensed_targets = World:find_units_quick("sphere", self._unit:movement():m_pos(), tweak_data.player.omniscience.sense_radius, managers.slot:get_mask("trip_mine_targets"))
		for _, unit in ipairs(sensed_targets) do
			if alive(unit) and not unit:base():char_tweak().is_escort then
				self._state_data.omniscience_units_detected = self._state_data.omniscience_units_detected or {}
				if not self._state_data.omniscience_units_detected[unit:key()] or t >= self._state_data.omniscience_units_detected[unit:key()] then
					self._state_data.omniscience_units_detected[unit:key()] = t + tweak_data.player.omniscience.target_resense_t
					managers.game_play_central:auto_highlight_enemy(unit, true)
				end
			else
			end
		end
		self._state_data.omniscience_t = t + tweak_data.player.omniscience.interval_t
	end
end

end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

function PlayerStandard:_do_action_melee(t, input, skip_damage)
	self._state_data.meleeing = nil
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local pre_calc_hit_ray = tweak_data.blackmarket.melee_weapons[melee_entry].hit_pre_calculation
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t)
	local charge_bonus_start = tweak_data.blackmarket.melee_weapons[melee_entry].charge_bonus_start or 2 --i.e. never get the bonus
	local charge_bonus_speed = tweak_data.blackmarket.melee_weapons[melee_entry].charge_bonus_speed or 1
	local speed = tweak_data.blackmarket.melee_weapons[melee_entry].speed_mult or 1
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	local melee_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].expire_t or 0
	local melee_repeat_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t or 0
	melee_damage_delay = math.min(melee_damage_delay, tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t)
	local primary = managers.blackmarket:equipped_primary()
	local primary_id = primary.weapon_id
	local bayonet_id = managers.blackmarket:equipped_bayonet(primary_id)
	local bayonet_melee = false
	if bayonet_id and self._equipped_unit:base():selection_index() == 2 then
		bayonet_melee = true
	end
		
	if charge_lerp_value and charge_lerp_value > charge_bonus_start then
		speed = math.max( speed, speed * (charge_lerp_value * charge_bonus_speed) )
		melee_damage_delay = math.min( melee_damage_delay, melee_damage_delay / (charge_lerp_value * charge_bonus_speed) )
		melee_expire_t = math.min( melee_expire_t, melee_expire_t / (charge_lerp_value * charge_bonus_speed) )
		melee_repeat_expire_t = math.min( melee_repeat_expire_t, melee_repeat_expire_t / (charge_lerp_value * charge_bonus_speed) )
	end
	
	self._state_data.melee_expire_t = t + melee_expire_t
	self._state_data.melee_repeat_expire_t = t + math.min(melee_repeat_expire_t, melee_expire_t)
	if not instant_hit and not skip_damage then
		self._state_data.melee_damage_delay_t = t + melee_damage_delay
		if pre_calc_hit_ray then
			self._state_data.melee_hit_ray = self:_calc_melee_hit_ray(t, 20) or true
		else
			self._state_data.melee_hit_ray = nil
		end
	end
	local send_redirect = instant_hit and (bayonet_melee and "melee_bayonet" or "melee") or "melee_item"
	if instant_hit then
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", self._unit, send_redirect)
	else
		self._ext_network:send("sync_melee_discharge")
	end
	if self._state_data.melee_charge_shake then
		self._ext_camera:shaker():stop(self._state_data.melee_charge_shake)
		self._state_data.melee_charge_shake = nil
	end
	self._melee_attack_var = 0
	if instant_hit then
		local hit = skip_damage or self:_do_melee_damage(t, bayonet_melee)
		if hit then
			if not bayonet_melee or not self:get_animation("melee_bayonet") then
			end
			self._ext_camera:play_redirect((self:get_animation("melee")))
		else
			if not bayonet_melee or not self:get_animation("melee_miss_bayonet") then
			end
			self._ext_camera:play_redirect((self:get_animation("melee_miss")))
		end
	else
		local anim_attack_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_vars
		--START--
		local anim_attack_charged_amount = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_amount or 0.5 --At half charge, use the charge variant
		local anim_attack_charged_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_vars
		local anim_attack_left_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_left_vars
		local anim_attack_right_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_right_vars
		local timing_fix = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix
		local timing_fix_speed_mult = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix_speed_mult or 1
		--END--
		self._melee_attack_var = anim_attack_vars and math.random(#anim_attack_vars)
		self:_play_melee_sound(melee_entry, "hit_air", self._melee_attack_var)
		local melee_item_tweak_anim = "attack"
		local melee_item_prefix = ""
		local melee_item_suffix = ""
		local anim_attack_param = anim_attack_vars and anim_attack_vars[self._melee_attack_var]
		
		--START--
		if anim_attack_charged_vars and charge_lerp_value >= anim_attack_charged_amount then
			self._melee_attack_var = anim_attack_charged_vars and math.random(#anim_attack_charged_vars)
			anim_attack_param = anim_attack_charged_vars and anim_attack_charged_vars[self._melee_attack_var]
		elseif self._stick_move then
			local angle = mvector3.angle(self._stick_move, math.X)
			if anim_attack_left_vars and angle and (angle <= 180) and (angle >= 135) then
				self._melee_attack_var = anim_attack_left_vars and math.random(#anim_attack_left_vars)
				anim_attack_param = anim_attack_left_vars and anim_attack_left_vars[self._melee_attack_var]
			elseif anim_attack_right_vars and angle and (angle <= 45) and (angle >= 0) then
				self._melee_attack_var = anim_attack_right_vars and math.random(#anim_attack_right_vars)
				anim_attack_param = anim_attack_right_vars and anim_attack_right_vars[self._melee_attack_var]
			end
		end
		local fix_anim_timer = anim_attack_param and timing_fix and table.contains(timing_fix, anim_attack_param)
		if fix_anim_timer then
			speed = speed * timing_fix_speed_mult
		end
		--END--
		local state = self._ext_camera:play_redirect(self:get_animation("melee_attack"), speed)
		
		if anim_attack_param then
			self._camera_unit:anim_state_machine():set_parameter(state, anim_attack_param, 1)
			melee_item_prefix = anim_attack_param .. "_"
		end
		if self._state_data.melee_hit_ray and self._state_data.melee_hit_ray ~= true then
			self._camera_unit:anim_state_machine():set_parameter(state, "hit", 1)
			melee_item_suffix = "_hit"
		end
		melee_item_tweak_anim = melee_item_prefix .. melee_item_tweak_anim .. melee_item_suffix
		self._camera_unit:base():play_anim_melee_item(melee_item_tweak_anim)
	end
end

	local update_original = PlayerStandard.update
	local start_steelsight_original = PlayerStandard._start_action_steelsight
	local end_steelsight_original = PlayerStandard._end_action_steelsight

	function PlayerStandard:update(...)
		local weapon = self._unit:inventory():equipped_unit():base()
		if weapon:get_name_id() == "m134" then
			weapon:update_spin()
		end
		
		return update_original(self, ...)
	end
	
	function PlayerStandard:_start_action_steelsight(...)
		start_steelsight_original(self, ...)
		
		if self._state_data.in_steelsight or self._steelsight_wanted then
			local weapon = self._unit:inventory():equipped_unit():base()
			if weapon:get_name_id() == "m134" then
				weapon:vulcan_enter_steelsight()
			end
		end
	end

	function PlayerStandard:_end_action_steelsight(...)
		end_steelsight_original(self, ...)

		if not self._state_data.in_steelsight then
			local weapon = self._unit:inventory():equipped_unit():base()
			if weapon:get_name_id() == "m134" then
				weapon:vulcan_exit_steelsight()
			end
		end
	end

	function PlayerStandard:_stance_entered(unequipped)
		local stance_standard = tweak_data.player.stances.default[managers.player:current_state()] or tweak_data.player.stances.default.standard
		local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
		local stance_id
		local stance_mod = {
			translation = Vector3(0, 0, 0)
		}
		if not unequipped then
			stance_id = self._equipped_unit:base():get_stance_id()
			stance_mod = self._state_data.in_steelsight and self._equipped_unit:base().stance_mod and self._equipped_unit:base():stance_mod() or stance_mod
		end
		local stances
		if self:_is_meleeing() or self:_is_throwing_projectile() then
			stances = tweak_data.player.stances.default
		else
			stances = tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
		end
		local misc_attribs = stances.standard
		if self:_is_using_bipod() and not self:_is_throwing_projectile() then
			misc_attribs = stances.bipod
			if self._state_data.in_steelsight then 
				misc_attribs = stances.steelsight
			end
		else
			misc_attribs = self._state_data.in_steelsight and stances.steelsight or self._state_data.ducking and stances.crouched or stances.standard
		end
		local duration = tweak_data.player.TRANSITION_DURATION + (self._equipped_unit:base():transition_duration() or 0)
		local duration_multiplier = self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
		local new_fov = self:get_zoom_fov(misc_attribs) + 0
		self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, duration)
		managers.menu:set_mouse_sensitivity(self:in_steelsight())
	end

	local melee_vars = {
		"player_melee",
		"player_melee_var2"
	}
	function PlayerStandard:_do_melee_damage(t, bayonet_melee, melee_hit_ray)
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
		local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
		local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t, melee_damage_delay)
		self._ext_camera:play_shaker(melee_vars[math.random(#melee_vars)], math.max(0.3, charge_lerp_value))
		local sphere_cast_radius = 20
		local col_ray
		local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
		end
		if col_ray and alive(col_ray.unit) then
			local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(charge_lerp_value)
			local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().categories and self._equipped_unit:base():weapon_tweak_data().categories[1], "melee_knockdown_mul", 1))
			damage = damage * managers.player:get_melee_dmg_multiplier()
			damage_effect = damage_effect * damage_effect_mul
			col_ray.sphere_cast_radius = sphere_cast_radius
			local hit_unit = col_ray.unit
			if hit_unit:character_damage() then
				if bayonet_melee then
					self._unit:sound():play("fairbairn_hit_body", nil, false)
				elseif special_weapon == "taser" and charge_lerp_value ~= 1 then
					self._unit:sound():play("melee_hit_gen", nil, false)
				else
					self:_play_melee_sound(melee_entry, "hit_body")
				end
				if not hit_unit:character_damage()._no_blood then
					managers.game_play_central:play_impact_flesh({col_ray = col_ray})
					managers.game_play_central:play_impact_sound_and_effects({
						col_ray = col_ray,
						no_decal = true,
						no_sound = true
					})
				end
				self._camera_unit:base():play_anim_melee_item("hit_body")
			elseif self._on_melee_restart_drill and hit_unit:base() and hit_unit:base().is_drill then
				hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
			else
				if bayonet_melee then
					self._unit:sound():play("knife_hit_gen", nil, false)
				elseif special_weapon == "taser" and charge_lerp_value ~= 1 then
					self._unit:sound():play("melee_hit_gen", nil, false)
				else
					self:_play_melee_sound(melee_entry, "hit_gen")
				end
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					effect = Idstring("effects/payday2/particles/impacts/fallback_impact_pd2"),
					no_decal = true,
					no_sound = true
				})
			end
			if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
				col_ray.body:extension().damage:damage_melee(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
				if hit_unit:id() ~= -1 then
					managers.network:session():send_to_peers_synched("sync_body_damage_melee", col_ray.body, self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
				end
			end
			managers.rumble:play("melee_hit")
			managers.game_play_central:physics_push(col_ray)
			local character_unit, shield_knock
			local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")
			if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) then
				shield_knock = true
				character_unit = hit_unit:parent()
			end
			character_unit = character_unit or hit_unit
			if character_unit:character_damage() and character_unit:character_damage().damage_melee then
				local dmg_multiplier = 1
				if not managers.enemy:is_civilian(character_unit) and not managers.groupai:state():is_enemy_special(character_unit) then
					dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "non_special_melee_multiplier", 1)
				else
					dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)
				end
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[melee_entry].stats.weapon_type) .. "_damage_multiplier", 1)
				if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
					self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
					self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
					local stack = self._state_data.stacking_dmg_mul.melee
					if stack[1] and t < stack[1] then
						dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("melee", "stacking_hit_damage_multiplier", 0) * stack[2])
					else
						stack[2] = 0
					end
				end
				local health_ratio = self._ext_damage:health_ratio()
				local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, "melee")
				if damage_health_ratio > 0 then
					local damage_ratio = damage_health_ratio
					dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_ratio)
				end
				dmg_multiplier = dmg_multiplier * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
				if character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) and managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech") then
					managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
					self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
				end
				--local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
				local action_data = {}
				action_data.variant = "melee"
				if special_weapon == "taser" and charge_lerp_value == 1 then
					action_data.variant = "taser_tased"
				end
				action_data.damage = shield_knock and 0 or damage * dmg_multiplier
				action_data.damage_effect = damage_effect
				action_data.attacker_unit = self._unit
				action_data.col_ray = col_ray
				action_data.shield_knock = can_shield_knock
				action_data.name_id = melee_entry
				action_data.charge_lerp_value = charge_lerp_value
				if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
					self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
					self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
					local stack = self._state_data.stacking_dmg_mul.melee
					if character_unit:character_damage().dead and not character_unit:character_damage():dead() then
						stack[1] = t + managers.player:upgrade_value("melee", "stacking_hit_expire_t", 1)
						stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_melee_weapon_dmg_mul_stacks or 5)
					else
						stack[1] = nil
						stack[2] = 0
					end
				end
				local defense_data = character_unit:character_damage():damage_melee(action_data)
				self:_check_melee_dot_damage(col_ray, defense_data, melee_entry)
				return defense_data
			end
		else
		end
		if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
			self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
			self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
			local stack = self._state_data.stacking_dmg_mul.melee
			stack[1] = nil
			stack[2] = 0
		end
		return col_ray
	end

end