local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
local fbi_ready_team_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
local fbi_ready_team_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
local fbi_ready_team_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local tank = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
-- First ship sniper is disallowed on Normal outside of Pro Jobs
local ship_sniper_enabled = pro_job or difficulty > 2
-- Second ship sniper is disallowed below Overkill, or on Normal if Pro Job
local ship_sniper_enabled_second = pro_job and difficulty > 2 or difficulty > 4
-- Ship snipers respawn faster on DW/DS
local ship_sniper_respawn_delay = difficulty < 7 and 90 or 60
local ship_sniper_respawn_delay_rand = ship_sniper_respawn_delay
-- Ground snipers are disallowed below Mayhem, or Very Hard if Pro Job
local ground_sniper_enabled = pro_job and difficulty > 3 or difficulty > 5
local ground_sniper_amount = difficulty > 6 and 2 or 1
-- Ground snipers also respawn faster on DW/DS but take longer than ship snipers
local ground_sniper_respawn_delay = ship_sniper_respawn_delay * 1.5
local ground_sniper_respawn_delay_rand = ground_sniper_respawn_delay
local ground_sniper_rotate_delay = 15
local ground_sniper_rotate_delay_rand = 30
local any_snipers_enabled = ship_sniper_enabled or ship_sniper_enabled_second or ground_sniper_enabled
local fbi_ready_team_dozer_enabled = pro_job and difficulty > 5 or difficulty > 6
local fbi_ready_team_dozer_trigger_times = (pro_job and difficulty > 6 or difficulty > 7) and 2 or 1
local fbi_ready_team_group_spawn_amount = difficulty > 3 and 2 or 1
local looping_dozer_respawn_delay = pro_job and 150 or 210
local looping_dozer_respawn_delay_rand = looping_dozer_respawn_delay * 0.5
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
local ponr_timer_player_mul = {
	1,
	0.85,
	0.7,
	0.65,
	0.65,  -- 5+ players
}

local opts_ship_sniper_1 = {
	enemy = sniper,
	on_executed = {
		{ id = 400007, delay = 0, },
	},
	enabled = ship_sniper_enabled,
}
local opts_ship_sniper_2 = {
	enemy = sniper,
	on_executed = {
		{ id = 400008, delay = 0, },
	},
	enabled = ship_sniper_enabled_second,
}
local opts_ship_sniper_3 = {
	enemy = sniper,
	on_executed = {
		{ id = 400009, delay = 0, },
	},
	enabled = ship_sniper_enabled,
}
local opts_ship_sniper_4 = {
	enemy = sniper,
	on_executed = {
		{ id = 400010, delay = 0, },
	},
	enabled = ship_sniper_enabled_second,
}
local opts_ship_sniper_5 = {
	enemy = sniper,
	on_executed = {
		{ id = 400011, delay = 0, },
	},
	enabled = ship_sniper_enabled,
}
local opts_ship_sniper_6 = {
	enemy = sniper,
	on_executed = {
		{ id = 400012, delay = 0, },
	},
	enabled = ship_sniper_enabled_second,
}
local opts_ground_sniper_1 = {
	enemy = sniper,
	trigger_times = 1,
	on_executed = {
		{ id = 400025, delay = 0, },
	},
	enabled = ground_sniper_enabled,
}
local opts_ground_sniper_2 = {
	enemy = sniper,
	trigger_times = 1,
	on_executed = {
		{ id = 400029, delay = 0, },
	},
	enabled = ground_sniper_enabled,
}
local opts_fbi_ready_team_agent = {
	enemy = fbi_ready_team_1,
	enemy_table = { fbi_ready_team_1, fbi_ready_team_2, },
	-- participate_to_group_ai = true,
	on_executed = {
		{ id = 400057, delay = 0, },
	},
	enabled = true,
}
local opts_fbi_ready_team_dozer = {
	enemy = fbi_ready_team_dozer,
	trigger_times = 0,
	-- participate_to_group_ai = true,
	on_executed = {
		{ id = 400057, delay = 0, },
	},
	enabled = fbi_ready_team_dozer_enabled,
}
local opts_looping_dozer = {
	enemy = tank,
	on_executed = {
		{ id = 400057, delay = 3, },
	},
	enabled = true,
}
local opts_ship_sniper_so = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_hunt_so = {
	scan = true,
	SO_access = tostring(128 + 4096),
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_ground_sniper_so_1_1 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400026, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_1_2 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400027, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_1_3 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400028, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_1_4 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400025, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_2_1 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400030, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_2_2 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400031, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_2_3 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400032, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_ground_sniper_so_2_4 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = {
		{ id = 400029, delay = ground_sniper_rotate_delay, delay_rand = ground_sniper_rotate_delay_rand, },
	},
}
local opts_spawn_ship_snipers_1 = {
	enabled = true,
	trigger_times = 1,
	on_executed = {
		{ id = 400001, delay = 4, },
		{ id = 400002, delay = 4, },
		{ id = 400022, delay = 0, },
	},
}
local opts_spawn_ship_snipers_2 = {
	enabled = true,
	trigger_times = 1,
	on_executed = {
		{ id = 400003, delay = 4, },
		{ id = 400004, delay = 4, },
		{ id = 400022, delay = 0, },
	},
}
local opts_spawn_ship_snipers_3 = {
	enabled = true,
	trigger_times = 1,
	on_executed = {
		{ id = 400005, delay = 4, },
		{ id = 400006, delay = 4, },
		{ id = 400022, delay = 0, },
	},
}
local opts_spawn_ground_snipers = {
	enabled = true,
	trigger_times = 1,
	on_executed = {
		{ id = 400022, delay = 0, },
		{ id = 400023, delay = 0, },
		{ id = 400024, delay = 0, },
	},
}
local opts_spawn_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	amount = fbi_ready_team_group_spawn_amount,
	on_executed = {
		{ id = 400077, delay = 0, },
		{ id = 400078, delay = 0, },
		{ id = 400079, delay = 0, },
		{ id = 400080, delay = 0, },
	},
}
local opts_loop_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400054, delay = 0, delay_rand = 0, },
		{ id = 400055, delay = 10, delay_rand = 10, },  -- Move to different element (this points to itself)
	},
}
local opts_they_sending_snipers = {
	dialogue = "play_pln_gen_snip_01",
	trigger_times = 1,
	enabled = any_snipers_enabled,
}
local opts_respawn_ship_sniper_1 = {
	on_executed = {
		{ id = 400001, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400001, },
	event = "death",
}
local opts_respawn_ship_sniper_2 = {
	on_executed = {
		{ id = 400002, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400002, },
	event = "death",
}
local opts_respawn_ship_sniper_3 = {
	on_executed = {
		{ id = 400003, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400003, },
	event = "death",
}
local opts_respawn_ship_sniper_4 = {
	on_executed = {
		{ id = 400004, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400004, },
	event = "death",
}
local opts_respawn_ship_sniper_5 = {
	on_executed = {
		{ id = 400005, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400005, },
	event = "death",
}
local opts_respawn_ship_sniper_6 = {
	on_executed = {
		{ id = 400006, delay = ship_sniper_respawn_delay, delay_rand = ship_sniper_respawn_delay_rand, },
	},
	elements = { 400006, },
	event = "death",
}
local opts_ground_sniper_1_died = {
	on_executed = {
		{ id = 400064, delay = 0, },
		{ id = 400063, delay = ground_sniper_respawn_delay, delay = ground_sniper_respawn_delay_rand, },
	},
	elements = { 400023, },
	event = "death",
}
local opts_ground_sniper_2_died = {
	on_executed = {
		{ id = 400065, delay = 0, },
		{ id = 400063, delay = ground_sniper_respawn_delay, delay = ground_sniper_respawn_delay_rand, },
	},
	elements = { 400024, },
	event = "death",
}
local opts_respawn_looping_dozer = {
	on_executed = {
		{ id = 400058, delay = looping_dozer_respawn_delay, delay_rand = looping_dozer_respawn_delay_rand },
	},
	elements = { 400058, },
	event = "death",
}
local opts_pro_job_ponr = {
	elements = { 100989, 103322, 103323, 103324, },
	trigger_times = 1,
	time_balance_mul_include_team_ai = true,
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
	counter_target = 1,
	on_executed = {
		{ id = 400060, delay = 0, },
	},
}
local opts_pick_ground_sniper_first_spawn = {
	amount = ground_sniper_amount,
	enabled = ground_sniper_enabled,
	on_executed = {
		{ id = 400023, delay = 0, },
		{ id = 400024, delay = 0, },
	},
}
local opts_pick_ground_sniper_respawn = {
	amount = 1,
	enabled = ground_sniper_enabled,
	ignore_disabled = true,
	on_executed = {
		{ id = 400023, delay = 0, },
		{ id = 400024, delay = 0, },
	},
}
local opts_reenable_ground_sniper_1 = {
	enabled = true,
	elements = { 400023, },
	set_trigger_times = 1,
	toggle = "on",
}
local opts_reenable_ground_sniper_2 = {
	enabled = true,
	elements = { 400024, },
	set_trigger_times = 1,
	toggle = "on",
}
local opts_dock_cloaker_group = {
	enabled = true,
	ignore_disabled = true,
	interval = 60,
	preferred_spawn_groups = {
		"single_spooc",
		-- "FBI_spoocs",
	},
	elements = {
		400072,
		400073,
		400074,
		400075,
		103961,
		103963,
		103965,
		103967,
		103969,
		103971,
		103973,
		103975,
		103977,
		103979,
	},
}
local opts_pick_enable_dock_cloaker_spawns = {
	enabled = true,
	amount = 1,
	amount_random = 0,
	ignore_disabled = true,
	trigger_times = 4,
	on_executed = {
		{ id = 400068, delay = 0, },
		{ id = 400069, delay = 0, },
		{ id = 400070, delay = 0, },
		{ id = 400071, delay = 0, },
	},
}
local opts_enable_dock_cloaker_spawns_dock_7 = {
	enabled = true,
	trigger_times = 1,
	elements = { 400073, 400074, 400075, },
	toggle = "on",
}
local opts_enable_dock_cloaker_spawns_dock_8 = {
	enabled = true,
	trigger_times = 1,
	elements = { 103963, 103965, 103967, },
	toggle = "on",
}
local opts_enable_dock_cloaker_spawns_dock_9 = {
	enabled = true,
	trigger_times = 1,
	elements = { 103973, 103975, 103977, 103979, },
	toggle = "on",
}
local opts_enable_dock_cloaker_spawns_corners = {
	enabled = true,
	trigger_times = 1,
	elements = { 103961, 400072, 103969, 103971, },
	toggle = "on",
}
local opts_dock_cloaker_spawn = {
	enemy = cloaker,
	enabled = false,
	spawn_action = "e_sp_clk_up_manhole",
}
local opts_add_dock_cloaker_group = {
	enabled = true,
	trigger_times = 1,
	spawn_groups = { 400066, },
}
local opts_fbi_ready_team_agent_spawn_group_1 = {
	enabled = true,
	on_executed = {
		{ id = 400038, delay = 0, },
		{ id = 400039, delay = 0, },
		{ id = 400040, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_2 = {
	enabled = true,
	on_executed = {
		{ id = 400043, delay = 0, },
		{ id = 400044, delay = 0, },
		{ id = 400045, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_3 = {
	enabled = true,
	on_executed = {
		{ id = 400047, delay = 0, },
		{ id = 400048, delay = 0, },
		{ id = 400049, delay = 0, },
	},
}
local opts_fbi_ready_team_dozer_spawn_group_1 = {
	enabled = fbi_ready_team_dozer_enabled,
	trigger_times = fbi_ready_team_dozer_trigger_times,
	on_executed = {
		{ id = 400053, delay = 0, },
	},
}

return {
	elements = {
		-- Ship Snipers
		restoration:gen_dummy(400001, "ship_sniper_1", Vector3(3385, -3308, 540), Rotation(-90, 0, 0), opts_ship_sniper_1),
		restoration:gen_dummy(400002, "ship_sniper_2", Vector3(3285, -3308, 540), Rotation(-90, 0, 0), opts_ship_sniper_2),
		restoration:gen_dummy(400003, "ship_sniper_3", Vector3(4202, 4376, 540), Rotation(90, 0, 0), opts_ship_sniper_3),
		restoration:gen_dummy(400004, "ship_sniper_4", Vector3(4133, 4368, 540), Rotation(90, 0, 0), opts_ship_sniper_4),
		restoration:gen_dummy(400005, "ship_sniper_5", Vector3(5936, 405, 540), Rotation(0, 0, 0), opts_ship_sniper_5),
		restoration:gen_dummy(400006, "ship_sniper_6", Vector3(5936, 500, 540), Rotation(0, 0, 0), opts_ship_sniper_6),
		restoration:gen_so(400007, "ship_sniper_so_1", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_ship_sniper_so),
		restoration:gen_so(400008, "ship_sniper_so_2", Vector3(4132, -2997, 540), Rotation(0, 0, 0), opts_ship_sniper_so),
		restoration:gen_so(400009, "ship_sniper_so_3", Vector3(3509, 4051, 540), Rotation(-180, 0, 0), opts_ship_sniper_so),
		restoration:gen_so(400010, "ship_sniper_so_4", Vector3(3701, 4051, 540), Rotation(-180, 0, 0), opts_ship_sniper_so),
		restoration:gen_so(400011, "ship_sniper_so_5", Vector3(5643, 1060, 540), Rotation(90, 0, 0), opts_ship_sniper_so),
		restoration:gen_so(400012, "ship_sniper_so_6", Vector3(5643, 929, 540), Rotation(90, 0, 0), opts_ship_sniper_so),
		restoration:gen_missionscript(400013, "spawn_ship_snipers_1", opts_spawn_ship_snipers_1),
		restoration:gen_missionscript(400014, "spawn_ship_snipers_2", opts_spawn_ship_snipers_2),
		restoration:gen_missionscript(400015, "spawn_ship_snipers_3", opts_spawn_ship_snipers_3),
		restoration:gen_dummytrigger(400016, "respawn_ship_sniper_1", Vector3(-2400, -3677, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_1),
		restoration:gen_dummytrigger(400017, "respawn_ship_sniper_2", Vector3(-2400, -3577, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_2),
		restoration:gen_dummytrigger(400018, "respawn_ship_sniper_3", Vector3(-2400, -3677, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_3),
		restoration:gen_dummytrigger(400019, "respawn_ship_sniper_4", Vector3(-2400, -3577, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_4),
		restoration:gen_dummytrigger(400020, "respawn_ship_sniper_5", Vector3(-2400, -3677, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_5),
		restoration:gen_dummytrigger(400021, "respawn_ship_sniper_6", Vector3(-2400, -3577, 375), Rotation(90, 0, 0), opts_respawn_ship_sniper_6),
		restoration:gen_dialogue(400022, "they_sending_snipers", opts_they_sending_snipers),
		-- Ground Snipers
		restoration:gen_dummy(400023, "ground_sniper_1", Vector3(-2983, 193, 0), Rotation(0, 0, 0), opts_ground_sniper_1),
		restoration:gen_dummy(400024, "ground_sniper_2", Vector3(-2559, -2495, 0), Rotation(-90, 0, 0), opts_ground_sniper_2),
		restoration:gen_so(400025, "ground_sniper_loop_1_1", Vector3(-2189, 1500, 0), Rotation(-90, 0, 0), opts_ground_sniper_so_1_1),
		restoration:gen_so(400026, "ground_sniper_loop_1_2", Vector3(-1024.726, 3595, 0), Rotation(-130, 0, 0), opts_ground_sniper_so_1_2),
		restoration:gen_so(400027, "ground_sniper_loop_1_3", Vector3(617, 1198, 0), Rotation(-80, 0, 0), opts_ground_sniper_so_1_3),
		restoration:gen_so(400028, "ground_sniper_loop_1_4", Vector3(-186, -1162, 0), Rotation(-90, 0, 0), opts_ground_sniper_so_1_4),
		restoration:gen_so(400029, "ground_sniper_loop_2_1", Vector3(413, -1575, 0), Rotation(-90, 0, 0), opts_ground_sniper_so_2_1),
		restoration:gen_so(400030, "ground_sniper_loop_2_2", Vector3(1096, -1170, 0), Rotation(-104, 0, 0), opts_ground_sniper_so_2_2),
		restoration:gen_so(400031, "ground_sniper_loop_2_3", Vector3(1476, 656, 0), Rotation(-55, 0, 0), opts_ground_sniper_so_2_3),
		restoration:gen_so(400032, "ground_sniper_loop_2_4", Vector3(-465, 1287, 0), Rotation(-90, 0, 0), opts_ground_sniper_so_2_4),
		restoration:gen_dummytrigger(400033, "ground_sniper_1_died", Vector3(-2400, -3677, 375), Rotation(90, 0, 0), opts_ground_sniper_1_died),
		restoration:gen_dummytrigger(400034, "ground_sniper_2_died", Vector3(-2400, -3577, 375), Rotation(90, 0, 0), opts_ground_sniper_2_died),
		-- FBI Ready Team
		-- restoration:gen_dummy(400035, "fbi_ready_team_agent_1", Vector3(-2974, 6585, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400036, "fbi_ready_team_agent_2",Vector3(-2973, 6640, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400037, "fbi_ready_team_agent_3", Vector3(-2972, 6705, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400038, "fbi_ready_team_agent_4", Vector3(-2971, 6759, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400039, "fbi_ready_team_agent_5", Vector3(-2970, 6813, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400040, "fbi_ready_team_agent_6", Vector3(-2969, 6858, 0), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400041, "fbi_ready_team_agent_7", Vector3(-2970, -70, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400042, "fbi_ready_team_agent_8", Vector3(-2970, -144, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400043, "fbi_ready_team_agent_9", Vector3(-2970, -219, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400044, "fbi_ready_team_agent_10", Vector3(-2970, -297, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400045, "fbi_ready_team_agent_11", Vector3(-2970, -359, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400046, "fbi_ready_team_agent_12", Vector3(-2970, -419, 0), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400047, "fbi_ready_team_agent_13", Vector3(-2446, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400048, "fbi_ready_team_agent_14", Vector3(-2383, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400049, "fbi_ready_team_agent_15", Vector3(-2314, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400050, "fbi_ready_team_agent_16", Vector3(-2248, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400051, "fbi_ready_team_agent_17", Vector3(-2162, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		-- restoration:gen_dummy(400052, "fbi_ready_team_agent_18", Vector3(-2075, -2502, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400053, "fbi_ready_team_dozer", Vector3(-2348, -2573, 0), Rotation(-90, 0, 0), opts_fbi_ready_team_dozer),
		restoration:gen_element_random(400054, "spawn_fbi_ready_teams", opts_spawn_fbi_ready_teams),
		restoration:gen_missionscript(400055, "loop_fbi_ready_teams", opts_loop_fbi_ready_teams),
		restoration:gen_missionscript(400056, "spawn_ground_snipers", opts_spawn_ground_snipers),
		restoration:gen_so(400057, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),
		restoration:gen_dummy(400058, "looping_dozer", Vector3(-2961, 3277, 0), Rotation(180, 0, 0), opts_looping_dozer),
		restoration:gen_dummytrigger(400059, "respawn_looping_dozer", Vector3(-2400, -3577, 375), Rotation(90, 0, 0), opts_respawn_looping_dozer),
		-- Pro Job PONR
		restoration:gen_pointofnoreturn(400060, "pro_job_ponr", Vector3(75, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_counter(400061, "pro_job_ponr_counter", Vector3(75, -50, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		-- More Sniper stuff added later
		restoration:gen_element_random(400062, "pick_ground_sniper_first_spawn", opts_pick_ground_sniper_first_spawn),
		restoration:gen_element_random(400063, "pick_ground_sniper_respawn", opts_pick_ground_sniper_respawn),
		restoration:gen_toggleelement(400064, "reenable_ground_sniper_1", opts_reenable_ground_sniper_1),
		restoration:gen_toggleelement(400065, "reenable_ground_sniper_2", opts_reenable_ground_sniper_2),
		-- 
		restoration:gen_spawngroup(400066, "dock_cloaker_group", nil, nil, opts_dock_cloaker_group),
		restoration:gen_element_random(400067, "pick_enable_dock_cloaker_spawns", opts_pick_enable_dock_cloaker_spawns),
		restoration:gen_toggleelement(400068, "enable_dock_cloaker_spawns_dock_7", opts_enable_dock_cloaker_spawns_dock_7),
		restoration:gen_toggleelement(400069, "enable_dock_cloaker_spawns_dock_8", opts_enable_dock_cloaker_spawns_dock_8),
		restoration:gen_toggleelement(400070, "enable_dock_cloaker_spawns_dock_9", opts_enable_dock_cloaker_spawns_dock_9),
		restoration:gen_toggleelement(400071, "enable_dock_cloaker_spawns_corners", opts_enable_dock_cloaker_spawns_corners),
		restoration:gen_dummy(400072, "dock_cloaker_10", Vector3(4485, 3450, 0), Rotation(180, 0, 0), opts_dock_cloaker_spawn),
		restoration:gen_dummy(400073, "dock_cloaker_11", Vector3(3650, 3450, 0), Rotation(180, 0, 0), opts_dock_cloaker_spawn),
		restoration:gen_dummy(400074, "dock_cloaker_12", Vector3(2550, 3450, 0), Rotation(180, 0, 0), opts_dock_cloaker_spawn),
		restoration:gen_dummy(400075, "dock_cloaker_13", Vector3(1650, 3450, 0), Rotation(180, 0, 0), opts_dock_cloaker_spawn),
		restoration:gen_preferedadd(400076, "add_dock_cloaker_group", opts_add_dock_cloaker_group),
		restoration:gen_missionscript(400077, "fbi_ready_team_agent_spawn_group_1", opts_fbi_ready_team_agent_spawn_group_1),
		restoration:gen_missionscript(400078, "fbi_ready_team_agent_spawn_group_2", opts_fbi_ready_team_agent_spawn_group_2),
		restoration:gen_missionscript(400079, "fbi_ready_team_agent_spawn_group_3", opts_fbi_ready_team_agent_spawn_group_3),
		restoration:gen_missionscript(400079, "fbi_ready_team_dozer_spawn_group_1", opts_fbi_ready_team_dozer_spawn_group_1),
	},
}
