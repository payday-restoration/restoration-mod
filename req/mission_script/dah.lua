local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 900
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 860
	else
		ponr_value = 820
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
	--PONR Pro Job
	[101916] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Disable outline for Ralph if he is tied
	[100461] = {
		on_executed = {
			{id = 100082, delay = 0}
		}
	}
}