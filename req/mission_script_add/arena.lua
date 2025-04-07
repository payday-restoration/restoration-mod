local pro_job = Global.game_settings and Global.game_settings.one_down
local opts_pro_job_ponr_input_event = {
	enabled = true,
	trigger_times = 1,
	event_list = {
		{ instance = "are_heli_escape_001", event = "activate_pro_job_ponr", },
	},
}
local opts_try_start_ponr = {
	enabled = false,
	on_executed = {
		{ id = 400001, delay = 0, },
	},
}
local opts_try_start_ponr_late = deep_clone(opts_try_start_ponr)
local opts_toggle_on_ponr = {
	enabled = true,
	elements = { 400002, },
	toggle = "on",
}
local opts_toggle_on_ponr_late = {
	enabled = true,
	elements = { 400003, },
	toggle = "on",
}
local opts_toggle_off_ponr_input_event = {
	enabled = true,
	elements = { 400001, },
	toggle = "off",
}

return {
	elements = {
		restoration:gen_instance_input_event(
			400001,
			"pro_job_ponr_input_event",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			opts_pro_job_ponr_input_event
		),
		restoration:gen_missionscript(
			400002,
			"try_start_ponr",
			opts_try_start_ponr
		),
		restoration:gen_missionscript(
			400003,
			"try_start_ponr_late",
			opts_try_start_ponr_late
		),
		restoration:gen_toggleelement(
			400004,
			"toggle_on_ponr",
			opts_toggle_on_ponr
		),
		restoration:gen_toggleelement(
			400005,
			"toggle_on_ponr_late",
			opts_toggle_on_ponr_late
		),
		restoration:gen_toggleelement(
			400006,
			"toggle_off_ponr_input_event",
			opts_toggle_off_ponr_input_event
		),
	},
}
