local old_exact = CivilianLogicTravel._determine_exact_destination
function CivilianLogicTravel._determine_exact_destination(data, objective, ...)
	if objective then
		if objective.type == "follow" then
			local follow_unit = objective.follow_unit
			if follow_unit then
				local to_pos = follow_unit:movement():nav_tracker():field_position()
				return to_pos
			end
		end
	end
	return old_exact(data, objective, ...)
end	

function CivilianLogicTravel.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()

	if action_type == "walk" then
		if action:expired() and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
			my_data.coarse_path_index = my_data.coarse_path_index + 1

			if my_data.coarse_path_index > #my_data.coarse_path then
				debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] invalid coarse path index increment", data.unit, inspect(my_data.coarse_path), my_data.coarse_path_index)

				my_data.coarse_path_index = my_data.coarse_path_index - 1
			end
		end

		my_data.advancing = nil

		if my_data.moving_to_cover then
			if action:expired() then
				if my_data.best_cover then
					managers.navigation:release_cover(my_data.best_cover[1])
				end

				my_data.best_cover = my_data.moving_to_cover

				CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)

				local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
				my_data.best_cover[4] = high_ray
				my_data.in_cover = true
				local cover_wait_time = 0

				my_data.cover_leave_t = data.t + cover_wait_time
			else
				managers.navigation:release_cover(my_data.moving_to_cover[1])

				if my_data.best_cover then
					local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

					if dis > 100 then
						managers.navigation:release_cover(my_data.best_cover[1])

						my_data.best_cover = nil
					end
				end
			end

			my_data.moving_to_cover = nil
		elseif my_data.best_cover then
			local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

			if dis > 100 then
				managers.navigation:release_cover(my_data.best_cover[1])

				my_data.best_cover = nil
			end
		end

		if not action:expired() then
			if my_data.processing_advance_path then
				local pathing_results = data.pathing_results

				if pathing_results and pathing_results[my_data.advance_path_search_id] then
					data.pathing_results[my_data.advance_path_search_id] = nil
					my_data.processing_advance_path = nil
				end
			elseif my_data.advance_path then
				my_data.advance_path = nil
			end

			data.unit:brain():abort_detailed_pathing(my_data.advance_path_search_id)
		end
	elseif action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "shoot" then
		data.internal_data.shooting = nil
	elseif action_type == "dodge" then
		local objective = data.objective
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, nil)

		if allow_trans then
			local wanted_state = data.logic._get_logic_state_from_reaction(data)

			if wanted_state and wanted_state ~= data.name and obj_failed then
				if data.unit:in_slot(managers.slot:get_mask("enemies")) or data.unit:in_slot(17) then
					data.objective_failed_clbk(data.unit, data.objective)
				elseif data.unit:in_slot(managers.slot:get_mask("criminals")) then
					managers.groupai:state():on_criminal_objective_failed(data.unit, data.objective, false)
				end

				if my_data == data.internal_data then
					debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] exiting without discarding objective", data.unit, inspect(data.objective))
					CopLogicBase._exit(data.unit, wanted_state)
				end
			end
		end
	end
end

CivilianLogicTravel.action_complete_clbk = CivilianLogicTravel.action_complete_clbk

-- Improve civilian pathing by reordering checks and using direct paths if possible
Hooks:OverrideFunction(CivilianLogicTravel, "update", function (data)
	local my_data = data.internal_data
	local unit = data.unit
	local objective = data.objective

	if my_data.has_old_action then
		CivilianLogicTravel._upd_stop_old_action(data, my_data)
		return
	elseif my_data.warp_pos then
		local action_desc = {
			body_part = 1,
			type = "warp",
			position = mvector3.copy(objective.pos),
			rotation = objective.rot
		}

		if unit:movement():action_request(action_desc) then
			CivilianLogicTravel._on_destination_reached(data)
		end
		return
	end

	if my_data.processing_advance_path or my_data.processing_coarse_path then
		CivilianLogicEscort._upd_pathing(data, my_data)
	end

	if my_data.advancing then
		return
	end

	if not my_data.advance_path and objective then
		if not my_data.coarse_path then
			local nav_seg, pos

			if objective.follow_unit then
				local follow_tracker = data.objective.follow_unit:movement():nav_tracker()
				nav_seg = follow_tracker:nav_segment()
				pos = follow_tracker:field_position()
			else
				nav_seg = objective.nav_seg
				pos = managers.navigation._nav_segments[nav_seg].pos
			end

			my_data.coarse_path_index = 1
			my_data.coarse_path = {
				{
					data.unit:movement():nav_tracker():nav_segment(),
					mvector3.copy(data.m_pos)
				},
				{
					nav_seg,
					pos
				}
			}
		end

		if my_data.coarse_path_index >= #my_data.coarse_path then
			objective.in_place = true

			if objective.type ~= "escort" and objective.type ~= "act" and objective.type ~= "follow" and not objective.action_duration then
				data.objective_complete_clbk(unit, objective)
			else
				CivilianLogicTravel.on_new_objective(data)
			end

			return
		else
			data.brain:rem_pos_rsrv("path")

			local to_pos
			if my_data.coarse_path_index == #my_data.coarse_path - 1 then
				to_pos = CivilianLogicTravel._determine_exact_destination(data, objective)
			else
				to_pos = my_data.coarse_path[my_data.coarse_path_index + 1][2]
			end

			-- Check if direct path is possible
			if math.abs(data.m_pos.z - to_pos.z) < 100 and not managers.navigation:raycast({ pos_from = data.m_pos, pos_to = to_pos }) then
				my_data.advance_path = {
					mvector3.copy(data.m_pos),
					to_pos
				}
			else
				my_data.processing_advance_path = true
				unit:brain():search_for_path(my_data.advance_path_search_id, to_pos)

				return
			end
		end
	end

	if my_data.advance_path then
		if my_data.is_hostage then
			my_data.advance_path = CivilianLogicTravel._optimize_path(my_data.advance_path)
		end

		my_data.starting_advance_action = true
		my_data.advancing = data.unit:brain():action_request({
			type = "walk",
			body_part = 2,
			nav_path = my_data.advance_path,
			variant = objective and objective.haste or "walk",
			end_rot = my_data.coarse_path_index == #my_data.coarse_path - 1 and objective and objective.rot or nil
		})
		my_data.starting_advance_action = false

		if my_data.advancing then
			my_data.advance_path = nil
			data.brain:rem_pos_rsrv("path")
		end

		return
	end

	CopLogicBase._exit(data.unit, "idle")
end)