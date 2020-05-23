local mvec3_dis = mvector3.distance
local mvec3_dir = mvector3.direction
local mvec3_angle = mvector3.angle
local math_lerp = math.lerp
local math_clamp = math.clamp
local math_min = math.min
local tmp_vec1 = Vector3()

HuskCopBrain._NET_EVENTS = {
	cloak = 4,
	uncloak = 3,
	weapon_laser_off = 2,
	weapon_laser_on = 1
}

local post_init_original = HuskCopBrain.post_init
function HuskCopBrain:post_init()
	post_init_original(self)

	local char_tweak = tweak_data.character[self._unit:base()._tweak_table]

	self._SO_access = managers.navigation:convert_access_flag(char_tweak.access)
	self._detection = char_tweak.detection.ntl
	self._visibility_slotmask = managers.slot:get_mask("AI_visibility")
	self._is_team_ai = self._unit:base().nick_name
	self._detected_player_att_data = {}

	if self._unit:movement():cool() and not self._is_team_ai then
		self._detect_local_player = true
	end
end

function HuskCopBrain:sync_surrender(surrendered)
	if surrendered then
		self._unit:base():set_slot(self._unit, 22)
	else
		self._unit:base():set_slot(self._unit, 12)
	end

	self._surrendered = surrendered
end

function HuskCopBrain:sync_net_event(event_id)
	if event_id == self._NET_EVENTS.cloak then
		if self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
			self._unit:damage():run_sequence_simple("cloak_engaged")

			local weapon_unit = self._unit:inventory():equipped_unit()

			if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
				weapon_unit:damage():run_sequence_simple("cloak_engaged")
			end
		end
	elseif event_id == self._NET_EVENTS.uncloak then
		if self._unit:damage() and self._unit:damage():has_sequence("decloak") then
			self._unit:damage():run_sequence_simple("decloak")

			local weapon_unit = self._unit:inventory():equipped_unit()

			if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("decloak") then
				weapon_unit:damage():run_sequence_simple("decloak")
			end
		end
	elseif event_id == self._NET_EVENTS.weapon_laser_on then
		self._add_laser_t = HuskCopBrain._ENABLE_LASER_TIME
	elseif event_id == self._NET_EVENTS.weapon_laser_off then
		self:disable_weapon_laser()
	end
end

function HuskCopBrain:update(unit, t, dt)
	if not self._post_init_complete then
		return
	end

	if self._detect_local_player then
		local attention_info = self:update_local_player_detection(t)

		if attention_info and attention_info.reaction == AIAttentionObject.REACT_SUSPICIOUS then
			self:update_local_player_suspicion(t, attention_info)
		end

		self:update_local_player_suspicion_decay(t)
	elseif self._unit:movement():cool() and not self._is_team_ai then
		self._detect_local_player = true
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

	if self._unit:movement():cool() and not self._is_team_ai then
		self._detect_local_player = true
	end
end

local clbk_death_original = HuskCopBrain.clbk_death
function HuskCopBrain:clbk_death(my_unit, damage_info)
	clbk_death_original(self, my_unit, damage_info)

	managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, true)
	self._detect_local_player = nil
end

function HuskCopBrain:on_cool_state_changed(state)
	if self._is_team_ai then
		return
	end

	if not state then
		managers.groupai:state():on_criminal_suspicion_progress(nil, self._unit, true)

		self._detected_player_att_data = {}
	end

	self._detect_local_player = state
end

function HuskCopBrain:update_local_player_detection(t)
	if not self._team then
		return
	end

	local player = managers.player:player_unit()

	if not player then
		if #self._detected_player_att_data > 0 then
			self._detected_player_att_data = {}
		end

		return
	end

	local player_attention = managers.groupai:state():get_AI_attention_object_by_unit(player)

	if not player_attention then
		return
	end

	local handler = player_attention.attention_handler

	if not handler then
		return
	end

	local unit = self._unit
	local team = self._team
	local detection = self._detection
	local detected_obj = self._detected_player_att_data
	local player_key = player:key()
	local my_pos = unit:movement():m_head_pos()
	local my_head_fwd = unit:movement():m_head_rot():z()
	local my_tracker = unit:movement():nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local my_access = self._SO_access
	local visibility_slotmask = self._visibility_slotmask

	local function _angle_chk(attention_pos, dis, strictness)
		mvec3_dir(tmp_vec1, my_pos, attention_pos)

		local angle = mvec3_angle(my_head_fwd, tmp_vec1)
		local angle_max = math_lerp(180, detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))

		if angle_max > angle * strictness then
			return true
		end
	end

	local function _angle_and_dis_chk(handler, settings, attention_pos)
		attention_pos = attention_pos or handler:get_detection_m_pos()
		local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)
		local dis_multiplier, angle_multiplier = nil
		local max_dis = math_min(detection.dis_max, settings.max_range or detection.dis_max)

		if settings.detection and settings.detection.range_mul then
			max_dis = max_dis * settings.detection.range_mul
		end

		dis_multiplier = dis / max_dis

		if settings.uncover_range and detection.use_uncover_range and dis < settings.uncover_range then
			return -1, 0
		end

		if dis_multiplier < 1 then
			if settings.notice_requires_FOV then
				local angle = mvec3_angle(my_head_fwd, tmp_vec1)

				if angle < 55 and not detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
					return -1, 0
				end

				local angle_max = math_lerp(180, detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
				angle_multiplier = angle / angle_max

				if angle_multiplier < 1 then
					return angle, dis_multiplier
				end
			else
				return 0, dis_multiplier
			end
		end
	end

	local acquired = nil
	local attention_info = detected_obj[player_key]

	if attention_info then
		acquired = true
	elseif not player_attention.nav_tracker or chk_vis_func(my_tracker, player_attention.nav_tracker) then
		local settings = player_attention.handler:get_attention(my_access, nil, nil, team)

		if settings then
			local attention_pos = player_attention.handler:get_detection_m_pos()
			local angle, dis_multiplier = _angle_and_dis_chk(player_attention.handler, settings, attention_pos)

			if angle then
				local vis_ray = World:raycast("ray", my_pos, attention_pos, "slot_mask", visibility_slotmask, "ray_type", "ai_vision")

				if not vis_ray or vis_ray.unit:key() == player_key then
					acquired = true

					local visible_data = {
						visible_angle = angle,
						visible_dis_multiplier = dis_multiplier,
						visible_ray = vis_ray
					}
					attention_info = HuskCopBrain._create_detected_player_data(t, player_key, player_attention, settings, nil, visible_data)
				end
			end
		end
	end

	if acquired then
		if attention_info.visible_in_this_instance or t >= attention_info.next_verify_t then
			local verify_interval = attention_info.settings.notice_interval or attention_info.settings.verification_interval
			attention_info.next_verify_t = t + verify_interval

			if not attention_info.identified then
				local noticable = nil
				local angle, dis_multiplier = nil

				if attention_info.visible_in_this_instance then
					noticable = true
					angle = attention_info.visible_angle
					dis_multiplier = attention_info.visible_dis_multiplier
				else
					angle, dis_multiplier = _angle_and_dis_chk(attention_info.handler, attention_info.settings)

					if angle then
						local vis_ray = attention_info.visible_ray or World:raycast("ray", my_pos, attention_info.m_head_pos, "slot_mask", visibility_slotmask, "ray_type", "ai_vision")

						if not vis_ray or vis_ray.unit:key() == player_key then
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
						local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

						if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
							notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
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
					attention_info.release_t = t + attention_info.settings.release_delay
					attention_info.identified_t = t
					noticable = true

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.detected_client)

					self._detected_player_att_data = {}
					self._detect_local_player = nil
					self._seeing_local_player = nil
				elseif attention_info.notice_progress < 0 then
					attention_info = nil
					noticable = false

					if self._seeing_local_player then
						self._seeing_local_player = nil

						managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.stopped_seeing_client)
					end

					self._detected_player_att_data = {}
				else
					noticable = attention_info.notice_progress
					attention_info.prev_notice_chk_t = t

					if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
						managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, noticable)

						if not self._seeing_local_player then
							self._seeing_local_player = true

							managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.seeing_client)
						end
					end
				end

				if noticable ~= false and attention_info.settings.notice_clbk then
					attention_info.settings.notice_clbk(self._unit, noticable)
				end
			end

			if attention_info.identified then
				local is_ignored = false

				if attention_info.unit:movement() and attention_info.unit:movement().is_cuffed then
					is_ignored = attention_info.unit:movement():is_cuffed()
				end

				if is_ignored then
					self._detected_player_att_data = {}
				else
					local verified, vis_ray = nil
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local dis = mvec3_dis(data.m_pos, attention_info.m_pos)

					if dis < detection.dis_max * 1.2 then
						local in_range = nil

						if not attention_info.settings.max_range then
							in_range = true
						else
							local range_mul = attention_info.settings.detection and attention_info.settings.detection.range_mul or 1

							if dis < attention_info.settings.max_range * range_mul * 1.2 then
								in_range = true
							end
						end

						if in_range then
							local in_FOV = not attention_info.settings.notice_requires_FOV or data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask) or _angle_chk(attention_pos, dis, 0.8)

							if in_FOV then
								if attention_info.visible_in_this_instance then
									verified = true
									vis_ray = attention_info.visible_ray
								else
									vis_ray = attention_info.visible_ray or World:raycast("ray", my_pos, attention_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

									if not vis_ray or vis_ray.unit:key() == u_key then
										verified = true
									end
								end
							end

							attention_info.verified = verified
						end
					end

					attention_info.dis = dis
					attention_info.vis_ray = vis_ray or nil

					if verified then
						attention_info.release_t = nil
						attention_info.verified_t = t
					elseif data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask) then
						if attention_info.release_t and attention_info.release_t < t then
							self._detected_player_att_data = {}
						else
							attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
						end
					elseif attention_info.release_t and attention_info.release_t < t then
						self._detected_player_att_data = {}
					else
						attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
					end
				end
			end
		end

		attention_info.visible_in_this_instance = nil
		attention_info.visible_angle = nil
		attention_info.visible_dis_multiplier = nil
		attention_info.visible_ray = nil
	end

	return attention_info
end

function HuskCopBrain._create_detected_player_data(t, u_key, attention_info, settings, forced, visible_data)
	local att_unit = attention_info.unit
	local m_pos = attention_info.handler:get_ground_m_pos()
	local m_head_pos = attention_info.handler:get_detection_m_pos()
	local m_rot = att_unit:movement():m_rot()
	local dis = mvec3_dis(self._unit:movement():m_pos(), m_pos)
	local verify_interval = settings.notice_interval or settings.verification_interval
	local new_entry = {
		notice_progress = 0,
		settings = settings,
		unit = attention_info.unit,
		u_key = u_key,
		handler = attention_info.handler,
		next_verify_t = t + verify_interval,
		prev_notice_chk_t = t,
		dis = dis,
		m_rot = m_rot,
		m_pos = m_pos,
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
		managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.detected_client)

		self._detected_player_att_data = {}
		self._detect_local_player = nil
		self._seeing_local_player = nil
	end

	local dis = attention_info.dis
	local susp_settings = attention_info.unit:base():suspicion_settings()

	if attention_info.settings.uncover_range and dis < math_min(attention_info.settings.max_range, attention_info.settings.uncover_range) * susp_settings.range_mul then
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

				if not self._seeing_local_player then
					self._seeing_local_player = true

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.seeing_client)
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

				if self._seeing_local_player then
					self._seeing_local_player = nil

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.stopped_seeing_client)
				end
			else
				attention_info.unit:movement():on_suspicion(self._unit, attention_info.uncover_progress, true)

				if not self._seeing_local_player then
					self._seeing_local_player = true

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.seeing_client)
				end
			end
		else
			attention_info.last_suspicion_t = t
		end
	end
end

function HuskCopBrain.update_local_player_suspicion_decay(t)
	for _, u_data in pairs(self._detected_player_att_data) do
		if u_data.uncover_progress and u_data.last_suspicion_t ~= t then
			local dt = t - u_data.last_suspicion_t
			u_data.uncover_progress = u_data.uncover_progress - dt

			if u_data.uncover_progress <= 0 then
				u_data.uncover_progress = nil
				u_data.last_suspicion_t = nil

				u_data.unit:movement():on_suspicion(self._unit, false, true)

				if self._seeing_local_player then
					self._seeing_local_player = nil

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.stopped_seeing_client)
				end
			else
				u_data.unit:movement():on_suspicion(self._unit, u_data.uncover_progress, true)

				u_data.last_suspicion_t = t

				if not self._seeing_local_player then
					self._seeing_local_player = true

					managers.network:session():send_to_peer_synched(1, "sync_unit_event_id_16", self._unit, "brain", CopBrain._NET_EVENTS.seeing_client)
				end
			end
		end
	end
end
