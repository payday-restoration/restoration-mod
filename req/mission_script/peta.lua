local pro_job = Global.game_settings and Global.game_settings.one_down
local bravos_inbound = (pro_job and true) or false
local rapple_spawn = {
	values = {
		interval = 20,
	},
}
local standard_spawn = {
	values = {
		interval = 30,
	},
}
local burning_apartment_spawn = {
	values = {
		interval = 20,
	},
}
return {
	--Highlight all remaining goats when Boris arrives
	--Call Bravos when on PJs
	[100245] = {
	spawn_bravos = bravos_inbound,
	on_executed = {
			{id = 100672, delay = 0}
		},
	},
	-- Disable one of the  misreable truck drop offs
	[101784] = {
		values = {
			enabled = false,
		},
	},
	-- No Matter what fucking overhaul this heist is utterly shit, increased intervals all around!
	[100128] = standard_spawn,
	[100130] = standard_spawn,
	[100132] = standard_spawn,
	[100133] = standard_spawn,
	[100694] = rapple_spawn,
	[100131] = rapple_spawn,
	[106015] = standard_spawn,
	[106016] = standard_spawn,
	[106017] = standard_spawn,
	[106019] = standard_spawn,
	[106021] = standard_spawn,
	[106076] = burning_apartment_spawn,
}