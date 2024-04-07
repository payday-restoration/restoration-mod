MutatorFastResponse = MutatorFastResponse or class(BaseMutator)
MutatorFastResponse._type = "MutatorFastResponse"
MutatorFastResponse.name_id = "mutator_fastresponse"
MutatorFastResponse.desc_id = "mutator_fastresponse_desc"
MutatorFastResponse.reductions = {
	money = 0,
	exp = 0
}
MutatorFastResponse.disables_achievements = false
MutatorFastResponse.categories = {"crime_spree"}

MutatorFastResponse.icon_coords = {
	6,
	4
}

function MutatorFastResponse:setup()
	if restoration then
		restoration.civ_death_diff_increase = false
	end
end

function MutatorFastResponse:modify_value(id, value)
	if id == "GroupAIStateBase:CheckingDiff" then
		return 1
	end
	return value
end