local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 2 or difficulty_index == 3 then
		specialenemy_1 = "units/payday2/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		specialenemy_2 = "units/payday2/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		specialenemy_3 = "units/payday2/ene_swat_3_sc/ene_swat_3_sc"
		shield = "units/payday2/ene_shield_2_sc/ene_shield_2_sc"
		tank = "units/payday2/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		taser = "units/payday2/ene_tazer_1_sc/ene_tazer_1_sc"
		swat_1 = "units/payday2/ene_swat_1_sc/ene_swat_1_sc"
		swat_2 = "units/payday2/ene_swat_2_sc/ene_swat_2_sc"
		swat_3 = "units/payday2/ene_swat_3_sc/ene_swat_3_sc"
		swat_4 = "units/payday2/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_5 = "units/payday2/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
	elseif difficulty_index == 4 or difficulty_index == 5 then
		specialenemy_1 = "units/payday2/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		specialenemy_2 = "units/payday2/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		specialenemy_3 = "units/payday2/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"
		shield = "units/payday2/ene_shield_1_sc/ene_shield_1_sc"
		tank = "units/payday2/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		taser = "units/payday2/ene_tazer_1_sc/ene_tazer_1_sc"
		swat_1 = "units/payday2/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"
		swat_2 = "units/payday2/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"
		swat_3 = "units/payday2/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_4 = "units/payday2/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_5 = "units/payday2/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
	elseif difficulty_index == 6 or difficulty_index == 7 then
		specialenemy_1 = "units/payday2/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
		specialenemy_2 = "units/payday2/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"
		specialenemy_3 = "units/payday2/ene_city_swat_1_sc/ene_city_swat_1_sc"
		shield = "units/payday2/ene_shield_gensec/ene_shield_gensec"
		tank = "units/payday2/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
		taser = "units/payday2/ene_tazer_1_sc/ene_tazer_1_sc"
		swat_1 = "units/payday2/ene_city_swat_1_sc/ene_city_swat_1_sc"
		swat_2 = "units/payday2/ene_city_swat_2_sc/ene_city_swat_2_sc"
		swat_3 = "units/payday2/ene_city_swat_3_sc/ene_city_swat_3_sc"
		swat_4 = "units/payday2/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"
		swat_5 = "units/payday2/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
	elseif difficulty_index == 8 then
		specialenemy_1 = "units/pd2_dlc_gitgud/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"
		specialenemy_2 = "units/pd2_dlc_gitgud/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		specialenemy_3 = "units/pd2_dlc_gitgud/ene_zeal_tazer_sc/ene_zeal_tazer_sc"
		shield = "units/pd2_dlc_gitgud/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		tank = "units/pd2_dlc_gitgud/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"
		taser = "units/pd2_dlc_gitgud/ene_zeal_tazer_sc/ene_zeal_tazer_sc"
		swat_1 = "units/pd2_dlc_gitgud/ene_zeal_city_1/ene_zeal_city_1"
		swat_2 = "units/pd2_dlc_gitgud/ene_zeal_city_2/ene_zeal_city_2"
		swat_3 = "units/pd2_dlc_gitgud/ene_zeal_city_3/ene_zeal_city_3"
		swat_4 = "units/pd2_dlc_gitgud/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_5 = "units/pd2_dlc_gitgud/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end

	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630
	elseif difficulty_index == 8 then
		ponr_value = 600		
	end
	
	if Global.game_settings and Global.game_settings.one_down then
	--OMNIA+Captain Winters Encounter on DSPJ
	if difficulty_index == 8 then
		specialenemy_1 = "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1"
		specialenemy_2 = "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"
		specialenemy_3 = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
		shield = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"
		tank = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		taser = "units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"
		swat_1 = "units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"
		swat_2 = "units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"
		swat_3 = "units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"
		swat_4 = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy"
		swat_5 = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"
	end
end

return {
	--Pro Job PONR
	[103031] = {
			ponr = ponr_value
	},
	--Three Way Fight
	--1st Van (left one)
	[100776] = {
		values = {
            enemy = specialenemy_1, --Winters spawns here if it's on DSPJ, otherwise spawn ZEAL Skulldozer
			team = "mobster1"
		}
	},
	[100555] = {
		values = {
            enemy = specialenemy_3, --OMNIA Titandozer spawns here if it's on DSPJ, otherwise spawn ZEAL Taser
			team = "mobster1"
		}
	},
	[100017] = {
		values = {
            enemy = specialenemy_2, --Winters men spawns here if it's on DSPJ, otherwise spawn ZEAL Heavy Units (from 10017 to 100768)
			team = "mobster1"
		}
	},
	[100294] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100295] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100296] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100297] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100298] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100548] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100767] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	[100768] = {
		values = {
            enemy = specialenemy_2,
			team = "mobster1"
		}
	},
	--2nd Van (right one)
	[100777] = {
		values = {
            enemy = tank,
			team = "mobster1"
		}
	},
	[100556] = {
		values = {
			enemy = taser,
			team = "mobster1"
		},
		on_executed = {
			{ id = 100660, delay = 0 }
		}
	},
	[100549] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[100764] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[100329] = {
		values = {
            enemy = swat_1,
			team = "mobster1"
		}
	},
	[100330] = {
		values = {
            enemy = swat_4,
			team = "mobster1"
		}
	},
	[100333] = {
		values = {
            enemy = swat_3,
			team = "mobster1"
		}
	},
	[100334] = {
		values = {
            enemy = swat_3,
			team = "mobster1"
		}
	},
	[100339] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	[100400] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	[100550] = {
		values = {
            enemy = swat_5,
			team = "mobster1"
		}
	},
	--Far away from vans
	[101379] = {
		values = {
            enemy = tank,
			team = "mobster1"
		}
	},
	[101377] = {
		values = {
			enemy = taser,
			team = "mobster1"
		}
	},
	[101375] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[101376] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[101380] = {
		values = {
            enemy = swat_5,
			team = "mobster1"
		}
	},
	[101381] = {
		values = {
            enemy = swat_4,
			team = "mobster1"
		}
	},
	[101383] = {
		values = {
            enemy = swat_4,
			team = "mobster1"
		}
	},
	[101384] = {
		values = {
            enemy = swat_3,
			team = "mobster1"
		}
	},
	[101385] = {
		values = {
            enemy = swat_3,
			team = "mobster1"
		}
	},
	[101387] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	[101388] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	--nearby house
	[101363] = {
		values = {
            enemy = tank,
			team = "mobster1"
		}
	},
	[101360] = {
		values = {
			enemy = taser,
			team = "mobster1"
		}
	},
	[101364] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[101365] = {
		values = {
            enemy = shield,
			team = "mobster1"
		}
	},
	[101361] = {
		values = {
            enemy = swat_4,
			team = "mobster1"
		}
	},
	[101367] = {
		values = {
            enemy = swat_4,
			team = "mobster1"
		}
	},
	[101368] = {
		values = {
            enemy = swat_1,
			team = "mobster1"
		}
	},
	[101369] = {
		values = {
            enemy = swat_1,
			team = "mobster1"
		}
	},
	[101371] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	[101372] = {
		values = {
            enemy = swat_2,
			team = "mobster1"
		}
	},
	[101373] = {
		values = {
            enemy = swat_3,
			team = "mobster1"
		}
	},
	--change beat cops
	[100634] = {
		values = {
            enemy = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest"
		}
	},
	[100635] = {
		values = {
            enemy = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest"
		}
	}
}