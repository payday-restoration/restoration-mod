
local disabled = {
	values = {
		enabled = false,
	},
}
local exhibit_rappel_spawn = {
	values = {
		interval = 45,
	},
}
local exhibit_slow_rappel_spawn = {
	values = {
		interval = 60,
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
	-- Spawn group intervals
	[101946] = exhibit_rappel_spawn,
	[101959] = exhibit_rappel_spawn,
	[100019] = exhibit_slow_rappel_spawn,
	[100809] = exhibit_slow_rappel_spawn,
	[100810] = exhibit_slow_rappel_spawn,
	[100021] = exhibit_slow_rappel_spawn,
}