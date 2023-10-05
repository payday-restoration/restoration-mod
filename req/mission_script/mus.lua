local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 480	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 540	
	elseif difficulty_index == 8 then
		ponr_value = 600		
	end

return {
	--Pro Job PONR 
	[101913] = {
		ponr = ponr_value
	}
}