return {
	-- Increase PONR timers
	[102646] = {
		values = {
			time_normal = 300,
			time_hard = 300,
			time_overkill = 300,
			time_overkill_145 = 300,
			time_easy_wish = 300,
			time_overkill_290 = 300,
			time_sm_wish = 300
		},
		on_executed = {
		{ id = 103338, delay = 0 },
		{ id = 103992, delay = 0 },
		{ id = 104949, delay = 0 },
		{ id = 101623, delay = 299.8 },
		{ id = 100618, delay = 0 }
		}
	},
	[104949] = {
		on_executed = {
		{ id = 104945, delay = 180 }
		}
	},
	-- Increase spawn group intervals in pipe arena
	[105278] = {
		values = {
			interval = 12
		}
	},
	[102086] = {
		values = {
			interval = 12
		}
	},
	[103986] = {
		values = {
			interval = 12
		}
	},
	[101777] = {
		values = {
			interval = 12
		}
	},
	[101778] = {
		values = {
			interval = 12
		}
	}
}