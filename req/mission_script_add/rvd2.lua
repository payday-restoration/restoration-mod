local fbi_ready_team_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
local fbi_ready_team_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
local fbi_ready_team_group_spawn_amount = 1

local opts_fbi_ready_team_agent = {
	enabled = true,
    enemy = fbi_ready_team_1, fbi_ready_team_2
    enemy_table = {fbi_ready_team_1, fbi_ready_team_2,},
    on_executed = {
        {id = 400013, delay= 0, },
    }
}
local opts_hunt_so = {
	scan = true,
	SO_access = "128",
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_spawn_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	amount = fbi_ready_team_group_spawn_amount,
	on_executed = {
		{ id = 400014, delay = 0, },
		{ id = 400015, delay = 0, },
		{ id = 400016, delay = 0, },
	},
}
local opts_loop_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400017, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_1 = {
	enabled = true,
	on_executed = {
		{ id = 400001, delay = 0, },
		{ id = 400002, delay = 0, },
		{ id = 400003, delay = 0, },
        { id = 400004, delay = 0,},
	},
}
local opts_fbi_ready_team_agent_spawn_group_2 = {
	enabled = true,
	on_executed = {
		{ id = 400005, delay = 0, },
		{ id = 400006, delay = 0, },
		{ id = 400007, delay = 0, },
        { id = 400008, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_3 = {
	enabled = true,
	on_executed = {
		{id = 400009, delay = 0, },
		{id = 400010, delay = 0, },
		{id = 400011, delay = 0, },
        {id = 400012, delay = 0, },
	},
}
return  {
    elements = {
        -- FBI Ready Team setup
        restoration:gen_missionscript(400014, "fbi_ready_team_agent_spawn_group_1", opts_fbi_ready_team_agent_spawn_group_1),
		restoration:gen_missionscript(400015, "fbi_ready_team_agent_spawn_group_2", opts_fbi_ready_team_agent_spawn_group_2),
		restoration:gen_missionscript(400016, "fbi_ready_team_agent_spawn_group_3", opts_fbi_ready_team_agent_spawn_group_3),
        restoration:gen_so(400013, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),
        restoration:gen_element_random(400017, "spawn_fbi_ready_teams", opts_spawn_fbi_ready_teams),
        restoration:gen_missionscript(400018, "loop_fbi_ready_teams", opts_loop_fbi_ready_teams),
        -- FBI Ready Teams (spawnppoint_1)
        restoration:gen_dummy(400001, "fbi_ready_team_01", Vector3(-800, 6800, 0), Rotation(-101, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400002, "fbi_ready_team_02", Vector3(-900, 6700, 0), Rotation(-90, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400003, "fbi_ready_team_03", Vector3(-800, 6700, 0), Rotation(-88, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400004, "fbi_ready_team_04", Vector3(-700, 6700, 0), Rotation(-85, 0, -0), opts_fbi_ready_team_agent),
        -- FBI Ready Teams (spawnnppoint_2)
        restoration:gen_dummy(400005, "fbi_ready_team_05", Vector3(-3200, -900, 0), Rotation(-91, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400006, "fbi_ready_team_06", Vector3(-3200, -800, 0), Rotation(-96, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400007, "fbi_ready_team_07", Vector3(-3100.015, -901.745, 0), Rotation(-91, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400008, "fbi_ready_team_08", Vector3(-3200, -800, 0), Rotation(-91, 0, -0), opts_fbi_ready_team_agent),
        -- FBI Ready Teams (spawnppoint_3)
        restoration:gen_dummy(400009, "fbi_ready_team_09", Vector3(2100, -3200, 0), Rotation(69, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400010, "fbi_ready_team_10", Vector3(2100, -3100, 0), Rotation(94, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400011, "fbi_ready_team_11", Vector3(2200, -3200, 0), Rotation(87, 0, -0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400012, "fbi_ready_team_12", Vector3(2200, -3100, 0), Rotation(91, 0, -0), opts_fbi_ready_team_agent),
    }
}