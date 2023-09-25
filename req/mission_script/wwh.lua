local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 960
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 930
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 900	
	end
	
local ponr_timer_player_mul = {
		1,
		0.8,
		0.6,
		0.4,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35
}	

return {
	--Pro Job PONR 
	[100914] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Gradually increase difficulty
	[100810] = {
		difficulty = 0.25
	},
	[101313] = {
		difficulty = 1
	}
}	