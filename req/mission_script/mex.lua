local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1650
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1620
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1590
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1560
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1530
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1500
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[101016] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[103048] = {
		groups = {
			tac_bull_rush = false,
			tac_shield_wall = false,
			tac_shield_wall_ranged = false,
			tac_shield_wall_charge = false
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