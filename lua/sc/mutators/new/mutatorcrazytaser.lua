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
--Don't work. CS version either
function MutatorCrazyTaser:setup(data)
	--MutatorCrazyTaser.super.init(self, data)
	local new_tase_delay = {3, 3}
	tweak_data.character.taser.weapon.is_rifle.aim_delay_tase = new_tase_delay
	tweak_data.character.presets.weapon.normal.is_rifle.aim_delay_tase = new_tase_delay
	tweak_data.character.presets.weapon.good.is_rifle.aim_delay_tase = new_tase_delay
	tweak_data.character.presets.weapon.expert.is_rifle.aim_delay_tase = new_tase_delay
	tweak_data.character.presets.weapon.deathwish.is_rifle.aim_delay_tase = new_tase_delay
end




