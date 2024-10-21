local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

local disabled = {
	values = {
        enabled = false
	}
}
local low_interval = {
	values = {
			interval = 20
		}
}
local medium_interval = {
	values = {
			interval = 30
		}
}
local high_interval = {
	values = {
			interval = 40
		}
}	

return {
	--Pro Job PONR 
	[103820] = {
		ponr = ponr_value
	},
	--Trigger Hunt on Pro Jobs (Endless Assault)
	[101175] = {
		values = {
			enabled = hunt_projob
		}
	},
	-- Disable instant difficulty increase
	[100122] = disabled,
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
				force = 2,
				position = Vector3(0, 2000, -100)
			},
			{
				name = "outside",
				force = 2,
				position = Vector3(0, -3300, -50)
			}
		},
		on_executed = {
			{ id = 100127, delay = 0 },
			{ id = 103905, delay = 0 },
			{ id = 103910, delay = 0 },
			{ id = 103912, delay = 0 },
			{ id = 103913, delay = 0 }
		}
	},
	-- Disable area report triggers
	[100140] = disabled,
	[106783] = disabled,
	[103926] = disabled,
	[106784] = disabled,
	-- Slow down roof spawns
	[102667] = low_interval,
	[106776] = low_interval,
	[106767] = low_interval,
	[106764] = low_interval,
	[100694] = medium_interval,
	[100154] = medium_interval,
	-- Slow down storage spawns
	[102303] = high_interval,
	[103662] = low_interval,
	[104089] = high_interval,
	-- Slow down and adjust storage window spawns
	[103522] = {
		values = {
			interval = 60
		},
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false,
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	--Made Locke less annoying, really shut the fuck up
	[101989] = {
		values = {
			trigger_times = 1
		}
	}
}