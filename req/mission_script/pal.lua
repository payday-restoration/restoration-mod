if Global.game_settings and Global.game_settings.one_down then
ponr_value_1 = 0
ponr_toggle_1 = false

ponr_value_2 = 0
ponr_toggle_2 = false
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_1 = 330
		ponr_toggle_1 = true
		
		ponr_value_2 = 690
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_1 = 300
		ponr_toggle_1 = true	
		
		ponr_value_2 = 660
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_1 = 270
		ponr_toggle_1 = true

		ponr_value_2 = 630
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_1 = 240
		ponr_toggle_1 = true

		ponr_value_2 = 600
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_1 = 210
		ponr_toggle_1 = true	
		
		ponr_value_2 = 570
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_1 = 180
		ponr_toggle_1 = true	

		ponr_value_2 = 540
		ponr_toggle_2 = true
	end
end

return {
	--Pro Job PONR 
	[102644] = {
		ponr = ponr_value_1,
		enabled = ponr_toggle_1
	},
	[102654] = {
		ponr = ponr_value_1,
		enabled = ponr_toggle_1
	},
	[101899] = {
		ponr = ponr_value_2,
		enabled = ponr_toggle_2
	},
	[101907] = {
		ponr = ponr_value_2,
		enabled = ponr_toggle_2
	}
}