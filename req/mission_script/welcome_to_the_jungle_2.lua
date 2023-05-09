local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 630
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 600
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 570
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 540
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 510
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 480
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[103087] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[103328] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[102207] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 10,
			base_delay_rand = 10
		}
	}
}