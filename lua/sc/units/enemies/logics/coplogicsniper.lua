-- Make snipers always aim if they have a target
function CopLogicSniper._upd_aim(data, my_data)
	local focus_enemy = data.attention_obj
	local expected_pos = focus_enemy and (focus_enemy.last_verified_pos or focus_enemy.verified_pos)
	local aim = expected_pos and focus_enemy.reaction >= AIAttentionObject.REACT_AIM
	local shoot = focus_enemy and focus_enemy.verified and focus_enemy.reaction >= AIAttentionObject.REACT_SHOOT
	local anim_data = data.unit:anim_data()

	if not my_data.advancing and not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") then
		local can_crouch = anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch)
		local can_stand = anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand)

		if anim_data.reload or data.is_suppressed then
			if can_crouch then
				CopLogicAttack._chk_request_action_crouch(data)
			end
		elseif focus_enemy then
			if focus_enemy.verified then
				if my_data.attitude == "engage" or my_data.wanted_pose == "stand" then
					if can_stand and not CopLogicSniper._chk_stand_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
						CopLogicAttack._chk_request_action_stand(data)
					end
				elseif can_crouch and not CopLogicSniper._chk_crouch_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
					CopLogicAttack._chk_request_action_crouch(data)
				end
			elseif can_stand and not CopLogicSniper._chk_stand_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
				CopLogicAttack._chk_request_action_stand(data)
			elseif can_crouch and not CopLogicSniper._chk_crouch_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
				CopLogicAttack._chk_request_action_crouch(data)
			end
		elseif my_data.wanted_pose == "stand" then
			if can_stand then
				CopLogicAttack._chk_request_action_stand(data)
			end
		elseif my_data.wanted_pose == "crouch" then
			if can_crouch then
				CopLogicAttack._chk_request_action_crouch(data)
			end
		end
	end

	if aim or shoot then
		if focus_enemy.verified then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)
				my_data.attention_unit = focus_enemy.u_key
			end
		elseif my_data.attention_unit ~= expected_pos then
			CopLogicBase._set_attention_on_pos(data, expected_pos)
			my_data.attention_unit = expected_pos
		end

		if not my_data.shooting and not data.unit:movement():chk_action_forbidden("action") then
			my_data.shooting = data.brain:action_request({
				body_part = 3,
				type = "shoot"
			})
		end
	else
		if my_data.shooting then
			data.brain:action_request({
				body_part = 3,
				type = "idle"
			})
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)
			my_data.attention_unit = nil
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end


-- Return to objective position
Hooks:PostHook(CopLogicSniper, "action_complete_clbk", "sh_action_complete_clbk", function (data, action)
	local action_type = action:type()
	local my_data = data.internal_data

	if action_type ~= "hurt" and action_type ~= "dodge" and action_type ~= "act" then
		return
	end

	local objective = data.objective
	if not objective or not objective.pos then
		return
	end

	if math.abs(objective.pos.x - data.m_pos.x) < 10 and math.abs(objective.pos.y - data.m_pos.y) < 10 then
		return
	end

	my_data.advance_path = {
		mvector3.copy(data.m_pos),
		mvector3.copy(objective.pos)
	}

	CopLogicTravel._chk_request_action_walk_to_advance_pos(data, my_data, objective.haste or "walk", objective.rot)
end)