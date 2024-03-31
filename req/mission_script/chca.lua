local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	--Two PONR timers due to diffrient routes
	if difficulty <= 5 then
		ponr_value_1 = 960
		ponr_value_2 = 600
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value_1 = 930
		ponr_value_2 = 570
	else
		ponr_value_1 = 900
		ponr_value_2 = 540
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