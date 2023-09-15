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
	6,
	4
}

function MutatorMasterDodger:setup(data)
	tweak_data.character.fbi_vet.damage.bullet_dodge_chance = 100
end