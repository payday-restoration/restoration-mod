local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 650
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 600
	else
		ponr_value = 550
	end
local responder_table = {
	responder_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
	responder_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2",
	responder_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
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

return {
	--Pro Job PONR 
	[101735] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Boss spawn
	[102107] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100788] = {
		difficulty = 1
	},
	--Disable garage escape
	[100206] = {
		values = {
			enabled = false
		}
	},
	--FBI Team Responders
	--Don't let ZEAL Dozers spawn on DS
	[102346] = {
		values = {
            enemy = responder_table.responder_dozer
		}
	},
	[102347] = {
		values = {
            enemy = responder_table.responder_dozer
		}
	},
	[102348] = {
		values = {
            enemy = responder_table.responder_dozer
		}
	},
	[102349] = {
		values = {
            enemy = responder_table.responder_dozer
		}
	},
	[102288] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102289] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102290] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102291] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102318] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102319] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102320] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102321] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102322] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102323] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102324] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102325] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102326] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102327] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102328] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102329] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102330] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102331] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102332] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102333] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102334] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102335] = {
		values = {
            enemy = responder_table.responder_2
		}
	},
	[102336] = {
		values = {
            enemy = responder_table.responder_1
		}
	},
	[102337] = {
		values = {
            enemy = responder_table.responder_1
		}
	}
}