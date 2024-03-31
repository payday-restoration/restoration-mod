local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 300
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 360	
	else
		ponr_value = 420		
	end

return {
	--Pro Job PONR 
	[102064] = {
		ponr = ponr_value
	},
	-- Disable turret
	[101035] = {
		values = {
			on_executed = {},
			unit_ids = {
				102775,
				102776
			}
		}
	}
}