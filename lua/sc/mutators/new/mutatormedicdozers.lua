--Medic Dozers--
MutatorMedicdozers = MutatorMedicdozers or class(BaseMutator)
MutatorMedicdozers._type = "MutatorMedicdozers"
MutatorMedicdozers.name_id = "mutator_medicdozers"
MutatorMedicdozers.desc_id = "mutator_medicdozers_desc"
MutatorMedicdozers.reductions = {
	money = 0,
	exp = 0
}
MutatorMedicdozers.disables_achievements = false
MutatorMedicdozers.categories = {"enemies"}
MutatorMedicdozers.icon_coords = {
	6,
	1
}

function MutatorMedicdozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types
	
	local medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
	local classic_medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic")

	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_medic_unit_name)
		table.insert(unit_types.russia, classic_medic_unit_name)
		table.insert(unit_types.zombie, classic_medic_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, classic_medic_unit_name)
		table.insert(unit_types.lapd, classic_medic_unit_name)
		table.insert(unit_types.fbi, classic_medic_unit_name)
		
		table.insert(unit_types_black.america, classic_medic_unit_name)
		table.insert(unit_types_black.russia, classic_medic_unit_name)
		table.insert(unit_types_black.zombie, classic_medic_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, classic_medic_unit_name)
		table.insert(unit_types_black.lapd, classic_medic_unit_name)
		table.insert(unit_types_black.fbi, classic_medic_unit_name)

		table.insert(unit_types_skull.america, classic_medic_unit_name)
		table.insert(unit_types_skull.russia, classic_medic_unit_name)
		table.insert(unit_types_skull.zombie, classic_medic_unit_name)
		table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, classic_medic_unit_name)
		table.insert(unit_types_skull.lapd, classic_medic_unit_name)	
		table.insert(unit_types_skull.fbi, classic_medic_unit_name)
	else
		table.insert(unit_types.america, medic_unit_name)
		table.insert(unit_types.russia, medic_unit_name)
		table.insert(unit_types.zombie, medic_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, medic_unit_name)
		table.insert(unit_types.lapd, medic_unit_name)
		table.insert(unit_types.fbi, medic_unit_name)
		
		table.insert(unit_types_black.america, medic_unit_name)
		table.insert(unit_types_black.russia, medic_unit_name)
		table.insert(unit_types_black.zombie, medic_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, medic_unit_name)
		table.insert(unit_types_black.lapd, medic_unit_name)
		table.insert(unit_types_black.fbi, medic_unit_name)

		table.insert(unit_types_skull.america, medic_unit_name)
		table.insert(unit_types_skull.russia, medic_unit_name)
		table.insert(unit_types_skull.zombie, medic_unit_name)
		table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, medic_unit_name)
		table.insert(unit_types_skull.lapd, medic_unit_name)
		table.insert(unit_types_skull.fbi, medic_unit_name)	
	end		
end