function SpoocLogicAttack.queued_update(data)
	local t = TimerManager:game():time()
	data.t = t
	local unit = data.unit
	local my_data = data.internal_data

	if my_data.spooc_attack then
		
		if data.internal_data == my_data then
			CopLogicBase._report_detections(data.detected_attention_objects)
			SpoocLogicAttack.queue_update(data, my_data)
		end

		return
	end

	if my_data.has_old_action then
		SpoocLogicAttack._upd_stop_old_action(data, my_data)
		SpoocLogicAttack.queue_update(data, my_data)

		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	if my_data.wants_stop_old_walk_action then
		if not data.unit:anim_data().to_idle and not data.unit:movement():chk_action_forbidden("walk") then
			data.unit:movement():action_request({
				body_part = 2,
				type = "idle"
			})

			my_data.wants_stop_old_walk_action = nil
		end

		SpoocLogicAttack.queue_update(data, my_data)

		return
	end

	SpoocLogicAttack._process_pathing_results(data, my_data)

	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
		SpoocLogicAttack._upd_enemy_detection(data, true)

		if my_data ~= data.internal_data or not data.attention_obj then
			return
		end
	end

	SpoocLogicAttack._upd_spooc_attack(data, my_data)

	if my_data.spooc_attack then
		SpoocLogicAttack.queue_update(data, my_data)

		return
	end

	if AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		my_data.want_to_take_cover = SpoocLogicAttack._chk_wants_to_take_cover(data, my_data)

		SpoocLogicAttack._update_cover(data)
		SpoocLogicAttack._upd_combat_movement(data)
	end

	SpoocLogicAttack.queue_update(data, my_data)
	CopLogicBase._report_detections(data.detected_attention_objects)
end

function SpoocLogicAttack._upd_spooc_attack(data, my_data)

	if not my_data then
		return
	end

	if my_data.spooc_attack then
		return
	end

	if not data.is_converted and data.spooc_attack_timeout_t and data.spooc_attack_timeout_t >= data.t then
		return
	end

	local focus_enemy = data.attention_obj

	if focus_enemy and focus_enemy.nav_tracker and focus_enemy.is_person and AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction and not data.unit:movement():chk_action_forbidden("walk") then
		if focus_enemy.criminal_record then
			if focus_enemy.criminal_record.status then
				return
			else
				if SpoocLogicAttack._is_last_standing_criminal(focus_enemy) then
					return
				end
			end
		end

		if focus_enemy.unit:movement().zipline_unit and focus_enemy.unit:movement():zipline_unit() then
			return
		end

		if focus_enemy.unit:movement().is_SPOOC_attack_allowed and not focus_enemy.unit:movement():is_SPOOC_attack_allowed() then
			return
		end

		if focus_enemy.unit:movement().chk_action_forbidden and focus_enemy.unit:movement():chk_action_forbidden("hurt") then
			return true
		end

		if focus_enemy.verified and focus_enemy.verified_dis <= 2500 and ActionSpooc.chk_can_start_spooc_sprint(data.unit, focus_enemy.unit) and not data.unit:raycast("ray", data.unit:movement():m_head_pos(), focus_enemy.m_head_pos, "slot_mask", managers.slot:get_mask("bullet_impact_targets_no_criminals"), "ignore_unit", focus_enemy.unit, "report") then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)

				my_data.attention_unit = focus_enemy.u_key
			end

			local action = SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data)

			if action then
				my_data.spooc_attack = {
					start_t = data.t,
					target_u_data = focus_enemy,
					action = action
				}

				return true
			end
		end

		if ActionSpooc.chk_can_start_flying_strike(data.unit, focus_enemy.unit) then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)

				my_data.attention_unit = focus_enemy.u_key
			end

			local action = SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data, true)

			if action then
				my_data.spooc_attack = {
					start_t = data.t,
					target_u_data = focus_enemy,
					action = action
				}

				return true
			end
		end
	end
end

function SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data, flying_strike)
	data.unit:movement():set_stance_by_code(2)

	local new_action = {
		body_part = 3,
		type = "idle"
	}

	data.unit:brain():action_request(new_action)

	local new_action_data = {
		body_part = 1,
		type = "spooc",
		flying_strike = flying_strike
	}

	if flying_strike then
		new_action_data.blocks = {
			light_hurt = -1,
			heavy_hurt = -1,
			idle = -1,
			turn = -1,
			fire_hurt = -1,
			walk = -1,
			act = -1,
			hurt = -1,
			expl_hurt = -1,
			taser_tased = -1
		}
	end

	local action = data.unit:brain():action_request(new_action_data)

	return action
end

function SpoocLogicAttack.queue_update(data, my_data)
	my_data.update_queued = true
	
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, SpoocLogicAttack.queued_update, data, data.t + 0)
end

function SpoocLogicAttack.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()
	
	if action_type == "healed" then
		SpoocLogicAttack._cancel_cover_pathing(data, my_data)
		SpoocLogicAttack._cancel_charge(data, my_data)
	
		if action:expired() then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			SpoocLogicAttack._upd_spooc_attack(data)
		end
	elseif action_type == "heal" then
		SpoocLogicAttack._cancel_cover_pathing(data, my_data)
		SpoocLogicAttack._cancel_charge(data, my_data)
	
		if action:expired() then
			--log("hey this actually works!")
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			SpoocLogicAttack._upd_spooc_attack(data)
		end
	elseif action_type == "walk" then
		my_data.advancing = nil
		if my_data.flank_cover then
			my_data.taking_flank_cover = true
		end
		my_data.flank_cover = nil
		SpoocLogicAttack._cancel_cover_pathing(data, my_data)
		SpoocLogicAttack._cancel_charge(data, my_data)
		if my_data.has_retreated and managers.groupai:state():chk_active_assault_break() then
			my_data.in_retreat_pos = true
		elseif my_data.surprised then
			my_data.surprised = false
		elseif my_data.moving_to_cover then
			if action:expired() then
				if my_data.taking_flank_cover then
					my_data.taken_flank_cover = true
				end
				my_data.taking_flank_cover = nil
				my_data.in_cover = my_data.moving_to_cover
				my_data.cover_enter_t = data.t
			end

			my_data.moving_to_cover = nil
		elseif my_data.walking_to_cover_shoot_pos then
			my_data.walking_to_cover_shoot_pos = nil
			my_data.at_cover_shoot_pos = true
		end
		
		if action:expired() then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end
		
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "tase" then
		if action:expired() and my_data.tasing then
			local record = managers.groupai:state():criminal_record(my_data.tasing.target_u_key)

			if record and record.status then
				data.tase_delay_t = TimerManager:game():time() + 45
			end
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
		end

		managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)

		my_data.tasing = nil
	elseif action_type == "spooc" then
		data.spooc_attack_timeout_t = TimerManager:game():time() + math.lerp(data.char_tweak.spooc_attack_timeout[1], data.char_tweak.spooc_attack_timeout[2], math.random())

		if action:complete() and data.char_tweak.spooc_attack_use_smoke_chance and data.char_tweak.spooc_attack_use_smoke_chance > 0 and math.random() <= data.char_tweak.spooc_attack_use_smoke_chance and not managers.groupai:state():is_smoke_grenade_active() then
			managers.groupai:state():detonate_smoke_grenade(data.m_pos + math.UP * 10, data.unit:movement():m_head_pos(), math.lerp(15, 30, math.random()), false)
		end
		
		if action:expired() then
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end

		my_data.spooc_attack = nil
	elseif action_type == "reload" then
		--Removed the requirement for being important here.
		if action:expired() then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end
	elseif action_type == "turn" then
		if action:expired() then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end
		
		my_data.turning = nil
	elseif action_type == "hurt" then
		SpoocLogicAttack._cancel_cover_pathing(data, my_data)
		SpoocLogicAttack._cancel_charge(data, my_data)
		
		--Removed the requirement for being important here.
		if action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end
		
	elseif action_type == "dodge" then
		local timeout = action:timeout()

		if timeout then
			data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
		end

		SpoocLogicAttack._cancel_cover_pathing(data, my_data)
		SpoocLogicAttack._cancel_charge(data, my_data)
		
		if action:expired() then
			SpoocLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			--SpoocLogicAttack._upd_combat_movement(data)
			SpoocLogicAttack._upd_spooc_attack(data, my_data)
		end
	end
end