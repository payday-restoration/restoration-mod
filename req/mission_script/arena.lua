local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1320
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1320 	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1290	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1260	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1230
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1200	
	end
end

return {
	--Pro Job PONR 
	[101090] = {
		ponr = ponr_value
	}
}