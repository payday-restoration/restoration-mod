--TODO: Make scripted Bulldozers spawns that turn off either water or power like in PDTH (with taser as his backup in some power box spots)
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local sniper = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper" or difficulty == 7 and "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3" or difficulty == 6 and "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc") or "units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1"
local grenadier = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1") or "units/payday2/characters/ene_grenadier_1/ene_grenadier_1"
local death_sentence = difficulty == 8
local mayhem_above = difficulty >= 6
local overkill_above = difficulty >= 5
local deathwish_above = difficulty >= 7
local manhole_specials_warning = (difficulty >= 7 and "Play_ban_s05") or "Play_ban_s03_b"

local optsSniper_1 = {
	enemy = sniper,
	on_executed = {
        { id = 100675, delay = 0 },
    },
    enabled = true
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = {
        { id = 400006, delay = 0 },
    },
    enabled = true
}
local optsSniper_3 = {
	enemy = sniper,
	on_executed = {
        { id = 400007, delay = 0 },
    },
    enabled = mayhem_above
}
local optsSniper_4 = {
	enemy = sniper,
	spawn_action = "e_sp_armored_truck_1st",
	on_executed = {
        { id = 400008, delay = 2.5 },
    },
    enabled = mayhem_above
}
local optsSniper_5 = {
	enemy = sniper,
	spawn_action = "e_sp_up_2_75_down_1_25m",
	on_executed = {
        { id = 400009, delay = 3 },
    },
    enabled = death_sentence
}
local optsGrenadier_1 = {
	enemy = grenadier,
	on_executed = {
        { id = 400023, delay = 0 },
    },
	enabled = true
}
local optsGrenadier_2 = {
	enemy = grenadier,
	on_executed = {
        { id = 400024, delay = 0 },
    },
	enabled = true
}
local optsGrenadier_3 = {
	enemy = grenadier,
	on_executed = {
        { id = 400025, delay = 0 },
    },
	enabled = death_sentence
}
local optsGrenadierDefend_1 = {
	enemy = grenadier,
	on_executed = {
        { id = 400035, delay = 0 },
    },
    enabled = deathwish_above
}
local optsGrenadierDefend_2 = {
	enemy = grenadier,
	on_executed = {
        { id = 400036, delay = 0 },
    },
    enabled = deathwish_above
}
local optsGrenadierDefend_3 = {
	enemy = grenadier,
	on_executed = {
        { id = 400037, delay = 0 },
    },
    enabled = deathwish_above
}
local optsGrenadierDefend_4 = {
	enemy = grenadier,
	on_executed = {
        { id = 400038, delay = 0 },
    },
    enabled = deathwish_above
}
local optsrespawn_sniper_1 = {
	on_executed = { 
		{ id = 400001, delay = 30 }
	},
	elements = { 
		400001
	},
    event = "death"
}
local optsrespawn_sniper_2 = {
	on_executed = { 
		{ id = 400002, delay = 30 }
	},
	elements = { 
		400002
	},
    event = "death"
}
local optsrespawn_sniper_3 = {
	on_executed = { 
		{ id = 400003, delay = 30 }
	},
	elements = { 
		400003
	},
    event = "death"
}
local optsrespawn_sniper_4 = {
	on_executed = { 
		{ id = 400004, delay = 30 }
	},
	elements = { 
		400004
	},
    event = "death"
}
local optsrespawn_sniper_5 = {
	on_executed = { 
		{ id = 400005, delay = 30 }
	},
	elements = { 
		400005
	},
    event = "death"
}
local optsrespawn_grenadier_1 = {
	on_executed = { 
		{ id = 400020, delay = 30 }
	},
	elements = { 
		400020
	},
    event = "death"
}
local optsrespawn_grenadier_2 = {
	on_executed = { 
		{ id = 400021, delay = 30 }
	},
	elements = { 
		400021
	},
    event = "death"
}
local optsrespawn_grenadier_3 = {
	on_executed = { 
		{ id = 400022, delay = 30 }
	},
	elements = { 
		400022
	},
    event = "death"
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsSniper_Grenadier_SO = {
	SO_access = "8192",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local disable_2nd_police_cruiser = {
	enabled = true,
	toggle = "off",
	elements = { 
		100704
	}
}
local disable_grenadiers = {
	enabled = true,
	toggle = "off",
	elements = { 
		400019
	}
}
local enable_grenadiers = {
	enabled = overkill_above,
	elements = { 
		400019
	}
}
local spawn_grenadiers = {
	on_executed = { 
		{ id = 400020, delay = 0 },
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 },
		{ id = 400017, delay = 0 }
	}
}
local Bain_sendsnipers = {
	dialogue = "play_pln_gen_snip_01",
	can_not_be_muted = true
}
local Bain_sendgrenadiers = {
	dialogue = "Play_ban_s05",
	can_not_be_muted = true
}
local Bain_sendshields = {
	dialogue = manhole_specials_warning,
	can_not_be_muted = true
}

return {
    elements = {
        --Snipers
		restoration:gen_dummy(
            400001,
            "sniper_1",
            Vector3(4082, 2186, 120.142),
            Rotation(-180, 0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400002,
            "sniper_2",
            Vector3(2978, -744, 126.059),
            Rotation(180, 0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400003,
            "sniper_3",
            Vector3(-3153, 8429, 26.021),
            Rotation(90, -0, -0),
            optsSniper_3
        ),
		restoration:gen_dummy(
            400004,
            "sniper_4",
            Vector3(502, -3577, 29.736),
            Rotation(-167, 0, -0),
            optsSniper_4
        ),
		restoration:gen_dummy(
            400005,
            "sniper_5",
            Vector3(-8202, 1491, 25.860),
            Rotation(-90, 0, -0),
            optsSniper_5
        ),
		restoration:gen_so(
            400006,
            "sniper_spot_so_1",
            Vector3(-3192, 1184, 517.520),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400007,
            "sniper_spot_so_2",
            Vector3(-3328, 3703, 445.786),
            Rotation(161, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400008,
            "sniper_spot_so_3",
            Vector3(-1797.890, 1042.875, 415.609),
            Rotation(46, -0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400009,
            "sniper_spot_so_4",
            Vector3(-4513, 384, 500.223),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_dummytrigger(
            400010,
            "respawn_sniper_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_1
        ),
		restoration:gen_dummytrigger(
            400011,
            "respawn_sniper_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_2
        ),
		restoration:gen_dummytrigger(
            400012,
            "respawn_sniper_3",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_3
        ),
		restoration:gen_dummytrigger(
            400013,
            "respawn_sniper_4",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_4
        ),
		restoration:gen_dummytrigger(
            400014,
            "respawn_sniper_5",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_5
        ),
		restoration:gen_toggleelement(
            400015,
            "disable_the_cruiser",
            disable_2nd_police_cruiser
        ),
		restoration:gen_dialogue(
            400016,
            "they_sending_snipers",
            Bain_sendsnipers
        ),
		restoration:gen_dialogue(
            400017,
            "they_sending_grenadiers",
            Bain_sendgrenadiers
        ),
		restoration:gen_dialogue(
            400018,
            "they_sending_shields",
            Bain_sendshields
        ),
		restoration:gen_missionscript(
            400019,
            "spawn_grenadiers",
            spawn_grenadiers
        ),
		restoration:gen_dummy(
            400020,
            "grenadier_1",
            Vector3(-6264, 7018, 27.044),
            Rotation(0, 0, -0),
            optsGrenadier_1
        ),
		restoration:gen_dummy(
            400021,
            "grenadier_2",
            Vector3(4135, 2186, 120.142),
            Rotation(180, 0, -0),
            optsGrenadier_2
        ),
		restoration:gen_dummy(
            400022,
            "grenadier_3",
            Vector3(-5697, -3007, 27.364),
            Rotation(180, 0, -0),
            optsGrenadier_3
        ),
		restoration:gen_so(
            400023,
            "grenadier_spot_so_1",
            Vector3(-2600.612, 2522.792, 430.230),
            Rotation(140, 0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_so(
            400024,
            "grenadier_spot_so_2",
            Vector3(-2351, 1831, 402.013),
            Rotation(90, -0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_so(
            400025,
            "grenadier_spot_so_3",
            Vector3(-3503, 1031, 510.702),
            Rotation(-33, 0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_dummytrigger(
            400026,
            "respawn_grenadier_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_grenadier_1
        ),
		restoration:gen_dummytrigger(
            400027,
            "respawn_grenadier_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_grenadier_2
        ),
		restoration:gen_dummytrigger(
            400028,
            "respawn_grenadier_3",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_grenadier_3
        ),
		restoration:gen_toggleelement(
            400029,
            "enable_grenadiers",
            enable_grenadiers
        ),
		restoration:gen_toggleelement(
            400030,
            "disable_grenadiers",
            disable_grenadiers
        ),
		restoration:gen_dummy(
            400031,
            "grenadier_defend_1",
            Vector3(-5536, -3189, 30.090),
            Rotation(90, -0, -0),
            optsGrenadierDefend_1
        ),
		restoration:gen_dummy(
            400032,
            "grenadier_defend_2",
            Vector3(-5536, -3129, 30.090),
            Rotation(90, -0, -0),
            optsGrenadierDefend_2
        ),
		restoration:gen_dummy(
            400033,
            "grenadier_defend_3",
            Vector3(3052, -685, 130.921),
			Rotation(-180, 0, -0),
            optsGrenadierDefend_3
		),
		restoration:gen_dummy(
            400034,
            "grenadier_defend_4",
            Vector3(3121, -685, 130.921),
			Rotation(-180, -0, -0),
            optsGrenadierDefend_4
		),
		restoration:gen_so(
            400035,
            "grenadier_spot_so_1",
            Vector3(-5995, -349, 26.200),
            Rotation(-90, 0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_so(
            400036,
            "grenadier_spot_so_2",
            Vector3(-5995, -455, 26.200),
            Rotation(-90, 0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_so(
            400037,
            "grenadier_spot_so_3",
            Vector3(-796.150, 12.669, 31.663),
            Rotation(50, -0, -0),
            optsSniper_Grenadier_SO
        ),
		restoration:gen_so(
            400038,
            "grenadier_spot_so_4",
            Vector3(-863, -67, 31.663),
            Rotation(50, 0, -0),
            optsSniper_Grenadier_SO
        )
    }
}
