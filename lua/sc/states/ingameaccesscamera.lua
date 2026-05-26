-- AAAAAALL THIS shit, just to change the slot mask and to remove the priority shout stuff.
-- Man...

local tmp_vec1 = Vector3()
local tmp_rot1 = Rotation()

function IngameAccessCamera:update(t, dt)
	if _G.IS_VR then
		local active_menu = managers.menu:active_menu()

		if active_menu and active_menu.name == "ingame_access_camera_menu" then
			self._controller:set_active(true)
		else
			self._controller:set_active(false)
		end
	end

	if self._no_feeds then
		return
	end

	t = managers.player:player_timer():time()
	dt = managers.player:player_timer():delta_time()
	local roll = 0
	local access_camera = self._cameras[self._camera_data.index].access_camera

	if access_camera and access_camera.is_moving and access_camera:is_moving() then
		local m_rot = self._cam_unit:camera():get_original_rotation()

		if m_rot then
			access_camera:m_camera_rotation(m_rot)
		end

		access_camera:m_camera_position(tmp_vec1)
		self._cam_unit:set_position(tmp_vec1)

		roll = mrotation.roll(m_rot)
	end

	local look_d = self._controller:get_input_axis("look")

	if _G.IS_VR then
		look_d = self._controller:get_input_axis("touchpad_primary")

		if math.abs(look_d.x) < 0.01 then
			self._target_yaw = self._yaw
		end

		if math.abs(look_d.y) < 0.01 then
			self._target_pitch = self._pitch
		end
	end

	local zoomed_value = self._cam_unit:camera():zoomed_value()
	self._target_yaw = self._target_yaw - look_d.x * zoomed_value

	if self._yaw_limit ~= -1 then
		self._target_yaw = math.clamp(self._target_yaw, -self._yaw_limit, self._yaw_limit)
	end

	self._target_pitch = self._target_pitch + look_d.y * zoomed_value

	if self._pitch_limit ~= -1 then
		self._target_pitch = math.clamp(self._target_pitch + look_d.y * zoomed_value, -self._pitch_limit, self._pitch_limit)
	end

	self._yaw = math.step(self._yaw, self._target_yaw, dt * 10)
	self._pitch = math.step(self._pitch, self._target_pitch, dt * 10)

	self._cam_unit:camera():set_offset_rotation(self._yaw, self._pitch, roll)

	local move_d = self._controller:get_input_axis("move")

	if _G.IS_VR then
		move_d = self._controller:get_input_axis("touchpad_secondary")
	end

	self._cam_unit:camera():modify_fov(-move_d.y * dt * 12)

	if self._do_show_camera then
		self._do_show_camera = false

		managers.hud:set_access_camera_destroyed(access_camera:value("destroyed"))
	end

	local units = World:find_units_quick("all", 3, 16, 21, managers.slot:get_mask("trip_mine_targets"))
	local amount = 0

	for i, unit in ipairs(units) do
		if World:in_view_with_options(unit:movement():m_head_pos(), 0, 0, 4000) then
			local ray = nil

			if self._last_access_camera and self._last_access_camera:has_camera_unit() then
				ray = self._cam_unit:raycast("ray", unit:movement():m_head_pos(), self._cam_unit:position(), "ray_type", "ai_vision", "slot_mask", managers.slot:get_mask("world_geometry"), "ignore_unit", self._last_access_camera:camera_unit(), "report")
			else
				ray = self._cam_unit:raycast("ray", unit:movement():m_head_pos(), self._cam_unit:position(), "ray_type", "ai_vision", "slot_mask", managers.slot:get_mask("world_geometry"), "report")
			end

			if not ray then
				amount = amount + 1

				managers.hud:access_camera_track(amount, self._cam_unit:camera()._camera, unit:movement():m_head_pos())

				if self._last_access_camera and not self._last_access_camera:value("destroyed") and managers.player:upgrade_value("player", "sec_camera_highlight", false) and unit:base()._tweak_table and unit:in_slot(managers.slot:get_mask("trip_mine_targets")) then
					managers.game_play_central:auto_highlight_enemy(unit, true, "trip_mine")
				end
			end
		end
	end

	managers.hud:access_camera_track_max_amount(amount)
end