local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 680 or (difficulty == 6 or difficulty == 7) and 640) or 600
local ponr_helicopter = (difficulty <= 5 and 500 or (difficulty == 6 or difficulty == 7) and 460) or 420

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
	--Pro Job PONR stuff
	[101913] = {
		ponr = ponr_value
	},
	[102425] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_helicopter + 30
	},
	[102462] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_helicopter
	}
}