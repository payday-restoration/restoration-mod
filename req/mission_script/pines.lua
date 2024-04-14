local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 590	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 560	
	else
		ponr_value = 500		
	end

return {
	--Pro Job PONR 
	[106282] = {
		ponr = ponr_value
	},
	[105069] = {
		ponr = ponr_value
	},
	--There's no cops in White Xmas, yes i'm serious
	[100288] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[104193] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[106309] = {
		values = {
            enabled = false
		}
	}
}