
local optsBesiegeDummy = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_armored_truck_1st",
}
local optsOpenSwatVanDoors_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103098, notify_unit_sequence = "anim_door_right_open", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 103098, notify_unit_sequence = "anim_door_left_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103099, notify_unit_sequence = "anim_door_right_open", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 103099, notify_unit_sequence = "anim_door_left_open", time = 0 },
	},
}
local optsspawnvanSWATs_1 = {
	on_executed = {
		{ id = 400007, delay = 0 },
		{ id = 400006, delay = 0 },
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
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}

return = {
	-- swat van 1
	restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(2989, 1712, -19.999), Rotation(-107, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(3008.004, 1774.160, -19.999), Rotation(-107, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(3057.349, 1685.875, -19.999), Rotation(-107, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(3077.814, 1752.817, -19.999), Rotation(-107, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
    restoration:gen_object_editor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_1),
	restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),

	-- swat van 2
	restoration:gen_dummy(400008, "swat_van_spawn_5", Vector3(-2241.963, 2003.063, -19.999), Rotation(74, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400009, "swat_van_spawn_6", Vector3(-2260.706, 1937.698, -19.999), Rotation(74, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400010, "swat_van_spawn_7", Vector3(-2292.224, 2016.435, -19.999), Rotation(74, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400011, "swat_van_spawn_8", Vector3(-2310.692, 1952.031, -19.999), Rotation(74, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400012, "spawn_swats_2", optsspawnvanSWATs_1),
	restoration:gen_object_editor(400013, "open_swat_doors_2", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_1),
	restoration:gen_spawngroup(400014, "swat_group_2", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),
}