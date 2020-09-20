local jukebox_default_tracks_ori = MusicManager.jukebox_default_tracks
function MusicManager:jukebox_default_tracks()
    local default_options = jukebox_default_tracks_ori(self)

    default_options.ponr = "resmusic_ponr"
    default_options.heist_xmn_tag_name = "music_xmn"
    default_options.heist_int_dock_name = "resmusic_wetwork"
    default_options.heist_junker_name = "resmusic_madvlad"
    default_options.heist_int_dock_burn_name = "resmusic_burnout"
    -- default_options.heist_xmn_hox_1_name = "track_66"
    -- default_options.heist_xmn_hox_2_name = "track_67"
    return default_options
end

Hooks:PostHook(MusicManager, "jukebox_heist_specific", "ResMod_MusicManagerJukeBoxHeistSpecific", function(self)
	if not Global.music_manager.track_attachment.heist_xmn_hox_1_name then
        Global.music_manager.track_attachment.heist_xmn_hox_1_name = "track_66"
    end
	if not Global.music_manager.track_attachment.heist_xmn_hox_2_name then
        Global.music_manager.track_attachment.heist_xmn_hox_2_name = "track_67"
    end
    
	if managers.job:current_level_id() == "xmn_hox_1" then
        return self:track_attachment("heist_xmn_hox_1_name") or "all"
    end
	
	if managers.job:current_level_id() == "xmn_hox_2" then
        return self:track_attachment("heist_xmn_hox_2_name") or "all"
    end
end)

function MusicManager:jukebox_heist_track(name)
	local track = self:track_attachment(name)

	if track == "all" then
		local track_list = self:jukebox_random_all()

		return track_list[math.random(#track_list)]
	elseif track == "playlist" then
        local track_list = managers.music:playlist()

		return track_list[math.random(#track_list)]
	else
		return track
	end
end

local current_track_string_orig = MusicManager.current_track_string
function MusicManager:current_track_string()
	
	-- if managers.groupai:state()._ponr_is_on and Global.game_settings.one_down and restoration.Options:GetValue("OTHER/PONRTracks") == 2 or restoration.Options:GetValue("OTHER/PONRTracks") == 4 and ponr_random1 == 1 then
	-- 	return utf8.to_upper(managers.localization:text("menu_jukebox_screen_resmusic_ponr"))
	-- end

	return current_track_string_orig(self)
end