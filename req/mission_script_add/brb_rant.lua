local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local murky_shield = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"
local murky_rifle = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"
local murky_shotgun = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"
local murky_smg = "units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
local murky_heavy_rifle = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"
local murky_heavy_shotgun = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
local murky_tank = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli") or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
local murky_tank_black = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
local murky_tank_skull = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
local murky_taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
local murky_cloaker = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"
local hard_above = difficulty >= 3
local overkill_above = difficulty >= 5
local death_wish_above = difficulty >= 7
local dozer_incoming = "Play_ban_s02_a"

	if difficulty >= 5 then
		dozer_incoming = "Play_ban_s02_b"
	end
	
	if difficulty == 4 or difficulty == 5 then
		murky_shield = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"
		murky_rifle = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		murky_shotgun = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		murky_smg = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		murky_heavy_rifle = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		murky_heavy_shotgun = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty == 6 or difficulty == 7 then
		murky_shield = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"
		murky_rifle = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"
		murky_shotgun = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"
		murky_smg = "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"
		murky_heavy_rifle = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		murky_heavy_shotgun = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty == 8 then
		murky_shield = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"
		murky_rifle = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"
		murky_shotgun = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"
		murky_smg = "units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"
		murky_heavy_rifle = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"
		murky_heavy_shotgun = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"
	end

local optsSWAT_Rifle = {
    enemy = murky_rifle,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_Shotgun = {
    enemy = murky_shotgun,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_SMG = {
    enemy = murky_smg,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyRifle = {
    enemy = murky_heavy_rifle,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_HeavyShotgun = {
    enemy = murky_heavy_shotgun,
	participate_to_group_ai = true,
    enabled = true
}
local optsTaser = {
    enemy = murky_taser,
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsCloaker = {
    enemy = murky_cloaker,
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsShield = {
    enemy = murky_shield,
	participate_to_group_ai = true,
    enabled = true
}
local optsBulldozer = {
    enemy = murky_tank,
	on_executed = { 
		{ id = 400041, delay = 0 }
	},
	participate_to_group_ai = true,
    enabled = hard_above
}
local optsBulldozer_black = {
    enemy = murky_tank_black,
	participate_to_group_ai = true,
    enabled = overkill_above
}
local optsBulldozer_skull = {
    enemy = murky_tank_skull,
	participate_to_group_ai = true,
    enabled = death_wish_above
}
local optsrespawn_murkies_1 = {
	on_executed = { 
		{ id = 400002, delay = 25 },
		{ id = 400003, delay = 25 },
		{ id = 400004, delay = 25 },
		{ id = 400005, delay = 25 },
		{ id = 400006, delay = 25 },
		{ id = 400025, delay = 25 }
	},
	elements = { 
		400002
	},
    event = "death"
}
local optsrespawn_murkies_2 = {
	on_executed = { 
		{ id = 400007, delay = 35 },
		{ id = 400008, delay = 35 },
		{ id = 400009, delay = 35 },
		{ id = 400010, delay = 35 },
		{ id = 400011, delay = 35 }
	},
	elements = { 
		400007
	},
    event = "death"
}
local optsrespawn_murkies_3 = {
	on_executed = { 
		{ id = 400012, delay = 35 },
		{ id = 400015, delay = 35 },
		{ id = 400016, delay = 35 }
	},
	elements = { 
		400012
	},
    event = "death"
}
local optsrespawn_murkies_4 = {
	on_executed = { 
		{ id = 400020, delay = 15 },
		{ id = 400021, delay = 15 },
		{ id = 400022, delay = 15 },
		{ id = 400023, delay = 15 },
		{ id = 400024, delay = 15 }
	},
	elements = { 
		400020
	},
    event = "death"
}
local optsrespawn_murkies_5 = {
	on_executed = { 
		{ id = 400027, delay = 25 },
		{ id = 400028, delay = 25 },
		{ id = 400029, delay = 25 },
		{ id = 400030, delay = 25 },
		{ id = 400031, delay = 25 }
	},
	elements = { 
		400027
	},
    event = "death"
}
local optsrespawn_murkies_cloakers = {
	on_executed = { 
		{ id = 400017, delay = 55 },
		{ id = 400018, delay = 55 },
		{ id = 400019, delay = 55 }
	},
	elements = { 
		400017
	},
    event = "death"
}
local optsrespawn_murky_dozer_1 = {
	on_executed = { 
		{ id = 400013, delay = 90 }
	},
	elements = { 
		400013
	},
    event = "death"
}
local optsrespawn_murky_dozer_2 = {
	on_executed = { 
		{ id = 400014, delay = 90 }
	},
	elements = { 
		400014
	},
    event = "death"
}
local optsrespawn_murky_dozer_3 = {
	on_executed = { 
		{ id = 400026, delay = 90 }
	},
	elements = { 
		400026
	},
    event = "death"
}
local global_murky_spawn_mission_script = {
	enabled = true,
	on_executed = { 
		{ id = 400002, delay = 120 },
		{ id = 400003, delay = 120 },
		{ id = 400004, delay = 120 },
		{ id = 400005, delay = 120 },
		{ id = 400006, delay = 120 },
		{ id = 400007, delay = 120 },
		{ id = 400008, delay = 120 },
		{ id = 400009, delay = 120 },
		{ id = 400010, delay = 120 },
		{ id = 400011, delay = 120 },
		{ id = 400012, delay = 120 },
		{ id = 400013, delay = 120 },
		{ id = 400014, delay = 120 },
		{ id = 400015, delay = 120 },
		{ id = 400016, delay = 120 },
		{ id = 400017, delay = 120 },
		{ id = 400018, delay = 120 },
		{ id = 400019, delay = 120 },
		{ id = 400020, delay = 120 },
		{ id = 400021, delay = 120 },
		{ id = 400022, delay = 120 },
		{ id = 400023, delay = 120 },
		{ id = 400024, delay = 120 },
		{ id = 400025, delay = 120 },
		{ id = 400026, delay = 120 },
		{ id = 400027, delay = 120 },
		{ id = 400028, delay = 120 },
		{ id = 400029, delay = 120 },
		{ id = 400030, delay = 120 },
		{ id = 400031, delay = 120 }
	}
}
local Bain_senddozers = {
	dialogue = dozer_incoming,
	trigger_times = 1,
	can_not_be_muted = true
}

return {
    elements = {
        --Murkywater units gets deployed after 2 minutes
        restoration:gen_missionscript(
            400001,
            "spawn_murkies",
            global_murky_spawn_mission_script
        ),
		--Murky SWAT
		restoration:gen_dummy(
            400002,
            "murkywater_1",
            Vector3(789, 785, 676.187),
            Rotation(-180, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400003,
            "murkywater_2",
            Vector3(874, 785, 676.187),
            Rotation(-180, 0, -0),
            optsSWAT_Shotgun
        ),
		restoration:gen_dummy(
            400004,
            "murkywater_3",
            Vector3(965, 785, 676.187),
            Rotation(-180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400005,
            "murkywater_4",
            Vector3(1049, 785, 676.187),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400006,
            "murkywater_5",
            Vector3(1136, 785, 676.187),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400007,
            "murkywater_6",
            Vector3(4890, -1652, 3.752),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyRifle
        ),
		restoration:gen_dummy(
            400008,
            "murkywater_7",
            Vector3(4890, -1582, 3.752),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyRifle
        ),
		restoration:gen_dummy(
            400009,
            "murkywater_8",
            Vector3(4890, -1507, 3.752),
            Rotation(-180, 0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400010,
            "murkywater_9",
            Vector3(4890, -1423, 3.752),
            Rotation(-180, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400011,
            "murkywater_10",
            Vector3(4890, -1354, 3.752),
            Rotation(-180, 0, -0),
            optsSWAT_HeavyShotgun
        ),
		restoration:gen_dummy(
            400012,
            "murkywater_11",
            Vector3(236, -6783, 2.395),
            Rotation(0, 0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400013,
            "murkywater_dozer_1",
            Vector3(244, -6882, 2.395),
            Rotation(0, 0, -0),
            optsBulldozer_black
        ),
		restoration:gen_dummy(
            400014,
            "murkywater_dozer_2",
            Vector3(258, -6957, 2.395),
            Rotation(0, 0, -0),
            optsBulldozer_skull
        ),
		restoration:gen_dummy(
            400015,
            "murkywater_12",
            Vector3(269, -7018, 2.395),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400016,
            "murkywater_13",
            Vector3(258, -7064, 2.395),
            Rotation(0, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400017,
            "murkywater_spooc_1",
            Vector3(4884, -3808, 3.482),
            Rotation(0, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400018,
            "murkywater_spooc_2",
            Vector3(4883, -3922, 5.520),
            Rotation(0, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400019,
            "murkywater_spooc_3",
            Vector3(4883, -4079, 5.503),
            Rotation(0, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400020,
            "murkywater_14",
            Vector3(2345, 794, 700.187),
            Rotation(-180, 0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400021,
            "murkywater_15",
            Vector3(2433, 794, 700.187),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400022,
            "murkywater_16",
            Vector3(2552, 794, 700.187),
            Rotation(-180, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400023,
            "murkywater_17",
            Vector3(2638, 794, 700.187),
            Rotation(-180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400024,
            "murkywater_18",
            Vector3(2728, 794, 700.187),
            Rotation(-180, 0, -0),
            optsSWAT_SMG
        ),
		restoration:gen_dummy(
            400025,
            "murkywater_spooc_4",
            Vector3(2159, 802, 698.435),
            Rotation(180, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400026,
            "murkywater_dozer_3",
            Vector3(4882, -1716, 2.819),
            Rotation(-180, 0, -0),
            optsBulldozer
        ),
		restoration:gen_dummy(
            400027,
            "murkywater_19",
            Vector3(90, 2673, 2.395),
            Rotation(90, -0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400028,
            "murkywater_20",
            Vector3(144, 2673, 2.395),
            Rotation(90, -0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400029,
            "murkywater_21",
            Vector3(209, 2673, 2.395),
            Rotation(90, -0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400030,
            "murkywater_22",
            Vector3(274, 2673, 2.395),
            Rotation(90, -0, -0),
            optsSWAT_Rifle
        ),
		restoration:gen_dummy(
            400031,
            "murkywater_23",
            Vector3(329, 2673, 2.395),
            Rotation(90, -0, -0),
            optsSWAT_Rifle
        ),
		--Respawns
		restoration:gen_dummytrigger(
            400032,
            "respawn_the_murky_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_1
        ),
		restoration:gen_dummytrigger(
            400033,
            "respawn_the_murky_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_2
        ),
		restoration:gen_dummytrigger(
            400034,
            "respawn_the_murky_3",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_3
        ),
		restoration:gen_dummytrigger(
            400035,
            "respawn_the_murky_4",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_4
        ),
		restoration:gen_dummytrigger(
            400036,
            "respawn_the_murky_5",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_cloakers
        ),
		restoration:gen_dummytrigger(
            400037,
            "respawn_the_murky_6",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murkies_5
        ),
		restoration:gen_dummytrigger(
            400038,
            "respawn_the_murky_7",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murky_dozer_1
        ),
		restoration:gen_dummytrigger(
            400039,
            "respawn_the_murky_8",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murky_dozer_2
        ),
		restoration:gen_dummytrigger(
            400040,
            "respawn_the_murky_9",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_murky_dozer_3
        ),
		restoration:gen_dialogue(
            400041,
            "they_sending_dozers",
            Bain_senddozers
        )
    }
}
