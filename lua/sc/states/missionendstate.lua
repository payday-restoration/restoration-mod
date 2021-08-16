function MissionEndState:at_enter(old_state, params)
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
	local spending_kills, spendings = managers.money:on_spend_session_moneythrower()
	self._moneythrower_spending_kills = spending_kills
	self._moneythrower_spendings = spendings	
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
	else
		managers.story:set_last_failed_heist(managers.job:current_job_id())		
	end

	Telemetry:on_end_heist(self._type, total_exp_gained, self._moneythrower_spending_kills)
end

local on_statistics_result_ori = MissionEndState.on_statistics_result

function MissionEndState:on_statistics_result(best_kills_peer_id, best_kills_score, best_special_kills_peer_id, best_special_kills_score, best_accuracy_peer_id, best_accuracy_score, most_downs_peer_id, most_downs_score, total_kills, total_specials_kills, total_head_shots, group_accuracy, group_downs)
	on_statistics_result_ori(self, best_kills_peer_id, best_kills_score, best_special_kills_peer_id, best_special_kills_score, best_accuracy_peer_id, best_accuracy_score, most_downs_peer_id, most_downs_score, total_kills, total_specials_kills, total_head_shots, group_accuracy, group_downs)
	print("on_statistics_result begin")

	if managers.network and managers.network:session() then
		local best_kills_peer = managers.network:session():peer(best_kills_peer_id)
		local best_special_kills_peer = managers.network:session():peer(best_special_kills_peer_id)
		local best_accuracy_peer = managers.network:session():peer(best_accuracy_peer_id)
		local most_downs_peer = managers.network:session():peer(most_downs_peer_id)
		local best_kills = best_kills_peer and best_kills_peer:name() or "N/A"
		local best_special_kills = best_special_kills_peer and best_special_kills_peer:name() or "N/A"
		local best_accuracy = best_accuracy_peer and best_accuracy_peer:name() or "N/A"
		local most_downs = most_downs_peer and most_downs_peer:name() or "N/A"
		local stage_cash_summary_string = nil

		if self._success and managers.job._global.next_interupt_stage then
			local victory_cash_postponed_id = "victory_cash_postponed"

			if tweak_data.levels[managers.job._global.next_interupt_stage].bonus_escape then
				victory_cash_postponed_id = "victory_cash_postponed_bonus"
			end

			stage_cash_summary_string = managers.localization:text(victory_cash_postponed_id)
		elseif self._success then
			local payouts = managers.money:get_payouts()
			local stage_payout = payouts.stage_payout
			local job_payout = payouts.job_payout
			local bag_payout = payouts.bag_payout
			local vehicle_payout = payouts.vehicle_payout
			local small_loot_payout = payouts.small_loot_payout
			local crew_payout = payouts.crew_payout
			local bonus_bags = managers.loot:get_secured_bonus_bags_amount() + managers.loot:get_secured_mandatory_bags_amount()
			local bag_cash = bag_payout
			local vehicle_amount = managers.loot:get_secured_bonus_bags_amount(true) + managers.loot:get_secured_mandatory_bags_amount(true)
			local vehicle_cash = vehicle_payout
			local loose_cash = small_loot_payout or 0
			local cleaner_cost = math.min(managers.money:get_civilian_deduction() * (managers.statistics:session_total_civilian_kills() or 0), managers.money:total() - managers.money:heist_spending())
			local assets_cost =  managers.assets:get_money_spent()

			if job_payout > 0 then
				local job_string = managers.localization:text("victory_stage_cash_summary_name_job", {
					stage_cash = managers.experience:cash_string(stage_payout),
					job_cash = managers.experience:cash_string(job_payout)
				})
				stage_cash_summary_string = job_string
			else
				local stage_string = managers.localization:text("victory_stage_cash_summary_name", {
					stage_cash = managers.experience:cash_string(stage_payout)
				})
				stage_cash_summary_string = stage_string
			end

			if managers.skirmish:is_skirmish() then
				local skirmish_payout = payouts.skirmish_payout
				stage_cash_summary_string = managers.localization:text("victory_stage_cash_summary_name_skirmish", {
					wave = managers.skirmish:current_wave_number(),
					skirmish_cash = managers.experience:cash_string(skirmish_payout)
				})
			end

			if bonus_bags > 0 and bag_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_bags", {
					bag_cash = managers.experience:cash_string(bag_cash),
					bag_amount = bonus_bags,
					bonus_bags = bonus_bags
				})
			end

			if vehicle_amount and vehicle_payout > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_vehicles", {
					vehicle_cash = managers.experience:cash_string(vehicle_cash),
					vehicle_amount = vehicle_amount
				})
			end

			if self._criminals_completed and crew_payout > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_crew", {
					winners = tostring(self._criminals_completed),
					crew_cash = managers.experience:cash_string(crew_payout)
				})
			end

			if loose_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_loose", {
					loose_cash = managers.experience:cash_string(loose_cash)
				})
			end

			stage_cash_summary_string = stage_cash_summary_string .. "\n"

			if cleaner_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_civ_kill", {
					civ_killed_cash = managers.experience:cash_string(cleaner_cost)
				}) .. " "
			end

			if assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_assets", {
					asset_cash = managers.experience:cash_string(assets_cost)
				}) .. " "
			end

			if cleaner_cost > 0 or assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. "\n"
			end

			stage_cash_summary_string = stage_cash_summary_string .. "\n"
			local offshore_string = managers.localization:text("victory_stage_cash_summary_name_offshore", {
				offshore = managers.localization:text("hud_offshore_account"),
				cash = managers.experience:cash_string(managers.money:heist_offshore())
			})
			local spending_string = managers.localization:text("victory_stage_cash_summary_name_spending", {
				cash = "##" .. managers.experience:cash_string(managers.money:heist_spending()) .. "##"
			})
			stage_cash_summary_string = stage_cash_summary_string .. offshore_string .. "\n"
			stage_cash_summary_string = stage_cash_summary_string .. spending_string .. "\n"
		else
			stage_cash_summary_string = managers.localization:text("failed_summary_name")
		end

		self._statistics_data = {
			best_killer = managers.localization:text("victory_best_killer_name", {
				PLAYER_NAME = best_kills,
				SCORE = best_kills_score
			}),
			best_special = managers.localization:text("victory_best_special_name", {
				PLAYER_NAME = best_special_kills,
				SCORE = best_special_kills_score
			}),
			best_accuracy = managers.localization:text("victory_best_accuracy_name", {
				PLAYER_NAME = best_accuracy,
				SCORE = best_accuracy_score
			}),
			most_downs = managers.localization:text("victory_most_downs_name", {
				PLAYER_NAME = most_downs,
				SCORE = most_downs_score
			}),
			total_kills = total_kills,
			total_specials_kills = total_specials_kills,
			total_head_shots = total_head_shots,
			group_hit_accuracy = group_accuracy .. "%",
			group_total_downed = group_downs,
			stage_cash_summary = stage_cash_summary_string,
			moneythrower_spending = self._moneythrower_spendings > 0 and managers.experience:cash_string(self._moneythrower_spendings) or nil
		}
	end

	print("on_statistics_result end")

	local level_id, all_pass, total_kill_pass, total_accuracy_pass, total_headshots_pass, total_downed_pass, level_pass, levels_pass, num_players_pass, diff_pass, one_down_pass, is_dropin_pass, success_pass, killed_by_weapon_category_pass = nil

	for achievement, achievement_data in pairs(tweak_data.achievement.complete_heist_statistics_achievements or {}) do
		level_id = managers.job:has_active_job() and managers.job:current_level_id() or ""
		diff_pass = not achievement_data.difficulty or table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
		one_down_pass = achievement_data.one_down == nil or achievement.one_down == Global.game_settings.one_down
		num_players_pass = not achievement_data.num_players or achievement_data.num_players <= managers.network:session():amount_of_players()
		level_pass = not achievement_data.level_id or achievement_data.level_id == level_id
		levels_pass = not achievement_data.levels or table.contains(achievement_data.levels, level_id)
		total_kill_pass = not achievement_data.total_kills or achievement_data.total_kills <= total_kills
		total_accuracy_pass = not achievement_data.total_accuracy or achievement_data.total_accuracy <= group_accuracy
		total_downed_pass = not achievement_data.total_downs or group_downs <= achievement_data.total_downs
		is_dropin_pass = achievement_data.is_dropin == nil or achievement_data.is_dropin == managers.statistics:is_dropin()
		success_pass = not achievement_data.success or self._success

		if achievement_data.total_headshots then
			if achievement_data.total_headshots.invert then
				total_headshots_pass = total_head_shots <= (achievement_data.total_headshots.amount or 0)
			else
				total_headshots_pass = total_head_shots >= (achievement_data.total_headshots.amount or 0)
			end
		else
			total_headshots_pass = true
		end

		killed_by_weapon_category_pass = true

		if achievement_data.killed_by_weapon_categories then
			for weapon_category, required_kill_count in pairs(achievement_data.killed_by_weapon_categories) do
				local killed_by_weapon_category = managers.statistics:session_killed_by_weapon_category(weapon_category)

				if required_kill_count == 0 then
					killed_by_weapon_category_pass = killed_by_weapon_category == 0
				else
					killed_by_weapon_category_pass = required_kill_count <= killed_by_weapon_category
				end

				if not killed_by_weapon_category_pass then
					break
				end
			end
		end

		all_pass = diff_pass and one_down_pass and num_players_pass and level_pass and levels_pass and total_kill_pass and total_accuracy_pass and total_downed_pass and is_dropin_pass and total_headshots_pass and managers.challenge:check_equipped(achievement_data) and managers.challenge:check_equipped_team(achievement_data) and success_pass and killed_by_weapon_category_pass

		if all_pass and not managers.achievment:award_data(achievement_data) then
			Application:debug("[MissionEndState] complete_heist_achievements:", achievement)
		end
	end
end