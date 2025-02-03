function PlayerBipod:_enter(enter_data)
	local player = managers.player:player_unit()

	if player and self._unit:base().is_local_player then
		self._bipod = true
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		local speed_multiplier = self._equipped_unit:base():get_property("bipod_deploy_multiplier") or 1
		local reload_name_id = tweak_data.animations.reload_name_id or self._equipped_unit:base().name_id
		local equipped_unit_id = self._equipped_unit:base().name_id
		self._unit_deploy_position = player:position()

		speed_multiplier = speed_multiplier * managers.player:upgrade_value("player", "bipod_deploy_speed_mult", 1)

		self._unit:camera():camera_unit():base():set_limits(tweak_data.bipod_camera_spin_limit, tweak_data.bipod_camera_pitch_limit)
		PlayerBipod.super:start_deploying_bipod((tweak_data.timers.deploy_bipod or 1)/speed_multiplier)
		self._equipped_unit:base():tweak_data_anim_stop("undeploy")

		local require_optic = tweak_data.bipod_req_scope
		local has_optic = self._equipped_unit:base()._has_scope
		local disable_bipod_anims = tweak_data.no_bipod_anims or (require_optic and not has_optic) or nil

		if self._equipped_unit:base()._deploy_anim_override then
			equipped_unit_id = self._equipped_unit:base()._deploy_anim_override
		end

		if not tweak_data.custom_bipod == true then
			local result = not disable_bipod_anims and self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_enter .. "_" .. equipped_unit_id), speed_multiplier)
			local result_deploy = self._equipped_unit:base():tweak_data_anim_play("deploy", speed_multiplier)
		end
		self._headbob = 0
		self._target_headbob = 0

		self._ext_camera:set_shaker_parameter("headbob", "amplitude", 0)

		if not disable_bipod_anims then
			if not tweak_data.custom_bipod == true then
				PlayerStandard.ANIM_STATES.bipod = {
					recoil = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id),
					recoil_steelsight = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id),
					recoil_enter = Idstring(tweak_data.animations.bipod_recoil_enter .. "_" .. equipped_unit_id),
					recoil_loop = Idstring(tweak_data.animations.bipod_recoil_loop .. "_" .. equipped_unit_id),
					recoil_exit = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id)
				}
			end
			if tweak_data.use_custom_anim_state then
				PlayerStandard.ANIM_STATES.bipod = {
					recoil = Idstring("recoil_steelsight"),
					recoil_steelsight = Idstring("recoil_steelsight"),
					recoil_enter = Idstring("recoil_enter"),
					recoil_loop = Idstring("recoil_loop"),
					recoil_exit = Idstring("recoil_exit")
				}
			end
			self:set_animation_state("bipod")
		end
		self._unit:sound_source():post_event("wp_steady_in")
		self:_stance_entered()
		self:_husk_bipod_data()
	end
end

function PlayerBipod:exit(state_data, new_state_name)
	PlayerBipod.super.exit(self, state_data or self._state_data, new_state_name)

	self._bipod = nil
	local tweak_data = self._equipped_unit:base():weapon_tweak_data()
	local speed_multiplier = self._equipped_unit:base():get_property("bipod_deploy_multiplier") or 1
	local equipped_unit_id = self._equipped_unit:base().name_id

	if self._equipped_unit:base()._deploy_anim_override then
		equipped_unit_id = self._equipped_unit:base()._deploy_anim_override
	end

	self._equipped_unit:base():tweak_data_anim_stop("deploy")

	local require_optic = tweak_data.anim_req_scope
	local has_optic = self._equipped_unit:base()._has_scope
	local disable_bipod_anims = tweak_data.no_bipod_anims or (require_optic and not has_optic) or nil

	if not tweak_data.custom_bipod == true then
		local result = not disable_bipod_anims and self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_exit .. "_" .. equipped_unit_id), speed_multiplier)
		local result_deploy = self._equipped_unit:base():tweak_data_anim_play("undeploy", speed_multiplier)
	end

	self._unit:camera():camera_unit():base():remove_limits()

	self._unit:camera():camera_unit():base().bipod_location = nil
	local exit_data = {
		skip_equip = true
	}
	self._dye_risk = nil

	self:set_animation_state("standard")
	self._unit:sound_source():post_event("wp_steady_out")

	local peer_id = managers.network:session():peer_by_unit(self._unit):id()

	Application:trace("PlayerBipod:exit: ", peer_id)
	managers.player:set_bipod_data_for_peer({
		peer_id = peer_id
	})

	self._state_data.previous_state = "bipod"

	return exit_data
end

function PlayerBipod:_check_action_steelsight(t, input)
	local new_action = nil
	if alive(self._equipped_unit) then
		local result = nil
		local weap_base = self._equipped_unit:base()
		if weap_base.manages_steelsight and weap_base:manages_steelsight() then
			if input.btn_steelsight_press and weap_base.steelsight_pressed then
				result = weap_base:steelsight_pressed()
			elseif input.btn_steelsight_release and weap_base.steelsight_released then
				result = weap_base:steelsight_released()
			end
			if result then
				if result.enter_steelsight and not self._state_data.in_steelsight then
					self:_start_action_steelsight(t)
					new_action = true
				elseif result.exit_steelsight and self._state_data.in_steelsight then
					self:_end_action_steelsight(t)
					new_action = true
				end
			end
			return new_action
		end
	end
	if managers.user:get_setting("hold_to_steelsight") and input.btn_steelsight_release then
		self._steelsight_wanted = false
		if self._state_data.in_steelsight then
			self:_end_action_steelsight(t)
			new_action = true
		end
	elseif input.btn_steelsight_press or self._steelsight_wanted then
		if self._state_data.in_steelsight then
			self:_end_action_steelsight(t)
			new_action = true
		elseif not self._state_data.in_steelsight then
			self:_start_action_steelsight(t)
			new_action = true
		end
	end
	return new_action
end

function PlayerBipod:_stance_entered(unequipped)
	local stance_standard = tweak_data.player.stances.default[managers.player:current_state()] or tweak_data.player.stances.default.standard
	local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
	local stance_id = nil
	local stance_mod = {
		translation = Vector3(0, 0, 0),
		rotation = Rotation(0, 0, 0)
	}

	if not unequipped then
		stance_id = self._equipped_unit:base():get_stance_id()

		if self._state_data.in_steelsight and self._equipped_unit:base().stance_mod then
			stance_mod = self._equipped_unit:base():stance_mod() or stance_mod
		end

		if self._state_data.in_steelsight and self:_is_using_bipod() then
			if self._equipped_unit:base()._deploy_ads_stance_mod.translation then
				stance_mod.translation = stance_mod.translation + self._equipped_unit:base()._deploy_ads_stance_mod.translation
			end
			if self._equipped_unit:base()._deploy_ads_stance_mod.rotation then
				stance_mod.rotation = stance_mod.rotation * self._equipped_unit:base()._deploy_ads_stance_mod.rotation
			end
		end
	end

	local stances = nil
	stances = (self:_is_meleeing() or self:_is_throwing_projectile()) and tweak_data.player.stances.default or tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
	local misc_attribs = stances.standard

	misc_attribs = (not self:_is_using_bipod() or self:_is_throwing_projectile() or stances.bipod) and (self._state_data.in_steelsight and stances.steelsight or self._state_data.ducking and stances.crouched or stances.standard)
	if self:_is_using_bipod() then
		misc_attribs = (self._state_data.in_steelsight and stances.steelsight) or stances.bipod
	end

	if not misc_attribs then
		stances = self._equipped_unit:base():weapon_tweak_data().stances
		misc_attribs = (self._state_data.in_steelsight and stances.steelsight) or stances.bipod
	end

	local head_duration = tweak_data.player.TRANSITION_DURATION
	local head_duration_multiplier = 1
	local duration_multiplier = not self._state_data.in_full_steelsight and self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
	local duration = head_duration + (self._equipped_unit:base():transition_duration() or 0)
	local new_fov = self:get_zoom_fov(stances.standard) + 0

	self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, duration, head_duration_multiplier, head_duration)
	managers.menu:set_mouse_sensitivity(self:in_steelsight())

	if PlayerStandard.set_ads_objects then
		if not unequipped then
			if self._state_data.in_steelsight then
				DelayedCalls:Add("FancyScopeCheckDelay", 0.175, function()
					if self._state_data.in_steelsight then
						self:set_ads_objects(true)
					end
				end)
			else
				self:set_ads_objects(false)
			end
		end
	end
end

function PlayerBipod:update(t, dt)
	PlayerBipod.super.update(self, t, dt)

	local deploy_valid = true 
	local movement_distance = (self._unit_deploy_position - managers.player:player_unit():position()):length()

	if not managers.player:player_unit():mover():standing() or movement_distance > 10 or not deploy_valid then
		self:exit(nil, "standard")
		managers.player:set_player_state("standard")
	end
end

function PlayerBipod:_update_movement(t, dt)
	if restoration.Options:GetValue("OTHER/WeaponHandling/MoveCancelBipod") then
		local current_state = managers.player:get_current_state()
		if self._move_dir then
			self:_unmount_bipod()
		end
	end
end

function PlayerBipod:_update_check_actions(t, dt)
	local input = self:_get_input(t, dt)

	self:_determine_move_direction()
	self:_update_interaction_timers(t)
	self:_update_throw_projectile_timers(t, input)
	self:_update_reload_timers(t, dt, input)
	self:_update_melee_timers(t, input)
	self:_update_equip_weapon_timers(t, input)
	self:_update_running_timers(t)
	self:_update_zipline_timers(t, dt)

	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end

	self:_update_foley(t, input)

	local new_action = false
	new_action = new_action or self:_check_action_weapon_firemode(t, input) -- check for firemode
	new_action = self:_check_action_reload(t, input)
	new_action = new_action or self:_check_action_weapon_gadget(t, input)

	if not new_action then
		new_action = self:_check_action_primary_attack(t, input)

		if not new_action then
			self:_check_stop_shooting()
		end

		self._shooting = new_action
	end

	--[[new_action = new_action or]] self:_check_action_jump(t, input)
	--[[new_action = new_action or]] self:_check_action_run(t, input)
	--[[new_action = new_action or]] self:_check_change_weapon(t, input)
	--[[new_action = new_action or]] self:_check_action_unmount_bipod(t, input)
	--[[new_action = new_action or]] self:_check_action_intimidate(t, input)
	--[[new_action = new_action or]] self:_check_action_throw_projectile(t, input)

	self:_check_action_steelsight(t, input)
	self:_check_use_item(t, input)
	self:_check_action_night_vision(t, input)
	self:_find_pickups(t)
end

function PlayerBipod:get_movement_state()
	if self._state_data.in_steelsight and self._state_data.in_full_steelsight then
		return self._moving and "moving_steelsight" or "steelsight"
	else
		return "bipod"
	end
end

function PlayerBipod:_check_action_run(t, input)
	if self._state_data.previous_state and self._state_data.previous_state == "carry" then
		return
	end

	local move = self._controller:get_input_axis("move")

	if input.btn_run_state and move.y > 0.1 then
		self:_unmount_bipod()

		local current_state = managers.player:get_current_state()

		if current_state then
			current_state:_start_action_running(t)
		end

		return true
	end


	local weap_base = alive(self._equipped_unit) and self._equipped_unit:base()

	local second_sight_sprint = restoration.Options:GetValue("OTHER/WeaponHandling/SecondSightSprint")
	if  input.btn_run_press and second_sight_sprint and weap_base.toggle_second_sight and self:in_steelsight() then
		 weap_base:toggle_second_sight(self)
	end

	return false
end