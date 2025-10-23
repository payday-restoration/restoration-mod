local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local murky_guard_elite_1 = (difficulty >= 7 and "units/payday2/characters/ene_murkywater_1/ene_murkywater_1")
local murky_guard_elite_2 = (difficulty >= 7 and "units/payday2/characters/ene_murkywater_2/ene_murkywater_2")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

	
local murky_guard_1 = {
	values = {
        enemy = murky_guard_elite_1
    }
}
local murky_guard_2 = {
	values = {
        enemy = murky_guard_elite_2
    }
}	
return {
	--Pro Job PONR
	[104838] = {
		ponr = ponr_value
	},
	-- Dozer everywhere system (truck ambush dozer)
	-- Shield blockade when the gate is open 
	-- Enabale them when heist goes loud
	[101540] = {
		on_executed = {
			{id = 400003, delay = 0, },
			{id = 400010, delay = 0, },
			{id = 400011, delay = 0, },
			{id = 400012, delay = 0, },
			{id = 400015, delay = 0, },
		},
	},
	-- Spawn the dozer and shields when the ship starts to move 
	[100000] = {
		on_executed = {
			{id = 400001, delay = 0, },
			{id = 400007, delay = 0, },
			{id = 400008, delay = 0, },
			{id = 400009, delay = 0, },
			{id = 400016, delay = 0, },
		},
	},
	[101882] = { -- add reinforce
		reinforce = {
			{
				name = "crane1",
				force = 2,
				position = Vector3(-4500, 600, 125),
			},
			{
				name = "crane2",
				force = 2,
				position = Vector3(2100, 550, 125),
			},
			{
				name = "wagon1",
				force = 2,
				position = Vector3(-2900, 2900, 500),
			},
			{
				name = "wagon2",
				force = 2,
				position = Vector3(-3700, 0, 500),
			},
		},
	},
	--Murkywater Elite guards replace regular security on DW above
	[101764] = murky_guard_2,
	[101317] = murky_guard_1,
	[101318] = murky_guard_1,
	[101765] = murky_guard_2,
	[101939] = murky_guard_1,
	[101940] = murky_guard_2,
	[101941] = murky_guard_2,
	[101942] = murky_guard_1,
	[101943] = murky_guard_1,
	[101944] = murky_guard_2,
	[102917] = murky_guard_2,
	[103678] = murky_guard_2,
	[103679] = murky_guard_1,
	[103680] = murky_guard_2,
	[103681] = murky_guard_2,
	[103682] = murky_guard_1,
	[103691] = murky_guard_1,
	[100051] = murky_guard_2,
	[100171] = murky_guard_2,
	[101113] = murky_guard_1,
	[101238] = murky_guard_1,
	[102495] = murky_guard_2,
	[102751] = murky_guard_1,
	[103303] = murky_guard_2,
	[106011] = murky_guard_1,
	[106015] = murky_guard_1,
	[106019] = murky_guard_2,
	[106020] = murky_guard_2,
	[106138] = murky_guard_1,
	[106141] = murky_guard_1
}