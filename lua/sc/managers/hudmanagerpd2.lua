HUDManager._USE_BURST_MODE = true	

HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end

local ponr_random1 = math.random(50)

local show_point_of_no_return_timer_orig = HUDManager.show_point_of_no_return_timer
function HUDManager:show_point_of_no_return_timer()
	show_point_of_no_return_timer_orig(self)
	if not restoration.Options:GetValue("OTHER/MusicShuffle") then
		if managers.groupai:state()._ponr_is_on and Global.game_settings.one_down and restoration.Options:GetValue("OTHER/PONRTrack") then
			local ponr_track = managers.music:jukebox_menu_track("ponr")
			managers.music:post_event(managers.music:track_listen_start("music_heist_assault", ponr_track))
		end
	end
end