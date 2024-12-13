local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local diff_scaling = 0.095 * difficulty
local chavez_enforcer = "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"
local chavez_lieutenant = "units/pd2_dlc_flat/characters/ene_gang_colombian_boss/ene_gang_colombian_boss"
local swat_shotgunner = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
local shield = ((difficulty >= 6 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/payday2/characters/ene_shield_2/ene_shield_2")
local tank = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
local taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1"
local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local death_sentence = difficulty == 8
local overkill_above = difficulty >= 5
local hard_above = difficulty >= 3
local enabled_chance_shields = math.random() < diff_scaling

local optsSWAT_Heavy145 = {
    enemy = swat_shotgunner,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400014, delay = 0 },
		{ id = 400014, delay = 5 }
	},
    enabled = true
}
local optsSWAT_Rooftop_1 = {
    enemy = swat_shotgunner,
	spawn_action = "e_sp_crh_to_std_rifle",
	on_executed = { 
		{ id = 400023, delay = 0 }
	},
    enabled = true
}
local optsSWAT_Rooftop_2 = {
    enemy = swat_shotgunner,
	spawn_action = "e_sp_crh_to_std_rifle",
	on_executed = { 
		{ id = 400024, delay = 0 }
	},
    enabled = true
}
local optsBulldozer = {
    enemy = tank,
	on_executed = { 
		{ id = 400014, delay = 1.5 },
		{ id = 400016, delay = 0 }
	},
    enabled = hard_above
}
local optsBulldozerscripted = {
    enemy = tank,
	on_executed = { 
		{ id = 400041, delay = 1.5 },
		{ id = 400016, delay = 0 }
	},
    enabled = hard_above
}
local optsCloaker = {
    enemy = cloaker,
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsShield_1 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400050, delay = 0 }
	},
    enabled = true
}
local optsShield_2 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400051, delay = 0 }
	},
    enabled = true
}
local optsShield_3 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400052, delay = 0 }
	},
    enabled = true
}
local optsShield_4 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400053, delay = 0 }
	},
    enabled = true
}
local optsShield_5 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400054, delay = 0 }
	},
    enabled = true
}
local optsShield_6 = {
    enemy = shield,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400055, delay = 0 }
	},
    enabled = true
}
local optsEnforcer = {
    enemy = chavez_enforcer,
	team = "mobster1",
    enabled = death_sentence
}
local optsEnforcerPJ = {
    enemy = chavez_enforcer,
	team = "mobster1",
    enabled = (death_sentence and pro_job)
}
local optsLieutenant = {
    enemy = chavez_lieutenant,
	participate_to_group_ai = true,
	team = "mobster1",
    enabled = death_sentence
}
local optsTaser = {
    enemy = taser,
	spawn_action = "e_sp_run_jump_far",
	participate_to_group_ai = true,
    enabled = true
}
local optsBulldozerchopper = {
    enemy = tank,
	participate_to_group_ai = true,
	spawn_action = "e_sp_jump_down_heli_cbt_left",
	on_executed = { 
		{ id = 400016, delay = 0 }
	},
    enabled = true
}
local optsTaserChopper = {
    enemy = taser,
	spawn_action = "e_sp_jump_down_heli_cbt_right",
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyChopper_1 = {
	enemy = swat_shotgunner,
	spawn_action = "e_sp_jump_down_heli_cbt_left",
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyChopper_2 = {
	enemy = swat_shotgunner,
	spawn_action = "e_sp_jump_down_heli_cbt_right",
	participate_to_group_ai = true,
    enabled = true
}
local optsShare_AIHunt = {
    SO_access = tostring(128+4096),
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsSniper_SO = {
	SO_access = "128",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	pose = "crouch",
	interval = 2,
    so_action = "AI_sniper"
}
local optsAI_Defend = {
    SO_access = "4096",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_defend"
}
local optsShield_Defend_SO = {
	SO_access = "2048",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_a",
	can_not_be_muted = true
}
local Bain_sendshields = {
	dialogue = "Play_ban_s03_b",
	can_not_be_muted = true
}
local Bain_sendcloakers = {
	dialogue = "Play_ban_s04",
	can_not_be_muted = true
}
local Bain_sendtasers = {
	dialogue = "Play_ban_s01_b",
	can_not_be_muted = true
}
local spawn_heavy_swat_145 = {
	enabled = overkill_above,
	on_executed = { 
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 }
	}
}
local spawn_tasers = {
	enabled = hard_above,
	on_executed = { 
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
		{ id = 400019, delay = 0 }
	}
}
local spawn_cloakers = {
	enabled = hard_above,
	on_executed = { 
		{ id = 400033, delay = 0 },
		{ id = 400034, delay = 0 },
		{ id = 400035, delay = 0 },
		{ id = 400036, delay = 0 }
	}
}
local spawn_rooftopSWAT = {
	enabled = true,
	on_executed = { 
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 }
	}
}
local spawn_SWATsquad = {
	enabled = true,
	on_executed = { 
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0.5 },
		{ id = 400030, delay = 1 },
		{ id = 400031, delay = 1.5 }
	}
}
local spawn_Shields = {
	enabled = (hard_above and enabled_chance_shields),
	on_executed = { 
		{ id = 400044, delay = 0 },
		{ id = 400045, delay = 0 },
		{ id = 400046, delay = 0 },
		{ id = 400047, delay = 0 },
		{ id = 400048, delay = 0 },
		{ id = 400049, delay = 0 }
	}
}
local optsrespawn_swat_1 = {
	on_executed = { 
		{ id = 400021, delay = 30 }
	},
	elements = { 
		400021
	},
    event = "death"
}
local optsrespawn_swat_2 = {
	on_executed = { 
		{ id = 400022, delay = 30 }
	},
	elements = { 
		400022
	},
    event = "death"
}
local enable_cloakers = {
	enabled = hard_above,
	elements = { 
		400037
	}
}
local disable_cloakers = {
	enabled = true,
	toggle = "off",
	elements = { 
		400037
	}
}
local Roof_access_block = {
	enabled = overkill_above,
	trigger_times = 1,
	on_executed = { 
		{ id = 100297, delay = 0.5 },
		{ id = 100569, delay = 1 }
	}
}
local disable_open_roof_access = {
	enabled = overkill_above,
	toggle = "off",
	elements = { 
		100569
	}
}

return {
    elements = {
        --Heavy Shotgunners
		restoration:gen_missionscript(
            400001,
            "spawn_heavy_shotgunners",
            spawn_heavy_swat_145
        ),
		restoration:gen_dummy(
            400002,
            "swat_heavy_1",
            Vector3(-2782, 2936, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400003,
            "swat_heavy_2",
            Vector3(-2782, 2977, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400004,
            "swat_heavy_3",
            Vector3(-2782, 3033, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400005,
            "swat_heavy_4",
            Vector3(-2840, 3025, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400006,
            "swat_heavy_5",
            Vector3(-2840, 2983, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400007,
            "swat_heavy_6",
            Vector3(-2837, 2945, -25.190),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400008,
            "swat_heavy_7",
            Vector3(1908, 2685, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400009,
            "swat_heavy_8",
            Vector3(1964, 2685, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400010,
            "swat_heavy_9",
            Vector3(2017, 2685, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400011,
            "swat_heavy_10",
            Vector3(1916, 2734, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400012,
            "swat_heavy_11",
            Vector3(1964, 2734, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_dummy(
            400013,
            "swat_heavy_12",
            Vector3(2017, 2734, -24.825),
            Rotation(-180, 0, -0),
            optsSWAT_Heavy145
        ),
		restoration:gen_so(
            400014,
            "global_hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsShare_AIHunt
        ),
		restoration:gen_dummy(
            400015,
            "bulldozer",
            Vector3(-2228, -3266, -25),
            Rotation(90, -0, -0),
            optsBulldozer
        ),
		restoration:gen_dialogue(
            400016,
            "they_sending_dozers",
            Bain_senddozers
        ),
		restoration:gen_dummy(
            400017,
            "taser_1",
            Vector3(372, 1302, 1674.944),
            Rotation(90, -0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400018,
            "taser_2",
            Vector3(372, 163, 1674.944),
            Rotation(90, -0, -0),
            optsTaser
        ),
		restoration:gen_dialogue(
            400019,
            "they_sending_tasers",
            Bain_sendtasers
        ),
		restoration:gen_missionscript(
            400020,
            "go_hard_with_tasers",
            spawn_tasers
        ),
		restoration:gen_dummy(
            400021,
            "swat_rooftop_1",
            Vector3(-1855, 3449, 1931.656),
            Rotation(90, -0, -0),
            optsSWAT_Rooftop_1
        ),
		restoration:gen_dummy(
            400022,
            "swat_rooftop_2",
            Vector3(-4081, 1580, 1937.656),
            Rotation(180, 0, -0),
            optsSWAT_Rooftop_2
        ),
		restoration:gen_so(
            400023,
            "swat_spot_so_1",
            Vector3(-1522.207, 2149.161, 1936.735),
            Rotation(180, 0, 0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400024,
            "swat_spot_so_2",
            Vector3(-2673, 675, 1936.735),
            Rotation(-76, 0, 0),
            optsSniper_SO
        ),
		restoration:gen_missionscript(
            400025,
            "annoying_Heavy_SWAT",
            spawn_rooftopSWAT
        ),
		restoration:gen_dummytrigger(
            400026,
            "respawn_swat_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_swat_1
        ),
		restoration:gen_dummytrigger(
            400027,
            "respawn_swat_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_swat_2
        ),
		restoration:gen_dummy(
            400028,
            "swat_1",
            Vector3(-1339.660, 875.868, 1675),
            Rotation(73, -0, -0),
            optsSWAT_HeavyChopper_2
        ),
		restoration:gen_dummy(
            400029,
            "swat_2",
            Vector3(-920.705, 850.572, 1675),
            Rotation(-80, -0, -0),
            optsSWAT_HeavyChopper_1
        ),
		restoration:gen_dummy(
            400030,
            "taser",
            Vector3(-1377.150, 807.061, 1675),
            Rotation(97, -0, -0),
            optsTaserChopper
        ),
		restoration:gen_dummy(
            400031,
            "bulldozer",
            Vector3(-936.857, 821.147, 1675),
            Rotation(-80, 0, -0),
            optsBulldozerchopper
        ),
		restoration:gen_missionscript(
            400032,
            "spawn_the_squad",
            spawn_SWATsquad
        ),
		restoration:gen_dummy(
            400033,
            "cloaker_1",
            Vector3(188.860, 3694.086, 1931.656),
            Rotation(90, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400034,
            "cloaker_2",
            Vector3(124.860, 3694.086, 1931.656),
            Rotation(90, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400035,
            "cloaker_3",
            Vector3(61.860, 3694.086, 1931.656),
            Rotation(90, -0, -0),
            optsCloaker
        ),
		restoration:gen_dialogue(
            400036,
            "they_sending_cloakers",
            Bain_sendcloakers
        ),
		restoration:gen_missionscript(
            400037,
            "spawn_cloakers",
            spawn_cloakers
        ),
		restoration:gen_toggleelement(
            400038,
            "enable_cloakers",
            enable_cloakers
        ),
		restoration:gen_toggleelement(
            400039,
            "disable_cloakers",
            disable_cloakers
        ),
		restoration:gen_dummy(
            400040,
            "bulldozer",
            Vector3(1916, 2375, -24.825),
            Rotation(180, 0, -0),
            optsBulldozerscripted
        ),
		restoration:gen_so(
            400041,
            "dozer_defend_so",
            Vector3(11, 1132, 53.185),
            Rotation(180, 0, -0),
            optsAI_Defend
        ),
		restoration:gen_dialogue(
            400042,
            "they_sending_shields",
            Bain_sendshields
        ),
		restoration:gen_missionscript(
            400043,
            "spawn_defend_shields",
            spawn_Shields
        ),
		restoration:gen_dummy(
            400044,
            "shield_1",
            Vector3(-889.027, 18.536, 700.001),
            Rotation(-90, 0, -0),
            optsShield_1
        ),
		restoration:gen_dummy(
            400045,
            "shield_2",
            Vector3(-956.985, 16.162, 700.001),
            Rotation(-90, -0, -0),
            optsShield_2
        ),
		restoration:gen_dummy(
            400046,
            "shield_3",
            Vector3(-1012.951, 14.208, 700.001),
            Rotation(-90, 0, -0),
            optsShield_3
        ),
		restoration:gen_dummy(
            400047,
            "shield_4",
            Vector3(-57, 1640, 697.988),
            Rotation(90, -0, -0),
            optsShield_4
        ),
		restoration:gen_dummy(
            400048,
            "shield_5",
            Vector3(-1704, 1478, 375.600),
            Rotation(-90, -0, -0),
            optsShield_5
        ),
		restoration:gen_dummy(
            400049,
            "shield_6",
            Vector3(22, 1430, 375.600),
            Rotation(90, -0, -0),
            optsShield_6
        ),
		restoration:gen_so(
            400050,
            "shield_defend_so_1",
            Vector3(-1057, 497, 700.001),
            Rotation(78, -0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_so(
            400051,
            "shield_defend_so_2",
            Vector3(-1037.821, 698.270, 700.001),
            Rotation(109, -0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_so(
            400052,
            "shield_defend_so_3",
            Vector3(-962.004, 583.511, 700.001),
            Rotation(89, -0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_so(
            400053,
            "shield_defend_so_4",
            Vector3(-684, 1663, 746.988),
            Rotation(90, -0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_so(
            400054,
            "shield_defend_so_5",
            Vector3(-1470, 1486, 375.600),
            Rotation(0, 0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_so(
            400055,
            "shield_defend_so_6",
            Vector3(-289, 1521, 375.600),
            Rotation(0, 0, -0),
            optsShield_Defend_SO
        ),
		restoration:gen_dummy(
            400056,
            "enforcer_1",
            Vector3(245, 361, 1349.998),
            Rotation(65, 0, -0),
            optsEnforcer
        ),
		restoration:gen_dummy(
            400057,
            "enforcer_2",
            Vector3(134.792, 232.511, 1349.998),
            Rotation(33, -0, -0),
            optsEnforcerPJ
        ),
		restoration:gen_dummy(
            400058,
            "enforcer_3",
            Vector3(-1741.349, 268.777, 1351.463),
            Rotation(-63, 0, -0),
            optsEnforcer
        ),
		restoration:gen_dummy(
            400059,
            "enforcer_4",
            Vector3(-1643, 115, 1351.463),
            Rotation(-53, 0, -0),
            optsEnforcerPJ
        ),
		restoration:gen_dummy(
            400060,
            "enforcer_5",
            Vector3(299, -181, 700.001),
            Rotation(0, 0, -0),
            optsEnforcer
        ),
		restoration:gen_dummy(
            400061,
            "enforcer_6",
            Vector3(106, -181, 700.001),
            Rotation(0, 0, -0),
            optsEnforcerPJ
        ),
		restoration:gen_dummy(
            400062,
            "chavez_lieutenant",
            Vector3(-1549.617, 1427.445, 702.700),
            Rotation(172, 0, -0),
            optsLieutenant
        ),
		restoration:gen_dummy(
            400063,
            "enforcer_7",
            Vector3(-295, 465, -322.531),
            Rotation(0, 0, -0),
            optsEnforcer
        ),
		restoration:gen_missionscript(
            400064,
            "roof_access_blockade_random",
            Roof_access_block
        ),
		restoration:gen_toggleelement(
            400065,
            "disable_open_roof_access",
            disable_open_roof_access
        )
    }
}
