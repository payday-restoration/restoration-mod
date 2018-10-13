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
	self._panel:set_bottom(self._panel:parent():h() - 112)
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
			Color.black:with_alpha(0),
			0.2,
			Color.black:with_alpha(0.25),
			1,
			Color.black:with_alpha(0)
		},
		layer = -1,
		valign = "grow",
		blend_mode = "normal"
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
		gradient_points = { 0, Color.black:with_alpha( 0.25 ), 1, Color.black:with_alpha( 0.25 ) },
		layer = -1,
		valign = "grow",
		blend_mode = "normal",
		h = self._input_panel:h()
	})
end

function HUDChat:update_caret()
	local text = self._input_panel:child("input_text")
	local caret = self._input_panel:child("caret")
	local s, e = text:selection()
	local x, y, w, h = text:selection_rect()
	if s == 0 and e == 0 then
		if text:align() == "center" then
			x = text:world_x() + text:w() / 2
		else
			x = text:world_x()
		end
		y = text:world_y()
	end
	h = text:h()
	if w < 3 then
		w = 3
	end
	if not self._focus then
		w = 0
		h = 0
	end
	caret:set_world_shape(x, y + 2, w, h - 4)
	self:set_blinking(s == e and self._focus)
	local mid = x / self._input_panel:child("input_bg"):w()
	--[[self._input_panel:child("input_bg"):set_gradient_points({
		0,
		Color.white:with_alpha(0),
		mid,
		Color.white:with_alpha(0.25),
		1,
		Color.white:with_alpha(0)
	})]]
end