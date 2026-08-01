local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local butcher_crew_01 = "units/pd2_dlc_wwh/characters/ene_male_crew_01/ene_male_crew_01"
local butcher_crew_02 = "units/pd2_dlc_wwh/characters/ene_male_crew_02/ene_male_crew_02"
local butcher_crew_03 = "units/pd2_dlc_wwh/characters/ene_female_crew/ene_female_crew"
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local death_wish_above = difficulty >= 7

local opts_hunt_so = {
	scan = true,
	SO_access = {
        "gangster",
        "tank",
    },
	use_instigator = true,
	so_action = "AI_hunt",
}
local Butcher_crew_01 = {
    enemy = butcher_crew_01,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400005, delay = 0,} ,  }, 
}
local Butcher_crew_02 = {
    enemy = butcher_crew_02,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400005, delay = 0,} ,  }, 
}
local Butcher_crew_03 = {
    enemy = butcher_crew_03,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400005, delay = 0,} ,  }, 
}
local Butcher_crew_04 = {
    enemy = butcher_crew_02,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400005, delay = 0,} ,  }, 
}
local spawn_butchercrewfinale = {
    enabled = true,
    on_executed = {
        { id = 400001, delay = 0,},
        { id = 400002, delay = 0,},
        { id = 400003, delay = 0,},
        { id = 400004, delay = 0,},
    },
}
local optsBesiegeDummy = {
	participate_to_group_ai = true,
	enabled = true,
	spawn_action = "e_sp_armored_truck_1st",
}
local optsspawnvanSWATs_3 = {
	on_executed = {
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
	},
	enabled = true,
}
local opts_swat_group = {
	spawn_type = "group_guaranteed",
	amount = 4,
}
local optsOpenSwatVanDoors_3 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 100678, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
}
local optsOpenSwatVanDoors_Trigger_3 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 100678 },
	},
    	on_executed = {
		{ id = 400011, delay = 0, delay_rand = 5 },
	},
}
local optsOpenSwatVanDoors_2 = {
	enabled = true,
	trigger_list = {
		{ id = 1, name = "run_sequence", notify_unit_id = 100131, notify_unit_sequence = "anim_doors_rear_open", time = 0 },
	},
    on_executed = {
        {id = 400015, delay = 0},
    },
}
local optsOpenSwatVan_Door_Trigger_2 = {
	enabled = true,
	sequence_list = {
		{ guis_id = 1, sequence = "done_car_anim", unit_id = 100131 },
	},
    on_executed = {
        { id = 400016, delay = 60, delay_rand = 60 },
    },
}
local optsSkully = {
    enabled = death_wish_above,
    enemy = tank_skull,
    spawn_action = "e_sp_clk_over_2_5m",
    on_executed = { { id = 400005, delay = 5, }, },
}

return  {
    elements = {
    -- Butcher Crew backing you up (If your a kind soul, try to help them) 
    restoration:gen_dummy(400001, "butcher_crew_01", Vector3(5549, 5531, 1219.7), Rotation(0, -0, -0), Butcher_crew_01),
    restoration:gen_dummy(400002, "butcher_crew_02", Vector3(5457, 5524, 1221.3), Rotation(0, -0, -0), Butcher_crew_02),
    restoration:gen_dummy(400003, "butcher_crew_03", Vector3(5549, 5432, 1219.7), Rotation(0, -0, -0), Butcher_crew_03),
    restoration:gen_dummy(400004, "butcher_crew_04", Vector3(5468, 5432, 1219.7), Rotation(0, -0, -0), Butcher_crew_04),

    restoration:gen_so(400005, "hunt", Vector3(3402.85, 5794.64, 1225.48), Rotation(83, -0, -0),  opts_hunt_so),
    -- mission script 
    restoration:gen_missionscript(400006, "spawn_butcher_crew_team", spawn_butchercrewfinale),
    -- swat van 
    restoration:gen_dummy(400007, "swat_van_spawn_1", Vector3(979, 3807, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
    restoration:gen_dummy(400008, "swat_van_spawn_2", Vector3(986.068, 3749.432, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400009, "swat_van_spawn_3", Vector3(918.089, 3802.543, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400010, "swat_van_spawn_4", Vector3(925.523, 3741.998, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400011, "spawn_swats_3", optsspawnvanSWATs_3),
	restoration:objecteditor(400012, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_3),
	restoration:gen_spawngroup(400013, "swat_group_3", {400007,400008 ,400009 , 400010 }, 0, opts_swat_group),
	restoration:object_editor_trigger(400014, "swat_van_doors_trigger", optsOpenSwatVanDoors_Trigger_3),
    -- swat van (2 (surprise dozer dw-ds)
    restoration:gen_dummy(400015, "surprise_dozer", Vector3(3650.97, 3813.47, 967.997), Rotation(-21, 0, -0), optsSkully),
    restoration:objecteditor(400016, "top_door", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
    restoration:object_editor_trigger(400017, "top_door_trigger", optsOpenSwatVan_Door_Trigger_2),
    },
}