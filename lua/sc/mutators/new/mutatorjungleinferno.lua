MutatorJungleInferno = MutatorJungleInferno or class(BaseMutator)
MutatorJungleInferno._type = "MutatorJungleInferno"
MutatorJungleInferno.name_id = "MutatorJungleInferno"
MutatorJungleInferno.desc_id = "MutatorJungleInferno_desc"
MutatorJungleInferno.reductions = {
	money = 0,
	exp = 0
}
MutatorJungleInferno.incompatibility_tags = {}		
MutatorJungleInferno.disables_achievements = true
MutatorJungleInferno.categories = {"enemies"}
MutatorJungleInferno.icon_coords = {
	2,
	4
}	
MutatorJungleInferno.load_priority = -10

function MutatorJungleInferno:setup(data)
	if restoration then
		restoration.disco_inferno = true
	end
end