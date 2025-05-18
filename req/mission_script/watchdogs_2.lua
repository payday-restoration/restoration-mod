local enabled = {
	values = {
		enabled = true,
	},
}

return {
	-- Pro Job PONR
	[100324] = {
		on_executed = {
			{ id = 400061, delay = 0, },
		},
	},
	-- Enable unused reinforce points
	[101954] = enabled,
	[101955] = enabled,
	[101984] = enabled,
	[101987] = enabled,
	[102123] = enabled,
	[102125] = enabled,
	[102126] = enabled,
	[100210] = {
		values = {
			enabled = false,
		},
	},
	-- Spawn FBI Ready Teams
	-- Spawn a scripted dozer after 150 seconds
	-- Spawn Ground Snipers after 3 minutes
	[100486] = {
		on_executed = {
			{ id = 400054, delay = 25, },
			{ id = 400058, delay = 150, },
			{ id = 400056, delay = 180, },
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
}
