MutatorPiggyRevenge = MutatorPiggyRevenge or class(BaseMutator)
MutatorPiggyRevenge._type = "MutatorPiggyRevenge"
MutatorPiggyRevenge.name_id = "mutator_piggyrevenge"
MutatorPiggyRevenge.desc_id = "mutator_piggyrevenge_desc"
MutatorPiggyRevenge.package = "packages/pda10_piggyrevenge"
MutatorPiggyRevenge.disables_achievements = false
MutatorPiggyRevenge.reductions = {money = 0, exp = 0}
MutatorPiggyRevenge.categories = {
	"old_event"
}
MutatorPiggyRevenge.icon_coords = {
	4,
	4
}

MutatorPiggyRevenge.incompatibility_tags = {
	"replaces_gamemode"
}

--Fix it overriding fast hands
function MutatorPiggyRevenge:get_interaction_override()
	return self:is_buff_active("bag_speed") and (self._tweakdata.buffs.bag_speed.interaction_override or 0.1) or 0.25
end

--Fix it overriding transporter
function MutatorPiggyRevenge:get_bag_throw_multiplier(carry_id)
	return self:is_buff_active("bag_throw") and carry_id == "pda9_feed" and (self._tweakdata.buffs.bag_throw.throw_multiplier or 2) or 1.5
end