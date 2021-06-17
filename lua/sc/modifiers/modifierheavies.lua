ModifierHeavies.default_value = "spawn_chance"
ModifierHeavies.america = {
	Idstring("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"),
	Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
	Idstring("units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1"),	
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
}
ModifierHeavies.russia = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
}
ModifierHeavies.zombie = {
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1")
}	
ModifierHeavies.murky = {
	Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city")
}	
--just to make sure the original doesn't do anything
ModifierHeavies.unit_swaps = {}


function ModifierHeavies:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local is_america = table.contains(ModifierHeavies.america, value)
		local is_russia = table.contains(ModifierHeavies.russia, value)
		local is_zombie = table.contains(ModifierHeavies.zombie, value)
		local is_murky = table.contains(ModifierHeavies.murky, value)
		--zeal ump on ds
		if is_america and difficulty == "sm_wish" and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
		elseif is_america and math.random(0,100) < 15 then
			return Idstring("units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc")
		elseif is_russia and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")
		elseif is_zombie and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3")	
		elseif is_murky and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3")				
		end
	end
	return value
end