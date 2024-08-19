local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 540	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 510
	else
		ponr_value = 480	
	end

return {
	--Pro Job PONR
	[100454] = {
		ponr = ponr_value
	}
}