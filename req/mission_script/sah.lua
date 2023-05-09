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
	[103820] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- Disable instant difficulty increase
	[100122] = {
		values = {
			enabled = false
		}
	},
	-- Loud, slightly delay police response
	[100109] = {
		values = {
			base_delay = 30
		}
	},
	[100129] = {
		difficulty = 0.4,
		reinforce = {
			{
				name = "auction_room",
				force = 3,
				position = Vector3(0, 2000, -100)
			},
			{
				name = "outside",
				force = 3,
				position = Vector3(0, -3300, -50)
			}
		}
	},
	-- Slow down roof spawns
	[102667] = {
		values = {
			interval = 20
		}
	},
	[106776] = {
		values = {
			interval = 20
		}
	},
	[106767] = {
		values = {
			interval = 20
		}
	},
	[106764] = {
		values = {
			interval = 20
		}
	},
	[100694] = {
		values = {
			interval = 30
		}
	},
	[100154] = {
		values = {
			interval = 30
		}
	},
	-- Slow down storage spawns
	[102303] = {
		values = {
			interval = 40
		}
	},
	[103662] = {
		values = {
			interval = 20
		}
	},
	[104089] = {
		values = {
			interval = 40
		}
	},
	-- Slow down and adjust storage window spawns
	[103522] = {
		values = {
			interval = 60
		},
		groups = {
			tac_bull_rush = false,
			tac_shield_wall = false,
			tac_shield_wall_ranged = false,
			tac_shield_wall_charge = false
		}
	},
	--Made Locke less annoying
	[101989] = {
		values = {
			trigger_times = 1
		}
	}
}