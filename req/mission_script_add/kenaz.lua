local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local ponr_value_limo = 1500 - (difficulty * 10)
local ponr_timer_player_mul_limo = {
	1.2,
	1,
	0.8,
	0.6,  -- 4+ players
}
local opts_pro_job_ponr_limo = {
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
	time_balance_mul = ponr_timer_player_mul_limo,
	time_easy = ponr_value_limo,
	time_normal = ponr_value_limo,
	time_hard = ponr_value_limo,
	time_overkill = ponr_value_limo,
	time_overkill_145 = ponr_value_limo,
	time_easy_wish = ponr_value_limo,
	time_overkill_290 = ponr_value_limo,
	time_sm_wish = ponr_value_limo,
	enabled = pro_job,
}

local ponr_value_bfd = 1200 - (difficulty * 10)
local ponr_timer_player_mul_bfd = ponr_timer_player_mul_limo
local opts_pro_job_ponr_bfd = table.map_append({}, opts_pro_job_ponr_limo, {
	time_balance_mul = ponr_timer_player_mul_bfd,
	time_easy = ponr_value_bfd,
	time_normal = ponr_value_bfd,
	time_hard = ponr_value_bfd,
	time_overkill = ponr_value_bfd,
	time_overkill_145 = ponr_value_bfd,
	time_easy_wish = ponr_value_bfd,
	time_overkill_290 = ponr_value_bfd,
	time_sm_wish = ponr_value_bfd,
	enabled = false,
})

local ponr_value_van = 900 - (difficulty * 10)
local ponr_timer_player_mul_van = ponr_timer_player_mul_limo
local opts_pro_job_ponr_van = table.map_append({}, opts_pro_job_ponr_limo, {
	time_balance_mul = ponr_timer_player_mul_van,
	time_easy = ponr_value_van,
	time_normal = ponr_value_van,
	time_hard = ponr_value_van,
	time_overkill = ponr_value_van,
	time_overkill_145 = ponr_value_van,
	time_easy_wish = ponr_value_van,
	time_overkill_290 = ponr_value_van,
	time_sm_wish = ponr_value_van,
	enabled = false,
})

local opts_pro_job_ponr_counter = {
	enabled = true,
	counter_target = 2,
	on_executed = {
		{ id = 400001, delay = 0, },
		{ id = 400002, delay = 0, },
		{ id = 400003, delay = 0, },
	},
}

local opts_enable_ponr_bfd = {
	enabled = pro_job,
	toggle = "on",
	elements = {
		400002,
	},
}
local opts_enable_ponr_van = {
	enabled = pro_job,
	toggle = "on",
	elements = {
		400003,
	},
}
local opts_disable_ponrs = {
	enabled = true,
	toggle = "off",
	elements = {
		400001,
		400002,
		400003,
	},
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr_limo", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_limo),
		restoration:gen_pointofnoreturn(400002, "pro_job_ponr_bfd", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_bfd),
		restoration:gen_pointofnoreturn(400003, "pro_job_ponr_van", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_van),
		restoration:gen_toggleelement(400004, "enable_ponr_bfd", opts_enable_ponr_bfd),
		restoration:gen_toggleelement(400005, "enable_ponr_van", opts_enable_ponr_van),
		restoration:gen_counter(400006, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		restoration:gen_toggleelement(400007, "disable_ponrs", opts_disable_ponrs),
	},
}
