--Bravo Spawns at all times--
MutatorBravosOnly = MutatorBravosOnly or class(BaseMutator)
MutatorBravosOnly._type = "MutatorBravosOnly"
MutatorBravosOnly.name_id = "mutator_bravos_only"
MutatorBravosOnly.desc_id = "mutator_bravos_only_desc"
MutatorBravosOnly.reductions = {
	money = 0,
	exp = 0
}
MutatorBravosOnly.disables_achievements = false
MutatorBravosOnly.categories = {"enemies"}
MutatorBravosOnly.icon_coords = {
	5,
	3
}

function MutatorBravosOnly:setup(data)
	if restoration then
		restoration.always_bravos = true
	end
end
