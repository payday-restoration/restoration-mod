if not restoration:all_enabled("HUD/MainHUD", "HUD/HeistTimer") then
	return
end

RestorationCoreHooks:Post(HUDHeistTimer, "init", function(self)
	self._timer_text:configure({
		font_size = tweak_data.hud_players.timer_size,
		font = tweak_data.hud_players.timer_font,
	})
	RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
	self:RestorationValueChanged()
end)

function HUDHeistTimer:RestorationValueChanged()
	self._timer_text:set_color(restoration.Options:GetValue("HUD/Colors/TimerText"))
end