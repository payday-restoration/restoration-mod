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
		"fbi", 
	},
	use_instigator = true,
	so_action = "AI_hunt",
}

local optsBesiegeDummy = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_armored_truck_1st",
}
local optsOpenSwatVanDoors_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 105577, notify_unit_sequence = "anim_door_right_open", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 105577, notify_unit_sequence = "anim_door_left_open", time = 0 },
	},
}
local optsspawnvanSWATs_1 = {
	on_executed = {
		{ id = 400007, delay = 0 },
		{ id = 400006, delay = 0 },
	},
	enabled = true,
}
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}
local opts_beat_cops = {
	enabled = true,
	enemy = cops[1],
	enemy_table = cops,
	participate_to_group_ai = true,
	on_executed = {
		{ id = 400011, delay= 0 },
	},
}
local opts_spawn_beat_cops = {
	enabled = true,
	amount = 2,
	amount_random = 0,
	on_executed = {
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
	},
}
local opts_trigger_cop_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400008, delay = 0 },
		{ id = 400010, delay = 0 },
	},
}
local opts_loop_cop_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400009, delay = 0, }
	}
}
local opts_beat_cops_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
		{ id = 400016, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
		{ id = 400019, delay = 0 },
	},
}

return {
	elements = {
		-- swat van
		restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(1567.972, 871.511, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
		restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(1479.193, 865.163, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
		restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(1472.636, 958.934, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
		restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(1560.422, 965.073, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),

		restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
		restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_1),
		restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),
		-- Beat Cops setup
		restoration:gen_element_random(400008, "spawn_beat_cops", opts_spawn_beat_cops),
		restoration:gen_missionscript(400009, "trigger_cop_spawn", opts_trigger_cop_spawn),
		restoration:gen_missionscript(400010, "loop_cop_spawn", opts_loop_cop_spawn),
		restoration:gen_so(400011, "hunt_so", Vector3(-700, 1000, 0), Rotation(0, 0, 0), opts_hunt_so),

		restoration:gen_missionscript(400012, "beat_cops_spawngroup_1", opts_beat_cops_spawngroup_1),
		restoration:gen_missionscript(400013, "beat_cops_spawngroup_2", opts_beat_cops_spawngroup_2),
		-- Beat Cops 
		restoration:gen_dummy(400014, "cop_1",  Vector3(3190.61, 3719.75, -69.057), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400015, "cop_2",  Vector3(3121.75, 3818.38, -77.111), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400016, "cop_3",  Vector3(3040.18, 3718.1, -79.937), Rotation(0, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400017, "cop_4",  Vector3(-615.356, 3216.9, -36.04), Rotation(-85, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400018, "cop_5",  Vector3(-578.956, 3304.55, -33.01), Rotation(-93, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400019, "cop_6",  Vector3(-613.822, 3386.76, -31.211), Rotation(-97, 0, -0), opts_beat_cops),

	},
}
