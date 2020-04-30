ModifierMedicAdrenaline.default_value = "spawn_chance"
ModifierMedicAdrenaline.medics = {
	Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),			
	Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),						
	Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
}

ModifierMedicAdrenaline.reapermedic = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann")
}	

function ModifierMedicAdrenaline:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_medic = table.contains(ModifierMedicAdrenaline.medics, value)
		local is_reapermedic = table.contains(ModifierMedicAdrenaline.reapermedic, value)			
		if is_medic and math.random(0,100) < 10 then
			return Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
		elseif is_reapermedic and math.random(0,100) < 10 then
			return Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")				
		end
	end
	return value
end