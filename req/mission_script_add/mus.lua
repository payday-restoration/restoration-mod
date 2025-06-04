local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local ponr_value = (difficulty <= 5 and 750 or (difficulty == 6 or difficulty == 7) and 750) or 750
local ponr_timer_player_mul = {
	1,
	0.9,
	0.8,
	0.7,  -- 4+ players
}
local opts_pro_job_ponr = {
	elements = { 100247, },
	elements_in_instances = {
		["mus_helicopter_001"] = { 100016, },
	},
	trigger_times = 1,
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

local opts_pro_job_ponr_counter = {
	enabled = true,
	counter_target = 2,
	on_executed = {
		{ id = 400001, delay = 0, },
	},
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_counter(400002, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
	},
}
