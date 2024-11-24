local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
--set up the murky bravo guards via table to randomize them
local murky_bravos_table = {
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	"units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
}
local ponr_timer_player_mul = {
		1,
		0.85,
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
		0.65,
		0.65
}	
local bravo_guards = {
	values = {
        enemy = murky_bravos_table
	}
}
return {
	--Pro Job PONR 
	[105046] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	--Bravo Guards
	[100670] = bravo_guards,
	[100671] = bravo_guards,
	[100672] = bravo_guards,
	[100673] = bravo_guards,
	[100674] = bravo_guards,
	[100675] = bravo_guards,
	[100676] = bravo_guards,
	[100677] = bravo_guards,
	[100678] = bravo_guards,
	[100679] = bravo_guards,
	[102127] = bravo_guards,
	[103124] = bravo_guards,
	[103033] = bravo_guards,
	[105209] = bravo_guards,
	[105241] = bravo_guards
}