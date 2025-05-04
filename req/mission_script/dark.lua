local murky_bravos_table = {
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
"units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3",
}
local bravo_guards = {
	values = {
        enemy = murky_bravos_table
	}
}
return {
	--Increase PONR timers
	[102120] = {
		values = {
			time_normal = 60,
			time_hard = 60,
			time_overkill = 60,
			time_overkill_145 = 60,
			time_easy_wish = 60,
			time_overkill_290 = 60,
			time_sm_wish = 60,
		}
	},
	--Murky Elite Guards
	--https://www.youtube.com/watch?v=cNuluqg3GfQ
	[101189] = bravo_guards,
	[102077] = bravo_guards,
	[102078] = bravo_guards,
	[102079] = bravo_guards,
	[102101] = bravo_guards,
	[102102] = bravo_guards,
	[102103] = bravo_guards,
	[102121] = bravo_guards,
	[102526] = bravo_guards,
	[103837] = bravo_guards,
	[103845] = bravo_guards,
	[103849] = bravo_guards,
	[103850] = bravo_guards,
	[103817] = bravo_guards,
	[103818] = bravo_guards,
	[103865] = bravo_guards,
	[103872] = bravo_guards,
	[103880] = bravo_guards,
	[103888] = bravo_guards,
	[103772] = bravo_guards,
	[103889] = bravo_guards,
	[105610] = bravo_guards,
	[105631] = bravo_guards,
	[102174] = bravo_guards,
	[102369] = bravo_guards,
	[103618] = bravo_guards,
	[103619] = bravo_guards,
	[100123] = bravo_guards,
	[100124] = bravo_guards,
	[101525] = bravo_guards,
	[101528] = bravo_guards
}