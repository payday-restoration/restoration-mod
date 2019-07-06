if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function CopLogicTravel.action_complete_clbk(data, action)
		local my_data = data.internal_data
		local action_type = action:type()
        
		if data.tactics and data.tactics.hitnrun or data.tactics and data.tactics.elite_ranged_fire or data.tactics and data.tactics.spoocavoidance then
	            --cover point changes are a little fucky wucky with these tactics
				--pls keep these tactics to flank groups 
	        if action_type == "walk" then
	        	if action:expired() and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
	        		my_data.coarse_path_index = my_data.coarse_path_index + 1
            
	        		if my_data.coarse_path_index > #my_data.coarse_path then
	        			debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] invalid coarse path index increment", data.unit, inspect(my_data.coarse_path), my_data.coarse_path_index)
            
	        			my_data.coarse_path_index = my_data.coarse_path_index - 1
	        		end
	        	end
            
	        	my_data.advancing = nil
            
	        	if my_data.moving_to_cover then
	        		if action:expired() then
	        			if my_data.best_cover then
	        				managers.navigation:release_cover(my_data.best_cover[1])
	        			end
            
	        			my_data.best_cover = my_data.moving_to_cover
            
	        			CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)
            
	        			local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
	        			my_data.best_cover[4] = high_ray
	        			my_data.in_cover = true
	        			local cover_wait_time = my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.3 or 0.6 + 0.4 * math.random()
            
	        			if not CopLogicTravel._chk_close_to_criminal(data, my_data) then
	        				cover_wait_time = 0
	        			end
            
	        			my_data.cover_leave_t = data.t + cover_wait_time
	        		else
	        			managers.navigation:release_cover(my_data.moving_to_cover[1])
            
	        			if my_data.best_cover then
	        				local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())
            
	        				if dis > 100 then
	        					managers.navigation:release_cover(my_data.best_cover[1])
            
	        					my_data.best_cover = nil
	        				end
	        			end
	        		end
            
	        		my_data.moving_to_cover = nil
	        	elseif my_data.best_cover then
	        		local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())
            
	        		if dis > 100 then
	        			managers.navigation:release_cover(my_data.best_cover[1])
            
	        			my_data.best_cover = nil
	        		end
	        	end
            
	        	if not action:expired() then
	        		if my_data.processing_advance_path then
	        			local pathing_results = data.pathing_results
            
	        			if pathing_results and pathing_results[my_data.advance_path_search_id] then
	        				data.pathing_results[my_data.advance_path_search_id] = nil
	        				my_data.processing_advance_path = nil
	        			end
	        		elseif my_data.advance_path then
	        			my_data.advance_path = nil
	        		end
            
	        		data.unit:brain():abort_detailed_pathing(my_data.advance_path_search_id)
	        	end
	        elseif action_type == "turn" then
	        	data.internal_data.turning = nil
	        elseif action_type == "shoot" then
	        	data.internal_data.shooting = nil
	        elseif action_type == "dodge" then
	        	local objective = data.objective
	        	local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, nil)
            
	        	if allow_trans then
	        		local wanted_state = data.logic._get_logic_state_from_reaction(data)
            
	        		if wanted_state and wanted_state ~= data.name and obj_failed then
	        			if data.unit:in_slot(managers.slot:get_mask("enemies")) or data.unit:in_slot(17) then
	        				data.objective_failed_clbk(data.unit, data.objective)
	        			elseif data.unit:in_slot(managers.slot:get_mask("criminals")) then
	        				managers.groupai:state():on_criminal_objective_failed(data.unit, data.objective, false)
	        			end
            
	        			if my_data == data.internal_data then
	        				debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] exiting without discarding objective", data.unit, inspect(data.objective))
	        				CopLogicBase._exit(data.unit, wanted_state)
	        			end
	        		end
	        	end
	        end 
	        
			else				
		    
			if action_type == "walk" then
		    	if action:expired() and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
		    		my_data.coarse_path_index = my_data.coarse_path_index + 1
            
		    		if #my_data.coarse_path < my_data.coarse_path_index then
		    			debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] invalid coarse path index increment", data.unit, inspect(my_data.coarse_path), my_data.coarse_path_index)
            
		    			my_data.coarse_path_index = my_data.coarse_path_index - 1
		    		end
		    	end
            
		    	my_data.advancing = nil
            
		    	if my_data.moving_to_cover then
		    		if action:expired() then
		    			if my_data.best_cover then
		    				managers.navigation:release_cover(my_data.best_cover[1])
		    			end
            
		    			my_data.best_cover = my_data.moving_to_cover
            
		    			CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)
            
		    			local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
		    			my_data.best_cover[4] = high_ray
		    			my_data.in_cover = true
		    			local cover_wait_time = my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.3 or 0.6 + 0.4 * math.random()
            
		    			my_data.cover_leave_t = data.t + cover_wait_time
		    		else
		    			managers.navigation:release_cover(my_data.moving_to_cover[1])
            
		    			if my_data.best_cover then
		    				local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())
            
		    				if dis > 100 then
		    					managers.navigation:release_cover(my_data.best_cover[1])
            
		    					my_data.best_cover = nil
		    				end
		    			end
		    		end
            
		    		my_data.moving_to_cover = nil
		    	elseif my_data.best_cover then
		    		local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())
            
		    		if dis > 100 then
		    			managers.navigation:release_cover(my_data.best_cover[1])
            
		    			my_data.best_cover = nil
		    		end
		    	end
            
		    	if not action:expired() then
		    		if my_data.processing_advance_path then
		    			local pathing_results = data.pathing_results
            
		    			if pathing_results and pathing_results[my_data.advance_path_search_id] then
		    				data.pathing_results[my_data.advance_path_search_id] = nil
		    				my_data.processing_advance_path = nil
		    			end
		    		elseif my_data.advance_path then
		    			my_data.advance_path = nil
		    		end
            
		    		data.unit:brain():abort_detailed_pathing(my_data.advance_path_search_id)
		    	end
		    elseif action_type == "turn" then
		    	data.internal_data.turning = nil
		    elseif action_type == "shoot" then
		    	data.internal_data.shooting = nil
		    elseif action_type == "dodge" then
		    	local objective = data.objective
		    	local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, nil)
            
		    	if allow_trans then
		    		local wanted_state = data.logic._get_logic_state_from_reaction(data)
            
		    		if wanted_state and wanted_state ~= data.name and obj_failed then
		    			if data.unit:in_slot(managers.slot:get_mask("enemies")) or data.unit:in_slot(17) then
		    				data.objective_failed_clbk(data.unit, data.objective)
		    			elseif data.unit:in_slot(managers.slot:get_mask("criminals")) then
		    				managers.groupai:state():on_criminal_objective_failed(data.unit, data.objective, false)
		    			end
            
		    			if my_data == data.internal_data then
		    				debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] exiting without discarding objective", data.unit, inspect(data.objective))
		    				CopLogicBase._exit(data.unit, wanted_state)
		    			end
		    		end
		    	end
		    end
		end
	end

    function CopLogicTravel.queued_update(data)
    	local my_data = data.internal_data
    	data.t = TimerManager:game():time()
    	my_data.close_to_criminal = nil
    	local delay = CopLogicTravel._upd_enemy_detection(data)
    
    	if data.internal_data ~= my_data then
    		return
    	end
    
    	CopLogicTravel.upd_advance(data)
    
    	if data.internal_data ~= my_data then
    		return
    	end
    
    	if not delay then
    		debug_pause_unit(data.unit, "crap!!!", inspect(data))	
    
    		delay = 1
    	end
    	
        if my_data.coarse_path then
          	if data.char_tweak.chatter.clear and data.char_tweak.chatter.retreat and data.unit:anim_data().idle and not ( data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT and data.attention_obj.verified_t and data.attention_obj.verified_t < 5 ) then
       			if data.unit:movement():cool() then
       				managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper" )
       			else
       				local clearchk = math.random(1, 100)
       				local say_clear = 50
       				if clearchk <= say_clear then
       					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
       				else
       					if not managers.groupai:state():chk_assault_active_atm() then
       						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "retreat" )
       					end
       				end
       			end
       		end
        end	

		if data.char_tweak.leader then
			managers.groupai:state():find_followers_to_unit(data.key, data.char_tweak.leader)
			if managers.groupai:state():are_followers_ready(data.key) then
			else
				start_pathing = nil
			end
		end	
    	  
    	CopLogicTravel.queue_update(data, data.internal_data, delay)
    end	
	
	function CopLogicTravel._find_cover(data, search_nav_seg, near_pos)
		local cover = nil
		local search_area = managers.groupai:state():get_area_from_nav_seg_id(search_nav_seg)

		if data.unit:movement():cool() then
			cover = managers.navigation:find_cover_in_nav_seg_1(search_area.nav_segs)
		else
			local optimal_threat_dis, threat_pos = nil
			
			if data.tactics and data.tactics.aggressor and data.objective.attitude == "engage" then --Aggressor, ridiculously aggressive enemy movement
				optimal_threat_dis = 300
			elseif data.objective.attitude == "engage" then
				optimal_threat_dis = data.internal_data.weapon_range.optimal
			else
				optimal_threat_dis = data.internal_data.weapon_range.far
			end

			near_pos = near_pos or search_area.pos
			local all_criminals = managers.groupai:state():all_char_criminals()
			local closest_crim_u_data, closest_crim_dis = nil

			for u_key, u_data in pairs(all_criminals) do
				local crim_area = managers.groupai:state():get_area_from_nav_seg_id(u_data.tracker:nav_segment())

				if crim_area == search_area then
					threat_pos = u_data.m_pos

					break
				else
					local crim_dis = mvector3.distance_sq(near_pos, u_data.m_pos)

					if not closest_crim_dis or crim_dis < closest_crim_dis then
						threat_pos = u_data.m_pos
						closest_crim_dis = crim_dis
					end
				end
			end

			cover = managers.navigation:find_cover_from_threat(search_area.nav_segs, optimal_threat_dis, near_pos, threat_pos)
		end

		return cover
	end
end

