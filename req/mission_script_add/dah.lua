local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
local sniper = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"
local swat_rifle = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"
local swat_shotgun = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"
local swat_smg = "units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"
local swat_heavy_rifle = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"
local swat_heavy_shotgun = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local pro_job = Global.game_settings and Global.game_settings.one_down
local diff_scaling = 0.065 * difficulty
local hard_above = difficulty >= 3
local overkill_above = difficulty >= 5
local death_sentence = difficulty == 8
local enabled_chance_extra_elevator_spawns = math.random() < diff_scaling
local enabled_chance_helipad_shields = math.random() < diff_scaling
local enabled_chance_helipad_dozer = math.random() < diff_scaling
	
	if difficulty == 6 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		sniper = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
		swat_rifle = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_shotgun = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_smg = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_heavy_rifle = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		swat_heavy_shotgun = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
	elseif difficulty == 7 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
		sniper = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"
		swat_rifle = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1"
		swat_shotgun = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"
		swat_smg = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"
		swat_heavy_rifle = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_heavy_shotgun = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
	elseif difficulty == 8 then
		--PD3 styled heavy only squad xd
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		swat_rifle = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_shotgun = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
		swat_smg = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_heavy_rifle = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_heavy_shotgun = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end
	
	if pro_job and difficulty == 8 then
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
	end

local optsCloaker = {
    enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_climb_up_3m_down_1m",
	on_executed = { 
		{ id = 400078, delay = 4.5 } 
	},
    enabled = true
}
local optsSniperAmbush_1 = {
	enemy = sniper,
	on_executed = {
        { id = 400014, delay = 0 },
    },
    enabled = death_sentence
}
local optsSniperAmbush_2 = {
	enemy = sniper,
	on_executed = {
        { id = 400017, delay = 0 },
    },
    enabled = death_sentence
}
local optsSniperAmbush_3 = {
	enemy = sniper,
	on_executed = {
        { id = 400016, delay = 0 },
    },
    enabled = death_sentence
}
local optsSniperAmbush_4 = {
	enemy = sniper,
	on_executed = {
        { id = 400015, delay = 0 },
    },
    enabled = death_sentence
}
local optsSniper_escape = {
	enemy = sniper,
	on_executed = {
        { id = 400060, delay = 5 },
    },
	spawn_action = "e_sp_climb_up_3m_down_1m",
    enabled = true
}
local optsSniper_1 = {
	enemy = sniper,
	on_executed = {
        { id = 400074, delay = 2.5 },
    },
	spawn_action = "e_sp_clk_up_manhole", --I like using cloaker specific spawn anims for other units
    enabled = overkill_above
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = {
        { id = 400075, delay = 2.5 },
    },
	spawn_action = "e_sp_clk_up_manhole",
    enabled = overkill_above
}
local optsShield_roofblockade_1 = {
    enemy = shield,
    on_executed = { 
		{ id = 400051, delay = 3 } 
	},
	spawn_action = "e_sp_clk_3_5m_dwn_vent_var2",
    enabled = overkill_above
}
local optsShield_roofblockade_2 = {
    enemy = shield,
    on_executed = { 
		{ id = 400052, delay = 3 } 
	},
	spawn_action = "e_sp_clk_3_5m_dwn_vent_var2",
    enabled = overkill_above
}
local optsShield_roofblockade_3 = {
    enemy = shield,
    on_executed = { 
		{ id = 400057, delay = 4.5 } 
	},
	spawn_action = "e_sp_climb_up_3m_down_1m",
    enabled = overkill_above
}
local optsShield_roofblockade_4 = {
    enemy = shield,
    on_executed = { 
		{ id = 400058, delay = 4.5 } 
	},
	spawn_action = "e_sp_climb_up_3m_down_1m",
    enabled = overkill_above
}
local optsTaser_roofblockade_1 = {
    enemy = taser,
	on_executed = { 
		{ id = 400050, delay = 3 } 
	},
	spawn_action = "e_sp_clk_3_5m_dwn_vent_var2",
    enabled = overkill_above
}
local optsTaser_roofblockade_2 = {
    enemy = taser,
	on_executed = { 
		{ id = 400056, delay = 4.5 } 
	},
	spawn_action = "e_sp_climb_up_3m_down_1m",
    enabled = overkill_above
}
local optsBulldozer = {
    enemy = tank,
	participate_to_group_ai = true,
    enabled = (overkill_above and enabled_chance_extra_elevator_spawns)
}
local optsBulldozer_helipad = {
    enemy = tank,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400069, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_helipad_dozer)
}
local optsShield_helipad_1 = {
    enemy = shield,
	on_executed = { 
		{ id = 400070, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_helipad_shields)
}
local optsShield_helipad_2 = {
    enemy = shield,
	on_executed = { 
		{ id = 400071, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_helipad_shields)
}
local optsTaser = {
    enemy = taser,
	participate_to_group_ai = true,
    enabled = (overkill_above and enabled_chance_extra_elevator_spawns)
}
local optsBulldozer_Ambush = {
    enemy = tank,
	participate_to_group_ai = true,
    enabled = death_sentence
}
local optsCloaker_Ambush = {
    enemy = cloaker,
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsTaser_Ambush = {
    enemy = taser,
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsSWAT_Rifle = {
    enemy = swat_rifle,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_Shotgun = {
    enemy = swat_shotgun,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_SMG = {
    enemy = swat_smg,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyRifle = {
    enemy = swat_heavy_rifle,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyShotgun = {
    enemy = swat_heavy_shotgun,
	participate_to_group_ai = true,
    enabled = true
}
local optsDefend_and_Sniper_SO = {
	SO_access = tostring(512+2048+8192),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsDefendDozer_SO = {
	SO_access = "4096",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_defend"
}
local optsCloaker_SO = {
    SO_access = "1024",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsrespawn_taser_and_shields_1 = {
	on_executed = { 
		{ id = 400047, delay = 45 },
		{ id = 400048, delay = 46 },
		{ id = 400049, delay = 47 }
	},
	elements = { 
		400047
	},
    event = "death"
}
local optsrespawn_taser_and_shields_2 = {
	on_executed = { 
		{ id = 400053, delay = 47 },
		{ id = 400054, delay = 46 },
		{ id = 400055, delay = 45 }
	},
	elements = { 
		400053
	},
    event = "death"
}
local enable_snipers = {
	enabled = true,
	elements = { 
		400072,
		400073
	}
}
local disable_snipers = {
	enabled = true,
	toggle = "off",
	elements = { 
		400072,
		400073
	}
}
local Smoke_bomb = {
	duration = 8
}

return {
    elements = {
        --Cloakers
        restoration:gen_dummy(
            400001,
            "cloaker_1",
            Vector3(-100, -1834, 1175),
            Rotation(90, 0, -0),
            optsCloaker
        ),
        restoration:gen_dummy(
            400002,
            "cloaker_2",
            Vector3(-100, -1967, 1175),
            Rotation(90, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400003,
            "cloaker_3",
            Vector3(-100, -1903, 1175),
            Rotation(90, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400004,
            "cloaker_4",
            Vector3(-6175, -5325, 1175),
            Rotation(0, -0, -0),
            optsCloaker
        ),
        restoration:gen_dummy(
            400005,
            "cloaker_5",
            Vector3(-6275, -5325, 1175),
            Rotation(0, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400006,
            "cloaker_6",
            Vector3(-6375, -5325, 1175),
            Rotation(0, -0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400007,
            "cloaker_7",
            Vector3(-6531, -291, 1175.010),
            Rotation(-90, 0, -0),
            optsCloaker
        ),
        restoration:gen_dummy(
            400008,
            "cloaker_8",
			Vector3(-6531, -196, 1175.010),
            Rotation(-90, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400009,
            "cloaker_9",
            Vector3(-6531, -116, 1175.010),
            Rotation(-90, 0, -0),
            optsCloaker
        ),
		--Ambush Units
		--Snipers
		restoration:gen_dummy(
            400010,
            "sniper_ambush_1",
            Vector3(-5217, -4047, 50),
            Rotation(0, 0, -0),
            optsSniperAmbush_1
        ),
		restoration:gen_dummy(
            400011,
            "sniper_ambush_2",
            Vector3(-5217, -5138, 50),
            Rotation(-180, 0, -0),
            optsSniperAmbush_2
        ),
		restoration:gen_dummy(
            400012,
            "sniper_ambush_3",
            Vector3(-1377, -5145, 50),
            Rotation(180, 0, -0),
            optsSniperAmbush_3
        ),
		restoration:gen_dummy(
            400013,
            "sniper_ambush_4",
            Vector3(-1383, -4046, 50),
            Rotation(0, 0, -0),
            optsSniperAmbush_4
        ),
		restoration:gen_so(
            400014,
            "sniper_ambush_so_1",
            Vector3(-4545, -4146, 50),
            Rotation(-135, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400015,
            "sniper_ambush_so_2",
            Vector3(-2837, -4052, 50),
            Rotation(90, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400016,
            "sniper_ambush_so_3",
            Vector3(-2633.425, -5111.369, 51),
            Rotation(35, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400017,
            "sniper_ambush_so_4",
            Vector3(-3976, -5087, 50),
            Rotation(-25, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		--Cloakers
		restoration:gen_dummy(
            400018,
            "kiryu_kazuma",
            Vector3(-1424, -4215, 50),
            Rotation(0, 0, -0),
            optsCloaker_Ambush
        ),
		restoration:gen_dummy(
            400019,
            "majima_goro",
            Vector3(-1424, -4988, 50),
            Rotation(-180, 0, -0),
            optsCloaker_Ambush
        ),
		--Tasers
		restoration:gen_dummy(
            400020,
            "taser_ambush_1",
            Vector3(-5175, -4990, 50),
            Rotation(180, 0, -0),
            optsTaser_Ambush
        ),
		restoration:gen_dummy(
            400021,
            "taser_ambush_2",
            Vector3(-5171, -4210, 50),
            Rotation(0, 0, -0),
            optsTaser_Ambush
        ),
		--Dozer
		restoration:gen_dummy(
            400022,
            "dozer_ambush_1",
            Vector3(-1425, -5148, 50),
            Rotation(180, 0, -0),
            optsBulldozer_Ambush
        ),
		--SWAT
		restoration:gen_dummy(
            400023,
            "swat_ambush_1",
            Vector3(-1368, -4156, 50),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400024,
            "swat_ambush_2",
            Vector3(-1428, -4156, 50),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400025,
            "swat_ambush_3",
            Vector3(-1499, -4156, 50),
            Rotation(0, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400026,
            "swat_ambush_4",
            Vector3(-1368, -4082, 50),
            Rotation(0, 0, -0),
            optsSWAT_Shotgun
        ),
		restoration:gen_dummy(
            400027,
            "swat_ambush_5",
            Vector3(-1428, -4082, 50),
            Rotation(0, 0, -0),
            optsSWAT_Shotgun
        ),
		restoration:gen_dummy(
            400028,
            "swat_ambush_6",
            Vector3(-1499, -4082, 50),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400029,
            "swat_ambush_7",
            Vector3(-1481, -5029, 50),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyRifle
        ),
		restoration:gen_dummy(
            400030,
            "swat_ambush_8",
            Vector3(-1428, -5029, 50),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400031,
            "swat_ambush_9",
            Vector3(-1369, -5029, 50),
            Rotation(-180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400032,
            "swat_ambush_10",
            Vector3(-1477, -5102, 50),
            Rotation(-180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400033,
            "swat_ambush_11",
            Vector3(-1425, -5102, 50),
            Rotation(-180, 0, -0),
            optsSWAT_Shotgun
        ),
		restoration:gen_dummy(
            400034,
            "swat_ambush_12",
            Vector3(-1370, -5102, 50),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400035,
            "swat_ambush_13",
            Vector3(-5119, -5102, 50),
            Rotation(180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400036,
            "swat_ambush_14",
            Vector3(-5170, -5102, 50),
            Rotation(180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400037,
            "swat_ambush_15",
            Vector3(-5229, -5102, 50),
            Rotation(180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400038,
            "swat_ambush_16",
            Vector3(-5229, -5027, 50),
            Rotation(180, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400039,
            "swat_ambush_17",
            Vector3(-5170, -5027, 50),
            Rotation(180, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400040,
            "swat_ambush_18",
            Vector3(-5117, -5027, 50),
            Rotation(180, 0, -0),
            optsSWAT_Shotgun
        ),
		restoration:gen_dummy(
            400041,
            "swat_ambush_19",
            Vector3(-5117, -4157, 50),
            Rotation(0, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400042,
            "swat_ambush_20",
            Vector3(-5173, -4157, 50),
            Rotation(0, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400043,
            "swat_ambush_21",
            Vector3(-5230, -4157, 50),
            Rotation(0, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400044,
            "swat_ambush_22",
            Vector3(-5230, -4083, 50),
            Rotation(0, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400045,
            "swat_ambush_23",
            Vector3(-5175, -4083, 50),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400046,
            "swat_ambush_24",
            Vector3(-5118, -4083, 50),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		--Roof Acesss blockades
		restoration:gen_dummy(
            400047,
            "taser_roof_access_blockade_1",
            Vector3(-1205, -3532, 1175),
            Rotation(87, -0, -0),
            optsTaser_roofblockade_1
        ),
		restoration:gen_dummy(
            400048,
            "shield_roof_access_blockade_1",
            Vector3(-1205, -3532, 1175),
            Rotation(87, -0, -0),
            optsShield_roofblockade_1
        ),
		restoration:gen_dummy(
            400049,
            "shield_roof_access_blockade_2",
            Vector3(-1205, -3532, 1175),
            Rotation(87, -0, -0),
            optsShield_roofblockade_2
        ),
		restoration:gen_so(
            400050,
            "taser_blockade_so_1",
            Vector3(-1306, -3507, 1175),
            Rotation(-180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400051,
            "shield_blockade_so_1",
            Vector3(-1340, -3998, 975),
            Rotation(0, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400052,
            "shield_blockade_so_2",
            Vector3(-1457, -4001, 975),
            Rotation(0, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummy(
            400053,
            "taser_roof_access_blockade_2",
            Vector3(-6505, -3849, 1175),
            Rotation(-90, -0, -0),
            optsTaser_roofblockade_2
        ),
		restoration:gen_dummy(
            400054,
            "shield_roof_access_blockade_3",
            Vector3(-6505, -3849, 1175),
            Rotation(-90, -0, -0),
            optsShield_roofblockade_3
        ),
		restoration:gen_dummy(
            400055,
            "shield_roof_access_blockade_4",
            Vector3(-6505, -3849, 1175),
            Rotation(-90, -0, -0),
            optsShield_roofblockade_4
        ),
		restoration:gen_so(
            400056,
            "taser_blockade_so_2",
            Vector3(-5886, -4567, 954.429),
            Rotation(180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400057,
            "shield_blockade_so_3",
            Vector3(-5913, -4815, 828.259),
            Rotation(180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400058,
            "shield_blockade_so_4",
            Vector3(-5828, -4812, 829.808),
            Rotation(180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		--Escape Sniper
		restoration:gen_dummy(
            400059,
            "sniper_escape",
            Vector3(-6505, -3991, 1175),
            Rotation(-90, 0, -0),
            optsSniper_escape
        ),
		restoration:gen_so(
            400060,
            "sniper_escape_so",
            Vector3(-5656, -2866, 1384.381),
            Rotation(-90, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		--Elevator spawns
		restoration:gen_dummy(
            400061,
            "dozer_elevator_1",
            Vector3(-2350, -3627, 375),
            Rotation(90, -0, -0),
            optsBulldozer
        ),
		restoration:gen_dummy(
            400062,
            "taser_elevator_1",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400063,
            "taser_elevator_2",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsTaser
        ),
		--Respawns
		restoration:gen_dummytrigger(
            400064,
            "respawn_the_blockade_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_taser_and_shields_1
        ),
		restoration:gen_dummytrigger(
            400065,
            "respawn_the_blockade_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_taser_and_shields_2
        ),
		--Helipad blockade
		restoration:gen_dummy(
            400066,
            "dozer_helipad_1",
            Vector3(-6327, -1493, 1175),
            Rotation(0, 0, -0),
            optsBulldozer_helipad
        ),
		restoration:gen_dummy(
            400067,
            "shield_helipad_1",
            Vector3(-6333, -1457, 1175),
            Rotation(0, 0, -0),
            optsShield_helipad_1
        ),
		restoration:gen_dummy(
            400068,
            "shield_helipad_2",
            Vector3(-6333, -1521, 1175),
            Rotation(0, 0, -0),
            optsShield_helipad_2
        ),
		restoration:gen_so(
            400069,
            "dozer_helipad_so",
            Vector3(-5122, -1505, 1174.972),
            Rotation(-90, 0, -0),
            optsDefendDozer_SO
        ),
		restoration:gen_so(
            400070,
            "shield_helipad_so_1",
            Vector3(-6095, -1565, 1382.926),
            Rotation(-90, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400071,
            "shield_helipad_so_2",
            Vector3(-6095, -1484, 1380.926),
            Rotation(-90, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummy(
            400072,
            "sniper_atrium_1",
            Vector3(-4164, -3636, 376.151),
            Rotation(-90, 0, -0),
            optsSniper_1
        ),
        restoration:gen_dummy(
            400073,
            "sniper_atrium_2",
            Vector3(-4164, -3636, 376.151),
            Rotation(-90, 0, -0),
            optsSniper_2
        ),
		restoration:gen_so(
            400074,
            "sniper_atrium_so_1",
            Vector3(-3478, -2413, 379.754),
            Rotation(0, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400075,
            "sniper_atrium_so_2",
            Vector3(-2964, -2366, 379.754),
            Rotation(0, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_toggleelement(
            400076,
            "enable_snipers",
            enable_snipers
        ),
		restoration:gen_toggleelement(
            400077,
            "disable_snipers",
            disable_snipers
        ),
		restoration:gen_so(
            400078,
            "cloaker_hunt_so",
            Vector3(-100, -1903, 1175),
            Rotation(90, -0, -0),
            optsCloaker_SO
        ),
		restoration:gen_smokeandnades(
            400079,
            "smoke_grenade_1",
            Vector3(-2358, -4657, 21.226),
            Rotation(0, 0, -0),
            Smoke_bomb
        ),
		restoration:gen_smokeandnades(
            400080,
            "smoke_grenade_2",
            Vector3(-3291, -4657, 21.226),
            Rotation(0, 0, -0),
            Smoke_bomb
        ),
		restoration:gen_smokeandnades(
            400081,
            "smoke_grenade_3",
            Vector3(-4283, -4657, 21.226),
            Rotation(0, 0, -0),
            Smoke_bomb
        )
    }
}
