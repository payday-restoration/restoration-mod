return {
	-- Fix power cut SO delay and add some random delay
	[104685] = {
		values = {
			base_delay = 15,
			base_delay_rand = 15
		}
	},
	-- Always have 3 power boxes to defend regardless of difficulty
	[104661] = {
		values = {
			amount = 3
		}
	},
	[105352] = {
		values = {
			amount = 3
		}
	}
}