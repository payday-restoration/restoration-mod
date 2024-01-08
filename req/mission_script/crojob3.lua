local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down

	--Setting up the murkies for epic three way fight
	if difficulty_index <= 2 or difficulty_index == 3 then
		specialenemy_1 = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		specialenemy_2 = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"
		specialenemy_3 = "units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
		shield = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"
		tank = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
		swat_1 = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"
		swat_2 = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"
		swat_3 = "units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
		swat_4 = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"
		swat_5 = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
	elseif difficulty_index == 4 or difficulty_index == 5 then
		specialenemy_1 = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		specialenemy_2 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		specialenemy_3 = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		shield = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"
		tank = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
		swat_1 = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_4 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		swat_5 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty_index == 6 or difficulty_index == 7 then
		specialenemy_1 = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		specialenemy_2 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		specialenemy_3 = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"
		shield = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"
		tank = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
		swat_1 = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"
		swat_2 = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"
		swat_3 = "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"
		swat_4 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		swat_5 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	else
		specialenemy_1 = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"
		specialenemy_2 = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"
		specialenemy_3 = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
		shield = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"
		tank = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
		swat_1 = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"
		swat_2 = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"
		swat_3 = "units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"
		swat_4 = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"
		swat_5 = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"
	end

	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630
	else
		ponr_value = 600		
	end
	
	if shadow_fucked_me_hard then
	--Captain Winters Encounter on DSPJ (probably the only scripted captain encounter in vanilla heists)
	if difficulty_index == 8 then
		specialenemy_1 = "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1"
		specialenemy_2 = "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"
		specialenemy_3 = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
end

return {
	--Pro Job PONR
	[103031] = {
			ponr = ponr_value
	},
	--fixes one of the ai_hunt SOs not having taser access
	[100675] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "tank", "shield", "taser"})
			end
		end
	},
	--Three Way Fight feat. Murkywater, make Akan's mercs shit their pants and fight Murkies
	--1st Van (left one)
	[100776] = {
		values = {
            enemy = specialenemy_1, --Winters spawns here if it's on DSPJ, otherwise spawn Murky Skulldozer
			team = "mobster1"
		}
	},
	[100555] = {
		values = {
            enemy = specialenemy_3, --OMNIA Titandozer spawns here if it's on DSPJ, otherwise spawn Murky Taser
			team = "mobster1"
		}
	},
	[100017] = {
		values = {
            enemy = specialenemy_2, --Winters men spawns here if it's on DSPJ, otherwise spawn Murky Heavy Units (from 10017 to 100768)
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