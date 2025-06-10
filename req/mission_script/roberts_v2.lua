return {
    -- Add early reinforce around the bank
	[100109] = {
	reinforce = {
			{
				name = "bank_left",
				force = 2,
				position = Vector3(-500, -3000, -75),
			},
			{
				name = "bank_right",
				force = 2,
				position = Vector3(450, 1750, -75),
			},
			{
				name = "bank_front",
				force = 2,
				position = Vector3(2950, -650, -75),
			},
			{
				name = "bank_back",
				force = 2,
				position = Vector3(-3250, -1375, -60),
			},
		},
	},
}