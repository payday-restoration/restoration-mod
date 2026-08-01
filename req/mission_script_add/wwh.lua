local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local butcher_crew_01 = "units/pd2_dlc_wwh/characters/ene_male_crew_01/ene_male_crew_01"
local butcher_crew_02 = "units/pd2_dlc_wwh/characters/ene_male_crew_02/ene_male_crew_02"
local butcher_crew_03 = "units/pd2_dlc_wwh/characters/ene_female_crew/ene_female_crew"


local optsDefend_SO = {
	SO_access = {
        "gangster",
    },
	scan = true,
	forced = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
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
    on_executed = { { id = 400006, delay = 0,} ,  }, 
}
local Butcher_crew_03 = {
    enemy = butcher_crew_03,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400007, delay = 0,} ,  }, 
}
local Butcher_crew_04 = {
    enemy = butcher_crew_02,
    enabled = true,
    team = "criminal1",
    on_executed = { { id = 400008, delay = 0,} ,  }, 
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
		{ id = 400015, delay = 0 },
		{ id = 400016, delay = 0 },
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
		{ id = 400014, delay = 0, delay_rand = 5 },
	},
}
return  {
    elements = {
    -- Butcher Crew backing you up (If your a kind soul, try to help them) 
    restoration:gen_dummy(400001, "butcher_crew_01", Vector3(5549, 5531, 1219.7), Rotation(0, -0, -0), Butcher_crew_01),
    restoration:gen_dummy(400002, "butcher_crew_02", Vector3(5457, 5524, 1221.3), Rotation(0, -0, -0), Butcher_crew_02),
    restoration:gen_dummy(400003, "butcher_crew_03", Vector3(5549, 5432, 1219.7), Rotation(0, -0, -0), Butcher_crew_03),
    restoration:gen_dummy(400004, "butcher_crew_04", Vector3(5468, 5432, 1219.7), Rotation(0, -0, -0), Butcher_crew_04),

    restoration:gen_so(400005, "butcher_crew_so_1", Vector3(3402.85, 5794.64, 1225.48), Rotation(83, -0, -0),  optsDefend_SO),
    restoration:gen_so(400006, "butcher_crew_so_2", Vector3(3502.31, 5783.14, 1226.48), Rotation(83, -0, -0),  optsDefend_SO),
    restoration:gen_so(400007, "butcher_crew_so_3", Vector3(3383.96, 5680.8, 1226.48), Rotation(83, -0, -0),  optsDefend_SO),
    restoration:gen_so(400008, "butcher_crew_so_4", Vector3(3492.58, 5642.17, 1226.48), Rotation(83, -0, -0),  optsDefend_SO),
    -- mission script 
    restoration:gen_missionscript(400009, "spawn_butcher_crew_team", spawn_butchercrewfinale),
    -- swat van 
    restoration:gen_dummy(400010, "swat_van_spawn_1", Vector3(979, 3807, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
    restoration:gen_dummy(400011, "swat_van_spawn_2", Vector3(986.068, 3749.432, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400012, "swat_van_spawn_3", Vector3(918.089, 3802.543, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_dummy(400013, "swat_van_spawn_4", Vector3(925.523, 3741.998, 949.997), Rotation(97, 0, 0), optsBesiegeDummy),
	restoration:gen_missionscript(400014, "spawn_swats_3", optsspawnvanSWATs_3),
	restoration:objecteditor(400015, "open_swat_doors_3", Vector3(0, 0, 0), Rotation(0, 0, -0), optsOpenSwatVanDoors_3),
	restoration:gen_spawngroup(400016, "swat_group_3", {400010,400011 ,400012 , 400013 }, 0, opts_swat_group),
	restoration:object_editor_trigger(400017, "swat_van_doors_trigger", optsOpenSwatVanDoors_Trigger_3),
    },
}