local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

local low_interval = {
	values = {
			interval = 20
		},
}
local medium_interval = {
	values = {
			interval = 30
		},
}
return {
	-- Pro Job PONR 
	[100296] = {
		ponr = ponr_value
	},
[100304] = { -- objective 1 completed
		reinforce = {
			{
				name = "entrance",
				force = 3,
				position = Vector3(-1400, 2700, 0),
			},
			{
				name = "hub",
				force = 3,
				position = Vector3(-150, -1225, 0),
			},
		},
	},
	[100286] = {
		reinforce = {
			{ name = "entrance" },
			{ name = "hub" },
			{
				name = "hub_escape",
				force = 3,
				position = Vector3(25, -350, 0),
			},
		},
	},
	-- Enabling specific room defenses 
	[104652] = {
		on_executed = {
			{ id = 400007, delay = 0 ,},
			{ id = 400024, delay = 0 ,},
		},
	},
-- Bio Weapons Labs Defense 
	[108051] = {
		on_executed = {
			{ id = 400001, delay = 0 ,},
			{ id = 400002, delay = 0 ,},
			{ id = 400005, delay = 0 ,},
			{ id = 400025, delay = 0 ,},
			{id =  400026, delay = 0 ,}, 
		},
	},
-- Heavy Resistance on Escape 
	[102082] = {
		on_executed = {
			{ id = 400008, delay = 0 ,},
			{ id = 400009, delay = 0 ,},
			{ id = 400010, delay = 0 ,},
			{ id = 400011, delay = 0 ,},
			{ id = 400012, delay = 0 ,},
			{ id = 400018, delay = 0 ,},
			{ id = 400019, delay = 0 ,},
			{ id = 400020, delay = 0 ,},
		},
	},

	-- Spawnpoint Delays
	-- ai_enemy_group_001
	[100128] = low_interval,
	-- ai_enemy_group_002
	[100130] = medium_interval,
	-- ai_enemy_group_003
	[100131] = medium_interval,
	-- ai_enemy_group_004
	[100132] = medium_interval,
	-- ai_enemy_group_005
	[100133] = medium_interval,
	-- ai_enemy_group_014
	[107975] = medium_interval,
	-- ai_enemy_group_015
	[107908] = medium_interval,
	-- ai_enemy_group_016
	[107909] = low_interval,
	-- ai_enemy_group_017
	[107911] = medium_interval,
	-- ai_enemy_group_018
	[107913] = medium_interval,
	-- ai_enemy_group_019
	[107977] = medium_interval,
	-- ai_enemy_group_020
	[107979] = medium_interval,
	-- ai_enemy_group_021
	[107980] = medium_interval,
	-- ai_enemy_group_022
	[107981] = medium_interval,
	-- ai_enemy_group_023
	[107982] = low_interval,
	-- ai_enemy_group_024
	[107983] = medium_interval,
	-- ai_enemy_group_025
	[108287] = low_interval,
	-- ai_enemy_group_026
	[108289] = low_interval,
	-- ai_enemy_group_027
	[108290] = medium_interval,
	-- ai_enemy_group_028
	[108291] = medium_interval,
	-- ai_enemy_group_029
	[108292] = medium_interval,
	-- ai_enemy_group_030
	[102407] = medium_interval,
	-- ai_enemy_group_031
	[104794] = low_interval,
	-- ai_enemy_group_032
	[100941] = medium_interval,
	-- ai_enemy_group_033
	[101319] = low_interval,
	-- ai_enemy_group_034
	[101335] = low_interval,
	-- ai_enemy_group_035
	[102439] = low_interval,
	-- ai_enemy_group_036
	[101451] = medium_interval,
	-- ai_enemy_group_037
	[101074] = medium_interval,
	-- ai_enemy_group_038
	[101350] = medium_interval
}