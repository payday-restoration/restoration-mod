local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020

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
	[100580] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[102374] = {
		values = {
			elements = {
				102376,
				102377,
				102378,
				102379,
				102380
			}
		}
	},
	-- Disable endless assault
	[101707] = {
		values = {
			enabled = false
		}
	}
}