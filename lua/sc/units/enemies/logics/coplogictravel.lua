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
	CopLogicTravel.upd_advance(data)
end


-- Sanity check for rare follow_unit crash
Hooks:PreHook(CopLogicTravel, "_begin_coarse_pathing", "sh__begin_coarse_pathing", function (data)
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

	if data.group and data.tactics and data.tactics.shield_cover and alive(data.objective.follow_unit) then
		if my_data.moving_to_cover then
			managers.navigation:release_cover(my_data.moving_to_cover[1])
			my_data.moving_to_cover = nil
		end

		return CopLogicTravel._get_pos_behind_unit(data, data.objective.follow_unit, 50, 300)
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
	local unit_pos = advancing or unit:movement():m_pos()
	-- If target unit is advancing, add an offset so we don't run in front of it during advance
	local offset = advancing and mvec3_dis(advancing, unit:movement():m_pos()) * 0.5 or 0

	-- Get the threat direction
	if data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_AIM then
		mvec3_dir(tmp_vec1, data.attention_obj.m_pos, unit_pos)
	else
		mvec3_set(tmp_vec1, unit:movement():m_fwd())
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


-- Take the direct path if possible and immediately start pathing instead of waiting for the next update (thanks to RedFlame)
function CopLogicTravel._check_start_path_ahead(data)
	local my_data = data.internal_data

	if my_data.processing_advance_path then
		return
	end

	local coarse_path = my_data.coarse_path
	local next_index = my_data.coarse_path_index + 2
	local total_nav_points = #coarse_path

	if next_index > total_nav_points then
		return
	end

	local to_pos = data.logic._get_exact_move_pos(data, next_index)
	local from_pos = data.pos_rsrv.move_dest.position

	if math_abs(from_pos.z - to_pos.z) < 100 and not managers.navigation:raycast({allow_entry = false, pos_from = from_pos, pos_to = to_pos}) then
		my_data.advance_path = {
			mvec3_copy(from_pos),
			to_pos
		}

		return
	end

	my_data.processing_advance_path = true
	local prio = data.logic.get_pathing_prio(data)
	local nav_segs = CopLogicTravel._get_allowed_travel_nav_segs(data, my_data, to_pos)

	data.unit:brain():search_for_path_from_pos(my_data.advance_path_search_id, from_pos, to_pos, prio, nil, nav_segs)
end

function CopLogicTravel._chk_start_pathing_to_next_nav_point(data, my_data)
	if not CopLogicTravel.chk_group_ready_to_move(data, my_data) then
		return
	end

	local from_pos = data.unit:movement():nav_tracker():field_position()
	local to_pos = CopLogicTravel._get_exact_move_pos(data, my_data.coarse_path_index + 1)

	if math_abs(from_pos.z - to_pos.z) < 100 and not managers.navigation:raycast({allow_entry = false, pos_from = from_pos, pos_to = to_pos}) then
		my_data.advance_path = {
			mvec3_copy(from_pos),
			to_pos
		}

		-- If we don't have to wait for the pathing results, immediately start advancing
		CopLogicTravel._chk_begin_advance(data, my_data)
		if my_data.advancing and my_data.path_ahead then
			CopLogicTravel._check_start_path_ahead(data)
		end

		return
	end

	my_data.processing_advance_path = true
	local prio = data.logic.get_pathing_prio(data)
	local nav_segs = CopLogicTravel._get_allowed_travel_nav_segs(data, my_data, to_pos)

	data.unit:brain():search_for_path(my_data.advance_path_search_id, to_pos, prio, nil, nav_segs)
end
