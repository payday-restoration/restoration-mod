local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1260 or (difficulty == 6 or difficulty == 7) and 1230) or 1200

local elite_security = {
		"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
		"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
		"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
		"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
		"units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
}

local ponr_timer_player_mul = {
		1,
		0.9,
		0.8,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}
local bravos = {
	values = {
        enemy = elite_security
	}
}
return {
	--Pro Job PONR 
	[102313] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[106851] = bravos,
	[106853] = bravos,
	[106854] = bravos,
	[106857] = bravos,
	[106858] = bravos,
	[106859] = bravos,
	[106860] = bravos,
	[106861] = bravos,
	[106862] = bravos,
	[106864] = bravos,
	[106865] = bravos,
	[106868] = bravos,
	[106869] = bravos,
	[103093] = bravos,
	[103098] = bravos,
	[103101] = bravos,
	[103104] = bravos,
	[103105] = bravos,
	[103106] = bravos,
	[103107] = bravos,
	[103110] = bravos,
	[103113] = bravos,
	[103114] = bravos,
	[103119] = bravos,
	[103126] = bravos,
	[103130] = bravos,
	[103134] = bravos
}