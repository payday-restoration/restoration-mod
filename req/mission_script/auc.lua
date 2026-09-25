return {
	-- Combine some navigation areas
	[101204] = { -- link_startup
		ai_area = {
			{ 97, 130, 131 },
			{ 95, 35 },
			{ 150, 162 },
		},
	},
	-- New reinforce
	[103416] = { -- difficulty_0.5
		reinforce = {
			{
				name = "what_a_nice_truck",
				force = 2,
				position = Vector3(1400, 5375, -100),
			},
			{
				name = "street01",
				force = 2,
				position = Vector3(1200, 1000, -100),
			},
			{
				name = "street02",
				force = 2,
				position = Vector3(1225, 3425, -100),
			},
		},
	},
	[103629] = { -- difficulty_1
		reinforce = {
			{
				name = "such_nice_cars",
				force = 2,
				position = Vector3(-3225, 4200, 0),
			},
			{
				name = "reception",
				force = 2,
				position = Vector3(-900, 2300, 0),
			},
		},
	},
	[106784] = { -- enemy_trigger_auctioneer_dead
		reinforce = {
			{
				name = "auction",
				force = 2,
				position = Vector3(-3600, 1400, 400),
			},
		},
	},

-- Reinforce fountain
	[103141] = {
		reinforce = {
			{
				name = "fountain",
				force = 3,
				position = Vector3(2600, 2850, -80)
			}
		},
	},
	[103330] = {
		reinforce = {
			{
				name = "fountain"
			},
		},
	},
-- Disable auctioneer sniper objective on damage
	[105761] = {
		values = {
			interruptible = true,
			interrupt_dmg = 0.1,
			interrupt_dis = 3
		},
	},
}

