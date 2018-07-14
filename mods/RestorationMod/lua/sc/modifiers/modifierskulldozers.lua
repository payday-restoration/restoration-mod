if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierSkulldozers.default_value = "spawn_chance"
	ModifierSkulldozers.greendozers = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
		Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")
	}

	function ModifierSkulldozers:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_green = table.contains(ModifierSkulldozers.greendozers, value)
			if is_green and math.random(0,100) < 50 then
				return Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
			end
		end
		return value
	end

end