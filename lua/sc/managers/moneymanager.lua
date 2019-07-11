function MoneyManager:on_stage_completed( num_winners )
	if not managers.job:has_active_job() then
		return 0
	end
	
	-- local stars = managers.job:current_job_and_difficulty_stars()
	-- local amount = tweak_data.money_manager.stage_completion[ stars ]
	local stage_value = self:_get_contract_money( false, nil )
	local amount = stage_value

	amount = math.round( amount * tweak_data:get_value( "money_manager", "alive_humans_multiplier", num_winners ) )
	
	self:_add_to_total( amount )
	self:_set_stage_payout( stage_value )
	self:_set_crew_payout( amount - stage_value )
	return amount
end