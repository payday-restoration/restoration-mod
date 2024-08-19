local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false

	--Setting up the murkies for epic three way fight
	if difficulty <= 2 or difficulty == 3 then
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
	elseif difficulty == 4 or difficulty == 5 then
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
	elseif difficulty == 6 or difficulty == 7 then
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

	if difficulty <= 5 then
		ponr_value = 660	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 630
	else
		ponr_value = 600		
	end
	
if pro_job then
	hunt_projob = true
	if difficulty == 8 then
	--Captain Winters Encounter on DSPJ (probably the only scripted captain encounter in vanilla heists)
		specialenemy_1 = "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1"
		specialenemy_2 = "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"
		specialenemy_3 = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
end

local enemy_special_1 = {
	values = {
        enemy = specialenemy_1,
		team = "mobster1"
	}
}
local enemy_special_2 = {
	values = {
        enemy = specialenemy_2,
		team = "mobster1"
	}
}
local enemy_special_3 = {
	values = {
        enemy = specialenemy_3,
		team = "mobster1"
	}
}
local dozer = {
	values = {
        enemy = tank,
		team = "mobster1"
	}
}
local shield = {
	values = {
        enemy = shield,
		team = "mobster1"
	}
}
local taser = {
	values = {
        enemy = taser,
		team = "mobster1"
	}
}
local swat1 = {
	values = {
        enemy = swat_1,
		team = "mobster1"
	}
}
local swat2 = {
	values = {
        enemy = swat_2,
		team = "mobster1"
	}
}
local swat3 = {
	values = {
        enemy = swat_3,
		team = "mobster1"
	}
}
local swat4 = {
	values = {
        enemy = swat_4,
		team = "mobster1"
	}
}
local swat5 = {
	values = {
        enemy = swat_5,
		team = "mobster1"
	}
}

return {
	--Pro Job PONR
	[103031] = {
			ponr = ponr_value,
			hunt = hunt_projob
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
	--Three Way Fight feat. Murkywater, make Akan's mercs fight Murkies by changing teams
	--1st Van (left one)
	[100776] = enemy_special_1,
	[100555] = enemy_special_3,
	[100017] = enemy_special_2,
	[100294] = enemy_special_2,
	[100295] = enemy_special_2,
	[100296] = enemy_special_2,
	[100297] = enemy_special_2,
	[100298] = enemy_special_2,
	[100548] = enemy_special_2,
	[100767] = enemy_special_2,
	[100768] = enemy_special_2,
	--2nd Van (right one)
	[100777] = dozer,
	[100556] = taser,
	[100549] = shield,
	[100764] = shield,
	[100329] = swat1,
	[100330] = swat4,
	[100333] = swat3,
	[100334] = swat3,
	[100339] = swat2,
	[100400] = swat2,
	[100550] = swat5,
	--Far away from vans
	[101379] = dozer,
	[101377] = taser,
	[101375] = shield,
	[101376] = shield,
	[101380] = swat5,
	[101381] = swat4,
	[101383] = swat4,
	[101384] = swat3,
	[101385] = swat3,
	[101387] = swat2,
	[101388] = swat2,
	--nearby house
	[101363] = dozer,
	[101360] = taser,
	[101364] = shield,
	[101365] = shield,
	[101361] = swat4,
	[101367] = swat4,
	[101368] = swat1,
	[101369] = swat1,
	[101371] = swat2,
	[101372] = swat2,
	[101373] = swat3,
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