if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierHeavySniper.default_value = "spawn_chance"
	ModifierHeavySniper.heavy_units = {
		Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
		Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
		Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
		Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
		Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
		Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
		Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870")
	}


	function ModifierHeavySniper:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_heavy = table.contains(ModifierHeavySniper.heavy_units, value)
			if is_heavy and math.random(0,100) < 10 then
				return Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
			end
		end
		return value
	end

end