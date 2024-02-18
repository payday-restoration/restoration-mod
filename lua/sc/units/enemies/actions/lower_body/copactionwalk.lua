local mvec3_set = mvector3.set
local mvec3_z = mvector3.z
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_lerp = mvector3.lerp
local mvec3_cpy = mvector3.copy
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_len = mvector3.length
local mvec3_rot = mvector3.rotate_with
local mrot_lookat = mrotation.set_look_at
local mrot_slerp = mrotation.slerp
local math_abs = math.abs
local math_max = math.max
local math_min = math.min
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_vec4 = Vector3()
local temp_rot1 = Rotation()
local idstr_base = Idstring("base")

-- Helper function to get the final path position
function CopActionWalk:get_destination_pos()
	return self._nav_point_pos(self._simplified_path and self._simplified_path[#self._simplified_path] or self._nav_path and self._nav_path[#self._nav_path])
end


-- Fix occasional incorrect animation speed
local idstr_base = Idstring("base")
function CopActionWalk:_adjust_move_anim(side, speed)
	local anim_data = self._ext_anim
	local same_haste = not anim_data.haste and anim_data[speed] or anim_data.haste == speed
	if same_haste and anim_data["move_" .. side] then
		return
	end

	local enter_t
	local redirect_name = speed .. "_" .. side
	local move_side = anim_data.move_side
	if move_side and (side == move_side or self._matching_walk_anims[side][move_side]) then
		local seg_rel_t = self._machine:segment_relative_time(idstr_base)

		if not self._walk_anim_lengths[anim_data.pose] or not self._walk_anim_lengths[anim_data.pose][self._stance.name] or not self._walk_anim_lengths[anim_data.pose][self._stance.name][speed] or not self._walk_anim_lengths[anim_data.pose][self._stance.name][speed][side] then
			return
		end

		local walk_anim_length = self._walk_anim_lengths[anim_data.pose][self._stance.name][speed][side]
		enter_t = seg_rel_t * walk_anim_length
	end

	local could_freeze = anim_data.can_freeze and anim_data.upper_body_empty
	local redir_res = self._ext_movement:play_redirect(redirect_name, enter_t)
	if could_freeze then
		self._ext_base:chk_freeze_anims()
	end

	return redir_res
end

--funni turn speed stuff
function CopActionWalk:_upd_start_anim(t)
	if not self._ext_anim.run_start then
		self._start_run = nil
		self._start_run_turn = nil
		local old_pos = self._curve_path[1]
		self._curve_path[1] = mvec3_cpy(self._common_data.pos)

		while self._curve_path[3] do
			mvec3_set(tmp_vec1, self._curve_path[2])
			mvec3_sub(tmp_vec1, self._curve_path[1])
			mvec3_set(tmp_vec2, self._curve_path[1])
			mvec3_sub(tmp_vec2, old_pos)

			if mvec3_dot(tmp_vec1, tmp_vec2) < 0 and not CopActionWalk._chk_shortcut_pos_to_pos(self._curve_path[1], self._curve_path[3], nil) then
				table.remove(self._curve_path, 2)
			else
				break
			end
		end

		self._last_pos = mvec3_cpy(self._common_data.pos)
		self._curve_path_index = 1
		self._start_max_vel = nil

		self:_set_updator(nil)
		self:update(t)

		return
	end

	local dt = TimerManager:game():delta_time()

	if self._start_run_turn then
		if self._ext_anim.run_start_full_blend then
			local seg_rel_t = self._machine:segment_relative_time(idstr_base)

			if not self._start_run_turn.start_seg_rel_t then
				self._start_run_turn.start_seg_rel_t = seg_rel_t
			end

			local delta_pos = self._common_data.unit:get_animation_delta_position()
			self._cur_vel = math_max(delta_pos:length() / dt, self._start_max_vel)
			local new_pos = self._common_data.pos + delta_pos
			local ray_params = {
				allow_entry = true,
				trace = true,
				tracker_from = self._common_data.nav_tracker,
				pos_to = new_pos
			}
			local collision = managers.navigation:raycast(ray_params)

			if collision then
				new_pos = ray_params.trace[1]
				local travel_vec = tmp_vec1

				mvec3_set(travel_vec, new_pos)
				mvec3_sub(travel_vec, self._last_pos)
				mvec3_set_z(travel_vec, 0)

				self._cur_vel = mvec3_len(travel_vec) / dt
				self._start_max_vel = self._cur_vel
			end

			self._last_pos = new_pos
			local seg_rel_t_clamp = math.clamp((seg_rel_t - self._start_run_turn.start_seg_rel_t) / 0.77, 0, 1)
			local prg_angle = self._start_run_turn[2] * seg_rel_t_clamp
			local new_yaw = self._start_run_turn[1] + prg_angle
			local rot_new = temp_rot1

			mrotation.set_yaw_pitch_roll(rot_new, new_yaw, 0, 0)
			self._ext_movement:set_rotation(rot_new)
		else
			self._start_run_turn.start_seg_rel_t = self._machine:segment_relative_time(idstr_base)
		end
	else
		if self._end_of_path then
			if self._next_is_nav_link then
				self._start_run = nil

				self:_set_updator("_upd_nav_link_first_frame")
				self:update(t)

				return
			elseif self._persistent then
				self._start_run = nil

				self:_set_updator("_upd_wait")
			else
				self._expired = true

				if self._end_rot then
					self._ext_movement:set_rotation(self._end_rot)
				end
			end

			return
		else
			self:_nav_chk_walk(t, dt, 1)
		end

		if not self._end_of_curved_path then
			local wanted_u_fwd = tmp_vec1
				local rotate_mult = self._common_data.char_tweak.rotation_speed or 3

			mvector3.direction(wanted_u_fwd, self._common_data.pos, self._curve_path[self._curve_path_index + 1])
			mvec3_rot(wanted_u_fwd, self._walk_side_rot[self._start_run_straight])
			mrot_lookat(temp_rot1, wanted_u_fwd, math.UP)
			mrot_slerp(temp_rot1, self._common_data.rot, temp_rot1, math.min(1, dt * rotate_mult))
			self._ext_movement:set_rotation(temp_rot1)
		end
	end

	self:_set_new_pos(dt)
end

function CopActionWalk:_upd_stop_anim(t)
	local dt = TimerManager:game():delta_time()
	local rotate_mult = self._common_data.char_tweak.rotation_speed or 3
	local rot_new = self._common_data.rot:slerp(Rotation(self._stop_anim_fwd, math.UP), math.min(1, dt * rotate_mult))

	self._ext_movement:set_rotation(rot_new)

	if not self._ext_anim.run_stop then
		if #self._simplified_path > 2 or self._next_is_nav_link then
			self:_set_updator(nil)
		elseif self._persistent then
			self:_set_updator("_upd_wait")
		else
			self._expired = true

			if self._end_rot then
				self._ext_movement:set_rotation(self._end_rot)
			end
		end

		self._last_pos = mvec3_cpy(self._stop_anim_end_pos)
		self._stop_anim_displacement_f = nil
		self._stop_anim_end_pos = nil
		self._stop_anim_fwd = nil
		self._stop_anim_init_pos = nil
		self._stop_anim_side = nil
		self._stop_dis = nil
	else
		local seg_rel_t = self._machine:segment_relative_time(idstr_base)
		self._last_pos = self._stop_anim_displacement_f(self._stop_anim_init_pos, self._stop_anim_end_pos, seg_rel_t)
	end

	self:_set_new_pos(dt)
end

function CopActionWalk:update(t)
	local dt = nil
	local vis_state = self._ext_base:lod_stage()
	vis_state = vis_state or 4

	if vis_state == 1 then
		dt = t - self._last_upd_t
		self._last_upd_t = TimerManager:game():time()
	elseif self._skipped_frames < vis_state then
		self._skipped_frames = self._skipped_frames + 1

		return
	else
		self._skipped_frames = 1
		dt = t - self._last_upd_t
		self._last_upd_t = TimerManager:game():time()
	end

	if self._ik_update then
		self._ik_update(t)
	end

	local pos_new = nil

	if self._end_of_path and (not self._ext_anim.act or not self._ext_anim.walk) then
		if self._next_is_nav_link then
			self:_set_updator("_upd_nav_link_first_frame")
			self:update(t)

			return
		elseif self._persistent then
			self:_set_updator("_upd_wait")
		else
			self._expired = true

			if self._end_rot then
				self._ext_movement:set_rotation(self._end_rot)
			end
		end
	else
		self:_nav_chk_walk(t, dt, vis_state)
	end

	local move_dir = tmp_vec3

	mvec3_set(move_dir, self._last_pos)
	mvec3_sub(move_dir, self._common_data.pos)
	mvec3_set_z(move_dir, 0)

	if self._cur_vel < 0.1 or self._ext_anim.act and self._ext_anim.walk then
		move_dir = nil
	end

	local anim_data = self._ext_anim

	if move_dir and not self._expired then
		local face_fwd = tmp_vec1
		local wanted_walk_dir = nil
		local move_dir_norm = move_dir:normalized()

		if self._no_strafe or self._walk_turn then
			wanted_walk_dir = "fwd"
		else
			if self._curve_path_end_rot and mvector3.distance_sq(self._last_pos, self._footstep_pos) < 19600 then
				mvec3_set(face_fwd, self._common_data.fwd)
			elseif self._attention_pos then
				mvec3_set(face_fwd, self._attention_pos)
				mvec3_sub(face_fwd, self._common_data.pos)
			elseif self._footstep_pos then
				mvec3_set(face_fwd, self._footstep_pos)
				mvec3_sub(face_fwd, self._common_data.pos)
			else
				mvec3_set(face_fwd, self._common_data.fwd)
			end

			mvec3_set_z(face_fwd, 0)
			mvec3_norm(face_fwd)

			local face_right = tmp_vec2

			mvec3_cross(face_right, face_fwd, math.UP)
			mvec3_norm(face_right)

			local right_dot = mvec3_dot(move_dir_norm, face_right)
			local fwd_dot = mvec3_dot(move_dir_norm, face_fwd)

			if math_abs(right_dot) < math_abs(fwd_dot) then
				if (anim_data.move_l and right_dot < 0 or anim_data.move_r and right_dot > 0) and math_abs(fwd_dot) < 0.73 then
					wanted_walk_dir = anim_data.move_side
				elseif fwd_dot > 0 then
					wanted_walk_dir = "fwd"
				else
					wanted_walk_dir = "bwd"
				end
			elseif (anim_data.move_fwd and fwd_dot > 0 or anim_data.move_bwd and fwd_dot < 0) and math_abs(right_dot) < 0.73 then
				wanted_walk_dir = anim_data.move_side
			elseif right_dot > 0 then
				wanted_walk_dir = "r"
			else
				wanted_walk_dir = "l"
			end
		end

		local rot_new = nil

		if self._curve_path_end_rot then
			local dis_lerp = 1 - math.min(1, mvec3_dis(self._last_pos, self._footstep_pos) / 140)
			rot_new = temp_rot1

			mrot_slerp(rot_new, self._curve_path_end_rot, self._nav_link_rot or self._end_rot, dis_lerp)
		else
			local wanted_u_fwd = tmp_vec1
			local rotate_mult = self._common_data.char_tweak.rotation_speed or 3

			mvec3_set(wanted_u_fwd, move_dir_norm)
			mvec3_rot(wanted_u_fwd, self._walk_side_rot[wanted_walk_dir])
			mrot_lookat(temp_rot1, wanted_u_fwd, math.UP)

			rot_new = temp_rot1

			mrot_slerp(rot_new, self._common_data.rot, rot_new, math.min(1, dt * rotate_mult))
		end

		self._ext_movement:set_rotation(rot_new)

		if self._chk_stop_dis and not self._was_interrupted and not self._common_data.char_tweak.no_run_stop then
			local end_dis = mvec3_dis(self._nav_point_pos(self._simplified_path[#self._simplified_path]), self._last_pos)

			if end_dis < self._chk_stop_dis then
				local stop_anim_fwd = not self._nav_link_rot and self._end_rot and self._end_rot:y() or move_dir_norm:rotate_with(self._walk_side_rot[wanted_walk_dir])
				local fwd_dot = mvec3_dot(stop_anim_fwd, move_dir_norm)
				local move_dir_r_norm = tmp_vec3

				mvec3_cross(move_dir_r_norm, move_dir_norm, math.UP)

				local fwd_dot = mvec3_dot(stop_anim_fwd, move_dir_norm)
				local r_dot = mvec3_dot(stop_anim_fwd, move_dir_r_norm)
				local stop_anim_side = nil

				if math.abs(r_dot) < math.abs(fwd_dot) then
					if fwd_dot > 0 then
						stop_anim_side = "fwd"
					else
						stop_anim_side = "bwd"
					end
				elseif r_dot > 0 then
					stop_anim_side = "l"
				else
					stop_anim_side = "r"
				end

				local stop_pose = nil
				stop_pose = (not self._action_desc.end_pose or self._action_desc.end_pose) and (self._ext_anim.pose or self._fallback_pose)

				if stop_pose ~= self._ext_anim.pose then
					local pose_redir_res = self._ext_movement:play_redirect(stop_pose)

					if not pose_redir_res then
						debug_pause_unit(self._unit, "STOP POSE FAIL!!!", self._unit, stop_pose)
					end
				end

				local stop_dis = self._anim_movement[stop_pose]["run_stop_" .. stop_anim_side]

				if stop_dis and end_dis < stop_dis then
					self._stop_anim_side = stop_anim_side
					self._stop_anim_fwd = stop_anim_fwd
					self._stop_dis = stop_dis

					self:_set_updator("_upd_stop_anim_first_frame")
				end
			end
		elseif self._walk_turn and not self._chk_stop_dis then
			local end_dis = mvec3_dis(self._curve_path[self._curve_path_index + 1], self._last_pos)

			if end_dis < 45 then
				self:_set_updator("_upd_walk_turn_first_frame")
			end
		end

		local pose = self._stance.values[4] > 0 and "wounded" or self._ext_anim.pose or self._fallback_pose
		local real_velocity = self._cur_vel
		local variant = self._haste

		if variant == "run" and not self._no_walk then
			if self._ext_anim.sprint then
				if real_velocity > 480 and self._ext_anim.pose == "stand" then
					variant = "sprint"
				elseif real_velocity > 250 then
					variant = "run"
				else
					variant = "walk"
				end
			elseif self._ext_anim.run then
				if not self._walk_anim_velocities[pose] then
					debug_pause_unit(self._unit, "No walk anim velocities for pose:", pose, inspect(self._walk_anim_velocities), self._unit)
				elseif not self._walk_anim_velocities[pose][self._stance.name] then
					debug_pause_unit(self._unit, "No walk anim velocities for (pose, stance name):", pose, self._stance.name, inspect(self._walk_anim_velocities), inspect(self._walk_anim_velocities[pose]), self._unit)
				elseif real_velocity > 530 and self._walk_anim_velocities[pose] and self._walk_anim_velocities[pose][self._stance.name] and self._walk_anim_velocities[pose][self._stance.name].sprint and self._ext_anim.pose == "stand" then
					variant = "sprint"
				elseif real_velocity > 250 then
					variant = "run"
				else
					variant = "walk"
				end
			elseif real_velocity > 530 and self._walk_anim_velocities[pose][self._stance.name].sprint and self._ext_anim.pose == "stand" then
				variant = "sprint"
			elseif real_velocity > 300 then
				variant = "run"
			else
				variant = "walk"
			end
		end

		if not safe_get_value(self._walk_anim_velocities, pose, self._stance.name, variant, wanted_walk_dir) then
			debug_pause("Boom...", self._common_data.unit, "pose", pose, "stance", self._stance.name, "variant", variant, "wanted_walk_dir", wanted_walk_dir, self._machine:segment_state(Idstring("base")))

			if not safe_get_value(self._walk_anim_velocities, pose, self._stance.name) and self._stance.name == "ntl" then
				self._stance.name = "cbt"
			end

			while not safe_get_value(self._walk_anim_velocities, pose, self._stance.name, variant) do
				if variant == "sprint" then
					variant = "run"
				end

				if variant == "run" then
					variant = "walk"
				end
			end

			if not safe_get_value(self._walk_anim_velocities, pose, self._stance.name, variant, wanted_walk_dir) then
				return
			end
		end

		self:_adjust_move_anim(wanted_walk_dir, variant)

		local anim_walk_speed = self._walk_anim_velocities[pose][self._stance.name][variant][wanted_walk_dir]
		local wanted_walk_anim_speed = real_velocity / anim_walk_speed

		self:_adjust_walk_anim_speed(dt, wanted_walk_anim_speed)
	end

	self:_set_new_pos(dt)
end

if Network:is_client() then
	return
end


-- Fix pathing start position (should always be our current position)
Hooks:PreHook(CopActionWalk, "init", "sh_init", function (self, action_desc, common_data)
	local pos =  common_data.pos
	local from_pos = action_desc.nav_path[1]
	if pos.x ~= from_pos.x or pos.y ~= from_pos.y then
		table.insert(action_desc.nav_path, 1, mvector3.copy(common_data.pos))
	end
end)
