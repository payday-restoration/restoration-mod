if not restoration.Options:GetValue("HUD/MainHUD") then
	return
end

RestorationCoreHooks:Post(HUDChat, "init", function(self)
	local p = self._panel:child("output_panel")
	if alive(p) and alive(p:child("output_bg")) then
		local opt = {blend_mode = "normal", gradient_points = {0, Color.black:with_alpha(0.25), 1, Color.black:with_alpha(0.25)}}
		p:child("output_bg"):configure(opt)
		self._input_panel:child("input_bg"):configure(opt)
	end
end)