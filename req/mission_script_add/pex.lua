local cops = {
	"units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
	"units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
	"units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
	"units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
}

local optsBesiegeDummy = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_armored_truck_1st",
}
local optsspawnvanSWATs_1 = {
	on_executed = {
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_2 = {
	on_executed = {
		{ id = 400013, delay = 0 },
		{ id = 400014, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_3 = {
	on_executed = {
		{ id = 400020, delay = 0 },
		{ id = 400021, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_4 = {
	on_executed = {
		{ id = 400027, delay = 0 },
		{ id = 400028, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_5 = {
	on_executed = {
		{ id = 400034, delay = 0 },
		{ id = 400035, delay = 0 },
	},
	enabled = true,
}
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}

local optsOpenSwatVanDoors_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102206, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 101645, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_3 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102207, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_4 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102208, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_5 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102209, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
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
		{ id = 400039, delay= 0 },
	},
}
local opts_spawn_beat_cops = {
	enabled = true,
	amount = 4,
	amount_random = 0,
	on_executed = {
		{ id = 400039, delay = 0 },
		{ id = 400040, delay = 0 },
		{ id = 400041, delay = 0 },
		{ id = 400042, delay = 0 },
		{ id = 400043, delay = 0 },
	},
}
local opts_trigger_cop_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400036, delay = 0 },
		{ id = 400038, delay = 0 },
	},
}
local opts_loop_cop_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400037, delay = 0, }
	}
}
local opts_beat_cops_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400046, delay = 0 },
		{ id = 400047, delay = 0 },
		{ id = 400048, delay = 0 },
		{ id = 400049, delay = 0 },
		{ id = 400050, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400051, delay = 0 },
		{ id = 400052, delay = 0 },
		{ id = 400053, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_3 = {
	enabled = true,
	on_executed = {
		{ id = 400054, delay = 0 },
		{ id = 400055, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_4 = {
	enabled = true,
	on_executed = {
		{ id = 400056, delay = 0 },
		{ id = 400057, delay = 0 },
		{ id = 400058, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_5 = {
	enabled = true,
	on_executed = {
		{ id = 400059, delay = 0 },
		{ id = 400060, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_6 = {
	enabled = true,
	on_executed = {
		{ id = 400062, delay = 0 },
		{ id = 400063, delay = 0 },
		{ id = 400064, delay = 0 },
		{ id = 400065, delay = 0 },
	},
}
return {
    elements = {

        -- swat van 1

        restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(4100, -1800, 0), Rotation(5, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(4025, -1800, 0), Rotation(5, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(4025, -1750, 0), Rotation(5, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(4100, -1750, 0), Rotation(5, 0, 0), optsBesiegeDummy),

        restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
        restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_1),
        restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),

        -- swat van 2

        restoration:gen_dummy(400007, "swat_van_spawn_5", Vector3(2925, -50, 0), Rotation(20, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400008, "swat_van_spawn_6", Vector3(2850, -75, 0), Rotation(20, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400009, "swat_van_spawn_7", Vector3(2825, 0, 0), Rotation(20, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400010, "swat_van_spawn_8", Vector3(2900, 25, 0), Rotation(20, 0, 0), optsBesiegeDummy),

        restoration:gen_missionscript(400012, "spawn_swats_2", optsspawnvanSWATs_2),
        restoration:objecteditor(400013, "open_swat_doors_2", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
        restoration:gen_spawngroup(400014, "swat_group_2", { 400007, 400008, 400009, 400010 }, 0, opts_swat_group),

        -- swat van 3

        restoration:gen_dummy(400015, "swat_van_spawn_9",  Vector3(3450, -3700, 0), Rotation(-135, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400016, "swat_van_spawn_10", Vector3(3400, -3750, 0), Rotation(-135, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400017, "swat_van_spawn_11", Vector3(3350, -3700, 0), Rotation(-135, 0, 0), Rotation(160, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400018, "swat_van_spawn_12", Vector3(3400, -3650, 0), Rotation(-135, 0, 0), optsBesiegeDummy),

        restoration:gen_missionscript(400019, "spawn_swats_3", optsspawnvanSWATs_3),
        restoration:objecteditor(400020, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_3),
        restoration:gen_spawngroup(400021, "swat_group_3", { 400015, 400016, 400017, 400018 }, 0, opts_swat_group),

		-- swat van 4

        restoration:gen_dummy(400022, "swat_van_spawn_9",  Vector3(-3416.319, -2584.237, -24.871), Rotation(136, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400023, "swat_van_spawn_10", Vector3(-3364.526, -2634.252, -24.871), Rotation(136, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400024, "swat_van_spawn_11", Vector3(-3455.914, -2625.239, -24.871), Rotation(136, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400025, "swat_van_spawn_12", Vector3(-3403.402, -2675.949, -24.871), Rotation(136, 0, 0), optsBesiegeDummy),

        restoration:gen_missionscript(400026, "spawn_swats_4", optsspawnvanSWATs_4),
        restoration:objecteditor(400027, "open_swat_doors_4", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_4),
        restoration:gen_spawngroup(400028, "swat_group_4", { 400022, 400023, 400024, 400025 }, 0, opts_swat_group),

		-- swat van 5
        restoration:gen_dummy(400029, "swat_van_spawn_9",  Vector3(-4324, -3326, -24.871), Rotation(0, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400030, "swat_van_spawn_10", Vector3(-4388, -3324, -24.871), Rotation(0, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400031, "swat_van_spawn_11", Vector3(-4327, -3258, -24.871), Rotation(0, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400032, "swat_van_spawn_12", Vector3(-4388, -3258, -24.871), Rotation(0, 0, 0), optsBesiegeDummy),

        restoration:gen_missionscript(400033, "spawn_swats_5", optsspawnvanSWATs_5),
        restoration:objecteditor(400034, "open_swat_doors_5", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_5),
        restoration:gen_spawngroup(400035, "swat_group_5", { 400029, 400030, 400031, 400032 }, 0, opts_swat_group),

		-- Beat cop swarm setup
		restoration:gen_element_random(400036, "spawn_beat_cops", opts_spawn_beat_cops),
		restoration:gen_missionscript(400037, "trigger_cop_spawn", opts_trigger_cop_spawn),
		restoration:gen_missionscript(400038, "loop_cop_spawn", opts_loop_cop_spawn),
		restoration:gen_so(400039, "hunt_so", Vector3(-700, 1000, 0), Rotation(0, 0, 0), opts_hunt_so),

		restoration:gen_missionscript(400040, "beat_cops_spawngroup_1", opts_beat_cops_spawngroup_1),
		restoration:gen_missionscript(400041, "beat_cops_spawngroup_2", opts_beat_cops_spawngroup_2),
		restoration:gen_missionscript(400042, "beat_cops_spawngroup_3", opts_beat_cops_spawngroup_3),
		restoration:gen_missionscript(400043, "beat_cops_spawngroup_4", opts_beat_cops_spawngroup_4),
		restoration:gen_missionscript(400044, "beat_cops_spawngroup_5", opts_beat_cops_spawngroup_5),
		restoration:gen_missionscript(400045, "beat_cops_spawngroup_6", opts_beat_cops_spawngroup_6),
		-- Beat cops 
		restoration:gen_dummy(400046, "cop_1", Vector3(3370, -6779, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400047, "cop_2", Vector3(3198, -6773, -24.872), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400048, "cop_3", Vector3(3378, -6703, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400049, "cop_4", Vector3(3301, -6652, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400050, "cop_5", Vector3(3218, -6696, -24.873), Rotation(0, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400051, "cop_6", Vector3(2039, 4460, -25), Rotation(-95, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400052, "cop_7", Vector3(2051, 4674, -25), Rotation(-103, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400053, "cop_8", Vector3(2138, 4658, -25.001), Rotation(-96, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400054, "cop_9", Vector3(-2623, -4740, 88), Rotation(0, 0, 0), opts_beat_cops),
		restoration:gen_dummy(400055, "cop_10", Vector3(-2791, -4731, 88), Rotation(0, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400056, "cop_11", Vector3(4118, 5010, -24.873), Rotation(177, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400057, "cop_12", Vector3(4194, 5014, -24.873), Rotation(176, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400059, "cop_13", Vector3(4260, 5004, -24.873), Rotation(176, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400060, "cop_14", Vector3(2658, -7008, -12.015), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400061, "cop_15", Vector3(2523, -6998, -12.015), Rotation(0, 0, -0), opts_beat_cops),

		restoration:gen_dummy(400062, "cop_16", Vector3(4575, -6955, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400063, "cop_17", Vector3(4445, -6938, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400064, "cop_18", Vector3(4344, -6907, -24.873), Rotation(0, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400065, "cop_19", Vector3(4223, -6889, -24.873), Rotation(0, 0, -0), opts_beat_cops),
    },
}
