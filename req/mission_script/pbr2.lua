local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if difficulty_index <= 5 then
		ponr_value = 600	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 540	
	elseif difficulty_index == 8 then
		ponr_value = 480		
	end
end

return {
	--Pro Job PONR 
	[101904] = {
		ponr = ponr_value
	}
}