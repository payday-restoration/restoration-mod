if restoration.Options:GetValue("HUD/Extra/RealAmmo") then
	local set_teammate_ammo_amount_original = HUDManager.set_teammate_ammo_amount
	function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max)
	    return set_teammate_ammo_amount_original(self, id, selection_index, max_clip, current_clip, math.max(current_left - current_clip, 0), math.max(current_left - current_clip, 0))
	end
end