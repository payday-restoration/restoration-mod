local jukebox_heist_specific_orig = MusicManager.jukebox_heist_specific
local jukebox_ghost_specific_orig = MusicManager.jukebox_ghost_specific
local ponr_random1 = math.random(50)
local ponr_random2 = math.random(50)
-- CREDIT: TEST1

function MusicManager:jukebox_ghost_specific()
    jukebox_ghost_specific_orig(self)
		
	if not Global.music_manager.track_attachment.xmn_tag then
        Global.music_manager.track_attachment.xmn_tag = "music_xmn"
    end
	
	if managers.job:current_level_id() == "xmn_tag" then
        return self:track_attachment("xmn_tag") or "heist"
    end
	
	local job_data = Global.job_manager.current_job

	if managers.job:interupt_stage() then
		return "heist"
	end

	if job_data then
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)

		if job_tweak then
			local track_data = job_tweak.name_id .. (job_data.stages > 1 and job_data.current_stage or "")

			return self:track_attachment(track_data) or "heist"
		end
	end

	if managers.crime_spree:is_active() then
		local narrative_data, day, variant = managers.crime_spree:get_narrative_tweak_data_for_mission_level(managers.crime_spree:current_mission())

		if narrative_data then
			local track_data = narrative_data.name_id .. ((narrative_data.stages or 1) > 1 and tostring(day) or "")

			return self:track_attachment(track_data) or "heist"
		end
	end

	return "heist"
end

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
	
	if not Global.music_manager.track_attachment.xmn_hox_1 then
        Global.music_manager.track_attachment.xmn_hox_1 = "track_66"
    end
	if not Global.music_manager.track_attachment.xmn_hox_2 then
        Global.music_manager.track_attachment.xmn_hox_2 = "track_67"
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
	
	if managers.job:current_level_id() == "xmn_hox_1" then
        return self:track_attachment("xmn_hox_1") or "all"
    end
	
	if managers.job:current_level_id() == "xmn_hox_2" then
        return self:track_attachment("xmn_hox_2") or "all"
    end
	
    if managers.job:check_ponr_active() then
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