HUDEffectScreen = HUDEffectScreen or class()
function HUDEffectScreen:init(hud)
	self._hud_panel = hud.panel
	
	self._effect_panel = self._hud_panel:bitmap({
		name = "effect_panel",
		visible = true,
		texture = "guis/textures/restoration/bloodyscreen",
		layer = 0,
		color = Color(1, 1, 1),
		alpha = 0,
		blend_mode = "add",
		w = self._hud_panel:w(),
		h = self._hud_panel:h(),
		x = 0,
		y = 0 
	})
	
	self._effect_panel_alt = self._hud_panel:bitmap({
		name = "effect_panel_alt",
		visible = true,
		texture = "guis/textures/restoration/topbottomrim",
		layer = 0,
		color = Color(1, 1, 1),
		alpha = 0,
		blend_mode = "add",
		w = self._hud_panel:w(),
		h = self._hud_panel:h(),
		x = 0,
		y = 0 
	})

	self._active = 0.0
	self._active_alt = 0.0
	self._duration = 0.0
	self._duration_alt = 0.0
end

function HUDEffectScreen:do_effect_screen(duration, color, use_alt)
	if not _G.is_vr then
		self._effect_panel:set_alpha(1)
		self._duration = duration
		self._effect_panel:set_color(Color(color[1], color[2], color[3]))
		if self._active == true then
			self._effect_panel:stop()
		end
		self._active = true
		self._effect_panel:animate(callback(self, self, "_fadeout_effect_screen"))
	end
end

function HUDEffectScreen:_fadeout_effect_screen()
	local start_time = Application:time()
	local curr_time = start_time
	while curr_time - start_time < self._duration do
		curr_time = Application:time()
		self._effect_panel:set_alpha(1 - ((curr_time - start_time) / self._duration))
		coroutine.yield()
	end
	self._effect_panel:set_alpha(0)
	self._active = false
end

function HUDEffectScreen:do_effect_screen_alt(duration, color, use_alt)
	if not _G.is_vr then
		self._effect_panel_alt:set_alpha(1)
		self._duration_alt = duration
		self._effect_panel_alt:set_color(Color(color[1], color[2], color[3]))
		if self._active_alt == true then
			self._effect_panel_alt:stop()
		end
		self._active_alt = true
		self._effect_panel_alt:animate(callback(self, self, "_fadeout_effect_screen_alt"))
	end
end

function HUDEffectScreen:_fadeout_effect_screen_alt()
	local start_time = Application:time()
	local curr_time = start_time
	while curr_time - start_time < self._duration_alt do
		curr_time = Application:time()
		self._effect_panel_alt:set_alpha(1 - ((curr_time - start_time) / self._duration_alt))
		coroutine.yield()
	end
	self._effect_panel_alt:set_alpha(0)
	self._active_alt = false
end
