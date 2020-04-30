--[[local gen_cooldown = SecurityCamera.generate_cooldown
function SecurityCamera:generate_cooldown(amount)
	if managers.job and (managers.job:current_job_id() == "safehouse" or managers.job:current_job_id() == "custom_safehouse" or managers.job:current_job_id() == "chill" or managers.job:current_job_id() == "chill_combat") then
		--Smashing your own security cameras isn't the best idea
	else
		managers.hint:show_hint("destroyed_security_camera")
	end
	return gen_cooldown(self, amount)
end]]--
--rest in peiece maybe we can do something cool with cams one day

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
		managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.2
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
	managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, nil)
	
	self:_stop_all_sounds()
			
	self._call_police_clbk_id = nil
end	