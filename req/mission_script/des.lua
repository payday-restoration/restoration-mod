local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
local low_interval = {
	values = {
			interval = 20
		}
}
local medium_interval = {
	values = {
			interval = 30
		}
}
return {
	--Pro Job PONR 
	[100296] = {
		ponr = ponr_value
	},
	[100304] = {
		reinforce = {
			{
				name = "main_hall",
				force = 5,
				position = Vector3(-120, -2400, 100)
			}
		}
	},
	[100286] = {
		reinforce = {
			{
				name = "main_hall"
			}
		}
	},
	--Spawnpoint Delays
	--ai_enemy_group_001
	[100128] = low_interval,
	--ai_enemy_group_002
	[100130] = medium_interval,
	--ai_enemy_group_003
	[100131] = medium_interval,
	--ai_enemy_group_004
	[100132] = medium_interval,
	--ai_enemy_group_005
	[100133] = medium_interval,
	--ai_enemy_group_014
	[107975] = medium_interval,
	--ai_enemy_group_015
	[107908] = medium_interval,
	--ai_enemy_group_016
	[107909] = low_interval,
	--ai_enemy_group_017
	[107911] = medium_interval,
	--ai_enemy_group_018
	[107913] = medium_interval,
	--ai_enemy_group_019
	[107977] = medium_interval,
	--ai_enemy_group_020
	[107979] = medium_interval,
	--ai_enemy_group_021
	[107980] = medium_interval,
	--ai_enemy_group_022
	[107981] = medium_interval,
	--ai_enemy_group_023
	[107982] = low_interval,
	--ai_enemy_group_024
	[107983] = medium_interval,
	--ai_enemy_group_025
	[108287] = low_interval,
	--ai_enemy_group_026
	[108289] = low_interval,
	--ai_enemy_group_027
	[108290] = medium_interval,
	--ai_enemy_group_028
	[108291] = medium_interval,
	--ai_enemy_group_029
	[108292] = medium_interval,
	--ai_enemy_group_030
	[102407] = medium_interval,
	--ai_enemy_group_031
	[104794] = low_interval,
	--ai_enemy_group_032
	[100941] = medium_interval,
	--ai_enemy_group_033
	[101319] = low_interval,
	--ai_enemy_group_034
	[101335] = low_interval,
	--ai_enemy_group_035
	[102439] = low_interval,
	--ai_enemy_group_036
	[101451] = medium_interval,
	--ai_enemy_group_037
	[101074] = medium_interval,
	--ai_enemy_group_038
	[101350] = medium_interval
}