local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 1560	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1530	
	else
		ponr_value = 1500	
	end
local biker_table = {
	guard_biker = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1",
	female_1 = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1",
	female_2 = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2",
	female_3 = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
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
	[101016] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[103048] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false,
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	-- Remove red lights from keycard readers because vault can be opened in loud now
	[103709] = {
		values = {
			enabled = false
		}
	},
	--female/guard bikers
	[100670] = {
		values = {
            enemy = biker_table.female_3
		}
	},
	[100673] = {
		values = {
            enemy = biker_table.female_2
		}
	},
	[100116] = {
		values = {
            enemy = biker_table.guard_biker
		}
	},
	[101571] = {
		values = {
            enemy = biker_table.female_3
		}
	},
	[101556] = {
		values = {
            enemy = biker_table.female_1
		}
	},
	[101037] = {
		values = {
            enemy = biker_table.guard_biker
		}
	},
	[101034] = {
		values = {
            enemy = biker_table.female_2
		}
	},
	[101222] = {
		values = {
            enemy = biker_table.female_3
		}
	},
	[101235] = {
		values = {
            enemy = biker_table.female_2
		}
	},
	[101310] = {
		values = {
            enemy = biker_table.guard_biker
		}
	},
	[101683] = {
		values = {
            enemy = biker_table.female_1
		}
	},
	[101866] = {
		values = {
            enemy = biker_table.guard_biker
		}
	}
}