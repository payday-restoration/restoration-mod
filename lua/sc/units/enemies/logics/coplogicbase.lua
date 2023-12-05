local mrot_y = mrotation.y
local mvec3_add = mvector3.add
local mvec3_dir = mvector3.direction
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_dot = mvector3.dot
local mvec3_mul = mvector3.multiply
local mvec3_neg = mvector3.negate
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()


-- Instant detection outside of stealth
local _create_detected_attention_object_data_original = CopLogicBase._create_detected_attention_object_data
function CopLogicBase._create_detected_attention_object_data(...)
	local data = _create_detected_attention_object_data_original(...)
	if managers.groupai:state():enemy_weapons_hot() then
		data.notice_progress = 1
	end
	return data
end


-- Make shield_cover tactics stick closer to their shield tactics providers
Hooks:PreHook(CopLogicBase, "on_new_objective", "sh_on_new_objective", function (data, old_objective)
	if not data.objective or data.objective.type ~= "defend_area" or not data.group or not data.tactics or not data.tactics.shield_cover then
		return
	end

	local shield_unit = old_objective and old_objective.shield_cover_unit
	if not alive(shield_unit) or shield_unit:character_damage():dead() then
		local shield_followers = {}
		for u_key, u_data in pairs(data.group.units) do
			local logic_data = u_data.unit:brain()._logic_data
			if logic_data.tactics then
				if logic_data.tactics.shield_cover then
					local shield_cover_unit = logic_data.objective and logic_data.objective.shield_cover_unit
					if alive(shield_cover_unit) and not shield_cover_unit:character_damage():dead() then
						local shield_key = shield_cover_unit:key()
						shield_followers[shield_key] = (shield_followers[shield_key] or 0) + 1
					end
				elseif logic_data.tactics.shield then
					shield_followers[u_key] = shield_followers[u_key] or 0
				end
			end
		end

		local best_shield_key
		local least_followers = math.huge
		for u_key, followers in pairs(shield_followers) do
			if followers < least_followers then
				best_shield_key = u_key
				least_followers = followers
			end
		end

		shield_unit = best_shield_key and data.group.units[best_shield_key].unit
	end

	if shield_unit then
		data.objective.type = "follow"
		data.objective.shield_cover_unit = shield_unit
		data.objective.follow_unit = shield_unit
		data.objective.path_data = nil
		data.objective.distance = 300
	end
end)


-- Remove follow unit as soon as it dies, not just after the body despawned
function CopLogicBase.on_objective_unit_damaged(data, unit, attacker_unit)
	if unit:character_damage()._dead then
		data.objective_failed_clbk(data.unit, data.objective)
	end
end


-- Allow more dodge directions
function CopLogicBase.chk_start_action_dodge(data, reason)
	if not data.char_tweak.dodge or not data.char_tweak.dodge.occasions[reason] then
		return
	end

	if data.dodge_timeout_t and data.t < data.dodge_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	if data.dodge_chk_timeout_t and data.t < data.dodge_chk_timeout_t and reason ~= "hit" then
		return
	end

	-- Consistent dodge check cooldown
	data.dodge_chk_timeout_t = TimerManager:game():time() + 0.5

	local dodge_tweak = data.char_tweak.dodge.occasions[reason]
	if dodge_tweak.chance == 0 or dodge_tweak.chance < math.random() then
		return
	end

	local enemy_dir = tmp_vec3
	if data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT then
		mvec3_set(enemy_dir, data.attention_obj.m_pos)
		mvec3_sub(enemy_dir, data.m_pos)
		mvec3_set_z(enemy_dir, 0)
		mvector3.normalize(enemy_dir)
	else
		mvector3.set(enemy_dir, math.UP)
		mvector3.random_orthogonal(enemy_dir)
	end

	local dodge_dir = mvector3.copy(enemy_dir)
	mvector3.cross(dodge_dir, enemy_dir, math.UP)
	if math.random() < 0.5 then
		mvec3_neg(dodge_dir)
	end

	local test_space, available_space, min_space, prefered_space = 0, 0, 90, 130
	local ray_params = {
		trace = true,
		tracker_from = data.unit:movement():nav_tracker(),
		pos_to = tmp_vec1
	}

	mvec3_set(ray_params.pos_to, dodge_dir)
	mvec3_mul(ray_params.pos_to, prefered_space)
	mvec3_add(ray_params.pos_to, data.m_pos)
	local ray_hit1 = managers.navigation:raycast(ray_params)
	if ray_hit1 then
		mvec3_set(tmp_vec2, ray_params.trace[1])
		mvec3_sub(tmp_vec2, data.m_pos)
		mvec3_set_z(tmp_vec2, 0)
		test_space = mvector3.length(tmp_vec2)
	else
		test_space = prefered_space
	end

	if test_space >= min_space then
		available_space = test_space
	end

	mvec3_set(ray_params.pos_to, dodge_dir)
	mvec3_mul(ray_params.pos_to, -prefered_space)
	mvec3_add(ray_params.pos_to, data.m_pos)
	local ray_hit2 = managers.navigation:raycast(ray_params)
	if ray_hit2 then
		mvec3_set(tmp_vec2, ray_params.trace[1])
		mvec3_sub(tmp_vec2, data.m_pos)
		mvec3_set_z(tmp_vec2, 0)
		test_space = mvector3.length(tmp_vec2)
	elseif available_space < prefered_space then
		test_space = prefered_space
	end

	if test_space >= min_space and test_space > available_space then
		available_space = test_space
		mvec3_neg(dodge_dir)
	end

	-- Give enemies a chance to dodge backwards if dodging to the side is not possible or if dodging backwards has more space
	if available_space < min_space or data.attention_obj and math.random() < math.max(0, 1 - data.attention_obj.dis / 500) then
		mvec3_set(ray_params.pos_to, enemy_dir)
		mvec3_mul(ray_params.pos_to, -prefered_space)
		mvec3_add(ray_params.pos_to, data.m_pos)
		local ray_hit3 = managers.navigation:raycast(ray_params)
		if ray_hit3 then
			mvec3_set(tmp_vec2, ray_params.trace[1])
			mvec3_sub(tmp_vec2, data.m_pos)
			mvec3_set_z(tmp_vec2, 0)
			test_space = mvector3.length(tmp_vec2)
		else
			test_space = prefered_space
		end

		if test_space >= min_space and test_space >= available_space then
			available_space = test_space
			mvec3_set(dodge_dir, enemy_dir)
			mvec3_neg(dodge_dir)
		end
	end

	if available_space < min_space then
		return
	end

	mrotation.x(data.unit:movement():m_rot(), tmp_vec1)
	local right_dot = mvec3_dot(dodge_dir, tmp_vec1)
	local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
	local dodge_side =  math.abs(fwd_dot) > 0.6 and (fwd_dot > 0 and "fwd" or "bwd") or right_dot > 0 and "r" or "l"

	local rand_nr = math.random()
	local total_chance = 0
	local variation, variation_data
	for test_variation, test_variation_data in pairs(dodge_tweak.variations) do
		total_chance = total_chance + test_variation_data.chance

		if test_variation_data.chance > 0 and rand_nr <= total_chance then
			variation = test_variation
			variation_data = test_variation_data
			break
		end
	end

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


-- Check for verified interrupt distance and remove bad marshal interrupt distance
function CopLogicBase.is_obstructed(data, objective, strictness, attention)
	attention = attention or data.attention_obj
	strictness = 1 - (strictness or 0)

	if not objective or objective.is_default or (objective.in_place or not objective.nav_seg) and not objective.action then
		return true, false
	end

	if objective.interrupt_suppression and data.is_suppressed then
		return true, true
	end

	if objective.interrupt_health then
		local health_ratio = data.unit:character_damage():health_ratio()
		if health_ratio < 1 and health_ratio * strictness < objective.interrupt_health or data.unit:character_damage():dead() then
			return true, true
		end
	end

	if objective.interrupt_dis then
		if attention and (AIAttentionObject.REACT_COMBAT <= attention.reaction or data.cool and AIAttentionObject.REACT_SURPRISED <= attention.reaction) then
			if objective.interrupt_dis == -1 then
				return true, true
			end

			if attention.verified and data.char_tweak.min_obj_interrupt_dis then
				if attention.dis * strictness < data.char_tweak.min_obj_interrupt_dis then
					return true, true
				end
			end

			if math.abs(attention.m_pos.z - data.m_pos.z) < 250 then
				if attention.dis * strictness * (attention.verified and 1 or 2) < objective.interrupt_dis then
					return true, true
				end
			end

			if objective.pos and math.abs(attention.m_pos.z - objective.pos.z) < 250 then
				if mvector3.distance(objective.pos, attention.m_pos) * strictness < objective.interrupt_dis then
					return true, true
				end
			end
		elseif objective.interrupt_dis == -1 and not data.cool then
			return true, true
		end
	end

	return false, false
end


-- Fix function not working accurately for clients/NPCs
function CopLogicBase.chk_am_i_aimed_at(data, attention_obj, max_dot)
	if not attention_obj.is_person then
		return
	end

	if attention_obj.dis < 1000 then
		max_dot = math.lerp(max_dot * 0.75, max_dot, attention_obj.dis / 1000)
	end

	mvec3_set(tmp_vec1, attention_obj.unit:movement():detect_look_dir())
	mvec3_dir(tmp_vec2, attention_obj.m_head_pos, data.unit:movement():m_com())

	return max_dot < mvec3_dot(tmp_vec2, tmp_vec1)
end


-- Reduce maximum update delay
local _upd_attention_obj_detection_original = CopLogicBase._upd_attention_obj_detection
function CopLogicBase._upd_attention_obj_detection(...)
	local delay = _upd_attention_obj_detection_original(...)
	return math.min(0.5, delay)
end


-- Fix incorrect checks and improve surrender conditions
function CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit)
	local surrender_tweak = data.char_tweak.surrender
	if not surrender_tweak then
		return
	end

	if surrender_tweak.base_chance >= 1 then
		return 0
	end

	local t = data.t

	if data.surrender_window and data.surrender_window.window_expire_t < t then
		return
	end

	local hold_chance = 1
	local surrender_chk = {
		health = function (health_surrender)
			local health_ratio = data.unit:character_damage():health_ratio()
			if health_ratio < 1 then
				local min_setting, max_setting

				for k, v in pairs(health_surrender) do
					if not min_setting or k < min_setting.k then
						min_setting = {
							k = k,
							v = v
						}
					end

					if not max_setting or max_setting.k < k then
						max_setting = {
							k = k,
							v = v
						}
					end
				end

				if health_ratio < max_setting.k then
					hold_chance = hold_chance * (1 - math.map_range_clamped(health_ratio, min_setting.k, max_setting.k, min_setting.v, max_setting.v))
				end
			end
		end,

		aggressor_dis = function (agg_dis_surrender)
			local agg_dis = mvec3_dis_sq(data.m_pos, aggressor_unit:movement():m_pos())
			local min_setting, max_setting

			for k, v in pairs(agg_dis_surrender) do
				if not min_setting or k < min_setting.k then
					min_setting = {
						k = k,
						v = v
					}
				end

				if not max_setting or max_setting.k < k then
					max_setting = {
						k = k,
						v = v
					}
				end
			end

			if agg_dis < max_setting.k ^ 2 then
				hold_chance = hold_chance * (1 - math.map_range_clamped(agg_dis, min_setting.k, max_setting.k, min_setting.v, max_setting.v))
			end
		end,

		weapon_down = function (weap_down_surrender)
			local anim_data = data.unit:anim_data()
			if anim_data.reload or data.unit:inventory():equipped_unit():base():get_ammo_remaining_in_clip() == 0 then
				hold_chance = hold_chance * (1 - weap_down_surrender)
			elseif anim_data.hurt then
				hold_chance = hold_chance * (1 - weap_down_surrender)
			else
				local stance_name = data.unit:movement():stance_name()
				if stance_name == "ntl" then
					hold_chance = hold_chance * (1 - weap_down_surrender)
				elseif stance_name == "hos" then
					hold_chance = hold_chance * (1 - weap_down_surrender * 0.25)
				end
			end
		end,

		flanked = function (flanked_surrender)
			local fwd_dot = mvec3_dot(data.unit:movement():m_fwd(), tmp_vec1)
			if fwd_dot < 0 then
				hold_chance = hold_chance * (1 - flanked_surrender * math.abs(fwd_dot))
			end
		end,

		unaware_of_aggressor = function (unaware_of_aggressor_surrender)
			local att_info = data.detected_attention_objects[aggressor_unit:key()]
			if not att_info or not att_info.identified or t - att_info.identified_t < 1 then
				hold_chance = hold_chance * (1 - unaware_of_aggressor_surrender)
			end
		end,

		enemy_weap_cold = function (enemy_weap_cold_surrender)
			if not managers.groupai:state():enemy_weapons_hot() then
				hold_chance = hold_chance * (1 - enemy_weap_cold_surrender)
			end
		end,

		isolated = function (isolated_surrender)
			if data.group and data.group.has_spawned and data.group.initial_size > 1 then
				local has_support
				for u_key, u_data in pairs(data.group.units) do
					if u_key ~= data.key and mvec3_dis_sq(data.m_pos, u_data.m_pos) < 640000 then
						has_support = true
						break
					end
				end

				if not has_support then
					hold_chance = hold_chance * (1 - isolated_surrender)
				end
			end
		end,

		pants_down = function (pants_down_surrender)
			local not_cool_t = data.unit:movement():not_cool_t()
			if (not not_cool_t or t - not_cool_t < 1.5) and not managers.groupai:state():enemy_weapons_hot() then
				hold_chance = hold_chance * (1 - pants_down_surrender)
			end
		end
	}

	for reason, reason_data in pairs(surrender_tweak.reasons) do
		surrender_chk[reason](reason_data)
	end

	if hold_chance > 1 - (surrender_tweak.significant_chance or 0) then
		return 1
	end

	for factor, factor_data in pairs(surrender_tweak.factors) do
		surrender_chk[factor](factor_data)
	end

	if data.surrender_window then
		hold_chance = hold_chance * (1 - data.surrender_window.chance_mul)
	end

	if surrender_tweak.violence_timeout then
		local violence_t = data.unit:character_damage():last_suppression_t()
		if violence_t then
			local violence_dt = t - violence_t
			if violence_dt < surrender_tweak.violence_timeout then
				hold_chance = hold_chance + (1 - hold_chance) * (1 - violence_dt / surrender_tweak.violence_timeout)
			end
		end
	end

	return hold_chance < 1 and hold_chance
end