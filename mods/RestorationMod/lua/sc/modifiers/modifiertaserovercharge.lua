if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierTaserOvercharge.default_value = "spawn_chance"
	ModifierTaserOvercharge.tasers = {
		Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
		Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
		Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1")
	}

	function ModifierTaserOvercharge:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_taser = table.contains(ModifierTaserOvercharge.tasers, value)
			if is_taser and math.random(0,100) < 10 then
				return Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
			end
		end
		return value
	end
	
end