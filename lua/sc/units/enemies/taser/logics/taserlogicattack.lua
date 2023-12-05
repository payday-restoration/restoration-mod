-- Update this function with the changes made in CopLogicAttack._upd_aim
function TaserLogicAttack._upd_aim(data, my_data, reaction)
	if my_data.tasing then
		return
	end

	local focus_enemy = data.attention_obj
	local verified = focus_enemy and focus_enemy.verified
	local nearly_visible = focus_enemy and focus_enemy.nearly_visible

	local aim, shoot, expected_pos = CopLogicAttack._check_aim_shoot(data, my_data, focus_enemy, verified, nearly_visible)
	local tase = focus_enemy and focus_enemy.reaction == AIAttentionObject.REACT_SPECIAL_ATTACK

	if aim or shoot or tase then
		if verified or nearly_visible then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)
				my_data.attention_unit = focus_enemy.u_key
			end
		elseif expected_pos then
			if my_data.attention_unit ~= expected_pos then
				CopLogicBase._set_attention_on_pos(data, expected_pos)
				my_data.attention_unit = expected_pos
			end
		end

		if not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			if tase and (not my_data.tasing or my_data.tasing.target_u_key ~= focus_enemy.u_key) and not focus_enemy.unit:movement():zipline_unit() then
				local tase_action = {
					body_part = 3,
					type = "tase",
					blocks = {
						walk = -1
					}
				}

				if data.brain:action_request(tase_action) then
					my_data.tasing = {
						target_u_data = focus_enemy,
						target_u_key = focus_enemy.u_key,
						start_t = data.t
					}

					-- Stop moving when we tase
					CopLogicAttack._cancel_charge(data, my_data)
					data.brain:action_request({
						body_part = 2,
						type = "idle"
					})

					managers.groupai:state():on_tase_start(data.key, focus_enemy.u_key)
				end
			elseif not my_data.shooting and not my_data.tasing then
				my_data.shooting = data.brain:action_request({
					body_part = 3,
					type = "shoot"
				})
			end
		end
	else
		if my_data.shooting or my_data.tasing then
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


-- Save taser charge sound cooldown to data to persist over logic changes
function TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, focus_enemy)
	if my_data.tasing or data.last_charge_snd_play_t and data.t - data.last_charge_snd_play_t < 10 then
		return
	end

	if focus_enemy.verified_dis < 2000 and math.abs(data.m_pos.z - focus_enemy.m_pos.z) < 300 then
		data.last_charge_snd_play_t = data.t
		data.unit:sound():play("taser_charge", nil, true)
	end
end


-- Update logic every frame
Hooks:PostHook(TaserLogicAttack, "enter", "sh_enter", function (data)
	data.brain:set_update_enabled_state(true)

	local my_data = data.internal_data
	my_data.tase_sphere_cast_radius = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].tase_sphere_cast_radius
	my_data.tase_slot_mask = managers.slot:get_mask("bullet_blank_impact_targets")
	my_data.detection_task_key = "TaserLogicAttack._upd_enemy_detection" .. tostring(data.key)
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TaserLogicAttack._upd_enemy_detection, data, data.t + 0.2)
end)

--Taser crash, my beloved
--[[
local _upd_enemy_detection_original = TaserLogicAttack._upd_enemy_detection
function TaserLogicAttack._upd_enemy_detection(data, is_synchronous, ...)
	local my_data = data.internal_data

	_upd_enemy_detection_original(data, is_synchronous, ...)

	if not is_synchronous and my_data == data.internal_data then
		CopLogicBase.queue_task(my_data, my_data.detection_task_key, TaserLogicAttack._upd_enemy_detection, data, data.t + 0.2, data.important)
	end
end
]]--

function TaserLogicAttack.update(data)
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	if my_data.tasing then
		CopLogicBase._report_detections(data.detected_attention_objects)
		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	local focus_enemy = data.attention_obj
	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		TaserLogicAttack._upd_enemy_detection(data, true)
		return
	end

	CopLogicAttack._process_pathing_results(data, my_data)

	if data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT then
		CopLogicAttack._update_cover(data)
		CopLogicAttack._upd_combat_movement(data)
	end

	CopLogicBase._report_detections(data.detected_attention_objects)
end

function TaserLogicAttack.queued_update() end
function TaserLogicAttack.queue_update() end


-- Add tase delay whenever tase action ends, not just when the tased person is downed
local action_complete_clbk_original = TaserLogicAttack.action_complete_clbk
function TaserLogicAttack.action_complete_clbk(data, action, ...)
	local my_data = data.internal_data
	local action_type = action:type()
	if action_type == "tase" then
		if not my_data.tasing then
			return
		end

		local record = managers.groupai:state():criminal_record(my_data.tasing.target_u_key)
		data.tase_delay_t = TimerManager:game():time() + (action:expired() and record and record.status and 30 or 8)

		managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)
		my_data.tasing = nil
	elseif action_type == "dodge" then
		local timeout = action:timeout()
		if timeout then
			data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
		end

		CopLogicAttack._cancel_cover_pathing(data, my_data)

		if action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
		end
	else
		return action_complete_clbk_original(data, action, ...)
	end
end


-- Check line of sight for tase reaction
local to_vec = Vector3()
local _chk_reaction_to_attention_object_original = TaserLogicAttack._chk_reaction_to_attention_object
function TaserLogicAttack._chk_reaction_to_attention_object(data, attention_data, ...)
	local reaction = _chk_reaction_to_attention_object_original(data, attention_data, ...)

	if reaction == AIAttentionObject.REACT_SPECIAL_ATTACK then
		local my_data = data.internal_data
		attention_data.unit:character_damage():shoot_pos_mid(to_vec)
		if CopActionTase.is_obstructed(data.unit:movement():m_head_pos(), to_vec, my_data.tase_slot_mask, my_data.tase_sphere_cast_radius) then
			return AIAttentionObject.REACT_COMBAT
		end
	end

	return reaction
end