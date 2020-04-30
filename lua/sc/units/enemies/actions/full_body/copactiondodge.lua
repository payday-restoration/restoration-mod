local ids_base = Idstring("base")
local math_clamp = math.clamp
local math_floor = math.floor
local math_min = math.min
local math_up = math.UP
local mrot_set = mrotation.set_yaw_pitch_roll

function CopActionDodge:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_base = common_data.ext_base
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._timeout = action_desc.timeout
	self._machine = common_data.machine
	self._descriptor = action_desc

	local redir_res = common_data.ext_movement:play_redirect("dodge")

	if redir_res then
		self._last_vel_z = 0

		self:_determine_rotation_transition()
		self._ext_movement:set_root_blend(false)
		self._unit:set_driving("animation")
		self._machine:set_parameter(redir_res, action_desc.side, 1)
		self._machine:set_parameter(redir_res, action_desc.variation, 1)

		local speed = action_desc.speed or 1

		if speed ~= 1 then
			if action_desc.variation == "side_step" then
				speed = math_min(speed, 1.2)
			elseif action_desc.variation == "wheel" then
				speed = math_min(speed, 1.4)
			else
				speed = math_min(speed, 1.6)
			end

			self._machine:set_speed(redir_res, speed)
		end

		CopActionAct._create_blocks_table(self, action_desc.blocks)
		self._ext_movement:enable_update()

		if Network:is_server() then
			local i_variation = CopActionDodge._get_variation_index(action_desc.variation)
			local i_side = CopActionDodge._get_side_index(action_desc.side)
			local dir = Rotation(action_desc.direction, math_up):yaw()
			local shoot_accuracy = action_desc.shoot_accuracy or 1
			local sync_accuracy = math_clamp(math_floor(shoot_accuracy * 10) / 10, 0, 10)

			common_data.ext_network:send("action_dodge_start", action_desc.body_part, i_variation, i_side, dir, speed, sync_accuracy)
		end

		return true
	end
end

function CopActionDodge:on_exit()
	self._unit:set_driving("script")

	if Network:is_client() then
		self._ext_movement:set_m_host_stop_pos(self._ext_movement:m_pos())
	elseif not self._expired then
		self._common_data.ext_network:send("action_dodge_end")
	end
end

function CopActionDodge:update(t)
	if self._ext_anim.dodge then
		self._last_pos = CopActionHurt._get_pos_clamped_to_graph(self)

		local new_rot = nil

		if self._rot_transition then
			local anim_rel_t = self._machine:segment_relative_time(ids_base)
			local rot_prog = anim_rel_t / self._rot_transition.end_anim_t

			if rot_prog > 1 then
				new_rot = self._rot_transition.end_rot
				self._rot_transition = nil
			else
				new_rot = self._rot_transition.start_rot:slerp(self._rot_transition.end_rot, rot_prog)
			end
		else
			new_rot = self._unit:get_animation_delta_rotation()
			new_rot = self._common_data.rot * new_rot

			mrot_set(new_rot, new_rot:yaw(), 0, 0)
		end

		self._ext_movement:set_rotation(new_rot)

		local dt = TimerManager:game():delta_time()
		CopActionWalk._set_new_pos(self, dt)

		if self._ext_anim.base_need_upd then
			self._ext_movement:upd_m_head_pos()
		end
	else
		self._expired = true
	end
end

function CopActionDodge:chk_block(action_type, t)
	if action_type == "death" or action_type == "bleedout" or action_type == "fatal" then
		return false
	elseif action_type == "turn" or action_type == "idle" or action_type == "stand" or action_type == "crouch" or CopActionAct.chk_block(self, action_type, t) then
		return true
	end
end
