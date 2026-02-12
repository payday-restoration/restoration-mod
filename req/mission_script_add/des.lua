local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
local cloaker = ((difficulty >= 8)  and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
local gunners = ((difficulty >= 8)  and "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky" or "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")
local shields = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city")
local snipers = ((difficulty >= 8) and "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper" or "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2")
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
    enabled = false,
    enemy = cloaker,
    on_executed = {
        { id = 400006, delay = 0},
    },
}
local optsTDozer_01 = {
    enabled = false,
    enemy = titan_dozer,
    on_executed = {
        { id = 400003, delay = 0},
    },
}
local optsTDozer_02 = {
    enabled = false,
    enemy = titan_dozer,
    on_executed = {
        { id = 400004, delay = 0},
    },
}
local optsSniper_01 = {
	enabled = false,
	enemy = snipers,
	on_executed = {
		{ id = 400027, delay = 0},
	},
}
local optsSniper_02 = {
	enabled = false,
	enemy = snipers,
	on_executed = {
		{ id = 400028, delay = 0},
	},
}
local opts_enable__weapon_lab_defenders = {
	enabled = death_wish_above,
	elements = { 400001 , 400002, 400005, 400025,  400026},
	toggle = "on",
}
local optsCloaker_Hide_SO_weapon_lab = {
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
local optsBulldozer_01 = {
    enabled = false,
    enemy = tank_skull,
    on_executed = {
        { id = 400021, delay = 0}
    },
}
local opts_gunner_1 = {
	enemy = gunners,
	enabled = false,
	on_executed = {
		{id =  400022, delay = 0,},
	},
}
local opts_gunner_2 = {
	enemy = gunners,
	enabled = false,
	on_executed = {
		{id = 400023, delay = 0,},
	}
}
local optsShield_01 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id = 400013,  delay = 0, },
	},
}
local optsShield_02 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id = 400014,  delay = 0, },
	},
}
local optsShield_03 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id = 400015, delay = 0, },
	},
}
local optsShield_04 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400016,  delay = 0, },
	},
}
local optsShield_05 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400017,  delay = 0, },
	},
}
local opts_enable_escape_defense = {
	enabled = death_wish_above,
	elements = {400008, 400009, 400010, 400011, 400012, 400018, 400019, 400020 },
		toggle = "on",
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
		restoration:gen_dummy(400005, "weapon_lab_ninja", Vector3(-3601, -3794, 0), Rotation(0, 0, -0), optsCloaker_01),
		restoration:gen_so(400006, "weapons_lab_ninja_so", Vector3(-3623.54, -3703.27, 0), Rotation(9, -0, -0), optsCloaker_Hide_SO_weapon_lab),
		-- Snipers 
		restoration:gen_dummy(400025, "weapon_lab_sniper_01", Vector3(-4321, -3152, 0), Rotation(-105, 0, -0), optsSniper_01),
		restoration:gen_dummy(400026, "weapon_lab_sniper_02", Vector3(-4313, -3000, 0), Rotation(-115, 0, -0), optsSniper_02),

		restoration:gen_so(400027, "railgun_defend_03",  Vector3(-4321, -3152, 0), Rotation(-105, 0, -0), optsDefend_SO), 
		restoration:gen_so(400028, "railgun_defend_04",  Vector3(-4317, -3000, 0), Rotation(-99, 0, -0), optsDefend_SO),

		-- toggle
		restoration:gen_toggleelement(400007, "enable_railgun_defenders", opts_enable__weapon_lab_defenders),

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
		-- toggle 
		restoration:gen_toggleelement(400024, "enable_heavy_escape_resistance", opts_enable_escape_defense),
    },
}