MutatorCloakerEffect.reductions = {money = 0, exp = 0}
MutatorCloakerEffect.disables_achievements = false

function MutatorCloakerEffect:effect_smoke(unit)
	local smoke_grenade_id = Idstring("units/weapons/smoke_grenade_quick/smoke_grenade_quick")
	smoke_grenade_id = managers.modifiers:modify_value("GroupAIStateBase:SpawningSmoke", smoke_grenade_id)
	local smoke_grenade = World:spawn_unit(smoke_grenade_id, unit:position(), unit:rotation())

	smoke_grenade:base():activate(unit:position(), tweak_data.group_ai.smoke_grenade_lifetime)
end