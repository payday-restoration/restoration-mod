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
		1,
		3
	}

	function MutatorMinidozers:setup(data)

		local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
		local unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")

		table.insert(unit_types.america, unit_name)
		table.insert(unit_types.russia, unit_name)
		table.insert(unit_types.zombie, unit_name)
		table.insert(unit_types.murky, unit_name)
	end	

end