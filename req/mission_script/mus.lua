local spook_spawn = {
	values = {
		interval = 90, 
		preferred_spawn_groups = { "single_spooc" },
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
	-- Cloaker in the diamond room 
	-- activate in loud 
	[100023] = {
		on_executed = {
			{ id = 400005, delay = 0,},
		},
	},
	-- spawn cloaker as the door opens 
	[101893] = {
		on_executed = {
			{ id = 400004, delay = 0,}, 
		},
	},
	-- start the Spook Hiders in first assault wave 
	[100115] = {
		on_executed = {
			{ id = 400028, delay = 0,}, 
		},
	},
	-- Spook spawns 
	[400012] = spook_spawn,
	[400013] = spook_spawn,
	[400014] = spook_spawn,
	[400015] = spook_spawn,
	[400016] = spook_spawn,
	[400017] = spook_spawn,
	[400018] = spook_spawn,
}