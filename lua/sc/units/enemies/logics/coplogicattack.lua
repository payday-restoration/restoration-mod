--local mvec3_x = mvector3.x
--local mvec3_y = mvector3.y
--local mvec3_z = mvector3.z
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
--local mvec3_lerp = mvector3.lerp
local mvec3_norm = mvector3.normalize
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
--local mvec3_cross = mvector3.cross
--local mvec3_rand_ortho = mvector3.random_orthogonal
--local mvec3_negate = mvector3.negate
--local mvec3_len = mvector3.length
local mvec3_len_sq = mvector3.length_sq
local mvec3_cpy = mvector3.copy
--local mvec3_set_stat = mvector3.set_static
local mvec3_set_length = mvector3.set_length
--local mvec3_angle = mvector3.angle
local mvec3_step = mvector3.step
local mvec3_rotate_with = mvector3.rotate_with

local temp_vecdir = Vector3()
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()

local math_lerp = math.lerp
local math_random = math.random
local math_up = math.UP
local math_abs = math.abs
local math_clamp = math.clamp
local math_min = math.min
local math_max = math.max
local math_sign = math.sign

--local m_rot_x = mrotation.x
--local m_rot_y = mrotation.y
--local m_rot_z = mrotation.z

local table_insert = table.insert
--local table_contains = table.contains

local REACT_AIM = AIAttentionObject.REACT_AIM
local REACT_COMBAT = AIAttentionObject.REACT_COMBAT
local REACT_SHOOT = AIAttentionObject.REACT_SHOOT

--CopLogicAttack = class(CopLogicBase)
--CopLogicAttack.on_alert = CopLogicIdle.on_alert
--CopLogicAttack.on_intimidated = CopLogicIdle.on_intimidated

--[[if old_internal_data.queued_tasks then
	local e_manager = managers.enemy

	if old_internal_data.detection_task_key then
		local task_data = e_manager._queued_tasks[old_internal_data.detection_task_key]

		if task_data then
			CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, task_data.t, true)
		end
	end

	CopLogicBase.cancel_queued_tasks(old_internal_data)
else
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, data.t, data.important and true)
end]]

local _CopLogicAttack_update = CopLogicAttack.update
function CopLogicAttack.update(data)
	_CopLogicAttack_update(data)
	restoration:inform_law_enforcements(data)	
end

function CopLogicAttack.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)
	data.brain:cancel_all_pathing_searches()

	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	my_data.detection = data.char_tweak.detection.combat

	if old_internal_data then
		my_data.turning = old_internal_data.turning
		my_data.firing = old_internal_data.firing
		my_data.shooting = old_internal_data.shooting
		my_data.attention_unit = old_internal_data.attention_unit

		CopLogicAttack._set_best_cover(data, my_data, old_internal_data.best_cover)
	end

	data.internal_data = my_data

	my_data.cover_test_step = 1
	local key_str = tostring(data.key)
	my_data.detection_task_key = "CopLogicAttack._upd_enemy_detection" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, data.t, data.important and true)
	CopLogicIdle._chk_has_old_action(data, my_data)

	my_data.attitude = data.objective and data.objective.attitude or "avoid"
	my_data.weapon_range = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range

	data.brain:set_update_enabled_state(true)

	if data.cool then
		data.unit:movement():set_cool(false)
	end

	local new_stance = nil
	local objective = data.objective
	
	if objective and objective.stance then
		new_stance = objective.stance
	elseif not data.char_tweak.allowed_stances or data.char_tweak.allowed_stances.hos then
		new_stance = "hos"
	elseif data.char_tweak.allowed_stances.cbt then
		new_stance = "cbt"
	end

	if new_stance then
		local upper_body_action = data.unit:movement()._active_actions[3]

		if not upper_body_action or upper_body_action:type() ~= "shoot" then
			data.unit:movement():set_stance(new_stance)
		end
	end

	if my_data ~= data.internal_data then
		return
	end

	if data.objective then
		if data.objective.action_duration or data.objective.action_timeout_t and data.t < data.objective.action_timeout_t then
			my_data.action_timeout_clbk_id = "CopLogicIdle_action_timeout" .. tostring(data.key)
			local action_timeout_t = data.objective.action_timeout_t or data.t + data.objective.action_duration
			data.objective.action_timeout_t = action_timeout_t

			CopLogicBase.add_delayed_clbk(my_data, my_data.action_timeout_clbk_id, callback(CopLogicIdle, CopLogicIdle, "clbk_action_timeout", data), action_timeout_t)
		end
	end

	data.brain:set_attention_settings({
		cbt = true
	})
end

function CopLogicAttack.exit(data, new_logic_name, enter_params)
	CopLogicBase.exit(data, new_logic_name, enter_params)

	local my_data = data.internal_data

	data.brain:cancel_all_pathing_searches()
	TaserLogicAttack._cancel_tase_attempt(data, my_data)
	SpoocLogicAttack._cancel_spooc_attempt(data, my_data)
	CopLogicBase.cancel_queued_tasks(my_data)
	CopLogicBase.cancel_delayed_clbks(my_data)

	if my_data.best_cover then
		managers.navigation:release_cover(my_data.best_cover[1])
	end

	data.brain:rem_pos_rsrv("path")
	data.brain:set_update_enabled_state(true)
end

function CopLogicAttack.update(data)
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)

		if not my_data.update_queue_id then
			data.brain:set_update_enabled_state(false)

			my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(data.key)

			CopLogicAttack.queue_update(data, my_data)
		end

		return
	end
	
	local focus_enemy = data.attention_obj
	
	if my_data.tasing then
		if focus_enemy then
			CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_enemy.m_pos)
		end
		
		if not my_data.update_queue_id then
			my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(data.key)
			CopLogicBase._report_detections(data.detected_attention_objects)
			CopLogicAttack.queue_update(data, my_data)
		end

		return
	end
	
	if my_data.spooc_attack then
		
		if not my_data.update_queue_id then
			my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(data.key)
			CopLogicBase._report_detections(data.detected_attention_objects)
			CopLogicAttack.queue_update(data, my_data)
		end

		return
	end
	
	if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
		SpoocLogicAttack._upd_spooc_attack(data, my_data)
	end

	if my_data.spooc_attack then
		if not my_data.update_queue_id then
			my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(data.key)
			CopLogicAttack.queue_update(data, my_data)
		end

		return
	end

	--if not data.attention_obj or data.attention_obj.reaction < REACT_COMBAT or data.attention_obj.verified_dis > 1500 then
		if CopLogicIdle._chk_relocate(data) then
			return
		end
	--end

	if CopLogicAttack._chk_exit_non_walkable_area(data) then
		return
	end

	CopLogicAttack._process_pathing_results(data, my_data)

	if not data.attention_obj or data.attention_obj.reaction < REACT_AIM then
		CopLogicAttack._upd_enemy_detection(data, true)

		if my_data ~= data.internal_data or not data.attention_obj then
			return
		end
	end

	if REACT_COMBAT <= data.attention_obj.reaction and not my_data.spooc_attack and not my_data.tasing then
		my_data.want_to_take_cover = CopLogicAttack._chk_wants_to_take_cover(data, my_data)

		CopLogicAttack._update_cover(data)
		CopLogicAttack._upd_combat_movement(data)
		if managers.groupai:state():is_smoke_grenade_active() and data.attention_obj.dis < 3000 then
			CopLogicBase.do_smart_grenade(data, my_data, data.attention_obj)
		end
	end
	
	if my_data ~= data.internal_data then
		return
	end

	if data.team.id == "criminal1" then
		if not data.objective or data.objective.type == "free" then
			if not data.path_fail_t or data.t - data.path_fail_t > 6 then
				managers.groupai:state():on_criminal_jobless(data.unit)

				if my_data ~= data.internal_data then
					return
				end
			end
		end
	end

	if not my_data.update_queue_id then
		data.brain:set_update_enabled_state(false)

		my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(data.key)

		CopLogicAttack.queue_update(data, my_data)
	end
end

function CopLogicAttack._upd_combat_movement(data)
	local my_data = data.internal_data
	local t = data.t
	local unit = data.unit
	local focus_enemy = data.attention_obj
	local action_taken = nil
	
	if not focus_enemy then
		--log("how often is this happening")
		return
	end
	
	if not managers.groupai:state():chk_heat_bonus_retreat() then
		my_data.assault_break_retreat_complete = nil
	end
	
	if not my_data.assault_break_retreat_complete and not action_taken and managers.groupai:state():chk_heat_bonus_retreat() then
		action_taken = CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, nil, true)
		if data.char_tweak.chatter and data.char_tweak.chatter.cloakeravoidance then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "cloakeravoidance")
		end
	end

	if data.important and focus_enemy.verified and not my_data.turning and CopLogicAttack._can_move(data) and not unit:movement():chk_action_forbidden("walk") then
		if not my_data.in_cover or not my_data.in_cover[4] then
			if data.is_suppressed and data.t - unit:character_damage():last_suppression_t() < 0.7 then
				action_taken = CopLogicBase.chk_start_action_dodge(data, "scared")
			end

			if not action_taken and focus_enemy.is_person and focus_enemy.aimed_at and focus_enemy.dis < 2000 then
				--if data.group and data.group.size > 1 or math_random() < 0.5 then
					local dodge = nil

					if focus_enemy.is_local_player then
						local e_movement_state = focus_enemy.unit:movement():current_state()

						if not e_movement_state:_is_reloading() and not e_movement_state:_interacting() and not e_movement_state:is_equipping() then
							dodge = true
						end
					else
						local e_anim_data = focus_enemy.unit:anim_data()

						if not e_anim_data.reload then
							if e_anim_data.move or e_anim_data.idle then
								dodge = true
							end
						end
					end

					if dodge then
						action_taken = CopLogicBase.chk_start_action_dodge(data, "preemptive")
					end
				--end
			end
		end
	end

	action_taken = action_taken or data.logic.action_taken(data, my_data) or CopLogicAttack._upd_pose(data, my_data)

	local enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
	local enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
	local want_to_take_cover = my_data.want_to_take_cover

	local move_to_cover, want_flank_cover = nil

	if my_data.cover_test_step ~= 1 and not enemy_visible_softer then
		if action_taken or want_to_take_cover or not my_data.in_cover then
			my_data.cover_test_step = 1
		end
	end

	local remove_stay_out_time = nil

	if my_data.stay_out_time then
		if enemy_visible_soft or not my_data.at_cover_shoot_pos or action_taken or want_to_take_cover then
			remove_stay_out_time = true
		end
	end

	if remove_stay_out_time then
		my_data.stay_out_time = nil
	elseif my_data.attitude == "engage" and not my_data.stay_out_time and not enemy_visible_soft and my_data.at_cover_shoot_pos and not action_taken and not want_to_take_cover then
		my_data.stay_out_time = t + 7
	end
	
	if alive(data.unit:inventory() and data.unit:inventory()._shield_unit) then
		if not action_taken then
			if my_data.pathing_to_optimal_pos then
				-- Nothing
			elseif my_data.walking_to_optimal_pos then
				-- nothing
			elseif my_data.optimal_path then
				action_taken = CopLogicTravel._chk_request_action_walk_to_optimal_pos(data, my_data)
			elseif my_data.optimal_pos and focus_enemy.nav_tracker then
				local to_pos = my_data.optimal_pos
				my_data.optimal_pos = nil
				local ray_params = {
					trace = true,
					tracker_from = unit:movement():nav_tracker(),
					pos_to = to_pos
				}
				local ray_res = managers.navigation:raycast(ray_params)
				to_pos = ray_params.trace[1]

				if ray_res then
					local vec = data.m_pos - to_pos

					mvector3.normalize(vec)

					local fwd = unit:movement():m_fwd()
					local fwd_dot = fwd:dot(vec)

					if fwd_dot > 0 then
						local enemy_tracker = focus_enemy.nav_tracker

						if enemy_tracker:lost() then
							ray_params.tracker_from = nil
							ray_params.pos_from = enemy_tracker:field_position()
						else
							ray_params.tracker_from = enemy_tracker
						end

						ray_res = managers.navigation:raycast(ray_params)
						to_pos = ray_params.trace[1]
					end
				end

				local fwd_bump = nil
				to_pos, fwd_bump = ShieldLogicAttack.chk_wall_distance(data, my_data, to_pos)
				local do_move = mvector3.distance_sq(to_pos, data.m_pos) > 10000 

				if not do_move then
					local to_pos_current, fwd_bump_current = ShieldLogicAttack.chk_wall_distance(data, my_data, data.m_pos)

					if fwd_bump_current then
						do_move = true
					end
				end

				if do_move and not my_data.walking_to_optimal_pos then
					my_data.pathing_to_optimal_pos = true
					my_data.optimal_path_search_id = tostring(unit:key()) .. "optimal"
					local reservation = managers.navigation:reserve_pos(nil, nil, to_pos, callback(CopLogicTravel, CopLogicTravel, "_reserve_pos_step_clbk", {
						unit_pos = data.m_pos
					}), 70, data.pos_rsrv_id)

					if reservation then
						to_pos = reservation.position
					else
						reservation = {
							radius = 60,
							position = mvector3.copy(to_pos),
							filter = data.pos_rsrv_id
						}

						managers.navigation:add_pos_reservation(reservation)
					end

					data.brain:set_pos_rsrv("path", reservation)
					--log("shit")
					data.brain:search_for_path(my_data.optimal_path_search_id, to_pos)
				end
			end
		end
	else
		if data.unit:base():has_tag("takedown") then
			if my_data.pathing_to_optimal_pos then
				-- Nothing
			elseif my_data.walking_to_optimal_pos then
				-- nothing
			elseif my_data.optimal_path then
				action_taken = CopLogicTravel._chk_request_action_walk_to_optimal_pos(data, my_data)
				--do_something_else = nil
			elseif focus_enemy.unit then
				my_data.pathing_to_optimal_pos = true
				my_data.optimal_path_search_id = tostring(unit:key()) .. "optimal"
				data.brain:search_for_path_to_unit(my_data.optimal_path_search_id, focus_enemy.unit)
			end
		elseif data.tactics then
			if my_data.pathing_to_optimal_pos then
				-- Nothing
				--log("im fucking")
			elseif my_data.walking_to_optimal_pos then
				-- nothing
			elseif my_data.optimal_path then
				--my_data.aggro_move_t = t + math.random(0, 1.25)
				action_taken = CopLogicTravel._chk_request_action_walk_to_optimal_pos(data, my_data)
				--do_something_else = nil
			elseif my_data.optimal_pos and focus_enemy.nav_tracker then
				local to_pos = my_data.optimal_pos
				my_data.pathing_to_optimal_pos = true
				my_data.optimal_path_search_id = tostring(unit:key()) .. "optimal"
				data.brain:search_for_path(my_data.optimal_path_search_id, to_pos)
			end
		end
	end
	
	--hitnrun: approach enemies, back away once the enemy is visible, creating a variating degree of aggressiveness
	--eliterangedfire: open fire at enemies from longer distances, back away if the enemy gets too close for comfort
	--spoocavoidance: attempt to approach enemies, if aimed at/seen, retreat away into cover and disengage until ready to try again
	local hitnrunmovementqualify = data.tactics and data.tactics.hitnrun and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1000 and math_abs(data.m_pos.z - data.attention_obj.m_pos.z) < 200
	local spoocavoidancemovementqualify = data.tactics and data.tactics.spoocavoidance and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 2000 and focus_enemy.aimed_at
	local eliterangedfiremovementqualify = data.tactics and data.tactics.elite_ranged_fire and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1500
	
	local ammo_max, ammo = data.unit:inventory():equipped_unit():base():ammo_info()
	local reloadingretreatmovementqualify = ammo / ammo_max < 0.2 and data.tactics and data.tactics.reloadingretreat and focus_enemy and focus_enemy.verified
	
	if not action_taken and want_to_take_cover and not best_cover or not action_taken and hitnrunmovementqualify and not pantsdownchk or not action_taken and eliterangedfiremovementqualify and not pantsdownchk or not action_taken and spoocavoidancemovementqualify and not pantsdownchk or not action_taken and reloadingretreatmovementqualify then
		action_taken = CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, nil)
	end

	if not action_taken then
		if want_to_take_cover then
			move_to_cover = true
		elseif not enemy_visible_soft then
			if data.tactics then
				if data.tactics.charge or data.tactics.flank then
					if not my_data.charge_path_failed_t or data.t - my_data.charge_path_failed_t > 6 then
						if my_data.charge_path then
							local path = my_data.charge_path
							my_data.charge_path = nil

							action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, "run")

							if action_taken then
								check_cover = false
							end
						elseif not my_data.charge_path_search_id and focus_enemy.nav_tracker then
							--maybe just end up leaving flank to groupaistatebase, or use want_flank_cover
							
							--no c:
							
							if data.tactics.flank then
								my_data.charge_pos = CopLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker, my_data.weapon_range.optimal)
							else
								my_data.charge_pos = CopLogicTravel._get_pos_on_wall(focus_enemy.nav_tracker:field_position(), my_data.weapon_range.optimal, 45, nil)
							end

							if my_data.charge_pos then
								check_cover = false

								my_data.charge_path_search_id = "charge" .. tostring(data.key)

								data.brain:search_for_path(my_data.charge_path_search_id, my_data.charge_pos, nil, nil, nil)
							else
									--debug_pause_unit(unit, "failed to find charge_pos", unit)

								my_data.charge_path_failed_t = data.t
							end
						end
					end
				end
			end

			if not action_taken then
				local in_cover = my_data.in_cover

				if in_cover then
					if my_data.cover_test_step <= 2 then
						local height = nil

						if in_cover[4] then --has obstructed high_ray
							height = 150
						else
							height = 80
						end

						local my_tracker = unit:movement():nav_tracker()
						local shoot_from_pos = CopLogicAttack._peek_for_pos_sideways(data, my_data, my_tracker, focus_enemy.m_head_pos, height)

						if shoot_from_pos then
							local path = {
								mvec3_cpy(data.m_pos),
								shoot_from_pos
							}
							action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, "walk")
						else
							my_data.cover_test_step = my_data.cover_test_step + 1
						end
					elseif not enemy_visible_softer then
						if --[[data.tactics and data.tactics.flank or]] math_random() < 0.05 then
							move_to_cover = true
							want_flank_cover = true
						end
					end
				elseif not my_data.walking_to_cover_shoot_pos then
					if my_data.at_cover_shoot_pos then
						if my_data.stay_out_time and my_data.stay_out_time < t then
							move_to_cover = true
						end
					else
						move_to_cover = true
					end
				end
			end
		end
	end

	if want_flank_cover then
		if not my_data.flank_cover then
			local sign = math_random() < 0.5 and -1 or 1
			local step = 30
			my_data.flank_cover = {
				step = step,
				angle = step * sign,
				sign = sign
			}
		end
	else
		my_data.flank_cover = nil
	end

	if not action_taken then
		if not my_data.cover_path_failed_t or data.t - my_data.cover_path_failed_t > 5 then
			local best_cover = my_data.best_cover

			if best_cover and not my_data.processing_cover_path and not my_data.cover_path and not my_data.charge_path_search_id then
				local in_cover = my_data.in_cover

				if not in_cover or best_cover[1] ~= in_cover[1] then
					CopLogicAttack._cancel_cover_pathing(data, my_data)

					local search_id = tostring(unit:key()) .. "cover"

					if data.brain:search_for_path_to_cover(search_id, best_cover[1], best_cover[5]) then
						my_data.cover_path_search_id = search_id
						my_data.processing_cover_path = best_cover
					end
				end
			end
		end
	end

	if not action_taken and move_to_cover and my_data.cover_path then
		action_taken = CopLogicAttack._chk_request_action_walk_to_cover(data, my_data)
	end

	action_taken = action_taken or CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
end

function CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, vis_required, assault_break)
	local can_perform_walk_action = not data.unit:movement():chk_action_forbidden("walk") and not my_data.turning or data.unit:anim_data().act_idle
	
	if not can_perform_walk_action then
		return
	end
	
	if focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and CopLogicAttack._can_move(data) then
		local from_pos = mvec3_cpy(data.m_pos)
		local threat_tracker = focus_enemy.nav_tracker
		local threat_head_pos = focus_enemy.m_head_pos
		local max_walk_dis = 400
		local pose = data.is_suppressed and "crouch" or "stand"
		local end_pose = pose
		
		local pantsdownchk = nil
	
		if focus_enemy.is_person and focus_enemy.is_husk_player or focus_enemy.is_person and focus_enemy.is_local_player then
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
		
		if assault_break then 	
			max_walk_dis = 5000
			vis_required = nil
		elseif data.tactics and data.tactics.hitnrun then
			max_walk_dis = 800
		elseif data.tactics and data.tactics.elite_ranged_fire then
			max_walk_dis = 2000
			vis_required = true
		elseif data.tactics and data.tactics.spoocavoidance then
			max_walk_dis = 1500
		elseif data.tactics and data.tactics.reloadingretreat then
			max_walk_dis = 1500
		else
			max_walk_dis = 400
		end
		
		if pose == "crouch" and not data.char_tweak.crouch_move then
			pose = "stand"
		end

		if data.char_tweak.allowed_poses then
			if not data.char_tweak.allowed_poses.crouch then
				pose = "stand"
				end_pose = "stand"
			elseif not data.char_tweak.allowed_poses.stand then
				pose = "crouch"
				end_pose = "crouch"
			end
		end

		local retreat_to = CopLogicAttack._find_retreat_position(data, from_pos, focus_enemy.m_pos, threat_head_pos, threat_tracker, max_walk_dis, vis_required, end_pose)

		if retreat_to then
			CopLogicAttack._cancel_cover_pathing(data, my_data)

			local new_action_data = {
				variant = "walk",
				body_part = 2,
				type = "walk",
				nav_path = {
					from_pos,
					retreat_to
				},
				pose = pose,
				end_pose = end_pose
			}
			my_data.surprised = data.brain:action_request(new_action_data)

			if my_data.surprised then
				
				if assault_break then
					my_data.assault_break_retreat_complete = true
				end
				
				local flash = nil
					
				if data.tactics then
					if data.tactics.smoke_grenade or data.tactics.flash_grenade then
						if data.tactics.smoke_grenade and data.tactics.flash_grenade then
							local flashchance = math.random()
								
							if flashchance < 0.5 then
								flash = true
							end
						else
							if data.tactics.flash_grenade then
								flash = true
							end
						end
								
						CopLogicBase.do_grenade(data, data.m_pos + math.UP * 5, flash, true)
					end
				end
					
				if data.tactics and data.tactics.elite_ranged_fire then
					if not data.unit:in_slot(16) and data.char_tweak.chatter.dodge then
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "dodge")
					end
				end

				return true
			end
		end
	end
end

function CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	local reservation = {
		radius = 30,
		position = data.m_pos,
		filter = data.pos_rsrv_id
	}

	if not managers.navigation:is_pos_free(reservation) then
		local to_pos = CopLogicTravel._get_pos_on_wall(data.m_pos, 500)

		if to_pos then
			local path = {
				mvec3_cpy(data.m_pos),
				to_pos
			}

			return CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, "run")
		end
	end
end

function CopLogicAttack.queued_update(data)
	local my_data = data.internal_data
	data.t = TimerManager:game():time()

	CopLogicAttack.update(data)

	if data.internal_data == my_data then
		CopLogicAttack.queue_update(data, data.internal_data)
	end
end

function CopLogicAttack._peek_for_pos_sideways(data, my_data, from_racker, peek_to_pos, height)
	local unit = data.unit
	local my_tracker = from_racker
	local enemy_pos = peek_to_pos
	local my_pos = unit:movement():m_pos()
	local back_vec = my_pos - enemy_pos

	mvec3_set_z(back_vec, 0)
	mvec3_set_length(back_vec, 75)

	local back_pos = my_pos + back_vec
	local ray_params = {
		allow_entry = true,
		trace = true,
		tracker_from = my_tracker,
		pos_to = back_pos
	}
	local ray_res = managers.navigation:raycast(ray_params)
	back_pos = ray_params.trace[1]
	local back_polar = (back_pos - my_pos):to_polar()
	local right_polar = back_polar:with_spin(back_polar.spin + 90):with_r(100 + 80 * my_data.cover_test_step)
	local right_vec = right_polar:to_vector()
	local right_pos = back_pos + right_vec
	ray_params.pos_to = right_pos
	local ray_res = managers.navigation:raycast(ray_params)
	local shoot_from_pos, found_shoot_from_pos = nil
	local ray_softness = 150
	local stand_ray = unit:raycast("ray", ray_params.trace[1] + math_up * height, enemy_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

	if not stand_ray or mvec3_dis(stand_ray.position, enemy_pos) < ray_softness then
		shoot_from_pos = ray_params.trace[1]
		found_shoot_from_pos = true
	end

	if not found_shoot_from_pos then
		local left_pos = back_pos - right_vec
		ray_params.pos_to = left_pos
		local ray_res = managers.navigation:raycast(ray_params)
		local stand_ray = unit:raycast("ray", ray_params.trace[1] + math_up * height, enemy_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

		if not stand_ray or mvec3_dis(stand_ray.position, enemy_pos) < ray_softness then
			shoot_from_pos = ray_params.trace[1]
		end
	end

	return shoot_from_pos
end

function CopLogicAttack._cancel_cover_pathing(data, my_data)
	if my_data.processing_cover_path then
		if data.active_searches[my_data.cover_path_search_id] then
			managers.navigation:cancel_pathing_search(my_data.cover_path_search_id)

			data.active_searches[my_data.cover_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.cover_path_search_id] = nil
		end

		my_data.processing_cover_path = nil
		my_data.cover_path_search_id = nil
	end

	my_data.cover_path = nil
end

function CopLogicAttack._cancel_charge(data, my_data)
	my_data.charge_pos = nil
	my_data.charge_path = nil

	if my_data.charge_path_search_id then
		if data.active_searches[my_data.charge_path_search_id] then
			managers.navigation:cancel_pathing_search(my_data.charge_path_search_id)

			data.active_searches[my_data.charge_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.charge_path_search_id] = nil
		end

		my_data.charge_path_search_id = nil
	end
end

function CopLogicAttack._cancel_expected_pos_path(data, my_data)
	my_data.expected_pos_path = nil

	if my_data.expected_pos_path_search_id then
		if data.active_searches[my_data.expected_pos_path_search_id] then
			managers.navigation:cancel_pathing_search(my_data.expected_pos_path_search_id)

			data.active_searches[my_data.expected_pos_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.expected_pos_path_search_id] = nil
		end

		my_data.expected_pos_path_search_id = nil
	end
end

function CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, my_pos, enemy_pos)
	local fwd = data.unit:movement():m_rot():y()
	local target_vec = enemy_pos - my_pos
	local error_spin = target_vec:to_polar_with_reference(fwd, math_up).spin

	if math_abs(error_spin) > 27 then
		local new_action_data = {
			type = "turn",
			body_part = 2,
			angle = error_spin
		}

		if data.brain:action_request(new_action_data) then
			my_data.turning = new_action_data.angle

			return true
		end
	end
end

function CopLogicAttack._cancel_walking_to_cover(data, my_data, skip_action)
	my_data.cover_path = nil

	if my_data.moving_to_cover then
		if not skip_action then
			local new_action = {
				body_part = 2,
				type = "idle"
			}

			data.brain:action_request(new_action)
		end
	elseif my_data.processing_cover_path then
		data.brain:cancel_all_pathing_searches()

		my_data.cover_path_search_id = nil
		my_data.processing_cover_path = nil
	end
end

function CopLogicAttack._chk_request_action_walk_to_cover(data, my_data)
	CopLogicAttack._correct_path_start_pos(data, my_data.cover_path)

	local haste = nil

	if not data.attention_obj or data.attention_obj.reaction < REACT_COMBAT or data.attention_obj.dis > 500 then
		if mvec3_dis_sq(my_data.cover_path[#my_data.cover_path], data.m_pos) < 90000 then
			haste = "run"
		end
	end

	if not haste and data.attention_obj and REACT_COMBAT <= data.attention_obj.reaction and math_lerp(my_data.weapon_range.optimal, my_data.weapon_range.far, 0.75) < data.attention_obj.dis then
		haste = "run"
	end

	haste = haste or "walk"

	local pose = data.is_suppressed and "crouch" or "stand"
	local end_pose = my_data.moving_to_cover and "crouch" or "stand"

	if pose == "crouch" and not data.char_tweak.crouch_move then
		pose = "stand"
	end

	if data.char_tweak.allowed_poses then
		if not data.char_tweak.allowed_poses.crouch then
			pose = "stand"
			end_pose = "stand"
		elseif not data.char_tweak.allowed_poses.stand then
			pose = "crouch"
			end_pose = "crouch"
		end
	end

	local new_action_data = {
		type = "walk",
		body_part = 2,
		nav_path = my_data.cover_path,
		variant = haste,
		pose = pose,
		end_pose = end_pose
	}
	my_data.cover_path = nil
	my_data.cover_movement = data.brain:action_request(new_action_data)

	if my_data.cover_movement then
		my_data.moving_to_cover = my_data.best_cover
		my_data.at_cover_shoot_pos = nil
		my_data.in_cover = nil

		data.brain:rem_pos_rsrv("path")

		return true
	end
end

function CopLogicAttack._correct_path_start_pos(data, path)
	local first_nav_point = path[1]
	local my_pos = data.m_pos

	if first_nav_point.x ~= my_pos.x or first_nav_point.y ~= my_pos.y then
		table_insert(path, 1, mvec3_cpy(my_pos))
	end
end

function CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, speed)
	CopLogicAttack._cancel_cover_pathing(data, my_data)
	CopLogicAttack._cancel_charge(data, my_data)
	CopLogicAttack._correct_path_start_pos(data, path)

	local pose = data.is_suppressed and "crouch" or "stand"
	local end_pose = pose

	if pose == "crouch" and not data.char_tweak.crouch_move then
		pose = "stand"
	end

	if data.char_tweak.allowed_poses then
		if not data.char_tweak.allowed_poses.crouch then
			pose = "stand"
			end_pose = "stand"
		elseif not data.char_tweak.allowed_poses.stand then
			pose = "crouch"
			end_pose = "crouch"
		end
	end

	local new_action_data = {
		body_part = 2,
		type = "walk",
		nav_path = path,
		variant = speed or "walk",
		pose = pose,
		end_pose = end_pose
	}
	my_data.cover_path = nil
	my_data.walking_to_cover_shoot_pos = data.brain:action_request(new_action_data)

	if my_data.walking_to_cover_shoot_pos then
		my_data.at_cover_shoot_pos = nil
		my_data.in_cover = nil

		data.brain:rem_pos_rsrv("path")

		return true
	end
end

function CopLogicAttack._chk_request_action_crouch(data)
	if data.unit:anim_data().crouch or data.unit:movement():chk_action_forbidden("crouch") then
		return
	end

	local new_action_data = {
		body_part = 4,
		type = "crouch"
	}
	local res = data.brain:action_request(new_action_data)

	return res
end

function CopLogicAttack._chk_request_action_stand(data)
	if data.unit:anim_data().stand or data.unit:movement():chk_action_forbidden("stand") then
		return
	end

	local new_action_data = {
		body_part = 4,
		type = "stand"
	}
	local res = data.brain:action_request(new_action_data)

	return res
end

function CopLogicAttack._update_cover(data)
	local my_data = data.internal_data
	local best_cover = my_data.best_cover
	local satisfied = true
	local my_pos = data.m_pos
	local focus_enemy = data.attention_obj

	if focus_enemy and focus_enemy.nav_tracker and REACT_COMBAT <= focus_enemy.reaction then
		local find_new_cover = not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised

		if find_new_cover then
			local threat_pos = focus_enemy.nav_tracker:field_position()

			if data.objective and data.objective.type == "follow" then
				if not my_data.processing_cover_path and not my_data.charge_path_search_id then
					local near_pos = data.objective.follow_unit:movement():nav_tracker():field_position() --small clarification, follow_unit and focus_enemy can easily not be the same thing -- also using field_position if possible for valid navigation purposes

					if not best_cover or not CopLogicAttack._verify_follow_cover(best_cover[1], near_pos, threat_pos, 200, 1000) then
						local follow_unit_area = managers.groupai:state():get_area_from_nav_seg_id(data.objective.follow_unit:movement():nav_tracker():nav_segment())
						local max_near_dis = data.objective.distance and data.objective.distance * 0.9 or nil
						local found_cover = managers.navigation:find_cover_in_nav_seg_3(follow_unit_area.nav_segs, max_near_dis, near_pos, threat_pos)

						if found_cover then
							if not best_cover or CopLogicAttack._verify_follow_cover(found_cover, near_pos, threat_pos, 200, 1000) then
								local better_cover = {
									found_cover
								}

								local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)

								if offset_pos then
									better_cover[5] = offset_pos
									better_cover[6] = yaw
								end

								CopLogicAttack._set_best_cover(data, my_data, better_cover)
							else
								satisfied = false
							end
						else
							satisfied = false
						end
					end
				end
			elseif not my_data.processing_cover_path and not my_data.charge_path_search_id then
				local want_to_take_cover = my_data.want_to_take_cover
				local flank_cover = my_data.flank_cover --this not being nil also means the unit wants a flanking cover position
				local min_dis, max_dis = nil

				if want_to_take_cover then
					min_dis = math_max(focus_enemy.dis * 0.9, focus_enemy.dis - 200)
				end

				if not best_cover or flank_cover or not CopLogicAttack._verify_cover(best_cover[1], threat_pos, min_dis, max_dis) then
					local my_vec = my_pos - threat_pos

					if flank_cover then
						mvec3_rotate_with(my_vec, Rotation(flank_cover.angle))
					end

					local optimal_dis = my_vec:length()

					if want_to_take_cover then
						if optimal_dis < my_data.weapon_range.far then
							optimal_dis = optimal_dis + 400

							mvec3_set_length(my_vec, optimal_dis)
						end

						max_dis = math_max(optimal_dis + 800, my_data.weapon_range.far)
					elseif optimal_dis > my_data.weapon_range.optimal * 1.2 then
						optimal_dis = my_data.weapon_range.optimal

						mvec3_set_length(my_vec, optimal_dis)

						max_dis = my_data.weapon_range.far
					end

					local my_side_pos = threat_pos + my_vec

					mvec3_set_length(my_vec, max_dis)

					local furthest_side_pos = threat_pos + my_vec

					if flank_cover then
						local angle = flank_cover.angle
						local sign = flank_cover.sign

						if math_sign(angle) ~= sign then
							angle = -angle + flank_cover.step * sign

							if math_abs(angle) > 90 then
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
						cone_angle = math_lerp(90, 60, math_min(1, optimal_dis / 3000))
					end

					local search_nav_seg = nil

					if data.objective and data.objective.type == "defend_area" then
						search_nav_seg = data.objective.area and data.objective.area.nav_segs or data.objective.nav_seg
					end
					
					if my_data.optimal_pos then
						my_side_pos = my_data.optimal_pos
					end

					local found_cover = managers.navigation:find_cover_in_cone_from_threat_pos_1(threat_pos, furthest_side_pos, my_side_pos, nil, cone_angle, nil, search_nav_seg, nil, data.pos_rsrv_id)

					if found_cover then
						if not best_cover or CopLogicAttack._verify_cover(found_cover, threat_pos, min_dis, max_dis) then
							local better_cover = {
								found_cover
							}

							local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)

							if offset_pos then
								better_cover[5] = offset_pos
								better_cover[6] = yaw
							end

							CopLogicAttack._set_best_cover(data, my_data, better_cover)
						else
							satisfied = false
						end
					else
						satisfied = false
					end
				end
			end
		end

		local in_cover = my_data.in_cover

		if in_cover then
			local threat_pos = focus_enemy.verified_pos

			in_cover[3], in_cover[4] = CopLogicAttack._chk_covered(data, my_pos, threat_pos, data.visibility_slotmask)
		end
	elseif best_cover then
		local cover_release_dis_sq = 10000

		if cover_release_dis_sq < mvec3_dis_sq(best_cover[1][1], my_pos) then
			CopLogicAttack._set_best_cover(data, my_data, nil)
		end
	end
end

function CopLogicAttack._verify_cover(cover, threat_pos, min_dis, max_dis)
	local threat_dis = mvec3_dir(temp_vec1, cover[1], threat_pos)

	if min_dis and threat_dis < min_dis or max_dis and max_dis < threat_dis then
		return
	end

	local cover_dot = mvec3_dot(temp_vec1, cover[2])

	if cover_dot < 0.67 then
		return
	end

	return true
end

function CopLogicAttack._verify_follow_cover(cover, near_pos, threat_pos, min_dis, max_dis)
	if mvec3_dis(near_pos, cover[1]) < 600 and CopLogicAttack._verify_cover(cover, threat_pos, min_dis, max_dis) then
		return true
	end
end

function CopLogicAttack._chk_covered(data, cover_pos, threat_pos, slotmask)
	local ray_from = temp_vec1

	mvec3_set(ray_from, math_up)
	mvec3_mul(ray_from, 80)
	mvec3_add(ray_from, cover_pos)

	local ray_to_pos = temp_vec2

	mvec3_step(ray_to_pos, ray_from, threat_pos, 300)

	local low_ray = data.unit:raycast("ray", ray_from, ray_to_pos, "slot_mask", slotmask, "ray_type", "ai_vision", "report")
	local high_ray = nil

	if low_ray then
		mvec3_set_z(ray_from, ray_from.z + 70)
		mvec3_step(ray_to_pos, ray_from, threat_pos, 300)

		high_ray = data.unit:raycast("ray", ray_from, ray_to_pos, "slot_mask", slotmask, "ray_type", "ai_vision", "report")
	end

	return low_ray, high_ray
end

function CopLogicAttack._process_pathing_results(data, my_data)
	if not data.pathing_results then
		return
	end

	local pathing_results = data.pathing_results
	data.pathing_results = nil
	local path = pathing_results[my_data.cover_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.cover_path = path
			my_data.cover_path_failed_t = nil
		else
			--print(data.unit, "[CopLogicAttack._process_pathing_results] cover path failed", data.unit)
			CopLogicAttack._set_best_cover(data, my_data, nil)

			my_data.cover_path_failed_t = data.t
		end

		my_data.processing_cover_path = nil
		my_data.cover_path_search_id = nil
	end
	
	local path = pathing_results[my_data.optimal_path_search_id]
		
	if path then
		--log("ghsanh")
		if path ~= "failed" then
			--log("hgh")
			my_data.optimal_path = path
		else
			my_data.optimal_path_fail_t = data.t
		end

		my_data.pathing_to_optimal_pos = nil
		my_data.optimal_path_search_id = nil
	end

	path = pathing_results[my_data.charge_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.charge_path = path
			my_data.charge_path_failed_t = nil
		--else
			--print("[CopLogicAttack._process_pathing_results] charge path failed", data.unit)
		end

		my_data.charge_path_search_id = nil
		my_data.charge_path_failed_t = data.t
	end

	path = pathing_results[my_data.expected_pos_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.expected_pos_path = path
		end

		my_data.expected_pos_path_search_id = nil
	end
end

function CopLogicAttack._upd_enemy_detection(data, is_synchronous)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local min_reaction = not managers.groupai:state():whisper_mode() and REACT_AIM
	
	local delay = CopLogicBase._upd_attention_obj_detection(data, min_reaction, nil)
	local detected_enemies = data.detected_attention_objects
	local tasing = my_data.tasing
	local tased_u_key = tasing and tasing.target_u_key
	local tase_in_effect = nil
	local get_new_target = true

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
	
	local reaction_func = nil
	
	if data.unit:base():has_tag("taser") then
		reaction_func = TaserLogicAttack._chk_reaction_to_attention_object
	elseif data.unit:base():has_tag("spooc") then
		reaction_func = SpoocLogicAttack.chk_reaction_to_attention_object
	end
	
	local path_fail_t_chk = 0.5
	if not my_data.optimal_path_fail_t or my_data.optimal_path_fail_t - data.t > path_fail_t_chk then
		if data.important and alive(data.unit:inventory() and data.unit:inventory()._shield_unit) then
			local focus_enemy, focus_enemy_angle, focus_enemy_reaction = nil
			local enemies = {}
			local enemies_cpy = {}
			local passive_enemies = {}
			local threat_epicenter, threats = nil
			local nr_threats = 0
			local verified_chk_t = data.t - 8
			for key, enemy_data in pairs(detected_enemies) do
				if AIAttentionObject.REACT_COMBAT <= enemy_data.reaction and enemy_data.identified and enemy_data.verified_t and verified_chk_t < enemy_data.verified_t then
					enemies[key] = enemy_data
					enemies_cpy[key] = enemy_data
				end
			end

			for key, enemy_data in pairs(enemies) do
				threat_epicenter = threat_epicenter or Vector3()

				mvector3.add(threat_epicenter, enemy_data.m_pos)

				nr_threats = nr_threats + 1
				enemy_data.aimed_at = CopLogicIdle.chk_am_i_aimed_at(data, enemy_data, enemy_data.aimed_at and 0.95 or 0.985)
			end

			if threat_epicenter then
				mvector3.divide(threat_epicenter, nr_threats)

				local from_threat = mvector3.copy(threat_epicenter)

				mvector3.subtract(from_threat, data.m_pos)
				mvector3.normalize(from_threat)

				local furthest_pt_dist = 0
				local furthest_line = nil

				if not my_data.threat_epicenter or mvector3.distance(threat_epicenter, my_data.threat_epicenter) > 100 then
					my_data.threat_epicenter = mvector3.copy(threat_epicenter)

					for key1, enemy_data1 in pairs(enemies) do
						enemies_cpy[key1] = nil

						for key2, enemy_data2 in pairs(enemies_cpy) do
							if nr_threats == 2 then
								local AB = mvector3.copy(enemy_data1.m_pos)

								mvector3.subtract(AB, enemy_data2.m_pos)
								mvector3.normalize(AB)

								local PA = mvector3.copy(data.m_pos)

								mvector3.subtract(PA, enemy_data1.m_pos)
								mvector3.normalize(PA)

								local PB = mvector3.copy(data.m_pos)

								mvector3.subtract(PB, enemy_data2.m_pos)
								mvector3.normalize(PB)

								local dot1 = mvector3.dot(AB, PA)
								local dot2 = mvector3.dot(AB, PB)

								if dot1 < 0 and dot2 < 0 or dot1 > 0 and dot2 > 0 then
									break
								else
									furthest_line = {
										enemy_data1.m_pos,
										enemy_data2.m_pos
									}

									break
								end
							end

							local pt = math.line_intersection(enemy_data1.m_pos, enemy_data2.m_pos, threat_epicenter, data.m_pos)
							local to_pt = mvector3.copy(threat_epicenter)

							mvector3.subtract(to_pt, pt)
							mvector3.normalize(to_pt)

							if mvector3.dot(from_threat, to_pt) > 0 then
								local line = mvector3.copy(enemy_data2.m_pos)

								mvector3.subtract(line, enemy_data1.m_pos)

								local line_len = mvector3.normalize(line)
								local pt_line = mvector3.copy(pt)

								mvector3.subtract(pt_line, enemy_data1.m_pos)

								local dot = mvector3.dot(line, pt_line)

								if dot < line_len and dot > 0 then
									local dist = mvector3.distance(pt, threat_epicenter)

									if furthest_pt_dist < dist then
										furthest_pt_dist = dist
										furthest_line = {
											enemy_data1.m_pos,
											enemy_data2.m_pos
										}
									end
								end
							end
						end
					end
				end

				local optimal_direction = nil

				if furthest_line then
					local BA = mvector3.copy(furthest_line[2])

					mvector3.subtract(BA, furthest_line[1])

					local PA = mvector3.copy(furthest_line[1])

					mvector3.subtract(PA, data.m_pos)

					local out = nil

					if nr_threats == 2 then
						mvector3.normalize(BA)

						local len = mvector3.dot(BA, PA)
						local x = mvector3.copy(furthest_line[1])

						mvector3.multiply(BA, len)
						mvector3.subtract(x, BA)

						out = mvector3.copy(data.m_pos)

						mvector3.subtract(out, x)
					else
						local EA = mvector3.copy(threat_epicenter)

						mvector3.subtract(EA, furthest_line[1])

						local rot_axis = Vector3()

						mvector3.cross(rot_axis, BA, EA)
						mvector3.set_static(rot_axis, 0, 0, rot_axis.z)

						out = Vector3()

						mvector3.cross(out, BA, rot_axis)
					end

					mvector3.normalize(out)

					optimal_direction = mvector3.copy(out)

					mvector3.multiply(optimal_direction, -1)
					mvector3.multiply(out, mvector3.dot(out, PA) + 600)

					my_data.optimal_pos = mvector3.copy(data.m_pos)

					mvector3.add(my_data.optimal_pos, out)
				else
					optimal_direction = mvector3.copy(threat_epicenter)

					mvector3.subtract(optimal_direction, data.m_pos)
					mvector3.normalize(optimal_direction)

					local optimal_length = 0

					for _, enemy in pairs(enemies) do
						local enemy_dir = mvector3.copy(threat_epicenter)

						mvector3.subtract(enemy_dir, enemy.m_pos)

						local len = mvector3.dot(enemy_dir, optimal_direction)
						optimal_length = math.max(len, optimal_length)
					end

					local optimal_pos = mvector3.copy(optimal_direction)

					mvector3.multiply(optimal_pos, -(optimal_length + 600))
					mvector3.add(optimal_pos, threat_epicenter)

					my_data.optimal_pos = optimal_pos
				end
				
				--if my_data.optimal_pos then
				--	local draw_duration = 2
				--	local lineshield = Draw:brush(Color.green:with_alpha(0.5), draw_duration)
				--	lineshield:cylinder(data.m_pos, my_data.optimal_pos, 4)
				--end

				for key, enemy_data in pairs(enemies) do
					local reaction = CopLogicSniper._chk_reaction_to_attention_object(data, enemy_data, true)

					if not focus_enemy_reaction or focus_enemy_reaction <= reaction then
						local enemy_dir = temp_vecdir

						mvector3.direction(enemy_dir, data.m_pos, enemy_data.m_pos)

						local angle = mvector3.dot(optimal_direction, enemy_dir)

						if data.attention_obj and key == data.attention_obj.u_key then
							angle = angle + 0.15
						end

						if not focus_enemy or enemy_data.verified and not focus_enemy.verified or (enemy_data.verified or not focus_enemy.verified) and focus_enemy_angle < angle then
							focus_enemy = enemy_data
							focus_enemy_angle = angle
							focus_enemy_reaction = reaction
						end
					end
				end

				CopLogicBase._set_attention_obj(data, focus_enemy, focus_enemy_reaction)
				get_new_target = nil
			end
		end
	end
	
	if my_data ~= data.internal_data then
		return
	end
		
	if get_new_target then
		local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, detected_enemies, reaction_func)
		local old_att_obj = data.attention_obj
	
		CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
		--CopLogicAttack._chk_exit_attack_logic(data, new_reaction) pretty sure enemies will find a reason to leave attack logic anyways probably, this is the main source of that coplogicattack crash too, im 100% on that

		if new_attention then
			if my_data.att_cover_charge_chk or old_att_obj and old_att_obj.u_key ~= new_attention.u_key then
				if new_attention.verified then
					my_data.att_cover_charge_chk = nil

					CopLogicAttack._cancel_charge(data, my_data)
					
					if not data.unit:movement():chk_action_forbidden("walk") then
						ShieldLogicAttack._cancel_optimal_attempt(data, my_data)
					end
					
					my_data.flank_cover = nil

					if not data.unit:movement():chk_action_forbidden("walk") then
						CopLogicAttack._cancel_walking_to_cover(data, my_data)
					end

					CopLogicAttack._set_best_cover(data, my_data, nil)
				elseif not my_data.att_cover_charge_chk then
					my_data.att_cover_charge_chk = true
				end
			end
		end
			
		if new_attention and new_reaction then
			local path_fail_t_chk = data.important and 0.5 or 2
			if not my_data.optimal_path_fail_t or my_data.optimal_path_fail_t - data.t > path_fail_t_chk then
				if data.important and AIAttentionObject.REACT_COMBAT <= new_reaction and new_attention.nav_tracker and not my_data.walking_to_optimal_pos then
					if alive(data.unit:inventory() and data.unit:inventory()._shield_unit) then
						my_data.optimal_pos = CopLogicAttack._find_flank_pos(data, my_data, new_attention.nav_tracker)
					elseif data.is_suppressed and new_attention.verified then
						local retreat_pos = CopLogicAttack._find_retreat_position(data, data.m_pos, new_attention.m_pos, new_attention.m_head_pos, new_attention.nav_tracker, 2000, nil)
						if retreat_pos then
							my_data.optimal_pos = retreat_pos
							--log("woo!")
							--if my_data.optimal_pos then
							--	local draw_duration = 2
							--	local line1 = Draw:brush(Color.yellow:with_alpha(0.5), draw_duration)
							--	line1:cylinder(data.m_pos, my_data.optimal_pos, 2)
							--end
						else
							my_data.optimal_path_fail_t = data.t
						end
					elseif data.is_suppressed and not new_attention.verified then
						local threat_pos = nil
							
						if not my_data.cover_test_step then
							my_data.cover_test_step = 1
						end
							
						if new_attention.last_verified_pos then
							threat_pos = new_attention.last_verified_pos
						elseif new_attention.is_person then
							threat_pos = new_attention.m_head_pos
						else
							threat_pos = new_attention.m_pos
						end
							
						local my_tracker = data.unit:movement():nav_tracker()
						local shoot_from_pos = CopLogicTravel._peek_for_pos_sideways(data, my_data, my_tracker, threat_pos, nil)
							
						if shoot_from_pos then
							my_data.optimal_pos = shoot_from_pos
							--log("beeftime")
							--if my_data.optimal_pos then
							--	local draw_duration = 2
							--	local line2 = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
							--	line2:cylinder(data.m_pos, my_data.optimal_pos, 2)
							--end
						elseif not data.unit:movement():chk_action_forbidden("walk") then
							ShieldLogicAttack._cancel_optimal_attempt(data, my_data)
							my_data.cover_test_step = my_data.cover_test_step + 1
							my_data.optimal_path_fail_t = data.t
						end
					elseif data.tactics and data.tactics.flank then
						local flank_pos = CopLogicAttack._find_flank_pos(data, my_data, new_attention.nav_tracker)
						
						if flank_pos then
							my_data.optimal_pos = flank_pos		
		                    if data.char_tweak.chatter and data.char_tweak.chatter.look_for_angle then		
						        managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "look_for_angle" )
							    --log("flank chatter")
		                    end
							--if my_data.optimal_pos then
							--	local draw_duration = 2
							--	local line3 = Draw:brush(Color.blue:with_alpha(0.5), draw_duration)
							--	line3:cylinder(data.m_pos, my_data.optimal_pos, 2)
							--end
						else
							my_data.optimal_path_fail_t = data.t
						end
					elseif data.tactics and data.tactics.charge then
						local charge_pos = CopLogicTravel._get_pos_on_wall(new_attention.nav_tracker:field_position(), my_data.weapon_range.close, 45, nil)
						
						if charge_pos then
							my_data.optimal_pos = charge_pos	
							--if my_data.optimal_pos then
							--	local draw_duration = 2
							--	local line4 = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
							--	line4:cylinder(data.m_pos, my_data.optimal_pos, 2)
							--end
						else
							my_data.optimal_path_fail_t = data.t
						end
					end
				end
			end
		end
	elseif old_att_obj then
		CopLogicAttack._cancel_charge(data, my_data)
		
		if not data.unit:movement():chk_action_forbidden("walk") then
			ShieldLogicAttack._cancel_optimal_attempt(data, my_data)
		end
		
		my_data.flank_cover = nil
		my_data.att_cover_charge_chk = nil
	end
	
	if my_data ~= data.internal_data then
		return
	end

	CopLogicBase._chk_call_the_police(data)

	if my_data ~= data.internal_data then
		return
	end
	
	CopLogicAttack._upd_aim(data, my_data)
	
	if my_data ~= data.internal_data then
		return
	end

	if not is_synchronous and my_data == data.internal_data and my_data.detection_task_key then
		CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, data.t + delay, data.important and true)
	end

	CopLogicBase._report_detections(data.detected_attention_objects)
end

function CopLogicAttack._confirm_retreat_position(data, retreat_pos, threat_head_pos, threat_tracker, end_pose)
	local ray_params = {
		trace = true,
		pos_from = retreat_pos,
		tracker_to = threat_tracker
	}
	local walk_ray_res = managers.navigation:raycast(ray_params)

	if not walk_ray_res then
		return true
	end

	local retreat_head_pos = mvec3_cpy(retreat_pos)

	if end_pose == "stand" then
		mvec3_set_z(retreat_head_pos, retreat_head_pos.z + 150)
	else
		mvec3_set_z(retreat_head_pos, retreat_head_pos.z + 80)
	end

	local ray_res = data.unit:raycast("ray", retreat_head_pos, threat_head_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")

	if not ray_res then
		return true
	end

	return false
end

function CopLogicAttack._find_retreat_position(data, from_pos, threat_pos, threat_head_pos, threat_tracker, max_dist, vis_required, end_pose)
	local nav_manager = managers.navigation
	local nr_rays = 6
	local ray_dis = max_dist or 1000
	local step = 180 / nr_rays
	local offset = math_random(step)
	local dir = math_random() < 0.5 and -1 or 1
	step = step * dir
	local step_rot = Rotation(step)
	local offset_rot = Rotation(offset)
	local offset_vec = mvec3_cpy(threat_pos)

	mvec3_sub(offset_vec, from_pos)
	mvec3_norm(offset_vec)
	mvec3_mul(offset_vec, ray_dis)
	mvec3_rotate_with(offset_vec, Rotation((90 + offset) * dir))

	local to_pos = nil
	local from_tracker = nav_manager:create_nav_tracker(from_pos)
	local ray_params = {
		trace = true,
		tracker_from = from_tracker
	}
	local rsrv_desc = {
		radius = 60
	}
	local fail_position = nil

	repeat
		to_pos = mvec3_cpy(from_pos)

		mvec3_add(to_pos, offset_vec)

		ray_params.pos_to = to_pos
		local ray_res = nav_manager:raycast(ray_params)

		if ray_res then
			rsrv_desc.position = ray_params.trace[1]
			local is_free = nav_manager:is_pos_free(rsrv_desc)

			if is_free then
				if not vis_required or CopLogicAttack._confirm_retreat_position(data, ray_params.trace[1], threat_head_pos, threat_tracker, end_pose) then
					nav_manager:destroy_nav_tracker(from_tracker)

					return ray_params.trace[1]
				end
			end
		elseif not fail_position then
			rsrv_desc.position = ray_params.trace[1]
			local is_free = nav_manager:is_pos_free(rsrv_desc)

			if is_free then
				fail_position = ray_params.trace[1]
			end
		end

		mvec3_rotate_with(offset_vec, step_rot)

		nr_rays = nr_rays - 1
	until nr_rays == 0

	nav_manager:destroy_nav_tracker(from_tracker)

	if fail_position then
		return fail_position
	end

	return nil
end

function CopLogicAttack.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()

	if action_type == "walk" then
		my_data.advancing = nil

		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
		
		if my_data.walking_to_optimal_pos then
			my_data.walking_to_optimal_pos = nil
			
			if action:expired() then	
				if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
					SpoocLogicAttack._upd_spooc_attack(data, my_data)
				end
					
				CopLogicAttack._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, my_data)
				CopLogicAttack._upd_combat_movement(data, true)
			end
		elseif my_data.surprised then
			my_data.surprised = nil
			
			if action:expired() then
				if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
					SpoocLogicAttack._upd_spooc_attack(data, my_data)
				end
					
				CopLogicAttack._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, my_data)
				CopLogicAttack._upd_combat_movement(data, true)
			end
		elseif my_data.cover_movement then
			if action:expired() then
				my_data.in_cover = my_data.moving_to_cover
				my_data.cover_enter_t = data.t
				
				if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
					SpoocLogicAttack._upd_spooc_attack(data, my_data)
				end
					
				CopLogicAttack._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, my_data)
				CopLogicAttack._upd_combat_movement(data, true)
			end
			my_data.cover_movement = nil
			my_data.moving_to_cover = nil
		elseif my_data.walking_to_cover_shoot_pos then
			my_data.walking_to_cover_shoot_pos = nil
			
			if action:expired() then
				my_data.at_cover_shoot_pos = true
				
				if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
					SpoocLogicAttack._upd_spooc_attack(data, my_data)
				end
					
				CopLogicAttack._upd_aim(data, my_data)
				data.logic._upd_stance_and_pose(data, my_data)
				CopLogicAttack._upd_combat_movement(data, true)
			end
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "tase" then
		if not data.unit:character_damage():dead() and action:expired() and my_data.tasing then
			local record = managers.groupai:state():criminal_record(my_data.tasing.target_u_key)

			if record and record.status then
				data.tase_delay_t = TimerManager:game():time() + 45
			end
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end
		
		if my_data.tasing then
			managers.groupai:state():on_tase_end(my_data.tasing.target_u_key)
		end

		my_data.tasing = nil
	elseif action_type == "spooc" then
		data.spooc_attack_timeout_t = TimerManager:game():time() + math_lerp(data.char_tweak.spooc_attack_timeout[1], data.char_tweak.spooc_attack_timeout[2], math_random())

		if action:complete() and data.char_tweak.spooc_attack_use_smoke_chance > 0 and math_random() <= data.char_tweak.spooc_attack_use_smoke_chance and not managers.groupai:state():is_smoke_grenade_active() then
			managers.groupai:state():detonate_smoke_grenade(data.m_pos + math_UP * 10, data.unit:movement():m_head_pos(), math_lerp(15, 30, math_random()), false)
		end
		
		if not data.unit:character_damage():dead() and action:expired() then
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, data.internal_data)
			CopLogicAttack._upd_combat_movement(data)
		end

		my_data.spooc_attack = nil
	elseif action_type == "reload" or action_type == "act" or action_type == "heal" or action_type == "healed" then
		if action:expired() then
			if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
			end
					
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, my_data)
			CopLogicAttack._upd_combat_movement(data, true)
		end
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "hurt" then
		CopLogicAttack._cancel_cover_pathing(data, my_data)

		if action:expired() and action:hurt_type() ~= "death" then
			local focus_enemy = data.attention_obj

			if not data.important or not focus_enemy or focus_enemy.reaction < REACT_COMBAT or not CopLogicBase.chk_start_action_dodge(data, "hit") then
				data.logic._upd_aim(data, my_data)
			end
		end
	elseif action_type == "dodge" then
		local timeout = action:timeout()

		if timeout then
			data.dodge_timeout_t = data.t + math_lerp(timeout[1], timeout[2], math_random())
		end

		CopLogicAttack._cancel_cover_pathing(data, my_data)

		if action:expired() then
			if data.unit:base():has_tag("spooc") or data.unit:base()._tweak_table == "shadow_spooc" then
				SpoocLogicAttack._upd_spooc_attack(data, my_data)
			end
				
			CopLogicAttack._upd_aim(data, my_data)
			data.logic._upd_stance_and_pose(data, my_data)
			CopLogicAttack._upd_combat_movement(data, true)
		end
	end
end

function CopLogicAttack.chk_should_turn(data, my_data)
	return not my_data.turning and not my_data.has_old_action and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised and not data.unit:movement():chk_action_forbidden("walk")
end

function CopLogicAttack._get_cover_offset_pos(data, cover_data, threat_pos)
	local threat_vec = threat_pos - cover_data[1][1]

	mvec3_set_z(threat_vec, 0)

	local threat_polar = threat_vec:to_polar_with_reference(cover_data[1][2], math_up)
	local threat_spin = threat_polar.spin
	local rot = nil

	if threat_spin < -20 then
		rot = Rotation(90)
	elseif threat_spin > 20 then
		rot = Rotation(-90)
	else
		rot = Rotation(180)
	end

	local offset_pos = mvec3_cpy(cover_data[1][2])

	mvec3_rotate_with(offset_pos, rot)
	mvec3_set_length(offset_pos, 25)
	mvec3_add(offset_pos, cover_data[1][1])

	local ray_params = {
		trace = true,
		tracker_from = cover_data[1][3],
		pos_to = offset_pos
	}

	managers.navigation:raycast(ray_params)

	return ray_params.trace[1], rot:yaw()
end

function CopLogicAttack._find_flank_pos(data, my_data, flank_tracker, max_dist)
	local pos = flank_tracker:position()
	local vec_to_pos = pos - data.m_pos

	mvec3_set_z(vec_to_pos, 0)

	local max_dis = max_dist or 1500

	mvec3_set_length(vec_to_pos, max_dis)

	local nav_manager = managers.navigation
	local accross_positions = nav_manager:find_walls_accross_tracker(flank_tracker, vec_to_pos, 160, 5)

	if accross_positions then
		local optimal_dis = max_dis
		local best_error_dis, best_pos, best_is_hit, best_is_miss, best_has_too_much_error = nil

		for _, accross_pos in ipairs(accross_positions) do
			local error_dis = math_abs(mvec3_dis(accross_pos[1], pos) - optimal_dis)
			local too_much_error = error_dis / optimal_dis > 0.2
			local is_hit = accross_pos[2]

			if best_is_hit then
				if is_hit then
					if error_dis < best_error_dis then
						local reservation = {
							radius = 30,
							position = accross_pos[1],
							filter = data.pos_rsrv_id
						}

						if nav_manager:is_pos_free(reservation) then
							best_pos = accross_pos[1]
							best_error_dis = error_dis
							best_has_too_much_error = too_much_error
						end
					end
				elseif best_has_too_much_error then
					local reservation = {
						radius = 30,
						position = accross_pos[1],
						filter = data.pos_rsrv_id
					}

					if nav_manager:is_pos_free(reservation) then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_is_miss = true
						best_is_hit = nil
					end
				end
			elseif best_is_miss then
				if not too_much_error then
					local reservation = {
						radius = 30,
						position = accross_pos[1],
						filter = data.pos_rsrv_id
					}

					if nav_manager:is_pos_free(reservation) then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_has_too_much_error = nil
						best_is_miss = nil
						best_is_hit = true
					end
				end
			else
				local reservation = {
					radius = 30,
					position = accross_pos[1],
					filter = data.pos_rsrv_id
				}

				if nav_manager:is_pos_free(reservation) then
					best_pos = accross_pos[1]
					best_is_hit = is_hit
					best_is_miss = not is_hit
					best_has_too_much_error = too_much_error
					best_error_dis = error_dis
				end
			end
		end

		return best_pos
	end
end

function CopLogicAttack.damage_clbk(data, damage_info)
	CopLogicIdle.damage_clbk(data, damage_info)
end

function CopLogicAttack.is_available_for_assignment(data, new_objective)
	local my_data = data.internal_data

	if my_data.exiting then
		return
	end

	if new_objective and new_objective.forced then
		return true
	end

	if data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	if data.path_fail_t and data.t < data.path_fail_t + 1 then
		return
	end
	
	if data.is_converted then
		if new_objective and (new_objective.type ~= "follow" and not new_objective.called) then
			local allow_trans, obj_fail = CopLogicBase.is_obstructed(data, new_objective, 0.2) --trans rights
			
			if obj_fail then
				return
				--log("heck")
			else
				return true
			end
		else
			return true
		end
	end

	if data.is_suppressed then
		return
	end

	local att_obj = data.attention_obj

	if not att_obj or att_obj.reaction < REACT_AIM then
		return true
	end

	if not new_objective or new_objective.type == "free" then
		return true
	end

	if new_objective then
		local allow_trans, obj_fail = CopLogicBase.is_obstructed(data, new_objective, 0.2)

		if obj_fail then
			return
		end
	end

	return true
end

function CopLogicAttack._chk_wants_to_take_cover(data, my_data)
	if not data.attention_obj or data.attention_obj.reaction < REACT_COMBAT then
		return
	end
	
	if data.unit:in_slot(16) or data.is_converted then
		if data.unit:anim_data().reload then
			return true
		end
		
		local ammo_max, ammo = data.unit:inventory():equipped_unit():base():ammo_info()

		if ammo / ammo_max < 0.2 then
			return true
		end
		
		if data.unit:character_damage()._health_ratio and data.unit:character_damage()._health_ratio < 0.5 then
			return true
		end
		
	else

		if my_data.moving_to_cover or data.is_suppressed or my_data.attitude ~= "engage" or data.unit:anim_data().reload then
			return true
		end

		local ammo_max, ammo = data.unit:inventory():equipped_unit():base():ammo_info()

		if ammo / ammo_max < 0.2 then
			return true
		end
	end
end

function CopLogicAttack._set_best_cover(data, my_data, cover_data)
	local current_best_cover = my_data.best_cover

	if current_best_cover then
		managers.navigation:release_cover(current_best_cover[1])
		CopLogicAttack._cancel_cover_pathing(data, my_data)
	end

	if cover_data then
		managers.navigation:reserve_cover(cover_data[1], data.pos_rsrv_id)

		my_data.best_cover = cover_data

		if not my_data.in_cover and not my_data.walking_to_cover_shoot_pos and not my_data.moving_to_cover and mvec3_dis_sq(cover_data[1][1], data.m_pos) < 100 then
			my_data.in_cover = my_data.best_cover
			my_data.cover_enter_t = data.t
		end
	else
		my_data.best_cover = nil
		my_data.flank_cover = nil
	end
end

function CopLogicAttack._set_nearest_cover(my_data, cover_data)
	local nearest_cover = my_data.nearest_cover

	if nearest_cover then
		managers.navigation:release_cover(nearest_cover[1])
	end

	if cover_data then
		local pos_rsrv_id = my_data.unit:movement():pos_rsrv_id()

		managers.navigation:reserve_cover(cover_data[1], pos_rsrv_id)

		my_data.nearest_cover = cover_data
	else
		my_data.nearest_cover = nil
	end
end

function CopLogicAttack._can_move(data)
	return not data.objective or not data.objective.pos or not data.objective.in_place
end

function CopLogicAttack.on_new_objective(data, old_objective)
	CopLogicIdle.on_new_objective(data, old_objective)
end

function CopLogicAttack.queue_update(data, my_data)
	local delay = data.important and 0.35 or 1	
	
	local hostage_count = managers.groupai:state():get_hostage_count_for_chatter() --check current hostage count
	local chosen_panic_chatter = "controlpanic" --set default generic assault break chatter
	
	if hostage_count > 0 then --make sure the hostage count is actually above zero before replacing any of the lines
		if hostage_count > 3 then  -- hostage count needs to be above 3
			if math_random() < 0.4 then --40% chance for regular panic if hostages are present
				chosen_panic_chatter = "controlpanic"
			else
				chosen_panic_chatter = "hostagepanic2" --more panicky "GET THOSE HOSTAGES OUT RIGHT NOW!!!" line for when theres too many hostages on the map
			end
		else
			if math_random() < 0.4 then
				chosen_panic_chatter = "controlpanic"
			else
				chosen_panic_chatter = "hostagepanic1" --less panicky "Delay the assault until those hostages are out." line
			end
		end
			
		if managers.groupai:state():chk_has_civilian_hostages() then
			--log("they got sausages!")
			if math_random() < 0.5 then
				chosen_panic_chatter = chosen_panic_chatter
			else
				chosen_panic_chatter = "civilianpanic"
			end
		end
			
	elseif managers.groupai:state():chk_had_hostages() then
		if math_random() < 0.4 then
			chosen_panic_chatter = "controlpanic"
		else
			chosen_panic_chatter = "hostagepanic3" -- no more hostages!!! full force!!!
		end
	end
	
	local chosen_sabotage_chatter = "sabotagegeneric" --set default sabotage chatter for variety's sake
	local skirmish_map = managers.skirmish:is_skirmish()--these shouldnt play on holdout
	local ignore_radio_rules = nil
	
	if objective and objective.bagjob then
		--log("oh, worm")
		chosen_sabotage_chatter = "sabotagebags"
		ignore_radio_rules = true
	elseif objective and objective.hostagejob then
		--log("sausage removal squadron")
		chosen_sabotage_chatter = "sabotagehostages"
		ignore_radio_rules = true 
	else
		chosen_sabotage_chatter = "sabotagegeneric" --if none of these levels are the current one, use a generic "Break their gear!" line
	end
		
	local clear_t_chk = not data.attention_obj or not data.attention_obj.verified_t or data.attention_obj.verified_t - data.t > math_random(2.5, 5)	
		
	local cant_say_clear = not data.attention_obj or AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and clear_t_chk
		
	if not data.unit:base():has_tag("special") and not cant_say_clear and not data.is_converted then
		if data.unit:movement():cool() and data.char_tweak.chatter and data.char_tweak.chatter.clear_whisper then
			managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper" )
		elseif not data.unit:movement():cool() then
			if not managers.groupai:state():chk_assault_active_atm() then
				if data.char_tweak.chatter and data.char_tweak.chatter.controlpanic then
					local clearchk = math_random(0, 90)
					local say_clear = 30
					if clearchk > 60 then
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
					elseif clearchk > 30 then
						if not skirmish_map and my_data.radio_voice or not skirmish_map and ignore_radio_rules then
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_sabotage_chatter )
						else
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_panic_chatter )
						end
					else
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_panic_chatter )
					end
				elseif data.char_tweak.chatter and data.char_tweak.chatter.clear then
					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
				end
			end
		end
	end
	
	if data.unit:base():has_tag("special") and not cant_say_clear then
		if data.unit:base():has_tag("tank") or data.unit:base():has_tag("taser") then
			managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "approachingspecial" )
		elseif data.unit:base()._tweak_table == "shield" then
			--fuck off
		elseif data.unit:base()._tweak_table == "akuma" then
			managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "lotusapproach" )
		end
	end
		
	--mid-assault panic for cops based on alerts instead of opening fire, since its supposed to be generic action lines instead of for opening fire and such
	--I'm adding some randomness to these since the delays in groupaitweakdata went a bit overboard but also arent able to really discern things proper
				
	if data.char_tweak and data.char_tweak.chatter and data.char_tweak.chatter.enemyidlepanic and not data.is_converted then
		if not data.unit:base():has_tag("special") and data.unit:base():has_tag("law") then
			if managers.groupai:state():chk_assault_active_atm() then
				if managers.groupai:state():_check_assault_panic_chatter() then
					if data.attention_obj and data.attention_obj.verified and data.attention_obj.dis <= 500 or data.is_suppressed and data.attention_obj and data.attention_obj.verified then
						local roll = math_random(1, 100)
						local chance_suppanic = 50
						
						if roll <= chance_suppanic then
							local nroll = math_random(1, 100)
							local chance_help = 50
							if roll <= chance_suppanic then
								managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanicsuppressed1" )
							else
								managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanicsuppressed2" )
							end
						else
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanic" )
						end
					else
						if math_random() < 0.2 then
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_sabotage_chatter )
						else
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanic" )
						end
					end
				else
					local clearchk = math_random(0, 90)
						
					if clearchk > 60 then
						if not skirmish_map and my_data.radio_voice or not skirmish_map and ignore_radio_rules then
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_sabotage_chatter )
						end
					elseif chosen_panic_chatter == "civilianpanic" then
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, chosen_panic_chatter )
					end
				end
			end
		elseif not data.unit:base():has_tag("special") and data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and data.attention_obj.verified_t or not data.unit:base():has_tag("special") and data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and data.attention_obj.alert_t then
		
			if data.attention_obj.verified and data.attention_obj.dis <= 500 or data.is_suppressed and data.attention_obj.verified then
				local roll = math_random(1, 100)
				local chance_suppanic = 50
						
				if roll <= chance_suppanic then
					local nroll = math_random(1, 100)
					local chance_help = 50
					if roll <= chance_suppanic then
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanicsuppressed1" )
					else
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanicsuppressed2" )
					end
				else
					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanic" )
				end
			else
				managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "assaultpanic" )
			end
			
		end	
	end

	data.logic._upd_stance_and_pose(data, data.internal_data, objective)
	
	if my_data ~= data.internal_data then
		return
	end
	
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, data.logic.queued_update, data, data.t + delay, true)
end

function CopLogicAttack._get_expected_attention_position(data, my_data)
	local main_enemy = data.attention_obj
	local e_nav_tracker = main_enemy.nav_tracker

	if not e_nav_tracker then
		return
	end

	local my_nav_seg = data.unit:movement():nav_tracker():nav_segment()
	local e_pos = main_enemy.m_pos
	local e_nav_seg = e_nav_tracker:nav_segment()

	if e_nav_seg == my_nav_seg then
		mvec3_set(temp_vec1, main_enemy.m_head_pos)

		return temp_vec1
	end

	local expected_path = my_data.expected_pos_path
	local from_nav_seg, to_nav_seg = nil

	if expected_path then
		local i_from_seg = nil

		for i, k in ipairs(expected_path) do
			if k[1] == my_nav_seg then
				i_from_seg = i

				break
			end
		end

		if i_from_seg then
			local groupai_manager = managers.groupai:state()
			local nav_manager = managers.navigation

			local function _find_aim_pos(from_nav_seg, to_nav_seg)
				local is_criminal = main_enemy.criminal_record and true

				if groupai_manager:chk_area_leads_to_enemy(from_nav_seg, to_nav_seg, is_criminal) then ----check if this changes anything, draw expected_pos to check
					local closest_dis = 1000000000
					local closest_door = nil
					local min_point_dis_sq = 10000
					local found_doors = nav_manager:find_segment_doors(from_nav_seg, callback(CopLogicAttack, CopLogicAttack, "_chk_is_right_segment", to_nav_seg))

					for _, door in pairs(found_doors) do
						mvec3_set(temp_vec1, door.center)

						local same_height = math_abs(temp_vec1.z - data.m_pos.z) < 250

						if same_height then
							local dis = mvec3_dis_sq(e_pos, temp_vec1)

							if dis < closest_dis then
								closest_dis = dis
								closest_door = door
							end
						end
					end

					if closest_door then
						mvec3_set(temp_vec1, closest_door.center)
						mvec3_sub(temp_vec1, data.m_pos)
						mvec3_set_z(temp_vec1, 0)

						if min_point_dis_sq < mvec3_len_sq(temp_vec1) then
							mvec3_set(temp_vec1, closest_door.center)
							mvec3_set_z(temp_vec1, data.unit:movement():m_head_pos().z)

							return temp_vec1
						else
							return false, true
						end
					end
				end
			end

			local i = #expected_path

			while i > 0 do
				if expected_path[i][1] == e_nav_seg then
					to_nav_seg = expected_path[math_clamp(i, i_from_seg - 1, i_from_seg + 1)][1]
					local aim_pos, too_close = _find_aim_pos(my_nav_seg, to_nav_seg)

					if aim_pos then
						do return aim_pos end
						break
					end

					if too_close then
						local next_nav_seg = expected_path[math_clamp(i, i_from_seg - 2, i_from_seg + 2)][1]

						if next_nav_seg ~= to_nav_seg then
							local from_nav_seg = to_nav_seg
							to_nav_seg = next_nav_seg
							aim_pos = _find_aim_pos(from_nav_seg, to_nav_seg)
						end

						return aim_pos
					end

					break
				end

				i = i - 1
			end
		end

		if not i_from_seg or not to_nav_seg then
			expected_path = nil
			my_data.expected_pos_path = nil
		end
	end

	if not expected_path and not my_data.expected_pos_path_search_id then
		my_data.expected_pos_path_search_id = "ExpectedPos" .. tostring(data.key)

		data.brain:search_for_coarse_path(my_data.expected_pos_path_search_id, e_nav_seg)
	end
end

function CopLogicAttack._chk_is_right_segment(ignore_this, enemy_nav_seg, test_nav_seg)
	return enemy_nav_seg == test_nav_seg
end

function CopLogicAttack.is_advancing(data)
	if data.internal_data.advancing then
		return data.internal_data.advancing:get_walk_to_pos()
	end

	if data.internal_data.moving_to_cover then
		return data.internal_data.moving_to_cover[1][1]
	end

	if data.internal_data.walking_to_cover_shoot_pos then
		return data.internal_data.walking_to_cover_shoot_pos:get_walk_to_pos()
	end
end

function CopLogicAttack._get_all_paths(data)
	return {
		cover_path = data.internal_data.cover_path,
		flank_path = data.internal_data.flank_path
	}
end

function CopLogicAttack._set_verified_paths(data, verified_paths)
	data.internal_data.cover_path = verified_paths.cover_path
	data.internal_data.flank_path = verified_paths.flank_path
end

function CopLogicAttack._chk_exit_attack_logic(data, new_reaction)
	--if not new_reaction or new_reaction < REACT_COMBAT or data.attention_obj.verified_dis > 1500 then
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
	--end
end

function CopLogicAttack.action_taken(data, my_data)
	return my_data.turning or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.surprised or my_data.has_old_action or data.unit:movement():chk_action_forbidden("walk")
end

function CopLogicAttack._upd_stop_old_action(data, my_data)
	if data.unit:anim_data().to_idle then
		return
	end

	if data.unit:movement():chk_action_forbidden("walk") then
		if not data.unit:movement():chk_action_forbidden("idle") then
			CopLogicIdle._start_idle_action_from_act(data)
		end
	elseif data.unit:anim_data().act and data.unit:anim_data().needs_idle then
		CopLogicIdle._start_idle_action_from_act(data)
	end

	CopLogicIdle._chk_has_old_action(data, my_data)
end

function CopLogicAttack._upd_pose(data, my_data)
	local allowed_poses = data.char_tweak.allowed_poses

	if allowed_poses then
		local unit_can_stand = allowed_poses.stand
		local unit_can_crouch = allowed_poses.crouch

		if not unit_can_stand and unit_can_crouch then
			if not data.unit:anim_data().crouch then
				return CopLogicAttack._chk_request_action_crouch(data)
			end
		elseif not unit_can_crouch and unit_can_stand then
			if data.unit:anim_data().crouch then
				return CopLogicAttack._chk_request_action_stand(data)
			end
		end

		return
	end

	local objective_pose = data.objective and data.objective.pose
	local need_cover = nil

	if my_data.want_to_take_cover then
		if not my_data.in_cover or not my_data.in_cover[4] then
			need_cover = true
		end
	end

	if data.is_suppressed or need_cover and objective_pose ~= "stand" or objective_pose == "crouch" then
		if not data.unit:anim_data().crouch then
			return CopLogicAttack._chk_request_action_crouch(data)
		end
	elseif my_data.cover_test_step > 2 and objective_pose ~= "crouch" or objective_pose == "stand" then
		if data.unit:anim_data().crouch then
			return CopLogicAttack._chk_request_action_stand(data)
		end
	end
end

function CopLogicAttack._chk_exit_non_walkable_area(data)
	local my_data = data.internal_data

	if my_data.advancing or not CopLogicAttack._can_move(data) or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local my_tracker = data.unit:movement():nav_tracker()

	if not my_tracker:obstructed() then
		return
	end

	if data.objective and data.objective.nav_seg then
		local nav_seg_id = my_tracker:nav_segment()

		if not managers.navigation._nav_segments[nav_seg_id].disabled then
			data.objective.in_place = nil

			data.logic.on_new_objective(data, data.objective)

			return true
		end
	end
end

function CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
	local focus_enemy = data.attention_obj

	if shoot then
		if not my_data.firing then
			data.unit:movement():set_allow_fire(true)

			my_data.firing = true

			if not data.unit:in_slot(16) and not data.is_converted and data.char_tweak and data.char_tweak.chatter and data.char_tweak.chatter.aggressive then
				if not data.unit:base():has_tag("special") and data.unit:base():has_tag("law") and not data.unit:base()._tweak_table == "gensec" and not data.unit:base()._tweak_table == "security" then
					if focus_enemy.verified and focus_enemy.verified_dis <= 500 then
						if managers.groupai:state():chk_assault_active_atm() then
							local roll = math.random(1, 100)
						
							if roll < 33 then
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressivecontrolsurprised1")
							elseif roll < 66 and roll > 33 then
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressivecontrolsurprised2")
							else
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "open_fire")
							end
						else
							local roll = math.random(1, 100)
						
							if roll <= chance_heeeeelpp then
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressivecontrolsurprised1")
							else --hopefully some variety here now
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressivecontrolsurprised2")
							end	
						end
					else
						if managers.groupai:state():chk_assault_active_atm() then
							managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "open_fire")
						else
							managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressivecontrol")
						end
					end
				elseif data.unit:base():has_tag("special") then
					if not data.unit:base():has_tag("tank") and data.unit:base():has_tag("medic") then
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
					elseif data.unit:base():has_tag("shield") then
						local shield_knock_cooldown = math.random(3, 6)
						if not my_data.shield_knock_cooldown or my_data.shield_knock_cooldown < data.t then
							local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)	
							my_data.shield_knock_cooldown = data.t + shield_knock_cooldown
									
							if data.unit:base()._tweak_table == "phalanx_minion" or data.unit:base()._tweak_table == "phalanx_minion_assault" then
								data.unit:sound():say("use_gas", true, nil, true)
							else
								data.unit:sound():play("shield_identification", nil, true)
							end
						end
					else
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "contact")
					end
				elseif data.unit:base()._tweak_table == "security" or data.unit:base()._tweak_table == "gensec" or data.unit:base()._tweak_table == "city_swat_guard" or data.unit:base()._tweak_table == "spring" or data.unit:base()._tweak_table == "phalanx_vip" then
				    data.unit:sound():say("a01", true)
				else
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "contact")
				end
			end
		end
	elseif my_data.firing then
		data.unit:movement():set_allow_fire(false)

		my_data.firing = nil
	end
end

function CopLogicAttack._upd_aim(data, my_data)
	data.t = TimerManager:game():time()
	
	if my_data.spooc_attack then
		if my_data.attention_unit ~= my_data.spooc_attack.target_u_data.u_key then
			CopLogicBase._set_attention(data, my_data.spooc_attack.target_u_data)

			my_data.attention_unit = my_data.spooc_attack.target_u_data.u_key
		end
		
		return
	end
	
	local shoot, aim, expected_pos = nil
	local focus_enemy = data.attention_obj
	local running = data.unit:movement()._active_actions[2] and data.unit:movement()._active_actions[2]:type() == "walk" and data.unit:movement()._active_actions[2]:haste() == "run"
	local tase = focus_enemy and focus_enemy.reaction >= AIAttentionObject.REACT_SPECIAL_ATTACK

	if focus_enemy then
		if tase and data.unit:base():has_tag("taser") and data.unit:base():has_tag("taser_titan") then
			shoot = true
		elseif AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
			if focus_enemy.verified or focus_enemy.nearly_visible then
				local firing_range = 500

				if my_data.weapon_range then
					firing_range = running and my_data.weapon_range.close or my_data.weapon_range.far
				elseif not running then
					firing_range = 1000
				end

				if running and firing_range < focus_enemy.dis then
					local walk_to_pos = data.unit:movement():get_walk_to_pos()

					if walk_to_pos then
						mvec3_dir(temp_vec1, data.m_pos, walk_to_pos)
						mvec3_dir(temp_vec2, data.m_pos, focus_enemy.m_pos)

						local dot = mvec3_dot(temp_vec1, temp_vec2)

						if dot < 0.6 then
							shoot = false
							aim = false
						end
					end
				end

				if aim == nil then
					if AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction then
						local last_sup_t = data.unit:character_damage():last_suppression_t()

						if last_sup_t then
							local sup_t_ver = 7 

							if running then
								sup_t_ver = sup_t_ver * 0.3
							end

							if not focus_enemy.verified then
								if focus_enemy.vis_ray and firing_range < focus_enemy.vis_ray.distance then
									sup_t_ver = sup_t_ver * 0.5
								else
									sup_t_ver = sup_t_ver * 0.2
								end
							end

							if data.t - last_sup_t < sup_t_ver then
								shoot = true
							end
						end

						if not managers.groupai:state():whisper_mode() then
							if data.internal_data.weapon_range and focus_enemy.verified_dis < firing_range and managers.groupai:state():chk_assault_active_atm() then
								shoot = true
							elseif focus_enemy.criminal_record and focus_enemy.criminal_record.assault_t and data.t - focus_enemy.criminal_record.assault_t < 2 then
								shoot = true
							elseif not data.unit:base():has_tag("law") and focus_enemy.verified_dis < firing_range or data.unit:base():has_tag("law") and focus_enemy.aimed_at and focus_enemy.verified_dis <= 1500 then
								shoot = true
							end
						end
						
						if managers.groupai:state():whisper_mode() then
							if not shoot then
								shoot = true
							end
						end
						
						if not shoot and not managers.groupai:state():whisper_mode() and my_data.attitude == "engage" then
							local height_difference = math.abs(data.m_pos.z - data.attention_obj.m_pos.z) > 250
							local z_check = height_difference and 0.75 or 1
							
							if focus_enemy.verified_dis < firing_range * z_check or focus_enemy.reaction == AIAttentionObject.REACT_SHOOT then
								if dense_mook and not my_data.firing then
										--log("not firing due to FEDS")
								else
									shoot = true
								end
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
						
						if not aim and focus_enemy.verified_dis < firing_range and not running then
							aim = true
						end

						aim = aim or shoot
					else
						aim = true
					end
				end
			else
				local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t

				if time_since_verification then
					if running then
						local dis_lerp = math_clamp((focus_enemy.verified_dis - 500) / 600, 0, 1)

						if time_since_verification < math_lerp(5, 1, dis_lerp) then
							aim = true
						end
					elseif time_since_verification < 5 then
						aim = true
					end

					if aim and my_data.shooting and AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction then
						if running then
							local look_pos = focus_enemy.last_verified_pos or focus_enemy.verified_pos
							local same_height = math_abs(look_pos.z - data.m_pos.z) < 250

							if same_height and time_since_verification < 2 then
								shoot = true
							end
						elseif time_since_verification < 3 then
							shoot = true
						end
					end
				end

				if not shoot then
					if not focus_enemy.last_verified_pos or time_since_verification and time_since_verification > 5 then
						my_data.expected_pos = CopLogicAttack._get_expected_attention_position(data, my_data)

						if my_data.expected_pos then
							if running then
								my_data.expected_pos = mvec3_cpy(my_data.expected_pos)
								local watch_dir = temp_vec1

								mvec3_set(watch_dir, my_data.expected_pos)
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
								end
							else
								aim = true
							end
						end
					end
				end
			end
		end
		
		
		if focus_enemy.is_person and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and not data.unit:in_slot(16) and not data.is_converted and data.tactics and data.tactics.harass then
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

		if not aim and data.char_tweak.always_face_enemy and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
			aim = true
		end

		if data.logic.chk_should_turn(data, my_data) then
			local enemy_pos = nil

			if focus_enemy.verified or focus_enemy.nearly_visible then
				enemy_pos = focus_enemy.m_pos
			else
				enemy_pos = my_data.expected_pos or focus_enemy.last_verified_pos or focus_enemy.verified_pos
			end

			CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, enemy_pos)
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

	if aim or shoot then
		if focus_enemy.verified or focus_enemy.nearly_visible then
			if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)

				my_data.attention_unit = focus_enemy.u_key
			end
		else
			local look_pos = my_data.expected_pos or focus_enemy.last_verified_pos or focus_enemy.verified_pos

			--[[if look_pos then
				local line = Draw:brush(Color.blue:with_alpha(0.5), 0.1)
				line:cylinder(data.unit:movement():m_head_pos(), look_pos, 5)
			end]]

			if my_data.attention_unit ~= look_pos then
				CopLogicBase._set_attention_on_pos(data, mvec3_cpy(look_pos))

				my_data.attention_unit = mvec3_cpy(look_pos)
			end
		end
		
		local nottasingortargetwrong = not my_data.tasing or my_data.tasing.target_u_data ~= focus_enemy
		
		if tase and not data.unit:base():has_tag("taser_titan") then
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
		elseif not my_data.shooting and not my_data.spooc_attack and not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			local shoot_action = {
				body_part = 3,
				type = "shoot"
			}

			if data.brain:action_request(shoot_action) then
				my_data.shooting = true
			end
		end
	else
		if my_data.shooting and not data.unit:anim_data().reload or my_data.tasing then
			local new_action = {
				body_part = 3,
				type = "idle"
			}

			data.brain:action_request(new_action)
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)

			my_data.attention_unit = nil
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end