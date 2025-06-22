local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
local ponr_timer_player_mul = {
	1,
	0.85,
	0.7,
	0.65,
}
local opts_pro_job_ponr = {
	elements_in_instances = {
		["storage_room"] = { 100028, },
		["drill_bottom"] = { 100319, },
		-- ["drill_top"] = { 100319, },  -- Instance point, not needed (?)
		["limo_escape"] = { 100049, 100008, },
	},
	trigger_times = 1,
	difficulty_add = 0.3,
	min_difficulty = 0.7,
	bravos_difficulty_threshold = 1,
	bravos_timer = 40,
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
