local mvec3_x = mvector3.x
local mvec3_y = mvector3.y
local mvec3_z = mvector3.z
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_sub = mvector3.subtract
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_dir = mvector3.direction
local mvec3_norm = mvector3.normalize
local mvec3_cross = mvector3.cross
local mvec3_rand_ortho = mvector3.random_orthogonal
local mvec3_negate = mvector3.negate
local mvec3_len = mvector3.length
local mvec3_cpy = mvector3.copy
local mvec3_set_stat = mvector3.set_static
local mvec3_set_length = mvector3.set_length
local mvec3_angle = mvector3.angle
local mvec3_step = mvector3.step
local math_lerp = math.lerp
local math_random = math.random
local math_up = math.UP
local math_abs = math.abs
local math_clamp = math.clamp
local math_min = math.min
local m_rot_x = mrotation.x
local m_rot_y = mrotation.y
local m_rot_z = mrotation.z
local table_insert = table.insert
local table_contains = table.contains
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

CopLogicBase._AGGRESSIVE_ALERT_TYPES = {
	vo_distress = true,
	aggression = true,
	bullet = true,
	vo_intimidate = true,
	explosion = true,
	footstep = true,
	vo_cbt = true,
	fire = true
}
CopLogicBase._DANGEROUS_ALERT_TYPES = {
	explosion = true,
	bullet = true,
	aggression = true,
	fire = true
}

function CopLogicBase._upd_attention_obj_detection(data, min_reaction, max_reaction)
	local t = data.t
	local detected_obj = data.detected_attention_objects
	local my_data = data.internal_data
	local my_key = data.key
	local my_pos = data.unit:movement():m_head_pos()
	local my_access = data.SO_access
	local all_attention_objects = managers.groupai:state():get_AI_attention_objects_by_filter(data.SO_access_str, data.team)
	local my_head_fwd = nil
	local my_tracker = data.unit:movement():nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local is_detection_persistent = managers.groupai:state():is_detection_persistent()
	local delay = 2
	local player_importance_wgt = data.unit:in_slot(managers.slot:get_mask("enemies")) and {}

	local function _angle_chk(attention_pos, dis, strictness)
		mvec3_dir(tmp_vec1, my_pos, attention_pos)

		my_head_fwd = my_head_fwd or data.unit:movement():m_head_rot():z()
		local angle = mvec3_angle(my_head_fwd, tmp_vec1)
		local angle_max = math_lerp(180, my_data.detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))

		if angle_max > angle * strictness then
			return true
		end
	end

	local function _angle_and_dis_chk(handler, settings, attention_pos)
		attention_pos = attention_pos or handler:get_detection_m_pos()
		local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)
		local dis_multiplier, angle_multiplier = nil
		local max_dis = math_min(my_data.detection.dis_max, settings.max_range or my_data.detection.dis_max)

		if settings.detection and settings.detection.range_mul then
			max_dis = max_dis * settings.detection.range_mul
		end

		dis_multiplier = dis / max_dis

		if settings.uncover_range and my_data.detection.use_uncover_range and dis < settings.uncover_range then
			return -1, 0
		end

		if dis_multiplier < 1 then
			if settings.notice_requires_FOV then
				my_head_fwd = my_head_fwd or data.unit:movement():m_head_rot():z()
				local angle = mvec3_angle(my_head_fwd, tmp_vec1)

				if angle < 55 and not my_data.detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
					return -1, 0
				end

				local angle_max = math_lerp(180, my_data.detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
				angle_multiplier = angle / angle_max

				if angle_multiplier < 1 then
					return angle, dis_multiplier
				end
			else
				return 0, dis_multiplier
			end
		end
	end

	local function _nearly_visible_chk(attention_info, detect_pos)
		local side_offset = 25
		local head_offset = 15
		local hips_offset = 35
		local legs_offset = 70

		if attention_info.is_human_player then
			side_offset = 20
			head_offset = 10
		end

		local near_pos = tmp_vec1
		local side_vec = tmp_vec2

		mvec3_set(side_vec, detect_pos)
		mvec3_sub(side_vec, my_pos)
		mvec3_cross(side_vec, side_vec, math_up)
		mvec3_set_length(side_vec, side_offset)
		mvec3_set(near_pos, detect_pos)
		mvec3_add(near_pos, side_vec)

		local near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")

		if near_vis_ray then
			mvec3_mul(side_vec, -2)
			mvec3_add(near_pos, side_vec)

			near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")

			if near_vis_ray then
				mvec3_set(near_pos, detect_pos)
				mvec3_set_z(near_pos, near_pos.z + head_offset)

				near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")

				if near_vis_ray then

					mvec3_set(near_pos, detect_pos)
					mvec3_set_z(near_pos, near_pos.z - hips_offset)

					near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")

					if near_vis_ray then
						mvec3_set(near_pos, detect_pos)
						mvec3_set_z(near_pos, near_pos.z - legs_offset)

						near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision", "report")
					end
				end
			end
		end

		if not near_vis_ray then
			attention_info.nearly_visible = true
			attention_info.last_verified_pos = mvec3_cpy(near_pos)
		end
	end

	local function _chk_record_acquired_attention_importance_wgt(attention_info)
		if not player_importance_wgt or not attention_info.is_human_player then
			return
		end

		local weight = mvec3_dir(tmp_vec1, attention_info.m_head_pos, my_pos)
		local e_fwd = nil

		if attention_info.is_husk_player then
			e_fwd = attention_info.unit:movement():detect_look_dir()
		else
			e_fwd = attention_info.unit:movement():m_head_rot():y()
		end

		local dot = mvec3_dot(e_fwd, tmp_vec1)
		weight = weight * weight * (1 - dot)

		table_insert(player_importance_wgt, attention_info.u_key)
		table_insert(player_importance_wgt, weight)
	end

	local function _chk_record_attention_obj_importance_wgt(u_key, attention_info)
		if not player_importance_wgt then
			return
		end

		local is_human_player, is_local_player, is_husk_player = nil

		if attention_info.unit:base() then
			is_local_player = attention_info.unit:base().is_local_player
			is_husk_player = attention_info.unit:base().is_husk_player
			is_human_player = is_local_player or is_husk_player
		end

		if not is_human_player then
			return
		end

		local weight = mvec3_dir(tmp_vec1, attention_info.handler:get_detection_m_pos(), my_pos)
		local e_fwd = nil

		if is_husk_player then
			e_fwd = attention_info.unit:movement():detect_look_dir()
		else
			e_fwd = attention_info.unit:movement():m_head_rot():y()
		end

		local dot = mvec3_dot(e_fwd, tmp_vec1)
		weight = weight * weight * (1 - dot)

		table_insert(player_importance_wgt, u_key)
		table_insert(player_importance_wgt, weight)
	end

	for u_key, attention_info in pairs(all_attention_objects) do
		if u_key ~= my_key and not detected_obj[u_key] then
			local can_acquire = true

			if data.cool and attention_info.unit and attention_info.unit:base() and attention_info.unit:base().is_husk_player then
				can_acquire = false
			end

			if can_acquire then
				if not attention_info.nav_tracker or chk_vis_func(my_tracker, attention_info.nav_tracker) then
					local settings = attention_info.handler:get_attention(my_access, min_reaction, max_reaction, data.team)

					if settings then
						local acquired = nil
						local attention_pos = attention_info.handler:get_detection_m_pos()
						local angle, dis_multiplier = _angle_and_dis_chk(attention_info.handler, settings, attention_pos)

						if angle then
							local vis_ray = data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

							if not vis_ray or vis_ray.unit:key() == u_key then
								acquired = true

								local visible_data = {
									visible_angle = angle,
									visible_dis_multiplier = dis_multiplier,
									visible_ray = vis_ray
								}
								detected_obj[u_key] = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, settings, nil, visible_data)
							end
						end

						if not acquired then
							_chk_record_attention_obj_importance_wgt(u_key, attention_info)
						end
					end
				end
			end
		end
	end

	for u_key, attention_info in pairs(detected_obj) do
		local can_detect = true

		if data.cool and attention_info.is_husk_player then
			can_detect = false
		end

		if can_detect then
			if not attention_info.visible_in_this_instance and t < attention_info.next_verify_t then
				if AIAttentionObject.REACT_SUSPICIOUS <= attention_info.reaction then
					delay = math_min(attention_info.next_verify_t - t, delay)
				end
			else
				local verify_interval = nil

				if attention_info.identified and attention_info.verified then
					verify_interval = attention_info.settings.verification_interval
				else
					verify_interval = attention_info.settings.notice_interval or attention_info.settings.verification_interval
				end

				attention_info.next_verify_t = t + verify_interval
				delay = math_min(delay, verify_interval)

				if not attention_info.identified then
					local noticable, angle, dis_multiplier = nil

					if attention_info.visible_in_this_instance then
						noticable = true
						angle = attention_info.visible_angle
						dis_multiplier = attention_info.visible_dis_multiplier
					else
						angle, dis_multiplier = _angle_and_dis_chk(attention_info.handler, attention_info.settings)

						if angle then
							local attention_pos = attention_info.handler:get_detection_m_pos()
							local vis_ray = attention_info.visible_ray or data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

							if not vis_ray or vis_ray.unit:key() == u_key then
								noticable = true
								attention_info.visible_in_this_instance = true
							end

							if not attention_info.visible_ray then
								attention_info.visible_ray = vis_ray
							end
						end
					end

					local delta_prog = nil
					local dt = t - attention_info.prev_notice_chk_t

					if noticable then
						if angle == -1 then
							delta_prog = 1
						else
							local min_delay = my_data.detection.delay[1]
							local max_delay = my_data.detection.delay[2]
							local angle_mul_mod = 0.25 * math_min(angle / my_data.detection.angle_max, 1)
							local dis_mul_mod = 0.75 * dis_multiplier
							local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

							if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
								notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
							end

							local notice_delay_modified = math_lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod + angle_mul_mod)
							delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
						end
					else
						delta_prog = dt * -0.125
					end

					attention_info.notice_progress = attention_info.notice_progress + delta_prog

					if attention_info.notice_progress > 1 then
						attention_info.notice_progress = nil
						attention_info.prev_notice_chk_t = nil
						attention_info.identified = true
						attention_info.release_t = t + attention_info.settings.release_delay
						attention_info.identified_t = t
						noticable = true

						data.logic.on_attention_obj_identified(data, u_key, attention_info)
					elseif attention_info.notice_progress < 0 then
						CopLogicBase._destroy_detected_attention_object_data(data, attention_info)

						noticable = false
					else
						noticable = attention_info.notice_progress
						attention_info.prev_notice_chk_t = t

						if data.cool and AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
							managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, data.unit, noticable)
						end
					end

					if noticable ~= false and attention_info.settings.notice_clbk then
						attention_info.settings.notice_clbk(data.unit, noticable)
					end
				end

				if attention_info.identified then
					local is_ignored = false

					if attention_info.unit:movement() and attention_info.unit:movement().is_cuffed then
						is_ignored = attention_info.unit:movement():is_cuffed()
					end

					if is_ignored then
						CopLogicBase._destroy_detected_attention_object_data(data, attention_info)
					else
						attention_info.next_verify_t = t + attention_info.settings.verification_interval
						delay = math_min(delay, attention_info.settings.verification_interval)
						attention_info.nearly_visible = nil

						local verified, vis_ray = nil
						local attention_pos = attention_info.m_head_pos
						local dis = mvec3_dis(data.m_pos, attention_info.m_pos)
						local max_dis = my_data.detection.dis_max

						if dis < max_dis * 1.2 then
							if attention_info.settings.max_range then
								max_dis = math_min(max_dis, attention_info.settings.max_range)
							end

							if attention_info.settings.detection and attention_info.settings.detection.range_mul then
								max_dis = max_dis * attention_info.settings.detection.range_mul
							end

							if dis < max_dis * 1.2 then
								local in_FOV = not attention_info.settings.notice_requires_FOV or data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask) or _angle_chk(attention_pos, dis, 0.8)

								if in_FOV then
									if attention_info.visible_in_this_instance then
										verified = true
										vis_ray = attention_info.visible_ray
									else
										vis_ray = attention_info.visible_ray or data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

										if not vis_ray or vis_ray.unit:key() == u_key then
											verified = true
										end
									end
								end
							end
						end

						attention_info.verified = verified
						attention_info.dis = dis
						attention_info.vis_ray = vis_ray

						if verified then
							attention_info.release_t = nil
							attention_info.verified_t = t

							mvec3_set(attention_info.verified_pos, attention_pos)

							attention_info.last_verified_pos = mvec3_cpy(attention_pos)
							attention_info.verified_dis = dis
						elseif not data.cool and data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask) then
							if attention_info.criminal_record and AIAttentionObject.REACT_COMBAT <= attention_info.settings.reaction then
								if not is_detection_persistent and mvec3_dis(attention_info.m_pos, attention_info.criminal_record.pos) > 700 then
									CopLogicBase._destroy_detected_attention_object_data(data, attention_info)
								else
									delay = math_min(0.2, delay)
									attention_info.next_verify_t = math_min(0.2, attention_info.next_verify_t)

									attention_info.verified_pos = mvec3_cpy(attention_info.criminal_record.pos)
									attention_info.verified_dis = dis

									if vis_ray and attention_info.is_person and attention_info.dis < 2000 then
										_nearly_visible_chk(attention_info, attention_pos)
									end
								end
							elseif attention_info.release_t and attention_info.release_t < t then
								CopLogicBase._destroy_detected_attention_object_data(data, attention_info)
							else
								attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
							end
						elseif attention_info.release_t and attention_info.release_t < t then
							CopLogicBase._destroy_detected_attention_object_data(data, attention_info)
						else
							attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
						end
					end
				end
			end
		end

		_chk_record_acquired_attention_importance_wgt(attention_info)

		attention_info.visible_in_this_instance = nil
		attention_info.visible_angle = nil
		attention_info.visible_dis_multiplier = nil
		attention_info.visible_ray = nil
	end

	if data.cool then
		delay = 0

		for u_key, attention_info in pairs(detected_obj) do
			attention_info.next_verify_t = t
		end
	end

	if player_importance_wgt then
		managers.groupai:state():set_importance_weight(data.key, player_importance_wgt)
	end

	return delay
end

function CopLogicBase._create_detected_attention_object_data(t, my_unit, u_key, attention_info, settings, forced, visible_data)
	local ext_brain = my_unit:brain()

	attention_info.handler:add_listener("detect_" .. tostring(my_unit:key()), callback(ext_brain, ext_brain, "on_detected_attention_obj_modified"))

	local att_unit = attention_info.unit
	local m_pos = attention_info.handler:get_ground_m_pos()
	local m_head_pos = attention_info.handler:get_detection_m_pos()
	local is_local_player, is_husk_player, is_deployable, is_person, nav_tracker, char_tweak, m_rot = nil
	local is_alive = true

	if att_unit:base() then
		is_local_player = att_unit:base().is_local_player
		is_husk_player = att_unit:base().is_husk_player
		is_deployable = att_unit:base().sentry_gun
		is_person = att_unit:in_slot(managers.slot:get_mask("persons"))

		if att_unit:base().char_tweak then
			char_tweak = att_unit:base():char_tweak()
		end
	end

	if att_unit:movement() and att_unit:movement().m_rot then
		m_rot = att_unit:movement():m_rot()
	end

	if att_unit:character_damage() and att_unit:character_damage().dead then
		is_alive = not att_unit:character_damage():dead()
	end

	local verify_interval = settings.notice_interval or settings.verification_interval
	local dis = mvec3_dis(my_unit:movement():m_pos(), m_pos)
	local new_entry = {
		verified = false,
		verified_t = false,
		notice_progress = 0,
		settings = settings,
		unit = attention_info.unit,
		u_key = u_key,
		handler = attention_info.handler,
		next_verify_t = t + verify_interval,
		prev_notice_chk_t = t,
		m_rot = m_rot,
		m_pos = m_pos,
		m_head_pos = m_head_pos,
		nav_tracker = attention_info.nav_tracker,
		is_local_player = is_local_player,
		is_husk_player = is_husk_player,
		is_human_player = is_local_player or is_husk_player,
		is_deployable = is_deployable,
		is_person = is_person,
		is_alive = is_alive,
		reaction = settings.reaction,
		criminal_record = managers.groupai:state():criminal_record(u_key),
		char_tweak = char_tweak,
		verified_pos = mvec3_cpy(m_head_pos),
		verified_dis = dis,
		dis = dis,
		has_team = att_unit:movement() and att_unit:movement().team,
		health_ratio = att_unit:character_damage() and att_unit:character_damage().health_ratio,
		objective = att_unit:brain() and att_unit:brain().objective,
		forced = forced
	}

	if visible_data then
		new_entry.visible_in_this_instance = true
		new_entry.visible_angle = visible_data.visible_angle
		new_entry.visible_dis_multiplier = visible_data.visible_dis_multiplier
		new_entry.visible_ray = visible_data.visible_ray
		visible_data = nil
	end

	return new_entry
end

function CopLogicBase.on_detected_attention_obj_modified(data, modified_u_key)
	if data.logic.on_detected_attention_obj_modified_internal then
		data.logic.on_detected_attention_obj_modified_internal(data, modified_u_key)
	end

	local attention_info = data.detected_attention_objects[modified_u_key]

	if not attention_info then
		return
	end

	local new_settings = attention_info.handler:get_attention(data.SO_access, nil, nil, data.team)
	local old_settings = attention_info.settings

	if new_settings == old_settings then
		return
	end

	local old_notice_clbk = not attention_info.identified and old_settings.notice_clbk

	if new_settings then
		local switch_from_suspicious = AIAttentionObject.REACT_SCARED <= new_settings.reaction and attention_info.reaction <= AIAttentionObject.REACT_SUSPICIOUS
		attention_info.settings = new_settings
		attention_info.stare_expire_t = nil
		attention_info.pause_expire_t = nil

		if attention_info.uncover_progress then
			attention_info.uncover_progress = nil

			attention_info.unit:movement():on_suspicion(data.unit, false)
			managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, data.unit, nil)
		end

		if attention_info.identified then
			if switch_from_suspicious then
				attention_info.identified = false
				attention_info.notice_progress = attention_info.uncover_progress or 0
				attention_info.verified = nil
				attention_info.next_verify_t = 0
				attention_info.prev_notice_chk_t = TimerManager:game():time()
			end
		elseif switch_from_suspicious then
			attention_info.next_verify_t = 0
			attention_info.notice_progress = 0
			attention_info.prev_notice_chk_t = TimerManager:game():time()
		end

		attention_info.reaction = math_min(new_settings.reaction, attention_info.reaction)
	else
		CopLogicBase._destroy_detected_attention_object_data(data, attention_info)

		local my_data = data.internal_data

		if data.attention_obj and data.attention_obj.u_key == modified_u_key then
			CopLogicBase._set_attention_obj(data, nil, nil)

			if my_data then
				if my_data.firing or my_data.firing_on_client then
					data.unit:movement():set_allow_fire(false)

					my_data.firing = nil
					my_data.firing_on_client = nil
				end
			end
		end

		if my_data.arrest_targets then
			my_data.arrest_targets[modified_u_key] = nil
		end
	end

	if old_notice_clbk then
		if not new_settings or not new_settings.notice_clbk then
			old_notice_clbk(data.unit, false)
		end
	end

	if AIAttentionObject.REACT_SCARED <= old_settings.reaction then
		if not new_settings or AIAttentionObject.REACT_SCARED > new_settings.reaction then
			managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, data.unit, nil)
		end
	end
end

function CopLogicBase.should_duck_on_alert(data, alert_data)
	if data.char_tweak.allowed_poses and not data.char_tweak.allowed_poses.crouch or data.unit:anim_data().crouch or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	if not data.char_tweak.crouch_move then
		local lower_body_action = data.unit:movement()._active_actions[2]

		if lower_body_action and lower_body_action:type() == "walk" then
			return
		end
	end

	return true
end

function CopLogicBase._chk_nearly_visible_chk_needed(data, attention_info, u_key)
	return attention_info.is_person
end

function CopLogicBase.is_obstructed(data, objective, strictness, attention)
	local my_data = data.internal_data
	attention = attention or data.attention_obj

	if not objective or objective.is_default then
		return true, false
	elseif objective.in_place or not objective.nav_seg then
		if not objective.action then
			return true, false
		end
	end

	if objective.interrupt_suppression and data.is_suppressed then
		return true, true
	end

	strictness = strictness or 0

	if objective.interrupt_health then
		local health_ratio = data.unit:character_damage():health_ratio()
		local too_much_damage = health_ratio < 1 and health_ratio * (1 - strictness) < objective.interrupt_health
		local is_dead = data.unit:character_damage():dead() or health_ratio <= 0

		if too_much_damage or is_dead then
			return true, true
		end
	end

	if objective.interrupt_dis then
		if attention and attention.reaction then
			local reaction_to_check = nil

			if data.cool then
				reaction_to_check = AIAttentionObject.REACT_SURPRISED
			else
				reaction_to_check = AIAttentionObject.REACT_COMBAT
			end
			
			if reaction_to_check <= attention.reaction then
				if objective.interrupt_dis == -1 then
					return true, true
				elseif math_abs(attention.m_pos.z - data.m_pos.z) < 250 then
					local enemy_dis = attention.dis * (1 - strictness)

					if not attention.verified then
						enemy_dis = enemy_dis * 2
					end

					if enemy_dis < objective.interrupt_dis then
						return true, true
					end
				end

				if objective.pos and math_abs(attention.m_pos.z - objective.pos.z) < 250 then
					local enemy_dis = mvec3_dis(objective.pos, attention.m_pos) * (1 - strictness)

					if enemy_dis < objective.interrupt_dis then
						return true, true
					end
				end
			elseif objective.interrupt_dis == -1 and not data.cool then
				return true, true
			end
		elseif objective.interrupt_dis == -1 and not data.cool then
			return true, true
		end
	end

	return false, false
end

function CopLogicBase._upd_suspicion(data, my_data, attention_obj)
	local function _exit_func()
		attention_obj.unit:movement():on_uncovered(data.unit)

		local reaction, state_name = nil

		if attention_obj.forced then
			reaction = AIAttentionObject.REACT_SHOOT
			state_name = "attack"
		elseif attention_obj.verified then
			if not data.char_tweak.no_arrest and attention_obj.dis < 1500 then
				reaction = AIAttentionObject.REACT_ARREST
				state_name = "arrest"
			elseif attention_obj.criminal_record and attention_obj.criminal_record.being_arrested then
				reaction = AIAttentionObject.REACT_AIM
				state_name = "arrest"
			else
				reaction = AIAttentionObject.REACT_COMBAT
				state_name = "attack"
			end
		elseif data.char_tweak.calls_in then
			reaction = AIAttentionObject.REACT_AIM
			state_name = "arrest"
		else
			reaction = AIAttentionObject.REACT_COMBAT
			state_name = "attack"
		end

		attention_obj.reaction = reaction
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, data.objective, nil, attention_obj)

		if allow_trans then
			if obj_failed then
				data.objective_failed_clbk(data.unit, data.objective)

				if my_data ~= data.internal_data then
					return true
				end
			end

			CopLogicBase._exit(data.unit, state_name)

			return true
		end
	end

	local dis = attention_obj.dis
	local susp_settings = attention_obj.unit:base():suspicion_settings()

	if attention_obj.settings.uncover_range and dis < math_min(attention_obj.settings.max_range, attention_obj.settings.uncover_range) * susp_settings.range_mul then
		attention_obj.unit:movement():on_suspicion(data.unit, true)
		managers.groupai:state():criminal_spotted(attention_obj.unit)

		return _exit_func()
	elseif attention_obj.verified and attention_obj.settings.suspicion_range and dis < math_min(attention_obj.settings.max_range, attention_obj.settings.suspicion_range) * susp_settings.range_mul then
		if attention_obj.last_suspicion_t then
			local dt = data.t - attention_obj.last_suspicion_t
			local uncover_range = attention_obj.settings.uncover_range or 0
			local range_max = attention_obj.settings.suspicion_range - uncover_range
			range_max = range_max * susp_settings.range_mul
			local range_min = uncover_range * susp_settings.range_mul
			local mul = 1 - (dis - range_min) / range_max
			local progress = dt * mul * susp_settings.buildup_mul / attention_obj.settings.suspicion_duration

			if attention_obj.uncover_progress then
				attention_obj.uncover_progress = attention_obj.uncover_progress + progress
			else
				attention_obj.uncover_progress = progress
			end

			if attention_obj.uncover_progress < 1 then
				attention_obj.unit:movement():on_suspicion(data.unit, attention_obj.uncover_progress)
				managers.groupai:state():on_criminal_suspicion_progress(attention_obj.unit, data.unit, attention_obj.uncover_progress)
			else
				attention_obj.unit:movement():on_suspicion(data.unit, true)
				managers.groupai:state():criminal_spotted(attention_obj.unit)

				return _exit_func()
			end
		else
			attention_obj.uncover_progress = 0
		end

		attention_obj.last_suspicion_t = data.t
	elseif attention_obj.uncover_progress then
		if attention_obj.last_suspicion_t then
			local dt = data.t - attention_obj.last_suspicion_t
			attention_obj.uncover_progress = attention_obj.uncover_progress - dt

			if attention_obj.uncover_progress <= 0 then
				attention_obj.uncover_progress = nil
				attention_obj.last_suspicion_t = nil

				attention_obj.unit:movement():on_suspicion(data.unit, false)
			else
				attention_obj.unit:movement():on_suspicion(data.unit, attention_obj.uncover_progress)
			end
		else
			attention_obj.last_suspicion_t = data.t
		end
	end
end

function CopLogicBase._get_logic_state_from_reaction(data, reaction)
	if data.cool then
		return
	end

	local focus_enemy = data.attention_obj

	if reaction == nil and focus_enemy then
		reaction = focus_enemy.reaction
	end

	if data.is_converted then
		if not reaction or reaction <= AIAttentionObject.REACT_SCARED then
			return "idle"
		else
			return "attack"
		end
	end

	local can_call_the_police = data.char_tweak.calls_in

	if can_call_the_police then
		if managers.groupai:state():is_police_called() then
			can_call_the_police = false
		else
			local my_cur_nav_seg = data.unit:movement():nav_tracker():nav_segment()
			local my_cur_area = managers.groupai:state():get_area_from_nav_seg_id(my_cur_nav_seg)
			local already_calling_in_area = managers.groupai:state():chk_enemy_calling_in_area(my_cur_area, data.key)

			if already_calling_in_area then
				can_call_the_police = false
			end
		end
	end

	if not reaction or reaction <= AIAttentionObject.REACT_SCARED then
		if can_call_the_police then
			return "arrest"
		else
			return "idle"
		end
	elseif reaction == AIAttentionObject.REACT_ARREST and not data.char_tweak.no_arrest then
		return "arrest"
	elseif can_call_the_police then
		if not focus_enemy then
			return "arrest"
		elseif focus_enemy.forced then
			return "attack"
		elseif not focus_enemy.verified or focus_enemy.dis >= 1500 then
			return "arrest"
		else
			return "attack"
		end
	else
		return "attack"
	end
end

function CopLogicBase._chk_call_the_police(data)
	if data.is_converted or data.cool or not data.char_tweak.calls_in or managers.groupai:state():is_police_called() then
		return
	end

	local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, data.objective, nil, nil)

	if allow_trans and data.logic.is_available_for_assignment(data) then
		if not data.attention_obj or not data.attention_obj.verified_t or data.t - data.attention_obj.verified_t > 6 or data.attention_obj.reaction <= AIAttentionObject.REACT_ARREST then
			if obj_failed then
				data.objective_failed_clbk(data.unit, data.objective)
			end

			if not data.objective or data.objective.is_default then
				local my_cur_nav_seg = data.unit:movement():nav_tracker():nav_segment()
				local my_cur_area = managers.groupai:state():get_area_from_nav_seg_id(my_cur_nav_seg)
				local already_calling_in_area = managers.groupai:state():chk_enemy_calling_in_area(my_cur_area, data.key)

				if not already_calling_in_area then
					CopLogicBase._exit(data.unit, "arrest")
				end
			end
		end
	end
end

function CopLogicBase.identify_attention_obj_instant(data, att_u_key)
	local att_obj_data = data.detected_attention_objects[att_u_key]
	local is_new = not att_obj_data

	if att_obj_data then
		mvec3_set(att_obj_data.verified_pos, att_obj_data.m_head_pos)

		att_obj_data.verified_dis = mvec3_dis(att_obj_data.m_pos, data.unit:movement():m_pos())

		if not att_obj_data.identified then
			att_obj_data.identified = true
			att_obj_data.identified_t = data.t
			att_obj_data.notice_progress = nil
			att_obj_data.prev_notice_chk_t = nil

			if att_obj_data.settings.notice_clbk then
				att_obj_data.settings.notice_clbk(data.unit, true)
			end

			data.logic.on_attention_obj_identified(data, att_u_key, att_obj_data)
		elseif att_obj_data.uncover_progress then
			att_obj_data.uncover_progress = nil

			att_obj_data.unit:movement():on_suspicion(data.unit, false)
		end
	else
		local attention_info = managers.groupai:state():get_AI_attention_objects_by_filter(data.SO_access_str)[att_u_key]

		if attention_info then
			local settings = attention_info.handler:get_attention(data.SO_access, nil, nil, data.team)

			if settings then
				att_obj_data = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, att_u_key, attention_info, settings)
				att_obj_data.identified = true
				att_obj_data.identified_t = data.t
				att_obj_data.notice_progress = nil
				att_obj_data.prev_notice_chk_t = nil

				if att_obj_data.settings.notice_clbk then
					att_obj_data.settings.notice_clbk(data.unit, true)
				end

				data.detected_attention_objects[att_u_key] = att_obj_data

				data.logic.on_attention_obj_identified(data, att_u_key, att_obj_data)
			end
		end
	end

	return att_obj_data, is_new
end

function CopLogicBase._can_arrest(data)
	if not data.char_tweak.no_arrest then
		if not data.objective or not data.objective.no_arrest then
			return true
		end
	end
end

function CopLogicBase.on_attention_obj_identified(data, attention_u_key, attention_info)
	if data.group then
		for u_key, u_data in pairs(data.group.units) do
			if u_key ~= data.key then
				if alive(u_data.unit) then
					u_data.unit:brain():clbk_group_member_attention_identified(data.unit, attention_u_key)
				end
			end
		end
	end
end

function CopLogicBase.chk_am_i_aimed_at(data, attention_obj, max_dot)
	if not attention_obj.is_person or attention_obj.unit:character_damage().dead and attention_obj.unit:character_damage():dead() then
		return
	end

	if attention_obj.dis < 700 and max_dot > 0.3 then
		max_dot = math.lerp(0.3, max_dot, (attention_obj.dis - 50) / 650)
	end

	local enemy_look_dir = nil
	local weapon_rot = nil

	if attention_obj.is_husk_player then
		enemy_look_dir = attention_obj.unit:movement():detect_look_dir()
	else
		enemy_look_dir = tmp_vec1

		if attention_obj.is_local_player then
			m_rot_y(attention_obj.unit:movement():m_head_rot(), enemy_look_dir)
		else
			if attention_obj.unit:inventory() and attention_obj.unit:inventory():equipped_unit() then
				if attention_obj.unit:movement()._stance.values[3] >= 0.6 then
					local weapon_fire_obj = attention_obj.unit:inventory():equipped_unit():get_object(Idstring("fire"))

					if alive(weapon_fire_obj) then
						weapon_rot = weapon_fire_obj:rotation()
					end
				end
			end

			if weapon_rot then
				m_rot_y(weapon_rot, enemy_look_dir)
			else
				m_rot_z(attention_obj.unit:movement():m_head_rot(), enemy_look_dir)
			end
		end
	end

	local enemy_vec = tmp_vec2
	mvec3_dir(enemy_vec, attention_obj.m_head_pos, data.unit:movement():m_com())

	return max_dot < mvec3_dot(enemy_vec, enemy_look_dir)
end

function CopLogicBase.chk_start_action_dodge(data, reason)
	if not data.char_tweak.dodge or not data.char_tweak.dodge.occasions[reason] then
		return
	end

	if data.dodge_timeout_t and data.t < data.dodge_timeout_t or data.dodge_chk_timeout_t and data.t < data.dodge_chk_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local dodge_tweak = data.char_tweak.dodge.occasions[reason]
	data.dodge_chk_timeout_t = TimerManager:game():time() + math.lerp(dodge_tweak.check_timeout[1], dodge_tweak.check_timeout[2], math.random())

	if dodge_tweak.chance == 0 or dodge_tweak.chance < math.random() then
		return
	end

	local rand_nr = math.random()
	local total_chance = 0
	local variation, variation_data = nil

	for test_variation, test_variation_data in pairs(dodge_tweak.variations) do
		total_chance = total_chance + test_variation_data.chance

		if test_variation_data.chance > 0 and rand_nr <= total_chance then
			variation = test_variation
			variation_data = test_variation_data

			break
		end
	end

	local dodge_dir = Vector3()
	local face_attention = nil

	if data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		mvec3_set(dodge_dir, data.attention_obj.m_pos)
		mvec3_sub(dodge_dir, data.m_pos)
		mvector3.set_z(dodge_dir, 0)
		mvector3.normalize(dodge_dir)

		if mvector3.dot(data.unit:movement():m_fwd(), dodge_dir) < 0 then
			return
		end

		mvector3.cross(dodge_dir, dodge_dir, math.UP)

		face_attention = true
	else
		mvector3.random_orthogonal(dodge_dir, math.UP)
	end

	local dodge_dir_reversed = false

	if math.random() < 0.5 then
		mvector3.negate(dodge_dir)

		dodge_dir_reversed = not dodge_dir_reversed
	end

	local prefered_space = 130
	local min_space = 90
	local ray_to_pos = tmp_vec1

	mvec3_set(ray_to_pos, dodge_dir)
	mvector3.multiply(ray_to_pos, 130)
	mvector3.add(ray_to_pos, data.m_pos)

	local ray_params = {
		trace = true,
		tracker_from = data.unit:movement():nav_tracker(),
		pos_to = ray_to_pos
	}
	local ray_hit1 = managers.navigation:raycast(ray_params)
	local dis = nil

	if ray_hit1 then
		local hit_vec = tmp_vec2

		mvec3_set(hit_vec, ray_params.trace[1])
		mvec3_sub(hit_vec, data.m_pos)
		mvec3_set_z(hit_vec, 0)

		dis = mvector3.length(hit_vec)

		mvec3_set(ray_to_pos, dodge_dir)
		mvector3.multiply(ray_to_pos, -130)
		mvector3.add(ray_to_pos, data.m_pos)

		ray_params.pos_to = ray_to_pos
		local ray_hit2 = managers.navigation:raycast(ray_params)

		if ray_hit2 then
			mvec3_set(hit_vec, ray_params.trace[1])
			mvec3_sub(hit_vec, data.m_pos)
			mvec3_set_z(hit_vec, 0)

			local prev_dis = dis
			dis = mvector3.length(hit_vec)

			if prev_dis < dis and min_space < dis then
				mvector3.negate(dodge_dir)

				dodge_dir_reversed = not dodge_dir_reversed
			end
		else
			mvector3.negate(dodge_dir)

			dis = nil
			dodge_dir_reversed = not dodge_dir_reversed
		end
	end

	if ray_hit1 and dis and dis < min_space then
		return
	end

	local dodge_side = nil    -- Default, below is the modified part
	if face_attention then -- choose side that rotates us towards our attention
		dodge_side = dodge_dir_reversed and "l" or "r"
	else -- choose side closest to the wanted rotation
		local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
		local my_right = tmp_vec1
		mrotation.x(data.unit:movement():m_rot(), my_right)
		local right_dot = mvec3_dot(dodge_dir, my_right)
		--print( "fwd_dot", fwd_dot )
		--print( "right_dot", right_dot )
		dodge_side = math.abs(fwd_dot) > 0.7071067690849 and (fwd_dot > 0 and "fwd" or "bwd") or right_dot > 0 and "r" or "l"
	end

	local dodge_side
	local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
	local my_right = tmp_vec1
	mrotation.x(data.unit:movement():m_rot(), my_right)
	local right_dot = mvec3_dot(dodge_dir, my_right)
	--print( "fwd_dot", fwd_dot )
	--print( "right_dot", right_dot )
	dodge_side = math.abs(fwd_dot) > 0.7071067690849 and (fwd_dot > 0 and "fwd" or "bwd") or right_dot > 0 and "r" or "l"
	local body_part = 1
	local shoot_chance = variation_data.shoot_chance
	if shoot_chance and shoot_chance > 0 and math.random() < shoot_chance then
		body_part = 2
	end

	local action_data = {
		type = "dodge",
		body_part = body_part,
		variation = variation,
		side = dodge_side,
		direction = dodge_dir,
		timeout = variation_data.timeout,
		speed = data.char_tweak.dodge.speed,
		shoot_accuracy = variation_data.shoot_accuracy,
		blocks = {
			act = -1,
			tase = -1,
			bleedout = -1,
			dodge = -1,
			walk = -1,
			action = body_part == 1 and -1 or nil,
			aim = body_part == 1 and -1 or nil
		}
	}

	if variation ~= "side_step" then
		action_data.blocks.hurt = -1
		action_data.blocks.heavy_hurt = -1
	end

		if data.unit:base()._tweak_table == "fbi_vet" then	
			action_data.body_part = 2
			action_data.blocks.action = nil
			action_data.blocks.aim = nil
		end
	local action = data.unit:movement():action_request(action_data)

	if action then
		local my_data = data.internal_data

		CopLogicAttack._cancel_cover_pathing(data, my_data)
		CopLogicAttack._cancel_charge(data, my_data)
		CopLogicAttack._cancel_expected_pos_path(data, my_data)
		CopLogicAttack._cancel_walking_to_cover(data, my_data, true)
	end

	return action
end

function CopLogicBase._set_attention_obj(data, new_att_obj, new_reaction)
	local old_att_obj = data.attention_obj
	data.attention_obj = new_att_obj

	if new_att_obj then
		new_reaction = new_reaction or new_att_obj.settings.reaction
		new_att_obj.reaction = new_reaction
		local new_crim_rec = new_att_obj.criminal_record
		local is_same_obj, contact_chatter_time_ok = nil

		if old_att_obj then
			if old_att_obj.u_key == new_att_obj.u_key then
				is_same_obj = true
				contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 2

				if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t and (not new_att_obj.settings.pause or data.t + math.lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math.random())) or new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
					if not new_att_obj.settings.attract_chance or math.random() < new_att_obj.settings.attract_chance then
						new_att_obj.pause_expire_t = nil
						new_att_obj.stare_expire_t = data.t + math.lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math.random())
					else
						debug_pause_unit(data.unit, "skipping attraction")

						new_att_obj.pause_expire_t = data.t + math.lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math.random())
					end
				end
			else
				if old_att_obj.criminal_record then
					managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
				end

				if new_crim_rec then
					managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)
				end

				contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 15
			end
		else
			if new_crim_rec then
				managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)
			end

			contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 15
		end

		if not is_same_obj then
			if new_att_obj.settings.duration then
				new_att_obj.stare_expire_t = data.t + math.lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math.random())
				new_att_obj.pause_expire_t = nil
			end

			new_att_obj.acquire_t = data.t
		end

		if AIAttentionObject.REACT_SHOOT <= new_reaction and new_att_obj.verified and contact_chatter_time_ok and (data.unit:anim_data().idle or data.unit:anim_data().move) and new_att_obj.is_person and data.char_tweak.chatter.contact then
			if data.unit:base()._tweak_table == "phalanx_vip" then
				data.unit:sound():say("a01", true)
			elseif data.unit:base()._tweak_table == "spring" then
				data.unit:sound():say("a01", true)						
			elseif data.unit:base()._tweak_table == "gensec" then
				data.unit:sound():say("a01", true)			
			elseif data.unit:base()._tweak_table == "security" then
				data.unit:sound():say("a01", true)		
			elseif data.unit:base()._tweak_table == "spooc" then
				data.unit:sound():say("clk_c01x_plu", true, true)						
			else
				data.unit:sound():say("c01", true)
			end
		end
	elseif old_att_obj and old_att_obj.criminal_record then
		managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
	end
end

function CopLogicBase._chk_alert_obstructed(my_listen_pos, alert_data)
	if alert_data[3] then
		if not CopLogicBase._alert_obstruction_slotmask then
			CopLogicBase._alert_obstruction_slotmask = managers.slot:get_mask("AI_visibility")
		end

		local alert_epicenter = nil

		if alert_data[1] == "bullet" then
			alert_epicenter = tmp_vec1

			mvec3_step(alert_epicenter, alert_data[2], alert_data[6], 50)
		else
			alert_epicenter = alert_data[2]
		end

		local ray = World:raycast("ray", my_listen_pos, alert_epicenter, "slot_mask", CopLogicBase._alert_obstruction_slotmask, "ray_type", "ai_vision", "report")

		if ray then
			if alert_data[1] == "footstep" then
				return true
			end

			local my_dis_sq = mvec3_dis(my_listen_pos, alert_epicenter)
			local dampening = alert_data[1] == "bullet" and 0.5 or 0.25
			local effective_dis_sq = alert_data[3] * dampening
			effective_dis_sq = effective_dis_sq * effective_dis_sq

			if my_dis_sq > effective_dis_sq then
				return true
			end
		end
	end
end

--[[function CopLogicBase._upd_stance_and_pose(data, my_data, objective)
	if my_data ~= data.internal_data then
		--log("how is this man")
		return
	end

	if data.char_tweak.allowed_poses or data.is_converted or my_data.tasing or my_data.spooc_attack or data.unit:in_slot(managers.slot:get_mask("criminals")) then
		return
	end

	if data.team and data.team.id == tweak_data.levels:get_default_team_ID("player") or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local obj_has_stance, obj_has_pose, agg_pose = nil
	local can_stand_or_crouch = nil

	if not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch then
		if not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand then
			if data.char_tweak.crouch_move then
				can_stand_or_crouch = true
			end
		end
	end

	if can_stand_or_crouch then
		local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)

		if data.is_suppressed then
			if diff_index <= 5 then
				if data.unit:anim_data().stand then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_crouch(data) then
							my_data.next_allowed_stance_t = data.t + math.random(1.5, 7)
							agg_pose = true
						end
					end
				end
			else
				if data.unit:anim_data().stand then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_crouch(data) then
							my_data.next_allowed_stance_t = data.t + math.random(1.5, 7)
							agg_pose = true
						end
					end
				elseif data.unit:anim_data().crouch then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_stand(data) then
							my_data.next_allowed_stance_t = data.t + math.random(1.5, 7)
							agg_pose = true
						end
					end
				end
			end
		elseif data.attention_obj and data.attention_obj.aimed_at and data.attention_obj.reaction and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT and data.attention_obj.verified then
			if diff_index > 5 then
				if data.unit:anim_data().stand then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_crouch(data) then
							my_data.next_allowed_stance_t = data.t + math.random(1.5, 7)
							agg_pose = true
						end
					end
				elseif data.unit:anim_data().crouch then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_stand(data) then
							my_data.next_allowed_stance_t = data.t + math.random(1.5, 7)
							agg_pose = true
						end
					end
				end
			end
		end
	end
	
	if agg_pose then
		return
	end

	if data.char_tweak.allowed_poses and can_stand_or_crouch and not obj_has_pose and not agg_pose then
		for pose_name, state in pairs(data.char_tweak.allowed_poses) do
			if state then
			
				if pose_name == "stand" then
					CopLogicAttack._chk_request_action_stand(data)

					break
				end
				
				if pose_name == "crouch" then
					CopLogicAttack._chk_request_action_crouch(data)

					break
				end
			end
		end
	end
end

function CopLogicBase.action_taken(data, my_data)
	return my_data.turning or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.surprised or my_data.has_old_action or data.unit:movement():chk_action_forbidden("walk")
end

function CopLogicBase.chk_should_turn(data, my_data)
	return not my_data.turning and not my_data.has_old_action and not data.unit:movement():chk_action_forbidden("walk") and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
end]]
