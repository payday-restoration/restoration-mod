local mrot_set_axis_angle = mrotation.set_axis_angle
local mvec_add = mvector3.add
local mvec_copy = mvector3.copy
local mvec_dir = mvector3.direction
local mvec_dis_sq = mvector3.distance_sq
local mvec_lerp = mvector3.lerp
local mvec_mul = mvector3.multiply
local mvec_rot_with = mvector3.rotate_with
local mvec_set = mvector3.set
local mvec_set_l = mvector3.set_length
local mvec_set_z = mvector3.set_z
local mvec_step = mvector3.step
local mvec_sub = mvector3.subtract
local tmp_rot = Rotation()
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()


-- Boss should basically always be in shooting action
function BossLogicAttack._upd_aim(data, my_data, ...)
	local focus_enemy = data.attention_obj
	local visible = focus_enemy and (focus_enemy.verified or focus_enemy.nearly_visible)
	local aim, shoot, expected_pos
	if focus_enemy then
		if BossLogicAttack._chk_use_throwable(data, my_data, focus_enemy) then
			return
		end

		local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t or math.huge
		local time_since_damaged = focus_enemy.dmg_t and data.t - focus_enemy.dmg_t or math.huge
		aim = focus_enemy.verified_dis < my_data.weapon_range.far
		shoot = aim and (visible or time_since_verification < 4) or time_since_damaged < 4
		expected_pos = focus_enemy.last_verified_pos or focus_enemy.verified_pos
	end

	if aim or shoot then
		if visible then
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

		if not my_data.shooting and not my_data.spooc_attack and not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			my_data.shooting = data.brain:action_request({
				body_part = 3,
				type = "shoot"
			})
		end
	else
		if my_data.shooting then
			local success = data.brain:action_request({
				body_part = 3,
				type = "idle"
			})
			if success then
				my_data.shooting = nil
			end
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)
			my_data.attention_unit = nil
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end


-- Adjust throwable code to allow for non throwable projectiles
-- Also make the throwing use an actual action so it properly interrupts shooting
-- We're adjusting the throwing vector to always throw at player's feet and add z compensation depending on projectile speed
function BossLogicAttack._chk_use_throwable(data, my_data, focus)
	local throwable = data.char_tweak.throwable
	local throwable_tweak = tweak_data.projectiles[throwable]
	if not throwable_tweak then
		return
	end

	if data.used_throwable_t and data.t < data.used_throwable_t then
		return data.used_throwable_shoot_t and data.t < data.used_throwable_shoot_t
	end

	if (not focus.verified) == data.char_tweak.throwable_target_verified then
		return
	end

	if not focus.verified_t or not focus.last_verified_pos or not focus.identified_t or data.t - focus.identified_t < 2 then
		return
	end

	if not focus.verified and (data.t - focus.verified_t < 2 or data.t - focus.verified_t > 8) then
		return
	end

	local mov_ext = data.unit:movement()
	local is_throwable = tweak_data.blackmarket.projectiles[throwable].throwable
	if mov_ext:chk_action_forbidden("action") or data.unit:anim_data().reload or not is_throwable and not mov_ext._allow_fire then
		return
	end

	local throw_dis = focus.verified_dis
	if throw_dis < 400 or throw_dis > (throwable_tweak.launch_speed or 600) * 3 then
		return
	end

	local throw_from
	if is_throwable then
		throw_from = mov_ext:m_rot():y()
		mvec_mul(throw_from, 40)
		mvec_add(throw_from, mov_ext:m_head_pos())
		local offset = mov_ext:m_rot():x()
		mvec_mul(offset, -20)
		mvec_add(throw_from, offset)
	else
		local weapon_unit = data.unit:inventory():equipped_unit()
		local fire_object = weapon_unit:base():fire_object() or weapon_unit:orientation_object()
		throw_from = fire_object:position()
	end

	local throw_to = focus.verified and focus.m_pos or focus.last_verified_pos
	local slotmask = managers.slot:get_mask("bullet_blank_impact_targets")
	mvec_set(tmp_vec1, throw_to)
	mvec_set_z(tmp_vec1, tmp_vec1.z - 200)
	local ray = data.unit:raycast("ray", throw_to, tmp_vec1, "slot_mask", slotmask)
	if not ray then
		return
	end
	throw_to = ray.hit_position

	local compensation = throwable_tweak.adjust_z ~= 0 and (((throw_dis - 400) / 10) ^ 2) / ((throwable_tweak.launch_speed or 250) / 10) or 0
	mvec_set_z(throw_to, throw_to.z + compensation)
	mvec_step(tmp_vec1, throw_from, throw_to, 400)
	if data.unit:raycast("ray", throw_from, tmp_vec1, "sphere_cast_radius", 15, "slot_mask", slotmask, "report") then
		return
	end

	data.used_throwable_t = data.t + (data.char_tweak.throwable_cooldown or 15)

	local redirect = is_throwable and "throw_grenade" or "recoil_single"
	if not mov_ext:play_redirect(redirect) then
		return
	end

	managers.network:session():send_to_peers_synched("play_distance_interact_redirect", data.unit, redirect)

	CopLogicAttack.aim_allow_fire(false, false, data, my_data)

	data.used_throwable_shoot_t = data.t + 1

	local throw_dir = tmp_vec1
	mvec_dir(throw_dir, throw_from, throw_to)
	ProjectileBase.throw_projectile_npc(throwable, throw_from, throw_dir, data.unit)

	return true
end


-- New chase position function, try to walk around the target instead of random positions
function BossLogicAttack._find_chase_position(data, pos, min_dis, max_dis)
	local dir, test_pos = tmp_vec1, tmp_vec2
	local min_dis_sq = min_dis ^ 2
	local dis_diff_sq = 300 ^ 2
	local current_rot = math.rand(-90, 90)
	local fallback_dis_sq = 0
	local fallback_pos
	local steps = 6
	local rotate_step = 180 / steps

	mvec_dir(dir, pos, data.m_pos)
	mvec_mul(dir, max_dis)

	local ray_params = {
		allow_entry = true,
		trace = true,
		pos_from = pos,
		pos_to = test_pos
	}

	repeat
		mrot_set_axis_angle(tmp_rot, math.UP, current_rot)

		mvec_set(test_pos, dir)
		mvec_rot_with(test_pos, tmp_rot)
		mvec_add(test_pos, pos)

		if not managers.navigation:raycast(ray_params) or mvec_dis_sq(ray_params.trace[1], pos) > min_dis_sq then
			mvec_sub(test_pos, pos)
			mvec_set_l(test_pos, min_dis)
			mvec_add(test_pos, pos)

			local chase_pos = ray_params.trace[1]
			mvec_lerp(chase_pos, test_pos, chase_pos, math.random())

			local dis_sq = mvec_dis_sq(data.m_pos, chase_pos)
			if dis_sq > dis_diff_sq then
				return chase_pos
			elseif dis_sq > fallback_dis_sq then
				fallback_dis_sq = dis_sq
				fallback_pos = chase_pos
			end
		end

		current_rot = current_rot + rotate_step
		if current_rot > 90 then
			current_rot = current_rot - 180
		end

		steps = steps - 1
	until steps <= 0

	return fallback_pos
end


-- Check for weapon range to determine wether to move closer
function BossLogicAttack._upd_combat_movement(data, my_data)
	local t = data.t
	local focus_enemy = data.attention_obj
	local enemy_visible = focus_enemy.verified
	local action_taken = data.logic.action_taken(data, my_data)
	local weapon_range = my_data.weapon_range

	if not action_taken then
		if my_data.chase_path_failed_t and t - my_data.chase_path_failed_t <= 1 then
			return
		end

		if my_data.chase_path then
			BossLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, enemy_visible and focus_enemy.dis < weapon_range.optimal and "walk" or "run")
		elseif not my_data.chase_path_search_id and focus_enemy.nav_tracker then
			local height_diff = math.abs(data.m_pos.z - focus_enemy.m_pos.z)
			local chase = height_diff < 300 or focus_enemy.dis > weapon_range.optimal or my_data.attitude == "engage" and focus_enemy.dis > weapon_range.close
			if not chase and not enemy_visible then
				chase = not focus_enemy.verified_t or t - focus_enemy.verified_t > 2
			end

			if not chase then
				return
			end

			local enemy_pos = focus_enemy.nav_tracker:field_position()
			local chase_pos = BossLogicAttack._find_chase_position(data, enemy_pos, weapon_range.close * 0.5, (weapon_range.close + weapon_range.optimal) * 0.5)
			if not chase_pos then
				chase_pos = CopLogicTravel._get_pos_on_wall(enemy_pos, weapon_range.close, nil, nil)
			end

			if chase_pos and mvec_dis_sq(focus_enemy.m_pos, chase_pos) > 100 ^ 2 then
				my_data.chase_pos = chase_pos

				local my_pos = data.unit:movement():nav_tracker():field_position()
				if math.abs(my_pos.z - my_data.chase_pos.z) < 50 then
					local ray_params = {
						allow_entry = false,
						pos_from = my_pos,
						pos_to = my_data.chase_pos
					}

					if not managers.navigation:raycast(ray_params) then
						my_data.chase_path = {
							my_pos,
							my_data.chase_pos
						}
						return
					end
				end

				my_data.chase_path_search_id = tostring(data.unit:key()) .. "chase"
				my_data.pathing_to_chase_pos = true

				data.brain:add_pos_rsrv("path", {
					radius = 50,
					position = my_data.chase_pos
				})
				data.brain:search_for_path(my_data.chase_path_search_id, my_data.chase_pos)
			else
				my_data.chase_pos = nil
				my_data.chase_path_failed_t = t
			end
		end
	elseif my_data.walking_to_chase_pos then
		local current_haste = my_data.advancing and my_data.advancing:haste()
		if not current_haste then
			return
		end

		local change_speed
		if current_haste == "run" then
			change_speed = enemy_visible and focus_enemy.dis < weapon_range.close
		else
			change_speed = not enemy_visible or focus_enemy.dis > weapon_range.optimal
		end

		if change_speed then
			BossLogicAttack._cancel_chase_attempt(data, my_data)
		end
	end
end


-- Check new position for being different than the current one
function BossLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	local from_pos = data.m_pos
	local reservation = {
		radius = 30,
		position = from_pos,
		filter = data.pos_rsrv_id
	}
	if managers.navigation:is_pos_free(reservation) then
		return
	end

	local to_pos = CopLogicTravel._get_pos_on_wall(from_pos, 500)
	if mvec_dis_sq(from_pos, to_pos) < 100 ^ 2 then
		return
	end

	my_data.advancing = data.brain:action_request({
		variant = "run",
		body_part = 2,
		type = "walk",
		nav_path = {
			mvec_copy(from_pos),
			to_pos
		}
	})

	if my_data.advancing then
		my_data.moving_out_of_the_way = my_data.advancing
		BossLogicAttack._cancel_chase_attempt(data, my_data)
		return true
	end
end


-- Update logic every frame
function BossLogicAttack.update(data)
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	if CopLogicAttack._chk_exit_non_walkable_area(data) or CopLogicIdle._chk_relocate(data) then
		return
	end

	local focus_enemy = data.attention_obj
	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		BossLogicAttack._upd_enemy_detection(data, true)
		return
	end

	BossLogicAttack._process_pathing_results(data, my_data)

	if focus_enemy and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		BossLogicAttack._upd_combat_movement(data, my_data)
	else
		BossLogicAttack._cancel_chase_attempt(data, my_data)
	end

	if not data.logic.action_taken then
		BossLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	end
end

function BossLogicAttack.queued_update() end
function BossLogicAttack.queue_update() end
