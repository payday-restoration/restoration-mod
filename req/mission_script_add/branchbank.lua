local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
local tank_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local death_wish_above = difficulty >= 7
local ponr_timer_player_mul = {
	1,
	0.85,
	0.7,
	0.65,
}

local opts_pro_job_ponr = {
	elements = { 104722, 104723, 100512, },
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

local opts_pro_job_ponr_counter = {
	enabled = true,
	counter_target = 2,
	on_executed = {
		{ id = 400020, delay = 0, },
	},
}

local optsBulldozer = {
	enemy = tank_skull,
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}
local optsDefend_SO = {
	SO_access = "4096",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_enaable_dozers = {
	enabled = death_wish_above,
	elements = {400001,},
	toggle = "on",
}

local opts_disable_dozers = {
	enabled = true,
	elements = {400001,},
}

return {
	elements = {
		restoration:gen_pointofnoreturn(400020, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_counter(400021, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		-- Skulldozer nearby the van (based on DW Trailer)
		restoration:gen_dummy(400001, "van_dozer_1", Vector3(-8305, -3511, 0), Rotation(-90, 0, -0), optsBulldozer),
		restoration:gen_so(400002, "dozer_defend_so_1", Vector3(-7273, -2895, -19.999), Rotation(0, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400003, "disable_dozers", opts_disable_dozers),
		restoration:gen_toggleelement(400004, "enabled_dozers", opts_enable_dozers),
	},
}