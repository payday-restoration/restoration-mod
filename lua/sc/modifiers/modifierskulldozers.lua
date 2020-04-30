ModifierSkulldozers.default_value = "spawn_chance"
ModifierSkulldozers.greendozers = {
	Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
	Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
	Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_1/ene_bulldozer_1")
}
ModifierSkulldozers.blackdozers = {
	Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
	Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
	Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2")
}	

function ModifierSkulldozers:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_green = table.contains(ModifierSkulldozers.greendozers, value)
		local is_black = table.contains(ModifierSkulldozers.blackdozers, value)
		if is_green and math.random(0,100) < 50 then
			return Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		elseif is_black and math.random(0,100) < 50 then
			return Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic")
		end			
	end
	return value
end