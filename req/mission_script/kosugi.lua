local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value = 1200
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1100	
	else
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
local ponr = {
	ponr_player_mul = ponr_timer_player_mul,
	ponr = ponr_value
}
	
return {
	--Pro Job PONR when helicopter sequence is started
	[100303] = ponr,
	[101219] = ponr
}