local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 540	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 510	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 480		
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
	--Allow snipers spawn more frequently
	[103192] = {
		values = {
			trigger_times = 0
		}
	},
	[100481] = {
		values = {
			trigger_times = 0
		}
	},
	[100484] = {
		values = {
			chance = 100
		}
	},
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 10,
			base_delay_rand = 10
		}
	}
}