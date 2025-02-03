local norecoil_blacklist = { --From Zdann
	--Special
	["flamethrower_mk2"] = true,
	["system"] = true,
	["china"] = true,
	
	--Shotguns
	["r870_shotgun"] = true,
	["ksg"] = true,
	["boot"] = true,
	["m37"] = true,
	["m1897"] = true,
	["m590"] = true,
	
	--Sniper Rifles
	["winchester1874"] = true,
	["mosin"] = true,
	["m95"] = true,
	["r93"] = true,
	["msr"] = true,
	["model70"] = true,
	["r700"] = true,
	["sbl"] = true,
	["desertfox"] = true,
	["scout"] = true,
	
	--Pistols
	["peacemaker"] = true,
	--["model3"] = true
}

local melee_vars = {
	"player_melee",
	"player_melee_var2"
}

local sound_buffer = BeardLib.Utils:FindMod("Megumin's Staff") and XAudio and blt.xaudio.setup() and XAudio.Buffer:new( BeardLib.Utils:FindMod("Megumin's Staff").ModPath .. "assets/soundbank/megumins_staff_charge.ogg")
local is_pro = Global.game_settings and Global.game_settings.one_down
local original_init = PlayerStandard.init
function PlayerStandard:init(unit)
	original_init(self, unit)

	if is_pro then
		self._slotmask_bullet_impact_targets = self._slotmask_bullet_impact_targets + 3
	else
		self._slotmask_bullet_impact_targets = managers.mutators:modify_value("PlayerStandard:init:melee_slot_mask", self._slotmask_bullet_impact_targets)
		self._slotmask_bullet_impact_targets = managers.modifiers:modify_value("PlayerStandard:init:melee_slot_mask", self._slotmask_bullet_impact_targets)
	end
end

--Allows night vision to be used with any mask.
function PlayerStandard:set_night_vision_state(state)
	local mask_id = managers.blackmarket:equipped_mask().mask_id
	local mask_tweak = tweak_data.blackmarket.masks[mask_id]
	local night_vision = mask_tweak.night_vision 

	--If mask doesn't have night vision, it does.
	if not night_vision then
		night_vision = {
			effect = "color_night_vision",
			light = not _G.IS_VR and 0.3 or 0.1
		}
	end

	--This conditional is hilarious in vanilla btw.
	if self._state_data.night_vision_active == state then
		return
	end

	local ambient_color_key = CoreEnvironmentFeeder.PostAmbientColorFeeder.DATA_PATH_KEY
	--Use a proper fallback env instead of whatever vanilla does if there's an issue.
	local level_id = Global.game_settings.level_id
	local env_setting = level_id and tweak_data.levels[level_id].env_params and tweak_data.levels[level_id].env_params.color_grading
	local level_check = env_setting or managers.user:get_setting("video_color_grading")
	local effect = state and night_vision.effect or level_check

	if state then
		local function light_modifier(handler, feeder)
			local base_light = feeder._target and mvector3.copy(feeder._target) or Vector3()
			local light = night_vision.light

			return base_light + Vector3(light, light, light)
		end

		managers.viewport:create_global_environment_modifier(ambient_color_key, true, light_modifier)
	else
		managers.viewport:destroy_global_environment_modifier(ambient_color_key)
	end

	self._unit:sound():play(state and "night_vision_on" or "night_vision_off", nil, false)
	managers.environment_controller:set_default_color_grading(effect, state)
	managers.environment_controller:refresh_render_settings()

	self._state_data.night_vision_active = state
end	

--Stops disabled cameras from being markable.
local add_unit_to_char_table_old = PlayerStandard._add_unit_to_char_table
function PlayerStandard:_add_unit_to_char_table(char_table, unit, unit_type, ...)
	if unit_type ~= 3 or unit:base()._detection_delay or (Network:is_client() and unit:base().cam_disabled ~= true) then
		add_unit_to_char_table_old(self, char_table, unit, unit_type, ...)
	end
end

function PlayerStandard:push(vel, override_vel, override_vel_mult, allow_sprint, force_crouch)
	local override_vel_mult = override_vel_mult or 0
	if self._unit:mover() then
		if override_vel then
			--Scuffed as fuck way of doing this probably but I couldn't find another way to modify only x and y
			self._last_velocity_xy = self._last_velocity_xy:with_x(self._last_velocity_xy.x * override_vel_mult):with_y(self._last_velocity_xy.y * override_vel_mult)
		end
		self._last_velocity_xy = self._last_velocity_xy + vel

		self._unit:mover():set_velocity(self._last_velocity_xy)
	end
	if force_crouch or not allow_sprint then
		self:_interupt_action_running(managers.player:player_timer():time())
	end
	if force_crouch then
		self:_start_action_ducking(managers.player:player_timer():time(), true)
	end
end

function PlayerStandard:_activate_mover(mover, velocity)
	self._unit:activate_mover(mover, velocity)
	
	if not self._original_damping_standard then
		self._original_damping_standard = self._unit:mover():damping() --PLEASE DO NOT CHANGE THIS!!! WILL PROBABLY CAUSE WEIRD BEHAVIOR IN LADDERS!!!
	end

	if self._state_data.on_ladder then
		self._unit:mover():set_gravity(Vector3(0, 0, 0))
		self._unit:mover():set_damping(self._original_damping_standard)
	else
		self._unit:mover():set_gravity(Vector3(0, 0, -982)) --sets the actual gravity, you can set this to funny values if you want moon-jumping or something
		self._unit:mover():set_damping(self._tweak_data.gravity / self._tweak_data.terminal_velocity) --sets how fast the player accelerates downwards in the air, i have no clue what the value for this actually represents since its something like 0.14-ish.
	end

	if self._is_jumping then
		self._unit:mover():jump()
		self._unit:mover():set_velocity(velocity)
	end
end

function PlayerStandard:_start_action_ladder(t, ladder_unit)
	self._state_data.on_ladder = true

	self:_interupt_action_running(t)
	self._unit:mover():set_velocity(Vector3())
	self._unit:mover():set_gravity(Vector3(0, 0, 0))
	self._unit:mover():set_damping(self._original_damping_standard)
	self._unit:mover():jump()
	self._unit:movement():on_enter_ladder(ladder_unit)
end

function PlayerStandard:_end_action_ladder(t, input)
	if not self._state_data.on_ladder then
		return
	end

	self._state_data.on_ladder = false

	if self._unit:mover() then
		self._unit:mover():set_gravity(Vector3(0, 0, -982))
		self._unit:mover():set_damping(self._tweak_data.gravity / self._tweak_data.terminal_velocity)
	end

	self._unit:movement():on_exit_ladder()
end	

--These functions are for Breacher top off skill, allows reloading, shooting, and aiming while still interacting
function PlayerStandard:_start_action_interact(t, input, timer, interact_object)
	if not managers.player:has_category_upgrade("player", "no_interrupt_interaction") then
		self:_interupt_action_reload(t)
		self:_interupt_action_steelsight(t)
		self:_interupt_action_running(t)
		self:_interupt_action_charging_weapon(t)
	end

	local final_timer = timer
	final_timer = managers.modifiers:modify_value("PlayerStandard:OnStartInteraction", final_timer, interact_object)
	self._interact_expire_t = final_timer
	local start_timer = 0
	self._interact_params = {
		object = interact_object,
		timer = final_timer,
		tweak_data = interact_object:interaction().tweak_data
	}

	--Here!
	if not managers.player:has_category_upgrade("player", "no_interrupt_interaction") then
		self:_play_unequip_animation()
	end
	managers.hud:show_interaction_bar(start_timer, final_timer)
	managers.network:session():send_to_peers_synched("sync_teammate_progress", 1, true, self._interact_params.tweak_data, final_timer, false)
	self._unit:network():send("sync_interaction_anim", true, self._interact_params.tweak_data)
end

function PlayerStandard:_interupt_action_interact(t, input, complete)
	if self._interact_expire_t then
		self:_clear_tap_to_interact()

		self._interact_expire_t = nil

		if alive(self._interact_params.object) then
			self._interact_params.object:interaction():interact_interupt(self._unit, complete)
		end

		self._ext_camera:camera_unit():base():remove_limits()
		self._interaction:interupt_action_interact(self._unit)
		managers.network:session():send_to_peers_synched("sync_teammate_progress", 1, false, self._interact_params.tweak_data, 0, complete and true or false)

		self._interact_params = nil

		--Here!
		if not managers.player:has_category_upgrade("player", "no_interrupt_interaction") then
			self:_play_equip_animation()
		end
		managers.hud:hide_interaction_bar(complete)
		self._unit:network():send("sync_interaction_anim", false, "")
	end
end

function PlayerStandard:_start_action_ducking(t, no_slide)
	--Here!
	if self:_on_zipline() then
		return
	end

	self:_interupt_action_running(t)

	self._state_data.ducking = true

	self:_stance_entered()
	self:_update_crosshair_offset()

	local velocity = self._unit:mover():velocity()

	self._unit:kill_mover()
	self:_activate_mover(PlayerStandard.MOVER_DUCK, velocity)
	self._ext_network:send("action_change_pose", 2, self._unit:position())
	self:_upd_attention()
	
	if AdvMov and PlayerStandard._check_slide and self._unit:movement():is_above_stamina_threshold() then
		if not no_slide then
			self:_check_slide()
		end
		if self._is_wallrunning then
			self._end_wallrun_kick_dir = self:_get_end_wallrun_kick_dir()
			self:_cancel_wallrun(t, "fall")
		end
	end
end

function PlayerStandard:_end_action_ducking(t, skip_can_stand_check)
	local slide_threshold = self._slide_speed and self._slide_end_speed and self._slide_end_speed * 10 >= self._slide_speed

	if (self._is_sliding and self._state_data.in_air) or (self._dash_slide and (self._last_dash_time + 0.25 > t)) or not skip_can_stand_check and not self:_can_stand() then
		return
	end

	self._state_data.ducking = false

	self:_stance_entered()
	self:_update_crosshair_offset()

	local velocity = self._unit:mover():velocity()

	self._unit:kill_mover()
	self:_activate_mover(PlayerStandard.MOVER_STAND, velocity)
	self._ext_network:send("action_change_pose", 1, self._unit:position())
	self:_upd_attention()
	if AdvMov and PlayerStandard._cancel_slide then
		local dash_stats = tweak_data.upgrades.values.player.dash_stats
		local dash_base_t = dash_stats.grace_t
		if self._is_sliding and ((self._last_slide_time and (self._last_slide_time + (dash_base_t * 2)) > t) or (self._last_dash_time and (self._last_dash_time > t))) and not self._dash_slide then
			managers.player:apply_slow_debuff(1, 0.5, nil, true)
			self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN * 0.5)
		end
		self:_cancel_slide()
	end
end

function PlayerStandard:_check_action_throw_projectile(t, input)
	local projectile_entry = managers.blackmarket:equipped_projectile()
	local projectile_tweak = tweak_data.blackmarket.projectiles[projectile_entry]

	if projectile_tweak.is_a_grenade then
		return self:_check_action_throw_grenade(t, input)
	elseif projectile_tweak.ability then
		return self:_check_action_use_ability(t, input)
	end

	if self._state_data.projectile_throw_wanted then
		if not self._state_data.projectile_throw_allowed_t then
			self._state_data.projectile_throw_wanted = nil

			self:_do_action_throw_projectile(t, input)
		end

		return
	end

	local action_wanted = input.btn_projectile_press or input.btn_projectile_release or self._state_data.projectile_idle_wanted

	if not action_wanted then
		return
	end

	if not managers.player:can_throw_grenade() then
		self._state_data.projectile_throw_wanted = nil
		self._state_data.projectile_idle_wanted = nil

		return
	end

	if input.btn_projectile_release then
		if self._state_data.throwing_projectile then
			if self._state_data.projectile_throw_allowed_t then
				self._state_data.projectile_throw_wanted = true

				return
			end

			self:_do_action_throw_projectile(t, input)
		end

		return
	end

	--Here!
	local action_forbidden = not PlayerBase.USE_GRENADES or not self:_projectile_repeat_allowed() or self:chk_action_forbidden("interact") or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:is_deploying() or self:_changing_weapon() or self:_is_meleeing() or self:_is_using_bipod() or self:_in_burst()

	if action_forbidden then
		return
	end

	self:_start_action_throw_projectile(t, input)
	self._queue_fire = nil
	self._queue_burst = nil

	return true
end

function PlayerStandard:_check_action_throw_grenade(t, input)
	local action_wanted = input.btn_throw_grenade_press

	if not action_wanted then
		return
	end

	if not managers.player:can_throw_grenade() then
		return
	end

	--Here!
	local action_forbidden = not PlayerBase.USE_GRENADES or self:chk_action_forbidden("interact") or self._unit:base():stats_screen_visible() or self:_is_throwing_grenade() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:is_deploying() or self:_changing_weapon() or self:_is_meleeing() or self:_is_using_bipod() or self:_in_burst()

	if action_forbidden then
		return
	end

	self:_start_action_throw_grenade(t, input)
	self._queue_fire = nil
	self._queue_burst = nil

	return action_wanted
end

function PlayerStandard:_action_interact_forbidden()
	--Here!
	local action_forbidden = self:chk_action_forbidden("interact") or self._unit:base():stats_screen_visible() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self._ext_movement:has_carry_restriction() or self:is_deploying() or self._equipping_mask or self:_is_throwing_projectile() or self:_is_meleeing() or self:_on_zipline() or self:_in_burst()

	return action_forbidden
end

function PlayerStandard:_check_action_melee(t, input)
	if self._state_data.melee_attack_wanted then
		if not self._state_data.melee_attack_allowed_t then
			self._state_data.melee_attack_wanted = nil

			self:_do_action_melee(t, input)
		end

		return
	end

	local action_wanted = input.btn_melee_press or input.btn_melee_release or self._state_data.melee_charge_wanted

	if not action_wanted then
		return
	end

	if input.btn_melee_release then
		if self._state_data.meleeing then
			if self._state_data.melee_attack_allowed_t then
				self._state_data.melee_attack_wanted = true

				return
			end

			self:_do_action_melee(t, input)
		end
		
		self._state_data.chainsaw_t = nil

		return
	end

	--Here!
	local action_forbidden = not self:_melee_repeat_allowed() or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_throwing_projectile() or self:_is_using_bipod() or self:is_shooting_count() or self:_in_burst() or self._spin_up_shoot

	if action_forbidden then
		return
	end

	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant = tweak_data.blackmarket.melee_weapons[melee_entry].instant

	self:_start_action_melee(t, input, instant)
	self._queue_fire = nil
	self._queue_burst = nil

	--Stop chainsaw when no longer meleeing.
	if input.btn_melee_release then
		self._state_data.chainsaw_t = nil
	end

	return true
end

function PlayerStandard:_check_action_reload(t, input)
	local new_action = nil
	local action_wanted = input.btn_reload_press

	if action_wanted then
		--Here!
		local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_throwing_projectile()
		action_forbidden = action_forbidden or self:is_shooting_count() or self:_in_burst()

		if not action_forbidden and self._equipped_unit and not self._equipped_unit:base():clip_full() then
			self:_start_action_reload_enter(t)

			new_action = true
		end
		if restoration.Options:GetValue("OTHER/WeaponHandling/SeparateBowADS") then
			if alive(self._equipped_unit) then
				local result = nil
				local weap_base = self._equipped_unit:base()
		
				if weap_base.manages_steelsight and weap_base:manages_steelsight() then
					if input.btn_reload_press and weap_base.steelsight_pressed then
						result = weap_base:steelsight_pressed()
					elseif input.btn_steelsight_release and weap_base.steelsight_released then
						result = weap_base:steelsight_released()
					end
				end
			end
		end
	end

	return new_action
end

function PlayerStandard:_check_use_item(t, input)
	local pressed, released, holding = nil

	if self._use_item_expire_t and not self._interact_expire_t then
		pressed, released, holding = self:_check_tap_to_interact_inputs(t, input.btn_use_item_press, input.btn_use_item_release, input.btn_use_item_state)
	else
		holding = input.btn_use_item_state
		released = input.btn_use_item_release
		pressed = input.btn_use_item_press
	end

	local new_action = nil

	--Here!
	if pressed then
		local action_forbidden = self._use_item_expire_t or self._equipping_mask or self:_interacting() or self:_is_throwing_projectile() or self:_is_meleeing() or self:_in_burst()

		if not action_forbidden and managers.player:can_use_selected_equipment(self._unit) then
			self:_start_action_use_item(t)
			self._queue_burst = nil
			self._queue_fire = nil

			new_action = true
		end
	end

	if released then
		self:_interupt_action_use_item()
	end

	return new_action
end

function PlayerStandard:_check_change_weapon(t, input)
	local new_action = nil
	local action_wanted = input.btn_switch_weapon_press

	if action_wanted then
		local action_forbidden = self:_changing_weapon()
		action_forbidden = action_forbidden or self:_is_meleeing() or self._use_item_expire_t or self._change_item_expire_t
		--Here!
		action_forbidden = action_forbidden or self._unit:inventory():num_selections() == 1 or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_throwing_projectile() or self:_is_deploying_bipod()
		action_forbidden = action_forbidden or self:is_shooting_count() or self:_in_burst()

		if not action_forbidden then
			local data = {
				next = true
			}
			self._change_weapon_pressed_expire_t = t + 0.33

			self:_start_action_unequip_weapon(t, data, true)

			new_action = true

			managers.player:send_message(Message.OnSwitchWeapon)
		end
	end

	return new_action
end

function PlayerStandard:_check_action_equip(t, input)
	local new_action = nil
	local selection_wanted = input.btn_primary_choice

	if selection_wanted then
		local action_forbidden = self:chk_action_forbidden("equip")
		--Here!
		action_forbidden = action_forbidden or not self._ext_inventory:is_selection_available(selection_wanted) or self:_is_meleeing() or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_throwing_projectile() or self:_in_burst()

		if not action_forbidden then
			local new_action = not self._ext_inventory:is_equipped(selection_wanted)

			if new_action then
				self:_start_action_unequip_weapon(t, {
					selection_wanted = selection_wanted
				})
			end
		end
	end

	return new_action
end



function PlayerStandard:_check_action_jump(t, input)
	local new_action = nil
	local action_wanted = input.btn_jump_press

	if self._is_wallrunning and action_wanted then --_is_wallrunning will return nil without AdvMov, no need to check for its global
		self:_cancel_wallrun(t, "jump")
	elseif action_wanted then
		local action_forbidden = self._jump_t and t < self._jump_t + 0.55
		action_forbidden = action_forbidden or self._unit:base():stats_screen_visible() or self._state_data.in_air or self:_interacting() or self:_on_zipline() or self:_does_deploying_limit_movement() or self:_is_using_bipod()

		if not action_forbidden then
			if self._state_data.ducking and not AdvMov then --Advmov global check
				self:_interupt_action_ducking(t)
			else
				if self._state_data.on_ladder then
					self:_interupt_action_ladder(t)
				end

				local action_start_data = {}
				local jump_vel_z = tweak_data.player.movement_state.standard.movement.jump_velocity.z
				action_start_data.jump_vel_z = jump_vel_z

				if self._move_dir then
					local is_running = self._unit:movement():is_above_stamina_threshold() and ((not self._is_sliding and self._running and t - self._start_running_t > 0.4) 
						or (self._is_sliding and t - self._last_slide_time > 0.2))
					local jump_vel_xy = tweak_data.player.movement_state.standard.movement.jump_velocity.xy[is_running and "run" or "walk"]
					action_start_data.jump_vel_xy = jump_vel_xy

					if is_running then
						self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.SPRINT_JUMP_STAMINA_DRAIN or 0)
					end
				end

				new_action = self:_start_action_jump(t, action_start_data)
			end
		end
	end

	return new_action
end

--[[
Temp disabled, might revisit this?

function PlayerStandard:_check_action_jump(t, input)
	local new_action = nil
	local action_wanted = input.btn_jump_press

	if action_wanted then
		local action_forbidden = self._jump_t and t < self._jump_t + 0.55
		--Here!
		action_forbidden = action_forbidden or self._unit:base():stats_screen_visible() or self._state_data.in_air or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_on_zipline() or self:_does_deploying_limit_movement() or self:_is_using_bipod()

		if not action_forbidden then
			if self._state_data.ducking then
				self:_interupt_action_ducking(t)
			else
				if self._state_data.on_ladder then
					self:_interupt_action_ladder(t)
				end

				local action_start_data = {}
				local jump_vel_z = tweak_data.player.movement_state.standard.movement.jump_velocity.z
				action_start_data.jump_vel_z = jump_vel_z

				if self._move_dir then
					local is_running = self._running and self._unit:movement():is_above_stamina_threshold() and t - self._start_running_t > 0.4
					local jump_vel_xy = tweak_data.player.movement_state.standard.movement.jump_velocity.xy[is_running and "run" or "walk"]
					action_start_data.jump_vel_xy = jump_vel_xy

					if is_running then
						self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN)
					end
				end

				new_action = self:_start_action_jump(t, action_start_data)
			end
		end
	end

	return new_action
end

function PlayerStandard:_determine_move_direction()
	self._stick_move = self._controller:get_input_axis("move")

	if self._state_data.on_zipline then
		return
	end

	--Here!
	if mvector3.length(self._stick_move) < PlayerStandard.MOVEMENT_DEADZONE or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_does_deploying_limit_movement() then
		self._move_dir = nil
		self._normal_move_dir = nil
	else
		local ladder_unit = self._unit:movement():ladder_unit()

		if alive(ladder_unit) then
			local ladder_ext = ladder_unit:ladder()
			self._move_dir = mvector3.copy(self._stick_move)
			self._normal_move_dir = mvector3.copy(self._move_dir)
			local cam_flat_rot = Rotation(self._cam_fwd_flat, math.UP)

			mvector3.rotate_with(self._normal_move_dir, cam_flat_rot)

			local cam_rot = Rotation(self._cam_fwd, self._ext_camera:rotation():z())

			mvector3.rotate_with(self._move_dir, cam_rot)

			local up_dot = math.dot(self._move_dir, ladder_ext:up())
			local w_dir_dot = math.dot(self._move_dir, ladder_ext:w_dir())
			local normal_dot = math.dot(self._move_dir, ladder_ext:normal()) * -1
			local normal_offset = ladder_ext:get_normal_move_offset(self._unit:movement():m_pos())

			mvector3.set(self._move_dir, ladder_ext:up() * (up_dot + normal_dot))
			mvector3.add(self._move_dir, ladder_ext:w_dir() * w_dir_dot)
			mvector3.add(self._move_dir, ladder_ext:normal() * normal_offset)
		else
			self._move_dir = mvector3.copy(self._stick_move)
			local cam_flat_rot = Rotation(self._cam_fwd_flat, math.UP)

			mvector3.rotate_with(self._move_dir, cam_flat_rot)

			self._normal_move_dir = mvector3.copy(self._move_dir)
		end
	end
end

]]--


PlayerStandard._primary_action_funcs = {
	clip_empty = {
		default = function (self, t, input, params, weap_unit, weap_base)
			self:_start_action_reload_enter(t)

			return true
		end,
		singleeee = function (self, t, input, params, weap_unit, weap_base) --effectively disabled; will fallback to the "default" behavior listed above
			if weap_base.should_reload_immediately and weap_base:should_reload_immediately() then
				self:_start_action_reload_enter(t)
			else
				local trigger_pressed = input.btn_primary_attack_press

				if not trigger_pressed then
					if self._single_shot_autofire then
						trigger_pressed = input.btn_primary_attack_state
					else
						trigger_pressed = self._primary_attack_input_cache and self._primary_attack_input_cache < weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()

						if trigger_pressed then
							self._primary_attack_input_cache = nil
						end
					end
				end

				if trigger_pressed then
					self:_start_action_reload_enter(t)
				end
			end

			return true
		end
	},
	start_fire = {
		auto = function (self, t, input, params, weap_unit, weap_base, is_bow, force_ads_recoil_anims)
			if not weap_base:weapon_tweak_data().no_auto_anims then
				if restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims") and self._shooting and self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims or weap_base._disable_steelsight_recoil_anim and not weap_base:second_sight_spread_mult() then
				else
					self._unit:camera():play_redirect(self:get_animation("recoil_enter"))
				end
			end

			if (not weap_base.akimbo or weap_base:weapon_tweak_data().allow_akimbo_autofire) and (not weap_base.third_person_important or weap_base.third_person_important and not weap_base:third_person_important()) then
				self._ext_network:send("sync_start_auto_fire_sound", 0)
			end

			return true
		end
	},
	recoil_anim_redirect = {
		default = function (self, t, input, params, weap_unit, weap_base, is_bow, no_recoil_anims)
			local state = nil
			local zippy = weap_base and weap_base:weapon_tweak_data().zippy
			local jammed = zippy and weap_base._jammed
			local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
			if not zippy or jammed then
				if (not self._state_data.in_steelsight or (restoration.Options:GetValue("OTHER/WeaponHandling/SeparateBowADS") and is_bow)) then
					if (weap_base:in_burst_mode() and weap_base:weapon_tweak_data().BURST_SLAM) then
						state = self._ext_camera:play_redirect(self:get_animation("recoil_steelsight"), weap_base:fire_rate_multiplier())
					else
						state = self._ext_camera:play_redirect(self:get_animation("recoil"), weap_base:fire_rate_multiplier())
					end
				elseif weap_base:weapon_tweak_data().animations.recoil_steelsight then
					if no_recoil_anims and self._shooting and self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims or weap_base._disable_steelsight_recoil_anim and not weap_base:second_sight_spread_mult() then
					else
						state = self._ext_camera:play_redirect(self:get_animation("recoil_steelsight"), weap_base:fire_rate_multiplier())
					end
				end
			elseif zippy then
				if not self._state_data.in_steelsight then
					state = self._ext_camera:play_redirect(self:get_animation("recoil"), weap_base:fire_rate_multiplier(), 1.6)
				else
					local no_recoil_anims = restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims")
					state = self._ext_camera:play_redirect(self:get_animation(no_recoil_anims and "idle" or "recoil_steelsight"), weap_base:fire_rate_multiplier(), 1.6)
				end
			end

			if state then
				self._camera_unit:anim_state_machine():set_parameter(state, "alt_weight", weap_base:alt_fire_active() and 1 or 0)
			end

			return true
		end,
		auto = function (self, t, input, params, weap_unit, weap_base)
			return true
		end
	},
	sync_blank = {
		default = function (self, t, input, params, weap_unit, weap_base, impact)
			if weap_base.third_person_important and weap_base:third_person_important() then
				self._ext_network:send("shot_blank_reliable", impact, 0)
			else
				self._ext_network:send("shot_blank", impact, 0)
			end

			return true
		end,
		auto = function (self, t, input, params, weap_unit, weap_base, impact)
			if weap_base.third_person_important and weap_base:third_person_important() then
				self._ext_network:send("shot_blank_reliable", impact, 0)
			elseif weap_base.akimbo or weap_base:weapon_tweak_data().allow_akimbo_autofire then
				self._ext_network:send("shot_blank", impact, 0)
			end

			return true
		end
	}
}
PlayerStandard._primary_action_get_value = {
	chk_start_fire = {
		default = function (self, t, input, params, weap_unit, weap_base)
			return input.btn_primary_attack_state
		end,
		single = function (self, t, input, params, weap_unit, weap_base)
			if input.btn_primary_attack_press or self._queue_fire then
				return true
			end

			if self._single_shot_autofire then
				return input.btn_primary_attack_state
			end
			if not weap_base or weap_base and not weap_base:in_burst_mode() then
				return self._primary_attack_input_cache and self._primary_attack_input_cache < weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()
			end
		end,
		auto = function (self, t, input, params, weap_unit, weap_base)
			return input.btn_primary_attack_state
		end,
		burst = function (self, t, input, params, weap_unit, weap_base)
			return input.btn_primary_attack_press
		end,
		volley = function (self, t, input, params, weap_unit, weap_base)
			return input.btn_primary_attack_press
		end
	},
	fired = {
		default = function (self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
			return weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
		end,
		single = function (self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
			local trigger_pressed = nil
			if start_shooting then
				trigger_pressed = input.btn_primary_attack_press or self._queue_fire

				if not trigger_pressed then
					if self._single_shot_autofire then
						trigger_pressed = input.btn_primary_attack_state
					else
						trigger_pressed = self._primary_attack_input_cache and self._primary_attack_input_cache < weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()

						if trigger_pressed then
							self._primary_attack_input_cache = nil
						end
					end
				end
			end

			if weap_base:weapon_tweak_data().spin_up_semi then
				if not self._spin_up_shoot and not self._anim_played then
					self._anim_played = true
					local fire_anim_offset = weap_base:weapon_tweak_data().fire_anim_offset
					local fire_anim_offset2 = weap_base:weapon_tweak_data().fire_anim_offset2
					if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier( ignore_rof_mult_anims ), fire_anim_offset, fire_anim_offset2) then
						weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier( ignore_rof_mult_anims ), fire_anim_offset, fire_anim_offset2)
					end
				end
				return not self._already_fired and weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
			else
				if (trigger_pressed or self._queue_fire) and start_shooting then
					return weap_base:trigger_pressed(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
				elseif fire_on_release then
					if input.btn_primary_attack_release then
						return weap_base:trigger_released(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
					elseif input.btn_primary_attack_state then
						weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
					end
				end
			end
			if weap_base:clip_empty() then
				self:_start_action_reload_enter(t)
			end
		end,
		auto = function (self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
			if self._spin_up_shoot or input.btn_primary_attack_state then
				return weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
			end
		end,
		burst = function (self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
			return weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
		end,
		volley = function (self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
			if self._shooting then
				return weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), ...)
			end
		end
	},
	not_fired = {
		single = function (self, t, input, params, weap_unit, weap_base)
			if not self._spin_up_shoot then
				return false
			end
			
			return true
		end,
		burst = function (self, t, input, params, weap_unit, weap_base)
			if weap_base:shooting_count() == 0 then
				return false
			end

			return true
		end,
		volley = function (self, t, input, params, weap_unit, weap_base)
			return self:_is_charging_weapon()
		end
	},
	check_stop_shooting_volley = {
		volley = function (self, t, input, params, weap_unit, weap_base)
			self:_check_stop_shooting()

			return true
		end
	}
}
function PlayerStandard:_chk_action_stop_shooting(new_action)
	if not new_action then
		self._already_fired = nil
		self._spin_up_shoot = nil
		self:_check_stop_shooting()
	end
end

function PlayerStandard:_check_action_primary_attack(t, input, params)
	local new_action, action_wanted = nil
	action_wanted = (not params or params.action_wanted == nil or params.action_wanted) and (input.btn_primary_attack_state or input.btn_primary_attack_release or self:is_shooting_count() or self:_is_charging_weapon() or input.real_input_pressed or self._queue_fire or self._spin_up_shoot)

	if action_wanted then
		local action_forbidden = nil

		if params and params.action_forbidden ~= nil then
			action_forbidden = params.action_forbidden
		elseif self:_is_reloading() or self:_is_overheating() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_throwing_projectile() or self:_is_deploying_bipod() or self._menu_closed_fire_cooldown > 0 or self:is_switching_stances() then
			action_forbidden = true
		else
			action_forbidden = false
		end

		if not action_forbidden then
			self._queue_reload_interupt = nil
			local start_shooting = false

			self._ext_inventory:equip_selected_primary(false)

			local weap_unit = self._equipped_unit

			if weap_unit then
				local weap_base = weap_unit:base()
				local fire_mode = weap_base:fire_mode()
				local fire_on_release = weap_base:fire_on_release()
				--Resmod custom vars
				local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
				local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
				local force_ads_recoil_anims = weap_base and (weap_base:weapon_tweak_data().always_play_anims or weap_base:second_sight_spread_mult())
				if weap_base and weap_base:alt_fire_active() and weap_base._alt_fire_data and weap_base._alt_fire_data.ignore_always_play_anims and not weap_base:second_sight_spread_mult() then
					force_ads_recoil_anims = nil
				end
				local manual_reloads = tweak_data.weapon.stat_info.reload_marathon or restoration.Options:GetValue("OTHER/WeaponHandling/ManualReloads")
				local queue_inputs = restoration.Options:GetValue("OTHER/WeaponHandling/QueuedShooting")
				local queue_window = restoration.Options:GetValue("OTHER/WeaponHandling/QueuedShootingWindow") or 0.5
				local queue_exlude = restoration.Options:GetValue("OTHER/WeaponHandling/QueuedShootingExclude") or 0.6
				local queue_burst_exclude = restoration.Options:GetValue("OTHER/WeaponHandling/QueuedShootingBurstExclude") or 0.3
				local queue_mid_burst = weap_base._burst_delay and queue_burst_exclude and queue_burst_exclude > weap_base._burst_delay and restoration.Options:GetValue("OTHER/WeaponHandling/QueuedShootingMidBurst")
				if queue_inputs and weap_base:in_burst_mode() then
					if queue_mid_burst and input.real_input_pressed then
						self._queue_burst = true
					end
				else
					self._queue_burst = nil
				end

				if weap_base:out_of_ammo() then
					self._spin_up_shoot = nil
					self._queue_burst = nil
					self._queue_fire = nil
					if input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif weap_base.clip_empty and weap_base:clip_empty() then
					self._spin_up_shoot = nil
					self._queue_burst = nil
					self._queue_fire = nil

					if params and params.no_reload or self:_is_using_bipod() --[[or is_pro]] or manual_reloads then
						if input.btn_primary_attack_press then
							weap_base:dryfire()
						end

						weap_base:tweak_data_anim_stop("fire")
					else
						local fire_mode_func = self._primary_action_funcs.clip_empty[fire_mode]

						if not fire_mode_func or not fire_mode_func(self, t, input, params, weap_unit, weap_base) then
							fire_mode_func = self._primary_action_funcs.clip_empty.default

							if fire_mode_func then
								fire_mode_func(self, t, input, params, weap_unit, weap_base)
							end
						end
						new_action = self:_is_reloading()
					end
				elseif params and params.block_fire then
					-- Nothing
				elseif self._running and (params and params.no_running or weap_base.run_and_shoot_allowed and not weap_base:run_and_shoot_allowed()) then
					self:_interupt_action_running(t)
				else
					if not self._shooting then
						if weap_base:start_shooting_allowed() then
							local start = nil
							local start_fire_func = self._primary_action_get_value.chk_start_fire[fire_mode]

							if start_fire_func then
								start = start_fire_func(self, t, input, params, weap_unit, weap_base)
							else
								start_fire_func = self._primary_action_get_value.chk_start_fire.default

								if start_fire_func then
									start = start_fire_func(self, t, input, params, weap_unit, weap_base)
								end
							end

							if not params or not params.no_start_fire_on_release then
								start = start and not fire_on_release
								start = start or fire_on_release and input.btn_primary_attack_release
							end

							if start then
								weap_base:start_shooting()
								self._camera_unit:base():start_shooting()

								self._anim_played = nil
								self._shooting = true
								self._shooting_t = t
								start_shooting = true
								local fire_mode_func = self._primary_action_funcs.start_fire[fire_mode]

								if not fire_mode_func or not fire_mode_func(self, t, input, params, weap_unit, weap_base, is_bow, force_ads_recoil_anims) then
									fire_mode_func = self._primary_action_funcs.start_fire.default

									if fire_mode_func then
										fire_mode_func(self, t, input, params, weap_unit, weap_base, is_bow, force_ads_recoil_anims)
									end
								end
							end
						elseif not params or not params.no_check_stop_shooting_early then
							if queue_inputs then
								if input.btn_primary_attack_press and fire_mode == "single" then
									self._primary_attack_input_cache = nil
									if not weap_base:in_burst_mode() and not weap_base:start_shooting_allowed() then
										local next_fire = weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()
										local next_fire_last = weap_base._next_fire_allowed - next_fire
										local next_fire_delay = weap_base._next_fire_allowed - next_fire_last
										local next_fire_current_t = weap_base._next_fire_allowed - t
										local next_fire_queue = 60 / queue_exlude

										if next_fire_queue >= next_fire and next_fire_current_t < next_fire_delay * queue_window then
											self._queue_fire = true
										end
									else
										if (self:_in_burst() and queue_mid_burst) or not self:_in_burst() then
											if input.real_input_pressed or not input.fake_attack then
												self._queue_burst = true
											end
										end
									end
								end
							else
								self._queue_fire = nil
								self._queue_burst = nil
							end
							self:_check_stop_shooting()

							return false
						else
							if queue_inputs then
								if input.btn_primary_attack_press and fire_mode == "single" then
									self._primary_attack_input_cache = nil
									if not weap_base:in_burst_mode() and not weap_base:start_shooting_allowed() then
										local next_fire = weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()
										local next_fire_last = weap_base._next_fire_allowed - next_fire
										local next_fire_delay = weap_base._next_fire_allowed - next_fire_last
										local next_fire_current_t = weap_base._next_fire_allowed - t
										local next_fire_queue = 60 / queue_exlude

										if next_fire_queue >= next_fire and next_fire_current_t < next_fire_delay * queue_window then
											self._queue_fire = true
										end
									else
										if (self:_in_burst() and queue_mid_burst) or not self:_in_burst() then
											if input.real_input_pressed or not input.fake_attack then
												self._queue_burst = true
											end
										end
									end
								end
							else
								self._queue_fire = nil
								self._queue_burst = nil
							end
							self:_check_stop_shooting()

							return false
						end
					end

					local suppression_ratio = self._unit:character_damage():effective_suppression_ratio()
					local spread_mul = math.lerp(1, tweak_data.player.suppression.spread_mul, suppression_ratio)
					local autohit_mul = math.lerp(1, tweak_data.player.suppression.autohit_chance_mul, suppression_ratio)
					local suppression_mul = managers.blackmarket:threat_multiplier()
					local dmg_mul = 1
					local weapon_tweak_data = weap_base:weapon_tweak_data()
					local primary_category = weapon_tweak_data.categories[1]
					--Resmod custom var(s)
					local ignore_rof_mult_anims = weap_base and (weap_base._ignore_rof_mult_anims or weap_base._fire_rate_init_progress)

					if not weapon_tweak_data.ignore_damage_multipliers then
						dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "dmg_multiplier_outnumbered", 1)

						if self._overkill_all_weapons or weap_base:is_category("shotgun", "saw") then
							dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
						end

						local health_ratio = self._ext_damage:health_ratio()
						local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, primary_category)

						if damage_health_ratio > 0 then
							local upgrade = weap_base:is_category("saw") and self._damage_health_ratio_mul_melee or self._damage_health_ratio_mul
							dmg_mul = dmg_mul * (1 + upgrade * damage_health_ratio)
						end

						dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
						dmg_mul = dmg_mul * managers.player:get_property("trigger_happy", 1)
					end

					dmg_mul = dmg_mul * managers.player:get_temporary_property("birthday_multiplier", 1)

					local fired = nil
					local fired_func = self._primary_action_get_value.fired[fire_mode]
					local spin_up_semi = weap_base:weapon_tweak_data().spin_up_semi
					local spin_up_check = (not spin_up_semi and fire_mode ~= "single") or spin_up_semi

					if fired_func then
						fired = fired_func(self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
						self._spin_up_shoot = spin_up_check and not self._already_fired and weap_base:weapon_tweak_data().spin_up_shoot
					else
						fired_func = self._primary_action_get_value.fired.default

						if fired_func then
							fired = fired_func(self, t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							self._spin_up_shoot = spin_up_check and not self._already_fired and weap_base:weapon_tweak_data().spin_up_shoot
						end
					end

					if not restoration.Options:GetValue("OTHER/WeaponHandling/SeparateBowADS") then
						if (not params or not params.no_steelsight) and weap_base.manages_steelsight and weap_base:manages_steelsight() then
							if weap_base:wants_steelsight() and not self._state_data.in_steelsight then
								self:_start_action_steelsight(t)
							elseif not weap_base:wants_steelsight() and self._state_data.in_steelsight then
								self:_end_action_steelsight(t)
							end
						end
					end

					local charging_weapon = weap_base:charging()

					if not self._state_data.charging_weapon and charging_weapon then
						self:_start_action_charging_weapon(t)
					elseif self._state_data.charging_weapon and not charging_weapon then
						self:_end_action_charging_weapon(t)
					end

					new_action = true

					if fired then
						local zippy = weap_base:weapon_tweak_data().zippy
						local jammed = zippy and weap_base._jammed
						self._queue_fire = nil
						self._already_fired = true

						if input.clear_queue then
							self._queue_burst = nil
						end

						if (restoration.Options:GetValue("OTHER/WeaponHandling/WpnFireDescope") and weap_base._descope_on_fire) or weap_base._descope_on_fire_ignore_setting or jammed then
							self._d_scope_t = (weap_base._next_fire_allowed - t) * (jammed and 0.9 or 0.7)
						end
						
						if not params or not params.no_rumble then
							managers.rumble:play("weapon_fire")
						end

						local weap_tweak_data = weap_base.weapon_tweak_data and weap_base:weapon_tweak_data() or tweak_data.weapon[weap_base:get_name_id()]

						self._equipped_unit:base():tweak_data_anim_stop("unequip")
						self._equipped_unit:base():tweak_data_anim_stop("equip")

						local fire_anim_offset = weap_base:weapon_tweak_data().fire_anim_offset
						local fire_anim_offset2 = weap_base:weapon_tweak_data().fire_anim_offset2
						local spin_up_semi = fire_mode == "single" and weap_base:weapon_tweak_data().spin_up_semi
						if not spin_up_semi then
							if not zippy or jammed then
								local second_gun_base = weap_base._second_gun and weap_base._second_gun:base()
								local second_gun_turn = weap_base._second_turn
								if second_gun_turn ~= true then
									if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier( ignore_rof_mult_anims ), fire_anim_offset	, fire_anim_offset2) then
										weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier( ignore_rof_mult_anims ), fire_anim_offset, fire_anim_offset2)
									end
									if second_gun_base then
										second_gun_base:tweak_data_anim_stop("fire")
										second_gun_base:tweak_data_anim_stop("fire_steelsight")
									end
								end
							end
						end

						local no_recoil_anims = restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims")
						local force_ads_recoil_anims = weap_base and (weap_base:weapon_tweak_data().always_play_anims or weap_base:second_sight_spread_mult())
						if weap_base and weap_base:alt_fire_active() and weap_base._alt_fire_data and weap_base._alt_fire_data.ignore_always_play_anims and not weap_base:second_sight_spread_mult() then
							force_ads_recoil_anims = nil
						end

						if (not params or not params.no_recoil_anim_redirect) and not weap_tweak_data.no_recoil_anim_redirect then
							local fire_mode_func = self._primary_action_funcs.recoil_anim_redirect[weap_base:weapon_tweak_data().no_auto_anims and "default" or fire_mode]

							if not fire_mode_func or not fire_mode_func(self, t, input, params, weap_unit, weap_base, is_bow, no_recoil_anims and not force_ads_recoil_anims) then
								fire_mode_func = self._primary_action_funcs.recoil_anim_redirect.default

								if fire_mode_func then
									fire_mode_func(self, t, input, params, weap_unit, weap_base, is_bow, no_recoil_anims and not force_ads_recoil_anims)
								end
							end
						end
						local srm = weap_base._srm
						local shots_fired = srm and math.max(weap_base._shot_recoil_magnitude_count - 1 - (srm[3] or 0), 0)  or 0
						local shots_fired_mult = srm and math.round(100000 * math.clamp( 1 - (shots_fired * srm[1]) , srm[2][1], srm[2][2])) / 100000
						local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier() * (shots_fired_mult or 1)
						local stance_mults = weap_tweak_data.stance_multipliers or nil
						recoil_multiplier = recoil_multiplier * ((stance_mults and (self._state_data.in_steelsight and stance_mults.steelsight or self._state_data.ducking and stance_mults.crouching or stance_mults.standing)) or 1)
						local recoil_count = weap_base._shot_recoil_pattern_count or 0
						local recoil_stage = nil
						if weap_tweak_data.kick_pattern then
							local function shot_recoil_pattern(shot_count, recoil_table, weap_base)
								local stage = nil
								for i, k in pairs(recoil_table) do
									if type(i) == "number" then
										if shot_count >= recoil_table[i][1] then
											if type(recoil_table[i][2]) == "table" then
												stage = i
											elseif type(recoil_table[i][2]) == "number" then
												stage = i - 1
												weap_base._shot_recoil_pattern_count = recoil_table[i][2] or 0
											end
										end
									end
								end
								return stage
							end
							recoil_stage = shot_recoil_pattern(recoil_count, weap_tweak_data.kick_pattern, weap_base)
						end
						local kick_tweak_data = weap_tweak_data.kick[fire_mode] or (recoil_stage and weap_tweak_data.kick_pattern[recoil_stage][2]) or weap_tweak_data.kick
						local always_standing = weap_tweak_data.always_use_standing
						local up, down, left, right = unpack(kick_tweak_data[always_standing and "standing" or self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
						local min_h_recoil = kick_tweak_data.min_h_recoil
						local recoil_v, recoil_h = self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier, min_h_recoil)

						if not params or not params.no_shake then
							local shake_tweak_data = weap_tweak_data.shake[fire_mode] or weap_tweak_data.shake
							local shake_multiplier = shake_tweak_data[self._state_data.in_steelsight and "fire_steelsight_multiplier" or "fire_multiplier"]
							local vars = {
								-1,
								1
							}
							local random = vars[math.random(#vars)]
							local var_lr = (recoil_h and (recoil_h > 0 and -1) or (recoil_h < 0 and 1)) or 0
							local fire_rate = weap_base:weapon_tweak_data().fire_mode_data.fire_rate --[[* weap_base:fire_rate_multiplier()]] * 15
							local category_mul = 1
							for _, category in ipairs(weap_base:categories()) do
								local shake_mul = tweak_data[category] and tweak_data[category].shake_mul or 1
								category_mul = category_mul * shake_mul
							end
							recoil_v = math.clamp( ((recoil_v or 1) * math.rand(0.5, 1.5)) * category_mul , 0, 5)
							recoil_h = (recoil_v == 0 and 0) or  math.clamp( ((recoil_h or 0) * math.rand(0.5, 1.5)) , -2.5, 2.5)
							if (self._state_data.in_steelsight or weap_base:weapon_tweak_data().hipfire_shake) and (weap_base:weapon_tweak_data().force_shake or ((no_recoil_anims or weap_base._disable_steelsight_recoil_anim) and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims)) then
								local zoom_level = (not weap_base:is_second_sight_on() and not weap_base:weapon_tweak_data().rebecca and self._equipped_unit:base():zoom() == 65 and -1) or 1
								self._ext_camera:play_shaker("whizby",  math.abs(recoil_h) * 0.125 * shake_multiplier * fire_rate, var_lr * 0.25 * zoom_level, vars[math.random(#vars)] * 0.25 )
								self._ext_camera:play_shaker("player_land", recoil_v * 0.05 * math.abs(shake_multiplier) * fire_rate * zoom_level, 0, 0 )
							end
							self._ext_camera:play_shaker("fire_weapon_rot", 1 * shake_multiplier)
							self._ext_camera:play_shaker("fire_weapon_kick", 1 * shake_multiplier * (self._state_data.in_steelsight and 0.25 or 1) , 1, 0.15)
						end

						if not self._hit_in_air and weap_base and weap_base:weapon_tweak_data().rebecca then
							local data = weap_base:weapon_tweak_data().rebecca
							self._hit_in_air = self._state_data.in_air and true
							local force_a_nature = -self._ext_camera:forward()
							local kick = data[1] * ((self._state_data.in_air and (data[2] or 0.6)) or 1)
							force_a_nature = Vector3(force_a_nature.x, force_a_nature.y, ((self._state_data.in_air and force_a_nature.z) or 0)):normalized()
							force_a_nature = (not self._state_data.in_air and force_a_nature:with_z(-0.5)) or force_a_nature
							if not self._state_data.in_air or self._state_data.in_air and not data[3] then
								self:push(force_a_nature * kick , true, 0.2, true)
							end
						end

						if self._shooting_t then
							local time_shooting = t - self._shooting_t
							local achievement_data = tweak_data.achievement.never_let_you_go

							if achievement_data and weap_base:get_name_id() == achievement_data.weapon_id and achievement_data.timer <= time_shooting then
								managers.achievment:award(achievement_data.award)

								self._shooting_t = nil
								self._spin_up_shoot = nil
							end
						end

						if managers.player:has_category_upgrade(primary_category, "stacking_hit_damage_multiplier") then
							self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
							self._state_data.stacking_dmg_mul[primary_category] = self._state_data.stacking_dmg_mul[primary_category] or {
								nil,
								0
							}
							local stack = self._state_data.stacking_dmg_mul[primary_category]

							if fired.hit_enemy then
								stack[1] = t + managers.player:upgrade_value(primary_category, "stacking_hit_expire_t", 1)
								stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_weapon_dmg_mul_stacks or 5)
							else
								stack[1] = nil
								stack[2] = 0
							end
						end

						if (not params or not params.no_recharge_clbk) and weap_base.set_recharge_clbk then
							weap_base:set_recharge_clbk(callback(self, self, "weapon_recharge_clbk_listener"))
						end

						managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())


						if self._ext_network then
							local impact = not fired.hit_enemy
							local sync_blank_func = self._primary_action_funcs.sync_blank[fire_mode]

							if not sync_blank_func or not sync_blank_func(self, t, input, params, weap_unit, weap_base, impact) then
								sync_blank_func = self._primary_action_funcs.sync_blank.default

								if sync_blank_func then
									sync_blank_func(self, t, input, params, weap_unit, weap_base, impact)
								end
							end
						end

						local stop_volley_func = self._primary_action_get_value.check_stop_shooting_volley[fire_mode]

						if stop_volley_func then
							new_action = stop_volley_func(self, t, input, params, weap_unit, weap_base)
						else
							stop_volley_func = self._primary_action_get_value.check_stop_shooting_volley.default

							if stop_volley_func then
								new_action = stop_volley_func(self, t, input, params, weap_unit, weap_base)
							end
						end

						if fire_mode == "single" then
							if self._spin_up_shoot then
								self._spin_up_shoot = nil
								self._already_fired = true
							end
							if weap_base:clip_empty() and not manual_reloads then
								self:_start_action_reload_enter(t)
							end
						end


					weap_base._jammed = nil
					else
						local not_fired_func = self._primary_action_get_value.not_fired[fire_mode]

						if not_fired_func then
							new_action = not_fired_func(self, t, input, params, weap_unit, weap_base)
						else
							not_fired_func = self._primary_action_get_value.not_fired.default

							if not_fired_func then
								new_action = not_fired_func(self, t, input, params, weap_unit, weap_base)
							end
						end
					end
				end
			end
		elseif self:_is_reloading() and self._equipped_unit:base():reload_interuptable() and input.btn_primary_attack_press then
			self._queue_reload_interupt = true
		end
		self._queue_fire = nil
		if not self._equipped_unit:base():weapon_tweak_data().spin_up_shoot then
			self._spin_up_shoot = nil
		end
	end

	self:_chk_action_stop_shooting(new_action)

	return new_action
end



function PlayerStandard:_check_stop_shooting()
	if self._shooting then
		self._equipped_unit:base():stop_shooting()
		self._camera_unit:base():stop_shooting(self._equipped_unit:base():recoil_wait())

		local weap_base = self._equipped_unit:base()
		local weap_tweak_data = weap_base and weap_base.weapon_tweak_data and weap_base:weapon_tweak_data() or tweak_data.weapon[weap_base:get_name_id()]
		local srm = weap_tweak_data and weap_tweak_data.recoil_values and weap_tweak_data.recoil_values.srm
		local fire_mode = weap_base:fire_mode()
		local is_auto_fire_mode = fire_mode == "auto"
		local is_volley_fire_mode = fire_mode == "volley"
		local next_fire = weap_base and weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()
		if is_volley_fire_mode then
			self:_end_action_charging_weapon()
		end
		if is_auto_fire_mode then
			if (not weap_base.akimbo or weap_base:weapon_tweak_data().allow_akimbo_autofire) then
				self._ext_network:send("sync_stop_auto_fire_sound", 0)
			end
			weap_base._next_fire_allowed = weap_base._next_fire_allowed + (next_fire * 0.2)
		end
		local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
		local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
		local force_ads_recoil_anims = weap_base and (weap_base:weapon_tweak_data().always_play_anims or weap_base:second_sight_spread_mult())
		if weap_base and weap_base:alt_fire_active() and weap_base._alt_fire_data and weap_base._alt_fire_data.ignore_always_play_anims and not weap_base:second_sight_spread_mult() then
			force_ads_recoil_anims = nil
		end

		if restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims") and self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims then
			self._ext_camera:play_redirect(self:get_animation("idle"))
		else 
			if (is_auto_fire_mode or is_volley_fire_mode) and not self:_is_reloading() and not self:_is_meleeing() and not weap_base:weapon_tweak_data().no_auto_anims then
				self._ext_camera:play_redirect(self:get_animation("recoil_exit"))
			end
		end
		self._spin_up_shoot = nil
		self._shooting = false
		self._shooting_t = nil
	end
end

function PlayerStandard:_start_action_charging_weapon(t, no_redirect)
	self._state_data.charging_weapon = true
	self._state_data.charging_weapon_data = {
		t = t,
		max_t = 2.5
	}
	local ANIM_LENGTH = 1.5
	local max = self._equipped_unit:base():charge_max_t()
	local speed_multiplier = ANIM_LENGTH / max
	local weap_base = self._equipped_unit:base()
	local no_charge_anims = weap_base:weapon_tweak_data().no_charge_anims
	if not no_charge_anims then
		self._equipped_unit:base():tweak_data_anim_play("charge", speed_multiplier)
		if not no_redirect then
			self._ext_camera:play_redirect(self:get_animation("charge"), speed_multiplier)
		end
	end
end

function PlayerStandard:_check_action_night_vision(t, input)
	if not input.btn_night_vision_press then
		return
	end

	local action_forbidden = self:_is_throwing_projectile() or self:_is_meleeing() or self:is_equipping() or self:_changing_weapon() or self:shooting() or self:_is_reloading() or self:is_switching_stances() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction")

	if action_forbidden then
		return
	end

	self:set_night_vision_state(not self._state_data.night_vision_active)
end

function PlayerStandard:_check_action_interact(t, input)
	local keyboard = self._controller.TYPE == "pc" or managers.controller:get_default_wrapper_type() == "pc"
	local pressed, released, holding = nil

	if self._interact_expire_t and not self._use_item_expire_t then
		pressed, released, holding = self:_check_tap_to_interact_inputs(t, input.btn_interact_press, input.btn_interact_release, input.btn_interact_state)
	else
		holding = input.btn_interact_state
		released = input.btn_interact_release
		pressed = input.btn_interact_press
	end

	local new_action, timer, interact_object = nil

	if pressed then
		if _G.IS_VR then
			self._interact_hand = input.btn_interact_left_press and PlayerHand.LEFT or PlayerHand.RIGHT
		end

		if not self:_action_interact_forbidden() then
			new_action, timer, interact_object = self._interaction:interact(self._unit, input.data, self._interact_hand)

			if new_action then
				self:_play_interact_redirect(t, input)
			end

			if timer then
				new_action = true

				if not managers.player:has_category_upgrade("player", "no_interrupt_interaction") then
					self._ext_camera:camera_unit():base():set_limits(80, 50)
				end
				self:_start_action_interact(t, input, timer, interact_object)
				self:_chk_tap_to_interact_enable(t, timer, interact_object)
				self._queue_burst = nil
				self._queue_fire = nil
			end

			if not new_action then
				self._start_intimidate = true
				self._start_intimidate_t = t
			end
		end
	end

	local secondary_delay = tweak_data.team_ai.stop_action.delay
	local force_secondary_intimidate = false
	local HOLD_TO_STOP_ALL_AI_DURATION = 1.5 --seconds to hold down to direct all ai instead of just the one
	local skip_intimidate_action = false 
	
	--If stop bots option is enabled, replace vanilla version with a version with bot stopping support.
	if restoration.Options:GetValue("OTHER/StopAllBots") then 
		if self._start_shout_all_ai_t and self._start_shout_all_ai_t + HOLD_TO_STOP_ALL_AI_DURATION <= t then
			self._start_shout_all_ai_t = nil
			
			--tell all ai to stop
			for i, char_data in pairs(managers.criminals._characters) do
				if char_data.data.ai then
					local ai_unit = char_data.unit
					if alive(ai_unit) then 
						ai_unit:brain():on_long_dis_interacted(0, ai_unit, true)
						skip_intimidate_action = true
					end
				end
			
			end
			if skip_intimidate_action then 
				self:say_line("f48x_any", false)
				--play a voiceline if any ai were actually stopped
			end
		elseif self._controller:get_input_released("interact_secondary") then 
			--if release before the full duration required to call all ai then do normal single-target "stop ai" action
			self._start_shout_all_ai_t = nil
			force_secondary_intimidate = true
		elseif input.btn_interact_secondary_press then 
			--if pressing for the first time (not holding), start timer, do not do normal single-target "stop ai" until key release
			self._start_shout_all_ai_t = t
			skip_intimidate_action = true
		end
	end

	if not new_action and keyboard and input.btn_interact_secondary_press then
		force_secondary_intimidate = true
	end

	if released then

		if _G.IS_VR then
			local release_hand = input.btn_interact_left_release and PlayerHand.LEFT or PlayerHand.RIGHT
			released = release_hand == self._interact_hand
		end

		if released then
			if self._start_intimidate and not self:_action_interact_forbidden() then
				if t < self._start_intimidate_t + secondary_delay then
					self:_start_action_intimidate(t)

					self._start_intimidate = false
				end
			else
				self:_interupt_action_interact()
			end
		end
	end
	
	if (self._start_intimidate or force_secondary_intimidate) and not self:_action_interact_forbidden() and (not keyboard and t > self._start_intimidate_t + secondary_delay or force_secondary_intimidate) then
		self:_start_action_intimidate(t, true)

		self._start_intimidate = false
	end

	return new_action
end

function PlayerStandard:_start_action_intimidate(t, secondary)
	if not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t then
		local skip_alert = managers.groupai:state():whisper_mode()
		local voice_type, plural, prime_target = self:_get_unit_intimidation_action(not secondary, not secondary, true, false, true, nil, nil, nil, secondary)
		
		if prime_target and prime_target.unit and prime_target.unit.base and (
				prime_target.unit:base().unintimidateable
				or prime_target.unit:anim_data() and prime_target.unit:anim_data().unintimidateable 
				--Stops undommable enemies from being shouted at.
				or tweak_data.character[prime_target.unit:base()._tweak_table] and tweak_data.character[prime_target.unit:base()._tweak_table].unintimidateable and prime_target.unit:movement() and not prime_target.unit:movement():cool()
			) then
			return
		end
		
		local interact_type, sound_name = nil
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
				if tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then
					sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout
				else
					sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
				end
			elseif tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then --Special boss shoutouts.
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
				sound_name = managers.modifiers:modify_value("PlayerStandart:_start_action_intimidate", sound_name, prime_target.unit)
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

			if prime_target and prime_target.unit and prime_target.unit:contour() then
				prime_target.unit:contour():add("mark_unit", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
			end
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

--Sixth sense action forbidden to let it work in loud, and only requires the player to not be moving to proc (so actions like shooting or aiming down sights no longer stop it).
function PlayerStandard:_update_omniscience(t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("player", "standstill_omniscience") or managers.player:current_state() == "civilian" or self._ext_movement:has_carry_restriction() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.omniscience
	if action_forbidden then
		if self._state_data.omniscience_t then
			self._state_data.omniscience_t = nil
		end

		return
	end

	self._state_data.omniscience_t = self._state_data.omniscience_t or t + tweak_data.player.omniscience.start_t

	if self._state_data.omniscience_t <= t then
		local sensed_targets = World:find_units_quick("sphere", self._unit:movement():m_pos(), tweak_data.player.omniscience.sense_radius, managers.slot:get_mask("trip_mine_targets"))

		for _, unit in ipairs(sensed_targets) do
			if alive(unit) and not unit:base():char_tweak().is_escort then
				self._state_data.omniscience_units_detected = self._state_data.omniscience_units_detected or {}

				if not self._state_data.omniscience_units_detected[unit:key()] or self._state_data.omniscience_units_detected[unit:key()] <= t then
					self._state_data.omniscience_units_detected[unit:key()] = t + tweak_data.player.omniscience.target_resense_t

					managers.game_play_central:auto_highlight_enemy(unit, true)
					break
				end
			end
		end

		self._state_data.omniscience_t = t + tweak_data.player.omniscience.interval_t
	end
end

--ADS movement speed shit
function PlayerStandard:_get_max_walk_speed(t, force_run)
	local speed_tweak = self._tweak_data.movement.speed
	local movement_speed = speed_tweak.STANDARD_MAX
	local speed_state = "walk"
	local weapon = self._equipped_unit:base()
	local weapon_tweak = weapon:weapon_tweak_data()
	local is_leaning = TacticalLean and ((TacticalLean:GetLeanDirection() or TacticalLean:IsExitingLean()) and true) or nil

	if self._is_sliding then -- should be fine without having AdvMov installed since _is_sliding will return nil if you don't have it
		movement_speed = self._slide_speed
		speed_state = "run"
	elseif self._is_wallrunning then -- ditto
		movement_speed = self._wallrun_speed
		speed_state = "run"
	elseif self._is_wallkicking then -- ditto
		movement_speed = speed_tweak.RUNNING_MAX * 1.5
		speed_state = "run"
	elseif self._state_data.in_steelsight and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") and not _G.IS_VR then
		movement_speed = speed_tweak.STEELSIGHT_MAX
		if alive(self._equipped_unit) then
			local base_speed = ( (self:on_ladder() and speed_tweak.CLIMBING_MAX ) or (self._state_data.ducking and speed_tweak.CROUCHING_MAX) or (self._state_data.in_air and speed_tweak.INAIR_MAX) or speed_tweak.STANDARD_MAX )
			local speed_mult = 1
			local has_ads_move_speed_mult = nil
			for _, category in ipairs(weapon_tweak.categories) do
				if tweak_data[category] and tweak_data[category].ads_move_speed_mult then
					speed_mult = speed_mult * tweak_data[category].ads_move_speed_mult
					has_ads_move_speed_mult = true
				end
			end
			if weapon:second_sight_strafe() then
				speed_mult = ((1 - speed_mult) * weapon:second_sight_strafe()) + speed_mult
			end
			if weapon_tweak.is_bullpup then 
				speed_mult = speed_mult * 1.25
			end
			speed_mult = speed_mult * (managers.player:upgrade_value("player", "steelsight_move_speed_multiplier", 1) or 1)
			movement_speed = base_speed * ((not has_ads_move_speed_mult and 0.45) or 1)
			movement_speed = math.clamp(movement_speed * speed_mult, 0, base_speed)
		end
		speed_state = "steelsight"
	elseif self:on_ladder() then
		movement_speed = speed_tweak.CLIMBING_MAX
		speed_state = "climb"
	elseif self._state_data.ducking then
		movement_speed = speed_tweak.CROUCHING_MAX
		speed_state = "crouch"
	elseif self._state_data.in_air then
		movement_speed = speed_tweak.INAIR_MAX
		speed_state = nil
	elseif self._running or force_run then
		movement_speed = (not self._unit:movement():is_above_stamina_threshold() and speed_tweak.RUNNING_MAX_TIRED) or speed_tweak.RUNNING_MAX
		speed_state = "run"
	end

	movement_speed = managers.modifiers:modify_value("PlayerStandard:GetMaxWalkSpeed", movement_speed, self._state_data, speed_tweak)
	local morale_boost_bonus = self._ext_movement:morale_boost()
	local multiplier = managers.player:movement_speed_multiplier(speed_state, speed_state and morale_boost_bonus and morale_boost_bonus.move_speed_bonus, nil, self._ext_damage:health_ratio())
	multiplier = multiplier * (self._tweak_data.movement.multiplier[speed_state] or 1)
	local apply_weapon_penalty = true

	if self:_is_meleeing() then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		apply_weapon_penalty = not tweak_data.blackmarket.melee_weapons[melee_entry].stats.remove_weapon_movement_penalty
	end

	if alive(self._equipped_unit) and apply_weapon_penalty then
		multiplier = multiplier * self._equipped_unit:base():movement_penalty()
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "increased_movement_speed") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "increased_movement_speed", 1)
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "copr_ability") then
		local out_of_health = self._unit:character_damage():health_ratio() + 0.01 < managers.player:upgrade_value("player", "copr_static_damage_ratio", 0)

		if out_of_health then
			multiplier = multiplier * managers.player:upgrade_value("player", "copr_out_of_health_move_slow", 1)
		end
	end
	
	if self._shooting_move_speed_t then
		multiplier = multiplier * self._shooting_move_speed_mult
	end
	
	if self:_is_reloading() and weapon and weapon._rms then
		multiplier = multiplier * weapon._rms
	end

	local final_speed = movement_speed * multiplier
	self._cached_final_speed = self._cached_final_speed or 0

	if final_speed ~= self._cached_final_speed then
		self._cached_final_speed = final_speed

		self._ext_network:send("action_change_speed", final_speed)
	end
	return final_speed
end

local _update_movement_old = PlayerStandard._update_movement
function PlayerStandard:_update_movement(t, dt)
	_update_movement_old(self, t, dt)
	if not self._move_dir then
		self._running_wanted = false
	end
end

function PlayerStandard:_check_action_run(t, input)
	if input then
		if self._setting_hold_to_run and input.btn_run_release or self._running and not self._move_dir then
			self._running_wanted = false

			if self._running then
				self:_end_action_running(t)

				if input.btn_steelsight_state and not self._state_data.in_steelsight then
					self._steelsight_wanted = true
				end
			end
		elseif not self._setting_hold_to_run and input.btn_run_release and not self._move_dir then
			self._running_wanted = false
		elseif input.btn_run_press or self._running_wanted then
			if input.btn_run_press and self._running_wanted == true then
				--self._running_wanted = false
				--return
			end
			if not self._running or self._end_running_expire_t then
				self:_start_action_running(t)
			elseif self._running and not self._setting_hold_to_run then
				self:_end_action_running(t)

				if input.btn_steelsight_state and not self._state_data.in_steelsight then
					self._steelsight_wanted = true
				end
			end
		end
	end
end

--Allows for melee sprinting.
function PlayerStandard:_start_action_running(t)
	local weap_base = alive(self._equipped_unit) and self._equipped_unit:base()

	local second_sight_sprint = restoration.Options:GetValue("OTHER/WeaponHandling/SecondSightSprint")
	if second_sight_sprint and weap_base.toggle_second_sight and self:in_steelsight() then
		if self._running_wanted ~= true and weap_base:has_second_sight() and weap_base:toggle_second_sight(self) then
		end
		self._running_wanted = false

		return
	end

	if self._slowdown_run_prevent then
		self._running_wanted = false

		return
	end
	--Consolidated vanilla checks.
	if not self._move_dir or self:on_ladder() or self:_on_zipline() or not self:_can_run_directional() or managers.player:get_player_rule("no_run") --[[ or not self._unit:movement():is_above_stamina_threshold() ]] then
		self._running_wanted = true
		return
	end

	--local slide_threshold = self._slide_speed and self._slide_end_speed and self._slide_end_speed * 4 >= self._slide_speed and self._unit:movement():is_above_stamina_threshold() 

	if (self._shooting or self._spin_up_shoot) and not self._equipped_unit:base():run_and_shoot_allowed() or (self:_is_charging_weapon() and not self._equipped_unit:base():run_and_shoot_allowed()) or --[[self:_changing_weapon() or]] self._use_item_expire_t or self._state_data.in_air or self:_is_throwing_projectile() --[[or (is_pro and self._is_sliding and not slide_threshold)]] or self:_in_burst() or self._state_data.ducking and not self:_can_stand() or (self._dash_slide and (self._last_dash_time + 0.5 > t)) then
		self._running_wanted = true
		return
	end
				
	self._queue_fire = nil
	self._queue_burst = nil
	self._running_wanted = false

	if (not self._state_data.shake_player_start_running or not self._ext_camera:shaker():is_playing(self._state_data.shake_player_start_running)) and managers.user:get_setting("use_headbob") then
		self._state_data.shake_player_start_running = self._ext_camera:play_shaker("player_start_running" , 0.75)
	end
				
	self:set_running(true)

	weap_base:tweak_data_anim_stop("fire")
	weap_base:tweak_data_anim_stop("fire_steelsight")
	if (weap_base.AKIMBO and weap_base:ammo_base():get_ammo_remaining_in_clip() > 1) or (not weap_base.AKIMBO and not weap_base:can_reload() and not weap_base:clip_empty()) then
		weap_base:tweak_data_anim_stop("reload")
		weap_base:tweak_data_anim_stop("reload_left")
		weap_base:tweak_data_anim_stop("magazine_empty")
	end

	self._end_running_expire_t = nil
	self._start_running_t = t

	local cancel_sprint = restoration.Options:GetValue("OTHER/WeaponHandling/SprintCancel")
	
	--Skip sprinting animations of player is doing melee things.
	if not self:_changing_weapon() and not self:_is_charging_weapon() and not self:_is_meleeing() and (not self:_is_reloading() or (not self.RUN_AND_RELOAD or (self.RUN_AND_RELOAD and cancel_sprint == true))) then
		if not self._equipped_unit:base():run_and_shoot_allowed() then
			self._ext_camera:play_redirect(self:get_animation("start_running"))	
		else
			self._ext_camera:play_redirect(self:get_animation("idle"))	
		end	
	end
	
	if not self.RUN_AND_RELOAD or (self.RUN_AND_RELOAD and cancel_sprint == true) then
		self:_interupt_action_reload(t)
	end
				
	self:_interupt_action_steelsight(t)
	self:_interupt_action_ducking(t)
end

function PlayerStandard:_update_running_timers(t)
	if self._end_running_expire_t then
		if self._end_running_expire_t <= t then
			self._end_running_expire_t = nil

			self:set_running(false)
		end
	--elseif self._running and (self._unit:movement():is_stamina_drained() or not self:_can_run_directional()) then
		--self:_interupt_action_running(t)
	end
end

function PlayerStandard:_end_action_running(t)
	self._last_run_t = t
	if not self._end_running_expire_t then
		local speed_multiplier = self._equipped_unit:base():exit_run_speed_multiplier()
		local sprintout_anim_time = self._equipped_unit:base():weapon_tweak_data().sprintout_anim_time or 0.4

		self._end_running_expire_t = t + sprintout_anim_time / speed_multiplier
		--Adds a few melee related checks to avoid cutting off animations.
		local cancel_sprint = restoration.Options:GetValue("OTHER/WeaponHandling/SprintCancel")
		local stop_running = not self:_changing_weapon() and not self:_is_charging_weapon() and not self:_is_meleeing() and not self._equipped_unit:base():run_and_shoot_allowed() and ((not self:_is_reloading() or not self.RUN_AND_RELOAD))
		
		if stop_running then
			self._ext_camera:play_redirect(self:get_animation("stop_running"), math.min(speed_multiplier, 2) )
		end
	end
end

--Stores running input, is a workaround for other things that may interrupt running.
Hooks:PreHook(PlayerStandard, "_start_action_melee", "ResPlayerStandardPreStartActionMelee", function(self, t, input, instant)
	self._state_data.melee_running_wanted = true and self._running and not self._end_running_expire_t
end)

Hooks:PostHook(PlayerStandard, "_start_action_melee", "ResPlayerStandardPostStartActionMelee", function(self, t, input, instant)
	--Passes in running input, is a workaround for other things that may interrupt running.
	if self._state_data.melee_running_wanted then
		self._running_wanted = true
	end

	--Start chainsaw timer.
	local melee_tweak = tweak_data.blackmarket.melee_weapons[managers.blackmarket:equipped_melee_weapon()]
	if melee_tweak.chainsaw then
		self._state_data.chainsaw_t = t + melee_tweak.chainsaw.start_delay
	end
end)

--Effectively a slightly modified version of _do_melee_damage but without charging and certain melee gimmicks.
function PlayerStandard:_do_chainsaw_damage(t)
	melee_entry = managers.blackmarket:equipped_melee_weapon()
	local make_saw = tweak_data.blackmarket.melee_weapons[melee_entry].make_saw
	local charger_melee = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon and tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon == "charger"
	self._state_data._charger_melee_active = true

	--Determine if attack hits.
	local sphere_cast_radius = 20
	local col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
	if col_ray and alive(col_ray.unit) then
		local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(0)
		local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().categories and self._equipped_unit:base():weapon_tweak_data().categories[1], "melee_knockdown_mul", 1))
		damage = tweak_data.blackmarket.melee_weapons[melee_entry].chainsaw.tick_damage
		damage = damage * managers.player:get_melee_dmg_multiplier()
		damage_effect = damage_effect * damage_effect_mul
		col_ray.sphere_cast_radius = sphere_cast_radius
		local hit_unit = col_ray.unit

		if hit_unit:character_damage() then
			local hit_sfx = "hit_body"

			if hit_unit:character_damage() and hit_unit:character_damage().melee_hit_sfx then
				hit_sfx = hit_unit:character_damage():melee_hit_sfx()
			end

			self:_play_melee_sound(melee_entry, hit_sfx, self._melee_attack_var)
			self:_play_melee_sound(melee_entry, "charge", self._melee_attack_var)

			if not hit_unit:character_damage()._no_blood then
				managers.game_play_central:play_impact_flesh({
					col_ray = col_ray
				})
				managers.game_play_central:play_impact_sound_and_effects({
					no_decal = true,
					no_sound = true,
					col_ray = col_ray
				})
			end

			
		elseif self._on_melee_restart_drill and hit_unit:base() and (hit_unit:base().is_drill or hit_unit:base().is_saw) then
			hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
		else
			self:_play_melee_sound(melee_entry, "hit_gen", self._melee_attack_var)
			self:_play_melee_sound(melee_entry, "charge", self._melee_attack_var) -- continue playing charge sound after hit instead of silence

			managers.game_play_central:play_impact_sound_and_effects({
				decal = make_saw and "saw",
				no_decal = not make_saw and true,
				no_sound = true,
				col_ray = col_ray,
				effect = not make_saw and Idstring("effects/payday2/particles/impacts/fallback_impact_pd2") or nil
			})
		end

		local custom_data = nil

		if _G.IS_VR and hand_id then
			custom_data = {
				engine = hand_id == 1 and "right" or "left"
			}
		end

		managers.rumble:play("melee_hit", nil, nil, custom_data)
		managers.game_play_central:physics_push(col_ray)

		local character_unit, shield_knock = nil
		local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")

		if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) and not hit_unit:parent():character_damage():is_immune_to_shield_knockback() then
			shield_knock = true
			character_unit = hit_unit:parent()
		end

		character_unit = character_unit or hit_unit

		if character_unit:character_damage() and character_unit:character_damage().damage_melee then
			local dmg_multiplier = 1
			
			dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)

			if character_unit:base() and character_unit:base().char_tweak and character_unit:base():char_tweak().priority_shout then
				dmg_multiplier = dmg_multiplier * (tweak_data.blackmarket.melee_weapons[melee_entry].stats.special_damage_multiplier or 1)
			end

			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
					nil,
					0
				}
				local stack = self._state_data.stacking_dmg_mul.melee

				if stack[1] and t < stack[1] then
					dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("melee", "stacking_hit_damage_multiplier", 0) * stack[2])
				else
					stack[2] = 0
				end
			end

			local damage_health_ratio = managers.player:get_damage_health_ratio(self._ext_damage:health_ratio(), "melee")
			if damage_health_ratio > 0 then
				dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_health_ratio)
			end

			local target_dead = character_unit:character_damage().dead and not character_unit:character_damage():dead()
			local target_hostile = managers.enemy:is_enemy(character_unit) and not tweak_data.character[character_unit:base()._tweak_table].is_escort
			local life_leach_available = managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech")

			if target_dead and target_hostile then
				if charger_melee then
					self._unit:movement():subtract_stamina(self._unit:movement():_max_stamina() * 0.15)
				end
				if life_leach_available then
					managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
					self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
				end
			end

			local action_data = {}
			action_data.damage = shield_knock and 0 or damage * dmg_multiplier
			action_data.damage_effect = damage_effect
			action_data.attacker_unit = self._unit
			action_data.col_ray = col_ray
			action_data.variant = "melee"

			if shield_knock then
				action_data.shield_knock = can_shield_knock
			end

			action_data.name_id = melee_entry
			action_data.charge_lerp_value = 0 --There is no charging this attack.

			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
					nil,
					0
				}
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

			self:_perform_sync_melee_damage(hit_unit, col_ray, action_data.damage)

			return defense_data
		else
			self:_perform_sync_melee_damage(hit_unit, col_ray, damage)
		end
	end

	if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
		self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
		self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
			nil,
			0
		}
		local stack = self._state_data.stacking_dmg_mul.melee
		stack[1] = nil
		stack[2] = 0
	end

	return col_ray
end

--Updated version of vanilla function, adding in melee sprinting, chainsaw, and repeat_hit functionality.
function PlayerStandard:_update_melee_timers(t, input)
	--Resume normal sprinting animations once melee attack is done.
	--Making it not cancel the equip animation will require a fair amount more work, since it doesn't set the timers. Is a job for another day.
	if self._running and not self._end_running_expire_t and not self._state_data.meleeing and self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t and not self:_is_charging_weapon() and (not self:_is_reloading() or not self.RUN_AND_RELOAD) and (instant or not self._state_data.melee_repeat_expire_t) then
		if not self._equipped_unit:base():run_and_shoot_allowed() then
			self._ext_camera:play_redirect(self:get_animation("start_running"))
			self._equipped_unit:base():tweak_data_anim_stop("equip")
		else
			self._ext_camera:play_redirect(self:get_animation("idle"))
		end
	elseif self._state_data.meleeing then
		local lerp_value = self:_get_melee_charge_lerp_value(t)

		self._camera_unit:anim_state_machine():set_parameter(self:get_animation("melee_charge_state"), "charge_lerp", math.bezier({
			0,
			0,
			1,
			1
		}, lerp_value))

		if self._state_data.melee_charge_shake then
			self._ext_camera:shaker():set_parameter(self._state_data.melee_charge_shake, "amplitude", math.bezier({
				0,
				0,
				1,
				1
			}, lerp_value))
		end
	end

    local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local melee_weapon = tweak_data.blackmarket.melee_weapons[melee_entry]
	local instant = melee_weapon.instant
	local no_hit_shaker = melee_weapon.no_hit_shaker
	local melee_charger = melee_weapon.special_weapon and melee_weapon.special_weapon == "charger"
	local angle = self._stick_move and mvector3.angle(self._stick_move, math.Y)
	local moving_forwards = angle and angle <= 15
	local can_run = self._unit:movement():is_above_stamina_threshold()
	local lerp_value = self:_get_melee_charge_lerp_value(t)
	local max_charge = lerp_value and lerp_value >= 0.99
	--local has_charged_range = self._melee_charge_bonus and self._melee_charge_bonus == true
	--local charge_bonus_range = has_charged_range and melee_weapon.stats.charge_bonus_range or 0
	--local range = melee_weapon.stats.range + charge_bonus_range

	-- No stamina regen while actively charging an attack with "charger" type melee weapons at max charge
	if melee_charger and self._state_data.meleeing and max_charge then
		self._unit:movement():_restart_stamina_regen_timer()
	end

	if self._state_data.meleeing then
		if lerp_value >= 1 and melee_weapon.special_weapon == "taser" and not self._state_data._stop_melee_sound_check then
			self._state_data._stop_melee_sound_check = true
			self._unit:sound():play("tasered_loop")
		elseif melee_weapon.special_weapon == "megumin" then
			self._state_data._drain_stamina = true
			if not self._state_data._playing_charge then
				self._state_data._playing_charge = XAudio.Source:new(sound_buffer)
			end
			managers.environment_controller:set_downed_value(math.lerp(0, 40, lerp_value))
			managers.player:apply_slow_debuff(1, math.lerp(0.2, 0.8, lerp_value), nil, true)
			managers.hud:activate_effect_screen(1, {math.lerp(0, 0.8, lerp_value), math.lerp(0, 0.08, lerp_value), 0})
		end
	else
		self._state_data._drain_stamina = nil
		managers.environment_controller:set_downed_value(0)
		if self._state_data._stop_melee_sound_check then
			self._unit:sound():play("tasered_stop")
			self._state_data._stop_melee_sound_check = nil
		end
		if self._state_data._playing_charge then
			if not self._state_data._playing_charge:is_closed() then
				self._state_data._playing_charge:close()
			end
			self._state_data._playing_charge = nil
		end
	end

	--Trigger chainsaw damage and update timer.
	if self:_is_meleeing() and ((melee_weapon.chainsaw and not melee_charger) or (melee_charger and self._running and moving_forwards and can_run and max_charge)) and self._state_data.chainsaw_t and self._state_data.chainsaw_t < t then
		self:_do_chainsaw_damage(t)
		self._state_data.chainsaw_t = t + (melee_weapon.chainsaw.tick_delay * (1 + (1 - managers.player:upgrade_value("player", "melee_swing_multiplier", 1))))
	end

	if self._state_data.melee_damage_delay_t and self._state_data.melee_damage_delay_t <= t then
		local num_casts = (self._melee_attack_var_charge_h and melee_weapon.stats.raycasts_charge_h) or 
		(self._melee_charge_bonus and melee_weapon.stats.raycasts_charge) or 
		(self._melee_attack_var_h and melee_weapon.stats.raycasts_h) or 
		(melee_weapon.stats.raycasts)

		if num_casts and num_casts > 1 then
			--Originally by Hoxi and Offyerrocker; butchered into whatever you wanna call this by DMC
			local from = self._unit:movement():m_head_pos()
			local rotation = self._unit:movement():m_head_rot()
			local base_direction = rotation:y()
			
			local yaw = rotation:yaw()
			local pitch = rotation:pitch()
			local roll = rotation:roll()

			local no_shaker = nil
			local hit_body, hit_gen, use_cleave = nil

			local function collect_melee_hits(angle, unique_hits, l_r, v_mult, num_casts)
				local v_mult = v_mult or 0 --0 is horizontal, 1 is vertical, + starts the line fom the top going down, - starts the line fom the bottom going up
				local l_r = l_r or 1
				local new_rotation = Rotation(yaw+(angle*(1-math.abs(v_mult) * math.abs(v_mult) )),pitch-(angle*(v_mult*l_r)), roll)
				local direction = new_rotation:y()
				local to = from + direction --* range

				local col_ray = self:_calc_melee_hit_ray(t, 10, from, direction)
				local ignore_hit = nil
				if col_ray then
					local hit_unit = col_ray.unit
					local body_dmg_ext = col_ray.body and col_ray.body:extension() and col_ray.body:extension().damage
					if hit_unit and alive(hit_unit) then
						local is_enemy = hit_unit:in_slot(managers.slot:get_mask("enemies"))
						local u_key = hit_unit:key()
						if unique_hits[u_key] then
							use_cleave = nil
							if not is_enemy and body_dmg_ext then
								self:_do_melee_damage(t, nil, nil, nil, nil, hit_unit, col_ray, num_casts, true, true, true)
							end
						else
							unique_hits[u_key] = hit_unit
							use_cleave = is_enemy and hit_unit and hit_unit.character_damage and hit_unit:character_damage() and not hit_unit:character_damage()._dead and true
							self:_do_melee_damage(t, nil, nil, nil, nil, hit_unit, col_ray, nil, true, true)
						end
					end

					if hit_unit and hit_unit.character_damage and hit_unit:character_damage() then
						hit_body = true
					else
						hit_gen = true
					end
				else
				end
				if not no_hit_shaker and not no_shaker then
					self._ext_camera:play_shaker( l_r == 1 and "player_melee_var2" or l_r == -1 and "player_melee" or melee_vars[math.random(#melee_vars)], math.max( 0.2, math.min(0.7,lerp_value) ))
				end

				no_shaker = true

				return hit_body, use_cleave
			end

			local is_even = num_casts % 2 == 0
			local half_casts = math.floor(num_casts / 2)
			local angle_interval = (self._melee_charge_bonus and melee_weapon.interval_charge or melee_weapon.interval or 10) / 4
			local cleave = melee_weapon.stats.cleave or 1

			local unique_hits = {}

			local l_r = self._melee_attack_var_l_r and (((self._melee_attack_var_l_r == "left" or self._melee_attack_var_l_r[1] == "left") and 1) or ((self._melee_attack_var_l_r == "right" or self._melee_attack_var_l_r[1] == "right") and -1) ) or nil
			local v_mult = self._melee_attack_var_l_r and self._melee_attack_var_l_r[2]
			if l_r then
				for i = 1, num_casts, 1 do 
					local angle = ((i* l_r) * angle_interval) - (((angle_interval * num_casts * 0.5) + (angle_interval / 2) ) * l_r)
					local hit, cleave_enemy = collect_melee_hits(angle, unique_hits, l_r, v_mult, num_casts)
					if cleave_enemy then
						cleave = cleave - 1
						if cleave < 1 then
							break
						end
					end
				end
			else
				if not is_even then
					collect_melee_hits(0,unique_hits)
				end
				for i = 1, half_casts, 1 do 
					local left_angle = i * angle_interval
					local right_angle = -left_angle
					collect_melee_hits(left_angle,unique_hits)
					collect_melee_hits(right_angle,unique_hits)
				end
			end
			if hit_body then
				self:_play_melee_sound(melee_entry, "hit_body")
			elseif hit_gen then
				self:_play_melee_sound(melee_entry, "hit_gen")
			end
		else
			self:_do_melee_damage(t, nil, self._state_data.melee_hit_ray)
		end
		self._state_data.melee_damage_delay_t = nil
		self._state_data.melee_hit_ray = nil
	end

	if self._state_data.melee_attack_allowed_t and self._state_data.melee_attack_allowed_t <= t then
		self._state_data.melee_start_t = t
		local melee_charge_shaker = melee_weapon.melee_charge_shaker or "player_melee_charge"
		self._state_data.melee_charge_shake = self._ext_camera:play_shaker(melee_charge_shaker, 0)
		self._state_data.melee_attack_allowed_t = nil
	end

	if self._state_data.melee_repeat_expire_t and self._state_data.melee_repeat_expire_t <= t then
		self._state_data.melee_repeat_expire_t = nil
		if melee_weapon.force_play_charge then
			self._camera_unit:base():play_anim_melee_item("charge")
		end
		if input and input.btn_meleet_state then
			if melee_weapon.force_play_charge then
				self:_play_melee_sound(managers.blackmarket:equipped_melee_weapon(), "equip")
			end
			self._state_data.melee_charge_wanted = not instant and true
		end
	end
	if self._state_data.melee_expire_t and self._state_data.melee_expire_t <= t then
		self._state_data.melee_expire_t = nil
		self._state_data.melee_repeat_expire_t = nil

		self:_stance_entered()

		if self._equipped_unit and input and input.btn_steelsight_state then
			self._steelsight_wanted = true
		end
	end	
	if self._melee_repeat_damage_bonus and not self:_is_meleeing() then --Clear melee repeat bonus (from specialist knives and such) when melee is over.
		self._melee_repeat_damage_bonus = nil 
	end
end

function PlayerStandard:_interupt_action_melee(t)
	if not self:_is_meleeing() then
		return
	end
	self._state_data.melee_hit_ray = nil
	self._state_data.melee_charge_wanted = nil
	self._state_data.melee_expire_t = nil
	self._state_data.melee_repeat_expire_t = nil
	self._state_data.melee_attack_allowed_t = nil
	self._state_data.melee_damage_delay_t = nil
	self._state_data.meleeing = nil	
	self._state_data.chainsaw_t = nil --Stop chainsaw stuff if also no longer in melee.
	self._melee_repeat_damage_bonus = nil --Same goes for the melee repeat hitter bonus.
	if self._state_data._stop_melee_sound_check then
		self._unit:sound():play("tasered_stop")
		self._state_data._stop_melee_sound_check = nil
	end
	if self._state_data._playing_charge then
		if not self._state_data._playing_charge:is_closed() then
			self._state_data._playing_charge:close()
		end
		self._state_data._playing_charge = nil
	end
	managers.environment_controller:set_downed_value(0)

	self._unit:sound():play("interupt_melee", nil, false)
	self:_play_melee_sound(managers.blackmarket:equipped_melee_weapon(), "hit_air", self._melee_attack_var)
	self._camera_unit:base():unspawn_melee_item()
	self._camera_unit:base():show_weapon()
	self:_play_equip_animation() --Use generic equip animation function.

	if self._state_data.melee_charge_shake then
		self._ext_camera:stop_shaker(self._state_data.melee_charge_shake)

		self._state_data.melee_charge_shake = nil
	end

	self:_stance_entered()

	--Interrupting melee attacks also interrupt melee sprinting.
	self:_interupt_action_running(t)
	local running = self._running and not self._end_running_expire_t
	if running then
		self._running_wanted = true
	end
end
function PlayerStandard:_start_action_jump(t, action_start_data)
	--Don't interrupt melee sprinting.
	if self._running and self:_is_reloading() and not self.RUN_AND_RELOAD and not self._equipped_unit:base():run_and_shoot_allowed() and not self._is_meleeing then
		self:_interupt_action_reload(t)
		self._ext_camera:play_redirect(self:get_animation("stop_running"), self._equipped_unit:base():exit_run_speed_multiplier())
	end

	self:_interupt_action_running(t)

	self._jump_t = t
	local jump_vec = action_start_data.jump_vel_z * math.UP

	self._unit:mover():jump()

	if self._move_dir then
		local move_dir_clamp = self._move_dir:normalized() * math.min(1, self._move_dir:length())
		self._last_velocity_xy = move_dir_clamp * action_start_data.jump_vel_xy
		self._jump_vel_xy = mvector3.copy(self._last_velocity_xy)
	else
		self._last_velocity_xy = Vector3()
	end

	self:_perform_jump(jump_vec)
end		

function PlayerStandard:_get_melee_charge_lerp_value(t, offset)
	offset = offset or 0
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local max_charge_time = tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_time
	local ignore_charge_speed = tweak_data.blackmarket.melee_weapons[melee_entry].ignore_charge_speed
	max_charge_time = max_charge_time * ((not ignore_charge_speed and (1 + (1 - managers.player:upgrade_value("player", "melee_swing_multiplier", 1)))) or 1)

	if not self._state_data.melee_start_t then
		return 0
	end

	return math.clamp(t - self._state_data.melee_start_t - offset, 0, max_charge_time) / max_charge_time
end

function PlayerStandard:_do_action_melee(t, input, skip_damage)
	self._state_data.meleeing = nil
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local pre_calc_hit_ray = tweak_data.blackmarket.melee_weapons[melee_entry].hit_pre_calculation
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	--Lets skills give faster melee charge and swing speeds.
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t) 
	local charge_bonus_start = tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_bonus_start or 0.5 
	local charge_bonus_speed = tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_bonus_speed or 1
	local speed = tweak_data.blackmarket.melee_weapons[melee_entry].stats.speed_mult or 1
	local anim_speed = tweak_data.blackmarket.melee_weapons[melee_entry].anim_speed_mult or 1
	speed = speed * anim_speed
	speed = speed * managers.player:upgrade_value("player", "melee_swing_multiplier", 1)
	--Unsure if this is still needed since melee swings sync up now 
	--melee_damage_delay = melee_damage_delay * managers.player:upgrade_value("player", "melee_swing_multiplier_delay", 1)
	local melee_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].expire_t or 0 --Add fallbacks for certain stats.
	local melee_miss_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].miss_expire_t or 0
	local melee_repeat_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t or 0
	local melee_repeat_expire_t_add = tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t or 0
	local melee_miss_repeat_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].miss_repeat_expire_t or 0
	local weap_base = self._equipped_unit:base()
	local melee_speed_mult = weap_base._melee_speed_mult or 1
	if instant_hit then
		local weap_t = 1 * tweak_data.weapon.stats.mobility[self._equipped_unit:base():get_concealment() + 1]
		weap_t = math.clamp(weap_t, 0.6, 1.05)
		speed = speed * weap_t * melee_speed_mult
	end
	--So the timers play nicely with the anim speed mult
	melee_expire_t = melee_expire_t / speed
	melee_miss_expire_t = melee_miss_expire_t / speed
	melee_repeat_expire_t = melee_repeat_expire_t / speed
	melee_miss_repeat_expire_t = melee_miss_repeat_expire_t / speed
	melee_damage_delay = melee_damage_delay / speed
	melee_damage_delay = math.min(melee_damage_delay, melee_repeat_expire_t)
	local primary = managers.blackmarket:equipped_primary()
	local primary_id = primary.weapon_id
	local bayonet_id = managers.blackmarket:equipped_bayonet(primary_id)
	local bayonet_melee = false
	local can_melee_miss = tweak_data.blackmarket.melee_weapons[melee_entry].can_melee_miss
	local equipped_weapon = self:get_equipped_weapon()
	local weapon_id = equipped_weapon and equipped_weapon:get_name_id()
	local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]

	if bayonet_id and self._equipped_unit:base():selection_index() == 2 then
		bayonet_melee = true
	end
	
	self._melee_charge_bonus = nil
	if charge_lerp_value and charge_lerp_value >= charge_bonus_start then
		self._melee_charge_bonus = true
		speed = math.max(speed, speed * (charge_lerp_value * charge_bonus_speed))
		melee_damage_delay = math.min(melee_damage_delay, melee_damage_delay / (charge_lerp_value * charge_bonus_speed))
		melee_expire_t = math.min(melee_expire_t, melee_expire_t / (charge_lerp_value * charge_bonus_speed))
		melee_miss_expire_t = math.min(melee_miss_expire_t, melee_miss_expire_t / (charge_lerp_value * charge_bonus_speed))
		melee_repeat_expire_t = math.min(melee_repeat_expire_t, melee_repeat_expire_t / (charge_lerp_value * charge_bonus_speed))
		melee_miss_repeat_expire_t = math.min(melee_miss_repeat_expire_t, melee_miss_repeat_expire_t / (charge_lerp_value * charge_bonus_speed))
	end
	if not instant_hit and not skip_damage then
		self._state_data.melee_damage_delay_t = t + melee_damage_delay

		if pre_calc_hit_ray then
			self._state_data.melee_hit_ray = self:_calc_melee_hit_ray(t, 20) or true
		else
			self._state_data.melee_hit_ray = nil
		end
	end
	
	if can_melee_miss and self._state_data.melee_hit_ray == true then 
		melee_repeat_expire_t = melee_miss_repeat_expire_t
		melee_expire_t = melee_miss_expire_t
	end
	
	self._state_data.melee_expire_t = t + melee_expire_t
	self._state_data.melee_repeat_expire_t = t + math.min(melee_repeat_expire_t, melee_expire_t)

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
	self._melee_attack_var_h = nil
	self._melee_attack_var_charge_h = nil
	self._melee_attack_var_l_r = nil

	if instant_hit then
		local hit = skip_damage or self:_do_melee_damage(t, bayonet_melee)
		if hit then
			self._ext_camera:play_redirect(bayonet_melee and self:get_animation("melee_bayonet") or self:get_animation("melee"), math.clamp(speed, 0.7, 1.1))
		else
			self._ext_camera:play_redirect(bayonet_melee and self:get_animation("melee_miss_bayonet") or self:get_animation("melee_miss"), math.clamp(speed, 0.7, 1.1))
		end

		if can_melee_miss and not hit then 
			melee_repeat_expire_t = melee_miss_repeat_expire_t
			melee_expire_t = melee_miss_expire_t
		end
		self._state_data.melee_expire_t = t + melee_expire_t
		self._state_data.melee_repeat_expire_t = t + math.min(melee_repeat_expire_t, melee_expire_t)

		if weapon_tweak and weapon_tweak.has_cp_fire_melee and melee_entry == "weapon" then
			self._unit:sound():play("flamethrower_stop", nil, false)
		end

	else
		local anim_attack_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_vars
		local anim_attack_charged_amount = tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_bonus_start or tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_start or 0.5 --At half charge, use the charge variant
		local anim_attack_left_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_left_vars
		local anim_attack_right_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_right_vars
		local anim_attack_charged_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_vars
		local anim_attack_charged_left_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_left_vars
		local anim_attack_charged_right_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_right_vars
		local timing_fix = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix
		local timing_fix_speed_mult = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix_speed_mult or 1
		self._melee_attack_var = anim_attack_vars and math.random(#anim_attack_vars)

		self:_play_melee_sound(melee_entry, "hit_air", self._melee_attack_var)

		local melee_item_tweak_anim = "attack"
		local melee_item_prefix = ""
		local melee_item_suffix = ""
		local anim_attack_param = anim_attack_vars and anim_attack_vars[self._melee_attack_var]
		local angle = mvector3.angle(self._stick_move, math.X)

		if anim_attack_charged_vars and charge_lerp_value >= anim_attack_charged_amount then
			self._melee_attack_var = anim_attack_charged_vars and math.random(#anim_attack_charged_vars)
			anim_attack_param = anim_attack_charged_vars and anim_attack_charged_vars[self._melee_attack_var]
			if anim_attack_charged_left_vars and angle and (angle <= 181) and (angle >= 134) then
				self._melee_attack_var_charge_h = true
				self._melee_attack_var_l_r = "left"
				self._melee_attack_var = anim_attack_charged_left_vars and math.random(#anim_attack_charged_left_vars)
				anim_attack_param = anim_attack_charged_left_vars and anim_attack_charged_left_vars[self._melee_attack_var]
			elseif anim_attack_charged_right_vars and angle and (angle <= 46) and (angle >= 0) then
				self._melee_attack_var_charge_h = true
				self._melee_attack_var_l_r = "right"
				self._melee_attack_var = anim_attack_charged_right_vars and math.random(#anim_attack_charged_right_vars)
				anim_attack_param = anim_attack_charged_right_vars and anim_attack_charged_right_vars[self._melee_attack_var]
			end
		elseif self._stick_move then
			if anim_attack_left_vars and angle and (angle <= 181) and (angle >= 134) then
				self._melee_attack_var_h = true
				self._melee_attack_var_l_r = "left"
				self._melee_attack_var = anim_attack_left_vars and math.random(#anim_attack_left_vars)
				anim_attack_param = anim_attack_left_vars and anim_attack_left_vars[self._melee_attack_var]
			elseif anim_attack_right_vars and angle and (angle <= 46) and (angle >= 0) then
				self._melee_attack_var_h = true
				self._melee_attack_var_l_r = "right"
				self._melee_attack_var = anim_attack_right_vars and math.random(#anim_attack_right_vars)
				anim_attack_param = anim_attack_right_vars and anim_attack_right_vars[self._melee_attack_var]
			end
		end
		local fix_anim_timer = anim_attack_param and timing_fix and table.contains(timing_fix, anim_attack_param)
		if fix_anim_timer then
			speed = speed * timing_fix_speed_mult
		end

		local var_dir = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_var_dir
		if var_dir and var_dir[anim_attack_param] then
			self._melee_attack_var_l_r = var_dir[anim_attack_param]
		end
		local state = self._ext_camera:play_redirect(self:get_animation("melee_attack"), speed) --Apply speed mult to animation.
		if anim_attack_param then
			self._camera_unit:anim_state_machine():set_parameter(state, anim_attack_param, 1)

			melee_item_prefix = anim_attack_param .. "_"
		end

		if self._state_data.melee_hit_ray and self._state_data.melee_hit_ray ~= true then
			self._camera_unit:anim_state_machine():set_parameter(state, "hit", 1)

			melee_item_suffix = "_hit"
		end

		melee_item_tweak_anim = melee_item_prefix .. melee_item_tweak_anim .. melee_item_suffix

		self._camera_unit:base():play_anim_melee_item(melee_item_tweak_anim, speed)
	end
end

--Updates burst fire and minigun spinup.
Hooks:PreHook(PlayerStandard, "update", "ResWeaponUpdate", function(self, t, dt)
	if alive(self._equipped_unit) then
		self:_update_burst_fire(t)
		self:_update_slide_locks()
		self:_shooting_move_speed_timer(t, dt)
		self:_last_shot_t(t, dt)
		self:_last_shot_recoil_t(t, dt)
	end
	self:_update_js_t(t, dt)
	self:_update_d_scope_t(t, dt)
	self:_update_spread_stun_t(t, dt)
	self:_update_drain_stamina(t, dt)
	self:_is_overheating(t, dt)

	local weapon = alive(self._equipped_unit) and self._equipped_unit:base()
	if weapon and weapon:weapon_tweak_data().ads_spool then
		weapon:update_spin()
	end
	-- Shitty method to force the HUD to convey a weapon starts off on burstfire
	-- I know a boolean check would work to stop this going off every frame, but then the akimbo Type 54 fire modes stop updating correctly
	--[[
	if weapon and weapon:in_burst_mode() then
		managers.hud:set_teammate_weapon_firemode_burst(weapon:selection_index())
	end
	--]]

	local primary = alive(self._unit) and self._unit.inventory and alive(self._unit:inventory():unit_by_selection(2)) and self._unit:inventory():unit_by_selection(2).base and self._unit:inventory():unit_by_selection(2):base()
	local secondary = alive(self._unit) and self._unit.inventory and alive(self._unit:inventory():unit_by_selection(1)) and self._unit:inventory():unit_by_selection(1).base and self._unit:inventory():unit_by_selection(1):base()
	if primary and primary._starwars then
		self:_primary_regen_ammo(t, dt)
	end
	if secondary and secondary._starwars then
		self:_secondary_regen_ammo(t, dt)
	end

	if self._hit_in_air and not self._state_data.in_air then
		self._hit_in_air = nil
	end

	--Applying (and removing) the conditon for being fully ADS'd
	if self:full_steelsight() and not self._state_data.in_full_steelsight then
		self._state_data.in_full_steelsight = true
	end
	if self._state_data.in_full_steelsight and not self:in_steelsight() then
		self._state_data.in_full_steelsight = nil
	end

	if weapon._set_burst_mode and weapon.in_burst_mode then
		if weapon._burst_ads_toggle then
			if self:in_steelsight() and not weapon:in_burst_mode() then
				weapon:_set_burst_mode(true, true)
			elseif not self:in_steelsight()and weapon:in_burst_mode() and not self:_in_burst() then
				weapon:_set_burst_mode(false, true)
				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), weapon:fire_mode())
			end
		elseif weapon._burst_hipfire_toggle then
			if self:in_steelsight() and weapon:in_burst_mode() and not self:_in_burst() then
				weapon:_set_burst_mode(false, true)
				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), weapon:fire_mode())
			elseif not self:in_steelsight() and not weapon:in_burst_mode() then
				weapon:_set_burst_mode(true, true)
			end
		end
	end
	
end)

function PlayerStandard:_update_js_t(t, dt)
	if self._js_t then
		if self:_is_cash_inspecting() then
			self._js_t = self._js_t - dt
			if self._js_t < 0 then
				self._js_t = nil
				self._unit:sound():say("a01x_any", true)
			end
		else
			self._js_t = nil
		end
	end
end

function PlayerStandard:_update_d_scope_t(t, dt)
	if self._d_scope_t then
		self:_interupt_action_steelsight(t)
		if self._steelsight_wanted ~= true and self._controller and self._controller:get_input_bool("secondary_attack") then
			self._steelsight_wanted = true
		end
		self._d_scope_t = self._d_scope_t - dt
		if self._d_scope_t < 0 then
			self._d_scope_t = nil
		end
	end
end

function PlayerStandard:_update_spread_stun_t(t, dt)
	if self._spread_stun_t then
		self._spread_stun_t = self._spread_stun_t - dt
		if self._spread_stun_t < 0 then
			self._spread_stun_t = nil
		end
	end
end

function PlayerStandard:_update_drain_stamina(t, dt)
	if self._state_data._drain_stamina then
		self._unit:movement()._regenerate_timer = 1
		self._unit:movement():subtract_stamina((self._unit:movement():_max_stamina() * 0.0181818) * dt)
	end
end

function PlayerStandard:_last_shot_t(t, dt)
	local weapon = alive(self._equipped_unit) and self._equipped_unit:base()
	local fire_mode = weapon and weapon:fire_mode()
	if weapon then
		if self._shooting and fire_mode == "auto" then
			local reset_delay_t = tweak_data.upgrades.automatic_kills_to_damage_reset_t or 1
			self._last_shooting_t = reset_delay_t
		else
			if self._last_shooting_t then
				self._last_shooting_t = self._last_shooting_t - dt
				if self._last_shooting_t < 0 then
					self._last_shooting_t = nil
					weapon._no_cheevo_kills_without_releasing_trigger = 0
				end
			end
		end
	end
end

function PlayerStandard:_last_shot_recoil_t(t, dt)
	local weapon = alive(self._equipped_unit) and self._equipped_unit:base()
	local fire_rate = weapon and weapon:weapon_fire_rate()
	local weapon_tweak = weapon and weapon:weapon_tweak_data()
	local base_fire_rate_multiplier = weapon_tweak.fire_rate_multiplier or 1
	local in_burst = weapon:in_burst_mode()
	local auto_burst = in_burst and weapon._auto_burst
	local burst_delay = (in_burst and weapon._burst_delay) or 0
	local max_t = weapon_tweak.kick_pattern and weapon_tweak.kick_pattern.max_t or 0.35
	if weapon then
		if self._shooting then
			self._last_recoil_t = math.clamp( ((fire_rate + burst_delay) / (weapon:fire_rate_multiplier() * 0.8)) * 2 , math.max(0, math.lerp( 0.2, -0.25, fire_rate + burst_delay )) , max_t + burst_delay / ((not auto_burst and (weapon:fire_rate_multiplier() / base_fire_rate_multiplier) ) or 1) )
		else
			if self._last_recoil_t then
				self._last_recoil_t = self._last_recoil_t - dt
				if self._last_recoil_t < 0 then
					self._last_recoil_t = nil
					weapon._shot_recoil_pattern_count = 0
					weapon._shot_recoil_magnitude_count = 0
				end
			end
		end
	end
end



function PlayerStandard:_shooting_move_speed_timer(t, dt, external_trigger)
	local weapon = alive(self._equipped_unit) and self._equipped_unit:base()
	if not weapon then
		return
	end
	local weapon_sms = weapon._sms and math.clamp(weapon._sms, 0, 1)
	local smt_range = weapon and weapon:weapon_tweak_data().smt_range or { 0.3, 0.8 }
	if (self._shooting or external_trigger) and weapon_sms and (not self._is_sliding and not self._is_wallrunning and not self._is_wallkicking and not self:on_ladder()) then
		self._shooting_move_speed_t = math.clamp(weapon._smt, smt_range[1], smt_range[2])
		self._shooting_move_speed_wait = self._shooting_move_speed_t * 0.25
		self._shooting_move_speed_mult = weapon_sms
		self._shooting_move_speed_mult_max = weapon_sms
	end
	if self._shooting_move_speed_wait then
		self._shooting_move_speed_wait = self._shooting_move_speed_wait - dt
		if self._shooting_move_speed_wait < 0 then
			self._shooting_move_speed_wait = nil
		end
	elseif self._shooting_move_speed_t then
		self._shooting_move_speed_mult = math.clamp(math.lerp(1 , self._shooting_move_speed_mult_max, self._shooting_move_speed_t), self._shooting_move_speed_mult_max, 1)
		self._shooting_move_speed_t = self._shooting_move_speed_t - dt
		if self._shooting_move_speed_t < 0 then
			self._shooting_move_speed_t = nil
			self._shooting_move_speed_mult = nil
			self._shooting_move_speed_mult_max = nil
		end
	end
end


function PlayerStandard:_primary_regen_ammo(t, dt)
	local primary = self._unit:inventory():unit_by_selection(2):base()
	local active = primary and self._unit:inventory():equipped_selection() == 2
	if primary then
		local regen_ammo_time = primary._starwars.regen_ammo_time or 0.5
		local regen_rate = primary._starwars.regen_rate or 10
		local overheat_pen = primary._starwars.overheat_pen or 2.75
		local regen_rate_overheat = primary._starwars.regen_rate_overheat or 4.5
		local empty_no_regen = primary._starwars.empty_no_regen
		local mag_regen = primary._starwars.mag_regen
		local shut_up = primary._starwars.shut_up

		primary._primary_regen_rate = primary._primary_regen_rate or regen_rate
		primary._primary_regenerate_ammo_timer = primary._primary_regenerate_ammo_timer or 0
		if primary:get_ammo_total() <= 0 then
			return
		end
		if active and self._shooting then
			primary._primary_recharge_yell = nil
			primary._primary_regenerate_ammo_timer = regen_ammo_time
		end
		if primary:clip_empty() then
			if active and self._shooting then
				self:_check_stop_shooting()
				self:_interupt_action_steelsight(t)
			end
			primary._primary_regen_rate = (empty_no_regen and 0) or regen_rate_overheat
			primary._primary_overheat_pen = (empty_no_regen and 0) or overheat_pen
		end
		if primary._primary_overheat_pen and primary._primary_overheat_pen <= 0 then
			--log( "COOL" )
			if active and not empty_no_regen then
				primary._sound_fire:post_event("wp_sentrygun_swap_ammo")
			end
			primary._primary_regen_rate = regen_rate
			primary._primary_overheat_pen = nil
			primary._primary_overheat_yell = nil
		end
		if primary._primary_overheat_pen then
			primary._primary_overheat_pen = primary._primary_overheat_pen - dt
			--log( "OVERHEAT TIME: " .. tostring(self._primary_overheat_pen) )
			if not primary._primary_overheat_yell and not empty_no_regen then
				if not shut_up then
					managers.player:local_player():sound():say("g29",false,nil)
				end
				primary._sound_fire:post_event("turret_cooldown")
				primary._primary_overheat_yell = true
			end
		end
		if (not empty_no_regen and 
				(primary:get_ammo_remaining_in_clip() >= primary:get_ammo_total()) or 
				(primary:get_ammo_remaining_in_clip() >= primary:get_ammo_max_per_clip())) or 
			(empty_no_regen and 
				primary:clip_empty()) then 
			--log("STOP REGEN")
			primary._primary_regenerate_ammo_timer = nil
		end
		if primary._primary_regenerate_ammo_timer and (empty_no_regen and not primary:clip_empty()) and ((active and not self:_is_reloading()) or (not active)) then
			primary._primary_regenerate_ammo_timer = primary._primary_regenerate_ammo_timer - dt
			if primary._primary_regenerate_ammo_timer < 0 then
				self:primary_add_ammo(dt * primary._primary_regen_rate, mag_regen)
				if not primary._primary_recharge_yell then
					primary._primary_recharge_yell = true
					if active then
						primary._sound_fire:post_event("night_vision_on")
					end
				end
			end
		end
	end
end

function PlayerStandard:primary_add_ammo(value, mag_regen)
	local primary = self._unit:inventory():unit_by_selection(2):base()
	self._primary_add_bullet = self._primary_add_bullet or value
	if self._primary_add_bullet then
		self._primary_add_bullet = self._primary_add_bullet + value
		if math.floor(self._primary_add_bullet+0.5) >= 1 then
			primary:set_ammo_remaining_in_clip( primary:get_ammo_remaining_in_clip() + math.floor(self._primary_add_bullet+0.5))
			if mag_regen then
				primary:set_ammo_total( primary:get_ammo_total() + math.floor(self._primary_add_bullet+0.5))
			end
			managers.hud:set_ammo_amount(primary:selection_index(), primary:ammo_info())
			self._primary_add_bullet = nil
		end
	end
end


function PlayerStandard:_secondary_regen_ammo(t, dt)
	local secondary = self._unit:inventory():unit_by_selection(1):base()
	local active = secondary and self._unit:inventory():equipped_selection() == 1
	if secondary then
		local regen_ammo_time = secondary._starwars.regen_ammo_time or 0.5
		local regen_rate = secondary._starwars.regen_rate or 10
		local overheat_pen = secondary._starwars.overheat_pen or 2.75
		local regen_rate_overheat = secondary._starwars.regen_rate_overheat or 4.5
		local empty_no_regen = secondary._starwars.empty_no_regen
		local mag_regen = secondary._starwars.mag_regen
		local shut_up = secondary._starwars.shut_up

		secondary._secondary_regen_rate = secondary._secondary_regen_rate or regen_rate
		secondary._secondary_regenerate_ammo_timer = secondary._secondary_regenerate_ammo_timer or 0
		if secondary:get_ammo_total() <= 0 then
			return
		end
		if active and self._shooting then
			secondary._secondary_recharge_yell = nil
			secondary._secondary_regenerate_ammo_timer = regen_ammo_time
		end
		if secondary:clip_empty() then
			if active and self._shooting then
				self:_check_stop_shooting()
				self:_interupt_action_steelsight(t)
			end
			secondary._secondary_regen_rate = (empty_no_regen and 0) or regen_rate_overheat
			secondary._secondary_overheat_pen = (empty_no_regen and 0) or overheat_pen
		end
		if secondary._secondary_overheat_pen and secondary._secondary_overheat_pen <= 0 then
			--log( "COOL" )
			if active and not empty_no_regen then
				secondary._sound_fire:post_event("wp_sentrygun_swap_ammo")
			end
			secondary._secondary_regen_rate = regen_rate
			secondary._secondary_overheat_pen = nil
			secondary._secondary_overheat_yell = nil
		end
		if secondary._secondary_overheat_pen then
			secondary._secondary_overheat_pen = secondary._secondary_overheat_pen - dt
			--log( "OVERHEAT TIME: " .. tostring(self._secondary_overheat_pen) )
			if not secondary._secondary_overheat_yell and not empty_no_regen then
				if not shut_up then
					managers.player:local_player():sound():say("g29",false,nil)
				end
				secondary._sound_fire:post_event("turret_cooldown")
				secondary._secondary_overheat_yell = true
			end
		end
		if (not empty_no_regen and 
				(secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_total()) or 
				(secondary:get_ammo_remaining_in_clip() >= secondary:get_ammo_max_per_clip())) or 
			(empty_no_regen and 
				secondary:clip_empty()) then 
			--log("STOP REGEN")
			secondary._secondary_regenerate_ammo_timer = nil
		end
		if secondary._secondary_regenerate_ammo_timer and (empty_no_regen and not secondary:clip_empty()) and (not self:_is_reloading() and active) then
			secondary._secondary_regenerate_ammo_timer = secondary._secondary_regenerate_ammo_timer - dt
			if secondary._secondary_regenerate_ammo_timer < 0 then
				self:secondary_add_ammo(dt * secondary._secondary_regen_rate, mag_regen)
				if not secondary._secondary_recharge_yell then
					secondary._secondary_recharge_yell = true
					if active then
						secondary._sound_fire:post_event("night_vision_on")
					end
				end
			end
		end
	end
end

function PlayerStandard:secondary_add_ammo(value, mag_regen)
	local secondary = self._unit:inventory():unit_by_selection(1):base()
	self._secondary_add_bullet = self._secondary_add_bullet or value
	if self._secondary_add_bullet then
		self._secondary_add_bullet = self._secondary_add_bullet + value
		if math.floor(self._secondary_add_bullet+0.5) >= 1 then
			secondary:set_ammo_remaining_in_clip( secondary:get_ammo_remaining_in_clip() + math.floor(self._secondary_add_bullet+0.5))
			if mag_regen then
				secondary:set_ammo_total( secondary:get_ammo_total() + math.floor(self._secondary_add_bullet+0.5))
			end
			managers.hud:set_ammo_amount(secondary:selection_index(), secondary:ammo_info())
			self._secondary_add_bullet = nil
		end
	end
end

function PlayerStandard:_is_overheating()
	local primary = alive(self._unit) and self._unit.inventory and self._unit:inventory().unit_by_selection and self._unit:inventory():unit_by_selection(2):base()
	local primary_can_reload = primary and primary._starwars and primary._starwars.can_reload
	local secondary = alive(self._unit) and self._unit.inventory and self._unit:inventory().unit_by_selection and self._unit:inventory():unit_by_selection(1):base()
	local secondary_can_reload = secondary and secondary._starwars and secondary._starwars.can_reload
	return (primary and primary._primary_overheat_pen and self._unit:inventory():equipped_selection() == 2 and not primary_can_reload) or (secondary and secondary._secondary_overheat_pen and self._unit:inventory():equipped_selection() == 1 and not secondary_can_reload)
end

function PlayerStandard:_is_reloading()
	return self._state_data.reload_expire_t or self._state_data.reload_enter_expire_t or self._state_data.reload_exit_expire_t
end

function PlayerStandard:_in_burst()
	local in_burst = alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining()
	return in_burst
end



--ADS speed stuff
function PlayerStandard:_stance_entered(unequipped, timemult)
	local stance_standard = tweak_data.player.stances.default[managers.player:current_state()] or tweak_data.player.stances.default.standard
	local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
	local stance_id = nil
	local stance_mod = {
		translation = Vector3(0, 0, 0),
		rotation = Rotation(0, 0, 0)
	}

	--[[
	local weap_base = self._equipped_unit and self._equipped_unit:base()
	local weap_tweak = weap_base and weap_base:weapon_tweak_data()
	local player_char = managers.criminals:local_character_name()
	if player_char and player_char == "jowi" and weap_tweak.jowi_grip and not self._state_data.in_steelsight then
		stance_mod.translation = stance_mod.translation + Vector3(-6, -3, -4)
		stance_mod.rotation = stance_mod.rotation * Rotation(0, 0, -15)
	end
	--]]

	local head_duration = tweak_data.player.TRANSITION_DURATION
	local head_duration_multiplier = 1
	local duration_multiplier = not self._state_data.in_full_steelsight and self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
	local duration = head_duration + (self._equipped_unit:base():transition_duration() or 0)
	
	if not unequipped then
		stance_id = self._equipped_unit:base():get_stance_id()

		if self._state_data.in_steelsight and self._equipped_unit:base().stance_mod then
			stance_mod = self._equipped_unit:base():stance_mod() or stance_mod
		end

		local use_big_scope_offset = restoration.Options:GetValue("OTHER/WeaponHandling/BigScopeOffset")
		if use_big_scope_offset and self._equipped_unit:base()._has_big_scope and not self._state_data.in_steelsight then
			stance_mod.translation = stance_mod.translation + Vector3(1, 0, -2)
			stance_mod.rotation = stance_mod.rotation * Rotation(0, 0, 3)
		end
	end

	if AdvMov and AdvMov.settings then
		if not self._state_data.in_steelsight then
			if self._is_sliding and AdvMov.settings.slidewpnangle then
				stance_mod.translation = stance_mod.translation + Vector3(0, -3, 0)
				stance_mod.rotation = stance_mod.rotation * Rotation(0, 0, AdvMov.settings.slidewpnangle)
			end
			if self._is_wallrunning and AdvMov.settings.wallrunwpnangle then
				stance_mod.translation = stance_mod.translation + Vector3(0, -3, 0)
				stance_mod.rotation = stance_mod.rotation * Rotation(0, 0, -1 * AdvMov.settings.wallrunwpnangle)
			end
			if timemult then
				duration_multiplier = duration_multiplier * timemult
			end
		end
		if AdvMov.settings.goldeneye and ((AdvMov.settings.goldeneye == 2 and self._equipped_unit:base().akimbo) or AdvMov.settings.goldeneye == 3 or self._equipped_unit:base()._use_goldeneye_reload) and self:_is_reloading() then
			stance_mod.translation = Vector3(0, 0, -100)
			stance_mod.rotation = Rotation(0, 0, 0)
		end
	end

	local stances = nil
	stances = (self:_is_meleeing() or self:_is_throwing_projectile()) and tweak_data.player.stances.default or tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
	local misc_attribs = stances.standard
	misc_attribs = (not self:_is_using_bipod() or self:_is_throwing_projectile() or stances.bipod) and (self._state_data.in_steelsight and stances.steelsight or self._state_data.ducking and stances.crouched or stances.standard)
	local new_fov = self:get_zoom_fov(misc_attribs) + 0

	self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, duration, head_duration_multiplier, head_duration)
	managers.menu:set_mouse_sensitivity(self:in_steelsight())

	if PlayerStandard.set_ads_objects then
		local value = 0.155
		value = value / duration_multiplier
		if not unequipped then
			if self._state_data.in_steelsight then
				DelayedCalls:Add("FancyScopeCheckDelay", value, function()
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
--Deals with burst fire hud stuff when swapping from an underbarrel back to a weapon in burst fire.
local _check_action_deploy_underbarrel_original = PlayerStandard._check_action_deploy_underbarrel	
function PlayerStandard:_check_action_deploy_underbarrel(...)
	local new_action = _check_action_deploy_underbarrel_original(self, ...)
	
	if new_action and alive(self._equipped_unit) and self._equipped_unit:base() and self._equipped_unit:base():in_burst_mode() then
		managers.hud:set_teammate_weapon_firemode_burst(self._equipped_unit:base():selection_index())
	end
	
	return new_action
end	

--Adds burst fire check.
function PlayerStandard:_check_action_weapon_firemode(t, input)
	local wbase = self._equipped_unit:base()
	local burst_hipfire = self._equipped_unit:base():weapon_tweak_data().BURST_FIRE_DISABLE_ADS and self._equipped_unit:base():in_burst_mode()
	if burst_hipfire then
		self:_interupt_action_steelsight(t)
		if input.btn_steelsight_state then
			self._steelsight_wanted = true
		end
	end
	if input.btn_weapon_firemode_press and wbase.toggle_firemode then
		self:_check_stop_shooting()
		if wbase:toggle_firemode() then
			if wbase:in_burst_mode() then
				managers.hud:set_teammate_weapon_firemode_burst(self._unit:inventory():equipped_selection())
			else
				local base_ext = self._equipped_unit:base()

				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), base_ext:fire_mode(), base_ext:alt_fire_active())
			end
		end
	end
end

--Fires next round in burst if needed. 
function PlayerStandard:_update_burst_fire(t)
	if alive(self._equipped_unit) and self._equipped_unit:base() and self._equipped_unit:base().in_burst_mode and self._equipped_unit:base():in_burst_mode() then
		local burst_hipfire = self._equipped_unit:base():weapon_tweak_data().BURST_FIRE_DISABLE_ADS
		if burst_hipfire then
			self:_interupt_action_steelsight(t)
		end
		local input_pressed = self._controller and self._controller:get_input_pressed("primary_attack") == true or nil
		local input_bool = self._controller and self._controller:get_input_bool("primary_attack")
		local auto_burst = self._equipped_unit:base()._auto_burst
		local queue_burst = not auto_burst and (self._queue_burst and not self:_in_burst())
		local burst_complete = self._equipped_unit:base()._burst_rounds_remaining <= 0
		if self._equipped_unit:base():burst_rounds_remaining() or queue_burst or (auto_burst and not self._equipped_unit:base():clip_empty() and input_bool) then
			self:_check_action_primary_attack(t, { btn_primary_attack_state = true, btn_primary_attack_press = true, fake_attack = true, real_input_pressed = input_pressed, clear_queue = not auto_burst and burst_complete })
		end
	else
		self._queue_burst = nil
	end
end


--Recoil used at the end of burst fire.
function PlayerStandard:force_recoil_kick(weap_base, shots_fired)
	local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier() * (shots_fired or 1)
	local up, down, left, right = unpack(weap_base:weapon_tweak_data().kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
	self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
end

function PlayerStandard:_check_action_deploy_bipod(t, input, autodeploy)
	local new_action = nil
	local action_forbidden = false

	if not input.btn_deploy_bipod then
		return
	end
	local is_leaning = TacticalLean and ((TacticalLean:GetLeanDirection() or TacticalLean:IsExitingLean()) and true) or nil
	action_forbidden = self._camera_unit:base():is_stance_done() ~= true or self._state_data.in_air or self._is_sliding or (autodeploy and self._move_dir) or is_leaning or self:_on_zipline() or self:_is_throwing_projectile() or self:_is_meleeing() or self:is_equipping() or self:_changing_weapon()

	local weapon = self._equipped_unit:base()
	local bipod_part = managers.weapon_factory:get_parts_from_weapon_by_perk("bipod", weapon._parts)


	if not action_forbidden then
		if bipod_part and bipod_part[1] then
			local bipod_unit = bipod_part[1].unit and bipod_part[1].unit.base and bipod_part[1].unit:base()

			if bipod_unit then
				bipod_unit:check_state(autodeploy)
			end

			new_action = true
		end
	else
		if bipod_part and bipod_part [1] and not autodeploy then
			if self._state_data.in_air then
				managers.hud:show_hint({ time = 2, text = managers.localization:text("hud_hint_bipod_air") })
			elseif self._is_sliding then
				managers.hud:show_hint({ time = 2, text = managers.localization:text("hud_hint_bipod_slide") })
			elseif is_leaning then
				managers.hud:show_hint({ time = 2, text = managers.localization:text("hud_hint_bipod_lean") })
			elseif self._camera_unit:base():is_stance_done() ~= true then
				managers.hud:show_hint({ time = 2, text = managers.localization:text("hud_hint_bipod_midstance") })
			end
		end
	end

	return new_action
end

function PlayerStandard:_check_action_steelsight(t, input)
	local new_action = nil
	if not restoration.Options:GetValue("OTHER/WeaponHandling/SeparateBowADS") then
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
	end

	if self._setting_hold_to_steelsight and input.btn_steelsight_release then
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

function PlayerStandard:_toggle_gadget(weap_base)
	local gadget_index = 0

	local second_sight_sprint = restoration.Options:GetValue("OTHER/WeaponHandling/SecondSightSprint")
	if not second_sight_sprint and weap_base.toggle_second_sight and self:in_steelsight() and weap_base:has_second_sight() and weap_base:toggle_second_sight(self) then
		return
	end

	if weap_base.toggle_gadget and weap_base:has_gadget() and weap_base:toggle_gadget(self) then
		gadget_index = weap_base:current_gadget_index()

		self._unit:network():send("set_weapon_gadget_state", weap_base._gadget_on)

		local gadget = weap_base:get_active_gadget()

		if gadget and gadget.color then
			local col = gadget:color()

			self._unit:network():send("set_weapon_gadget_color", col.r * 255, col.g * 255, col.b * 255)
		end

		if alive(self._equipped_unit) then
			managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
		end
	end
end

function PlayerStandard:_start_action_steelsight(t, gadget_state)
	if self._equipped_unit and self._equipped_unit:base() then
		local speed_multiplier = self._equipped_unit:base():exit_run_speed_multiplier() or 1
		local sprintout_anim_time = self._equipped_unit:base():weapon_tweak_data().sprintout_anim_time or 0.4
		local orig_sprintout = sprintout_anim_time / speed_multiplier
		local sads_mult = self._equipped_unit:base():weapon_tweak_data().sads_mult or 0.3
		local burst_hipfire = self._equipped_unit:base():weapon_tweak_data().BURST_FIRE_DISABLE_ADS and self._equipped_unit:base():in_burst_mode()
		local no_ads = self._equipped_unit:base():weapon_tweak_data().no_ads

		if burst_hipfire or no_ads or (self._end_running_expire_t and (self._end_running_expire_t - t) > (orig_sprintout * sads_mult)) then
			self._steelsight_wanted = true
			return
		end
	end
	--Here!
	if self:_changing_weapon() or self:_is_overheating() or self:_is_reloading() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:_is_meleeing() or self._use_item_expire_t or self:_is_throwing_projectile() or self:_on_zipline() or self._d_scope_t then
		self._steelsight_wanted = true

		return
	end

	if self._running and not self._end_running_expire_t then
		self:_interupt_action_running(t)

		self._steelsight_wanted = true

		return
	end

	if not self:_is_using_bipod() and restoration.Options:GetValue("OTHER/WeaponHandling/AimDeploysBipod") and not self._moving then
		self:_check_action_deploy_bipod(t, {btn_deploy_bipod = true}, true)
	end

	self:_break_intimidate_redirect(t)

	self._steelsight_wanted = false
	self._state_data.in_steelsight = true

	if self._state_data.in_steelsight --[[or self._steelsight_wanted]] then
		local weapon = self._unit:inventory():equipped_unit():base()
		if weapon:weapon_tweak_data().ads_spool then
			weapon:vulcan_enter_steelsight()
		end
	end

	self:_update_crosshair_offset()
	self:_stance_entered()
	self:_interupt_action_running(t)
	self:_interupt_action_cash_inspect(t)

	local weap_base = self._equipped_unit:base()

	if gadget_state ~= nil then
		weap_base:play_sound("gadget_steelsight_" .. (gadget_state and "enter" or "exit"))
	else
		weap_base:play_tweak_data_sound("enter_steelsight")
	end

	if weap_base:weapon_tweak_data().animations.has_steelsight_stance then
		self:_need_to_play_idle_redirect()

		self._state_data.steelsight_weight_target = 1

		self._camera_unit:base():set_steelsight_anim_enabled(true)
	end

	self._state_data.reticle_obj = weap_base.get_reticle_obj and weap_base:get_reticle_obj()

	if managers.controller:get_default_wrapper_type() ~= "pc" and managers.user:get_setting("aim_assist") then
		local closest_ray = self._equipped_unit:base():check_autoaim(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), nil, true)

		self._camera_unit:base():clbk_aim_assist(closest_ray)
	end

	self._ext_network:send("set_stance", 3, false, false)
	managers.job:set_memory("cac_4", true)

	--Compatibilty for Offyerocker's MA40 Overlay 
	if self._state_data.in_steelsight then
		local weap_base = self._equipped_unit:base()
		if weap_base and weap_base._scope_overlay then
			if not weap_base._steelsight_weapon_visible and set_viewmodel_visible then
				set_viewmodel_visible(self,false)
				weap_base:set_visibility_state(false)
				weap_base:update_visibility_state()
			end
			if managers.hud.set_ma40_overlay then
				managers.hud:set_ma40_overlay(weap_base._scope_overlay)
				managers.hud:start_ma40_overlay()
			end
		end
	end
end

--Check for being fully ADS'd
function PlayerStandard:full_steelsight()
	local weap_base = self._equipped_unit:base()	
	local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
	local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
	local force_ads_recoil_anims = weap_base and (weap_base:weapon_tweak_data().always_play_anims or weap_base:second_sight_spread_mult())
	if weap_base then
		if weap_base:alt_fire_active() and weap_base._alt_fire_data and weap_base._alt_fire_data.ignore_always_play_anims and not weap_base:second_sight_spread_mult() then
			force_ads_recoil_anims = nil
		end
	end
	local is_turret = managers.player:current_state() and managers.player:current_state() == "player_turret"
	local zippy = weap_base and weap_base:weapon_tweak_data().zippy
	local jammed = zippy and weap_base._jammed
	if not jammed and restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims") and self._shooting and self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims and not is_turret then
		self._ext_camera:play_redirect(self:get_animation("idle"))
	end
	return self._state_data.in_steelsight and self._camera_unit:base():is_stance_done()
end


--Ends minigun spinup.
Hooks:PostHook(PlayerStandard, "_end_action_steelsight", "ResMinigunExitSteelsight", function(self, t, gadget_state)
	if not self._state_data.in_steelsight then
		local weapon = self._unit:inventory():equipped_unit():base()
		if weapon:weapon_tweak_data().ads_spool then
			weapon:vulcan_exit_steelsight()
		end
	end
	local weap_base = self._equipped_unit:base()	
	local fire_mode = weap_base:fire_mode()
	local weap_hold = weap_base.weapon_hold and weap_base:weapon_hold() or weap_base:get_name_id()
	local is_bow = table.contains(weap_base:weapon_tweak_data().categories, "bow")
	local force_ads_recoil_anims = weap_base and (weap_base:weapon_tweak_data().always_play_anims or weap_base:second_sight_spread_mult())
	if weap_base and weap_base:alt_fire_active() and weap_base._alt_fire_data and weap_base._alt_fire_data.ignore_always_play_anims and not weap_base:second_sight_spread_mult() then
		force_ads_recoil_anims = nil
	end

	if fire_mode == "auto" and not weap_base:weapon_tweak_data().no_auto_anims then
		if restoration.Options:GetValue("OTHER/WeaponHandling/NoADSRecoilAnims") and self._shooting and not self._state_data.in_steelsight and not weap_base.akimbo and not is_bow and not norecoil_blacklist[weap_hold] and not force_ads_recoil_anims then
			self._ext_camera:play_redirect(self:get_animation("recoil_enter"))
		end
	end
end)

function PlayerStandard:_update_slide_locks()
	local weap_base = alive(self._equipped_unit) and self._equipped_unit:base()
	if weap_base and weap_base:weapon_tweak_data().lock_slide and not self:_is_reloading() then
		if (weap_base.AKIMBO and weap_base:ammo_base():get_ammo_remaining_in_clip() > 1) or (not weap_base.AKIMBO and not weap_base:clip_empty()) then
			weap_base:tweak_data_anim_stop("magazine_empty")
			if weap_base:weapon_tweak_data().open_bolt_offset then
				weap_base:tweak_data_anim_offset("reload", weap_base:weapon_tweak_data().open_bolt_offset or 5)
			else
				weap_base:tweak_data_anim_stop("reload")
				weap_base:tweak_data_anim_stop("reload_left")
			end
			if weap_base.AKIMBO then
				weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty")
				weap_base._second_gun:base():tweak_data_anim_stop("reload")
				weap_base._second_gun:base():tweak_data_anim_stop("reload_left")
			end
		end
		if --[[not weap_base._starwars and]] not self:_is_reloading() then
			if weap_base.AKIMBO and weap_base:ammo_base():get_ammo_remaining_in_clip() == 1 then
				weap_base:tweak_data_anim_stop("fire")
				weap_base:tweak_data_anim_stop("magazine_empty")
				weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty") 
				if weap_base._fire_second_gun_next == false then
					weap_base:tweak_data_anim_offset("reload_left", 0.033, true)
				else
					weap_base:tweak_data_anim_offset("reload_left", 0.033)
				end
			elseif weap_base:clip_empty() then
				weap_base:tweak_data_anim_stop("fire")
				weap_base:tweak_data_anim_stop("magazine_empty")
				weap_base:tweak_data_anim_stop("reload")
				weap_base:tweak_data_anim_stop("reload_left")
				if weap_base:weapon_tweak_data().lock_slide_reload_objects then
					weap_base:set_reload_objects_visible(true)
				end
				if weap_base.AKIMBO then
					weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty")
					weap_base._second_gun:base():tweak_data_anim_offset("reload", 0.1033) 
					weap_base:tweak_data_anim_offset("reload", 0.033)
					--weap_base:tweak_data_anim_offset("reload_left", 0.033, true)
					if (weap_base:weapon_tweak_data().animations and weap_base:weapon_tweak_data().animations.magazine_empty and weap_base:weapon_tweak_data().lock_slide_alt) then
						weap_base:tweak_data_anim_offset("magazine_empty", 1)
						weap_base._second_gun:base():tweak_data_anim_offset("magazine_empty", 1)
					end
				else
					if (weap_base:weapon_tweak_data().animations and weap_base:weapon_tweak_data().animations.magazine_empty and weap_base:weapon_tweak_data().lock_slide_alt) then
						weap_base:tweak_data_anim_offset("magazine_empty", 1)
					elseif weap_base:weapon_tweak_data().lock_slide_fire then
						weap_base:tweak_data_anim_offset("fire", weap_base:weapon_tweak_data().lock_slide_offset or 0.033)
					else 
						weap_base:tweak_data_anim_offset("reload", weap_base:weapon_tweak_data().lock_slide_offset or 0.033)
					end
				end
			end
		end	
	end
end

PlayerStandard._DRAW_MELEE_DEBUG = nil
PlayerStandard._DRAW_MELEE_DEBUG_HITS = nil
function PlayerStandard:_calc_melee_hit_ray(t, sphere_cast_radius, from, direction)
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local melee_tweak_data = tweak_data.blackmarket.melee_weapons[melee_entry]
	local range = melee_tweak_data.stats.range or 150

	local weap_base = self._equipped_unit:base()
	local wtd = weap_base:weapon_tweak_data()
	local wtd_base_range = wtd and math.max(wtd.jab_range or 0, 0)
	local active_weapon = self._unit:inventory():equipped_selection() == 1 and managers.blackmarket:equipped_secondary() or managers.blackmarket:equipped_primary()
	local active_weapon_stats = active_weapon and melee_entry == "weapon" and managers.weapon_factory:get_stats(active_weapon.factory_id, active_weapon.blueprint)
	local active_weapon_range = active_weapon_stats and math.max((active_weapon_stats and active_weapon_stats.jab_range or active_weapon_stats.bayonet_range) or 0, 0) or 0
	range = range + wtd_base_range + active_weapon_range

	local has_charged_range = self._melee_charge_bonus and self._melee_charge_bonus == true
	local charge_bonus_range = melee_tweak_data.stats.charge_bonus_range or 0
	if has_charged_range then
		range = range + charge_bonus_range
	end

	--local sphere_cast_radius_add = (has_charged_range and self._melee_attack_var_charge_h and melee_tweak_data.sphere_cast_radius_add_charged_h) or (self._melee_attack_var_h and melee_tweak_data.sphere_cast_radius_add_h) or melee_tweak_data.sphere_cast_radius_add
	if sphere_cast_radius_add then
		sphere_cast_radius = sphere_cast_radius + sphere_cast_radius_add
		range = range - sphere_cast_radius_add
	end

	local from = from or self._unit:movement():m_head_pos()
	local to = from + (direction or self._unit:movement():m_head_rot():y()) * range

	local col_ray = self._unit:raycast("ray", from, to, "slot_mask", self._slotmask_bullet_impact_targets, "sphere_cast_radius", sphere_cast_radius, "ray_type", "body melee")
	
	if PlayerStandard._DRAW_MELEE_DEBUG then
		local dist = PlayerStandard._DRAW_MELEE_DEBUG_HITS and col_ray and col_ray.position
		Draw:brush(Color.blue:with_alpha(0.1),3):line(from,dist or to)
		Draw:brush(dist and Color.red:with_alpha(0.05) or Color.green:with_alpha(0.1),3):sphere(dist or to,sphere_cast_radius)
	end

	return col_ray
end

function PlayerStandard:_do_melee_damage(t, bayonet_melee, melee_hit_ray, melee_entry, hand_id, hit_unit, col_ray, dmg_div, no_shaker, no_sound, no_effect)
	melee_entry = melee_entry or managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t, melee_damage_delay)
	local sphere_cast_radius = 20
	local col_ray = col_ray or nil
	local make_effect = bayonet_melee or tweak_data.blackmarket.melee_weapons[melee_entry].make_effect or nil
	local make_decal = tweak_data.blackmarket.melee_weapons[melee_entry].make_decal or nil
	local make_saw = tweak_data.blackmarket.melee_weapons[melee_entry].make_saw or nil --not implemented yet
	local weap_base = self._equipped_unit:base()	
	local alt_sound = weap_base._alt_melee_sounds
	--Melee weapon tweakdata.
	local melee_weapon = tweak_data.blackmarket.melee_weapons[melee_entry]
	--Holds info for certain melee gimmicks (IE: Taser Shock, Psycho Knife Panic, ect)
	local special_weapon = melee_weapon.special_weapon
	self._state_data._charger_melee_active = nil

	-- If true, disables the shaker when a melee weapon connects
	if not melee_weapon.no_hit_shaker and not no_shaker then
		self._ext_camera:play_shaker(melee_vars[math.random(#melee_vars)], math.max(0.3, charge_lerp_value))
	end
	if not col_ray then
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
		end
	end
	if col_ray and alive(col_ray.unit) then
		local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(charge_lerp_value)
		local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().categories and self._equipped_unit:base():weapon_tweak_data().categories[1], "melee_knockdown_mul", 1))
		damage = damage * managers.player:get_melee_dmg_multiplier()
		damage = damage / (dmg_div or 1)
		damage_effect = damage_effect * damage_effect_mul
		damage_effect = damage_effect / (dmg_div or 1)
		col_ray.sphere_cast_radius = sphere_cast_radius
		local hit_unit = hit_unit or col_ray.unit
		if hit_unit:character_damage() then
			if bayonet_melee then
				self._unit:sound():play("fairbairn_hit_body", nil, false)
			elseif alt_sound and alt_sound[1] then
				self._unit:sound():play(alt_sound[1], nil, false)
			elseif special_weapon == "taser" and charge_lerp_value ~= 1 then --Feedback for non-charged attacks with shock weapons. Might not do anything, need to verify.
				self._unit:sound():play("melee_hit_gen", nil, false)
			else
				if not no_sound then
					self:_play_melee_sound(melee_entry, "hit_body")
				end
			end
			if not hit_unit:character_damage()._no_blood and not no_effect then
				managers.game_play_central:play_impact_flesh({col_ray = col_ray})
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					no_decal = true,
					no_sound = true
				})
			end
			self._camera_unit:base():play_anim_melee_item("hit_body")
		else
			if self._on_melee_restart_drill and hit_unit:base() and (hit_unit:base().is_drill or hit_unit:base().is_saw) then
				hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
			end		
		
			if bayonet_melee then
				self._unit:sound():play("knife_hit_gen", nil, false)
			elseif alt_sound and alt_sound[2] then
				self._unit:sound():play(alt_sound[2], nil, false)
			elseif special_weapon == "taser" and charge_lerp_value ~= 1 then --Feedback for non-charged attacks with shock weapons. Might not do anything, need to verify.
				self._unit:sound():play("melee_hit_gen", nil, false)
			else
				if not no_sound then
					self:_play_melee_sound(melee_entry, "hit_gen")
				end
			end
			if not no_effect then
				managers.game_play_central:play_impact_sound_and_effects({
					decal = make_saw and "saw",
					col_ray = col_ray,
					effect = (not make_effect and not make_saw and Idstring("effects/payday2/particles/impacts/fallback_impact_pd2")) or nil,
					no_decal = (not make_decal and not make_saw) and true,
					no_sound = true
				})
			end
		end

		--Out of date syncing method, reenable in case it was load bearing.
		--[[if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
			col_ray.body:extension().damage:damage_melee(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
			if hit_unit:id() ~= -1 then
				managers.network:session():send_to_peers_synched("sync_body_damage_melee", col_ray.body, self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
			end
		end]]

		local custom_data = nil
			
		if _G.IS_VR then
			local melee_hand_id = self._unit:hand():get_active_hand_id("melee")
			melee_hand_id = melee_hand_id or self._unit:hand():get_active_hand_id("weapon")

			if melee_hand_id then
				custom_data = {engine = melee_hand_id == 1 and "right" or "left"}
			end
		end			

		managers.rumble:play("melee_hit", nil, nil, custom_data)
		managers.game_play_central:physics_push(col_ray)
		
		local character_unit, shield_knock
		local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")
		if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) then
			shield_knock = true
			character_unit = hit_unit:parent()
		end
		character_unit = character_unit or hit_unit

		if self._melee_charge_bonus then
			if special_weapon == "megumin" then
				local curve_pow = melee_weapon.explosion_curve_pow or 0.5
				local exp_dmg = melee_weapon.explosion_damage or 60
				local exp_range = melee_weapon.explosion_range or 500
				local effect_params = {
					sound_event = "grenade_explode",
    				effect = "effects/payday2/particles/explosions/grenade_explosion",
					sound_muffle_effect = true,
					feedback_range = exp_range * 2,
					camera_shake_max_mul = 2
				}
				managers.explosion:play_sound_and_effects(col_ray.position, col_ray.normal, exp_range, effect_params)		
				managers.explosion:detect_and_give_dmg({
					hit_pos = col_ray.position,
					range = exp_range,
					collision_slotmask = managers.slot:get_mask("explosion_targets"),
					curve_pow = curve_pow,
					damage = exp_dmg,
					player_damage = 0,
					alert_radius = 2500,
					ignore_unit = self._unit,
					user = self._unit
				})
				local network_damage = math.ceil(exp_dmg * 163.84)
				managers.network:session():send_to_peers_synched("sync_explode_bullet", col_ray.position, col_ray.normal, math.min(16384, network_damage), managers.network:session():local_peer():id())

				self._unit:character_damage()._check_berserker_done = false
				self._unit:character_damage()._can_survive_one_hit = false
				self._unit:character_damage():force_into_bleedout()
    			managers.player:set_player_state("fatal")
			elseif special_weapon == "mjolnir" then
				local curve_pow = melee_weapon.explosion_curve_pow or 0.5
				local exp_dmg = melee_weapon.explosion_damage or 60
				local exp_range = melee_weapon.explosion_range or 500
				local effect_params = {
					sound_event = "grenade_electric_explode",
					effect = "effects/particles/explosions/electric_grenade",
					sound_muffle_effect = false,
					feedback_range = exp_range,
					camera_shake_max_mul = 1
				}
				managers.explosion:play_sound_and_effects(col_ray.position, col_ray.normal, exp_range, effect_params)		
				managers.explosion:detect_and_tase({
					hit_pos = col_ray.position,
					range = exp_range,
					collision_slotmask = managers.slot:get_mask("enemies"),
					curve_pow = curve_pow,
					damage = 0,
					player_damage = 0,
					alert_radius = 2500,
					ignore_unit = self._unit,
					user = self._unit
				})
			end
		end

		if character_unit:character_damage() and character_unit:character_damage().damage_melee then
			local dmg_multiplier = self._melee_repeat_damage_bonus or 1

			dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)

			if character_unit:base() and character_unit:base().char_tweak and character_unit:base():char_tweak().priority_shout then
				dmg_multiplier = dmg_multiplier * (tweak_data.blackmarket.melee_weapons[melee_entry].stats.special_damage_multiplier or 1)
			end

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

			local damage_health_ratio = managers.player:get_damage_health_ratio(self._ext_damage:health_ratio(), "melee")
			if damage_health_ratio > 0 then
				dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_health_ratio)
			end

			if character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) and managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech") then
				managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
				self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
			end

			--Do melee gimmick stuff. Might be worth it to use function references instead of branching later on if we get more of these.
			local action_data = {}
			action_data.variant = "melee"

			if special_weapon == "repeat_hitter" then
				self._melee_repeat_damage_bonus = 2.0
			elseif special_weapon == "talk" and character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) and math.random() <= 0.2 then
				self._unit:sound():say("f46x_any", true)
			elseif special_weapon == "hyper_crit" and math.random() <= 0.05 then
				dmg_multiplier = dmg_multiplier * 10
				damage_effect = damage_effect * 10
				self._unit:sound():play("bell_ring")
			end
			
			if charge_lerp_value >= 0.99 then
				if special_weapon == "caber" then
					if character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) then
						local explosion_chance = melee_weapon.explosion_chance or 0.05
						if math.random() <= explosion_chance then
							local curve_pow = melee_weapon.explosion_curve_pow or 0.5
							local exp_dmg = melee_weapon.explosion_damage or 60
							local exp_range = melee_weapon.explosion_range or 500
							local effect_params = {
								sound_event = "trip_mine_explode",
								effect = "effects/payday2/particles/explosions/shapecharger_explosion",
								on_unit = true,
								sound_muffle_effect = true,
								feedback_range = exp_range,
								camera_shake_max_mul = 2
							}
							managers.explosion:play_sound_and_effects(col_ray.position, col_ray.normal, exp_range, effect_params)
							managers.explosion:give_local_player_dmg(col_ray.position, exp_range, exp_dmg, self._unit, curve_pow)						
							managers.explosion:detect_and_give_dmg({
								hit_pos = col_ray.position,
								range = exp_range,
								collision_slotmask = managers.slot:get_mask("explosion_targets"),
								curve_pow = curve_pow,
								damage = exp_dmg,
								player_damage = 0,
								alert_radius = 2500,
								ignore_unit = self._unit,
								user = self._unit
							})
							local network_damage = math.ceil(exp_dmg * 163.84)
							managers.network:session():send_to_peers_synched("sync_explode_bullet", col_ray.position, col_ray.normal, math.min(16384, network_damage), managers.network:session():local_peer():id())
						end
					end
				elseif special_weapon == "taser" then
					action_data.variant = "taser_tased"
				elseif special_weapon == "panic" then
					managers.player:spread_psycho_knife_panic()
				end
			end
				
			if _G.IS_VR and melee_entry == "weapon" and not bayonet_melee then
				dmg_multiplier = 0.1
			end				
			
			action_data.damage = shield_knock and 0 or damage * dmg_multiplier
			action_data.damage_effect = damage_effect
			action_data.attacker_unit = self._unit
			action_data.col_ray = col_ray
			action_data.shield_knock = can_shield_knock --Silly vanilla code using branching when it doesn't need to.
			action_data.name_id = melee_entry
			action_data.charge_lerp_value = charge_lerp_value
			--Damage multipliers for certain melees (IE: Butterfly Knife).
			action_data.backstab_multiplier = melee_weapon.backstab_damage_multiplier or 1
			action_data.headshot_multiplier = melee_weapon.headshot_damage_multiplier or 1
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
			self:_check_melee_special_damage(col_ray, character_unit, defense_data, melee_entry)
			self:_perform_sync_melee_damage(hit_unit, col_ray, action_data.damage, action_data.damage_effect)

			--[[
			local do_push = melee_weapon.do_push
			if defense_data and defense_data.head_shot and defense_data.type and defense_data.type == "death" then			
				if not managers.groupai:state():whisper_mode() then
					local rotation = self._unit:movement():m_head_rot()
					local v_mult = (self._melee_attack_var_l_r and self._melee_attack_var_l_r[2]) or 0
					local l_r = (self._melee_attack_var_l_r and (((self._melee_attack_var_l_r == "left" or self._melee_attack_var_l_r[1] == "left") and 1) or ((self._melee_attack_var_l_r == "right" or self._melee_attack_var_l_r[1] == "right") and -1))) or 0

					local l_r_force = (1 - v_mult) * (l_r * -180)
					local v_force = math.abs(l_r_force) > 90 and -1 or 1
					local forward_vec = Vector3( l_r_force, -90 * -v_force , v_mult * -180 * v_force)

					mvector3.rotate_with(forward_vec, rotation)
					local hit_pos = mvector3.copy(character_unit:movement():m_pos())
					local attack_dir = hit_pos - self._unit:movement():m_head_pos() + forward_vec
					local distance = mvector3.normalize(attack_dir)
					local magnitude = 0.8 + math.lerp(0, 0.4, charge_lerp_value)
					mvector3.multiply(attack_dir, magnitude)
					managers.game_play_central:do_shotgun_push(character_unit, col_ray.hit_position, attack_dir, distance)

				end
			end
			]]
			
			return defense_data
		else
			self:_perform_sync_melee_damage(hit_unit, col_ray, damage, damage_effect)
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

function PlayerStandard:_check_melee_special_damage(col_ray, character_unit, defense_data, melee_entry)
	if not defense_data or defense_data.type == "death" then
		return
	end
	local melee_tweak = tweak_data.blackmarket.melee_weapons[melee_entry]
	local char_base = character_unit:base()
	local char_tweak = char_base and char_base.char_tweak and char_base:char_tweak()
	local char_damage = character_unit:character_damage()
	local fire_on_charge = melee_tweak and melee_tweak.stats.charge_bonus_fire
	local charge_lerp_value = defense_data.charge_lerp_value
	local charge_fire_check = (fire_on_charge and charge_lerp_value and charge_lerp_value > tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_bonus_start) or (not fire_on_charge and true)

	if melee_tweak.random_special_effects then
		local selector = WeightedSelector:new()

		for _, effect in pairs(melee_tweak.random_special_effects) do
			selector:add(effect, effect.weight)
		end

		melee_tweak = selector:select()
	end

	if melee_tweak.dot_data_name and charge_fire_check and char_damage.damage_dot and defense_data and defense_data ~= "friendly_fire" and (not char_damage.dead or not char_damage:dead()) then
		local data = tweak_data.dot:get_dot_data(melee_tweak.dot_data_name)
		local damage_class = CoreSerialize.string_to_classtable(data.damage_class)

		if damage_class then
			damage_class:start_dot_damage(col_ray, nil, data, melee_entry, self._unit, defense_data)
		else
			Application:error("[PlayerStandard:_check_melee_special_damage] No '" .. tostring(data.damage_class) .. "' class found for dot tweak with name '" .. tostring(melee_tweak.dot_data_name) .. "'.")
		end
	end

	if melee_tweak.tase_data and char_damage.damage_tase then
		local action_data = {
			variant = melee_tweak.tase_data.tase_strength,
			damage = 0,
			attacker_unit = self._unit,
			col_ray = col_ray
		}

		if char_tweak and char_tweak.can_be_tased ~= false then
			char_damage:damage_tase(action_data)
		end
	end

	if melee_tweak.instant_kill and char_damage.damage_mission then
		local action_data = {
			variant = "melee",
			attacker_unit = self._unit,
			col_ray = col_ray,
			name_id = melee_entry,
			damage = char_damage._HEALTH_INIT,
			damage_effect = 1
		}

		char_damage:damage_melee(action_data)
	end

end

function PlayerStandard:_perform_sync_melee_damage(hit_unit, col_ray, damage, damage_effect)
	if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
		damage = math.clamp(damage, PlayerStandard.MINMAX_MELEE_SYNC[1], PlayerStandard.MINMAX_MELEE_SYNC[2])
		if damage_effect then
			damage_effect = math.clamp(damage_effect, PlayerStandard.MINMAX_MELEE_SYNC[1], PlayerStandard.MINMAX_MELEE_SYNC[2])
			col_ray.body:extension().damage:damage_damage(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage_effect)
		end

		col_ray.body:extension().damage:damage_melee(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
		managers.network:session():send_to_peers_synched("sync_body_damage_melee", col_ray.body, self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage, damage_effect)
	end
end

--Now also returns steelsight information. Used for referencing spread values to give steelsight bonuses.
function PlayerStandard:get_movement_state()
	if not self._spread_stun_t and self._state_data.in_steelsight and self._state_data.in_full_steelsight then
		return self._moving and "moving_steelsight" or "steelsight"
	end

	if self._state_data.ducking then
		return self._moving and "moving_crouching" or "crouching"
	else
		return self._moving and "moving_standing" or "standing"
	end
end

--Initiate dodge stuff when player enters a state where they can begin dodging stuff.
--Crashes here indicate syntax errors in playerdamage.
Hooks:PostHook(PlayerStandard, "_enter", "ResDodgeInit", function(self, enter_data)
	self._ext_damage:set_dodge_points()
end)

function PlayerStandard:_update_reload_timers(t, dt, input)
	if self._state_data.reload_enter_expire_t and self._state_data.reload_enter_expire_t <= t then
		self._equipped_unit:base():tweak_data_anim_stop("fire")
		self._equipped_unit:base():tweak_data_anim_stop("fire_steelsight")
		self._equipped_unit:base():tweak_data_anim_stop("magazine_empty")
		self._state_data.reload_enter_expire_t = nil
		self:_start_action_reload(t)
	end
	
	--Moved earlier in function to avoid math on nil value.
	local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
	local anim_multiplier = self._equipped_unit:base()._reload_anim_multiplier or 1
	
	if self._state_data.reload_expire_t then
		local interupt = nil
		local reload_fix_offset = self._equipped_unit:base():weapon_tweak_data().reload_fix_offset
		local reload_fix_offset2 = self._equipped_unit:base():weapon_tweak_data().reload_fix_offset2
		local always_use_empty_reload = self._equipped_unit:base():weapon_tweak_data().always_use_empty_reload
		if reload_fix_offset then
			self._equipped_unit:base():tweak_data_anim_stop("reload")
		end
		if self._equipped_unit:base():update_reloading(t, dt, self._state_data.reload_expire_t - t) then
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			if self._queue_reload_interupt then
				self._queue_reload_interupt = nil
				interupt = true
			end
		end
		if self._state_data.reload_expire_t <= t or interupt then
			managers.player:remove_property("shock_and_awe_reload_multiplier")
			self._state_data.reload_expire_t = nil

			if (self._equipped_unit:base():weapon_tweak_data().empty_use_mag and self._equipped_unit:base():clip_empty()) or (not self._equipped_unit:base()._use_shotgun_reload and self._equipped_unit:base():reload_exit_expire_t() and self._equipped_unit:base():reload_not_empty_exit_expire_t()) then
				local is_reload_not_empty = not self._equipped_unit:base():clip_empty()
				if not interupt then
					self._equipped_unit:base():on_reload()
				end
				self._state_data.reload_exit_expire_t = t + ((is_reload_not_empty and self._equipped_unit:base():reload_not_empty_exit_expire_t()) or (self._equipped_unit:base():reload_exit_expire_t() or empty_use_mag_timer)) / (speed_multiplier * anim_multiplier)
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			elseif self._equipped_unit:base():reload_exit_expire_t() then
				local is_reload_not_empty = not self._equipped_unit:base():started_reload_empty()
				local animation_name = (not always_use_empty_reload and is_reload_not_empty and "reload_not_empty_exit") or "reload_exit"
				local animation = self:get_animation(animation_name)
				
				self._state_data.reload_exit_expire_t = t + ((is_reload_not_empty and self._equipped_unit:base():reload_not_empty_exit_expire_t()) or self._equipped_unit:base():reload_exit_expire_t()) / (speed_multiplier * anim_multiplier)

				local result = self._ext_camera:play_redirect(animation, speed_multiplier * anim_multiplier)
				
				self._equipped_unit:base():tweak_data_anim_play(animation_name, speed_multiplier * anim_multiplier, nil, reload_fix_offset2)

				if reload_fix_offset then
					local reload_anim = is_reload_not_empty and "reload_not_empty" or "reload"
					self._equipped_unit:base():tweak_data_anim_play(reload_anim, speed_multiplier * anim_multiplier, reload_fix_offset)
				end
				
				
			elseif self._state_data.reload_expire_t and self._state_data.reload_expire_t <= t then --Update timers in case player total ammo changes to allow for more to be reloaded.
				self._state_data.reload_expire_t = t + (self._equipped_unit:base():reload_expire_t() or 2.2) / speed_multiplier		
				
			elseif self._equipped_unit then
				if not interupt then
					self._equipped_unit:base():on_reload()
				end
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
				if input.btn_steelsight_state then
					self._steelsight_wanted = true
				elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self._equipped_unit:base():run_and_shoot_allowed() then
					self._ext_camera:play_redirect(self:get_animation("start_running"))
				end
			end
		end
	end
	if self._state_data.reload_exit_expire_t and self._state_data.reload_exit_expire_t <= t then
		self._state_data.reload_exit_expire_t = nil
		if self._equipped_unit then
			managers.statistics:reloaded()
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			if input.btn_steelsight_state then
				self._steelsight_wanted = true
			elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self._equipped_unit:base():run_and_shoot_allowed() then
				self._ext_camera:play_redirect(self:get_animation("start_running"))
			end
			if self._equipped_unit:base().on_reload_stop then
				self._equipped_unit:base():on_reload_stop()
			end
		end
	end
	if not self._state_data.reload_expire_t and not self._state_data.reload_exit_expire_t then
		if self._equipped_unit and self._equipped_unit:base().set_reload_objects_visible and self._equipped_unit:base()._ignore_reload_objects then
			self._equipped_unit:base():tweak_data_anim_stop("reload")
			self._equipped_unit:base():set_reload_objects_visible(false)
		end
	end
end

--Fixes weapons with manually actuated parts (visually) like pumps and bolt-actions still animating upon starting a reload
--Also includes fix for Bloodthirst's reload bonus
Hooks:PostHook(PlayerStandard, "_start_action_reload_enter", "ResStopFireAnimReloadFix", function(self, t)
	local weap_base = self._equipped_unit:base()
	if weap_base and weap_base:can_reload() then
		weap_base:tweak_data_anim_stop("fire")
		weap_base:tweak_data_anim_stop("fire_steelsight")
		weap_base:tweak_data_anim_stop("magazine_empty")
		if weap_base.AKIMBO then
			weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty")
			weap_base._second_gun:base():tweak_data_anim_stop("reload")
		end
		weap_base._current_reload_speed_multiplier = nil
	end
end)

function PlayerStandard:_start_action_reload(t)
	local weapon = self._equipped_unit:base()

	if weapon and weapon:can_reload() then
		local weapon_tweak = weapon:weapon_tweak_data()
		local anims_tweak = weapon_tweak.animations or {}
		local ignore_fullreload = anims_tweak.ignore_fullreload
		local ignore_nonemptyreload = anims_tweak.ignore_nonemptyreload
		local clip_empty = weapon:clip_empty()
		if weapon.no_reload_anims then
			self._ext_camera:play_redirect(self:get_animation("idle"))	
		end
		if ((ignore_fullreload and clip_empty) or (ignore_nonemptyreload and not clip_empty)) then
			weapon:tweak_data_anim_stop("fire")
			weapon:tweak_data_anim_stop("fire_steelsight")
			weapon:tweak_data_anim_stop("magazine_empty")
	
			local speed_multiplier = weapon:reload_speed_multiplier()
			local anim_multiplier = weapon._reload_anim_multiplier or 1
			local reload_prefix = weapon:reload_prefix() or ""
			local reload_name_id = anims_tweak.reload_name_id or weapon.name_id
	
			local expire_t = weapon_tweak.timers.reload_not_empty or weapon:reload_expire_t() or (ignore_fullreload and 2.2 or 2.8)
			local reload_anim = ignore_fullreload and "reload_not_empty" or "reload"
	
			weapon:start_reload()

			self._ext_camera:play_redirect(Idstring(reload_prefix .. reload_anim .. "_" .. reload_name_id), speed_multiplier * anim_multiplier)
			self._state_data.reload_expire_t = t + expire_t / speed_multiplier
	
			if not weapon:tweak_data_anim_play(reload_anim, speed_multiplier * anim_multiplier) then
				weapon:tweak_data_anim_play("reload", speed_multiplier * anim_multiplier)
			end
	
			self._ext_network:send("reload_weapon", ignore_fullreload and 0 or 1, speed_multiplier)
	
			return
		else
			local is_reload_not_empty = weapon:clip_not_empty()
		
			weapon:tweak_data_anim_stop("fire")
			weapon:tweak_data_anim_stop("fire_steelsight")
			weapon:tweak_data_anim_stop("magazine_empty")
	
			local speed_multiplier = weapon:reload_speed_multiplier()
			local anim_multiplier = weapon._reload_anim_multiplier or 1
			local empty_reload = weapon:clip_empty() and 1 or 0
	
			if weapon:use_shotgun_reload() then
				empty_reload = weapon:get_ammo_max_per_clip() - weapon:get_ammo_remaining_in_clip()
			end
	
			local weapon_tweak = weapon:weapon_tweak_data()
			local wep_tweak = weapon and weapon.name_id and tweak_data.weapon[weapon.name_id]
			local reload_anim = "reload"
			local reload_prefix = weapon:reload_prefix() or ""
			local reload_name_id = weapon_tweak.animations.reload_name_id or wep_tweak.use_underbarrel_anim or weapon.name_id
			local reload_default_expire_t = 2.6
			local reload_tweak = weapon_tweak.timers.reload_empty		
			
			weapon:start_reload() --Executed earlier to get accurate reload timers, otherwise may mess up normal and tactical for shotguns.
	
			if is_reload_not_empty then
				reload_anim = "reload_not_empty"
				reload_default_expire_t = 2.2
				reload_tweak = weapon_tweak.timers.reload_not_empty
			end
	
			local reload_ids = Idstring(string.format("%s%s_%s", reload_prefix, reload_anim, reload_name_id))
			local result = self._ext_camera:play_redirect(reload_ids, speed_multiplier * anim_multiplier)
	
			Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_ids)
	
			self._state_data.reload_expire_t = t + (reload_tweak or weapon:reload_expire_t(is_reload_not_empty) or reload_default_expire_t) / speed_multiplier
	
			if not weapon:tweak_data_anim_play(reload_anim, speed_multiplier * anim_multiplier) then
				weapon:tweak_data_anim_play("reload", speed_multiplier * anim_multiplier)
				Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_anim)
			end
	
			self._ext_network:send("reload_weapon", empty_reload, speed_multiplier)
		end
	end

	self._queue_fire = nil
	self._queue_burst = nil

	--Drop My Mag compatibilty
	--I might take the time to better integrate this into the reload timers so you're not instantly dropping a mag right when you reload
	for _, weapon_base in ipairs({ weapon, weapon._second_gun and weapon._second_gun:base() }) do
		if weapon_base and weapon_base.DMM_can_drop_magazine and weapon_base:DMM_can_drop_magazine() then
			weapon_base:drop_magazine_object()
		end
 	end
end

function PlayerStandard:_get_swap_speed_multiplier(use_alt)
	local multiplier = 1
	local weap_base = self._equipped_unit:base()
	local weapon_tweak = weap_base and weap_base:weapon_tweak_data()
	local alt_swap = (self._unit:inventory():equipped_selection() == 1 and self._unit:inventory():unit_by_selection(2):base()) or 
		(self._unit:inventory():equipped_selection() == 2 and self._unit:inventory():unit_by_selection(1):base())
	local alt_swap_tweak = alt_swap and alt_swap:weapon_tweak_data()
	if weapon_tweak and weapon_tweak.use_unequip_swap then
		use_alt = nil
	end
	multiplier = multiplier * managers.player:upgrade_value("weapon", "swap_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_swap_speed_multiplier", 1)
	multiplier = multiplier * tweak_data.weapon.stats.mobility[ (
		(use_alt and alt_swap:get_concealment()) or 
		(weap_base:get_concealment())
	) + 1] --Get concealment bonus/penalty.

	--Get per category multipliers (IE: Pistols swap faster, Akimbos swap slower, ect).
	for _, category in ipairs((use_alt and alt_swap_tweak.categories) or weapon_tweak.categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "swap_speed_multiplier", 1)
		multiplier = multiplier * (tweak_data[category] and tweak_data[category].swap_bonus or 1)
	end

	if self._equipped_unit:base():got_silencer() then
		multiplier = multiplier * managers.player:upgrade_value("player", "silencer_swap_increase", 1)
	end

	--Get per weapon multiplier.
	multiplier = multiplier * ((use_alt and alt_swap_tweak.swap_speed_multiplier) or weapon_tweak.swap_speed_multiplier or 1)

	multiplier = multiplier * managers.player:upgrade_value("team", "crew_faster_swap", 1)

	if managers.player:has_activate_temporary_upgrade("temporary", "swap_weapon_faster") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "swap_weapon_faster", 1)
	end

	multiplier = managers.modifiers:modify_value("PlayerStandard:GetSwapSpeedMultiplier", multiplier)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "mrwi_swap_speed_multiplier", 1)

	--MERCENARY DECK
	if managers.player:has_category_upgrade("player","kmerc_swap_speed_per_max_armor") then
		local dmg_ext = self._unit:character_damage() 
		if dmg_ext then
			local rate_bonus = managers.player:upgrade_value("player","kmerc_swap_speed_per_max_armor",0)
			local rate_armor = tweak_data.upgrades.values.player.kmerc_generic_bonus_per_max_armor_rate
			local max_armor = dmg_ext:_max_armor()
			local bonus = math.floor(max_armor / rate_armor) * rate_bonus

			multiplier = multiplier + bonus
		end
	end

	return multiplier
end

--Inspire no longer works through walls.
function PlayerStandard:_get_unit_intimidation_action(intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only, secondary)
	local char_table = {}
	local unit_type_enemy = 0
	local unit_type_civilian = 1
	local unit_type_teammate = 2
	local unit_type_camera = 3
	local unit_type_turret = 4
	local cam_fwd = self._ext_camera:forward()
	local my_head_pos = self._ext_movement:m_head_pos()

	if _G.IS_VR then
		local hand_unit = self._unit:hand():hand_unit(self._interact_hand)

		if hand_unit:raycast("ray", hand_unit:position(), my_head_pos, "slot_mask", 1) then
			return
		end

		cam_fwd = hand_unit:rotation():y()
		my_head_pos = hand_unit:position()
	end

	local spotting_mul = managers.player:upgrade_value("player", "marked_distance_mul", 1)
	local range_mul = managers.player:upgrade_value("player", "intimidate_range_mul", 1) * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1)
	local intimidate_range_civ = tweak_data.player.long_dis_interaction.intimidate_range_civilians * range_mul
	local intimidate_range_ene = tweak_data.player.long_dis_interaction.intimidate_range_enemies * range_mul
	local highlight_range = tweak_data.player.long_dis_interaction.highlight_range * range_mul * spotting_mul
	local intimidate_range_teammates = tweak_data.player.long_dis_interaction.intimidate_range_teammates

	if intimidate_enemies then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if self._unit:movement():team().foes[u_data.unit:movement():team().id] and not u_data.unit:anim_data().hands_tied and not u_data.unit:anim_data().long_dis_interact_disabled and (not u_data.unit:character_damage() or not u_data.unit:character_damage():dead()) and (u_data.char_tweak.priority_shout or not only_special_enemies) then
				if managers.groupai:state():whisper_mode() then
					if u_data.char_tweak.silent_priority_shout and u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
					elseif not u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd, nil, "ai_vision mover")
					end
				elseif u_data.char_tweak.priority_shout then
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
				else
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd, nil, "ai_vision mover")
				end
			end
		end
	end

	if intimidate_civilians then
		local civilians = managers.enemy:all_civilians()

		for u_key, u_data in pairs(civilians) do
			if alive(u_data.unit) and u_data.unit:in_slot(21) and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
	end
	
	--Failsafe so you can still shout at bots on FFD2 to stop a softlock
	local can_intimidate_teammates = nil	
	local job = Global.level_data and Global.level_data.level_id
	if not managers.groupai:state():whisper_mode() or job == "framing_frame_2" then
		can_intimidate_teammates = true
	end

	if intimidate_teammates and can_intimidate_teammates then
		local criminals = managers.groupai:state():all_char_criminals()

		for u_key, u_data in pairs(criminals) do
			local added = nil

			if u_key ~= self._unit:key() then
				local rally_skill_data = self._ext_movement:rally_skill_data()

				if rally_skill_data and rally_skill_data.long_dis_revive and mvector3.distance_sq(self._pos, u_data.m_pos) < rally_skill_data.range_sq then
					local needs_revive = nil

					if u_data.unit:base().is_husk_player then
						needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
					else
						needs_revive = u_data.unit:character_damage():need_revive()
					end

					if needs_revive then
						added = true
						--Disable "interaction_through_walls" from the char_table check to stop inspire from working through walls.
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, false, true, 5000, my_head_pos, cam_fwd)
					end
				end
			end

			if not added and not u_data.is_deployable and not u_data.unit:movement():downed() and not u_data.unit:base().is_local_player and not u_data.unit:anim_data().long_dis_interact_disabled then
				self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, not secondary, 0.01, my_head_pos, cam_fwd)
			end
		end
	end

	if intimidate_enemies and intimidate_teammates then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if u_data.unit:movement():team() and u_data.unit:movement():team().id == "criminal1" and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
	end

	if intimidate_enemies then
		if managers.groupai:state():whisper_mode() then
			for _, unit in ipairs(SecurityCamera.cameras) do
				if alive(unit) and unit:enabled() and not unit:base():destroyed() then
					local dist = 2000
					local prio = 0.001

					self:_add_unit_to_char_table(char_table, unit, unit_type_camera, dist, false, false, prio, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end

		local turret_units = managers.groupai:state():turrets()

		if turret_units then
			for _, unit in pairs(turret_units) do
				if alive(unit) and unit:movement():team().foes[self._ext_movement:team().id] then
					self:_add_unit_to_char_table(char_table, unit, unit_type_turret, 2000, false, false, 0.01, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end
	end

	local prime_target = self:_get_interaction_target(char_table, my_head_pos, cam_fwd)

	return self:_get_intimidation_action(prime_target, char_table, intimidation_amount, primary_only, detect_only, secondary)
end

--Add civs to the valid target pool for marking during stealth
local _get_interaction_target_old = PlayerStandard._get_interaction_target
function PlayerStandard:_get_interaction_target(char_table, my_head_pos, cam_fwd, ...)
	local range = tweak_data.player.long_dis_interaction.highlight_range * managers.player:upgrade_value("player", "intimidate_range_mul", 1) * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1)

	for u_key, u_data in pairs(managers.enemy:all_civilians()) do
		if u_data.unit:movement():cool() then
			self:_add_unit_to_char_table(char_table, u_data.unit, 1, range, false, false, 0.001, my_head_pos, cam_fwd)
		end
	end

	return _get_interaction_target_old(self, char_table, my_head_pos, cam_fwd, ...)
end

--Make sure they're cool before being markable! 
local _get_intimidation_action_old = PlayerStandard._get_intimidation_action
function PlayerStandard:_get_intimidation_action(prime_target, ...)
	if prime_target and prime_target.unit_type == 1 and prime_target.unit:movement():cool() then
		return "mark_cop_quiet" or nil, false, prime_target
	end

	return _get_intimidation_action_old(self, prime_target, ...)
end

--Replace coroutine with a playermanager function. The coroutine had issues with randomly not being called- or not having values get reset, and overall being jank???
function PlayerStandard:_find_pickups(t)
	local pickups = World:find_units_quick("sphere", self._unit:movement():m_pos(), self._pickup_area, self._slotmask_pickups)
	local grenade_tweak = tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()]
	local may_find_grenade = not grenade_tweak.base_cooldown --and managers.player:has_category_upgrade("player", "regain_throwable_from_ammo")

	for _, pickup in ipairs(pickups) do
		if pickup:pickup() and pickup:pickup():pickup(self._unit) then
			if may_find_grenade then
				managers.player:regain_throwable_from_ammo() --Replace vanilla coroutine
			end

			for id, weapon in pairs(self._unit:inventory():available_selections()) do
				managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
			end
		end
	end
end

--Allowing underbarrels to update stance
function PlayerStandard:_check_action_deploy_underbarrel(t, input)
	local new_action = nil
	local action_forbidden = false

	if _G.IS_VR then
		if not input.btn_weapon_firemode_press and not self._toggle_underbarrel_wanted then
			return new_action
		end
	elseif not input.btn_deploy_bipod and not self._toggle_underbarrel_wanted then
		return new_action
	end
	
	--Removed the ADS check so you can swap to the underbarrel while doing that, also for Kick Starter top tier skill
	action_forbidden = self:_is_throwing_projectile() or self:_is_meleeing() or self:is_equipping() or self:_changing_weapon() or self:shooting() or self:_is_reloading() or self:is_switching_stances() or self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:running() and not self._equipped_unit:base():run_and_shoot_allowed()

	if self._running and not self._equipped_unit:base():run_and_shoot_allowed() and not self._end_running_expire_t then
		self:_interupt_action_running(t)

		self._toggle_underbarrel_wanted = true

		return
	end

	if not action_forbidden then
		self._toggle_underbarrel_wanted = false
		local weapon = self._equipped_unit:base()
		local wep_tweak = weapon and weapon.name_id and tweak_data.weapon[weapon.name_id]

		if weapon.record_fire_mode then
			weapon:record_fire_mode()
		end

		local underbarrel_state = weapon:underbarrel_toggle()

		if underbarrel_state ~= nil then
			local underbarrel_name_id = weapon:underbarrel_name_id()
			local underbarrel_tweak = tweak_data.weapon[underbarrel_name_id]
			new_action = true

			if weapon.reset_cached_gadget then
				weapon:reset_cached_gadget()
			end

			if weapon._update_stats_values then
				weapon:_update_stats_values(true)
			end

			local anim_ids = nil
			local switch_delay = 1

			if underbarrel_state then
				anim_ids = Idstring("underbarrel_enter_" .. (wep_tweak.use_underbarrel_anim or weapon.name_id))
				switch_delay = underbarrel_tweak.timers.equip_underbarrel

				self:set_animation_state("underbarrel")
			else
				anim_ids = Idstring("underbarrel_exit_" .. (wep_tweak.use_underbarrel_anim or weapon.name_id))
				switch_delay = underbarrel_tweak.timers.unequip_underbarrel

				self:set_animation_state("standard")
			end

			if anim_ids then
				self._ext_camera:play_redirect(anim_ids, 1)
			end

			self:set_animation_weapon_hold(nil)
			self:set_stance_switch_delay(switch_delay)
			
			--Updating stance
			self:_stance_entered()

			if alive(self._equipped_unit) then
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())				

				local base_ext = self._equipped_unit:base()
				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), base_ext:fire_mode(), base_ext:alt_fire_active())
			end

			managers.network:session():send_to_peers_synched("sync_underbarrel_switch", self._equipped_unit:base():selection_index(), underbarrel_name_id, underbarrel_state)
		end
	end


	return new_action
end

--Fixes weapons using shotgun-style reloads occasionally only loading one shell in
Hooks:PostHook(PlayerStandard, "_interupt_action_reload", "ResInterruptReloadFix", function(self, t)
	self._queue_reload_interupt = nil
end)

--Randomized inspect animations since rnd() doesn't work in anim xml
function PlayerStandard:_check_action_cash_inspect(t, input)
	if not input.btn_cash_inspect_press then
		return
	end

	local action_forbidden = self:_interacting() and not managers.player:has_category_upgrade("player", "no_interrupt_interaction") or self:is_deploying() or self:_changing_weapon() or self:_is_throwing_projectile() or self:_is_meleeing() or self:_on_zipline() or self:running() or self:_is_overheating() or self:_is_reloading() or self:in_steelsight() or self:is_equipping() or self:shooting() or self:_is_cash_inspecting(t) or self:_in_burst()

	if action_forbidden then
		return
	end
	
	local weap_base = self._equipped_unit and self._equipped_unit:base()
	local weap_id = weap_base and weap_base:get_name_id()
	local player_char = managers.criminals:local_character_name()
	if player_char and player_char == "jowi" and weap_id and weap_id == "malorian_3516" then
		self._js_t = 2.6
	end

	--Anim weight randomizing
	local anim_weight = 0
	if (math.random() < 0.5) then
		anim_weight = 1
	end
	
	local state = self._ext_camera:play_redirect(self:get_animation("cash_inspect"))

	--Applys the anim weight
	self._camera_unit:anim_state_machine():set_parameter(state, "alt_inspect", anim_weight)
	self._equipped_unit:base():tweak_data_anim_play("inspect")
	
	managers.player:send_message(Message.OnCashInspectWeapon)
end

function PlayerStandard:_start_action_unequip_weapon(t, data, alt_swap)
	local speed_multiplier = self:_get_swap_speed_multiplier(alt_swap)

	self._equipped_unit:base():tweak_data_anim_stop("equip")
	self._equipped_unit:base():tweak_data_anim_play("unequip", speed_multiplier)

	local tweak_data = self._equipped_unit:base():weapon_tweak_data()
	self._change_weapon_data = data
	self._unequip_weapon_expire_t = t + (tweak_data.timers.unequip or 0.5) / speed_multiplier

	--self:_interupt_action_running(t)
	self:_interupt_action_charging_weapon(t)
	self._spin_up_shoot = nil
	self._queue_burst = nil
	self._queue_fire = nil
	self._last_recoil_t = nil

	local result = self._ext_camera:play_redirect(self:get_animation("unequip"), speed_multiplier)

	self:_interupt_action_reload(t)
	self:_interupt_action_steelsight(t)
	self._ext_network:send("switch_weapon", speed_multiplier, 1)
end

function PlayerStandard:_update_equip_weapon_timers(t, input)
	if self._unequip_weapon_expire_t and self._unequip_weapon_expire_t <= t then
		if self._change_weapon_data.unequip_callback and not self._change_weapon_data.unequip_callback() then
			return
		end

		self._unequip_weapon_expire_t = nil

		if not self:_interacting() or (self:_interacting() and managers.player:has_category_upgrade("player", "no_interrupt_interaction")) then
			self:_start_action_equip_weapon(t)
		end
	end

	if self._equip_weapon_expire_t and self._equip_weapon_expire_t <= t then
		self._equipping_mask = nil
		self._equip_weapon_expire_t = nil

		if input.btn_steelsight_state then
			self._steelsight_wanted = true
		end

		if self._running and not self._end_running_expire_t then
			if not self._equipped_unit:base():run_and_shoot_allowed() then
				self._ext_camera:play_redirect(self:get_animation("start_running"))	
			else
				self._ext_camera:play_redirect(self:get_animation("idle"))	
			end	
		end

		TestAPIHelper.on_event("load_weapon")
		TestAPIHelper.on_event("mask_up")
	end
end

--Apply swap speed multiplier to more forms of equip/unequip animation.
function PlayerStandard:_start_action_equip(redirect, extra_time)
	local tweak_data = self._equipped_unit:base():weapon_tweak_data()
	local speed_multiplier = 1

	if redirect == self:get_animation("equip") then
		speed_multiplier = self:_get_swap_speed_multiplier()
		self._equipped_unit:base():tweak_data_anim_stop("unequip")
		self._equipped_unit:base():tweak_data_anim_play("equip", speed_multiplier)
	end

	self._equip_weapon_expire_t = (managers.player:player_timer():time() + (tweak_data.timers.equip or 0.7) / speed_multiplier + (extra_time or 0))
	self._ext_camera:play_redirect(redirect or self:get_animation("equip"), speed_multiplier)
end

function PlayerStandard:_play_equip_animation()
	local tweak_data = self._equipped_unit:base():weapon_tweak_data()
	local speed_multiplier = self:_get_swap_speed_multiplier()
	self._equip_weapon_expire_t = managers.player:player_timer():time() + (tweak_data.timers.equip or 0.7) / speed_multiplier
	local result = self._ext_camera:play_redirect(self:get_animation("equip"), speed_multiplier)
	self._equipped_unit:base():tweak_data_anim_stop("unequip")
	self._equipped_unit:base():tweak_data_anim_play("equip", speed_multiplier)
end

function PlayerStandard:_play_unequip_animation()
	local speed_multiplier = self:_get_swap_speed_multiplier()
	self._ext_camera:play_redirect(self:get_animation("unequip"), speed_multiplier)
	self._equipped_unit:base():tweak_data_anim_stop("equip")
	self._equipped_unit:base():tweak_data_anim_play("unequip", speed_multiplier)
end

function PlayerStandard:_interupt_action_throw_projectile(t)
	if not self:_is_throwing_projectile() then
		return
	end

	self._state_data.projectile_idle_wanted = nil
	self._state_data.projectile_expire_t = nil
	self._state_data.projectile_throw_allowed_t = nil
	self._state_data.throwing_projectile = nil
	self._camera_unit_anim_data.throwing = nil

	self._camera_unit:base():unspawn_grenade()
	self._camera_unit:base():show_weapon()
	self:_play_equip_animation()
	self:_stance_entered()
end

function PlayerStandard:_check_step(t)
	if (self._state_data.in_air or self._is_sliding) and not self._is_wallrunning then
		return
	end

	self._last_step_pos = self._last_step_pos or Vector3()
	local step_length = self._state_data.on_ladder and 50 or self._is_wallrunning and 250 or ((not self._is_wallrunning and (self._state_data.ducking or self._state_data.in_steelsight)) and 125) or self._running and 175 or 150

	if mvector3.distance_sq(self._last_step_pos, self._pos) > step_length * step_length then
		mvector3.set(self._last_step_pos, self._pos)
		self._unit:base():anim_data_clbk_footstep()
	end
end


if AdvMov then --Everything here was originally from Solo Queue Pixy and none of this will function without the "Advanced Movement Standalone" mod
--Sorry for butchering your code :> -DMC

	local AdvMovWallKick = PlayerStandard._check_wallkick
	--Kills wallkick checks
	function PlayerStandard:_check_wallkick(t, dt)
		if restoration.Options:GetValue("AdVMovResOpt/DisableAdvMovTF") or not self._unit:movement():is_above_stamina_threshold() then
		else
			AdvMovWallKick(self, t, dt)
		end
	end

	-- lets me quickly adjust how far the detection rays should go
	local wallslide_values = {60} -- minimum of 50-51?
	wallslide_values[2] = wallslide_values[1] * 0.707 -- sin 45
	wallslide_values[3] = wallslide_values[1] * 0.924 -- cos 22.5/sin 67.5
	wallslide_values[4] = wallslide_values[1] * 0.383 -- sin 22.5/cos 67.5

	function PlayerStandard:_get_nearest_wall_ray_dir(ray_length_mult, raytarget, only_frontal_rays, z_offset)
		local length_mult = ray_length_mult or 1
		local playerpos = managers.player:player_unit():position()
		if z_offset then
			mvector3.add(playerpos, Vector3(0, 0, z_offset))
		end
		-- only get one axis of rotation so facing up doesn't end the wallrun via not detecting a wall to run on
		local rotation = self._ext_camera:rotation()
		mvector3.set_x(rotation, 0)
		mvector3.set_y(rotation, 0)
		local shortest_ray_dist = 10000
		local shortest_ray_dir = nil
		local shortest_ray = nil
		local first_ray_dist = 10000
		local first_ray_dir = nil
		local first_ray = nil

		-- alternate table to check more than cardinal and intercardinal directions
		local ray_adjust_table = nil
		if not self._nearest_wall_ray_dir_state then
			self._nearest_wall_ray_dir_state = true
			ray_adjust_table = {
				{-1 * wallslide_values[2], wallslide_values[2]}, -- 315, forward-left
				{0, wallslide_values[1]}, -- 360/0, forward
				{wallslide_values[2], wallslide_values[2]}, -- 45, forward-right
				{wallslide_values[1], 0}, -- 90, right
				{wallslide_values[2], -1 * wallslide_values[2]}, -- 135, back-right
				{0, -1 * wallslide_values[1]}, -- 180, back
				{-1 * wallslide_values[2], -1 * wallslide_values[2]}, -- 225, back-left
				{-1 * wallslide_values[1], 0} -- 270, left
			}
			if only_frontal_rays then
				ray_adjust_table[4] = nil
				ray_adjust_table[5] = nil
				ray_adjust_table[6] = nil
				ray_adjust_table[7] = nil
				ray_adjust_table[8] = nil
			end
		else
			self._nearest_wall_ray_dir_state = nil
			ray_adjust_table = {
				{-1 * wallslide_values[4], wallslide_values[3]}, -- 292.5
				{-1 * wallslide_values[3], wallslide_values[4]}, -- 337.5
				{wallslide_values[3], wallslide_values[4]}, -- 22.5
				{wallslide_values[4], wallslide_values[3]}, -- 67.5
				{wallslide_values[4], -1 * wallslide_values[3]}, -- 112.5
				{wallslide_values[3], -1 * wallslide_values[4]}, -- 157.5
				{-1 * wallslide_values[3], -1 * wallslide_values[4]}, -- 202.5
				{-1 * wallslide_values[4], -1 * wallslide_values[3]} -- 247.5
			}
			if only_frontal_rays then
				--ray_adjust_table[4] = nil
				ray_adjust_table[5] = nil
				ray_adjust_table[6] = nil
				ray_adjust_table[7] = nil
				ray_adjust_table[8] = nil
			end
		end

		for i = 1, #ray_adjust_table do
			local ray = Vector3()
			mvector3.set(ray, playerpos)
			local ray_adjust = Vector3(ray_adjust_table[i][1] * length_mult, ray_adjust_table[i][2] * length_mult, 0)
			mvector3.rotate_with(ray_adjust, rotation)
			mvector3.add(ray, ray_adjust)
			local ray_check = Utils:GetCrosshairRay(playerpos, ray)
			if ray_check and (shortest_ray_dist > ray_check.distance) then
				-- husks use different data reee
				local is_enemy = managers.enemy:is_enemy(ray_check.unit) and ray_check.unit:brain():is_hostile() -- exclude sentries
				local is_enemy_ch_dmg = ray_check.unit and (
					(ray_check.unit.character_damage and ray_check.unit:character_damage()) or 
					(ray_check.unit:parent() and ray_check.unit:parent().character_damage and ray_check.unit:parent():character_damage() ) 
				) 
				local is_shield = ray_check.unit:in_slot(8) and alive(ray_check.unit:parent())
				local enemy_not_surrendered = is_enemy and ray_check.unit:brain() and not (ray_check.unit:brain()._surrendered or ray_check.unit:brain():surrendered())
				local enemy_not_joker = is_enemy and ray_check.unit:brain() and not (ray_check.unit:brain()._converted or (ray_check.unit:brain()._logic_data and ray_check.unit:brain()._logic_data.is_converted))
				local enemy_not_trading = is_enemy and ray_check.unit:brain() and not (ray_check.unit:brain()._logic_data and ray_check.unit:brain()._logic_data.name == "trade") -- i don't know how to check for trading on husk

				if raytarget ~= "enemy" and not ray_check.unit:in_slot( managers.slot:get_mask("world_geometry") ) then
					return nil
				end

				if raytarget == "enemy" and ((is_enemy and enemy_not_surrendered and enemy_not_joker and enemy_not_trading) or is_shield) then
					shortest_ray_dist = ray_check.distance
					shortest_ray_dir = ray_adjust
					shortest_ray = ray_check
				elseif raytarget == "breakable" and ray_check.unit:damage() and not ray_check.unit:character_damage() then
					shortest_ray_dist = ray_check.distance
					shortest_ray_dir = ray_adjust
					shortest_ray = ray_check
				elseif not raytarget then
					shortest_ray_dist = ray_check.distance
					shortest_ray_dir = ray_adjust
					shortest_ray = ray_check
				end
			end
		end

		if shortest_ray_dist == 10000 then
			return nil
		else
			return {dir = shortest_ray_dir, raydata = shortest_ray}
		end
	end

 	-- DON'T FORGET TO CHANGE THE INFMENU TO ADVMOV WHEN COPYING CHANGES OVER DOOFUS
	function PlayerStandard:_do_movement_melee_damage(forward_only, strongkick, sprintkick)
		local AdvMovMelee = restoration.Options:GetValue("AdVMovResOpt/AdvMovMelee") or 1
		if not self._unit:movement():is_above_stamina_threshold() or (AdvMovMelee == 2 and managers.groupai:state():whisper_mode()) or AdvMovMelee == 3 and not self._is_dashing then
			return nil
		end
		local enemy_ray1 = self:_get_nearest_wall_ray_dir(2, "enemy", forward_only, nil)
		local enemy_ray2 = self:_get_nearest_wall_ray_dir(2, "enemy", forward_only, 70)
		local enemy_ray = enemy_ray1 or enemy_ray2

		local breakable_ray1 = nil
		local breakable_ray2 = nil
		if not enemy_ray then
			breakable_ray1 = self:_get_nearest_wall_ray_dir(1, "breakable", forward_only)
			breakable_ray2 = self:_get_nearest_wall_ray_dir(1, "breakable", forward_only, 70)
		end
		local breakable_ray = breakable_ray1 or breakable_ray2

		if enemy_ray or breakable_ray then
			local target_ray_data = enemy_ray or breakable_ray
			local targetunit = target_ray_data.raydata.unit

			-- kick away if hitting an enemy/shield
			local finaltarget = targetunit

			self._wallkick_hold_start_t = nil

			local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock") or not target_ray_data.raydata.unit:in_slot(8) -- can hit shields in the back
			local dmg_data = {
				damage = (6.0 * ((self._is_sliding and 2) or 1) * (((sprintkick and not self._is_jumping) and 0.5) or 1)),
				damage_effect = (12.0 * ((self._is_sliding and 2) or 1) * (((sprintkick and not self._is_jumping) and 0) or 1)),
				attacker_unit = self._unit,
				col_ray = target_ray_data.raydata,
				charge_lerp_value = 0,
				shield_knock = (self._is_sliding or strongkick) and can_shield_knock,
				name_id = managers.localization:text("bm_melee_advmov"),
				variant = "melee"
			}
			if targetunit:in_slot(8) and alive(targetunit:parent()) and not targetunit:parent():character_damage():is_immune_to_shield_knockback() then
				-- shield behaviors
				dmg_data.damage = 0
				finaltarget = targetunit:parent()
			end
			local kill = nil
			local final_dmg = nil
			if finaltarget and finaltarget:character_damage() and finaltarget:character_damage().damage_melee and dmg_data then -- blanket "what the fuck is crashing" prevention since i don't know how to reproduce it consistently
				local atk_dir_z_offset = -100
				local is_bulldozer = finaltarget:base():has_tag("tank")
				if strongkick and not is_bulldozer then
					dmg_data.damage = dmg_data.damage * 2
					dmg_data.damage_effect = dmg_data.damage_effect * 2
					atk_dir_z_offset = atk_dir_z_offset * 2
				end
				final_dmg = dmg_data.damage
				-- hit enemy
				-- apply damage
				finaltarget:character_damage():damage_melee(dmg_data)
				self:_perform_sync_melee_damage(finaltarget, target_ray_data.raydata, dmg_data.damage)
				-- push corpse around
				-- don't push live targets, they'll ragdoll
				if finaltarget:character_damage()._health <= 0 then
					local hit_pos = mvector3.copy(finaltarget:movement():m_pos())
					local attack_dir = hit_pos - self._unit:movement():m_head_pos() - Vector3(0, 0, atk_dir_z_offset)
					local distance = mvector3.normalize(attack_dir)
					-- attack dir also controls how ridiculous the ragdoll push is
					-- Vector3(0, 0, 1) bounces directly upwards
					local magnitude = 1
					if strongkick then
						magnitude = magnitude * 1.25
					end
					if AdvMov.settings.kickyeet then
						magnitude = magnitude * AdvMov.settings.kickyeet
					end
					mvector3.multiply(attack_dir, magnitude)
					if not managers.groupai:state():whisper_mode() then
						managers.game_play_central:do_shotgun_push(finaltarget, target_ray_data.raydata.hit_position, attack_dir, distance)
					end
					kill = true
				end
				if self._last_movekick_shake_t and self._last_movekick_shake_t + 0.2 < self._last_t then
					self._ext_camera:play_shaker("player_start_running", 1)
				end
			elseif finaltarget and not finaltarget:character_damage() and finaltarget:damage() and dmg_data then
				-- hit object
				-- core\lib\units\coreunitdamage.lua
				-- observe as exactly one argument is used
				if not managers.groupai:state():whisper_mode() then
					finaltarget:damage():add_damage(nil, nil, nil, nil, nil, nil, dmg_data.damage, nil, nil)
					self:_perform_sync_melee_damage(finaltarget, target_ray_data.raydata, dmg_data.damage)
				end
			else
				log("AAAAAAAAAAAAA WHY IS DUMB KICK NO WORK")
			end
			if enemy_ray then
				local speed = self:_get_modified_move_speed("run")
				local kick_dir = target_ray_data.dir
				kick_dir = self:_reverse_vector(kick_dir)
				mvector3.normalize(kick_dir)
				mvector3.multiply(kick_dir, speed * 0.50)
				local jump_amount = tweak_data.player.movement_state.standard.movement.jump_velocity.z
				mvector3.add(kick_dir, Vector3(0, 0, jump_amount * 0.25))
				if self._unit:mover() and (not self._is_sliding or not kill) then
					self._unit:mover():set_velocity(kick_dir)
				end
				local hit_sfx = "hit_body"
				if finaltarget:character_damage() and finaltarget:character_damage().melee_hit_sfx then
					hit_sfx = finaltarget:character_damage():melee_hit_sfx()
				end
				if self._using_superblt and final_dmg then
					if final_dmg > 23.9 then
						self._inf_sound:post_event("kick_heavy")
					elseif final_dmg > 11.9 then
						self._inf_sound:post_event("kick_light")
					elseif final_dmg > 5.9 then
						self:_play_melee_sound("weapon", hit_sfx, 0)
					else
						self:_play_melee_sound("fists", hit_sfx, 0)
					end
				else
					self:_play_melee_sound("fists", hit_sfx, 0)
					--self:_play_melee_sound("fists", "hit_gen", 0)
				end

				self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN * 0.5)
				self._unit:movement():_restart_stamina_regen_timer()
			end

			if enemy_ray and self._running then
				self:_end_action_running(self._last_t)
			end

			if enemy_ray and not kill then 
				self:_cancel_slide()
				self._is_wallkicking = nil
			end

			return true, kill
		end
		return nil
	end

	function PlayerStandard:_check_slide()
		if not self._state_data.in_air or self._is_jumping then
			self._is_wallkicking = nil
		end
		if not ((managers.groupai:state():whisper_mode() and AdvMov.settings.slidestealth == 1) or (not managers.groupai:state():whisper_mode() and AdvMov.settings.slideloud == 1)) then
			if self._last_velocity_xy and (self._running or (self._last_dash_time and (self._last_dash_time + 0.25 > self._last_t)) or ( self._last_run_t and self._state_data.in_air and self._last_run_t + 0.5 > self._last_t ) or self._is_wallkicking) and not self._wallkick_is_clinging and (self._last_t - (self._start_running_t or 0)) > 0.2 then
				-- must be moving at least a certain speed to slide
				local movedir = self._move_dir or self._last_velocity_xy -- don't use self:get_sampled_xy() in any of the other lines in here
				local velocity = Vector3()
				mvector3.set(velocity, self._last_velocity_xy)
				local horizontal_speed = mvector3.normalize(velocity)
				local walkspeed = self:_get_modified_move_speed()
				local slide_cooldown = 0.8
				--[[
				if self._slide_dir then
					-- reduce cooldown if not attempting slide in the same direction i.e. do the speedyboi
					local slide_angle = math.atan2(self._slide_dir.y, self._slide_dir.x)
					local move_angle = math.atan2(movedir.y, movedir.x)
					local angle_diff = math.abs(move_angle - slide_angle)
					if angle_diff > 45 then
						slide_cooldown = slide_cooldown / (angle_diff/45)
					end
				end
				--]]
				if not self._is_wallrunning and (self._is_wallkicking or (horizontal_speed > (walkspeed * 1.1) )) and ((self._last_t - self._last_slide_time) > slide_cooldown) then
					self._dash_slide = (self._last_dash_time and (self._last_dash_time + 0.25 > self._last_t))
					self._is_sliding = true
					self._slide_dir = mvector3.copy(movedir)
					self._slide_slow_add = 0
					self._slide_desired_dir = mvector3.copy(movedir)
					self._sprinting_speed = self:_get_modified_move_speed("run")
					-- make it feel like a speedy slide
					self._slide_speed = math.clamp(self._sprinting_speed * 1.5, 1000, 1500) --self._tweak_data.movement.speed.RUNNING_MAX * 1.3
					self._slide_refresh_t = 0
					self._slide_last_z = self._unit:position().z
					self._slide_last_speed = self._slide_speed
					self._slide_end_speed = self:_get_modified_move_speed("crouch")/4 -- don't need to calculate every frame
					self._slide_speed_factor = self._slide_speed/(self._tweak_data.movement.speed.RUNNING_MAX * 1.3) -- it's magic
					self:_stance_entered()

					self._last_slide_time = self._last_t
					if not self._state_data.in_air then
						self._is_wallkicking = nil
						self._last_run_t = nil
					end

					local ch_dmg = self._unit:character_damage()
					local dash_stats = tweak_data.upgrades.values.player.dash_stats
					local dash_base_t = dash_stats.grace_t
					if ch_dmg and self._last_t + dash_base_t > ((self._last_dash_iframes or 0) + dash_base_t) then
						local effect_alpha = (restoration.Options:GetValue("AdVMovResOpt/AdvMovSlideScreenEffectAlpha") or 0.5)
						managers.hud:activate_effect_screen(dash_base_t, Vector3(0.625, 0.625, 1.0) * effect_alpha, true)
						ch_dmg._last_received_dmg = math.huge
						ch_dmg._next_allowed_dmg_t = Application:digest_value(self._last_t + dash_base_t, true)
					end
				end
			end
		end
	end

	function PlayerStandard:_do_dash(input)
		if not (managers.player:current_state() == "mask_off" or managers.player:current_state() == "civilian") then
			self:_cancel_slide()
			-- check if carrying a bag
			local my_carry_data = managers.player:get_my_carry_data()
			local dash_stats = tweak_data.upgrades.values.player.dash_stats
			local dash_mult = dash_stats.speed * ((self._running and 1.15) or 1)
			local dash_height_mult = -4
			if my_carry_data then
				-- and use its movespeed to scale down dash distance
				local carried_type = tweak_data.carry[my_carry_data.carry_id].type
				if tweak_data.carry.types[carried_type] then
					dash_mult = dash_mult * tweak_data.carry.types[carried_type].move_speed_modifier
					--dash_height_mult = tweak_data.carry.types[carried_type].jump_modifier
				end
			end
			if self._unit:mover() then
				local rotation_flat = self._ext_camera:rotation()
				local forward_backstep = restoration.Options:GetValue("AdVMovResOpt/AdvMovBackstep")
				local do_backstep = nil
				if input.y > 0 then
					do_backstep = true
					if input.x ~= 0 then
						input = Vector3(input.x > 0 and 1 or -1, 0, 0)
					else
						if forward_backstep then
							input = Vector3(0, -1, 0)
						else
							return false
						end
					end
				end
				local dash_limit = dash_stats.limit + managers.player:get_value_from_risk_upgrade( managers.player:upgrade_value("player", "detection_risk_dash_count") )
				local last_dash_t = self._last_t - (self._last_dash_time or 0)
				if last_dash_t <= dash_stats.cooldown then
					self._dash_count = math.min( dash_limit + 1, (self._dash_count or 1) + 1)
				else
					self._dash_count = 1
				end

				local ch_dmg = self._unit:character_damage()
				local full_dodge = nil
				local dash_fatigue = ((self._dash_count > dash_limit) and true) or false
				local last_dash = ((self._dash_count == dash_limit) and true) or false
				local dash_base_t = dash_stats.grace_t
				if ch_dmg then
					local dodge_meter = ch_dmg._dodge_meter
					if not dash_fatigue and dodge_meter and dodge_meter >= (1 - ch_dmg._dodge_points) then
						full_dodge = true
					end
					local dodge_t = math.max(0, ch_dmg._dodge_points * ((full_dodge and dash_stats.add_mult_dodge) or dash_stats.add_mult or 1))
					local dash_t_cap = (full_dodge and dash_stats.grace_cap_dodge) or dash_stats.grace_cap
					local iframes = (math.min( dash_t_cap, (dash_base_t + dodge_t)) * ((dash_fatigue and dash_stats.fatigue_mult) or 1))
					local effect_alpha = (restoration.Options:GetValue("AdVMovResOpt/AdvMovDashScreenEffectAlpha") or 0.8) * ((dash_fatigue and 0.5) or 1)
					managers.hud:activate_effect_screen(iframes, ((last_dash and Vector3(1.0, 1.0, 0.625)) or (dash_fatigue and Vector3(1.0, 0.625, 0.625)) or Vector3(0.625, 0.625, 1.0)) * effect_alpha, true)
					ch_dmg._last_received_dmg = math.huge
					ch_dmg._next_allowed_dmg_t = Application:digest_value(self._last_t + iframes, true)
					if dash_fatigue then
						ch_dmg:fill_dodge_meter( -0.2 )
					end
					self._last_dash_iframes = self._last_t + iframes
				end

				input = input:normalized()
				mvector3.set_x(rotation_flat, 0)
				mvector3.set_y(rotation_flat, 0)
				mvector3.rotate_with(input, rotation_flat)
				mvector3.multiply(input, ((500 * ((do_backstep and 1.1) or 1) ) * dash_mult * (dash_fatigue and dash_stats.fatigue_mult or 1) ))
				mvector3.add(input, Vector3(0, 0, (200 * ((do_backstep and 1.2) or 1) ) * dash_height_mult ))

				self._last_velocity_xy = input
				self._unit:mover():set_velocity(input)
				self._last_dash_time = self._last_t
				self._ext_camera:play_shaker("player_land", 0.25)
				self._unit:sound():_play("footstep_land")
				self._unit:sound():_play("footstep_land")
				self._unit:sound():_play("footstep_land")
				if not dash_fatigue then
					self._unit:sound():_play("m4_melee_attack")
				end
				self._is_dashing = true
				self._unit:movement():_restart_stamina_regen_timer()
				return true
			end
		end
		return false
	end

	function PlayerStandard:_cancel_slide(timemult)
		self._is_sliding = nil
		self._slide_speed = nil
		self._dash_slide = nil
		self._slide_has_played_shaker = nil
		self:_stance_entered(nil, timemult)
	end

	function PlayerStandard:_cancel_wallrun(t, kick_off_mode, timemult)
		local exit_wallrun_vel = Vector3()
		if self._unit:mover() and self._end_wallrun_kick_dir and kick_off_mode == "fall" then
			mvector3.add(exit_wallrun_vel, self._end_wallrun_kick_dir)
			self._unit:mover():set_velocity(exit_wallrun_vel)
		end

		if self._unit:mover() then
			self._unit:mover():set_gravity(Vector3(0, 0, -982))
		end

		if kick_off_mode == "jump" then
			self:_do_wallkick()
		end

		if self._state_data.in_air then
			self._state_data.enter_air_pos_z = self._pos.z
		end
		self._is_wallrunning = nil
		self._last_wallrun_t = t
		self._last_wallkick_t = t
		self:_stance_entered(nil, timemult)
	end

	Hooks:RemovePostHook( "slide_update" )
	Hooks:RemovePostHook( "check_wallrun_update" )
	Hooks:RemovePostHook( "dash_update" )
	local _update_movement_old = PlayerStandard._update_movement
	function PlayerStandard:_update_movement(t, dt)
		_update_movement_old(self, t, dt)

	--[ [
		if not self._last_movekick_shake_t then
			self._last_movekick_shake_t = 0
		end

		if self._wallkick_is_clinging and self._wallkick_hold_start_t and ((t - self._wallkick_hold_start_t) < 4) then
			if self._state_data.in_air then
				self._state_data.enter_air_pos_z = self._pos.z
			end
		end

		--SLIDING STUFF
			self:_check_wallkick(t, dt)

			if self._is_sliding then
				if not self._state_data.in_air then
					-- calculate stamina drain scaling based on current speed vs standard running speed
					local drain_mult = self._slide_speed/self._sprinting_speed
					-- drain stamina, prevent regen
					self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.STAMINA_DRAIN_RATE * dt * drain_mult)
					--if drain_mult > 0.50 then
						self._unit:movement():_restart_stamina_regen_timer()
					--end
				end

				-- slow slide down as it continues
				self._slide_speed = math.clamp(self._slide_speed - ((400 + self._slide_slow_add) * dt * self._slide_speed_factor^2), 0, 1500)

				local last_refresh_dt = t - self._slide_refresh_t
				if self._slide_refresh_t and last_refresh_dt > 0.1 then

					if not self._state_data.in_air and (t - self._last_jump_t) > 0.20 then
						-- play slide-start stuff
						if not self._slide_has_played_shaker then
							if managers.user:get_setting("use_headbob") then
								self._ext_camera:play_shaker("player_start_running", 1)
							end
							self._slide_has_played_shaker = true
							if self._using_superblt then
								local choice = math.random(1, 2)
								self._inf_sound:post_event("slide_enter" .. choice)
							end
						end
						-- slide loops n shit
						if (t - self._last_snd_slide_t) > 0.20 then
							self._last_snd_slide_t = t
							self._last_snd_slide = self._last_snd_slide or 0
							self._last_snd_slide = (self._last_snd_slide % 6) + 1
							local pitch = ""
							if self._last_speed > (self._slide_end_speed * 5) then
								pitch = ""
							elseif self._last_speed > (self._slide_end_speed * 3) then
								pitch = "slow"
							elseif self._last_speed > (self._slide_end_speed * 2) then
								pitch = "slower"
							else
								pitch = "slowest"
							end
							if self._using_superblt then
								self._inf_sound:post_event("slide_loop" .. self._last_snd_slide .. pitch)
							end
						end
					end

					-- change speed depending on change in z position
					local current_z = self._unit:position().z
					local downspeed = self._slide_last_z - current_z
					-- prevent massive bullshit accelerations from wallkick elevation converting to speed
					if ((t - self._last_wallkick_t) > 0.3) then
						self._slide_speed = self._slide_speed + (downspeed * 10 * last_refresh_dt * self._slide_speed_factor^2)
					end
					self._slide_refresh_t = t
					self._slide_last_z = current_z

					-- apply change of direction
					if self._move_dir then
						mvector3.add(self._slide_dir, self._slide_desired_dir)
						mvector3.normalize(self._slide_dir) -- normalize or the gun goes shakey shakey
					end
				end
				-- kick fools
				if ((t - self._last_movekick_enemy_t) > 0.5) then
					local has_kicked, kill = self:_do_movement_melee_damage(nil, self._is_wallkicking) -- do it really hard if you're still in midair
					if has_kicked then
						self._last_movekick_shake_t = t
						if not kill or not self._is_sliding then
							self._last_movekick_enemy_t = t
						end
					end
				end
				-- end slide if too slow
				-- grace period for wallkicking to prevent slide from failing because it's detecting a low pre-kick-acceleration speed
				if self._last_speed < (self._slide_end_speed) and ((t - self._last_wallkick_t) > 0.3) then
					self:_cancel_slide(3)
				end
			elseif self._is_wallkicking then
				-- coming in from that wallkick
				if not self._state_data.in_air then
					self._is_wallkicking = nil
				end
				if ((t - self._last_movekick_enemy_t) > 0.5) then
					local has_kicked, kill = self:_do_movement_melee_damage(nil, self._is_wallkicking) -- megakick if wallkicking
					if has_kicked then
						self._last_movekick_shake_t = t
						if not kill or not self._is_sliding then
							self._last_movekick_enemy_t = t
						end
					end
				end
				-- transition to slide bby
				if self._state_data.ducking and not self._is_dashing then
					self:_check_slide()
				end
			elseif self._running and (AdvMov.settings.runkick == true or self._state_data.in_air) then
				-- sprinting
				if ((t - self._last_movekick_enemy_t) > 0.5) then
					local has_kicked, kill = self:_do_movement_melee_damage(true, nil, true)
					if has_kicked then
						self._last_movekick_shake_t = t
						if not kill or not self._is_sliding then
							self._last_movekick_enemy_t = t
						end
					end
				end
			end

		--WALLRUN STUFF 
			local tapping_sprint = self._controller:get_input_pressed("run")
			-- relaxed wallrun conditions to enable jump maps
			-- allow wallrunning while bouncing from wall to wall without explicitly enabling 
			local wallkick_off_cooldown = (self._is_wallkicking and ((t - self._last_wallkick_t) > 0.2))
			local dmgkick_off_cooldown = ((t - self._last_movekick_enemy_t) > 1)
			local holding_jump = self._controller:get_input_bool("jump")
			local no_wallrun = restoration.Options:GetValue("AdVMovResOpt/DisableAdvMovTF")
			if not no_wallrun and not holding_jump and self._state_data.in_air and (tapping_sprint or wallkick_off_cooldown) and dmgkick_off_cooldown and mvector3.normalize(self:_get_sampled_xy()) > 0 then
				-- reduce cooldown if hitting a different wall
				local lenghtmult = 1
				if wallkick_off_cooldown then
					lengthmult = 1.5
				end
				local nearest_ray1 = self:_get_nearest_wall_ray_dir(lenghtmult, nil, nil, 0)
				local nearest_ray2 = self:_get_nearest_wall_ray_dir(lenghtmult, nil, nil, 40)
				local nearest_ray = nearest_ray1 or nearest_ray2
				if nearest_ray and self._last_wallrun_dir then
					local last_angle = math.atan2(self._last_wallrun_dir.y, self._last_wallrun_dir.x)
					local current_angle = math.atan2(nearest_ray.dir.y, nearest_ray.dir.x)
					local angle_diff = 180 - math.abs(((last_angle - current_angle) % 360) - 180)
					if angle_diff < 45 then
						self._new_wallrun_delay = 1.0
						if self._last_zdiff and self._last_zdiff < -0.25 then
							-- prevent wallrun from catching on the wall you just tried to jump up
							-- positive zdiff = downwards
							self._new_wallrun_delay = self._new_wallrun_delay * 3
						end
					else
						self._new_wallrun_delay = 0
					end
				end
				local wallrun_on_cooldown = (t - self._last_wallrun_t) < (self._new_wallrun_delay or 0)
				if self:_can_stand() and not self._is_wallrunning and not wallrun_on_cooldown and self._unit:movement():is_above_stamina_threshold() and not self:on_ladder() and nearest_ray then
					self._sprinting_speed = self:_get_modified_move_speed("run")
					self._wallrun_speed = self._sprinting_speed * 1.5
					self._wallrun_last_speed = self._wallrun_speed
					self._wallrun_end_speed = self:_get_modified_move_speed("crouch")
					self._wallrun_speed_factor = self._wallrun_speed/(self._tweak_data.movement.speed.RUNNING_MAX * 1.3)
					self._is_wallrunning = true
					self:_stance_entered()
					if self._unit:mover() then
						--log("starting wallrun")
						local sampled_xy = mvector3.copy(self:_get_sampled_xy())
						mvector3.normalize(sampled_xy)
						mvector3.multiply(sampled_xy, self._wallrun_last_speed)
						self._unit:mover():set_gravity(Vector3(0, 0, 0))
						self._unit:mover():set_velocity(sampled_xy)
					end
					self._last_wallrun_dir = nearest_ray.dir
				end
			end

			if self._is_wallrunning then
				self._is_wallkicking = nil
				if self._is_sliding then
					self:_cancel_slide() --cancel the slide before cancelling the crouch to avoid the speed penalty of ending a slide early
				end
				if self._state_data.ducking then
					self:_end_action_ducking(t)
				end

				-- drain stamina, prevent regen
				self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.STAMINA_DRAIN_RATE * dt * (self._wallrun_last_speed/self._sprinting_speed))
					self._unit:movement():_restart_stamina_regen_timer()

				-- keep pushing player along the wall
				if self._unit:mover() then
					local sampled_xy = mvector3.copy(self:_get_sampled_xy())
					mvector3.normalize(sampled_xy)
					mvector3.multiply(sampled_xy, self._wallrun_last_speed)
					self._unit:mover():set_velocity(sampled_xy)
				end

				-- slow wallrun down as it continues
				self._wallrun_last_speed = math.clamp(self._wallrun_last_speed - ((300 + (0 or 0)) * dt * self._wallrun_speed_factor^2), 0, 1500)
				if self._wallrun_last_speed < self._wallrun_end_speed then
					self:_cancel_wallrun(t, "fall", 3)
					--log("ending wallrun: too slow")
				end

				if (t - self._last_wallrun_t > 0.1) then
					self._last_wallrun_t = t
					if self:on_ladder() or not self:_get_nearest_wall_ray_dir(1.5) then
						self._end_wallrun_kick_dir = self:_get_end_wallrun_kick_dir()
						self:_cancel_wallrun(t, fall)
						--log("ending wallrun: failed to detect wall")
					end
				end
			end

		--DASHING STUFF
			if AdvMov.settings.dashcontrols and AdvMov.settings.dashcontrols > 1 then
				local input = self._controller:get_input_axis("move")
				local zero_input = (input.x == 0) and (input.y == 0)
				local input_matches_dash_dir = self._dash_dir and (input.x == self._dash_dir.x) and (input.y == self._dash_dir.y)
				local dash_stats = tweak_data.upgrades.values.player.dash_stats
				local dash_off_cooldown = (t - (self._last_dash_time or 0)) > dash_stats.rate
				local dash_conditions = dash_off_cooldown and not self:on_ladder()

				if not self._state_data.in_air then
					local input_not_matching_or_zero = not zero_input and not input_matches_dash_dir
					local within_doubletap_window = ((t - (self._dash_primed_t or 0)) <= 0.15) and ((t - (self._dash_initial_tap_t or 0)) <= 0.30)
					local dash_primed_timeout = not within_doubletap_window
					local doubletap_conditions = (zero_input and within_doubletap_window) and (AdvMov.settings.dashcontrols == 3 or AdvMov.settings.dashcontrols == 4)
					local keybind_conditions = (HoldTheKey and HoldTheKey:Keybind_Held("advmov_dash") and not zero_input) and (AdvMov.settings.dashcontrols == 2 or AdvMov.settings.dashcontrols == 4)

					if input_matches_dash_dir and self._dash_stage == 2 then
						-- player has tapped for the second time
						self._dash_stage = 3
						self._dash_primed_t = t
					elseif dash_off_cooldown and ((self._dash_stage == 3 and doubletap_conditions) or keybind_conditions) then
						-- player has released for the second time (and not held down the input)
						local dir = doubletap_conditions and self._dash_dir or input
						local dashed = self:_do_dash(dir)
						if dashed then
							self._dash_dir = nil
							self._dash_stage = 0
						end
					elseif input_not_matching_or_zero then
						-- initial tap/input different from previous
						self._dash_dir = input
						self._dash_stage = 1
						self._dash_initial_tap_t = t
					elseif dash_primed_timeout and self._dash_stage and (self._dash_stage > 2) then
						-- reset, previous readied dash timed out
						self._dash_dir = nil
						self._dash_stage = 0
					elseif zero_input and self._dash_stage == 1 then
						-- player has released input for the first time
						self._dash_stage = 2
					end
				end

				if self._is_dashing and (t > (self._last_dash_time or 0) + 0.25) then
					self._is_dashing = nil
					managers.player:apply_slow_debuff(1, 0.5, nil, true)
					self:_shooting_move_speed_timer(self._last_t, self._last_dt, true)
				end
			end

	--]]
	end

	function PlayerStandard:_do_wallkick()
		-- ending wallhang by wallkicking
		-- kick off of wall in the direction you're facing
		local fast_kickoff = false
		local final_vel = Vector3(0, 0, 0)
		--local nearest_wall_ray = self:_get_nearest_wall_ray_dir(2) -- extra long or the player can end up floating instead of wallkicking because the nearest wall isn't detected
		local nearest_ray1 = self:_get_nearest_wall_ray_dir(2, nil, nil, 0)
		local nearest_ray2 = self:_get_nearest_wall_ray_dir(2, nil, nil, 40)
		local nearest_wall_ray = nearest_ray1 or nearest_ray2
		local speed = self:_get_modified_move_speed("run")
		local kick_dir = Vector3(0, math.min(speed * 1.5, 950), 0)
		local rotation = managers.player:equipped_weapon_unit():rotation()
		local rotation_flat = self._ext_camera:rotation()
		mvector3.set_x(rotation_flat, 0)
		mvector3.set_y(rotation_flat, 0)

		-- i have no idea how to read from rotations so you get this instead
		-- actual facing with vertical component
		local facing_vec = Vector3(0, 1, 0)
		mvector3.rotate_with(facing_vec, rotation)
		-- same xy direction, no elevation
		local forward_vec = Vector3(0, 1, 0)
		mvector3.rotate_with(forward_vec, rotation_flat)
		-- get difference to determine if player is facing over or under horizon
		local zdiff = forward_vec.z - facing_vec.z
		if true then --zdiff > 0 then
			fast_kickoff = true
		end

		if nearest_wall_ray and nearest_wall_ray.dir then
			self._last_wallrun_dir = nearest_wall_ray.dir
			--if fast_kickoff then
				-- 'fast' wallkick
				-- kick in direction player is facing
				--mvector3.multiply(kick_dir, 1.35) -- this mattered when fast/slow wallkicks were separate
				mvector3.rotate_with(kick_dir, rotation)
				mvector3.add(final_vel, kick_dir)

				-- vertical boost so you don't automatically fly into the ground regardless of trajectory
				mvector3.add(final_vel, Vector3(0, 0, 300 + (300 * zdiff)))

				-- vertical reduction if aiming upwards so you can't leap over houses in a single bound or some shit
				if zdiff < 0 then
					mvector3.add(final_vel, Vector3(0, 0, speed * zdiff * 0.5))
				end

				if self._unit:mover() then
					self._unit:mover():set_velocity(final_vel)
					self._unit:mover():set_gravity(Vector3(0, 0, -982))
				end

				if self._state_data.in_air then
					self._state_data.enter_air_pos_z = self._pos.z
				end
				self._last_zdiff = zdiff
		end

		if self._using_superblt then
			self._inf_sound:post_event("kick_off")
		else
			self._unit:sound():_play("footstep_land")
		end
		self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN)
		self._unit:movement():_restart_stamina_regen_timer()
		self._is_wallkicking = true
	end

end
