function HUDChat:init(ws, hud)
	self._ws = ws
	self._hud_panel = hud.panel
	self:set_channel_id(ChatManager.GAME)
	self._output_width = 300
	self._panel_width = 500
	self._lines = {}
	self._esc_callback = callback(self, self, "esc_key_callback")
	self._enter_callback = callback(self, self, "enter_key_callback")
	self._typing_callback = 0
	self._skip_first = false
	self._panel = self._hud_panel:panel({
		name = "chat_panel",
		x = 0,
		h = 500,
		w = self._panel_width,
		halign = "left",
		valign = "bottom"
	})
	self._panel:set_bottom(self._panel:parent():h() - 150)
	local output_panel = self._panel:panel({
		name = "output_panel",
		x = 0,
		h = 10,
		w = self._output_width,
		layer = 1
	})
	output_panel:gradient({
		name = "output_bg",
		gradient_points = {
			0,
			Color.black:with_alpha(0.25),
			1,
			Color.black:with_alpha(0.25)
		},
		layer = -1,
		valign = "grow"
	})
	self:_create_input_panel()
	self:_layout_input_panel()
	self:_layout_output_panel()
end

function HUDChat:_create_input_panel()
	self._input_panel = self._panel:panel({
		alpha = 0,
		name = "input_panel",
		x = 0,
		h = 24,
		w = self._panel_width,
		layer = 1
	})
	self._input_panel:rect({
		name = "focus_indicator",
		visible = false,
		color = Color.white:with_alpha(0.2),
		layer = 0
	})
	local say = self._input_panel:text({
		name = "say",
		text = utf8.to_upper(managers.localization:text("debug_chat_say")),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = 0,
		y = 0,
		align = "left",
		halign = "left",
		vertical = "center",
		hvertical = "center",
		blend_mode = "normal",
		color = Color.white,
		layer = 1
	})
	local _, _, w, h = say:text_rect()
	say:set_size(w, self._input_panel:h())
	local input_text = self._input_panel:text({
		name = "input_text",
		text = "",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = 0,
		y = 0,
		align = "left",
		halign = "left",
		vertical = "center",
		hvertical = "center",
		blend_mode = "normal",
		color = Color.white,
		layer = 1,
		wrap = true,
		word_wrap = false
	})
	local caret = self._input_panel:rect({
		name = "caret",
		layer = 2,
		x = 0,
		y = 0,
		w = 0,
		h = 0,
		color = Color(0.05, 1, 1, 1)
	})
	self._input_panel:gradient({
		name = "input_bg",
		gradient_points = {
			0,
			Color.black:with_alpha(0.25),
			1,
			Color.black:with_alpha(0.25)
		},
		layer = -1,
		valign = "grow",
		h = self._input_panel:h()
	})
end