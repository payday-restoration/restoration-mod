function CopSound:init(unit)
	local table_contains = table.contains
	local ids_func = Idstring
	local american_cop_filtered_list = {
		--US Blue SWATs
		ids_func("units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"),
		ids_func("units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc_husk"),
		ids_func("units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"),
		ids_func("units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc_husk"),
		ids_func("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"),
		ids_func("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc_husk"),
		ids_func("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
		ids_func("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc_husk"),
		ids_func("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
		ids_func("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc_husk"),
		--US FBI SWAT
		ids_func("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"),
		ids_func("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc_husk"),
		ids_func("units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"),
		ids_func("units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc_husk"),
		ids_func("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
		ids_func("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3_husk"),
		ids_func("units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"),
		ids_func("units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc_husk"),	
		ids_func("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
		ids_func("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc_husk"),	
		ids_func("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
		ids_func("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc_husk"),	
		--US GenSec
		ids_func("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
		ids_func("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc_husk"),	
		ids_func("units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"),
		ids_func("units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc_husk"),		
		ids_func("units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"),
		ids_func("units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc_husk"),
		ids_func("units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"),
		ids_func("units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc_husk"),	
		ids_func("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
		ids_func("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc_husk"),	
		ids_func("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
		ids_func("units/payday2/characters/ene_shield_gensec/ene_shield_gensec_husk"),
		--US Zeals
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1_husk"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2_husk"),	
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3_husk"),	
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),		
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk"),		
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc_husk"),		
		--NYPD Blue SWATs
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1_husk"),		
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"),
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2_husk"),				
		--LAPD Blue SWATs
		ids_func("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
		ids_func("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1_husk"),		
		ids_func("units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"),
		ids_func("units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2_husk"),			
		--Constantine GenSec SWATs
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield"),
		ids_func("units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield"),
		ids_func("units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_marshal_gensec/ene_marshal_gensec"),
		ids_func("units/pd2_mod_ttr/characters/ene_marshal_gensec/ene_marshal_gensec_husk")			
	}
	local american_cop_list = {
		--City Guards
		ids_func("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"),
		ids_func("units/payday2/characters/ene_city_guard_1/ene_city_guard_1_husk"),
		ids_func("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"),
		ids_func("units/payday2/characters/ene_city_guard_2/ene_city_guard_2_husk"),
		ids_func("units/payday2/characters/ene_city_guard_3/ene_city_guard_3"),
		ids_func("units/payday2/characters/ene_city_guard_3/ene_city_guard_3_husk"),
		--Murky SWAT
		ids_func("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1_husk"),		
		ids_func("units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2_husk"),	
		ids_func("units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk"),
		--Murky FBI SWATs
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"),		
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"),
		--Murky City/Zeals
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield_husk"),
		--Murky NYPD Guards
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"),
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1_husk"),
		--OMNIA Crewmen
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_crewman/ene_omnia_crewman"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_crewman/ene_omnia_crewman_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_crewman_2/ene_omnia_crewman_2"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_crewman_2/ene_omnia_crewman_2_husk"),
		--Chads have no voice filters
		ids_func("units/payday2/characters/ene_swat_3/ene_swat_3"),
		ids_func("units/payday2/characters/ene_swat_3/ene_swat_3_husk"),	
		ids_func("units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3"),
		ids_func("units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3_husk"),
		--LAPD FBI SWAT, no voice filter
		ids_func("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		ids_func("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"),	
		ids_func("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		ids_func("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"),	
		ids_func("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
		ids_func("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1_husk"),		
		ids_func("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
		ids_func("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2_husk")		
	}
	local american_taser_list = {
		ids_func("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
		ids_func("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc_husk"),	
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer_husk")
	}
	local american_dozer_list = {
		ids_func("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
		ids_func("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc_husk"),	
		ids_func("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
		ids_func("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc_husk"),
		ids_func("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
		ids_func("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc_husk"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc_husk"),		
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc_husk"),	
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
		ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc_husk"),	
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli_husk")
	}
	--Scary gruff filtered lines, reserve for mercs and what not
	local l5d_list = {
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"),
		ids_func("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),	
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
		ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1_husk"),	
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
		ids_func("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow_husk"),	
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
		ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city_husk"),
		ids_func("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"),
		ids_func("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk"),	
		ids_func("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"),
		ids_func("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk"),		
		ids_func("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"),
		ids_func("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk"),
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"),
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security_husk"),	
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"),
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1_husk"),
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"),
		ids_func("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2_husk"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870_husk"),	
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
		ids_func("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy_husk"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"),
		ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870_husk")
	}		
	local female_enemy_list = {
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"),
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1_husk"),	
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"),
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2_husk"),	
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"),
		ids_func("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3_husk")		
	}	
	local russian_taser_list = {
		ids_func("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser"),
		ids_func("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser_husk")		
	}
	local russian_cloaker_list = {
		ids_func("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1"),
		ids_func("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1_husk")		
	}	
	local russian_merc_list = {
		ids_func("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
		ids_func("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1_husk"),	
		--Custom stuff below
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5_husk"),		
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4_husk"),		
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45_husk"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2_husk"),	
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city_husk"),		
		ids_func("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
		ids_func("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper_husk")		
	}	
	local russian_mobster_list = {
		ids_func("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"),
		ids_func("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1_husk"),
		ids_func("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"),
		ids_func("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2_husk"),
		ids_func("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"),
		ids_func("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3_husk"),	
		ids_func("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"),
		ids_func("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4_husk"),	
		ids_func("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"),
		ids_func("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5_husk"),
		ids_func("units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer"),
		ids_func("units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer_husk"),
		--Custom stuff below
		ids_func("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"),
		ids_func("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1_husk"),
		ids_func("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"),
		ids_func("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_5/ene_gang_mobster_5"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_5/ene_gang_mobster_5_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_6/ene_gang_mobster_6"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_6/ene_gang_mobster_6_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager_husk"),			
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_7_pager/ene_gang_mobster_7_pager"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_7_pager/ene_gang_mobster_7_pager_pager_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_armored/ene_gang_mobster_armored"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_armored/ene_gang_mobster_armored_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_armored_2/ene_gang_mobster_armored_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_armored_2/ene_gang_mobster_armored_2_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_clubowner/ene_gang_mobster_clubowner"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_clubowner/ene_gang_mobster_clubowner_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_1/ene_gang_mobster_vip_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_1/ene_gang_mobster_vip_1_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_2/ene_gang_mobster_vip_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_2/ene_gang_mobster_vip_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_clubsecurity/ene_gang_mobster_clubsecurity"),
		ids_func("units/pd2_mod_ttr/characters/ene_gang_mobster_clubsecurity/ene_gang_mobster_clubsecurity_husk")	
	}	
	local cobras_list = {
		ids_func("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
		ids_func("units/payday2/characters/ene_gang_black_1/ene_gang_black_1_husk"),
		ids_func("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
		ids_func("units/payday2/characters/ene_gang_black_2/ene_gang_black_2_husk"),	
		ids_func("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
		ids_func("units/payday2/characters/ene_gang_black_3/ene_gang_black_3_husk"),			
		ids_func("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
		ids_func("units/payday2/characters/ene_gang_black_4/ene_gang_black_4_husk"),
		ids_func("units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer"),
		ids_func("units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer_husk")	
	}	

	local bexico_cop_list = {
		--Cartel faction below
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4_husk"),	
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city_husk")
	}			
	
	local bexico_taser_list = {
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal_husk")		
	}
	
	local bexico_cloaker_list = {
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout_husk")		
	}	
	
	local bexico_dozer_list = {
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2_husk"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier_husk"),		
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
		ids_func("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2_husk")			
	}	

	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count
	
	local american_cop_filtered = table_contains(american_cop_filtered_list, self._unit:name())
	local american_cop = table_contains(american_cop_list, self._unit:name())
	local american_taser = table_contains(american_taser_list, self._unit:name())
	local american_dozer = table_contains(american_dozer_list, self._unit:name())
	local l5d_forced = table_contains(l5d_list, self._unit:name())
	local female_enemy = table_contains(female_enemy_list, self._unit:name())
	local russian_taser = table_contains(russian_taser_list, self._unit:name())
	local russian_cloaker = table_contains(russian_cloaker_list, self._unit:name())
	local russian_merc = table_contains(russian_merc_list, self._unit:name())
	local russian_mobster = table_contains(russian_mobster_list, self._unit:name())
	local cobra_gangster = table_contains(cobras_list, self._unit:name())
	local bexico_cop = table_contains(bexico_cop_list, self._unit:name())
	local bexico_taser = table_contains(bexico_taser_list, self._unit:name())
	local bexico_cloaker = table_contains(bexico_cloaker_list, self._unit:name())
	local bexico_dozer = table_contains(bexico_dozer_list, self._unit:name())
			
	if american_cop_filtered then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"
	elseif american_cop then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	elseif american_taser then
		self._prefix = ("tsr") .. "_"
	elseif american_dozer then
		self._prefix = ("bdz") .. "_"
	elseif l5d_forced then
		self._prefix = ("l5d") .. "_"
	elseif female_enemy then
		self._prefix = ("fl1n") .. "_"
	elseif russian_taser then
		self._prefix = ("rtsr") .. "_"	
	elseif russian_cloaker then
		self._prefix = ("rclk") .. "_"	
	elseif russian_merc then
		self._prefix = ("r") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"	
	elseif russian_mobster then
		self._prefix = ("rt") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. "_"	
	elseif cobra_gangster then
		self._prefix = ("ict") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. "_"		
	elseif bexico_cop then
		self._prefix = ("m") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"		
	elseif bexico_taser then
		self._prefix = ("mtsr") .. "_"		
	elseif bexico_cloaker then
		self._prefix = ("mclk") .. "_"	
	elseif bexico_dozer then
		self._prefix = ("mbdz") .. "_"			
	elseif char_tweak.speech_prefix_p1 == "l5d" then
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end
					
 	if not restoration.Voicelines:say(self._unit, "spawn") then
		self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event, nil, nil)
	end
	
	--Mostly just here in the event we have a unit to have both an 'entrance' line *and* a global spawn in noise
	if self._unit:base():char_tweak().spawn_sound_event_2 then
		self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_2, nil, nil)
	end	

	--Use this only if an enemy has custom voice and is already using 2nd spawn sound
	if self._unit:base():char_tweak().spawn_sound_event_3 then
		self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_3, nil, nil)
	end	

	unit:base():post_init()
end

function CopSound:chk_voice_prefix()
	if self._prefix then
		return self._prefix
	end
end	

function CopSound:say(sound_name, sync, skip_prefix, important, callback)
	if self._last_speech then
		self._last_speech:stop()
	end

    if restoration.Voicelines:say_id(self._unit, sound_name) then
    	if sync then
			self._unit:network():send("say", SoundDevice:string_to_id(sound_name))
		end

		self._speak_expire_t = TimerManager:game():time() + 2
		return
	end
	
	local full_sound = nil
	
	if self._prefix == "l5d_" then
		if sound_name == "c01" or sound_name == "att" then
			sound_name = "g90"
		elseif sound_name == "rrl" then
			sound_name = "pus"
		elseif sound_name == "t01" then
			sound_name = "prm"
		elseif sound_name == "h01" then
			sound_name = "h10"
		end
	end
	
	local fixed_sound = nil
	
	if self._prefix == "l1n_" or self._prefix == "l2n_" or self._prefix == "l3n_" then
		if sound_name == "x02a_any_3p" then
			sound_name = "x01a_any_3p"
			fixed_sound = true
			--log("IM FUCKIN DEAD BRO")
		elseif sound_name == "x01a_any_3p" then
			sound_name = "x02a_any_3p"
			--log("OW MY BONES")
		end
	end
	
	
	--Fixes gangsters not having any pain burn lines
	if self._prefix == "ict1_" or self._prefix == "ict2_" or self._prefix == "bik1_" or self._prefix == "bik2_" or self._prefix == "lt1_" or self._prefix == "lt2_" or self._prefix == "rt1_" or self._prefix == "rt2_" then
			if sound_name == "burnhurt" then
				full_sound = "l1n_burnhurt"
			elseif sound_name == "burndeath" then
				full_sound = "l1n_burndeath"
			end
		end
	
	if self._prefix == "l4n_" then
		if sound_name == "x02a_any_3p" then
			sound_name = "x01a_any_3p"
			fixed_sound = true
			--log("l4N IS FUCKIGN DEAD WTF NOOOO")
		elseif sound_name == "x01a_any_3p" then
			sound_name = "l1n_x02a_any_3p"
			--log("l4N BONE HURTY JUICE")
		end
	end
	
	if self._prefix == "l1d_" or self._prefix == "l2d_" or self._prefix == "l3d_" or self._prefix == "l4d_" or self._prefix == "l5d_" then
		if sound_name == "a05" or sound_name == "a06" then
			sound_name = "clr"
			--log("CLEAR!!!")
		end
	end
	
	local faction = tweak_data.levels:get_ai_group_type()
	
	if self._unit:base():has_tag("special") and not sound_name == "g90" and not sound_name == "c01" then --just making sure
	
		if sound_name == "x02a_any_3p" then
			if self._unit:base():has_tag("spooc") then
				if faction == "russia" then
					full_sound = "rclk_x02a_any_3p"
				else
					full_sound = "clk_x02a_any_3p"
				end
			end
			
			if self._unit:base():has_tag("taser") then
				if faction == "russia" then
					full_sound = "rtsr_x02a_any_3p"
				else
					full_sound = "tsr_x02a_any_3p"
				end
			end
			
			if self._unit:base():has_tag("tank") then
				full_sound = "bdz_x02a_any_3p"
			end
			
			if self._unit:base():has_tag("medic") then
				full_sound = "mdc_x02a_any_3p"
			end
		end
			
		if self._unit:base():has_tag("tank") then
		       if sound_name == "burndeath" then				
			    full_sound = "l1d_burndeath"
			end	
		end
		
		if self._unit:base():has_tag("tank") then
		       if sound_name == "burnhurt" then				
			    full_sound = "l1d_burnhurt"
			end	
		end
		
		if sound_name == "x01a_any_3p" then
			if self._unit:base():has_tag("spooc") then
				if faction == "russia" then
					full_sound = "rclk_x01a_any_3p" --weird he has hurt noises but the regular cloaker doesnt
				else
					full_sound = full_sound
				end
			end
			if self._unit:base():has_tag("taser") then
				if faction == "russia" then
					full_sound = "rtsr_x01a_any_3p"
				else
					full_sound = "tsr_x01a_any_3p"
				end
			end
			if self._unit:base():has_tag("tank") then
				full_sound = "bdz_x01a_any_3p"
			end
			if self._unit:base():has_tag("medic") then
				full_sound = "mdc_x01a_any_3p"
			end
		end
	end
	
	if self._prefix == "l2d_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l1d_x02a_any_3p"
		end
	end
	
	if self._prefix == "l3d_" then
		if sound_name == "burnhurt" then
			full_sound = "l1d_burnhurt"
		end
		if sound_name == "burndeath" then
			full_sound = "l1d_burndeath"
		end
	end
	
	if self._prefix == "z1n_" or self._prefix == "z2n_" or self._prefix == "z3n_" or self._prefix == "z4n_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l2n_x01a_any_3p"
		end
		
		if sound_name == "x01a_any_3p" then
			full_sound = "l2n_x02a_any_3p"
		end
		
		if sound_name ~= "x01a_any_3p" and sound_name ~= "x02a_any_3p" then
			sound_name = "g90"
		end
	end
		
	if self._prefix == "r1n_" or self._prefix == "r2n_" or self._prefix == "r3n_" or self._prefix == "r4n_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l2n_x01a_any_3p"
		elseif sound_name == "x01a_any_3p" then
			full_sound = "l2n_x02a_any_3p"
		end
	end
	
	if not full_sound then
		if skip_prefix then
			full_sound = sound_name
		else
			full_sound = self._prefix .. sound_name
		end
	end
	
	local event_id = nil

	if type(full_sound) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		event_id = event_id or SoundDevice:string_to_id(full_sound)

		self._unit:network():send("say", event_id)
	end

	self._last_speech = self:_play(full_sound or event_id)

	if not self._last_speech then
		return
	end

	self._speak_expire_t = TimerManager:game():time() + 2
end