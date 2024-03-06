local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local swat_shotgunner = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local pro_job = Global.game_settings and Global.game_settings.one_down
local overkill_above = difficulty >= 5
local hard_above = difficulty >= 3

	if difficulty == 6 then
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
	elseif difficulty == 7 then
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
	elseif difficulty == 8 then
		swat_shotgunner = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end

local optsSWAT_Heavy145 = {
    enemy = swat_shotgunner,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400014, delay = 1 }
	},
    enabled = true
}
local optsSWAT_Rooftop_1 = {
    enemy = swat_shotgunner,
	spawn_action = "e_sp_crh_to_std_rifle",
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400023, delay = 1 }
	},
    enabled = true
}
local optsSWAT_Rooftop_2 = {
    enemy = swat_shotgunner,
	spawn_action = "e_sp_crh_to_std_rifle",
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400024, delay = 1 }
	},
    enabled = true
}
local optsBulldozer = {
    enemy = tank,
	trigger_times = 3,
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
	path_style = "none",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_defend"
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
	trigger_times = 3,
	on_executed = { 
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
		{ id = 400019, delay = 0 }
	}
}
local spawn_cloakers = {
	enabled = hard_above,
	trigger_times = 3,
	on_executed = { 
		{ id = 400033, delay = 0 },
		{ id = 400034, delay = 0 },
		{ id = 400035, delay = 0 },
		{ id = 400036, delay = 0 }
	}
}
local spawn_rooftopSWAT = {
	on_executed = { 
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 }
	}
}
local spawn_SWATsquad = {
	on_executed = { 
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0.5 },
		{ id = 400030, delay = 1 },
		{ id = 400031, delay = 1.5 }
	}
}
local optsrespawn_swat_1 = {
	on_executed = { 
		{ id = 400021, delay = 45 }
	},
	elements = { 
		400021
	},
    event = "death"
}
local optsrespawn_swat_2 = {
	on_executed = { 
		{ id = 400022, delay = 45 },
	},
	elements = { 
		400022
	},
    event = "death"
}
local enable_cloakers = {
	elements = { 
		400037
	}
}
local disable_cloakers = {
	toggle = "off",
	elements = { 
		400037
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
        )
    }
}