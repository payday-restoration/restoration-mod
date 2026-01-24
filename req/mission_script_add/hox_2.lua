local pro_job = Global.game_settings and Global.game_settings.one_down 
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local death_wish_above = difficulty >= 7
local surprise_cloaker = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/payday2/characters/ene_spook_1/ene_spook_1")
local tank_skull =  ((difficulty >= 8) and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc" or "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")
local taser = ((difficulty >= 8) and "units/pd2_dlc_usm1/characters/ene_titan_taser/ene_titan_taser" or "units/payday2/characters/ene_tazer_1/ene_tazer_1")
local marshal_gunners_garage = "units/pd2_dlc_usm1/characters/ene_titan_rifle/ene_titan_rifle"
local fbi_ready_teams = {
	"units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
	"units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2",
}
local opts_fbi_ready_teams = {
	enabled = true,
	enemy = fbi_ready_teams[1],
	enemy_table = cops,
	participate_to_group_ai = true,
	on_executed = {
		{ id = 400018, delay= 0 },
	},
}
local opts_hunt_so = {
	scan = true,
	SO_access = "128",
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_trigger_fbi_ready_team_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400016, delay = 0 },
		{ id = 400017, delay = 0 },
	},
}
local opts_loop_fbi_ready_team_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400016, delay = 0, }
	}
}
local opts_beat_fbi_ready_team_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400001, delay = 0 },
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
	},
}
local opts_fbi__ready_team_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
	},
}
local opts_fbi_ready_team_spawngroup_3 = {
	enabled = true,
	on_executed = {
		{ id = 400009, delay = 0 },
		{ id = 4000010, delay = 0 },
	},
}
local opts_fbi_ready_team_spawngroup_4 = {
	enabled = true,
	on_executed = {
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
	},
}
local opts_fbi_ready_team_spawngroup_5 = {
	enabled = true,
	on_executed = {
		{ id = 400013, delay = 0 },
		{ id = 400014, delay = 0 },
	},
}
local opts_cloaker_surprise = {
	enemy = surprise_cloaker,
	enabled = false,
	on_executed = {
		{id = 400026, delay = 0,},
	},

}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_hide_under_car_enter"
}
local opts_surprise_dozer = {
	enemy = tank_skull,
	enabled = false,
	on_executed = {
		{id =  400028, delay = 0,},
	},
}
local opts_taser_stairs = {
	enabled = taser, 
	enabled = false, 
	on_executed = {
		{ id = 400034, delay = 0, }, 
	},
}
local optsDefend_SO = {
	SO_access = tostring(128 + 4096),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_taser_hide_SO = {
	SO_access = "8192",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
	so_action = "e_so_idle_by_container"
}
local opts_surprise_gunners_1 = {
	enemy = marshal_gunners_garage, 
	enabled = false, 
	on_executed = {
		{ id = 400031, delay = 0, },
	},
}
local opts_surprise_gunners_2 = {
	enemy = marshal_gunners_garage, 
	enabled = false, 
	on_executed = {
		{ id = 400032, delay = 0, },
	},
}
local opts_surprise_gunners_3 = {
	enemy = marshal_gunners_garage, 
	enabled = false, 
	on_executed = {
		{ id = 400036, delay = 0, },
	},
}
local opts_garage_ambush = {
	enabled =  death_wish_above,
	elements = { 400025, 400027, 400029, 400030, 400033, 400035 },
	toggle = "on",
}
return {
    elements = {
        -- FBI Ready Teams
        restoration:gen_dummy(400001, "fbi_ready_team_agent_1", Vector3(1125, -2500, 300), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400002, "fbi_ready_team_agent_2", Vector3(1000, -2550, 300), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400003, "fbi_ready_team_agent_3", Vector3(1025, -2500, 300), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),

		restoration:gen_dummy(400004, "fbi_ready_team_agent_4", Vector3(925, -2500, 300),  Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400005, "fbi_ready_team_agent_5", Vector3(825, -2500, 300), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400006, "fbi_ready_team_agent_6", Vector3(808, -2606, 300), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400007, "fbi_ready_team_agent_8", Vector3(-738, -2567, 300), Rotation(90, -0, -0), opts_fbi_ready_team_agent),

		restoration:gen_dummy(400008, "fbi_ready_team_agent_9", Vector3(-825, -2500, 300), 	  Rotation(90, -0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400009, "fbi_ready_team_agent_10", Vector3(-783, -2612, 300),  Rotation(90, -0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400010, "fbi_ready_team_agent_11", Vector3(-3400, 5900, -500),  Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400011, "fbi_ready_team_agent_12", Vector3(-925, -2500, 300),  Rotation(90, -0, -0), opts_fbi_ready_team_agent),

		restoration:gen_dummy(400012, "fbi_ready_team_agent_13", Vector3(-3300, 5900, -500),     Rotation(0, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400013, "fbi_ready_team_agent_14", Vector3(-3400, 5900, -500),  	Rotation(0, 0, -0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400014, "fbi_ready_team_agent_15", Vector3(-3500, 5900, -500),  	Rotation(0, 0, -0), opts_fbi_ready_team_agent),
		-- FBI Ready Teams Setup
		restoration:gen_element_random(400015, "spawn_beat_cops", opts_spawn_fbi_ready_team_cops),
		restoration:gen_missionscript(400016, "trigger_fbi_ready_team_spawn", opts_trigger_fbi_ready_team_spawn),
		restoration:gen_missionscript(400017, "loop_fbi_ready_team_spawn", opts_loop_fbi_ready_team_spawn),

        restoration:gen_so(400018, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),

		restoration:gen_missionscript(400019, "beat_cops_spawngroup_1", opts_fbi_ready_team_spawngroup_1),
		restoration:gen_missionscript(400020, "beat_cops_spawngroup_2", opts_fbi_ready_team_spawngroup_2),
		restoration:gen_missionscript(400021, "beat_cops_spawngroup_3", opts_fbi_ready_team_spawngroup_3),
		restoration:gen_missionscript(400022, "beat_cops_spawngroup_4", opts_fbi_ready_team_spawngroup_4),
		restoration:gen_missionscript(400023, "beat_cops_spawngroup_5", opts_fbi_ready_teams_spawngroup_5),
		-- Garage last minute line of defense 
		restoration:gen_toggleelement(400024, "enable_garage_ambush", opts_garage_ambush),
		-- cloaker 
		restoration:gen_dummy(400025, "cloaker_ambush", Vector3(55, 4363, -950), Rotation(16, -0, -0), opts_cloaker_surprise),
		restoration:gen_so(400026, "surprise_motherfucker", Vector3(-51, 4714, -950), Rotation(10, -0, -0), optsCloaker_Hide_SO_1),
		-- dozer 
		restoration:gen_dummy(400027, "surprise_dozer", Vector3(32, 4264, -950), Rotation(2, -0, -0), opts_surprise_dozer),
		restoration:gen_so(400028, "dozer_defend", Vector3(-129, 4532, -950), Rotation(20, -0, -0),  optsDefend_SO),
		-- gunners
		restoration:gen_dummy(400029, "marshal_gunner_1", Vector3(-298, 6516, -647.816), Rotation(-174, 0, 0), opts_surprise_gunners_1),
		restoration:gen_dummy(400030, "marshal_gunner_2", Vector3(-126, 6510, -649.486), Rotation(179, 0, 0), opts_surprise_gunners_2),
		restoration:gen_dummy(400035, "marshal_gunner_3", Vector3(46, 6522, -646.304),  Rotation(179, 0, 0), opts_surprise_gunners_3),
		restoration:gen_so(400031, "marshal_defend_1", Vector3(-299, 5296, -950), Rotation(-145 , 0 , 0), optsDefend_SO),
		restoration:gen_so(400032, "marshal_defend_2", Vector3(-83, 5293, -950), Rotation(-145  , 0 , 0), optsDefend_SO),
		restoration:gen_so(400036, "marshal_defend_3", Vector3(102, 5276, -950), Rotation(-145  , 0 , 0), optsDefend_SO), 
		-- the one useless taser cause why not 
		restoration:gen_dummy(400033, "taser_stair", Vector3(-1300, 4700, -900), Rotation(-73, 0, 0), opts_taser_stairs),
		restoration:gen_so(400034, "taser_sneaky_1", Vector3(-1300, 4700, -900), Rotation(0 , 0 , 0), opts_taser_hide_SO),

    },
}