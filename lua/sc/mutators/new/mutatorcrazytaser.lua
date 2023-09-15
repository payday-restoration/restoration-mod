--No delay for taser charge--
MutatorCrazyTaser = MutatorCrazyTaser or class(BaseMutator)
MutatorCrazyTaser._type = "MutatorCrazyTaser"
MutatorCrazyTaser.name_id = "mutator_crazytaser"
MutatorCrazyTaser.desc_id = "mutator_crazytaser_desc"
MutatorCrazyTaser.reductions = {
	money = 0,
	exp = 0
}
MutatorCrazyTaser.disables_achievements = false
MutatorCrazyTaser.categories = {"crime_spree"}

MutatorCrazyTaser.icon_coords = {
	6,
	4
}

function MutatorCrazyTaser:setup(data)
	tweak_data.character.taser.weapon.is_rifle_single_fire.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.normal.is_rifle_single_fire.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.good.is_rifle_single_fire.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.expert.is_rifle_single_fire.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.deathwish.is_rifle_single_fire.aim_delay_tase = {0, 0}
end




