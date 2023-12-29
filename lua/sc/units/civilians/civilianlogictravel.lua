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