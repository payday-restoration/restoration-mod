if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function CopLogicTravel.action_complete_clbk(data, action)
		local my_data = data.internal_data
		local action_type = action:type()
        
		if data.tactics and data.tactics.hitnrun or data.tactics and data.tactics.elite_ranged_fire or data.tactics and data.tactics.spoocavoidance or data.tactics and data.tactics.reloadingretreat then
	            --cover point changes are a little fucky wucky with these tactics
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
						local nr_players = 0

						for u_key, u_data in pairs(managers.groupai:state():all_player_criminals()) do
							if not u_data.status then
								nr_players = nr_players + 1
							end
						end
						
						local cover_wait_time = nil
						
						if nr_players > 2 then
							cover_wait_time = my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.15 or 0.3 + 0.2 * math.random()
						elseif nr_players > 5 then
							cover_wait_time = 0
						else
							cover_wait_time = my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.3 or 0.6 + 0.4 * math.random()
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
          	if data.char_tweak.chatter.clear and data.unit:anim_data().idle and not ( data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT and data.attention_obj.verified_t and data.attention_obj.verified_t < 5 ) then
       			if data.unit:movement():cool() then
		            local roll = math.rand(1, 100)
			        local chance_report = 50
			         	if roll <= chance_report then
       				        managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper" )
						else	
       				        managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper_2" )
					    end	
       			else
       				local clearchk = math.random(1, 100)
       				local say_clear = 50
       				if clearchk <= say_clear then
       					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
       				else
       					if not managers.groupai:state():chk_assault_active_atm() and managers.groupai:state():not_assault_0_check() then
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
	
	function CopLogicTravel._upd_enemy_detection(data)
		managers.groupai:state():on_unit_detection_updated(data.unit)

		local my_data = data.internal_data
		local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
		local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, nil)
		local old_att_obj = data.attention_obj
		
		if (not my_data._intimidate_t or my_data._intimidate_t + 2 < data.t) and not data.cool and not my_data._turning_to_intimidate and not my_data.acting and (not new_attention or AIAttentionObject.REACT_SCARED > new_reaction) and managers.groupai:state():chk_assault_active_atm() then
			local can_turn = not data.unit:movement():chk_action_forbidden("turn")
			local civ = CopLogicIdle.find_civilian_to_intimidate(data)

			if civ then
				my_data._intimidate_t = data.t
				new_attention, new_prio_slot, new_reaction = nil

				if can_turn and CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, civ:movement():m_pos()) then
					my_data._turning_to_intimidate = true
					my_data._primary_intimidation_target = civ
				else
					CopLogicIdle.intimidate_civilians(data)
				end
			end
		end

		CopLogicBase._set_attention_obj(data, new_attention, new_reaction)

		local objective = data.objective
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, new_attention)

		if allow_trans and (obj_failed or not objective or objective.type ~= "follow") then
			local wanted_state = CopLogicBase._get_logic_state_from_reaction(data)

			if wanted_state and wanted_state ~= data.name then
				if obj_failed then
					data.objective_failed_clbk(data.unit, data.objective)
				end

				if my_data == data.internal_data and not objective.is_default then
					debug_pause_unit(data.unit, "[CopLogicTravel._upd_enemy_detection] exiting without discarding objective", data.unit, inspect(objective))
					CopLogicBase._exit(data.unit, wanted_state)
				end

				CopLogicBase._report_detections(data.detected_attention_objects)

				return delay
			end
		end

		if my_data == data.internal_data then
			if data.cool and new_reaction == AIAttentionObject.REACT_SUSPICIOUS and CopLogicBase._upd_suspicion(data, my_data, new_attention) then
				CopLogicBase._report_detections(data.detected_attention_objects)

				return delay
			elseif new_reaction and new_reaction <= AIAttentionObject.REACT_SCARED then
				local set_attention = data.unit:movement():attention()

				if not set_attention or set_attention.u_key ~= new_attention.u_key then
					CopLogicBase._set_attention(data, new_attention, nil)
				end
			end

			CopLogicAttack._upd_aim(data, my_data)
		end

		CopLogicBase._report_detections(data.detected_attention_objects)

		if new_attention and data.char_tweak.chatter.entrance and not data.entrance and new_attention.criminal_record and new_attention.verified and AIAttentionObject.REACT_SCARED <= new_reaction and math.abs(data.m_pos.z - new_attention.m_pos.z) < 4000 then
			data.unit:sound():say(data.brain.entrance_chatter_cue or "entrance", true, nil)

			data.entrance = true
		end

		if data.cool then
			CopLogicTravel.upd_suspicion_decay(data)
		end

		return delay
	end
	
	function CopLogicTravel._try_anounce(data, my_data)
	    local my_pos = data.m_pos
	    local max_dis_sq = 500000
	    local my_key = data.key
	    local announce_type = data.char_tweak.announce_incomming
	    
	    for u_key, u_data in pairs(managers.enemy:all_enemies()) do
	    	if u_key ~= my_key and tweak_data.character[u_data.unit:base()._tweak_table].chatter[announce_type] and mvector3.distance_sq(my_pos, u_data.m_pos) < max_dis_sq and not u_data.unit:sound():speaking(data.t) and (u_data.unit:anim_data().idle or u_data.unit:anim_data().move) then
	    		managers.groupai:state():chk_say_enemy_chatter(u_data.unit, u_data.m_pos, announce_type)
        		--log("announced arrival")
	    
	    		my_data.announce_t = data.t + 15
	    
	    		break
	    	end
	    end
    end
	
end
