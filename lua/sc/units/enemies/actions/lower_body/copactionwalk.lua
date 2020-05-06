local mvec3_set = mvector3.set
local mvec3_z = mvector3.z
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_negate = mvector3.negate
local mvec3_lerp = mvector3.lerp
local mvec3_cpy = mvector3.copy
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_dir = mvector3.direction
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_len = mvector3.length
local mvec3_rot = mvector3.rotate_with
local mvec3_set_stat = mvector3.set_static
local mvec3_bezier = mvector3.bezier
local mrot_lookat = mrotation.set_look_at
local mrot_set = mrotation.set_yaw_pitch_roll
local mrot_yaw = mrotation.yaw
local mrot_slerp = mrotation.slerp
local math_abs = math.abs
local math_max = math.max
local math_min = math.min
local math_lerp = math.lerp
local math_step = math.step
local math_clamp = math.clamp
local math_ceil = math.ceil
local math_sign = math.sign
local math_up = math.UP
local table_insert = table.insert
local table_remove = table.remove
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_vec4 = Vector3()
local temp_rot1 = Rotation()
local idstr_base = Idstring("base")

function CopActionWalk:init(action_desc, common_data)
	self._common_data = common_data
	self._action_desc = action_desc
	self._unit = common_data.unit
	self._ext_brain = common_data.ext_brain
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._ext_network = common_data.ext_network
	self._body_part = action_desc.body_part

	self:_init_ik()

	self._machine = common_data.machine
	self._stance = common_data.stance

	self:on_attention(common_data.attention)

	self._last_vel_z = 0
	self._cur_vel = 0
	self._end_rot = action_desc.end_rot

	CopActionAct._create_blocks_table(self, action_desc.blocks)

	self._persistent = action_desc.persistent
	self._haste = action_desc.variant
	self._start_t = TimerManager:game():time()
	self._no_walk = action_desc.no_walk
	self._no_strafe = action_desc.no_strafe
	self._last_pos = mvec3_cpy(common_data.pos)
	self._nav_path = action_desc.nav_path
	self._last_upd_t = self._start_t - 0.001
	self._sync = Network:is_server()
	self._skipped_frames = 1

	if self._ext_anim.needs_idle then
		self._waiting_full_blend = true

		self:_set_updator("_upd_wait_for_full_blend")

		if self._sync then
			common_data.ext_brain:add_pos_rsrv("move_dest", {
				radius = 30,
				position = mvec3_cpy(self._nav_point_pos(self._nav_path[#self._nav_path]))
			})
		end
	elseif not self:_init() then
		return
	end

	common_data.ext_movement:enable_update()

	self._is_civilian = CopDamage.is_civilian(common_data.ext_base._tweak_table)

	return true
end

function CopActionWalk:_init()
	if not self:_sanitize() then
		return
	end

	self._init_called = true
	self._walk_velocity = self:_get_max_walk_speed()
	local action_desc = self._action_desc
	local common_data = self._common_data

	if self._sync then
		if managers.groupai:state():all_AI_criminals()[common_data.unit:key()] then
			self._nav_link_invul = true
		end

		local nav_path = {}

		for i, nav_point in ipairs(self._nav_path) do
			if nav_point.x then
				table_insert(nav_path, nav_point)
			elseif alive(nav_point) then
				table_insert(nav_path, {
					element = nav_point:script_data().element,
					c_class = nav_point
				})
			else
				return false
			end
		end

		self._nav_path = nav_path
	else
		if not action_desc.interrupted or not self._nav_path[1].x then
			table_insert(self._nav_path, 1, mvec3_cpy(common_data.pos))
		else
			self._nav_path[1] = mvec3_cpy(common_data.pos)
		end

		for i, nav_point in ipairs(self._nav_path) do
			if not nav_point.x then
				function nav_point.element.value(element, name)
					return element[name]
				end

				function nav_point.element.nav_link_wants_align_pos(element)
					return element.from_idle
				end
			end
		end

		if not action_desc.host_stop_pos_ahead and self._nav_path[2] then
			local ray_params = {
				tracker_from = common_data.nav_tracker,
				pos_to = self._nav_point_pos(self._nav_path[2])
			}

			if managers.navigation:raycast(ray_params) then
				table_insert(self._nav_path, 2, mvec3_cpy(self._ext_movement:m_host_stop_pos()))

				self._host_stop_pos_ahead = true
			end
		end
	end

	if action_desc.path_simplified and action_desc.persistent then
		if self._sync then
			local original_path = self._nav_path
			local new_nav_points = self._simplified_path
			local s_path = {}

			for _, nav_point in ipairs(original_path) do
				local np = nav_point.x and mvec3_cpy(nav_point) or nav_point

				table_insert(s_path, np)
			end

			if new_nav_points then
				for _, nav_point in ipairs(new_nav_points) do
					local np = nav_point.x and mvec3_cpy(nav_point) or nav_point

					table_insert(s_path, np)
				end
			end

			self._simplified_path = s_path
		else
			self._simplified_path = self._nav_path
		end
	elseif not managers.groupai:state():enemy_weapons_hot() then
		self._simplified_path = self._nav_path
	else
		local good_pos = mvec3_cpy(common_data.pos)
		local nr_iterations = 1

		if not self._sync or common_data.stance.name == "ntl" then
			nr_iterations = 2
		end

		self._simplified_path = self._calculate_simplified_path(good_pos, self._nav_path, nr_iterations, self._sync, true)
	end

	if not self._simplified_path[2].x then
		self._next_is_nav_link = self._simplified_path[2]
	end

	self._curve_path_index = 1

	self:_chk_start_anim(CopActionWalk._nav_point_pos(self._simplified_path[2]))

	if self._start_run then
		self:_set_updator("_upd_start_anim_first_frame")
	end

	if not self._start_run_turn and mvec3_dis(self._nav_point_pos(self._simplified_path[2]), self._simplified_path[1]) > 400 and self._ext_base:lod_stage() == 1 then
		self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1)
	else
		self._curve_path = {
			self._simplified_path[1],
			mvec3_cpy(self._nav_point_pos(self._simplified_path[2]))
		}
	end

	if #self._simplified_path == 2 and not self._NO_RUN_STOP and not self._no_walk and self._haste ~= "walk" and mvec3_dis(self._curve_path[2], self._curve_path[1]) >= 120 then
		self._chk_stop_dis = 210
	end

	if self._sync then
		local sync_yaw = 0

		if self._end_rot then
			local yaw = self._end_rot:yaw()

			if yaw < 0 then
				yaw = 360 + yaw
			end

			sync_yaw = 1 + math_ceil(yaw * 254 / 360)
		end

		local sync_haste = self._haste == "walk" and 1 or 2
		local nav_link_act_index, nav_link_act_yaw = nil
		local next_nav_point = self._simplified_path[2]
		local nav_link_from_idle = false

		if next_nav_point.x then
			nav_link_act_index = 0
			nav_link_act_yaw = 1
		else
			nav_link_act_index = CopActionAct._get_act_index(CopActionAct, next_nav_point.element:value("so_action"))
			nav_link_act_yaw = next_nav_point.element:value("rotation")

			if nav_link_act_yaw < 0 then
				nav_link_act_yaw = 360 + nav_link_act_yaw
			end

			nav_link_act_yaw = math_ceil(255 * nav_link_act_yaw / 360)

			if nav_link_act_yaw == 0 then
				nav_link_act_yaw = 255
			end

			if next_nav_point.element:nav_link_wants_align_pos() then
				nav_link_from_idle = true
			end

			self._nav_link_synched_with_start = true
		end

		local pose_code = nil

		if not action_desc.pose then
			pose_code = 0
		elseif action_desc.pose == "stand" then
			pose_code = 1
		else
			pose_code = 2
		end

		local end_pose_code = nil

		if not action_desc.end_pose then
			end_pose_code = 0
		elseif action_desc.end_pose == "stand" then
			end_pose_code = 1
		else
			end_pose_code = 2
		end

		self._ext_network:send("action_walk_start", self._nav_point_pos(next_nav_point), nav_link_act_yaw, nav_link_act_index, nav_link_from_idle, sync_haste, sync_yaw, self._no_walk and true or false, self._no_strafe and true or false, pose_code, end_pose_code)

		common_data.ext_brain:rem_pos_rsrv("stand")
		common_data.ext_brain:add_pos_rsrv("move_dest", {
			radius = 30,
			position = mvec3_cpy(self._simplified_path[#self._simplified_path])
		})
	else
		local pose = action_desc.pose

		if pose and not common_data.ext_anim[pose] then
			if pose == "stand" then
				CopActionStand:new(action_desc, common_data)
			else
				CopActionCrouch:new(action_desc, common_data)
			end
		end
	end

	return true
end

function CopActionWalk:_sanitize()
	if not self._ext_anim.pose then
		self._ext_movement:play_redirect("idle")

		if not self._ext_anim.pose and not self._ext_movement:play_state("std/stand/still/idle/look") then
			return
		end
	end

	if not self._sync and not self._walk_anim_lengths[self._ext_anim.pose] then
		self._ext_movement:play_redirect("stand")
	end

	return true
end

function CopActionWalk:_chk_start_anim(next_pos)
	if self._haste ~= "run" or self._common_data.char_tweak.no_run_start then
		return
	end

	local lod_stage = self._ext_base:lod_stage()

	if not lod_stage or lod_stage > 2 then
		return
	end

	local can_turn_and_fire = true
	local path_dir = next_pos - self._common_data.pos
	mvec3_set_z(path_dir, 0)

	local path_len = mvec3_norm(path_dir)
	local path_angle = path_dir:to_polar_with_reference(self._common_data.fwd, math_up).spin

	if self._attention_pos then
		local target_vec = self._attention_pos - self._common_data.pos
		target_vec = target_vec:normalized():with_z(0)

		local fwd_dot = mvec3_dot(path_dir, target_vec)

		if fwd_dot < 0.7 then
			can_turn_and_fire = nil
		end
	end

	if math_abs(path_angle) > 135 then
		if can_turn_and_fire then
			local pose = self._ext_anim.pose
			local spline_data = self._anim_movement[pose].run_start_turn_bwd
			local ds = spline_data.ds

			if ds:length() < path_len - 100 then
				if path_angle > 0 then
					path_angle = path_angle - 360
				end

				self._start_run_turn = {
					self._common_data.rot:yaw(),
					path_angle,
					"bwd"
				}
			end
		end
	elseif path_angle < -65 then
		if can_turn_and_fire then
			local pose = self._ext_anim.pose
			local spline_data = self._anim_movement[pose].run_start_turn_r
			local ds = spline_data.ds

			if ds:length() < path_len - 100 then
				self._start_run_turn = {
					self._common_data.rot:yaw(),
					path_angle,
					"r"
				}
			end
		end
	elseif path_angle > 65 and can_turn_and_fire then
		local pose = self._ext_anim.pose
		local spline_data = self._anim_movement[pose].run_start_turn_l
		local ds = spline_data.ds

		if ds:length() < path_len - 100 then
			self._start_run_turn = {
				self._common_data.rot:yaw(),
				path_angle,
				"l"
			}
		end
	end

	self._start_run = true
	self._root_blend_disabled = true

	self._ext_movement:set_root_blend(false)

	if not self._start_run_turn then
		local right_dot = mvec3_dot(path_dir, self._common_data.right)
		local fwd_dot = mvec3_dot(path_dir, self._common_data.fwd)

		if math_abs(right_dot) < math_abs(fwd_dot) then
			self._start_run_straight = fwd_dot > 0 and "fwd" or "bwd"
		else
			self._start_run_straight = right_dot > 0 and "r" or "l"
		end
	end
end

function CopActionWalk._calculate_shortened_path(path)
	local index = 2
	local test_pos = tmp_vec1

	while index < #path do
		if path[index].x and path[index - 1].x then
			mvec3_lerp(test_pos, path[index - 1], path[index], 0.8)

			local fwd_pos = CopActionWalk._nav_point_pos(path[index + 1])
			local ray_fwd = CopActionWalk._chk_shortcut_pos_to_pos(test_pos, fwd_pos, true)

			if not ray_fwd then
				mvec3_set(path[index], test_pos)
			end
		end

		index = index + 1
	end
end

local diagonals = {
	tmp_vec1,
	tmp_vec2
}

function CopActionWalk._apply_padding_to_simplified_path(path)
	local dim_mag = 212.132

	mvec3_set_stat(tmp_vec1, dim_mag, dim_mag, 0)
	mvec3_set_stat(tmp_vec2, dim_mag, -dim_mag, 0)

	local index = 2
	local offset = tmp_vec3
	local to_pos = tmp_vec4

	while index < #path do
		local pos = path[index]

		if pos.x then
			for _, diagonal in ipairs(diagonals) do
				mvec3_set(to_pos, pos)
				mvec3_add(to_pos, diagonal)

				local col_pos, trace = CopActionWalk._chk_shortcut_pos_to_pos(pos, to_pos, true)

				mvec3_set(offset, trace[1])
				mvec3_set(to_pos, pos)
				mvec3_mul(diagonal, -1)
				mvec3_add(to_pos, diagonal)

				col_pos, trace = CopActionWalk._chk_shortcut_pos_to_pos(pos, to_pos, true)

				mvec3_lerp(offset, offset, trace[1], 0.5)

				local ray_fwd = CopActionWalk._chk_shortcut_pos_to_pos(offset, CopActionWalk._nav_point_pos(path[index + 1]))

				if ray_fwd then
					break
				else
					local ray_bwd = CopActionWalk._chk_shortcut_pos_to_pos(offset, CopActionWalk._nav_point_pos(path[index - 1]))

					if ray_bwd then
						break
					end
				end

				mvec3_set(pos, offset)
			end

			index = index + 1
		else
			index = index + 2
		end
	end
end

local raycast_params = {}

function CopActionWalk:_calculate_curved_path(path, index, curvature_factor, enter_dir)
	local p1 = self._nav_point_pos(path[index])
	local p4 = self._nav_point_pos(path[index + 1])
	local p2, p3 = nil
	local curved_path = {
		mvec3_cpy(p1)
	}
	local segment_dis = mvec3_dis(p4, p1)
	local vec_out = tmp_vec1
	local vec_in = tmp_vec2
	local nr_control_pts = 2

	if enter_dir or self._unit:anim_data().move then
		nr_control_pts = nr_control_pts + 1

		if enter_dir then
			mvec3_set(vec_out, enter_dir)
		else
			self._unit:m_position(vec_out)
			mvec3_sub(vec_out, path[index])
			mvec3_negate(vec_out)
		end

		mvec3_set_l(vec_out, segment_dis)
		mvec3_set(vec_in, p4)
		mvec3_sub(vec_in, p1)
		mvec3_set_l(vec_in, segment_dis * curvature_factor)
		mvec3_add(vec_out, vec_in)
		mvec3_set_z(vec_out, 0)
		mvec3_set_l(vec_out, segment_dis * 0.3)

		p2 = tmp_vec3

		mvec3_set(p2, p1)
		mvec3_add(p2, vec_out)
	end

	if path[index + 2] and p2 then
		nr_control_pts = nr_control_pts + 1

		mvec3_set(vec_out, p4)
		mvec3_sub(vec_out, self._nav_point_pos(path[index + 2]))
		mvec3_set_l(vec_out, segment_dis)
		mvec3_set(vec_in, p1)
		mvec3_sub(vec_in, p2)
		mvec3_set_l(vec_in, segment_dis * curvature_factor)
		mvec3_add(vec_out, vec_in)
		mvec3_set_z(vec_out, 0)
		mvec3_set_l(vec_out, segment_dis * 0.3)

		p3 = tmp_vec4

		mvec3_set(p3, p4)
		mvec3_add(p3, vec_out)
	end

	local function _on_fail()
		if curvature_factor < 1 then
			while #curved_path > 1 do
				table_remove(curved_path)
			end

			table_insert(curved_path, mvec3_cpy(p4))

			return curved_path
		else
			return self:_calculate_curved_path(path, index, 0.5, enter_dir)
		end
	end

	if nr_control_pts > 2 then
		local nr_samples = 7
		local prev_pos = curved_path[1]

		for i = 1, nr_samples - 1 do
			local pos = tmp_vec1

			if nr_control_pts == 2 then
				mvec3_bezier(pos, p1, p4, i / nr_samples)
			elseif nr_control_pts == 3 then
				mvec3_bezier(pos, p1, p2 or p3, p4, i / nr_samples)
			else
				mvec3_bezier(pos, p1, p2, p3, p4, i / nr_samples)
			end

			raycast_params.pos_from = prev_pos
			raycast_params.pos_to = pos
			local shortcut_raycast = managers.navigation:raycast(raycast_params)

			if shortcut_raycast then
				return _on_fail()
			end

			table_insert(curved_path, mvec3_cpy(pos))

			prev_pos = curved_path[#curved_path]
		end

		raycast_params.pos_from = prev_pos
		raycast_params.pos_to = p4
		local shortcut_raycast = managers.navigation:raycast(raycast_params)

		if shortcut_raycast then
			return _on_fail()
		end

		table_insert(curved_path, mvec3_cpy(p4))
	else
		table_insert(curved_path, mvec3_cpy(p4))
	end

	return curved_path
end

function CopActionWalk:on_exit()
	if self._expired and self._end_rot then
		self._ext_movement:set_rotation(self._end_rot)
	end

	if self._root_blend_disabled then
		self._ext_movement:set_root_blend(true)
	end

	if self._changed_driving then
		self._common_data.unit:set_driving("script")

		self._changed_driving = nil
	end

	if self._expired and self._common_data.ext_anim.move then
		self:_stop_walk()
	end

	self._ext_movement:drop_held_items()

	if self._sync then
		if not self._expired then
			self._ext_network:send("action_walk_nav_point", mvec3_cpy(self._ext_movement:m_pos()))
		end

		self._ext_network:send("action_walk_stop")
	else
		self._ext_movement:set_m_host_stop_pos(self._ext_movement:m_pos())
	end

	if self._nav_link_invul_on then
		self._nav_link_invul_on = nil

		self._common_data.ext_damage:set_invulnerable(false)
	end

	if self._sync then
		self._ext_brain:rem_pos_rsrv("move_dest")
	end
end

function CopActionWalk:_upd_wait_for_full_blend(t)
	if self._ext_anim.needs_idle and not self._ext_anim.to_idle then
		local res = self._ext_movement:play_redirect("idle")

		if not res then
			return
		end

		self._ext_movement:spawn_wanted_items()
	end

	if not self._ext_anim.to_idle and self._ext_anim.idle_full_blend then
		self._waiting_full_blend = nil

		if self:_init() then
			self._ext_movement:drop_held_items()

			if self.update == self._upd_wait_for_full_blend then
				self:_set_updator(nil)
			end
		else
			if self._sync then
				self._expired = true

				self._ext_network:send("action_walk_nav_point", mvec3_cpy(self._ext_movement:m_pos()))
			end

			return
		end
	else
		self._ext_movement:set_m_rot(self._unit:rotation())
		self._ext_movement:set_m_pos(self._unit:position())
	end
end

function CopActionWalk:update(t)
	if self._ik_update then
		self._ik_update(t)
	end

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

	local pos_new = nil
	local anim_data = self._ext_anim
	local chk_end_of_path = nil

	if self._end_of_path then
		if not anim_data.act or not anim_data.walk then
			chk_end_of_path = true
		end
	end

	if chk_end_of_path then
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

	if self._cur_vel < 0.1 or anim_data.act and anim_data.walk then
		move_dir = nil
	end

	if move_dir and not self._expired then
		local face_fwd = tmp_vec1
		local wanted_walk_dir = nil
		local move_dir_norm = move_dir:normalized()

		if self._no_strafe or self._walk_turn then
			wanted_walk_dir = "fwd"
		else
			if self._curve_path_end_rot and mvec3_dis_sq(self._last_pos, self._footstep_pos) < 19600 then
				mvec3_set(face_fwd, self._common_data.fwd)
			elseif self._attention_pos then
				mvec3_set(face_fwd, self._attention_pos)
				mvec3_sub(face_fwd, self._common_data.pos)
			elseif self._footstep_pos then
				mvec3_set(face_fwd, self._footstep_pos)
				mvec3_sub(face_fwd, self._common_data.pos)
			else
				mvec3_set(face_fwd, move_dir)
			end

			mvec3_set_z(face_fwd, 0)
			mvec3_norm(face_fwd)

			local face_right = tmp_vec2

			mvec3_cross(face_right, face_fwd, math_up)
			mvec3_norm(face_right)

			local right_dot = mvec3_dot(move_dir_norm, face_right)
			local fwd_dot = mvec3_dot(move_dir_norm, face_fwd)

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
		end

		local rot_new = nil

		if self._curve_path_end_rot then
			local dis_lerp = 1 - math_min(1, mvec3_dis(self._last_pos, self._footstep_pos) / 140)
			rot_new = temp_rot1

			mrot_slerp(rot_new, self._curve_path_end_rot, self._nav_link_rot or self._end_rot, dis_lerp)
		else
			local wanted_u_fwd = tmp_vec1

			mvec3_set(wanted_u_fwd, move_dir_norm)
			mvec3_rot(wanted_u_fwd, self._walk_side_rot[wanted_walk_dir])
			mrot_lookat(temp_rot1, wanted_u_fwd, math_up)

			rot_new = temp_rot1

			mrot_slerp(rot_new, self._common_data.rot, rot_new, math_min(1, dt * 5))
		end

		self._ext_movement:set_rotation(rot_new)

		if self._chk_stop_dis and not self._common_data.char_tweak.no_run_stop then
			local end_dis = mvec3_dis(self._nav_point_pos(self._simplified_path[#self._simplified_path]), self._last_pos)

			if end_dis < self._chk_stop_dis then
				local stop_anim_fwd = not self._nav_link_rot and self._end_rot and self._end_rot:y() or move_dir_norm:rotate_with(self._walk_side_rot[wanted_walk_dir])
				local fwd_dot = mvec3_dot(stop_anim_fwd, move_dir_norm)
				local move_dir_r_norm = tmp_vec3

				mvec3_cross(move_dir_r_norm, move_dir_norm, math_up)

				local fwd_dot = mvec3_dot(stop_anim_fwd, move_dir_norm)
				local r_dot = mvec3_dot(stop_anim_fwd, move_dir_r_norm)
				local stop_anim_side = nil

				if math_abs(r_dot) < math_abs(fwd_dot) then
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

				if self._action_desc.end_pose then
					stop_pose = self._action_desc.end_pose
				else
					stop_pose = anim_data.pose
				end

				if stop_pose ~= anim_data.pose then
					self._ext_movement:play_redirect(stop_pose)
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

		local pose = self._stance.values[4] > 0 and "wounded" or anim_data.pose or "stand"
		local real_velocity = self._cur_vel
		local variant = self._haste

		if variant == "run" and not self._no_walk then
			if anim_data.sprint then
				if real_velocity > 480 and anim_data.pose == "stand" then
					variant = "sprint"
				elseif real_velocity > 250 then
					variant = "run"
				else
					variant = "walk"
				end
			elseif anim_data.run then
				if self._walk_anim_velocities[pose] and self._walk_anim_velocities[pose][self._stance.name] then
					if real_velocity > 530 and self._walk_anim_velocities[pose] and self._walk_anim_velocities[pose][self._stance.name] and self._walk_anim_velocities[pose][self._stance.name].sprint and anim_data.pose == "stand" then
						variant = "sprint"
					elseif real_velocity > 250 then
						variant = "run"
					else
						variant = "walk"
					end
				end
			elseif real_velocity > 530 and self._walk_anim_velocities[pose][self._stance.name].sprint and anim_data.pose == "stand" then
				variant = "sprint"
			elseif real_velocity > 300 then
				variant = "run"
			else
				variant = "walk"
			end
		end

		if not safe_get_value(self._walk_anim_velocities, pose, self._stance.name, variant, wanted_walk_dir) then
			if self._stance.name == "ntl" and not safe_get_value(self._walk_anim_velocities, pose, self._stance.name) then
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

function CopActionWalk:_upd_start_anim_first_frame(t)
	local pose = self._ext_anim.pose or "stand"
	local speed_mul = self._walk_velocity.fwd / self._walk_anim_velocities[pose][self._stance.name][self._haste].fwd
	local start_run_dir = self._start_run_turn and self._start_run_turn[3] or self._start_run_straight

	self:_start_move_anim(start_run_dir, "run", speed_mul, self._start_run_turn)

	self._start_max_vel = 0

	self:_set_updator("_upd_start_anim")
	self._ext_base:chk_freeze_anims()
end

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
				table_remove(self._curve_path, 2)
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
			local seg_rel_t_clamp = math_clamp((seg_rel_t - self._start_run_turn.start_seg_rel_t) / 0.77, 0, 1)
			local prg_angle = self._start_run_turn[2] * seg_rel_t_clamp
			local new_yaw = self._start_run_turn[1] + prg_angle
			local rot_new = temp_rot1

			mrot_set(rot_new, new_yaw, 0, 0)
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

			mvec3_dir(wanted_u_fwd, self._common_data.pos, self._curve_path[self._curve_path_index + 1])
			mvec3_rot(wanted_u_fwd, self._walk_side_rot[self._start_run_straight])
			mrot_lookat(temp_rot1, wanted_u_fwd, math_up)
			mrot_slerp(temp_rot1, self._common_data.rot, temp_rot1, math_min(1, dt * 5))
			self._ext_movement:set_rotation(temp_rot1)
		end
	end

	self:_set_new_pos(dt)
end

function CopActionWalk:_set_new_pos(dt)
	local path_pos = self._last_pos
	local path_z = path_pos.z

	self._ext_movement:upd_ground_ray(path_pos, true)

	local gnd_z = self._common_data.gnd_ray.position.z
	gnd_z = math_clamp(gnd_z, path_z - 80, path_z + 80)
	local pos_new = tmp_vec1

	mvec3_set(pos_new, path_pos)
	mvec3_set_z(pos_new, self._common_data.pos.z)

	if gnd_z < pos_new.z then
		self._last_vel_z = self._apply_freefall(pos_new, self._last_vel_z, gnd_z, dt)
	else
		if pos_new.z < gnd_z then
			mvec3_set_z(pos_new, gnd_z)
		end

		self._last_vel_z = 0
	end

	self._ext_movement:set_position(pos_new)
end

function CopActionWalk:get_husk_interrupt_desc()
	local old_action_desc = {
		path_simplified = true,
		type = "walk",
		interrupted = true,
		body_part = self._body_part,
		end_rot = self._end_rot,
		variant = self._haste,
		nav_path = self._simplified_path,
		persistent = self._persistent,
		no_walk = self._no_walk,
		no_strafe = self._no_strafe,
		host_stop_pos_inserted = self._host_stop_pos_inserted,
		host_stop_pos_ahead = self._host_stop_pos_ahead,
		pose = self._action_desc.pose,
		end_pose = self._action_desc.end_pose
	}

	if self._blocks or self._old_blocks then
		local blocks = {}

		for i, k in pairs(self._old_blocks or self._blocks) do
			blocks[i] = -1
		end

		old_action_desc.blocks = blocks
	end

	return old_action_desc
end

function CopActionWalk:on_attention(attention)
	if attention then
		if attention.handler then
			local reaction_to_check = nil

			if managers.groupai:state():whisper_mode() then
				reaction_to_check = AIAttentionObject.REACT_SURPRISED
			else
				reaction_to_check = self._unit:in_slot(16) and AIAttentionObject.REACT_SHOOT or AIAttentionObject.REACT_AIM
			end

			if reaction_to_check <= attention.reaction then
				self._attention_pos = attention.handler:get_ground_m_pos()
			else
				self._attention_pos = false
			end
		elseif self._stance.name ~= "ntl" then
			if attention.unit then
				self._attention_pos = attention.unit:movement():m_pos()
			else
				self._attention_pos = false
			end
		end
	else
		self._attention_pos = false
	end

	self._attention = attention
end

function CopActionWalk:_get_current_max_walk_speed(move_dir)
	if move_dir == "l" or move_dir == "r" then
		move_dir = "strafe"
	end

	local multiplier = self._ext_brain.is_hostage and self._ext_brain:is_hostage() and self._common_data.char_tweak.hostage_move_speed or 1
	local speed = self._common_data.char_tweak.move_speed[self._ext_anim.pose][self._haste][self._stance.name][move_dir] * multiplier
	local is_host = self._sync or Global.game_settings.single_player

	if not is_host then
		if self:_husk_needs_speedup() then
			self._host_peer = self._host_peer or managers.network:session():peer(1)
			local ping_multiplier = 1
			local vis_multiplier = 1

			if self._host_peer then
				ping_multiplier = ping_multiplier + Network:qos(self._host_peer:rpc()).ping / 1000
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
		elseif managers.groupai:state():whisper_mode() then
			speed = speed * tweak_data.network.stealth_speed_boost
		end
	end

	return speed
end

function CopActionWalk:save(save_data)
	if not self._init_called then
		return
	end

	save_data.type = "walk"
	save_data.body_part = self._body_part
	save_data.variant = self._haste
	save_data.end_rot = self._end_rot
	save_data.no_walk = self._no_walk
	save_data.no_strafe = self._no_strafe
	save_data.persistent = true
	save_data.path_simplified = true
	save_data.interrupted = true
	save_data.pose = self._action_desc.pose
	save_data.end_pose = self._action_desc.end_pose
	save_data.blocks = {
		act = -1,
		idle = -1,
		turn = -1,
		walk = -1
	}
	local sync_path = {}
	local s_path = self._simplified_path

	table_insert(sync_path, self._nav_point_pos(s_path[1]))

	if s_path[2].x then
		table_insert(sync_path, s_path[2])
	else
		local element = s_path[2].element

		table_insert(sync_path, self.synthesize_nav_link(element:value("position"), element:value("rotation"), element:value("so_action")))
	end

	save_data.nav_path = sync_path
end

function CopActionWalk._calculate_simplified_path(good_pos, original_path, nr_iterations, z_test, apply_padding)
	local simplified_path = {
		good_pos
	}
	local original_path_size = #original_path

	for i_nav_point, nav_point in ipairs(original_path) do
		if nav_point.x and i_nav_point ~= original_path_size then
			if i_nav_point == 1 or simplified_path[#simplified_path].x then
				local pos_from = simplified_path[#simplified_path]
				local pos_to = CopActionWalk._nav_point_pos(original_path[i_nav_point + 1])
				local add_point = z_test and math_abs(nav_point.z - pos_from.z - (nav_point.z - pos_to.z)) > 60

				if add_point then
					table_insert(simplified_path, mvec3_cpy(nav_point))
				else
					local ray, trace = CopActionWalk._chk_shortcut_pos_to_pos(pos_from, pos_to, true)

					if ray then
						table_insert(simplified_path, mvec3_cpy(nav_point))
					else
						table_insert(simplified_path, trace[1])
					end
				end
			else
				table_insert(simplified_path, nav_point)
			end
		else
			table_insert(simplified_path, nav_point)
		end
	end

	if apply_padding and #simplified_path > 2 then
		CopActionWalk._apply_padding_to_simplified_path(simplified_path)
		CopActionWalk._calculate_shortened_path(simplified_path)
	end

	if nr_iterations > 1 and #simplified_path > 2 then
		simplified_path = CopActionWalk._calculate_simplified_path(good_pos, simplified_path, nr_iterations - 1, z_test, apply_padding)
	end

	return simplified_path
end

function CopActionWalk:_nav_chk_walk(t, dt, vis_state)
	local s_path = self._simplified_path
	local c_path = self._curve_path
	local c_index = self._curve_path_index
	local vel = nil

	if self._ext_anim.act and self._ext_anim.walk then
		local new_anim_pos = self._unit:get_animation_delta_position()
		local anim_displacement = mvec3_len(new_anim_pos)
		vel = anim_displacement / dt

		if vel == 0 then
			return
		end
	else
		vel = self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd")
	end

	local walk_dis = vel * dt
	local footstep_length = 200
	local nav_advanced = nil
	local cur_pos = self._common_data.pos
	local new_pos, new_c_index, complete, upd_footstep, reservation_failed = nil

	while not self._end_of_curved_path do
		new_pos, new_c_index, complete = self._walk_spline(c_path, self._last_pos, c_index, walk_dis + footstep_length)
		upd_footstep = true

		if complete then
			if #s_path == 2 then
				self._end_of_curved_path = true

				if self._end_rot and not self._persistent then
					self._curve_path_end_rot = Rotation(mrot_yaw(self._common_data.rot), 0, 0)
				end

				nav_advanced = true

				break
			elseif self._next_is_nav_link then
				self._end_of_curved_path = true
				self._nav_link_rot = Rotation(self._next_is_nav_link.element:value("rotation"), 0, 0)
				self._curve_path_end_rot = Rotation(mrot_yaw(self._common_data.rot), 0, 0)

				break
			else
				self:_advance_simplified_path()

				local next_pos = self._nav_point_pos(s_path[2])

				if self._sync and not self._action_desc.path_simplified and not self._next_is_nav_link and s_path[3] then
					reservation_failed = not self:_reserve_nav_pos(next_pos, self._nav_point_pos(s_path[3]), self._nav_point_pos(c_path[#c_path]), vel)
				end

				if not s_path[1].x then
					s_path[1] = self._nav_point_pos(s_path[1])
				end

				local new_c_path = nil

				if not self._action_desc.path_simplified and mvec3_dis_sq(s_path[1], next_pos) > 490000 and vis_state == 1 then
					new_c_path = self:_calculate_curved_path(s_path, 1, 1)
				else
					new_c_path = {
						s_path[1],
						next_pos
					}
				end

				local i = #c_path - 1

				while c_index <= i do
					table_insert(new_c_path, 1, c_path[i])

					i = i - 1
				end

				self._curve_path = new_c_path
				self._curve_path_index = 1
				c_path = self._curve_path
				c_index = 1

				if self._sync then
					self:_send_nav_point(next_pos)
				end

				nav_advanced = true
			end
		else
			break
		end
	end

	if upd_footstep then
		self._footstep_pos = new_pos:with_z(cur_pos.z)
	end

	if not reservation_failed then
		local wanted_vel = nil

		if self._turn_vel and vis_state == 1 then
			mvec3_set(tmp_vec1, c_path[c_index + 1])
			mvec3_set_z(tmp_vec1, mvec3_z(cur_pos))

			local dis = mvec3_dis_sq(tmp_vec1, cur_pos)

			if dis < 4900 then
				wanted_vel = math_lerp(self._turn_vel, vel, dis / 4900)
			end
		end

		wanted_vel = wanted_vel or vel

		if self._start_run then
			local delta_pos = self._common_data.unit:get_animation_delta_position()
			walk_dis = mvec3_len(delta_pos)
			self._cur_vel = walk_dis / dt
			self._cur_vel = math_min(self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd"), math_max(self._cur_vel, self._start_max_vel))

			if self._cur_vel < self._start_max_vel then
				self._cur_vel = self._start_max_vel
				walk_dis = self._cur_vel * dt
			else
				self._start_max_vel = self._cur_vel
			end
		else
			local c_vel = self._cur_vel

			if c_vel ~= wanted_vel then
				local adj_mul = c_vel < wanted_vel and 1.5 or 4
				local adj = vel * adj_mul * dt
				c_vel = math_step(c_vel, wanted_vel, adj)
				self._cur_vel = c_vel
			end

			walk_dis = c_vel * dt
		end

		new_pos, new_c_index, complete = self._walk_spline(c_path, self._last_pos, c_index, walk_dis)

		if complete then
			if self._next_is_nav_link then
				self._end_of_path = true

				if self._sync and alive(self._next_is_nav_link.c_class) and self._next_is_nav_link.element:nav_link_delay() then
					self._next_is_nav_link.c_class:set_delay_time(t + self._next_is_nav_link.element:nav_link_delay())
				end
			elseif #s_path == 2 then
				self._end_of_path = true
			end
		elseif new_c_index ~= self._curve_path_index or nav_advanced then
			local future_pos = c_path[new_c_index + 2]
			local next_pos = c_path[new_c_index + 1]
			local back_pos = c_path[new_c_index]
			local cur_vec = tmp_vec2

			mvec3_set(cur_vec, next_pos)
			mvec3_sub(cur_vec, back_pos)
			mvec3_set_z(cur_vec, 0)

			if future_pos then
				mvec3_norm(cur_vec)

				local next_vec = tmp_vec1

				mvec3_set(next_vec, future_pos)
				mvec3_sub(next_vec, next_pos)
				mvec3_set_z(next_vec, 0)

				local future_dis_flat = mvec3_norm(next_vec)
				local turn_dot = mvec3_dot(cur_vec, next_vec)

				if self._haste ~= "run" and self._stance.name == "ntl" and turn_dot > -0.7 and turn_dot < 0.7 and not self._attention_pos and future_dis_flat > 80 and mvec3_dot(self._common_data.fwd, cur_vec) > 0.97 then
					self._walk_turn = true
				else
					turn_dot = turn_dot * turn_dot
					local dot_lerp = math_max(0, turn_dot)
					local turn_vel = math_lerp(math_min(vel, 100), self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd"), dot_lerp)
					self._turn_vel = turn_vel
					self._walk_turn = nil
				end
			else
				if vis_state < 3 and self._end_of_curved_path and self._ext_anim.run and not self._NO_RUN_STOP and not self._no_walk and mvec3_dis(c_path[new_c_index + 1], new_pos) >= 120 then
					self._chk_stop_dis = 210
				elseif self._chk_stop_dis then
					self._chk_stop_dis = nil
				end

				self._walk_turn = nil
			end
		end

		self._curve_path_index = new_c_index
		self._last_pos = mvec3_cpy(new_pos)
	end
end

function CopActionWalk:_reserve_nav_pos(nav_pos, next_pos, from_pos, vel)
	local step_vec = nav_pos - self._common_data.pos
	local dis = step_vec:length()

	mvec3_cross(step_vec, step_vec, math_up)
	mvec3_set_l(step_vec, 65)

	local data = {
		step_mul = 1,
		nr_attempts = 0,
		start_pos = nav_pos,
		fwd_pos = next_pos,
		bwd_pos = from_pos,
		step_vec = step_vec
	}
	local step_clbk = callback(self, CopActionWalk, "_reserve_pos_step_clbk", data)
	local eta = dis / vel
	local res_pos = managers.navigation:reserve_pos(TimerManager:game():time() + eta, 1, nav_pos, step_clbk, 40, self._ext_movement:pos_rsrv_id())

	if res_pos then
		mvec3_set(nav_pos, res_pos.position)

		return true
	end
end

function CopActionWalk:_reserve_pos_step_clbk(data, test_pos)
	local nav_manager = managers.navigation
	data.nr_attempts = data.nr_attempts + 1

	if data.nr_attempts > 8 then
		return false
	end

	local step_vec = data.step_vec
	local step_mul = data.step_mul

	mvec3_set(test_pos, step_vec)
	mvec3_mul(test_pos, step_mul)
	mvec3_add(test_pos, data.start_pos)

	local params = {
		allow_entry = false,
		pos_from = data.start_pos,
		pos_to = test_pos
	}
	local blocked = nav_manager:raycast(params)

	if not blocked then
		params.pos_from = test_pos
		params.pos_to = data.fwd_pos
		blocked = nav_manager:raycast(params)

		if not blocked then
			params.pos_to = data.bwd_pos
			blocked = nav_manager:raycast(params)
		end
	end

	if blocked and data.blocked then
		return false
	elseif data.blocked then
		data.step_mul = data.step_mul + math_sign(data.step_mul)
	elseif step_mul > 0 then
		data.step_mul = -step_mul
	else
		data.step_mul = -step_mul + 1
	end

	if blocked then
		data.blocked = true
	end

	return true
end

function CopActionWalk:_adjust_move_anim(side, speed)
	local anim_data = self._ext_anim

	if anim_data[speed] and anim_data["move_" .. side] then
		return
	end

	local redirect_name = speed .. "_" .. side
	local enter_t = nil
	local move_side = anim_data.move_side or side

	if move_side then
		if side == move_side or self._matching_walk_anims[side][move_side] then
			local seg_rel_t = self._machine:segment_relative_time(idstr_base)

			if not self._walk_anim_lengths[anim_data.pose] or not self._walk_anim_lengths[anim_data.pose][self._stance.name] or not self._walk_anim_lengths[anim_data.pose][self._stance.name][speed] or not self._walk_anim_lengths[anim_data.pose][self._stance.name][speed][side] then
				return
			end

			local walk_anim_length = self._walk_anim_lengths[anim_data.pose][self._stance.name][speed][side]
			enter_t = seg_rel_t * walk_anim_length
		end
	end

	local could_freeze = anim_data.can_freeze and anim_data.upper_body_empty
	local redir_res = self._ext_movement:play_redirect(redirect_name, enter_t)

	if could_freeze then
		self._ext_base:chk_freeze_anims()
	end

	return redir_res
end

function CopActionWalk:_start_move_anim(side, speed, speed_mul, turn)
	local var_string = turn and "turn_" or ""
	local redirect_name = speed .. "_start_" .. var_string .. side
	local redir_res = self._ext_movement:play_redirect(redirect_name)

	if not redir_res then
		return
	end

	self._machine:set_speed(redir_res, speed_mul)

	return redir_res
end

function CopActionWalk:_stop_walk()
	local redir_res = self._ext_movement:play_redirect("idle")

	if not redir_res then
		return false
	end

	return redir_res
end

function CopActionWalk._apply_freefall(pos, vel, gnd_z, dt)
	local vel_z = vel - dt * 981
	local new_z = pos.z + vel_z * dt
	local z_adjust = gnd_z and math_max(gnd_z, new_z) or new_z

	mvec3_set_z(pos, z_adjust)

	return vel_z
end

function CopActionWalk:get_walk_to_pos()
	local nav_point = self._simplified_path and self._simplified_path[2] or self._nav_path and self._nav_path[2]

	if nav_point then
		return self._nav_point_pos(nav_point)
	end
end

function CopActionWalk:_upd_wait(t)
	if self._ext_anim.move then
		self:_stop_walk()
	end

	if not self._sync and not self._simplified_path[2] then
		if not self._end_of_curved_path or not self._persistent then
			table_insert(self._simplified_path, mvec3_cpy(self._simplified_path[1]))
		end
	end

	if not self._end_of_curved_path or not self._persistent then
		self._curve_path_index = 1

		if not self._simplified_path[2].x then
			self._next_is_nav_link = self._simplified_path[2]
		end

		self:_chk_start_anim(self._nav_point_pos(self._simplified_path[2]))

		if self._start_run then
			self:_set_updator("_upd_start_anim_first_frame")
		else
			self:_set_updator(nil)
		end

		self._curve_path = {
			self._nav_point_pos(self._simplified_path[1]),
			self._nav_point_pos(self._simplified_path[2])
		}
		self._cur_vel = 0
	end
end

function CopActionWalk:_upd_stop_anim_first_frame(t)
	local enter_t = nil
	local redir_name = "run_stop_" .. self._stop_anim_side
	local redir_res = self._ext_movement:play_redirect(redir_name, enter_t)

	if not redir_res then
		return
	end

	local speed_mul = self:_get_current_max_walk_speed(self._stop_anim_side) / self._walk_anim_velocities[self._ext_anim.pose][self._stance.name][self._haste][self._stop_anim_side]

	self._machine:set_speed(redir_res, speed_mul)

	self._stop_anim_init_pos = mvec3_cpy(self._last_pos)
	self._stop_anim_end_pos = mvec3_cpy(self._nav_point_pos(self._simplified_path[#self._simplified_path]))
	self._chk_stop_dis = nil

	self:_set_updator("_upd_stop_anim")

	if self._ext_anim.pose ~= "crouch" then
		if self._stop_anim_side == "fwd" then
			function self._stop_anim_displacement_f(p1, p2, t)
				local t_clamp = (math_clamp(t, 0, 0.6) / 0.6)^0.8

				return math_lerp(p1, p2, t_clamp)
			end
		elseif self._stop_anim_side == "bwd" then
			function self._stop_anim_displacement_f(p1, p2, t)
				local low = 0.97
				local p_1_5 = 0.9
				local t_clamp = math_clamp(t, 0, 0.8) / 0.8

				if p_1_5 > t_clamp then
					t_clamp = low * (1 - (p_1_5 - t_clamp) / p_1_5)
				else
					t_clamp = low + (1 - low) * (t_clamp - p_1_5) / (1 - p_1_5)
				end

				return math_lerp(p1, p2, t_clamp)
			end
		elseif self._stop_anim_side == "l" then
			function self._stop_anim_displacement_f(p1, p2, t)
				local p_1_5 = 0.6
				local low = 0.8
				local t_clamp = math_clamp(t, 0, 0.75) / 0.75

				if p_1_5 > t_clamp then
					t_clamp = low * t_clamp / p_1_5
				else
					t_clamp = low + (1 - low) * (t_clamp - p_1_5) / (1 - p_1_5)
				end

				return math_lerp(p1, p2, t_clamp)
			end
		else
			function self._stop_anim_displacement_f(p1, p2, t)
				local low = 0.9
				local p_1_5 = 0.85
				local t_clamp = math_clamp(t, 0, 0.8) / 0.8

				if p_1_5 > t_clamp then
					t_clamp = low * (1 - (p_1_5 - t_clamp) / p_1_5)
				else
					t_clamp = low + (1 - low) * (t_clamp - p_1_5) / (1 - p_1_5)
				end

				return math_lerp(p1, p2, t_clamp)
			end
		end
	elseif self._stop_anim_side == "fwd" or self._stop_anim_side == "bwd" then
		function self._stop_anim_displacement_f(p1, p2, t)
			local t_clamp = math_clamp(t, 0, 0.4) / 0.4
			t_clamp = t_clamp^0.85

			return math_lerp(p1, p2, t_clamp)
		end
	elseif self._stop_anim_side == "l" then
		function self._stop_anim_displacement_f(p1, p2, t)
			local t_clamp = math_clamp(t, 0, 0.3) / 0.3
			t_clamp = t_clamp^0.85

			return math_lerp(p1, p2, t_clamp)
		end
	else
		function self._stop_anim_displacement_f(p1, p2, t)
			local t_clamp = math_clamp(t, 0, 0.6) / 0.6
			t_clamp = t_clamp^0.85

			return math_lerp(p1, p2, t_clamp)
		end
	end

	self._ext_base:chk_freeze_anims()
	self:update(t)
end

function CopActionWalk:_upd_stop_anim(t)
	local dt = TimerManager:game():delta_time()
	local rot_new = self._common_data.rot:slerp(Rotation(self._stop_anim_fwd, math_up), math_min(1, dt * 5))

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

function CopActionWalk:stop()
	local is_initialized = self._init_called

	if not is_initialized then
		self._simplified_path = self._simplified_path or {}
	end

	local s_path = self._simplified_path

	if #s_path > 0 and not s_path[#s_path].x then
		s_path[#s_path] = self._nav_point_pos(s_path[#s_path])
	end

	if next(s_path) then
		if not s_path[#s_path].x then
			table_insert(s_path, self._nav_point_pos(s_path[#s_path]))
		end
	else
		table_insert(s_path, mvec3_cpy(self._common_data.pos))
	end

	local pos = s_path[#s_path]
	self._persistent = false

	if is_initialized then
		if self.update == self._upd_wait or self.update == self._upd_start_anim_first_frame or self.update == self._upd_start_anim then
			self._end_of_curved_path = nil
			self._end_of_path = nil
		elseif not self._next_is_nav_link then
			self._end_of_curved_path = nil
		end
	end

	if is_initialized and #s_path >= 3 and self.update ~= self._upd_nav_link and self.update ~= self._upd_nav_link_first_frame and self.update ~= self._upd_nav_link_blend_to_idle then
		if self.update ~= self._upd_stop_anim_first_frame and self.update ~= self._upd_stop_anim and self.update ~= self._upd_walk_turn_first_frame then
			if self.update ~= self._upd_walk_turn and math_abs(mvec3_z(self._common_data.pos) - mvec3_z(pos)) < 100 then
				local ray_params = {
					tracker_from = self._common_data.nav_tracker,
					pos_to = pos
				}

				if not managers.navigation:raycast(ray_params) then
					self._next_is_nav_link = nil
					self._end_of_curved_path = nil
					self._end_of_path = nil
					self._walk_turn = nil
					self._curve_path_index = 1
					local stop_pos = mvec3_cpy(pos)
					self._curve_path = {
						mvec3_cpy(self._common_data.pos),
						stop_pos
					}
					self._simplified_path = {
						mvec3_cpy(self._common_data.pos),
						stop_pos
					}
				end
			end
		end
	end

	local ray_params = {
		pos_to = pos
	}

	for i_nav_point = 2, #self._simplified_path - 1 do
		ray_params.pos_from = CopActionWalk._nav_point_pos(self._simplified_path[i_nav_point])

		if not managers.navigation:raycast(ray_params) then
			local nr_points_to_remove = #self._simplified_path - 1 - i_nav_point

			for i = 1, nr_points_to_remove do
				table_remove(self._simplified_path, i_nav_point + 1)
			end

			break
		end
	end
end

function CopActionWalk:append_nav_point(nav_point)
	if not nav_point.x then
		function nav_point.element.value(element, name)
			return element[name]
		end

		function nav_point.element.nav_link_wants_align_pos(element)
			return element.from_idle
		end
	end

	local is_initialized = self._init_called

	if not is_initialized then
		self._simplified_path = self._simplified_path or {}
	end

	table_insert(self._simplified_path, nav_point)

	if #self._simplified_path == 2 and not nav_point.x then
		self._next_is_nav_link = nav_point
	end

	if is_initialized then
		if self.update == self._upd_wait or self.update == self._upd_start_anim_first_frame or self.update == self._upd_start_anim then
			self._end_of_curved_path = nil
			self._end_of_path = nil
		elseif not self._next_is_nav_link then
			self._end_of_curved_path = nil
		end
	end
end

function CopActionWalk:chk_block_client(action_desc, action_type, t)
	if CopActionAct.chk_block(self, action_type, t) then
		if not action_desc or action_desc.body_part ~= 3 then
			return true
		end
	end
end

function CopActionWalk:_play_nav_link_anim(t)
	self._old_blocks = self._blocks

	self:_set_blocks(self._anim_block_presets.block_all)

	if self._nav_link_invul and not self._nav_link_invul_on then
		self._common_data.ext_damage:set_invulnerable(true)

		self._nav_link_invul_on = true
	end

	local nav_link = self._next_is_nav_link
	local anim = nav_link.element:value("so_action")

	self._ext_movement:set_rotation(Rotation(self._next_is_nav_link.element:value("rotation"), 0, 0))

	self._last_pos = mvec3_cpy(nav_link.element:value("position"))

	self:_set_new_pos(TimerManager:game():delta_time())

	self._nav_link = self._next_is_nav_link
	self._next_is_nav_link = nil
	self._end_of_curved_path = nil
	self._end_of_path = nil
	self._curve_path_end_rot = nil
	self._nav_link_rot = nil

	self:_advance_simplified_path()

	if self._sync and not self._nav_link_synched_with_start then
		self:_send_nav_point(self._simplified_path[1])
	end

	self._nav_link_synched_with_start = nil
	local result = self._ext_movement:play_redirect(anim)

	if result then
		self:_set_updator("_upd_nav_link")
		self._common_data.unit:set_driving("animation")

		self._changed_driving = true

		if self._blocks == self._anim_block_presets.block_all then
			self._ext_movement:action_request({
				non_persistent = true,
				client_interrupt = true,
				body_part = 3,
				type = "idle"
			})
		end
	else
		self._simplified_path[1] = mvec3_cpy(self._common_data.pos)

		if self._nav_link_invul_on then
			self._nav_link_invul_on = nil

			self._common_data.ext_damage:set_invulnerable(false)
		end

		self._cur_vel = 0

		self:_set_blocks(self._old_blocks)

		self._old_blocks = nil
		self._nav_link = nil

		if self._simplified_path[2] then
			if mvec3_dis(self._simplified_path[1], self._nav_point_pos(self._simplified_path[2])) > 400 and self._ext_base:lod_stage() == 1 then
				self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1, self._common_data.fwd)
			else
				self._curve_path = {
					mvec3_cpy(self._simplified_path[1]),
					self._nav_point_pos(self._simplified_path[2])
				}
			end

			self._curve_path_index = 1

			self:_set_updator(nil)
			self:update(t)
		else
			self:_set_updator("_upd_wait")
		end
	end
end

function CopActionWalk:_upd_nav_link(t)
	if self._ext_anim.act and not self._ext_anim.walk then
		self._last_pos = self._unit:position()

		self._ext_movement:set_m_pos(self._last_pos)
		self._ext_movement:set_m_rot(self._unit:rotation())
	elseif self._simplified_path[2] then
		self._common_data.unit:set_driving("script")

		self._changed_driving = nil
		self._simplified_path[1] = mvec3_cpy(self._common_data.pos)

		if self._sync then
			local ray_params = {
				tracker_from = self._common_data.nav_tracker,
				pos_to = self._nav_point_pos(self._simplified_path[2])
			}
			local res = managers.navigation:raycast(ray_params)

			if res then
				local end_pos = self._nav_link.c_class:end_position()

				table_insert(self._simplified_path, 2, end_pos)

				self._next_is_nav_link = nil
			end

			self:_send_nav_point(self._simplified_path[2])
		end

		if mvec3_dis(self._simplified_path[1], self._nav_point_pos(self._simplified_path[2])) > 400 and self._ext_base:lod_stage() == 1 then
			self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1, self._common_data.fwd)
		else
			self._curve_path = {
				mvec3_cpy(self._simplified_path[1]),
				self._nav_point_pos(self._simplified_path[2])
			}
		end

		self._curve_path_index = 1

		if self._nav_link_invul_on then
			self._nav_link_invul_on = nil

			self._common_data.ext_damage:set_invulnerable(false)
		end

		self._nav_link = nil
		self._cur_vel = 0
		self._last_vel_z = 0

		self:_set_blocks(self._old_blocks)

		self._old_blocks = nil

		self:_set_updator(nil)
		self:_chk_correct_pose()
		self:update(t)
	elseif not self._persistent then
		self._simplified_path[1] = mvec3_cpy(self._common_data.pos)

		self._common_data.unit:set_driving("script")

		self._changed_driving = nil
		self._end_of_curved_path = true

		if self._nav_link_invul_on then
			self._nav_link_invul_on = nil

			self._common_data.ext_damage:set_invulnerable(false)
		end

		self._nav_link = nil
		self._cur_vel = 0
		self._last_vel_z = 0

		self:_set_blocks(self._old_blocks)

		self._old_blocks = nil

		self:_chk_correct_pose()

		self._expired = true

		if self._end_rot then
			self._ext_movement:set_rotation(self._end_rot)
		end
	end
end

function CopActionWalk:_upd_walk_turn_first_frame(t)
	local pos1 = self._last_pos
	local pos2 = self._curve_path[self._curve_path_index + 1]
	local pos3 = self._curve_path[self._curve_path_index + 2]

	if not pos2 or not pos3 then
		return
	end

	mvec3_set(tmp_vec2, pos3)
	mvec3_sub(tmp_vec2, pos2)

	local right_dot = mvec3_dot(self._common_data.right, tmp_vec2)
	local side = right_dot > 0 and "r" or "l"
	local seg_rel_t = self._machine:segment_relative_time(idstr_base)
	local left_foot = seg_rel_t < 0.25 or seg_rel_t > 0.75
	local foot = left_foot and "l" or "r"
	local anim = "walk_turn_" .. side .. "_" .. foot .. "f"
	local result = self._ext_movement:play_redirect(anim)

	if result then
		self:_set_updator("_upd_walk_turn")
		self._common_data.unit:set_driving("animation")

		self._changed_driving = true
		self._curve_path_index = self._curve_path_index + 1

		if not left_foot then
			self._walk_turn_blend_to_middle = true
		end
	else
		self._walk_turn = nil

		self:_set_updator(nil)
		self:update(t)
	end
end

function CopActionWalk:_upd_walk_turn(t)
	if self._ext_anim.walk_turn then
		self._last_pos = self._unit:position()

		self._ext_movement:set_m_pos(self._last_pos)

		local dt = TimerManager:game():delta_time()

		self:_set_new_pos(dt)
		self._ext_movement:set_m_rot(self._unit:rotation())
	else
		if self._walk_turn_blend_to_middle then
			self._machine:set_animation_time_all_segments(0.5)
		end

		self._common_data.unit:set_driving("script")

		self._changed_driving = nil
		local c_index = self._curve_path_index + 2
		local wants_shortcut = nil

		while c_index < #self._curve_path do
			local col = CopActionWalk._chk_shortcut_pos_to_pos(self._common_data.pos, self._curve_path[c_index], nil)

			if col then
				break
			else
				table_remove(self._curve_path, c_index - 1)
			end
		end

		self._curve_path[self._curve_path_index] = mvec3_cpy(self._common_data.pos)
		self._walk_turn = nil
		self._walk_turn_blend_to_middle = nil
		self._cur_vel = self._walk_anim_velocities.stand.ntl.walk.fwd

		self:_set_updator(nil)
		self:update(t)
	end
end

function CopActionWalk:_send_nav_point(nav_point)
	if nav_point.x then
		self._ext_network:send("action_walk_nav_point", nav_point)
	else
		local element = nav_point.element
		local anim_index = CopActionAct._get_act_index(CopActionAct, element:value("so_action"))
		local sync_yaw = element:value("rotation")

		if sync_yaw < 0 then
			sync_yaw = 360 + sync_yaw
		end

		sync_yaw = math_ceil(255 * sync_yaw / 360)

		if sync_yaw == 0 then
			sync_yaw = 255
		end

		self._ext_network:send("action_walk_nav_link", element:value("position"), sync_yaw, anim_index, element:nav_link_wants_align_pos() and true or false)
	end
end

function CopActionWalk:on_nav_link_unregistered(element_id)
	if self._next_is_nav_link and self._next_is_nav_link.element._id == element_id then
		self._ext_movement:action_request({
			body_part = 2,
			type = "idle"
		})

		return
	end

	local path = self._simplified_path or self._nav_path

	for i, nav_point in ipairs(path) do
		if not nav_point.x then
			local nav_point_id = nav_point.element and nav_point.element:id() or nav_point:script_data().element:id()

			if nav_point_id == element_id then
				self._ext_movement:action_request({
					body_part = 2,
					type = "idle"
				})

				return
			end
		end
	end
end

function CopActionWalk:_advance_simplified_path()
	local s_path = self._simplified_path

	table_remove(s_path, 1)

	if s_path[2] and not s_path[2].x then
		self._next_is_nav_link = s_path[2]
	end

	self._host_stop_pos_ahead = false
end
