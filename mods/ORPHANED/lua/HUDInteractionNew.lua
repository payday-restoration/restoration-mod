if Restoration.options.restoration_hud_global == true then
function HUDInteraction:init(hud, child_name)
	self._hud_panel = hud.panel
	self._circle_radius = 64
	self._sides = 64
	self._child_name_text = (child_name or "interact") .. "_text"
	self._child_ivalid_name_text = (child_name or "interact") .. "_invalid_text"
	if self._hud_panel:child(self._child_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_name_text))
	end
	if self._hud_panel:child(self._child_ivalid_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_ivalid_name_text))
	end
	local interact_text = self._hud_panel:text({
		name = self._child_name_text,
		visible = false,
		text = "HELLO",
		valign = "center",
		align = "center",
		layer = 1,
		color = Color.white,
		font = "fonts/font_medium_shadow_mf",
		font_size = 32,
		h = 64
	})
	local invalid_text = self._hud_panel:text({
		name = self._child_ivalid_name_text,
		visible = false,
		text = "HELLO",
		valign = "center",
		align = "center",
		layer = 3,
		color = Color(1, 0.3, 0.3),
		blend_mode = "normal",
		font = "fonts/font_medium_shadow_mf",
		font_size = 32,
		h = 64
	})
	--interact_text:set_y(self._hud_panel:h() / 2 + 64 + 16)
	interact_text:set_y( self._hud_panel:h() * 0.6 )
	--invalid_text:set_center_y( self._hud_panel:h()/2 )
	invalid_text:set_center_y(interact_text:center_y())
end
-------------- Just a testing of fonts, nothing to see here - D.A. -------------
--[[function HUDInteraction:show_interact(data)
	self:remove_interact()
	local text = "ABCDEabcde - АБВГДабвгд"
	self._hud_panel:child(self._child_name_text):set_visible(true)
	self._hud_panel:child(self._child_name_text):set_text(text)
end]]
--------------------------------------------------------------------------------
function HUDInteraction:_animate_interaction_complete(bitmap, circle)
	local TOTAL_T = 0.6
	local t = TOTAL_T
	local mul = 1
	local c_x, c_y = bitmap:center()
	local size = bitmap:w()
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		mul = mul + dt * 0.75
		bitmap:set_size(size * mul, size * mul)
		bitmap:set_center(c_x, c_y)
		bitmap:set_alpha(math.max(t / TOTAL_T, 0))
		circle._circle:set_size(size * mul, size * mul)
		circle._circle:set_center(c_x, c_y)
		circle:set_current( 64 * (1 - t/TOTAL_T) )
		circle:set_alpha(math.max(t / TOTAL_T, 0))
	end
	bitmap:parent():remove(bitmap)
	circle:remove()
end
end