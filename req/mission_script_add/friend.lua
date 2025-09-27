local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600
local sosa_lieutenant = "units/pd2_dlc_flat/characters/ene_gang_colombian_boss/ene_gang_colombian_boss"
local sosa_backup_1 =  "units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"
local sosa_backup_2 =  "units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"
local sosa_backup_3 =  "units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"
local sosa_backup_4 =  "units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"
local sosa_cartel_amount = 1
local sosa_table = {sosa_backup_1, sosa_backup_2, sosa_backup_3, sosa_backup_4}
local death_sentence = difficulty == 8
local tank_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local death_wish_above = difficulty >= 7



local optsLieutenant = {
	enemy = sosa_lieutenant,
	participate_to_group_ai = true,
	team = "mobster1",
	enabled = (death_sentence and pro_job),
}
local optsSosa_Assault_Wave = {
	enemy_table = sosa_table,
	participate_to_group_ai = true,
	team = "mobster1",
	enabled = true,
	on_executed = {
		{id = 400005, delay = 0 },
	},
}
local opts_hunt_so = {
	scan = true,
	SO_access = tostring(8 + 4),
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_spawn_cartel = {
	enabled = true,
	trigger_times = 6,
	amount = sosa_cartel_amount,
	on_executed = {
		{ id = 400006, delay = 0, },
	},
}
local opts_loop_cartel = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400003, delay = 0, delay_rand = 0, },
		{ id = 400004, delay = 20, delay_rand = 10, },
	},
}
local opts_spawn_cartel_group_1 = {
	enabled = true,
	on_executed = {
		{ id = 400008, delay = 0, },
		{ id = 400009, delay = 0, },
		{ id = 400010, delay = 0, },
		{ id = 400011, delay = 0, },
	},
}

local opts_pro_job_ponr = {
	elements =  { 101297, },
	trigger_times = 0,
	difficulty_add = 0.6,
	min_difficulty = 0.7,
	bravos_timer = 20,
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
		{ id = 400013, delay = 0, },
	},
}

local optsBulldozer = {
	enabled = false,
	enemy = tank_skull,
	on_executed = {
		{ id = 400015, delay = 0, },
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
local opts_enable_dozers = {
	enabled = death_wish_above,
	elements = { 400014, },
	toggle = "on",
}

return {
	elements = {
		-- Sosa's lieutenants
		restoration:gen_dummy(400001, "sosa_lieutenant_1", Vector3(889, -1006, 452.759), Rotation(90, 0, -0), optsLieutenant),
		restoration:gen_dummy(400002, "sosa_lieutenant_2", Vector3(889, -1151, 452.759), Rotation(90, -0, -0), optsLieutenant),
		-- Mini Sosa Cartel Assault Wave
		restoration:gen_element_random(400003, "spawn_cartels", opts_spawn_cartel),
		restoration:gen_missionscript(400004, "loop_cartel", opts_loop_cartel),
		restoration:gen_so(400005, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),
		restoration:gen_missionscript(400006, "cartel_spawngroup", opts_spawn_cartel_group_1),
		-- Front Gate
		restoration:gen_dummy(400008, "sosa_backup_1",Vector3(3684.125, 6501.231, -150), Rotation(171, 0, -0), optsSosa_Assault_Wave),
		restoration:gen_dummy(400009, "sosa_backup_2", Vector3(3783.125, 6485.587, -150), Rotation(171, 0, -0), optsSosa_Assault_Wave),
		restoration:gen_dummy(400010, "sosa_backup_3", Vector3(3814.412, 6683.125, -150), Rotation(171, 0, -0), optsSosa_Assault_Wave),
		restoration:gen_dummy(400011, "sosa_backup_4", Vector3(3715.412, 6698.769, -150), Rotation(171, 0, -0), optsSosa_Assault_Wave),
		-- PONR
		restoration:gen_counter(400012, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		restoration:gen_pointofnoreturn(400013, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		-- a surprise dozer in the escape :)
		restoration:gen_dummy(400014, "boat_dozer_1", Vector3(-5700, -3400, -162.133), Rotation(-90, 0, -0), optsBulldozer),
		restoration:gen_so(400015, "dozer_defend_so_1", Vector3(-6900, -2100, -162.133), Rotation(0, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400016, "enable_dozers", opts_enable_dozers),
	},
}
