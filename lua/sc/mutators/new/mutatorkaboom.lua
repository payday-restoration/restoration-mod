--Funny kamikaze--
MutatorKaboom = MutatorKaboom or class(BaseMutator)
MutatorKaboom._type = "MutatorKaboom"
MutatorKaboom.name_id = "mutator_kaboom"
MutatorKaboom.desc_id = "mutator_kaboom_desc"
MutatorKaboom.reductions = {
	money = 0,
	exp = 0
}
MutatorKaboom.disables_achievements = false
MutatorKaboom.categories = {"crime_spree"}

MutatorKaboom.icon_coords = {
	6,
	4
}

function MutatorKaboom:modify_value(id, value)
	if id == "CopDamage:CanBoomBoom" then
        return true
	end
	return value
end