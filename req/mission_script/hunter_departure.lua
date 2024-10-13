local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 420 or (difficulty == 6 or difficulty == 7) and 390) or 360

return {
	--Pro Job PONR 
	[100401] = {
		ponr = ponr_value
	}
}
