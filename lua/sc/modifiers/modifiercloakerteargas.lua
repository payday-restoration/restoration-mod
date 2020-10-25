ModifierCloakerTearGas.default_value = "spawn_chance"
ModifierCloakerTearGas.hrts = {
	Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
	Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
	Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
}
ModifierCloakerTearGas.zombiehrts = {
	Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
}

function ModifierCloakerTearGas:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_hrt = table.contains(ModifierCloakerTearGas.hrts, value)
		local is_zombiehrt = table.contains(ModifierCloakerTearGas.zombiehrts, value)
		if is_hrt and math.random(0,100) < 10 then
			return Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
		elseif is_zombiehrt and math.random(0,100) < 10 then
			return Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
		end
	end
	return value
end

function ModifierCloakerTearGas:OnEnemyDied(unit, damage_info)
end