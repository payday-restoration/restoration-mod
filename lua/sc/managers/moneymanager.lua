if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    function MoneyManager:_get_contract_money( is_job, success )
        local has_active_job = managers.job:has_active_job()
        local job_and_difficulty_stars = has_active_job and managers.job:current_job_and_difficulty_stars() or 1
        local job_stars = has_active_job and managers.job:current_job_stars() or 1
        local difficulty_stars = job_and_difficulty_stars - job_stars
        local player_stars = managers.experience:level_to_stars()
        
        local total_stars = math.min( job_and_difficulty_stars, player_stars + 1 )
        
        local total_difficulty_stars = math.max( 0, total_stars - job_stars )
        local money_multiplier = self:get_contract_difficulty_multiplier( total_difficulty_stars )
        
        total_stars = math.min( job_stars, total_stars )
       
        local contract_money = 0

        if is_job then
            contract_money = contract_money + self:get_job_payout_by_stars( total_stars )
        else
            contract_money = contract_money + self:get_stage_payout_by_stars( total_stars )
        end
        
        contract_money = contract_money + (contract_money*money_multiplier)
        contract_money = contract_money

        return math.round( contract_money )
    end
    
    function MoneyManager:on_job_completed( num_winners )
        if not managers.job:has_active_job() then
            return 0
        end
        
        local stage_value = self:_get_contract_money( false, nil )
        local job_value = self:_get_contract_money( true, nil )
        local bag_value = self:get_secured_bonus_bags_money()
        
        local amount = stage_value + job_value
        amount = amount + bag_value
        amount = math.round( amount * tweak_data:get_value( "money_manager", "alive_humans_multiplier", num_winners ) )
        
        self:_add_to_total( amount )
        
        self:_set_stage_payout( stage_value )
        self:_set_job_payout( job_value )
        self:_set_bag_payout( bag_value )
        self:_set_crew_payout( amount - stage_value - job_value - bag_value )
        
        return amount
    end
    
    function MoneyManager:on_stage_completed( num_winners )
        if not managers.job:has_active_job() then
            return 0
        end
    
        local stage_value = self:_get_contract_money( false, nil )
        local amount = stage_value
    
        amount = math.round( amount * tweak_data:get_value( "money_manager", "alive_humans_multiplier", num_winners ) )
    
        self:_add_to_total( amount )
        self:_set_stage_payout( stage_value )
        self:_set_crew_payout( amount - stage_value )
        return amount
    end 

end

