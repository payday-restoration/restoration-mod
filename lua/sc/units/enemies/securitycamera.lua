--Sora wuz here

--RedFlame's Rotating Cams
local idstr_yaw_obj = Idstring("CameraYaw")

Hooks:PostHook(SecurityCamera, "init", "camerarot_init", function(self)
	self._yaw = 0
	self._pitch = 0
end)

Hooks:PostHook(SecurityCamera, "set_detection_enabled", "camerarot_set_detection_enabled", function(self, state)
	if state and self._yaw_obj then
		self._max_yaw = 60

		self._turn_rate = 9 -- degrees/s
		self._turn_direction = math.random(2) == 1 and 1 or -1

		self:set_target_yaw(self._max_yaw * self._turn_direction)
	end
end)

local update_orig = Hooks:GetFunction(SecurityCamera, "update")
Hooks:OverrideFunction(SecurityCamera, "update", function (self, unit, t, dt, ...)
	self:_update_camera_rotation(unit, t, dt)

	if not self._wants_update then -- vanilla code can crash if we update when it didn't want to
		return
	end

	return update_orig(self, unit, t, dt, ...)
end)

function SecurityCamera:_update_camera_rotation(unit, t, dt)
	if self._stalled_until then
		if t > self._stalled_until then
			self._stalled_until = nil
			self:set_target_yaw(self._max_yaw * self._turn_direction)
		end
	elseif self._target_yaw then
		local new_yaw = math.step(self._yaw, self._target_yaw, self._yaw_difference * (dt / self._turn_duration))

		self:apply_rotations(new_yaw, nil, true)

		if new_yaw ~= self._target_yaw then
			return
		end

		self._target_yaw = nil

		if Network:is_server() then
			self._stalled_until = t + math.rand(1.5, 2.5)
			self._turn_direction = -self._turn_direction
		elseif not self._tape_loop_restarting_t then
			self:set_update_enabled(false)
		end
	end
end

function SecurityCamera:set_target_yaw(yaw, duration)
	self._target_yaw = yaw
	self._yaw_difference = math.abs(self._target_yaw - self._yaw) -- math.step always expects a positive number
	self._turn_duration = duration or self._yaw_difference / self._turn_rate

	if Network:is_server() then
		local sync_yaw = math.round(255 * ((self._target_yaw + 180) / 360))

		managers.network:session():send_to_peers_synched("sync_camera_rotation", self._unit, sync_yaw, self._turn_duration)
	else
		self:set_update_enabled(true)
	end
end

local set_update_enabled_orig = Hooks:GetFunction(SecurityCamera, "set_update_enabled")
Hooks:OverrideFunction(SecurityCamera, "set_update_enabled", function (self, state, ...)
	self._wants_update = state
	return set_update_enabled_orig(self, state or self._target_yaw and true, ...)
end)

Hooks:OverrideFunction(SecurityCamera, "apply_rotations", function (self, yaw, pitch, no_sync)
	local yaw_obj = self._yaw_obj or self._unit:get_object(Idstring("CameraYaw"))
	local original_yaw_rot = yaw_obj:local_rotation()
	local new_yaw_rot = Rotation(180 + yaw, original_yaw_rot:pitch(), original_yaw_rot:roll())

	yaw_obj:set_local_rotation(new_yaw_rot)

	self._yaw = yaw

	if pitch then
		local pitch_obj = self._pitch_obj or self._unit:get_object(Idstring("CameraPitch"))
		local original_pitch_rot = pitch_obj:local_rotation()
		local new_pitch_rot = Rotation(original_pitch_rot:yaw(), pitch, original_pitch_rot:roll())

		pitch_obj:set_local_rotation(new_pitch_rot)

		self._pitch = pitch
	end

	self._look_fwd = nil

	self._unit:set_moving()

	if Network:is_server() and not no_sync then
		local sync_yaw = 255 * (yaw + 180) / 360
		local sync_pitch = 255 * (pitch + 90) / 180

		managers.network:session():send_to_peers_synched("camera_yaw_pitch", self._unit, sync_yaw, sync_pitch)
	end
end)

Hooks:PostHook(SecurityCamera, "save", "camerarot_save", function(self, data)
	if self._target_yaw then
		data.target_yaw = self._target_yaw

		local rel_progress_left = math.abs((self._target_yaw - self._yaw) / self._yaw_difference)

		data.turn_duration = self._turn_duration * rel_progress_left
	end
end)

Hooks:PostHook(SecurityCamera, "load", "camerarot_load", function(self, data)
	if data.target_yaw then
		self:set_target_yaw(data.target_yaw, data.turn_duration)
	end
end)

function SecurityCamera:generate_cooldown(amount)
	self._target_yaw = nil
	self._stalled_until = nil

	local mission_script_element = self._mission_script_element

	self:set_detection_enabled(false)
	managers.statistics:camera_destroyed()

	if mission_script_element then
		mission_script_element:on_destroyed(self._unit)
	end

	if self._access_camera_mission_element then
		self._access_camera_mission_element:access_camera_operation_destroy()
	end

	self._destroyed = true
	
	if managers.job and (managers.job:current_job_id() == "safehouse" or managers.job:current_job_id() == "custom_safehouse" or managers.job:current_job_id() == "chill" or managers.job:current_job_id() == "chill_combat") then
		--Smashing your own security cameras isn't the best idea
	else
		managers.hint:show_hint("destroyed_security_camera")
	end	
end
	
function SecurityCamera:_sound_the_alarm(detected_unit)
	if self._alarm_sound then
		return
	end

	if Network:is_server() then
		if self._mission_script_element then
			self._mission_script_element:on_alarm(self._unit)
		end		
	
		self:_send_net_event(self._NET_EVENTS.alarm_start)
		
		self._call_police_clbk_id = "cam_call_cops" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._call_police_clbk_id, callback(self, self, "clbk_call_the_police"), Application:time() + 7)
		
		managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.1
		managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
		managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
		managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.1
		managers.groupai:state():_delay_whisper_suspicion_mul_decay()

		self:_destroy_all_detected_attention_object_data()
	end

	if self._suspicion_sound then
		self._suspicion_sound = nil

		self._unit:sound_source():post_event("camera_suspicious_signal_stop")
	end

	self._alarm_sound = self._unit:sound_source():post_event("camera_alarm_signal")
end	

function SecurityCamera:clbk_call_the_police()
	local vanilla_behavior = managers.mutators:modify_value("SecurityCamera:VanillaPoliceCall", false)
	if not vanilla_behavior then
		managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, nil)
	
		self:_stop_all_sounds()
	
		self._call_police_clbk_id = nil
	else
		managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, "called")

		self._call_police_clbk_id = nil

		managers.groupai:state():on_police_called(self._reason_called)
	end
end	