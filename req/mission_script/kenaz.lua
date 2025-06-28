local pro_job_ponr = {
	on_executed = {
		{ id = 400006, delay = 0, },
	},
}
local disable = {
	values = {
		enabled = false,
	},
}

return {
	-- Disable endless assault
	[102786] = disable,
	-- Pro Job PONR
	-- Triggers once both A) whisper state is off (on alarm), and B) a player has entered the vault
	[100281] = pro_job_ponr,
	[100524] = pro_job_ponr,
	-- Toggle PONR durations based on escape plan
	-- BFD/blimp escape
	[101915] = {
		on_executed = {
			{ id = 400007, delay = 0, },
			{ id = 400004, delay = 0, },
		},
	},
	-- Van escape
	[100708] = {
		on_executed = {
			{ id = 400007, delay = 0, },
			{ id = 400005, delay = 0, },
		},
	},
	-- Reinforce points
	[101620] = {
		reinforce = {
			{
				name = "stairs_right",
				force = 2,
				position = Vector3(375, -3675, 300),
			},
			{
				name = "stairs_left",
				force = 2,
				position = Vector3(-350, -3675, 300),
			},
		},
	},
	[100379] = {
		reinforce = {
			{ name = "stairs_right", },
			{ name = "stairs_left", },
			{
				name = "security",
				force = 3,
				position = Vector3(125, 1575, 100),
			},
		},
	},
}
