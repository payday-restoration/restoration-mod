local disabled = {
	values = {
		enabled = false,
	},
}
local enabled = {
	values = {
		enabled = true,
	},
}
local los_blockers = {}
local los_blocker_ids = Idstring("units/payday2/architecture/mkp/mkp_int_floor_4x4m_a")
local los_blocker_rot = Rotation(0, -90, 0)
for i = 0, 3 do
	table.insert(los_blockers, {
		name = los_blocker_ids,
		pos = Vector3(-10100 + (i * 400), 4300, 1250),
		rot = los_blocker_rot
	})
end
return {
	-- Delay police response
	[100022] = {
		on_executed = {
			{ id = 100109, delay = 40 },
		},
	},
	-- Reenforce points
	[103167] = disabled,
	[103168] = disabled,
	[103169] = disabled,
	[103170] = disabled,
	[103172] = disabled,
	[100109] = {
		reinforce = {
			{
				name = "elevator",
				force = 2,
				position = Vector3(-9300, 9800, 0),
			},
			{
				name = "corridor_right",
				force = 2,
				position = Vector3(-7500, 6800, 20),
			},
			{
				name = "corridor_left",
				force = 2,
				position = Vector3(-11100, 6800, 20),
			},
			{
				name = "casino",
				force = 3,
				position = Vector3(-9300, 2500, 100),
			},
			{
				name = "courtyard",
				force = 3,
				position = Vector3(-9300, 8500, 0),
			},
		},
	},
	-- Escape reenforce/harasser stuff
	[100918] = {
		on_executed = {
			{ id = 100890, remove = true },
		},
	},
	[101449] = { -- Escape signalled
		on_executed = {
			{ id = 100890, delay = 0, },
		},
		reinforce = {
			{ name = "elevator" },
			{ name = "corridor_right" },
			{ name = "corridor_left" },
			{ name = "casino" },
			{ name = "courtyard" },
			{
				name = "helipad",
				force = 4,
				position = Vector3(-9300, 17000, 100),
			},
			{
				name = "spa_outside1",
				force = 2,
				position = Vector3(-7500, 15500, 0),
			},
			{
				name = "spa_outside2",
				force = 2,
				position = Vector3(-11000, 15500, 0),
			},
		},
	},
	-- Enable unused snipers
	[100371] = enabled,
	[100372] = enabled,
	-- Pro Job PONR, loud boat escape (vault stolen Panic Room style)
	-- Wall blown, start Panic Room style PONR and disable it's PAYDAY style PONR
	[102615] = {
		on_executed = {
			{ id = 400001, delay = 0, },
			{ id = 400005, delay = 0, },
		},
	},
	-- Pro Job PONR, loud helicopter escape (it's PAYDAY)
	-- Vault opened, try to start PONR if alarm already went off, and enable activation if not
	-- Also disable Panic Room style PONR
	[101165] = {
		on_executed = {
			{ id = 400003, delay = 0, },
			{ id = 400004, delay = 0, },
			{ id = 400006, delay = 0, },
		},
	},
	-- Alarm went off, try to start PONR if vault's already open, and enable activation if not
	[100824] = {
		on_executed = {
			{ id = 400003, delay = 0, },
			{ id = 400004, delay = 0, },
		},
	},
	[101469] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false,
		},
	},
	[101470] = {
		groups = {
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false,
		},
	},
	values = {
			elements = {
				102515,
				102516,
				102517,
				102518,
				102519
			}
		}
		-- Add LoS blockers
	[143003] = {
		spawn = los_blockers
	},
}
