return {
	-- Alarm went off, try to start PONR if pyrotechnics was already completed, and enable activation if not
	[100824] = {
		on_executed = {
			{ id = 400002, delay = 0, },
			{ id = 400003, delay = 0, },
		},
	},
	-- Pyrotechnics complete, try to start PONR if alarm already went off, and enable activation if not
	[101090] = {
		on_executed = {
			{ id = 400002, delay = 0, },
			{ id = 400003, delay = 0, },
		},
	},
	-- Masks off again in stealth, disable PONR activation
	[101771] = {
		on_executed = {
			{ id = 400004, delay = 0, },
		},
	},
}
