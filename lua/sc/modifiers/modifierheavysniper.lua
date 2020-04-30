ModifierHeavySniper.default_value = "spawn_chance"
ModifierHeavySniper.heavy_units = {
	Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
	Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
	Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
	Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
	Idstring("units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1"),	
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),	
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),	
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
	Idstring("units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2"),				
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy"),
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),		
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4")		
}

ModifierHeavySniper.russia_heavy_units = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
}	

ModifierHeavySniper.zombie_heavy_units = {
	Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
	Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"),	
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),		
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),	
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc")		
}	


function ModifierHeavySniper:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_heavy = table.contains(ModifierHeavySniper.heavy_units, value)
		local is_sans_swat = table.contains(ModifierHeavySniper.zombie_heavy_units, value)
		local is_russianlad = table.contains(ModifierHeavySniper.russia_heavy_units, value)						
		if is_heavy and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
		elseif is_sans_swat and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")
		elseif is_russianlad and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
		end
	end
	return value
end