if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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

		local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
		local mini_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")

		table.insert(unit_types.america, mini_unit_name)
		table.insert(unit_types.russia, mini_unit_name)
		table.insert(unit_types.zombie, mini_unit_name)
		table.insert(unit_types.murkywater, mini_unit_name)
	end	
	
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

		local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
		local medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")

		table.insert(unit_types.america, medic_unit_name)
		table.insert(unit_types.russia, medic_unit_name)
		table.insert(unit_types.zombie, medic_unit_name)
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	end		

end