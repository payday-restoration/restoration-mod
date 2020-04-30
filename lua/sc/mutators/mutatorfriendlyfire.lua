MutatorFriendlyFire.reductions = {money = 0, exp = 0}
MutatorFriendlyFire.disables_achievements = false

--No Damage grace--

--Why--
MutatorFatRoll = MutatorFatRoll or class(BaseMutator)
MutatorFatRoll._type = "MutatorFatRoll"
MutatorFatRoll.name_id = "mutator_fatroll"
MutatorFatRoll.desc_id = "mutator_fatroll_desc"
MutatorFatRoll.reductions = {
	money = 0,
	exp = 0
}
MutatorFatRoll.disables_achievements = false
MutatorFatRoll.categories = {"gameplay"}
MutatorFatRoll.icon_coords = {
	5,
	1
}

function MutatorFatRoll:setup(data)
	tweak_data.player.damage.MIN_DAMAGE_INTERVAL = 0
	tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
end		