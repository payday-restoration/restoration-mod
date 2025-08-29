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
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}

local optsOpenSwatVanDoors_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103877, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103854, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_3 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 103876, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}

return {
    elements = {
	-- swat van 1
	restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(6082, -11872, 400), Rotation(-165, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(6137.058, -11857.247, 400), Rotation(-165, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(6097.599, -11934.078, 400), Rotation(-165, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(6135.105, -11917.134, 400), Rotation(-165, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
	restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_1),
	restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),

	-- swat van 2
	restoration:gen_dummy(400007, "swat_van_spawn_5", Vector3(10885.220, -2091.053, 423.828), Rotation(-95, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400008, "swat_van_spawn_6", Vector3(10890.448, -2031.281, 423.828), Rotation(-95, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400009, "swat_van_spawn_7", Vector3(10930.958, -2096.059, 423.828), Rotation(-95, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400010, "swat_van_spawn_8", Vector3(10936.361, -2034.295, 423.828), Rotation(-95, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400012, "spawn_swats_2", optsspawnvanSWATs_2),
	restoration:objecteditor(400013, "open_swat_doors_2", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
	restoration:gen_spawngroup(400014, "swat_group_2", { 400007, 400008, 400009, 400010 }, 0, opts_swat_group),

	-- swat van 3
	restoration:gen_dummy(400015, "swat_van_spawn_9", Vector3(3029, 7239, 400), Rotation(49, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400016, "swat_van_spawn_10", Vector3(2990.949, 7195.227, 400), Rotation(49, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400017, "swat_van_spawn_11", Vector3(2984.374, 7279.118, 400), Rotation(49, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400018, "swat_van_spawn_12", Vector3(2945.666, 7234.590, 400), Rotation(49, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400019, "spawn_swats_3", optsspawnvanSWATs_3),
	restoration:objecteditor(400020, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_3),
	restoration:gen_spawngroup(400021, "swat_group_3", { 400015, 400016, 400017, 400018 }, 0, opts_swat_group),
    },
}

