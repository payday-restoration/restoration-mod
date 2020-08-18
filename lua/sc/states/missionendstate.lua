local at_enter_ori = MissionEndState.at_enter
function MissionEndState:at_enter(old_state, params)
	at_enter_ori(self, old_state, params)
	managers.environment_effects:stop_all()

	local is_safe_house = managers.job:current_job_data() and managers.job:current_job_id() == "safehouse"

	managers.platform:set_presence("Mission_end")

	if not is_safe_house then
		local rp_state = nil

		if table.contains({
			"victoryscreen",
			"gameoverscreen"
		}, self:name()) then
			if Global.game_settings.single_player then
				rp_state = "SPEnd"
			else
				rp_state = "MPEnd"
			end
		else
			rp_state = "Idle"
		end

		managers.platform:set_rich_presence(rp_state)
	end

	managers.platform:set_playing(false)
	managers.hud:remove_updator("point_of_no_return")
	managers.hud:hide_stats_screen()

	local job_tweak = tweak_data.levels[managers.job:current_job_id()]
	local is_safehouse_combat = job_tweak and job_tweak.is_safehouse_combat
	self._continue_block_timer = Application:time() + 1.5

	if Network:is_server() and not is_safehouse_combat then
		managers.network.matchmake:set_server_joinable(false)

		if self._success then
			for peer_id, data in pairs(managers.player:get_all_synced_carry()) do
				if not tweak_data.carry[data.carry_id].skip_exit_secure then
					managers.loot:secure(data.carry_id, data.multiplier)
				end

				if data.carry_id == "sandwich" then
					managers.mission:call_global_event("equipment_sandwich")
				end
			end

			for _, team_ai in pairs(managers.groupai:state():all_AI_criminals()) do
				local carry_data = team_ai and team_ai.unit and team_ai.unit:movement() and team_ai.unit:movement():carry_data()

				if carry_data then
					if not tweak_data.carry[carry_data:carry_id()].skip_exit_secure then
						managers.loot:secure(carry_data:carry_id(), carry_data:multiplier())
					end

					if carry_data:carry_id() == "sandwich" then
						managers.mission:call_global_event("equipment_sandwich")
					end
				end
			end
		end

		managers.criminals:save_current_character_names()
	end

	if not self._server_left and not self._kicked then
		if self._success then
			managers.crime_spree:on_mission_completed(managers.crime_spree:current_mission())
		else
			managers.crime_spree:on_mission_failed(managers.crime_spree:current_mission())
		end
	end

	local player = managers.player:player_unit()

	if player then
		player:camera():remove_sound_listener()
		player:camera():play_redirect(Idstring("idle"))
		player:character_damage():disable_berserker()

		if _G.IS_VR then
			player:character_damage():stop_vr_heartbeat()
		end
	end

	managers.job:stop_sounds()
	managers.dialog:quit_dialog()
	Application:debug("1 second to managers.mission:pre_destroy()")

	self._mission_destroy_t = Application:time() + 1

	if not self._success then
		managers.job:set_stage_success(false)
	end

	if self._success then
		print("MissionEndState:at_enter", managers.job:on_last_stage())
		managers.job:set_stage_success(true)

		if managers.job:on_last_stage() then
			managers.mission:call_global_event(Message.OnHeistComplete, managers.job:current_job_id(), Global.game_settings.difficulty)
		end

		if self._type == "victory" then
			managers.money:on_mission_completed(params.num_winners)
		end
	end

	managers.mission:call_global_event(Message.OnMissionEnd, self._success, self._type, managers.job:current_level_id(), Global.game_settings.difficulty)

	if SystemInfo:platform() == Idstring("WIN32") and managers.network.account:has_alienware() then
		LightFX:set_lamps(0, 255, 0, 255)
	end

	self._completion_bonus_done = self._completion_bonus_done or false

	self:setup_controller()

	if not self._setup then
		self._setup = true

		managers.hud:load_hud(self.GUI_ENDSCREEN, false, true, false, {}, nil, nil, true)
		managers.menu:open_menu("mission_end_menu", 1)

		self._mission_end_menu = managers.menu:get_menu("mission_end_menu")
	end

	self._old_state = old_state

	managers.menu_component:set_max_lines_game_chat(7)
	managers.hud:set_success_endscreen_hud(self._success, self._server_left)
	managers.hud:show_endscreen_hud()
	self:chk_complete_heist_achievements()
	managers.groupai:state():set_AI_enabled(false)

	local player = managers.player:player_unit()

	if player then
		player:sound():stop()
		player:character_damage():set_invulnerable(true)
		player:character_damage():stop_heartbeat()
		player:base():set_stats_screen_visible(false)

		if player:movement():current_state():shooting() then
			player:movement():current_state()._equipped_unit:base():stop_shooting()
		end

		if player:movement():tased() then
			player:sound():play("tasered_stop")
		end

		if player:movement():current_state()._interupt_action_interact then
			player:movement():current_state():_interupt_action_interact()
		end
	end

	self._sound_listener = SoundDevice:create_listener("lobby_menu")

	self._sound_listener:set_position(Vector3(0, -50000, 0))
	self._sound_listener:activate(true)

	local total_killed = managers.statistics:session_total_killed()
	self._criminals_completed = self._success and params.num_winners or 0

	managers.statistics:stop_session({
		success = self._success,
		type = self._type
	})
	managers.statistics:send_statistics()
	managers.hud:set_statistics_endscreen_hud(self._criminals_completed, self._success)

	if managers.statistics:started_session_from_beginning() then
		managers.achievment:check_complete_heist_stats_achivements()
	end

	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]

	if not self._success and level_data and level_data.failure_music then
		managers.music:stop_listen_all()
		managers.menu:post_event(level_data.failure_music)
	else
		managers.music:stop_listen_all()
		managers.music:post_event(self._success and managers.music:jukebox_menu_track("heistresult") or managers.music:jukebox_menu_track("heistlost"))
	end

	managers.enemy:add_delayed_clbk("play_finishing_sound", callback(self, self, "play_finishing_sound", self._success), Application:time() + 2)

	local ghost_bonus = 0
	local total_exp_gained = 0

	if self._type == "victory" or self._type == "gameover" then
		local total_xp_bonus, bonuses = self:_get_xp_dissected(self._success, params and params.num_winners, params and params.personal_win)
		self._bonuses = bonuses

		self:completion_bonus_done(total_xp_bonus)
		managers.job:clear_saved_ghost_bonus()
		managers.experience:mission_xp_process(self._success, managers.job:on_last_stage())

		ghost_bonus = managers.job:accumulate_ghost_bonus(ghost_bonus)
		total_exp_gained = total_xp_bonus
	end

	local is_xb1 = SystemInfo:platform() == Idstring("XB1")

	if self._success then
		local gage_assignment_state = managers.gage_assignment:on_mission_completed()
		local hud_ghost_bonus = 0

		if managers.job:on_last_stage() then
			managers.job:check_add_heat_to_jobs()
			managers.job:activate_accumulated_ghost_bonus()

			hud_ghost_bonus = managers.job:get_saved_ghost_bonus()

			if is_xb1 and not is_safe_house then
				XboxLive:write_hero_stat("heists", 1)
			end
		else
			hud_ghost_bonus = ghost_bonus
		end

		managers.hud:set_special_packages_endscreen_hud({
			ghost_bonus = hud_ghost_bonus,
			gage_assignment = gage_assignment_state,
			challenge_completed = managers.challenge:any_challenge_completed(),
			tango_mission_completed = managers.tango:any_challenge_completed()
		})
	end

	if is_xb1 then
		XboxLive:write_hero_stat("kills", total_killed.count)
		XboxLive:write_hero_stat("time", managers.statistics:get_session_time_seconds())
	end

	if Network:is_server() then
		managers.network:session():set_state("game_end")
	end

	managers.music:on_mission_end()

	if self._success then
		managers.preplanning:reset_rebuy_assets()
	end

	Telemetry:on_end_heist(self._type, total_exp_gained)
end