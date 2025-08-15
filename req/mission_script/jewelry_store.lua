return {
    -- edit SWAT heli dropoff
	-- First enable the chopper since it is disabled for some odd reason
	[102593] = enabled,
	[102594] = enabled,
	[103518] = enabled,
	[102599] = enabled,
	[102600] = enabled,
	-- replace mission scripts with a actual spawngroup
	[102599] = {
		on_executed = {
			{ id = 400005, delay = 0 },
		},
	},
	-- open/close the left heli door
	[102597] = {
		values = {
		enabled = true,
	},
		on_executed = {
			{ id = 400007, delay = 0 },
		},
	},
	[102598] = {
		values = {
		enabled = true,
	},
		on_executed = {
			{ id = 400008, delay = 0 },
		},
	},
	-- loop the chopper after it goes hidden
	[102601] = {
		values = {
		enabled = true,
	},
		on_executed = {
			{ id = 102594, delay = 120, delay_rand = 60 },
		},
	},
}