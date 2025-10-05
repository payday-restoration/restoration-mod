
local hunt_projob = pro_job
local murky_response_timer = (mayhem_above and 90) or 120
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
	-- Pro Job PONR
	-- Murkies spawn after a while
	[103820] = {
		on_executed = {
			{id = 400024, delay = 0, },
			{id = 400001, delay = murky_response_timer},
		},
	},
	-- Turn off Whisper State
	[100680] = {
			on_executed = {
			{id = 400024, delay = 0, },
		},
	},
	-- Trigger Hunt on Pro Jobs (Endless Assault)
	[101175] = {
		values = {
			enabled = hunt_projob,
		},
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
	-- Diff increased, enable additional reinforce
	[100124] = {
		reinforce = {
			{
				name = "upper_right",
				force = 2,
				position = Vector3(800, 2000, 500),
			},
			{
				name = "upper_left",
				force = 2,
				position = Vector3(-800, 2000, 500),
			},
		},
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