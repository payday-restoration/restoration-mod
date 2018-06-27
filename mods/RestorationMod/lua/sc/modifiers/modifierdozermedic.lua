if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierDozerMedic.default_value = "spawn_chance"
	ModifierDozerMedic.agents = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_1/ene_murky_hrt_1"),
		Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2")		
	}

	function ModifierDozerMedic:init(data)
		ModifierDozerMedic.super.init(self, data)
	end

	function ModifierDozerMedic:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_agent = table.contains(ModifierDozerMedic.agents, value)
			if is_hrt and math.random(0,100) < 10 then
				return Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			end
		end
		return value
	end

end