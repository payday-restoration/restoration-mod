local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 480 or (difficulty == 6 or difficulty == 7) and 450) or 420
local cloaker_spawn = {
	values = {
		interval = 90,
		preferred_spawn_groups = {"single_spooc"},
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
	[100824] = {
		on_executed = {
			{ id = 400025, delay = 0}, 
		},
	},
	-- cloaker spawns 
	[400016] = cloaker_spawn,
	[400017] = cloaker_spawn,
	[400018] = cloaker_spawn,
	[400019] = cloaker_spawn,
	[400020] = cloaker_spawn,
	[400021] = cloaker_spawn,
	[400022] = cloaker_spawn,
}