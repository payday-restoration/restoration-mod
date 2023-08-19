--Fix it overriding fast hands
function MutatorPiggyRevenge:get_interaction_override()
	return self:is_buff_active("bag_speed") and (self._tweakdata.buffs.bag_speed.interaction_override or 0.1) or 0.25
end

--Fix it overriding transporter
function MutatorPiggyRevenge:get_bag_throw_multiplier(carry_id)
	return self:is_buff_active("bag_throw") and carry_id == "pda9_feed" and (self._tweakdata.buffs.bag_throw.throw_multiplier or 2) or 1.5
end