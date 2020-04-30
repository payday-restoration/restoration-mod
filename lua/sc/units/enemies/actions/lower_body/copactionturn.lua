local tmp_rot = Rotation()
local mrot_set_ypr = mrotation.set_yaw_pitch_roll

function CopActionTurn:_upd_wait_full_blend(t)
	if self._ext_anim.idle_full_blend then
		local angle = self._action_desc.angle
		local dir_str = angle > 0 and "l" or "r"
		local redir_name = "turn_" .. dir_str
		local redir_res = self._ext_movement:play_redirect(redir_name)

		if redir_res then
			local abs_angle = math.abs(angle)

			if abs_angle > 135 then
				self._machine:set_parameter(redir_res, "angle135", 1)
			elseif abs_angle > 90 then
				local lerp = (abs_angle - 90) / 45

				self._machine:set_parameter(redir_res, "angle135", lerp)
				self._machine:set_parameter(redir_res, "angle90", 1 - lerp)
			elseif abs_angle > 45 then
				local lerp = (abs_angle - 45) / 45

				self._machine:set_parameter(redir_res, "angle90", lerp)
				self._machine:set_parameter(redir_res, "angle45", 1 - lerp)
			else
				self._machine:set_parameter(redir_res, "angle45", 1)
			end

			if self._action_desc.speed then
				local speed = self._action_desc.speed

				self._machine:set_speed(redir_res, speed)
			end

			self._common_data.unit:set_driving("animation")
			self._ext_movement:set_root_blend(false)
			self._ext_base:chk_freeze_anims()

			self.update = nil

			self:update(t)
		else
			cat_print("george", "[CopActionTurn:update] ", redir_name, " redirect failed in", self._machine:segment_state(Idstring("base")))

			self._expired = true
		end
	end
end