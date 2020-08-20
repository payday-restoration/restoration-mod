function JobManager:is_current_job_professional()
	if not self._global.current_job then
		return
	end
	
	if managers.crime_spree:is_active() then
		return
	end

	--Just to suffer--
	return Global.game_settings.one_down
end

function JobManager:check_ponr_active()
	if not restoration.Options:GetValue("OTHER/MusicShuffle") and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down and restoration.Options:GetValue("OTHER/PONRTrack") then
		return true
	end

	return false
end