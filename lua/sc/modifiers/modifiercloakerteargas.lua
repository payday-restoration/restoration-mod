ModifierCloakerTearGas.default_value = "spawn_chance"
ModifierCloakerTearGas.titanhrt = {
	Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_3/ene_omnia_hrt_3"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
}
ModifierCloakerTearGas.titanocelot = {
	Idstring("units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")
}
ModifierCloakerTearGas.zombietitanhrt = {
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
}

function ModifierCloakerTearGas:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_titanhrt = table.contains(ModifierCloakerTearGas.titanhrt, value)
		local is_zombietitanhrt = table.contains(ModifierCloakerTearGas.zombietitanhrt, value)
		local is_titanocelot = table.contains(ModifierCloakerTearGas.titanocelot, value)
		if is_titanhrt and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
		elseif is_titanocelot and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")	
		elseif is_zombietitanshrt and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
		end
	end
	return value
end

function ModifierCloakerTearGas:OnEnemyDied(unit, damage_info)
end