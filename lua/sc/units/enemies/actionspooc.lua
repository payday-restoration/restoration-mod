local ids_base = Idstring("base")
local mvec3_x = mvector3.x
local mvec3_y = mvector3.y
local mvec3_z = mvector3.z
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_add = mvector3.add
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_dis = mvector3.distance
local mvec3_dist_sq = mvector3.distance_sq
local mvec3_len = mvector3.length
local mvec3_len_sq = mvector3.length_sq
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_rot = mvector3.rotate_with
local mvec3_lerp = mvector3.lerp
local mvec3_copy = mvector3.copy
local mvec3_angle = mvector3.angle
local mvec3_set_stat = mvector3.set_static
local mvec3_negate = mvector3.negate
local math_min = math.min
local math_max = math.max
local math_abs = math.abs
local math_lerp = math.lerp
local math_random = math.random
local math_clamp = math.clamp
local math_up = math.UP
local math_step = math.step
local table_insert = table.insert
local table_remove = table.remove
local mrot_set = mrotation.set_yaw_pitch_roll

function ActionSpooc:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._ext_brain = common_data.ext_brain
	self._ext_network = common_data.ext_network
	self._stance = common_data.stance
	self._machine = common_data.machine
	self._unit = common_data.unit

	local stand = common_data.ext_anim.stand or common_data.ext_movement:play_redirect("stand")

	if not stand then
		return
	end

	if not common_data.ext_anim.pose then
		common_data.ext_movement:play_redirect("idle")

		if not common_data.ext_anim.pose and not common_data.ext_movement:play_state("std/stand/still/idle/look") then
			return
		end
	end

	self._action_desc = action_desc
	self._nav_path = action_desc.nav_path or {
		mvec3_copy(common_data.pos)
	}

	common_data.ext_movement:enable_update()

	self._is_flying_strike = action_desc.flying_strike
	self._host_stop_pos_inserted = action_desc.host_stop_pos_inserted
	self._stop_pos = action_desc.stop_pos
	self._nav_index = action_desc.path_index or 1
	self._stroke_t = tonumber(action_desc.stroke_t)

	self._beating_time = 0

	if common_data.char_tweak.spooc_attack_beating_time then
		local tweak_beat = common_data.char_tweak.spooc_attack_beating_time

		if tweak_beat[1] == tweak_beat[2] then
			self._beating_time = tweak_beat[1]
		else
			self._beating_time = math_lerp(tweak_beat[1], tweak_beat[2], math_random())
		end
	end

	self._beating_end_t = self._stroke_t and self._stroke_t + self._beating_time
	self._strike_nav_index = action_desc.strike_nav_index
	self._haste = "run"
	self._nr_expected_nav_points = action_desc.nr_expected_nav_points
	self._last_vel_z = 0
	self._was_interrupted = action_desc.interrupted
	self._is_server = Network:is_server()

	if self._is_server then
		self._action_id = ActionSpooc._global_incremental_action_ID

		if ActionSpooc._global_incremental_action_ID == 256 then
			ActionSpooc._global_incremental_action_ID = 1
		else
			ActionSpooc._global_incremental_action_ID = ActionSpooc._global_incremental_action_ID + 1
		end
	else
		self._action_id = action_desc.action_id
	end

	if self._was_interrupted then
		if action_desc.is_local then
			self._is_local = true
		end

		local attention = common_data.attention
		self._attention = attention
		self._target_unit = attention and attention.unit
	else
		local attention = common_data.attention

		if not attention then
			return
		end

		self._attention = attention
		self._target_unit = attention and attention.unit

		if alive(self._target_unit) then
			if self._is_server then
				if not self._target_unit:base().is_husk_player then
					self._is_local = true
				end
			elseif self._target_unit:base().is_local_player then
				self._is_local = true
			end
		end
	end

	if self._is_local and self._target_unit and self._target_unit:base().is_local_player then
		self._target_unit:movement():on_targetted_for_attack(true, common_data.unit)
	end

	if self._is_server then
		common_data.ext_network:send("action_spooc_start", self._target_unit:movement():m_pos(), action_desc.flying_strike, self._action_id)
	else
		local host_stop_pos = common_data.ext_movement:m_host_stop_pos()

		if host_stop_pos ~= common_data.pos then
			table_insert(self._nav_path, 2, mvec3_copy(host_stop_pos))

			if self._host_stop_pos_inserted then
				self._host_stop_pos_inserted = self._host_stop_pos_inserted + 1
			else
				self._host_stop_pos_inserted = 1
			end
		end
	end

	self._walk_velocity = self:_get_max_walk_speed()
	self._cur_vel = 0
	self._last_pos = mvec3_copy(common_data.pos)

	CopActionAct._create_blocks_table(self, action_desc.blocks)

	if self._was_interrupted then
		if self._is_local then
			self._last_sent_pos = action_desc.last_sent_pos

			if self:_chk_target_invalid() then
				common_data.ext_network:send_to_host("action_spooc_stop", common_data.ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			else
				if action_desc.flying_strike then
					if ActionSpooc.chk_can_start_flying_strike(common_data.unit, self._target_unit) then
						self:_set_updator("_upd_flying_strike_first_frame")
					else
						common_data.ext_network:send_to_host("action_spooc_stop", common_data.ext_movement:m_pos(), 1, self._action_id)
						self:_wait()
					end
				else
					if self._nav_path[self._nav_index + 1] then
						self:_start_sprint()
					else
						self:_wait()
					end
				end
			end
		else
			if action_desc.flying_strike then
				if action_desc.start_anim_time or #self._nav_path > 1 then
					self:_set_updator("_upd_flying_strike_first_frame")
				else
					self:_wait()
				end
			else
				if action_desc.start_anim_time then
					self:_strike()
				elseif self._nav_path[self._nav_index + 1] then
					self:_start_sprint()
				else
					self:_wait()
				end
			end
		end
	elseif self._is_local then
		if not self._is_server and self:_chk_target_invalid() then
			if not action_desc.flying_strike then
				self._last_sent_pos = mvec3_copy(common_data.pos)
			end

			common_data.ext_network:send_to_host("action_spooc_stop", common_data.ext_movement:m_pos(), 1, self._action_id)
			self:_wait()
		elseif action_desc.flying_strike then
			if self._is_server or ActionSpooc.chk_can_start_flying_strike(common_data.unit, self._target_unit) then
				self:_set_updator("_upd_flying_strike_first_frame")
			else
				common_data.ext_network:send_to_host("action_spooc_stop", common_data.ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			end
		else
			if action_desc.target_u_pos then
				table_insert(self._nav_path, action_desc.target_u_pos)
			end

			self._chase_tracker = self._target_unit:movement():nav_tracker()
			local chase_pos = self._chase_tracker:field_position()

			table_insert(self._nav_path, chase_pos)

			self._last_sent_pos = mvec3_copy(common_data.pos)

			self:_start_sprint()
		end
	else
		if self._is_server then
			self:_wait()
		else
			if action_desc.strike then
				self:_start_sprint()
			elseif action_desc.flying_strike and #self._nav_path > 1 then
				self:_set_updator("_upd_flying_strike_first_frame")
			else
				self:_wait()
			end
		end
	end

	if self._is_server and common_data.ext_movement.is_uncloaked and not common_data.ext_movement:is_uncloaked() and common_data.unit:damage() and common_data.unit:damage():has_sequence("decloak") then
		common_data.unit:damage():run_sequence_simple("decloak")

		local weapon_unit = common_data.ext_inventory:equipped_unit()

		if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("decloak") then
			weapon_unit:damage():run_sequence_simple("decloak")
		end

		common_data.ext_movement:set_uncloaked(true)
	end

	local detect_sound = self:get_sound_event("detect")

	if detect_sound then
		if common_data.ext_base._tweak_table == "spooc_titan" then 
			common_data.unit:sound():play(detect_sound)
		else
			if self._is_flying_strike then
				common_data.unit:sound():play(detect_sound)
			end
		end
	end

	local spooc_sound_events = common_data.char_tweak.spooc_sound_events or {}

	if spooc_sound_events.taunt_during_assault then
		self._taunt_during_assault = spooc_sound_events.taunt_during_assault
	end

	if spooc_sound_events.taunt_after_assault then
		self._taunt_after_assault = spooc_sound_events.taunt_after_assault
	end

	if not self._taunt_during_assault or not self._taunt_after_assault then
		if common_data.ext_base.has_tag and common_data.ext_base:has_tag("spooc") then
			local ai_type = tweak_data.levels:get_ai_group_type()
			local r = LevelsTweakData.LevelType.Russia
			local f = LevelsTweakData.LevelType.Federales

			if not self._taunt_during_assault then
				if ai_type == r then
					self._taunt_during_assault = "rcloaker_taunt_during_assault"
				elseif ai_type == f and common_data.ext_base._tweak_table == "spooc" then
					self._taunt_during_assault = "mcloaker_taunt_during_assault"
				elseif ai_type == f and common_data.ext_base._tweak_table == "spooc_titan" then
					self._taunt_after_assault = "rcloaker_taunt_during_assault"
				else
					self._taunt_during_assault = "cloaker_taunt_during_assault"
				end
			end

			if not self._taunt_after_assault then
				if ai_type == r then
					self._taunt_after_assault = "rcloaker_taunt_after_assault"
				elseif ai_type == f and common_data.ext_base._tweak_table == "spooc" then
					self._taunt_after_assault = "mcloaker_taunt_after_assault"
				elseif ai_type == f and common_data.ext_base._tweak_table == "spooc_titan" then
					self._taunt_after_assault = "rcloaker_taunt_after_assault"
				else
					self._taunt_after_assault = "cloaker_taunt_after_assault"
				end
			end
		end
	end

	return true
end

function ActionSpooc:on_exit()
	if self._unit:character_damage():dead() then
		local detect_stop_sound = self:get_sound_event("detect_stop")

		if detect_stop_sound then
			self._unit:sound():play(detect_stop_sound)
		end
	else
		if self._is_local and self._taunt_after_assault and self._taunt_at_beating_played and not self._unit:sound():speaking(TimerManager:game():time()) then
			self._unit:sound():say(self._taunt_after_assault, true, true)
		end
	end

	if self._is_server and self._ext_movement.is_uncloaked and self._ext_movement:is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
		self._unit:damage():run_sequence_simple("cloak_engaged")

		local weapon_unit = self._unit:inventory():equipped_unit()

		if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
			weapon_unit:damage():run_sequence_simple("cloak_engaged")
		end

		self._ext_movement:set_uncloaked(false)
	end

	if self._root_blend_disabled then
		self._ext_movement:set_root_blend(true)
	end

	if self._changed_driving then
		self._unit:set_driving("script")

		self._changed_driving = nil
	end

	if self._expired and self._common_data.ext_anim.move then
		self:_stop_walk()
	end

	self._ext_movement:drop_held_items()

	if self._is_server then
		local stop_nav_index = nil

		if self._host_stop_pos_inserted then
			stop_nav_index = math_min(256, self._nav_index - self._host_stop_pos_inserted)
		else
			stop_nav_index = math_min(256, self._nav_index)
		end

		self._ext_network:send("action_spooc_stop", mvec3_copy(self._ext_movement:m_pos()), stop_nav_index, self._action_id)
	else
		self._ext_movement:set_m_host_stop_pos(self._ext_movement:m_pos())
	end

	if alive(self._target_unit) and self._target_unit:base().is_local_player then
		self._target_unit:movement():on_targetted_for_attack(false, self._unit)
	end
end

function ActionSpooc:_chk_can_strike()
	if self._stroke_t then
		return
	end

	local my_pos = self._common_data.pos
	local target_pos = self._tmp_vec1

	self._chase_tracker:m_position(target_pos)

	local function _dis_chk(pos)
		mvec3_sub(pos, my_pos)

		local dif_z = math_abs(mvec3_z(pos))

		mvec3_set_z(pos, 0)

		return mvec3_len_sq(pos) < 52900 and dif_z < 75
	end

	if not _dis_chk(target_pos) then
		return
	end

	mvec3_set(target_pos, self._nav_path[#self._nav_path])

	if _dis_chk(target_pos) then
		return true
	end
end

function ActionSpooc:_chk_target_invalid()
	local target_unit = self._target_unit

	if not target_unit or not alive(target_unit) then
		return true
	end

	local record = managers.groupai:state():criminal_record(target_unit:key())

	if record then
		if record.status then
			return true
		else
			local is_last_standing = true

			for u_key, u_data in pairs(managers.groupai:state():all_char_criminals()) do
				if not u_data.status and target_unit:key() ~= u_key then
					is_last_standing = false

					break
				end
			end

			if is_last_standing then
				return true
			end
		end
	end

	if target_unit:movement().zipline_unit and target_unit:movement():zipline_unit() then
		return true
	end

	if target_unit:movement().is_SPOOC_attack_allowed and not target_unit:movement():is_SPOOC_attack_allowed() then
		return true
	end

	if self._is_server then
		if managers.groupai:state():is_unit_team_AI(target_unit) and target_unit:movement():chk_action_forbidden("hurt") then
			return true
		end

		if target_unit:character_damage().dead and target_unit:character_damage():dead() then
			return true
		end
	end
end

function ActionSpooc:_start_sprint()
	CopActionWalk._chk_start_anim(self, self._nav_path[self._nav_index + 1])

	if self._start_run then
		self:_set_updator("_upd_start_anim_first_frame")
	else
		self:_set_updator("_upd_sprint")
		self._ext_base:chk_freeze_anims()
	end
end

function ActionSpooc:_upd_strike_first_frame(t)
	if self._is_local and self:_chk_target_invalid() then
		if self._is_server then
			self:_expire()
		else
			self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
			self:_wait()
		end

		return
	end

	local redir_result = nil

	if self._action_desc.start_anim_time then
		redir_result = self._ext_movement:play_redirect("spooc_strike", self._action_desc.start_anim_time)
	else
		redir_result = self._ext_movement:play_redirect("spooc_strike")
	end

	if redir_result then
		self._ext_movement:spawn_wanted_items()
	elseif self._is_local then
		if self._is_server then
			self:_expire()
		else
			self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
			self:_wait()
		end

		return
	end

	if self._is_local then
		mvec3_set(self._last_sent_pos, self._common_data.pos)
		self._ext_network:send("action_spooc_strike", mvec3_copy(self._common_data.pos), self._action_id)

		self._nav_path[self._nav_index + 1] = mvec3_copy(self._common_data.pos)

		--[[if self._target_unit:base().is_local_player then
			local enemy_vec = mvec3_copy(self._common_data.pos)

			mvec3_sub(enemy_vec, self._target_unit:movement():m_pos())
			mvec3_set_z(enemy_vec, 0)
			mvec3_norm(enemy_vec)
			self._target_unit:camera():camera_unit():base():clbk_aim_assist({
				ray = enemy_vec
			})
		end]]
	end

	self._last_vel_z = 0

	self:_set_updator("_upd_striking")
	self._ext_base:chk_freeze_anims()
end

function ActionSpooc:_upd_chase_path()
	self._chase_tracker = self._chase_tracker or self._target_unit:movement():nav_tracker()
	local ray_params = {
		allow_entry = true,
		trace = true,
		tracker_from = self._common_data.nav_tracker,
		tracker_to = self._chase_tracker
	}
	local chase_pos = nil
	local chasing_lost = self._chase_tracker:lost()

	if chasing_lost then
		chase_pos = self._chase_tracker:field_position()
		ray_params.pos_to = chase_pos
	else
		chase_pos = self._chase_tracker:position()
	end

	local simplified = nil

	if self._nav_index < #self._nav_path - 1 then
		local walk_ray = managers.navigation:raycast(ray_params)

		if not walk_ray then
			simplified = true

			for i = self._nav_index + 2, #self._nav_path do
				table_remove(self._nav_path)
			end
		end
	end

	local walk_ray = nil

	if not simplified then
		ray_params.tracker_from = nil
		ray_params.pos_from = self._nav_path[math_max(1, #self._nav_path - 1)]
		walk_ray = managers.navigation:raycast(ray_params)
	end

	if walk_ray then
		table_insert(self._nav_path, mvec3_copy(chase_pos))
	else
		mvec3_set(self._nav_path[#self._nav_path], ray_params.trace[1])
	end
end

function ActionSpooc:_upd_sprint(t)
	if self._is_local then
		if self:_chk_target_invalid() then
			if self._is_server then
				self:_expire()
			else
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			end

			return
		end

		self:_upd_chase_path()

		if self:_chk_can_strike() then
			self:_strike()

			return
		end
	end

	local dt = TimerManager:game():delta_time()

	if self._end_of_path then
		if self._stop_pos or self._is_server and self._stroke_t then
			self:_expire()
		else
			self:_wait()
		end
	else
		self:_nav_chk(t, dt)
	end

	local move_dir = self._last_pos - self._common_data.pos

	mvec3_set_z(move_dir, 0)

	if self._cur_vel < 0.1 then
		move_dir = nil
	end

	self._move_dir = move_dir
	local anim_data = self._ext_anim
	local face_fwd, face_right = nil

	if self._move_dir then
		local attention = self._attention

		if attention then
			if alive(attention.unit) then
				face_fwd = attention.unit:movement():m_pos() - self._common_data.pos
			elseif attention.pos then
				face_fwd = attention.pos - self._common_data.pos
			else
				face_fwd = self._move_dir
			end
		else
			face_fwd = self._move_dir
		end

		local move_dir_norm = self._move_dir:normalized()

		mvec3_set_z(face_fwd, 0)
		mvec3_norm(face_fwd)

		face_right = face_fwd:cross(math_up)

		mvec3_norm(face_right)

		local right_dot = mvec3_dot(move_dir_norm, face_right)
		local fwd_dot = mvec3_dot(move_dir_norm, face_fwd)
		local wanted_walk_dir = nil

		if math_abs(right_dot) < math_abs(fwd_dot) then
			local strafe = anim_data.move_l and right_dot < 0 or anim_data.move_r and right_dot > 0

			if strafe and math_abs(fwd_dot) < 0.73 then
				wanted_walk_dir = anim_data.move_side
			elseif fwd_dot > 0 then
				wanted_walk_dir = "fwd"
			else
				wanted_walk_dir = "bwd"
			end
		else
			local fwd_or_bwd = anim_data.move_fwd and fwd_dot > 0 or anim_data.move_bwd and fwd_dot < 0

			if fwd_or_bwd and math_abs(right_dot) < 0.73 then
				wanted_walk_dir = anim_data.move_side
			elseif right_dot > 0 then
				wanted_walk_dir = "r"
			else
				wanted_walk_dir = "l"
			end
		end

		local wanted_u_fwd = self._move_dir:rotate_with(self._walk_side_rot[wanted_walk_dir])
		local rot_new = self._common_data.rot:slerp(Rotation(wanted_u_fwd, math_up), math_min(1, dt * 5))

		self._ext_movement:set_rotation(rot_new)

		local pose = self._stance.values[4] > 0 and "wounded" or anim_data.pose or "stand"
		local real_velocity = self._cur_vel
		local variant = nil

		if anim_data.sprint then
			if real_velocity > 480 and anim_data.pose == "stand" then
				variant = "sprint"
			elseif real_velocity > 250 then
				variant = "run"
			else
				variant = "walk"
			end
		elseif anim_data.run then
			if real_velocity > 530 and self._walk_anim_velocities[pose][self._stance.name].sprint and anim_data.pose == "stand" then
				variant = "sprint"
			elseif real_velocity > 250 then
				variant = "run"
			else
				variant = "walk"
			end
		elseif real_velocity > 530 and self._walk_anim_velocities[pose][self._stance.name].sprint and anim_data.pose == "stand" then
			variant = "sprint"
		elseif real_velocity > 300 then
			variant = "run"
		else
			variant = "walk"
		end

		self:_adjust_move_anim(wanted_walk_dir, variant)

		local pose = anim_data.pose
		local anim_walk_speed = self._walk_anim_velocities[pose][self._common_data.stance.name][variant][wanted_walk_dir]
		local wanted_walk_anim_speed = real_velocity / anim_walk_speed

		self:_adjust_walk_anim_speed(dt, wanted_walk_anim_speed)
	end

	self:_set_new_pos(dt)

	if self._strike_now then
		self:_strike()
	end
end

function ActionSpooc:_upd_start_anim_first_frame(t)
	local pose = self._ext_anim.pose
	local speed_mul = self._walk_velocity.fwd / self._walk_anim_velocities[pose][self._common_data.stance.name].run.fwd
	local start_run = self._start_run_turn and self._start_run_turn[3] or self._start_run_straight

	self:_start_move_anim(start_run, "run", speed_mul, self._start_run_turn)
	self:_set_updator("_upd_start_anim")
	self._ext_base:chk_freeze_anims()
end

function ActionSpooc:_upd_start_anim(t)
	if self._is_local then
		if self:_chk_target_invalid() then
			if self._is_server then
				self:_expire()
			else
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			end

			return
		end

		self:_upd_chase_path()

		if self:_chk_can_strike() then
			self:_strike()

			return
		end
	end

	if not self._ext_anim.run_start then
		self._start_run = nil
		self._start_run_turn = nil
		self._start_run_straight = nil
		self._last_pos = mvec3_copy(self._common_data.pos)

		self:_set_updator("_upd_sprint")
		self:update(t)

		return
	end

	local dt = TimerManager:game():delta_time()

	if self._start_run_turn then
		local seg_rel_t = self._machine:segment_relative_time(ids_base)

		if seg_rel_t > 0.1 then
			local delta_pos = self._unit:get_animation_delta_position()

			mvec3_mul(delta_pos, 2)

			if seg_rel_t > 0.6 then
				if self._correct_vel_from then
					local lerp = (math_clamp(seg_rel_t, 0, 0.9) - 0.6) / 0.3
					self._cur_vel = math_lerp(self._correct_vel_from, self._walk_velocity.fwd, lerp)
				else
					self._correct_vel_from = self._cur_vel
				end

				mvec3_set_l(delta_pos, self._cur_vel * dt)
			else
				self._cur_vel = delta_pos:length() / dt
			end

			local new_pos = self._common_data.pos + delta_pos
			local ray_params = {
				allow_entry = true,
				trace = true,
				tracker_from = self._common_data.nav_tracker,
				pos_to = new_pos
			}
			local collision_pos = managers.navigation:raycast(ray_params)

			if collision_pos then
				new_pos = ray_params.trace[1]
			end

			self._last_pos = new_pos
			local seg_rel_t_clamp = math_clamp((seg_rel_t - 0.1) / 0.77, 0, 1)
			local prg_angle = self._start_run_turn[2] * seg_rel_t_clamp
			local new_yaw = self._start_run_turn[1] + prg_angle
			local rot_new = Rotation(new_yaw, 0, 0)

			self._ext_movement:set_rotation(rot_new)
		end
	else
		if self._end_of_path then
			self._start_run = nil

			if self._stop_pos or self._is_server and self._stroke_t then
				self:_expire()
			else
				self:_wait()
			end

			return
		else
			self:_nav_chk(t, dt)
		end

		if not self._end_of_path then
			local move_dir = self._nav_path[self._nav_index + 1] - self._common_data.pos
			local wanted_u_fwd = move_dir:rotate_with(self._walk_side_rot[self._start_run_straight])
			local rot_new = self._common_data.rot:slerp(Rotation(wanted_u_fwd, math_up), math_min(1, dt * 5))

			mrot_set(rot_new, rot_new:yaw(), 0, 0)
			self._ext_movement:set_rotation(rot_new)
		end
	end

	self:_set_new_pos(dt)

	if self._strike_now then
		self:_strike()

		self._start_run = nil
		self._start_run_turn = nil
		self._start_run_straight = nil

		return
	end
end

function ActionSpooc:get_husk_interrupt_desc()
	local old_action_desc = {
		block_type = "walk",
		interrupted = true,
		type = "spooc",
		body_part = 1,
		stop_pos = self._stop_pos,
		path_index = self._nav_index,
		nav_path = self._nav_path,
		strike_nav_index = self._strike_nav_index,
		stroke_t = self._stroke_t or self._is_local,
		host_stop_pos_inserted = self._host_stop_pos_inserted,
		nr_expected_nav_points = self._nr_expected_nav_points,
		flying_strike = self._is_flying_strike,
		is_local = self._is_local,
		action_id = self._action_id,
		last_sent_pos = self._last_sent_pos
	}

	if self._blocks then
		local blocks = {}

		for i, k in pairs(self._blocks) do
			blocks[i] = -1
		end

		old_action_desc.blocks = blocks
	end

	return old_action_desc
end

function ActionSpooc:save(save_data)
	save_data.type = "spooc"
	save_data.body_part = 1
	save_data.block_type = "walk"
	save_data.interrupted = true
	save_data.stop_pos = self._stop_pos
	save_data.path_index = self._nav_index
	save_data.strike_nav_index = self._strike_nav_index
	save_data.flying_strike = self._is_flying_strike
	save_data.stroke_t = self._stroke_t and true
	save_data.blocks = {
		act = -1,
		turn = -1,
		walk = -1
	}

	if self._is_flying_strike then
		save_data.blocks.idle = -1
		save_data.blocks.light_hurt = -1
		save_data.blocks.heavy_hurt = -1
		save_data.blocks.fire_hurt = -1
		save_data.blocks.hurt = -1
		save_data.blocks.expl_hurt = -1
		save_data.blocks.taser_tased = -1
	end

	save_data.action_id = self._action_id
	local sync_path = {}
	local nav_path = self._nav_path

	for i = 1, self._nav_index + 1 do
		local nav_point = nav_path[i]

		table_insert(sync_path, nav_point)
	end

	save_data.nav_path = sync_path

	if self._ext_anim.act or self._ext_anim.spooc_enter then
		save_data.start_anim_time = self._machine:segment_real_time(ids_base)

		if self._is_flying_strike then
			save_data.flying_speed_mul = math_lerp(3, 1, math_min(1, self._flying_strike_data.travel_dis_scaling_xy))
			save_data.flying_pos_z = mvec3_z(self._common_data.pos)
		end
	end
end

function ActionSpooc:_nav_chk(t, dt)
	local path = self._nav_path
	local old_nav_index = self._nav_index
	local move_side = self._ext_anim.move_side or "fwd"
	local vel = self:_get_current_max_walk_speed(move_side)
	local walk_dis = vel * dt
	local cur_pos = self._common_data.pos
	local new_pos, complete, new_nav_index = nil

	mvec3_set(path[old_nav_index], cur_pos)

	new_pos, new_nav_index, complete = CopActionWalk._walk_spline(path, cur_pos, old_nav_index, walk_dis)

	if not self._stroke_t and self._strike_nav_index then
		if self._strike_nav_index <= new_nav_index or complete and self._strike_nav_index == new_nav_index + 1 then
			new_nav_index = self._strike_nav_index - 1
			new_pos = mvec3_copy(path[self._strike_nav_index])
			self._strike_now = true
		end
	end

	if complete then
		self._end_of_path = true
	end

	self._nav_index = new_nav_index
	local wanted_vel = nil

	if self._turn_vel then
		local dis = mvec3_dis(path[old_nav_index + 1]:with_z(cur_pos.z), cur_pos)

		if dis < 70 then
			wanted_vel = math_lerp(self._turn_vel, vel, dis / 70)
		end
	end

	wanted_vel = wanted_vel or vel

	if self._start_run then
		local delta_pos = self._unit:get_animation_delta_position()
		walk_dis = 2 * delta_pos:length()
		self._cur_vel = walk_dis / dt
	else
		local c_vel = self._cur_vel

		if c_vel ~= wanted_vel then
			local adj = vel * 2 * dt
			c_vel = math_step(c_vel, wanted_vel, adj)
			self._cur_vel = c_vel
		end

		walk_dis = c_vel * dt
	end

	if old_nav_index ~= new_nav_index then
		if self._is_local and not self._was_interrupted then
			self:_send_nav_point(mvec3_copy(path[old_nav_index]))
		end

		local future_pos = path[new_nav_index + 2]
		local next_pos = path[new_nav_index + 1]
		local back_pos = path[new_nav_index]
		local cur_vec = next_pos - back_pos

		mvec3_set_z(cur_vec, 0)

		if future_pos then
			mvec3_norm(cur_vec)

			local next_vec = future_pos - next_pos

			mvec3_set_z(next_vec, 0)
			mvec3_norm(next_vec)

			local turn_dot = mvec3_dot(cur_vec, next_vec)
			local dot_lerp = math_max(0, turn_dot)
			local turn_vel = math_lerp(math_min(vel, math_max(100, vel * 0.3)), vel, dot_lerp)
			self._turn_vel = turn_vel
		end
	elseif self._is_local and not self._was_interrupted and mvec3_dis(self._last_sent_pos, cur_pos) > 200 then
		self._nav_index = self._nav_index + 1

		table_insert(self._nav_path, self._nav_index, mvec3_copy(cur_pos))
		self:_send_nav_point(cur_pos)
	end

	self._last_pos = mvec3_copy(new_pos)
end

function ActionSpooc:_adjust_walk_anim_speed(dt, target_speed)
	local state = self._machine:segment_state(ids_base)

	self._machine:set_speed(state, target_speed)
end

function ActionSpooc:_upd_striking(t)
	local target_unit = alive(self._strike_unit) and self._strike_unit or alive(self._target_unit) and self._target_unit
	local my_pos = CopActionHurt._get_pos_clamped_to_graph(self, false)

	if target_unit then
		local my_fwd = self._common_data.fwd
		local target_pos = target_unit:movement():m_pos()
		local target_vec = ActionSpooc._tmp_vec1

		mvec3_dir(target_vec, my_pos, target_pos)

		if mvec3_dot(my_fwd, target_vec) < 0.98 then
			local my_fwd_polar = my_fwd:to_polar_with_reference(target_vec, math_up)
			local angle = self._ext_anim.spooc_enter and 180 or 110
			local spin_adj = math_step(0, -my_fwd_polar.spin, angle * TimerManager:game():delta_time())

			mvec3_set(target_vec, my_fwd)
			mvec3_rot(target_vec, Rotation(spin_adj, 0, 0))
			self._ext_movement:set_rotation(Rotation(target_vec, math_up))
		end
	end

	self._ext_movement:upd_ground_ray(my_pos, true)

	local gnd_z = self._common_data.gnd_ray.position.z

	if gnd_z < my_pos.z then
		self._last_vel_z = self._apply_freefall(my_pos, self._last_vel_z, gnd_z, TimerManager:game():delta_time())
	else
		if my_pos.z < gnd_z then
			mvec3_set_z(my_pos, gnd_z)
		end

		self._last_vel_z = 0
	end

	self._ext_movement:set_position(my_pos)

	if self._ext_anim.spooc_enter then
		return
	end

	if self._is_local then
		local expire = nil

		if not target_unit then
			expire = true
		else
			local downed = true
			local arrested = true

			if not target_unit:character_damage().is_downed or not target_unit:character_damage():is_downed() then
				downed = false
			end

			if not target_unit:character_damage().arrested or not target_unit:character_damage():arrested() then
				arrested = false
			end

			if not downed and not arrested then
				expire = true
			end

			if self._beating_end_t and self._beating_end_t < t then
				expire = true
			end
		end

		if expire then
			if self._is_server then
				self:_expire()
			else
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
			end

			return
		end
	end

	if self._is_local and not self._taunt_at_beating_played then
		self._taunt_at_beating_played = true

		if self._taunt_during_assault then
			self._unit:sound():say(self._taunt_during_assault, true, true)
		end
	end
end

function ActionSpooc:sync_stop(pos, stop_nav_index)
	if self._is_flying_strike then
		if not self._ext_anim.act and not self._ext_anim.spooc_enter then
			self:_expire()
		end
	else
		if self._host_stop_pos_inserted then
			stop_nav_index = stop_nav_index + self._host_stop_pos_inserted
		end

		local nav_path = self._nav_path

		while stop_nav_index < #nav_path do
			table_remove(nav_path)
		end

		self._stop_pos = pos

		if #nav_path < stop_nav_index - 1 then
			self._nr_expected_nav_points = stop_nav_index - #nav_path + 1
		else
			table_insert(nav_path, pos)
		end

		self._nav_index = math_min(self._nav_index, #nav_path - 1)

		if self._end_of_path and not self._nr_expected_nav_points then
			self._end_of_path = nil

			self:_start_sprint()
		end
	end
end

function ActionSpooc:sync_append_nav_point(nav_point)
	if self._stop_pos and not self._nr_expected_nav_points then
		return
	end

	table_insert(self._nav_path, nav_point)

	if self._is_flying_strike then
		self:_set_updator("_upd_flying_strike_first_frame")
	elseif self._end_of_path then
		self._end_of_path = nil
		local nav_index = math_min(#self._nav_path - 1, self._nav_index + 1)
		self._nav_index = nav_index
		self._cur_vel = 0

		if self._nr_expected_nav_points then
			if self._nr_expected_nav_points == 1 then
				self._nr_expected_nav_points = nil

				table_insert(self._nav_path, self._stop_pos)
			else
				self._nr_expected_nav_points = self._nr_expected_nav_points - 1
			end
		end

		self:_start_sprint()
	end
end

function ActionSpooc:sync_strike(pos)
	if self._stop_pos and not self._nr_expected_nav_points then
		return
	end

	table_insert(self._nav_path, pos)

	self._strike_nav_index = #self._nav_path

	if self._nr_expected_nav_points then
		if self._nr_expected_nav_points == 1 then
			self._nr_expected_nav_points = nil

			table_insert(self._nav_path, self._stop_pos)
		else
			self._nr_expected_nav_points = self._nr_expected_nav_points - 1
		end
	end

	if self._end_of_path then
		self._end_of_path = nil
		self._cur_vel = 0

		self:_start_sprint()
	end
end

function ActionSpooc:chk_block_client(action_desc, action_type, t)
	if CopActionAct.chk_block(self, action_type, t) then
		if not action_desc or action_desc.body_part ~= 3 then
			return true
		end
	end
end

function ActionSpooc:_send_nav_point(nav_point)
	self._ext_network:send("action_spooc_nav_point", nav_point, self._action_id)

	if self._last_sent_pos then
		mvec3_set(self._last_sent_pos, nav_point)
	end
end

function ActionSpooc:on_attention(attention)
	if self._target_unit and attention and attention.unit and attention.unit:key() == self._target_unit:key() then
		return
	end

	if alive(self._target_unit) and self._target_unit:base().is_local_player then
		self._target_unit:movement():on_targetted_for_attack(false, self._unit)
	end

	self._target_unit = nil
end

function ActionSpooc:complete()
	if self._beating_end_t and self._beating_end_t < TimerManager:game():time() then
		if self._is_flying_strike then
			if self._last_vel_z >= 0 then
				return true
			end
		else
			return true
		end
	end
end

function ActionSpooc:anim_act_clbk(anim_act)
	if anim_act ~= "strike" then
		return
	end

	local sound_string = "clk_punch_3rd_person_3p"

	if self._stroke_t then
		if self._strike_unit then
			self._unit:sound():play(sound_string)
		end

		return
	end

	self._stroke_t = TimerManager:game():time()
	self._unit:sound():play(sound_string)

	local detect_stop_sound = self:get_sound_event("detect_stop")

	if detect_stop_sound then
		self._unit:sound():play(detect_stop_sound)
	end

	if Global.game_settings.difficulty == "sm_wish" then
		MutatorCloakerEffect.effect_smoke(nil, self._unit)
	end

	managers.mutators:_run_func("OnPlayerCloakerKicked", self._unit)
	managers.modifiers:run_func("OnPlayerCloakerKicked", self._unit)

	if not self._is_local then
		if not self._is_flying_strike then
			self._beating_end_t = self._stroke_t + 1
		end

		return
	end

	if self:_chk_target_invalid() then
		if not self._is_flying_strike then
			if self._is_server then
				self:_expire()
			else
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			end
		end

		return
	end

	local target_vec = self._tmp_vec1

	mvec3_set(target_vec, self._target_unit:movement():m_com())
	mvec3_sub(target_vec, self._common_data.pos)

	local target_dis_z = math_abs(mvec3_z(target_vec))

	if target_dis_z > 200 then
		if not self._is_flying_strike then
			if self._is_server then
				self:_expire()
			else
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
				self:_wait()
			end
		end

		return
	end

	mvec3_set_z(target_vec, 0)

	if self._is_flying_strike then
		local angle = mvec3_angle(target_vec, self._common_data.fwd)
		local max_dis = math_lerp(170, 70, math_clamp(angle, 0, 90) / 90)
		local target_dis_xy = mvec3_norm(target_vec)

		if max_dis < target_dis_xy then
			return
		end
	end

	self._strike_unit = self._target_unit
	local spooc_res = nil

	if self._common_data.char_tweak.non_lethal_kick_damage and type(self._common_data.char_tweak.non_lethal_kick_damage) == "number" then
		if self._strike_unit:base().is_local_player then
			local player_head_pos = self._strike_unit:movement():m_head_pos()
			local attack_dir = player_head_pos - self._ext_movement:m_com()
			mvec3_norm(attack_dir)

			local push_vec = mvec3_copy(attack_dir)

			local attack_data = {
				variant = "melee",
				damage = self._common_data.char_tweak.non_lethal_kick_damage,
				attacker_unit = self._unit,
				push_vel = push_vec:with_z(0.1) * 600,
				col_ray = {
					position = mvec_copy(player_head_pos),
					unit = self._strike_unit,
					ray = mvec3_copy(attack_dir)
				}
			}

			local defense_data = self._strike_unit:character_damage():damage_melee(attack_data)

			if defense_data and defense_data ~= "friendly_fire" then
				if defense_data == "countered" then
					spooc_res = "countered"
				else
					self._beating_end_t = 0
				end
			end
		else
			local from_pos = self._is_flying_strike and self._unit:movement():m_head_pos() or self._unit:movement():m_com()
			local attack_dir = self._strike_unit:movement():m_com() - from_pos
			local distance = mvec3_norm(attack_dir)

			local attack_data = {
				damage = self._common_data.char_tweak.non_lethal_kick_damage,
				damage_effect = self._strike_unit:character_damage()._HEALTH_INIT,
				variant = "melee",
				attacker_unit = self._unit,
				attack_dir = attack_dir,
				col_ray = {
					position = mvector3.copy(self._strike_unit:movement():m_com()),
					body = self._strike_unit:body("body"),
					ray = attack_dir
				}
			}

			local defense_data = self._strike_unit:character_damage():damage_melee(attack_data)

			if defense_data and defense_data ~= "friendly_fire" then
				if defense_data == "countered" then
					spooc_res = "countered"
				else
					self._beating_end_t = 0

					if type(defense_data) == "table" and defense_data.type == "death" then
						managers.game_play_central:do_shotgun_push(self._strike_unit, attack_data.col_ray.position, attack_dir, distance, self._unit)
						managers.game_play_central:do_shotgun_push(self._strike_unit, attack_data.col_ray.position, attack_dir, distance, self._unit)
					end
				end
			end
		end
	elseif self._strike_unit:movement().on_SPOOCed then
		spooc_res = self._strike_unit:movement():on_SPOOCed(self._unit, self._is_flying_strike and "flying_strike")
	elseif self._strike_unit:character_damage().damage_melee then
		local from_pos = self._is_flying_strike and self._unit:movement():m_head_pos() or self._unit:movement():m_com()
		local attack_dir = self._strike_unit:movement():m_com() - from_pos
		local distance = mvec3_norm(attack_dir)

		local attack_data = {
			damage = self._strike_unit:character_damage()._HEALTH_INIT,
			damage_effect = self._strike_unit:character_damage()._HEALTH_INIT,
			variant = "melee",
			attacker_unit = self._unit,
			attack_dir = attack_dir,
			col_ray = {
				position = mvector3.copy(self._strike_unit:movement():m_com()),
				body = self._strike_unit:body("body"),
				ray = attack_dir
			}
		}

		local defense_data = self._strike_unit:character_damage():damage_melee(attack_data)

		if defense_data and defense_data ~= "friendly_fire" then
			if defense_data == "countered" then
				spooc_res = "countered"
			else
				self._beating_end_t = 0

				if type(defense_data) == "table" and defense_data.type == "death" then
					managers.game_play_central:do_shotgun_push(self._strike_unit, attack_data.col_ray.position, attack_dir, distance, self._unit)
					managers.game_play_central:do_shotgun_push(self._strike_unit, attack_data.col_ray.position, attack_dir, distance, self._unit)
				end
			end
		end
	end

	local expire = nil

	if spooc_res then
		if spooc_res == "countered" then
			if not self._is_server then
				self._ext_network:send_to_host("action_spooc_stop", self._ext_movement:m_pos(), 1, self._action_id)
			end

			self._blocks = {}

			local counter_ray = World:raycast("ray", self._strike_unit:movement():m_head_pos(), self._ext_movement:m_com(), "sphere_cast_radius", 20, "target_unit", self._unit)
			local action_data = {
				damage_effect = 1,
				damage = 0,
				variant = "counter_spooc",
				attacker_unit = self._strike_unit,
				col_ray = counter_ray,
				attack_dir = counter_ray.ray,
				name_id = self._strike_unit:base().is_local_player and managers.blackmarket:equipped_melee_weapon() or self._strike_unit:base().melee_weapon and self._strike_unit:base():melee_weapon() or nil
			}

			self._unit:character_damage():damage_melee(action_data)

			return
		else
			if self._strike_unit:character_damage():is_downed() or self._strike_unit:character_damage():arrested() then
				if self._strike_unit:base().is_local_player then
					self:_play_strike_camera_shake()
					mvec3_negate(target_vec)

					local dot_fwd = mvec3_dot(target_vec, self._common_data.fwd)
					local dot_r = mvec3_dot(target_vec, self._common_data.right)

					if math_abs(dot_r) < math_abs(dot_fwd) then
						if dot_fwd > 0 then
							managers.environment_controller:hit_feedback_front()
						else
							managers.environment_controller:hit_feedback_back()
						end
					elseif dot_r > 0 then
						managers.environment_controller:hit_feedback_right()
					else
						managers.environment_controller:hit_feedback_left()
					end
				end

				if self._is_flying_strike then
					if self._taunt_after_assault then
						self._unit:sound():say(self._taunt_after_assault, true, true)
					end
				else
					self._beating_end_t = self._stroke_t + self._beating_time
				end
			end
		end
	end
end

function ActionSpooc.chk_can_start_spooc_sprint(unit, target_unit)
	local enemy_tracker = target_unit:movement():nav_tracker()
	local ray_params = {
		allow_entry = true,
		trace = true,
		tracker_from = unit:movement():nav_tracker(),
		tracker_to = enemy_tracker
	}

	if enemy_tracker:lost() then
		ray_params.pos_to = enemy_tracker:field_position()
	end

	local col_ray = managers.navigation:raycast(ray_params)

	if col_ray then
		return
	end

	local z_diff_abs = math_abs(ray_params.trace[1].z - target_unit:movement():m_pos().z)

	if z_diff_abs > 200 then
		return
	end

	local ray_from = ActionSpooc._tmp_vec1
	local ray_to = ActionSpooc._tmp_vec2

	mvec3_set(ray_from, math_up)
	mvec3_set_z(ray_from, 120)

	local ray_to = ActionSpooc._tmp_vec2

	mvec3_set(ray_to, ray_from)
	mvec3_add(ray_from, unit:movement():m_pos())
	mvec3_add(ray_to, target_unit:movement():m_pos())

	local ray = unit:raycast("ray", ray_from, ray_to, "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk", "report")

	if ray then
		return
	end

	return true
end

function ActionSpooc.chk_can_start_flying_strike(unit, target_unit)
	local target_pos = target_unit:movement():m_pos()
	local my_pos = unit:movement():m_pos()
	local target_vec = ActionSpooc._tmp_vec1

	mvec3_set(target_vec, target_pos)
	mvec3_sub(target_vec, my_pos)

	local target_dis = mvec3_len(target_vec)

	if target_dis > 600 then
		return
	end

	mvec3_set_z(target_vec, 0)
	mvec3_norm(target_vec)

	local my_fwd = unit:movement():m_fwd()
	local dot = mvec3_dot(target_vec, my_fwd)

	if dot < 0.6 then
		return
	end

	local ray_from = ActionSpooc._tmp_vec1

	mvec3_set(ray_from, my_pos)
	mvec3_set_z(ray_from, mvec3_z(ray_from) + 160)

	local ray_to = ActionSpooc._tmp_vec2

	mvec3_set(ray_to, target_pos)
	mvec3_set_z(ray_to, mvec3_z(ray_to) + 160)
	mvec3_lerp(ray_to, ray_from, ray_to, 0.5)
	mvec3_set_z(ray_to, mvec3_z(ray_to) + 50)

	local sphere_radius = 25
	local ray = unit:raycast("ray", ray_from, ray_to, "sphere_cast_radius", sphere_radius, "bundle", 5, "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk", "report")

	if ray then
		return
	end

	mvec3_set(ray_from, target_pos)
	mvec3_set_z(ray_from, mvec3_z(ray_from) + 160)

	local ray = unit:raycast("ray", ray_from, ray_to, "sphere_cast_radius", sphere_radius, "bundle", 5, "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk", "report")

	if ray then
		return
	end

	return true
end

function ActionSpooc:_upd_flying_strike_first_frame(t)
	local target_pos = nil

	if self._is_local then
		target_pos = self._target_unit:movement():m_pos()

		self:_send_nav_point(target_pos)
	else
		target_pos = self._nav_path[#self._nav_path]
	end

	local my_pos = self._ext_movement:m_pos()
	local target_vec = self._tmp_vec1

	mvec3_set(target_vec, target_pos)
	mvec3_sub(target_vec, my_pos)

	local target_dis = mvec3_len(target_vec)
	local redir_result = nil

	if self._action_desc.start_anim_time then
		redir_result = self._ext_movement:play_redirect("spooc_flying_strike", self._action_desc.start_anim_time)

		self._ext_movement:set_position(self._ext_movement:m_pos():with_z(self._action_desc.flying_pos_z))
	else
		redir_result = self._ext_movement:play_redirect("spooc_flying_strike")
	end

	if not redir_result then
		--debug_pause_unit(self._unit, "[ActionSpooc:_chk_start_flying_strike] failed redirect spooc_flying_strike in ", self._machine:segment_state(ids_base), self._unit)

		return
	end

	self._ext_movement:spawn_wanted_items()

	local anim_travel_dis_xy = 470
	self._flying_strike_data = {
		start_pos = mvec3_copy(my_pos),
		start_rot = self._unit:rotation(),
		target_pos = mvec3_copy(target_pos),
		target_rot = Rotation(target_vec:with_z(0), math_up),
		start_t = TimerManager:game():time(),
		travel_dis_scaling_xy = target_dis / anim_travel_dis_xy
	}
	local speed_mul = 1

	if self._action_desc.flying_speed_mul then
		speed_mul = self._action_desc.flying_speed_mul
	else
		speed_mul = math_lerp(3, 1, math_min(1, self._flying_strike_data.travel_dis_scaling_xy))
	end

	self._machine:set_speed(redir_result, speed_mul)

	--[[if alive(self._target_unit) and self._target_unit:base().is_local_player then
		local enemy_vec = mvec3_copy(self._common_data.pos)

		mvec3_sub(enemy_vec, self._target_unit:movement():m_pos())
		mvec3_set_z(enemy_vec, 0)
		mvec3_norm(enemy_vec)
		self._target_unit:camera():camera_unit():base():clbk_aim_assist({
			ray = enemy_vec
		})
	end]]

	self:_set_updator("_upd_flying_strike")
end

function ActionSpooc:_upd_flying_strike(t)
	if self._ext_anim.act then
		local strike_data = self._flying_strike_data
		local seg_rel_t = self._machine:segment_relative_time(ids_base)
		local rot_correction_period = 0.07

		if seg_rel_t < rot_correction_period then
			local prog_lerp = (rot_correction_period - seg_rel_t) / rot_correction_period

			self._ext_movement:set_rotation(strike_data.start_rot:slerp(strike_data.target_rot, prog_lerp))
		elseif not strike_data.is_rot_aligned then
			self._ext_movement:set_rotation(strike_data.target_rot)
		end

		local delta_pos = self._unit:get_animation_delta_position()
		local delta_z = mvec3_z(delta_pos)

		mvec3_set_stat(delta_pos, mvec3_x(delta_pos) * strike_data.travel_dis_scaling_xy, mvec3_y(delta_pos) * strike_data.travel_dis_scaling_xy, delta_z)

		local new_pos = delta_pos
		mvec3_add(new_pos, self._common_data.pos)

		self._ext_movement:upd_ground_ray(new_pos, true)

		local gnd_z = self._common_data.gnd_ray.position.z

		if new_pos.z < gnd_z then
			mvec3_set_z(new_pos, gnd_z)

			self._ext_movement:set_position(new_pos)

			return
		end

		if self._stroke_t then
			if new_pos.z > gnd_z then
				self._last_vel_z = self._apply_freefall(new_pos, self._last_vel_z, gnd_z, TimerManager:game():delta_time())
			end

			if self._common_data.nav_tracker:lost() then
				local safe_pos = self._common_data.nav_tracker:field_position()

				mvec3_set_z(safe_pos, mvec3_z(self._common_data.pos))

				local dis_before = mvec3_dist_sq(safe_pos, self._common_data.pos)
				local dis_now = mvec3_dist_sq(self._common_data.pos, new_pos)

				if dis_before < dis_now then
					mvec3_set_stat(new_pos, mvec3_x(self._common_data.pos), mvec3_y(self._common_data.pos), mvec3_z(new_pos))
				end
			else
				local ray_params = {
					tracker_from = self._common_data.nav_tracker,
					pos_to = new_pos
				}

				if managers.navigation:raycast(ray_params) then
					mvec3_set_stat(new_pos, mvec3_x(self._common_data.pos), mvec3_y(self._common_data.pos), mvec3_z(new_pos))
				end
			end
		end

		self._ext_movement:set_position(new_pos)
	else
		local my_pos = self._tmp_vec1

		mvec3_set(my_pos, self._common_data.pos)
		self._ext_movement:upd_ground_ray(my_pos, true)

		local gnd_z = self._common_data.gnd_ray.position.z

		if gnd_z < my_pos.z then
			self._last_vel_z = self._apply_freefall(my_pos, self._last_vel_z, gnd_z, TimerManager:game():delta_time())
		else
			if my_pos.z < gnd_z then
				mvec3_set_z(my_pos, gnd_z)
			end

			self._last_vel_z = 0
			self._beating_end_t = 0

			self:_expire()
		end

		self._ext_movement:set_position(my_pos)
	end
end

function ActionSpooc:_play_strike_camera_shake()
	local vars = {
		"melee_hit",
		"melee_hit_var2"
	}

	self._strike_unit:camera():play_shaker(vars[math_random(#vars)], 1)
end

function ActionSpooc:is_flying_strike()
	return self._is_flying_strike
end

function ActionSpooc:get_sound_event(sound)
	local sound_events = self._common_data.char_tweak.spooc_sound_events

	if not sound_events then
		return
	end

	local event = sound_events[sound]

	if self:_use_christmas_sounds() then
		local christmas_events = {
			detect_stop = "cloaker_detect_christmas_stop",
			detect = "cloaker_detect_christmas_mono"
		}
		event = christmas_events[sound] or event
	end

	return event
end

function ActionSpooc:_get_current_max_walk_speed(move_dir)
	if move_dir == "l" or move_dir == "r" then
		move_dir = "strafe"
	end

	local speed = self._common_data.char_tweak.move_speed[self._ext_anim.pose][self._haste][self._stance.name][move_dir]

	if not self._is_local and self:_needs_speedup() then
		local ping_multiplier = 1
		local vis_multiplier = 1

		if not self._target_peer then
			local target_unit = self._target_unit

			if alive(target_unit) then
				if target_unit:base().is_husk_player then
					local peer_id = managers.network:session():peer_by_unit(target_unit):id()

					self._target_peer = managers.network:session():peer(peer_id)
				else
					self._target_peer = managers.network:session():peer(1)
				end
			end
		end

		if self._target_peer then
			ping_multiplier = ping_multiplier + Network:qos(self._target_peer:rpc()).ping / 1000
		end

		if Unit.occluded(self._unit) then
			vis_multiplier = 1.5
		else
			local lod = self._ext_base:lod_stage()
			local lod_multiplier_add = CopActionWalk.lod_multipliers[lod] or 0.65

			vis_multiplier = 0.85 + lod_multiplier_add
		end

		local final_multiplier = math_min(ping_multiplier * vis_multiplier, 2)
		speed = speed * final_multiplier
	end

	return speed
end

function ActionSpooc:_needs_speedup()
	if self._ext_movement._queued_actions and next(self._ext_movement._queued_actions) then
		return true
	elseif #self._nav_path > 2 then
		local nav_path = #self._nav_path
		local prev_pos = self._common_data.pos
		local i = 2
		local dis_error_total = 0

		while i <= nav_path do
			local next_pos = CopActionWalk._nav_point_pos(self._nav_path[i])
			dis_error_total = dis_error_total + mvec3_dist_sq(prev_pos, next_pos)
			prev_pos = next_pos
			i = i + 1
		end

		if dis_error_total > 90000 then
			return true
		end
	end
end
