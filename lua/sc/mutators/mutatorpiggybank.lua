MutatorPiggyBank = MutatorPiggyBank or class(BaseMutator)
MutatorPiggyBank._type = "MutatorPiggyBank"
MutatorPiggyBank.name_id = "mutator_piggybank"
MutatorPiggyBank.desc_id = "mutator_piggybank_desc"
MutatorPiggyBank.disables_achievements = false
MutatorPiggyBank.reductions = {money = 0, exp = 0}
MutatorPiggyBank.categories = {
	"old_event"
}
MutatorPiggyBank.icon_coords = {
	4,
	4
}

MutatorPiggyBank.incompatibility_tags = {
	"replaces_gamemode"
}