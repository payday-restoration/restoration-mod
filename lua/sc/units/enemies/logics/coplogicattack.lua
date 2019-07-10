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

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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
    	local t = data.t
    	local unit = data.unit
    	local focus_enemy = data.attention_obj
    	local in_cover = my_data.in_cover
    	local best_cover = my_data.best_cover
    	local enemy_visible = focus_enemy.verified
    	local enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
    	local enemy_visible_mild_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 7
    	local flank_cover_charge_time = focus_enemy.verified_t and t - focus_enemy.verified_t < 4
    	local enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
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
    	action_taken = action_taken or CopLogicAttack._upd_pose(data, my_data)
    	local move_to_cover, want_flank_cover, taken_flank_cover = nil
    
    	if my_data.cover_test_step ~= 1 and not enemy_visible_softer and (action_taken or want_to_take_cover or not in_cover) then
    		my_data.cover_test_step = 1
    	end
    
    	if my_data.stay_out_time and (enemy_visible_soft or not my_data.at_cover_shoot_pos or action_taken or want_to_take_cover) then
    		my_data.stay_out_time = nil
    	elseif my_data.attitude == "engage" and not my_data.stay_out_time and not enemy_visible_soft and my_data.at_cover_shoot_pos and not action_taken and not want_to_take_cover then
    		my_data.stay_out_time = t + 7
    	end
    
    	if action_taken then
    		-- Nothing
    	elseif want_to_take_cover then
    		move_to_cover = true
    	elseif not enemy_visible_soft then --added some extra stuff here to make sure other enemy groups get in on the fight, also added a new system so that once flank cover is acquired for flanking teams, they'll charge, in order for flanking to actually happen instead of them just standing around in the flank cover 
    		if data.tactics and data.tactics.charge and data.objective and data.objective.grp_objective and data.objective.grp_objective.charge and (not my_data.charge_path_failed_t or data.t - my_data.charge_path_failed_t > 6) or not enemy_visible_mild_soft and data.objective and data.objective.grp_objective and data.objective.grp_objective.charge and (not my_data.charge_path_failed_t or data.t - my_data.charge_path_failed_t > 6) or data.tactics and data.tactics.flank and my_data.flank_cover and in_cover and focus_enemy and focus_enemy.dis <= 1500 and not want_to_take_cover and taken_flank_cover and not flank_cover_charge_time and (not my_data.charge_path_failed_t or data.t - my_data.charge_path_failed_t > 4) then
    			if my_data.charge_path then
    				local path = my_data.charge_path
    				my_data.charge_path = nil
    				action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path)
    			elseif not my_data.charge_path_search_id and data.attention_obj.nav_tracker then
    				my_data.charge_pos = CopLogicTravel._get_pos_on_wall(data.attention_obj.nav_tracker:field_position(), my_data.weapon_range.close, 45, nil)
    
    				if my_data.charge_pos then
    					my_data.charge_path_search_id = "charge" .. tostring(data.key)
    
    					unit:brain():search_for_path(my_data.charge_path_search_id, my_data.charge_pos, nil, nil, nil)
    					taken_flank_cover = nil
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
    	
    	--removed the need for being important
    	if not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and CopLogicAttack._can_move(data) and data.attention_obj.verified and (not in_cover or not in_cover[4]) and not spoocavoidancemovementqualify then
    		if data.is_suppressed and data.t - data.unit:character_damage():last_suppression_t() < 0.7 then
    			action_taken = CopLogicBase.chk_start_action_dodge(data, "scared")
    			--[[if data.char_tweak.chatter.dodge then
    				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "dodge")
    			end]]--
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
    				--[[if data.char_tweak.chatter.dodge then
    					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "dodge")
    				end]]--
    			end
    		end
    	end
    		
    	if not action_taken and want_to_take_cover and not best_cover or not action_taken and hitnrunmovementqualify and not pantsdownchk or not action_taken and eliterangedfiremovementqualify and not pantsdownchk or not action_taken and spoocavoidancemovementqualify and not pantsdownchk or not action_taken and reloadingretreatmovementqualify then
			action_taken = CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, false)
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
    
    	if action_type == "walk" then
    		my_data.advancing = nil
    
    		CopLogicAttack._cancel_cover_pathing(data, my_data)
    		CopLogicAttack._cancel_charge(data, my_data)
    
    		if my_data.surprised then
    			my_data.surprised = false
    		elseif my_data.moving_to_cover then
    			if action:expired() then
    				my_data.in_cover = my_data.moving_to_cover
    				my_data.cover_enter_t = data.t
    			end
    
    			my_data.moving_to_cover = nil
    		elseif my_data.walking_to_cover_shoot_pos then
    			my_data.walking_to_cover_shoot_pos = nil
    			my_data.at_cover_shoot_pos = true
    		end
    	elseif action_type == "shoot" then
    		my_data.shooting = nil
    	elseif action_type == "turn" then
    		my_data.turning = nil
    	elseif action_type == "hurt" then
    		CopLogicAttack._cancel_cover_pathing(data, my_data)
    		
    		--Removed the requirement for being important here.
    		if action:expired() and not CopLogicBase.chk_start_action_dodge(data, "hit") then
    			data.logic._upd_aim(data, my_data)
    		end
    	elseif action_type == "dodge" then
    		local timeout = action:timeout()
    
    		if timeout then
    			data.dodge_timeout_t = TimerManager:game():time() + math.lerp(timeout[1], timeout[2], math.random())
    		end
    
    		CopLogicAttack._cancel_cover_pathing(data, my_data)
    
    		if action:expired() then
    			CopLogicAttack._upd_aim(data, my_data)
    		end
    	end
    end
    
    function CopLogicAttack.queue_update(data, my_data)
    	local focus_enemy = data.attention_obj
    	local in_combat = focus_enemy and focus_enemy.verified and focus_enemy.dis <= 3000 or focus_enemy and focus_enemy.verified_t and focus_enemy.verified_t < 2
    	local delay = in_combat and 0 or 0.35
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
    	local my_pos = data.m_pos
    
    	if data.attention_obj and data.attention_obj.nav_tracker and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
    		local find_new = not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
    
    		if find_new then
    			local enemy_tracker = data.attention_obj.nav_tracker
    			local threat_pos = enemy_tracker:field_position()
    
    			if data.objective and data.objective.type == "follow" then
    				local near_pos = data.objective.follow_unit:movement():m_pos()
    
    				if (not best_cover or not CopLogicAttack._verify_follow_cover(best_cover[1], near_pos, threat_pos, 200, 1000)) and not my_data.processing_cover_path and not my_data.charge_path_search_id then
    					local follow_unit_area = managers.groupai:state():get_area_from_nav_seg_id(data.objective.follow_unit:movement():nav_tracker():nav_segment())
    					local found_cover = managers.navigation:find_cover_in_nav_seg_3(follow_unit_area.nav_segs, data.objective.distance and data.objective.distance * 0.9 or nil, near_pos, threat_pos)
    
    					if found_cover then
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
				elseif data.objective and data.objective.type == "follow" and data.tactics and data.tactics.shield_cover and not data.unit:base()._tweak_table == "shield" then
					local shield_pos = data.objective.follow_unit:movement():m_pos() --the pillar
					mvector3.direction(temp_vec4, my_pos, shield_pos)
					mvector3.direction(temp_vec5, my_pos, heister_pos)
					mvector3.direction(temp_vec6, temp_vec4, temp_vec5)
					local following_dis = temp_vec6 * 200
					local near_pos = data.objective.follow_unit:movement():m_pos() + following_dis
					
					--unit would take the heister's angle to both the pillar, and the unit, the unit would attempt to line up the pillar and the heister together, since they're following the pillar, they should frequently position themselves behind the pillar, which would keep them in cover, its hacky, but it would work
					
					if (not best_cover or not CopLogicAttack._verify_follow_cover(best_cover[1], near_pos, threat_pos, 60, 200)) and not my_data.processing_cover_path and not my_data.charge_path_search_id then
						local follow_unit_area = managers.groupai:state():get_area_from_nav_seg_id(data.objective.follow_unit:movement():nav_tracker():nav_segment())
						local found_cover = managers.navigation:find_cover_in_nav_seg_3(follow_unit_area.nav_segs, data.objective.distance and data.objective.distance * 0.9 or nil, near_pos, threat_pos)

						if found_cover then
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
    			else
    				local want_to_take_cover = my_data.want_to_take_cover
    				local flank_cover = my_data.flank_cover
    				local min_dis, max_dis = nil
    
    				if want_to_take_cover then
    					min_dis = math.max(data.attention_obj.dis * 0.9, data.attention_obj.dis - 200)
    				end
    
    				if not my_data.processing_cover_path and not my_data.charge_path_search_id and (not best_cover or flank_cover or not CopLogicAttack._verify_cover(best_cover[1], threat_pos, min_dis, max_dis)) then
    					satisfied = false
    					local my_vec = my_pos - threat_pos
    
    					if flank_cover then
    						mvector3.rotate_with(my_vec, Rotation(flank_cover.angle))
    					end
    
    					local optimal_dis = my_vec:length()
    					local max_dis = nil
    
    					if want_to_take_cover then
    						if optimal_dis < my_data.weapon_range.far then
    							optimal_dis = optimal_dis
    
    							mvector3.set_length(my_vec, optimal_dis)
    						end
    
    						max_dis = math.max(optimal_dis + 200, my_data.weapon_range.far)
    					elseif optimal_dis > my_data.weapon_range.optimal * 1.2 then
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
    
    					local found_cover = managers.navigation:find_cover_in_cone_from_threat_pos_1(threat_pos, furthest_side_pos, my_side_pos, nil, cone_angle, min_threat_dis, search_nav_seg, nil, data.pos_rsrv_id)
    
    					if found_cover and (not best_cover or CopLogicAttack._verify_cover(found_cover, threat_pos, min_dis, max_dis)) then
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

end
