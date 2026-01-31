--Sora wuz here
Hooks:PostHook(SecurityCamera, "init", "postinit_test_cam", function(self)
	self._initialized_yaw = false
	self._current_yaw_action = 1
	-- 1 = Increase
	-- 2 = Decrease
end)

function SecurityCamera:generate_cooldown(amount)
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

local CAMERA_TURN_RATE = 9

function SecurityCamera:update(unit, t, dt)
	self:_update_tape_loop_restarting(unit, t, dt)

	local max_yaw_positive = 60
	local max_yaw_negative = -60

	self:_init_dynamic_yaw()

	if not Network:is_server() then
		self._client_yaw = self._client_yaw or self._yaw
		self._client_pitch = self._client_pitch or self._pitch
		local diff = self._yaw / self._client_yaw
		local client_dt = (CAMERA_TURN_RATE * diff) * dt
		self._yaw = math.step(self._yaw, self._client_yaw, client_dt)
		self._pitch = math.step(self._pitch, self._client_pitch, client_dt)

		self:apply_rotations(self._yaw, self._pitch, true)

		return
	end

	if managers.groupai:state():is_ecm_jammer_active("camera") or self._tape_loop_expired_clbk_id or self._tape_loop_restarting_t or self._call_police_clbk_id then
		self:_destroy_all_detected_attention_object_data()
		self:_stop_all_sounds()
	else
		self:_upd_detection(t)
	end

	self:_upd_sound(unit, t)

	local yaw_dt = CAMERA_TURN_RATE * dt
	if self._current_yaw_action == 1 then
		self._yaw = math.min(self._yaw + yaw_dt, max_yaw_positive)
		if self._yaw >= max_yaw_positive then
			self._current_yaw_action = 2
		end
	elseif self._current_yaw_action == 2 then
		self._yaw = math.max(self._yaw - yaw_dt, max_yaw_negative)
		if self._yaw <= max_yaw_negative then
			self._current_yaw_action = 1
		end
	end

	self:apply_rotations(self._yaw, self._pitch)
end

function SecurityCamera:_init_dynamic_yaw()
	local max_yaw_negative = -60
	local current_pitch = self._pitch

	if not self._initialized_yaw then
		self._initialized_yaw = true
		self:apply_rotations(max_yaw_negative, current_pitch)
	end
end

function SecurityCamera:apply_rotations(yaw, pitch, no_update)
	local yaw_obj = self._yaw_obj or self._unit:get_object(Idstring("CameraYaw"))
	local pitch_obj = self._pitch_obj or self._unit:get_object(Idstring("CameraPitch"))
	local original_yaw_rot = yaw_obj:local_rotation()
	local new_yaw_rot = Rotation(180 + yaw, original_yaw_rot:pitch(), original_yaw_rot:roll())

	yaw_obj:set_local_rotation(new_yaw_rot)

	local original_pitch_rot = pitch_obj:local_rotation()
	local new_pitch_rot = Rotation(original_pitch_rot:yaw(), pitch, original_pitch_rot:roll())

	pitch_obj:set_local_rotation(new_pitch_rot)

	self._look_fwd = nil

	self._unit:set_moving()

	if Network:is_server() then
		self._last_sync_t = self._last_sync_t or 0
		local t = TimerManager:game():time()
		if t - self._last_sync_t >= 0.1 then
			local sync_yaw = 255 * (yaw + 180) / 360
			local sync_pitch = 255 * (pitch + 90) / 180
			managers.network:session():send_to_peers_synched("camera_yaw_pitch", self._unit, sync_yaw, sync_pitch)
			self._last_sync_t = t
		end
	else
		if not no_update then
			self._client_yaw = yaw
			self._client_pitch = pitch
		end
	end

	self._yaw = yaw
	self._pitch = pitch
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