function TaserLogicAttack.queued_update(data)
	local my_data = data.internal_data

	TaserLogicAttack._upd_enemy_detection(data)
	
	if my_data ~= data.internal_data then
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	elseif not data.attention_obj then
		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0)
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	if my_data.has_old_action then
		TaserLogicAttack._upd_stop_old_action(data, my_data)
		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0)

		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	TaserLogicAttack._update_cover(data)

	local t = TimerManager:game():time()
	data.t = t
	local unit = data.unit
	local objective = data.objective
	local focus_enemy = data.attention_obj
	local action_taken = my_data.turning or data.unit:movement():chk_action_forbidden("walk") or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.acting

	if my_data.tasing then
		action_taken = action_taken or TaserLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_enemy.m_pos)

		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0)
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	TaserLogicAttack._process_pathing_results(data, my_data)

	if AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		TaserLogicAttack._update_cover(data)
		TaserLogicAttack._upd_combat_movement(data)
	end

	CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0) --update asap
	CopLogicBase._report_detections(data.detected_attention_objects)
end

function TaserLogicAttack._upd_aim(data, my_data, reaction)
	local shoot, aim = nil
	local focus_enemy = data.attention_obj
	local tase = reaction == AIAttentionObject.REACT_SPECIAL_ATTACK

	if focus_enemy then
		if tase then
			shoot = true
		elseif focus_enemy.verified then
			if focus_enemy.verified_dis > 1500 then
				shoot = true
				if focus_enemy.verified_dis > 1500 and data.unit:anim_data().run then
					local walk_to_pos = data.unit:movement():get_walk_to_pos()

					if walk_to_pos then
						local move_vec = walk_to_pos - data.m_pos
						local enemy_vec = focus_enemy.m_pos - data.m_pos

						mvector3.normalize(enemy_vec)

						if mvector3.dot(enemy_vec, move_vec) < 0.6 then
							shoot = nil
						end
					end
				end
			end
		elseif focus_enemy.verified_t and data.t - focus_enemy.verified_t < 10 then
			aim = true

			if my_data.shooting and data.t - focus_enemy.verified_t < 3 then
				shoot = true
			end
		elseif focus_enemy.verified_dis <= 1500 and my_data.walking_to_cover_shoot_pos then
			aim = true
		end
	end
	
	local is_moving = my_data.walking_to_cover_shoot_pos or my_data.moving_to_cover or data.unit:anim_data().run or data.unit:anim_data().move
	if tase and is_moving and not data.unit:movement():chk_action_forbidden("walk") then
		local new_action = {
			body_part = 2,
			type = "idle"
		}

		data.unit:brain():action_request(new_action)
	end

	if focus_enemy and data.logic.chk_should_turn(data, my_data) then
		local enemy_pos = (focus_enemy.verified or focus_enemy.nearly_visible) and focus_enemy.m_pos or focus_enemy.verified_pos

		TaserLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, enemy_pos)
	end

	if aim or shoot then
		if focus_enemy.verified then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)

				my_data.attention_unit = focus_enemy.u_key
			end
		elseif my_data.attention_unit ~= focus_enemy.verified_pos then
			CopLogicBase._set_attention_on_pos(data, mvector3.copy(focus_enemy.verified_pos))

			my_data.attention_unit = mvector3.copy(focus_enemy.verified_pos)
		end
		
		local nottasingortargetwrong = not my_data.tasing or my_data.tasing.target_u_data ~= focus_enemy
		
		if not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			if tase then
				if nottasingortargetwrong and not data.unit:movement():chk_action_forbidden("walk") and not focus_enemy.unit:movement():zipline_unit() then
					if my_data.attention_unit ~= focus_enemy.u_key then
						CopLogicBase._set_attention(data, focus_enemy)

						my_data.attention_unit = focus_enemy.u_key
					end

					local tase_action = {
						body_part = 3,
						type = "tase"
					}

					if data.unit:brain():action_request(tase_action) then
						my_data.tasing = {
							target_u_data = focus_enemy,
							target_u_key = focus_enemy.u_key,
							start_t = data.t
						}

						TaserLogicAttack._cancel_charge(data, my_data)
						managers.groupai:state():on_tase_start(data.key, focus_enemy.u_key)
					end
				end
			elseif shoot and not my_data.shooting then
				local shoot_action = {
					type = "shoot",
					body_part = 3
				}

				if data.unit:brain():action_request(shoot_action) then
					my_data.shooting = true
				end
			end
		end
	else
		if my_data.shooting or my_data.tasing then
			local new_action = {
				body_part = 3,
				type = "idle"
			}
			
			if not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
				data.unit:brain():action_request(new_action)
			end
		elseif not data.unit:anim_data().run then
			local ammo_max, ammo = data.unit:inventory():equipped_unit():base():ammo_info()

			if ammo / ammo_max < 0.05 then
				local new_action = {
					body_part = 3,
					type = "reload"
				}

				data.unit:brain():action_request(new_action)
			end
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)

			my_data.attention_unit = nil
		end
	end

	TaserLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end

function TaserLogicAttack._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_AIM
	
	CopLogicBase._upd_attention_obj_detection(data, min_reaction, nil)

	local tasing = my_data.tasing
	local tased_u_key = tasing and tasing.target_u_key
	local tase_in_effect = nil

	if tasing then
		if data.unit:movement()._active_actions[3] and data.unit:movement()._active_actions[3]:type() == "tase" then
			local tase_action = data.unit:movement()._active_actions[3]

			if tase_action._discharging or tase_action._firing_at_husk or tase_action._discharging_on_husk then
				tase_in_effect = true
			end
		end
	end

	if tase_in_effect then
		return
	end

	local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, TaserLogicAttack._chk_reaction_to_attention_object)
	local old_att_obj = data.attention_obj

	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
	TaserLogicAttack._chk_exit_attack_logic(data, new_reaction)

	if my_data ~= data.internal_data then
		return
	end

	if new_attention then
		if old_att_obj then
			if old_att_obj.u_key ~= new_attention.u_key then
				TaserLogicAttack._cancel_charge(data, my_data)

				if not data.unit:movement():chk_action_forbidden("walk") then
					TaserLogicAttack._cancel_walking_to_cover(data, my_data)
				end

				TaserLogicAttack._set_best_cover(data, my_data, nil)
				--TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, new_attention)
			end
		else
			--TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, new_attention)
		end
	elseif old_att_obj then
		TaserLogicAttack._cancel_charge(data, my_data)
	end

	TaserLogicAttack._upd_aim(data, my_data, new_reaction)
end

function TaserLogicAttack._chk_reaction_to_attention_object(data, attention_data, stationary)
	local reaction = CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, stationary)
	local tase_length = data.internal_data.tase_distance or 1500

	if reaction < AIAttentionObject.REACT_SHOOT or not attention_data.criminal_record or not attention_data.is_person then
		return reaction
	end

	if attention_data.verified and attention_data.verified_dis <= tase_length then
		if not data.internal_data.tasing or data.internal_data.tasing.target_u_key ~= attention_data.u_key then
			if attention_data.unit:movement() and attention_data.unit:movement().tased and attention_data.unit:movement():tased() then
				return AIAttentionObject.REACT_COMBAT
			end
		end

		if attention_data.is_human_player then
			if not attention_data.unit:movement():is_taser_attack_allowed() then
				return AIAttentionObject.REACT_COMBAT
			end
		elseif attention_data.unit:movement():chk_action_forbidden("hurt") then
			return AIAttentionObject.REACT_COMBAT
		end

		local obstructed = data.unit:raycast("ray", data.unit:movement():m_head_pos(), attention_data.m_head_pos, "slot_mask", managers.slot:get_mask("world_geometry", "vehicles", "enemy_shield_check"), "sphere_cast_radius", 5, "report")

		if obstructed then
			return AIAttentionObject.REACT_COMBAT
		else
			return AIAttentionObject.REACT_SPECIAL_ATTACK
		end
	end

	return reaction
end

function TaserLogicAttack._cancel_tase_attempt(data, my_data)
	if my_data.tasing then
		local new_action = {
			body_part = 3,
			type = "idle"
		}

		local res = data.unit:brain():action_request(new_action)
		if res then
			my_data.tasing = nil
		end
	end
end

function TaserLogicAttack.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()
	
	if action_type == "healed" then
		TaserLogicAttack._cancel_cover_pathing(data, my_data)
		TaserLogicAttack._cancel_charge(data, my_data)
	
		if not data.unit:character_damage():dead() and action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			TaserLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "heal" then
		TaserLogicAttack._cancel_cover_pathing(data, my_data)
		TaserLogicAttack._cancel_charge(data, my_data)
	
		if not data.unit:character_damage():dead() and action:expired() then
			--log("hey this actually works!")
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			TaserLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "walk" then
		my_data.advancing = nil
		my_data.flank_cover = nil
		TaserLogicAttack._cancel_cover_pathing(data, my_data)
		TaserLogicAttack._cancel_charge(data, my_data)
		TaserLogicAttack._cancel_tase_attempt(data, my_data)
		if my_data.has_retreated and managers.groupai:state():chk_active_assault_break() then
			my_data.in_retreat_pos = true
		elseif my_data.surprised then
			my_data.surprised = false
		elseif my_data.moving_to_cover then
			if action:expired() then
				my_data.in_cover = my_data.moving_to_cover
				my_data.cover_enter_t = data.t
			end

			my_data.moving_to_cover = nil
		elseif my_data.walking_to_cover_shoot_pos then
			my_data.walking_to_cover_shoot_pos = nil
			my_data.at_cover_shoot_pos = true
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "tase" then
		if action:expired() and my_data.tasing then
			local record = managers.groupai:state():criminal_record(my_data.tasing.target_u_key)

			if record and record.status then
				data.tase_delay_t = TimerManager:game():time() + 45
			end
		end
		
		if my_data.tasing then
			managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)
		end

		my_data.tasing = nil
		
		if action:expired() and not my_data.tasing then
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			TaserLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "reload" then
		--Removed the requirement for being important here.
		if action:expired() then
			TaserLogicAttack._cancel_tase_attempt(data, my_data)
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
		end
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "act" then
		--TaserLogicAttack._cancel_cover_pathing(data, my_data)
		--TaserLogicAttack._cancel_charge(data, my_data)
		
		--Fixed panic never waking up cops.
		if action:expired() then
			TaserLogicAttack._cancel_tase_attempt(data, my_data)
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
		end
	elseif action_type == "hurt" then
		TaserLogicAttack._cancel_cover_pathing(data, my_data)
		TaserLogicAttack._cancel_charge(data, my_data)
		
		--Removed the requirement for being important here.
		if action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
			TaserLogicAttack._cancel_tase_attempt(data, my_data)
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
		end
	elseif action_type == "dodge" then
		local timeout = action:timeout()

		if timeout then
			data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
		end

		TaserLogicAttack._cancel_cover_pathing(data, my_data)

		if action:expired() then
			TaserLogicAttack._cancel_tase_attempt(data, my_data)
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
		end
	end
end

function TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, focus_enemy)
end