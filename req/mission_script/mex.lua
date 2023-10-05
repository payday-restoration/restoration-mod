local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 1560	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1530	
	elseif difficulty_index == 8 then
		ponr_value = 1500	
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
	--female/guard bikers
	[100670] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
		}
	},
	[100673] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"
		}
	},
	[100116] = {
		values = {
            enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[101571] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
		}
	},
	[101556] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"
		}
	},
	[101037] = {
		values = {
            enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[101034] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"
		}
	},
	[101222] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
		}
	},
	[101235] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"
		}
	},
	[101310] = {
		values = {
            enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[101683] = {
		values = {
            enemy = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"
		}
	},
	[101866] = {
		values = {
            enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	}
}