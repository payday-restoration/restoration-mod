local math_clamp = math.clamp
local math_floor = math.floor
local math_up = math.UP

function CopActionDodge:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_base = common_data.ext_base
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._timeout = action_desc.timeout
	self._machine = common_data.machine
	self._ids_base = Idstring("base")

	local redir_res = common_data.ext_movement:play_redirect("dodge")
	if redir_res then
		self._descriptor = action_desc
		self._last_vel_z = 0

		self:_determine_rotation_transition()
		self._ext_movement:set_root_blend(false)
		self._machine:set_parameter(redir_res, action_desc.variation, 1)

		if action_desc.speed then
			self._machine:set_speed(redir_res, math.min(action_desc.speed, 1.6))
		end

		self._machine:set_parameter(redir_res, action_desc.side, 1)

		if Network:is_server() then
			local i_variation = CopActionDodge._get_variation_index(action_desc.variation)
			local i_side = CopActionDodge._get_side_index(action_desc.side)
			local dir = Rotation(action_desc.direction, math_up):yaw()
			local shoot_accuracy = action_desc.shoot_accuracy or 1
			local sync_accuracy = math_clamp(math_floor(shoot_accuracy * 10), 0, 10)

			common_data.ext_network:send("action_dodge_start", action_desc.body_part, i_variation, i_side, dir, speed, sync_accuracy)
		end

		CopActionAct._create_blocks_table(self, action_desc.blocks)
		self._ext_movement:enable_update()

		return true
	end
end

function CopActionDodge:chk_block(action_type, t)
	if action_type == "death" or action_type == "bleedout" or action_type == "fatal" then
		return false
	elseif action_type == "turn" or action_type == "idle" or action_type == "stand" or action_type == "crouch" or CopActionAct.chk_block(self, action_type, t) then
		return true
	end
end
