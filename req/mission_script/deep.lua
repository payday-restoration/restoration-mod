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
		{ id = 101623, delay = 299.8 }
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
			interval = 7
		}
	},
	[102086] = {
		values = {
			interval = 7
		}
	},
	[103986] = {
		values = {
			interval = 7
		}
	},
	[101777] = {
		values = {
			interval = 7
		}
	},
	[101778] = {
		values = {
			interval = 7
		}
	}
}