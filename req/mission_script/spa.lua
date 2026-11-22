local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300

local low_interval = {
	values = {
		interval = 20,
	},
}
local vetcop_bandaid = difficulty > 6 and {
	values = {
		enemy = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1",
	},
} or nil
return {
	-- Pro Job PONR
	[100483] = {
		ponr = ponr_value,
	},
	-- Combine some navigation areas
	[100303] = {
		ai_area = {
			{ 13, 58, 105 },
			{ 36, 35, 103, 32, 108, 33, 34 },
			{ 49, 170 },
			{ 121, 165 },
			{ 167, 61, 166, 60 },
			{ 62, 169 },
			{ 59, 168 },
			{ 110, 64, 111 },
			{ 63, 162 },
		},
	},
	-- Slow down window spawns
	[100750] = low_interval,
	[101012] = low_interval,
	[102138] = low_interval,
	[104338] = low_interval,
	-- TODO: properly fix later with auto-faction scaling for more/all Res units
	[100216] = vetcop_bandaid,
}
