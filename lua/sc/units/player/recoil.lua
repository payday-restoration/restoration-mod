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

Hooks:RemovePostHook("immersive_fpcamera")
Hooks:RemovePostHook("viewmodel_tweaks")
Hooks:PostHook(FPCameraPlayerBase, "update", "ResBWAUpdate", function(self, unit, t, dt)
	--putting this into a new function just so I can more easily do real-time changes without having to restart or override the whole function
	self:_update_bwa(unit, t, dt)
end)

function FPCameraPlayerBase:_update_bwa(unit, t, dt)
	--Code originally from "Better Weapon Animations" by return and "Viewmodel Tweaks" by returnho
	if restoration.Options:GetValue("BWAResOpt/BWAResmod") then
		local enable_bob = restoration.Options:GetValue("BWAResOpt/BWAResmodBob")
		local enable_bob_ads = restoration.Options:GetValue("BWAResOpt/BWAResmodBobADS")
		local sway_style = restoration.Options:GetValue("BWAResOpt/BWAResmodSway")
		local p_unit = self._parent_unit
		local p_mov = self._parent_movement_ext
		local p_cam = p_unit:camera()
		local p_state = managers.player:current_state()
		local p_equipped = p_unit:inventory():equipped_unit()
		local wep_base = p_equipped and p_equipped.base and p_equipped:base()

		if p_mov._current_state == nil then
			return
		end
		
		local p_rot = unit:rotation()

		local in_crouch = p_mov._current_state._state_data.ducking
		local in_sight = p_mov._current_state:in_steelsight()
		local in_full_sight = p_mov._current_state:is_full_steelsight()
		local in_dash = p_mov._current_state._last_dash_time and (p_mov._current_state._last_dash_time + 0.1) > (t)
		local in_slide = p_mov._current_state._is_sliding
		local in_wallrun = p_mov._current_state._is_wallrunning
		local in_air = p_mov:in_air()
		local input_axis = p_unit:base():controller():get_input_axis("move")
		local in_walk = not in_air and (in_wallrun or in_slide or in_dash or mvector3.length(input_axis) ~= 0)
		local in_run = in_walk and (in_dash or p_mov:running())
		local in_bipod = p_state == "bipod"
		local in_freefall = p_state == "jerry1" or p_state == "jerry2"
		
		local deltaT = math.clamp(dt, .0016, .05) --clamp dt so FPS spikes (or low fps) don't make the viewmodel fly off
		local lp_speed = 16 * deltaT
		local t_pi_2 = t * math.pi * 2

		-----------------------------------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------

		-- VM Tweaks

		previousFrequency = previousFrequency or {}
		phaseOffset = phaseOffset or {}

		local function getWaveValue(frequency, socket)
			previousFrequency[socket] = previousFrequency[socket] or 0
			phaseOffset[socket] = phaseOffset[socket] or 0

			if frequency ~= previousFrequency[socket] then
				phaseOffset[socket] = phaseOffset[socket] + (previousFrequency[socket] - frequency) * t * math.pi * 2
				previousFrequency[socket] = frequency
			end
			return t * frequency * math.pi * 2 + phaseOffset[socket]
		end

		-----------------------------------------------------------------------------------------------------------------------------

		--Old viewbob calcs
		--[[
		local mov_lp_speed = deltaT * 5.5
		local run_mul = in_slide and 0 or in_run and 1.65 or 1
		local mov_mul = (enable_bob_ads and in_sight and 0.15) or (enable_bob and not in_sight and 1.75) or 0

		mov_pos = mov_pos or Vector3()
		mov_ang = mov_ang or Rotation()

		mrotation.slerp(mov_ang, mov_ang, in_walk and Rotation(math.cos(getWaveValue(64 * run_mul, 1)) * mov_mul, math.sin(getWaveValue(128 * run_mul, 2)) * mov_mul, math.sin(getWaveValue(64 * run_mul, 1)) * mov_mul) or Rotation(), mov_lp_speed)
		--]]

		--New viewbob calcs that attempt to scale the viewbob rate with your actual speed
		local mov_lp_speed = (deltaT * 16) * ((in_walk and 1) or 0.25)
		mov_pos = mov_pos or Vector3()
		mov_ang = mov_ang or Rotation()

		local bob_target = in_walk and 1 or 0
		local bob_speed = in_walk and 5 or 50
		bob_pow = bob_pow or 0
		bob_pow = math.lerp(bob_pow, bob_target, math.clamp(deltaT * bob_speed, 0, 1))

		if not in_freefall then
			local base_speed = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX or 300
			local current_speed = (p_mov._current_state._get_max_walk_speed and p_mov._current_state:_get_max_walk_speed(t)) or base_speed
			local step_mod = ((in_sight or in_crouch) and 125) or (in_run and 175) or 150
			local speed_mult = (current_speed / step_mod) * 0.4417 --it just works lmao???
			local run_mul = (in_slide and 0 or 1) * speed_mult --in_run and 1.45 or 1 --* ((in_sight and 0.8) or 1)
			local mov_mul = ((enable_bob_ads and in_sight and 0.15) or (enable_bob and not in_sight and 0.7) or 0) * bob_pow

			local rot_mul = mov_mul * 0.5
			mrotation.slerp(mov_ang, mov_ang, not in_sight and in_walk and Rotation(math.cos(getWaveValue(64 * run_mul, 1.5)) * rot_mul, math.sin(getWaveValue(128 * run_mul, -2.5)) * rot_mul, math.sin(getWaveValue(64 * run_mul, 1)) * rot_mul) or Rotation(), mov_lp_speed)
			mov_mul = mov_mul * ((in_sight and 0.5) or -0.5)
			mvector3.lerp(mov_pos, mov_pos, in_walk and Vector3(-math.sin(getWaveValue(64 * run_mul, 1.5)) * mov_mul * ((in_run and 2) or 1), 0, -math.sin(getWaveValue(128 * run_mul, -2.5)) * mov_mul) or Vector3(), mov_lp_speed)
		end

		-----------------------------------------------------------------------------------------------------------------------------

		local pitch_lp_speed = (deltaT * 8) * ((in_sight and not in_full_sight and 2) or 1)
		look_pos = look_pos or Vector3()

		local pitch = unit:rotation():pitch()
		local up_mul = 1.5
		local down_mul = 1
		local pitch_mul = pitch > 0 and up_mul or down_mul

		mvector3.lerp(look_pos, look_pos, (not in_sight) and Vector3(0, 0, -(pitch * pitch_mul) / 48) or Vector3(), pitch_lp_speed)
		
		-----------------------------------------------------------------------------------------------------------------------------

		--ADS tilt
		ads_tilt_pos = ads_tilt_pos or Vector3()
		ads_tilt_ang = ads_tilt_ang or Rotation()

		local res_ads_style = restoration.Options:GetValue("BWAResOpt/BWAResADSTransitionStyle") or 1
		local is_akimbo = wep_base and wep_base.AKIMBO
		local ignore_transition_styles = wep_base and wep_base:weapon_tweak_data().ign_ts

		if not in_bipod and not is_akimbo and not ignore_transition_styles and res_ads_style ~= 1 then
			ads_tilt_progress = ads_tilt_progress or 0
			ads_tilt_target_ang = ads_tilt_target_ang or Rotation()
			ads_tilt_target_pos = ads_tilt_target_pos or Vector3()
			local steelsight_t = wep_base and (tweak_data.player.TRANSITION_DURATION / wep_base:enter_steelsight_speed_multiplier()) or 0.2
			local ads_tilt_lp_speed = (deltaT * 8 * ((in_full_sight and 1.5) or 1)) * wep_base:enter_steelsight_speed_multiplier()
			if in_sight and not in_full_sight then
			    ads_tilt_progress = math.min(ads_tilt_progress + dt, steelsight_t * 0.5)
			elseif not in_sight then
			    ads_tilt_progress = math.max(ads_tilt_progress - dt, 0)
			end

			local tilt_pow = 0
			if ads_tilt_progress > 0 then
			    tilt_pow = math.clamp(1 - (ads_tilt_progress / (steelsight_t * 0.5)), 0, 1)
			end
			if not in_sight or in_full_sight then
				tilt_pow = 0
			end
			--tilt_pow = tilt_pow / pitch_mul

			if res_ads_style == 2 then
				ads_tilt_target_ang = Rotation(-0.5 * tilt_pow, 0.5 * tilt_pow, 20 * tilt_pow)
				ads_tilt_target_pos = Vector3(3 * tilt_pow, 2 * tilt_pow, 1.5 * tilt_pow)
			else
				ads_tilt_target_ang = Rotation(0.2 * tilt_pow, 0 * tilt_pow, -20 * tilt_pow)
				ads_tilt_target_pos = Vector3(0 * tilt_pow, 5 * tilt_pow, -3 * tilt_pow)
			end
			mrotation.slerp(ads_tilt_ang, ads_tilt_ang, ads_tilt_target_ang, ads_tilt_lp_speed * ((tilt_pow == 0 and 1.2) or 1))
			mvector3.lerp(ads_tilt_pos, ads_tilt_pos, ads_tilt_target_pos, ads_tilt_lp_speed * ((tilt_pow == 0 and 1.2) or 1))
		end

		-----------------------------------------------------------------------------------------------------------------------------

		--Added a slight downward offset on the viewmodel when moving
		--Added a speed-up to re-center when in the process of aiming
		local tilt_lp_speed = (deltaT * 5.5) * ((in_sight and not in_full_sight and 2) or 1) * ((in_sight and 1) or 0.7)
		local tilt_str = restoration.Options:GetValue("BWAResOpt/BWAResmodTiltStr") or 0.45
		local in_sight_tilt_str = restoration.Options:GetValue("BWAResOpt/BWAResmodADSTiltStr") or 0.03

		tilt_pos = tilt_pos or Vector3()
		tilt_ang = tilt_ang or Rotation()
		mvector3.lerp(tilt_pos, tilt_pos, (not in_air) and Vector3((not in_sight and 16 or 0.5) * input_axis.x / 16, 0, ((not in_sight and 2.25 or 0.5) * input_axis.x / 2) + -math.abs(((in_walk and 1.15 or 0) * (in_run and 1.5 or 1)) * (not in_sight and 2 or 0))) or Vector3(), tilt_lp_speed)
		mrotation.slerp(tilt_ang, tilt_ang, (not in_air) and Rotation(0, 0, (not in_sight and 2.25 or 0.5) * input_axis.x * 2.625 * (in_run and 2 or 1))  or Rotation(), tilt_lp_speed)
		
		-----------------------------------------------------------------------------------------------------------------------------

		--Greatly reduced jump wobble
		--Add AdvMov dashing as an additionl exception to the stronger jump wobble
		local jump_lp_speed = deltaT * 8
		local z_vel = p_unit:velocity().z / 5

		z_last_vel = (in_dash and 0) or z_last_vel or 0
		jump_wobble = (in_dash and 0) or jump_wobble or 0
		invert_jump_wobble = invert_jump_wobble or 0

		jump_pos = jump_pos or Vector3()

		invert_jump_wobble = math.lerp(invert_jump_wobble, jump_wobble, jump_lp_speed) * (in_dash and 0 or 1)
		jump_wobble = math.lerp(jump_wobble, (z_last_vel - z_vel) + (jump_wobble - invert_jump_wobble), jump_lp_speed) * (in_dash and 0 or 1)
		mvector3.lerp(jump_pos, jump_pos, Vector3(0, 0, ((not in_sight and 0.2 or 0.05) * jump_wobble) * (in_dash and 0 or 1)) / (deltaT * 100), jump_lp_speed * 4)

		z_last_vel = z_vel

		-----------------------------------------------------------------------------------------------------------------------------

		--If look-sway drag is enabled, have weapon movement penalty contribute to how far the weapon drags behind
		local sway_lp_speed = deltaT * 16

		last_p_rot = last_p_rot or Rotation()

		local p_rot_diff = Rotation(p_rot:yaw() - last_p_rot:yaw(), p_rot:pitch() - last_p_rot:pitch(), p_rot:roll() - last_p_rot:roll())
		local sway_str = restoration.Options:GetValue("BWAResOpt/BWAResmodSwayStr") or 0.45
		local in_sight_sway_str = restoration.Options:GetValue("BWAResOpt/BWAResmodADSSwayStr") or 0.03
		local sway_range = (sway_str * (in_sight and in_sight_sway_str or 1)) * ((sway_style and -1) or 1)
		sway_range = sway_range / (((sway_style and wep_base) and math.min(wep_base._movement_penalty, 1)) or 1)
		p_rot_diff_yaw = p_rot_diff_yaw and math.clamp(p_rot_diff:yaw(), -5, 5) * sway_range or 0
		p_rot_diff_pitch = p_rot_diff_pitch and math.clamp(p_rot_diff:pitch(), -5, 5) * sway_range or 0

		sway_yaw = sway_yaw or 0
		invert_sway_yaw = invert_sway_yaw and math.lerp(invert_sway_yaw, sway_yaw, sway_lp_speed) or 0
		sway_yaw = math.lerp(sway_yaw, p_rot_diff_yaw + (sway_yaw - invert_sway_yaw), sway_lp_speed)

		sway_pitch = sway_pitch or 0
		invert_sway_pitch = invert_sway_pitch and math.lerp(invert_sway_pitch, sway_pitch, sway_lp_speed) or 0
		sway_pitch = math.lerp(sway_pitch, p_rot_diff_pitch + (sway_pitch - invert_sway_pitch), sway_lp_speed)

		last_p_rot = p_rot

		sway_pos = sway_pos or Vector3()
		mvector3.lerp(sway_pos, sway_pos, Vector3(sway_yaw / 2, -sway_yaw / 2, -sway_pitch / 4), sway_lp_speed)

		sway_ang = sway_ang or Rotation()
		mrotation.slerp(sway_ang, sway_ang, Rotation(sway_yaw * 2, sway_pitch * 2, 0), sway_lp_speed)

		-----------------------------------------------------------------------------------------------------------------------------

		local wall_lp_speed = deltaT * 8
		wall_pos = wall_pos or Vector3()

		if p_equipped then
			local from = p_cam:position() + p_cam:forward()
			local to = p_cam:position() + p_cam:forward() * 100

			local ray = self._unit:raycast("ray", from, to, "slot_mask", managers.slot:get_mask("bullet_impact_targets"))

			--Added snippet to disable the pushback effect while ADS to remove camera clipping
			mvector3.lerp(wall_pos, wall_pos, ray and (-math.Y * (10 - ((in_sight and 100) or ray.distance) / 10)) or Vector3(), wall_lp_speed)
		end

		-----------------------------------------------------------------------------------------------------------------------------

		mvector3.set(self._vel_overshot.translation, mov_pos + look_pos + tilt_pos + jump_pos + sway_pos + wall_pos + ads_tilt_pos)
		mrotation.set_zero(self._vel_overshot.rotation)
		mrotation.multiply(self._vel_overshot.rotation, mov_ang * tilt_ang * sway_ang * ads_tilt_ang)
	end
end

Hooks:PreHook(FPCameraPlayerBase, "clbk_stance_entered", "BWA_ZeroOvershot", function(self, new_shoulder_stance, new_head_stance, new_vel_overshot, new_fov, new_shakers, stance_mod, duration_multiplier, duration, head_duration_multiplier, head_duration)
	local bwa = restoration.Options:GetValue("BWAResOpt/BWAResmod")
	local static_aim = restoration.Options:GetValue("WEAPONS/WEAPONANIMS/StaticAim") and self._parent_unit:movement()._current_state:in_steelsight()
	if new_vel_overshot and (bwa or static_aim) then
		new_vel_overshot.yaw_neg = 0
		new_vel_overshot.yaw_pos = 0
		new_vel_overshot.pitch_neg = 0
		new_vel_overshot.pitch_pos = 0
	end
	if new_shakers and new_shakers.breathing and static_aim then
		new_shakers.breathing.amplitude = 0
	end
end)

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
	local enable_recoil_recover = restoration.Options:GetValue("WEAPONS/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover == 1 then
		self._recoil_kick.accumulated = self._recoil_kick.accumulated or 0 --Total amount of recoil to burn through in degrees.
		self._recoil_kick.h.accumulated = self._recoil_kick.h.accumulated or 0
	else
		old_start_shooting(self)
	end
end

function FPCameraPlayerBase:stop_shooting( wait )
	local weapon = self._parent_unit:inventory():equipped_unit()
	local enable_recoil_recover = restoration.Options:GetValue("WEAPONS/WeaponHandling/CarpalTunnel") or 1
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
function FPCameraPlayerBase:recoil_kick(up, down, left, right, min_h_recoil, last_recoil_mult, last_recoil_mult_h)
	local player_state = managers.player:current_state()
	if player_state == "bipod" then
		up = up * 0.5
		down = down * 0.5
		left = left * 0.25
		right = right * 0.25
	end

	self._last_recoil_mult = math.max(1, last_recoil_mult or 1)
	self._last_recoil_mult_h = math.max(1, last_recoil_mult_h or 1)

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
	local enable_recoil_recover = restoration.Options:GetValue("WEAPONS/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover and enable_recoil_recover == 3 then
		center_speed = math.max(center_speed * 0.75, 1)
	end
	local recoil_mult = self._last_recoil_mult or 1
	local recoil_speed = (math.max(weapon and weapon:base()._recoil_speed[1] or 80, 0) / 3) * recoil_mult
	if player_state and player_state:in_air() then
		recoil_speed = recoil_speed * 1.25
	end
	if enable_recoil_recover == 1 and self._recoil_kick.accumulated and self._episilon < math.abs(self._recoil_kick.accumulated) then
		local degrees_to_move = recoil_speed * dt --Move camera 80 degrees per second, increased speed over the vanilla 40 to reduce "ghost" recoil
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

	--For controllers
	accumulatedKick = self._recoil_kick.current
	currentKick = self._recoil_kick.current

	return r_value	
end

function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local r_value = 0
	local player_state = self._parent_unit:movement():current_state()
	local weapon = self._parent_unit:inventory():equipped_unit()
	local center_speed = weapon and weapon:base()._recoil_center_speed or 7.5
	local enable_recoil_recover = restoration.Options:GetValue("WEAPONS/WeaponHandling/CarpalTunnel") or 1
	if enable_recoil_recover and enable_recoil_recover == 3 then
		center_speed = math.max(center_speed * 0.75, 1)
	end
	local recoil_mult = self._last_recoil_mult_h or 1
	local recoil_speed = (math.max(weapon and weapon:base()._recoil_speed[2] or 60, 0) / 3) * recoil_mult
	if player_state and player_state:in_air() then
		recoil_speed = recoil_speed * 1.25
	end
	if enable_recoil_recover == 1 and self._recoil_kick.h.accumulated and self._episilon < math.abs(self._recoil_kick.h.accumulated) then
		local degrees_to_move = recoil_speed * dt 
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
			local fire_mode = weap_base.fire_mode and weap_base:fire_mode()
			local in_burst = weap_base.in_burst_mode and weap_base:in_burst_mode()
			local active_burst = in_burst and weap_base._burst_rounds_remaining and weap_base._burst_rounds_remaining > 0
			local no_burst_anims = active_burst and weap_base._burst_no_anim
			local true_semi = fire_mode == "single" and not in_burst
			if no_burst_anims or (dsr_check and current_state:in_steelsight() and weap_base._disable_steelsight_recoil_anim and not weap_base:second_sight_spread_mult()) then
				self._unit:play_redirect(Idstring("idle"))
				return 
			end
			if redirect_name == ANIM_STATES.standard.recoil_steelsight or redirect_name == ANIM_STATES.standard.recoil then
				if weap_base._starwars and not weap_base._starwars.allow_anim_mults then
					speed = 1
				else
					speed = weap_base:fire_rate_multiplier( weap_base._ignore_rof_mult_anims or true_semi and weap_base._ignore_rof_mult_anims_semi )
				end
				if weap_base:weapon_tweak_data() and weap_base:weapon_tweak_data().fake_semi_anims then
					redirect_name = Idstring("recoil_exit")
				end
				if weap_base:weapon_tweak_data() and weap_base:weapon_tweak_data().no_steelsight_anims then
					redirect_name = Idstring("recoil")
				end
			end
			--[[
			if speed and weap_base:weapon_tweak_data().anim_speed_multiplier then
				speed = speed * weap_base:weapon_tweak_data().anim_speed_multiplier
			end
			--]]
			if current_state and current_state._queue_idle_interrupt_t then
				current_state._queue_idle_interrupt_t = nil
			end
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

	local anim_ids = anim_data.anim and Idstring(anim_data.anim)

	if anim_ids then
		for _, unit in ipairs(self._melee_item_units) do
			local anim_length = unit:anim_length(anim_ids)

			if anim_data.loop then
				unit:anim_play_loop(anim_ids, 0, anim_length, 1)
			else
				if anim_data.from then
					unit:anim_set_time(anim_ids, anim_data.from)
				end

				unit:anim_play_to(anim_ids, anim_length, speed_multiplier or 1)
			end

			if type(anim_data.start_time) == "number" then
				local start_time = anim_data.start_time

				if start_time == -1 then
					start_time = anim_length
				end

				unit:anim_set_time(start_time)
			end
		end

		self._melee_item_anim = anim_ids
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
	--putting this into a new function just so I can more easily do real-time changes
	self:_update_res_stance( t, dt)
end)

function FPCameraPlayerBase:_update_res_stance(t, dt)
	if self._shoulder_stance.transition and not restoration.Options:GetValue("BWAResOpt/BWAResmod") then
		local trans_data = self._shoulder_stance.transition
		local elapsed_t = t - trans_data.start_t
		local player_state = managers.player:current_state()
		local equipped_weapon = self._parent_unit:inventory():equipped_unit()
		local weapon_base = equipped_weapon and equipped_weapon:base()
		local is_akimbo = weapon_base and weapon_base.AKIMBO
		local speen = weapon_base and weapon_base:weapon_tweak_data().speen
		local ignore_transition_styles = weapon_base and weapon_base:weapon_tweak_data().ign_ts
		local in_steelsight = self._parent_movement_ext._current_state:in_steelsight()
		local in_full_steelsight = self._parent_movement_ext._current_state._state_data.in_full_steelsight

		if trans_data.duration < elapsed_t then
			mvector3.set(self._shoulder_stance.translation, trans_data.end_translation)

			self._shoulder_stance.rotation = trans_data.end_rotation
			self._shoulder_stance.transition = nil

			if in_steelsight and not self._steelsight_swap_state then
				self:_set_steelsight_swap_state(true)
			elseif not in_steelsight and self._steelsight_swap_state then
				self:_set_steelsight_swap_state(false)
			end
		else
			local progress = elapsed_t / trans_data.duration
			local progress_smooth = math.bezier(speen and bezier_values2 or bezier_values, progress)
			local in_second_sight = weapon_base and weapon_base:is_second_sight_on()
			if in_second_sight and in_second_sight == true then
				self._shoulder_stance.was_in_second_sight = true
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

			if restoration and restoration.Options:GetValue("WEAPONS/WEAPONANIMS/ADSTransitionStyle") and restoration.Options:GetValue("WEAPONS/WEAPONANIMS/ADSTransitionStyle") ~= 1 and not is_akimbo and not ignore_transition_styles and not restoration.Options:GetValue("BWAResOpt/BWAResmod") then
				local temp = not self._steelsight_swap_state --and (not in_second_sight or (in_second_sight and not in_steelsight))
				if player_state and player_state ~= "bipod" and trans_data.absolute_progress and temp then
					local prog = (1 - absolute_progress) * (dt * math.clamp(120 * weapon_base:enter_steelsight_speed_multiplier(), 0.1, 120))
					if self._shoulder_stance.was_in_steelsight and not in_steelsight then
						self._shoulder_stance.was_in_steelsight = nil
						self._shoulder_stance.was_in_second_sight = nil
						prog = absolute_progress * (dt * 100)
						trans_data.start_translation = trans_data.start_translation + Vector3(1 * prog, 0.5 * prog, 1 * prog)
						trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 1.5 * prog)
					elseif in_steelsight and in_full_steelsight ~= true then
						if speen then
							trans_data.start_translation = trans_data.start_translation + Vector3(0.5 * prog, 0.5 * prog, -0.2 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 36 * prog)
						elseif restoration.Options:GetValue("WEAPONS/WEAPONANIMS/ADSTransitionStyle") == 2 then
							trans_data.start_translation = trans_data.start_translation + Vector3(0.5 * prog, 0.5 * prog, -0.2 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, 1.25 * prog)
						elseif restoration.Options:GetValue("WEAPONS/WEAPONANIMS/ADSTransitionStyle") == 3 then
							trans_data.start_translation = trans_data.start_translation + Vector3(-0.2 * prog, 0.5 * prog, -0.2 * prog)
							trans_data.start_rotation = trans_data.start_rotation * Rotation(0 * prog, 0 * prog, -1.25 * prog)
						end
					end
				end
			end

		end
	end
end

--For controllers
function FPCameraPlayerBase:setSnapSpeed(value)
	ORIGINALaim_assist_snap_speed =  math.max(0, math.min(100, value))
end

local accumulatedKick = 0
local currentKick = 0
function FPCameraPlayerBase:isPlayerStillReceivingRecoilKick()
	return accumulatedKick ~= currentKick
end