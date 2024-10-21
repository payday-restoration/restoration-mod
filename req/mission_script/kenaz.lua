local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
	
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
	[100185] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Reinforce points
	[101620] = {
		reinforce = {
			{
				name = "stairs_right",
				force = 2,
				position = Vector3(375, -3675, 300)
			},
			{
				name = "stairs_left",
				force = 2,
				position = Vector3(-350, -3675, 300)
			}
		}
	},
	[100379] = {
		reinforce = {
			{
				name = "stairs_right"
			},
			{
				name = "stairs_left"
			},
			{
				name = "security",
				force = 3,
				position = Vector3(125, 1575, 100)
			}
		}
	}
}