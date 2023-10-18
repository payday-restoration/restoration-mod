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

-- Only allow positioning when group is fully spawned
local _chk_request_action_walk_to_optimal_pos_original = ShieldLogicAttack._chk_request_action_walk_to_optimal_pos
function ShieldLogicAttack._chk_request_action_walk_to_optimal_pos(data, ...)
	if not data.group or data.group.has_spawned then
		_chk_request_action_walk_to_optimal_pos_original(data, ...)
	end
end


-- Stop current optimal positioning attempt when receiving new logic
Hooks:PreHook(ShieldLogicAttack, "exit", "sh_exit", function (data)
	ShieldLogicAttack._cancel_optimal_attempt(data, data.internal_data)
end)
