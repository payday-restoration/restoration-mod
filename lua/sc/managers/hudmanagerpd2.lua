HUDManager._USE_BURST_MODE = true	

HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end

local show_point_of_no_return_timer_orig = HUDManager.show_point_of_no_return_timer
function HUDManager:show_point_of_no_return_timer()
	show_point_of_no_return_timer_orig(self)
	managers.music:post_event(tweak_data.levels:get_music_event("control" or "assault"))
end