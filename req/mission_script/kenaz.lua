local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value = 1080
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020		
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