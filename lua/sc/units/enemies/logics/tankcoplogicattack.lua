-- Disable "The Fixes" dozer walk fix, we have our own
if TheFixes then
	TheFixes.dozers_walk = false
end


-- Check if the current chase pos is too far from our focus enemy and if so, cancel chase to get a better pos
Hooks:PreHook(TankCopLogicAttack, "queued_update", "sh_queued_update", function (data)
	local my_data = data.internal_data
	local focus_enemy = data.attention_obj
	if my_data.walking_to_chase_pos and focus_enemy then
		if mvector3.distance_sq(my_data.walking_to_chase_pos:get_destination_pos(), focus_enemy.m_pos) > 1440000 then
			TankCopLogicAttack._cancel_chase_attempt(data, my_data)
		end
	end
end)


-- Rearrange some pathing code to allow updated pathing in one function call and fix Dozers sprinting when they shouldn't
function TankCopLogicAttack.update(data)
	local t = data.t
	local unit = data.unit
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
		CopLogicAttack._upd_enemy_detection(data, true)
		if my_data ~= data.internal_data or not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
			return
		end
	end

	TankCopLogicAttack._process_pathing_results(data, my_data)

	if unit:movement():chk_action_forbidden("walk") then
		return
	end

	if unit:anim_data().crouch and CopLogicAttack._chk_request_action_stand(data) then
		return
	end

	local focus_enemy = data.attention_obj
	local enemy_visible = focus_enemy.verified
	local engage = my_data.attitude == "engage"
	local z_dist = math.abs(data.m_pos.z - focus_enemy.m_pos.z)
	local walk = focus_enemy.verified_dis < (focus_enemy.verified and 800 or 300)
	local chase

	if AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		if enemy_visible then
			chase = z_dist < 300 or focus_enemy.verified_dis > 2000 or engage and focus_enemy.verified_dis > 500

			if walk and unit:anim_data().run then
				unit:brain():action_request({
					body_part = 2,
					type = "idle"
				})
			end
		else
			chase = z_dist < 300 or focus_enemy.verified_dis > 2000 or engage and (not focus_enemy.verified_t or t - focus_enemy.verified_t > 5 or focus_enemy.verified_dis > 700)
		end
	end

	if chase then
		if my_data.walking_to_chase_pos or my_data.pathing_to_chase_pos then
			return
		elseif not my_data.chase_path then
			-- Reorder some of these conditions so that they can be executed in the same function call instead of waiting for the next queued update
			if not my_data.chase_pos and focus_enemy.nav_tracker then
				my_data.chase_pos = CopLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker, 1000)
			end

			if my_data.chase_pos then
				local from_pos = unit:movement():nav_tracker():field_position()
				local to_pos = my_data.chase_pos

				my_data.chase_pos = nil

				-- Check if direct path is possible
				if math.abs(from_pos.z - to_pos.z) < 100 and not managers.navigation:raycast({allow_entry = false, pos_from = from_pos, pos_to = to_pos}) then
					my_data.chase_path = {
						mvector3.copy(from_pos),
						to_pos
					}
				else
					my_data.chase_path_search_id = tostring(unit:key()) .. "chase"
					my_data.pathing_to_chase_pos = true
					data.brain:add_pos_rsrv("path", {
						radius = 60,
						position = mvector3.copy(to_pos)
					})
					unit:brain():search_for_path(my_data.chase_path_search_id, to_pos)
				end
			end
		end

		if my_data.chase_path then
			-- Fix incorrect path starting position
			CopLogicAttack._correct_path_start_pos(data, my_data.chase_path)
			TankCopLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, walk and "walk" or "run")
		end
	else
		TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	end
end
