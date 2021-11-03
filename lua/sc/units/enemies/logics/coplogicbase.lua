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

local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

local m_rot_x = mrotation.x
local m_rot_y = mrotation.y
local m_rot_z = mrotation.z

local math_lerp = math.lerp
local math_random = math.random
local math_up = math.UP
local math_abs = math.abs
local math_clamp = math.clamp
local math_min = math.min

local table_insert = table.insert
local table_contains = table.contains

local REACT_AIM = AIAttentionObject.REACT_AIM
local REACT_ARREST = AIAttentionObject.REACT_ARREST
local REACT_COMBAT = AIAttentionObject.REACT_COMBAT
local REACT_SCARED = AIAttentionObject.REACT_SCARED
local REACT_SHOOT = AIAttentionObject.REACT_SHOOT
local REACT_SURPRISED = AIAttentionObject.REACT_SURPRISED
local REACT_SUSPICIOUS = AIAttentionObject.REACT_SUSPICIOUS


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

				if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t then
					if new_att_obj.settings.pause then
						new_att_obj.stare_expire_t = nil
						new_att_obj.pause_expire_t = data.t + math.lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math.random())
					end
				elseif new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
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
			if data.unit:anim_data().idle or data.unit:anim_data().move then
				local tweak_table = data.unit:base()._tweak_table
				if tweak_table == "phalanx_vip" then
					data.unit:sound():say("a01", true)
				elseif tweak_table == "spring" then
					data.unit:sound():say("a01", true)						
				elseif tweak_table == "gensec" then
					data.unit:sound():say("a01", true)			
				elseif tweak_table == "security" then
					data.unit:sound():say("a01", true)		
				elseif tweak_table == "spooc" then
					data.unit:sound():say("clk_c01x_plu", true, true)
				elseif data.unit:base().has_tag and data.unit:base():has_tag("shield") then
					if not data.attack_sound_t or data.t - data.attack_sound_t > 40 then
						data.attack_sound_t = data.t

						data.unit:sound():play("shield_identification", nil, true)
					end
				else
					data.unit:sound():say("c01", true)
				end
			end
		end
		
	elseif old_att_obj and old_att_obj.criminal_record then
		managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
	end
end

function CopLogicBase._upd_stance_and_pose(data, my_data, objective)
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
							my_data.next_allowed_stance_t = data.t + math.lerp(1.5, 7, math.random())
							agg_pose = true
						end
					end
				end
			else
				if data.unit:anim_data().stand then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_crouch(data) then
							my_data.next_allowed_stance_t = data.t + math.lerp(1.5, 7, math.random())
							agg_pose = true
						end
					end
				elseif data.unit:anim_data().crouch then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_stand(data) then
							my_data.next_allowed_stance_t = data.t + math.lerp(1.5, 7, math.random())
							agg_pose = true
						end
					end
				end
			end
		elseif data.attention_obj and data.attention_obj.aimed_at and data.attention_obj.reaction and data.attention_obj.reaction >= REACT_COMBAT and data.attention_obj.verified then
			if diff_index > 5 then
				if data.unit:anim_data().stand then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_crouch(data) then
							my_data.next_allowed_stance_t = data.t + math.lerp(1.5, 7, math.random())
							agg_pose = true
						end
					end
				elseif data.unit:anim_data().crouch then
					if not my_data.next_allowed_stance_t or my_data.next_allowed_stance_t < data.t then
						if CopLogicAttack._chk_request_action_stand(data) then
							my_data.next_allowed_stance_t = data.t + math.lerp(1.5, 7, math.random())
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

function CopLogicBase.chk_am_i_aimed_at(data, attention_obj, max_dot)
	if not attention_obj.is_person or not attention_obj.is_alive then
		return
	end

	if attention_obj.dis < 700 and max_dot > 0.3 then
		max_dot = math_lerp(0.3, max_dot, (attention_obj.dis - 50) / 650)
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
