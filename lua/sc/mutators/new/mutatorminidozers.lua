--Minigun Dozers--
MutatorMinidozers = MutatorMinidozers or class(BaseMutator)
MutatorMinidozers._type = "MutatorMinidozers"
MutatorMinidozers.name_id = "mutator_minidozers"
MutatorMinidozers.desc_id = "mutator_minidozers_desc"
MutatorMinidozers.reductions = {
	money = 0,
	exp = 0
}
MutatorMinidozers.disables_achievements = false
MutatorMinidozers.categories = {"enemies"}
MutatorMinidozers.icon_coords = {
	6,
	1
}

function MutatorMinidozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	
	local mini_unit_name = Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	local classic_mini_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	
	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_mini_unit_name)
		table.insert(unit_types.russia, classic_mini_unit_name)
		table.insert(unit_types.zombie, classic_mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types.murkywater, classic_medic_unit_name)
		table.insert(unit_types.nypd, classic_mini_unit_name)
		table.insert(unit_types.lapd, classic_mini_unit_name)		
	
		table.insert(unit_types_black.america, classic_mini_unit_name)
		table.insert(unit_types_black.russia, classic_mini_unit_name)
		table.insert(unit_types_black.zombie, classic_mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types_black.murkywater, classic_medic_unit_name)
		table.insert(unit_types_black.nypd, classic_mini_unit_name)
		table.insert(unit_types_black.lapd, classic_mini_unit_name)				
	else	
		table.insert(unit_types.america, mini_unit_name)
		table.insert(unit_types.russia, mini_unit_name)
		table.insert(unit_types.zombie, mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))		
		table.insert(unit_types.murkywater, mini_unit_name)
		table.insert(unit_types.nypd, mini_unit_name)
		table.insert(unit_types.lapd, mini_unit_name)	
	
		table.insert(unit_types_black.america, mini_unit_name)
		table.insert(unit_types_black.russia, mini_unit_name)
		table.insert(unit_types_black.zombie, mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))		
		table.insert(unit_types_black.murkywater, mini_unit_name)
		table.insert(unit_types_black.nypd, mini_unit_name)
		table.insert(unit_types_black.lapd, mini_unit_name)		
	end
end	