--Replace smoke on tear gas--
MutatorFartSmella = MutatorFartSmella or class(BaseMutator)
MutatorFartSmella._type = "MutatorFartSmella"
MutatorFartSmella.name_id = "mutator_fartsmella"
MutatorFartSmella.desc_id = "mutator_fartsmella_desc"
MutatorFartSmella.reductions = {
	money = 0,
	exp = 0
}
MutatorFartSmella.disables_achievements = false
MutatorFartSmella.categories = {"crime_spree"}

MutatorFartSmella.icon_coords = {
	6,
	4
}
--You either a smart fella or fart smella
function MutatorFartSmella:modify_value(id, value)
	if id == "GroupAIStateBase:SpawningSmoke" then
        return Idstring("units/weapons/cs_grenade_quick/cs_grenade_quick")
    elseif id == "GroupAIStateBase:CheckingVoiceLine" then
        return "g42x_any"
    end
    return value
end