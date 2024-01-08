local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	--High PONR Timer to work with ponr player scaling
	if difficulty_index <= 5 then
		ponr_value = 1200
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1140
	else
		ponr_value = 1080
	end

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

return {
	--Pro Job PONR 
	[101226] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Fixed snipers being able to spawn only once
	[100368] = {
		values = {
            trigger_times = 0
		}
	},
	[100369] = {
		values = {
            trigger_times = 0
		}
	},
	[100370] = {
		values = {
            trigger_times = 0
		}
	},
	[100371] = {
		values = {
            trigger_times = 0
		}
	},
	[100372] = {
		values = {
            trigger_times = 0
		}
	},
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