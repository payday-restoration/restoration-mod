--asian man laughing at bruce willis flip flopping--
MutatorMasterDodger = MutatorMasterDodger or class(BaseMutator)
MutatorMasterDodger._type = "MutatorMasterDodger"
MutatorMasterDodger.name_id = "mutator_masterdodger"
MutatorMasterDodger.desc_id = "mutator_masterdodger_desc"
MutatorMasterDodger.reductions = {
	money = 0,
	exp = 0
}
MutatorMasterDodger.disables_achievements = false
MutatorMasterDodger.categories = {"crime_spree"}

MutatorMasterDodger.icon_coords = {
	5,
	3
}
--FBI Vet is not dodging like hell so idk
function MutatorMasterDodger:modify_value(id, value)
	if id == "CopDamage:CheckingDodge" then
		return 100
	end
	return value
end