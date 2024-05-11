local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 360	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330
	else
		ponr_value = 300	
	end
	
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