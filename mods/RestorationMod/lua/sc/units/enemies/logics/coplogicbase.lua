if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local math = math
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local mvec3_add = mvector3.add
local mvec3_ang = mvector3.angle
local mvec3_cpy = mvector3.copy
local mvec3_crs = mvector3.cross
local mvec3_mul = mvector3.multiply
local mvec3_set_len = mvector3.set_length
local REACT_SHOOT = AIAttentionObject.REACT_SHOOT
local REACT_SUSPICIOUS = AIAttentionObject.REACT_SUSPICIOUS
local REACT_COMBAT = AIAttentionObject.REACT_COMBAT
local REACT_SCARED = AIAttentionObject.REACT_SCARED
local REACT_ARREST = AIAttentionObject.REACT_ARREST

function CopLogicBase.chk_start_action_dodge(data, reason)
	if not data.char_tweak.dodge or not data.char_tweak.dodge.occasions[reason] then
		return
	end
	if data.dodge_timeout_t and data.t < data.dodge_timeout_t or data.dodge_chk_timeout_t and data.t < data.dodge_chk_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end
	local dodge_tweak = data.char_tweak.dodge.occasions[reason]
	data.dodge_chk_timeout_t = TimerManager:game():time() + math.lerp(dodge_tweak.check_timeout[1], dodge_tweak.check_timeout[2], math.random())
	if dodge_tweak.chance == 0 or math.random() > dodge_tweak.chance then
		return
	end
	local rand_nr = math.random()
	local total_chance = 0
	local variation, variation_data
	for test_variation, test_variation_data in pairs(dodge_tweak.variations) do
		total_chance = total_chance + test_variation_data.chance
		if test_variation_data.chance > 0 and rand_nr <= total_chance then
			variation = test_variation
			variation_data = test_variation_data
		else
		end
	end
	local dodge_dir = Vector3()
	local face_attention
	if data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT then
		mvec3_set(dodge_dir, data.attention_obj.m_pos)
		mvec3_sub(dodge_dir, data.m_pos)
		mvector3.set_z(dodge_dir, 0)
		mvector3.normalize(dodge_dir)
		if 0 > mvector3.dot(data.unit:movement():m_fwd(), dodge_dir) then
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
		tracker_from = data.unit:movement():nav_tracker(),
		pos_to = ray_to_pos,
		trace = true
	}
	local ray_hit1 = managers.navigation:raycast(ray_params)
	local dis
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
	if ray_hit1 and dis and min_space > dis then
		return
	end
	local dodge_side
	if face_attention then
		dodge_side = dodge_dir_reversed and "l" or "r"
	else
		local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
		local my_right = tmp_vec1
		mrotation.x(data.unit:movement():m_rot(), my_right)
		local right_dot = mvec3_dot(dodge_dir, my_right)
		if math.abs(fwd_dot) > 0.70710677 then
			if fwd_dot > 0 then
				dodge_side = "fwd"
			else
				dodge_side = "bwd"
			end
		elseif right_dot > 0 then
			dodge_side = "r"
		else
			dodge_side = "l"
		end
	end
	local body_part = 1
	local shoot_chance = variation_data.shoot_chance
	if shoot_chance and shoot_chance > 0 and shoot_chance > math.random() then
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
			walk = -1,
			action = body_part == 1 and -1 or nil,
			act = -1,
			aim = body_part == 1 and -1 or nil,
			tase = -1,
			bleedout = -1,
			dodge = -1
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

end