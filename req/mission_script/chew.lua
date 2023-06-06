local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1050
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1020	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 990
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 960
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 930
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 900		
	end
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