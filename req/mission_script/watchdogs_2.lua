local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_close_warehouse = (difficulty < 3 and 0.01 or difficulty < 5 and 0.02 or difficulty < 7 and 0.04 or 0.08) + (pro_job and 0.04 or 0)
local close_warehouse = math.random() < chance_close_warehouse
local warehouse_filter = {
	values = {
		difficulty_easy = close_warehouse,
		difficulty_normal = close_warehouse,
		difficulty_hard = close_warehouse,
		difficulty_overkill = close_warehouse,
		difficulty_overkill_145 = close_warehouse,
		difficulty_easy_wish = close_warehouse,
		difficulty_overkill_290 = close_warehouse,
		difficulty_sm_wish = close_warehouse,
	},
}
local warehouse_filter_2 = {
	values = {
		difficulty_easy = not close_warehouse,
		difficulty_normal = not close_warehouse,
		difficulty_hard = not close_warehouse,
		difficulty_overkill = not close_warehouse,
		difficulty_overkill_145 = not close_warehouse,
		difficulty_easy_wish = not close_warehouse,
		difficulty_overkill_290 = not close_warehouse,
		difficulty_sm_wish = not close_warehouse,
	},
}
local enable = {
	values = {
		enabled = true,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}
local disable_cheat_spawns_fix = {
	values = {
		amount = "all",
		width = 7000,
	},
}
local enable_cheat_spawns_fix = {
	values = {
		width = 7000,
	},
}

return {
	-- Pro Job PONR when the escape heli arrives
	[100324] = {
		on_executed = {
			{ id = 400061, delay = 0, },
		},
	},
	-- Rework closing the warehouse to be chance-based
	-- Warehouse starts with some doors closed but inside logic enabled
	-- 104001 handles fully closing the warehouse
	-- 104003 handles fully opening the warehouse
	[104001] = warehouse_filter_2,
	[104003] = warehouse_filter,
	-- Enable unused reinforce points
	[101954] = enable,
	[101955] = enable,
	[101984] = enable,
	[101987] = enable,
	[102123] = enable,
	[102125] = enable,
	[102126] = enable,
	-- Prevent removal of reinforce when the boat arrives
	[100210] = disable,
	-- Add new Cloaker group and enable random spawn points on first assault starting
	[103399] = {
		on_executed = {
			{ id = 400076, delay = 0, },
			{ id = 400067, delay = 0, },
		},
	},
	-- Keep enabling random Cloaker spawn points at the end of each assault
	[103636] = {
		on_executed = {
			{ id = 400067, delay = 0, },
		},
	},
	-- Delay the initial assault (vanilla delay on this is 15s)
	[101115] = {
		on_executed = {
			{ id = 100511, delay = 90, },
		},
	},
	-- Spawn FBI Ready Teams after 15-20s
	-- Spawn a scripted dozer after 150-210s
	-- Spawn Ground Snipers after 180-270s
	[100486] = {
		on_executed = {
			{ id = 400055, delay = 15, delay_rand = 5, },
			{ id = 400058, delay = 150, delay_rand = 60, },
			{ id = 400056, delay = 180, delay_rand = 90, },
		},
	},
	-- Spawn Snipers on the ships
	[102182] = {
		on_executed = {
			{ id = 400013, delay = 20, },
		},
	},
	[102388] = {
		on_executed = {
			{ id = 400014, delay = 20, },
		},
	},
	[102335] = {
		on_executed = {
			{ id = 400015, delay = 20, },
		},
	},
	-- Fix cheat spawn area triggers not being wide enough and reenabling spawns too soon
	[101013] = disable_cheat_spawns_fix,
	[101235] = disable_cheat_spawns_fix,
	[101010] = enable_cheat_spawns_fix,
	[101220] = enable_cheat_spawns_fix,
	-- Dock Cloakers start disabled
	[103961] = disable,
	[103963] = disable,
	[103965] = disable,
	[103967] = disable,
	[103969] = disable,
	[103971] = disable,
	[103973] = disable,
	[103975] = disable,
	[103977] = disable,
	[103979] = disable,
}
