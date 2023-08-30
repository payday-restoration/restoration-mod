local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1200
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1170	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1140	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1080
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1080	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1050		
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