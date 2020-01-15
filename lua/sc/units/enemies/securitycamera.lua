if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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

			managers.groupai:state()._guard_detection_mul = managers.groupai:state()._guard_detection_mul + 0.05
			managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction - 0.1			

			self:_destroy_all_detected_attention_object_data()
			self:set_detection_enabled(false, nil, nil)
		end

		if self._suspicion_sound then
			self._suspicion_sound = nil

			self._unit:sound_source():post_event("camera_suspicious_signal_stop")
		end

		self._alarm_sound = self._unit:sound_source():post_event("camera_alarm_signal")
	end	
	
	function SecurityCamera:clbk_call_the_police()
		managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, "called")
		
		self:_stop_all_sounds()
				
		self._call_police_clbk_id = nil
	end	

end