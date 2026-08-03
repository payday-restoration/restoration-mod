local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local butcher_crew_01 = "units/pd2_dlc_wwh/characters/ene_male_crew_01/ene_male_crew_01"
local butcher_crew_02 = "units/pd2_dlc_wwh/characters/ene_male_crew_02/ene_male_crew_02"
local butcher_crew_03 = "units/pd2_dlc_wwh/characters/ene_female_crew/ene_female_crew"
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local winters = "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1"
local winter_goon = "units/pd2_dlc_vip/characters/ene_phalanx_1_new/ene_phalanx_1_new"
local titan_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
local grenadier = "units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1"
local death_wish_above = difficulty >= 7

local opts_hunt_so = {
	scan = true,
	SO_access = {
        "gangster",
        "tank",
        "shield",
        "swat",
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
        { id = 400016, delay = 80, delay_rand = 80 },
    },
}
local optsSkully = {
    enabled = death_wish_above,
    enemy = tank_skull,
    spawn_action = "e_sp_armored_truck_1st",
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 5, }, },
}
local optsWinters = {
    enabled = true,
    enemy = winters,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 10, delay_rand = 5, }, },
}
local optsWinters_goon_01 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_02 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_03 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_04 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_05 = {
    enabled = true,
    enemy = titan_sniper,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_06 = {
    enabled = true,
    enemy = titan_sniper,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_07 = {
    enabled = true,
    enemy = grenadier,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_08 = {
    enabled = true,
    enemy = grenadier,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_09 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_10 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_11 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_12 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local optsWinters_goon_14 = {
    enabled = true,
    enemy = winter_goon,
    participate_to_group_ai = true,
    on_executed = { { id = 400005, delay = 0, }, },
}
local spawn_Winters_n_squad = {
    enabled = true,
    on_executed = {
        { id = 400018, delay = 0,},
        { id = 400019, delay = 0,},
        { id = 400020, delay = 0,},
        { id = 400021, delay = 0,},
        { id = 400022, delay = 0,},
        { id = 400023, delay = 0,},
        { id = 400024, delay = 0,},
        { id = 400025, delay = 0,},
        { id = 400026, delay = 0,},
        { id = 400027, delay = 0,},
        { id = 400028, delay = 0,},
        { id = 400029, delay = 0,},
        { id = 400030, delay = 0,},
    },
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
        restoration:gen_dummy(400015, "surprise_dozer", Vector3(3178.86, 3720, 967.997), Rotation(80, -0, -0), optsSkully),
        restoration:objecteditor(400016, "back_door", Vector3(0, 0, 0), Rotation(0, 0, 0), optsOpenSwatVanDoors_2),
        restoration:object_editor_trigger(400017, "back_door_trigger", optsOpenSwatVan_Door_Trigger_2),
        -- the solution to end the assault 
        restoration:gen_dummy(400018, "cap_wankers", Vector3(5151, -2137, 1374.61), Rotation(2, -0, -0), optsWinters),
        restoration:gen_dummy(400019, "phalanx_01", Vector3(5227, -2002, 1374.61), Rotation(2, -0, -0), optsWinters_goon_02),
        restoration:gen_dummy(400020, "phalanx_02", Vector3(5292, -2020, 1374.61), Rotation(2, -0, -0), optsWinters_goon_03),
        restoration:gen_dummy(400021, "phalanx_03", Vector3(5163, -2004, 1374.61), Rotation(2, -0, -0), optsWinters_goon_04),
        restoration:gen_dummy(400022, "tit_snip_01", Vector3(5226, -2069, 1374.61), Rotation(2, -0, -0), optsWinters_goon_05),
        restoration:gen_dummy(400023, "tit_snip_02", Vector3(5156, -2066, 1374.61), Rotation(2, -0, -0), optsWinters_goon_06),
        restoration:gen_dummy(400024, "grenda_01", Vector3(5102, -2109, 1374.61), Rotation(2, -0, -0), optsWinters_goon_07),
        restoration:gen_dummy(400025, "grenda_02", Vector3(5266, -2133, 1374.61), Rotation(2, -0, -0), optsWinters_goon_08),
        restoration:gen_dummy(400026, "grenda_02", Vector3(5289.98, -1962.04, 1374.61), Rotation(2, -0, -0), optsWinters_goon_09),
        restoration:gen_dummy(400027, "grenda_02", Vector3(5218.98, -1963.51, 1374.61), Rotation(2, -0, -0), optsWinters_goon_10),
        restoration:gen_dummy(400028, "grenda_02", Vector3(5161.02, -1965.54, 1374.61), Rotation(2, -0, -0), optsWinters_goon_12),
        restoration:gen_dummy(400029, "grenda_02", Vector3(5291.44, -1917.96, 1374.61), Rotation(2, -0, -0), optsWinters_goon_13),
        restoration:gen_dummy(400030, "grenda_02", Vector3(5207.49, -1920.89, 1374.61), Rotation(2, -0, -0), optsWinters_goon_14),
        -- mission script
        restoration:gen_missionscript(400031, "spawn_winters_n_squad", spawn_Winters_n_squad),
    },
}
