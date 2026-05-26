--Sora wuz here

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


--RedFlame's Rotating Cams
local tmp_vec = Vector3()

local tmp_rot = Rotation()
local tmp_rot2 = Rotation()

local idstr_camera_lens = Idstring("CameraLens")
local idstr_camera_yaw = Idstring("CameraYaw")
local idstr_camera_pitch = Idstring("CameraPitch")

local function angular_difference(start_yaw, end_yaw, start_pitch, end_pitch)
	local yaw_diff = end_yaw - start_yaw
	local pitch_diff = end_pitch - start_pitch
	return math.sqrt(yaw_diff * yaw_diff + pitch_diff * pitch_diff)
end

SecurityCamera._stall_time = {1.5, 2.5}
SecurityCamera._turn_rate = 24 -- degrees/s

Hooks:PostHook(SecurityCamera, "init", "camerarot_init", function(self)
	self._look_obj = self._unit:get_object(idstr_camera_lens)
	self._yaw_obj = self._unit:get_object(idstr_camera_yaw)
	self._pitch_obj = self._unit:get_object(idstr_camera_pitch)

	if self._yaw_obj and self._pitch_obj then
		self._yaw = 0
		self._pitch = 0

		self._original_yaw = 0
		self._original_pitch = 0

		self._max_yaw = 60
		self._max_pitch = 30
	end
end)

Hooks:PostHook(SecurityCamera, "set_detection_enabled", "camerarot_set_detection_enabled", function(self, state)
	self._detection_enabled = state

	if not state then
		-- vanilla code nils these on disable
		self._look_obj = self._unit:get_object(idstr_camera_lens)
		self._yaw_obj = self._unit:get_object(idstr_camera_yaw)
		self._pitch_obj = self._unit:get_object(idstr_camera_pitch)

		self:set_target_attention(nil)
		return
	end

	if not self._yaw_obj or not self._pitch_obj then
		return
	end

	self._turn_direction = math.random(2) == 1 and 1 or -1
	self:set_target_yaw(self._max_yaw * self._turn_direction)
end)

local update_orig = Hooks:GetFunction(SecurityCamera, "update")
Hooks:OverrideFunction(SecurityCamera, "update", function (self, unit, t, dt, ...)
	self:_update_camera_rotation(unit, t, dt)

	if Network:is_server() and not self._detection_enabled then -- vanilla code can crash otherwise
		return
	end

	return update_orig(self, unit, t, dt, ...)
end)

function SecurityCamera:_update_camera_rotation(unit, t, dt)
	if self._stalled_until then
		if t > self._stalled_until then
			self._stalled_until = nil

			local new_target_yaw = self._max_yaw * self._turn_direction
			if math.abs(self._yaw - new_target_yaw) < 5 then
				self._turn_direction = -self._turn_direction
				new_target_yaw = -new_target_yaw
			end

			self:set_target_yaw(new_target_yaw)
		end
		return
	end

	local attention = self._target_attention
	local target_pos = attention and (attention.handler and attention.handler:get_detection_m_pos() or attention.pos)

	local target_yaw, target_pitch
	if target_pos then
		target_yaw, target_pitch = self:_get_local_yaw_pitch_to_position(target_pos)
	elseif self._target_yaw then
		target_yaw = self._target_yaw
		target_pitch = self._original_pitch
	else
		return
	end

	local angle_diff = angular_difference(self._yaw, target_yaw, self._pitch, target_pitch)
	local lerp_t = math.min((self._turn_rate * dt) / angle_diff, 1)

	mrotation.set_yaw_pitch_roll(tmp_rot, self._yaw, self._pitch, 0)
	mrotation.set_yaw_pitch_roll(tmp_rot2, target_yaw, target_pitch, 0)

	mrotation.slerp(tmp_rot, tmp_rot, tmp_rot2, lerp_t)

	self:apply_rotations(tmp_rot:yaw(), tmp_rot:pitch(), true)

	if lerp_t < 1 then
		return
	end

	if attention and attention.pos then
		self:set_target_attention(nil)

		if Network:is_client() then
			self:chk_update_state()
		end
	elseif self._target_yaw then
		self:stop_current_rotation(true)

		if Network:is_server() then
			self._turn_direction = -self._turn_direction
		else
			self:chk_update_state()
		end
	end
end

function SecurityCamera:_get_local_yaw_pitch_to_position(target_pos)
	self._unit:m_rotation(tmp_rot)
	self._look_obj:m_position(tmp_vec)

	mrotation.invert(tmp_rot)

	mvector3.direction(tmp_vec, tmp_vec, target_pos)
	mvector3.rotate_with(tmp_vec, tmp_rot) -- => local space
	mrotation.set_look_at(tmp_rot2, tmp_vec, math.UP)

	local target_yaw = tmp_rot2:yaw() - 180
	if target_yaw < -180 then
		target_yaw = target_yaw + 360
	end

	local target_pitch = tmp_rot2:pitch()

	target_yaw = math.clamp(target_yaw, -self._max_yaw, self._max_yaw)
	target_pitch = math.clamp(target_pitch, -self._max_pitch, self._max_pitch)

	return target_yaw, target_pitch
end

function SecurityCamera:set_target_yaw(yaw, duration)
	self._target_yaw = yaw

	local angle_diff = angular_difference(self._yaw, yaw, self._pitch, self._original_pitch)
	if duration then -- client catchup
		self._turn_rate = angle_diff / duration
	end

	if Network:is_server() then
		local sync_yaw = math.round(255 * ((self._target_yaw + 180) / 360))

		managers.network:session():send_to_peers_synched("sync_camera_rotation", self._unit, sync_yaw, duration or angle_diff / self._turn_rate)
	else
		self:chk_update_state()
	end
end

function SecurityCamera:set_target_attention(attention)
	local old_attention = self._target_attention
	if not attention and not old_attention then
		return
	end

	self:_remove_attention_destroy_listener(old_attention)

	self:stop_current_rotation(not attention)

	if Network:is_server() then
		if attention then
			if attention.handler then
				local attention_unit = attention.handler:unit()
				if attention_unit:id() ~= -1 then
					managers.network:session():send_to_peers_synched("camera_set_attention", self._unit, attention_unit)
				else
					managers.network:session():send_to_peers_synched("camera_set_attention_pos", self._unit, attention.handler:get_detection_m_pos())
				end

				self:_add_attention_destroy_listener(attention)
			else
				managers.network:session():send_to_peers_synched("camera_set_attention_pos", self._unit, attention.pos)
			end
		else
			if old_attention and self._unit:id() ~= -1 then
				managers.network:session():send_to_peers_synched("camera_set_attention", self._unit, nil)
			end
		end
	else
		if attention and attention.handler then
			self:_add_attention_destroy_listener(attention)
		end

		self:chk_update_state()
	end

	self._target_attention = attention
end

function SecurityCamera:_add_attention_destroy_listener(attention)
	if not attention or not attention.unit then
		return
	end

	local listener_class = attention.unit:base() and attention.unit:base().add_destroy_listener and attention.unit:base()
		or attention.unit:unit_data() and attention.unit:unit_data().add_destroy_listener and attention.unit:unit_data()

	if not listener_class then
		return
	end

	local listener_key = "SecurityCamera" .. tostring(self._unit:key())
	attention.destroy_listener_key = listener_key

	listener_class:add_destroy_listener(listener_key, callback(self, self, "attention_unit_destroy_clbk"))
end

function SecurityCamera:_remove_attention_destroy_listener(attention)
	if not attention or not attention.destroy_listener_key then
		return
	end

	if not alive(attention.unit) then
		attention.destroy_listener_key = nil
		return
	end

	local listener_class = attention.unit:base() and attention.unit:base().remove_destroy_listener and attention.unit:base()
		or attention.unit:unit_data() and attention.unit:unit_data().remove_destroy_listener and attention.unit:unit_data()

	if listener_class then
		listener_class:remove_destroy_listener(attention.destroy_listener_key)
	end

	attention.destroy_listener_key = nil
end

function SecurityCamera:attention_unit_destroy_clbk(unit)
	self:set_target_attention(nil)
end

function SecurityCamera:clbk_sync_attention(attention)
	if not alive(self._unit) or self._unit:id() == -1 then
		return
	end

	if self._target_attention ~= attention then
		return
	end

	local attention_unit = attention.handler:unit()
	if attention_unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("camera_set_attention", self._unit, attention_unit)
	else
		managers.network:session():send_to_peers_synched("camera_set_attention_pos", self._unit, attention.handler:get_detection_m_pos())
	end
end

local set_update_enabled_orig = Hooks:GetFunction(SecurityCamera, "set_update_enabled")
function SecurityCamera:chk_update_state(state, ...)
	if self._destroyed or self._destroying then
		return set_update_enabled_orig(self, false, ...)
	end

	local needs_update = state
		or self._detection_enabled
		or self._target_yaw
		or self._target_attention
		or self._stalled_until
		or self._tape_loop_restarting_t

	return set_update_enabled_orig(self, needs_update, ...)
end

Hooks:OverrideFunction(SecurityCamera, "set_update_enabled", SecurityCamera.chk_update_state)

function SecurityCamera:stop_current_rotation(finished)
	self._target_yaw = nil
	self._turn_rate = nil

	if Network:is_server() then
		self._stalled_until = finished and TimerManager:game():time() + math.rand(self._stall_time[1], self._stall_time[2]) or nil
	end
end

Hooks:OverrideFunction(SecurityCamera, "apply_rotations", function (self, yaw, pitch, no_sync)
	if yaw and self._yaw ~= yaw then
		local yaw_obj = self._yaw_obj or self._unit:get_object(idstr_camera_yaw)
		local original_yaw_rot = yaw_obj:local_rotation()
		local new_yaw_rot = Rotation(180 + yaw, original_yaw_rot:pitch(), original_yaw_rot:roll())

		yaw_obj:set_local_rotation(new_yaw_rot)

		self._yaw = yaw
	end

	if pitch and self._pitch ~= pitch then
		local pitch_obj = self._pitch_obj or self._unit:get_object(idstr_camera_pitch)
		local original_pitch_rot = pitch_obj:local_rotation()
		local new_pitch_rot = Rotation(original_pitch_rot:yaw(), pitch, original_pitch_rot:roll())

		pitch_obj:set_local_rotation(new_pitch_rot)

		self._pitch = pitch
	end

	self._look_fwd = nil

	self._unit:set_moving()

	if not no_sync then
		self._original_yaw = yaw
		self._original_pitch = pitch

		if Network:is_server() then
			local sync_yaw = 255 * (yaw + 180) / 360
			local sync_pitch = 255 * (pitch + 90) / 180

			managers.network:session():send_to_peers_synched("camera_yaw_pitch", self._unit, sync_yaw, sync_pitch)
		end
	end
end)

Hooks:PostHook(SecurityCamera, "_create_detected_attention_object_data", "camerarot_create_detected_attention_object_data", function(self)
	local new_entry = Hooks:GetReturn()
	new_entry.noticable = true
	new_entry.last_seen_pos = mvector3.copy(new_entry.handler:get_detection_m_pos())
end)

-- full function override is unfortunately necessary
Hooks:OverrideFunction(SecurityCamera, "_upd_detect_attention_objects", function(self, t)
	local detected_obj = self._detected_attention_objects
	local my_pos = self._pos
	local my_fwd = self._look_fwd
	local det_delay = self._detection_delay

	local highest_obj = nil
	local highest_reaction = -1
	local highest_progress = -1

	for u_key, attention_info in pairs(detected_obj) do
		if t >= attention_info.next_verify_t then
			attention_info.next_verify_t = t + (attention_info.identified and attention_info.verified and attention_info.settings.verification_interval * 1.3 or attention_info.settings.verification_interval * 0.3)

			if not attention_info.identified then
				local noticable = nil
				local angle, dis_multiplier = self:_detection_angle_and_dis_chk(my_pos, my_fwd, attention_info.handler, attention_info.settings, attention_info.handler:get_detection_m_pos())
				if angle then
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local vis_ray = self._unit:raycast("ray", my_pos, attention_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

					if not vis_ray or vis_ray.unit:key() == u_key then
						noticable = true
					end
				end

				attention_info.noticable = noticable

				local delta_prog = nil
				local dt = t - attention_info.prev_notice_chk_t
				if noticable then
					-- Store last seen position for camera tracking
					mvector3.set(attention_info.last_seen_pos, attention_info.handler:get_detection_m_pos())

					if angle == -1 then
						delta_prog = 1
					else
						local min_delay = det_delay[1]
						local max_delay = det_delay[2]
						local angle_mul_mod = 0.15 * math.min(angle / self._cone_angle, 1)
						local dis_mul_mod = 0.85 * dis_multiplier
						local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

						if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
							notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
						end

						local notice_delay_modified = math.lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod + angle_mul_mod)
						delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
					end
				else
					delta_prog = det_delay[2] > 0 and -dt / det_delay[2] or -1
				end

				attention_info.notice_progress = attention_info.notice_progress + delta_prog

				if attention_info.notice_progress > 1 then
					attention_info.notice_progress = nil
					attention_info.prev_notice_chk_t = nil
					attention_info.identified = true
					attention_info.release_t = t + attention_info.settings.release_delay
					attention_info.identified_t = t
					noticable = true

					if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
						managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, true)
					end
				elseif attention_info.notice_progress < 0 then
					self:_destroy_detected_attention_object_data(attention_info)

					noticable = false
				else
					noticable = attention_info.notice_progress
					attention_info.prev_notice_chk_t = t

					if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
						managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, noticable)
					end
				end

				if noticable ~= false and attention_info.settings.notice_clbk then
					attention_info.settings.notice_clbk(self._unit, noticable)
				end
			end

			if attention_info.identified then
				attention_info.nearly_visible = nil

				local verified, vis_ray = nil
				local attention_pos = attention_info.handler:get_detection_m_pos()
				local dis = mvector3.distance(my_pos, attention_info.m_pos)
				if dis < self._range * 1.2 then
					local detect_pos = nil
					if attention_info.is_husk_player and attention_info.unit:anim_data().crouch then
						detect_pos = self._tmp_vec1

						mvector3.set(detect_pos, attention_info.m_pos)
						mvector3.add(detect_pos, tweak_data.player.stances.default.crouched.head.translation)
					else
						detect_pos = attention_pos
					end

					local in_FOV = self:_detection_angle_chk(my_pos, my_fwd, detect_pos, 0.8)
					if in_FOV then
						vis_ray = self._unit:raycast("ray", my_pos, detect_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

						if not vis_ray or vis_ray.unit:key() == u_key then
							verified = true
						end
					end

					attention_info.verified = verified
				end

				attention_info.dis = dis

				if verified then
					attention_info.release_t = nil
					attention_info.verified_t = t

					mvector3.set(attention_info.verified_pos, attention_pos)

					attention_info.last_verified_pos = mvector3.copy(attention_pos)
					attention_info.verified_dis = dis
				elseif attention_info.release_t and attention_info.release_t < t then
					self:_destroy_detected_attention_object_data(attention_info)
				else
					attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
				end
			end
		end

		-- Find highest priority attention object
		local reaction = attention_info.reaction or 0
		local progress = attention_info.notice_progress or 0
		if reaction > highest_reaction or (reaction == highest_reaction and progress > highest_progress) then
			highest_reaction = reaction
			highest_progress = progress
			highest_obj = attention_info
		end
	end

	if highest_obj ~= self._target_attention then
		self:set_target_attention(highest_obj)
	elseif self._target_attention and self._target_attention.last_seen_pos and not self._target_attention.noticable then
		self:set_target_attention({ pos = self._target_attention.last_seen_pos })
	end
end)

Hooks:PreHook(SecurityCamera, "generate_cooldown", "camerarot_generate_cooldown", function(self)
	self:set_target_attention(nil)
	self:stop_current_rotation()
end)

Hooks:PostHook(SecurityCamera, "destroy", "camerarot_destroy", function(self)
	self:_remove_attention_destroy_listener(self._target_attention)
	self:chk_update_state()
end)

Hooks:PostHook(SecurityCamera, "save", "camerarot_save", function(self, data)
	if self._target_yaw then
		data.target_yaw = self._target_yaw
	end

	if self._target_attention then
		if self._target_attention.pos then
			data.attention_pos = self._target_attention.pos
		elseif self._target_attention.handler:unit():id() ~= -1 then
			managers.enemy:add_delayed_clbk("clbk_sync_attention" .. tostring(self._unit:key()), callback(self, self, "clbk_sync_attention", self._target_attention), TimerManager:game():time() + 0.1)
		else
			data.attention_pos = self._target_attention.handler:get_detection_m_pos()
		end
	end

	data.original_yaw = self._original_yaw
	data.original_pitch = self._original_pitch
end)

Hooks:PostHook(SecurityCamera, "load", "camerarot_load", function(self, data)
	if data.target_yaw then
		self:set_target_yaw(data.target_yaw)
	end

	if data.attention_pos then
		self:set_target_attention({ pos = data.attention_pos })
	end

	if data.original_yaw and data.original_pitch then
		self._original_yaw = data.original_yaw
		self._original_pitch = data.original_pitch
	end
end)