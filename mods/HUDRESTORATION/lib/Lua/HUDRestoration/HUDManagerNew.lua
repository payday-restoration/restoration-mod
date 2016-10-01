function HUDManager:add_waypoint(id, data)
	if self._hud.waypoints[id] then
		self:remove_waypoint(id)
	end
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	if not hud then
		self._hud.stored_waypoints[id] = data
		return
	end
	local waypoint_panel = hud.panel
	local icon = data.icon or "wp_standard"
	local text = ""
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(icon, {
		0,
		0,
		32,
		32
	})
	local bitmap = waypoint_panel:bitmap({
		name = "bitmap" .. id,
		texture = icon,
		texture_rect = texture_rect,
		layer = 0,
		w = texture_rect[3],
		h = texture_rect[4],
		blend_mode = data.blend_mode,
		rotation = 360
	})
	local arrow_icon, arrow_texture_rect = tweak_data.hud_icons:get_icon_data("wp_arrow")
	local arrow = waypoint_panel:bitmap({
		name = "arrow" .. id,
		texture = arrow_icon,
		texture_rect = arrow_texture_rect,
		color = data.color or Color.white:with_alpha(0.75),
		visible = false,
		layer = 0,
		w = arrow_texture_rect[3],
		h = arrow_texture_rect[4],
		blend_mode = data.blend_mode,
		rotation = 360
	})
	local distance
	if data.distance then
		distance = waypoint_panel:text({
			name = "distance" .. id,
			text = "16.5",
			color = data.color or Color(1, 1, 0.65882355, 0),
			font = tweak_data.hud.medium_font_noshadow,
			font_size = tweak_data.hud.default_font_size,
			align = "center",
			vertical = "center",
			w = 128,
			h = 24,
			layer = 0,
			blend_mode = data.blend_mode,
			rotation = 360
		})
		distance:set_visible(false)
	end
	local timer = data.timer and waypoint_panel:text({
		name = "timer" .. id,
		text = (math.round(data.timer) < 10 and "0" or "") .. math.round(data.timer),
		font = tweak_data.hud.medium_font_noshadow,
		font_size = 32,
		align = "center",
		vertical = "center",
		w = 32,
		h = 32,
		layer = 0,
		rotation = 360
	})
	text = waypoint_panel:text({
		name = "text" .. id,
		text = utf8.to_upper(" " .. text),
		font = tweak_data.hud.small_font,
		font_size = tweak_data.hud.small_font_size,
		align = "center",
		vertical = "center",
		w = 512,
		h = 24,
		layer = 0,
		rotation = 360
	})
	local _, _, w, _ = text:text_rect()
	text:set_w(w)
	local w, h = bitmap:size()
	self._hud.waypoints[id] = {
		init_data = data,
		state = data.state or "present",
		present_timer = data.present_timer or 2,
		bitmap = bitmap,
		arrow = arrow,
		size = Vector3(w, h, 0),
		text = text,
		distance = distance,
		timer_gui = timer,
		timer = data.timer,
		pause_timer = not data.pause_timer and data.timer and 0,
		position = data.position,
		unit = data.unit,
		no_sync = data.no_sync,
		move_speed = 1,
		radius = data.radius or 160
	}
	self._hud.waypoints[id].init_data.position = data.position or data.unit:position()
	local slot = 1
	local t = {}
	for _, data in pairs(self._hud.waypoints) do
		if data.slot then
			t[data.slot] = data.text:w()
		end
	end
	for i = 1, 10 do
		if not t[i] then
			self._hud.waypoints[id].slot = i
			break
		end
	end
	self._hud.waypoints[id].slot_x = 0
	if self._hud.waypoints[id].slot == 2 then
		self._hud.waypoints[id].slot_x = t[1] / 2 + self._hud.waypoints[id].text:w() / 2 + 10
	elseif self._hud.waypoints[id].slot == 3 then
		self._hud.waypoints[id].slot_x = -t[1] / 2 - self._hud.waypoints[id].text:w() / 2 - 10
	elseif self._hud.waypoints[id].slot == 4 then
		self._hud.waypoints[id].slot_x = t[1] / 2 + t[2] + self._hud.waypoints[id].text:w() / 2 + 20
	elseif self._hud.waypoints[id].slot == 5 then
		self._hud.waypoints[id].slot_x = -t[1] / 2 - t[3] - self._hud.waypoints[id].text:w() / 2 - 20
	end
end
