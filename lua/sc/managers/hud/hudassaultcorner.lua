Hooks:PostHook(HUDAssaultCorner, "init", "SCHUDAssaultInit", function(self)
	local buff_icon = "guis/textures/pd2/hud_buff_generic"
	local job = Global.level_data and Global.level_data.level_id

	self._captain = restoration.captain_spawns[job]
	if self._captain and self._captain.icon then
		buff_icon = self._captain.icon
	end

	if managers.skirmish:is_skirmish() then		
		buff_icon = "guis/textures/pd2/hud_buff_generic"
	end

	if alive(self._vip_bg_box) and alive(self._vip_bg_box:child("vip_icon")) then
		self._vip_bg_box:child("vip_icon"):set_image(buff_icon)
	end
end)