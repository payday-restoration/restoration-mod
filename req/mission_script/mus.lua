
local disabled = {
	values = {
		enabled = false,
	},
}
return {
	-- Pro Job PONR
	-- Triggers once both A) the flare to call in Bile is placeable, and B) whisper state is off (on alarm)
	[100824] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	[102426] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	[100109] = { -- reinforce stuff 
		reinforce = {
			{
				name = "reception",
				force = 4,
				position = Vector3(-2995, 235, -700.005),
			},
			{
				name = "middle", 
				force = 2, 
				position = Vector3(107, 302, -389.245),
			},
			{
				name = "mummy_room", 
				force = 2, 
				position = Vector3(67, 2280, -300),
			},
			{
				name = "artifact_room", 
				force = 2, 
				position = Vector3(-31, -1614, -300),
			},
		},
	},
	-- disable the one useless sniper from the outside 
	[100368] = disabled,
}