local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 600	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
		ponr_value = 540		
	end

return {
	--Pro Job PONR 
	[104838] = {
		ponr = ponr_value
	},
	--Have one camera guard spawn up to Overkill
	[103758] = {
		values = {
            difficulty_hard = "true",
			difficulty_overkill = "true",
			difficulty_overkill_145 = "true"
		}
	},
	[103765] = {
		values = {
            difficulty_hard = "false",
			difficulty_overkill = "false",
			difficulty_overkill_145 = "false"
		}
	}
}