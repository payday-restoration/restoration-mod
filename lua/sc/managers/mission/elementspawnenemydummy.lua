if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local murkywater = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870",
			["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_ump/ene_murky_heavy_ump",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_murkywater_light/ene_murkywater_light",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_murkywater_light_r870/ene_murkywater_light_r870",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",			
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_1/ene_murky_hrt_1",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
			["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
			["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",			
			["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
			["units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic",						
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3",	
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3",	
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3"
		}
	local russia = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull/ene_akan_cs_cop_raging_bull",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_mad/characters/ene_akan_cs_cop_mp5/ene_akan_cs_cop_mp5",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870",
			["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal",
			["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_dlc_mad/characters/ene_akan_tazer/ene_akan_tazer",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_mad/characters/ene_akan_spook/ene_akan_spook",			
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp",
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp",			
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga",					
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw",
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg",	
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg",	
			["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"
		}
	local nypd = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",			
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",	
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",				
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1",			
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",			
			["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
			["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
			["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",		
			["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"		
		}		
		local nypd_2 = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",			
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",	
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",				
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1",			
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",			
			["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
			["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
			["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",		
			["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",		
			["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",
			["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
			["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",
			["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
			["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",
			["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
			["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",
			["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
			["units/payday2/characters/ene_biker_1/ene_biker_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",
			["units/payday2/characters/ene_biker_2/ene_biker_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
			["units/payday2/characters/ene_biker_3/ene_biker_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",
			["units/payday2/characters/ene_biker_4/ene_biker_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"		
		}	
	local lapd = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2",			
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",			
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2",	
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2",				
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1",			
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",			
			["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
			["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
			["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",		
			["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
			["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"			
		}			

	--America Difficulty Settings
	local sm_wish = {
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",	
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",	
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",				
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer",			
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",						
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",			
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}	
	local deathwish = {
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		}
	local easy_wish = {
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1/ene_shield_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_1/ene_shield_1",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		}
	local all = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		} 		
		
	--Zombie Difficulty Settings
	local sm_wish_z = {
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",	
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",	
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",				
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",			
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}	
	local deathwish_z = {
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		}
	local easy_wish_z = {
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		}		
	local all_z = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		} 		

	--Specific replacers below		
	local fbi_sniper = {
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
		}
	local normal_sniper = {
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}		
		
	--Haunted
	local haunted_normal = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_skele_swat_haunted/ene_skele_swat_haunted"
		}		
	local haunted_black = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat_haunted/ene_skele_swat_haunted",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		}		
	local haunted_white = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat_haunted/ene_skele_swat_haunted",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
		}			
	
	function ElementSpawnEnemyDummy:init(...)
		ElementSpawnEnemyDummy.super.init(self, ...)
		local ai_type = tweak_data.levels:get_ai_group_type()
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local job = Global.level_data and Global.level_data.level_id
		
		if ai_type == "america" and job ~= "firestarter_2" then --only replace enemies if we're in america and not on firestarter 2, otherwise DHS appear in FBI office and it looks fucking stupid
			if difficulty_index == 8 then --DHS over GenSec/FBI
				if sm_wish[self._values.enemy] then
					self._values.enemy = sm_wish[self._values.enemy]
				end
				self._values.enemy = sm_wish[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 7 then --GenSec over FBI
				if deathwish[self._values.enemy] then
					self._values.enemy = deathwish[self._values.enemy]
				end
				self._values.enemy = deathwish[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then --FBI over GenSec
				if easy_wish[self._values.enemy] then
					self._values.enemy = easy_wish[self._values.enemy]
				end
				self._values.enemy = easy_wish[self._values.enemy] or self._values.enemy	
			else
				if all[self._values.enemy] then
					self._values.enemy = all[self._values.enemy]
				end
				self._values.enemy = all[self._values.enemy] or self._values.enemy					
			end
		end
		
		if ai_type == "zombie" and job ~= "haunted"  then
			if difficulty_index == 8 then --DHS over GenSec/FBI
				if sm_wish_z[self._values.enemy] then
					self._values.enemy = sm_wish_z[self._values.enemy]
				end
				self._values.enemy = sm_wish_z[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 7 then --GenSec over FBI
				if deathwish_z[self._values.enemy] then
					self._values.enemy = deathwish_z[self._values.enemy]
				end
				self._values.enemy = deathwish_z[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then --FBI over GenSec
				if easy_wish_z[self._values.enemy] then
					self._values.enemy = easy_wish_z[self._values.enemy]
				end
				self._values.enemy = easy_wish_z[self._values.enemy] or self._values.enemy	
			else
				if all_z[self._values.enemy] then
					self._values.enemy = all_z[self._values.enemy]
				end
				self._values.enemy = all_z[self._values.enemy] or self._values.enemy					
			end
		end		

		if ai_type == "murkywater" then
				if murkywater[self._values.enemy] then
					self._values.enemy = murkywater[self._values.enemy]
				end
				self._values.enemy = murkywater[self._values.enemy] or self._values.enemy
		end

		if ai_type == "russia" and not managers.mutators and managers.mutators:is_mutator_active(MutatorFactionsReplacer) then
				if russia[self._values.enemy] then
					self._values.enemy = russia[self._values.enemy]
				end
				self._values.enemy = russia[self._values.enemy] or self._values.enemy
		end
		
		if ai_type == "nypd" and job ~= "flat" then
				if nypd[self._values.enemy] then
					self._values.enemy = nypd[self._values.enemy]
				end
				self._values.enemy = nypd[self._values.enemy] or self._values.enemy
		end
		
		if ai_type == "lapd" then
				if lapd[self._values.enemy] then
					self._values.enemy = lapd[self._values.enemy]
				end
				self._values.enemy = lapd[self._values.enemy] or self._values.enemy
		end		
		if ai_type == "nypd" and job == "flat" then --overwrites gangsters without breaking brooklyn 10/10
				if nypd_2[self._values.enemy] then
					self._values.enemy = nypd_2[self._values.enemy]
				end
				self._values.enemy = nypd_2[self._values.enemy] or self._values.enemy
		end

		--always replace snipers
		if job == "firestarter_2" and difficulty_index >= 4 then  --FBI Snipers over regular, if on firestarter 2
			 if normal_sniper[self._values.enemy] then
				self._values.enemy = normal_sniper[self._values.enemy]
			 end
			 self._values.enemy = normal_sniper[self._values.enemy] or self._values.enemy
		elseif difficulty_index == 4 or difficulty_index == 5 then --FBI Snipers over regular
			 if normal_sniper[self._values.enemy] then
				self._values.enemy = normal_sniper[self._values.enemy]
			 end
			 self._values.enemy = normal_sniper[self._values.enemy] or self._values.enemy
		elseif difficulty_index == 2 or difficulty_index == 3 then --Regular Snipers over FBI
			if fbi_sniper[self._values.enemy] then
				self._values.enemy = fbi_sniper[self._values.enemy]
			 end
			 self._values.enemy = fbi_sniper[self._values.enemy] or self._values.enemy
		end
		
		if job == "haunted" then
			if difficulty_index <= 2 then
				if haunted_normal[self._values.enemy] then
					self._values.enemy = haunted_normal[self._values.enemy]
				end
				self._values.enemy = haunted_normal[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 3 or difficulty_index == 4 or difficulty_index == 5 or difficulty_index == 6 then
				if haunted_black[self._values.enemy] then
					self._values.enemy = haunted_black[self._values.enemy]
				end
				self._values.enemy = haunted_black[self._values.enemy] or self._values.enemy
			else
				if haunted_white[self._values.enemy] then
					self._values.enemy = haunted_white[self._values.enemy]
				end
				self._values.enemy = haunted_white[self._values.enemy] or self._values.enemy		
			end
		end
									
		self._enemy_name = self._values.enemy and Idstring(self._values.enemy) or Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		self._values.enemy = nil
		self._units = {}
		self._events = {}
		self:_finalize_values()
	end

end
