-- function CrimeNetManager:_get_jobs_by_jc()
-- 	local t = {}
-- 	local plvl = managers.experience:current_level()
-- 	local prank = managers.experience:current_rank()

-- 	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
-- 		local is_cooldown_ok = managers.job:check_ok_with_cooldown(job_id)
-- 		local is_not_wrapped = not tweak_data.narrative.jobs[job_id].wrapped_to_job
-- 		local dlc = tweak_data.narrative:job_data(job_id).dlc
-- 		local is_not_dlc_or_got = not dlc or managers.dlc:is_dlc_unlocked(dlc)
-- 		local pass_all_tests = is_cooldown_ok and is_not_wrapped and is_not_dlc_or_got
-- 		pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

-- 		if pass_all_tests then
-- 			local job_data = tweak_data.narrative:job_data(job_id)
-- 			local start_difficulty = job_data.professional and 1 or 0
-- 			local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

-- 			for i = start_difficulty, num_difficulties do
-- 				local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
-- 				local difficulty_id = 2 + i
-- 				local difficulty = tweak_data:index_to_difficulty(difficulty_id)
-- 				local one_down_active = Global.game_settings.one_down or 1
-- 				local level_lock = tweak_data.difficulty_level_locks[difficulty_id] or 0
-- 				local is_not_level_locked = prank >= 1 or level_lock <= plvl

-- 				if is_not_level_locked then
-- 					t[job_jc] = t[job_jc] or {}

-- 					table.insert(t[job_jc], {
-- 						job_id = job_id,
-- 						difficulty_id = difficulty_id,
-- 						difficulty = difficulty,
-- 						one_down = math.random(0.25, one_down_active),
-- 						marker_dot_color = job_data.marker_dot_color or nil,
-- 						color_lerp = job_data.color_lerp or nil
-- 					})
-- 				end
-- 			end
-- 		else
-- 			print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
-- 		end
-- 	end

-- 	return t
-- end