local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 540
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 510
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 480
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 420
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 390
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 360
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
	[104949] = {
		ponr = ponr_value
	},
	--PONR for stealth
	[101916] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value * 2
	}
}
--100457 - vault door open
--101916 - 