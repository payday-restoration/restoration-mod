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
local optsspawnvanSWATs_6 = {
	on_executed = {
		{ id = 400041, delay = 0 },
		{ id = 400042, delay = 0 },
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
		{ id = 1, name = "run_sequence", notify_unit_id = 103216, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102999, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_3 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103002, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_4 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103004, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_5 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103000, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_6 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103212, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}

return {
    elements = {
        -- swat van 1
        restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(3928, 383, -96.975), Rotation(-55, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(3891.865, 434.607, -96.975), Rotation(-55, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(3992.713, 428.313, -96.975), Rotation(-55, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(3956.578, 479.919, -96.975), Rotation(-55, 0, 0), optsBesiegeDummy),
        restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
        restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_1),
        restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),

        -- swat van 2
        restoration:gen_dummy(400007, "swat_van_spawn_5", Vector3(1522.364, -1908.873, -241.273), Rotation(-158, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400008, "swat_van_spawn_6", Vector3(1588.194, -1882.276, -241.273), Rotation(-158, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400009, "swat_van_spawn_7", Vector3(1548.783, -1976.932, -252.273), Rotation(-158, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400010, "swat_van_spawn_8", Vector3(1615.541, -1949.960, -252.273), Rotation(-158, 0, 0), optsBesiegeDummy),
        restoration:gen_missionscript(400012, "spawn_swats_2", optsspawnvanSWATs_2),
        restoration:objecteditor(400013, "open_swat_doors_2", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
        restoration:gen_spawngroup(400014, "swat_group_2", { 400007, 400008, 400009, 400010 }, 0, opts_swat_group),

        -- swat van 3
        restoration:gen_dummy(400015, "swat_van_spawn_9", Vector3(1965.613, -1952.756, -249.226), Rotation(160, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400016, "swat_van_spawn_10", Vector3(2023.873, -1973.962, -249.226), Rotation(160, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400017, "swat_van_spawn_11", Vector3(1930.474, -2034.679, -269.226), Rotation(160, 0, 0), optsBesiegeDummy),
        restoration:gen_dummy(400018, "swat_van_spawn_12", Vector3(1993.434, -2057.594, -269.226), Rotation(160, 0, 0), optsBesiegeDummy),
        restoration:gen_missionscript(400019, "spawn_swats_3", optsspawnvanSWATs_3),
        restoration:objecteditor(400020, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_3),
        restoration:gen_spawngroup(400021, "swat_group_3", { 400015, 400016, 400017, 400018 }, 0, opts_swat_group),

	    -- swat van 4
	    restoration:gen_dummy(400022, "swat_van_spawn_13", Vector3(1624.427, 5812.930, 818.471), Rotation(-40, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400023, "swat_van_spawn_14", Vector3(1575.400, 5854.068, 828.471), Rotation(-40, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400024, "swat_van_spawn_15", Vector3(1669.668, 5863.734, 828.471), Rotation(-40, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400025, "swat_van_spawn_16", Vector3(1619.109, 5906.156, 841.471), Rotation(-40, 0, 0), optsBesiegeDummy),
	    restoration:gen_missionscript(400026, "spawn_swats_4", optsspawnvanSWATs_4),
	    restoration:objecteditor(400027, "open_swat_doors_4", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_4),
	    restoration:gen_spawngroup(400028, "swat_group_4", { 400022, 400023, 400024, 400025 }, 0, opts_swat_group),

	    -- swat van 5
	    restoration:gen_dummy(400029, "swat_van_spawn_17", Vector3(2287.506, 5872.808, 820.460), Rotation(26, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400030, "swat_van_spawn_18", Vector3(2230.802, 5845.190, 826.460), Rotation(26, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400031, "swat_van_spawn_19", Vector3(2262.913, 5918.668, 838.460), Rotation(26, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400032, "swat_van_spawn_20", Vector3(2206.771, 5894.624, 833.460), Rotation(26, 0, 0), optsBesiegeDummy),
	    restoration:gen_missionscript(400033, "spawn_swats_5", optsspawnvanSWATs_5),
	    restoration:objecteditor(400034, "open_swat_doors_5", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_5),
	    restoration:gen_spawngroup(400035, "swat_group_5", { 400029, 400030, 400031, 400032 }, 0, opts_swat_group),

	    -- swat van 6
	    restoration:gen_dummy(400036, "swat_van_spawn_21", Vector3(-6458, 512, -20), Rotation(139, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400037, "swat_van_spawn_22", Vector3(-6408.187, 468.700, -20), Rotation(139, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400038, "swat_van_spawn_23", Vector3(-6493.427, 471.246, -20), Rotation(139, 0, 0), optsBesiegeDummy),
	    restoration:gen_dummy(400039, "swat_van_spawn_16", Vector3(-6443.616, 427.946, -20), Rotation(139, 0, 0), optsBesiegeDummy),
	    restoration:gen_missionscript(400040, "spawn_swats_6", optsspawnvanSWATs_6),
	    restoration:objecteditor(400041, "open_swat_doors_6", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_6),
        restoration:gen_spawngroup(400042, "swat_group_6", { 400036, 400037, 400038, 400039 }, 0, opts_swat_group),
    },
}

