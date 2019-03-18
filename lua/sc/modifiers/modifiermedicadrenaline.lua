if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierMedicAdrenaline.default_value = "spawn_chance"
	ModifierMedicAdrenaline.medics = {
		Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_m4/ene_akan_medic_m4"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
	}

	function ModifierMedicAdrenaline:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_medic = table.contains(ModifierMedicAdrenaline.medics, value)
			if is_medic and math.random(0,100) < 10 then
				return Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			end
		end
		return value
	end

end