local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
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
	[100324] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	}
}