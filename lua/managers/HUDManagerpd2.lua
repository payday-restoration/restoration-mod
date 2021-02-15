if restoration.Options:GetValue("HUD/Extra/RealAmmo") then
	local set_teammate_ammo_amount_original = HUDManager.set_teammate_ammo_amount
	function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max)
	    return set_teammate_ammo_amount_original(self, id, selection_index, max_clip, current_clip, math.max(current_left - current_clip, 0), math.max(current_left - current_clip, 0))
	end
end

if restoration.Options:GetValue("HUD/Extra/VoiceChat") then
	function HUDManager:set_mugshot_voice(id, active)
		local panel_id
		for _, data in pairs(managers.criminals:characters()) do
			if data.data.mugshot_id == id then
				panel_id = data.data.panel_id
				break
			end
		end
		if panel_id and panel_id ~= HUDManager.PLAYER_PANEL then
			self._teammate_panels[panel_id]:set_voice_com(active)
		end
	end
end 