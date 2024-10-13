local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
	
local low_interval = {
	values = {
			interval = 20
		}
}	
return {
	--Pro Job PONR 
	[100483] = {
		ponr = ponr_value
	},
	-- Slow down window spawns
	[100750] = low_interval,
	[101012] = low_interval,
	[102138] = low_interval,
	[104338] = low_interval
}