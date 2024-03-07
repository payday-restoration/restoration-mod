--Vanilla behavior for police calls--
MutatorVanillaPoliceCall = MutatorVanillaPoliceCall or class(BaseMutator)
MutatorVanillaPoliceCall._type = "MutatorVanillaPoliceCall"
MutatorVanillaPoliceCall.name_id = "mutator_vanilla_police_call"
MutatorVanillaPoliceCall.desc_id = "mutator_vanilla_police_call_desc"
MutatorVanillaPoliceCall.reductions = {
	money = 0,
	exp = 0
}
MutatorVanillaPoliceCall.disables_achievements = false
MutatorVanillaPoliceCall.categories = {"gameplay"}

MutatorVanillaPoliceCall.icon_coords = {
	2,
	5
}

function MutatorVanillaPoliceCall:modify_value(id, value)
	if id == "CopMovement:VanillaPoliceCall" or id == "SecurityCamera:VanillaPoliceCall" or id == "CopBrain:VanillaPoliceCall" then
		return true
	end
	return value
end