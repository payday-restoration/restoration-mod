
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
	-- Cloaker in the diamond room 
	-- activate in loud 
	[100023] = {
		on_executed = {
			{ id = 400005, delay = 0,},
		},
	},
	[100109] = { -- reinforce stuff 
		reinforce = {
			{
				name = "reception",
				force = 3,
				position = Vector3(-3121, 226, -700.005),
			},
			{
				name = "middle", 
				force = 3, 
				position = Vector3(-440, 85, -363.758),
			},
			{
				name = "mummy_room", 
				force = 2, 
				position = Vector3(67, 2280, -300),
			},
			{
				name = "artifact_room_01", 
				force = 2, 
				position = Vector3(-31, -1614, -300),
			},
		},
	},
	-- spawn cloaker as the door opens 
	[101893] = {
		on_executed = {
			{ id = 400004, delay = 0,}, 
		},
	},s
}