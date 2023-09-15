local idstr_base = Idstring("base")

local mrot_lookat = mrotation.set_look_at
local mrot_set_yaw_pitch_roll = mrotation.set_yaw_pitch_roll
local mrot_slerp = mrotation.slerp
local mrot_yaw = mrotation.yaw

local mvec3_add = mvector3.add
local mvec3_bezier = mvector3.bezier
local mvec3_cpy = mvector3.copy
local mvec3_cross = mvector3.cross
local mvec3_dot = mvector3.dot
local mvec3_dir = mvector3.direction
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_len = mvector3.length
local mvec3_lerp = mvector3.lerp
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_rot = mvector3.rotate_with
local mvec3_set = mvector3.set
local mvec3_set_l = mvector3.set_length
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract

local math_abs = math.abs
local math_ceil = math.ceil
local math_clamp = math.clamp
local math_lerp = math.lerp
local math_max = math.max
local math_min = math.min
local math_step = math.step
local math_up = math.UP

local next_g = next

local react_shoot = AIAttentionObject.REACT_SHOOT
local react_surprised = AIAttentionObject.REACT_SURPRISED

local table_insert = table.insert
local table_remove = table.remove

local tmp_rot1 = Rotation()

local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_vec4 = Vector3()
local tmp_vec5 = Vector3()
local tmp_vec6 = Vector3()

-- Distance without the influence of z
local function mvec3_dis_no_z(a, b)
	mvec3_set(tmp_vec6, a)
	mvec3_set_z(tmp_vec6, b.z)

	return mvec3_dis(tmp_vec6, b)
end

-- Distance squared without the influence of z
local function mvec3_dis_sq_no_z(a, b)
	mvec3_set(tmp_vec6, a)
	mvec3_set_z(tmp_vec6, b.z)

	return mvec3_dis_sq(tmp_vec6, b)
end

-- TODO: if the path was prematurely advanced in nav_chk_walk, ensure we move to the navpoint after we restart the action if necessary
function CopActionWalk:init(action_desc, common_data)
	self._common_data = common_data
	self._action_desc = action_desc
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._ext_network = common_data.ext_network
	self._body_part = action_desc.body_part

	self:_init_ik()

	self._machine = common_data.machine

	self:on_attention(common_data.attention)

	self._stance = common_data.stance
	self._last_vel_z = 0
	self._cur_vel = 0
	self._end_rot = action_desc.end_rot

	CopActionAct._create_blocks_table(self, action_desc.blocks)

	self._persistent = action_desc.persistent
	self._interrupted = action_desc.interrupted
	self._haste = action_desc.variant
	self._start_t = TimerManager:game():time()
	self._no_walk = action_desc.no_walk
	self._no_strafe = action_desc.no_strafe
	self._last_pos = mvec3_cpy(common_data.pos) -- instead of creating new vectors for it, just make it unique in the first place and use mvec3_set
	self._footstep_pos = mvec3_cpy(common_data.pos) -- instead of creating new vectors for it, just make it unique in the first place and use mvec3_set
	self._NO_RUN_START = common_data.char_tweak.no_run_start -- instead of checking these a billion times for no reason, capitalised because vanilla is for whatever reason
	self._NO_RUN_STOP = common_data.char_tweak.no_run_stop -- instead of checking these a billion times for no reason, capitalised because vanilla is for whatever reason
	self._simplified_path = action_desc.nav_path -- ditched the whole _nav_path/_simplified_path divide, it's just unnecessary when everything can be done from one table just fine and it allows some code to be simplified
	self._host_stop_pos_ahead = action_desc.host_stop_pos_ahead -- never set in vanilla if we get interrupted again after being interrupted and haven't reached m_host_stop_pos, insanely minor fix but still
	self._last_upd_t = self._start_t - 0.001
	self._sync = Network:is_server()
	self._skipped_frames = 1

	if self._ext_anim.needs_idle then
		self._waiting_full_blend = true

		self:_set_updator("_upd_wait_for_full_blend")

		if self._sync then
			self._unit:brain():add_pos_rsrv("move_dest", {
				radius = 30,
				position = mvec3_cpy(self._simplified_path[#self._simplified_path]) -- last entry should never be a navlink
			})

			local stand_rsrv = self._unit:brain():get_pos_rsrv("stand") -- like CopActionHurt and CopActionIdle, ensure our current position is reserved if we're not moving anywhere yet 
			if not stand_rsrv or mvec3_dis_sq(stand_rsrv.position, common_data.pos) > 400 then -- z should be considered, in case of shenanigans with a reservation on a different floor in the level
				self._unit:brain():add_pos_rsrv("stand", {
					radius = 30,
					position = mvec3_cpy(common_data.pos)
				})
			end
		end
	elseif not self:_init() then
		return
	end

	self._ext_movement:enable_update()

	return true
end

function CopActionWalk:_init()
	if not self:_sanitize() then
		return
	end

	local path = self._simplified_path
	local action_desc = self._action_desc
	local common_data = self._common_data
	if self._sync then
		if managers.groupai:state():all_AI_criminals()[common_data.unit:key()] then
			self._nav_link_invul = true
		end

		-- Don't create a new table for no reason, iterate over the existing one
		for i = 1, #path do
			local nav_point = path[i]
			if nav_point.x then
				path[i] = mvec3_cpy(nav_point) -- copy the vectors here instead, so _calculate_simplified_path won't do a bunch of redundant copies past the first iteration
			elseif alive(nav_point) then
				path[i] = {element = nav_point:script_data().element, c_class = nav_point}
			else
				return false
			end
		end

		-- Run path simplification even in stealth, fixes things like Mitchell taking a detour on Counterfeit as he walks to the basement door
		if not action_desc.path_simplified then
			-- this is valid, as it iterates directly over the simplified path table instead of creating a new table
			self._calculate_simplified_path(mvec3_cpy(common_data.pos), path, 2, true, true) -- just do 2 iterations, the function is stupid cheap anyway (at least comparatively to the update functions)
		end
	else
		-- while not necessary for clients, this is necessary for drop-ins
		for i = 1, #path do
			local nav_point = path[i]
			if not nav_point.x then
				function nav_point.element.value(element, name)
					return element[name]
				end

				function nav_point.element.nav_link_wants_align_pos(element)
					return element.from_idle
				end
			end
		end

		if action_desc.interrupted then
			path[1] = mvec3_cpy(common_data.pos) -- unlike vanilla if we were interrupted after failing/finishing a navlink, overwrite it as we don't want to try and use it again
		else
			table_insert(path, 1, mvec3_cpy(common_data.pos))
		end

		local to_pos = path[2] and self._nav_point_pos(path[2]) -- path[2] can be nil if we failed/finished a navlink before the host has sent another navpoint and we restarted the action due to an interruption
		if not to_pos or not self._host_stop_pos_ahead and managers.navigation:raycast({tracker_from = common_data.nav_tracker, pos_to = to_pos}) then
			table_insert(path, 2, mvec3_cpy(self._ext_movement:m_host_stop_pos()))

			self._host_stop_pos_ahead = true
		end
	end

	if not path[2].x then
		self._next_is_nav_link = path[2]
	end

	self._curve_path_index = 1

	self:_chk_start_anim(self._nav_point_pos(path[2]))

	if self._start_run then
		self:_set_updator("_upd_start_anim_first_frame")
	end

	-- If we're playing a run_start, but not a run_start_turn animation we can use a curved path
	-- only calculating if in a high LOD stage is negligible for performance but for consistency with vanilla clients' sake i'm keeping it
	if not self._start_run_turn and self._ext_base:lod_stage() == 1 and mvec3_dis_sq_no_z(path[1], self._nav_point_pos(path[2])) > 160000 then
		self._curve_path = self:_calculate_curved_path(path, 1, 1, common_data.fwd)
	else
		self._curve_path = {
			path[1],
			self._nav_point_pos(path[2])
		}
	end

	-- if the next navpoint is a navlink and the curved path is a straight line, set self._chk_stop_dis here otherwise it won't end up being set
	-- if the navlink doesn't require the unit being idle, skip the run_stop animation
	if self._next_is_nav_link and self._next_is_nav_link.element:nav_link_wants_align_pos() and #self._curve_path == 2 and not self._NO_RUN_STOP and self._haste == "run" and mvec3_dis_sq_no_z(self._curve_path[1], self._curve_path[2]) >= 14400 then
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

		-- Sync the position of a navlink but not the parameters, they get synced after we use it successfully
		self._ext_network:send("action_walk_start", self._nav_point_pos(path[2]), 1, 0, false, self._haste == "walk" and 1 or 2, sync_yaw, self._no_walk and true or false, self._no_strafe and true or false, not action_desc.pose and 0 or action_desc.pose == "stand" and 1 or 2, not action_desc.end_pose and 0 or action_desc.end_pose == "stand" and 1 or 2)

		self._unit:brain():rem_pos_rsrv("stand")
		self._unit:brain():add_pos_rsrv("move_dest", {
			radius = 30,
			position = mvec3_cpy(path[#path]) -- self._nav_point_pos is unnecessary since the last navpoint is never a navlink
		})
	end

	self._init_called = true -- set this at the end of the function in case it fails due to a dead navlink

	return true
end

local switch_table = {["stand"] = "crouch", ["crouch"] = "stand"}
function CopActionWalk:_sanitize()
	local anim_data = self._ext_anim
	if not anim_data.pose then
		self._ext_movement:play_redirect("idle")

		if not anim_data.pose and not self._ext_movement:play_state("std/stand/still/idle/look") then
			return
		end
	end

	local current_pose = anim_data.pose
	local wanted_pose = self._action_desc.pose
	if wanted_pose and not anim_data[wanted_pose] and self._walk_anim_lengths[wanted_pose] then -- We want a different pose and it has animations
		self._ext_movement:play_redirect(wanted_pose)
	elseif not self._walk_anim_lengths[current_pose] then -- Our current pose lacks animations, switch our pose
		self._ext_movement:play_redirect(switch_table[current_pose])
	end

	return true
end

function CopActionWalk:_chk_start_anim(next_pos)
	if self._haste ~= "run" or self._NO_RUN_START or (self._ext_base:lod_stage() or 4) > 2 then
		return
	end

	local can_turn_and_fire = true
	local path_dir = tmp_vec1
	mvec3_set(path_dir, next_pos)
	mvec3_sub(path_dir, self._common_data.pos)
	mvec3_set_z(path_dir, 0)

	local path_len = mvec3_norm(path_dir)
	if self._attention_pos then
		local target_vec = tmp_vec2
		mvec3_set(target_vec, self._attention_pos)
		mvec3_sub(target_vec, self._common_data.pos)
		mvec3_set_z(target_vec, 0)
		mvec3_norm(target_vec)

		local fwd_dot = mvec3_dot(path_dir, target_vec)
		if fwd_dot < 0.7 then
			can_turn_and_fire = nil
		end
	end

	if can_turn_and_fire then -- why they don't just check this here is beyond me
		local path_angle = path_dir:to_polar_with_reference(self._common_data.fwd, math_up).spin
		if math_abs(path_angle) > 135 then
			if mvec3_len(self._anim_movement[self._ext_anim.pose].run_start_turn_bwd.ds) < path_len - 100 then
				if path_angle > 0 then
					path_angle = path_angle - 360
				end

				self._start_run_turn = {
					self._common_data.rot:yaw(),
					path_angle,
					"bwd"
				}
			end
		elseif path_angle < -65 then
			if mvec3_len(self._anim_movement[self._ext_anim.pose].run_start_turn_r.ds) < path_len - 100 then
				self._start_run_turn = {
					self._common_data.rot:yaw(),
					path_angle,
					"r"
				}
			end
		elseif path_angle > 65 and mvec3_len(self._anim_movement[self._ext_anim.pose].run_start_turn_l.ds) < path_len - 100 then
			self._start_run_turn = {
				self._common_data.rot:yaw(),
				path_angle,
				"l"
			}
		end
	end

	self._start_run = true

	if not self._root_blend_disabled then
		self._root_blend_disabled = true

		self._ext_movement:set_root_blend(false)
	end

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
	local test_pos = tmp_vec1

	for i = 2, #path - 1 do
		if path[i].x then -- current is not a navlink, we can shorten
			local last_pos = path[i - 1]

			mvec3_lerp(test_pos, last_pos.x and last_pos or last_pos.c_class:end_position(), path[i], 0.8) -- if the previous navpoint is a navlink, shorten the path based off it's end position

			if not managers.navigation:raycast({pos_from = test_pos, pos_to = CopActionWalk._nav_point_pos(path[i + 1])}) then
				mvec3_set(path[i], test_pos)
			end
		end
	end
end

local diagonals = {
	Vector3(212.132, 212.132, 0), -- no need to use mvec3_set_static because of the way these are used
	Vector3(212.132, -212.132, 0)
}

function CopActionWalk._apply_padding_to_simplified_path(path)
	local offset = tmp_vec1
	local to_pos = tmp_vec2
	
	for i = 2, #path - 1 do
		local pos = path[i]
		if pos.x then -- current is not a navlink, we can apply padding
			for j = 1, #diagonals do
				local diagonal = diagonals[j]

				mvec3_set(to_pos, pos)
				mvec3_add(to_pos, diagonal)

				local _, trace = CopActionWalk._chk_shortcut_pos_to_pos(pos, to_pos, true)

				mvec3_set(offset, trace[1])
				mvec3_set(to_pos, pos)
				mvec3_mul(diagonal, -1)
				mvec3_add(to_pos, diagonal)

				_, trace = CopActionWalk._chk_shortcut_pos_to_pos(pos, to_pos, true)

				mvec3_lerp(offset, offset, trace[1], 0.5)

				local last_pos = path[i - 1] -- if the previous navpoint is a navlink, apply padding based off it's end position
				if not managers.navigation:raycast({pos_from = offset, pos_to = CopActionWalk._nav_point_pos(path[i + 1])}) and not managers.navigation:raycast({pos_from = last_pos.x and last_pos or last_pos.c_class:end_position(), pos_to = offset}) then
					mvec3_set(pos, offset)
				end
			end
		end
	end
end

function CopActionWalk:_calculate_curved_path(path, index, curvature_factor, enter_dir)
	local p1 = path[index]
	local p4 = self._nav_point_pos(path[index + 1])
	local p2, p3 = nil
	local curved_path = {
		p1
	}
	local segment_dis = mvec3_dis_no_z(p4, p1)
	local vec_out = tmp_vec1
	local vec_in = tmp_vec2
	local nr_control_pts = 2

	if enter_dir then -- everything calls this with an enter_dir now
		nr_control_pts = 3

		mvec3_set(vec_out, enter_dir)
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

	if p2 and path[index + 2] then
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

	if nr_control_pts > 2 then
		local prev_pos = curved_path[1]

		for i = 1, 6 do
			local pos = tmp_vec1

			if nr_control_pts == 3 then
				mvec3_bezier(pos, p1, p2 or p3, p4, i / 7)
			else
				mvec3_bezier(pos, p1, p2, p3, p4, i / 7)
			end

			if managers.navigation:raycast({pos_from = prev_pos, pos_to = pos}) then
				return curvature_factor < 1 and {curved_path[1], p4} or self:_calculate_curved_path(path, index, 0.5, enter_dir)
			end

			prev_pos = mvec3_cpy(pos)
			table_insert(curved_path, prev_pos)
		end

		if managers.navigation:raycast({pos_from = prev_pos, pos_to = p4}) then
			return curvature_factor < 1 and {curved_path[1], p4} or self:_calculate_curved_path(path, index, 0.5, enter_dir)
		end

		table_insert(curved_path, p4)
	else
		table_insert(curved_path, p4)
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
	end

	if self._expired and self._ext_anim.move then
		self:_stop_walk()
	end

	self._ext_movement:drop_held_items()

	if self._sync then
		if self._init_called then -- if the action wasn't even synced to clients, don't bother syncing anything to them
			if not self._expired then
				self._ext_network:send("action_walk_nav_point", mvec3_cpy(self._ext_movement:m_pos())) -- mvec3_cpy may be unnecessary
			end

			self._ext_network:send("action_walk_stop")
		end

		self._unit:brain():rem_pos_rsrv("move_dest")
	else
		self._ext_movement:set_m_host_stop_pos(self._ext_movement:m_pos())
	end

	if self._nav_link_invul_on then
		self._common_data.ext_damage:set_invulnerable(false)
	end
end

function CopActionWalk:_upd_wait_for_full_blend(t)
	if self._ext_anim.needs_idle and not self._ext_anim.to_idle then
		if not self._ext_movement:play_redirect("idle") then
			return
		end

		self._ext_movement:spawn_wanted_items()
	end

	if not self._ext_anim.to_idle and self._ext_anim.idle_full_blend then
		self._waiting_full_blend = nil

		if self:_init() then
			self._ext_movement:drop_held_items()

			if self._updator == "_upd_wait_for_full_blend" then -- _init sometimes changes the updator
				self:_set_updator(nil)
			end
		else
			-- no need to check for being the host, clients will never fail _init unless something is really badly wrong (and nothing you do at that point matters anyway)
			self._ext_movement:action_request({ -- DON'T expire the action, it didn't succeed and don't sync a navpoint because the action hasn't even been synced
				body_part = 2,
				type = "idle"
			})
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
	local vis_state = self._ext_base:lod_stage() or 4
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

	local anim_data = self._ext_anim
	if self._end_of_path and (not anim_data.act or not anim_data.walk) then
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

	if self._cur_vel < 0.1 or anim_data.act and anim_data.walk then
	elseif not self._expired then
		local move_dir_norm = tmp_vec3

		mvec3_set(move_dir_norm, self._last_pos)
		mvec3_sub(move_dir_norm, self._common_data.pos)
		mvec3_set_z(move_dir_norm, 0)
		mvec3_norm(move_dir_norm)

		local wanted_walk_dir = nil
		if self._no_strafe or self._walk_turn then
			wanted_walk_dir = "fwd"
		else
			local face_fwd = tmp_vec1
			if self._curve_path_end_rot and mvec3_dis_sq_no_z(self._last_pos, self._footstep_pos) < 19600 then
				mvec3_set(face_fwd, self._common_data.fwd) -- already no z and normalised
			else
				if self._attention_pos then
					mvec3_set(face_fwd, self._attention_pos)
					mvec3_sub(face_fwd, self._common_data.pos)
				elseif self._footstep_pos then
					mvec3_set(face_fwd, self._footstep_pos)
					mvec3_sub(face_fwd, self._common_data.pos)
				end

				mvec3_set_z(face_fwd, 0) -- need to remove z for the sake of a more accurate dot product
				mvec3_norm(face_fwd)
			end

			local face_right = tmp_vec2

			mvec3_cross(face_right, face_fwd, math_up)
			-- no need to normalise a crossed vector if the vector it was crossed from is normalised

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

		local rot_new = tmp_rot1
		if self._curve_path_end_rot then
			mrot_slerp(rot_new, self._curve_path_end_rot, self._nav_link_rot or self._end_rot, 1 - math_min(1, mvec3_dis_no_z(self._last_pos, self._footstep_pos) / 140))
		else
			local wanted_u_fwd = tmp_vec1
			local rotate_mult = self._common_data.char_tweak.rotation_speed or 3

			mvec3_set(wanted_u_fwd, move_dir_norm)
			mvec3_rot(wanted_u_fwd, self._walk_side_rot[wanted_walk_dir])
			mrot_lookat(rot_new, wanted_u_fwd, math_up)
					 
			mrot_slerp(rot_new, self._common_data.rot, rot_new, math_min(1, dt * rotate_mult))
		end

		self._ext_movement:set_rotation(rot_new)

		if self._chk_stop_dis then
			local end_dis = mvec3_dis_no_z(self._last_pos, self._nav_point_pos(self._simplified_path[2]))

			if end_dis < self._chk_stop_dis then
				local stop_pose = self._action_desc.end_pose
				-- only change to the action's end pose for the end of the path, if it's a navlink we're stopping for just use our current pose
				-- forcing the end_pose to stand might be better since generally navlink animations are made for standing enemies
				if stop_pose and not self._next_is_nav_link then
					if stop_pose ~= anim_data.pose then
						self._ext_movement:action_request({
							body_part = 4,
							type = stop_pose
						})
					end
				else
					stop_pose = self._ext_anim.pose
				end

				if vis_state < 3 and self._ext_anim.run then -- shouldn't play run_stop anims in a high LOD state or if we're not actually running
					-- use the start rotation of a navlink if we're playing a run_stop animation for it
					local stop_anim_fwd = self._nav_link_rot and self._nav_link_rot:y() or self._end_rot and self._end_rot:y() or move_dir_norm:rotate_with(self._walk_side_rot[wanted_walk_dir])
					local move_dir_r_norm = tmp_vec3

					mvec3_cross(move_dir_r_norm, move_dir_norm, math_up)
					-- no need to normalise a crossed vector if the one it was crossed from is normalised

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

					local stop_dis = self._anim_movement[stop_pose]["run_stop_" .. stop_anim_side]
					if stop_dis and end_dis < stop_dis then
						self._stop_anim_side = stop_anim_side
						self._stop_anim_fwd = stop_anim_fwd
						self._stop_dis = stop_dis

						self:_set_updator("_upd_stop_anim_first_frame")
					end
				end
			end
		elseif self._walk_turn and mvec3_dis_sq_no_z(self._last_pos, self._curve_path[self._curve_path_index + 1]) < 2025 then
			self:_set_updator("_upd_walk_turn_first_frame")
		end

		local walk_anim_velocities = self._walk_anim_velocities[self._stance.values[4] > 0 and "wounded" or anim_data.pose or "stand"][self._stance.name] -- wounded is unused
		local real_velocity = self._cur_vel
		local variant = self._haste
		-- Tried tying this to the velocity of the animations themselves, but it just led to some issues like dozers just barely not running fast enough to play the run animation and doing a fast walk instead
		if variant == "run" then
			if real_velocity > (anim_data.sprint and 480 or 530) and walk_anim_velocities.sprint and anim_data.pose == "stand" then
				variant = "sprint"
			elseif real_velocity > ((anim_data.run or anim_data.sprint) and 250 or 300) then
				variant = "run"
			elseif not self._no_walk then
				variant = "walk"
			end
		end

		self:_adjust_move_anim(wanted_walk_dir, variant)
		self:_adjust_walk_anim_speed(dt, real_velocity / walk_anim_velocities[variant][wanted_walk_dir])
	end

	self:_set_new_pos(dt)
end

function CopActionWalk:_upd_start_anim_first_frame(t)
	-- Like run_stop animations, speed up the animation if necessary
	self:_start_move_anim(self._start_run_turn and self._start_run_turn[3] or self._start_run_straight, "run", self:_get_current_max_walk_speed("fwd") / self._walk_anim_velocities[self._ext_anim.pose or "stand"][self._stance.name][self._haste].fwd, self._start_run_turn)

	self._start_max_vel = 0

	self:_set_updator("_upd_start_anim")
	self._ext_base:chk_freeze_anims()
end

function CopActionWalk:_upd_start_anim(t)
	if self._ext_anim.run_start then
		local dt = TimerManager:game():delta_time()
		if self._start_run_turn then
			if self._ext_anim.run_start_full_blend then
				local seg_rel_t = self._machine:segment_relative_time(idstr_base)

				if not self._start_run_turn.start_seg_rel_t then
					self._start_run_turn.start_seg_rel_t = seg_rel_t
				end

				local delta_pos = self._common_data.unit:get_animation_delta_position()
				local new_pos = tmp_vec1
				mvec3_set(new_pos, self._common_data.pos)
				mvec3_add(new_pos, delta_pos)

				local ray_params = {
					allow_entry = true,
					trace = true,
					tracker_from = self._common_data.nav_tracker,
					pos_to = new_pos
				}
				if managers.navigation:raycast(ray_params) then
					new_pos = ray_params.trace[1]
					local travel_vec = tmp_vec1

					mvec3_set(travel_vec, new_pos)
					mvec3_sub(travel_vec, self._last_pos)
					mvec3_set_z(travel_vec, 0)

					self._cur_vel = mvec3_len(travel_vec) / dt
					self._start_max_vel = self._cur_vel
				else
					self._cur_vel = math_max(mvec3_len(delta_pos) / dt, self._start_max_vel)
				end

				mvec3_set(self._last_pos, new_pos)

				local rot_new = tmp_rot1

				mrot_set_yaw_pitch_roll(rot_new, self._start_run_turn[1] + self._start_run_turn[2] * math_clamp((seg_rel_t - self._start_run_turn.start_seg_rel_t) / 0.77, 0, 1), 0, 0)
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
				self:_nav_chk_walk(t, dt, self._ext_base:lod_stage() or 4)
			end

			if not self._end_of_curved_path then
				local wanted_u_fwd = tmp_vec1
				local rotate_mult = self._common_data.char_tweak.rotation_speed or 3

				mvec3_dir(wanted_u_fwd, self._common_data.pos, self._curve_path[self._curve_path_index + 1])
				mvec3_rot(wanted_u_fwd, self._walk_side_rot[self._start_run_straight])
				mrot_lookat(tmp_rot1, wanted_u_fwd, math_up) -- don't think z matters here at all
				mrot_slerp(tmp_rot1, self._common_data.rot, tmp_rot1, math_min(1, dt * rotate_mult))

				self._ext_movement:set_rotation(tmp_rot1)
			end
		end

		self:_set_new_pos(dt)
	else
		self._start_run = nil
		self._start_run_turn = nil

		local old_pos = self._curve_path[1]
		self._curve_path[1] = mvec3_cpy(self._common_data.pos)

		mvec3_set(tmp_vec1, self._curve_path[1])
		mvec3_sub(tmp_vec1, old_pos)
		while self._curve_path[3] do
			mvec3_set(tmp_vec2, self._curve_path[2])
			mvec3_sub(tmp_vec2, self._curve_path[1])

			if mvec3_dot(tmp_vec1, tmp_vec2) < 0 and not managers.navigation:raycast({pos_from = old_pos, pos_to = self._curve_path[3]}) then
				table_remove(self._curve_path, 2)
			else
				break
			end
		end

		mvec3_set(self._last_pos, self._common_data.pos)
		self._curve_path_index = 1
		self._start_max_vel = nil

		self:_set_updator(nil)
		self:update(t)
	end
end

function CopActionWalk:_set_new_pos(dt)
	local path_pos = self._last_pos
	local path_z = path_pos.z

	self._ext_movement:upd_ground_ray(path_pos, true)

	local gnd_z = math_clamp(self._common_data.gnd_ray.position.z, path_z - 80, path_z + 80)
	local pos_new = tmp_vec1

	mvec3_set(pos_new, path_pos)

	if gnd_z < self._common_data.pos.z then
		mvec3_set_z(pos_new, self._common_data.pos.z)

		self._last_vel_z = self._apply_freefall(pos_new, self._last_vel_z, gnd_z, dt)
	else
		mvec3_set_z(pos_new, gnd_z)

		self._last_vel_z = 0
	end

	self._ext_movement:set_position(pos_new)
end

function CopActionWalk:get_husk_interrupt_desc()
	local old_action_desc = {
		path_simplified = true,
		type = "walk",
		interrupted = self._init_called, -- if we haven't even started moving yet because we were in _upd_wait_for_full_blend, prevent the first navpoint from being overwritten
		body_part = 2,
		end_rot = self._end_rot,
		variant = self._haste,
		nav_path = self._simplified_path,
		persistent = self._persistent,
		no_walk = self._no_walk,
		no_strafe = self._no_strafe,
		pose = self._init_called and (self._ext_anim.pose or "stand") or self._action_desc.pose, -- Switch back to whatever pose we were in prior to the interruption if the action has fully started, otherwise switch to the synced pose
		end_pose = self._action_desc.end_pose,
		host_stop_pos_ahead = self._host_stop_pos_ahead
	}

	if self._blocks or self._old_blocks then
		local blocks = {}
		for i in pairs(self._old_blocks or self._blocks) do
			blocks[i] = -1
		end

		old_action_desc.blocks = blocks
	end

	return old_action_desc
end

-- Don't turn to face attentions unless it's a shoot reaction during loud
function CopActionWalk:on_attention(attention)
	if attention then
		if attention.handler then
			if (managers.groupai:state():enemy_weapons_hot() and react_shoot or react_surprised) <= attention.reaction then -- no moonwalkers anymore
				self._attention_pos = attention.handler:get_attention_m_pos()
			else
				self._attention_pos = nil
			end
		elseif self._common_data.stance.name ~= "ntl" then
			if attention.unit then
				self._attention_pos = attention.unit:movement():m_pos()
			else
				self._attention_pos = nil
			end
		end
	else
		self._attention_pos = nil
	end

	self._attention = attention
end

function CopActionWalk:_get_current_max_walk_speed(move_dir)
	if move_dir == "l" or move_dir == "r" then
		move_dir = "strafe"
	end

	local speed = self._common_data.char_tweak.move_speed[self._ext_anim.pose][self._haste][self._stance.name][move_dir] * (self._unit:brain().is_hostage and self._unit:brain():is_hostage() and self._common_data.char_tweak.hostage_move_speed or 1)
	if not self._sync then
		if self:_husk_needs_speedup() then -- Only apply a speed boost to the husk if it's necessary to do so
			speed = speed * (1 + (Unit.occluded(self._unit) and 1 or CopActionWalk.lod_multipliers[self._ext_base:lod_stage()] or 1))
		elseif not managers.groupai:state():enemy_weapons_hot() then
			speed = speed * tweak_data.network.stealth_speed_boost
		end
	end
	
	if managers.mutators:is_mutator_active(MutatorCG22) then
		local cg22 = managers.mutators:get_mutator(MutatorCG22)

		if cg22:can_enemy_be_affected_by_buff("yellow", self._unit) then
			speed = speed * cg22:get_enemy_yellow_multiplier()
		end
	end	

	return speed
end

function CopActionWalk:save(save_data)
	if not self._init_called then -- hasn't even been synced to clients yet, don't sync to a drop-in
		return
	end

	save_data.type = "walk"
	save_data.body_part = self._body_part
	save_data.variant = self._haste
	save_data.end_rot = self._end_rot
	save_data.no_walk = self._no_walk
	save_data.no_strafe = self._no_strafe
	save_data.pose = self._ext_anim.pose or self._action_desc.pose or "stand" -- Use the host's current pose
	save_data.end_pose = self._action_desc.end_pose -- missing for whatever reason, thanks overkill!
	save_data.persistent = true
	save_data.path_simplified = true
	save_data.blocks = {
		act = -1,
		idle = -1,
		turn = -1,
		walk = -1
	}
	save_data.nav_path = {self._nav_point_pos(self._simplified_path[2])} -- TODO: premature path advancement in _nav_chk_walk could cause the enemy to walk through obstructions on drop-in
end

function CopActionWalk._calculate_simplified_path(good_pos, path, nr_iterations, z_test, apply_padding)
	if good_pos then
		table_insert(path, 1, good_pos)
	end

	-- if it's only 2 entries, we can't do anything
	if #path <= 2 then
		return
	end
	
	-- Iterate over the path instead of creating a new one
	local i = 2
	local prev_nav_point = path[1]
	while i < #path - 1 do
		local nav_point = path[i]
		local next_nav_point = CopActionWalk._nav_point_pos(path[i + 1])
		-- If the current isn't a navlink, attempt to shortcut
		if nav_point.x and math_abs((nav_point.z - prev_nav_point.z) + (nav_point.z - next_nav_point.z)) < 60 and not managers.navigation:raycast({pos_from = prev_nav_point, pos_to = next_nav_point}) then
			table_remove(path, i) -- We can skip this navpoint
		else
			-- current navpoint didn't get removed, if the navpoint is a navlink then use it's end position to shortcut
			prev_nav_point = nav_point.x and nav_point or nav_point.c_class:end_position()
			i = i + 1
		end
	end

	if #path > 2 then
		if apply_padding then
			CopActionWalk._apply_padding_to_simplified_path(path)
			CopActionWalk._calculate_shortened_path(path)
		end

		if nr_iterations > 1 then
			CopActionWalk._calculate_simplified_path(nil, path, nr_iterations - 1, z_test, apply_padding)
		end
	end
end

function CopActionWalk:_nav_chk_walk(t, dt, vis_state)
	local s_path = self._simplified_path
	local c_path = self._curve_path
	local c_index = self._curve_path_index
	local vel = nil

	if self._ext_anim.act and self._ext_anim.walk then
		vel = mvec3_len(self._unit:get_animation_delta_position()) / dt

		if vel == 0 then
			return
		end
	else
		vel = self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd")
	end

	local walk_dis = vel * dt
	local cur_pos = self._common_data.pos
	local nav_advanced, new_pos, new_c_index, complete, upd_footstep = nil

	while not self._end_of_curved_path do
		new_pos, new_c_index, complete = self._walk_spline(c_path, self._last_pos, c_index, walk_dis + 200)
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
					self:_reserve_nav_pos(next_pos, self._nav_point_pos(s_path[3]), c_path[#c_path], vel)
				end

				local new_c_path = nil
				-- only calculating if in a high LOD stage is negligible for performance, the function has essentially no performance impact but for consistency with vanilla players' sake i'm keeping it
				if vis_state == 1 and mvec3_dis_sq_no_z(s_path[1], next_pos) > 490000 then
					mvec3_set(tmp_vec1, s_path[1])
					mvec3_sub(tmp_vec1, c_path[#c_path - 1])
					mvec3_set_z(tmp_vec1, 0)
					mvec3_norm(tmp_vec1)

					new_c_path = self:_calculate_curved_path(s_path, 1, 1, tmp_vec1)
				else
					new_c_path = {
						s_path[1],
						next_pos
					}
				end

				for i = #c_path - 1, c_index, -1 do
					table_insert(new_c_path, 1, c_path[i])
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
		mvec3_set(self._footstep_pos, new_pos) -- better than constantly creating a new vector for this, z doesn't matter as it's nullified when this is used anyway
	end

	if self._start_run then
		walk_dis = mvec3_len(self._common_data.unit:get_animation_delta_position())
		self._cur_vel = math_min(self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd"), math_max(walk_dis / dt, self._start_max_vel))

		if self._cur_vel < self._start_max_vel then
			self._cur_vel = self._start_max_vel
			walk_dis = self._cur_vel * dt
		else
			self._start_max_vel = self._cur_vel
		end
	else
		local wanted_vel = vel
		if self._turn_vel then
			local dis = mvec3_dis_sq_no_z(c_path[c_index + 1], cur_pos)
			if dis < 4900 then
				wanted_vel = math_lerp(self._turn_vel, vel, dis / 4900)
			end
		end

		if self._cur_vel ~= wanted_vel then
			self._cur_vel = math_step(self._cur_vel, wanted_vel, vel * (self._cur_vel < wanted_vel and 1.5 or 4) * dt)
		end

		walk_dis = self._cur_vel * dt
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
		if future_pos then
			local cur_vec = tmp_vec2

			mvec3_set(cur_vec, next_pos)
			mvec3_sub(cur_vec, c_path[new_c_index])
			mvec3_set_z(cur_vec, 0)
			mvec3_norm(cur_vec)

			local next_vec = tmp_vec1

			mvec3_set(next_vec, future_pos)
			mvec3_sub(next_vec, next_pos)
			mvec3_set_z(next_vec, 0)

			local future_dis_flat = mvec3_norm(next_vec)
			local turn_dot = mvec3_dot(cur_vec, next_vec)
			if self._haste ~= "run" and math_abs(turn_dot) < 0.7 and not self._attention_pos and future_dis_flat > 80 and self._common_data.stance.name == "ntl" and mvec3_dot(self._common_data.fwd, cur_vec) > 0.97 then
				self._turn_vel = nil
				self._walk_turn = true
			else
				self._turn_vel = math_lerp(math_min(vel, 100), self:_get_current_max_walk_speed(self._ext_anim.move_side or "fwd"), turn_dot ^ 2) -- no need to clamp to above zero if you're squaring the number
				self._walk_turn = nil
			end
		else
			-- only play a run_stop on clients if we're sure the path is 2 entries and won't receive more, or our next navpoint is a navlink
			-- if the navlink doesn't require the unit being idle, skip the run_stop animation
			if (not self._persistent and #s_path == 2 or self._next_is_nav_link and self._next_is_nav_link.element:nav_link_wants_align_pos()) and not self._NO_RUN_STOP and self._haste == "run" and mvec3_dis_sq_no_z(new_pos, next_pos) >= 14400 then
				self._chk_stop_dis = 210
			end

			self._turn_vel = nil
			self._walk_turn = nil
		end
	end

	self._curve_path_index = new_c_index
	mvec3_set(self._last_pos, new_pos)
end

function CopActionWalk._walk_spline(path, pos, index, walk_dis)
	if walk_dis >= 0 then
		while true do
			mvec3_set(tmp_vec1, path[index + 1])
			mvec3_sub(tmp_vec1, path[index])
			mvec3_set_z(tmp_vec1, 0)

			local dis = mvec3_norm(tmp_vec1)

			mvec3_set(tmp_vec2, pos)
			mvec3_sub(tmp_vec2, path[index])
			mvec3_set_z(tmp_vec2, 0)

			local my_dis = mvec3_dot(tmp_vec1, tmp_vec2) + walk_dis
			if dis == 0 or dis <= my_dis then
				if index == #path - 1 then
					return path[index + 1], index, true
				else
					index = index + 1
				end
			else
				mvec3_lerp(tmp_vec5, path[index], path[index + 1], my_dis / dis) -- nothing depends on this being a new vector anymore as everything that uses this is now unique and uses mvec3_set

				return tmp_vec5, index
			end
		end
	else
		-- Highly doubt this ever happens, a unit shouldn't ever be walking backwards
		while true do
			mvec3_set(tmp_vec1, path[index])
			mvec3_sub(tmp_vec1, path[index + 1])
			mvec3_set_z(tmp_vec1, 0)

			local dis = mvec3_norm(tmp_vec1)

			mvec3_set(tmp_vec2, pos)
			mvec3_sub(tmp_vec2, path[index + 1])
			mvec3_set_z(tmp_vec2, 0)

			local my_dis = mvec3_dot(tmp_vec1, tmp_vec2) - walk_dis
			if dis == 0 or dis <= my_dis then
				if index == 1 then
					return path[index + 1], index
				else
					index = index - 1
				end
			else
				mvec3_lerp(tmp_vec5, path[index + 1], path[index], my_dis / dis) -- nothing depends on this being a new vector anymore as everything that uses this is now unique and uses mvec3_set

				return tmp_vec5, index
			end
		end
	end
end

function CopActionWalk:_reserve_nav_pos(nav_pos, next_pos, from_pos, vel)
	local step_vec = tmp_vec1 -- using a tmp_vec is fine
	mvec3_set(step_vec, nav_pos)
	mvec3_sub(step_vec, self._common_data.pos)
	mvec3_set_z(step_vec, 0) -- height shouldn't be considered

	local dis = mvec3_len(step_vec)

	mvec3_cross(step_vec, step_vec, math_up)
	mvec3_set_l(step_vec, 65)

	local step_clbk = callback(self, self, "_reserve_pos_step_clbk", {step_mul = 1, nr_attempts = 0, start_pos = nav_pos, fwd_pos = next_pos, bwd_pos = from_pos, step_vec = step_vec})
	local res_pos = managers.navigation:reserve_pos(TimerManager:game():time() + dis / vel, 1, nav_pos, step_clbk, 40, self._ext_movement:pos_rsrv_id())
	if res_pos then
		mvec3_set(nav_pos, res_pos.position)

		return true
	end
end

function CopActionWalk:_adjust_move_anim(side, speed)
	local anim_data = self._ext_anim
	if anim_data[speed] and (not anim_data.haste or anim_data.haste == speed) and anim_data["move_" .. side] then -- Otherwise units can't transition from sprinting to running due to how the sprint state is set up
		return
	end

	local enter_t = nil
	local move_side = anim_data.move_side
	if move_side and (side == move_side or self._matching_walk_anims[side][move_side]) then
		enter_t = self._machine:segment_relative_time(idstr_base) * self._walk_anim_lengths[anim_data.pose or "stand"][self._stance.name][speed][side]
	end

	local could_freeze = anim_data.can_freeze and (not anim_data.upper_body_active or anim_data.upper_body_empty)
	local redir_res = self._ext_movement:play_redirect(speed .. "_" .. side, enter_t)

	if could_freeze then
		self._ext_base:chk_freeze_anims()
	end

	return redir_res
end

function CopActionWalk:get_walk_to_pos()
	return self._nav_point_pos(self._simplified_path[2])
end

-- Helper function to get the final path position
function CopActionWalk:get_destination_pos()
	return self._nav_point_pos(self._simplified_path and self._simplified_path[#self._simplified_path] or self._nav_path and self._nav_path[#self._nav_path])
end

function CopActionWalk:_upd_wait(t)
	if self._ext_anim.move then
		self:_stop_walk()
	end

	if not self._end_of_curved_path or not self._persistent then
		self._curve_path_index = 1

		self:_chk_start_anim(self._nav_point_pos(self._simplified_path[2]))

		if self._start_run then
			self:_set_updator("_upd_start_anim_first_frame")
		else
			self:_set_updator(nil)
		end

		-- If we're playing a run_start, but not a run_start_turn animation we can use a curved path
		-- no idea why enemies in _upd_wait in vanilla don't even try to calculate a curved path
		if not self._start_run_turn and self._ext_base:lod_stage() == 1 and mvec3_dis_sq_no_z(self._simplified_path[1], self._nav_point_pos(self._simplified_path[2])) > 160000 then
			self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1, self._common_data.fwd)
		else
			self._curve_path = {
				self._simplified_path[1],
				self._nav_point_pos(self._simplified_path[2])
			}
		end

		self._cur_vel = 0
	end
end

local stop_anim_displacement_functions = {
	["stand"] = {
		["fwd"] = function(t) return (math_clamp(t, 0, 0.6) / 0.6) ^ 0.8 end,
		["bwd"] = function(t) local t_clamp = math_clamp(t, 0, 0.8) / 0.8 return 0.9 > t_clamp and 0.97 * (1 - (0.9 - t_clamp) / 0.9) or 0.97 + 0.03 * (t_clamp - 0.9) / 0.1 end,
		["l"] = function(t) local t_clamp = math_clamp(t, 0, 0.75) / 0.75 return 0.6 > t_clamp and 0.8 * t_clamp / 0.6 or 0.8 + (1 - 0.8) * (t_clamp - 0.6) / (1 - 0.6) end,
		["r"] = function(t) local t_clamp = math_clamp(t, 0, 0.8) / 0.8 return 0.85 > t_clamp and 0.9 * (1 - (0.85 - t_clamp) / 0.85) or 0.9 + 0.1 * (t_clamp - 0.85) / 0.15 end
	},
	["crouch"] = {
		["fwd"] = function(t) return (math_clamp(t, 0, 0.4) / 0.4) ^ 0.85 end,
		["bwd"] = function(t) return (math_clamp(t, 0, 0.4) / 0.4) ^ 0.85 end,
		["l"] = function(t) return (math_clamp(t, 0, 0.3) / 0.3) ^ 0.85 end,
		["r"] = function(t) return (math_clamp(t, 0, 0.6) / 0.6) ^ 0.85 end
	}
}

function CopActionWalk:_upd_stop_anim_first_frame(t)
	local redir_res = self._ext_movement:play_redirect("run_stop_" .. self._stop_anim_side)
	if not redir_res then
		return
	end

	self._machine:set_speed(redir_res, self:_get_current_max_walk_speed(self._stop_anim_side) / self._walk_anim_velocities[self._ext_anim.pose][self._stance.name][self._haste][self._stop_anim_side])

	self._stop_anim_init_pos = mvec3_cpy(self._last_pos)
	self._stop_anim_end_pos = self._nav_point_pos(self._simplified_path[2])
	self._chk_stop_dis = nil

	self:_set_updator("_upd_stop_anim")

	self._stop_anim_displacement_f = stop_anim_displacement_functions[self._ext_anim.pose][self._stop_anim_side]

	self._ext_base:chk_freeze_anims()
	self:update(t)
end

function CopActionWalk:_upd_stop_anim(t)
	local dt = TimerManager:game():delta_time()
	local rot_new = tmp_rot1
	local face_fwd = tmp_vec1

	-- Rotate towards attentions if we're not stopping for a navlink or the end of the path
	-- TODO: try switching between the run_stop directions as we rotate and see how it looks
	if not self._nav_link_rot and not self._end_rot and self._attention_pos then
		mvec3_dir(face_fwd, self._common_data.pos, self._attention_pos) -- z doesn't matter here
	else
		face_fwd = self._stop_anim_fwd
	end

	mrot_lookat(rot_new, face_fwd, math_up)
	local rotate_mult = self._common_data.char_tweak.rotation_speed or 3
	
	mrot_slerp(rot_new, self._common_data.rot, rot_new, math_min(1, dt * rotate_mult))

	self._ext_movement:set_rotation(rot_new)

	if self._ext_anim.run_stop then
		-- Fix this ungodly mess and stop it from creating several vectors every frame for no reason, using math.lerp on vectors is fucking stupid
		-- just lerp the self._last_pos vector, it's unique after all
		mvec3_lerp(self._last_pos, self._stop_anim_init_pos, self._stop_anim_end_pos, self._stop_anim_displacement_f(self._machine:segment_relative_time(idstr_base)))
	else
		-- we only play a run_stop for a navlink or the end of the path, so we only need to account for a navlink
		if self._next_is_nav_link then
			self:_set_updator("_upd_nav_link_first_frame")
			self:update(t)
		else
			self._expired = true

			if self._end_rot then
				self._ext_movement:set_rotation(self._end_rot)
			end
		end

		mvec3_set(self._last_pos, self._stop_anim_end_pos)
		self._stop_anim_displacement_f = nil
		self._stop_anim_end_pos = nil
		self._stop_anim_fwd = nil
		self._stop_anim_init_pos = nil
		self._stop_anim_side = nil
		self._stop_dis = nil
	end

	self:_set_new_pos(dt)
end

local some_fucking_lookup_table = {["_upd_wait"] = true, ["_upd_start_anim_first_frame"] = true, ["_upd_start_anim"] = true}
-- IN MEMORY OF ["_upd_nav_link_blend_to_idle "] --
local some_fucking_lookup_table_electric_boogaloo = {["_upd_nav_link"] = true, ["_upd_nav_link_first_frame"] = true, ["_upd_nav_link_blend_to_idle"] = true, ["_upd_stop_anim_first_frame"] = true, ["_upd_stop_anim"] = true, ["_upd_walk_turn_first_frame"] = true, ["_upd_walk_turn"] = true}

function CopActionWalk:stop()
	local pos = self._simplified_path[#self._simplified_path] -- no need to use self._nav_point_pos as a path will never end in a navlink

	self._persistent = false

	if self._init_called then
		if some_fucking_lookup_table[self._updator] then
			self._end_of_curved_path = nil
			self._end_of_path = nil
		elseif not self._next_is_nav_link then
			self._end_of_curved_path = nil
		end

		if #self._simplified_path >= 3 and not some_fucking_lookup_table_electric_boogaloo[self._updator] and math_abs(self._common_data.pos.z - pos.z) < 100 and not managers.navigation:raycast({tracker_from = self._common_data.nav_tracker, pos_to = pos}) then
			self._next_is_nav_link = nil
			self._end_of_curved_path = nil
			self._end_of_path = nil
			self._walk_turn = nil
			self._curve_path_index = 1
			local cur_pos = mvec3_cpy(self._common_data.pos)
			self._curve_path = {
				cur_pos,
				pos
			}
			self._simplified_path = {
				cur_pos,
				pos
			}
		end
	end

	for i_nav_point = 2, #self._simplified_path - 2 do -- -2 since otherwise we'd shortcut from the second to last to last which is pointless
		local from_pos = self._simplified_path[i_nav_point]
		if from_pos.x and math_abs(from_pos.z - pos.z) < 100 and not managers.navigation:raycast({pos_from = from_pos, pos_to = pos}) then
			self._simplified_path[i_nav_point + 1] = pos

			for i = i_nav_point + 2, #self._simplified_path do
				self._simplified_path[i] = nil
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

	table_insert(self._simplified_path, nav_point)

	if not nav_point.x and #self._simplified_path == 2 then
		self._next_is_nav_link = nav_point
	end

	if self._init_called then
		if some_fucking_lookup_table[self._updator] then
			self._end_of_curved_path = nil
			self._end_of_path = nil
		elseif not self._next_is_nav_link then
			self._end_of_curved_path = nil
		end
	end
end

function CopActionWalk:_play_nav_link_anim(t)
	local nav_link = self._next_is_nav_link

	self._old_blocks = self._blocks
	self:_set_blocks(self._anim_block_presets.block_all)

	local rot_new = tmp_rot1
	mrot_set_yaw_pitch_roll(rot_new, nav_link.element:value("rotation"), 0, 0)
	self._ext_movement:set_rotation(rot_new)

	mvec3_set(self._last_pos, nav_link.element:value("position")) -- doubt this changes anything since it should already be the navlink position

	self._next_is_nav_link = nil
	self._end_of_curved_path = nil
	self._end_of_path = nil
	self._curve_path_end_rot = nil
	self._nav_link_rot = nil
	self._chk_stop_dis = nil

	self:_advance_simplified_path()

	if self._ext_movement:play_redirect(nav_link.element:value("so_action")) then
		self._nav_link = nav_link -- not used in this action, but is checked from CopActionStand/CopActionCrouch

		if self._nav_link_invul and not self._nav_link_invul_on then
			self._common_data.ext_damage:set_invulnerable(true)

			self._nav_link_invul_on = true
		end

		if self._sync then
			self:_send_nav_point(self._simplified_path[1])
		end

		self:_set_updator("_upd_nav_link")
		self._common_data.unit:set_driving("animation")

		self._changed_driving = true

		if self._blocks.action then -- the animation may change blocks
			self._ext_movement:action_request({
				non_persistent = true,
				client_interrupt = true,
				body_part = 3,
				type = "idle"
			})
		end
	else
		self._simplified_path[1] = mvec3_cpy(self._common_data.pos)

		self:_set_new_pos(TimerManager:game():delta_time())

		if self._sync then
			if alive(nav_link.c_class) then
				table_insert(self._simplified_path, 2, nav_link.c_class:end_position())

				self._next_is_nav_link = nil -- in case there's two navlinks in a row but the first one failed then handle it correctly, you'll probably win the lottery before this ever happens
			end

			-- sync the position of the next navpoint as a path can actually have 2 navlinks in a row, even if it's incredibly rare
			self:_send_nav_point(self._nav_point_pos(self._simplified_path[2])) -- self._simplified_path[2] should never be nil if we're host, as paths never end in a navlink
		end

		self._cur_vel = 0

		self:_set_blocks(self._old_blocks)
		self._old_blocks = nil

		if self._simplified_path[2] then
			self:_chk_start_anim(self._nav_point_pos(self._simplified_path[2]))

			if self._start_run then
				self:_set_updator("_upd_start_anim_first_frame")
			else
				self:_set_updator(nil)
			end

			-- same as _init, if we're playing a run_start, but not a run_start_turn animation we can use a curved path
			-- only calculating if in a high LOD stage is negligible for performance, the function has essentially no performance impact but for consistency with vanilla clients' sake i'm keeping it
			if not self._start_run_turn and self._ext_base:lod_stage() == 1 and mvec3_dis_sq_no_z(self._simplified_path[1], self._nav_point_pos(self._simplified_path[2])) > 160000 then
				self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1, self._common_data.fwd)
			else
				self._curve_path = {
					self._simplified_path[1],
					self._nav_point_pos(self._simplified_path[2])
				}
			end

			self._curve_path_index = 1

			self:update(t)
		else -- A path will never end with a navlink, the host will always sync a final position so just going to _upd_wait is fine
			self._end_of_curved_path = true -- ensure the unit won't prematurely exit _upd_wait

			self:_set_updator("_upd_wait")
		end
	end
end

function CopActionWalk:_upd_nav_link(t)
	if self._ext_anim.act and not self._ext_anim.walk then
		self._last_pos = self._unit:position() -- new vector, no need to copy

		self._ext_movement:set_m_pos(self._last_pos)
		self._ext_movement:set_m_rot(self._unit:rotation())
	else -- don't check for self._simplified_path[2] in case a client finishes before the next navpoint gets synced
		self._simplified_path[1] = mvec3_cpy(self._common_data.pos)

		self._common_data.unit:set_driving("script")

		self._changed_driving = nil

		local nav_link = self._nav_link
		if self._sync then
			if alive(nav_link.c_class) and managers.navigation:raycast({tracker_from = self._common_data.nav_tracker, pos_to = self._nav_point_pos(self._simplified_path[2])}) then
				table_insert(self._simplified_path, 2, nav_link.c_class:end_position()) -- the path has already been shortcutted based off the navlink's end position, so there's no need to attempt to shortcut based off it again

				self._next_is_nav_link = nil -- in case there's two navlinks in a row but we can't move directly to the second then handle it correctly
			elseif not self._next_is_nav_link then -- next is not a navlink, another shortcut attempt is a possibility
				-- we're not obstructed to the next navpoint, attempt to shortcut based on the position we actually ended up at after the navlink
				self._calculate_simplified_path(nil, self._simplified_path, 1, true, true) -- i know this iterates over the entire path and it's not hugely likely to find a new shortcut, but it also shortens and applies padding based off the position we actually ended up at

				if not self._simplified_path[2].x then
					self._next_is_nav_link = self._simplified_path[2] -- if the shortcut was successful and the next navpoint is now a navlink, properly account for it
				end
			end

			-- sync the position of the next navpoint as a path can actually have 2 navlinks in a row, even if it's incredibly rare (though more likely with the changes i've made)
			self:_send_nav_point(self._nav_point_pos(self._simplified_path[2])) -- self._simplified_path[2] should never be nil if we're host, as paths never end in a navlink
		end

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

		if self._simplified_path[2] then
			if nav_link.element:nav_link_wants_align_pos() then
				self:_chk_start_anim(self._nav_point_pos(self._simplified_path[2]))
			end

			if self._start_run then
				self:_set_updator("_upd_start_anim_first_frame")
			else
				self:_set_updator(nil)
			end

			-- same as _init, if we're playing a run_start, but not a run_start_turn animation we can use a curved path
			-- only calculating if in a high LOD stage is negligible for performance, the function has essentially no performance impact but for consistency with vanilla clients' sake i'm keeping it
			-- has to be done here as we won't know the exact distance to the next navpoint until the navlink fails or finishes
			if not self._start_run_turn and self._ext_base:lod_stage() == 1 and mvec3_dis_sq_no_z(self._simplified_path[1], self._nav_point_pos(self._simplified_path[2])) > 160000 then
				self._curve_path = self:_calculate_curved_path(self._simplified_path, 1, 1, self._common_data.fwd)
			else
				self._curve_path = {
					self._simplified_path[1], -- this was just copied, no need to copy it again
					self._nav_point_pos(self._simplified_path[2])
				}
			end

			self._curve_path_index = 1

			self:update(t)
		else -- happens if a client finished the navlink before the host has synced another navpoint, a path will never end in a navlink so just go to _upd_wait
			self._end_of_curved_path = true -- ensure the unit won't prematurely exit _upd_wait

			self:_set_updator("_upd_wait")
		end
	end
end

function CopActionWalk:_upd_walk_turn_first_frame(t)
	local pos1 = self._curve_path[self._curve_path_index + 1]
	local pos2 = self._curve_path[self._curve_path_index + 2]
	if not pos1 or not pos2 then
		self._walk_turn = nil

		self:_set_updator(nil)
		self:update(t)

		return
	end

	mvec3_set(tmp_vec2, pos2)
	mvec3_sub(tmp_vec2, pos1)
	-- no need to set z to 0 or normalise, since we don't care about the exact dot product, only whether it's positive or negative

	local seg_rel_t = self._machine:segment_relative_time(idstr_base)
	local left_foot = seg_rel_t < 0.25 or seg_rel_t > 0.75
	local result = self._ext_movement:play_redirect("walk_turn_" .. (mvec3_dot(self._common_data.right, tmp_vec2) > 0 and "r_" or "l_") .. (left_foot and "lf" or "rf"))
	if result then
		self._cur_vel = self:_get_current_max_walk_speed("fwd")

		self._machine:set_speed(result, self._cur_vel / self._walk_anim_velocities.stand.ntl.walk.fwd)

		self._common_data.unit:set_driving("animation")
		self._changed_driving = true

		self._curve_path_index = self._curve_path_index + 1

		if not left_foot then
			self._walk_turn_blend_to_middle = true
		end

		self:_set_updator("_upd_walk_turn")
	else
		self._walk_turn = nil

		self:_set_updator(nil)
		self:update(t)
	end
end

function CopActionWalk:_upd_walk_turn(t)
	if self._ext_anim.walk_turn then
		self._last_pos = self._unit:position() -- new vector, no need to copy

		self._ext_movement:set_m_pos(self._last_pos)

		self:_set_new_pos(TimerManager:game():delta_time())
		self._ext_movement:set_m_rot(self._unit:rotation())
	else
		if self._walk_turn_blend_to_middle then
			self._machine:set_animation_time_all_segments(0.5)
		end

		self._common_data.unit:set_driving("script")

		self._changed_driving = nil

		local c_index = self._curve_path_index + 2
		while c_index < #self._curve_path do
			if not managers.navigation:raycast({pos_from = self._common_data.pos, pos_to = self._curve_path[c_index]}) then -- TODO: fix, what's the point in calculating a curved path if you just get rid of it
				table_remove(self._curve_path, c_index - 1)
			else
				break
			end
		end

		self._curve_path[self._curve_path_index] = mvec3_cpy(self._common_data.pos)
		self._walk_turn = nil
		self._walk_turn_blend_to_middle = nil

		self:_set_updator(nil)
		self:update(t)
	end
end

function CopActionWalk:_set_updator(name)
	self.update = self[name]
	self._updator = name

	if not name then
		self._last_upd_t = TimerManager:game():time() - 0.001
	end
end

function CopActionWalk:on_nav_link_unregistered(element_id)
	if self._next_is_nav_link and self._next_is_nav_link.element._id == element_id then
		self._ext_movement:action_request({
			body_part = 2,
			type = "idle"
		})
	else
		for i = 1, #self._simplified_path do
			local nav_point = self._simplified_path[i]
			if not nav_point.x and (nav_point.element and nav_point.element:id() or nav_point:script_data().element:id()) == element_id then -- navlinks may not have been processed by _init yet if we were in _upd_wait_for_full_blend
				self._ext_movement:action_request({
					body_part = 2,
					type = "idle"
				})
			end
		end
	end
end

function CopActionWalk:_husk_needs_speedup()
	if self._ext_movement._queued_actions and next_g(self._ext_movement._queued_actions) then
		return true
	elseif #self._simplified_path > 2 then
		local prev_pos = self._common_data.pos
		local dis_error_total = 0

		for i = 2, #self._simplified_path do
			local next_pos = self._nav_point_pos(self._simplified_path[i])
			dis_error_total = dis_error_total + mvec3_dis_no_z(prev_pos, next_pos) -- Don't use dis_sq, we need actual distance if checking more than one point

			if dis_error_total > 300 then -- Maybe raise this value, especially since we don't know how far along the host actually is to the next navpoint
				return true
			end

			prev_pos = next_pos
		end
	end
end
