local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 480
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 450
	else
		ponr_value = 420	
	end

return {
	--Pro Job PONR 
	[101196] = {
		ponr = ponr_value
	},
	--End PONR once everyone is inside the escape zone
	[100027] = {
        ponr_end = true
    }
}