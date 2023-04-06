if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 570
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 540
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 510
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 480
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 450
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 420
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[101735] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- Boss spawn
	[102107] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100788] = {
		difficulty = 1
	},
	--FBI Team Responders
	[102346] = {
		values = {
            enemy = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
		}
	},
	[102347] = {
		values = {
            enemy = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
		}
	},
	[102348] = {
		values = {
            enemy = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
		}
	},
	[102349] = {
		values = {
            enemy = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
		}
	},
	[102288] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102289] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102290] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102291] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102318] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102319] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102320] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102321] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102322] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102323] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102324] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102325] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102326] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102327] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102328] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102329] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102330] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102331] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102332] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102333] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102334] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102335] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		}
	},
	[102336] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	},
	[102337] = {
		values = {
            enemy = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		}
	}
}