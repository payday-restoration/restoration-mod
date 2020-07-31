HUDManager._USE_BURST_MODE = true	

HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end

local ponr_random1 = math.random(50)

local show_point_of_no_return_timer_orig = HUDManager.show_point_of_no_return_timer
function HUDManager:show_point_of_no_return_timer()
	show_point_of_no_return_timer_orig(self)
	if not restoration.Options:GetValue("OTHER/MusicShuffle") then
		if restoration.Options:GetValue("OTHER/PONRTracks") == 2 and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then
			managers.music:track_listen_start("music_heist_assault", "resmusic_ponr")
		elseif restoration.Options:GetValue("OTHER/PONRTracks") == 3 and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then
			managers.music:track_listen_start("music_heist_assault", "track_16")
		elseif restoration.Options:GetValue("OTHER/PONRTracks") == 4 and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then
			if ponr_random1 == 1 then
                managers.music:track_listen_start("music_heist_assault", "resmusic_ponr")
            elseif ponr_random1 == 2 then
                managers.music:track_listen_start("music_heist_assault", "track_16")
			end
		end
	-- else
	-- 	managers.music:stop_custom()
	end
end