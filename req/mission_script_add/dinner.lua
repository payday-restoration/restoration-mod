local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local murkyman_1 = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
local murkyman_2 = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
local murkyman_3 = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
local shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
local sniper = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local pro_job = Global.game_settings and Global.game_settings.one_down
local hard_above = difficulty >= 3
local overkill_above = difficulty >= 5
local diff_scaling = 0.085 * difficulty
local enabled_chance_cloakers = math.random() < diff_scaling
local enabled_chance_shields_and_tazer = math.random() < diff_scaling
local enabled_chance_shields_and_tazer_2 = math.random() < diff_scaling
local enabled_chance_shields_and_dozer = math.random() < diff_scaling
	
	if difficulty == 6 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		sniper = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
	elseif difficulty == 7 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
		sniper = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"
	elseif difficulty == 8 then
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
	end
	
if pro_job then
	if difficulty >= 5 then
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
	if difficulty == 8 then
		cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
	end
end	


local spawn_cloakers = {
	enabled = (hard_above and enabled_chance_cloakers),
	on_executed = { 
		{ id = 400001, delay = 0 },
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400049, delay = 0 }
	}
}
local spawn_shields_and_taser_1 = {
	enabled = enabled_chance_shields_and_tazer,
	on_executed = { 
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400051, delay = 0 }
	}
}
local spawn_shields_and_taser_2 = {
	enabled = enabled_chance_shields_and_tazer_2,
	on_executed = { 
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
		{ id = 400009, delay = 0 },
		{ id = 400051, delay = 0 }
	}
}
local spawn_shields_and_dozer = {
	enabled = enabled_chance_shields_and_dozer,
	on_executed = { 
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400050, delay = 0 }
	}
}
local spawn_murkies = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0 },
		{ id = 400030, delay = 0 },
		{ id = 400031, delay = 0 },
		{ id = 400032, delay = 0 },
		{ id = 400033, delay = 0 },
		{ id = 400034, delay = 0 },
		{ id = 400035, delay = 0 },
		{ id = 400036, delay = 0 },
		{ id = 400037, delay = 0 },
		{ id = 400038, delay = 0 },
		{ id = 400039, delay = 0 }
	}
}
local optsBesiegeDummy = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_armored_truck_1st"
}
local optsCloaker = {
    enemy = cloaker,
	on_executed = { 
		{ id = 400059, delay = 3 }
	},
    enabled = true
}
local optsTaser = {
    enemy = taser,
	on_executed = { 
		{ id = 400059, delay = 3 }
	},
    enabled = true
}
local optsShield = {
    enemy = shield,
	on_executed = { 
		{ id = 400059, delay = 3 }
	},
    enabled = true
}
local optsBulldozer_Ambush = {
    enemy = tank,
	on_executed = { 
		{ id = 400059, delay = 3 }
	},
    enabled = true
}
local spawn_dozer_1 = {
	enabled = true,
	trigger_times = 1,
	on_executed = {
		{ id = 400019, delay = 0 }
	}
}
local spawn_dozer_2 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400020, delay = 0 }
	}
}
local optsBulldozer = {
    enemy = tank,
	on_executed = {
        { id = 400021, delay = 1.5 },
		{ id = 400050, delay = 0 }
    },
    enabled = true
}
local optsBulldozer_SO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsHunt_SO = {
    SO_access = tostring(1024+2048+4096+8192),
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsSniper_1 = {
	enemy = sniper,
	on_executed = {
        { id = 400016, delay = 0 },
    },
    enabled = true
}
local optsSniper_2 = {
	enemy = sniper,
	spawn_action = "e_sp_up_ledge",
	on_executed = {
        { id = 400017, delay = 2 }
    },
    enabled = overkill_above
}
local optsSniper_3 = {
	enemy = sniper,
	spawn_action = "e_sp_up_ledge",
	on_executed = {
        { id = 400018, delay = 2 }
    },
    enabled = overkill_above
}
local optsMurky_Rifle = {
    enemy = murkyman_1,
	participate_to_group_ai = true,
    enabled = true
}
local optsMurky_Shotgun = {
    enemy = murkyman_2,
	participate_to_group_ai = true,
    enabled = true
}
local optsMurky_SMG = {
    enemy = murkyman_3,
	participate_to_group_ai = true,
    enabled = true
}
local optsTaser = {
    enemy = taser,
	participate_to_group_ai = true,
    enabled = true
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsrespawn_murkies_1 = {
	on_executed = { 
		{ id = 400028, delay = 35 },
		{ id = 400029, delay = 35 },
		{ id = 400030, delay = 35 },
		{ id = 400031, delay = 35 }
	},
	elements = { 
		400028
	},
    event = "death"
}
local optsrespawn_murkies_2 = {
	on_executed = { 
		{ id = 400032, delay = 35 },
		{ id = 400033, delay = 35 },
		{ id = 400034, delay = 35 },
		{ id = 400035, delay = 35 }
	},
	elements = { 
		400032
	},
    event = "death"
}
local optsrespawn_murkies_3 = {
	on_executed = { 
		{ id = 400036, delay = 35 },
		{ id = 400037, delay = 35 },
		{ id = 400038, delay = 35 },
		{ id = 400039, delay = 35 }
	},
	elements = { 
		400036
	},
    event = "death"
}
local optsrespawn_dozer_1 = {
	on_executed = { 
		{ id = 400019, delay = 120 }
	},
	elements = { 
		400019
	},
    event = "death"
}
local optsrespawn_dozer_2 = {
	on_executed = { 
		{ id = 400020, delay = 120 }
	},
	elements = { 
		400020
	},
    event = "death"
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_a",
	can_not_be_muted = true
}
local Bain_sendcloakers = {
	dialogue = "Play_ban_s04",
	can_not_be_muted = true
}
local Bain_sendtasers = {
	dialogue = "Play_ban_s01_a",
	can_not_be_muted = true
}
local van_spawngroup  = {
	spawn_groups = {
		400026
	}
}
local enable_dozer = {
	elements = { 
		400020
	}
}
local disable_dozer = {
	toggle = "off",
	elements = { 
		400020
	}
}
local disable_dozer_2 = {
	toggle = "off",
	elements = { 
		400019
	}
}
local disable_murkies = {
	toggle = "off",
	elements = { 
		400040,
		400041,
		400042
	}
}

return {
    elements = {
        --Ambush
        restoration:gen_dummy(
            400001,
            "cloaker_1",
            Vector3(-12545, 7176, 4.995),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
        restoration:gen_dummy(
            400002,
            "cloaker_2",
            Vector3(-12458, 7282, 4.995),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400003,
            "cloaker_3",
            Vector3(-12607, 7282, 4.995),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400004,
            "shield_1",
            Vector3(-12073, 7142, 4.995),
            Rotation(-180, 0, -0),
            optsShield
        ),
        restoration:gen_dummy(
            400005,
            "shield_2",
            Vector3(-11981, 7142, 4.995),
            Rotation(-180, 0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400006,
            "taser_1",
            Vector3(-12023, 7209, 4.995),
            Rotation(-180, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400007,
            "shield_3",
            Vector3(-13408, 7176, 4.995),
            Rotation(-180, 0, -0),
            optsShield
        ),
        restoration:gen_dummy(
            400008,
            "shield_4",
            Vector3(-13334, 7176, 4.995),
            Rotation(-180, 0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400009,
            "taser_2",
            Vector3(-13371, 7262, 4.995),
            Rotation(-180, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400010,
            "shield_3",
            Vector3(-13666, 6195, 4.995),
            Rotation(0, 0, -0),
            optsShield
        ),
        restoration:gen_dummy(
            400011,
            "shield_4",
            Vector3(-13756, 6195, 4.995),
            Rotation(0, 0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400012,
            "bulldozer_1",
            Vector3(-13707, 6078, 4.995),
            Rotation(0, 0, -0),
            optsBulldozer_Ambush
        ),
		--Snipers
		restoration:gen_dummy(
            400013,
            "sniper_1",
            Vector3(-13496, 6470, 889.902),
            Rotation(90, 0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400014,
            "sniper_2",
            Vector3(-20101, 6888, 747.404),
            Rotation(-90, 0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400015,
            "sniper_3",
            Vector3(-16210, 9663, 1012.404),
            Rotation(180, 0, -0),
            optsSniper_3
        ),
		restoration:gen_so(
            400016,
            "sniper_so_1",
            Vector3(-14186, 6438, 887.654),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400017,
            "sniper_so_2",
            Vector3(-19603, 6971, 747.404),
            Rotation(-90, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400018,
            "sniper_so_3",
            Vector3(-16155, 9187, 1012.404),
            Rotation(180, 0, -0),
            optsSniper_SO
        ),
		--Dozers
		restoration:gen_dummy(
            400019,
            "bulldozer_2",
            Vector3(-8785, 3730, -72),
            Rotation(-90, 0, -0),
            optsBulldozer
        ),
		restoration:gen_dummy(
            400020,
            "bulldozer_3",
            Vector3(-13231, 6749, 889.902),
            Rotation(90, 0, -0),
            optsBulldozer
        ),
		restoration:gen_so(
            400021,
            "dozer_hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsBulldozer_SO
        ),
		--SWAT
		restoration:gen_dummy(
            400022,
            "van_dummy_1",
            Vector3(-15438.496, 5177.672, -81.025),
            Rotation(170, 0, -0),
            optsBesiegeDummy
        ),
		restoration:gen_dummy(
            400023,
            "van_dummy_2",
            Vector3(-15371.752, 5177.833, -81.025),
            Rotation(172, 0, -0),
            optsBesiegeDummy
        ),
		restoration:gen_dummy(
            400024,
            "van_dummy_3",
            Vector3(-15495.743, 4220.271, -81.025),
            Rotation(-171, 0, -0),
            optsBesiegeDummy
        ),
		restoration:gen_dummy(
            400025,
            "van_dummy_4",
            Vector3(-15430.557, 4230.596, -81.025),
            Rotation(-171, 0, -0),
            optsBesiegeDummy
        ),
		restoration:gen_spawngroup(
			400026,
			"van_spawngroup",
			{400022, 400023, 400024, 400025},
			5
		),
		restoration:gen_preferedadd(
            400027,
            "spawn_the_van_spawngroup",
            van_spawngroup
        ),
		--Murkies & Respawns
		restoration:gen_dummy(
            400028,
            "murky_1",
            Vector3(-8611, 3648, -72),
            Rotation(-90, 0, -0),
            optsMurky_Rifle
        ),
		restoration:gen_dummy(
            400029,
            "murky_2",
            Vector3(-8611, 3750, -72),
            Rotation(-90, 0, -0),
            optsMurky_Shotgun
        ),
		restoration:gen_dummy(
            400030,
            "murky_3",
            Vector3(-8525, 3669, -72),
            Rotation(-90, 0, -0),
            optsMurky_SMG
        ),
		restoration:gen_dummy(
            400031,
            "murky_4",
            Vector3(-8525, 3750, -72),
            Rotation(-90, 0, -0),
            optsMurky_SMG
        ),
		restoration:gen_dummy(
            400032,
            "murky_5",
            Vector3(-7567, 7768, 898.834),
            Rotation(0, 0, -0),
            optsMurky_Shotgun
        ),
		restoration:gen_dummy(
            400033,
            "murky_6",
            Vector3(-7653, 7768, 898.834),
            Rotation(0, 0, -0),
            optsMurky_Shotgun
        ),
		restoration:gen_dummy(
            400034,
            "murky_7",
            Vector3(-7653, 7838, 898.834),
            Rotation(0, 0, -0),
            optsMurky_Rifle
        ),
		restoration:gen_dummy(
            400035,
            "murky_8",
            Vector3(-7567, 7838, 898.834),
            Rotation(0, 0, -0),
            optsMurky_Rifle
        ),
		restoration:gen_dummy(
            400036,
            "murky_9",
            Vector3(-6933, 9746, 9.261),
            Rotation(90, -0, -0),
            optsMurky_SMG
        ),
		restoration:gen_dummy(
            400037,
            "murky_10",
            Vector3(-6933, 9666, 9.261),
            Rotation(90, -0, -0),
            optsMurky_SMG
        ),
		restoration:gen_dummy(
            400038,
            "murky_11",
            Vector3(-7011, 9744, 9.261),
            Rotation(90, -0, -0),
            optsMurky_Rifle
        ),
		restoration:gen_dummy(
            400039,
            "murky_12",
            Vector3(-7011, 9668, 9.261),
            Rotation(90, -0, -0),
            optsMurky_Rifle
        ),
		restoration:gen_dummytrigger(
            400040,
            "respawn_murkies_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_1
        ),
		restoration:gen_dummytrigger(
            400041,
            "respawn_murkies_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_2
        ),
		restoration:gen_dummytrigger(
            400042,
            "respawn_murkies_3",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_3
        ),
		restoration:gen_dummytrigger(
            400043,
            "respawn_dozer_1",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_dozer_1
        ),
		restoration:gen_dummytrigger(
            400044,
            "respawn_dozer_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_dozer_2
        ),
		restoration:gen_toggleelement(
            400045,
            "enable_dozer",
            enable_dozer
        ),
		restoration:gen_toggleelement(
            400046,
            "disable_dozer",
            disable_dozer
        ),
		restoration:gen_toggleelement(
            400047,
            "disable_dozer_2",
            disable_dozer_2
        ),
		restoration:gen_missionscript(
            400048,
            "spawn_murkies",
            spawn_murkies
        ),
		restoration:gen_dialogue(
            400049,
            "they_sending_cloakers",
            Bain_sendcloakers
        ),
		restoration:gen_dialogue(
            400050,
            "they_sending_dozers",
            Bain_senddozers
        ),
		restoration:gen_dialogue(
            400051,
            "they_sending_tasers",
            Bain_sendtasers
        ),
		restoration:gen_missionscript(
            400052,
            "spawn_cloakers",
            spawn_cloakers
        ),
		restoration:gen_missionscript(
            400053,
            "spawn_shields_and_taser_1",
            spawn_shields_and_taser_1
        ),
		restoration:gen_missionscript(
            400054,
            "spawn_shields_and_taser_2",
            spawn_shields_and_taser_2
        ),
		restoration:gen_missionscript(
            400055,
            "spawn_shields_and_dozer",
            spawn_shields_and_dozer
        ),
		restoration:gen_missionscript(
            400056,
            "spawn_dozer_1",
            spawn_dozer_1
        ),
		restoration:gen_missionscript(
            400057,
            "spawn_dozer_2",
            spawn_dozer_2
        ),
		restoration:gen_toggleelement(
            400058,
            "disable_murkies",
            disable_murkies
        ),
		restoration:gen_so(
            400059,
            "hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsHunt_SO
        )
    }
}