local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 540) or 480

return {
	--Pro Job PONR 
	[101904] = {
		ponr = ponr_value
	}
}