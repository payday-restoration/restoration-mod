if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierHeavies.default_value = "spawn_chance"
	ModifierHeavies.fbi = {
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
	}
	ModifierHeavies.gensec = {
		Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
	}
	--just to make sure the original doesn't do anything
	ModifierHeavies.unit_swaps = {}


	function ModifierHeavies:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_fbi = table.contains(ModifierHeavies.fbi, value)
			local is_gensec = table.contains(ModifierHeavies.gensec, value)
			if is_fbi and math.random(0,100) < 15 then
				return Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
			elseif is_gensec and math.random(0,100) < 15 then
				return Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			end
		end
		return value
	end

end