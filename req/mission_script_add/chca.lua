local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
local ponr_timer_player_mul = {
	1,
	1,
	1,
	1,  -- 4+ players
}

local opts_pro_job_ponr_panic_room_style = {
	elements = { 103263, },
	trigger_times = 1,
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
local opts_pro_job_ponr_its_payday_style_input_event = {
	enabled = true,
	trigger_times = 1,
	event_list = {
		{ instance = "chca_heli_escape_001", event = "activate_pro_job_ponr", },
	},
}
local opts_try_start_ponr_its_payday_style = {
	enabled = false,
	trigger_times = 1,
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}
local opts_toggle_on_ponr_its_payday_style = {
	enabled = true,
	trigger_times = 1,
	elements = { 400003, },
	toggle = "on",
}
local opts_toggle_off_ponr_its_payday_style = {
	enabled = true,
	elements = { 400002, },
	toggle = "off",
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr_panic_room_style", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_panic_room_style),
		restoration:gen_instance_input_event(400002, "pro_job_ponr_its_payday_style_input_event", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_its_payday_style_input_event),
		restoration:gen_missionscript(400003, "try_start_ponr_its_payday_style", opts_try_start_ponr_its_payday_style),
		restoration:gen_toggleelement(400004, "toggle_on_ponr_its_payday_style", opts_toggle_on_ponr_its_payday_style),
		restoration:gen_toggleelement(400005, "toggle_off_ponr_its_payday_style", opts_toggle_off_ponr_its_payday_style),
		restoration:gen_toggleelement(400006, "toggle_off_ponr_panic_room_style", opts_toggle_off_ponr_panic_room_style),
	},
}
