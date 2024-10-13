local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

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
	}
}