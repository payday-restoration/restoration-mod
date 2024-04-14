local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 660	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 630
	else
		ponr_value = 600	
	end

return {
	--Pro Job PONR 
	[100106] = {
		ponr = ponr_value
	},
	-- Boss spawn
	[100707] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100645] = {
		difficulty = 0.75
	},
	-- Disable difficulty 1 element
	[100909] = {
		values = {
			enabled = false
		}
	}
}