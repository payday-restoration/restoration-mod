--Force enemy HP and DMG values from DS difficulty for any diff
MutatorAdvancedTraining = MutatorAdvancedTraining or class(BaseMutator)
MutatorAdvancedTraining._type = "MutatorAdvancedTraining"
MutatorAdvancedTraining.name_id = "mutator_advancedtraining"
MutatorAdvancedTraining.desc_id = "mutator_advancedtraining_desc"
MutatorAdvancedTraining.reductions = {
	money = 0,
	exp = 0
}
MutatorAdvancedTraining.disables_achievements = false
MutatorAdvancedTraining.categories = {"gameplay"}

MutatorAdvancedTraining.icon_coords = {
	7,
	5
}

function MutatorAdvancedTraining:setup(data)
	--Adjust hp and hs multiplier values for SWAT and Heavy SWAT units that spawn on low diffs
	tweak_data.character.swat.HEALTH_INIT = 15
	tweak_data.character.swat.headshot_dmg_mul = 3
	tweak_data.character.heavy_swat.HEALTH_INIT = 20
	tweak_data.character.heavy_swat.headshot_dmg_mul = 2
	--Init DS presets
	tweak_data.character:_set_sm_wish()
	tweak_data.weapon:_set_sm_wish()	
end