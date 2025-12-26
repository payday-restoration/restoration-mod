local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 540) or 480

local wall_spawn = {
	values = {
		interval = 20,
	},
}
local roof_spawn = {
	values = {
		interval = 29,
	},
}
local sewer_spawn = {
	values = {
		interval = 30,
	},
}
return {
	-- Pro Job PONR 
	[101904] = {
		ponr = ponr_value
	},
	-- Add new reinforce
	[100653] = { -- Players are on the ground
		reinforce = {
			{
				name = "fast_food",
				force = 2,
				position = Vector3(2050, -3150, 25),
			},
			{
				name = "car_shop",
				force = 2,
				position = Vector3(1600, 750, 25),
			},
			{
				name = "gas_station",
				force = 2,
				position = Vector3(-1650, 2000, 25),
			},
			{
				name = "hardware",
				force = 2,
				position = Vector3(-1000, 150, 25),
			},
		},
	},
	-- Spawn group intervals
	[100411] = wall_spawn,
	[100403] = wall_spawn,
	[100412] = wall_spawn,
	[100413] = wall_spawn,
	[100409] = wall_spawn,
	[100408] = wall_spawn,
	[100405] = roof_spawn,
	[100406] = roof_spawn,
	[100414] = roof_spawn,
	[100415] = roof_spawn,
	[100078] = sewer_spawn,
	[100080] = sewer_spawn,
	[100082] = sewer_spawn,
	[100088] = sewer_spawn,
	[100089] = sewer_spawn,
	[100094] = sewer_spawn,
}