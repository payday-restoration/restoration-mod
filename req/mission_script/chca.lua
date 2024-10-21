local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value_1 = (difficulty <= 5 and 960 or (difficulty == 6 or difficulty == 7) and 930) or 900
local ponr_value_2 = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

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
	[101331] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value_1
	},
	[102615] = {
		ponr = ponr_value_2
	},
	[101469] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	[101470] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	}
}