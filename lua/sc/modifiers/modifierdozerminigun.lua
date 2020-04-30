ModifierDozerMinigun.default_value = "spawn_chance"
ModifierDozerMinigun.bulldozers = {
	Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
	Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
	Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
	Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
	Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),	
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
	Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3")	
}

ModifierDozerMinigun.russiadozers = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")
}	

function ModifierDozerMinigun:init(data)
	ModifierDozerMinigun.super.init(self, data)
end

function ModifierDozerMinigun:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_dozer = table.contains(ModifierDozerMinigun.bulldozers, value)
		local is_reaper_dozer = table.contains(ModifierDozerMinigun.russiadozers, value)			
		if is_dozer and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
		elseif is_reaper_dozer and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")				
		end
	end
	return value
end