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
	
	--hyper heisting hit and run port love you fuglore <3333
	function CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, engage)
    	if focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and focus_enemy.dis < 250 and CopLogicAttack._can_move(data) or data.tactics and focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and focus_enemy.dis <= 1500 and CopLogicAttack._can_move(data) or data.tactics and data.tactics.hitnrun and focus_enemy and focus_enemy.verified and focus_enemy.dis <= 1000 and focus_enemy and focus_enemy.verified then
    		
    		local from_pos = mvector3.copy(data.m_pos)
    		local threat_tracker = focus_enemy.nav_tracker
    		local threat_head_pos = focus_enemy.m_head_pos
    		local max_walk_dis = nil
    		local vis_required = engage
    			
    		if data.tactics and data.tactics.hitnrun then
    			max_walk_dis = 800
    		else
    			max_walk_dis = 400
    		end
    		
    		local retreat_to = CopLogicAttack._find_retreat_position(from_pos, focus_enemy.m_pos, threat_head_pos, threat_tracker, max_walk_dis, vis_required)
    
    		if retreat_to then
    			CopLogicAttack._cancel_cover_pathing(data, my_data)
    			
    			--if data.tactics and data.tactics.hitnrun then
    			    --log("hitnrun or eliteranged just backed up properly")
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
	
    function CopLogicAttack._upd_combat_movement(data)
    	local my_data = data.internal_data
    	local t = data.t
    	local unit = data.unit
    	local focus_enemy = data.attention_obj
    	local in_cover = my_data.in_cover
    	local best_cover = my_data.best_cover
    	local enemy_visible = focus_enemy.verified
    	local enemy_visible_soft = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
    	local enemy_visible_softer = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
    	local alert_soft = data.is_suppressed
    	local action_taken = data.logic.action_taken(data, my_data)
    	local want_to_take_cover = my_data.want_to_take_cover
    	action_taken = action_taken or CopLogicAttack._upd_pose(data, my_data)
    	local move_to_cover, want_flank_cover = nil
    	
    	--hitnrun: approach enemies, back away once the enemy is visible, creating a variating degree of aggressiveness
    	local hitnrunmovementqualify = data.tactics and data.tactics.hitnrun and focus_enemy and focus_enemy.verified and focus_enemy.verified_dis <= 1000 and math.abs(data.m_pos.z - data.attention_obj.m_pos.z) < 200
    	
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
    	elseif not enemy_visible_soft then
    		if data.tactics and data.tactics.charge and data.objective and data.objective.grp_objective and data.objective.grp_objective.charge and (not my_data.charge_path_failed_t or data.t - my_data.charge_path_failed_t > 6) then
    			if my_data.charge_path then
    				local path = my_data.charge_path
    				my_data.charge_path = nil
    				action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path)
    			elseif not my_data.charge_path_search_id and data.attention_obj.nav_tracker then
    				my_data.charge_pos = CopLogicTravel._get_pos_on_wall(data.attention_obj.nav_tracker:field_position(), my_data.weapon_range.optimal, 45, nil)
    
    				if my_data.charge_pos then
    					my_data.charge_path_search_id = "charge" .. tostring(data.key)
    
    					unit:brain():search_for_path(my_data.charge_path_search_id, my_data.charge_pos, nil, nil, nil)
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
    					action_taken = CopLogicAttack._chk_request_action_walk_to_cover_shoot_pos(data, my_data, path, math.random() < 0.5 and "run" or "walk")
    				else
    					my_data.cover_test_step = my_data.cover_test_step + 1
    				end
    			elseif not enemy_visible_softer and math.random() < 0.05 then
    				move_to_cover = true
    				want_flank_cover = true
    			end
    		elseif my_data.walking_to_cover_shoot_pos then
    			-- Nothing
    		elseif my_data.at_cover_shoot_pos then
    			if my_data.stay_out_time < t then
    				move_to_cover = true
    			end
    		else
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
    		end
    	else
    		my_data.flank_cover = nil
    	end
    
    	if data.important and not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and CopLogicAttack._can_move(data) and data.attention_obj.verified and (not in_cover or not in_cover[4]) then
    		if data.is_suppressed and data.t - data.unit:character_damage():last_suppression_t() < 0.7 then
    			action_taken = CopLogicBase.chk_start_action_dodge(data, "scared")
    		end
    
    		if not action_taken and focus_enemy.is_person and focus_enemy.dis < 2000 and (data.group and data.group.size > 1 or math.random() < 0.5) then
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
    			end
    		end
    	end
    
    	if not action_taken and want_to_take_cover and not best_cover or hitnrunmovementqualify then
    		action_taken = CopLogicAttack._chk_start_action_move_back(data, my_data, focus_enemy, false)
    	end
    
    	action_taken = action_taken or CopLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
    end

end