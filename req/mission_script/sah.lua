return {
	-- Disable instant difficulty increase
	[100122] = {
		values = {
			enabled = false
		}
	},
	--Made Locke less annoying
	[101989] = {
		values = {
			trigger_times = 1
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