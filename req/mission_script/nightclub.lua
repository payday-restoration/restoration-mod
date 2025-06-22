local side_spawn = {
	values = {
		interval = 15,
	},
}
local rear_spawn = {
	values = {
		interval = 25,
	},
}
local window_spawn = {
	values = {
		interval = 45,
	},
}
local alleyway_spawn = {
	values = {
		interval = 45,
	},
}
local rappel_spawn = {
	values = {
		interval = 20,
	},
}
local law_team = {
	values = {
		team = "law1",
	},
}
local pro_job_ponr = {
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}

return {
	-- Pro Job PONR
	-- Triggers once both A) any cash bag has been picked up, and B) whisper state is off (on alarm)
	[101174] = pro_job_ponr,
	[101411] = pro_job_ponr,
	-- New reenforce points
	[101169] = {
		reinforce = {
			{
				name = "dance_floor",
				force = 2,
				position = Vector3(2400, -5600, -50),
			},
			{
				name = "street",
				force = 2,
				position = Vector3(1400, -2900, 25),
			},
		},
	},
	-- Spawn point delays
	[101046] = side_spawn,
	[101213] = side_spawn,
	[100806] = rear_spawn,
	[101345] = rear_spawn,
	[103174] = window_spawn,
	[104731] = window_spawn,
	[101221] = alleyway_spawn,
	[103174] = rappel_spawn,
	[104731] = rappel_spawn,
	-- Dimitri's men are friendly to cops
	[101858] = law_team,
	[101865] = law_team,
	[101927] = law_team,
	[101934] = law_team,
	[102193] = law_team,
	[102200] = law_team,
	[102202] = law_team,
	[102206] = law_team,
	[102617] = law_team,
	[102619] = law_team,
	[100513] = law_team,
	[100517] = law_team,
	[100518] = law_team,
	[100520] = law_team,
	[100522] = law_team,
	[100522] = law_team,
	[100523] = law_team,
	[100528] = law_team,
	[100530] = law_team,
	[100532] = law_team,
	[100534] = law_team,
	[101252] = law_team,
	[102708] = law_team,
	[102709] = law_team,
	[103450] = law_team,
	[103451] = law_team,
	[103452] = law_team,
	[103637] = law_team,
	[103638] = law_team,
	[103639] = law_team,
	[100991] = law_team,
	[100994] = law_team,
	[101100] = law_team,
	[101231] = law_team,
	[101232] = law_team,
	[101233] = law_team,
	[102088] = law_team,
	[102099] = law_team,
}
