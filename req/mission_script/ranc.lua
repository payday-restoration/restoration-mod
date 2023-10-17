local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value_1 = 1560
		ponr_value_2 = 840
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value_1 = 1530
		ponr_value_2 = 810
	else
		ponr_value_1 = 1500
		ponr_value_2 = 780
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
	[101425] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value_1
	},
	[100929] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value_2
	},
	--fixes some spawn typos
	[100683] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100684] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100789] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100790] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100791] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	}
}