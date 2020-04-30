local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_z = mvector3.z
local mrot_look = mrotation.set_look_at
local math_up = math.UP

local init_original = HuskPlayerMovement.init
function HuskPlayerMovement:init(unit)
	self._draw_player_newest_pos = nil
	self._draw_player_detect_pos = nil
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
	if pos then
		self:_update_m_detect_pos(pos)
	end

	sync_action_walk_nav_point_original(self, pos, speed, action, params)
end

function HuskPlayerMovement:_update_m_detect_pos(new_pos, new_pose_code)
	mvec3_set(self._m_newest_pos, new_pos)
	mvec3_set(self._m_detect_pos, new_pos)

	local offset_z = nil

	if new_pose_code then
		offset_z = new_pose_code == 2 and self._crouch_detection_offset_z or self._stand_detection_offset_z
	else
		offset_z = self._pose_code == 2 and self._crouch_detection_offset_z or self._stand_detection_offset_z
	end

	mvec3_set_z(self._m_detect_pos, mvec3_z(self._m_detect_pos) + offset_z)

	if self._draw_player_newest_pos then
		local m_brush = Draw:brush(Color.blue:with_alpha(0.5), 0.1)
		m_brush:sphere(self._m_newest_pos, 15)
	end

	if self._draw_player_detect_pos then
		local head_brush = Draw:brush(Color.yellow:with_alpha(0.5), 0.1)
		head_brush:sphere(self._m_detect_pos, 15)
	end
end

function HuskPlayerMovement:sync_action_change_pose(pose_code, pos)
	self._desired_pose_code = pose_code
	self:_update_m_detect_pos(pos, pose_code)
end