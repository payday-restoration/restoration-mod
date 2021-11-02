-- Instant detection outside of stealth
local _create_detected_attention_object_data_original = CopLogicBase._create_detected_attention_object_data
function CopLogicBase._create_detected_attention_object_data(...)
	local data = _create_detected_attention_object_data_original(...)
	if managers.groupai:state():enemy_weapons_hot() then
		data.notice_progress = 1
	end
	return data
end


-- Make important enemies more reactive
local queue_task_original = CopLogicBase.queue_task
function CopLogicBase.queue_task(internal_data, id, func, data, exec_t, asap, ...)
	if asap and exec_t and data.important then
		exec_t = math.min(exec_t, data.t + 0.1)
	end
	return queue_task_original(internal_data, id, func, data, exec_t, asap, ...)
end


-- Make shield_cover tactics stick closer to their shield tactics providers
Hooks:PreHook(CopLogicBase, "on_new_objective", "sh_on_new_objective", function (data, old_objective)
	if not data.objective or data.objective.type ~= "defend_area" or not data.group or not data.tactics or not data.tactics.shield_cover then
		return
	end

	local shielding_units = {}
	if old_objective and alive(old_objective.follow_unit) then
		table.insert(shielding_units, old_objective.follow_unit)
	else
		local logic_data
		for _, u_data in pairs(data.group.units) do
			logic_data = u_data.unit:brain()._logic_data
			if logic_data and logic_data.tactics and logic_data.tactics.shield then
				table.insert(shielding_units, u_data.unit)
			end
		end
	end

	if #shielding_units > 0 then
		data.objective.type = "follow"
		data.objective.follow_unit = table.random(shielding_units)
		data.objective.path_data = nil
		data.objective.distance = 300
	end
end)


-- Allow more dodge directions
local math_random = math.random
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_mul = mvector3.multiply
local mvec3_neg = mvector3.negate
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
function CopLogicBase.chk_start_action_dodge(data, reason)
	if not data.char_tweak.dodge or not data.char_tweak.dodge.occasions[reason] then
		return
	end

	if data.dodge_timeout_t and data.t < data.dodge_timeout_t or data.dodge_chk_timeout_t and data.t < data.dodge_chk_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local dodge_tweak = data.char_tweak.dodge.occasions[reason]
	data.dodge_chk_timeout_t = TimerManager:game():time() + math.lerp(dodge_tweak.check_timeout[1], dodge_tweak.check_timeout[2], math_random())
	if dodge_tweak.chance == 0 or dodge_tweak.chance < math_random() then
		return
	end

	local dodge_dir = Vector3()
	if data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT then
		mvec3_set(dodge_dir, data.attention_obj.m_pos)
		mvec3_sub(dodge_dir, data.m_pos)
		mvec3_set_z(dodge_dir, 0)
		mvector3.normalize(dodge_dir)

		-- Don't preemptively dodge if the enemy is behind us
		if reason == "preemptive" and mvec3_dot(data.unit:movement():m_fwd(), dodge_dir) < 0 then
			return
		end

		mvector3.cross(dodge_dir, dodge_dir, math.UP)
		if math_random() < 0.5 then
			mvec3_neg(dodge_dir)
		end
	else
		mvector3.random_orthogonal(dodge_dir, math.UP)
	end

	local dis
	local min_space, prefered_space = 90, 130

	mvec3_set(tmp_vec1, dodge_dir)
	mvec3_mul(tmp_vec1, prefered_space)
	mvec3_add(tmp_vec1, data.m_pos)

	local ray_params = {
		trace = true,
		tracker_from = data.unit:movement():nav_tracker(),
		pos_to = tmp_vec1
	}
	local ray_hit1 = managers.navigation:raycast(ray_params)
	if ray_hit1 then
		mvec3_set(tmp_vec2, ray_params.trace[1])
		mvec3_sub(tmp_vec2, data.m_pos)
		mvec3_set_z(tmp_vec2, 0)

		dis = mvector3.length(tmp_vec2)

		mvec3_set(ray_params.pos_to, dodge_dir)
		mvec3_mul(ray_params.pos_to, -prefered_space)
		mvec3_add(ray_params.pos_to, data.m_pos)

		local ray_hit2 = managers.navigation:raycast(ray_params)
		if ray_hit2 then
			mvec3_set(tmp_vec2, ray_params.trace[1])
			mvec3_sub(tmp_vec2, data.m_pos)
			mvec3_set_z(tmp_vec2, 0)

			local prev_dis = dis
			dis = mvector3.length(tmp_vec2)

			if prev_dis < dis and min_space < dis then
				mvec3_neg(dodge_dir)
			end
		else
			mvec3_neg(dodge_dir)
			dis = nil
		end
	end

	if dis and dis < min_space then
		return
	end

	mrotation.x(data.unit:movement():m_rot(), tmp_vec1)
	local right_dot = mvec3_dot(dodge_dir, tmp_vec1)
	local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
	local dodge_side =  math.abs(fwd_dot) > 0.6 and (fwd_dot > 0 and "fwd" or "bwd") or right_dot > 0 and "r" or "l"

	local rand_nr = math_random()
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
	if shoot_chance and shoot_chance > 0 and math_random() < shoot_chance then
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
