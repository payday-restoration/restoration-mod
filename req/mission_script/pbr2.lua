if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1050
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1020
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 990
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 960
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 930
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 900
		ponr_toggle = true		
	end
end

return {
		--Pro Job PONR 
		[101904] = {
			ponr = ponr_value,
			enabled = ponr_toggle
	},
	-- disables sewer spawns
	[100085] = {
		values = {
			enabled = false
		}
	},
	[100100] = {
		values = {
			enabled = false
		}
	},
	[100101] = {
		values = {
			enabled = false
		}
	},
	[101029] = {
		values = {
			enabled = false
		}
	},
	[100098] = {
		values = {
			enabled = false
		}
	},
	[100111] = {
		values = {
			enabled = false
		}
	},
	[100112] = {
		values = {
			enabled = false
		}
	},
	[100113] = {
		values = {
			enabled = false
		}
	}
}