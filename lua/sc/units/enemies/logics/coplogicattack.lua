local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()

-- Reuse function of idle logic to make enemies in an area aware of a player entering the area
CopLogicAttack.on_area_safety = CopLogicIdle.on_area_safety


-- Prevent tasers from switching target while tasing
local _chk_request_action_turn_to_enemy_original = CopLogicAttack._chk_request_action_turn_to_enemy
function CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, ...)
	return not my_data.tasing and _chk_request_action_turn_to_enemy_original(data, my_data, ...)
end

-- Compatibility with The Fixes
TheFixesPreventer = TheFixesPreventer or {}
TheFixesPreventer.crash_upd_aim_coplogicattack = true

-- Remove some of the strict conditions for enemies shooting while on the move
-- This will result in enemies opening fire more likely while moving
-- Also greatly simplified the function
function CopLogicAttack._upd_aim(data, my_data)
	local focus_enemy = data.attention_obj
	local verified = focus_enemy and focus_enemy.verified
	local nearly_visible = focus_enemy and focus_enemy.nearly_visible

	local aim, shoot, expected_pos = CopLogicAttack._check_aim_shoot(data, my_data, focus_enemy, verified, nearly_visible)

	if aim or shoot then
		if verified or nearly_visible then
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
			data.brain:action_request({
				body_part = 3,
				type = "idle"
			})
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)
			my_data.attention_unit = nil
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end

-- Helper function to reuse in other enemy logic _upd_aim functions
function CopLogicAttack._check_aim_shoot(data, my_data, focus_enemy, verified, nearly_visible)
	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		return
	end

	local advancing = my_data.advancing and not my_data.advancing:stopping()
	local running = data.unit:anim_data().run or advancing and my_data.advancing:haste() == "run"
	local verified_dt = focus_enemy.verified_t and data.t - focus_enemy.verified_t or math.huge
	local weapon_range = my_data.weapon_range or { close = 750, optimal = 1500, far = 3000 }
	local firing_range = running and weapon_range.close or weapon_range.far
	local enemy_dis = focus_enemy.verified_dis
	local pushing = data.group and data.group.objective and (data.group.objective.open_fire or data.group.objective.moving_in)

	local expected_pos
	local aim = data.char_tweak.always_face_enemy or not advancing or pushing or verified_dt < math.map_range(enemy_dis, 0, firing_range, 6, 3)
	local shoot = aim and my_data.shooting and AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction and verified_dt < (running and 2 or 4)

	if verified or nearly_visible then
		if not shoot and AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction then
			local suppression_t = data.unit:character_damage():last_suppression_t()
			local suppression_dt = suppression_t and data.t - suppression_t
			local assault_dt = focus_enemy.criminal_record and focus_enemy.criminal_record.assault_t and data.t - focus_enemy.criminal_record.assault_t

			if suppression_dt and suppression_dt < 7 * (running and 0.5 or 1) * (verified and 1 or 0.5) then
				shoot = true
			elseif verified and enemy_dis < firing_range then
				shoot = true
			elseif verified and assault_dt and assault_dt < (running and 2 or 4) then
				shoot = true
			elseif my_data.attitude == "engage" and my_data.firing and verified_dt < 4 then
				shoot = true
			end
		end

		aim = aim or shoot or enemy_dis < firing_range
	else
		if not shoot and focus_enemy.criminal_record then
			expected_pos = focus_enemy.criminal_record.pos
		else
			expected_pos = focus_enemy.last_verified_pos or focus_enemy.verified_pos
		end
	end

	return aim, shoot, expected_pos
end

--chatter below
local math_random = math.random

Hooks:PostHook(CopLogicAttack, "_upd_combat_movement", "RR_upd_combat_movement", function(data)
	local chatter = data.char_tweak.chatter
	if data.internal_data.flank_cover and chatter and chatter.look_for_angle and not data.is_converted and not data.unit:sound():speaking(data.t) then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "look_for_angle") -- I'll try and flank 'em!
	end
end)

Hooks:PostHook(CopLogicAttack, "_chk_request_action_walk_to_cover_shoot_pos", "RR_chk_request_action_walk_to_cover_shoot_pos", function(data)
	local chatter = data.char_tweak.chatter
	if chatter and (chatter.push or chatter.go_go) and not data.is_converted and not data.unit:sound():speaking(data.t) and data.internal_data.advancing then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "push" or "go_go") -- Puuuush! / Go, Go!
	end
end)

Hooks:PreHook(CopLogicAttack, "action_complete_clbk", "RR_action_complete_clbk", function(data, action)
	local chatter = data.char_tweak.chatter
	if action:type() == "walk" and data.internal_data.moving_to_cover and action:expired() and chatter and (chatter.inpos or chatter.ready) and not data.is_converted and not data.unit:sound():speaking(TimerManager:game():time()) then -- can't use data.t as this might get called outside an update
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "ready" or "inpos") -- Ready! / I'm in position!
	end
end)

function CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data) -- doesn't really work as a posthook
	local focus_enemy = data.attention_obj

	if shoot then
		if not my_data.firing then
			data.unit:movement():set_allow_fire(true)

			my_data.firing = true

			local chatter = data.char_tweak.chatter
			if not data.unit:in_slot(16) and not data.is_converted and chatter and chatter.aggressive then
				if not data.unit:base():has_tag("special") then 
					if data.unit:base():has_tag("law") then
						if data.unit:base()._tweak_table == "gensec" or data.unit:base()._tweak_table == "security" or data.unit:base()._tweak_table == "city_swat_guard" then
							--HE'S GOT A GUN
							data.unit:sound():say("a01", true)
						else
							if managers.groupai:state():chk_assault_active_atm() and chatter.open_fire then
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "open_fire")
							else
								managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
							end
						end
					end
				elseif data.unit:base():has_tag("gangster") then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
				elseif not data.unit:base():has_tag("tank") and data.unit:base():has_tag("medic") then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
				elseif data.unit:base():has_tag("shield") and (not my_data.shield_knock_cooldown or my_data.shield_knock_cooldown < data.t) then
					if data.unit:base()._tweak_table == "phalanx_minion" or data.unit:base()._tweak_table == "phalanx_minion_assault" or data.unit:base()._tweak_table == "marshal_shield" then
						data.unit:sound():play("hos_shield_indication_sound_terminator_style", nil, true) --that's a big ass name
					else
						data.unit:sound():play("shield_identification", nil, true)
					end

					my_data.shield_knock_cooldown = data.t + math_random(12, 24)
				elseif data.unit:base()._tweak_table == "spring" or data.unit:base()._tweak_table == "phalanx_vip" or data.unit:base()._tweak_table == "phalanx_vip_break" then
					data.unit:sound():say("a05", true)
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

-- The big stuff, cops will comment on player equipment

CopLogicAttack._cop_comment_cooldown_t = {}

Hooks:PostHook(CopLogicAttack, "update", "RR_update", function(data)
	CopLogicAttack:inform_law_enforcements(data)	
end)

function CopLogicAttack:start_inform_ene_cooldown(cooldown_t, msg_type)
	local t = TimerManager:game():time()
	self._cop_comment_cooldown_t[msg_type] = self._cop_comment_cooldown_t[msg_type] or {}
	self._cop_comment_cooldown_t[msg_type]._cooldown_t = cooldown_t + t
	self._cooldown_delay_t = t + 5
end

function CopLogicAttack:ene_inform_has_cooldown_met(msg_type)
	local t = TimerManager:game():time()

	if not self._cop_comment_cooldown_t[msg_type] then
		return true
	end

	if self._cooldown_delay_t and self._cooldown_delay_t > t then
		return false
	end

	if self._cop_comment_cooldown_t[msg_type]._cooldown_t < t then
		return true
	end

	return false
end


function CopLogicAttack:_has_deployable_type(unit, deployable)
	local peer_id = managers.criminals:character_peer_id_by_unit(unit)
	if not peer_id then
		return false
	end

	local synced_deployable_equipment = managers.player:get_synced_deployable_equipment(peer_id)

	if synced_deployable_equipment then
		if not synced_deployable_equipment.deployable or synced_deployable_equipment.deployable ~= deployable then
			return false
		end

		--[[if synced_deployable_equipment.amount and synced_deployable_equipment.amount <= 0 then
			return false
		end--]]

		return true
	end

	return false
end

function CopLogicAttack:_next_to_cops(data, amount)
	local close_peers = {}
	local range = 5000
	amount = amount or 4
	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
		if data.key ~= u_key then
			if u_data.unit and alive(u_data.unit) and not u_data.unit:character_damage():dead() then
				local anim_data = u_data.unit:anim_data()
				if not anim_data.surrender and not anim_data.hands_tied and not anim_data.hands_back then
					if mvector3.distance_sq(data.m_pos, u_data.m_pos) < range * range then
						table.insert(close_peers, u_data.unit)
					end
				end
			end
		end
	end
	return #close_peers >= amount
end

function CopLogicAttack:inform_law_enforcements(data)
	if managers.groupai:state()._special_unit_types[data.unit:base()._tweak_table] then
		return
	end
	
	if data.unit:in_slot(16) or not data.char_tweak.chatter then
		return
	end

	local enemy_target = data.attention_obj
	if not enemy_target or not enemy_target.verified or enemy_target.dis > 100000 or not data.unit or self:_next_to_cops(data) then
		return
	end

	local sound_name, cooldown_t, msg_type

	if enemy_target.is_deployable then
		msg_type = "sentry_detected"
		sound_name = "ch2" -- Every voiceset except l5n (unused)
		cooldown_t = 30
	elseif enemy_target.unit:in_slot(managers.slot:get_mask("all_criminals")) then
		local weapon = enemy_target.unit.inventory and enemy_target.unit:inventory():equipped_unit()
		if weapon and weapon:base():is_category("saw") then
			msg_type = "saw_maniac"
			sound_name = "ch4" -- Every voiceset except l5n (unused)
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "doctor_bag") then
			msg_type = "doc_bag"
			sound_name = "med" -- Why do only l2n, l3n and l4n have this line :/
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "first_aid_kit") then
			msg_type = "first_aid_kit"
			sound_name = "med" -- Why do only l2n, l3n and l4n have this line :/
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "ammo_bag") then
			msg_type = "ammo_bag"
			sound_name = "amm" -- All lxn voicesets 
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "trip_mine") then
			msg_type = "trip_mine"
			sound_name = "ch1" -- Every voiceset except l5n (unused)
			cooldown_t = 30
		end
	end

	if msg_type and self:ene_inform_has_cooldown_met(msg_type) then
		data.unit:sound():say(sound_name, true)
		self:start_inform_ene_cooldown(cooldown_t, msg_type)
	end
end

-- Pathing related fixes to stop spamming walk actions when the new position is the same as the current position
local _find_retreat_position_original = CopLogicAttack._find_retreat_position
function CopLogicAttack._find_retreat_position(from_pos, ...)
	local to_pos = _find_retreat_position_original(from_pos, ...)
	if to_pos and (from_pos.x ~= to_pos.x or from_pos.y ~= to_pos.y) then
		return to_pos
	end
end

function CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	local from_pos = data.m_pos
	local reservation = {
		radius = 30,
		position =  from_pos,
		filter = data.pos_rsrv_id
	}
	if managers.navigation:is_pos_free(reservation) then
		return
	end

	local to_pos = CopLogicTravel._get_pos_on_wall(from_pos, 500)
	if from_pos.x == to_pos.x and from_pos.y == to_pos.y then
		return
	end

	local path = {
		mvector3.copy(from_pos),
		to_pos
	}
	CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, "run")
end

-- Empty this function (path starting position is corrected in CopActionWalk as it covers all cases)
function CopLogicAttack._correct_path_start_pos() end

-- Simplify function, navigation raycast is already done in CopLogicAttack._find_retreat_position
function CopLogicAttack._confirm_retreat_position(retreat_pos, threat_pos, threat_head_pos, threat_tracker)
	mvector3.set(tmp_vec1, retreat_pos)
	mvector3.set_z(tmp_vec1, retreat_pos.z + 140)
	if not World:raycast("ray", tmp_vec1, threat_head_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision") then
		return retreat_pos
	end
end

-- Make moving back during combat depend on weapon range
function CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, engage, range)
	if not focus_enemy or not focus_enemy.nav_tracker or not focus_enemy.verified then
		return
	end

	local close_range = (my_data.weapon_range and (my_data.weapon_range[range] or my_data.weapon_range.close) or 800) * 0.5
	if focus_enemy.dis > close_range or not CopLogicAttack._can_move(data) then
		return
	end

	local from_pos = mvector3.copy(data.m_pos)
	local threat_tracker = focus_enemy.nav_tracker
	local threat_head_pos = focus_enemy.m_head_pos
	local retreat_to = CopLogicAttack._find_retreat_position(from_pos, focus_enemy.m_pos, threat_head_pos, threat_tracker, close_range, engage)
	if not retreat_to then
		return
	end

	CopLogicAttack._cancel_cover_pathing(data, my_data)

	my_data.advancing = data.brain:action_request({
		type = "walk",
		variant = "walk",
		body_part = 2,
		nav_path = {
			from_pos,
			retreat_to
		}
	})

	if my_data.advancing then
		my_data.surprised = true
		return true
	end
end

-- Improve cover update
function CopLogicAttack._update_cover(data)
	local my_data = data.internal_data
	local best_cover = my_data.best_cover
	local focus_enemy = data.attention_obj
	local objective = data.objective

	if not focus_enemy or not focus_enemy.nav_tracker or focus_enemy.reaction < AIAttentionObject.REACT_COMBAT or objective and objective.shield_cover_unit then
		if best_cover and mvector3.distance_sq(best_cover[1][1], data.m_pos) > 100 ^ 2 then
			CopLogicAttack._set_best_cover(data, my_data, nil)
		end
		return
	end

	local taking_cover = my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data.surprised
	local processing_cover = my_data.processing_cover_path or my_data.charge_path_search_id

	if not taking_cover and not processing_cover then
		local threat_pos = focus_enemy.nav_tracker:field_position()
		local better_cover, best_cover_invalid

		if objective and objective.type == "follow" then
			local near_pos = objective.follow_unit:movement():m_pos()

			if not best_cover or not CopLogicAttack._verify_follow_cover(best_cover[1], near_pos, threat_pos, 200, 1000) then
				local nav_seg = objective.follow_unit:movement():nav_tracker():nav_segment()
				local max_dis = objective.distance and objective.distance * 0.9
				local found_cover = managers.navigation:find_cover_in_nav_seg_3(nav_seg, max_dis, near_pos, threat_pos)

				if found_cover then
					better_cover = {
						found_cover
					}
				end
			end
		else
			local flank_cover = my_data.flank_cover and not my_data.flank_cover.failed and my_data.flank_cover
			local min_dis = my_data.want_to_take_cover and my_data.weapon_range.close * 0.5 or nil

			if flank_cover or not best_cover or not CopLogicAttack._verify_cover(best_cover[1], threat_pos, min_dis, nil) then
				local dir, near_pos, furthest_pos = tmp_vec1, tmp_vec2, tmp_vec3
				local optimal_dis = mvector3.direction(dir, threat_pos, data.m_pos)
				local max_dis = my_data.weapon_range.far

				if flank_cover then
					mvector3.rotate_with(dir, Rotation(flank_cover.angle))
				end

				if min_dis and optimal_dis < min_dis or optimal_dis > my_data.weapon_range.optimal * 1.2 then
					optimal_dis = my_data.weapon_range.optimal
				end

				mvector3.set(near_pos, threat_pos)
				mvector3.add_scaled(near_pos, dir, optimal_dis)

				mvector3.set(furthest_pos, threat_pos)
				mvector3.add_scaled(furthest_pos, dir, max_dis)

				local found_cover
				if objective and objective.grp_objective and objective.grp_objective.type == "reenforce_area" then
					local nav_seg = objective.area and objective.area.nav_segs or objective.nav_seg
					found_cover = managers.navigation:find_cover_from_threat(nav_seg, optimal_dis, near_pos, threat_pos)
				else
					local angle = flank_cover and flank_cover.step or math.map_range(optimal_dis, 0, max_dis, 90, 60)
					found_cover = managers.navigation:find_cover_in_cone_from_threat_pos_1(threat_pos, furthest_pos, near_pos, nil, angle, nil, nil, nil, data.pos_rsrv_id)
				end

				if found_cover and CopLogicAttack._verify_cover(found_cover, threat_pos, min_dis, max_dis) then
					better_cover = {
						found_cover
					}
				elseif flank_cover then
					if math.sign(flank_cover.angle) == flank_cover.sign then
						flank_cover.angle = -flank_cover.angle
					else
						flank_cover.angle = flank_cover.angle + flank_cover.step * flank_cover.sign
						if math.abs(flank_cover.angle) > 90 then
							flank_cover.failed = true
						end
					end
				elseif best_cover then
					best_cover_invalid = true
				end
			end
		end

		if better_cover then
			CopLogicAttack._set_best_cover(data, my_data, better_cover)

			local offset_pos, yaw = CopLogicAttack._get_cover_offset_pos(data, better_cover, threat_pos)
			if offset_pos then
				better_cover[5] = offset_pos
				better_cover[6] = yaw
			end
		elseif best_cover_invalid then
			CopLogicAttack._set_best_cover(data, my_data, nil)
		end
	end

	if my_data.in_cover then
		my_data.in_cover[3], my_data.in_cover[4] = CopLogicAttack._chk_covered(data, data.m_pos, focus_enemy.verified_pos, data.visibility_slotmask)
	end
end

-- Improve check for cover requirement
function CopLogicAttack._chk_wants_to_take_cover(data, my_data)
	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_COMBAT then
		return
	end

	if my_data.moving_to_cover or data.is_suppressed or my_data.attitude ~= "engage" then
		return true
	end

	if data.attention_obj.verified and data.attention_obj.dis < my_data.weapon_range.close * 0.5 then
		return true
	end

	if data.unit:inventory():equipped_unit():base():get_ammo_ratio() < 0.3 then
		return true
	end
end

-- Improve Marshal combat movement, they really just need to try to keep their distance
function MarshalLogicAttack._upd_combat_movement(data)
	local my_data = data.internal_data
	local focus_enemy = data.attention_obj

	if data.logic.action_taken(data, my_data) or CopLogicAttack._upd_pose(data, my_data) then
		return
	end

	if data.unit:movement():chk_action_forbidden("walk") or not CopLogicAttack._can_move(data) then
		return
	end

	if focus_enemy.verified then
		if CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, true, "optimal") then
			return
		end

		if data.important then
			if data.is_suppressed and data.t - data.unit:character_damage():last_suppression_t() < 0.7 then
				if CopLogicBase.chk_start_action_dodge(data, "scared") then
					return
				end
			end

			if focus_enemy.is_person and focus_enemy.dis < 2000 and (data.group and data.group.size > 1 or math.random() < 0.5) then
				local dodge

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

				if dodge and focus_enemy.aimed_at and CopLogicBase.chk_start_action_dodge(data, "preemptive") then
					return
				end
			end
		end
	end

	CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
end

function MarshalLogicAttack.update_cover(data) end