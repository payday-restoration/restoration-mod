return {
	-- Pro Job PONR, loud boat escape (vault stolen Panic Room style)
	-- Wall blown, start Panic Room style PONR and disable it's PAYDAY style PONR
	[102615] = {
		on_executed = {
			{ id = 400001, delay = 0, },
			{ id = 400005, delay = 0, },
		},
	},
	-- Pro Job PONR, loud helicopter escape (it's PAYDAY)
	-- Vault opened, try to start PONR if alarm already went off, and enable late activation on if not
	-- Also disable Panic Room style PONR
	[101165] = {
		on_executed = {
			{ id = 400003, delay = 0, },
			{ id = 400004, delay = 0, },
			{ id = 400006, delay = 0, },
		},
	},
	-- Alarm went off, try to start PONR if vault's already open, and enable activation if not
	[100824] = {
		on_executed = {
			{ id = 400003, delay = 0, },
			{ id = 400004, delay = 0, },
		},
	},
	[101469] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false,
		},
	},
	[101470] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false,
		},
	},
}
