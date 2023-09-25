local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540		
	end

return {
		--Pro Job PONR 
		[104838] = {
			ponr = ponr_value
	}
}