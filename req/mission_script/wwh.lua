local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 960
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 930
	else
		ponr_value = 900	
	end	

return {
	--Pro Job PONR 
	[100914] = {
		ponr = ponr_value
	},
	-- Gradually increase difficulty
	[100810] = {
		difficulty = 0.25
	},
	[101313] = {
		difficulty = 1
	}
}	