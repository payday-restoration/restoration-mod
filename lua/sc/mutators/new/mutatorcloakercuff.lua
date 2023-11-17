--Sets Cloakers to cuff you on melee strikes--
MutatorCloakerCuff = MutatorCloakerCuff or class(BaseMutator)
MutatorCloakerCuff._type = "MutatorCloakerCuff"
MutatorCloakerCuff.name_id = "mutator_cloakercuff"
MutatorCloakerCuff.desc_id = "mutator_cloakercuff_desc"
MutatorCloakerCuff.reductions = {
	money = 0,
	exp = 0
}
MutatorCloakerCuff.disables_achievements = false
MutatorCloakerCuff.categories = {"crime_spree"}

MutatorCloakerCuff.icon_coords = {
	6,
	4
}

function MutatorCloakerCuff:setup(data)
	tweak_data.character.spooc.cuff_on_melee = true
end