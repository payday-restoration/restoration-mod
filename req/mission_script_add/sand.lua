local pro_job = Global.game_settings and Global.game_settings.one_down
-- local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = 360
local opts_pro_job_ponr = {
	elements = { 102043, },
	trigger_times = 1,
	min_difficulty = 0.7,  -- Unsure how the stealth -> loud transition plays or if it's even relevant, update later if needed
	bravos_timer = 20,
	time_balance_mul_include_team_ai = false,
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
		{ id = 400002, delay = 0, },
	},
}

local opts_pro_job_hunt = {
	enabled = pro_job,
	wave_mode = "hunt",
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_ai_global_event(400002, "pro_job_hunt", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_hunt),
		restoration:gen_counter(400003, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
	},
}
