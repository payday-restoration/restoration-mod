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