return {
	-- Pro Job PONR
	-- Alarm, try to start The Diamond taken PONR if it was already taken, toggle PONR on otherwise
	[100824] = {
		on_executed = {
			{ id = 400001, delay = 0, },
			{ id = 400004, delay = 0, },
		},
	},
	-- The Diamond taken, try to start PONR if alarm went off, toggle PONR on otherwise
	[101913] = {
		on_executed = {
			{ id = 400001, delay = 0, },
			{ id = 400004, delay = 0, },
		},
	},
	-- Helicopter flare placeable, start new PONR
	[102425] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	-- Helicopter full of loot and leaving, restart PONR
	[102462] = {
		on_executed = {
			{ id = 400003, delay = 0, },
		},
	},
}
