local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local death_wish_above = difficulty >= 7
local surprise_cloaker = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/payday2/characters/ene_spook_1/ene_spook_1")

-- Without serious crowd control like multiple ECM feedback loops, it's suicidal to try and get all loot
-- Team AI are excluded from PONR duration calculation
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
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 0.5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_hide_behind_door_enter",
}
local optsCloaker_01 = {
    enabled = false,
    enemy = surprise_cloaker,
    on_executed = {
        { id = 400003, delay = 0}
    },
}
local opts_enable_cloaker_diamond = {
	enabled = death_wish_above,
	elements = { 400004, },
	toggle = "on",
}

return {
	elements = {
		-- PONR 
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_counter(400002, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		-- Cloaker in the diamond room 
		restoration:gen_so(400003, "diamond_room_hider", Vector3(6132, 356, -598.295), Rotation(103, -0, -0), optsCloaker_Hide_SO_1),
		restoration:gen_dummy(400004, "clokaer_diamond", Vector3(6092, 460, -598.397), Rotation(131, 0, -0), optsCloaker_01),
		restoration:gen_toggleelement(400005, "enable_diamond_cloaker", opts_enable_cloaker_diamond),

	},
}
