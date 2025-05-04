return {
	-- Escape area trigger starts disabled
	[100710] = {
		values = {
			enabled = false,
		},
	},
	-- Toggle on the escape area trigger when it should be available, in addition to the escape logic link
	[100711] = {
		values = {
			elements = {
				100710,
				100723,
			},
		},
	},
	-- Increase PONR timers
	[100720] = {
		values = {
			elements = { 100710, },
			time_easy = 60,
			time_normal = 60,
			time_hard = 60,
			time_overkill = 60,
			time_overkill_145 = 60,
			time_easy_wish = 60,
			time_overkill_290 = 60,
			time_sm_wish = 60,
		},
	},
}
