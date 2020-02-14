if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function SpoocLogicAttack._upd_enemy_detection(data, is_synchronous)
		managers.groupai:state():on_unit_detection_updated(data.unit)

		data.t = TimerManager:game():time()
		local my_data = data.internal_data
		local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
		local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, SpoocLogicAttack._chk_reaction_to_attention_object)
		local old_att_obj = data.attention_obj

		CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
		data.logic._chk_exit_attack_logic(data, new_reaction)

		if my_data ~= data.internal_data then
			return
		end

		if new_attention then
			if old_att_obj and old_att_obj.u_key ~= new_attention.u_key then
				CopLogicAttack._cancel_charge(data, my_data)

				my_data.flank_cover = nil

				if not data.unit:movement():chk_action_forbidden("walk") then
					CopLogicAttack._cancel_walking_to_cover(data, my_data)
				end

				CopLogicAttack._set_best_cover(data, my_data, nil)
			end
		elseif old_att_obj then
			CopLogicAttack._cancel_charge(data, my_data)

			my_data.flank_cover = nil
		end

		CopLogicBase._chk_call_the_police(data)

		if my_data ~= data.internal_data then
			return
		end

		SpoocLogicAttack._upd_aim(data, my_data)
		SpoocLogicAttack._upd_spooc_attack(data, my_data)
		data.logic._upd_stance_and_pose(data, data.internal_data, objective)

		if not is_synchronous then
			CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, delay and data.t + delay, data.important and true)
		end

		CopLogicBase._report_detections(data.detected_attention_objects)
	end

	function SpoocLogicAttack._chk_reaction_to_attention_object(data, attention_data, stationary)
		local reaction = CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, stationary)

		if reaction < AIAttentionObject.REACT_SHOOT or not attention_data.criminal_record or attention_data.criminal_record.status or not attention_data.is_person then
			return reaction
		end

		if attention_data.verified then
			if attention_data.verified_dis > 1500 then
				return AIAttentionObject.REACT_COMBAT
			end

			if attention_data.is_human_player then
				if attention_data.unit:movement().zipline_unit and attention_data.unit:movement():zipline_unit() then
					return AIAttentionObject.REACT_COMBAT
				end
			elseif attention_data.unit:movement():chk_action_forbidden("hurt") then
				return AIAttentionObject.REACT_COMBAT
			end

			if SpoocLogicAttack._is_last_standing_criminal(attention_data) then
				return AIAttentionObject.REACT_COMBAT
			end

			if not attention_data.unit:movement().is_SPOOC_attack_allowed or not attention_data.unit:movement():is_SPOOC_attack_allowed() then
				return AIAttentionObject.REACT_COMBAT
			end

			return AIAttentionObject.REACT_SPECIAL_ATTACK
		end

		return reaction
	end

	function SpoocLogicAttack.action_complete_clbk(data, action)
		local my_data = data.internal_data
		local action_type = action:type()

		if action_type == "walk" then
			my_data.advancing = nil
			my_data.flank_cover = nil
			CopLogicAttack._cancel_cover_pathing(data, my_data)
			CopLogicAttack._cancel_charge(data, my_data)
			if my_data.surprised then
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

			managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)

			my_data.tasing = nil
		elseif action_type == "spooc" then
			data.spooc_attack_timeout_t = TimerManager:game():time() + math.lerp(data.char_tweak.spooc_attack_timeout[1], data.char_tweak.spooc_attack_timeout[2], math.random())

			if action:complete() and data.char_tweak.spooc_attack_use_smoke_chance > 0 and math.random() <= data.char_tweak.spooc_attack_use_smoke_chance and not managers.groupai:state():is_smoke_grenade_active() then
				managers.groupai:state():detonate_smoke_grenade(data.m_pos + math.UP * 10, data.unit:movement():m_head_pos(), math.lerp(15, 30, math.random()), false)
			end
			
			if action:expired() then
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
				SpoocLogicAttack._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, data.internal_data)
				SpoocLogicAttack._upd_combat_movement(data)
			end

			my_data.spooc_attack = nil
		elseif action_type == "reload" then
			--Removed the requirement for being important here.
			if action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
				data.logic._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, data.internal_data)
			end
		elseif action_type == "turn" then
			my_data.turning = nil
		elseif action_type == "act" then
			--CopLogicAttack._cancel_cover_pathing(data, my_data)
			--CopLogicAttack._cancel_charge(data, my_data)
			
			--Fixed panic never waking up cops.
			if action:expired() then
				SpoocLogicAttack._upd_aim(data, my_data)
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
				data.logic._upd_stance_and_pose(data, data.internal_data)
				SpoocLogicAttack._upd_combat_movement(data)
			end
		elseif action_type == "hurt" then
			CopLogicAttack._cancel_cover_pathing(data, my_data)
			CopLogicAttack._cancel_charge(data, my_data)
			
			--Removed the requirement for being important here.
			if action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
				data.logic._upd_aim(data, my_data)
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
				data.logic._upd_stance_and_pose(data, data.internal_data)
				SpoocLogicAttack._upd_combat_movement(data)
			end
		elseif action_type == "dodge" then
			local timeout = action:timeout()

			if timeout then
				data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
			end

			CopLogicAttack._cancel_cover_pathing(data, my_data)

			if action:expired() then
				SpoocLogicAttack._upd_aim(data, my_data)
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
				data.logic._upd_stance_and_pose(data, data.internal_data)
				SpoocLogicAttack._upd_combat_movement(data)
			end
		end
	end
	
end