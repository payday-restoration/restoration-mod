local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 4 then
		ponr_value = 300
	elseif difficulty_index == 5 then
		ponr_value = 360	
	else
		ponr_value = 420	
	end

return {
	--Pro Job PONR 
	[101761] = {
		ponr = ponr_value
	},
	[101836] = {
		ponr = ponr_value
	},
	[102031] = {
		ponr = ponr_value
	},
	[102033] = {
		ponr = ponr_value
	}
}