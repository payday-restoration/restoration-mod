return {
	-- Disable instant difficulty increase
	[100122] = {
		values = {
			enabled = false
		}
	},
	[101400] = {
		difficulty = 0.5,
		reinforce = {
			{
				name = "auction_room",
				force = 5,
				position = Vector3(0, 2000, -100)
			}
		}
	}
}