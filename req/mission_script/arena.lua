return {
	-- Alarm, enable PONR activation upon completing pyrotechnics, and try to start late PONR if pyrotechnics was already completed
	[100824] = {
		on_executed = {
			{ id = 400004, delay = 0, },
			{ id = 400003, delay = 0, },
		},
	},
	-- Pyrotechnics complete, enable late PONR activation, and try to start PONR if alarm already went off
	[101090] = {
		on_executed = {
			{ id = 400002, delay = 0, },
			{ id = 400005, delay = 0, },
		},
	},
	-- Masks off again in stealth, disable PONR activation
	[101771] = {
		on_executed = {
			{ id = 400006, delay = 0, },
		},
	},
}
