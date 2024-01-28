local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local swat_amount = 4
local murky_amount = 2
local murkyman_1 = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
local murkyman_2 = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
local murkyman_3 = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
local murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"

	--replace murky greendozer with bendozer on DS
	if difficulty_index == 8 then
		murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"
	end

	if difficulty_index <= 5 then
		ponr_value = 150
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 120	
	else
		ponr_value = 90	
	end
	
	--If we're in Pro Job, then do this stuff below
	if pro_job then
	--increase the amount of scripted swat van spawns and murky spawns
		swat_amount = 6
		murky_amount = 5
	--Elite Murkies start replace some regular murkies
	if difficulty_index >= 4 then
		murkyman_1 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
		murkyman_2 = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"
		murkyman_3 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
	end
		
	--Scripted swat spawns tweaks
	if difficulty_index <= 2 then
		swat_1 = "units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"
		swat_2 = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"
		swatheavy_1 = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
	elseif difficulty_index == 3 or difficulty_index == 4 then
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		swat_1 = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		swat_2 = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty_index == 5 then
		swat_1 = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
		swat_2 = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		spooc =  "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"		
	elseif difficulty_index == 6 then
		swat_1 = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_2 = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"
		spooc =  "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"		
	elseif difficulty_index == 7 then
		--some units are titan units now
		swat_1 = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		spooc =  "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"	
	else
		--Titan squad on DSPJ
		swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		spooc =  "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end	
end	
	
return {
	--Pro Job PONR 
	[104979] = {
		ponr = ponr_value
	},
	--Murky amount gets increased to 5 on PJs
	[101394] = {
		values = {
            amount = murky_amount
		}
	},
	--SWAT amount gets increased to max on PJs
	[100741] = {
		values = {
            amount = swat_amount
		}
	},
	[100744] = {
		values = {
            amount = swat_amount
		}
	},
	[101548] = {
		values = {
            amount = swat_amount
		}
	},
	[101549] = {
		values = {
            amount = swat_amount
		}
	},
	--SWAT Van Spawns (PJ)
	--Normal
	[100736] = {
		values = {
            enemy = swat_1
		}
	},
	[101550] = {
		values = {
            enemy = swat_1
		}
	},
	[101554] = {
		values = {
            enemy = swat_2
		}
	},
	[101555] = {
		values = {
            enemy = swatheavy_1
		}
	},
	[101557] = {
		values = {
            enemy = shield
		}
	},
	--Hard-Very Hard
	[101558] = {
		values = {
            enemy = taser
		}
	},
	[101573] = {
		values = {
            enemy = swat_1
		}
	},
	[101574] = {
		values = {
            enemy = swat_1
		}
	},
	[101575] = {
		values = {
            enemy = swat_2
		}
	},
	--Overkill
	[101577] = {
		values = {
            enemy = shield
		}
	},
	[101578] = {
		values = {
            enemy = spooc
		}
	},
	[101630] = {
		values = {
            enemy = taser
		}
	},
	[101634] = {
		values = {
            enemy = swat_1
		}
	},
	[101635] = {
		values = {
            enemy = swat_2
		}
	},
	--Mayhem-DS
	[101636] = {
		values = {
            enemy = dozer
		}
	},
	[101637] = {
		values = {
            enemy = taser
		}
	},
	[101641] = {
		values = {
            enemy = shield
		}
	},
	[101652] = {
		values = {
            enemy = swat_1
		}
	},
	[101663] = {
		values = {
            enemy = swat_2
		}
	},
	[101664] = {
		values = {
            enemy = spooc
		}
	},
	-- Replace bulldozers with their murky counterparts
	--1st chopper, right after the ambush
	[103095] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103097] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103087] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103096] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[102190] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[100621] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--2nd chopper, when the gang is in the slaughterhouse
	[103088] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103090] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103091] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103092] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103093] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[103094] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--gensec van
	[101241] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[101242] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[101243] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--security guards
	[101375] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
		}
	},
	[101376] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
		}
	},
	--Murky Elite Soldiers replace some regular Murky Mercs on VH-DS PJs
	[103083] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103084] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103085] = {
		values = {
            enemy = murkyman_2
		}
	},
	[103086] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101082] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101083] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101816] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101821] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101827] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101829] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101904] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101906] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101857] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101852] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101382] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101383] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101385] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101386] = {
		values = {
            enemy = murkyman_3
		}
	},
	--disables the Swat Turret, it's not really needed here, eh?
	[102484] = {
		values = {
            chance = 0
		}
	}
}