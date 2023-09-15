local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 750
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 720	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 690	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600		
	end

return {
		--Pro Job PONR 
		[102872] = {
			ponr = ponr_value
	},
	-- Delay SWAT response
	[100327] = {
		on_executed = {
			{ id = 100768, delay = 30 }
		}
	}
}