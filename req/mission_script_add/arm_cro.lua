local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local ponr_value = 540
local ponr_timer_player_mul = {
	1.5,
	1.25,
	1,  -- 3+ players
}
local opts_pro_job_ponr = {
	elements = { 100245, 100246, 100247, },
	trigger_times = 1,
	min_difficulty = 0.4,
	difficulty_add = 0.3,
	bravos_difficulty_threshold = 0.7,
	bravos_timer = 30,
	time_balance_mul_include_team_ai = false,
	time_balance_mul = ponr_timer_player_mul,
	time_easy = ponr_value,
	time_normal = ponr_value,
	time_hard = ponr_value,
	time_overkill = ponr_value,
	time_overkill_145 = ponr_value,
	time_easy_wish = ponr_value,
	time_overkill_290 = ponr_value,
	time_sm_wish = ponr_value,
	enabled = pro_job,
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
	},
}
