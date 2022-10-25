	---------------------------------------------------DC START---------------------------------------------------
	--beat cops should be loaded at all times
local america_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
	}	
local america_overkill = {
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
	}	
local america_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc", 
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
	}			
local america_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 				
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/payday2/characters/ene_sniper_3/ene_sniper_3", 
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
		
		--Security Guards get replaced with GenSec reds
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
	}		
local america_zeal = {
	   --scripted spawns for death sentence
		--fbi
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper", 
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		
		--Security Guards get replaced with FTSU Agents
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",		
	    --Secret Service replaced by ready teams
	    ["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		--for Birth Of Sky
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"
	}	
	---------------------------------------------------DC END---------------------------------------------------
	
	---------------------------------------------------FBI START---------------------------------------------------
	--beat cops should be loaded at all times
local fbi_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",

		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"
	}	
local fbi_overkill = {
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	}	
local fbi_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc", 
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	}			
local fbi_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",				
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3", 
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS (only gonna show up in enemy spawner but I'd rather that map doesn't crash)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
		
		--Security Guards get replaced with GenSec reds
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	}		
local fbi_zeal = {
	   --scripted spawns for death sentence
		--fbi
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper", 
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		
		--Security Guards get replaced with FTSU Agents
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",		
	    --Secret Service replaced by ready teams
	    ["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",					
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	}	
	---------------------------------------------------FBI END---------------------------------------------------
	
	---------------------------------------------------NYPD START---------------------------------------------------
	--beat cops should be loaded at all times
local nypd_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",

		-- segurity :DDDD
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_nypd/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1", 
		
		
		--Murky bois
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",

		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		
	}	
local nypd_overkill = {
        --scripted spawns for overkill
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",

		-- segurity :DDDD
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_nypd/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",	
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1", 

		--Murky bois
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		
	}	
local nypd_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
		
		-- segurity :DDDD
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_nypd/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",		
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		
		--Murky bois
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"

	}			
local nypd_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--same as dc except for beat cops and specials
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
		
		-- segurity :DDDD
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",

		--Security Guards get replaced with GenSec reds
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3",

		--Murky bois
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"

	}
local nypd_zeal = {
	   --scripted spawns for death sentence
		-- fbi
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
	   
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
		
		-- segurity :DDDD
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		
		--Security Guards get replaced with FTSU Agents
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",

		--Murky bois
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"

	}	
	
	--for Panic Room
	local nypd_pr_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1", 
		
		--Panic Room Gangsters
		["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		
		["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		["units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"
		
	}	
local nypd_pr_overkill = {
        --scripted spawns for overkill
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",	
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
	
		--Panic Room Gangsters
		["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		
		["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		["units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"
		

	}	
local nypd_pr_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",		
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		
		--Panic Room Gangsters
		["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		
		["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		["units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"
		

	}			
local nypd_pr_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--same as dc except for beat cops and specials
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",

		--Security Guards get replaced with GenSec reds
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3",

		--Panic Room Gangsters
		["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		
		["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		["units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"
		

	}
local nypd_pr_zeal = {
	   --scripted spawns for death sentence
		-- fbi
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
	   
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		
		--Security Guards get replaced with FTSU Agents
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",

		--Panic Room Gangsters
		["units/payday2/characters/ene_gang_black_1/ene_gang_black_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_black_2/ene_gang_black_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_black_3/ene_gang_black_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_black_4/ene_gang_black_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		
		["units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",	
		["units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"] = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
		["units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"] = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",	
		["units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"] = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
		["units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"] = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"
		

	}
	
	---------------------------------------------------NYPD END---------------------------------------------------	
	
	---------------------------------------------------LAPD START---------------------------------------------------
	--beat cops should be loaded at all times
local lapd_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		--["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_lapd/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
	}	
local lapd_overkill = {
        --scripted spawns for overkill
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		--["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_lapd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
	}	
local lapd_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		--["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_lapd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc", 
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 
	}			
local lapd_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--same as dc except for beat cops and specials

		--Security Guards get replaced with GenSec reds
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3",
		
		--hrt
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		--["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_lapd/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3", 
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc", 	
	}		
	
local lapd_zeal = {
	   --scripted spawns for death sentence
		-- hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
				
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_dw/ene_sniper_dw"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --just in case if some map uses vanilla minidozer
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --I want this benelli boy to spawn so badly
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc", 
		
		--Security Guards get replaced with FTSU Agents
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"		
	}		
	---------------------------------------------------LAPD END---------------------------------------------------
	
	---------------------------------------------------FEDERALES START---------------------------------------------------
	
local federales_very_hard = {
        --scripted spawns for very hard
		--fbi swats are for ponrs on hard and below
		--love these unit names so much!!! :))))
		
		
		--America Faction (just in case if we replace the America faction with Federales)
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	

		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1", 
		
		
		--Federales Faction
		--security
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		--swat
		--also used as zeal lights
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
		
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"] = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		
		--fbi swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	
	    --also used as city heavy
    	["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--Secret Service Replacers 					
		["units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"	
	}	

local federales_overkill = {
        --scripted spawns for overkill
		--love these unit names so much!!! :))))
		
		--America Faction (just in case if we replace the America faction with Federales)
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	

		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		
		
		--Federales Faction
		--security
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		--swat
		--also used as zeal lights
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
		
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"] = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"] = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		
		--fbi swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
	
	    --also used as city heavy
    	["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
		
		
		--Secret Service Replacers 					
		["units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"	
	}	

local federales_mayhem = {
        --scripted spawns for mayhem
		--swat are no longer loaded
		--love these unit names so much!!! :))))
		
		--America Faction (just in case if we replace the America faction with Federales)
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5", 
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	

		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		
		--Federales Faction
		--security
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"] = "units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"] = "units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
		["units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"] = "units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03",
		--swat
		--also used as zeal lights
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"] = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		
		--fbi swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
	
    	["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		
		--Secret Service Replacers 					
		["units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"	
	}	

local federales_deathwish = {
        --scripted spawns for death wish
		--fbi are no longer loaded
		--love these unit names so much!!! :))))
		
		--America Faction (just in case if we replace the America faction with Federales)
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",  
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	

		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
		
		
		--Federales Faction
		--security
		["units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
		["units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
		["units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03",
		--swat
		--also used as zeal lights
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"] = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"] = "units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec",
		["units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"] = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",	
		
		--fbi swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
	
    	["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"] = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
        --city swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
		
		--Secret Service Replacers 					
		["units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"	
	}	

local federales_zeal = {
        --scripted spawns for death sentence
		--only zeals and specials are loaded
		--love these unit names so much!!! :))))
		
		--America Faction (just in case if we replace the America faction with Federales)
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",  --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", --just in case if some map uses vanilla minidozer
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",  
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",  
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_bex/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_bex/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_dlc_bex/characters/ene_zeal_sniper/ene_zeal_sniper",

		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
        --city swat
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--ZEALS
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
		
		--Federales Faction
		--security
		["units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
		["units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
		["units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"] = "units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03",
		--swat
		--also used as zeal lights
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
		
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--specials
		["units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"] = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"] = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"] = "units/pd2_dlc_bex/characters/ene_zeal_sniper/ene_zeal_sniper",	
		
		--fbi swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2", 
	
    	["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
        --city swat
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
		
		--Secret Service Replacers 				
		["units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"	
	}	
	
	---------------------------------------------------FEDERALES END---------------------------------------------------
	
	---------------------------------------------------MURKIES START---------------------------------------------------
	
local murkywater_normal_overkill = {
        --swat tier are always loaded for scripted guard stuff and fbi tier are loaded for ponrs meaning these can be lumped into one replacer
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870", 

		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/pd2_mod_ttr/characters/ene_captain_dozer/ene_captain_dozer"] = "units/pd2_dlc_vip/characters/ene_spring/ene_spring",

		--Vanilla Murky Replacers (Just in case if there's a normal/custom heist that uses vanilla murkys in scripted spawns)
		--swat
		["units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"] = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		
		--fbi
		["units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1", 
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"]  = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--city (only 2 units for them?!!!!)
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		--specials
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga", --i guess that's a minidozer
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",	 
		["units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",	
		["units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",	
		["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",	
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
	}
	
local murkywater_mayhem = {
        --swat tier are always loaded for scripted guard stuff
		--elites introduced
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870", 

		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
		["units/pd2_mod_ttr/characters/ene_captain_dozer/ene_captain_dozer"] = "units/pd2_dlc_vip/characters/ene_spring/ene_spring",

		--Vanilla Murky Replacers (Just in case if there's a normal/custom heist that uses vanilla murkys in scripted spawns)
		--swat
		["units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--fbi
		["units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1", 
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"]  = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--city (only 2 units for them?!!!!)
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		
		--specials
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249", --i guess that's a minidozer
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",	 
		["units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",	
		["units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic",

		
		--Scripted Spawns Only
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",	
		["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",	
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
	}
local murkywater_deathwish = {
        --bye bye fbi lights
		--elites introduced
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",		
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870", 
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
		["units/pd2_mod_ttr/characters/ene_captain_dozer/ene_captain_dozer"] = "units/pd2_dlc_vip/characters/ene_spring/ene_spring",

		--Vanilla Murky Replacers (Just in case if there's a normal/custom heist that uses vanilla murkys in scripted spawns)
		--swat
		["units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		
		--fbi
		["units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1", 
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"]  = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--city (only 2 units for them?!!!!)
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"] = "units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"] = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		
		--specials
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249", --i guess that's a minidozer
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",	 
		["units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
		["units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",	
		["units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic",

		--Elite Murky Guards
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
	}
local murkywater_hecu = {
        --bye bye fbi lights
		--elites introduced
		--their asses are heavy
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli", --I want this benelli boy to spawn so badly
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",		
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870", 
		
		--Custom Heist Stuff
		["units/pd2_mod_ttr/characters/ene_agent_soldier_1/ene_agent_soldier_1"] = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_2/ene_agent_soldier_2"] = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun",
		["units/pd2_mod_ttr/characters/ene_agent_soldier_3/ene_agent_soldier_3"] = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
		["units/pd2_mod_ttr/characters/ene_captain_dozer/ene_captain_dozer"] = "units/pd2_dlc_vip/characters/ene_spring/ene_spring",

		--Vanilla Murky Replacers (Just in case if there's a normal/custom heist that uses vanilla murkys in scripted spawns)
		--swat
		["units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		
		--fbi
		["units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1", 
		["units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"]  = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--city (only 2 units for them?!!!!)
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"] = "units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"] = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		
		--specials
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli", --I want this benelli boy to spawn so badly, really
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",	 
		["units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"] = "units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"] = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",	
		["units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic",

		--OMNIA Guards
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
	}
	
	---------------------------------------------------MURKIES END---------------------------------------------------
	
	---------------------------------------------------REAPERS START---------------------------------------------------
	

local russia_very_hard = {
--Scripted spawns for very hard and below 
--fbi swat are for ponrs on hard and below
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3", 
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 									
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Vanilla Reapers 
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--FSB Replacers 
		["units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		
		["units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--ZEALS (Will only spawn on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_overkill = {
--Scripted spawns for overkill 
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2", 							
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Vanilla Reapers 
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--FSB Replacers
		["units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		
		["units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"] = "units/pd2_dlc_mad/characters/units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}	
local russia_mayhem = {
		--scripted spawns for mayhem
		--swats are no longer needed here
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",							
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--Vanilla Reapers 
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--FSB Replacers
		["units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		
		["units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_deathwish = {
		--scripted spawns for death wish
		--fbi swat be gone
		--elites are introduced
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
	
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3", 			
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--Vanilla Reapers 
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
		
		--FSB Replacers
		["units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		
		["units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
		
		
		["units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_zeal = {
		--go home now fbi elites
		--zeal tier is now introduced
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		--hrt  
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini", --I want this benelli boy to spawn so badly 
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3", 	
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_heavy_swat_r870/ene_zeal_heavy_swat_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_heavy_swat_r870/ene_zeal_heavy_swat_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--Vanilla Reapers  
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"] = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"] = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"] = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
				
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"] = "units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini", --I want this benelli boy to spawn so badly
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",
		
		--FSB Replacers
		["units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		
		["units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
	
local russia_bombf_very_hard = {
--Scripted spawns for very hard and below 
--fbi swat are for ponrs on hard and below
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3", 
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 									
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS (Will only spawn on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_bombf_overkill = {
--Scripted spawns for overkill 
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2", 							
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}	
local russia_bombf_mayhem = {
		--scripted spawns for mayhem
		--swats are no longer needed here
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",							
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_bombf_deathwish = {
		--scripted spawns for death wish
		--fbi swat be gone
		--elites are introduced
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
	
		--hrt
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3", 			
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",

		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
local russia_bombf_zeal = {
		--go home now fbi elites
		--zeal tier is now introduced
		--security
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_reapers/characters/ene_security_4/ene_security_4",
		
		["units/payday2/characters/ene_security_winter_1/ene_security_winter_1"] = "units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
		["units/payday2/characters/ene_security_winter_2/ene_security_winter_2"] = "units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
		
		--cops
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest",
		
		--hrt  
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_3/ene_akan_fbi_3",
	
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini", --I want this benelli boy to spawn so badly 
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3", 	
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"] = "units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_heavy_swat_r870/ene_zeal_heavy_swat_r870",
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_heavy_swat_r870/ene_zeal_heavy_swat_r870",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
		
		--ZEALS (Will spawn only on Enemy Spawner maps but i don't want these to crash) :)
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"

	}
	
	---------------------------------------------------REAPERS END---------------------------------------------------
	
	---------------------------------------------------ZOMBIE START---------------------------------------------------
	
local zombie_very_hard = {
        --scripted spawns for very hard
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
	}	
local zombie_overkill = {
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",

		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2", 
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
	}	
local zombie_mayhem = {
        --scripted spawns for mayhem
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",

		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
	}			
local zombie_deathwish = {
        --scripted spawns for death wish
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",

		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",				
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
				
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
	}		
local zombie_zeal = {
	   --scripted spawns for death sentence
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials 
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer", 
		["units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer", 
	}	
	
--For Lab Rats	
local zombie_nail_very_hard = {
        --scripted spawns for very hard
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1", 
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
	}
	
local zombie_nail_overkill = {
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",

		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
	}	
	
local zombie_nail_mayhem = {
        --scripted spawns for mayhem
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",

		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",		
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
	}	
	
local zombie_nail_deathwish = {
        --scripted spawns for death wish
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",

		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",		
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",				
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
				
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
	}
	
local zombie_nail_zeal = {
	   --scripted spawns for death sentence
		-- fbi/cops
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",					
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
		
		--swat
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--halloweener heavy swat
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--specials
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer", 
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"]  = "units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"] = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
		["units/payday2/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
		
		--fbi swat
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
        --city swat 
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3",
		["units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2", 
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		
		--ZEALS 
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer", 
		
		--Scripted Spawns Only
		["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
		["units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
	}
	
	--Safehouse Nightmare
	local haunted_normal = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
		}		
	local haunted_black = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		}		
	local haunted_white = {
			["units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"] = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat",
			["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
		}	
	
	---------------------------------------------------ZOMBIES END---------------------------------------------------		

function ElementSpawnEnemyDummy:init(...)
	ElementSpawnEnemyDummy.super.init(self, ...)
	local ai_type = tweak_data.levels:get_ai_group_type()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local job = Global.level_data and Global.level_data.level_id

	--Murkywater
	if ai_type == "murkywater" then
		--Overkill and below		
		if difficulty_index < 6 then
			if murkywater_normal_overkill[self._values.enemy] then
				self._values.enemy = murkywater_normal_overkill[self._values.enemy]
			end
			self._values.enemy = murkywater_normal_overkill[self._values.enemy] or self._values.enemy	
		--Mayhem	
		elseif difficulty_index == 6 then
			if murkywater_mayhem[self._values.enemy] then
				self._values.enemy = murkywater_mayhem[self._values.enemy]
			end
			self._values.enemy = murkywater_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if murkywater_deathwish[self._values.enemy] then
				self._values.enemy = murkywater_deathwish[self._values.enemy]
			end
			self._values.enemy = murkywater_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if murkywater_hecu[self._values.enemy] then
				self._values.enemy = murkywater_hecu[self._values.enemy]
			end
			self._values.enemy = murkywater_hecu[self._values.enemy] or self._values.enemy							
		end
	--Reapers
	elseif ai_type == "russia" then
		if job == "crojob3" or job == "crojob3_night" then
			if difficulty_index <= 4 then
				if russia_bombf_very_hard[self._values.enemy] then
					self._values.enemy = russia_bombf_very_hard[self._values.enemy]
				end
				self._values.enemy = russia_bombf_very_hard[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 5 then
				if russia_bombf_overkill[self._values.enemy] then
					self._values.enemy = russia_bombf_overkill[self._values.enemy]
				end
				self._values.enemy = russia_bombf_overkill[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then
				if russia_bombf_mayhem[self._values.enemy] then
					self._values.enemy = russia_bombf_mayhem[self._values.enemy]
				end
				self._values.enemy = russia_bombf_mayhem[self._values.enemy] or self._values.enemy	
			elseif difficulty_index == 7 then
				if russia_bombf_deathwish[self._values.enemy] then
					self._values.enemy = russia_bombf_deathwish[self._values.enemy]
				end
				self._values.enemy = russia_bombf_deathwish[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 8 then
				if russia_bombf_zeal[self._values.enemy] then
					self._values.enemy = russia_bombf_zeal[self._values.enemy]
				end
				self._values.enemy = russia_bombf_zeal[self._values.enemy] or self._values.enemy
			end	
		else
		--Very Hard and below			
		if difficulty_index <= 4 then
			if russia_very_hard[self._values.enemy] then
				self._values.enemy = russia_very_hard[self._values.enemy]
			end
			self._values.enemy = russia_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if russia_overkill[self._values.enemy] then
				self._values.enemy = russia_overkill[self._values.enemy]
			end
			self._values.enemy = russia_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if russia_mayhem[self._values.enemy] then
				self._values.enemy = russia_mayhem[self._values.enemy]
			end
			self._values.enemy = russia_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if russia_deathwish[self._values.enemy] then
				self._values.enemy = russia_deathwish[self._values.enemy]
			end
			self._values.enemy = russia_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if russia_zeal[self._values.enemy] then
				self._values.enemy = russia_zeal[self._values.enemy]
			end
			self._values.enemy = russia_zeal[self._values.enemy] or self._values.enemy							
		end		
	end	
	--Zombies
	elseif ai_type == "zombie" then
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
		elseif job == "nail" then
			if difficulty_index <= 4 then
				if zombie_nail_very_hard[self._values.enemy] then
					self._values.enemy = zombie_nail_very_hard[self._values.enemy]
				end
				self._values.enemy = zombie_nail_very_hard[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 5 then
				if zombie_nail_overkill[self._values.enemy] then
					self._values.enemy = zombie_nail_overkill[self._values.enemy]
				end
				self._values.enemy = zombie_nail_overkill[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then
				if zombie_nail_mayhem[self._values.enemy] then
					self._values.enemy = zombie_nail_mayhem[self._values.enemy]
				end
				self._values.enemy = zombie_nail_mayhem[self._values.enemy] or self._values.enemy	
			elseif difficulty_index == 7 then
				if zombie_nail_deathwish[self._values.enemy] then
					self._values.enemy = zombie_nail_deathwish[self._values.enemy]
				end
				self._values.enemy = zombie_nail_deathwish[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 8 then
				if zombie_nail_zeal[self._values.enemy] then
					self._values.enemy = zombie_nail_zeal[self._values.enemy]
				end
				self._values.enemy = zombie_nail_zeal[self._values.enemy] or self._values.enemy
			end	
		else
			--Very Hard			
			if difficulty_index <= 4 then
				if zombie_very_hard[self._values.enemy] then
					self._values.enemy = zombie_very_hard[self._values.enemy]
				end
				self._values.enemy = zombie_very_hard[self._values.enemy] or self._values.enemy	
			--Overkill
			elseif difficulty_index == 5 then
				if zombie_overkill[self._values.enemy] then
					self._values.enemy = zombie_overkill[self._values.enemy]
				end
				self._values.enemy = zombie_overkill[self._values.enemy] or self._values.enemy
			--Mayhem	
			elseif difficulty_index == 6 then
				if zombie_mayhem[self._values.enemy] then
					self._values.enemy = zombie_mayhem[self._values.enemy]
				end
				self._values.enemy = zombie_mayhem[self._values.enemy] or self._values.enemy				
			--Deathwish		
			elseif difficulty_index == 7 then
				if zombie_deathwish[self._values.enemy] then
					self._values.enemy = zombie_deathwish[self._values.enemy]
				end
				self._values.enemy = zombie_deathwish[self._values.enemy] or self._values.enemy			
			--deaf sentence XD						
			elseif difficulty_index == 8 then
				if zombie_zeal[self._values.enemy] then
					self._values.enemy = zombie_zeal[self._values.enemy]
				end
				self._values.enemy = zombie_zeal[self._values.enemy] or self._values.enemy							
			end	
		end		
	--NYPD
	elseif ai_type == "nypd" then
		if job == "flat" then
			if difficulty_index <= 4 then
				if nypd_pr_very_hard[self._values.enemy] then
					self._values.enemy = nypd_pr_very_hard[self._values.enemy]
				end
				self._values.enemy = nypd_pr_very_hard[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 5 then
				if nypd_pr_overkill[self._values.enemy] then
					self._values.enemy = nypd_pr_overkill[self._values.enemy]
				end
				self._values.enemy = nypd_pr_overkill[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then
				if nypd_pr_mayhem[self._values.enemy] then
					self._values.enemy = nypd_pr_mayhem[self._values.enemy]
				end
				self._values.enemy = nypd_pr_mayhem[self._values.enemy] or self._values.enemy	
			elseif difficulty_index == 7 then
				if nypd_pr_deathwish[self._values.enemy] then
					self._values.enemy = nypd_pr_deathwish[self._values.enemy]
				end
				self._values.enemy = nypd_pr_deathwish[self._values.enemy] or self._values.enemy		
			elseif difficulty_index == 8 then
				if nypd_pr_zeal[self._values.enemy] then
					self._values.enemy = nypd_pr_zeal[self._values.enemy]
				end
				self._values.enemy = nypd_pr_zeal[self._values.enemy] or self._values.enemy
			end	
		else		
		--Very Hard			
		if difficulty_index <= 4 then
			if nypd_very_hard[self._values.enemy] then
				self._values.enemy = nypd_very_hard[self._values.enemy]
			end
			self._values.enemy = nypd_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if nypd_overkill[self._values.enemy] then
				self._values.enemy = nypd_overkill[self._values.enemy]
			end
			self._values.enemy = nypd_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if nypd_mayhem[self._values.enemy] then
				self._values.enemy = nypd_mayhem[self._values.enemy]
			end
			self._values.enemy = nypd_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if nypd_deathwish[self._values.enemy] then
				self._values.enemy = nypd_deathwish[self._values.enemy]
			end
			self._values.enemy = nypd_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if nypd_zeal[self._values.enemy] then
				self._values.enemy = nypd_zeal[self._values.enemy]
			end
			self._values.enemy = nypd_zeal[self._values.enemy] or self._values.enemy							
		end	
	end	
	--FBI
	elseif ai_type == "fbi" then
		--Very Hard			
		if difficulty_index <= 4 then
			if fbi_very_hard[self._values.enemy] then
				self._values.enemy = fbi_very_hard[self._values.enemy]
			end
			self._values.enemy = fbi_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if fbi_overkill[self._values.enemy] then
				self._values.enemy = fbi_overkill[self._values.enemy]
			end
			self._values.enemy = fbi_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if fbi_mayhem[self._values.enemy] then
				self._values.enemy = fbi_mayhem[self._values.enemy]
			end
			self._values.enemy = fbi_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if fbi_deathwish[self._values.enemy] then
				self._values.enemy = fbi_deathwish[self._values.enemy]
			end
			self._values.enemy = fbi_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if fbi_zeal[self._values.enemy] then
				self._values.enemy = fbi_zeal[self._values.enemy]
			end
			self._values.enemy = fbi_zeal[self._values.enemy] or self._values.enemy							
		end	
	--LAPD
	elseif ai_type == "lapd" then
		--Very Hard			
		if difficulty_index <= 4 then
			if lapd_very_hard[self._values.enemy] then
				self._values.enemy = lapd_very_hard[self._values.enemy]
			end
			self._values.enemy = lapd_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if lapd_overkill[self._values.enemy] then
				self._values.enemy = lapd_overkill[self._values.enemy]
			end
			self._values.enemy = lapd_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if lapd_mayhem[self._values.enemy] then
				self._values.enemy = lapd_mayhem[self._values.enemy]
			end
			self._values.enemy = lapd_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if lapd_deathwish[self._values.enemy] then
				self._values.enemy = lapd_deathwish[self._values.enemy]
			end
			self._values.enemy = lapd_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if lapd_zeal[self._values.enemy] then
				self._values.enemy = lapd_zeal[self._values.enemy]
			end
			self._values.enemy = lapd_zeal[self._values.enemy] or self._values.enemy							
		end	
	elseif ai_type == "federales" then
		--Very Hard			
		if difficulty_index <= 4 then
			if federales_very_hard[self._values.enemy] then
				self._values.enemy = federales_very_hard[self._values.enemy]
			end
			self._values.enemy = federales_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if federales_overkill[self._values.enemy] then
				self._values.enemy = federales_overkill[self._values.enemy]
			end
			self._values.enemy = federales_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if federales_mayhem[self._values.enemy] then
				self._values.enemy = federales_mayhem[self._values.enemy]
			end
			self._values.enemy = federales_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if federales_deathwish[self._values.enemy] then
				self._values.enemy = federales_deathwish[self._values.enemy]
			end
			self._values.enemy = federales_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if federales_zeal[self._values.enemy] then
				self._values.enemy = federales_zeal[self._values.enemy]
			end
			self._values.enemy = federales_zeal[self._values.enemy] or self._values.enemy							
		end		
	--America (default)
	else
		--Very Hard			
		if difficulty_index <= 4 then
			if america_very_hard[self._values.enemy] then
				self._values.enemy = america_very_hard[self._values.enemy]
			end
			self._values.enemy = america_very_hard[self._values.enemy] or self._values.enemy	
		--Overkill
		elseif difficulty_index == 5 then
			if america_overkill[self._values.enemy] then
				self._values.enemy = america_overkill[self._values.enemy]
			end
			self._values.enemy = america_overkill[self._values.enemy] or self._values.enemy
		--Mayhem	
		elseif difficulty_index == 6 then
			if america_mayhem[self._values.enemy] then
				self._values.enemy = america_mayhem[self._values.enemy]
			end
			self._values.enemy = america_mayhem[self._values.enemy] or self._values.enemy				
		--Deathwish		
		elseif difficulty_index == 7 then
			if america_deathwish[self._values.enemy] then
				self._values.enemy = america_deathwish[self._values.enemy]
			end
			self._values.enemy = america_deathwish[self._values.enemy] or self._values.enemy			
		--deaf sentence XD						
		elseif difficulty_index == 8 then
			if america_zeal[self._values.enemy] then
				self._values.enemy = america_zeal[self._values.enemy]
			end
			self._values.enemy = america_zeal[self._values.enemy] or self._values.enemy							
		end
	end
	
	--[[
	if self._values.enemy then
		log(self._values.enemy)
	end
	--]]
	
	self._enemy_name = self._values.enemy and Idstring(self._values.enemy) or Idstring("units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc")
	self._values.enemy = nil
	self._units = {}
	self._events = {}
	self:_finalize_values()
end