local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 480 or (difficulty == 6 or difficulty == 7) and 450) or 420
local cloaker_spawn = {
	values = {
		interval = 90,
		preferred_spawn_groups = {"single_spooc"},
	},
}
local entrance_spawns = {
	values = {
		interval = 15, 
	},
}
local roof_spawns = {
	values = {
		interval = 19,
	},
}
return {
	-- Pro Job PONR 
	[101196] = {
		ponr = ponr_value
	},
	-- End PONR once everyone is inside the escape zone
	[100027] = {
        ponr_end = true
    },
	[100129] = {
		on_executed = {
		{ id = 103742, remove = true }, -- remove vanilla cloaker hiding spots
		},
	},
	-- the cloaker hiding thing
	[100824] = {
		values = {
			trigger_times = 1,
		},
		on_executed = {
			{ id = 400021, delay = 0}, 
		},
	},
	-- cloaker spawns 
	[400014] = cloaker_spawn,
	[400015] = cloaker_spawn,
	[400016] = cloaker_spawn,
	[400017] = cloaker_spawn,
	[400018] = cloaker_spawn,
	-- interval spawns 
	[100131] = entrance_spawns,
	[100130] = entrance_spawns,
	[100019] = roof_spawns,
	[100007] = roof_spawns,
	[101470] = roof_spawns,
}