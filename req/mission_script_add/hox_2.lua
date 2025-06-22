local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local fbi_ready_team_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
local fbi_ready_team_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
local fbi_ready_team_group_spawn_amount = 1

local opts_fbi_ready_team_agent = {
	enabled = true,
    enemy = fbi_ready_team_1,
    enemy_table = {fbi_ready_team_1, fbi_ready_team_2,},
    on_executed = {
        {id = 400057, delay= 0, },
    }
}
local opts_hunt_so = {
	scan = true,
	SO_access = tostring(128 + 4096),
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_spawn_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	amount = fbi_ready_team_group_spawn_amount,
	on_executed = {
		{ id = 400077, delay = 0, },
		{ id = 400078, delay = 0, },
	},
}
local opts_loop_fbi_ready_teams = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400054, delay = 0, delay_rand = 0, },
		{ id = 400055, delay = 10, delay_rand = 10, },
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
		{ id = 400008, delay = 0, },
		{ id = 400009, delay = 0, },
		{ id = 400010, delay = 0, },
        { id = 400014, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_3 = {
	enabled = true,
	on_executed = {
		{id = 400026, delay = 0, },
		{id = 400027, delay = 0, },
		{id = 400028, delay = 0, },
	},
}
local opts_fbi_ready_team_agent_spawn_group_4 = {
	enabled = true, 
	on_executed = {
		{id = 400020, delay = 0, },
		{id = 400025, delay = 0, },
		{id = 400024, delay = 0, },

	},
}

return {
    elements = {
        -- FBI Ready Teams
        restoration:gen_dummy(400001, "fbi_ready_team_agent_1", Vector3(43000, 300, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400002, "fbi_ready_team_agent_2", Vector3(43000, 400, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400003, "fbi_ready_team_agent_3", Vector3(43000, 500, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400004, "fbi_ready_team_agent_4", Vector3(43000, 600, -100), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
        restoration:gen_dummy(400008, "fbi_ready_team_agent_5", Vector3(43000, 300, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400009, "fbi_ready_team_agent_6", Vector3(43000, 400, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400010, "fbi_ready_team_agent_8", Vector3(43000, 500, -100), Rotation(180, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400014, "fbi_ready_team_agent_9", Vector3(43000, 600, -100), Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400026, "fbi_ready_team_agent_11", Vector3(-3300, 5900, -500),  Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400027, "fbi_ready_team_agent_11", Vector3(-3400, 5900, -500),  Rotation(0, 0, 0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400028, "fbi_ready_team_agent_12", Vector3(-3500, 5900, -500),  Rotation(0, 0 ,0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400020, "fbi_ready_team_agent_12", Vector3(-1900, 4100, 300.935),  Rotation(-91 ,0 ,0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400025, "fbi_ready_team_agent_13", Vector3(-1900, 4200, 300.935),  Rotation(-92 ,0 ,0), opts_fbi_ready_team_agent),
		restoration:gen_dummy(400024, "fbi_ready_team_agent_14", Vector3(-1900, 4300, 300.935),  Rotation(-92 ,0 ,0), opts_fbi_ready_team_agent),
        restoration:gen_element_random(400054, "spawn_fbi_ready_teams", opts_spawn_fbi_ready_teams),
		restoration:gen_missionscript(400055, "loop_fbi_ready_teams", opts_loop_fbi_ready_teams),
		restoration:gen_missionscript(400077, "fbi_ready_team_agent_spawn_group_1", opts_fbi_ready_team_agent_spawn_group_1),
		restoration:gen_missionscript(400078, "fbi_ready_team_agent_spawn_group_2", opts_fbi_ready_team_agent_spawn_group_2),
		restoration:gen_missionscript(400079, "fbi_ready_team_agent_spawn_group_3", opts_fbi_ready_team_agent_spawn_group_3),
		restoration:gen_missionscript(400029, "fbi_ready_team_agent_spawn_group_4", opts_fbi_ready_team_agent_spawn_group_4),
        restoration:gen_so(400057, "hunt_so", Vector3(3974, -2994, 540), Rotation(0, 0, 0), opts_hunt_so),
    }
}