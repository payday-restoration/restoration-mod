local mvec3_dis = mvector3.distance
local mvec3_dir = mvector3.direction
local mvec3_angle = mvector3.angle
local math_lerp = math.lerp
local math_clamp = math.clamp
local math_min = math.min
local tmp_vec1 = Vector3()
local REACT_SCARED = AIAttentionObject.REACT_SCARED
local REACT_SUSPICIOUS = AIAttentionObject.REACT_SUSPICIOUS

HuskCopBrain._NET_EVENTS = {
    surrender_cop_tied = 3,
    surrender_civilian_tied = 5,
    weapon_laser_off = 2,
    surrender_civilian_untied = 6,
    surrender_cop_untied = 4,
    weapon_laser_on = 1
}

function HuskCopBrain:post_init()
	local is_ally = self._unit:in_slot(16)
	local is_cool = self._unit:movement():cool()
	self._is_ally = is_ally

	self._alert_listen_key = "HuskCopBrain" .. tostring(self._unit:key())

	local alert_listen_filter, alert_types = nil

	if is_ally then
		alert_listen_filter = managers.groupai:state():get_unit_type_filter("combatant")
		alert_types = {
			explosion = true,
			fire = true,
			aggression = true,
			bullet = true
		}

		if is_cool then
			self._detect_local_player = true
		end
	else
		if not managers.enemy:is_civilian(self._unit) then
			self._enemy_slotmask = managers.slot:get_mask("criminals")
		end

		if is_cool then
			self._detect_local_player = true

			alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminals_enemies_civilians")
			alert_types = {
				vo_distress = true,
				fire = true,
				bullet = true,
				vo_intimidate = true,
				explosion = true,
				footstep = true,
				aggression = true,
				vo_cbt = true
			}
		else
			alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminal")
			alert_types = {
				explosion = true,
				fire = true,
				aggression = true,
				bullet = true
			}
		end
	end

	managers.groupai:state():add_alert_listener(self._alert_listen_key, callback(self, self, "on_alert"), alert_listen_filter, alert_types, self._unit:movement():m_head_pos())

	self._last_alert_t = 0

	self._unit:character_damage():add_listener("HuskCopBrain_death" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "clbk_death"))

	self._post_init_complete = true
	self._surrendered = false

	local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
	local SO_access_str = char_tweak.access
	self._SO_access_str = SO_access_str
	self._SO_access = managers.navigation:convert_access_flag(SO_access_str)
	self._detection = char_tweak.detection.ntl
	self._visibility_slotmask = managers.slot:get_mask("AI_visibility")
	self._detected_player_att_data = {}
end

function HuskCopBrain:sync_surrender(surrendered)
	if not self._converted then
		if surrendered then
			self._unit:base():set_slot(self._unit, 22)
		else
			self._unit:base():set_slot(self._unit, 12)
		end
	end

	self._surrendered = surrendered
end

function HuskCopBrain:sync_converted()
	self._converted = true

	if self._alert_listen_key then
		managers.groupai:state():remove_alert_listener(self._alert_listen_key)
	else
		self._alert_listen_key = "HuskCopBrain" .. tostring(self._unit:key())
	end

	local alert_listen_filter = managers.groupai:state():get_unit_type_filter("combatant")
	local alert_types = {
		explosion = true,
		fire = true,
		aggression = true,
		bullet = true
	}

	managers.groupai:state():add_alert_listener(self._alert_listen_key, callback(self, self, "on_alert"), alert_listen_filter, alert_types, self._unit:movement():m_head_pos())

	local SO_access_str = tweak_data.character.russian.access
	self._SO_access_str = SO_access_str
	self._SO_access = managers.navigation:convert_access_flag(SO_access_str)
	self._enemy_slotmask = managers.slot:get_mask("enemies")
end

function HuskCopBrain:update(unit, t, dt)
	if not self._post_init_complete then
		return
	end

	if self._detect_local_player then
		local attention_info = self:update_local_player_detection(t)

		if attention_info and attention_info.identified then
			if attention_info.reaction == REACT_SUSPICIOUS then
				self:update_local_player_suspicion(t, attention_info)
			elseif attention_info.reaction < REACT_SUSPICIOUS then
				if attention_info.verified then
					if not self._seeing_local_player_peaceful_verified then
						self:_send_client_detection_net_event(CopBrain._NET_EVENTS.detected_client_peaceful_verified)

						self._seeing_local_player_peaceful = true
						self._seeing_local_player_peaceful_verified = true
					end
				elseif self._seeing_local_player_peaceful_verified then
					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.client_no_longer_verified)

					self._seeing_local_player_peaceful_verified = nil
				elseif not self._seeing_local_player_peaceful then
					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.detected_client_peaceful)

					self._seeing_local_player_peaceful = true
				end
			end
		elseif self._seeing_local_player_peaceful or self._seeing_local_player_peaceful_verified then
			self:_send_client_detection_net_event(CopBrain._NET_EVENTS.stopped_seeing_client_peaceful)

			self._seeing_local_player_peaceful = nil
			self._seeing_local_player_peaceful_verified = nil
		end

		self:update_local_player_suspicion_decay(t)
	end

	if self._add_laser_t ~= nil then
		self._add_laser_t = self._add_laser_t - dt

		if self._add_laser_t < 0 then
			self:enable_weapon_laser()

			self._add_laser_t = nil
		end
	end
end

function HuskCopBrain:on_team_set(team_data)
	self._team = team_data

	if self._unit:movement():cool() then
		self._detect_local_player = true
	end
end

function HuskCopBrain:on_cool_state_changed(state)
	if self._is_ally then
		self._detect_local_player = state

		return
	end

	if self._alert_listen_key then
		managers.groupai:state():remove_alert_listener(self._alert_listen_key)
	else
		self._alert_listen_key = "HuskCopBrain" .. tostring(self._unit:key())
	end

	local alert_listen_filter, alert_types = nil

	if state then
		alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminals_enemies_civilians")
		alert_types = {
			vo_distress = true,
			fire = true,
			bullet = true,
			vo_intimidate = true,
			explosion = true,
			footstep = true,
			aggression = true,
			vo_cbt = true
		}
	else
		alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminal")
		alert_types = {
			explosion = true,
			fire = true,
			aggression = true,
			bullet = true
		}

		if self._detected_player_att_data then
			self:terminate_all_suspicion()
		end
	end

	managers.groupai:state():add_alert_listener(self._alert_listen_key, callback(self, self, "on_alert"), alert_listen_filter, alert_types, self._unit:movement():m_head_pos())

	self._detect_local_player = state
end

function HuskCopBrain:terminate_all_suspicion()
	for u_key, u_data in pairs(self._detected_player_att_data) do
		if u_data.uncover_progress then
			u_data.uncover_progress = nil
			u_data.last_suspicion_t = nil

			u_data.unit:movement():on_suspicion(self._unit, false, true)
		end
	end
end

function HuskCopBrain:update_local_player_detection(t)
	local player = managers.player:player_unit()

	if not player then
		if #self._detected_player_att_data > 0 then
			self:_destroy_all_detected_attention_object_data()
		end

		return
	end

	local unit = self._unit
	local team = self._team
	local detection = self._detection
	local player_key = player:key()
	local my_pos = unit:movement():m_head_pos()
	local my_head_fwd = unit:movement():m_head_rot():z()
	local my_tracker = unit:movement():nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local my_access = self._SO_access
	local visibility_slotmask = self._visibility_slotmask
	local all_attention_objects = managers.groupai:state():get_AI_attention_objects_by_filter(self._SO_access_str, team)
	local player_attention_data = nil

	if not self._detected_player_att_data[player_key] then
		local attention_info = all_attention_objects[player_key]

		if attention_info then
			if not attention_info.nav_tracker or chk_vis_func(my_tracker, attention_info.nav_tracker) then
				local settings = attention_info.handler:get_attention(my_access, nil, nil, team)

				if settings then
					local acquired, angle, dis_multiplier = nil
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)

					if detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
						angle = -1
						dis_multiplier = 0
					else
						local dis_mul = nil
						local max_dis = detection.dis_max

						if settings.max_range then
							max_dis = math_min(max_dis, settings.max_range)
						end

						if settings.detection and settings.detection.range_mul then
							max_dis = max_dis * settings.detection.range_mul
						end

						dis_mul = dis / max_dis

						if dis_mul < 1 then
							if settings.notice_requires_FOV then
								local vec_angle = mvec3_angle(my_head_fwd, tmp_vec1)

								if not detection.use_uncover_range and vec_angle < 55 and settings.uncover_range and dis < settings.uncover_range then
									angle = -1
									dis_multiplier = 0
								else
									local angle_max = math_lerp(180, detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
									angle_multiplier = vec_angle / angle_max

									if angle_multiplier < 1 then
										angle = vec_angle
										dis_multiplier = dis_mul
									end
								end
							else
								angle = 0
								dis_multiplier = dis_mul
							end
						end
					end

					if angle then
						local vis_ray = unit:raycast("ray", my_pos, attention_pos, "slot_mask", visibility_slotmask, "ray_type", "ai_vision")

						if not vis_ray or vis_ray.unit:key() == player_key then
							local visible_data = {
								visible_angle = angle,
								visible_dis_multiplier = dis_multiplier,
								visible_ray = vis_ray
							}

							self._detected_player_att_data[player_key] = self:_create_detected_player_data(t, player_key, attention_info, settings, visible_data)
						end
					end
				end
			end
		end
	end

	for u_key, attention_info in pairs(self._detected_player_att_data) do
		local settings = attention_info.settings

		if not attention_info.identified then
			local noticable, angle, dis_multiplier = nil

			if attention_info.visible_in_this_instance then
				noticable = true
				angle = attention_info.visible_angle
				dis_multiplier = attention_info.visible_dis_multiplier
			else
				local attention_pos = attention_info.m_head_pos
				local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)

				if detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
					angle = -1
					dis_multiplier = 0
				else
					local dis_mul = nil
					local max_dis = detection.dis_max

					if settings.max_range then
						max_dis = math_min(max_dis, settings.max_range)
					end

					if settings.detection and settings.detection.range_mul then
						max_dis = max_dis * settings.detection.range_mul
					end

					dis_mul = dis / max_dis

					if dis_mul < 1 then
						if settings.notice_requires_FOV then
							local vec_angle = mvec3_angle(my_head_fwd, tmp_vec1)

							if not detection.use_uncover_range and vec_angle < 55 and settings.uncover_range and dis < settings.uncover_range then
								angle = -1
								dis_multiplier = 0
							else
								local angle_max = math_lerp(180, detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
								angle_multiplier = vec_angle / angle_max

								if angle_multiplier < 1 then
									angle = vec_angle
									dis_multiplier = dis_mul
								end
							end
						else
							angle = 0
							dis_multiplier = dis_mul
						end
					end
				end

				if angle then
					local vis_ray = attention_info.visible_ray or unit:raycast("ray", my_pos, attention_pos, "slot_mask", visibility_slotmask, "ray_type", "ai_vision")

					if not vis_ray or vis_ray.unit:key() == u_key then
						noticable = true
						attention_info.visible_in_this_instance = true
					end

					if not attention_info.visible_ray then
						attention_info.visible_ray = vis_ray
					end
				end
			end

			local delta_prog = nil
			local dt = t - attention_info.prev_notice_chk_t

			if noticable then
				if angle == -1 then
					delta_prog = 1
				else
					local min_delay = detection.delay[1]
					local max_delay = detection.delay[2]
					local angle_mul_mod = 0.25 * math_min(angle / detection.angle_max, 1)
					local dis_mul_mod = 0.75 * dis_multiplier
					local notice_delay_mul = settings.notice_delay_mul or 1

					if settings.detection and settings.detection.delay_mul then
						notice_delay_mul = notice_delay_mul * settings.detection.delay_mul
					end

					local notice_delay_modified = math_lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod + angle_mul_mod)
					delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
				end
			else
				delta_prog = dt * -0.125
			end

			attention_info.notice_progress = attention_info.notice_progress + delta_prog

			if attention_info.notice_progress > 1 then
				attention_info.notice_progress = nil
				attention_info.prev_notice_chk_t = nil
				attention_info.identified = true
				attention_info.release_t = t + settings.release_delay
				attention_info.identified_t = t
				noticable = true

				if REACT_SCARED <= settings.reaction then
					managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, unit, true)
					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.detected_client)

					self._detect_local_player = nil
				end
			elseif attention_info.notice_progress < 0 then
				self:_destroy_detected_attention_object_data(attention_info)

				noticable = false

				if self._seeing_local_player then
					self._seeing_local_player = nil

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.stopped_seeing_client)
				end
			else
				noticable = attention_info.notice_progress
				attention_info.prev_notice_chk_t = t

				if REACT_SCARED <= settings.reaction then
					managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, unit, noticable)

					if not self._seeing_local_player then
						self._seeing_local_player = true

						self:_send_client_detection_net_event(CopBrain._NET_EVENTS.seeing_client)
					end
				end
			end

			if noticable ~= false and settings.notice_clbk then
				settings.notice_clbk(unit, noticable, true)
			end
		end

		if attention_info.identified then
			local is_ignored = attention_info.unit:movement():is_cuffed()

			if attention_info.unit:movement() and attention_info.unit:movement().is_cuffed then
				is_ignored = attention_info.unit:movement():is_cuffed()
			end

			if is_ignored then
				self:_destroy_detected_attention_object_data(attention_info)
			else
				local verified = nil
				local attention_pos = attention_info.m_head_pos
				local dis = mvec3_dis(my_pos, attention_pos)
				local max_dis = detection.dis_max

				if dis < max_dis * 1.2 then
					if settings.max_range then
						max_dis = math_min(max_dis, settings.max_range)
					end

					if settings.detection and settings.detection.range_mul then
						max_dis = max_dis * settings.detection.range_mul
					end

					if dis < max_dis * 1.2 then
						local in_FOV = not settings.notice_requires_FOV or self._enemy_slotmask and attention_info.unit:in_slot(self._enemy_slotmask)

						if not in_FOV then
							mvec3_dir(tmp_vec1, my_pos, attention_pos)

							local angle = mvec3_angle(my_head_fwd, tmp_vec1)
							local angle_max = math_lerp(180, detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
							local strictness = 0.8

							if angle_max > angle * strictness then
								in_FOV = true
							end
						end

						if in_FOV then
							if attention_info.visible_in_this_instance then
								verified = true
							else
								local vis_ray = attention_info.visible_ray or unit:raycast("ray", my_pos, attention_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

								if not vis_ray or vis_ray.unit:key() == u_key then
									verified = true
								end
							end
						end
					end
				end

				attention_info.verified = verified
				attention_info.dis = dis

				if verified then
					attention_info.release_t = nil
				elseif attention_info.release_t and attention_info.release_t < t then
					self:_destroy_detected_attention_object_data(attention_info)
				else
					attention_info.release_t = attention_info.release_t or t + settings.release_delay
				end
			end
		end

		attention_info.visible_in_this_instance = nil
		attention_info.visible_angle = nil
		attention_info.visible_dis_multiplier = nil
		attention_info.visible_ray = nil

		player_attention_data = attention_info
	end

	return player_attention_data
end

function HuskCopBrain:_create_detected_player_data(t, u_key, attention_info, settings, visible_data)
	attention_info.handler:add_listener("detect_" .. tostring(self._unit:key()), callback(self, self, "on_detected_attention_obj_modified"))

	local att_unit = attention_info.unit
	local m_head_pos = attention_info.handler:get_detection_m_pos()
	local dis = mvec3_dis(self._unit:movement():m_head_pos(), m_head_pos)
	local new_entry = {
		notice_progress = 0,
		settings = settings,
		unit = attention_info.unit,
		u_key = u_key,
		handler = attention_info.handler,
		prev_notice_chk_t = t,
		dis = dis,
		m_head_pos = m_head_pos,
		reaction = settings.reaction
	}

	if visible_data then
		new_entry.visible_in_this_instance = true
		new_entry.visible_angle = visible_data.visible_angle
		new_entry.visible_dis_multiplier = visible_data.visible_dis_multiplier
		new_entry.visible_ray = visible_data.visible_ray
		visible_data = nil
	end

	return new_entry
end

function HuskCopBrain:update_local_player_suspicion(t, attention_info)
	local function _exit_func()
		attention_info.unit:movement():on_uncovered(self._unit)

		managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, true)
		self:_send_client_detection_net_event(CopBrain._NET_EVENTS.detected_suspected_client)

		self:terminate_all_suspicion()
		self._detect_local_player = nil
		self._suspecting_player = nil
	end

	local dis = attention_info.dis
	local susp_settings = attention_info.unit:base():suspicion_settings()

	if attention_info.verified and attention_info.settings.uncover_range and dis < math_min(attention_info.settings.max_range, attention_info.settings.uncover_range) * susp_settings.range_mul then
		attention_info.unit:movement():on_suspicion(self._unit, true, true)

		return _exit_func()
	elseif attention_info.verified and attention_info.settings.suspicion_range and dis < math_min(attention_info.settings.max_range, attention_info.settings.suspicion_range) * susp_settings.range_mul then
		if attention_info.last_suspicion_t then
			local dt = t - attention_info.last_suspicion_t
			local uncover_range = attention_info.settings.uncover_range or 0
			local range_max = attention_info.settings.suspicion_range - uncover_range
			range_max = range_max * susp_settings.range_mul
			local range_min = uncover_range * susp_settings.range_mul
			local mul = 1 - (dis - range_min) / range_max
			local progress = dt * mul * susp_settings.buildup_mul / attention_info.settings.suspicion_duration

			if attention_info.uncover_progress then
				attention_info.uncover_progress = attention_info.uncover_progress + progress
			else
				attention_info.uncover_progress = progress
			end

			if attention_info.uncover_progress < 1 then
				attention_info.unit:movement():on_suspicion(self._unit, attention_info.uncover_progress, true)
				managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, attention_info.uncover_progress)

				if not self._suspecting_player then
					self._suspecting_player = true
					self._suspecting_player_verified = true

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.suspecting_client_verified)
				end
			else
				attention_info.unit:movement():on_suspicion(self._unit, true, true)

				return _exit_func()
			end
		else
			attention_info.uncover_progress = 0
		end

		attention_info.last_suspicion_t = t
	elseif attention_info.uncover_progress then
		if attention_info.last_suspicion_t then
			local dt = t - attention_info.last_suspicion_t
			attention_info.uncover_progress = attention_info.uncover_progress - dt

			if attention_info.uncover_progress <= 0 then
				attention_info.uncover_progress = nil
				attention_info.last_suspicion_t = nil

				attention_info.unit:movement():on_suspicion(self._unit, false, true)

				if self._suspecting_player then
					self._suspecting_player = nil

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.stopped_suspecting_client)
				end
			else
				attention_info.unit:movement():on_suspicion(self._unit, attention_info.uncover_progress, true)

				if not self._suspecting_player then
					self._suspecting_player = true

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.suspecting_client)
				end

				if self._suspecting_player_verified and not attention_info.verified then
					self._suspecting_player_verified = nil

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.client_no_longer_verified)
				end
			end
		else
			attention_info.last_suspicion_t = t
		end
	end
end

function HuskCopBrain:update_local_player_suspicion_decay(t)
	for _, u_data in pairs(self._detected_player_att_data) do
		if u_data.uncover_progress and u_data.last_suspicion_t ~= t then
			local dt = t - u_data.last_suspicion_t
			u_data.uncover_progress = u_data.uncover_progress - dt

			if u_data.uncover_progress <= 0 then
				u_data.uncover_progress = nil
				u_data.last_suspicion_t = nil

				u_data.unit:movement():on_suspicion(self._unit, false, true)

				if self._suspecting_player then
					self._suspecting_player = nil

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.stopped_suspecting_client)
				end
			else
				u_data.unit:movement():on_suspicion(self._unit, u_data.uncover_progress, true)

				u_data.last_suspicion_t = t

				if not self._suspecting_player then
					self._suspecting_player = true

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.suspecting_client)
				end

				if self._suspecting_player_verified and not u_data.verified then
					self._suspecting_player_verified = nil

					self:_send_client_detection_net_event(CopBrain._NET_EVENTS.client_no_longer_verified)
				end
			end
		end
	end
end

function HuskCopBrain:on_detected_attention_obj_modified(modified_u_key)
	local attention_info = self._detected_player_att_data[modified_u_key]

	if not attention_info then
		return
	end

	local new_settings = attention_info.handler:get_attention(self._SO_access, nil, nil, self._team)
	local old_settings = attention_info.settings

	if new_settings == old_settings then
		return
	end

	local old_notice_clbk = not attention_info.identified and old_settings.notice_clbk

	if new_settings then
		local switch_from_suspicious = REACT_SCARED <= new_settings.reaction and attention_info.reaction <= REACT_SUSPICIOUS
		attention_info.settings = new_settings

		if switch_from_suspicious then
			attention_info.next_verify_t = 0
			attention_info.prev_notice_chk_t = TimerManager:game():time()

			if attention_info.identified then
				attention_info.identified = false
				attention_info.notice_progress = attention_info.uncover_progress or 0
				attention_info.verified = nil
			else
				attention_info.notice_progress = 0
			end

			if self._suspecting_player then
				self._suspecting_player = nil

				self:_send_client_detection_net_event(CopBrain._NET_EVENTS.stopped_suspecting_client)
			end
		end

		attention_info.uncover_progress = nil
		attention_info.reaction = new_settings.reaction
	else
		self:_destroy_detected_attention_object_data(attention_info)
	end

	if old_notice_clbk then
		if not new_settings or not new_settings.notice_clbk then
			old_notice_clbk(self._unit, false, true)
		end
	end

	if REACT_SCARED <= old_settings.reaction then
		if not new_settings or REACT_SCARED > new_settings.reaction then
			managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, nil)
		end
	end
end

function HuskCopBrain:_destroy_detected_attention_object_data(attention_info)
	attention_info.handler:remove_listener("detect_" .. tostring(self._unit:key()))

	if not attention_info.identified and attention_info.settings.notice_clbk then
		attention_info.settings.notice_clbk(self._unit, false, true)
	end

	if REACT_SUSPICIOUS <= attention_info.settings.reaction then
		managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, nil)
	end

	if attention_info.uncover_progress then
		attention_info.unit:movement():on_suspicion(self._unit, false, true)
	end

	self._detected_player_att_data[attention_info.u_key] = nil
end

function HuskCopBrain:_destroy_all_detected_attention_object_data()
	if self._detected_player_att_data then
		for u_key, attention_info in pairs(self._detected_player_att_data) do
			attention_info.handler:remove_listener("detect_" .. tostring(self._unit:key()))

			if not attention_info.identified and attention_info.settings.notice_clbk then
				attention_info.settings.notice_clbk(self._unit, false, true)
			end

			if REACT_SUSPICIOUS <= attention_info.settings.reaction then
				managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, nil)
			end

			if attention_info.uncover_progress then
				attention_info.unit:movement():on_suspicion(self._unit, false, true)
			end
		end
	end

	self._detected_player_att_data = {}
end

local clbk_death_original = HuskCopBrain.clbk_death
function HuskCopBrain:clbk_death(my_unit, damage_info)
	clbk_death_original(self, my_unit, damage_info)

	self:_destroy_all_detected_attention_object_data()

	self._detect_local_player = nil
end

function HuskCopBrain:pre_destroy()
	self:_destroy_all_detected_attention_object_data()
	self._unit:movement():synch_attention()

	self._detect_local_player = nil

	if self._alert_listen_key then
		managers.groupai:state():remove_alert_listener(self._alert_listen_key)

		self._alert_listen_key = nil
	end

	if self._weapon_laser_on then
		self:sync_net_event(self._NET_EVENTS.weapon_laser_off)
	end
end

function HuskCopBrain:_send_client_detection_net_event(event_id)
	managers.network:session():send_to_peer_synched(managers.network:session():peer(1), "sync_unit_event_id_16", self._unit, "brain", event_id)
end
