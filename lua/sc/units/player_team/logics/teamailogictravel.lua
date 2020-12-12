local mvec3_dist_sq = mvector3.distance_sq

function TeamAILogicTravel.check_inspire(data, attention)
	if not attention then
		return
	end

	local range_sq = 810000
	local pos = data.unit:position()
	local target = attention.unit:position()
	local dist = mvec3_dist_sq(pos, target)

	if dist < range_sq and not attention.unit:character_damage():arrested() then
		data.unit:brain():set_objective()
		data.unit:sound():say("f36x_any", true, false)

		local can_play_action = not data.unit:movement():chk_action_forbidden("action") and not data.unit:anim_data().reload and not data.internal_data.firing and not data.internal_data.shooting

		if can_play_action then
			local new_action = {
				variant = "cmd_get_up",
				align_sync = true,
				body_part = 3,
				type = "act"
			}

			if data.unit:brain():action_request(new_action) then
				data.internal_data.gesture_arrest = true
			end
		end

		local cooldown = managers.player:crew_ability_upgrade_value("crew_inspire", 360)

		managers.player:start_custom_cooldown("team", "crew_inspire", cooldown)
		TeamAILogicTravel.actually_revive(data, attention.unit, true)

		local skip_alert = managers.groupai:state():whisper_mode()

		if not skip_alert then
			local alert_rad = 500
			local new_alert = {
				"vo_cbt",
				data.unit:movement():m_head_pos(),
				alert_rad,
				data.SO_access,
				data.unit
			}

			managers.groupai:state():propagate_alert(new_alert)
		end
	end
end

function TeamAILogicTravel._upd_enemy_detection(data)
	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local max_reaction = nil

	if data.cool then
		max_reaction = AIAttentionObject.REACT_SURPRISED
	end

	local delay = CopLogicBase._upd_attention_obj_detection(data, AIAttentionObject.REACT_CURIOUS, max_reaction)
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data.detected_attention_objects, nil)

	TeamAILogicBase._set_attention_obj(data, new_attention, new_reaction)
	TeamAILogicIdle.check_idle_reload(data, new_reaction)

	if new_attention then
		local objective = data.objective
		local allow_trans, obj_failed = nil
		local dont_exit = false

		if data.unit:movement():chk_action_forbidden("walk") and not data.unit:anim_data().act_idle then
			dont_exit = true
		else
			allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, new_attention)
		end

		if obj_failed and not dont_exit then
			if objective.type == "follow" then
				debug_pause_unit(data.unit, "failing follow", allow_trans, obj_failed, inspect(objective))
			end

			data.objective_failed_clbk(data.unit, data.objective)

			return
		end
	end
	
	CopLogicAttack._upd_aim(data, my_data)
	
	if data.objective and data.objective.type == "follow" and data.objective.taserrescue then
		if not alive(data.objective.follow_unit) then
			data.objective_complete_clbk(data.unit, data.objective)
		elseif data.objective.follow_unit:character_damage():dead() then
			data.objective_complete_clbk(data.unit, data.objective)
		end
	end

	if not my_data._intimidate_chk_t or my_data._intimidate_chk_t + 0.5 < data.t then
		if not data.unit:brain()._intimidate_t or data.unit:brain()._intimidate_t + 2 < data.t then
			my_data._intimidate_chk_t = data.t

			if data.unit:movement()._should_stay then
				local can_turn = nil

				if not my_data._turning_to_intimidate_t or my_data._turning_to_intimidate_t + 2 < data.t then
					if not data.unit:movement():chk_action_forbidden("turn") then
						if not new_prio_slot or new_prio_slot > 5 then
							can_turn = true
						end
					end
				end

				local shout_angle = can_turn and 180 or 90
				local shout_distance = 1200
				local civ = TeamAILogicIdle.find_civilian_to_intimidate(data.unit, shout_angle, shout_distance)

				if civ then
					if can_turn and CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, civ:movement():m_pos()) then
						my_data._turning_to_intimidate_t = data.t
					else
						if TeamAILogicIdle.intimidate_civilians(data, data.unit, true, true) then
							data.unit:brain()._intimidate_t = data.t
						end
					end
				end
			else
				local civ = TeamAILogicIdle.intimidate_civilians(data, data.unit, true, true)

				if civ then
					data.unit:brain()._intimidate_t = data.t

					if not data.attention_obj then
						CopLogicBase._set_attention_on_unit(data, civ)

						local key = "RemoveAttentionOnUnit" .. tostring(data.key)

						CopLogicBase.queue_task(my_data, key, TeamAILogicTravel._remove_enemy_attention, {
							data = data,
							target_key = civ:key()
						}, data.t + 1.5)
					end
				end
			end
		end
	end

	TeamAILogicAssault._chk_request_combat_chatter(data, my_data)
	TeamAILogicIdle._upd_sneak_spotting(data, my_data)
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TeamAILogicTravel._upd_enemy_detection, data, data.t + delay)
end

function TeamAILogicTravel.update(data)
	if data.objective.type == "revive" and managers.player:is_custom_cooldown_not_active("team", "crew_inspire") then
		local attention = data.detected_attention_objects[data.objective.follow_unit:key()]

		TeamAILogicTravel.check_inspire(data, attention)
	end

	if data.objective and data.objective.type == "follow" and data.objective.taserrescue and not data.objective.pos then
		local pos = CopLogicTravel._get_pos_on_wall(data.objective.follow_unit:movement():nav_tracker():field_position(), 800, nil, true)
		
		if pos then
			data.objective.pos = pos
		end
	end

	return CopLogicTravel.upd_advance(data)
end