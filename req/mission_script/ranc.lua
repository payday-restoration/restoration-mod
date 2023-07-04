local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_1 = 1650
		ponr_value_2 = 300
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_1 = 1620
		ponr_value_2 = 270	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_1 = 1590
		ponr_value_2 = 240	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_1 = 1560
		ponr_value_2 = 210	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_1 = 1530
		ponr_value_2 = 210	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_1 = 1500
		ponr_value_2 = 180		
	end
end

return {
	--Pro Job PONR
	[103507] = {
		ponr = ponr_value_1
	},
	[100622] = {
		ponr = ponr_value_2
	},
	--fixes some spawn typos
	[100683] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100684] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100789] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100790] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	},
	[100791] = {
		values = {
			spawn_action = "e_sp_over_3m"
		}
	}
}