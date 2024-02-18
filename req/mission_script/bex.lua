local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false

	if pro_job then
		hunt_projob = true
	end	

	if difficulty_index <= 5 then
		ponr_value = 600	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
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
	},
	-- Disable server room reinforce
	[101835] = {
		values = {
			enabled = false
		}
	},
	-- Reinforce second floor above tellers
	[100027] = {
		reinforce = {
			{
				name = "teller_balcony1",
				force = 2,
				position = Vector3(1200, -2200, 400)
			},
			{
				name = "teller_balcony2",
				force = 2,
				position = Vector3(-1200, -2200, 400)
			}
		}
	},
	-- Reinforce drill parts car on first break
	[103346] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(3100, -1400, 0)
			}
		}
	},
	[103347] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(1600, 2100, 0)
			}
		}
	},
	[103352] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(1800, -2000, 0)
			}
		}
	},
	[103354] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(-1700, 3300, 0)
			}
		}
	},
	-- Disable parts reinforce when drill is done+Pro Job Hunt (Endless Assault)
	[101829] = {
		hunt = hunt_projob,
		reinforce = {
			{
				name = "parts_car"
			}
		}
	}
}