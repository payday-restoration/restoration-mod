--Might actually rework this from the start
--When? Don't know honestly
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local tank = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local shield = "units/payday2/characters/ene_shield_2/ene_shield_2"
local bravo_1 = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"
local bravo_2 = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"
local bravo_3 = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"
local tank_bravo = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
local cop_1 = "units/payday2/characters/ene_cop_1/ene_cop_1"
local cop_2 = "units/payday2/characters/ene_cop_2/ene_cop_2"
local cop_3 = "units/payday2/characters/ene_cop_3/ene_cop_3"
local cop_4 = "units/payday2/characters/ene_cop_4/ene_cop_4"
local very_hard_above = difficulty >= 4
local overkill_above = difficulty >= 5
local death_sentence = difficulty == 8
local diff_scaling = 0.065 * difficulty
local diff_scaling_2 = 0.085 * difficulty
local enabled_chance_cloakers = math.random() < diff_scaling
local enabled_chance_cloakers_2 = math.random() < diff_scaling_2
local beat_cops_table = {cop_1, cop_1, cop_2, cop_2, cop_3, cop_3, cop_4}
local bravo_table = {bravo_1, bravo_1, bravo_2, bravo_3, bravo_2, bravo_2, bravo_3}

local optsBulldozer = {
    enemy = tank,
    on_executed = { 
		{ id = 400003, delay = 3 },
		{ id = 400048, delay = 0 },
	}
}
local optsBulldozer_2 = {
    enemy = tank,
    on_executed = { 
		{ id = 400003, delay = 3 },
		{ id = 400048, delay = 0 }
	}
}
local optsCloaker_1 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400009, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400010, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_3 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400011, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_4 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400012, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_5 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400013, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsTitanCloaker_1 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400016, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsTitanCloaker_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400017, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsHunt_SO = {
    SO_access = tostring(64+4096),
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsBravo_1 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
    on_executed = { 
		{ id = 400024, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_2 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
    on_executed = { 
		{ id = 400025, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_1 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_walk_left",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_2 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_fall_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_3 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_look_around",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_3 = {
    enemy_table = bravo_table,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_fall_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_dozer = {
    enemy = tank_bravo,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400026, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_dozer_bus_escape = {
    enemy = tank_bravo,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsShield_Defend_1 = {
    enemy = shield,
	spawn_action = "e_sp_climb_up_3m_down_1m",
	on_executed = { 
		{ id = 400038, delay = 8 } 
	},
    enabled = true
}
local optsShield_Defend_2 = {
    enemy = shield,
	spawn_action = "e_sp_climb_up_3m_down_1m",
	on_executed = { 
		{ id = 400039, delay = 8 } 
	},
    enabled = true
}
local optsShield_Defend_3 = {
    enemy = shield,
	spawn_action = "e_sp_climb_up_3m_down_1m",
	on_executed = { 
		{ id = 400040, delay = 8 } 
	},
    enabled = true
}
local optsCop = {
    enemy_table = beat_cops_table,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400003, delay = 0 } 
	},
    enabled = true
}
local optsDefend_and_Sniper_SO = {
	SO_access = tostring(128+2048+4096+8192),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_idle_by_container"
}
local optsCloaker_Hide_SO_2 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_sneak_wait_stand"
}
local spawn_bravo_eleavtor_escape = {
	enabled = true,
	on_executed = { 
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 }
	}
}
local spawn_bravo_bus_escape = {
	enabled = true,
	on_executed = { 
		{ id = 400027, delay = 0 },
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0 },
		{ id = 400030, delay = 0 },
		{ id = 400031, delay = 0 },
		{ id = 400032, delay = 0 },
		{ id = 400033, delay = 0 }
	}
}
local spawn_cloakers = {
	enabled = true,
	on_executed = { 
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 }
	}
}
local spawn_beat_cops = {
	enabled = true,
	on_executed = { 
		{ id = 400050, delay = 0 },
		{ id = 400051, delay = 0 },
		{ id = 400052, delay = 0 },
		{ id = 400053, delay = 0 },
		{ id = 400054, delay = 0 },
		{ id = 400055, delay = 0 },
		{ id = 400056, delay = 0 },
		{ id = 400057, delay = 0 },
		{ id = 400058, delay = 0 },
		{ id = 400059, delay = 0 },
		{ id = 400060, delay = 0 },
		{ id = 400061, delay = 0 },
		{ id = 400062, delay = 0 },
		{ id = 400063, delay = 0 },
		{ id = 400064, delay = 0 }
	}
}
local enable_bravos = {
	enabled = true,
	elements = { 
		400018,
		400042
	}
}
local disable_bravos = {
	enabled = true,
	toggle = "off",
	elements = { 
		400018,
		400042
	}
}
local disable_bo_dozers = {
	enabled = true,
	toggle = "off",
	elements = { 
		400001,
		400002,
		400046,
		400047
	}
}
local optsmanager_has_been_killed = {
	on_executed = { 
		{ id = 400044, delay = 0 },
		{ id = 400065, delay = 0 }
	},
	elements = { 
		101506
	},
    event = "death"
}
local enable_bo_dozers_the_sequel = {
	enabled = overkill_above,
	elements = { 
		400001,
		400002
	}
}
local enable_bo_dozers_ds = {
	enabled = death_sentence,
	elements = {
		400046,
		400047
	}
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_b",
	can_not_be_muted = true
}


return {
    elements = {
        -- Bulldozers that spawn after cops arrive (20 seconds after)
        restoration:gen_dummy(
            400001,
            "fwb_dozer_1",
            Vector3(3960, 2480, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer
        ),
        restoration:gen_dummy(
            400002,
            "fwb_dozer_2",
            Vector3(3911, -4422, -1021),
            Rotation(-90, 0, -0),
            optsBulldozer
        ),
        restoration:gen_so(
            400003,
            "hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsHunt_SO
        ),
		--Cloakers, spawn as ambush in vault hallway (similiar to First World Bank)
		restoration:gen_dummy(
            400004,
            "cloaker_1",
            Vector3(-2864, 746, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_1
        ),
		restoration:gen_dummy(
            400005,
            "cloaker_2",
            Vector3(-2864, -1449, -599),
            Rotation(0, 0, -0),
            optsCloaker_2
        ),
		restoration:gen_dummy(
            400006,
            "cloaker_3",
            Vector3(-2098, 416, -998),
            Rotation(-177, 0, -0),
            optsCloaker_3
        ),
		restoration:gen_dummy(
            400007,
            "cloaker_4",
            Vector3(-2135.105, 1124.028, -998),
            Rotation(90, -0, -0),
            optsCloaker_4
        ),
		restoration:gen_dummy(
            400008,
            "cloaker_5",
            Vector3(-2690, 1478, -599),
            Rotation(-180, -0, -0),
            optsCloaker_5
        ),
		restoration:gen_so(
            400009,
            "cloaker_hide_so_1",
            Vector3(-2830, 375, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400010,
            "cloaker_hide_so_2",
            Vector3(-2854, -1158, -597),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400011,
            "cloaker_hide_so_3",
            Vector3(-2104.004, 52.529, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400012,
            "cloaker_hide_so_4",
            Vector3(-2858.536, 1231.877, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400013,
            "cloaker_hide_so_5",
            Vector3(-2475, 1258, -599),
            Rotation(-180, 0, 0),
            optsCloaker_Hide_SO_1
        ),
		--C4 spawns (Pro Job only)
		restoration:gen_dummy(
            400014,
            "rouge_c4_1",
            Vector3(-4649, 1877, -599),
            Rotation(-90, -0, -0),
            optsTitanCloaker_1
        ),
		restoration:gen_dummy(
            400015,
            "rouge_c4_2",
            Vector3(-6634, 1349, -599),
            Rotation(-0, 0, -0),
            optsTitanCloaker_2
        ),
		restoration:gen_so(
            400016,
            "rouge_hide_so_1",
            Vector3(-4253.838, 1914.332, -598),
            Rotation(90, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400017,
            "rouge_hide_so_2",
            Vector3(-6642, 1505, -599),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		--Bravo waiting for you in Elevator/Bus Escape
		restoration:gen_missionscript(
            400018,
            "spawn_bravo_elevator",
            spawn_bravo_eleavtor_escape
        ),
		restoration:gen_missionscript(
            400019,
            "spawn_bravo_bus",
            spawn_bravo_bus_escape
        ),
		restoration:gen_toggleelement(
            400020,
            "enable_bravos",
            enable_bravos
        ),
		restoration:gen_dummy(
            400021,
            "bravo_elevator_1",
            Vector3(-1547, -434, -1479.426),
            Rotation(-90, 0, -0),
            optsBravo_1
        ),
		restoration:gen_dummy(
            400022,
            "bravo_elevator_2",
            Vector3(-1547, -312, -1479.426),
            Rotation(-90, 0, -0),
            optsBravo_2
        ),
		restoration:gen_dummy(
            400023,
            "bravo_elevator_3",
            Vector3(-1208, -499, -1479.426),
            Rotation(180, 0, -0),
            optsBravo_dozer
        ),
		restoration:gen_so(
            400024,
            "bravo_defend_so_1",
            Vector3(-1450, -458, -1479.426),
            Rotation(-131, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400025,
            "bravo_defend_so_2",
            Vector3(-1369.305, -365.171, -1479.426),
            Rotation(-131, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400026,
            "bravo_defend_so_3",
            Vector3(-1189, -485, -1479.426),
            Rotation(180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummy(
            400027,
            "bravo_bus_1",
            Vector3(-2264, -3668.836, -475),
            Rotation(-27, 0, -0),
            optsBravo_Bus_Escape_1
        ),
		restoration:gen_dummy(
            400028,
            "bravo_bus_2",
            Vector3(-2469.351, -3852.690, -475),
            Rotation(-10, 0, -0),
            optsBravo_Bus_Escape_2
        ),
		restoration:gen_dummy(
            400029,
            "bravo_bus_3",
            Vector3(-2635.076, -3674.971, -475),
            Rotation(-47, 0, -0),
            optsBravo_Bus_Escape_3
        ),
		restoration:gen_dummy(
            400030,
            "bravo_bus_4",
            Vector3(-2828.566, -3609.568, -475),
            Rotation(-96, 0, -0),
            optsBravo_Bus_Escape_2
        ),
		restoration:gen_dummy(
            400031,
            "bravo_bus_5",
            Vector3(-2623, -3900, -475),
            Rotation(-180, 0, -0),
            optsBravo_3
        ),
		restoration:gen_dummy(
            400032,
            "bravo_bus_6",
            Vector3(-2560.908, -3794.890, -475),
            Rotation(-12, 0, -0),
            optsBravo_dozer_bus_escape
        ),
		restoration:gen_dummy(
            400033,
            "bravo_bus_7",
            Vector3(-2766, -3829, -475),
            Rotation(0, 0, -0),
            optsBravo_Bus_Escape_1
        ),
		restoration:gen_toggleelement(
            400034,
            "disable_bravos",
            disable_bravos
        ),
		--Defend Shields
		restoration:gen_dummy(
            400035,
            "shield_heli_1",
            Vector3(3934, 2371, 225.990),
            Rotation(-180, 0, -0),
            optsShield_Defend_1
        ),
		restoration:gen_dummy(
            400036,
            "shield_heli_2",
            Vector3(3876, 2371, 225.990),
            Rotation(180, 0, -0),
            optsShield_Defend_2
        ),
		restoration:gen_dummy(
            400037,
            "shield_heli_3",
            Vector3(3813, 2371, 225.990),
            Rotation(180, 0, -0),
            optsShield_Defend_3
        ),
		restoration:gen_so(
            400038,
            "shield_defend_so_1",
            Vector3(3349, -819.660, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400039,
            "shield_defend_so_2",
            Vector3(3388.500, -888.076, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400040,
            "shield_defend_so_3",
            Vector3(3426, -953.028, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_missionscript(
            400042,
            "spawn_cloakers",
            spawn_cloakers
        ),
		restoration:gen_dummytrigger(
            400043,
            "manager_death",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsmanager_has_been_killed
        ),
		restoration:gen_toggleelement(
            400044,
            "enable_dozers",
            enable_bo_dozers_the_sequel
        ),
		restoration:gen_toggleelement(
            400045,
            "disable_dozers",
            disable_bo_dozers
        ),
		restoration:gen_dummy(
            400046,
            "fwb_dozer_3",
            Vector3(7498, -207, -1590.010),
            Rotation(180, 0, -0),
            optsBulldozer_2
        ),
        restoration:gen_dummy(
            400047,
            "fwb_dozer_4",
            Vector3(3874, 2469, -1200.010),
            Rotation(-90, 0, -0),
            optsBulldozer_2
        ),
		restoration:gen_dialogue(
            400048,
            "they_sending_dozers",
            Bain_senddozers
        ),
		restoration:gen_missionscript(
            400049,
            "spawn_the_cops",
            spawn_beat_cops
        ),
		restoration:gen_dummy(
            400050,
            "cop_1",
            Vector3(3897, 2546, -1197.510),
            Rotation(-90, 0, -0),
            optsCop
        ),
        restoration:gen_dummy(
            400051,
            "cop_2",
            Vector3(3853, 2546, -1197.510),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400052,
            "cop_3",
            Vector3(3816, 2546, -1197.510),
            Rotation(-90, 0, -0),
            optsCop
        ),
        restoration:gen_dummy(
            400053,
            "cop_4",
            Vector3(3771, 2469, -1200.010),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400054,
            "cop_5",
            Vector3(3732, 2546, -1197.510),
            Rotation(-90, 0, -0),
            optsCop
        ),
        restoration:gen_dummy(
            400055,
            "cop_6",
            Vector3(7456, -426, -1590.010),
            Rotation(-180, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400056,
            "cop_7",
            Vector3(7456, -376, -1590.010),
            Rotation(-180, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400057,
            "cop_8",
            Vector3(7456, -323, -1590.010),
            Rotation(-180, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400058,
            "cop_9",
            Vector3(7456, -277, -1590.010),
            Rotation(-180, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400059,
            "cop_10",
            Vector3(7456, -211, -1590.010),
            Rotation(-180, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400060,
            "cop_11",
            Vector3(4270, -4360, -1187.244),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400061,
            "cop_12",
            Vector3(4319, -4360, -1187.244),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400062,
            "cop_13",
            Vector3(4272, -4427, -1187.244),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400063,
            "cop_14",
            Vector3(4319, -4427, -1187.244),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_dummy(
            400064,
            "cop_15",
            Vector3(4272, -4491, -1187.244),
            Rotation(-90, 0, -0),
            optsCop
        ),
		restoration:gen_toggleelement(
            400065,
            "enable_dozers_ds",
            enable_bo_dozers_ds
        )
    }
}