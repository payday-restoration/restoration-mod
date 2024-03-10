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

function SecurityCamera:update(unit, t, dt)
	self:_update_tape_loop_restarting(unit, t, dt)

	if not Network:is_server() then
		return
	end

	if managers.groupai:state():is_ecm_jammer_active("camera") or self._tape_loop_expired_clbk_id or self._tape_loop_restarting_t or self._call_police_clbk_id then
		self:_destroy_all_detected_attention_object_data()
		self:_stop_all_sounds()
	else
		self:_upd_detection(t)
	end

	self:_upd_sound(unit, t)
	
    local current_yaw = self._yaw
    local current_pitch = self._pitch
    local max_yaw_positive = 60
    local max_yaw_negative = -60

    self:_init_dynamic_yaw()

    if self._current_yaw_action == 1 then
        if math.floor(self._yaw) == max_yaw_positive then
            self._current_yaw_action = 2
        else
            self:_increase_yaw()
        end
    end

    if self._current_yaw_action == 2 then
        if math.floor(self._yaw) == max_yaw_negative then
            self._current_yaw_action = 1
        else
            self:_decrease_yaw()
        end
    end	
end

function SecurityCamera:_init_dynamic_yaw()
    local max_yaw_negative = -60
    local current_pitch = self._pitch

    if not self._initialized_yaw then
        self._initialized_yaw = true
        self:apply_rotations(max_yaw_negative, current_pitch)
    end
end

function SecurityCamera:_increase_yaw()
    local max_yaw_positive = 60
    local current_pitch = self._pitch

    if self._yaw <= max_yaw_positive then
        local new_yaw = self._yaw + 0.1
        self:apply_rotations(new_yaw, current_pitch)
    end
end

function SecurityCamera:_decrease_yaw()
    local max_yaw_negative = -60
    local current_pitch = self._pitch

    if self._yaw >= max_yaw_negative then
        local new_yaw = self._yaw - 0.1
        self:apply_rotations(new_yaw, current_pitch)
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