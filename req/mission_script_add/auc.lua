local cops = {
	"units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
	"units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
	"units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
	"units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
}

local optsBesiegeDummy_1 = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_armored_truck_1st",
}
local optsBesiegeDummy_2 = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_climb_over_2m",
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
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_3 = {
	on_executed = {
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_4 = {
	on_executed = {
		{ id = 400029, delay = 0 },
		{ id = 400030, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_5 = {
	on_executed = {
		{ id = 400038, delay = 0 },
		{ id = 400039, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_6 = {
	on_executed = {
		{ id = 400046, delay = 0 },
		{ id = 400047, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_7 = {
	on_executed = {
		{ id = 400054, delay = 0 },
		{ id = 400055, delay = 0 },
	},
	enabled = true,
}
local optsspawnvanSWATs_8 = {
	on_executed = {
		{ id = 400062, delay = 0 },
		{ id = 400063, delay = 5 },
	},
	enabled = true,
}
local optsspawnvanSWATs_9 = {
	on_executed = {
		{ id = 400070, delay = 0 },
		{ id = 400071, delay = 5 },
	},
	enabled = true,
}
local optsOpenSwatVanDoors_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401782, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401786, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_3 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401780, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_4 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401783, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_5 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401543, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_6 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401781, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_7 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401787, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_8 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401810, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_9 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 402936, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_Trigger_1 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401782 },
	},
	on_executed = {
		{ id = 400005, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_2 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401786 },
	},
	on_executed = {
		{ id = 400013, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_3 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401780 },
	},
	on_executed = {
		{ id = 400021, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_4 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401783 },
	},
	on_executed = {
		{ id = 400021, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_5 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401543 },
	},
	on_executed = {
		{ id = 400037, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_6 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401781 },
	},
	on_executed = {
		{ id = 400045, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_7 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401787 },
	},
	on_executed = {
		{ id = 400053, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_8 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 401810 },
	},
	on_executed = {
		{ id = 400061, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_Trigger_9 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 402936 },
	},
	on_executed = {
		{ id = 400069, delay = 0, delay_rand = 5 },
	},
}
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}

local optsNewSwatArrival_1 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401782, notify_unit_sequence = "anim_van_auc_arrive_09", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 401787, notify_unit_sequence = "anim_van_auc_arrive_03", time = 3 },
		{ id = 3, name = "run_sequence", notify_unit_id = 401810, notify_unit_sequence = "anim_van_auc_arrive_08", time = 5 },
		{ id = 4, name = "run_sequence", notify_unit_id = 402936, notify_unit_sequence = "anim_van_auc_arrive_07", time = 8 },
	},
}
local optsNewSwatArrival_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 401786, notify_unit_sequence = "anim_van_auc_arrive_06", time = 0 },
		{ id = 2, name = "run_sequence", notify_unit_id = 401781, notify_unit_sequence = "anim_van_auc_arrive_02", time = 0 },
		{ id = 3, name = "run_sequence", notify_unit_id = 401543, notify_unit_sequence = "anim_van_auc_arrive_01", time = 60 },
		{ id = 4, name = "run_sequence", notify_unit_id = 401783, notify_unit_sequence = "anim_van_auc_arrive_05", time = 60 },
		{ id = 5, name = "run_sequence", notify_unit_id = 401780, notify_unit_sequence = "anim_van_auc_arrive_04", time = 90 },
	},
}

local opts_hunt_so = {
	scan = true,
	SO_access = {
		"cop",
		"fbi", -- Beat cops in Res have "fbi" access
		"swat"
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
		{ id = 400078, delay= 0 },
	},
}
local opts_spawn_beat_cops = {
	enabled = true,
	amount = 4,
	amount_random = 0,
	on_executed = {
		{ id = 400078, delay = 0 },
		{ id = 400079, delay = 0 },
		{ id = 400080, delay = 0 },
	},
	
}
local opts_trigger_cop_spawn = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400075, delay = 0 },
		{ id = 400077, delay = 0 },
	},
}
local opts_loop_cop_spawn = {
	enabled = true,
	base_delay = 10,
	base_delay_rand = 5,
	on_executed = {
		{ id = 400076, delay = 0, }
	}
}
local opts_beat_cops_spawngroup_1 = {
	enabled = true,
	on_executed = {
		{ id = 400081, delay = 0,},
		{ id = 400082, delay = 0,},
		{ id = 400083, delay = 0,},
		{ id = 400083, delay = 0,},
		{ id = 400085, delay = 0,},
		{ id = 400086, delay = 0,},
	},
}
local opts_beat_cops_spawngroup_2 = {
	enabled = true,
	on_executed = {
		{ id = 400087, delay = 0,},
		{ id = 400088, delay = 0,},
		{ id = 400089, delay = 0,},
		{ id = 400090, delay = 0,},
		{ id = 400091, delay = 0,},
	},
}
return {
	elements = {
			
		-- swat van 1
		restoration:gen_dummy(400001, "swat_van_spawn_1", Vector3(1349, 5238, -120), Rotation(-22, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400002, "swat_van_spawn_2", Vector3(1279, 5269, -120), Rotation(-22, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400003, "swat_van_spawn_3", Vector3(1379, 5299, -120), Rotation(-22, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400004, "swat_van_spawn_4", Vector3(1308, 5329, -120), Rotation(-22, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400005, "spawn_swats_1", optsspawnvanSWATs_1),
		restoration:objecteditor(400006, "open_swat_doors_1", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_1),
		restoration:gen_spawngroup(400007, "swat_group_1", { 400001, 400002, 400003, 400004 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400008, "swat_van_doors_trigger_1", optsOpenSwatVanDoors_Trigger_1),

		-- swat van 2
		restoration:gen_dummy(400009, "swat_van_spawn_5", Vector3(759.364, 10036.865, -100), Rotation(-47, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400010, "swat_van_spawn_6", Vector3(717.776, 10077.185, -100), Rotation(-47, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400011, "swat_van_spawn_7", Vector3(759, 10125, -100), Rotation(-47, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400012, "swat_van_spawn_8", Vector3(799, 10077, -100), Rotation(-47, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400013, "spawn_swats_2", optsspawnvanSWATs_2),
		restoration:objecteditor(400014, "open_swat_doors_2", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
		restoration:gen_spawngroup(400015, "swat_group_2", { 400009, 400010, 400011, 400012 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400016, "swat_van_doors_trigger_2", optsOpenSwatVanDoors_Trigger_2),

		-- swat van 3
		restoration:gen_dummy(400017, "swat_van_spawn_9", Vector3(1696, 10962, -120), Rotation(14, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400018, "swat_van_spawn_10", Vector3(1628, 10949, -120), Rotation(14, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400019, "swat_van_spawn_11", Vector3(1615, 11012, -120), Rotation(14, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400020, "swat_van_spawn_12", Vector3(1682.178, 11024.549, -120), Rotation(14, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400021, "spawn_swats_3", optsspawnvanSWATs_3),
		restoration:objecteditor(400022, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_3),
		restoration:gen_spawngroup(400023, "swat_group_3", { 400017, 400018, 400019, 400020 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400024, "swat_van_doors_trigger_3", optsOpenSwatVanDoors_Trigger_3),

		-- swat van 4
		restoration:gen_dummy(400025, "swat_van_spawn_13", Vector3(1687.489, 9417.024, -120), Rotation(-59, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400026, "swat_van_spawn_14", Vector3(1648.237, 9480.512, -120), Rotation(-59, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400027, "swat_van_spawn_15", Vector3(1637.572, 9388.150, -120), Rotation(-59, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400028, "swat_van_spawn_16", Vector3(1604.985, 9446.206, -120), Rotation(-59, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400029, "spawn_swats_4", optsspawnvanSWATs_4),
		restoration:objecteditor(400030, "open_swat_doors_4", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_4),
		restoration:gen_spawngroup(400031, "swat_group_4", { 400025, 400026, 400027, 400028 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400032, "swat_van_doors_trigger_3", optsOpenSwatVanDoors_Trigger_4),

		-- swat van 5
		restoration:gen_dummy(400033, "swat_van_spawn_17", Vector3(877.364, -2993.847, -120), Rotation(-128, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400034, "swat_van_spawn_18", Vector3(921.880, -2938.157, -120), Rotation(-128, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400035, "swat_van_spawn_19", Vector3(974.942, -2969.881, -120), Rotation(-128, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400036, "swat_van_spawn_20", Vector3(934, -3028, -120), Rotation(-128, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400037, "spawn_swats_5", optsspawnvanSWATs_5),
		restoration:objecteditor(400038, "open_swat_doors_5", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_5),
		restoration:gen_spawngroup(400039, "swat_group_5", { 400033, 400034, 400035, 400036 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400040, "swat_van_doors_trigger_5", optsOpenSwatVanDoors_Trigger_5),

		-- swat van 6
		restoration:gen_dummy(400041, "swat_van_spawn_21", Vector3(1205.842, -2685.916, -120), Rotation(136, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400042, "swat_van_spawn_22", Vector3(1250.937, -2733.207, -120), Rotation(136, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400043, "swat_van_spawn_23", Vector3(1166.345, -2730.948, -120), Rotation(136, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400044, "swat_van_spawn_24", Vector3(1208.495, -2773.301, -120), Rotation(136, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400045, "spawn_swats_6", optsspawnvanSWATs_6),
		restoration:objecteditor(400046, "open_swat_doors_6", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_6),
		restoration:gen_spawngroup(400047, "swat_group_6", { 400041, 400042, 400043, 400044 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400048, "swat_van_doors_trigger_6", optsOpenSwatVanDoors_Trigger_6),

		-- swat van 7
		restoration:gen_dummy(400049, "swat_van_spawn_25", Vector3(1242.660, -582, -120), Rotation(-150, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400050, "swat_van_spawn_26", Vector3(1274.722, -636.500, -120), Rotation(-150, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400051, "swat_van_spawn_27", Vector3(1298.500, -548.866, -120), Rotation(-150, 0, 0), optsBesiegeDummy_1),
		restoration:gen_dummy(400052, "swat_van_spawn_28", Vector3(1332, -599.536, -120), Rotation(-150, 0, 0), optsBesiegeDummy_1),
		restoration:gen_missionscript(400053, "spawn_swats_7", optsspawnvanSWATs_7),
		restoration:objecteditor(400054, "open_swat_doors_7", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_7),
		restoration:gen_spawngroup(400055, "swat_group_7", { 400049, 400050, 400051, 400052 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400056, "swat_van_doors_trigger_7", optsOpenSwatVanDoors_Trigger_7),

		-- swat van 8
		restoration:gen_dummy(400057, "swat_van_spawn_29", Vector3(-7461, 89, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400058, "swat_van_spawn_30", Vector3(-7461, 18, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400059, "swat_van_spawn_31", Vector3(-7461, -51, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400060, "swat_van_spawn_32", Vector3(-7461, -114, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_missionscript(400061, "spawn_swats_8", optsspawnvanSWATs_8),
		restoration:objecteditor(400062, "open_swat_doors_8", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_8),
		restoration:gen_spawngroup(400063, "swat_group_8", { 400057, 400058, 400059, 400060 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400064, "swat_van_doors_trigger_8", optsOpenSwatVanDoors_Trigger_8),

		-- swat van 9
		restoration:gen_dummy(400065, "swat_van_spawn_33", Vector3(-7461, 4874, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400066, "swat_van_spawn_34", Vector3(-7461, 4940, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400067, "swat_van_spawn_35", Vector3(-7461, -51, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_dummy(400068, "swat_van_spawn_36", Vector3(-7461, -114, -100), Rotation(-90, 0, 0), optsBesiegeDummy_2),
		restoration:gen_missionscript(400069, "spawn_swats_9", optsspawnvanSWATs_9),
		restoration:objecteditor(400070, "open_swat_doors_9", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_9),
		restoration:gen_spawngroup(400071, "swat_group_9", { 400065, 400066, 400067, 400068 }, 0, opts_swat_group),
		restoration:object_editor_trigger(400072, "swat_van_doors_trigger_9", optsOpenSwatVanDoors_Trigger_9),

		-- swat van arrival tweaks
		restoration:objecteditor(400073, "swat_vans_drive_in_1", Vector3(0, 0, 0), Rotation(0, 0, 0), optsNewSwatArrival_1),
		restoration:objecteditor(400074, "swat_vans_drive_in_2", Vector3(0, 0, 0), Rotation(0, 0, 0), optsNewSwatArrival_2),

		-- Beat cop swarm setup
		restoration:gen_element_random(400075, "spawn_beat_cops", opts_spawn_beat_cops),
		restoration:gen_missionscript(400076, "trigger_cop_spawn", opts_trigger_cop_spawn),
		restoration:gen_missionscript(400077, "loop_cop_spawn", opts_loop_cop_spawn),
		restoration:gen_so(400078, "hunt_so", Vector3(-700, 1000, 0), Rotation(0, 0, 0), opts_hunt_so),

		restoration:gen_missionscript(400079, "beat_cops_spawngroup_1", opts_beat_cops_spawngroup_1),
		restoration:gen_missionscript(400080, "beat_cops_spawngroup_2", opts_beat_cops_spawngroup_2),
		
		-- Boys in Blue
		-- group 1 
		restoration:gen_dummy(400081, "lapd_cop_01", Vector3(-347.105, 11835, -100), Rotation(-91, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400082, "lapd_cop_02", Vector3(-345.15, 11947, -100), Rotation(-91, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400084, "lapd_cop_03", Vector3(-325.349, 12082, -100), Rotation(-91, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400085, "lapd_cop_04", Vector3(-212.779, 12072.2, -100), Rotation(-91, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400086, "lapd_cop_05", Vector3(-222.802, 11957.6, -100), Rotation(-91, 0, -0), opts_beat_cops),
		-- group 2
		restoration:gen_dummy(400087, "lapd_cop_06", Vector3(-208, -4910, -100), Rotation(-86, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400088, "lapd_cop_07", Vector3(-214.697, -4814.23, -100), Rotation(-86, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400089, "lapd_cop_08", Vector3(-133.692, -4911.82, -100), Rotation(-86, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400090, "lapd_cop_09", Vector3(-140.737, -4811.07, -100), Rotation(-86, 0, -0), opts_beat_cops),
		restoration:gen_dummy(400091, "lapd_cop_10", Vector3(-82.035, -4862.1, -100), Rotation(-86, 0, -0), opts_beat_cops),
	},
}
