-- Disable "The Fixes" dozer walk fix, we have our own
if TheFixes then
	TheFixes.dozers_walk = false
end


-- Don't exit attack logic while chasing
function TankCopLogicAttack._chk_exit_attack_logic(data, ...)
	if not data.internal_data.walking_to_chase_pos then
		if not data.attention_obj or data.attention_obj.dis > 2000 or data.attention_obj.reaction < AIAttentionObject.REACT_COMBAT then
			CopLogicAttack._chk_exit_attack_logic(data, ...)
		end
	end
end


-- Update logic every frame and fix Dozers sprinting when they shouldn't
Hooks:PostHook(TankCopLogicAttack, "enter", "sh_enter", function (data)
	data.brain:set_update_enabled_state(true)
end)

function TankCopLogicAttack.update(data)
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	local focus_enemy = data.attention_obj
	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		CopLogicAttack._upd_enemy_detection(data, true)
		return
	end

	TankCopLogicAttack._process_pathing_results(data, my_data)

	local unit = data.unit
	if unit:movement():chk_action_forbidden("walk") or unit:anim_data().crouch and CopLogicAttack._chk_request_action_stand(data) then
		return
	end

	local enemy_visible = focus_enemy.verified
	if focus_enemy.reaction >= AIAttentionObject.REACT_COMBAT then
		-- Stop running if we're close enough
		if enemy_visible and focus_enemy.dis < 400 and unit:anim_data().run then
			unit:brain():action_request({
				body_part = 2,
				type = "idle"
			})
		end

		if my_data.walking_to_chase_pos then
			-- Check if the current chase pos is too far from our focus enemy and if so, cancel chase to get a better pos
			if my_data.chase_enemy and mvector3.distance_sq(my_data.walking_to_chase_pos:get_destination_pos(), my_data.chase_enemy.m_pos) > 1440000 then
				TankCopLogicAttack._cancel_chase_attempt(data, my_data)
			end
		elseif my_data.pathing_to_chase_pos then
		elseif my_data.chase_path then
			TankCopLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, enemy_visible and focus_enemy.dis < 800 and "walk" or "run")
		elseif my_data.chase_pos then
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
		elseif focus_enemy.nav_tracker then
			my_data.chase_pos = CopLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker, 1000)
			my_data.chase_enemy = focus_enemy
		end
	else
		TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	end
end

function TankCopLogicAttack.queued_update() end
function TankCopLogicAttack.queue_update() end