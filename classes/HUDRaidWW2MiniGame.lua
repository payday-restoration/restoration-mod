HUDRaidWW2MiniGame = HUDRaidWW2MiniGame or class()

function HUDRaidWW2MiniGame:init(parent, params)
	self._parent = parent
	managers.hud:remove_interact()

    local hud_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel
    local full_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2).panel

    if hud_panel:child('raiww2') then
        hud_panel:remove(hud_panel:child('raiww2'))
    end

    if full_panel:child('raiww2') then
        full_panel:remove(full_panel:child('raiww2'))
    end

	self._background_texture = full_panel:bitmap({
		name = "raiww2",
        texture = "ui/raid_secondary_menu_bg",
        layer = 1000,
		alpha = 0.5,
	})

	self._hud_panel = hud_panel:panel({name = 'raidww2', layer = 1000})
	self._tweak_data = params or {}
	self._sides = 64
	self._child_name_text = "interact_child_text"
	self._child_ivalid_name_text = "interact_child_invalid_text"
	self._is_active = false
	self._circles = {}

	if self._hud_panel:child(self._child_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_name_text))
	end

	if self._hud_panel:child(self._child_ivalid_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_ivalid_name_text))
	end

	self._interact_text = self._hud_panel:text({
		layer = 1,
		h = 64,
		font_size = 24,
		align = "center",
		text = "HELLO",
		visible = false,
		valign = "center",
		name = self._child_name_text,
		font = "fonts/font_large_mf"
	})

	self._interact_text:set_y(self._hud_panel:h() / 2 + 64 + 16)

	self._lockpick_texture = self._hud_panel:bitmap({
		name = "_lockpick_texture",
		layer = 2,
		texture = self._tweak_data.minigame_icon or "ui/interact_lockpick_tool",
		texture_rect = {0,0,256,256}
	})
	self._lockpick_texture:set_position(self._hud_panel:w() / 2 - self._lockpick_texture:w() / 2, self._hud_panel:h() / 2 - self._lockpick_texture:h() / 2)

	self._timer_text = self._hud_panel:text({
		layer = 3,
		h = 64,
		font_size = 24,
		align = "center",
        text = string.format("%.2f", self._tweak_data.timer),
		visible = self._tweak_data.uses_timer ~= nil,
		valign = "center",
		name = self._child_ivalid_name_text,
		font = "fonts/font_large_mf"
	})

	self._timer_text:set_center_x(self._hud_panel:center_x())
	self._timer_text:set_center_y(self._hud_panel:center_y() - 302)

	self._legend_exit_text = self._hud_panel:text({
		vertical = "center",
		name = "_legend_exit_text",
		layer = 2,
		wrap = false,
		font_size = 24,
		align = "center",
		word_wrap = false,
		text = utf8.to_upper(managers.localization:text(self._tweak_data.legend_exit_text_id or "hud_legend_exit", {
			BTN_CANCEL = managers.localization:btn_macro("jump") or utf8.char(57344)
		})),
		x = 0,
		valign = "bottom",
		y = -self._hud_panel:y(),
		font = "fonts/font_large_mf",
	})

	self._legend_exit_text:set_center_x(self._hud_panel:center_x() + 302)
	self._legend_exit_text:set_center_y(self._hud_panel:center_y() - 13)

	self._legend_interact_text = self._hud_panel:text({
		vertical = "center",
		name = "_legend_interact_text",
		layer = 2,
		wrap = false,
		font_size = 24,
		align = "center",
		word_wrap = false,
		text = utf8.to_upper(managers.localization:text(self._tweak_data.legend_interact_text_id or "hud_legend_lockpicking_interact", {
			BTN_INTERACT = managers.localization:btn_macro("interact")
		})),
		x = 0,
		valign = "bottom",
		y = -self._hud_panel:y(),
		font = "fonts/font_large_mf",
		color = Color.white
	})

	self._legend_interact_text:set_center_x(self._hud_panel:center_x() - 302)
	self._legend_interact_text:set_center_y(self._hud_panel:center_y() - 13)

	self:show()
end

function HUDRaidWW2MiniGame:set_timer(t, max_t)
	self._timer_text:set_text(string.format("%.2f", t))
	local val = t / max_t
	play_color(self._timer_text, Color.white * val + Color(1, 0.6, 0.3) * (1 - val))
end

function HUDRaidWW2MiniGame:show()
	self._lockpick_texture:stop()

    for i = 1, self._tweak_data.number_of_circles do
		local circle_radius = self._tweak_data.circle_radius[i]
		local circle = CircleBitmapGuiObject:new(self._hud_panel, {
			blend_mode = "add",
			layer = 2,
			image = RaidMinigame.data.circles[math.min(i, 3)],
			radius = circle_radius,
			sides = self._sides,
			current = self._sides,
			total = self._sides,
			color = Color.white
		})

		circle:set_position(self._hud_panel:w() / 2 - circle_radius, self._hud_panel:h() / 2 - circle_radius)

		local start_rotation = math.random() * 360

		circle._circle:set_rotation(start_rotation)

		local circle_diff = self._tweak_data.circle_difficulty[i]

		circle:set_current(circle_diff)

		self._circles[i] = {completed = false, valid = true, circle = circle }
	end

	self._is_active = true
	self._active_stage = 1
end

function HUDRaidWW2MiniGame:alive()
	return self._hud_panel:alive()
end

function HUDRaidWW2MiniGame:complete_stage(index)
	local circle_data = self._circles[index]

	if circle_data then
		circle_data.completed = true
		circle_data.circle:set_alpha(0.3)
		circle_data.circle._circle:set_rotation((1 - self._tweak_data.circle_difficulty[index]) * 180)
		self._hud_panel:animate(callback(self, self, "_animate_stage_complete"))

		self._active_stage = index + 1
	end
end

function HUDRaidWW2MiniGame:destroy(complete)
	if complete then
        self._lockpick_texture:animate(callback(self, self, "_animate_interaction_complete"))
        self._background_texture:set_visible(false)
        self._legend_exit_text:set_visible(false)
        self._legend_interact_text:set_visible(false)
        self._lockpick_texture:set_visible(false)
	else
		self:full_destroy()
	end

	self._is_active = false
end

function HUDRaidWW2MiniGame:set_bar_valid(circle_id, valid)
	if circle_id < 1 then
		return
	elseif self._tweak_data.number_of_circles < circle_id then
		return
	end

	local circle_data = self._circles[circle_id]
	circle_data.valid = valid
	circle_data.circle:set_image(RaidMinigame.data.circles[math.min(circle_id, 3)]..(valid and "" or "_fail"))
	circle_data.circle:set_alpha(valid and 1 or 0.95)
	circle_data.circle._circle:set_blend_mode("add")
end

function HUDRaidWW2MiniGame:update(t, dt)
	for i, circle_data in pairs(self._circles) do
		if not circle_data.completed and i == self._active_stage then
			local circle = circle_data.circle._circle
			local current_rot = circle:rotation()
			local rotation_speed = self._tweak_data.circle_rotation_speed[i]

			if not circle_data.valid then
				rotation_speed = rotation_speed * 10
			end

			local delta = rotation_speed * dt * self._tweak_data.circle_rotation_direction[i]
			local new_rot = (current_rot + delta) % 360

			circle:set_rotation(new_rot)
		end
	end
end

function HUDRaidWW2MiniGame:full_destroy()
    self._hud_panel:clear()
    self._background_texture:parent():remove(self._background_texture)
end

function HUDRaidWW2MiniGame:set_circle_value(index, value)
	local circle_data = self._circles[index]

	if circle_data then
		circle_data.circle:set_current(value)
	end
end

function HUDRaidWW2MiniGame:is_visible()
	return self._is_active
end

function HUDRaidWW2MiniGame:circles()
	return self._circles
end

function HUDRaidWW2MiniGame:set_tweak_data(data)
	self._tweak_data = data
end

function HUDRaidWW2MiniGame:_animate_interaction_complete()
	local TOTAL_T = 0.5
	local starting_rotations = {}

	for i = 1, #self._circles, 1 do
		starting_rotations[i] = (1 - self._tweak_data.circle_difficulty[i]) * 180
	end

	local t = TOTAL_T

	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local progress = t / TOTAL_T

		for i = 1, #self._circles, 1 do
			local color = Color(math.max(0, self._tweak_data.circle_difficulty[i] - (1 - progress)), progress, progress, progress)

			self._circles[i].circle:set_color(color)
			self._circles[i].circle._circle:set_rotation(starting_rotations[i] + (1 - progress) * 180)
		end
	end

	for i = 1, #self._circles, 1 do
		self._circles[i].circle:set_visible(false)
	end

	self:full_destroy()
end

function HUDRaidWW2MiniGame:_animate_stage_complete()
	local TOTAL_T = 0.7
	local DELTA_Y = 24
	local start_y = self._lockpick_texture:y()
	local end_y = start_y - DELTA_Y
	local t = 0.3

	while TOTAL_T >= t do
		local dt = coroutine.yield()
		t = t + dt
		local cur_delta_y = HUDRaidWW2MiniGame:_ease_in_quint(t, 0, DELTA_Y, TOTAL_T)

		self._lockpick_texture:set_y(start_y - cur_delta_y)
	end

	self._lockpick_texture:set_y(end_y)
end

function HUDRaidWW2MiniGame:_ease_in_quint(time, begin, change, duration)
	local alpha = time / duration

	return begin + change * alpha * alpha * alpha * alpha * alpha
end
