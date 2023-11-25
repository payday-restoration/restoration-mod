local r = tweak_data.levels.ai_groups.russia
local m = tweak_data.levels.ai_groups.murkywater
local b = tweak_data.levels.ai_groups.federales
local z = tweak_data.levels.ai_groups.zombie
local ny = tweak_data.levels.ai_groups.nypd
local ai_type = tweak_data.levels:get_ai_group_type()
local job = Global.level_data and Global.level_data.level_id

--this table is for humans. edit this one
--first item is the unit to be replaced, second is the replacement unit that should spawn instead. 
--also, no need to include Idstring here anymore
if ai_type == b then
	replacement_table = {
		--Bulldozers
		["units/pd2_dlc_bex/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
		
		--Beat Cops
		["units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"] = "units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2",
		["units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--Federales FBI Rifle
		["units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	
    	--Federales FBI Shotgun
		["units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--Federales FBI UMP
		["units/pd2_dlc_bex/characters/ene_swat_3/ene_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Federales FBI Heavy Rifle
		["units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--Federales FBI Heavy Shotgun
		["units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Federales FBI Shield
		["units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		
		--Mex Bravo Rifle
		["units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",	

		["units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		
		--Mex Bravo Shotgun
		["units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		["units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		["units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		
		--Mex Bravo LMG
		["units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_mex/ene_bravo_lmg_mex",
		
		--Mex Bravo DMR
		["units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex"
	}
elseif ai_type == r then
	replacement_table = {
		--Bulldozers 
		["units/pd2_mod_reapers/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini",
		
		--Beat Cops
		["units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1",
		["units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",
	
		--Reaper FBI Rifle
		["units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		
		--Reaper FBI Shotgun
		["units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--Reaper FBI UMP
		["units/pd2_mod_reapers/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Reaper FBI Heavy Rifle
		["units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--Reaper FBI Heavy Shotgun
		["units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Reaper FBI Shield
		["units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		
		--Reaper Bravo Rifle
		["units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		["units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		["units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		
		["units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		["units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		["units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",	
		
		--Reaper Bravo Shotgun
		["units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
		["units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
		["units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
		
		--Reaper Bravo LMG
		["units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_ru/ene_bravo_lmg_ru",
	
    	--Reaper Bravo DMR
		["units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru"
	}
elseif ai_type == m then
	replacement_table = {	
		--Bulldozers
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870_hard/ene_murky_fbi_tank_r870_hard"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"] = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"] = "units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3",
		
		--Beat Cops
		["units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"] = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"] = "units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2",
		["units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		
		--Murky HRT
		["units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1",
		["units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2",
		["units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_3/ene_omnia_hrt_3",
		
		--Murky FBI Rifle
		["units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		
		--Murky FBI Shotgun
		["units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--Murky FBI UMP
		["units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Murky FBI Heavy Rifle
		["units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--Murky FBI Heavy Shotgun
		["units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Murky FBI Shield
		["units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		
		--Murky Bravo Rifle
		["units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
		["units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
		
		["units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",	
		["units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",		
	
	    --Murky Bravo Shotgun
		["units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
		["units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",		
		["units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
		["units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
		["units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
		
		--Murky Bravo LMG
		["units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky",
		
		--Murky Bravo AA12
		["units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		
		--Murky Bravo DMR
		["units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky",
		
		--Murky Bravo Shields
		["units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",	
		["units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
		["units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
		
		--Murky Bravo Taser
		["units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"] = "units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser",
		
		--Murky Bravo Grenadier
		["units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1",
		
		--Murky Bravo Cloaker
		["units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"] = "units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook",
		
		--Murky Bravo Medic
		["units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"] = "units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"
	}
elseif ai_type == z then
	replacement_table = {
		--Bulldozers 
		["units/pd2_mod_halloween/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		["units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		--Beat Cops
		["units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"] = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1",
		["units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
		
		--Zombie FBI Rifle
		["units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		
		--Zombie FBI Shotgun
		["units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--Zombie FBI UMP
		["units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Zombie FBI Heavy Rifle
		["units/pd2_mod_halloween/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		
		--Zombie FBI Heavy Shotgun
		["units/pd2_mod_halloween/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--Zombie FBI Shield
		["units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		
		--Normal Bravo Units as a placeholder 
		--Undead Bravo Rifle
		["units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		
		["units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",		
		
		--Undead Bravo Shotgun
		["units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		
		--Undead Bravo LMG
		["units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",	
		
		--Undead Bravo DMR
		["units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"
	}	
elseif ai_type == ny then
	replacement_table = {
		--Bulldozers
		["units/pd2_mod_nypd/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		--Beat Cops
		["units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
		["units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		["units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
		["units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--FBI Rifle
		["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		
		--FBI Shotgun
		["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--FBI UMP
		["units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--FBI Heavy Rifle
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--FBI Heavy Shotgun
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--FBI Shield
		["units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		
		--Bravo Rifle
		["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		
		["units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",		
		
		--Bravo Shotgun
		["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		
		--Bravo LMG
		["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",			
		
		--Bravo DMR
		["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
		["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
		["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"
	}	
else
	replacement_table = {
		--Bulldozers
		["units/payday2/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
		
		--Beat Cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
		
		["units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
		["units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		["units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
		["units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		["units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
		["units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
		["units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		
		--FBI Rifle
		["units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		
		--FBI Shotgun
		["units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--FBI UMP
		["units/payday2/characters/ene_swat_3/ene_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--FBI Heavy Rifle
		["units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--FBI Heavy Shotgun
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--FBI Shield
		["units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		
		--Bravo Rifle
		["units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",		
		
		--Bravo Shotgun
		["units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		
		--Bravo LMG
		["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",			
		
		--Bravo DMR
		["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
		["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
		["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"
	}	
end
--this table is for robots. don't edit this one
local unit_table = {}

for k,v in pairs(replacement_table) do 
	unit_table[tostring(Idstring(k))] = Idstring(v)
	--convert key string to Idstring and then back into string type key
	--userdata type keys make me feel icky
end
replacement_table = nil --not exactly resource intensive but not like we need it anymore

--modify this function so that we can pass the bravo table to other files
function ModifiersManager:init()
	self._modifiers = {}
	self._unit_table = unit_table or {} --define this here so ModifierBravos can pull the same table. avoids having to remake the same table twice
end

local orig_modify = ModifiersManager.modify_value
function ModifiersManager:modify_value(id, value, ...)
	local result = orig_modify(self,id,value,...)
	value = tostring(value)
	if id == "GroupAIStateBesiege:SpawningUnit" and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down and not table.contains(restoration.alternate_ponr_behavior, job) then 
--			if unit_table[value] then 
--				log("ModifiersManagers: Replacing spawn " .. tostring(value) .. " ==> " .. tostring(unit_table[tostring(value)]))
--			else
--				log("Did not find " .. value,{color = Color(1,0.6,0.6)})
--			end
		return self._unit_table[value] or result 
	elseif id == "GroupAIStateBesiege:SpawningUnit" and restoration and restoration.always_bravos then 
		return self._unit_table[value] or result 
	end
	return result
end