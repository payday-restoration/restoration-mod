local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local murky_guards_table = {
	murky_guard_1 = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
	murky_guard_2 = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"
}	

	if difficulty_index >= 7 then
		murky_guard_elite_1 = murky_guards_table.murky_guard_1
		murky_guard_elite_2 = murky_guards_table.murky_guard_2
	end
	
	if difficulty_index <= 5 then
		ponr_value = 600	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
		ponr_value = 540		
	end

return {
	--Pro Job PONR
	[104838] = {
		ponr = ponr_value
	},
	--Murkywater Elite guards replace regular security on DW above
	[101764] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[101317] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101318] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101765] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[101939] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101940] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[101941] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[101942] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101943] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101944] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[102917] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[103678] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[103679] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[103680] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[103681] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[103682] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[103691] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[100051] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[100171] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[101113] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[101238] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[102495] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[102751] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[103303] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[106011] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[106015] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[106019] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[106020] = {
		values = {
			enemy = murky_guard_elite_2
		}
	},
	[106138] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	[106141] = {
		values = {
			enemy = murky_guard_elite_1
		}
	},
	--Have one camera guard spawn up to Overkill
	[103758] = {
		values = {
            difficulty_hard = "true",
			difficulty_overkill = "true",
			difficulty_overkill_145 = "true"
		}
	},
	[103765] = {
		values = {
            difficulty_hard = "false",
			difficulty_overkill = "false",
			difficulty_overkill_145 = "false"
		}
	}
}