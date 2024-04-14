local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 360	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330
	else
		ponr_value = 300	
	end

return {
	--Pro Job PONR 
	[100483] = {
		ponr = ponr_value
	},
	-- Slow down window spawns
	[100750] = {
		values = {
			interval = 20
		}
	},
	[101012] = {
		values = {
			interval = 20
		}
	},
	[102138] = {
		values = {
			interval = 20
		}
	},
	[104338] = {
		values = {
			interval = 20
		}
	}
}