function TaserLogicAttack.queued_update(data)
	local my_data = data.internal_data

	TaserLogicAttack._upd_enemy_detection(data)
	
	if my_data ~= data.internal_data then
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	elseif not data.attention_obj then
		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0.3)
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0.016)

		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	CopLogicAttack._update_cover(data)

	local t = TimerManager:game():time()
	data.t = t
	local unit = data.unit
	local objective = data.objective
	local focus_enemy = data.attention_obj
	local action_taken = my_data.turning or data.unit:movement():chk_action_forbidden("walk") or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.acting

	if my_data.tasing then
		action_taken = action_taken or CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_enemy.m_pos)

		CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0.3) --be chill if mid-tase
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	CopLogicAttack._process_pathing_results(data, my_data)

	if AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		CopLogicAttack._update_cover(data)
		CopLogicAttack._upd_combat_movement(data)
	end

	CopLogicBase.queue_task(my_data, my_data.update_task_key, TaserLogicAttack.queued_update, data, data.t + 0.016) --update asap
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

		CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, enemy_pos)
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

						CopLogicAttack._cancel_charge(data, my_data)
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

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end

function TaserLogicAttack._chk_reaction_to_attention_object(data, attention_data, stationary)
	local reaction = CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, stationary)
	local my_data = data.internal_data
	local tase_length = my_data.tase_distance or 1500 --fix for better bots crash (more like the sanity check vanilla lacks because :julesyes: )

	--if not supposd to shoot (or tase, for that matter), end the function here
	if reaction < AIAttentionObject.REACT_SHOOT or not attention_data.criminal_record or not attention_data.is_person then
		return reaction
	end

	if attention_data.unit:movement() then
		--check if the unit's movement extension has a is_taser_attack_allowed function first (should be fine since you're checking for criminal_record and is_person first, but you never know)
		if attention_data.unit:movement().is_taser_attack_allowed and attention_data.unit:movement():is_taser_attack_allowed() then
			--log("helpme")

			if attention_data.verified then
				if attention_data.verified_dis <= tase_length then
					--log("yeah.")

					--honestly I have no idea what difference does it make to use the unit itself to do the ray, if it's better for performance, go for it
					--there's also no need to use ignore_unit if the slotmask won't include them (since only geometry, vehicles and shields are checked in this case)
					--sphere ray used to avoid tasers trying to tase if already obstructed by geometry (can add character slotmasks to prevent this with them as well)
					local vis_check_fail = data.unit:raycast("ray", data.unit:movement():m_head_pos(), attention_data.m_head_pos, "sphere_cast_radius", 25, "slot_mask", managers.slot:get_mask("world_geometry", "vehicles", "enemy_shield_check"), "report")

					if not vis_check_fail then
						if my_data.last_charge_snd_play_t and data.t - my_data.last_charge_snd_play_t < 1 or my_data.tasing and my_data.tasing.target_u_data.unit:movement():tased() then --tase
							return AIAttentionObject.REACT_SPECIAL_ATTACK
						else --charge taser
							managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive") --don't know what delays are being used in copactiontase, so it might be better to use this above (at tase)
							my_data.last_charge_snd_play_t = data.t
							data.unit:sound():play("taser_charge", nil, true)
							return AIAttentionObject.REACT_AIM
						end
					else
						return AIAttentionObject.REACT_COMBAT
					end
				else
					return AIAttentionObject.REACT_COMBAT
				end
			end
		else
			if attention_data.verified then
				return AIAttentionObject.REACT_COMBAT
			end
		end
	end

	return reaction
end

function TaserLogicAttack._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_AIM
	
	
	CopLogicBase._upd_attention_obj_detection(data, min_reaction, nil)

	local under_multiple_fire = nil
	local alert_chk_t = data.t - 1.2
	
	for key, enemy_data in pairs(data.detected_attention_objects) do
		if enemy_data.dmg_t and alert_chk_t < enemy_data.dmg_t then
			under_multiple_fire = 0

			if under_multiple_fire > 11 then
					under_multiple_fire = true
				break
			end
		end
	end

	local find_new_focus_enemy = nil
	local tasing = my_data.tasing
	local tased_u_key = tasing and tasing.target_u_key
	local tase_in_effect = tasing and tasing.target_u_data.unit:movement():tased()

	if tase_in_effect or tasing and data.t - tasing.start_t < math.max(1, data.char_tweak.weapon.is_rifle.aim_delay_tase[2] or 0 * 1.5) then --added some fallback code to make sure this mod works with tdlq's excellent mods
		if under_multiple_fire then
			find_new_focus_enemy = true
		end
	else
		find_new_focus_enemy = true
	end

	if not find_new_focus_enemy then
		return
	end

	local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, TaserLogicAttack._chk_reaction_to_attention_object)
	local old_att_obj = data.attention_obj

	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
	CopLogicAttack._chk_exit_attack_logic(data, new_reaction)

	if my_data ~= data.internal_data then
		return
	end

	if new_attention then
		if old_att_obj then
			if old_att_obj.u_key ~= new_attention.u_key then
				CopLogicAttack._cancel_charge(data, my_data)

				if not data.unit:movement():chk_action_forbidden("walk") then
					CopLogicAttack._cancel_walking_to_cover(data, my_data)
				end

				CopLogicAttack._set_best_cover(data, my_data, nil)
				--TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, new_attention)
			end
		else
			--TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, new_attention)
		end
	elseif old_att_obj then
		CopLogicAttack._cancel_charge(data, my_data)
	end

	TaserLogicAttack._upd_aim(data, my_data, new_reaction)
end

function TaserLogicAttack._chk_play_charge_weapon_sound(data, my_data, focus_enemy)
	--if not my_data.tasing and (not my_data.last_charge_snd_play_t or data.t - my_data.last_charge_snd_play_t > 30) and focus_enemy.verified_dis < 2000 and math.abs(data.m_pos.z - focus_enemy.m_pos.z) < 300 then
		--my_data.last_charge_snd_play_t = data.t

		--data.unit:sound():play("taser_charge", nil, true)
	--end
end