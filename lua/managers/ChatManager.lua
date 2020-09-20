if not restoration.Options:GetValue("HUD/UI/Loadouts") then return end

ChatGui.line_height = 22
function ChatGui:init(ws)
	self._ws = ws
	self._hud_panel = ws:panel()
	self:set_channel_id(ChatManager.GAME)
	self._panel_width = self._hud_panel:w() * 0.5
	self._output_width = self._panel_width - 15
	self._panel_height = 500
	self._max_lines = 5
	self._lines = {}
	self._esc_callback = callback(self, self, "esc_key_callback")
	self._enter_callback = callback(self, self, "enter_key_callback")
	self._typing_callback = 0
	self._skip_first = false
	self._hud_blur = self._hud_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "hud_blur",
		valign = "grow",
		halign = "grow",
		render_template = "VertexColorTexturedBlur3D",
		layer = -2
	})

	self._hud_blur:set_shape(self._hud_panel:shape())
	self._hud_blur:set_alpha(0)
	self._hud_blur:hide()
	self._panel = self._hud_panel:panel({
		name = "chat_panel",
		x = 0,
		h = self._panel_height,
		w = self._panel_width,
		valign = "bottom"
	})
	self:set_leftbottom(0, 70)
	local chat_blur = self._panel:panel({
		name = "chat_blur"
	})
	local blur = chat_blur:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "chat_blur",
		valign = "grow",
		halign = "grow",
		render_template = "VertexColorTexturedBlur3D",
		layer = -2
	})

	blur:set_size(chat_blur:size())
	chat_blur:set_shape(self._panel:shape())
	chat_blur:set_h(math.round(ChatGui.line_height * self._max_lines) + 24)
	chat_blur:set_bottom(self._panel:h())
	chat_blur:hide()

	self._chat_blur_box = BoxGuiObject:new(chat_blur, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	local chat_bg = self._panel:rect({
		name = "chat_bg",
		valign = "grow",
		halign = "grow",
		alpha = 0,
		layer = -1,
		color = Color.black
	})

	chat_bg:set_shape(chat_blur:shape())
	local output_panel = self._panel:panel({
		name = "output_panel",
		x = 0,
		h = 10,
		w = self._output_width,
		layer = 1
	})
	local output_bg = output_panel:rect({
		name = "output_bg",
		valign = "grow",
		halign = "grow",
		alpha = 0,
		layer = -1,
		color = Color.black
	})
	local scroll_panel = output_panel:panel({
		name = "scroll_panel",
		x = 0,
		h = 10,
		w = self._output_width
	})
	self._scroll_indicator_box_class = BoxGuiObject:new(output_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	local scroll_up_indicator_shade = output_panel:bitmap({
		name = "scroll_up_indicator_shade",
		texture = "guis/textures/headershadow",
		rotation = 180,
		layer = 2,
		color = Color.white,
		w = output_panel:w(),
		visible = false
	})
	local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")
	local scroll_up_indicator_arrow = self._panel:bitmap({
		name = "scroll_up_indicator_arrow",
		texture = texture,
		texture_rect = rect,
		layer = 2,
		color = Color.white
	})
	local scroll_down_indicator_shade = output_panel:bitmap({
		name = "scroll_down_indicator_shade",
		texture = "guis/textures/headershadow",
		layer = 2,
		color = Color.white,
		w = output_panel:w(),
		visible = false
	})
	local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")
	local scroll_down_indicator_arrow = self._panel:bitmap({
		name = "scroll_down_indicator_arrow",
		texture = texture,
		texture_rect = rect,
		layer = 2,
		color = Color.white,
		rotation = 180
	})
	local bar_h = scroll_down_indicator_arrow:top() - scroll_up_indicator_arrow:bottom()
	local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar")
	local scroll_bar = self._panel:panel({
		name = "scroll_bar",
		layer = 2,
		h = bar_h,
		w = 15
	})
	local scroll_bar_box_panel = scroll_bar:panel({
		name = "scroll_bar_box_panel",
		w = 4,
		x = 5,
		halign = "scale",
		valign = "scale"
	})
	self._scroll_bar_box_class = BoxGuiObject:new(scroll_bar_box_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	self._enabled = true

	if MenuCallbackHandler:is_win32() then
		self._num_new_messages = 0

		self._chat_button_show_string = managers.localization:to_upper_text("menu_cn_chat_show", {
			BTN_BACK = managers.localization:btn_macro("toggle_chat")
		})

		self._chat_button_hide_string = managers.localization:to_upper_text("menu_cn_chat_hide", {
			BTN_BACK = managers.localization:btn_macro("toggle_chat")
		})

		local chat_button_panel = self._hud_panel:panel({
			name = "chat_button_panel"
		})

		local chat_button = chat_button_panel:text({
			text = "",
			name = "chat_button",
			blend_mode = "add",
			layer = 40,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.button_stage_3
		})

		self:update_chat_button()
		chat_button:set_right(chat_button_panel:w() / 2)
		chat_button:set_bottom(chat_button_panel:h() - 11)

		local blur_object = chat_button_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			name = "chat_button_blur",
			render_template = "VertexColorTexturedBlur3D",
			layer = chat_button:layer() - 2
		})

		blur_object:set_shape(chat_button:shape())
		chat_button_panel:hide()

		local new_msg_flash = chat_button_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			name = "new_msg_flash",
			alpha = 0,
			blend_mode = "add",
			rotation = 360,
			w = (chat_button:w() + 20) * 2,
			h = (chat_button:h() + 10) * 2,
			layer = chat_button:layer() - 1,
			color = tweak_data.screen_colors.button_stage_3
		})

		new_msg_flash:set_center(chat_button:center())
	end
	output_panel:set_x(scroll_down_indicator_arrow:w() + 4)
	self:_create_input_panel()
	self:_layout_input_panel()
	self:_layout_output_panel(true)
	self:set_layer(20)
end

ChatGui.PRESETS = {}
ChatGui.PRESETS.default = {
	bottom = 120,
	left = 0,
	layer = 20
}
ChatGui.PRESETS.lobby = {
	left = 0,
	bottom = 50,
	layer = 20
}
ChatGui.PRESETS.crimenet = {
	left = 0,
	bottom = 0,
	layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
	chat_blur = true,
	chat_bg_alpha = 0.25,
	is_crimenet_chat = true
}
ChatGui.PRESETS.preplanning = {
	left = 10,
	bottom = 0,
	layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
	chat_blur = true,
	chat_bg_alpha = 0.25,
	is_crimenet_chat = true,
	chat_button_align = "left"
}
ChatGui.PRESETS.inventory = {
	chat_button_y_offset = 25,
	left = 0,
	is_crimenet_chat = true,
	chat_bg_alpha = 0.75,
	chat_button_align = "left",
	chat_blur = true,
	bottom = 0,
	layer = tweak_data.gui.CRIMENET_CHAT_LAYER
}
ChatGui.PRESETS.weapon_color_customize = deep_clone(ChatGui.PRESETS.inventory)
ChatGui.PRESETS.weapon_color_customize.chat_button_y_offset = 0

function ChatGui:set_params(params)
	if type(params) == "string" then
		params = self.PRESETS[params] or {}
	end

	if params.max_lines then
		self:set_max_lines(params.max_lines)
	end

	if params.left and params.bottom then
		self:set_leftbottom(params.left, params.bottom)
	end

	if params.right and params.top then
		self:set_righttop(params.left, params.top)
	end

	if params.layer then
		self._layer = params.layer
		self:set_layer(params.layer)
	end

	if params.max_lines then
		self._max_lines = params.max_lines
	end

	local chat_bg = self._panel:child("chat_bg")
	local chat_blur = self._panel:child("chat_blur")
	local hud_blur = self._hud_blur
	
	chat_bg:set_alpha(params.chat_bg_alpha or 0)
	chat_blur:set_visible(params.chat_blur)
	hud_blur:set_visible(params.hud_blur)
	
	self._chat_button_align = nil

	if params.chat_button_align then
		self._chat_button_align = params.chat_button_align
	end
	self._chat_button_y_offset = nil

	if params.chat_button_y_offset then
		self._chat_button_y_offset = params.chat_button_y_offset
	end

	self._chat_button_x_offset = nil

	if params.chat_button_x_offset then
		self._chat_button_x_offset = params.chat_button_x_offset
	end

	if params.is_crimenet_chat then
		self:enable_crimenet_chat()
	else
		self:disable_crimenet_chat()
	end
end

function ChatGui:enable_crimenet_chat()
	if MenuCallbackHandler:is_win32() then
		self._is_crimenet_chat = true
		self:_hide_crimenet_chat()
		local chat_button_panel = self._hud_panel:child("chat_button_panel")
		chat_button_panel:show()
	end
end

function ChatGui:disable_crimenet_chat()
	if MenuCallbackHandler:is_win32() then
		self._is_crimenet_chat = false
		local chat_button_panel = self._hud_panel:child("chat_button_panel")
		chat_button_panel:hide()
		self._panel:child("output_panel"):stop()
		self._panel:child("output_panel"):animate(callback(self, self, "_animate_fade_output"))
	end
end

function ChatGui:toggle_crimenet_chat()
	if MenuCallbackHandler:is_win32() then
		self._crimenet_chat_state = not self._crimenet_chat_state
		if self._crimenet_chat_state then
			self:_show_crimenet_chat()
		else
			self:_hide_crimenet_chat()
		end
		managers.menu_component:post_event("menu_enter")
	end
end

function ChatGui:set_crimenet_chat(state)
	if MenuCallbackHandler:is_win32() and self._crimenet_chat_state ~= state then
		self._crimenet_chat_state = state
		if self._crimenet_chat_state then
			self:_show_crimenet_chat()
		else
			self:_hide_crimenet_chat()
		end
	end
end