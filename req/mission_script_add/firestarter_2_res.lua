local fbi_ready_team = {
	"units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
	"units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2",
}
local opts_fbi_ready_team = {
	enabled = true,
	enemy = fbi_ready_team[1],
	enemy_table = fbi_ready_team,
	participate_to_group_ai = true,
	on_executed = {
		{ id = 400013, delay= 0 },
	},
}
local opts_hunt_so = {
	scan = true,
	SO_access = "128",
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_spawn_fbi_ready_team = {
	enabled = true,
	amount = 2,
	amount_random = 1,
	on_executed = {
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
		{ id = 400019, delay = 0 },
	},
}
local opts_trigger_fbi_ready_team_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400014, delay = 0 },
		{ id = 400016, delay = 0 },
	},
}
local opts_loop_fbi_ready_team_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400015, delay = 0, }
	}
}
local opts_fbi_ready_team_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400001, delay = 0 },
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400004, delay = 0 },
	},
}
local opts_fbi_ready_team_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
	},
}
local opts_fbi_ready_team_spawngroup_3 = {
	enabled = true,
	on_executed = {
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
	},
}

return  {
    elements = {
       -- FBI Ready Teams (spawnppoint_1)
        restoration:gen_dummy(400001, "fbi_ready_team_01", Vector3(-3400, 4900, 0), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400002, "fbi_ready_team_02", Vector3(-3400, 5000, 0), Rotation(-90 , 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400003, "fbi_ready_team_03", Vector3(-3300, 4900, 0), Rotation(-90 , 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400004, "fbi_ready_team_04", Vector3(-3300, 5000, 0), Rotation(-90 , 0, -0), opts_fbi_ready_team_agent),
        -- FBI Ready Teams (spawnnppoint_2)
        restoration:gen_dummy(400005, "fbi_ready_team_05", Vector3(4700, 4575 , 0), Rotation(-180, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400006, "fbi_ready_team_06", Vector3(4700, 4675, 0), Rotation(-180, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400007, "fbi_ready_team_07", Vector3(4700, 4775, 0), Rotation(-180, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400008, "fbi_ready_team_08", Vector3(4700, 4875, 0), Rotation(-180, 0, -0), opts_fbi_ready_team_agent),
        -- FBI Ready Teams (spawnppoint_3)
        restoration:gen_dummy(400009, "fbi_ready_team_09", Vector3(4800,-1700, 0), Rotation(0, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400010, "fbi_ready_team_10", Vector3(4800, 1600, 0), Rotation(0, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400011, "fbi_ready_team_11", Vector3(4800, 1500, 0), Rotation(0, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400012, "fbi_ready_team_12", Vector3(4800, 1300, -11.484), Rotation(0, 0, -0), opts_fbi_ready_team_agent),

		-- FBI Ready Teams Setup
		restoration:gen_so(400013, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),
		restoration:gen_element_random(400014, "spawn_fbi_ready_teams", opts_spawn_fbi_ready_team),
		restoration:gen_missionscript(400015, "trigger_fbi_ready_team_spawn", opts_trigger_fbi_ready_team_spawn),
		restoration:gen_missionscript(400016, "loop_fbi_ready_team_spawn", opts_loop_fbi_ready_team_spawn),


		restoration:gen_missionscript(400017, "fbi_ready_teams_spawngroup_1", opts_fbi_ready_team_spawngroup_1),
		restoration:gen_missionscript(400018, "fbi_ready_teams_spawngroup_2", opts_fbi_ready_team_spawngroup_2),
		restoration:gen_missionscript(400019, "fbi_ready_teams_spawngroup_3", opts_fbi_ready_team_spawngroup_3),
    }   
}    