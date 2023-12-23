local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local ponr_helicopter = nil

	if difficulty_index <= 5 then
		ponr_value = 680
		ponr_helicopter = 500
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 640
		ponr_helicopter = 460
	else
		ponr_value = 600
		ponr_helicopter = 420
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