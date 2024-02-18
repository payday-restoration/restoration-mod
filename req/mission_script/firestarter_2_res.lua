local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 360	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end

return {
	--Pro Job PONR 
	[107143] = {
		ponr = ponr_value
	}
}