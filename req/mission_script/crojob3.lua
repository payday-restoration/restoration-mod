local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600
--Setting up the murkies for epic three way fight (Featuring Winters on DSPJ)
local specialenemy_1 = ((difficulty == 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1" or difficulty == 8 and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga") or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
local specialenemy_2 = ((difficulty == 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1" or difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy" or (difficulty == 7 or difficulty == 6 or difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") or "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"
local specialenemy_3 = ((difficulty == 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2") or "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
local shield = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi") or "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"
local tank = ((difficulty == 8 or difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga") or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
local taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"
local swat_1 = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1") or "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"
local swat_2 = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2") or "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"
local swat_3 = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3" or (difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3") or "units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
local swat_4 = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy" or (difficulty == 7 or difficulty == 6 or difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") or "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"
local swat_5 = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870" or (difficulty == 7 or difficulty == 6 or difficulty == 5 or difficulty == 4) and "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") or "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"

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
