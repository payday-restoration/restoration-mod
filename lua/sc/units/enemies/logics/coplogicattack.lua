--[[

local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_lerp = mvector3.lerp
local mvec3_norm = mvector3.normalize
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()

function CopLogicAttack.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)
	data.unit:brain():cancel_all_pathing_searches()

	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat

	if old_internal_data then
		my_data.turning = old_internal_data.turning
		my_data.firing = old_internal_data.firing
		my_data.shooting = old_internal_data.shooting
		my_data.attention_unit = old_internal_data.attention_unit

		CopLogicAttack._set_best_cover(data, my_data, old_internal_data.best_cover)
	end

	my_data.cover_test_step = 1
	local key_str = tostring(data.key)
	my_data.detection_task_key = "CopLogicAttack._upd_enemy_detection" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, data.t)
	CopLogicIdle._chk_has_old_action(data, my_data)

	my_data.attitude = data.objective and data.objective.attitude or "avoid"

	local safety_range = nil

	safety_range = {
		optimal = 3500,
		far = 6000,
		close = 2000
	}

	if data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range then
		my_data.weapon_range = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range
	else
		my_data.weapon_range = safety_range
	end

	data.unit:brain():set_update_enabled_state(true)

	if data.cool then
		data.unit:movement():set_cool(false)
	end

	if (not data.objective or not data.objective.stance) and data.unit:movement():stance_code() == 1 then
		data.unit:movement():set_stance("hos")
	end

	if my_data ~= data.internal_data then
		return
	end

	if data.objective and (data.objective.action_duration or data.objective.action_timeout_t and data.t < data.objective.action_timeout_t) then
		my_data.action_timeout_clbk_id = "CopLogicIdle_action_timeout" .. tostring(data.key)
		local action_timeout_t = data.objective.action_timeout_t or data.t + data.objective.action_duration
		data.objective.action_timeout_t = action_timeout_t

		CopLogicBase.add_delayed_clbk(my_data, my_data.action_timeout_clbk_id, callback(CopLogicIdle, CopLogicIdle, "clbk_action_timeout", data), action_timeout_t)
	end

	data.unit:brain():set_attention_settings({
		cbt = true
	})
end

function CopLogicAttack._upd_enemy_detection(data, is_synchronous)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
	local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, nil)
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
	
	if (not my_data._intimidate_t or my_data._intimidate_t + 2 < data.t) and not data.cool and not my_data._turning_to_intimidate and not my_data.acting and (not new_attention or AIAttentionObject.REACT_SCARED > new_reaction) and managers.groupai:state():chk_assault_active_atm() then
		local can_turn = not data.unit:movement():chk_action_forbidden("turn")
		local civ = CopLogicIdle.find_civilian_to_intimidate(data)

		if civ then
			my_data._intimidate_t = data.t
			new_attention, new_prio_slot, new_reaction = nil

			if can_turn and CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, civ:movement():m_pos()) then
				my_data._turning_to_intimidate = true
				my_data._primary_intimidation_target = civ
			else
				CopLogicIdle.intimidate_civilians(data)
			end
		end
	end

	data.logic._upd_aim(data, my_data)

	if not is_synchronous then
		CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, delay and data.t + delay, data.important and true)
	end

	CopLogicBase._report_detections(data.detected_attention_objects)
end

function CopLogicAttack._upd_aim(data, my_data)
	local shoot, aim, expected_pos, height_difference, outoffov = nil
	local focus_enemy = data.attention_obj
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if focus_enemy and AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
		local last_sup_t = data.unit:character_damage():last_suppression_t()
		
		if focus_enemy.verified or focus_enemy.nearly_visible then
			
			--harass: attempt to engage enemies who are leaving themselves open, with things like interactions, changing weapons or reloading 
	
			--this is important for harass.
			local pantsdownchk = nil
			local visibility_chk = focus_enemy.verified or focus_enemy.nearly_visible
					
			if not data.unit:in_slot(16) and not data.is_converted and focus_enemy and focus_enemy.is_person and visibility_chk and focus_enemy.dis <= 2000 then
				if focus_enemy.is_local_player then
					local e_movement_state = focus_enemy.unit:movement():current_state()
					if e_movement_state:_is_reloading() or e_movement_state:_interacting() or e_movement_state:is_equipping() then
						pantsdownchk = true
					end
				else
					local e_anim_data = focus_enemy.unit:anim_data()
					local movingoridle = e_anim_data.move or e_anim_data.idle
					if not movingoridle or e_anim_data.reload then
						pantsdownchk = true
					end
				end
			end

			if aim == nil and AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
				if AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction then
					local running = data.unit:movement()._active_actions[2] and data.unit:movement()._active_actions[2]:type() == "walk" and data.unit:movement()._active_actions[2]:haste() == "run"
					local firing_range = 3000

					if data.internal_data.weapon_range then
						firing_range = running and data.internal_data.weapon_range.close or data.internal_data.weapon_range.far
						maxrange = data.internal_data.weapon_range.far
					else
						--debug_pause_unit(data.unit, "[CopLogicAttack]: Unit doesn't have data.internal_data.weapon_range")
					end
					
					if not managers.groupai:state():whisper_mode() then
						if visibility_chk and focus_enemy.alert_t and data.t - focus_enemy.alert_t < 7 and managers.groupai:state():chk_assault_active_atm() then
							shoot = true
						elseif visibility_chk and data.internal_data.weapon_range and focus_enemy.verified_dis < firing_range and managers.groupai:state():chk_assault_active_atm() then
							shoot = true
						elseif visibility_chk and focus_enemy.criminal_record and focus_enemy.criminal_record.assault_t and data.t - focus_enemy.criminal_record.assault_t < 4 then
							shoot = true
						elseif not data.unit:base():has_tag("law") and visibility_chk and focus_enemy.dis <= firing_range or data.unit:base():has_tag("law") and visibility_chk and focus_enemy.aimed_at and focus_enemy.dis <= 1500 then
							shoot = true
						end
					else
						if visibility_chk and focus_enemy.criminal_record and focus_enemy.criminal_record.assault_t and data.t - focus_enemy.criminal_record.assault_t < 4 then
							shoot = true
						elseif not data.unit:base():has_tag("law") and visibility_chk and focus_enemy.dis <= firing_range or data.unit:base():has_tag("law") and visibility_chk and focus_enemy.aimed_at and focus_enemy.dis <= 1500 then
							shoot = true					
						end
					end

					if not shoot and not managers.groupai:state():whisper_mode() and my_data.attitude == "engage" then
						local height_difference = math.abs(data.m_pos.z - data.attention_obj.m_pos.z) > 250
						local z_check = height_difference and 0.75 or 1
						if focus_enemy.verified_dis < firing_range * z_check or focus_enemy.reaction == AIAttentionObject.REACT_SHOOT then
							shoot = true
						else
							local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t
							local suppressingfire_t = 0.75
							
							if data.tactics and data.tactics.harass then
								suppressingfire_t = 2
							end

							if my_data.firing and time_since_verification and time_since_verification < suppressingfire_t then
								shoot = true
							end
						end
					end

					aim = aim or shoot
					
				else
					aim = true
				end
			end
		elseif AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
			local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t
			local running = my_data.advancing and not my_data.advancing:stopping() and my_data.advancing:haste() == "run"
			local same_z = math.abs(focus_enemy.verified_pos.z - data.m_pos.z) < 250

			if running then
				if time_since_verification and time_since_verification < 0.5 and same_z then
					aim = true
				end
			elseif time_since_verification and time_since_verification < 1 then
				aim = true
			end

			if aim and my_data.shooting and not managers.groupai:state():whisper_mode() and AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction and time_since_verification and time_since_verification < (running and 1 or 2) then
				shoot = true
			end

			if not aim then
				expected_pos = CopLogicAttack._get_expected_attention_position(data, my_data)

				if expected_pos then
					if running then
						local watch_dir = temp_vec1

						mvec3_set(watch_dir, expected_pos)
						mvec3_sub(watch_dir, data.m_pos)
						mvec3_set_z(watch_dir, 0)

						local watch_pos_dis = mvec3_norm(watch_dir)
						local walk_to_pos = data.unit:movement():get_walk_to_pos()
						local walk_vec = temp_vec2

						mvec3_set(walk_vec, walk_to_pos)
						mvec3_sub(walk_vec, data.m_pos)
						mvec3_set_z(walk_vec, 0)
						mvec3_norm(walk_vec)

						local watch_walk_dot = mvec3_dot(watch_dir, walk_vec)

						if watch_pos_dis < 500 or watch_pos_dis < 1000 and watch_walk_dot > 0.85 then
							aim = true
							
							if focus_enemy and aim and focus_enemy.alert_t and data.t - focus_enemy.alert_t < 1 and focus_enemy.verified_t and data.t - focus_enemy.verified_t < 5 and data.tactics and data.tactics.harass then
								shoot = true
							end
						end
					else
						
					end
				end
			end
		else
			expected_pos = CopLogicAttack._get_expected_attention_position(data, my_data)

			if expected_pos then
				--cops will open fire on expected player positions if they hear player alerts and the player has been seen in the last 5 seconds, and they're harassers, for large bursts of suppressive fire.
				
				if focus_enemy and focus_enemy.alert_t and data.t - focus_enemy.alert_t < math.random(2, 4) and focus_enemy.verified_t and data.tactics and data.tactics.harass then
					shoot = true
				end
			end
		end
	end
		
	--cops call out player reloads if they've seen the player in the last 2 seconds if they have the harass tactic
	if focus_enemy and focus_enemy.is_person and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and not data.unit:in_slot(16) and not data.is_converted and data.tactics and data.tactics.harass then
		if focus_enemy.is_local_player then
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t
			local e_movement_state = focus_enemy.unit:movement():current_state()
			
			if e_movement_state:_is_reloading() and time_since_verify and time_since_verify < 2 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end
			end
		else
			local e_anim_data = focus_enemy.unit:anim_data()
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t

			if e_anim_data.reload and time_since_verify and time_since_verify < 2 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end			
			end
		end
	end
	
	if not my_data.weapon_range and focus_enemy and focus_enemy.dis > 6000 or my_data.weapon_range and focus_enemy and focus_enemy.dis > my_data.weapon_range.far then
		shoot = nil
	end
	
	if not aim and data.char_tweak.always_face_enemy and focus_enemy and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		aim = true
	end

	if aim or shoot then
		if focus_enemy.verified or focus_enemy.nearly_visible then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)

				my_data.attention_unit = focus_enemy.u_key
			end
		elseif expected_pos and not data.char_tweak.always_face_enemy then
			if my_data.attention_unit ~= expected_pos then
				CopLogicBase._set_attention_on_pos(data, mvector3.copy(expected_pos))

				my_data.attention_unit = mvector3.copy(expected_pos)
			end
		else
			local look_pos = focus_enemy.last_verified_pos or focus_enemy.verified_pos

			if my_data.attention_unit ~= look_pos then
				CopLogicBase._set_attention_on_pos(data, mvector3.copy(look_pos))

				my_data.attention_unit = mvector3.copy(look_pos)
			end
		end

		if not my_data.shooting and not my_data.spooc_attack and not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			local shoot_action = {
				body_part = 3,
				type = "shoot"
			}

			if data.unit:brain():action_request(shoot_action) then
				my_data.shooting = true
			end
		end
	else
		if my_data.shooting and not data.unit:anim_data().reload then
			local new_action = {
				body_part = 3,
				type = "idle"
			}

			data.unit:brain():action_request(new_action)
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)

			my_data.attention_unit = nil
		end
	end
	
	if aim or shoot then
		local verified_or_nearvis_chk = focus_enemy and focus_enemy.verified or focus_enemy and focus_enemy.nearly_visible
		local FE_or_EP_chk = focus_enemy or expected_pos
		
		if focus_enemy and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction and running or expected_pos and running then
			local walk_to_pos = data.unit:movement():get_walk_to_pos()

			if walk_to_pos then
				
				local attention_position = focus_enemy and focus_enemy.m_pos or expected_pos
				
				mvector3.direction(temp_vec1, data.m_pos, walk_to_pos)
				mvector3.direction(temp_vec2, data.m_pos, attention_position)

				local dot = mvector3.dot(temp_vec1, temp_vec2)

				if dot < 0.6 then
					shoot = false
					aim = false
				end
			end
		end

		if shoot and CopLogicAttack.chk_should_turn(data, my_data) and FE_or_EP_chk or aim and CopLogicAttack.chk_should_turn(data, my_data) and FE_or_EP_chk or CopLogicAttack.chk_should_turn(data, my_data) and focus_enemy and focus_enemy.alert_t and data.t - focus_enemy.alert_t < math.random(2, 4) then
			local enemy_pos = verified_or_nearvis_chk and focus_enemy.m_pos or focus_enemy and focus_enemy.verified_pos or expected_pos

			CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, enemy_pos)
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end

function CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
	local focus_enemy = data.attention_obj
	local common_cop = data.unit:base():has_tag("law") and not data.unit:base():has_tag("special")

	if shoot then
		if not my_data.firing then
			data.unit:movement():set_allow_fire(true)

			my_data.firing = true

			if not data.unit:in_slot(16) and data.char_tweak.chatter.aggressive then
				if data.unit:base()._tweak_table == "spring" or data.unit:base()._tweak_table == "phalanx_vip" then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive_captain")
				elseif managers.groupai:state():chk_assault_active_atm() and common_cop then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive_assault") --common cops use aggressive chatter less often in assaults
					--log("assault chatter works")
				elseif data.unit:base()._tweak_table == "spooc" or data.unit:base()._tweak_table == "spooc_titan" then
					data.unit:sound():say("clk_c01x_plu", true, true)
					--log("cloaker chatter works")
				else	
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
					--log("between assault chatter works")
				end	
			end
		end
	elseif my_data.firing then
		data.unit:movement():set_allow_fire(false)

		my_data.firing = nil
	end
	
	local shoot, aim, expected_pos = nil
	local focus_enemy = data.attention_obj		
	--if the any player has been seen in the last 6 seconds, and they reload, call out their reload
	if not data.unit:in_slot(16) and focus_enemy and focus_enemy.is_person and focus_enemy.reaction >= AIAttentionObject.REACT_COMBAT then
		if focus_enemy.is_local_player then
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t
			local e_movement_state = focus_enemy.unit:movement():current_state()
			
			if e_movement_state:_is_reloading() and time_since_verify and time_since_verify < 6 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end
			end
		else
			local e_anim_data = focus_enemy.unit:anim_data()
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t

			if e_anim_data.reload and time_since_verify and time_since_verify < 6 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end			
			end
		end
	end		
end

--hyper heisting tactic ports thank you fuglore <3333
function CopLogicAttack._upd_combat_movement(data)
	local my_data = data.internal_data
	
	if not data.attention_obj then
		return
	else
		local definitely_not_reactions_chk = AIAttentionObject.REACT_COMBAT > data.attention_obj.reaction

		if definitely_not_reactions_chk then
			return
		end
	end
	
	local t = data.t
	local unit = data.unit
	local focus_enemy = data.attention_obj
	local in_cover = my_data.in_cover
	local best_cover = my_data.best_cover
	local enemy_visible = focus_enemy.verified
	local alert_soft = data.is_suppressed
	local action_taken = data.logic.action_taken(data, my_data)
	
	--hitnrun: approach enemies, back away once the enemy is visible, creating a variating degree of aggressiveness
	--eliterangedfire: open fire at enemies from longer distances, back away if the enemy gets too close for comfort
	--spoocavoidance: attempt to approach enemies, if aimed at/seen, retreat away into cover and disengage until ready to try again
	local hitnrunmovementqualify = data.tactics and data.tactics.hitnrun and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1000 and math.abs(data.m_pos.z - data.attention_obj.m_pos.z) < 200
	local spoocavoidancemovementqualify = data.tactics and data.tactics.spoocavoidance and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 2000 and focus_enemy.aimed_at
	local eliterangedfiremovementqualify = data.tactics and data.tactics.elite_ranged_fire and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1500
	
	--reloadingretreat: retreat as fast as possible if the ammo is running dry and the enemy is visible
	local ammo_max, ammo = data.unit:inventory():equipped_unit():base():ammo_info()
	local reloadingretreatmovementqualify = ammo / ammo_max < 0.2 and data.tactics and data.tactics.reloadingretreat and focus_enemy and focus_enemy.verified
	
	local want_to_take_cover = my_data.want_to_take_cover
	action_taken = action_taken
	local move_to_cover, want_flank_cover, taken_flank_cover = nil
	local enemy_visible_mild_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 7
	local flank_cover_charge_time = focus_enemy.verified_t and t - focus_enemy.verified_t < 4
	local enemy_visible_soft = nil
	local enemy_visible_softer = nil

	if my_data.cover_test_step ~= 1 and not enemy_visible_softer and (action_taken or want_to_take_cover or not in_cover) then
		my_data.cover_test_step = 1
	end
	
	--increased ai aggressiveness and speed when more players are around
	local nr_players = 0

	for u_key, u_data in pairs(managers.groupai:state():all_player_criminals()) do
		if not u_data.status then
			nr_players = nr_players + 1
		end
	end
	
	if nr_players > 2 then
		enemy_visible_soft = not focus_enemy.verified
		enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 1
	else
		enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
		enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
	end

	if not enemy_visible_soft then
		enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
	end
	
	if not enemy_visible_softer then
		enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
	end

	if my_data.stay_out_time and (enemy_visible_soft or not my_data.at_cover_shoot_pos or action_taken or want_to_take_cover) then
		my_data.stay_out_time = nil
	elseif my_data.attitude == "engage" and not my_data.stay_out_time and not enemy_visible_soft and my_data.at_cover_shoot_pos and not action_taken and not want_to_take_cover then
		my_data.stay_out_time = t + 7
	end
	
	if not action_taken and want_to_take_cover and not best_cover or not action_taken and hitnrunmovementqualify and not pantsdownchk or not action_taken and eliterangedfiremovementqualify and not pantsdownchk or not action_taken and spoocavoidancemovementqualify and not pantsdownchk or not action_taken and reloadingretreatmovementqualify then
		action_taken = CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, false)
	end
	
	--removed the need for being important
	if not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and CopLogicAttack._can_move(data) and data.attention_obj.verified and (not in_cover or not in_cover[4]) and not spoocavoidancemovementqualify then
		if data.is_suppressed and data.t - data.unit:character_damage():last_suppression_t() < 0.7 then
			action_taken = CopLogicBase.chk_start_action_dodge(data, "scared")
			if data.char_tweak.chatter.dodge then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "dodge")
			end
		end

		if not action_taken and focus_enemy.is_person and focus_enemy.dis < 3000 and math.random() < 0.5 then
			local dodge = nil

			if focus_enemy.is_local_player then
				local e_movement_state = focus_enemy.unit:movement():current_state()

				if not e_movement_state:_is_reloading() and not e_movement_state:_interacting() and not e_movement_state:is_equipping() then
					dodge = true
				end
			else
				local e_anim_data = focus_enemy.unit:anim_data()

				if (e_anim_data.move or e_anim_data.idle) and not e_anim_data.reload then
					dodge = true
				end
			end

			if dodge and focus_enemy.aimed_at then
				action_taken = CopLogicBase.chk_start_action_dodge(data, "preemptive")
				if data.char_tweak.chatter.dodge then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "dodge")
				end
			end
		end
	end

	if action_taken then
		-- Nothing
	elseif want_to_take_cover then
		move_to_cover = true
	elseif not enemy_visible_soft then --added some extra stuff here to make sure other enemy groups get in on the fight, also added a new system so that once flank cover is acquired for flanking teams, they'll charge, in order for flanking to actually happen instead of them just standing around in the flank cover
		local charge_failed_t_chk = not my_data.charge_path_failed_t or my_data.charge_path_failed_t and data.t - my_data.charge_path_failed_t > 6
		
		if data.tactics and data.tactics.charge and charge_failed_t_chk or my_data.taken_flank_cover and charge_failed_t_chk then
			if my_data.charge_path then
				local path = my_data.charge_path
				action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path)
				
				if my_data.taken_flank_cover then
					if data.char_tweak.chatter.look_for_angle then
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "look_for_angle")
					end
				end
				
				my_data.charge_path = nil
				my_data.taken_flank_cover = nil
			elseif not my_data.charge_path_search_id and data.attention_obj.nav_tracker then
				if data.tactics and data.tactics.charge then
					my_data.charge_pos = CopLogicTravel._get_pos_on_wall(focus_enemy.nav_tracker:field_position(), my_data.weapon_range.close, 45, nil)
				else
					my_data.charge_pos = CopLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker, 3000)
				end

				if my_data.charge_pos then
					my_data.charge_path_search_id = "charge" .. tostring(data.key)

					unit:brain():search_for_path(my_data.charge_path_search_id, my_data.charge_pos, nil, nil, nil)
							
					--my_data.taken_flank_cover = nil
				else
					debug_pause_unit(data.unit, "failed to find charge_pos", data.unit)

					my_data.charge_path_failed_t = TimerManager:game():time()
				end
			end
		elseif in_cover then
			if my_data.cover_test_step <= 2 then
				local height = nil

				if in_cover[4] then
					height = 150
				else
					height = 80
				end

				local my_tracker = unit:movement():nav_tracker()
				local shoot_from_pos = CopLogicAttack._peek_for_pos_sideways(data, my_data, my_tracker, focus_enemy.m_head_pos, height)

				if shoot_from_pos then
					local path = {
						my_tracker:position(),
						shoot_from_pos
					}
					--ranged fire cops signal the start of their movement and positioning
					if data.tactics and data.tactics.ranged_fire or data.tactics and data.tactics.elite_ranged_fire then
						if not data.unit:in_slot(16) and data.char_tweak.chatter.ready then
							managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "ready")
							--log("eliteranged ready")
						end
					end
					action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, math.random() < 0.5 and "run" or "walk")
				else
					my_data.cover_test_step = my_data.cover_test_step + 1
				end
			elseif data.tactics and data.tactics.flank then
				move_to_cover = true
				want_flank_cover = true
			end
		elseif my_data.walking_to_cover_shoot_pos then
			--NOTHING
		elseif my_data.at_cover_shoot_pos then
			--ranged fire cops also signal the END of their movement and positioning
			if data.tactics and data.tactics.ranged_fire or data.tactics and data.tactics.elite_ranged_fire then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.ready then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "deathguard")
					--log("eliteranged roger")
				end
			end
			if my_data.stay_out_time < t then
				if data.tactics and data.tactics.flank then
					want_flank_cover = true
				end
				move_to_cover = true
			end				
		else
			if data.tactics and data.tactics.flank then
				want_flank_cover = true
			end
			move_to_cover = true
		end
	end

	if not my_data.processing_cover_path and not my_data.cover_path and not my_data.charge_path_search_id and not action_taken and best_cover and (not in_cover or best_cover[1] ~= in_cover[1]) and (not my_data.cover_path_failed_t or data.t - my_data.cover_path_failed_t > 5) then
		CopLogicAttack._cancel_cover_pathing(data, my_data)

		local search_id = tostring(unit:key()) .. "cover"

		if data.unit:brain():search_for_path_to_cover(search_id, best_cover[1], best_cover[5]) then
			my_data.cover_path_search_id = search_id
			my_data.processing_cover_path = best_cover
		end
	end

	if not action_taken and move_to_cover and my_data.cover_path then
		action_taken = CopLogicAttack._chk_request_action_walk_to_cover(data, my_data)
	end

	if want_flank_cover then
		if not my_data.flank_cover then
			local sign = math.random() < 0.5 and -1 or 1
			local step = 30
			my_data.flank_cover = {
				step = step,
				angle = step * sign,
				sign = sign
			}
			taken_flank_cover = true
			want_flank_cover = false
			if not data.unit:in_slot(16) and data.char_tweak.chatter.look_for_angle then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "look_for_angle")
				--log("eliteranged looking for angle")
			end
		end
	else
		taken_flank_cover = nil
		my_data.flank_cover = nil
	end

	action_taken = action_taken or CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
end

function CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, engage)

	local pantsdownchk = nil
	
	if not data.unit:in_slot(16) and focus_enemy and focus_enemy.is_person and focus_enemy.dis <= 2000 then
		if focus_enemy.is_local_player then
			local e_movement_state = focus_enemy.unit:movement():current_state()

			if e_movement_state:_is_reloading() or e_movement_state:_interacting() or e_movement_state:is_equipping() then
				pantsdownchk = true
			end
		else
			local e_anim_data = focus_enemy.unit:anim_data()

			if not (e_anim_data.move or e_anim_data.idle) or e_anim_data.reload then
				pantsdownchk = true
			end
		end
	end
	
	local can_perform_walking_action = not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and not my_data.has_old_action and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos
	
	if can_perform_walking_action then
	--what the fuck is my code rn tbh
		if focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and focus_enemy.dis < 250 and CopLogicAttack._can_move(data) or data.tactics and data.tactics.elite_ranged_fire and focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and focus_enemy.verified_dis <= 1500 and CopLogicAttack._can_move(data) or data.tactics and data.tactics.hitnrun and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1000 and CopLogicAttack._can_move(data) or data.tactics and data.tactics.spoocavoidance and focus_enemy.verified and focus_enemy.aimed_at or data.tactics and data.tactics.reloadingretreat and focus_enemy.verified then
			
			local from_pos = mvector3.copy(data.m_pos)
			local threat_tracker = focus_enemy.nav_tracker
			local threat_head_pos = focus_enemy.m_head_pos
			local max_walk_dis = nil
			local vis_required = engage
				
			if data.tactics and data.tactics.hitnrun then
				max_walk_dis = 800
			elseif data.tactics and data.tactics.elite_ranged_fire then
				max_walk_dis = 1000
			elseif data.tactics and data.tactics.spoocavoidance then
				max_walk_dis = 1500
			else
				max_walk_dis = 400
			end
				
			local retreat_to = CopLogicAttack._find_retreat_position(from_pos, focus_enemy.m_pos, threat_head_pos, threat_tracker, max_walk_dis, vis_required)
	
			if retreat_to then
				CopLogicAttack._cancel_cover_pathing(data, my_data)
					
				--if data.tactics and data.tactics.elite_ranged_fire then
					--log("eliteranged just backed up properly")
				--end    			
				
				--if data.tactics and data.tactics.hitnrun then
					--log("hitnrun just backed up properly")
				--end
	
				local new_action_data = {
					variant = "walk",
					body_part = 2,
					type = "walk",
					nav_path = {
						from_pos,
						retreat_to
					}
				}
				my_data.advancing = data.unit:brain():action_request(new_action_data)
					
				if my_data.advancing then
					my_data.surprised = true
	
					return true
				end
			end
		end
	end
end

function CopLogicAttack.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()

	if action_type == "healed" then
		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
	
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "heal" then
		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
	
		if not data.unit:character_damage():dead() and action:expired() then
			--log("hey this actually works!")
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "walk" then
		my_data.advancing = nil
		if my_data.flank_cover then
			my_data.taking_flank_cover = true
		end
		my_data.flank_cover = nil
		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
		
		if my_data.moving_to_cover then
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
		
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
		
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "tase" then
		if not data.unit:character_damage():dead() and action:expired() and my_data.tasing then
			local record = managers.groupai:state():criminal_record(my_data.tasing.target_u_key)

			if record and record.status then
				data.tase_delay_t = TimerManager:game():time() + 45
			end
			TaserLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end

		managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)

		my_data.tasing = nil
	elseif action_type == "spooc" then
		data.spooc_attack_timeout_t = TimerManager:game():time() + math.lerp(data.char_tweak.spooc_attack_timeout[1], data.char_tweak.spooc_attack_timeout[2], math.random())

		if action:complete() and data.char_tweak.spooc_attack_use_smoke_chance > 0 and math.random() <= data.char_tweak.spooc_attack_use_smoke_chance and not managers.groupai:state():is_smoke_grenade_active() then
			managers.groupai:state():detonate_smoke_grenade(data.m_pos + math.UP * 10, data.unit:movement():m_head_pos(), math.lerp(15, 30, math.random()), false)
		end
		
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end

		my_data.spooc_attack = nil
	elseif action_type == "reload" then
		--Removed the requirement for being important here.
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
	elseif action_type == "turn" then
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
		
		my_data.turning = nil
	elseif action_type == "hurt" then
		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
		
		--Removed the requirement for being important here.
		if not data.unit:character_damage():dead() and action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
		
	elseif action_type == "dodge" then
		local timeout = action:timeout()

		if timeout then
			data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
		end

		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
		
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
	end
end

function CopLogicAttack.queue_update(data, my_data)
	local focus_enemy = data.attention_obj
	local in_combat = focus_enemy and focus_enemy.verified and focus_enemy.dis <= 3000 or focus_enemy and focus_enemy.verified_t and focus_enemy.verified_t < 2
	local delay = in_combat and 0 or 0.35
	
	local objective = data.objective or nil
	
	data.logic._upd_stance_and_pose(data, data.internal_data, objective)
	CopLogicAttack._update_cover(data)
	
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, data.logic.queued_update, data, data.t + delay)
end

function CopLogicAttack.chk_should_turn(data, my_data)
	return not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and not my_data.has_old_action and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos
end

local temp_vec4 = Vector3()
local temp_vec5 = Vector3()
local temp_vec6 = Vector3()
function CopLogicAttack._update_cover(data)
	local my_data = data.internal_data
	local cover_release_dis_sq = 10000
	local best_cover = my_data.best_cover
	local satisfied = true
	local my_pos = data.m_pos --my position
	
	if data.attention_obj and data.attention_obj.nav_tracker and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		local find_new = not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
		local enemyseeninlast2secs = data.attention_obj and data.attention_obj.verified_t and data.t - data.attention_obj.verified_t < 2
		
		if find_new then
			local enemy_tracker = data.attention_obj.nav_tracker
			local threat_pos = enemy_tracker:field_position()
			local heister_pos = data.attention_obj.m_pos --the threat
			
			if data.objective and data.objective.type == "follow" and data.tactics and data.tactics.shield_cover and not data.unit:base()._tweak_table == "shield" and not data.unit:base()._tweak_table == "phalanx_minion_assault" and not data.unit:base()._tweak_table == "phalanx_minion" then
				local shield_pos = data.objective.follow_unit:movement():m_pos() --the pillar
				local shield_direction = mvector3.direction(temp_vec4, my_pos, shield_pos)
				local heister_direction = mvector3.direction(temp_vec5, my_pos, heister_pos)
				local following_direction = mvector3.direction(temp_vec6, shield_direction, heister_direction)
				local following_dis = following_direction * 120
				local near_pos = data.objective.follow_unit:movement():m_pos() + following_dis
				
				local notbestcovernotfollowcoverchk = not best_cover or CopLogicAttack._verify_follow_cover(data, best_cover[1], near_pos, threat_pos, 60, 120)
				
				--unit would take the heister's angle to both the pillar, and the unit, the unit would attempt to line up the pillar and the heister together, since they're following the pillar, they should frequently position themselves behind the pillar, which would keep them in cover, its hacky, but it would work
				
				if notbestcovernotfollowcoverchk and not my_data.processing_cover_path and not my_data.charge_path_search_id then
					local follow_unit_area = managers.groupai:state():get_area_from_nav_seg_id(data.objective.follow_unit:movement():nav_tracker():nav_segment())
					local found_cover = managers.navigation:find_cover_in_nav_seg_3(follow_unit_area.nav_segs, data.objective.distance and data.objective.distance * 0.9 or nil, near_pos, threat_pos)

					if found_cover and data.unit:raycast("ray", data.unit:movement():m_head_pos(), data.attention_obj.m_head_pos, "slot_mask", managers.slot:get_mask("bullet_impact_targets_no_criminals"), "ignore_unit", data.attention_obj.unit, "report") then
						if not follow_unit_area.nav_segs[found_cover[3]:nav_segment()] then
							debug_pause_unit(data.unit, "cover in wrong area")
						end

						satisfied = true
						local better_cover = {
							found_cover
						}

						CopLogicAttack._set_best_cover(data, my_data, better_cover)

						local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)

						if offset_pos then
							better_cover[5] = offset_pos
							better_cover[6] = yaw
						end
					end
				end
			elseif data.objective and data.objective.type == "follow" then
				local near_pos = data.objective.follow_unit:movement():m_pos()
				local notbc_ornotvc_chk = not best_cover or not CopLogicAttack._verify_follow_cover(data, best_cover[1], near_pos, threat_pos, 200, 1000)
				if notbc_ornotvc_chk and not my_data.processing_cover_path and not my_data.charge_path_search_id then
					local follow_unit_area = managers.groupai:state():get_area_from_nav_seg_id(data.objective.follow_unit:movement():nav_tracker():nav_segment())
					local found_cover = managers.navigation:find_cover_in_nav_seg_3(follow_unit_area.nav_segs, data.objective.distance and data.objective.distance * 0.9 or nil, near_pos, threat_pos)

					if found_cover then
						if not follow_unit_area.nav_segs[found_cover[3]:nav_segment()] then
							--debug_pause_unit(data.unit, "cover in wrong area")
						end

						satisfied = true
						local better_cover = {
							found_cover
						}

						CopLogicAttack._set_best_cover(data, my_data, better_cover)

						local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)

						if offset_pos then
							better_cover[5] = offset_pos
							better_cover[6] = yaw
						end
					end
				end
			else
				local want_to_take_cover = my_data.want_to_take_cover
				local flank_cover = my_data.flank_cover
				local min_dis, max_dis = nil

				if want_to_take_cover or my_data.shooting then
					if data.tactics and not data.tactics.ranged_fire and not data.tactics.elite_ranged_fire or not enemyseeninlast2secs then
						min_dis = 250
					else
						min_dis = math.max(data.attention_obj.dis * 0.9, data.attention_obj.dis - 200)
					end
				end
				
				local notbc_or_fc_or_notvc_chk = not best_cover or flank_cover or CopLogicAttack._verify_cover(data, best_cover[1], threat_pos, min_dis, max_dis)
				
				if not my_data.processing_cover_path and not my_data.charge_path_search_id and notbc_or_fc_or_notvc_chk then
					satisfied = false
					local my_vec = my_pos - threat_pos

					if flank_cover then
						mvector3.rotate_with(my_vec, Rotation(flank_cover.angle))
					end

					local optimal_dis = my_vec:length()
					local max_dis = nil

					if want_to_take_cover or my_data.shooting then
						if data.tactics and (data.tactics.ranged_fire or data.tactics.elite_ranged_fire) then
							if not enemyseeninlast2secs then
								optimal_dis = min_dis
							elseif optimal_dis < my_data.weapon_range.optimal then
								optimal_dis = optimal_dis

								mvector3.set_length(my_vec, optimal_dis)
							else
								optimal_dis = my_data.weapon_range.optimal

								mvector3.set_length(my_vec, optimal_dis)
							end
						else
							if not enemyseeninlast2secs then
								optimal_dis = min_dis
							elseif optimal_dis < my_data.weapon_range.close then
								optimal_dis = optimal_dis

								mvector3.set_length(my_vec, optimal_dis)
							else
								optimal_dis = my_data.weapon_range.close

								mvector3.set_length(my_vec, optimal_dis)
							end
						end
						
						if data.tactics and not data.tactics.ranged_fire and not data.tactics.elite_ranged_fire then
							max_dis = math.max(optimal_dis + 200, my_data.weapon_range.far * 0.5)
						else							
							max_dis = math.max(optimal_dis + 200, my_data.weapon_range.far)
						end
						
					elseif data.tactics and not data.tactics.ranged_fire and not data.tactics.elite_ranged_fire and optimal_dis > my_data.weapon_range.close then
						optimal_dis = my_data.weapon_range.close

						mvector3.set_length(my_vec, optimal_dis)

						max_dis = my_data.weapon_range.optimal
					elseif optimal_dis > my_data.weapon_range.optimal then
						optimal_dis = my_data.weapon_range.optimal

						mvector3.set_length(my_vec, optimal_dis)

						max_dis = my_data.weapon_range.far
					end

					local my_side_pos = threat_pos + my_vec

					mvector3.set_length(my_vec, max_dis)

					local furthest_side_pos = threat_pos + my_vec

					if flank_cover then
						local angle = flank_cover.angle
						local sign = flank_cover.sign

						if math.sign(angle) ~= sign then
							angle = -angle + flank_cover.step * sign

							if math.abs(angle) > 90 then
								flank_cover.failed = true
							else
								flank_cover.angle = angle
							end
						else
							flank_cover.angle = -angle
						end
					end

					local min_threat_dis, cone_angle = nil

					if flank_cover then
						cone_angle = flank_cover.step
					else
						cone_angle = math.lerp(90, 60, math.min(1, optimal_dis / 3000))
					end

					local search_nav_seg = nil

					if data.objective and data.objective.type == "defend_area" then
						search_nav_seg = data.objective.area and data.objective.area.nav_segs or data.objective.nav_seg
					end

					local found_cover = managers.navigation:find_cover_in_cone_from_threat_pos_1(threat_pos, furthest_side_pos, my_side_pos, nil, cone_angle, min_threat_dis, search_nav_seg, optimal_dis, data.pos_rsrv_id)
					
					local notbcorvc_chk = nil
					
					if found_cover then
						notbcorvc_chk = not best_cover or CopLogicAttack._verify_cover(data, found_cover, threat_pos, min_dis, max_dis)
					end
					
					if found_cover and notbcorvc_chk then
						satisfied = true
						local better_cover = {
							found_cover
						}

						CopLogicAttack._set_best_cover(data, my_data, better_cover)

						local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)

						if offset_pos then
							better_cover[5] = offset_pos
							better_cover[6] = yaw
						end
					end
				end
			end
		end

		local in_cover = my_data.in_cover

		if in_cover then
			local threat_pos = data.attention_obj.verified_pos
			in_cover[3], in_cover[4] = CopLogicAttack._chk_covered(data, my_pos, threat_pos, data.visibility_slotmask)
		end
	elseif best_cover and cover_release_dis_sq < mvector3.distance_sq(best_cover[1][1], my_pos) then
		CopLogicAttack._set_best_cover(data, my_data, nil)
	end
end

function CopLogicAttack._verify_cover(data, cover, threat_pos, min_dis, max_dis)
	local threat_dis = mvector3.direction(temp_vec1, cover[1], threat_pos)
	
	if max_dis and max_dis < threat_dis or min_dis and threat_dis < min_dis then
		return
	end

	local cover_dot = mvector3.dot(temp_vec1, cover[2])

	if cover_dot < 0.67 then
		return
	end

	return true
end

function CopLogicAttack._verify_follow_cover(data, cover, near_pos, threat_pos, min_dis, max_dis)
	if CopLogicAttack._verify_cover(data, cover, threat_pos, min_dis, max_dis) and mvector3.distance(near_pos, cover[1]) < 400 then
		return true
	end
end

function CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, my_pos, enemy_pos)
	local fwd = data.unit:movement():m_rot():y()
	local target_vec = enemy_pos - my_pos
	local error_spin = target_vec:to_polar_with_reference(fwd, math.UP).spin
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	local speed = nil
	local nr_players = 0	
	local mook_units = {
		"security",
		"security_undominatable",
		"cop",
		"cop_scared",
		"cop_female",
		"gensec",
		"fbi",
		"swat",
		"heavy_swat",
		"fbi_swat",
		"fbi_heavy_swat",
		"city_swat",
		"gangster",
		"biker",
		"mobster",
		"bolivian",
		"bolivian_indoors",
		"medic",
		"omnia_lpf",
		"city_swat_titan",
		"swat_titan",
		"heavy_swat_sniper",
		"skeleton_swat_titan",
		"taser_titan",
		"weekend_lmg",
		"weekend_dmr",
		"weekend",
		"taser"
	}
	local is_mook = nil
	for _, name in ipairs(mook_units) do
		if data.unit:base()._tweak_table == name then
			is_mook = true
		end
	end

	for u_key, u_data in pairs(managers.groupai:state():all_player_criminals()) do
		if not u_data.status then
			nr_players = nr_players + 1
		end
	end
	
	if data.is_converted or data.unit:in_slot(16) then
		speed = 1.5
	elseif nr_players > 5 then
		speed = 3
	elseif nr_players > 2 and diff_index == 8 and is_mook  then
		speed = 2
	elseif nr_players > 2 and diff_index == 7 and is_mook  then
		speed = 1.75
	elseif nr_players > 2 and diff_index <= 6 and is_mook  then
		speed = 1.5
	elseif diff_index == 8 and is_mook then
		speed = 1.5
	elseif diff_index == 7 and is_mook then
		speed = 1.25
	else
		speed = 1.00 --Just in case it ever ends up here so you don't get a dirty nil value?
	end
	
	if math.abs(error_spin) > 27 then
		local new_action_data = {
			type = "turn",
			body_part = 2,
			speed = speed or 1,
			angle = error_spin
		}

		if data.unit:brain():action_request(new_action_data) then
			my_data.turning = new_action_data.angle

			return true
		end
	end
end

function CopLogicAttack._chk_exit_attack_logic(data, new_reaction)
	if not data.unit:movement():chk_action_forbidden("walk") then
		local wanted_state = CopLogicBase._get_logic_state_from_reaction(data, new_reaction)

		if wanted_state ~= data.name then
			local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, data.objective, nil, nil)

			if allow_trans then
				if obj_failed then
					data.objective_failed_clbk(data.unit, data.objective)
				elseif wanted_state ~= "idle" or not managers.groupai:state():on_cop_jobless(data.unit) then
					CopLogicBase._exit(data.unit, wanted_state)
				end

				CopLogicBase._report_detections(data.detected_attention_objects)
			end
		end
	end
end

]]--