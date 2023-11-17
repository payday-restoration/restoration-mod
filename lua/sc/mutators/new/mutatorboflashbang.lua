--Unbreakable flashbang from DS diff as mutator
MutatorBoFlashbang = MutatorBoFlashbang or class(BaseMutator)
MutatorBoFlashbang._type = "MutatorBoFlashbang"
MutatorBoFlashbang.name_id = "mutator_bo_flashbang"
MutatorBoFlashbang.desc_id = "mutator_bo_flashbang_desc"
MutatorBoFlashbang.reductions = {
	money = 0,
	exp = 0
}
MutatorBoFlashbang.disables_achievements = false
MutatorBoFlashbang.categories = {"gameplay"}
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
local starvr = math.rand(1)
local its_bover = 0.02
-- he-he
if starvr <= its_bover then
MutatorBoFlashbang.icon_coords = {
	3,
	2
}
else
MutatorBoFlashbang.icon_coords = {
	4,
	2
}
end

function MutatorBoFlashbang:modify_value(id, value)
	if id == "GroupAIStateBase:SpawnSpecialFlashbang" then
		return "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
	end
	return value
end