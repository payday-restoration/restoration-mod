local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
local cloaker = ((difficulty >= 8)  and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
local gunners = ((difficulty >= 8)  and "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky" or "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")
local shields = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city")
local snipers = ((difficulty >= 8) and "units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky" or "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper")
local grunt_1 =  ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy" or "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
local grunt_2 =  ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870" or "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
local grunt_3 =  ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city" or "units/payday2/characters/ene_swat_1/ene_swat_1")
local death_wish_above = difficulty >= 7
local death_sentence = difficulty == 8
local chance_weapons_vault_door_defense = math.random() < 0.15 
local chance_sneaky_cloaker_escape = math.random() < 0.4

local optsDefend_SO = {
	SO_access = {
        "tank",
        "shield",
        "swat",
		"sniper", 
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
local optsTDozer_01 = {
    enabled = true,
    enemy = titan_dozer,
    on_executed = { { id = 400003, delay = 0}, },
}
local optsTDozer_02 = {
    enabled = true,
    enemy = titan_dozer,
    on_executed = { { id = 400004, delay = 0}, },
}
local optsSniper_01 = {
	enabled = true,
	enemy = snipers,
	on_executed = { { id = 400027, delay = 0}, },
}
local optsSniper_02 = {
	enabled = true,
	enemy = snipers,
	on_executed = { { id = 400028, delay = 0}, },
}
local opts_spawn__weapon_lab_defenders = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400001, delay = 0, },
		{ id = 400002, delay = 0, },
		{ id = 400025, delay = 0, },
		{ id = 400026, delay = 0, },
	},
}
local optsCloaker_Hide_SO_01 = {
    SO_access = {
        "spooc",
    },
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_hide_under_car_enter"
}
local optsBulldozer_01 = {
    enabled = true,
    enemy = tank_skull,
    on_executed = { { id = 400021, delay = 0} },
}
local opts_gunner_1 = {
	enemy = gunners,
	enabled = true,
	on_executed = { {id =  400022, delay = 0,}, },
}
local opts_gunner_2 = {
	enemy = gunners,
	enabled = true,
	on_executed = { {id = 400023, delay = 0,}, },
}
local optsgrunt_01 = {
	enabled = true,
	enemy = grunt_1,
	on_executed = { {id = 400013,  delay = 0, }, },
}
local optsgrunt_02 = {
	enabled = true,
	enemy = grunt_1,
	on_executed = {
		{ id = 400014,  delay = 0, },
	},
}
local optsShield_03 = {
	enabled = true,
	enemy = shields,
	on_executed = { { id = 400015, delay = 0, }, },
}
local optsShield_04 = {
	enabled = true,
	enemy = shields,
	on_executed = { { id =  400016,  delay = 0, }, },
}
local optsgrunt_05 = {
	enabled = true,
	enemy = grunt_1,
	on_executed = { { id =  400017,  delay = 0, }, },
}
local opts_spawn_escape_defense = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400008, delay = 0, },
		{ id = 400009, delay = 0, },
		{ id = 400010, delay = 0, },
		{ id = 400011, delay = 0, },
		{ id = 400012, delay = 0, },
		{ id = 400018, delay = 0, },
		{ id = 400019, delay = 0, },
		{ id = 400020, delay = 0, },
	},
}
local opts_cloaker_helipad_01 = {
	enabled = true,
	enemy = cloaker,
	spawn_action = "e_sp_clk_up_manhole",
	on_executed = { { id = 400031, delay = 0, }, }, 
}
local opts_cloaker_helipad_02 = {
	enabled = true,
	enemy = cloaker,
	spawn_action = "e_sp_clk_up_manhole",
	on_executed = { { id = 400032, delay = 0, }, },
}
local optsCloaker_Hide_SO_02 = {
    SO_access = {
        "spooc",
    },
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_sneak_wait_crh_var3"
}

local opts_cloakers_and_snipers = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400029, delay = 0,},
		{ id = 400030, delay = 0,},
	},
}
local opts_vault_dozer = {
	enabled = true,
	enemy = tank_skull,
	on_executed = { {  id = 400041, delay = 0, }, },
}
local opts_vault_gunner_1 = {
	enabled = true,
	enemy = gunners,
	on_executed = { {  id = 400042, delay = 0, }, },
}
local opts_vault_gunner_2 = {
	enabled = true,
	enemy = gunners,
	on_executed = { {  id = 400043, delay = 0, }, },
}
local opts_weapons_lab_vault_units = {
	enabled = ( death_sentence and chance_weapons_vault_door_defense ),
	on_executed = {
		{ id = 400038, delay = 0, },
		{ id = 400039, delay = 0, },
		{ id = 400040, delay = 0, },
	}
}
local opts_cloaker_esc_1 = {
	enabled = true,
	enemy = cloaker,
	on_executed = { { id = 400045, delay = 0, }, },
}
local opts_cloaker_esc_2 = {
	enabled = true,
	enemy = cloaker,
	on_executed = { { id = 400046, delay = 0, }, },
}
local opts_enable_chance_clk_esc = {
	enabled = (  death_wish_above and chance_sneaky_cloaker_escape ),
	on_executed = {
		{ id = 400047, delay = 0, },
		{ id = 400048, delay = 0, },
	}
}
local opts_weapons_units_01 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_1,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_weapons_units_02 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_2,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_weapons_units_03 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_3,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_enable_grunts_open_weapons_room = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400050, delay = 0, },
		{ id = 400051, delay = 0, },
		{ id = 400052, delay = 0, },
		{ id = 400053, delay = 0, },
	}
}
local opts_arc_units_01 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_1,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_arc_units_02 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_2,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_arc_units_03 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_3,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_enable_grunts_open_arc_room = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400055, delay = 0, },
		{ id = 400056, delay = 0, },
		{ id = 400057, delay = 0, },
		{ id = 400058, delay = 0, },
	}
}
local opts_pc_units_01 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_1,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_pc_units_02 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_2,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_pc_units_03 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_3,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_enable_grunts_open_pc_room = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400060, delay = 0, },
		{ id = 400061, delay = 0, },
		{ id = 400062, delay = 0, },
		{ id = 400063, delay = 0, },
	}
}
local opts_lab_units_01 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_1,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_lab_units_02 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_2,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_lab_units_03 = {
	enabled = true,
	participate_to_group_ai = true,
	enemy = grunt_3,
	on_executed = { { id =  4000070, delay = 0,   }, },
}
local opts_enable_grunts_open_lab_room = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400065, delay = 0, },
		{ id = 400066, delay = 0, },
		{ id = 400067, delay = 0, },
		{ id = 400068, delay = 0, },
	}
}
local opts_hunt_so = {
	scan = true,
	SO_access = {
		"swat",
	},
	use_instigator = true,
	so_action = "AI_hunt",
}
return {
    elements = {
        -- Weapon Labs Defense
		-- TITAN DOZERS GUARDIAN
        restoration:gen_dummy(400001, "railgun_guardian_01", Vector3(-4221, -3032, 0), Rotation(-113, 0, -0), optsTDozer_01),
		restoration:gen_dummy(400002, "railgun_guardian_02", Vector3(-4230, -3154, 0), Rotation(-85, 0, -0), optsTDozer_02),

		restoration:gen_so(400003, "railgun_defend_01",  Vector3(-4221, -3032, 0), Rotation(-113, 0, -0), optsDefend_SO), 
		restoration:gen_so(400004, "railgun_defend_02",  Vector3(-4230, -3154, 0), Rotation(-85, 0, -0), optsDefend_SO),


		-- Snipers 
		restoration:gen_dummy(400025, "weapon_lab_sniper_01", Vector3(-3842.79, -2954.82, 0), Rotation(-105, 0, -0), optsSniper_01),
		restoration:gen_dummy(400026, "weapon_lab_sniper_02", Vector3(-3452.26, -3570.05, 0), Rotation(-65, 0, -0), optsSniper_02),

		restoration:gen_so(400027, "railgun_defend_03",  Vector3(-3842.79, -2954.82, 0), Rotation(-105, 0, -0), optsDefend_SO), 
		restoration:gen_so(400028, "railgun_defend_04",  Vector3(-3452.26, -3570.05, 0), Rotation(-65, 0, -0), optsDefend_SO),

		-- misison script
		restoration:gen_missionscript(400007, "spawn_railgun_defenders", opts_spawn__weapon_lab_defenders),

		-- The Sharks are giving everything they have to stop you. give em hell.
		-- SHIELD WALL ANF GRUNTS
		restoration:gen_dummy(400008, "blast_door_blocker_01", Vector3(-1667, 3699, 2.908), Rotation(-179, 0, -0), optsgrunt_01 ),
		restoration:gen_dummy(400009, "blast_door_blocker_02", Vector3(-1527, 3712, 2.908), Rotation(-179, 0, -0), optsgrunt_02 ),
		restoration:gen_dummy(400010, "blast_door_blocker_03", Vector3(-1379, 3712, 2.908), Rotation(-179, 0, -0), optsShield_03 ),

		restoration:gen_dummy(400011, "blast_door_blocker_04", Vector3(-1233, 3708, 2.908), Rotation(-179, 0, -0), optsShield_04 ),
		restoration:gen_dummy(400012, "blast_door_blocker_05", Vector3(-1078, 3710, 2.908), Rotation(-179, 0, -0), optsgrunt_05 ),

		restoration:gen_so(400013, "blast_door_so_01", Vector3(-1667, 3699, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400014, "blast_door_so_02", Vector3(-1527, 3712, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400015, "blast_door_so_03", Vector3(-1379, 3712, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),

		restoration:gen_so(400016, "blast_door_so_04", Vector3(-1233, 3708, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400017, "blast_door_so_05", Vector3(-1078, 3710, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		-- DOZER AND GUNNERS
		restoration:gen_dummy(400018, "helipad_resistence_01", Vector3(-1192.53, 4209.72, -0.217), Rotation(177, 0, -0), optsBulldozer_01 ),
		restoration:gen_dummy(400019, "helipad_resistence_02", Vector3(-1281, 4759, 101.783), Rotation(172, 0, -0), opts_gunner_1 ),
		restoration:gen_dummy(400020, "helipad_resistence_03", Vector3(-1052, 4736, 101.783), Rotation(172, 0, -0), opts_gunner_2 ),

		restoration:gen_so(400021, "helipad_defend_so_01", Vector3(-1192.53, 4209.72, -0.217), Rotation(177, 0, -0), optsDefend_SO ),
		restoration:gen_so(400022, "helipad_defend_so_02", Vector3(-1287.07, 4255.95, 8.783), Rotation(172, 0, -0), optsDefend_SO ),
		restoration:gen_so(400023, "helipad_defend_so_03", Vector3(-1101.89, 4222.95, 7.783), Rotation(172, 0, -0), optsDefend_SO ),
		-- mission script for the heavy defense 
		restoration:gen_missionscript(400024, "spawn_heavy_escape_resistance", opts_spawn_escape_defense),
		-- part 2 : cloakers

		restoration:gen_dummy(400029, "cloaker_pad_01", Vector3(-2012, 6251, 31.269), Rotation(179, 0, -0), opts_cloaker_helipad_01),
		restoration:gen_dummy(400030, "cloaker_pad_02", Vector3(-170, 6254, 31.269), Rotation(179, 0, -0), opts_cloaker_helipad_02),

		restoration:gen_so(400031, "spook_helipad_so_1", Vector3(-2005, 5036, 2.908), Rotation(-4, 0, -0),	optsCloaker_Hide_SO_01),
		restoration:gen_so(400032, "spook_helipad_so_2", Vector3(123, 4994, 2.908),  Rotation(132, 0, -0),	 optsCloaker_Hide_SO_02),
		-- missionscript for these 
		restoration:gen_missionscript(400037, "cloakers_and_snipers", opts_cloakers_and_snipers),

		-- weapons room vault door units (chance)
		restoration:gen_dummy(400038, "weapons_lab_vault_unit_01", Vector3(-4163, -4912, 0), Rotation(20, -0, -0), opts_vault_dozer),
		restoration:gen_dummy(400039,  "wepaons_lab_vault_01", Vector3(-4067, -4858, 0), Rotation(44, -0, -0), opts_vault_gunner_1),
		restoration:gen_dummy(400040, "weapons_lav_vault_02", Vector3(-4268, -4956, 0), Rotation(8, -0, -0), opts_vault_gunner_2), 

		restoration:gen_so(400041, "weapons_lab_vault_unit_so_01", Vector3(-4163, -4912, 0), Rotation(20, -0, -0), optsDefend_SO ),
		restoration:gen_so(400042, "weapons_lab_vault_unit_so_02",  Vector3(-4067, -4858, 0), Rotation(44, -0, -0), optsDefend_SO),
		restoration:gen_so(400043, "weapons_lav_vault_02", Vector3(-4268, -4956, 0), Rotation(8, -0, -0), optsDefend_SO),
		restoration:gen_missionscript(400044, "enable_weapons_lab_vault_defense", opts_weapons_lab_vault_units),

		-- did you check your corners heister?
		restoration:gen_dummy(400047, "clk_escape_01", Vector3(-1950, 1941, 0), Rotation(-92, 0, -0), opts_cloaker_esc_1),
		restoration:gen_dummy(400048, "clk_escape_02", Vector3(-1000, 2176, 0), Rotation(101, -0, -0), opts_cloaker_esc_2),

		restoration:gen_so(400045, "clk_esc_so_1",  Vector3(-1950, 1941, 0), Rotation(-92, 0, -0), optsCloaker_Hide_SO_02),
		restoration:gen_so(400046, "clk_esc_so_2",  Vector3(-1000, 2176, 0), Rotation(101, -0, -0), optsCloaker_Hide_SO_02),
		restoration:gen_missionscript(400049, "chance_clk_esc", opts_enable_chance_clk_esc),
		
		-- Units when each objective rooms are open 
		-- Weapon room
		restoration:gen_dummy(400050, "grunt_weapon_room_1", Vector3(-2166, -3233, 0), Rotation(0, 0, -0), opts_weapons_units_01),
		restoration:gen_dummy(400051, "grunt_weapon_room_2", Vector3(-2354, -3243, 0), Rotation(0, 0, -0), opts_weapons_units_02),
		restoration:gen_dummy(400052, "grunt_weapon_room_3", Vector3(-2167, -3120, 0), Rotation(0, 0, -0), opts_weapons_units_03),
		restoration:gen_dummy(400053, "grunt_weapon_room_4", Vector3(-2349, -3144, 0), Rotation(0, 0, -0), opts_weapons_units_02),
		restoration:gen_missionscript(400054, "enable_grunts_weapon_room", opts_enable_grunts_open_weapons_room),
		-- arc room 
		restoration:gen_dummy(400055, "grunt_arc_room_1", Vector3(2373.99, -3141, 0), Rotation(0, 0, -0), opts_arc_units_01),
		restoration:gen_dummy(400056, "grunt_arc_room_2", Vector3(2373.99, -3240, 0), Rotation(0, 0, -0), opts_arc_units_02),
		restoration:gen_dummy(400057, "grunt_arc_room_3", Vector3(2373.99, -3372, 0), Rotation(0, 0, -0), opts_arc_units_03),
		restoration:gen_dummy(400058, "grunt_arc_room_4", Vector3(2373.99, -3525, 0), Rotation(0, 0, -0), opts_arc_units_02),
		restoration:gen_missionscript(400059, "enable_grunts_arc_room", opts_enable_grunts_open_arc_room),
		-- computer room 
		restoration:gen_dummy(400060, "grunt_pc_room_1", Vector3(2399.99, -1283, 0), Rotation(0, 0, -0), opts_pc_units_01),
		restoration:gen_dummy(400061, "grunt_pc_room_2", Vector3(2295.99, -1285, 0), Rotation(0, 0, -0), opts_pc_units_02),
		restoration:gen_dummy(400062, "grunt_pc_room_3", Vector3(2400.99, -1405, 0), Rotation(0, 0, -0), opts_pc_units_03),
		restoration:gen_dummy(400063, "grunt_pc_room_4", Vector3(2295.99, -1405, 0), Rotation(0, 0, -0), opts_pc_units_02),
		restoration:gen_missionscript(400064, "enable_grunts_puter_room", opts_enable_grunts_open_pc_room),
		-- chem/lab room
		restoration:gen_dummy(400065, "grunt_lab_room_1", Vector3(-2372, -400, 0), Rotation(177.000, 0, -0), opts_lab_units_01),
		restoration:gen_dummy(400066, "grunt_lab_room_2", Vector3(-2260, -400, 0), Rotation(177.000, 0, -0), opts_lab_units_02),
		restoration:gen_dummy(400067, "grunt_lab_room_3", Vector3(-2260, -252, 0), Rotation(177.000, 0, -0), opts_lab_units_03),
		restoration:gen_dummy(400068, "grunt_lab_room_4", Vector3(-2390, -252, 0), Rotation(177.000, 0, -0), opts_lab_units_02),
		restoration:gen_missionscript(400069, "enable_grunts_lab_room", opts_enable_grunts_open_lab_room),
		-- Hunt_so for these 
		restoration:gen_so(4000070, "hunt_so", opts_hunt_so),

    },
}