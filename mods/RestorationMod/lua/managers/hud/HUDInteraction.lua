if not restoration:all_enabled("HUD/MainHUD", "HUD/Interaction") then
	return
end

RestorationCoreHooks:Post(HUDInteraction, "init", function(self)
	local interact_text = self._hud_panel:child(self._child_name_text)
	if alive(interact_text) then
		local opt = {font = "fonts/font_medium_shadow_mf", font_size = 32, y = self._hud_panel:h() * 0.6}
		interact_text:configure(opt)
		self._hud_panel:child(self._child_ivalid_name_text):configure(opt)
	end
end)

RestorationCoreHooks:Post(HUDInteraction, "set_bar_valid", function(self, valid, text_id)
	self._interact_circle:set_image(valid and "guis/textures/restoration/hud_progress_active" or "guis/textures/restoration/hud_progress_invalid")
end)

RestorationCoreHooks:Pre(HUDInteraction, "_animate_interaction_complete", function(self, bitmap)
	if alive(bitmap) then
		bitmap:set_image("guis/textures/restoration/hud_progress_active")
	end
end)