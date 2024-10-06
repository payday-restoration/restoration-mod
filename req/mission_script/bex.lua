local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

local enabled = {
	values = {
        enabled = true
	}
}
local disabled = {
	values = {
        enabled = false
	}
}	

return {
	--Pro Job PONR 
	[101485] = {
		ponr = ponr_value
	},
	--Allow only one turret to spawn (for some reason map designer allowed to spawn turrets on hard instead)
	[102990] = {
		values = {
			difficulty_hard = "false"
		}
	},
	--Disable other SWAT Turrets
	[102991] = disabled,
	[102992] = disabled,
	[103003] = disabled,
	-- restores some unused sniper spawns with their SOs
	[100372] = enabled,
	[100402] = enabled,
	[100392] = enabled,
	[100412] = enabled,
	[100377] = enabled,
	[100407] = enabled,
	[100397] = enabled,
	[100417] = enabled,
	--disables the weird roof navlink
	[102554] = disabled,
	--fixes Locke repeating the same "Play_loc_bex_108" dialogue instead of using the correct one
	[103317] = {
		values = {
			dialogue = "Play_loc_bex_109"
		}
	},
	-- Disable server room reinforce
	[101835] = disabled,
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
	-- Has a chance to spawn dozers inside the vault
	[101829] = {
		on_executed = {
			{id = 400001, delay = 6},
			{id = 400002, delay = 6}
		},
		hunt = hunt_projob,
		reinforce = {
			{
				name = "parts_car"
			}
		}
	}
}