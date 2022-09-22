--The ScMod styled assault mutator--
MutatorSonicMod = MutatorSonicMod or class(BaseMutator)
MutatorSonicMod._type = "MutatorSonicMod"
MutatorSonicMod.name_id = "mutator_sonic_mod"
MutatorSonicMod.desc_id = "mutator_sonic_mod_desc"
MutatorSonicMod.reductions = {
	money = 0,
	exp = 0
}
MutatorSonicMod.disables_achievements = false
MutatorSonicMod.incompatibility_tags = {
	"replaces_units"
}	
MutatorSonicMod.categories = {"enemies"}
--icon needs to be changed
MutatorSonicMod.icon_coords = {
	5,
	3
}

function MutatorSonicMod:setup(data)
	if restoration then
		restoration.sonic_mod = true
	end
end
