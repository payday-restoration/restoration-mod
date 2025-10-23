local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 540) or 480
local mob_enforcer = ((pro_job and difficulty == 8) and "units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer")
local disabled = {
	values = {
        enabled = false
	},
}
local mob_enforcer_van = {
	values = {
		enemy = mob_enforcer,
	},
}
return {
	--Pro Job PONR 
	[101289] = {
		ponr = ponr_value
	},
	-- Improve reinforce spots
	[100022] = {
		reinforce = {
			{
				name = "touch_grass",
				force = 3,
				position = Vector3(2000, -900, 30)
			}
		}
	},
	[100589] = disabled,
	[100590] = disabled,
	-- Mobster Enforcers coming out from the van(s), only on DSPJ
	-- The Battle At The Motel
	[105045] = mob_enforcer_van,
	[105046] = mob_enforcer_van,
	[105047] = mob_enforcer_van,
	[105048] = mob_enforcer_van,
	[105049] = mob_enforcer_van,
	[105057] = mob_enforcer_van,
	[105058] = mob_enforcer_van,
	[105059] = mob_enforcer_van,
	[105060] = mob_enforcer_van,
	[105061] = mob_enforcer_van,
	[105062] = mob_enforcer_van,
	[105063] = mob_enforcer_van,
	[105064] = mob_enforcer_van,
	[105069] = mob_enforcer_van,
	[105070] = mob_enforcer_van,
	[105071] = mob_enforcer_van,
	[105072] = mob_enforcer_van,
	[105073] = mob_enforcer_van
}	