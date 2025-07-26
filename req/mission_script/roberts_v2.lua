local street_spawn = {
	values = {
		interval = 5,
	},
}
local wall_spawn = {
	values = {
		interval = 10,
	},
}
local rear_spawn = {
	values = {
		interval = 15,
	},
}
local sewer_spawn = {
	values = {
		interval = 20,
	},
}
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
	-- Replace the turret with a spawngroup
	[106548] = {
		on_executed = {
			{ id = 106539, remove = true },
			{ id = 400005, delay = 0, delay_rand = 5 },
		},
	},
	-- Spawngroup delays
	[100128] = street_spawn,
	[100132] = street_spawn,
	[100133] = street_spawn,
	[100694] = rear_spawn,
	[100130] = wall_spawn,
	[100131] = wall_spawn,
	[103294] = sewer_spawn,
	[103295] = sewer_spawn,
	[103296] = sewer_spawn,
	[103297] = sewer_spawn,
	[103298] = sewer_spawn,
	[103788] = sewer_spawn,
	[103789] = sewer_spawn,
	[103790] = sewer_spawn,
	[103791] = sewer_spawn,
	[103792] = sewer_spawn,
	[103793] = sewer_spawn,
	[104629] = sewer_spawn,
	[104631] = sewer_spawn,
	[104649] = sewer_spawn,
	[104686] = sewer_spawn,
	[104687] = sewer_spawn,
	[104689] = sewer_spawn
	
}