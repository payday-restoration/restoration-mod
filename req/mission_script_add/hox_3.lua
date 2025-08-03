local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 650 or (difficulty == 6 or difficulty == 7) and 600) or 550
local ponr_timer_player_mul = {
	1,
	0.85,
	0.7,
	0.65,
}
local opts_pro_job_ponr = {
	elements =  { 100836, 100245, 100834, 100832, 100833, 100835, },
	trigger_times = 0,
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
