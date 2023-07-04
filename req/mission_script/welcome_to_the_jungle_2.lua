local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 540	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 510	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 480		
	end
end

return {
	--Pro Job PONR 
	[103087] = {
		ponr = ponr_value
	},
	[103328] = {
		ponr = ponr_value
	},
	[102207] = {
		ponr = ponr_value
	},
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 10,
			base_delay_rand = 10
		}
	}
}