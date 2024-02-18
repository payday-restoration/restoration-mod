local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--High PONR Timer to work with ponr player scaling
	if difficulty_index <= 5 then
		ponr_value = 1260	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1230
	else
		ponr_value = 1200	
	end
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

return {
	--Pro Job PONR 
	[102313] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[106851] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106853] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[106854] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[106857] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[106858] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106859] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[106860] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106861] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106862] = {
		values = {
            enemy = murky_table.elite_guard_2
		}
	},
	[106864] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106865] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106868] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[106869] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[103093] = {
		values = {
            enemy = murky_table.elite_guard_2
		}
	},
	[103098] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[103101] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103104] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103105] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[103106] = {
		values = {
            enemy = murky_table.elite_guard_2
		}
	},
	[103107] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103110] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[103113] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103114] = {
		values = {
            enemy = murky_table.elite_guard_2
		}
	},
	[103119] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103126] = {
		values = {
            enemy = murky_table.elite_guard_3
		}
	},
	[103130] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	},
	[103134] = {
		values = {
            enemy = murky_table.elite_guard_1
		}
	}
}