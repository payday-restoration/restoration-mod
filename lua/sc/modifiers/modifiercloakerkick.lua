ModifierCloakerKick.default_value = "spawn_chance"
ModifierCloakerKick.cloakers = {
	Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
	Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"),		
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),				
	Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
}

ModifierCloakerKick.reapercloaker = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
}	

function ModifierCloakerKick:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_cloakers = table.contains(ModifierCloakerKick.cloakers, value)
		local is_reapercloaker = table.contains(ModifierCloakerKick.reapercloaker, value)			
		if is_cloakers and math.random(0,100) < 10 then
			return Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
		elseif is_reapercloaker and math.random(0,100) < 10 then
			return Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")				
		end
	end
	return value
end

function ModifierCloakerKick:OnPlayerCloakerKicked(cloaker_unit)
end