Hooks:PostHook(HUDAssaultCorner, "init", "SCHUDAssaultInit", function(self)
	local buff_icon = "guis/textures/pd2/hud_buff_shield"
	local job = Global.level_data and Global.level_data.level_id        
	for _,j in ipairs(restoration.captain_teamwork) do
		if job == j then
			buff_icon = "guis/textures/pd2/hud_buff_fire"
			break
		end
	end
	for _,j2 in ipairs(restoration.captain_murderdozer) do
		 if job == j2 then
			buff_icon = "guis/textures/pd2/hud_buff_skull"
			break
		end
	end
	for _,j3 in ipairs(restoration.captain_stelf) do
		 if job == j3 then
			buff_icon = "guis/textures/pd2/hud_buff_spooc"
			break
		end
	end		
	for _,j4 in ipairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == j4 then
			buff_icon = "guis/textures/pd2/hud_buff_halloween"
			break
		end
	end	
	
	--Skirmish exclusive stuff
	if managers.skirmish:is_skirmish() then
		if tweak_data and tweak_data.skirmish and tweak_data.skirmish.captain == "summers" then
			buff_icon = "guis/textures/pd2/hud_buff_fire"
		elseif tweak_data and tweak_data.skirmish and tweak_data.skirmish.captain == "spring" then
			buff_icon = "guis/textures/pd2/hud_buff_skull"
		elseif tweak_data and tweak_data.skirmish and tweak_data.skirmish.captain == "autumn" then
			buff_icon = "guis/textures/pd2/hud_buff_spooc"
		elseif tweak_data and tweak_data.skirmish and tweak_data.skirmish.captain == "winters" then
			buff_icon = "guis/textures/pd2/hud_buff_shield"	
		elseif tweak_data and tweak_data.skirmish and tweak_data.skirmish.captain == "headless_hatman" then
			buff_icon = "guis/textures/pd2/hud_buff_halloween"			
		end
	end	
	
	if alive(self._vip_bg_box) and alive(self._vip_bg_box:child("vip_icon")) then
		self._vip_bg_box:child("vip_icon"):set_image(buff_icon)
	end
end)