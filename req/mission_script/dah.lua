return {
	--Disable outline for Ralph if he is tied
	[100461] = {
		on_executed = {
			{id = 100082, delay = 0}
		}
	},
	-- Slow down vault group spawns
	[100722] = {
		values = {
			interval = 30
		}
	},
	[100723] = {
		values = {
			interval = 30
		}
	},
	[104821] = {
		values = {
			interval = 30
		}
	},
	[104822] = {
		values = {
			interval = 30
		}
	}
}