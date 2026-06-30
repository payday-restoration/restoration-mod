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
local middle_spawn = {
	values = {
		interval = 35,
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
	-- Disable the scripted stuff from startup
	[100048] = {
		on_executed = {
			{ id = 400009, delay = 0, },
			{ id = 400021, delay = 0, },
			( id = 400028, delay = 0, ),
		},
	},
	-- FWB  vault styled ambush (you know, when the vault door opens and a swarm of enemies are waiting for you. yeah that one)
	-- Enabale them when the heist goes loud 
	[101756] = {
		on_executed = {
			{ id = 400010, delay = 0, },
			{ id = 400022, delay = 0, },
			( id = 400029, delay = 0, ),
		},
	},
	-- Spawn units  when the vault door opens 
	[100851] = {
		on_executed = {
			{ id = 400012, delay = 0, },
			{ id = 400023, delay = 0, },
			{ id = 400030, delay = 0, },
		},
	},
	-- Remove vanilla reinforce
	[103204] = disable,
	[103205] = disable,
	[103206] = disable,
	[103207] = disable,
	[103209] = disable,
	-- New reinforce points
	[100229] = {
		reinforce = {
			{
				name = "exterior_entrance",  -- Just outside reception, on the red carpet
				force = 4,
				position = Vector3(0, -8250, 2.701),
			},
			{
				name = "exterior_gate1",  -- Outside side entrance to the right
				force = 2,
				position = Vector3(2350, -5525, -0),
			},
			{
				name = "exterior_gate2",  -- Near exterior bar
				force = 2,
				position = Vector3(-2425, -5800, -0),
			},
			{
				name = "exterior_relax",  -- A back corner in the pool area
				force = 2,
				position = Vector3(-4075, -2775, 0),
			},
			{
				name = "exterior_balcony",  -- Overlooking VIP area entrance
				force = 2,
				position = Vector3(1925, -2575, 602.5),
			},
			{
				name = "interior_balcony1",  -- Overlooking BFD, far
				force = 2,
				position = Vector3(-1300, -550, 602.5),
			},
			{
				name = "interior_balcony2",  -- Overlooking BFD, near
				force = 2,
				position = Vector3(1075, -700, 602.5),
			},
			{
				name = "security1",  -- On one side of the security gate
				force = 2,
				position = Vector3(-1100, 1475, 100),
			},
			{
				name = "security2",  -- On the other side
				force = 2,
				position = Vector3(1100, 1400, 100),
			},
			{
				name = "bar",  -- Bar by reception area
				force = 3,
				position = Vector3(1100, 1400, 100),
			},
		},
	},
	-- inrease interval of middle spawn 
	[103218] = middle_spawn,
}
