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

function CopLogicBase.on_importance(data)
	if not data.important or not data.internal_data then
		return
	end

	local internal_data = data.internal_data
	local detection_id = internal_data.detection_task_key
	local update_func_id = internal_data.update_queue_id
	local update_func2_id = internal_data.upd_task_key

	local e_manager = managers.enemy
	local update_task = e_manager.update_queue_task

	if detection_id then
		update_task(e_manager, detection_id, nil, nil, data.t, nil, true)
	end

	if update_func_id then
		update_task(e_manager, update_func_id, nil, nil, data.t, nil, true)
	end

	if update_func2_id then
		update_task(e_manager, update_func2_id, nil, nil, data.t, nil, true)
	end
end

function CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit) --this function makes no damn sense and uses multipliers for some reason, so i fixed it.
	local surrender_tweak = data.char_tweak.surrender

	if not surrender_tweak then
		return
	end

	if surrender_tweak.base_chance >= 1 then
		return 0
	end

	local t = data.t

	local hold_chance = 1
	hold_chance = hold_chance - surrender_tweak.base_chance
	local surrender_chk = {
		health = function (health_surrender)
			local health_ratio = data.unit:character_damage():health_ratio()

			if health_ratio < 1 then
				local min_setting, max_setting = nil

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
					local reduction = math.lerp(min_setting.v, max_setting.v, math.max(0, health_ratio - min_setting.k) / (max_setting.k - min_setting.k))
					hold_chance = hold_chance - reduction
				end
			end
		end,
		aggressor_dis = function (agg_dis_surrender)
			local agg_dis = mvec3_dis(data.m_pos, aggressor_unit:movement():m_pos())
			local min_setting, max_setting = nil

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

			if agg_dis < max_setting.k then
				local reduction = math.lerp(min_setting.v, max_setting.v, math.max(0, agg_dis - min_setting.k) / (max_setting.k - min_setting.k))
				hold_chance = hold_chance - reduction
			end
		end,
		weapon_down = function (weap_down_surrender)
			local anim_data = data.unit:anim_data()

			if anim_data.reload then
				hold_chance = hold_chance - weap_down_surrender
			elseif anim_data.hurt then
				hold_chance = hold_chance - weap_down_surrender
			end
		end,
		flanked = function (flanked_surrender)
			local dis = mvec3_dir(tmp_vec1, data.m_pos, aggressor_unit:movement():m_pos())

			local fwd = data.unit:movement():m_rot():y()
			local fwd_dot = mvec3_dot(fwd, tmp_vec1)

			if fwd_dot < -0.5 then
				hold_chance = hold_chance - flanked_surrender
			end
		end,
		unaware_of_aggressor = function (unaware_of_aggressor_surrender)
			local att_info = data.detected_attention_objects[aggressor_unit:key()]

			if not att_info or not att_info.identified or t - att_info.identified_t < 1 then
				hold_chance = hold_chance - unaware_of_aggressor_surrender
			end
		end,
		enemy_weap_cold = function (enemy_weap_cold_surrender)
			if not managers.groupai:state():chk_assault_active_atm() and not managers.groupai:state():whisper_mode() then
				hold_chance = hold_chance - enemy_weap_cold_surrender
			end
		end,
		isolated = function (isolated_surrender)
			if data.group and data.group.has_spawned and data.group.initial_size > 1 then
				local has_support = nil
				local max_dis_sq = 722500

				for u_key, u_data in pairs(data.group.units) do
					if u_key ~= data.key and mvec3_dis_sq(data.m_pos, u_data.m_pos) < max_dis_sq then
						has_support = true

						break
					end

					if not has_support then
						hold_chance = hold_chance - isolated_surrender
					end
				end
			end
		end,
		pants_down = function (pants_down_surrender)
			local not_cool_t = data.unit:movement():not_cool_t()

			if (not not_cool_t or t - not_cool_t < 1.5) and managers.groupai:state():whisper_mode() then
				hold_chance = hold_chance - pants_down_surrender
			end
		end
	}

	for reason, reason_data in pairs(surrender_tweak.reasons) do
		surrender_chk[reason](reason_data)
	end
	
	hold_chance = math.clamp(hold_chance, 0, 1)
	
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if diff_index <= 6 then
		hold_chance = hold_chance * 0.75
	end

	for factor, factor_data in pairs(surrender_tweak.factors) do
		surrender_chk[factor](factor_data)
	end
	
	--log("chance was " .. hold_chance .. "!")

	return hold_chance < 1 and hold_chance
end

function CopLogicBase.do_grenade(data, pos, flash, drop)
	if not managers.groupai:state():is_smoke_grenade_active() or data.unit:base().has_tag and not data.unit:base():has_tag("law") or data.char_tweak.cannot_throw_grenades then --if you're not calling this function from somewhere outside do_smart_grenade, remove this entire check
		return
	end

	local duration = tweak_data.group_ai.smoke_grenade_lifetime

	if flash then
		duration = tweak_data.group_ai.flash_grenade_lifetime

		managers.groupai:state():detonate_smoke_grenade(pos, data.unit:movement():m_head_pos(), duration, flash)
		managers.groupai:state():apply_grenade_cooldown(flash)

		if not drop and data.char_tweak.chatter and data.char_tweak.chatter.flash_grenade then
			data.unit:sound():say("d02", true)	
		end
	else
		managers.groupai:state():detonate_smoke_grenade(pos, data.unit:movement():m_head_pos(), duration, flash)
		managers.groupai:state():apply_grenade_cooldown(flash)

		if not drop and data.char_tweak.chatter and data.char_tweak.chatter.smoke then
			data.unit:sound():say("d01", true)	
		end
	end
	
	if not drop and not data.unit:movement():chk_action_forbidden("action") and not data.char_tweak.no_grenade_anim then
		local redir_name = "throw_grenade"

		if data.unit:movement():play_redirect(redir_name) then
			managers.network:session():send_to_peers_synched("play_distance_interact_redirect", data.unit, redir_name)
		end
	end

	return true
end

function CopLogicBase.do_smart_grenade(data, my_data, focus_enemy)

	if not focus_enemy then
		--log("No focus_enemy sent! Fuck!?")
		return
	end
	
	if not data.tactics or data.unit:base().has_tag and not data.unit:base():has_tag("law") or data.char_tweak.cannot_throw_grenades then
		--log("Invalid enemy.")
		return
	end
	
	if data.is_converted then
		--log("Converted enemy.")
		return
	end
	
	if not managers.groupai:state():is_smoke_grenade_active() then --this function would be better named "are grenades allowed"
		return
	end
	
	local t = data.t
	local enemy_visible = focus_enemy.verified
	local enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
	--local enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
	
	local flash = nil
	
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
	else
		return
	end
	
	local do_something_else = true
	
	if data.objective then
		local attitude = data.objective.attitude or "avoid"
		
		if data.tactics.flank then
			if attitude == "avoid" and not flash then
				if focus_enemy.verified and focus_enemy.aimed_at and focus_enemy.dis < 2000 then
					if my_data.walking_to_optimal_pos and my_data.optimal_pos then
						if CopLogicBase.do_grenade(data, my_data.optimal_pos + math.UP * 5, flash, nil) then
							--log("reason1")
							do_something_else = nil
						end
					elseif my_data.advancing and my_data.advance_pos then
						if CopLogicBase.do_grenade(data, my_data.advance_pos + math.UP * 5, flash, nil) then
							--log("reason2")
							do_something_else = nil
						end
					end
				end
			else
				if my_data.optimal_pos and my_data.walking_to_optimal_pos and mvec3_dis(my_data.optimal_pos, focus_enemy.m_pos) < 600 then
					if flash then
						if CopLogicBase.do_grenade(data, my_data.optimal_pos + math.UP * 10, flash, nil) then
							--log("reason3")
							do_something_else = nil
						end
					else
						if CopLogicBase.do_grenade(data, my_data.optimal_pos + math.UP * 5, flash, nil) then
							--log("reason4")
							do_something_else = nil
						end
					end
				end
			end
		end
		
		if not do_something_else then
			return true
		end
		
		if data.tactics.ranged_fire or data.tactics.elite_ranged_fire then
			if not flash then
				if my_data.firing and focus_enemy.verified then
					if data.is_suppressed or focus_enemy.criminal_record and focus_enemy.criminal_record.assault_t and data.t - focus_enemy.criminal_record.assault_t < 2 then
						if CopLogicBase.do_grenade(data, focus_enemy.m_pos + math.UP * 5, flash, nil) then
							--log("reason5")
							do_something_else = nil
						end
					end
				end
			else
				if data.tactics.elite_ranged_fire and focus_enemy.verified and focus_enemy.dis < 2000 then
					if focus_enemy.is_person then
						local area = managers.groupai:state():get_area_from_nav_seg_id(focus_enemy.nav_tracker:nav_segment())
						if CopLogicBase.do_grenade(data, area.pos + math.UP * 10, flash, nil) then
							--log("reason6")
							do_something_else = nil
						end
					end
				end
			end
		end
					
		if not do_something_else then
			return true
		end
						
		if focus_enemy.dis < 1500 and CopLogicTravel._chk_close_to_criminal(data, my_data) then
			local pos_to_use = nil
					
			if my_data.advance_pos and mvec3_dis(my_data.advance_pos, focus_enemy.m_pos) < 600 then
				pos_to_use = my_data.advance_pos
			elseif my_data.optimal_pos and mvec3_dis(my_data.optimal_pos, focus_enemy.m_pos) < 600 then
				pos_to_use = my_data.optimal_pos
			end
					
			if pos_to_use then
				if flash then
					if CopLogicBase.do_grenade(data, pos_to_use + math.UP * 10, flash, nil) then
						--log("reason7")
						do_something_else = nil
					end
				else
					if CopLogicBase.do_grenade(data, pos_to_use + math.UP * 5, flash, nil) then
						--log("reason8")
						do_something_else = nil
					end
				end
			end
		end
	end
	
	if not do_something_else then
		--log("found appropriate grenade throwing thingy!")
		return true
	else
		--log("couldnt find suitable reason")
		return
	end
	
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
				contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 8

				if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t then
					if new_att_obj.settings.pause then
						new_att_obj.stare_expire_t = nil
						new_att_obj.pause_expire_t = data.t + math_lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math_random())
					end
				elseif new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
					if not new_att_obj.settings.attract_chance or math_random() < new_att_obj.settings.attract_chance then
						new_att_obj.pause_expire_t = nil
						new_att_obj.stare_expire_t = data.t + math_lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math_random())
					else
						new_att_obj.pause_expire_t = data.t + math_lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math_random())
					end
				end
			else
				if old_att_obj.criminal_record then
					managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
				end

				if new_crim_rec then
					managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)

					contact_chatter_time_ok = data.t - new_crim_rec.det_t > 15
				end
			end
		elseif new_crim_rec then
			managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)

			contact_chatter_time_ok = data.t - new_crim_rec.det_t > 15
		end

		if not is_same_obj then
			if new_att_obj.settings.duration then
				new_att_obj.stare_expire_t = data.t + math_lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math_random())
				new_att_obj.pause_expire_t = nil
			end

			new_att_obj.acquire_t = data.t
		end

		if contact_chatter_time_ok and data.char_tweak.chatter and data.char_tweak.chatter.contact and new_att_obj.is_person and new_att_obj.verified and REACT_COMBAT <= new_reaction then
			if data.unit:anim_data().idle or data.unit:anim_data().move then
				local tweak_table = data.unit:base()._tweak_table

				if tweak_table == "gensec" or tweak_table == "security" then
					data.unit:sound():say("a01", true)
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

		if data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].use_laser and not data.weapon_laser_on then
			data.unit:inventory():equipped_unit():base():set_laser_enabled(true)

			data.weapon_laser_on = true

			managers.enemy:_destroy_unit_gfx_lod_data(data.key)
			managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_on)
		end
	elseif old_att_obj and old_att_obj.criminal_record then
		managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
	end
end

function CopLogicBase.should_get_att_obj_position_from_alert(data, alert_data)
	if alert_data[1] == "vo_distress" or alert_data[1] == "vo_intimidate" or alert_data[1] == "vo_cbt" then
		return
	end

	return true
end

function CopLogicBase._chk_nearly_visible_chk_needed(data, attention_info, u_key)
	return attention_info.is_person and attention_info.verified_t and dis < 2000
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
			if diff_index <= 5 and not managers.modifiers and managers.modifiers:check_boolean("TotalAnarchy") then
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
			if diff_index > 5 or managers.modifiers and managers.modifiers:check_boolean("TotalAnarchy") then
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

--lmao update haste more like fuck my life

function CopLogicBase.action_taken(data, my_data)
	return my_data.turning or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.has_old_action or data.unit:movement():chk_action_forbidden("walk")
end

function CopLogicBase.should_duck_on_alert(data, alert_data)
end
	
function CopLogicBase.chk_should_turn(data, my_data)
	return not my_data.turning and not my_data.has_old_action and not data.unit:movement():chk_action_forbidden("walk") and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
end

function CopLogicBase._upd_attention_obj_detection(data, min_reaction, max_reaction)
	local t = data.t
	local detected_obj = data.detected_attention_objects
	local my_data = data.internal_data
	local my_key = data.key
	local my_pos = data.unit:movement():m_head_pos()
	local my_access = data.SO_access
	local my_head_fwd = nil
	local my_tracker = data.unit:movement():nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local vis_mask = data.visibility_slotmask
	local is_cool = data.cool
	local player_importance_wgt = data.unit:in_slot(managers.slot:get_mask("enemies")) and {}

	local groupai_state_manager = managers.groupai:state()
	local all_attention_objects = groupai_state_manager:get_AI_attention_objects_by_filter(data.SO_access_str, data.team)
	local is_detection_persistent = groupai_state_manager:is_detection_persistent()

	if not my_data.detection then
		local is_cool = data.unit:movement():cool()

		if is_cool then
			my_data.detection = data.char_tweak.detection.ntl
		else
			my_data.detection = data.char_tweak.detection.combat
		end
	end

	for u_key, attention_info in pairs(all_attention_objects) do
		if u_key ~= my_key and not detected_obj[u_key] then
			local can_acquire = true

			if is_cool and attention_info.unit:base() and attention_info.unit:base().is_husk_player then
				can_acquire = false
			end

			if can_acquire then
				if not attention_info.nav_tracker or chk_vis_func(my_tracker, attention_info.nav_tracker) then
					local settings = attention_info.handler:get_attention(my_access, min_reaction, max_reaction, data.team)

					if settings then
						local acquired, angle, dis_multiplier = nil
						local attention_pos = attention_info.handler:get_detection_m_pos()
						local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)

						if my_data.detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
							angle = -1
							dis_multiplier = 0
						else
							local dis_mul = nil
							local max_dis = my_data.detection.dis_max

							if settings.max_range then
								max_dis = math_min(max_dis, settings.max_range)
							end

							if settings.detection and settings.detection.range_mul then
								max_dis = max_dis * settings.detection.range_mul
							end

							dis_mul = dis / max_dis

							if dis_mul < 1 then
								if settings.notice_requires_FOV then
									my_head_fwd = my_head_fwd or data.unit:movement():m_head_rot():z()
									local vec_angle = mvec3_angle(my_head_fwd, tmp_vec1)

									if not my_data.detection.use_uncover_range and vec_angle < 55 and settings.uncover_range and dis < settings.uncover_range then
										angle = -1
										dis_multiplier = 0
									else
										local angle_max = math_lerp(180, my_data.detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
										angle_multiplier = vec_angle / angle_max

										if angle_multiplier < 1 then
											angle = vec_angle
											dis_multiplier = dis_mul
										end
									end
								else
									angle = 0
									dis_multiplier = dis_mul
								end
							end
						end

						if angle then
							local vis_ray = data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", vis_mask, "ray_type", "ai_vision")

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

						if not acquired and player_importance_wgt then
							local is_human_player, is_local_player, is_husk_player = nil

							if attention_info.unit:base() then
								is_local_player = attention_info.unit:base().is_local_player
								is_husk_player = attention_info.unit:base().is_husk_player
								is_human_player = is_local_player or is_husk_player
							end

							if is_human_player then
								local weight = mvec3_dir(tmp_vec1, attention_pos, my_pos)
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
						end
					end
				end
			end
		end
	end

	local delay = is_cool and 0 or 2
	
	if not is_cool then	
		if data.team and data.team.id == tweak_data.levels:get_default_team_ID("player") or data.is_converted or data.unit:in_slot(16) or data.unit:in_slot(managers.slot:get_mask("criminals")) then
			delay = 0
		elseif data.important then
			delay = 0
		end
	end
	
	for u_key, attention_info in pairs(detected_obj) do
		local can_detect = true

		if is_cool and attention_info.is_husk_player then
			can_detect = false

			if attention_info.client_casing_suspicion or attention_info.client_peaceful_detection then
				if t >= attention_info.next_verify_t then
					attention_info.next_verify_t = t

					local attention_pos = attention_info.m_head_pos
					local dis = mvec3_dis(my_pos, attention_pos)
					attention_info.dis = dis

					if attention_info.verified then
						attention_info.verified_t = t
						attention_info.verified_dis = dis

						mvec3_set(attention_info.verified_pos, attention_pos)

						if attention_info.last_verified_pos then
							mvec3_set(attention_info.last_verified_pos, attention_pos)
						else
							attention_info.last_verified_pos = mvec3_cpy(attention_pos)
						end
					end
				end
			end
		end

		if can_detect then
			if not attention_info.visible_in_this_instance and t < attention_info.next_verify_t then
				if REACT_SUSPICIOUS <= attention_info.reaction then
					delay = math_min(attention_info.next_verify_t - t, delay)
				end
			else
				local settings = attention_info.settings
				local verify_interval = nil

				if is_cool then
					verify_interval = 0
				elseif attention_info.identified and attention_info.verified then
					verify_interval = settings.verification_interval
				else
					verify_interval = settings.notice_interval or settings.verification_interval
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
						local attention_pos = attention_info.m_head_pos
						local dis = mvec3_dir(tmp_vec1, my_pos, attention_pos)

						if my_data.detection.use_uncover_range and settings.uncover_range and dis < settings.uncover_range then
							angle = -1
							dis_multiplier = 0
						else
							local dis_mul = nil
							local max_dis = my_data.detection.dis_max

							if settings.max_range then
								max_dis = math_min(max_dis, settings.max_range)
							end

							if settings.detection and settings.detection.range_mul then
								max_dis = max_dis * settings.detection.range_mul
							end

							dis_mul = dis / max_dis

							if dis_mul < 1 then
								if settings.notice_requires_FOV then
									my_head_fwd = my_head_fwd or data.unit:movement():m_head_rot():z()
									local vec_angle = mvec3_angle(my_head_fwd, tmp_vec1)

									if not my_data.detection.use_uncover_range and vec_angle < 55 and settings.uncover_range and dis < settings.uncover_range then
										angle = -1
										dis_multiplier = 0
									else
										local angle_max = math_lerp(180, my_data.detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
										angle_multiplier = vec_angle / angle_max

										if angle_multiplier < 1 then
											angle = vec_angle
											dis_multiplier = dis_mul
										end
									end
								else
									angle = 0
									dis_multiplier = dis_mul
								end
							end
						end

						if angle then
							local vis_ray = attention_info.visible_ray or data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", vis_mask, "ray_type", "ai_vision")

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
							local notice_delay_mul = settings.notice_delay_mul or 1

							if settings.detection and settings.detection.delay_mul then
								notice_delay_mul = notice_delay_mul * settings.detection.delay_mul
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
						attention_info.release_t = t + settings.release_delay
						attention_info.identified_t = t
						noticable = true

						data.logic.on_attention_obj_identified(data, u_key, attention_info)
					elseif attention_info.notice_progress < 0 then
						CopLogicBase._destroy_detected_attention_object_data(data, attention_info)

						noticable = false
					else
						noticable = attention_info.notice_progress
						attention_info.prev_notice_chk_t = t

						if is_cool and REACT_SCARED <= settings.reaction then
							groupai_state_manager:on_criminal_suspicion_progress(attention_info.unit, data.unit, noticable)
						end
					end

					if noticable ~= false and settings.notice_clbk then
						settings.notice_clbk(data.unit, noticable)
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
						if not is_cool then
							attention_info.next_verify_t = t + settings.verification_interval
							delay = math_min(delay, settings.verification_interval)
						end

						attention_info.nearly_visible = nil

						local verified, vis_ray = nil
						local attention_pos = attention_info.m_head_pos
						local dis = mvec3_dis(my_pos, attention_pos)
						local max_dis = my_data.detection.dis_max

						if dis < max_dis * 1.2 then
							if settings.max_range then
								max_dis = math_min(max_dis, settings.max_range)
							end

							if settings.detection and settings.detection.range_mul then
								max_dis = max_dis * settings.detection.range_mul
							end

							if dis < max_dis * 1.2 then
								local in_FOV = not settings.notice_requires_FOV or data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask)

								if not in_FOV then
									mvec3_dir(tmp_vec1, my_pos, attention_pos)

									my_head_fwd = my_head_fwd or data.unit:movement():m_head_rot():z()
									local angle = mvec3_angle(my_head_fwd, tmp_vec1)
									local angle_max = math_lerp(180, my_data.detection.angle_max, math_clamp((dis - 150) / 700, 0, 1))
									local strictness = 0.8

									if angle_max > angle * strictness then
										in_FOV = true
									end
								end

								if in_FOV then
									if attention_info.visible_in_this_instance then
										verified = true
										vis_ray = attention_info.visible_ray
									else
										vis_ray = attention_info.visible_ray or data.unit:raycast("ray", my_pos, attention_pos, "slot_mask", vis_mask, "ray_type", "ai_vision")

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
							attention_info.verified_dis = dis

							mvec3_set(attention_info.verified_pos, attention_pos)

							if attention_info.last_verified_pos then
								mvec3_set(attention_info.last_verified_pos, attention_pos)
							else
								attention_info.last_verified_pos = mvec3_cpy(attention_pos)
							end
						elseif not is_cool and REACT_COMBAT <= settings.reaction and data.enemy_slotmask and attention_info.unit:in_slot(data.enemy_slotmask) then
							local destroyed_att_data = nil

							if is_detection_persistent and attention_info.criminal_record then
								attention_info.release_t = nil
								
								delay = math_min(0.2, delay)
								attention_info.next_verify_t = math_min(0.2, attention_info.next_verify_t)

								mvec3_set(attention_info.verified_pos, attention_pos)

								attention_info.verified_dis = dis
							elseif attention_info.release_t and attention_info.release_t < t then
								CopLogicBase._destroy_detected_attention_object_data(data, attention_info)

								destroyed_att_data = true
							else
								attention_info.release_t = attention_info.release_t or t + settings.release_delay
							end

							if not destroyed_att_data and vis_ray and attention_info.is_person and attention_info.verified_t and dis < 2000 and data.important then
								local required_last_seen_t = attention_info.criminal_record and 3 or settings.release_delay * 0.5

								if t - attention_info.verified_t < required_last_seen_t or attention_info.nearly_visible_t and t - attention_info.nearly_visible_t < required_last_seen_t then
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

									mvec3_set(side_vec, attention_pos)
									mvec3_sub(side_vec, my_pos)
									mvec3_cross(side_vec, side_vec, math_up)
									mvec3_set_length(side_vec, side_offset)
									mvec3_set(near_pos, attention_pos)
									mvec3_add(near_pos, side_vec)

									local near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", vis_mask, "ray_type", "ai_vision", "report")

									if near_vis_ray then
										mvec3_mul(side_vec, -2)
										mvec3_add(near_pos, side_vec)

										near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", vis_mask, "ray_type", "ai_vision", "report")

										if near_vis_ray then
											mvec3_set(near_pos, attention_pos)
											mvec3_set_z(near_pos, near_pos.z + head_offset)

											near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", vis_mask, "ray_type", "ai_vision", "report")

											if near_vis_ray then

												mvec3_set(near_pos, attention_pos)
												mvec3_set_z(near_pos, near_pos.z - hips_offset)

												near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", vis_mask, "ray_type", "ai_vision", "report")

												if near_vis_ray then
													mvec3_set(near_pos, attention_pos)
													mvec3_set_z(near_pos, near_pos.z - legs_offset)

													near_vis_ray = data.unit:raycast("ray", my_pos, near_pos, "slot_mask", vis_mask, "ray_type", "ai_vision", "report")
												end
											end
										end
									end

									if not near_vis_ray then
										attention_info.nearly_visible = true
										attention_info.nearly_visible_t = t
										attention_info.release_t = nil

										if attention_info.last_verified_pos then
											mvec3_set(attention_info.last_verified_pos, attention_pos)
										else
											attention_info.last_verified_pos = mvec3_cpy(attention_pos)
										end
									end
								end
							end
						elseif attention_info.release_t and attention_info.release_t < t then
							CopLogicBase._destroy_detected_attention_object_data(data, attention_info)
						else
							attention_info.release_t = attention_info.release_t or t + settings.release_delay
						end
					end
				end
			end
		end

		if player_importance_wgt and attention_info.is_human_player then
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

		attention_info.visible_in_this_instance = nil
		attention_info.visible_angle = nil
		attention_info.visible_dis_multiplier = nil
		attention_info.visible_ray = nil
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
	local dis = mvec3_dis(my_unit:movement():m_head_pos(), m_head_pos)
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
		if data.cool then
			if attention_info.client_casing_suspicion or attention_info.client_peaceful_detection then
				attention_info.reaction = new_settings.reaction

				return
			end
		end

		local switch_from_suspicious = REACT_SCARED <= new_settings.reaction and attention_info.reaction <= REACT_SUSPICIOUS
		attention_info.settings = new_settings
		attention_info.stare_expire_t = nil
		attention_info.pause_expire_t = nil

		if switch_from_suspicious then
			attention_info.next_verify_t = 0
			attention_info.prev_notice_chk_t = TimerManager:game():time()

			if attention_info.identified then
				attention_info.identified = false
				attention_info.notice_progress = attention_info.uncover_progress or 0
				attention_info.verified = nil
			end
		end

		attention_info.uncover_progress = nil
		attention_info.reaction = new_settings.reaction

		if attention_info.unit:character_damage() and attention_info.unit:character_damage().dead then
			attention_info.is_alive = not attention_info.unit:character_damage():dead()
		end
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

	if REACT_SCARED <= old_settings.reaction then
		if not new_settings or REACT_SCARED > new_settings.reaction then
			managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, data.unit, nil)
		end
	end
end

function CopLogicBase.is_obstructed(data, objective, strictness, attention)
	local my_data = data.internal_data
	--attention = attention or data.attention_obj

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
	
	local health_ratio = data.unit:character_damage():health_ratio()
	local is_dead = data.unit:character_damage():dead() or health_ratio <= 0

	if is_dead then
		return true, true
	end

	local strictness_mul = strictness and 1 - strictness

	if objective.interrupt_health then
		if health_ratio < 1 then
			local too_much_damage = nil

			if strictness_mul then
				too_much_damage = health_ratio * strictness_mul < objective.interrupt_health
			else
				too_much_damage = health_ratio < objective.interrupt_health
			end

			if too_much_damage then
				return true, true
			end
		end
	end

	if objective.interrupt_dis then
		if attention and attention.reaction then
			local reaction_to_check = nil

			if data.cool then
				reaction_to_check = REACT_SURPRISED
			else
				reaction_to_check = REACT_COMBAT
			end
			
			if reaction_to_check <= attention.reaction then
				if objective.interrupt_dis == -1 then
					return true, true
				elseif math_abs(attention.m_pos.z - data.m_pos.z) < 250 then
					local enemy_dis = attention.dis

					if strictness_mul then
						enemy_dis = enemy_dis * strictness_mul
					end

					if not attention.verified then
						enemy_dis = enemy_dis * 2
					end

					if enemy_dis < objective.interrupt_dis then
						return true, true
					end
				end

				if objective.pos and math_abs(attention.m_pos.z - objective.pos.z) < 250 then
					local enemy_dis = mvec3_dis(objective.pos, attention.m_pos)

					if strictness_mul then
						enemy_dis = enemy_dis * strictness_mul
					end

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
	if attention_obj.client_casing_suspicion then
		return
	end

	local function _exit_func()
		if not attention_obj.client_casing_detected then
			attention_obj.unit:movement():on_uncovered(data.unit)
		else
			attention_obj.client_casing_detected = nil
			attention_obj.client_casing_suspicion = true
		end

		local reaction, state_name = nil

		if attention_obj.forced then
			reaction = REACT_SHOOT
			state_name = "attack"
		elseif attention_obj.verified then
			if not data.char_tweak.no_arrest and attention_obj.dis < 1500 then
				reaction = REACT_ARREST
				state_name = "arrest"
			elseif attention_obj.criminal_record and attention_obj.criminal_record.being_arrested then
				reaction = REACT_AIM
				state_name = "arrest"
			else
				reaction = REACT_COMBAT
				state_name = "attack"
			end
		elseif data.char_tweak.calls_in then
			reaction = REACT_AIM
			state_name = "arrest"
		else
			reaction = REACT_COMBAT
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

	if attention_obj.client_casing_detected then
		managers.groupai:state():criminal_spotted(attention_obj.unit)

		return _exit_func()
	end

	local dis = attention_obj.dis
	local susp_settings = attention_obj.unit:base():suspicion_settings()

	if attention_obj.verified and attention_obj.settings.uncover_range and dis < math_min(attention_obj.settings.max_range, attention_obj.settings.uncover_range) * susp_settings.range_mul then
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

function CopLogicBase.upd_suspicion_decay(data)
	local my_data = data.internal_data

	for u_key, u_data in pairs(data.detected_attention_objects) do
		if not u_data.client_casing_suspicion and u_data.uncover_progress and u_data.last_suspicion_t ~= data.t then
			local dt = data.t - u_data.last_suspicion_t
			u_data.uncover_progress = u_data.uncover_progress - dt

			if u_data.uncover_progress <= 0 then
				u_data.uncover_progress = nil
				u_data.last_suspicion_t = nil

				u_data.unit:movement():on_suspicion(data.unit, false)
			else
				u_data.unit:movement():on_suspicion(data.unit, u_data.uncover_progress)

				u_data.last_suspicion_t = data.t
			end
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
	
	if not managers.groupai:state():whisper_mode() then
		return "attack"
	end
	
	if data.unit:in_slot(16) or data.is_converted then
		if not reaction or reaction <= REACT_SCARED then
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

	if not reaction or reaction <= REACT_SCARED then
		if can_call_the_police then
			return "arrest"
		else
			return "idle"
		end
	elseif reaction == REACT_ARREST and not data.char_tweak.no_arrest then
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
		if not data.attention_obj or not data.attention_obj.verified_t or data.t - data.attention_obj.verified_t > 6 or data.attention_obj.reaction <= REACT_ARREST then
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
	data.t = TimerManager:game():time()
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

function CopLogicBase.chk_start_action_dodge(data, reason)
	if not data.char_tweak.dodge or not data.char_tweak.dodge.occasions[reason] then
		return
	end

	if data.dodge_timeout_t and data.t < data.dodge_timeout_t or data.dodge_chk_timeout_t and data.t < data.dodge_chk_timeout_t or data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local dodge_tweak = data.char_tweak.dodge.occasions[reason]
	
	if not dodge_tweak.variations then
		log("unit " .. data.unit:base()._tweak_table .. " has broken dodges!")
		return
	end
	
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
	
	if data.attention_obj and REACT_COMBAT <= data.attention_obj.reaction then
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
	
	local prefered_space = 200
	local min_space = 130
	local ray_to_pos = tmp_vec1
	mvec3_set(ray_to_pos, dodge_dir)
	mvector3.multiply(ray_to_pos, 200)
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
		mvector3.multiply(ray_to_pos, -200)
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
	
	local dodge_side
	local fwd_dot = mvec3_dot(dodge_dir, data.unit:movement():m_fwd())
	local my_right = tmp_vec1
	mrotation.x(data.unit:movement():m_rot(), my_right)
	local right_dot = mvec3_dot(dodge_dir, my_right)
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
	if variation ~= "side_step" then -- they can play hurts while side-stepping
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

function CopLogicBase.on_suppressed_state(data)
	if data.is_suppressed and data.objective and not Global.game_settings.one_down then
		local allow_trans, interrupt = CopLogicBase.is_obstructed(data, data.objective, nil, nil)

		if interrupt then
			data.objective_failed_clbk(data.unit, data.objective)
		end
	end
end

function CopLogicBase.on_intimidated(data, amount, aggressor_unit)
	
end

function CopLogicBase.on_tied(data, aggressor_unit)
	data.t = TimerManager:game():time()
	if data.objective and data.objective_failed_clbk then
		data.objective_failed_clbk(data.unit, data.objective)
	end
end

function CopLogicBase.queue_task(internal_data, id, func, data, exec_t, asap)
	local qd_tasks = internal_data.queued_tasks

	if qd_tasks then
		qd_tasks[id] = true
	else
		internal_data.queued_tasks = {
			[id] = true
		}
	end
	
	if data.unit then
		if not managers.groupai:state():whisper_mode() then
			if data.unit:base():has_tag("special") or data.important then
				asap = true
				if exec_t and exec_t > data.t then
					exec_t = data.t
				end
			elseif data.is_converted or data.unit:in_slot(16) or data.team and data.team.id == tweak_data.levels:get_default_team_ID("player") or data.unit:in_slot(managers.slot:get_mask("criminals")) then
				exec_t = data.t
				asap = true
			end
		end
	end

	managers.enemy:queue_task(id, func, data, exec_t, callback(CopLogicBase, CopLogicBase, "on_queued_task", internal_data), asap)
end

function CopLogicBase.death_clbk(data, damage_info)
	if data.weapon_laser_on then
		if data.unit:inventory():equipped_unit() then
			data.unit:inventory():equipped_unit():base():set_laser_enabled(false)
		end

		data.weapon_laser_on = nil
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_off)
	end
	
	if data.objective and data.objective_failed_clbk then
		data.objective_failed_clbk(data.unit, data.objective)
	end
end
