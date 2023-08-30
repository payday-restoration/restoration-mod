local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540	
	end

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}

return {
	--Pro Job PONR 
	[101485] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- restores some unused sniper spawns with their SOs
	[100372] = {
		values = {
			enabled = true
		}
	},
	[100402] = {
		values = {
			enabled = true
		}
	},
	[100392] = {
		values = {
			enabled = true
		}
	},
	[100412] = {
		values = {
			enabled = true
		}
	},
	[100377] = {
		values = {
			enabled = true
		}
	},
	[100407] = {
		values = {
			enabled = true
		}
	},
	[100397] = {
		values = {
			enabled = true
		}
	},
	[100417] = {
		values = {
			enabled = true
		}
	},
	--disables the weird roof navlink
	[102554] = {
		values = {
			enabled = false
		}
	},
	--fixes Locke repeating the same "Play_loc_bex_108" dialogue instead of using the correct one
	[103317] = {
		values = {
			dialogue = "Play_loc_bex_109"
		}
	}
}