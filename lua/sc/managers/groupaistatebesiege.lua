if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function GroupAIStateBesiege:init(group_ai_state)
		GroupAIStateBesiege.super.init(self)

		if Network:is_server() and managers.navigation:is_data_ready() then
			self:_queue_police_upd_task()
		end

		self._tweak_data = tweak_data.group_ai[group_ai_state]
		self._spawn_group_timers = {}
		self._graph_distance_cache = {}
		self._ponr_is_on = nil
	end	
    
	--[[function GroupAIStateBesiege:init(group_ai_state)
    	GroupAIStateBesiege.super.init(self)
    
    	if Network:is_server() and managers.navigation:is_data_ready() then
    		self:_queue_police_upd_task()
    	end
    
    	self._tweak_data = tweak_data.group_ai[group_ai_state]
    	self._spawn_group_timers = {}
    	self._graph_distance_cache = {}
		self._ponr_is_on = nil
		self:set_debug_draw_state(true)
    end]]--
	--uncomment to test ai debug stuff
	
	-- Tracks the cooldowns of each group type, will be populated by the GroupAIStateBesiege:_spawn_in_group() hook 
	local group_timestamps = {}

	-- Example contents with haphazardly chosen cooldowns, add more group types and adjust as desired
	local group_cooldowns = {
		Cap_Spring = 2700,
		Cap_Summers = 2700,
		Cap_Autumn = 900
	}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if difficulty_index == 4 then
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
		    Cap_Autumn = 900
		}
	elseif difficulty_index == 5 then
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
			Cap_Autumn = 900
		}
	elseif difficulty_index == 6 then
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
			Cap_Autumn = 900
		}
	elseif difficulty_index == 7 then
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
			Cap_Autumn = 900
		}
	elseif difficulty_index == 8 then
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
			Cap_Autumn = 900
		}
	else
		group_cooldowns = {
			Cap_Spring = 2700,
			Cap_Summers = 2700,
			Cap_Autumn = 900
		}
	end
	-- Ditto, adjust as desired. Affects all groups not listed in group_cooldowns above
	local default_cooldown = 0

	local _choose_best_groups_actual = GroupAIStateBesiege._choose_best_groups
	function GroupAIStateBesiege:_choose_best_groups(best_groups, group, group_types, allowed_groups, weight, ...)
		local new_allowed_groups = {}
		local currenttime = Application:time()
		-- Remember not to modify allowed_groups nor its subtables, otherwise you'll unknowingly be altering
		-- tweak_data.group_ai.besiege.recon.groups instead
		for group_type, cat_weights in pairs(allowed_groups) do
			local previoustimestamp = group_timestamps[group_type]
			local cooldown = group_cooldowns[group_type] or default_cooldown
				if previoustimestamp == nil or (currenttime - previoustimestamp) > cooldown then
				-- Cooldown has expired for this group type, copy the subtable reference to the new_allowed_groups table (the same
				-- rule applies - do not modify the subtable or you'll be affecting global state, which will make debugging the cause
				-- a nightmare)
				new_allowed_groups[group_type] = cat_weights
				end
			end

		-- Call the original function with the manipulated list
		return _choose_best_groups_actual(self, best_groups, group, group_types, new_allowed_groups, weight, ...)
	end
	
	function GroupAIStateBesiege:not_assault_0_check()
		if self._assault_number and self._assault_number <= 0 then
			return
		end
		
		return true
	end
	
    function GroupAIStateBesiege:_get_megaphone_sound_source()
    	local level_id = Global.level_data.level_id
    	local pos = nil
    
    	if not level_id then
    		pos = Vector3(0, 0, 0)
    
    		Application:error("[TradeManager:_get_megaphone_sound_source] This level has no megaphone position!")
    	elseif not tweak_data.levels[level_id].megaphone_pos then
    		pos = Vector3(0, 0, 0)
    	else
    		pos = tweak_data.levels[level_id].megaphone_pos
    	end
    
    	local sound_source = SoundDevice:create_source("megaphone")
    
    	sound_source:set_position(pos)
    
    	return sound_source
    end

	-- Simple wrapper function to identify the winning candidate group that was actually selected and spawned in, and when they were
	-- spawned in
	local _spawn_in_group_actual = GroupAIStateBesiege._spawn_in_group
	function GroupAIStateBesiege:_spawn_in_group(spawn_group, spawn_group_type, ...)
		group_timestamps[spawn_group_type] = Application:time()

		return _spawn_in_group_actual(self, spawn_group, spawn_group_type, ...)
	end

	local job = Global.level_data and Global.level_data.level_id
	function GroupAIStateBesiege:_check_spawn_phalanx()
		local found_shit = false
		for _,j in ipairs(restoration.captain_teamwork) do
			if job == j then
				found_shit = true
				break
			end
		end
		for _,j2 in ipairs(restoration.captain_murderdozer) do
			if job == j2 then
			found_shit = true
				break
			end
		end
		for _,j3 in ipairs(restoration.captain_stelf) do
			if job == j3 then
			found_shit = true
				break
			end
		end
		 for _,j4 in ipairs(restoration.disable_captain_camper) do
			if job == j4 then
			found_shit = true
				break
			end
		end
		if found_shit then
			return
		end
		if self._task_data and self._task_data.assault.active and self._phalanx_center_pos and not self._phalanx_spawn_group then
			if self._task_data.assault.phase == "build" or self._task_data.assault.phase == "sustain" then
			local now = TimerManager:game():time()
			local respawn_delay = tweak_data.group_ai.phalanx.spawn_chance.respawn_delay
			if not self._phalanx_despawn_time or now >= self._phalanx_despawn_time + respawn_delay then
				local spawn_chance_start = tweak_data.group_ai.phalanx.spawn_chance.start
				self._phalanx_current_spawn_chance = self._phalanx_current_spawn_chance or spawn_chance_start
				self._phalanx_last_spawn_check = self._phalanx_last_spawn_check or now
				self._phalanx_last_chance_increase = self._phalanx_last_chance_increase or now
				local spawn_chance_increase = tweak_data.group_ai.phalanx.spawn_chance.increase
				local spawn_chance_max = tweak_data.group_ai.phalanx.spawn_chance.max
				if spawn_chance_max > self._phalanx_current_spawn_chance and spawn_chance_increase > 0 then
					local chance_increase_intervall = tweak_data.group_ai.phalanx.chance_increase_intervall
					if now >= self._phalanx_last_chance_increase + chance_increase_intervall then
						self._phalanx_last_chance_increase = now
						self._phalanx_current_spawn_chance = math.min(spawn_chance_max, self._phalanx_current_spawn_chance + spawn_chance_increase)
						print("Phalanx spawn chance increased to ", self._phalanx_current_spawn_chance)
					end
				else
				end
				if self._phalanx_current_spawn_chance > 0 then
					local check_spawn_intervall = tweak_data.group_ai.phalanx.check_spawn_intervall
					if now >= self._phalanx_last_spawn_check + check_spawn_intervall then
						self._phalanx_last_spawn_check = now
						print("Spawn chance roll...")
						if math.random() <= self._phalanx_current_spawn_chance then
							self:_spawn_phalanx()
						else
							print("Spawn chance roll failed!")
						end
					end
				end
			end
		end
		else
		end
	end
	
	function GroupAIStateBesiege:chk_assault_active_atm()  
	   if not self._task_data.assault.active then
	     	return
	   	--log("not assault active")
	   end
	   
	   return true
    end
	
	function GroupAIStateBesiege:_voice_groupentry(group)
	local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
	if group_leader_u_data and group_leader_u_data.tactics and group_leader_u_data.char_tweak.chatter.entry then
		for i_tactic, tactic_name in ipairs(group_leader_u_data.tactics) do
			local randomgroupcallout = math.random(1, 100)
			--assign tactic-identifiers for this in groupaistatebesiege on a group-to-group basis
			--groupcs is for assault team, grouphrt is for rescue team,groupcsr/grouphrtr picks a random letter, groupany depends on whether assault is active and picks a random letter or not
			if tactic_name == "groupcs1" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
			elseif tactic_name == "groupcs2" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
			elseif tactic_name == "groupcs3" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
			elseif tactic_name == "groupcs4" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
			elseif tactic_name == "grouphrt1" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
			elseif tactic_name == "grouphrt2" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
			elseif tactic_name == "grouphrt3" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
			elseif tactic_name == "grouphrt4" then
				self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
			elseif tactic_name == "groupcsr" then
				if randomgroupcallout < 25 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
				elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
				elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
				else
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
				end
			elseif tactic_name == "grouphrtr" then
				if randomgroupcallout < 25 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
				elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
				elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
				else
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
				end
			elseif tactic_name == "groupany" then
				if self._task_data.assault.active then
					if randomgroupcallout < 25 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
					elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
					elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
					else
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
					end
				else
					if randomgroupcallout < 25 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
					elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
					elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
					else
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
					end
				end
			end
		end
	end

	function GroupAIStateBesiege:set_damage_reduction_buff_hud()
		--Were you expecting some cute girl? Nope, it's just me! Dev Comments!
	end

	function GroupAIStateBesiege:_chk_group_use_smoke_grenade(group, task_data, detonate_pos)
    	if task_data.use_smoke and not self:is_smoke_grenade_active() then
    		local shooter_pos, shooter_u_data = nil
    		local duration = tweak_data.group_ai.smoke_grenade_lifetime
    
    		for u_key, u_data in pairs(group.units) do
    			if u_data.tactics_map and u_data.tactics_map.smoke_grenade then
    				if not detonate_pos then
    					local nav_seg_id = u_data.tracker:nav_segment()
    					local nav_seg = managers.navigation._nav_segments[nav_seg_id]
    
    					for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
    						local area = self:get_area_from_nav_seg_id(neighbour_nav_seg_id)
    
    						if task_data.target_areas[1].nav_segs[neighbour_nav_seg_id] or next(area.criminal.units) then
    							local random_door_id = door_list[math.random(#door_list)]
    							detonate_pos = type(random_door_id) == "number" and managers.navigation._room_doors[random_door_id].center or random_door_id:script_data().element:nav_link_end_pos()
    							shooter_pos = mvector3.copy(u_data.m_pos)
    							shooter_u_data = u_data
    
    							break
    						end
    					end
    				end
    
    				if detonate_pos and shooter_u_data then
    					self:detonate_smoke_grenade(detonate_pos, shooter_pos, duration, false)
    
    					task_data.use_smoke_timer = self._t + math.lerp(tweak_data.group_ai.smoke_and_flash_grenade_timeout[1], tweak_data.group_ai.smoke_and_flash_grenade_timeout[2], math.rand(0, 1) ^ 0.5)
    					task_data.use_smoke = false
    
    					u_data.unit:sound():say("d01", true)
    					u_data.unit:movement():play_redirect("throw_grenade")
    
    					return true
    				end
    			end
    		end
    	end
    end
    
    function GroupAIStateBesiege:_chk_group_use_flash_grenade(group, task_data, detonate_pos)
    	if task_data.use_smoke and not self:is_smoke_grenade_active() then
    		local shooter_pos, shooter_u_data = nil
    		local duration = tweak_data.group_ai.flash_grenade_lifetime
    
    		for u_key, u_data in pairs(group.units) do
    			if u_data.tactics_map and u_data.tactics_map.flash_grenade then
    				if not detonate_pos then
    					local nav_seg_id = u_data.tracker:nav_segment()
    					local nav_seg = managers.navigation._nav_segments[nav_seg_id]
    
    					for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
    						if task_data.target_areas[1].nav_segs[neighbour_nav_seg_id] then
    							local random_door_id = door_list[math.random(#door_list)]
    							detonate_pos = type(random_door_id) == "number" and managers.navigation._room_doors[random_door_id].center or random_door_id:script_data().element:nav_link_end_pos()
    							shooter_pos = mvector3.copy(u_data.m_pos)
    							shooter_u_data = u_data
    
    							break
    						end
    					end
    				end
    
    				if detonate_pos and shooter_u_data then
    					self:detonate_smoke_grenade(detonate_pos, shooter_pos, duration, true)
    
    					task_data.use_smoke_timer = self._t + math.lerp(tweak_data.group_ai.smoke_and_flash_grenade_timeout[1], tweak_data.group_ai.smoke_and_flash_grenade_timeout[2], math.random() ^ 0.5)
    					task_data.use_smoke = false
    
    					u_data.unit:sound():say("d02", true)	
    					u_data.unit:movement():play_redirect("throw_grenade")					
    
    					return true
    				end
    			end
    		end
    	end
    end
	
	function GroupAIStateBesiege:_upd_assault_task()
		local task_data = self._task_data.assault
		if not task_data.active then
			return
		end
		local t = self._t
		self:_assign_recon_groups_to_retire()
		local force_pool = self:_get_difficulty_dependent_value(self._tweak_data.assault.force_pool) * self:_get_balancing_multiplier(self._tweak_data.assault.force_pool_balance_mul)
		local task_spawn_allowance = force_pool - (self._hunt_mode and 0 or task_data.force_spawned)
		if task_data.phase == "anticipation" then
			if task_spawn_allowance <= 0 then
				task_data.phase = "fade"
				task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
			elseif t > task_data.phase_end_t then
				self._assault_number = self._assault_number + 1
				 self:_get_megaphone_sound_source():post_event("mga_generic_c")
				managers.mission:call_global_event("start_assault")
				managers.hud:start_assault(self._assault_number)
				managers.groupai:dispatch_event("start_assault", self._assault_number)
				self:_set_rescue_state(false)
				task_data.phase = "build"
				task_data.phase_end_t = self._t + self._tweak_data.assault.build_duration
				task_data.is_hesitating = nil
				self:set_assault_mode(true)
				managers.trade:set_trade_countdown(false)
			else
				managers.hud:check_anticipation_voice(task_data.phase_end_t - t)
				managers.hud:check_start_anticipation_music(task_data.phase_end_t - t)
				if task_data.is_hesitating and self._t > task_data.voice_delay then
					if 0 < self._hostage_headcount then
						local best_group
						for _, group in pairs(self._groups) do
							if not best_group or group.objective.type == "reenforce_area" then
								best_group = group
							elseif best_group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
								best_group = group
							end
						end
						if best_group and self:_voice_delay_assault(best_group) then
							task_data.is_hesitating = nil
						end
					else
						local best_group
						for _, group in pairs(self._groups) do
							if not best_group or group.objective.type == "reenforce_area" then
								best_group = group
							elseif best_group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
								best_group = group
							end
						end
						if best_group then
							self:_voice_dont_delay_assault(best_group)
						end
						task_data.is_hesitating = nil
					end
				end
			end
		elseif task_data.phase == "build" then
			if task_spawn_allowance <= 0 then
				task_data.phase = "fade"
				task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
			elseif t > task_data.phase_end_t then
				local sustain_duration = math.lerp(self:_get_difficulty_dependent_value(self._tweak_data.assault.sustain_duration_min), self:_get_difficulty_dependent_value(self._tweak_data.assault.sustain_duration_max), math.random()) * self:_get_balancing_multiplier(self._tweak_data.assault.sustain_duration_balance_mul)
				managers.modifiers:run_func("OnEnterSustainPhase", sustain_duration)
				task_data.phase = "sustain"
				task_data.phase_end_t = t + sustain_duration
			end
		elseif task_data.phase == "sustain" then
			local end_t = self:assault_phase_end_time()
			task_spawn_allowance = managers.modifiers:modify_value("GroupAIStateBesiege:SustainSpawnAllowance", task_spawn_allowance, force_pool)
			if task_spawn_allowance <= 0 then
				task_data.phase = "fade"
				local time = self._t
				    self:_get_megaphone_sound_source():post_event("mga_generic_a")
				    for group_id, group in pairs(self._groups) do
	                      for u_key, u_data in pairs(group.units) do
				          local nav_seg_id = u_data.tracker:nav_segment()
						  local current_objective = group.objective
				              if current_objective.coarse_path then
			                      if not u_data.unit:sound():speaking(time) then
	                      		    u_data.unit:sound():say("r01", true)
						        end	
	                        end					   
				        end	
				    end		
				task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
			elseif t > end_t and not self._hunt_mode then
				task_data.phase = "fade"						
				local time = self._t
				    for group_id, group in pairs(self._groups) do
	                      for u_key, u_data in pairs(group.units) do
				          local nav_seg_id = u_data.tracker:nav_segment()
						  local current_objective = group.objective
				              if current_objective.coarse_path then
			                      if not u_data.unit:sound():speaking(time) then
	                      		    u_data.unit:sound():say("r01", true)
						        end	
	                        end					   
				        end	
				    end		
				task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
			end
		else
			local end_assault = false
			local enemies_left = self:_count_police_force("assault")
			if not self._hunt_mode then
			
				local enemies_defeated_time_limit = 30
				local drama_engagement_time_limit = 60

				if managers.skirmish:is_skirmish() then
					enemies_defeated_time_limit = 0
					drama_engagement_time_limit = 0
				end			
			
				local min_enemies_left = 7
				local enemies_defeated = enemies_left < min_enemies_left
				local taking_too_long = task_data.phase_end_t + enemies_defeated_time_limit < t

				if enemies_defeated or taking_too_long then
					if not task_data.said_retreat then
						task_data.said_retreat = true

						self:_police_announce_retreat()
				        self:_get_megaphone_sound_source():post_event("mga_robbers_clever")
				        local time = self._t
				            for group_id, group in pairs(self._groups) do
	                              for u_key, u_data in pairs(group.units) do
				                  local nav_seg_id = u_data.tracker:nav_segment()
				        		  local current_objective = group.objective
				                    if current_objective.coarse_path then
			                              if not u_data.unit:sound():speaking(time) then
	                              		    u_data.unit:sound():say("m01", true)
				        		        end	
	                                end					   
				                end	
				            end					
				        	elseif task_data.phase_end_t < t then
						local drama_pass = self._drama_data.amount < tweak_data.drama.assault_fade_end
						local engagement_pass = self:_count_criminals_engaged_force(11) <= 10
						local taking_too_long = task_data.phase_end_t + drama_engagement_time_limit < t

						if drama_pass and engagement_pass or taking_too_long then
							end_assault = true
						end
					end
				end
								
				if task_data.force_end or end_assault then
					print("assault task clear")

					task_data.active = nil
					task_data.phase = nil
					task_data.said_retreat = nil
					task_data.force_end = nil
				    self:_get_megaphone_sound_source():post_event("mga_leave")
				    local time = self._t
				        for group_id, group in pairs(self._groups) do
	                          for u_key, u_data in pairs(group.units) do
				              local nav_seg_id = u_data.tracker:nav_segment()
				    		  local current_objective = group.objective
				                if current_objective.coarse_path then
			                        if not u_data.unit:sound():speaking(time) then
	                          		    u_data.unit:sound():say("m01", true)
				    		        end	
	                            end					   
				            end	
				        end		
					if self._draw_drama then
						self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = t
					end

					managers.mission:call_global_event("end_assault")
					self:_begin_regroup_task()

					return
				end
				
			else
			end
		end
		if self._drama_data.amount <= tweak_data.drama.low then
			for criminal_key, criminal_data in pairs(self._player_criminals) do
				self:criminal_spotted(criminal_data.unit)
				for group_id, group in pairs(self._groups) do
					if group.objective.charge then
						for u_key, u_data in pairs(group.units) do
							u_data.unit:brain():clbk_group_member_attention_identified(nil, criminal_key)
						end
					end
				end
			end
		end
		local primary_target_area = task_data.target_areas[1]
		if self:is_area_safe_assault(primary_target_area) then
			local target_pos = primary_target_area.pos
			local nearest_area, nearest_dis
			for criminal_key, criminal_data in pairs(self._player_criminals) do
				if not criminal_data.status then
					local dis = mvector3.distance_sq(target_pos, criminal_data.m_pos)
					if not nearest_dis or nearest_dis > dis then
						nearest_dis = dis
						nearest_area = self:get_area_from_nav_seg_id(criminal_data.tracker:nav_segment())
					end
				end
			end
			if nearest_area then
				primary_target_area = nearest_area
				task_data.target_areas[1] = nearest_area
			end
		end
		local nr_wanted = task_data.force - self:_count_police_force("assault")
		if task_data.phase == "anticipation" then
			nr_wanted = nr_wanted - 5
		end
		if nr_wanted > 0 and task_data.phase ~= "fade" then
			local used_event
			if task_data.use_spawn_event and task_data.phase ~= "anticipation" then
				task_data.use_spawn_event = false
				if self:_try_use_task_spawn_event(t, primary_target_area, "assault") then
					used_event = true
				end
			end
			if used_event or next(self._spawning_groups) then
			else
				local spawn_group, spawn_group_type = nil
				
				--local yes = true
				--uncomment to test ponr groups
				--uncomment on get_force_spawn_group as well
				if self._ponr_is_on or yes then
					spawn_group, spawn_group_type = self:_find_spawn_group_near_area(primary_target_area, self._tweak_data.assault.coolhunting, nil, nil, nil)
				else
					spawn_group, spawn_group_type = self:_find_spawn_group_near_area(primary_target_area, self._tweak_data.assault.groups, nil, nil, nil)
				end
				
				if spawn_group then
					local grp_objective = {
						type = "assault_area",
						area = spawn_group.area,
						coarse_path = {
							{
								spawn_group.area.pos_nav_seg,
								spawn_group.area.pos
							}
						},
						attitude = "avoid",
						pose = "crouch",
						stance = "hos"
					}
					self:_spawn_in_group(spawn_group, spawn_group_type, grp_objective, task_data)
				end
			end
		end
		if task_data.phase ~= "anticipation" then
			if t > task_data.use_smoke_timer then
				task_data.use_smoke = true
			end
			self:detonate_queued_smoke_grenades()
		end
		self:_assign_enemy_groups_to_assault(task_data.phase)
	end

	function GroupAIStateBesiege:_set_recon_objective_to_group(group)
		local current_objective = group.objective
		local target_area = current_objective.target_area or current_objective.area
		if not target_area.loot and not target_area.hostages or not current_objective.moving_out and current_objective.moved_in and group.in_place_t and self._t - group.in_place_t > 15 then
			local recon_area
			local to_search_areas = {
				current_objective.area
			}
			local found_areas = {
				[current_objective.area] = "init"
			}
			repeat
				local search_area = table.remove(to_search_areas, 1)
				if search_area.loot or search_area.hostages then
					local occupied
					for test_group_id, test_group in pairs(self._groups) do
						if test_group ~= group and (test_group.objective.target_area == search_area or test_group.objective.area == search_area) then
							occupied = true
						else
						end
					end
					if not occupied and group.visited_areas and group.visited_areas[search_area] then
						occupied = true
					end
					if not occupied then
						local is_area_safe = not next(search_area.criminal.units)
						if is_area_safe then
							recon_area = search_area
							break
						else
							recon_area = recon_area or search_area
						end
					end
				end
				if not next(search_area.criminal.units) then
					for other_area_id, other_area in pairs(search_area.neighbours) do
						if not found_areas[other_area] then
							table.insert(to_search_areas, other_area)
							found_areas[other_area] = search_area
						end
					end
				end
			until #to_search_areas == 0
			if recon_area then
				local coarse_path = {
					{
						recon_area.pos_nav_seg,
						recon_area.pos
					}
				}
				local last_added_area = recon_area
				while found_areas[last_added_area] ~= "init" do
					last_added_area = found_areas[last_added_area]
					table.insert(coarse_path, 1, {
						last_added_area.pos_nav_seg,
						last_added_area.pos
					})
				end
				local grp_objective = {
					type = "recon_area",
					area = current_objective.area,
					target_area = recon_area,
					coarse_path = coarse_path,
					attitude = "avoid",
					stance = "hos",
					pose = "stand",
					scan = true
				}
				self:_set_objective_to_enemy_group(group, grp_objective)
				self:_voice_looking_for_angle(group)
				current_objective = group.objective
			end
		end
		if current_objective.target_area then
			if current_objective.moving_out and not current_objective.moving_in and current_objective.coarse_path then
				local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
				if forwardmost_i_nav_point and forwardmost_i_nav_point > 1 then
					for i = forwardmost_i_nav_point + 1, #current_objective.coarse_path do
						local nav_point = current_objective.coarse_path[forwardmost_i_nav_point]
						if not self:is_nav_seg_safe(nav_point[1]) then
							for i = 0, #current_objective.coarse_path - forwardmost_i_nav_point do
								table.remove(current_objective.coarse_path)
							end
							local grp_objective = {
								type = "recon_area",
								area = self:get_area_from_nav_seg_id(current_objective.coarse_path[#current_objective.coarse_path][1]),
								target_area = current_objective.target_area,
								attitude = "avoid",
								stance = "hos",
								pose = "stand",
								scan = true
							}
							self:_set_objective_to_enemy_group(group, grp_objective)
							self:_voice_looking_for_angle(group)
							return
						end
					end
				end
			end
			if not current_objective.moving_out and not current_objective.area.neighbours[current_objective.target_area.id] then
				local search_params = {
					from_seg = current_objective.area.pos_nav_seg,
					to_seg = current_objective.target_area.pos_nav_seg,
					id = "GroupAI_recon",
					access_pos = self._get_group_acces_mask(group),
					verify_clbk = callback(self, self, "is_nav_seg_safe")
				}
				local coarse_path = managers.navigation:search_coarse(search_params)
				if coarse_path then
					self:_merge_coarse_path_by_area(coarse_path)
					table.remove(coarse_path)
					local grp_objective = {
						type = "recon_area",
						area = self:get_area_from_nav_seg_id(coarse_path[#coarse_path][1]),
						target_area = current_objective.target_area,
						coarse_path = coarse_path,
						attitude = "avoid",
						stance = "hos",
						pose = "stand",
						scan = true
					}
					self:_set_objective_to_enemy_group(group, grp_objective)
					self:_voice_looking_for_angle(group)
				end
			end
			if not current_objective.moving_out and current_objective.area.neighbours[current_objective.target_area.id] then
				local grp_objective = {
					type = "recon_area",
					area = current_objective.target_area,
					attitude = "avoid",
					stance = "hos",
					pose = "crouch",
					scan = true
				}
				self:_set_objective_to_enemy_group(group, grp_objective)
				self:_voice_looking_for_angle(group)
				group.objective.moving_in = true
				group.objective.moved_in = true
				if next(current_objective.target_area.criminal.units) then
					self:_chk_group_use_smoke_grenade(group, {
						use_smoke = true,
						target_areas = {
							grp_objective.area
						}
					})
				end
			end
		end
	end

	function GroupAIStateBesiege:_set_assault_objective_to_group(group, phase)
		if not group.has_spawned then
			return
		end
		local phase_is_anticipation = phase == "anticipation"
		local current_objective = group.objective
		local approach, open_fire, push, pull_back, charge
		local obstructed_area = self:_chk_group_areas_tresspassed(group)
		local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
		local tactics_map
		if group_leader_u_data and group_leader_u_data.tactics then
			tactics_map = {}
			for _, tactic_name in ipairs(group_leader_u_data.tactics) do
				tactics_map[tactic_name] = true
			end
			if current_objective.tactic and not tactics_map[current_objective.tactic] then
				current_objective.tactic = nil
			end
			for i_tactic, tactic_name in ipairs(group_leader_u_data.tactics) do
				if tactic_name == "deathguard" and not phase_is_anticipation then
					if current_objective.tactic == tactic_name then
					    self:_voice_deathguard_start(group) --roger/copy that
						for u_key, u_data in pairs(self._char_criminals) do
							if u_data.status and current_objective.follow_unit == u_data.unit then
								local crim_nav_seg = u_data.tracker:nav_segment()
								if current_objective.area.nav_segs[crim_nav_seg] then
									return
								end
							end
						end
					end
					local closest_crim_u_data, closest_crim_dis_sq
					for u_key, u_data in pairs(self._char_criminals) do
						if u_data.status then
							local closest_u_id, closest_u_data, closest_u_dis_sq = self._get_closest_group_unit_to_pos(u_data.m_pos, group.units)
							if closest_u_dis_sq and (not closest_crim_dis_sq or closest_crim_dis_sq > closest_u_dis_sq) then
								closest_crim_u_data = u_data
								closest_crim_dis_sq = closest_u_dis_sq
							end
						end
					end
					if closest_crim_u_data then
						local search_params = {
							from_tracker = group_leader_u_data.unit:movement():nav_tracker(),
							to_tracker = closest_crim_u_data.tracker,
							id = "GroupAI_deathguard",
							access_pos = self._get_group_acces_mask(group)
						}
						local coarse_path = managers.navigation:search_coarse(search_params)
						if coarse_path then
							local grp_objective = {
								type = "assault_area",
								tactic = "deathguard",
								follow_unit = closest_crim_u_data.unit,
								distance = 800,
								area = self:get_area_from_nav_seg_id(coarse_path[#coarse_path][1]),
								coarse_path = coarse_path,
								attitude = "engage",
								moving_in = true
							}
							group.is_chasing = true
							self:_set_objective_to_enemy_group(group, grp_objective)
							self:_voice_deathguard_start(group) --roger/copy that
							return
						end
					end
				elseif tactic_name == "hunter" and not phase_is_anticipation then
					if current_objective.tactic == tactic_name then
						for u_key, u_data in pairs(self._char_criminals) do
							if u_data.unit then
								local players_nearby = managers.player:_chk_fellow_crimin_proximity(u_data.unit)
								local crim_nav_seg = u_data.tracker:nav_segment()
								if players_nearby and players_nearby <= 0 then
									if current_objective.area.nav_segs[crim_nav_seg] then
										return
									end
								end
							end
						end
					end
					local closest_crim_u_data, closest_crim_dis_sq = nil
					for u_key, u_data in pairs(self._char_criminals) do
						if u_data.unit then
							local players_nearby = managers.player:_chk_fellow_crimin_proximity(u_data.unit)
							local closest_u_id, closest_u_data, closest_u_dis_sq = self._get_closest_group_unit_to_pos(u_data.m_pos, group.units)
							if players_nearby and players_nearby <= 0 then
								if closest_u_dis_sq and (not closest_crim_dis_sq or closest_crim_dis_sq > closest_u_dis_sq) then
									closest_crim_u_data = u_data
									closest_crim_dis_sq = closest_u_dis_sq
								end
							end
						end
					end
					if closest_crim_u_data then
						local search_params = {
							from_tracker = group_leader_u_data.unit:movement():nav_tracker(),
							to_tracker = closest_crim_u_data.tracker,
							id = "GroupAI_deathguard",
							access_pos = self._get_group_acces_mask(group)
						}
						local coarse_path = managers.navigation:search_coarse(search_params)
						if coarse_path then
							local grp_objective = {
								type = "assault_area",
								tactic = "hunter",
								distance = 9999,
								follow_unit = closest_crim_u_data.unit,
								area = self:get_area_from_nav_seg_id(coarse_path[#coarse_path][1]),
								coarse_path = coarse_path,
								attitude = "engage",
								moving_in = true
							}
							group.is_chasing = true
							self:_set_objective_to_enemy_group(group, grp_objective)
							return
						end
					end
				elseif tactic_name == "charge" and not current_objective.moving_out and group.in_place_t and (self._t - group.in_place_t > 15 or self._t - group.in_place_t > 4 and self._drama_data.amount <= tweak_data.drama.low) and next(current_objective.area.criminal.units) and group.is_chasing and not current_objective.charge and not (tactics_map and tactics_map.obstacle) then
					charge = true
				end
			end
		end
		local objective_area
		if obstructed_area then
			if current_objective.moving_out then
				if not current_objective.open_fire then
					open_fire = true
				end
			elseif not current_objective.pushed or charge and not current_objective.charge then
				push = true
			end
		else
			local obstructed_path_index = self:_chk_coarse_path_obstructed(group)
			if obstructed_path_index then
				print("obstructed_path_index", obstructed_path_index)
				objective_area = self:get_area_from_nav_seg_id(group.coarse_path[math.max(obstructed_path_index - 1, 1)][1])
				pull_back = true
			elseif not current_objective.moving_out then
				local has_criminals_close
				if not current_objective.moving_out then
					for area_id, neighbour_area in pairs(current_objective.area.neighbours) do
						if next(neighbour_area.criminal.units) then
							has_criminals_close = true
						else
						end
					end
				end
				if charge then
					push = true
				elseif not has_criminals_close or not group.in_place_t then
					approach = true
				elseif not phase_is_anticipation and not current_objective.open_fire then
					open_fire = true
			        self:_voice_open_fire_start(group)
				elseif not phase_is_anticipation and group.in_place_t and (group.is_chasing or not tactics_map or not tactics_map.ranged_fire or not tactics_map.obstacle or self._t - group.in_place_t > 15) then
					push = true
				elseif phase_is_anticipation and current_objective.open_fire then
					pull_back = true			
				end
			end
		end
		objective_area = objective_area or current_objective.area
		if open_fire then
			local grp_objective = {
				type = "assault_area",
				tactic = current_objective.tactic,
				area = obstructed_area or current_objective.area,
				coarse_path = {
					{
						objective_area.pos_nav_seg,
						mvector3.copy(current_objective.area.pos)
					}
				},
				attitude = "engage",
				pose = "stand",
				stance = "hos",
				open_fire = true
			}
			self:_set_objective_to_enemy_group(group, grp_objective)
			self:_voice_open_fire_start(group)
		elseif approach or push then
			local assault_area, alternate_assault_area, alternate_assault_area_from, assault_path, alternate_assault_path
			local to_search_areas = {objective_area}
			local found_areas = {
				[objective_area] = "init"
			}
			repeat
				local search_area = table.remove(to_search_areas, 1)
				if next(search_area.criminal.units) then
					local assault_from_here = true
					if tactics_map and tactics_map.flank then --for the love of frick just let flankers flank
						local assault_from_area = found_areas[search_area]

						if assault_from_area ~= "init" then
							local cop_units = assault_from_area.police.units

							for u_key, u_data in pairs(cop_units) do
								if u_data.group and u_data.group.objective.type == "assault_area" then
									assault_from_here = false

									if not alternate_assault_area then
										local search_params = {
											id = "GroupAI_assault",
											from_seg = current_objective.area.pos_nav_seg,
											to_seg = search_area.pos_nav_seg,
											access_pos = self._get_group_acces_mask(group),
											verify_clbk = callback(self, self, "is_nav_seg_safe")
										}
										alternate_assault_path = managers.navigation:search_coarse(search_params)

										if alternate_assault_path then
											self:_merge_coarse_path_by_area(alternate_assault_path)

											alternate_assault_area = search_area
											alternate_assault_area_from = assault_from_area
										end
									end

									found_areas[search_area] = nil

									break
								end
							end
						end
					end
					
					if assault_from_here then
						local search_params = {
							from_seg = current_objective.area.pos_nav_seg,
							to_seg = search_area.pos_nav_seg,
							id = "GroupAI_assault",
							access_pos = self._get_group_acces_mask(group),
							verify_clbk = callback(self, self, "is_nav_seg_safe")
						}
						assault_path = managers.navigation:search_coarse(search_params)
						if assault_path then
							self:_merge_coarse_path_by_area(assault_path)
							assault_area = search_area
							break
						end
					end
				else
					for other_area_id, other_area in pairs(search_area.neighbours) do
						if not found_areas[other_area] then
							table.insert(to_search_areas, other_area)
							found_areas[other_area] = search_area
						end
					end
				end
			until #to_search_areas == 0
			
			if not assault_area and alternate_assault_area or tactics_map and tactics_map.flank and alternate_assault_area then
				assault_area = alternate_assault_area
				found_areas[assault_area] = alternate_assault_area_from
				assault_path = alternate_assault_path
			end
			
			if assault_area and assault_path then
				local assault_area = push and assault_area or found_areas[assault_area] == "init" and objective_area or found_areas[assault_area]
				if #assault_path > 2 and assault_area.nav_segs[assault_path[#assault_path - 1][1]] then
					table.remove(assault_path)
				end
				local used_grenade
				if push then
					local detonate_pos
					if charge then
						for c_key, c_data in pairs(assault_area.criminal.units) do
							detonate_pos = c_data.unit:movement():m_pos()
							break
						end
					end
					local first_chk = math.random() < 0.5 and self._chk_group_use_flash_grenade or self._chk_group_use_smoke_grenade
					local second_chk = first_chk == self._chk_group_use_flash_grenade and self._chk_group_use_smoke_grenade or self._chk_group_use_flash_grenade
					used_grenade = first_chk(self, group, self._task_data.assault, detonate_pos)
					used_grenade = used_grenade or second_chk(self, group, self._task_data.assault, detonate_pos)
					self:_voice_push_in(group)
				end
				
				if not push or used_grenade then
					local grp_objective = {
						type = "assault_area",
						area = assault_area,
						coarse_path = assault_path,
						pose = push and "crouch" or "stand",
						stance = "hos",
						attitude = push and "engage" or "avoid",
						moving_in = push and true or nil,
						open_fire = push or nil,
						pushed = push or nil,
						charge = charge,
						interrupt_dis = charge and 0 or nil
					}
					group.is_chasing = group.is_chasing or push
					self:_set_objective_to_enemy_group(group, grp_objective)
					self:_voice_move_in_start(group)
				end
			end
		elseif pull_back then
		    self:_voice_gtfo(group)
			local retreat_area, do_not_retreat
			for u_key, u_data in pairs(group.units) do
				local nav_seg_id = u_data.tracker:nav_segment()
				if current_objective.area.nav_segs[nav_seg_id] then
					retreat_area = current_objective.area
		            self:_voice_gtfo(group)
				elseif self:is_nav_seg_safe(nav_seg_id) then
					retreat_area = self:get_area_from_nav_seg_id(nav_seg_id)
		            self:_voice_gtfo(group)
				else
				end
			end
			if not retreat_area and not do_not_retreat and current_objective.coarse_path then
				local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
				if forwardmost_i_nav_point then
					local nearest_safe_nav_seg_id = current_objective.coarse_path(forwardmost_i_nav_point)
					retreat_area = self:get_area_from_nav_seg_id(nearest_safe_nav_seg_id)
		            self:_voice_gtfo(group)
				end
			end
			if retreat_area then
				local new_grp_objective = {
					type = "assault_area",
					area = retreat_area,
					coarse_path = {
						{
							retreat_area.pos_nav_seg,
							mvector3.copy(retreat_area.pos)
						}
					},
					attitude = "avoid",
					pose = "crouch",
					stance = "hos"
				}
				group.is_chasing = nil
				self:_set_objective_to_enemy_group(group, new_grp_objective)
				self:_voice_gtfo(group)
				return
			end
		end
	end
	
	function GroupAIStateBesiege:get_force_spawn_group(group, group_types)
		local best_groups = {}
		local total_weight = nil
		
		--local yes = true
		--uncomment to test ponr groups
		if self._ponr_is_on or yes then
			total_weight = self:_choose_best_groups(best_groups, group, group_types, self._tweak_data.assault.coolhunting, 1)
		elseif self._task_data.assault.active then
			total_weight = self:_choose_best_groups(best_groups, group, group_types, self._tweak_data.assault.groups, 1)
		else
			total_weight = self:_choose_best_groups(best_groups, group, group_types, self._tweak_data[self._task_data.assault.active and "assault" or "recon"].groups, 1)
		end
		

		if total_weight > 0 then
			local spawn_group, spawn_group_type = self:_choose_best_group(best_groups, total_weight)

			if spawn_group then
				return spawn_group, spawn_group_type
			end
		end

		return nil
	end
	
	function GroupAIStateBesiege:_perform_group_spawning(spawn_task, force, use_last)
		local nr_units_spawned = 0
		local produce_data = {
			name = true,
			spawn_ai = {}
		}
		local group_ai_tweak = tweak_data.group_ai
		local spawn_points = spawn_task.spawn_group.spawn_pts

		local function _try_spawn_unit(u_type_name, spawn_entry)
			if GroupAIStateBesiege._MAX_SIMULTANEOUS_SPAWNS <= nr_units_spawned and not force then
				return
			end

			local hopeless = true
			local current_unit_type = tweak_data.levels:get_ai_group_type()

			for _, sp_data in ipairs(spawn_points) do
				local category = group_ai_tweak.unit_categories[u_type_name]

				if (sp_data.accessibility == "any" or category.access[sp_data.accessibility]) and (not sp_data.amount or sp_data.amount > 0) and sp_data.mission_element:enabled() then
					hopeless = false

					if sp_data.delay_t < self._t then
						local units = category.unit_types[current_unit_type]
						produce_data.name = units[math.random(#units)]
						produce_data.name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", produce_data.name)
						local spawned_unit = sp_data.mission_element:produce(produce_data)
						local u_key = spawned_unit:key()
						local objective = nil

						if spawn_task.objective then
							objective = self.clone_objective(spawn_task.objective)
						else
							objective = spawn_task.group.objective.element:get_random_SO(spawned_unit)

							if not objective then
								spawned_unit:set_slot(0)

								return true
							end

							objective.grp_objective = spawn_task.group.objective
						end

						local u_data = self._police[u_key]

						self:set_enemy_assigned(objective.area, u_key)

						if spawn_entry.tactics then
							u_data.tactics = spawn_entry.tactics
							u_data.tactics_map = {}

							for _, tactic_name in ipairs(u_data.tactics) do
								u_data.tactics_map[tactic_name] = true
							end
						end

						spawned_unit:brain():set_spawn_entry(spawn_entry, u_data.tactics_map)

						u_data.rank = spawn_entry.rank

						self:_add_group_member(spawn_task.group, u_key)

						if spawned_unit:brain():is_available_for_assignment(objective) then
							if objective.element then
								objective.element:clbk_objective_administered(spawned_unit)
							end

							spawned_unit:brain():set_objective(objective)
						else
							spawned_unit:brain():set_followup_objective(objective)
						end

						nr_units_spawned = nr_units_spawned + 1

						if spawn_task.ai_task then
							spawn_task.ai_task.force_spawned = spawn_task.ai_task.force_spawned + 1
							spawned_unit:brain()._logic_data.spawned_in_phase = spawn_task.ai_task.phase
						end

						sp_data.delay_t = self._t + sp_data.interval

						if sp_data.amount then
							sp_data.amount = sp_data.amount - 1
						end

						return true
					end
				end
			end

			if hopeless then
				debug_pause("[GroupAIStateBesiege:_upd_group_spawning] spawn group", spawn_task.spawn_group.id, "failed to spawn unit", u_type_name)

				return true
			end
		end

		for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
			if not group_ai_tweak.unit_categories[u_type_name].access.acrobatic then
				for i = spawn_info.amount, 1, -1 do
					local success = _try_spawn_unit(u_type_name, spawn_info.spawn_entry)

					if success then
						spawn_info.amount = spawn_info.amount - 1
					end

					break
				end
			end
		end

		for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
			for i = spawn_info.amount, 1, -1 do
				local success = _try_spawn_unit(u_type_name, spawn_info.spawn_entry)

				if success then
					spawn_info.amount = spawn_info.amount - 1
				end

				break
			end
		end

		local complete = true

		for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
			if spawn_info.amount > 0 then
				complete = false

				break
			end
		end

		if complete then
			spawn_task.group.has_spawned = true
			self:_voice_groupentry(spawn_task.group)
			table.remove(self._spawning_groups, use_last and #self._spawning_groups or 1)

			if spawn_task.group.size <= 0 then
				self._groups[spawn_task.group.id] = nil
			end
		end
	end

end
	
	function GroupAIStateBesiege:_voice_saw()
		for group_id, group in pairs(self._groups) do
			for u_key, u_data in pairs(group.units) do
				if u_data.char_tweak.chatter.saw then
					self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "saw")
				else
					
				end
			end
		end
	end


	function GroupAIStateBesiege:_voice_sentry()
		for group_id, group in pairs(self._groups) do
			for u_key, u_data in pairs(group.units) do
				if u_data.char_tweak.chatter.sentry then
					self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "sentry")
				else
					
				end
			end
		end
	end
	
	function GroupAIStateBesiege:_voice_looking_for_angle(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "look_for_angle") then
			else
			end
		end
	end	
	
	function GroupAIStateBesiege:_voice_open_fire_start(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "open_fire") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_push_in(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "push") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_gtfo(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "retreat") then
			else
			end
		end
	end
	
	function GroupAIStateBesiege:_voice_deathguard_start(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "deathguard") then
			else
			end
		end
	end	
	
	function GroupAIStateBesiege:_voice_smoke(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "smoke") then
			else
			end
		end
	end	
	
	function GroupAIStateBesiege:_voice_flash(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "flash_grenade") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_dont_delay_assault(group)
		local time = self._t
		for u_key, unit_data in pairs(group.units) do
			if not unit_data.unit:sound():speaking(time) then
				unit_data.unit:sound():say("p01", true, nil)
				return true
			end
		end
		return false
	end
	
end
