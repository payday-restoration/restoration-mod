--[[
--RPG Grunts for Meltdown
--Currently commented out as the RPG asset is not done
--Will make it live once it's finished
--Basically these guys will replace some of the scripted harassers on the containers in the driving section
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local rpg_grunt = "units/pd2_mod_sharks/characters/ene_rpg_grunt/ene_rpg_grunt"
local overkill_above = difficulty >= 5

local optsSniper_1 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400007, delay = 0 } },
	enabled = true
}
local optsSniper_2 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400008, delay = 0 } },
	enabled = true
}
local optsSniper_3 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400009, delay = 0 } },
	enabled = true
}
local optsSniper_4 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400010, delay = 0 } },
	enabled = true
}
local optsSniper_5 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400011, delay = 0 } },
	enabled = true
}
local optsSniper_6 = {
	enemy = rpg_grunt,
	on_executed = { { id = 400012, delay = 0 } },
	enabled = true
}
local optsSniper_SO = {
	scan = true,
    SO_access = "128",
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper"
}
local spawnMurkyRPGMercs = {
	enabled = overkill_above,
	trigger_times = 1,
	on_executed = { 
		{ id = 400001, delay = 0 },
		{ id = 400002, delay = 0 },
        { id = 400003, delay = 0 },
        { id = 400004, delay = 0 },
        { id = 400005, delay = 0 },
        { id = 400006, delay = 0 },
		{ id = 400014, delay = 0 }
	}
}
local optsrespawn_sniper_1 = {
	on_executed = { 
		{ id = 400001, delay = 145 }
	},
	elements = { 
		400001
	},
	event = "death"
}
local optsrespawn_sniper_2 = {
	on_executed = { 
		{ id = 400002, delay = 145 }
	},
	elements = { 
		400002
	},
    event = "death"
}
local optsrespawn_sniper_3 = {
	on_executed = { 
		{ id = 400003, delay = 145 }
	},
	elements = { 
		400003
	},
	event = "death"
}
local optsrespawn_sniper_4 = {
	on_executed = { 
		{ id = 400004, delay = 145 }
	},
	elements = { 
		400004
	},
	event = "death"
}
local optsrespawn_sniper_5 = {
	on_executed = { 
		{ id = 400005, delay = 145 }
	},
	elements = { 
		400005
	},
	event = "death"
}
local optsrespawn_sniper_6 = {
	on_executed = { 
		{ id = 400006, delay = 145 }
	},
	elements = { 
		400006
	},
	event = "death"
}
local Bain_RPGWarning1 = {
	dialogue = "Play_pln_indif_01",
	can_not_be_muted = true
}
local Bain_RPGWarning2 = {
	dialogue = "play_pln_gen_pol_03",
	can_not_be_muted = true
}

return {
    elements = {
        --Titan SWAT with RPGs
		restoration:gen_dummy(
            400001,
            "sniper_rpg_1",
            Vector3(3385, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400002,
            "sniper_rpg_2",
            Vector3(3285, -3308, 540.404),
            Rotation(-90, 0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400003,
            "sniper_rpg_3",
            Vector3(4202, 4376, 540.404),
            Rotation(90, -0, -0),
            optsSniper_3
        ),
		restoration:gen_dummy(
            400004,
            "sniper_rpg_4",
            Vector3(4133, 4368, 540.404),
            Rotation(90, -0, -0),
            optsSniper_4
        ),
		restoration:gen_dummy(
            400005,
            "sniper_rpg_5",
            Vector3(5936, 405, 540.404),
            Rotation(0, 0, -0),
            optsSniper_5
        ),
		restoration:gen_dummy(
            400006,
            "sniper_rpg_6",
            Vector3(5936, 500, 540.404),
            Rotation(0, 0, -0),
            optsSniper_6
        ),
		restoration:gen_so(
            400007,
            "sniper_rpg_so_1",
            Vector3(3974, -2994, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400008,
            "sniper_rpg_so_2",
            Vector3(4132, -2997, 540.404),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400009,
            "sniper_rpg_so_3",
            Vector3(3509, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400010,
            "sniper_rpg_so_4",
            Vector3(3701, 4051, 540.404),
            Rotation(-180, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400011,
            "sniper_rpg_so_5",
            Vector3(5643, 1060, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400012,
            "sniper_rpg_so_6",
            Vector3(5643, 929, 540.404),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		--Mission Scripts
		restoration:gen_missionscript(
            400013,
            "spawn_rpg_grunts",
            spawnMurkyRPGMercs
        ),
		restoration:gen_dialogue(
            400014,
            "they_sending_rpg_grunts",
            Bain_RPGWarning1
        )
    }
}
]]--