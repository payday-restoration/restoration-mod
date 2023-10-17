local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 960	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 930
	else
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
	[102089] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	}
}	