local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
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