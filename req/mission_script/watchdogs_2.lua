local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_close_warehouse = (difficulty < 3 and 0.05 or difficulty < 5 and 0.1 or difficulty < 7 and 0.15 or 0.2) + (pro_job and 0.05 or 0)
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
local interval_front = {
	values = {
		interval = 6, 
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
	-- 104013 handles the outside power switch
	-- 104003 handles fully opening the warehouse
	-- 104012 handles the inside power switch
	[104001] = warehouse_filter,
	[104013] = warehouse_filter,
	[104003] = warehouse_filter_2,
	[104012] = warehouse_filter_2,
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
	[103999] = {
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
	-- Spawn FBI Ready Teams
	-- Spawn a scripted dozer
	-- Spawn Ground Snipers
	[100486] = {
		on_executed = {
			{ id = 400055, delay = 15, delay_rand = 5, },
			{ id = 400058, delay = 150, delay_rand = 60, },
			{ id = 400062, delay = 180, delay_rand = 90, },
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
	-- 1st assault reinforce
	[100511] = {
		reinforce = {
			{
				name = "diff50_reinforce1",
				force = 3,
				position = Vector3(-1500, 800, 0),
			},
			{
				name = "diff50_reinforce2",
				force = 3,
				position = Vector3(-800, 3200, 0),
			},
		},
	},
	-- 2nd assault reinforce
	[103637] = {
		reinforce = {
			{
				name = "diff75_reinforce1",
				force = 3,
				position = Vector3(400, 1200, 0),
			},
			{
				name = "diff75_reinforce2",
				force = 3,
				position = Vector3(900, -800, 0),
			},
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
	-- decreased front spawn intervals since players are mostly at the back anyways 
	[100167] = interval_front, 
	[100154] = interval_front, 
	[100146] = interval_front, 
}
