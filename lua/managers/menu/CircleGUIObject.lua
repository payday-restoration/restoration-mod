if not restoration:all_enabled("HUD/MainHUD", "HUD/Interaction") then
	return
end

function CircleBitmapGuiObject:init(panel, config)
	self._panel = panel
	self._radius = config.radius or 20
	self._sides = config.sides or 64
	self._total = config.total or 1
	self._size = 128
	config.texture_rect = nil
	config.texture = config.image or "guis/textures/restoration/hud_progress_active"
	config.w = self._radius * 2
	config.h = self._radius * 2
	self._circle = self._panel:bitmap(config)
	self._circle:set_render_template(Idstring("VertexColorTexturedRadial"))
	self._alpha = self._circle:color().alpha
	self._circle:set_color(self._circle:color():with_red(0))
	if config.use_bg then
		local bg_config = deep_clone(config)
		bg_config.texture = "guis/textures/restoration/hud_progress_bg"
		bg_config.layer = bg_config.layer - 1
		bg_config.blend_mode = "normal"
		self._bg_circle = self._panel:bitmap(bg_config)
	end
end