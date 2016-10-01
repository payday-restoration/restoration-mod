if Restoration.options.restoration_hud_global == true then
function HUDHeistTimer:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("heist_timer_panel") then
		self._hud_panel:remove(self._hud_panel:child("heist_timer_panel"))
	end
	self._heist_timer_panel = self._hud_panel:panel({
		visible = true,
		name = "heist_timer_panel",
		h = 40,
		y = 0,
		valign = "top",
		layer = 0
	})
	self._timer_text = self._heist_timer_panel:text({
		name = "timer_text",
		text = "00:00",
		font_size = tweak_data.hud_players.timer_size,
		font = tweak_data.hud_players.timer_font,
		color = Color.white,
		align = "center",
		vertical = "top",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._last_time = 0
end
end