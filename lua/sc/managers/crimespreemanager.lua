function CrimeSpreeManager:_setup_global_from_mission_id(mission_id)
	local mission_data = self:get_mission(mission_id)
	if mission_data then
		--get cs level
		local crime_spree_level = 0
		if Network:is_server() or Global.game_settings.single_player then
			crime_spree_level = managers.crime_spree:spree_level()
		else
			crime_spree_level = managers.crime_spree:get_peer_spree_level(1)
		end
		--dynamic difficulty based on cs level
		if crime_spree_level > 299 then
			Global.game_settings.difficulty = "sm_wish"
		elseif crime_spree_level > 199 then
			Global.game_settings.difficulty = "overkill_290"
		elseif crime_spree_level > 99 then
			Global.game_settings.difficulty = "easy_wish"
		else
			Global.game_settings.difficulty = "overkill_145"
		end
		
		if crime_spree_level > 399 then
			Global.game_settings.one_down = true
		else
			Global.game_settings.one_down = false
		end
		Global.game_settings.level_id = mission_data.level.level_id
		Global.game_settings.mission = mission_data.mission or "none"
		Global.game_settings.incsmission = true
	end
end

--thanks fug. now someone please kill me for having to set up this stupid global (why isn't there one in base game??)
function CrimeSpreeManager:on_mission_started(mission_id)
	if not self:is_active() then
		return
	end

	self._global.start_data = {
		mission_id = mission_id,
		spree_level = self:spree_level(),
		server_spree_level = self:server_spree_level(),
		reward_level = self:reward_level()
	}
	self._global.refund_allowed = false
	
	Global.game_settings.incsmission = true
	
	MenuCallbackHandler:save_progress()
end

function CrimeSpreeManager:on_mission_failed(mission_id)
	if not self:is_active() then
		return
	end
	
	Global.game_settings.incsmission = nil

	self:_on_mission_failed(mission_id)
end

function CrimeSpreeManager:on_spree_complete()
	if not self:in_progress() then
		return
	end

	local rewards = self:calculate_rewards()

	managers.custom_safehouse:update_previous_coins()
	self:award_rewards(rewards)
	self:_check_highest_level(self:spree_level() or 0)

	self._global.in_progress = false
	
	Global.game_settings.incsmission = nil

	MenuCallbackHandler:save_progress()
end

function CrimeSpreeManager:on_mission_completed(mission_id)
	if not self:is_active() then
		return
	end
	
	Global.game_settings.incsmission = false
	managers.mission:clear_job_values()

	if not self:has_failed() then
		local mission_data = self:get_mission(mission_id)
		local spree_add = mission_data.add
		self._mission_completion_gain = mission_data.add

		if not self:_is_host() and self._global.start_data and self._global.start_data.server_spree_level then
			local server_level = self._global.start_data and self._global.start_data.server_spree_level or -1

			if server_level < 0 then
				server_level = self:server_spree_level()
			end

			self:set_peer_spree_level(1, server_level + spree_add)
		end

		if not self:_is_host() and self:spree_level() < self:server_spree_level() then
			local diff = self:server_spree_level() - self:spree_level()
			self._catchup_bonus = math.floor(diff * tweak_data.crime_spree.catchup_bonus)
			spree_add = spree_add + self._catchup_bonus
		end

		if not self:_is_host() and self:server_spree_level() < self:spree_level() then
			local diff = self:spree_level() - self:server_spree_level()
			spree_add = spree_add - diff
		end

		spree_add = math.max(math.floor(spree_add), 0)
		self._spree_add = spree_add
		local reward_add = spree_add

		if self:spree_level() <= self:server_spree_level() then
			self._global.winning_streak = (self._global.winning_streak or 1) + spree_add * tweak_data.crime_spree.winning_streak

			if self._global.winning_streak < 1 then
				self._global.winning_streak = self._global.winning_streak + 1
			end

			local pre_winning = reward_add
			reward_add = reward_add * self._global.winning_streak
			self._winning_streak = reward_add - pre_winning
		end

		reward_add = math.max(math.floor(reward_add), 0)

		if self:in_progress() then
			self._global.spree_level = self._global.spree_level + spree_add

			self:_check_highest_level(self._global.spree_level or 0)
		end

		self._global.reward_level = self._global.reward_level + reward_add
		self._global.unshown_rewards = self._global.unshown_rewards or {}

		for _, reward in ipairs(tweak_data.crime_spree.rewards) do
			self._global.unshown_rewards[reward.id] = (self._global.unshown_rewards[reward.id] or 0) + reward_add * reward.amount
		end
	end

	self._global.current_mission = nil
	self._global._start_data = self._global.start_data
	self._global.start_data = nil
	self._global.randomization_cost = false

	self:generate_new_mission_set()
	self:check_achievements()
	MenuCallbackHandler:save_progress()

	if Network:is_server() then
		MenuCallbackHandler:update_matchmake_attributes()
	end
end