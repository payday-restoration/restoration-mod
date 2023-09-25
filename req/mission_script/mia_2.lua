local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 330
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 300
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 240		
	end

return {
	--Pro Job PONR 
	[100220] = {
		ponr = ponr_value
	},
	-- Boss spawn
	[100521] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100533] = {
		difficulty = 1
	}
}