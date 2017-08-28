if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierDozerMinigun.default_value = "spawn_chance"
	ModifierDozerMinigun.bulldozers = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
		Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
		Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
		Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc_3/ene_zeal_bulldozer_sc_3"),
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
			if is_dozer and math.random(0,100) < 15 then
				return Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			end
		end
		return value
	end

end