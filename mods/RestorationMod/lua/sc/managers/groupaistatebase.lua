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
			summers = true
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
			summers = true
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

end