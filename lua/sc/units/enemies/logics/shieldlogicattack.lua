function ShieldLogicAttack._cancel_optimal_attempt(data, my_data)
    if my_data.optimal_path then
        my_data.optimal_path = nil
    elseif my_data.walking_to_optimal_pos then
        local new_action = {
            body_part = 2,
            type = "idle"
        }

        data.unit:brain():action_request(new_action)
    elseif my_data.pathing_to_optimal_pos then
        if data.active_searches[my_data.optimal_path_search_id] then
            data.unit:brain():abort_detailed_pathing(my_data.optimal_path_search_id)
        elseif data.pathing_results then
            data.pathing_results[my_data.optimal_path_search_id] = nil
        end

        my_data.optimal_path_search_id = nil
        my_data.pathing_to_optimal_pos = nil
    end
end