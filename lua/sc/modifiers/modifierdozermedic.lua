ModifierDozerMedic.default_value = "spawn_chance"
ModifierDozerMedic.america = {
	Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4")				
}

ModifierDozerMedic.russia = {
	Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")
}	

ModifierDozerMedic.murky = {
	Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4"),
	Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2")
}		

ModifierDozerMedic.zombie = {
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
	Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
}		

ModifierDozerMedic.nypd = {
	Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
	Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")
}			

function ModifierDozerMedic:init(data)
	ModifierDozerMedic.super.init(self, data)
end

function ModifierDozerMedic:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)		
		local is_america = table.contains(ModifierDozerMedic.america, value)
		local is_russia = table.contains(ModifierDozerMedic.russia, value)
		local is_zombie = table.contains(ModifierDozerMedic.zombie, value)
		local is_murky = table.contains(ModifierDozerMedic.murky, value)
		local is_nypd = table.contains(ModifierDozerMedic.nypd, value)		
		local is_lapd = table.contains(ModifierDozerMedic.nypd, value)						
		if is_america and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
		elseif is_america and math.random(0,100) < 15 then
			return Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")				
		elseif is_russia and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1")
		elseif is_russia and math.random(0,100) < 15 then
			return Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2")				
		elseif is_zombie and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")	
		elseif is_zombie and math.random(0,100) < 15 then
			return Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")					
		elseif is_nypd and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")	
		elseif is_nypd and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1")
		elseif is_lapd and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")	
		elseif is_lapd and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1")
		elseif is_murky and difficulty_index <= 6 and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")					
		elseif is_murky and math.random(0,100) < 15 then
			return Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1")								
		end
	end
	return value
end