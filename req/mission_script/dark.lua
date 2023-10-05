local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 1200
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1000	
	elseif difficulty_index == 8 then
		ponr_value = 900
	end
	
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
	--Pro Job PONR when someone pickup a bomb part
	-- Van escape
	[105877] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 150
	},
	-- Boat escape
	[106036] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Murky Elite Guards
	--https://www.youtube.com/watch?v=cNuluqg3GfQ
	[101189] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[102077] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[102078] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[102079] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[102101] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[102102] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[102103] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[102121] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[102526] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103837] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[103845] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103849] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[103850] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[103817] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103818] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103865] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[103872] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103880] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[103888] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[103772] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103889] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[105610] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[105631] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[102174] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[102369] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[103618] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103619] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[100123] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100124] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[101525] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[101528] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	}
}