return {
	-- Pro Job PONR
	-- Triggers once both A) the flare to call in Bile is placeable, and B) whisper state is off (on alarm)
	[100824] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	[102426] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
}
