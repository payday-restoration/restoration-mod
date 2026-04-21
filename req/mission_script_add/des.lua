local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
local cloaker = ((difficulty >= 8)  and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
local gunners = ((difficulty >= 8)  and "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky" or "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")
local shields = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city")
local snipers = ((difficulty >= 8) and "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper" or "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper")
local death_wish_above = difficulty >= 7

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
local optsCloaker_01 = {
    enabled = true,
    enemy = cloaker,
    on_executed = { { id = 400006, delay = 0}, },
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
		{ id = 400005, delay = 0, }, 
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
local optsShield_01 = {
	enabled = true,
	enemy = shields,
	on_executed = { {id = 400013,  delay = 0, }, },
}
local optsShield_02 = {
	enabled = true,
	enemy = shields,
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
local optsShield_05 = {
	enabled = true,
	enemy = shields,
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
local opts_sniper_helipad_01 = {
	enabled = true,
	enemy = snipers,
	on_executed = { { id = 400035, delay = 0, }, }, 
}
local opts_sniper_helipad_02 = {
	enabled = true,
	enemy = snipers,
	on_executed = { { id = 400036, delay = 0, }, }, 
}
local opts_cloakers_and_snipers = {
	enabled = death_wish_above,
	on_executed = {
		{ id = 400029, delay = 0,},
		{ id = 400030, delay = 0,},
		{ id = 400033, delay = 0,},
		{ id = 400034, delay = 0,},

	},
}
return {
    elements = {
        -- Weapon Labs Defense
		-- TITAN DOZERS GUARDIAN
        restoration:gen_dummy(400001, "railgun_guardian_01", Vector3(-4221, -3032, 0), Rotation(-113, 0, -0), optsTDozer_01),
		restoration:gen_dummy(400002, "railgun_guardian_02", Vector3(-4230, -3154, 0), Rotation(-85, 0, -0), optsTDozer_02),

		restoration:gen_so(400003, "railgun_defend_01",  Vector3(-4221, -3032, 0), Rotation(-113, 0, -0), optsDefend_SO), 
		restoration:gen_so(400004, "railgun_defend_02",  Vector3(-4230, -3154, 0), Rotation(-85, 0, -0), optsDefend_SO),

		-- CLOAKER
		restoration:gen_dummy(400005, "weapon_lab_ninja", Vector3(-4138, -3412, 0), Rotation(0, 0, -0), optsCloaker_01),
		restoration:gen_so(400006, "weapons_lab_ninja_so", Vector3(-4138, -3412, 0), Rotation(9, -0, -0), optsCloaker_Hide_SO_02),
		-- Snipers 
		restoration:gen_dummy(400025, "weapon_lab_sniper_01", Vector3(-3842.79, -2954.82, 0), Rotation(-105, 0, -0), optsSniper_01),
		restoration:gen_dummy(400026, "weapon_lab_sniper_02", Vector3(-3647, -3673, 0), Rotation(-65, 0, -0), optsSniper_02),

		restoration:gen_so(400027, "railgun_defend_03",  Vector3(-3842.79, -2954.82, 0), Rotation(-105, 0, -0), optsDefend_SO), 
		restoration:gen_so(400028, "railgun_defend_04",  Vector3(-3647, -3673, 0), Rotation(-65, 0, -0), optsDefend_SO),

		-- misison script
		restoration:gen_missionscript(400007, "spawn_railgun_defenders", opts_spawn__weapon_lab_defenders),

		-- The Sharks are giving everything they have to stop you. give em hell.
		-- SHIELD WALL
		restoration:gen_dummy(400008, "blast_door_blocker_01", Vector3(-1667, 3699, 2.908), Rotation(-179, 0, -0), optsShield_01 ),
		restoration:gen_dummy(400009, "blast_door_blocker_02", Vector3(-1527, 3712, 2.908), Rotation(-179, 0, -0), optsShield_02 ),
		restoration:gen_dummy(400010, "blast_door_blocker_03", Vector3(-1379, 3712, 2.908), Rotation(-179, 0, -0), optsShield_03 ),

		restoration:gen_dummy(400011, "blast_door_blocker_04", Vector3(-1233, 3708, 2.908), Rotation(-179, 0, -0), optsShield_04 ),
		restoration:gen_dummy(400012, "blast_door_blocker_05", Vector3(-1078, 3710, 2.908), Rotation(-179, 0, -0), optsShield_05 ),

		restoration:gen_so(400013, "blast_door_so_01", Vector3(-1667, 3699, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400014, "blast_door_so_02", Vector3(-1527, 3712, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400015, "blast_door_so_03", Vector3(-1379, 3712, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),

		restoration:gen_so(400016, "blast_door_so_04", Vector3(-1233, 3708, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		restoration:gen_so(400017, "blast_door_so_05", Vector3(-1078, 3710, 2.908), Rotation(-179, 0, -0), optsDefend_SO ),
		-- DOZER AND GUNNERS
		restoration:gen_dummy(400018, "helipad_resistence_01", Vector3(-1165, 4735, 101.783), Rotation(177, 0, -0), optsBulldozer_01 ),
		restoration:gen_dummy(400019, "helipad_resistence_02", Vector3(-1281, 4759, 101.783), Rotation(172, 0, -0), opts_gunner_1 ),
		restoration:gen_dummy(400020, "helipad_resistence_03", Vector3(-1052, 4736, 101.783), Rotation(172, 0, -0), opts_gunner_2 ),

		restoration:gen_so(400021, "helipad_defend_so_01", Vector3(-1165, 4735, 101.783), Rotation(177, 0, -0), optsDefend_SO ),
		restoration:gen_so(400022, "helipad_defend_so_02", Vector3(-1281, 4759, 101.783), Rotation(172, 0, -0), optsDefend_SO ),
		restoration:gen_so(400023, "helipad_defend_so_03", Vector3(-1052, 4736, 101.783), Rotation(172, 0, -0), optsDefend_SO ),
		-- mission script for the heavy defense 
		restoration:gen_missionscript(400024, "spawn_heavy_escape_resistance", opts_spawn_escape_defense),
		-- part 2 : cloakers and snipers

		restoration:gen_dummy(400029, "cloaker_pad_01", Vector3(-2012, 6251, 31.269), Rotation(179, 0, -0), opts_cloaker_helipad_01),
		restoration:gen_dummy(400030, "cloaker_pad_02", Vector3(-170, 6254, 31.269), Rotation(179, 0, -0), opts_cloaker_helipad_02),

		restoration:gen_so(400031, "spook_helipad_so_1", Vector3(-2005, 5036, 2.908), Rotation(-4, 0, -0),	optsCloaker_Hide_SO_01),
		restoration:gen_so(400032, "spook_helipad_so_2", Vector3(123, 4994, 2.908),  Rotation(132, 0, -0),	 optsCloaker_Hide_SO_02),

		restoration:gen_dummy(400033, "sniper_helipad_01", Vector3(-861, 4717, 101.783), Rotation(176, 0, -0),  opts_sniper_helipad_01),
		restoration:gen_dummy(400034, "sniper_helipad_02", Vector3(-1333, 4935, 101.783), Rotation(176, 0, -0),  opts_sniper_helipad_02),

		restoration:gen_so(400035, "snip_helipad_so_1", Vector3(-861, 4717, 101.783), Rotation(176, 0, -0), optsDefend_SO),
		restoration:gen_so(400036, "snip_helipad_so_2", Vector3(-1333, 4935, 101.783), Rotation(176, 0, -0), optsDefend_SO),
		-- missionscript for these 
		restoration:gen_missionscript(400037, "cloakers_and_snipers", opts_cloakers_and_snipers),
    },
}