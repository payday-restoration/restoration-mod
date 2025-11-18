local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local gensec_dozer = (difficulty >= 6 and "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc")
local gensec_tank = {
	values = {
		enemy = gensec_dozer,
	},
}
local pro_job_ponr = {
	on_executed = {
		{ id = 400001, delay = 0, },
	},
}
local disabled = {
	values = {
		enabled = false,
	},
}
local interval_short = {
	values = {
		interval = 25,
	},
}

return {
	-- Pro Job PONR
	-- Triggers when Twitch arrives
	[101894] = pro_job_ponr,
	-- Activate spawn points sooner (to allow reinforce and recon)
	-- Vanilla delay is 30s
	[100109] = {
		on_executed = {
			{ id = 100129, delay = 15, }
		},
	},
	-- Delay initial diff increase (so reinforce and recon have some time to set up)
	-- Vanilla delay is 30s
	[100116] = {
		on_executed = {
			{ id = 100122, delay = 45, }
		},
	},
	-- New reinforce around the edges of the map
	[100129] = {
		reinforce = {
			{
				name = "edge",
				force = 4,
				position = Vector3(0, 3200, 0),
			},
			{
				name = "grit",
				force = 4,
				position = Vector3(3200, 0, 0),
			},
			{
				name = "lawyers_advised_against_finishing_this_joke",
				force = 4,
				position = Vector3(0, -3200, 0),
			},
			{
				name = "rush",
				force = 4,
				position = Vector3(-3200, 0, 0),
			},
		},
	},
	-- Increase spawn point intervals to promote more varied spawn directions
	[100128] = interval_short,
	[100130] = interval_short,
	[100131] = interval_short,
	[100132] = interval_short,
	[100133] = interval_short,
	[101843] = interval_short,
	[101844] = interval_short,
	[101845] = interval_short,
	[101846] = interval_short,
	-- Disable vanilla reinforce on the trucks
	[100267] = disabled,
	[100268] = disabled,
	[100269] = disabled,
	[100270] = disabled,
	[100271] = disabled,
	[100272] = disabled,
	[100273] = disabled,
	[100274] = disabled,
	[100275] = disabled,
	[100276] = disabled,
	[100277] = disabled,
	[100278] = disabled,
	-- Van Bulldozers
	[101747] = gensec_tank,
	[101748] = gensec_tank,
	[101759] = gensec_tank,
	[101760] = gensec_tank,
	[101761] = gensec_tank,
	[101762] = gensec_tank,
	[101763] = gensec_tank,
	[101764] = gensec_tank,
	[101765] = gensec_tank,
	[101766] = gensec_tank,
	[101767] = gensec_tank,
	[101768] = gensec_tank,
}
