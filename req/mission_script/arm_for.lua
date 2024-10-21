local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) 1050) or 1020

--set up the murky bravo guards via table so it will look clean and cool
local guard_replacement = {
	elite_guard_1 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	elite_guard_2 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	elite_guard_3 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
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
local bravo_1 = {
	values = {
        enemy = guard_replacement.elite_guard_1
	}
}
local bravo_2 = {
	values = {
        enemy = guard_replacement.elite_guard_2
	}
}
local bravo_3 = {
	values = {
        enemy = guard_replacement.elite_guard_3
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
	[100670] = bravo_1,
	[100671] = bravo_1,
	[100672] = bravo_2,
	[100673] = bravo_1,
	[100674] = bravo_1,
	[100675] = bravo_3,
	[100676] = bravo_2,
	[100677] = bravo_1,
	[100678] = bravo_1,
	[100679] = bravo_2,
	[102127] = bravo_3,
	[103124] = bravo_1,
	[103033] = bravo_3,
	[105209] = bravo_3,
	[105241] = bravo_1
}