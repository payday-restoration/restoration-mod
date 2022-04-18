local mrot_set_lookat = mrotation.set_look_at
local mrot_slerp = mrotation.slerp
local mrot_y = mrotation.y
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local tmp_rot = Rotation()

-- Enable client turn behavior on host
Hooks:PostHook(CopActionIdle, "init", "sh_init", function (self, action_desc, common_data)
	self._start_fwd = common_data.rot:y()
end)

function CopActionIdle:update(t)
	if self._ik_update then
		self._ik_update(t)
	end

	if self._attention then
		local ik_enable = true
		local look_from_pos = self._ext_movement:m_head_pos()
		local target_vec = self._look_vec

		if self._attention.handler then
			mvec3_dir(target_vec, look_from_pos, self._attention.handler:get_detection_m_pos())
		elseif self._attention.unit then
			mvec3_dir(target_vec, look_from_pos, self._attention.unit:movement():m_head_pos())
		else
			mvec3_dir(target_vec, look_from_pos, self._attention.pos)
		end

		if self._look_trans then
			local look_trans = self._look_trans
			local prog = (t - look_trans.start_t) / look_trans.duration

			if prog > 1 then
				self._look_trans = nil
			else
				local prog_smooth = math.bezier({ 0,  0, 1, 1 }, prog)
				mrot_set_lookat(tmp_rot, target_vec, math.UP)
				mrot_slerp(tmp_rot, look_trans.start_rot, tmp_rot, prog_smooth)
				mrot_y(tmp_rot, target_vec)
				if mvec3_dot(target_vec, self._common_data.fwd) < 0.2 then
					ik_enable = false
				end
			end
		elseif mvec3_dot(target_vec, self._common_data.fwd) < 0.2 then
			ik_enable = false
		end

		if ik_enable then
			if not self._modifier_on then
				self._modifier_on = true
				self._machine:force_modifier(self._modifier_name)
			end

			local active_actions = self._common_data.active_actions
			local queued_actions = self._common_data.queued_actions
			-- Use the same conditions as in CopActionShoot and reduce the required angle difference
			if not active_actions[1] and not active_actions[2] and (not queued_actions or not queued_actions[1] and not queued_actions[2]) then
				local spin = target_vec:to_polar_with_reference(self._common_data.fwd, math.UP).spin
				if math.abs(spin) > 50 then
					self._rot_offset = spin
					self._ext_movement:action_request({
						body_part = 2,
						type = "turn",
						angle = spin
					})
				end
			end
		elseif self._modifier_on then
			self._modifier_on = false
			self._machine:forbid_modifier(self._modifier_name)
		end

		self._modifier:set_target_z(target_vec)
	elseif self._rot_offset then
		self._ext_movement:action_request({
			body_part = 2,
			type = "turn",
			angle = self._start_fwd:to_polar_with_reference(self._common_data.fwd, math.UP).spin
		})
		self._rot_offset = nil
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end
