ModifierShieldPhalanx.default_value = "spawn_chance"
ModifierShieldPhalanx.shields = {
	Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
	Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
	Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"),	
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"),				
	Idstring("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"),		
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
	Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),		
	Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),			
	Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"),			
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),								
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
}

ModifierShieldPhalanx.reapershields = {
	Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
	Idstring("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"),		
	Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
	Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
	Idstring("units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"),
	Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
	Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
	Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal")
}	

--JUST IN CASE, we do not want these guys breaking the fucking spawn cap
function ModifierShieldPhalanx:init(data)
	ModifierShieldPhalanx.super.init(data)

--damn captain flags
	tweak_data.group_ai.unit_categories.CS_shield.is_captain = false
	tweak_data.group_ai.unit_categories.FBI_shield.is_captain = false
end

function ModifierShieldPhalanx:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_shield = table.contains(ModifierShieldPhalanx.shields, value)
		local is_reapershield = table.contains(ModifierShieldPhalanx.reapershields, value)			
		if is_shield and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
		elseif is_reapershield and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")				
		end
	end
	return value
end