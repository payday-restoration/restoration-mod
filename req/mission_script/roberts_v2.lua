return {
    -- Add early reinforce around the bank
	[100109] = {
		reinforce = {
			{
				name = "bank_left",
				force = 3,
				position = Vector3(-500, -3000, -75),
			},
			{
				name = "bank_front",
				force = 3,
				position = Vector3(3000, 0, -75),
			},
			{
				name = "bank_back",
				force = 3,
				position = Vector3(-3000, -1400, -60),
			},
		},
	},
}