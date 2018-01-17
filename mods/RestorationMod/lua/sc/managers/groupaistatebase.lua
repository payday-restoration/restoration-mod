if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local sc_group_misc_data = GroupAIStateBase._init_misc_data
	function GroupAIStateBase:_init_misc_data()
		sc_group_misc_data(self)
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
			fbi_vet = true,
			spring = true,
			summers = true,
			ass_sniper = true
		}
	end

	local sc_group_base = GroupAIStateBase.on_simulation_started
	function GroupAIStateBase:on_simulation_started()
		sc_group_base(self)
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
			fbi_vet = true,
			spring = true,
			summers = true,
			ass_sniper = true
		}
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
		self._smoke_grenades = self._smoke_grenades or {}
		if not self._smoke_grenades[id] then
			Application:error("Could not detonate smoke grenade as it was not queued!", id)
			return
		end
		local data = self._smoke_grenades[id]
		if data.flashbang then
			if Network:is_client() then
				return
			end
			local flashbang_unit = "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
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

	function GroupAIStateBase:on_enemy_unregistered(unit)
		if self:is_unit_in_phalanx_minion_data(unit:key()) then
			self:unregister_phalanx_minion(unit:key())
			CopLogicPhalanxMinion:chk_should_breakup()
			CopLogicPhalanxMinion:chk_should_reposition()
		end

		self._police_force = self._police_force - 1
		local u_key = unit:key()

		self:_clear_character_criminal_suspicion_data(u_key)

		if not Network:is_server() then
			return
		end

		local e_data = self._police[u_key]

		if e_data.importance > 0 then
			for c_key, c_data in pairs(self._player_criminals) do
				local imp_keys = c_data.important_enemies

				for i, test_e_key in ipairs(imp_keys) do
					if test_e_key == u_key then
						table.remove(imp_keys, i)
						table.remove(c_data.important_dis, i)

						break
					end
				end
			end
		end

		for crim_key, record in pairs(self._ai_criminals) do
			record.unit:brain():on_cop_neutralized(u_key)
		end

		local unit_type = unit:base()._tweak_table
		local is_special = unit:movement()._tweak_data.is_special_unit
		log("unregistering enemy: " .. unit_type)
		if is_special then
			log("is special: " .. is_special)
		end
		
		if self._special_unit_types[unit_type] or is_special then
			if is_special then
				self:unregister_special_unit(u_key, is_special)
			else
				self:unregister_special_unit(u_key, unit_type)
			end
		end

		local dead = unit:character_damage():dead()

		if e_data.group then
			self:_remove_group_member(e_data.group, u_key, dead)
		end

		if e_data.assigned_area and dead then
			local spawn_point = unit:unit_data().mission_element

			if spawn_point then
				local spawn_pos = spawn_point:value("position")
				local u_pos = e_data.m_pos

				if mvector3.distance(spawn_pos, u_pos) < 700 and math.abs(spawn_pos.z - u_pos.z) < 300 then
					local found = nil

					for area_id, area_data in pairs(self._area_data) do
						local area_spawn_points = area_data.spawn_points

						if area_spawn_points then
							for _, sp_data in ipairs(area_spawn_points) do
								if sp_data.spawn_point == spawn_point then
									found = true
									sp_data.delay_t = math.max(sp_data.delay_t, self._t + math.random(30, 60))

									break
								end
							end

							if found then
								break
							end
						end

						local area_spawn_points = area_data.spawn_groups

						if area_spawn_points then
							for _, sp_data in ipairs(area_spawn_points) do
								if sp_data.spawn_point == spawn_point then
									found = true
									sp_data.delay_t = math.max(sp_data.delay_t, self._t + math.random(30, 60))

									break
								end
							end

							if found then
								break
							end
						end
					end
				end
			end
		end
	end

	-- Lines: 1450 to 1465
	function GroupAIStateBase:on_enemy_registered(unit)
		if self._anticipated_police_force > 0 then
			self._anticipated_police_force = self._anticipated_police_force - 1
		else
			self._police_force = self._police_force + 1
		end

		local unit_type = unit:base()._tweak_table
		local is_special = unit:movement()._tweak_data.is_special_unit
		log("registering enemy: " .. unit_type)
		if is_special then
			log("is special: " .. is_special)
		end
		if self._special_unit_types[unit_type] or is_special then
			if is_special then
				self:register_special_unit(unit:key(), is_special)
			else
				self:register_special_unit(unit:key(), unit_type)
			end
		end

		if Network:is_client() then
			unit:movement():set_team(self._teams[tweak_data.levels:get_default_team_ID(unit:base():char_tweak().access == "gangster" and "gangster" or "combatant")])
		end
	end

	function GroupAIStateBase:chk_say_enemy_chatter(unit, unit_pos, chatter_type)
		if unit:sound():speaking(self._t) then
			return
		end

		local chatter_tweak = tweak_data.group_ai.enemy_chatter[chatter_type]
		local chatter_type_hist = self._enemy_chatter[chatter_type]

		if not chatter_type_hist then
			chatter_type_hist = {
				cooldown_t = 0,
				events = {}
			}
			self._enemy_chatter[chatter_type] = chatter_type_hist
		end

		local t = self._t

		if t < chatter_type_hist.cooldown_t then
			return
		end

		local nr_events_in_area = 0

		for i_event, event_data in pairs(chatter_type_hist.events) do
			if event_data.expire_t < t then
				chatter_type_hist[i_event] = nil
			elseif mvector3.distance(unit_pos, event_data.epicenter) < chatter_tweak.radius then
				if nr_events_in_area == chatter_tweak.max_nr - 1 then
					return
				else
					nr_events_in_area = nr_events_in_area + 1
				end
			end
		end

		local group_requirement = chatter_tweak.group_min

		if group_requirement and group_requirement > 1 then
			local u_data = self._police[unit:key()]
			local nr_in_group = 1

			if u_data.group then
				nr_in_group = u_data.group.size
			end

			if nr_in_group < group_requirement then
				return
			end
		end

		chatter_type_hist.cooldown_t = t + math.lerp(chatter_tweak.interval[1], chatter_tweak.interval[2], math.random())
		local new_event = {
			epicenter = mvector3.copy(unit_pos),
			expire_t = t + math.lerp(chatter_tweak.duration[1], chatter_tweak.duration[2], math.random())
		}

		table.insert(chatter_type_hist.events, new_event)
		unit:sound():say(chatter_tweak.queue, true)

		return true
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
					log("its loud")
					alert_rad_sq = 1500 * 1500
				else
					log("it's stealth")
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

	
end