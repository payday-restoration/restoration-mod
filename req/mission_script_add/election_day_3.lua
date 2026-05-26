local cops = {
	"units/payday2/characters/ene_cop_1/ene_cop_1",
	"units/payday2/characters/ene_cop_2/ene_cop_2",
	"units/payday2/characters/ene_cop_3/ene_cop_3",
	"units/payday2/characters/ene_cop_4/ene_cop_4",
}

local opts_hunt_so = {
	scan = true,
	SO_access = {
		"cop",
		"fbi", -- Beat cops in Res have "fbi" access
	},
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_beat_cops = {
	enabled = true,
	enemy = cops[1],
	enemy_table = cops,
	participate_to_group_ai = true,
	on_executed = {
		{ id = 400004, delay= 0 },
	},
}
local opts_beat_cops_climb_over_2m = clone(opts_beat_cops)
opts_beat_cops_climb_over_2m.spawn_action = "e_sp_climb_over_2m"
local opts_spawn_beat_cops = {
	enabled = true,
	amount = 2,
	amount_random = 1,
	on_executed = {
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
	},
}
local opts_trigger_cop_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400001, delay = 0 },
		{ id = 400003, delay = 0 },
	},
}
local opts_loop_cop_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400002, delay = 0, }
	}
}
local opts_beat_cops_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400016, delay = 0 },
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_3 = {
	enabled = true,
	on_executed = {
		{ id = 400019, delay = 0 },
		{ id = 400020, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_4 = {
	enabled = true,
	on_executed = {
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_5 = {
	enabled = true,
	on_executed = {
		{ id = 400024, delay = 0 },
		{ id = 400025, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_6 = {
	enabled = true,
	on_executed = {
		{ id = 400026, delay = 0 },
		{ id = 400027, delay = 0 },
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0 },
	},
}

return {
	elements = {
		-- Beat cop swarm setup
		restoration:gen_element_random(400001, "spawn_beat_cops", opts_spawn_beat_cops),
		restoration:gen_missionscript(400002, "trigger_cop_spawn", opts_trigger_cop_spawn),
		restoration:gen_missionscript(400003, "loop_cop_spawn", opts_loop_cop_spawn),
		restoration:gen_so(400004, "hunt_so", Vector3(-700, 1000, 0), Rotation(0, 0, 0), opts_hunt_so),

		restoration:gen_missionscript(400005, "beat_cops_spawngroup_1", opts_beat_cops_spawngroup_1),
		restoration:gen_missionscript(400006, "beat_cops_spawngroup_2", opts_beat_cops_spawngroup_2),
		restoration:gen_missionscript(400007, "beat_cops_spawngroup_3", opts_beat_cops_spawngroup_3),
		restoration:gen_missionscript(400008, "beat_cops_spawngroup_4", opts_beat_cops_spawngroup_4),
		restoration:gen_missionscript(400009, "beat_cops_spawngroup_5", opts_beat_cops_spawngroup_5),
		restoration:gen_missionscript(400010, "beat_cops_spawngroup_6", opts_beat_cops_spawngroup_6),
		-- Beat cops 
		restoration:gen_dummy(400011, "cop_1", Vector3(-4300, 6700, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400012, "cop_2", Vector3(-4300, 6650, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400013, "cop_3", Vector3(-4300, 6600, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400014, "cop_4", Vector3(-4300, 6550, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400015, "cop_5", Vector3(-4300, 6500, 300), Rotation(180, 0, 0), opts_beat_cops),

		restoration:gen_dummy(400016, "cop_6", Vector3(3600, 600, 0), Rotation(0, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400017, "cop_7", Vector3(3600, 650, 0), Rotation(0, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400018, "cop_8", Vector3(3600, 700, 0), Rotation(0, 0, 0), opts_beat_cops),

		restoration:gen_dummy(400019, "cop_9", Vector3(1400, -8450, 0), Rotation(90, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400020, "cop_10", Vector3(1450, -8450, 0), Rotation(90, 0, 0), opts_beat_cops),

		restoration:gen_dummy(400021, "cop_11", Vector3(-1450, -8260, 0), Rotation(0, 0, 0), opts_beat_cops_climb_over_2m),
		restoration:gen_dummy(400022, "cop_12", Vector3(-1500, -8260, 0), Rotation(0, 0, 0), opts_beat_cops_climb_over_2m),
		restoration:gen_dummy(400023, "cop_13", Vector3(-1550, -8260, 0), Rotation(0, 0, 0), opts_beat_cops_climb_over_2m),

		restoration:gen_dummy(400024, "cop_14", Vector3(300, -8500, 0), Rotation(-90, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400025, "cop_15", Vector3(250, -8500, 0), Rotation(-90, 0, 0), opts_beat_cops),

		restoration:gen_dummy(400026, "cop_16", Vector3(750, 6650, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400027, "cop_17", Vector3(800, 6650, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400028, "cop_18", Vector3(800, 6600, 300), Rotation(180, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400029, "cop_19", Vector3(750, 6600, 300), Rotation(180, 0, 0), opts_beat_cops),
	},
}
