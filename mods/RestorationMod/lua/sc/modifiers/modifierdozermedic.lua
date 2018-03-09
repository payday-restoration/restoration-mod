if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierDozerMedic.default_value = "spawn_chance"
	ModifierDozerMedic.hrts = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
	}

	function ModifierDozerMedic:init(data)
		ModifierDozerMedic.super.init(self, data)
	end

	function ModifierDozerMedic:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_hrt = table.contains(ModifierDozerMedic.hrts, value)
			if is_hrt and math.random(0,100) < 10 then
				return Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			end
		end
		return value
	end

end