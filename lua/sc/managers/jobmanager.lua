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

function JobManager:current_job_and_difficulty_stars()
	local difficulty = Global.game_settings.difficulty or "easy"
	local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(difficulty) or 0) - 2)

	return math.clamp(self:current_job_stars() + difficulty_id, 1, 13)
end

function JobManager:check_add_heat_to_jobs()
	self:_check_add_heat_to_jobs()
end

function JobManager:on_buy_job(job_id, difficulty_id) --Allows XP Boost in Contact Broker (something that vanilla should have)
	return
end