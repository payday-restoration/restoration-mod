local math_abs = math.abs
local math_random = math.random
local mvec3_add = mvector3.add
local mvec3_copy = mvector3.copy
local mvec3_cross = mvector3.cross
local mvec3_dir = mvector3.direction
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_mul = mvector3.multiply
local mvec3_neg = mvector3.negate
local mvec3_normalize = mvector3.normalize
local mvec3_set = mvector3.set
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()


-- Reuse function of idle logic to make enemies in an area aware of a player entering the area
CopLogicTravel.on_area_safety = CopLogicIdle.on_area_safety


-- Update pathing immediately when receiving travel logic or pathing results
Hooks:PostHook(CopLogicTravel, "enter", "sh_enter", CopLogicTravel.upd_advance)

function CopLogicTravel.on_pathing_results(data)
	local my_data = data.internal_data
	if my_data.coarse_path and my_data.advancing then
		CopLogicTravel._upd_pathing(data, my_data)

		if my_data.advance_path and my_data.advancing:append_path(my_data.advance_path, my_data.coarse_path[my_data.coarse_path_index + 1][1]) then
			my_data.advance_path = nil

			if my_data.coarse_path_index >= #my_data.coarse_path - 2 and data.objective.rot then
				my_data.advancing._end_rot = data.objective.rot
			end
		end
	else
		CopLogicTravel.upd_advance(data)
	end
end


-- Sanity check for rare follow_unit crash
Hooks:PreHook(CopLogicTravel, "_begin_coarse_pathing", "sh__begin_coarse_pathing", function(data, my_data)
	my_data.processing_coarse_path = true -- otherwise the pathing results callback will cause a stack overflow if the coarse path is returned immediately

	if data.objective.follow_unit and not alive(data.objective.follow_unit) then
		data.objective.follow_unit = nil
	end
end)


-- Fix need for another queued task to update pathing or leaving cover on expired cover time
-- Basically just does the needed checks before calling the original function to save on a queued update
Hooks:PreHook(CopLogicTravel, "upd_advance", "sh_upd_advance", function (data)
	local unit = data.unit
	local my_data = data.internal_data
	local t = TimerManager:game():time()
	if my_data.processing_advance_path or my_data.processing_coarse_path then
		CopLogicTravel._upd_pathing(data, my_data)
	elseif my_data.cover_leave_t then
		if my_data.coarse_path and my_data.coarse_path_index == #my_data.coarse_path or my_data.cover_leave_t < t and not unit:movement():chk_action_forbidden("walk") and not data.unit:anim_data().reload then
			my_data.cover_leave_t = nil
		end
	end
end)


-- Make groups move together (remove close to criminal check to avoid splitting groups)
function CopLogicTravel.chk_group_ready_to_move(data, my_data)
	local my_objective = data.objective
	if not my_objective.grp_objective or my_objective.type == "follow" then
		return true
	end

	local my_dis = mvec3_dis_sq(my_objective.area.pos, data.m_pos)
	if my_dis > 4000000 then
		return true
	end

	my_dis = my_dis * (1.15 ^ 2)
	for u_key, u_data in pairs(data.group.units) do
		if u_key ~= data.key then
			local his_objective = u_data.unit:brain():objective()
			if his_objective and his_objective.grp_objective == my_objective.grp_objective and not his_objective.in_place then
				if my_dis < mvec3_dis_sq(his_objective.area.pos, u_data.m_pos) then
					return false
				end
			end
		end
	end

	return true
end


-- Find a random fallback position in the nav segment if no covers are available
-- This is done to prevent enemies stacking in one spot if no positions next to walls are available
-- Also add different positioning for shield_cover groups, sticking close to and behind their follow units
local _get_exact_move_pos_original = CopLogicTravel._get_exact_move_pos
function CopLogicTravel._get_exact_move_pos(data, nav_index, ...)
	local my_data = data.internal_data

	if alive(data.objective.shield_cover_unit) then
		if my_data.moving_to_cover then
			managers.navigation:release_cover(my_data.moving_to_cover[1])
			my_data.moving_to_cover = nil
		end

		return CopLogicTravel._get_pos_behind_unit(data, data.objective.shield_cover_unit, 50, 300)
	end

	local to_pos = nil
	local coarse_path = my_data.coarse_path
	local total_nav_points = #coarse_path

	if total_nav_points <= nav_index then
		return _get_exact_move_pos_original(data, nav_index, ...)
	end

	local nav_seg = coarse_path[nav_index][1]
	local area = managers.groupai:state():get_area_from_nav_seg_id(nav_seg)
	local cover = managers.navigation:find_cover_in_nav_seg_1(area.nav_segs)

	if my_data.moving_to_cover then
		managers.navigation:release_cover(my_data.moving_to_cover[1])
		my_data.moving_to_cover = nil
	end

	if cover then
		managers.navigation:reserve_cover(cover, data.pos_rsrv_id)
		my_data.moving_to_cover = {
			cover
		}
		to_pos = cover[1]
	else
		to_pos = CopLogicTravel._get_pos_on_wall(managers.navigation:find_random_position_in_segment(nav_seg), 500)
	end

	return to_pos
end

local _determine_destination_occupation_original = CopLogicTravel._determine_destination_occupation
function CopLogicTravel._determine_destination_occupation(data, objective, ...)
	if objective.type ~= "defend_area" or objective.cover or objective.pos or data.kpr_keep_position then
		return _determine_destination_occupation_original(data, objective, ...)
	end

	local near_pos = objective.follow_unit and objective.follow_unit:movement():nav_tracker():field_position()
	local cover = CopLogicTravel._find_cover(data, objective.nav_seg, near_pos)
	if cover then
		return {
			type = "defend",
			seg = objective.nav_seg,
			cover = {
				cover
			},
			radius = objective.radius
		}
	else
		near_pos = CopLogicTravel._get_pos_on_wall(managers.navigation:find_random_position_in_segment(objective.nav_seg), 500)
		return {
			type = "defend",
			seg = objective.nav_seg,
			pos = near_pos,
			radius = objective.radius
		}
	end
end

function CopLogicTravel._get_pos_behind_unit(data, unit, min_dis, max_dis)
	local advancing = unit:brain() and unit:brain():is_advancing()
	local unit_movement = unit:movement()
	local unit_pos = advancing or unit_movement:m_pos()
	-- If target unit is advancing, add an offset so we don't run in front of it during advance
	local offset = advancing and mvec3_dis(advancing, unit_movement:m_pos()) * 0.5 or 0

	-- Get the threat direction
	if data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_AIM then
		mvec3_dir(tmp_vec1, data.attention_obj.m_pos, unit_pos)
	else
		mvec3_set(tmp_vec1, unit_movement.m_fwd and unit_movement:m_fwd() or unit_movement:m_head_rot():y())
		mvec3_neg(tmp_vec1)
	end

	-- Threat direction side
	mvec3_cross(tmp_vec2, tmp_vec1, math.UP)

	local fallback_pos
	local rays = 7
	local min_dis_sq = min_dis ^ 2
	local nav_manager = managers.navigation
	local ray_params = {
		allow_entry = false,
		trace = true,
		pos_from = unit_pos
	}
	local rsrv_desc = {
		false,
		40
	}

	repeat
		if math_random() < 0.5 then
			mvec3_neg(tmp_vec2)
		end

		-- Get a random vector between main threat direction and side threat direction
		local lerped = math.lerp(tmp_vec1, tmp_vec2, math_random() * 0.5)
		mvec3_normalize(lerped)
		mvec3_mul(lerped, offset + math_random(min_dis, max_dis))
		mvec3_add(lerped, unit_pos)

		ray_params.pos_to = lerped
		if not nav_manager:raycast(ray_params) or mvec3_dis_sq(ray_params.trace[1], unit_pos) > min_dis_sq then
			rsrv_desc.position = ray_params.trace[1]
			if nav_manager:is_pos_free(rsrv_desc) then
				return ray_params.trace[1]
			elseif not fallback_pos then
				fallback_pos = ray_params.trace[1]
			end
		end

		rays = rays - 1
	until rays <= 0

	return fallback_pos or unit_pos
end

function CopLogicTravel.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()
	if action_type == "walk" then
		local update = false
		local intermediate_complete = action._intermediate_action_complete
		local expired = action:expired() or intermediate_complete
		if not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
			update = true -- don't want to update travel logic for a walk action from a previous logic

			if expired or my_data.coarse_path_index <= #my_data.coarse_path - 2 and data.unit:movement():nav_tracker():nav_segment() == my_data.coarse_path[my_data.coarse_path_index + 1][1] then
				my_data.coarse_path_index = my_data.coarse_path_index + 1
			end
		end

		if not intermediate_complete then
			my_data.advancing = nil
		end

		if my_data.moving_to_cover then
			if expired then
				if my_data.best_cover then
					managers.navigation:release_cover(my_data.best_cover[1])
				end

				my_data.best_cover = my_data.moving_to_cover

				CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)

				local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
				my_data.best_cover[4] = high_ray
				my_data.in_cover = true
				local cover_wait_time = 5

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

		if not expired then
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

		if update then 
			if my_data.coarse_path_index >= #my_data.coarse_path then
				CopLogicTravel._on_destination_reached(data) -- we're at the destination, no need to wait for cover_wait_t or other things
			elseif intermediate_complete then
				CopLogicTravel._check_start_path_ahead(data)
			elseif data.logic.on_pathing_results then
				data.logic.on_pathing_results(data) -- update the logic, can't just call upd_advance as other logics re-use action_complete_clbk
			end
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

--chatter below
local killdapowa = {
	['e_so_pull_lever'] = true,
	['e_so_pull_lever_var2'] = true
}
local math_random = math.random
local react_aim = AIAttentionObject.REACT_AIM

Hooks:PostHook(CopLogicTravel, "upd_advance", "RR_upd_advance", function(data)
	local my_data = data.internal_data
	local chatter = data.char_tweak.chatter
	local focus_enemy = data.attention_obj
	if chatter and not data.is_converted and not data.unit:sound():speaking(data.t) and my_data.coarse_path and not my_data.warp_pos and not my_data.advancing and (not focus_enemy or react_aim > focus_enemy.reaction or not focus_enemy.verified_t or data.t - focus_enemy.verified_t > 5) then -- we're not speaking, not currently going to move anywhere and don't see any criminals
		local objective = data.objective
		if data.cool then -- don't try and play approachingspecial or clear lines if we're cool
			if chatter.clear_whisper then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "clear_whisper_1" or "clear_whisper_2") -- report in saying everything is good
			end
		elseif objective and objective.grp_objective and objective.grp_objective.type == "recon_area" then -- we want after the loot or the hostages
			local hostage_count = managers.groupai:state():hostage_count()
			if hostage_count > 0 then
				if hostage_count > 3 then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic2")
				elseif managers.groupai:state():chk_has_civilian_hostages() then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "civilianpanic")
				else
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic1")
				end
			elseif managers.groupai:state():chk_had_hostages() then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic3")
			end
		elseif chatter.approachingspecial then -- else we're going after the criminals, not the loot or hostages
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "approachingspecial") -- announce ourself to the criminals
		elseif chatter.clear then -- might be a good idea to also check whether there's a criminal in our current (maybe neighbours too) navsegment
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "clear") -- no criminals, clear!
			--log("clear!!")
		end
	end
end)

-- to ensure they play these lines as they start moving towards their final destination, to free a hostage for example
Hooks:PostHook(CopLogicTravel, "_chk_request_action_walk_to_advance_pos", "RR_chk_request_action_walk_to_advance_pos", function(data, my_data)
	local objective = data.objective
	if objective and not data.is_converted and not data.cool and not data.unit:sound():speaking(data.t) and not managers.skirmish:is_skirmish() and my_data.advancing and my_data.coarse_path and my_data.coarse_path_index and my_data.coarse_path_index >= #my_data.coarse_path - 1 then
		local chatter = data.char_tweak.chatter
		local grp_objective = objective.grp_objective
		if objective.chatter_type and chatter[objective.chatter_type] then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, objective.chatter_type)
		elseif grp_objective and grp_objective.chatter_type and chatter[grp_objective.chatter_type] then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, grp_objective.chatter_type)
		elseif objective.action and killdapowa[objective.action.variant] and chatter.sabotagepower then -- best way i can think of implementing this at the moment
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "sabotagepower")
		end
	end
end)

Hooks:PreHook(CopLogicTravel, "_on_destination_reached", "RR_on_destination_reached", function(data)
	local objective = data.objective
	local chatter = data.char_tweak.chatter
	if objective.type ~= "flee" and (not objective.grp_objective or objective.grp_objective.type ~= "retire") and chatter and (chatter.inpos or chatter.ready) and not data.is_converted and not data.cool and not data.unit:sound():speaking(data.t) then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "ready" or "inpos") -- Ready! / I'm in position!
	end
end)
