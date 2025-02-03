local mrot1 = Rotation()
local mrot2 = Rotation()
local mrot3 = Rotation()
local mrot4 = Rotation()
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mvec4 = Vector3()

local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_copy = mvector3.copy
local mvec3_rotate_with = mvector3.rotate_with

local mrot_set_zero = mrotation.set_zero
local mrot_multiply = mrotation.multiply

--[[
local old_init = FPCameraPlayerBase.init
function FPCameraPlayerBase:init( unit )
	old_init(self, unit)
	
	self._view_kick = {
		velocity = 0,
		direction = Vector3(),
		delta = Vector3()
	}
end
--]]

--Add limit constraints to recoil, to allow for recoil to occur with a bipod.
function FPCameraPlayerBase:_update_movement(t, dt)
	local data = self._camera_properties
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2

	self._parent_unit:m_position(new_head_pos)

	if _G.IS_VR then
		local hmd_position = mvec1
		local mover_position = mvec3

		mvector3.set(mover_position, new_head_pos)
		mvector3.set(hmd_position, self._parent_movement_ext:hmd_position())
		mvector3.set(new_head_pos, self._parent_movement_ext:ghost_position())
		mvector3.set_x(hmd_position, 0)
		mvector3.set_y(hmd_position, 0)
		mvector3.add(new_head_pos, hmd_position)

		local mover_top = math.max(self._parent_unit:get_active_mover_offset() * 2, 45)

		mvector3.set_z(mover_position, mover_position.z + mover_top)

		self._output_data.mover_position = mvector3.copy(mover_position)

		self:_horizonatal_recoil_kick(t, dt)
		self:_vertical_recoil_kick(t, dt)
	else
		mvector3.add(new_head_pos, self._head_stance.translation)

		local stick_input_x = 0
		local stick_input_y = 0
		local aim_assist_x, aim_assist_y = self:_get_aim_assist(t, dt, self._tweak_data.aim_assist_snap_speed, self._aim_assist)
		stick_input_x = stick_input_x + self:_horizonatal_recoil_kick(t, dt) + aim_assist_x
		stick_input_y = stick_input_y + self:_vertical_recoil_kick(t, dt) + aim_assist_y
		local look_polar_spin = data.spin - stick_input_x
		local look_polar_pitch = math.clamp(data.pitch + stick_input_y, -85, 85)

		--Apply limits to recoil.
		if self._limits then
			if self._limits.spin then
				local d = (look_polar_spin - self._limits.spin.mid) / self._limits.spin.offset
				d = math.clamp(d, -1, 1)
				look_polar_spin = data.spin - math.lerp(stick_input_x, 0, math.abs(d))
			end

			if self._limits.pitch then
				local d = math.abs((look_polar_pitch - self._limits.pitch.mid) / self._limits.pitch.offset)
				d = math.clamp(d, -1, 1)
				look_polar_pitch = data.pitch + math.lerp(stick_input_y, 0, math.abs(d))
				look_polar_pitch = math.clamp(look_polar_pitch, -85, 85)
			end
		end

		if not self._limits or not self._limits.spin then
			look_polar_spin = look_polar_spin % 360
		end

		local look_polar = Polar(1, look_polar_pitch, look_polar_spin)
		local look_vec = look_polar:to_vector()
		local cam_offset_rot = mrot3

		mrotation.set_look_at(cam_offset_rot, look_vec, math.UP)
		mrotation.set_zero(new_head_rot)
		mrotation.multiply(new_head_rot, self._head_stance.rotation)
		mrotation.multiply(new_head_rot, cam_offset_rot)

		if TacticalLean then
			local current_lean = TacticalLean:GetLeanDirection()
			local exiting_lean = TacticalLean:IsExitingLean()
			local lean_direction = current_lean or exiting_lean
			if current_lean or exiting_lean then
				local lean_angle = TacticalLean:GetLeanAngle(lean_direction)
				local lerp = TacticalLean:GetLeanLerp()
				
				local target_tilt = self._camera_properties.target_tilt or 0
				self._camera_properties.current_tilt = target_tilt + (lerp * lean_angle)
			elseif self._camera_properties.current_tilt ~= self._camera_properties.target_tilt then
				self._camera_properties.current_tilt = math.step(self._camera_properties.current_tilt, self._camera_properties.target_tilt, 150 * dt)
			end
		end

		data.pitch = look_polar_pitch
		data.spin = look_polar_spin
		self._output_data.rotation = new_head_rot or self._output_data.rotation

		if self._camera_properties.current_tilt ~= self._camera_properties.target_tilt then
			self._camera_properties.current_tilt = math.step(self._camera_properties.current_tilt, self._camera_properties.target_tilt, 150 * dt)
		end

		if self._camera_properties.current_tilt ~= 0 then
			self._output_data.rotation = Rotation(self._output_data.rotation:yaw(), self._output_data.rotation:pitch(), self._output_data.rotation:roll() + self._camera_properties.current_tilt)
		end
	end

	self._output_data.position = new_head_pos

	mvector3.set(new_shoulder_pos, self._shoulder_stance.translation)
	mvector3.add(new_shoulder_pos, self._vel_overshot.translation)
	mvector3.rotate_with(new_shoulder_pos, self._output_data.rotation)
	mvector3.add(new_shoulder_pos, new_head_pos)
	mrotation.set_zero(new_shoulder_rot)
	mrotation.multiply(new_shoulder_rot, self._output_data.rotation)
	mrotation.multiply(new_shoulder_rot, self._shoulder_stance.rotation)
	mrotation.multiply(new_shoulder_rot, self._vel_overshot.rotation)
	self:set_position(new_shoulder_pos)
	self:set_rotation(new_shoulder_rot)
end


local mvec1 = Vector3()

Hooks:PostHook(FPCameraPlayerBase, "_update_rot", "ResFixBipodADS", function(self, axis, unscaled_axis)
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2
	local player_state = managers.player:current_state()

	local equipped_weapon = self._parent_unit:inventory():equipped_unit()
	local bipod_weapon_translation = Vector3(0, 0, 0)

	if equipped_weapon and equipped_weapon:base() then
		local weapon_tweak_data = equipped_weapon:base():weapon_tweak_data()

		if weapon_tweak_data and weapon_tweak_data.bipod_weapon_translation then
			bipod_weapon_translation = weapon_tweak_data.bipod_weapon_translation
		end
	end

	local bipod_pos = Vector3(0, 0, 0)
	local bipod_rot = new_shoulder_rot

	mvec3_set(bipod_pos, bipod_weapon_translation)
	mvec3_rotate_with(bipod_pos, self._output_data.rotation)
	mvec3_add(bipod_pos, new_head_pos)
	mvec3_set(new_shoulder_pos, self._shoulder_stance.translation)
	mvec3_add(new_shoulder_pos, self._vel_overshot.translation)
	mvec3_rotate_with(new_shoulder_pos, self._output_data.rotation)
	mvec3_add(new_shoulder_pos, new_head_pos)
	mrot_set_zero(new_shoulder_rot)
	mrot_multiply(new_shoulder_rot, self._output_data.rotation)
	mrot_multiply(new_shoulder_rot, self._shoulder_stance.rotation)
	mrot_multiply(new_shoulder_rot, self._vel_overshot.rotation)

	if player_state == "bipod" then
		self:set_position(new_shoulder_pos)
		self:set_rotation(new_shoulder_rot)
		self._parent_unit:camera():set_position(self._output_data.position)
		self._parent_unit:camera():set_rotation(self._output_data.rotation)
		if not self._parent_unit:movement()._current_state:in_steelsight() then
			self:set_position(PlayerBipod._shoulder_pos or new_shoulder_pos)
			self:set_rotation(bipod_rot)
			self._parent_unit:camera():set_position(self._output_data.position)
		end
	else
		if PlayerBipod and PlayerBipod._shoulder_pos then
			mvec3_set(PlayerBipod._shoulder_pos, bipod_pos)
		end
	end
end)

--Initializes recoil_kick values since they start null.
local old_start_shooting = FPCameraPlayerBase.start_shooting
function FPCameraPlayerBase:start_shooting()
	local enable_recoil_recover = restoration.Options:GetValue("OTHER/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover == 1 then
		self._recoil_kick.accumulated = self._recoil_kick.accumulated or 0 --Total amount of recoil to burn through in degrees.
		self._recoil_kick.h.accumulated = self._recoil_kick.h.accumulated or 0
	else
		old_start_shooting(self)
	end
end

function FPCameraPlayerBase:stop_shooting( wait )
	local weapon = self._parent_unit:inventory():equipped_unit()
	local enable_recoil_recover = restoration.Options:GetValue("OTHER/WeaponHandling/CarpalTunnel") or 1
	local recoil_recover = (enable_recoil_recover and enable_recoil_recover ~= 1 and ((enable_recoil_recover == 3 and 1) or (weapon and weapon:base()._recoil_recovery) or 0.5)) or 0

	if enable_recoil_recover ~= 1 then
		self._recoil_kick.to_reduce = (self._recoil_kick.accumulated or 0) * recoil_recover
		self._recoil_kick.h.to_reduce = (self._recoil_kick.h.accumulated or 0) * recoil_recover
	else
		self._recoil_kick.current = nil
		self._recoil_kick.to_reduce = 0
		self._recoil_kick.h.current = nil
		self._recoil_kick.h.to_reduce = 0
	end
	self._recoil_wait = (wait and wait * ((enable_recoil_recover and enable_recoil_recover == 3 and 3) or 1)) or 0
end

--Add more recoil to burn through.
--Also no longer arbitrarily caps vertical recoil.
function FPCameraPlayerBase:recoil_kick(up, down, left, right, min_h_recoil)
	local player_state = managers.player:current_state()
	if player_state == "bipod" then
		up = up * 0.5
		down = down * 0.5
		left = left * 0.25
		right = right * 0.25
	end

	local v = math.lerp(up, down, math.random())
	self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0) + v

	local h = math.lerp(left, right, math.random() )
	local min_h_recoil = min_h_recoil or 0.25
	h =  h < 0 and math.min( left * min_h_recoil , h ) or math.max( right * min_h_recoil , h )
	self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0) + h
	return v, h
end

function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
	local r_value = 0
	local player_state = self._parent_unit:movement():current_state()
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and weapon:base()._recoil_center_speed or 7.5
	local enable_recoil_recover = restoration.Options:GetValue("OTHER/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover and enable_recoil_recover == 3 then
		center_speed = math.max(center_speed * 0.75, 1)
	end
	local recoil_speed = math.max(weapon and weapon:base()._recoil_speed[1] or 80, 0)
	if player_state and player_state:in_air() then
		recoil_speed = recoil_speed * 1.25
	end
	if enable_recoil_recover == 1 and self._recoil_kick.accumulated and self._episilon < math.abs(self._recoil_kick.accumulated) then
		local degrees_to_move = 80 * dt --Move camera 80 degrees per second, increased speed over the vanilla 40 to reduce "ghost" recoil
		r_value = math.min(self._recoil_kick.accumulated, degrees_to_move)
		self._recoil_kick.accumulated = self._recoil_kick.accumulated - r_value
	elseif enable_recoil_recover ~= 1 and self._recoil_kick.current and self._recoil_kick.accumulated - ((enable_recoil_recover ~= 1 and self._recoil_kick.current) or 0) > self._episilon then
		local n = math.step(self._recoil_kick.current, self._recoil_kick.accumulated, recoil_speed  * dt)
		r_value = n - self._recoil_kick.current
		self._recoil_kick.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt

		if self._recoil_wait <= 0 then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.to_reduce then
		self._recoil_kick.current = nil
		local n = math.lerp(self._recoil_kick.to_reduce, 0, center_speed * dt)
		r_value = -(self._recoil_kick.to_reduce - n)
		self._recoil_kick.to_reduce = n
		if self._recoil_kick.to_reduce == 0 then
			self._recoil_kick.to_reduce = nil
		end
	end

	return r_value
end

function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local r_value = 0
	local player_state = self._parent_unit:movement():current_state()
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and weapon:base()._recoil_center_speed or 7.5
	local enable_recoil_recover = restoration.Options:GetValue("OTHER/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover and enable_recoil_recover == 3 then
		center_speed = math.max(center_speed * 0.75, 1)
	end
	local recoil_speed = math.max(weapon and weapon:base()._recoil_speed[2] or 60, 0)
	if player_state and player_state:in_air() then
		recoil_speed = recoil_speed * 1.25
	end
	if enable_recoil_recover == 1 and self._recoil_kick.h.accumulated and self._episilon < math.abs(self._recoil_kick.h.accumulated) then
		local degrees_to_move = 60 * dt 
		r_value = math.min(self._recoil_kick.h.accumulated, degrees_to_move)
		self._recoil_kick.h.accumulated = self._recoil_kick.h.accumulated - r_value
	elseif enable_recoil_recover ~= 1 and self._recoil_kick.h.current and math.abs(self._recoil_kick.h.accumulated - ((enable_recoil_recover ~= 1 and self._recoil_kick.h.current) or 0)) > self._episilon then
		local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, recoil_speed * dt)
		r_value = n - self._recoil_kick.h.current
		self._recoil_kick.h.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt
		if 0 > self._recoil_wait then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.h.to_reduce then
		self._recoil_kick.h.current = nil
		local n = math.lerp(self._recoil_kick.h.to_reduce, 0, center_speed * dt)
		r_value = -(self._recoil_kick.h.to_reduce - n)
		self._recoil_kick.h.to_reduce = n
		if self._recoil_kick.h.to_reduce == 0 then
			self._recoil_kick.h.to_reduce = nil
		end
	end
	return r_value
end


local ANIM_STATES = PlayerStandard.ANIM_STATES
function FPCameraPlayerBase:play_redirect(redirect_name, speed, offset_time)
	self:set_anims_enabled(true)
	
	--Fix for fire rate speed mults not applying to anims, especially whie aiming
	--Like fuck am I doing this fix through "PlayerStandard:_check_action_primary_attack" instead
	local equipped_weapon = self._parent_unit and self._parent_unit:inventory() and self._parent_unit:inventory():equipped_unit()
	local current_state = self._parent_movement_ext and self._parent_movement_ext._current_state
	if alive(equipped_weapon) then
		local weap_base = equipped_weapon:base()
		if weap_base then
			local dsr_check = redirect_name == ANIM_STATES.standard.recoil_steelsight or redirect_name == ANIM_STATES.standard.recoil or redirect_name == ANIM_STATES.standard.recoil_exit
			if dsr_check and current_state:in_steelsight() and weap_base._disable_steelsight_recoil_anim and not weap_base:second_sight_spread_mult() then
				self._unit:play_redirect(Idstring("idle"))
				return 
			end
			if redirect_name == ANIM_STATES.standard.recoil_steelsight or redirect_name == ANIM_STATES.standard.recoil then
				if weap_base._starwars then
					speed = 1
				else
					speed = weap_base:fire_rate_multiplier( weap_base._ignore_rof_mult_anims )
				end
				if weap_base:weapon_tweak_data() and weap_base:weapon_tweak_data().fake_semi_anims then
					redirect_name = Idstring("recoil_exit")
				end
			end
			--[[
			if speed and weap_base:weapon_tweak_data().anim_speed_multiplier then
				speed = speed * weap_base:weapon_tweak_data().anim_speed_multiplier
			end
			--]]
		end
	end
	self._anim_empty_state_wanted = false
	local result = self._unit:play_redirect(redirect_name, offset_time)

	if result == self.IDS_NOSTRING then
		return false
	end

	if speed then
		self._unit:anim_state_machine():set_speed(result, speed)
	end

	return result
end

--Fix for Kento's Tanto anims
function FPCameraPlayerBase:play_anim_melee_item(tweak_name, speed_multiplier)
	if not self._melee_item_units then
		return
	end

	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local anims = tweak_data.blackmarket.melee_weapons[melee_entry].anims
	local anim_data = anims and anims[tweak_name]

	if not anim_data then
		return
	end

	if self._melee_item_anim then
		for _, unit in ipairs(self._melee_item_units) do
			unit:anim_stop(self._melee_item_anim)
		end

		self._melee_item_anim = nil
	end

	local ids = anim_data.anim and Idstring(anim_data.anim)

	if ids then
		for _, unit in ipairs(self._melee_item_units) do
			local length = unit:anim_length(ids)

			if anim_data.loop then
				unit:anim_play_loop(ids, 0, length, 1)
			else
				unit:anim_play_to(ids, length, speed_multiplier or 1)
			end
		end

		self._melee_item_anim = ids
	end
end

--[
local bezier_values = {
	0,
	0.4,
	1,
	1
}
local bezier_values2 = {
	0,
	0,
	1,
	1
}
--Still wonky when swapping to your main optic (culls too early)
--Also stuff to make ADS transitions less "on-rails"
Hooks:PostHook(FPCameraPlayerBase, "_update_stance", "ResFixSecondSight", function(self, t, dt)
	if self._shoulder_stance.transition then
		local trans_data = self._shoulder_stance.transition
		local elapsed_t = t - trans_data.start_t
		local player_state = managers.player:current_state()
		local equipped_weapon = self._parent_unit:inventory():equipped_unit()
		local is_akimbo = equipped_weapon and equipped_weapon:base() and equipped_weapon:base().AKIMBO
		local speen = equipped_weapon and equipped_weapon:base() and equipped_weapon:base():weapon_tweak_data().speen
		local ignore_transition_styles = equipped_weapon and equipped_weapon:base() and equipped_weapon:base():weapon_tweak_data().ign_ts
		local in_full_steelsight = self._parent_movement_ext._current_state._state_data.in_full_steelsight

		if trans_data.duration < elapsed_t then
			mvector3.set(self._shoulder_stance.translation, trans_data.end_translation)

			self._shoulder_stance.rotation = trans_data.end_rotation
			self._shoulder_stance.transition = nil
			local in_steelsight = self._parent_movement_ext._current_state:in_steelsight()

			if in_steelsight and not self._steelsight_swap_state then
				self:_set_steelsight_swap_state(true)
			elseif not in_steelsight and self._steelsight_swap_state then
				self:_set_steelsight_swap_state(false)
			end
		else
			local progress = elapsed_t / trans_data.duration
			local progress_smooth = math.bezier(speen and bezier_values2 or bezier_values, progress)
			local in_steelsight = self._parent_movement_ext._current_state:in_steelsight()
			if equipped_weapon and equipped_weapon:base() then
				local in_second_sight = equipped_weapon:base():is_second_sight_on()
				if in_second_sight and in_second_sight == true then
					self._shoulder_stance.was_in_second_sight = true
				end
			end
			local absolute_progress = nil

			if in_steelsight or self._shoulder_stance.was_in_steelsight then
				self._shoulder_stance.was_in_steelsight = true
				--progress_smooth = math.bezier(bezier_values2, progress) --WAS gonna do something with the two beizer tables but rn it's currently nothing, leaving in so I don't have to re-implement if I do figure out somethin
				absolute_progress = (1 - trans_data.absolute_progress) * progress_smooth + trans_data.absolute_progress
			else
				absolute_progress = trans_data.absolute_progress * (1 - progress_smooth)
			end

			mvector3.lerp(self._shoulder_stance.translation, trans_data.start_translation, trans_data.end_translation, progress_smooth)

			self._shoulder_stance.rotation = trans_data.start_rotation:slerp(trans_data.end_rotation, progress_smooth)

			if restoration and restoration.Options:GetValue("OTHER/WeaponHandling/ADSTransitionStyle") and restoration.Options:GetValue("OTHER/WeaponHandling/ADSTransitionStyle") ~= 1 and not is_akimbo and not ignore_transition_styles then
				if player_state and player_state ~= "bipod" and trans_data.absolute_progress and not self._steelsight_swap_state then
					local prog = (1 - absolute_progress) * (dt * 100)
					if self._shoulder_stance.was_in_steelsight and not in_steelsight then
						self._shoulder_stance.was_in_steelsight = nil
						self._shoulder_stance.was_in_second_sight = nil
						prog = absolute_progress * (dt * 100)
						trans_data.start_translation = trans_data.start_translation + Vector3(1 * prog, 0.5 * prog, 1 * prog)
						trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 2.5 * prog)
					elseif in_steelsight and in_full_steelsight ~= true then
						if speen then
							trans_data.start_translation = trans_data.start_translation + Vector3(0.5 * prog, 0.5 * prog, -0.2 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 36 * prog)
						elseif restoration.Options:GetValue("OTHER/WeaponHandling/ADSTransitionStyle") == 2 then
							trans_data.start_translation = trans_data.start_translation + Vector3(0.5 * prog, 0.5 * prog, -0.2 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 1.25 * prog)
						elseif restoration.Options:GetValue("OTHER/WeaponHandling/ADSTransitionStyle") == 3 then
							trans_data.start_translation = trans_data.start_translation + Vector3(-0.5 * prog, 0.5 * prog, -0.5 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, -1.25 * prog)
						end
					end
				end
			end

		end
	end
end)
--]]
