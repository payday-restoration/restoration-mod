local jukebox_heist_specific_orig = MusicManager.jukebox_heist_specific
function MusicManager:jukebox_heist_specific()
    jukebox_heist_specific_orig(self)
    if not Global.music_manager.track_attachment.int_dock then
        Global.music_manager.track_attachment.int_dock = "resmusic_wetwork"
    end
    if not Global.music_manager.track_attachment.junker then
        Global.music_manager.track_attachment.junker = "resmusic_madvlad"
    end
    if not Global.music_manager.track_attachment.int_dock_burn then
        Global.music_manager.track_attachment.int_dock_burn = "resmusic_burnout"
    end
    if not Global.music_manager.track_attachment.ponr then
        Global.music_manager.track_attachment.ponr = "resmusic_ponr"
    end
    
    local job_data = Global.job_manager.current_job
    if managers.job:current_level_id() == "wetwork" then
        return self:track_attachment("int_dock") or "all"
    end
    if managers.job:current_level_id() == "junk" then
        return self:track_attachment("junker") or "all"
    end
    if managers.job:current_level_id() == "wetwork_burn" then
        return self:track_attachment("int_dock_burn") or "all"
    end
    if managers.job:interupt_stage() then
		return self:track_attachment("escape") or "all"
    end
    if managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then
        return self:track_attachment("ponr") or "all"
    end

	local job_data = Global.job_manager.current_job

	if job_data then
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)

		if job_tweak then
			local track_data = job_tweak.name_id .. (job_data.stages > 1 and job_data.current_stage or "")

			return self:track_attachment(track_data) or "all"
		end
	end

	if managers.crime_spree:is_active() then
		local narrative_data, day, variant = managers.crime_spree:get_narrative_tweak_data_for_mission_level(managers.crime_spree:current_mission())

		if narrative_data then
			local track_data = narrative_data.name_id .. ((narrative_data.stages or 1) > 1 and tostring(day) or "")

			return self:track_attachment(track_data) or "all"
		end
	end

	return "all"
end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    local jukebox_music_tracks_orig = MusicManager.jukebox_music_tracks
    function MusicManager:jukebox_music_tracks()
        -- jukebox_music_tracks_orig(self)
        local tracks = {}
        local tracks_locked = {}
        local lock_data = {
            armored = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport"),
            infamy = managers.experience and managers.experience:current_rank() > 0,
            deathwish = managers.experience and (managers.experience:current_rank() > 0 or tweak_data.difficulty_level_locks[tweak_data:difficulty_to_index("overkill_290")] <= managers.experience:current_level()),
            bigbank = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("big_bank"),
            assault = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("gage_pack_assault"),
            miami = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("hl_miami"),
            diamond = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("hope_diamond"),
            thebomb = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("the_bomb"),
            kenaz = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("kenaz"),
            payday = managers.dlc and managers.dlc:is_dlc_unlocked("pdth_soundtrack"),
            berry = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("berry"),
            peta = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("peta"),
            pal = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("pal"),
            born = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("born"),
            friend = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("friend"),
            spa = managers.dlc and managers.dlc:has_dlc_or_soundtrack_or_cce("spa"),
            ponr = managers.groupai:state()._ponr_is_on and Global.game_settings.one_down
        }

        for _, data in ipairs(tweak_data.music.track_list) do
            table.insert(tracks, data.track)

            if data.lock and not self:track_unlocked(data.track) then
                if lock_data[data.lock] then
                    self:unlock_track(data.track)
                    self:playlist_add(data.track)
                else
                    tracks_locked[data.track] = data.lock
                end
            end
        end

        return tracks, tracks_locked
    end

    local current_track_string_orig = MusicManager.current_track_string
    function MusicManager:current_track_string()
        
    if managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then
        return utf8.to_upper(managers.localization:text("menu_jukebox_screen_resmusic_ponr"))
    end
    return current_track_string_orig(self)
    end
end