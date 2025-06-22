local pro_job_ponr = {
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}

return {
	-- Pro Job PONR
	[100185] = pro_job_ponr,
	[100281] = pro_job_ponr,
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
