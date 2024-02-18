Hooks:PostHook(HUDAssaultCorner, "init", "SCHUDAssaultInit", function(self)
	local buff_icon = "guis/textures/pd2/hud_buff_generic"
	local job = Global.level_data and Global.level_data.level_id

	self._captain = restoration.captain_spawns[job]
	if self._captain and self._captain.icon then
		buff_icon = self._captain.icon
	end
	
	buff_icon = managers.mutators:modify_value("HUDAssaultCorner:NewCaptainIcon", buff_icon)
	
	--Always gonna be HVH now
	if restoration.force_halloween then
		buff_icon = "guis/textures/pd2/hud_buff_halloween"
	end

	if managers.skirmish:is_skirmish() then		
		buff_icon = "guis/textures/pd2/hud_buff_generic"
	end
	
	if restoration.Options:GetValue("OTHER/DisableMutatorColors") then
		self._assault_mode = "normal"
		self._assault_color = Color(1, 1, 1, 0)
		self._vip_assault_color = Color(1, 1, 0.5019607843137255, 0)		
		
		if managers.skirmish:is_skirmish() then
			self._assault_color = tweak_data.screen_colors.skirmish_color
		end		
	end

	if alive(self._vip_bg_box) and alive(self._vip_bg_box:child("vip_icon")) then
		self._vip_bg_box:child("vip_icon"):set_image(buff_icon)
	end
end)