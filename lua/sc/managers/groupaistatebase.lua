if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local mvec3_dot = mvector3.dot
	local mvec3_set = mvector3.set
	local mvec3_sub = mvector3.subtract
	local mvec3_dis_sq = mvector3.distance_sq
	local mvec3_dir = mvector3.direction
	local mvec3_l_sq = mvector3.length_sq
	local tmp_vec1 = Vector3()
	local tmp_vec2 = Vector3()

	local sc_group_misc_data = GroupAIStateBase._init_misc_data
	function GroupAIStateBase:_init_misc_data()
		sc_group_misc_data(self)
		self._ponr_is_on = nil
		self._special_unit_types = {
			tank = true,
			spooc = true,
			shield = true,
			taser = true,
			boom = true,
			boom_summers = true,
			taser_summers = true,
			medic_summers = true,
			medic = true,
			omnia_LPF = true,
			spring = true,
			summers = true,
			autumn = true
		}
	end

	local sc_group_base = GroupAIStateBase.on_simulation_started
	function GroupAIStateBase:on_simulation_started()
		sc_group_base(self)
		self._ponr_is_on = nil
		self._special_unit_types = {
			tank = true,
			spooc = true,
			shield = true,
			taser = true,
			boom = true,
			boom_summers = true,
			taser_summers = true,
			medic_summers = true,
			medic = true,
			omnia_LPF = true,
			spring = true,
			summers = true,
			autumn = true
		}
	end
	
	function GroupAIStateBase:set_point_of_no_return_timer(time, point_of_no_return_id)
		if time == nil or setup:has_queued_exec() then
			return
		end

		self._forbid_drop_in = true
		self._ponr_is_on = true
		managers.network.matchmake:set_server_joinable(false)

		if not self._peers_inside_point_of_no_return then
			self._peers_inside_point_of_no_return = {}
		end

		self._point_of_no_return_timer = time
		self._point_of_no_return_id = point_of_no_return_id
		self._point_of_no_return_areas = nil

		managers.hud:show_point_of_no_return_timer()
		managers.hud:add_updator("point_of_no_return", callback(self, self, "_update_point_of_no_return"))
	end
	
	local old_update_point_of_no_return = GroupAIStateBase._update_point_of_no_return

	function GroupAIStateBase:_update_point_of_no_return(t, dt)
		local get_mission_script_element = function(id)
			for name, script in pairs(managers.mission:scripts()) do
				if script:element(id) then
					return script:element(id)
				end
			end
		end
		
			
		if not self._point_of_no_return_id or not get_mission_script_element(self._point_of_no_return_id) then
		
			local prev_time = self._point_of_no_return_timer
			self._point_of_no_return_timer = self._point_of_no_return_timer - dt
			local sec = math.floor(self._point_of_no_return_timer)

			if sec < math.floor(prev_time) then
				managers.hud:flash_point_of_no_return_timer(sec <= 10)
			end
				
			if self._point_of_no_return_timer <= 0 then
				managers.network:session():send_to_peers("mission_ended", false, 0)
				game_state_machine:change_state_by_name("gameoverscreen")
			else
				managers.hud:feed_point_of_no_return_timer(self._point_of_no_return_timer)
			end
		else
			old_update_point_of_no_return(self, t, dt)
		end
	end
		
	function GroupAIStateBase:_radio_chatter_clbk()
		if self._ai_enabled and not self:whisper_mode() then
			local optimal_dist = 500
			local best_dist, best_cop, radio_msg = nil

			for _, c_record in pairs(self._player_criminals) do
				for i, e_key in ipairs(c_record.important_enemies) do
					local cop = self._police[e_key]
					local use_radio = cop.char_tweak.use_radio

					if use_radio then
						if cop.char_tweak.radio_prefix then
							use_radio = cop.char_tweak.radio_prefix .. use_radio
						end

						local dist = math.abs(mvector3.distance(cop.m_pos, c_record.m_pos))

						if not best_dist or dist < best_dist then
							best_dist = dist
							best_cop = cop
							radio_msg = use_radio
						end
					end
				end
			end

			if best_cop then
				best_cop.unit:sound():play(radio_msg, nil, true)
			end
		end

		self._radio_clbk = callback(self, self, "_radio_chatter_clbk")

		managers.enemy:add_delayed_clbk("_radio_chatter_clbk", self._radio_clbk, Application:time() + 30 + math.random(0, 20))
	end	
	
	function GroupAIStateBase:find_followers_to_unit(leader_key, leader_data)
		local leader_u_data = self._police[leader_key]
		if not leader_u_data then
			return
		end
		leader_u_data.followers = leader_u_data.followers or {}
		local followers = leader_u_data.followers
		local nr_followers = #followers
		local max_nr_followers = leader_data.max_nr_followers
		if nr_followers >= max_nr_followers then
			return
		end
		local wanted_nr_new_followers = max_nr_followers - nr_followers
		local leader_unit = leader_u_data.unit
		local leader_nav_seg = leader_u_data.tracker:nav_segment()
		local objective = {
			type = "follow",
			follow_unit = leader_unit,
			scan = true,
			nav_seg = leader_nav_seg,
			stance = "cbt",
			distance = 600
		}
		local candidates = {}
		for u_key, u_data in pairs(self._police) do
			if u_data.assigned_area and not u_data.follower and u_data.char_tweak.follower and u_data.tracker:nav_segment() == leader_nav_seg and u_data.unit:brain():is_available_for_assignment(objective) then
				table.insert(followers, u_key)
				u_data.follower = leader_key
				local new_follow_objective = clone(objective)
				new_follow_objective.fail_clbk = callback(self, self, "clbk_follow_objective_failed", {
					leader_u_data = leader_u_data,
					follower_unit = u_data.unit
				})
				u_data.unit:brain():set_objective(new_follow_objective)
				if #candidates == wanted_nr_new_followers then
					break
				end
			end
		end
	end
	function GroupAIStateBase:chk_has_followers(leader_key)
		local leader_u_data = self._police[leader_key]
		if leader_u_data and next(leader_u_data.followers) then
			return true
		end
	end
	function GroupAIStateBase:are_followers_ready(leader_key)
		local leader_u_data = self._police[leader_key]
		if not leader_u_data or not leader_u_data.followers then
			return true
		end
		for i, follower_key in ipairs(leader_u_data.followers) do
			local follower_u_data = self._police[follower_key]
			local objective = follower_u_data.unit:brain():objective()
			if objective and not objective.in_place then
				return
			end
		end
		return true
	end

	function GroupAIStateBase:clbk_follow_objective_failed(data)
		local leader_u_data = data.leader_u_data
		local follower_unit = data.follower_unit
		local follower_key = follower_unit:key()
		for i, _follower_key in ipairs(leader_u_data.followers) do
			if _follower_key == follower_key then
				table.remove(leader_u_data.followers, i)
				break
			end
		end
		local follower_u_data = self._police[follower_key]
		if follower_u_data then
			follower_u_data.follower = nil
		end
	end

	function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers)
		local nr_players = 0
		for u_key, u_data in pairs(self:all_criminals()) do
			if not u_data.status then
				nr_players = nr_players + 1
			end
		end
		nr_players = math.clamp(nr_players, 1, 4)
		return balance_multipliers[nr_players]
	end

	function GroupAIStateBase:detonate_world_smoke_grenade(id)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)	
		local job = Global.level_data and Global.level_data.level_id
				
		self._smoke_grenades = self._smoke_grenades or {}
		if not self._smoke_grenades[id] then
			Application:error("Could not detonate smoke grenade as it was not queued!", id)
			return
		end
		local data = self._smoke_grenades[id]
		
		if job == "haunted" then
			return
		end		
		
		if data.flashbang then
			if Network:is_client() then
				return
			end
			local flashbang_unit = "units/payday2/weapons/wpn_frag_flashbang/wpn_frag_flashbang"
			if difficulty_index == 8 then
				flashbang_unit = "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
			end			
			local pos = data.detonate_pos + Vector3(0, 0, 1)
			local rotation = Rotation(math.random() * 360, 0, 0)
			local flash_grenade = World:spawn_unit(Idstring(flashbang_unit), data.detonate_pos, rotation)
			flash_grenade:base():activate(data.detonate_pos, data.duration)
			self._smoke_grenades[id] = nil
		else
			data.duration = data.duration == 0 and 15 or data.duration
			local smoke_grenade = World:spawn_unit(Idstring("units/weapons/smoke_grenade_quick/smoke_grenade_quick"), data.detonate_pos, Rotation())
			smoke_grenade:base():activate(data.detonate_pos, data.duration)
			managers.groupai:state():teammate_comment(nil, "g40x_any", data.detonate_pos, true, 2000, false)
			data.grenade = smoke_grenade
		end
		if Network:is_server() then
			managers.network:session():send_to_peers_synched("sync_smoke_grenade", data.detonate_pos, data.detonate_pos, data.duration, data.flashbang and true or false)
		end
	end

	function GroupAIStateBase:has_room_for_police_hostage()
		local nr_hostages_allowed = 4
		for u_key, u_data in pairs(self._player_criminals) do
			if u_data.unit:base().is_local_player then
				if managers.player:has_category_upgrade("player", "intimidate_enemies") then
					if Global.game_settings.single_player then
						nr_hostages_allowed = 4
					else
						nr_hostages_allowed = 4
					end
				end
			elseif u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
				if Global.game_settings.single_player then
					nr_hostages_allowed = 4
				else
					nr_hostages_allowed = 4
				end
			end
		end
		return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
	end
	
	function GroupAIStateBase:sync_event(event_id, blame_id)
		local event_name = self.EVENT_SYNC[event_id]
		local blame_name = self.BLAME_SYNC[blame_id]
		if event_name == "police_called" then
			self._police_called = true
			self:_call_listeners("police_called")
		elseif event_name == "enemy_weapons_hot" then
			self._police_called = true
			self._enemy_weapons_hot = true
			managers.music:post_event(tweak_data.levels:get_music_event("control"))
			self:_call_listeners("enemy_weapons_hot")
			managers.enemy:add_delayed_clbk("notify_bain_weapons_hot", callback(self, self, "notify_bain_weapons_hot", blame_name), Application:time() + 0)
			managers.enemy:set_corpse_disposal_enabled(true)
		elseif event_name == "phalanx_spawned" then
			managers.game_play_central:announcer_say("cpa_a02_01")
		end
	end
	
	function GroupAIStateBase:propagate_alert(alert_data)
		if managers.network:session() and Network and not Network:is_server() then
			managers.network:session():send_to_host("propagate_alert", alert_data[1], alert_data[2], alert_data[3], alert_data[4], alert_data[5], alert_data[6])

			return
		end

		local nav_manager = managers.navigation
		local access_func = nav_manager.check_access
		local alert_type = alert_data[1]
		local all_listeners = self._alert_listeners
		local listeners_by_type = all_listeners[alert_type]

		if listeners_by_type then
			local proximity_chk_func = nil
			local alert_epicenter = alert_data[2]

			if alert_epicenter then
				local alert_rad_sq = alert_data[3] * alert_data[3]
				if self._enemy_weapons_hot then
					alert_rad_sq = 4500 * 4500
				end


				function proximity_chk_func(listener_pos)
					return mvec3_dis_sq(alert_epicenter, listener_pos) < alert_rad_sq
				end
			else

				function proximity_chk_func()
					return true
				end
			end

			local alert_filter = alert_data[4]
			local clbks = nil

			for filter_str, listeners_by_type_and_filter in pairs(listeners_by_type) do
				local key, listener = next(listeners_by_type_and_filter, nil)
				local filter_num = listener.filter

				if access_func(nav_manager, filter_num, alert_filter, nil) then
					for id, listener in pairs(listeners_by_type_and_filter) do
						if proximity_chk_func(listener.m_pos) then
							clbks = clbks or {}

							table.insert(clbks, listener.clbk)
						end
					end
				end
			end

			if clbks then
				for _, clbk in ipairs(clbks) do
					clbk(alert_data)
				end
			end
		end
	end
	
	--Gameover now happens after ~30 seconds instead of 10 seconds, allowing Stockholm Syndrome and Messiah to function correctly
	function GroupAIStateBase:check_gameover_conditions()
		if not Network:is_server() or managers.platform:presence() ~= "Playing" or setup:has_queued_exec() then
			return false
		end

		if game_state_machine:current_state().game_ended and game_state_machine:current_state():game_ended() then
			return false
		end

		if Global.load_start_menu or Application:editor() then
			return false
		end

		if not self:whisper_mode() and self._super_syndrome_peers and self:hostage_count() > 0 then
			for _, active in pairs(self._super_syndrome_peers) do
				if active then
					return false
				end
			end
		end

		local plrs_alive = false
		local plrs_disabled = true

		for u_key, u_data in pairs(self._player_criminals) do
			plrs_alive = true

			if u_data.status ~= "dead" and u_data.status ~= "disabled" then
				plrs_disabled = false

				break
			end
		end

		local ai_alive = false
		local ai_disabled = true

		for u_key, u_data in pairs(self._ai_criminals) do
			ai_alive = true

			if u_data.status ~= "dead" and u_data.status ~= "disabled" then
				ai_disabled = false

				break
			end
		end

		local gameover = false

		if not plrs_alive and not self:is_ai_trade_possible() then
			gameover = true
		elseif plrs_disabled and not ai_alive then
			gameover = true
		elseif plrs_disabled and ai_disabled then
			gameover = true
		end

		gameover = gameover or managers.skirmish:check_gameover_conditions()

		if gameover then
			if not self._gameover_clbk then
				self._gameover_clbk = callback(self, self, "_gameover_clbk_func")

				managers.enemy:add_delayed_clbk("_gameover_clbk", self._gameover_clbk, Application:time() + 25)
			end
		elseif self._gameover_clbk then
			managers.enemy:remove_delayed_clbk("_gameover_clbk")

			self._gameover_clbk = nil
		end

		return gameover
	end
	
end
