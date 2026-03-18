local so_action_fix = {
	values = {
		so_action = "e_nl_down_9_3m_rappel"
	}
}

return {
	-- reinforce once you enter the prison 
	[100178] = {
		reinforce = {
			{
				name = "entrance", 
				force = 4, 
				position = Vector3(-1994, -4730, -38.001),
			},
			{
				name = "dirty_laundry",
				force = 2, 
				position = Vector3(4065, -1971, -125),
			},
			{
				name = "laundry_entrance", 
				force = 2, 
				position = Vector3(1721, -349, -25),
			},
			{
				name = "come_on_and_slam", 
				force = 2, 
				position = Vector3(-366, 190, -100.002),
			},
			{
				name = "block_b",
				force = 3, 
				position = Vector3(49, -1850, -425),
			},
			{
				name = "first_wheel", 
				force = 4, 
				position = Vector3(-4544, -1677, 10.727),
			},
		},
	},
	-- Fix Prison Nightmare SO animations
	[100347] = so_action_fix,
	[100348] = so_action_fix,
	[100349] = so_action_fix,
	[100351] = so_action_fix,
	[100352] = so_action_fix,
	[100353] = so_action_fix,
	[100354] = so_action_fix,
	[100355] = so_action_fix,
	[100360] = so_action_fix,
	--PONR at the end of the heist
	[101715] = {
		ponr = 300
	},
	-- ZIpline Defenders
	[101718] = {
		on_executed = {
			{ id = 400013, delay = 0 }
		}
	},
	-- Escape Defenders 
	[100634] = {
		on_executed = {
			{ id = 400031, delay = 0}
		}
	},
}