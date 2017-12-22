if not restoration:all_enabled("HUD/MainHUD", "HUD/Down") then
	return
end

RestorationCoreHooks:Post(HUDPlayerDowned, "init", function(self)
	local downed_panel = self._hud_panel:child("downed_panel")
	if alive(downed_panel) then
		downed_panel:child("timer_msg"):configure({font_size = 0, w = 0, h = 0})
	end
	--based of the downed GUI file.
	self._hud.timer:configure({font = "fonts/font_medium_shadow_mf", font_size = 32, y = self._hud_panel:center_y() / 1.5})
end)