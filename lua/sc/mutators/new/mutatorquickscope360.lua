--Faster sniper aiming--
MutatorQuickScope360 = MutatorQuickScope360 or class(BaseMutator)
MutatorQuickScope360._type = "MutatorQuickScope360"
MutatorQuickScope360.name_id = "mutator_quickscope360"
MutatorQuickScope360.desc_id = "mutator_quickscope360_desc"
MutatorQuickScope360.reductions = {
	money = 0,
	exp = 0
}
MutatorQuickScope360.disables_achievements = false
MutatorQuickScope360.categories = {"crime_spree"}

MutatorQuickScope360.icon_coords = {
	6,
	4
}
--Why same mechanism cause crashes
function MutatorQuickScope360:modify_value(id, value)
	if id == "CopActionShoot:ModifierSniperAim" then
		return {value[1] / self:value(), value[2] / self:value()}
	end

	return value
end