local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1200 or (difficulty == 6 or difficulty == 7) and 1140) or 1080

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}
local sniper_trigger_times = {
	values = {
       trigger_times = 0
	}
}

return {
	--Pro Job PONR 
	[101226] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Fixed snipers being able to spawn only once
	[100368] = sniper_trigger_times,
	[100369] = sniper_trigger_times,
	[100370] = sniper_trigger_times,
	[100371] = sniper_trigger_times,
	[100372] = sniper_trigger_times,
	[103595] = {
		reinforce = {
			{
				name = "main_room",
				force = 3,
				position = Vector3(300, -1600, 12100)
			}
		}
	},
	[103831] = {
		reinforce = {
			{
				name = "main_room"
			},
			{
				name = "helipad",
				force = 3,
				position = Vector3(1600, -1600, 13100)
			}
		}
	}
}