--Fix it overriding fast hands
function MutatorPiggyRevenge:get_interaction_override()
	return self:is_buff_active("bag_speed") and (self._tweakdata.buffs.bag_speed.interaction_override or 0.1) or 0.25
end