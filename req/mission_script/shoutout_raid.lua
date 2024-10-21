local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1260 or (difficulty == 6 or difficulty == 7) and 1230) or 1200

local murky_table = {
	elite_guard_1 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	elite_guard_2 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	elite_guard_3 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
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
local bravo_1 = {
	values = {
        enemy = murky_table.elite_guard_1
	}
}
local bravo_2 = {
	values = {
        enemy = murky_table.elite_guard_2
	}
}
local bravo_3 = {
	values = {
        enemy = murky_table.elite_guard_3
	}
}
return {
	--Pro Job PONR 
	[102313] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[106851] = bravo_1,
	[106853] = bravo_3,
	[106854] = bravo_3,
	[106857] = bravo_3,
	[106858] = bravo_1,
	[106859] = bravo_3,
	[106860] = bravo_1,
	[106861] = bravo_1,
	[106862] = bravo_2,
	[106864] = bravo_1,
	[106865] = bravo_1,
	[106868] = bravo_1,
	[106869] = bravo_3,
	[103093] = bravo_2,
	[103098] = bravo_3,
	[103101] = bravo_1,
	[103104] = bravo_1,
	[103105] = bravo_3,
	[103106] = bravo_2,
	[103107] = bravo_1,
	[103110] = bravo_3,
	[103113] = bravo_1,
	[103114] = bravo_2,
	[103119] = bravo_1,
	[103126] = bravo_3,
	[103130] = bravo_1,
	[103134] = bravo_1
}