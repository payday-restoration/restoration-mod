local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
local fbi_ready_team_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
local fbi_ready_team_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
local fbi_ready_team_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local tank = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
local deathwish_above = difficulty >= 7

local optsSniper_1 = {
	enemy = sniper,
	on_executed = { { id = 400007, delay = 0 } },
	enabled = true
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = { { id = 400008, delay = 0 } },
	enabled = true
}
local optsSniper_3 = {
	enemy = sniper,
	on_executed = { { id = 400009, delay = 0 } },
	enabled = true
}
local optsSniper_4 = {
	enemy = sniper,
	on_executed = { { id = 400010, delay = 0 } },
	enabled = true
}
local optsSniper_5 = {
	enemy = sniper,
	on_executed = { { id = 400011, delay = 0 } },
	enabled = true
}
local optsSniper_6 = {
	enemy = sniper,
	on_executed = { { id = 400012, delay = 0 } },
	enabled = true
}
local optsGroundSniper_1 = {
	enemy = sniper,
	on_executed = { { id = 400025, delay = 0 } },
	enabled = true
}
local optsGroundSniper_2 = {
	enemy = sniper,
	on_executed = { { id = 400029, delay = 0 } },
	enabled = true
}
local optsFBIAgent_1 = {
	enemy = fbi_ready_team_1,
	participate_to_group_ai = true,
	on_executed = { { id = 400057, delay = 0 } },
	enabled = true
}
local optsFBIAgent_2 = {
	enemy = fbi_ready_team_2,
	participate_to_group_ai = true,
	on_executed = { { id = 400057, delay = 0 } },
	enabled = true
}
local optsFBIAgent_3 = {
	enemy = fbi_ready_team_dozer,
	trigger_times = 1,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400057, delay = 0 },
		{ id = 400060, delay = 0 }
	},
	enabled = deathwish_above
}
local optsDozer = {
	enemy = tank,
	on_executed = { 
		{ id = 400060, delay = 0 },
		{ id = 400057, delay = 3 }
	},
	enabled = true
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper"
}
local optsHunt_SO = {
	scan = true,
	SO_access = tostring(128+4096),
	interval = 2,
	so_action = "AI_hunt"
}
local optsgroundSniper_SO_1_1 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400026, delay = 15 }
	}
}
local optsgroundSniper_SO_1_2 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper",
	on_executed = { 
		{ id = 400027, delay = 15 }
	}
}
local optsgroundSniper_SO_1_3 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400028, delay = 15 }
	}
}
local optsgroundSniper_SO_1_4 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400025, delay = 15 }
	}
}
local optsgroundSniper_SO_2_1 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400030, delay = 15 }
	}
}
local optsgroundSniper_SO_2_2 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper",
	on_executed = { 
		{ id = 400031, delay = 15 }
	}
}
local optsgroundSniper_SO_2_3 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400032, delay = 15 }
	}
}
local optsgroundSniper_SO_2_4 = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
	on_executed = { 
		{ id = 400029, delay = 15 }
	}
}
local spawnSnipers_1 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400001, delay = 4 },
		{ id = 400002, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local spawnSnipers_2 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400003, delay = 4 },
		{ id = 400004, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local spawnSnipers_3 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400005, delay = 4 },
		{ id = 400006, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local spawnGroundSnipers = {
	enabled = true,
	on_executed = { 
		{ id = 400023, delay = 0 },
		{ id = 400024, delay = 0 }
	}
}
local spawnFBI_Agents = {
	enabled = true,
	trigger_times = 3,
	on_executed = { 
		{ id = 400035, delay = 0 },
		{ id = 400036, delay = 0 },
		{ id = 400037, delay = 0 },
		{ id = 400038, delay = 0 },
		{ id = 400039, delay = 0 },
		{ id = 400040, delay = 0 },
		{ id = 400041, delay = 0 },
		{ id = 400042, delay = 0 },
		{ id = 400043, delay = 0 },
		{ id = 400044, delay = 0 },
		{ id = 400045, delay = 0 },
		{ id = 400046, delay = 0 },
		{ id = 400047, delay = 0 },
		{ id = 400048, delay = 0 },
		{ id = 400049, delay = 0 },
		{ id = 400050, delay = 0 },
		{ id = 400051, delay = 0 },
		{ id = 400052, delay = 0 },
		{ id = 400053, delay = 0 },
		{ id = 400055, delay = 0 }
	}
}
local loopFBIAgents = {
	enabled = true,
	on_executed = { 
		{ id = 400054, delay = 80 }
	}
}
local Bain_sendsnipers = {
	dialogue = "play_pln_gen_snip_01",
	trigger_times = 1,
	can_not_be_muted = true
}
local optsrespawn_sniper_1 = {
	on_executed = { 
		{ id = 400001, delay = 30 }
	},
	elements = { 
		400001
	},
	event = "death"
}
local optsrespawn_sniper_2 = {
	on_executed = { 
		{ id = 400002, delay = 30 }
	},
	elements = { 
		400002
	},
    event = "death"
}
local optsrespawn_sniper_3 = {
	on_executed = { 
		{ id = 400003, delay = 30 }
	},
	elements = { 
		400003
	},
	event = "death"
}
local optsrespawn_sniper_4 = {
	on_executed = { 
		{ id = 400004, delay = 30 }
	},
	elements = { 
		400004
	},
	event = "death"
}
local optsrespawn_sniper_5 = {
	on_executed = { 
		{ id = 400005, delay = 30 }
	},
	elements = { 
		400005
	},
	event = "death"
}
local optsrespawn_sniper_6 = {
	on_executed = { 
		{ id = 400006, delay = 30 }
	},
	elements = { 
		400006
	},
	event = "death"
}
local optsrespawn_ground_sniper_1 = {
	on_executed = { 
		{ id = 400023, delay = 30 }
	},
	elements = { 
		400023
	},
	event = "death"
}
local optsrespawn_ground_sniper_2 = {
	on_executed = { 
		{ id = 400024, delay = 30 }
	},
	elements = { 
		400024
	},
	event = "death"
}
local optsrespawn_tank = {
	on_executed = { 
		{ id = 400058, delay = 150 }
	},
	elements = { 
		400058
	},
	event = "death"
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_a",
	can_not_be_muted = true
}

return {
    elements = {
        --Snipers
		restoration:gen_dummy(
            400001,
            "sniper_1",
            Vector3(3385, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400002,
            "sniper_2",
            Vector3(3285, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400003,
            "sniper_3",
            Vector3(4202, 4376, 540.404),
            Rotation(90, -0, -0),
            optsSniper_3
        ),
		restoration:gen_dummy(
            400004,
            "sniper_4",
            Vector3(4133, 4368, 540.404),
            Rotation(90, -0, -0),
            optsSniper_4
        ),
		restoration:gen_dummy(
            400005,
            "sniper_5",
            Vector3(5936, 405, 540.404),
            Rotation(0, 0, -0),
            optsSniper_5
        ),
		restoration:gen_dummy(
            400006,
            "sniper_6",
            Vector3(5936, 500, 540.404),
            Rotation(0, 0, -0),
            optsSniper_6
        ),
		restoration:gen_so(
            400007,
            "sniper_so_1",
            Vector3(3974, -2994, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400008,
            "sniper_so_2",
            Vector3(4132, -2997, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400009,
            "sniper_so_3",
            Vector3(3509, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400010,
            "sniper_so_4",
            Vector3(3701, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400011,
            "sniper_so_5",
            Vector3(5643, 1060, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400012,
            "sniper_so_6",
            Vector3(5643, 929, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		--Mission Scripts
		restoration:gen_missionscript(
            400013,
            "spawn_snipers_1",
            spawnSnipers_1
        ),
		restoration:gen_missionscript(
            400014,
            "spawn_snipers_2",
            spawnSnipers_2
        ),
		restoration:gen_missionscript(
            400015,
            "spawn_snipers_3",
            spawnSnipers_3
        ),
		restoration:gen_dummytrigger(
            400016,
            "respawn_sniper_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_1
        ),
		restoration:gen_dummytrigger(
            400017,
            "respawn_sniper_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_2
        ),
		restoration:gen_dummytrigger(
            400018,
            "respawn_sniper_3",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_3
        ),
		restoration:gen_dummytrigger(
            400019,
            "respawn_sniper_4",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_4
        ),
		restoration:gen_dummytrigger(
            400020,
            "respawn_sniper_5",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_5
        ),
		restoration:gen_dummytrigger(
            400021,
            "respawn_sniper_6",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_6
        ),
		restoration:gen_dialogue(
            400022,
            "they_sending_snipers",
            Bain_sendsnipers
        ),
		--Ground Snipers
		restoration:gen_dummy(
            400023,
            "ground_sniper_1",
            Vector3(-2983, 193, 0),
            Rotation(0, 0, -0),
            optsGroundSniper_1
        ),
		restoration:gen_dummy(
            400024,
            "ground_sniper_2",
            Vector3(-2559, -2495, 0),
            Rotation(-90, 0, -0),
            optsGroundSniper_2
        ),
		restoration:gen_so(
            400025,
            "ground_sniper_loop_1_1",
            Vector3(-2189, 1500, -0),
            Rotation(-90, 0, -0),
            optsgroundSniper_SO_1_1
        ),
		restoration:gen_so(
            400026,
            "ground_sniper_loop_1_2",
            Vector3(-1024.726, 3595.228, 0),
            Rotation(-130, 0, -0),
            optsgroundSniper_SO_1_2
        ),
		restoration:gen_so(
            400027,
            "ground_sniper_loop_1_3",
            Vector3(617, 1198, 0),
            Rotation(-80, 0, -0),
            optsgroundSniper_SO_1_3
        ),
		restoration:gen_so(
            400028,
            "ground_sniper_loop_1_4",
            Vector3(-186, -1162, 0),
            Rotation(-90, 0, -0),
            optsgroundSniper_SO_1_4
        ),
		restoration:gen_so(
            400029,
            "ground_sniper_loop_2_1",
            Vector3(413, -1575, 0),
            Rotation(-90, 0, -0),
            optsgroundSniper_SO_2_1
        ),
		restoration:gen_so(
            400030,
            "ground_sniper_loop_2_2",
            Vector3(1096, -1170, 0),
            Rotation(-104, 0, -0),
            optsgroundSniper_SO_2_2
        ),
		restoration:gen_so(
            400031,
            "ground_sniper_loop_2_3",
            Vector3(1476, 656, -0),
            Rotation(-55, 0, -0),
            optsgroundSniper_SO_2_3
        ),
		restoration:gen_so(
            400032,
            "ground_sniper_loop_2_4",
            Vector3(-465, 1287, -0),
            Rotation(-90, 0, -0),
            optsgroundSniper_SO_2_4
        ),
		restoration:gen_dummytrigger(
            400033,
            "respawn_ground_sniper_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_ground_sniper_1
        ),
		restoration:gen_dummytrigger(
            400034,
            "respawn_ground_sniper_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_ground_sniper_2
        ),
		--FBI Ready Team
		restoration:gen_dummy(
            400035,
            "fbi_team_1",
            Vector3(-2974, 6585, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400036,
            "fbi_team_2",
            Vector3(-2973.040, 6639.992, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400037,
            "fbi_team_3",
            Vector3(-2971.906, 6704.982, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400038,
            "fbi_team_4",
            Vector3(-2970.963, 6758.974, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400039,
            "fbi_team_5",
            Vector3(-2970.021, 6812.965, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400040,
            "fbi_team_6",
            Vector3(-2969.235, 6857.958, 0),
            Rotation(180, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400041,
            "fbi_team_7",
            Vector3(-2970, -70, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400042,
            "fbi_team_8",
            Vector3(-2970, -144, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400043,
            "fbi_team_9",
            Vector3(-2970, -219, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400044,
            "fbi_team_10",
            Vector3(-2970, -297, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400045,
            "fbi_team_11",
            Vector3(-2970, -359, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400046,
            "fbi_team_12",
            Vector3(-2970, -419, -0),
            Rotation(0, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400047,
            "fbi_team_13",
            Vector3(-2446, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400048,
            "fbi_team_14",
            Vector3(-2383, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400049,
            "fbi_team_15",
            Vector3(-2314, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400050,
            "fbi_team_16",
            Vector3(-2248, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400051,
            "fbi_team_17",
            Vector3(-2162, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_2
        ),
		restoration:gen_dummy(
            400052,
            "fbi_team_18",
            Vector3(-2075, -2502, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_1
        ),
		restoration:gen_dummy(
            400053,
            "fbi_team_tank",
            Vector3(-2348, -2573, 0),
            Rotation(-90, 0, -0),
            optsFBIAgent_3
        ),
		restoration:gen_missionscript(
            400054,
            "spawn_agents",
            spawnFBI_Agents
        ),
		restoration:gen_missionscript(
            400055,
            "loop",
            loopFBIAgents
        ),
		restoration:gen_missionscript(
            400056,
            "spawn_ground_snipers",
            spawnGroundSnipers
        ),
		restoration:gen_so(
            400057,
            "hunt_so",
            Vector3(3974, -2994, 540.404),
            Rotation(0, 0, -0),
            optsHunt_SO
        ),
		restoration:gen_dummy(
            400058,
            "bulldozer",
            Vector3(-2961, 3277, -0),
            Rotation(180, 0, -0),
            optsDozer
        ),
		restoration:gen_dummytrigger(
            400059,
            "respawn_tank",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_tank
        ),
		restoration:gen_dialogue(
            400060,
            "they_sending_dozers",
            Bain_senddozers
        )
    }
}
