local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
local disabled = {
	values = {
		enabled = false,
	},
}
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
	-- Pro Job PONR 
	[100580] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[102374] = {
		values = {
			elements = {
				102376,
				102377,
				102378,
				102379,
				102380
			}
		}
	},
	-- Disable endless assault
	[101707] = {
		values = {
			enabled = false
		}
	},
	[101386] = disabled,
	-- Replace the turret/scripted van spawn with a spawngroups
	[100264] = { -- arrive 1
		on_executed = {
			{ id = 400005, delay = 0 },
			{ id = 101791, remove = true },
		},
	},
	[101974] = { -- arrive 2
		on_executed = {
			{ id = 400011, delay = 0 },
			{ id = 101938, remove = true },
		},
	},
	[101972] = { -- arrive 3
		on_executed = {
			{ id = 400017, delay = 0 },
			{ id = 101936, remove = true },
		},
	},
	[101966] = { -- arrive 4
		on_executed = {
			{ id = 400023, delay = 0 },
			{ id = 101939, remove = true },
		},
	},
}