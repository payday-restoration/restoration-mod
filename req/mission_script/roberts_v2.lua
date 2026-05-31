local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local bravo_dozer_ambush = pro_job and "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
local soldier_1 = pro_job and "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"
local soldier_2 = pro_job and "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"
local soldier_3 = pro_job and "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"
local dw_pj_above = difficulty >= 7 and pro_job

local street_spawn = {
	values = {
		interval = 20,
	},
}
local wall_spawn = {
	values = {
		interval = 20,
	},
}
local rear_spawn = {
	values = {
		interval = 15,
	},
}
local sewer_spawn = {
	values = {
		interval = 20,
	},
}
local bravo_dozer = {
	values = {
		enemy = bravo_dozer_ambush,
	},
}
local soldier_1 = {
	values = {
		enemy = bravo_dozer_ambush,
	},
}
local soldier_2 = {
	values = {
		enemy = bravo_dozer_ambush,
	},
}
local soldier_3 = {
	values = {
		enemy = bravo_dozer_ambush,
	},
}

return {
    -- Add early reinforce around the bank
	[100109] = {
	reinforce = {
			{
				name = "bank_left",
				force = 2,
				position = Vector3(-500, -3000, -75),
			},
			{
				name = "bank_right",
				force = 2,
				position = Vector3(450, 1750, -75),
			},
			{
				name = "bank_front",
				force = 2,
				position = Vector3(2950, -650, -75),
			},
			{
				name = "bank_back",
				force = 2,
				position = Vector3(-3250, -1375, -60),
			},
		},
	},
	-- Add manhole reinforce
	[102504] = {
		reinforce = { -- manhole 1
			{
				name = "manhole",
				force = 3,
				position = Vector3(4010, -1710, 75),
			},
		},
	},
	[102505] = { -- manhole 2
		reinforce = {
			{
				name = "manhole",
				force = 3,
				position = Vector3(1185, 1615, 75),
			},
		},
	},
	[102506] = { -- manhole 3
		reinforce = {
			{
				name = "manhole",
				force = 3,
				position = Vector3(-1085, -3440, 75),
			},
		},
	},
	[102507] = { -- manhole 4
		reinforce = {
			{
				name = "manhole",
				force = 3,
				position = Vector3(-2015, -115, 75),
			},
		},
	},
	-- Replace the turret with a spawngroup
	[106548] = { -- swat van 1
		on_executed = {
			{ id = 106539, remove = true },
			{ id = 400005, delay = 0, delay_rand = 5 },
		},
	},
	[101075] = { -- swat van 2 
		on_executed = {
			{ id = 400024, delay = 0, delay_rand = 5 },
		},
	},
	-- Small beat cop wave 
	[106265] = {
		on_executed = {
			{id = 400010, delay = 12, delay = 2},
		},
	},
	-- tweak the ambush near the end
	-- both SWATs and dozer ambush on death wish pro and above
	[106416] = {
		values = {
			amount = dw_pj_above and 2 or 1,
		},
	},
	-- all 8 ambush units on death wish pro and above
	[104534] = {
		values = {
			amount = dw_pj_above and 8 or 6,
		},
	},
	-- National Guard Dozer kicks down door, only on DW/DS PJ
	[106414] = bravo_dozer,
	-- Ambush
	[106427] = ambush_chance,
	[106428] = ambush_chance,
	[106429] = ambush_chance, 
	[106434] = soldier_1,
	[106433] = soldier_1,
	[106435] = soldier_2,
	[106432] = soldier_2,
	[106440] = soldier_3,
	[106434] = soldier_3,
	-- Spawngroup delays
	[100128] = street_spawn,
	[100132] = street_spawn,
	[100133] = street_spawn,
	[100694] = rear_spawn,
	[100130] = wall_spawn,
	[100131] = wall_spawn,
	[103294] = sewer_spawn,
	[103295] = sewer_spawn,
	[103296] = sewer_spawn,
	[103297] = sewer_spawn,
	[103298] = sewer_spawn,
	[103788] = sewer_spawn,
	[103789] = sewer_spawn,
	[103790] = sewer_spawn,
	[103791] = sewer_spawn,
	[103792] = sewer_spawn,
	[103793] = sewer_spawn,
	[104629] = sewer_spawn,
	[104631] = sewer_spawn,
	[104649] = sewer_spawn,
	[104686] = sewer_spawn,
	[104687] = sewer_spawn,
	[104689] = sewer_spawn
	
}