--TODO: Make scripted Bulldozers spawns that turn off either water or power like in PDTH (with taser as his backup in some power box spots)
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
local grenadier = "units/payday2/characters/ene_grenadier_1/ene_grenadier_1"
local taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1"
local ponr_value = (difficulty <= 6 and 120) or 90
local death_sentence = difficulty == 8
local mayhem_above = difficulty >= 6
local overkill_above = difficulty >= 5
local deathwish_above = difficulty >= 7

local opts_pro_job_ponr = {
	elements = { 101987 },
	trigger_times = 0,
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
local opts_pro_job_ponr_end = {
	elements = { 400051 },
	operation = "remove",
	enabled = pro_job,
}
local optsSniper_1 = {
	enemy = sniper,
	on_executed = {
		{ id = 100675, delay = 0, },
	},
	enabled = true,
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = {
		{ id = 400006, delay = 0, },
	},
	enabled = true,
}
local optsSniper_3 = {
	enemy = sniper,
	on_executed = {
		{ id = 400007, delay = 0, },
	},
	enabled = mayhem_above,
}
local optsSniper_4 = {
	enemy = sniper,
	spawn_action = "e_sp_armored_truck_1st",
	on_executed = {
		{ id = 400008, delay = 2.5, },
	},
	enabled = mayhem_above,
}
local optsSniper_5 = {
	enemy = sniper,
	spawn_action = "e_sp_up_2_75_down_1_25m",
	on_executed = {
		{ id = 400009, delay = 3, },
	},
	enabled = death_sentence,
}
local optsGrenadier_1 = {
	enemy = grenadier,
	on_executed = {
		{ id = 400023, delay = 0, },
	},
	enabled = true,
}
local optsGrenadier_2 = {
	enemy = grenadier,
	on_executed = {
		{ id = 400024, delay = 0, },
	},
	enabled = true,
}
local optsGrenadier_3 = {
	enemy = grenadier,
	on_executed = {
		{ id = 400025, delay = 0, },
	},
	enabled = death_sentence,
}
local optsGrenadierDefend_1 = {
	enemy = taser,
	on_executed = {
		{ id = 400035, delay = 0 },
	},
	enabled = deathwish_above
}
local optsGrenadierDefend_2 = {
	enemy = taser,
	on_executed = {
		{ id = 400036, delay = 0, },
	},
	enabled = deathwish_above,
}
local optsGrenadierDefend_3 = {
	enemy = taser,
	on_executed = {
		{ id = 400037, delay = 0, },
	},
	enabled = deathwish_above,
}
local optsGrenadierDefend_4 = {
	enemy = taser,
	on_executed = {
		{ id = 400038, delay = 0, },
	},
	enabled = deathwish_above,
}
local optsrespawn_sniper_1 = {
	on_executed = {
		{ id = 400001, delay = 45, },
	},
	elements = {
		400001,
	},
	event = "death",
}
local optsrespawn_sniper_2 = {
	on_executed = {
		{ id = 400002, delay = 45, },
	},
	elements = {
		400002,
	},
	event = "death",
}
local optsrespawn_sniper_3 = {
	on_executed = {
		{ id = 400003, delay = 45, },
	},
	elements = {
		400003,
	},
	event = "death",
}
local optsrespawn_sniper_4 = {
	on_executed = {
		{ id = 400004, delay = 45, },
	},
	elements = {
		400004,
	},
	event = "death",
}
local optsrespawn_sniper_5 = {
	on_executed = {
		{ id = 400005, delay = 45, },
	},
	elements = {
		400005,
	},
	event = "death",
}
local optsrespawn_grenadier_1 = {
	on_executed = {
		{ id = 400020, delay = 45, },
	},
	elements = {
		400020,
	},
	event = "death",
}
local optsrespawn_grenadier_2 = {
	on_executed = {
		{ id = 400021, delay = 45, },
	},
	elements = {
		400021,
	},
	event = "death",
}
local optsrespawn_grenadier_3 = {
	on_executed = {
		{ id = 400022, delay = 45, },
	},
	elements = {
		400022,
	},
	event = "death",
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local optsSniper_Grenadier_SO = {
	SO_access = "8192",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local disable_2nd_police_cruiser = {
	enabled = true,
	toggle = "off",
	elements = {
		100704,
	},
}
local disable_grenadiers = {
	enabled = true,
	toggle = "off",
	elements = {
		400019,
	},
}
local enable_grenadiers = {
	enabled = overkill_above,
	elements = {
		400019,
	},
}
local spawn_grenadiers = {
	on_executed = {
		{ id = 400020, delay = 0, },
		{ id = 400021, delay = 0, },
		{ id = 400022, delay = 0, },
		{ id = 400017, delay = 0, },
	}
}
local Bain_sendsnipers = {
	dialogue = "play_pln_gen_snip_01",
	can_not_be_muted = true,
}
local Bain_sendgrenadiers = {
	dialogue = "Play_ban_s05",
	can_not_be_muted = true,
}
local Bain_swats_from_keel_street = {
	dialogue = "Play_pln_pal_45",
}
local Bain_swats_from_beach = {
	dialogue = "Play_pln_pal_46",
}
local Bain_swats_from_hills = {
	dialogue = "Play_pln_pal_47",
}
local Bain_swats_from_pacific_drive = {
	dialogue = "Play_pln_pal_48",
}
local optsChopperMitchell_fix = {
	enabled = true,
	trigger_times = 1,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "swat", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "heli_street_seventh_flyin", time = 0 },
		{ id = 3, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "open_door_left", time = 13 },
		{ id = 4, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "open_door_right", time = 13 },
		{ id = 5, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "close_door_left", time = 22 },
		{ id = 6, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "close_door_right", time = 22 },
		{ id = 7, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "heli_street_seventh_flyout", time = 26 },
		{ id = 8, name = "run_sequence", notify_unit_id = 100000, notify_unit_sequence = "hidden", time = 40 },
	},
	on_executed = {
		{ id = 101713, delay = 13 },
	},
}
local optsChopperWilson_fix = {
	enabled = true,
	trigger_times = 1,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102724, notify_unit_sequence = "swat", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 102724, notify_unit_sequence = "heli_suburbia_flyin", time = 0 },
	},
	on_executed = {
		{ id = 101712, delay = 11.5 },
		{ id = 101758, delay = 0 },
		{ id = 102363, delay = 8 },
		{ id = 101715, delay = 0 },
	},
}
local optsChopperWilson_stop_sound_fix = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102724, notify_unit_sequence = "hidden", time = 0 },
	},
}
local optsChopperPool_fix = {
	enabled = true,
	trigger_times = 1,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 100719, notify_unit_sequence = "swat", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 100719, notify_unit_sequence = "heli_street_fourth_flyin", time = 0 },
	},
	on_executed = {
		{ id = 101714, delay = 13 },
		{ id = 101760, delay = 0 },
		{ id = 100792, delay = 8 },
		{ id = 101715, delay = 0 },
	},
}
local optsChopperPool_stop_sound_fix = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 100719, notify_unit_sequence = "hidden", time = 0 },
	},
}
local disable_the_pool_chopper = {
	enabled = true,
	toggle = "off",
	elements = {
		400041,
	},
}
local enable_the_pool_chopper = {
	enabled = true,
	elements = {
		400041,
	},
}

return {
	elements = {
		-- Snipers
		restoration:gen_dummy(400001, "sniper_1", Vector3(4082, 2186, 120.142), Rotation(-180, 0, -0), optsSniper_1),
		restoration:gen_dummy(400002, "sniper_2", Vector3(2978, -744, 126.059), Rotation(180, 0, -0), optsSniper_2),
		restoration:gen_dummy(400003, "sniper_3", Vector3(-3153, 8429, 26.021), Rotation(90, -0, -0), optsSniper_3),
		restoration:gen_dummy(400004, "sniper_4", Vector3(502, -3577, 29.736), Rotation(-167, 0, -0), optsSniper_4),
		restoration:gen_dummy(400005, "sniper_5", Vector3(-8202, 1491, 25.860), Rotation(-90, 0, -0), optsSniper_5),
		restoration:gen_so(400006, "sniper_spot_so_1", Vector3(-3192, 1184, 517.520), Rotation(0, 0, -0), optsSniper_SO),
		restoration:gen_so(400007, "sniper_spot_so_2", Vector3(-3328, 3703, 445.786), Rotation(161, 0, -0), optsSniper_SO),
		restoration:gen_so(400008, "sniper_spot_so_3", Vector3(-1797.890, 1042.875, 415.609), Rotation(46, -0, -0), optsSniper_SO),
		restoration:gen_so(400009, "sniper_spot_so_4", Vector3(-4513, 384, 500.223), Rotation(0, 0, -0), optsSniper_SO),
		restoration:gen_dummytrigger(400010, "respawn_sniper_1", Vector3(-2400, -3677, 375), Rotation(90, -0, -0), optsrespawn_sniper_1),
		restoration:gen_dummytrigger(400011, "respawn_sniper_2", Vector3(-2400, -3577, 375), Rotation(90, -0, -0), optsrespawn_sniper_2),
		restoration:gen_dummytrigger(400012, "respawn_sniper_3", Vector3(-2400, -3677, 375), Rotation(90, -0, -0), optsrespawn_sniper_3),
		restoration:gen_dummytrigger(400013, "respawn_sniper_4", Vector3(-2400, -3577, 375), Rotation(90, -0, -0), optsrespawn_sniper_4),
		restoration:gen_dummytrigger(400014, "respawn_sniper_5", Vector3(-2400, -3677, 375), Rotation(90, -0, -0), optsrespawn_sniper_5),
		restoration:gen_toggleelement(400015, "disable_the_cruiser", disable_2nd_police_cruiser),
		restoration:gen_dialogue(400016, "they_sending_snipers", Bain_sendsnipers),
		-- Greandiers if you kill Mitchell
		restoration:gen_dialogue(400017, "they_sending_grenadiers", Bain_sendgrenadiers),
		restoration:gen_missionscript(400019, "spawn_grenadiers", spawn_grenadiers),
		restoration:gen_dummy(400020, "grenadier_1", Vector3(-6264, 7018, 27.044), Rotation(0, 0, -0), optsGrenadier_1),
		restoration:gen_dummy(400021, "grenadier_2", Vector3(4135, 2186, 120.142), Rotation(180, 0, -0), optsGrenadier_2),
		restoration:gen_dummy(400022, "grenadier_3", Vector3(-5697, -3007, 27.364), Rotation(180, 0, -0), optsGrenadier_3),
		restoration:gen_so(400023, "grenadier_spot_so_1", Vector3(-2600.612, 2522.792, 430.230), Rotation(140, 0, -0), optsSniper_Grenadier_SO),
		restoration:gen_so(400024, "grenadier_spot_so_2", Vector3(-2351, 1831, 402.013), Rotation(90, -0, -0), optsSniper_Grenadier_SO),
		restoration:gen_so(400025, "grenadier_spot_so_3", Vector3(-3503, 1031, 510.702), Rotation(-33, 0, -0), optsSniper_Grenadier_SO),
		restoration:gen_dummytrigger(400026, "respawn_grenadier_1", Vector3(-2400, -3677, 375), Rotation(90, -0, -0), optsrespawn_grenadier_1),
		restoration:gen_dummytrigger(400027, "respawn_grenadier_2", Vector3(-2400, -3577, 375), Rotation(90, -0, -0), optsrespawn_grenadier_2),
		restoration:gen_dummytrigger(400028, "respawn_grenadier_3", Vector3(-2400, -3677, 375), Rotation(90, -0, -0), optsrespawn_grenadier_3),
		restoration:gen_toggleelement(400029, "enable_grenadiers",  enable_grenadiers),
		restoration:gen_toggleelement(400030, "disable_grenadiers", disable_grenadiers),
		restoration:gen_dummy(400031, "grenadier_defend_1", Vector3(-5536, -3189, 30.090), Rotation(90, -0, -0),  optsGrenadierDefend_1),
		restoration:gen_dummy(400032, "grenadier_defend_2", Vector3(-5536, -3129, 30.090), Rotation(90, -0, -0),  optsGrenadierDefend_2),
		restoration:gen_dummy(400033, "grenadier_defend_3", Vector3(3052, -685, 130.921), Rotation(-180, 0, -0),  optsGrenadierDefend_3),
		restoration:gen_dummy(400034, "grenadier_defend_4", Vector3(3121, -685, 130.921), Rotation(-180, -0, -0), optsGrenadierDefend_4),
		restoration:gen_so(400035, "grenadier_spot_so_1", Vector3(-5995, -349, 26.200), Rotation(-90, 0, -0), optsSniper_Grenadier_SO),
		restoration:gen_so(400036, "grenadier_spot_so_2", Vector3(-5995, -455, 26.200), Rotation(-90, 0, -0), optsSniper_Grenadier_SO),
		restoration:gen_so(400037, "grenadier_spot_so_3", Vector3(-796.150, 12.669, 31.663), Rotation(50, -0, -0), optsSniper_Grenadier_SO),
		restoration:gen_so(400038, "grenadier_spot_so_4", Vector3(-863, -67, 31.663), Rotation(50, 0, -0), optsSniper_Grenadier_SO),
		-- misc
		restoration:objecteditor(400039, "mitchell_chopper_fix", Vector3(-803, -1370, 3449.999), Rotation(-90, 0, -0), optsChopperMitchell_fix),
		restoration:objecteditor(400040, "wilson_chopper_fix", Vector3(-803, -1370, 3449.999), Rotation(-90, 0, -0), optsChopperWilson_fix),
		restoration:objecteditor(400041, "pool_chopper_fix", Vector3(-803, -1370, 3449.999), Rotation(-90, 0, -0), optsChopperPool_fix),
		restoration:objecteditor(400042, "wilson_chopper_sound_fix", Vector3(-803, -1370, 3449.999), Rotation(-90, 0, -0), optsChopperWilson_stop_sound_fix),
		restoration:objecteditor(400043, "pool_chopper_sound_fix", Vector3(-803, -1370, 3449.999), Rotation(-90, 0, -0), optsChopperPool_stop_sound_fix),
		restoration:gen_toggleelement(400044, "disable_the_pool_chopper", disable_the_pool_chopper),
		restoration:gen_toggleelement(400045, "enable_the_pool_chopper", enable_the_pool_chopper),
		restoration:gen_dialogue(400047, "swats_beach", Bain_swats_from_beach),
		restoration:gen_dialogue(400048, "swats_hills", Bain_swats_from_hills),
		restoration:gen_dialogue(400049, "swats_pacific_drive", Bain_swats_from_pacific_drive),
		-- PONR
		restoration:gen_pointofnoreturn(400050, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_operator(400051, "pro_job_ponr_end", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_end),
	},
}