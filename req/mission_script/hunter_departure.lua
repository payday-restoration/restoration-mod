local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 420	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 390	
	else
		ponr_value = 360
	end

return {
	--Pro Job PONR 
	[100401] = {
		ponr = ponr_value
	}
}
