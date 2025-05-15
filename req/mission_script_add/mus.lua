local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local ponr_value_on_picked_up_diamond = (difficulty <= 5 and 680 or (difficulty == 6 or difficulty == 7) and 640) or 600
local ponr_timer_player_mul_on_picked_up_diamond = {
	1,
	1,
	1,
	1,  -- 4+ players
}
local opts_pro_job_ponr_on_picked_up_diamond = {
	elements = {},
	elements_in_instances = {
		["mus_helicopter_001"] = { 100016, },
	},
	trigger_times = 1,
	time_balance_mul = ponr_timer_player_mul_on_picked_up_diamond,
	time_easy = ponr_value_on_picked_up_diamond,
	time_normal = ponr_value_on_picked_up_diamond,
	time_hard = ponr_value_on_picked_up_diamond,
	time_overkill = ponr_value_on_picked_up_diamond,
	time_overkill_145 = ponr_value_on_picked_up_diamond,
	time_easy_wish = ponr_value_on_picked_up_diamond,
	time_overkill_290 = ponr_value_on_picked_up_diamond,
	time_sm_wish = ponr_value_on_picked_up_diamond,
	enabled = false,
}

local ponr_value_on_flare_placeable = (difficulty <= 5 and 530 or (difficulty == 6 or difficulty == 7) and 490) or 450
local ponr_timer_player_mul_on_flare_placeable = {
	1,
	0.85,
	0.7,
	0.65,  -- 4+ players
}
local opts_pro_job_ponr_on_flare_placeable = {
	elements = {},
	elements_in_instances = {
		["mus_helicopter_001"] = { 100016, },
	},
	trigger_times = 1,
	time_balance_mul = ponr_timer_player_mul_on_flare_placeable,
	time_easy = ponr_value_on_flare_placeable,
	time_normal = ponr_value_on_flare_placeable,
	time_hard = ponr_value_on_flare_placeable,
	time_overkill = ponr_value_on_flare_placeable,
	time_overkill_145 = ponr_value_on_flare_placeable,
	time_easy_wish = ponr_value_on_flare_placeable,
	time_overkill_290 = ponr_value_on_flare_placeable,
	time_sm_wish = ponr_value_on_flare_placeable,
	enabled = pro_job,
}

local ponr_value_on_heli_full = ponr_value_on_flare_placeable - 30
local ponr_timer_player_mul_on_heli_full = {
	1,
	0.85,
	0.7,
	0.65,  -- 4+ players
}
local opts_pro_job_ponr_on_heli_full = {
	elements = {},
	elements_in_instances = {
		["mus_helicopter_001"] = { 100016, },
	},
	trigger_times = 0,
	time_balance_mul = ponr_timer_player_mul_on_heli_full,
	time_easy = ponr_value_on_heli_full,
	time_normal = ponr_value_on_heli_full,
	time_hard = ponr_value_on_heli_full,
	time_overkill = ponr_value_on_heli_full,
	time_overkill_145 = ponr_value_on_heli_full,
	time_easy_wish = ponr_value_on_heli_full,
	time_overkill_290 = ponr_value_on_heli_full,
	time_sm_wish = ponr_value_on_heli_full,
	enabled = pro_job,
}

-- on_flare_placeable and on_heli_full are only relevant in loud, no need to toggle
local opts_toggle_on_ponr = {
	enabled = pro_job,
	trigger_times = 1,
	elements = { 400001, },
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr_on_picked_up_diamond", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_on_picked_up_diamond),
		restoration:gen_pointofnoreturn(400002, "pro_job_ponr_on_flare_placeable", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_on_flare_placeable),
		restoration:gen_pointofnoreturn(400003, "pro_job_ponr_on_heli_full", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_on_heli_full),
		restoration:gen_toggleelement(400004, "toggle_on_ponr", opts_toggle_on_ponr),
	},
}
