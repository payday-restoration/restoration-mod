local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[101829] = {
		ponr = ponr_value,
		enabled = ponr_toggle
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
	--fixes Locke repeating the same dialogue causing PONR timer to be reset, fix this OVK
	[103317] = {
		values = {
			dialogue = "Play_loc_bex_109"
		}
	}
}