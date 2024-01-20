-- More consistent Cloaker attacks, why wouldn't they be allowed to start a sprint attack when another cop is in the way?
function SpoocLogicAttack._upd_spooc_attack(data, my_data)
	if my_data.spooc_attack or data.t <= data.spooc_attack_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local focus_enemy = data.attention_obj
	if not focus_enemy.nav_tracker or not focus_enemy.is_person or not focus_enemy.verified or focus_enemy.reaction < AIAttentionObject.REACT_SHOOT then
		return
	end

	if focus_enemy.criminal_record and (focus_enemy.criminal_record.status or SpoocLogicAttack._is_last_standing_criminal(focus_enemy)) then
		return
	end

	if focus_enemy.verified_dis > (my_data.want_to_take_cover and 1500 or 2500) then
		return
	end

	if focus_enemy.unit:movement().zipline_unit and focus_enemy.unit:movement():zipline_unit() then
		return
	end

	if focus_enemy.unit:movement().is_SPOOC_attack_allowed and not focus_enemy.unit:movement():is_SPOOC_attack_allowed() then

		return
	end

	if not data.spooc_attack_delay_t then
		data.spooc_attack_delay_t = focus_enemy.verified_t + 0.8
		return
	elseif data.spooc_attack_delay_t > data.t then
		return
	end

	local flying_strike
	if ActionSpooc.chk_can_start_flying_strike(data.unit, focus_enemy.unit) then
		flying_strike = true
	elseif not ActionSpooc.chk_can_start_spooc_sprint(data.unit, focus_enemy.unit) then
		return
	end

	if my_data.attention_unit ~= focus_enemy.u_key then
		CopLogicBase._set_attention(data, focus_enemy)
		my_data.attention_unit = focus_enemy.u_key
	end

	local action = SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data, flying_strike)
	if action then
		my_data.spooc_attack_delay_t = nil

		my_data.spooc_attack = {
			start_t = data.t,
			target_u_data = focus_enemy,
			action = action
		}
		return true
	end
end


-- Force Cloakers to stand up before starting an attack
Hooks:PreHook(SpoocLogicAttack, "_chk_request_action_spooc_attack", "sh___chk_request_action_spooc_attack", function (data)
	data.unit:movement():action_request({
		body_part = 4,
		type = "stand"
	})
end)


-- Update logic every frame
Hooks:PostHook(SpoocLogicAttack, "enter", "sh_enter", function (data)
	data.brain:set_update_enabled_state(true)
end)

function SpoocLogicAttack.update(data)
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	local focus_enemy = data.attention_obj
	if my_data.spooc_attack then
		if my_data.spooc_attack.action:complete() and focus_enemy and focus_enemy.verified and (not focus_enemy.criminal_record or not focus_enemy.criminal_record.status) and focus_enemy.dis < my_data.weapon_range.close then
			SpoocLogicAttack._cancel_spooc_attempt(data, my_data)
		end

		CopLogicBase._report_detections(data.detected_attention_objects)
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
		return
	end

	CopLogicAttack._process_pathing_results(data, my_data)

	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		CopLogicAttack._upd_enemy_detection(data, true)
		return
	end

	if SpoocLogicAttack._upd_spooc_attack(data, my_data) then
		return
	end

	if focus_enemy.reaction >= AIAttentionObject.REACT_COMBAT then
		my_data.want_to_take_cover = CopLogicAttack._chk_wants_to_take_cover(data, my_data)

		CopLogicAttack._update_cover(data)
		CopLogicAttack._upd_combat_movement(data)
	end

	CopLogicBase._report_detections(data.detected_attention_objects)
end

function SpoocLogicAttack.queued_update() end
function SpoocLogicAttack.queue_update() end
