local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1260 or (difficulty == 6 or difficulty == 7) and 1230) or 1200

local ponr_timer_player_mul = {
		1,
		0.9,
		0.8,
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
		0.65
}

return {
	--Pro Job PONR 
	[101090] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	}
}