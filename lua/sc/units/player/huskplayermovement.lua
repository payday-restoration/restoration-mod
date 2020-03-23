if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	local mvec3_set = mvector3.set
	local mvec3_set_z = mvector3.set_z
	local mvec3_z = mvector3.z
	local mrot_look = mrotation.set_look_at
	local math_up = math.UP

	local init_original = HuskPlayerMovement.init
	function HuskPlayerMovement:init(unit)
		self._stand_detection_offset_z = mvec3_z(tweak_data.player.stances.default.standard.head.translation)
		init_original(self, unit)
	end

	function HuskPlayerMovement:_calculate_m_pose()
		mrot_look(self._m_head_rot, self._look_dir, math_up)
		self._obj_head:m_position(self._m_head_pos)
		self._obj_spine:m_position(self._m_com)
	end

	local sync_action_walk_nav_point_original = HuskPlayerMovement.sync_action_walk_nav_point
	function HuskPlayerMovement:sync_action_walk_nav_point(pos, speed, action, params)
		self:_update_m_detect_pos(pos)
		sync_action_walk_nav_point_original(self, pos, speed, action, params)
	end

	function HuskPlayerMovement:_update_m_detect_pos(new_pos)
		mvec3_set(self._m_detect_pos, new_pos)
		mvec3_set(self._m_newest_pos, new_pos)

		local offset_z = self._pose_code == 2 and self._crouch_detection_offset_z or self._stand_detection_offset_z

		mvec3_set_z(self._m_detect_pos, mvec3_z(self._m_detect_pos) + offset_z)
	end
end
