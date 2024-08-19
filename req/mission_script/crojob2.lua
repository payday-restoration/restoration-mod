local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local murky_guards_table = {
	murky_guard_1 = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
	murky_guard_2 = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"
}	

	if difficulty >= 7 then
		murky_guard_elite_1 = murky_guards_table.murky_guard_1
		murky_guard_elite_2 = murky_guards_table.murky_guard_2
	end
	
	if difficulty <= 5 then
		ponr_value = 600	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 570	
	else
		ponr_value = 540		
	end
	
local murky_guard_1 = {
	values = {
        enemy = murky_guard_elite_1
    }
}
local murky_guard_2 = {
	values = {
        enemy = murky_guard_elite_2
    }
}	
return {
	--Pro Job PONR
	[104838] = {
		ponr = ponr_value
	},
	--Murkywater Elite guards replace regular security on DW above
	[101764] = murky_guard_2,
	[101317] = murky_guard_1,
	[101318] = murky_guard_1,
	[101765] = murky_guard_2,
	[101939] = murky_guard_1,
	[101940] = murky_guard_2,
	[101941] = murky_guard_2,
	[101942] = murky_guard_1,
	[101943] = murky_guard_1,
	[101944] = murky_guard_2,
	[102917] = murky_guard_2,
	[103678] = murky_guard_2,
	[103679] = murky_guard_1,
	[103680] = murky_guard_2,
	[103681] = murky_guard_2,
	[103682] = murky_guard_1,
	[103691] = murky_guard_1,
	[100051] = murky_guard_2,
	[100171] = murky_guard_2,
	[101113] = murky_guard_1,
	[101238] = murky_guard_1,
	[102495] = murky_guard_2,
	[102751] = murky_guard_1,
	[103303] = murky_guard_2,
	[106011] = murky_guard_1,
	[106015] = murky_guard_1,
	[106019] = murky_guard_2,
	[106020] = murky_guard_2,
	[106138] = murky_guard_1,
	[106141] = murky_guard_1
}