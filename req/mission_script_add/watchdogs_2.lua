local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local sniper = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc"
	
	if difficulty == 5 or difficulty == 6 then
		sniper = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
	elseif difficulty == 7 then
		sniper = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3"
	elseif difficulty == 8 then
		sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
	end

local optsSniper_1 = {
	enemy = sniper,
	on_executed = { { id = 400007, delay = 0 } },
    enabled = true
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = { { id = 400008, delay = 0 } },
    enabled = true
}
local optsSniper_3 = {
	enemy = sniper,
	on_executed = { { id = 400009, delay = 0 } },
    enabled = true
}
local optsSniper_4 = {
	enemy = sniper,
	on_executed = { { id = 400010, delay = 0 } },
    enabled = true
}
local optsSniper_5 = {
	enemy = sniper,
	on_executed = { { id = 400011, delay = 0 } },
    enabled = true
}
local optsSniper_6 = {
	enemy = sniper,
	on_executed = { { id = 400012, delay = 0 } },
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
local spawnSnipers_1 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400001, delay = 4 },
		{ id = 400002, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local spawnSnipers_2 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400003, delay = 4 },
		{ id = 400004, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local spawnSnipers_3 = {
	enabled = true,
	trigger_times = 1,
	on_executed = { 
		{ id = 400005, delay = 4 },
		{ id = 400006, delay = 4 },
		{ id = 400022, delay = 0 }
	}
}
local Bain_sendsnipers = {
	dialogue = "play_pln_gen_snip_01",
	trigger_times = 1,
	can_not_be_muted = true
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
local optsrespawn_sniper_6 = {
	on_executed = { 
		{ id = 400006, delay = 30 }
	},
	elements = { 
		400006
	},
    event = "death"
}

return {
    elements = {
        --Snipers
		restoration:gen_dummy(
            400001,
            "sniper_1",
            Vector3(3385, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400002,
            "sniper_2",
            Vector3(3285, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400003,
            "sniper_3",
            Vector3(4202, 4376, 540.404),
            Rotation(90, -0, -0),
            optsSniper_3
        ),
		restoration:gen_dummy(
            400004,
            "sniper_4",
            Vector3(4133, 4368, 540.404),
            Rotation(90, -0, -0),
            optsSniper_4
        ),
		restoration:gen_dummy(
            400005,
            "sniper_5",
            Vector3(5936, 405, 540.404),
            Rotation(0, 0, -0),
            optsSniper_5
        ),
		restoration:gen_dummy(
            400006,
            "sniper_6",
            Vector3(5936, 500, 540.404),
            Rotation(0, 0, -0),
            optsSniper_6
        ),
		restoration:gen_so(
            400007,
            "sniper_so_1",
            Vector3(3974, -2994, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400008,
            "sniper_so_2",
            Vector3(4132, -2997, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400009,
            "sniper_so_3",
            Vector3(3509, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400010,
            "sniper_so_4",
            Vector3(3701, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400011,
            "sniper_so_5",
            Vector3(5643, 1060, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400012,
            "sniper_so_6",
            Vector3(5643, 929, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		--Mission Scripts
		restoration:gen_missionscript(
            400013,
            "spawn_snipers_1",
            spawnSnipers_1
        ),
		restoration:gen_missionscript(
            400014,
            "spawn_snipers_2",
            spawnSnipers_2
        ),
		restoration:gen_missionscript(
            400015,
            "spawn_snipers_3",
            spawnSnipers_3
        ),
		restoration:gen_dummytrigger(
            400016,
            "respawn_sniper_1",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_1
        ),
		restoration:gen_dummytrigger(
            400017,
            "respawn_sniper_2",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_2
        ),
		restoration:gen_dummytrigger(
            400018,
            "respawn_sniper_3",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_3
        ),
		restoration:gen_dummytrigger(
            400019,
            "respawn_sniper_4",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_4
        ),
		restoration:gen_dummytrigger(
            400020,
            "respawn_sniper_5",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_5
        ),
		restoration:gen_dummytrigger(
            400021,
            "respawn_sniper_6",
            Vector3(-2400, -3577, 375),
            Rotation(90, -0, -0),
            optsrespawn_sniper_6
        ),
		restoration:gen_dialogue(
            400022,
            "they_sending_snipers",
            Bain_sendsnipers
        )
    }
}