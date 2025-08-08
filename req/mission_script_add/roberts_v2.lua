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

return {
	-- swat van
	restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(1567.972, 871.511, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(1479.193, 865.163, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(1472.636, 958.934, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(1560.422, 965.073, -76.450), Rotation(4, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
	restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_1),
	restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),
}
