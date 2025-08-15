local optsBesiegeDummy_1 = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_jump_down_heli_cbt_left",
}
local optsBesiegeDummy_2 = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_jump_down_heli_cbt_right",
}
local optsOpenHeliLefttDoor = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102590, notify_unit_sequence = "open_door_left", time = 0 },
	},
}
local optsCloseHeliLeftDoor = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 102590, notify_unit_sequence = "close_door_left", time = 0 },
	},
}
local optsspawnchopperSWATs_1 = {
	on_executed = {
		{ id = 400006, delay = 0 },
	},
	enabled = true,
}
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}

return = {
    elements = {
	-- swat chopper
	    restoration:gen_dummy(400001, "swat_chopper_spawn_1", Vector3(63.545, 3776.085, 25), Rotation(-2.446, 0, 0), optsBesiegeDummy_1),
	    restoration:gen_dummy(400002, "swat_chopper_spawn_2", Vector3(-3.394, 3778.944, 25), Rotation(-2.446, 0, 0), optsBesiegeDummy_1),
	    restoration:.gen_dummy(400003, "swat_chopper_spawn_3", Vector3(-23, 3392, 25), Rotation(169.554, 0, 0), optsBesiegeDummy_2),
	    restoration:.gen_dummy(400004, "swat_chopper_spawn_4", Vector3(61, 3384, 25), Rotation(-177.165, 0, 0), optsBesiegeDummy_2),
	    restoration:.gen_missionscript(400005, "spawn_swats_1", optsspawnchopperSWATs_1),
	    restoration:.gen_spawngroup(400006, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),
	    restoration:.objecteditor(400007, "open_heli_door_left", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenHeliLefttDoor),
	    restoration:.objecteditor(400008, "close_heli_door_left", Vector3(0, 0, 0), Rotation(0, 0, -0), optsCloseHeliLeftDoor),
    },
}