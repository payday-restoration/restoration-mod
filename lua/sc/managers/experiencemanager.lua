function ExperienceManager:get_current_job_day_multiplier()
	if not managers.job:has_active_job() then
		return 1
	end
	local current_job_day = managers.job:current_stage()
	local is_current_job_professional = Global.game_settings.one_down
	if not is_current_job_professional or not tweak_data:get_value("experience_manager", "pro_day_multiplier", current_job_day) then
	end
	return (tweak_data:get_value("experience_manager", "day_multiplier", current_job_day))
end

function ExperienceManager:get_xp_dissected(success, num_winners, personal_win)
	local has_active_job = managers.job:has_active_job()
	local job_and_difficulty_stars = has_active_job and managers.job:current_job_and_difficulty_stars() or 1
	local job_id = has_active_job and managers.job:current_job_id()
	local job_stars = has_active_job and managers.job:current_job_stars() or 1
	local difficulty_stars = has_active_job and managers.job:current_difficulty_stars() or 0
	local current_stage = has_active_job and managers.job:current_stage() or 1
	local is_professional = has_active_job and Global.game_settings.one_down or false
	local current_level_id = has_active_job and managers.job:current_level_id() or false
	local personal_win = personal_win or false
	local on_last_stage = has_active_job and managers.job:on_last_stage()
	return self:get_xp_by_params({
		job_id = job_id,
		job_stars = job_stars,
		difficulty_stars = difficulty_stars,
		current_stage = current_stage,
		professional = is_professional,
		success = success,
		num_winners = num_winners,
		on_last_stage = on_last_stage,
		level_id = current_level_id,
		personal_win = personal_win
	})
end	