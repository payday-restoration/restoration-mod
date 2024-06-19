-- Reset secured bags on mission start (vanilla doesn't clear this so it displays wrong in the HUD)
Hooks:PreHook(CrimeSpreeManager, "on_mission_started", "sh_on_mission_started", function (self)
	if self:is_active() then
		Global.loot_manager.secured = {}
	end
end)


-- Make secured bags add crime spree levels and fix incorrect level gain
-- Unfortunately a function override is pretty much the only thing we can do here
Hooks:OverrideFunction(CrimeSpreeManager, "on_mission_completed", function (self, mission_id)
	if not self:is_active() then
		return
	end

	managers.mission:clear_job_values()

	if not self:has_failed() then
		local mission_data = self:get_mission(mission_id)
		self._mission_completion_gain = mission_data.add

		local spree_add = mission_data.add + math.min(managers.loot:get_secured_bags_amount(), 10)
		local spree_level = self:spree_level()
		local server_spree_level = self:server_spree_level()

		if not self:_is_host() then
			self:set_peer_spree_level(1, server_spree_level + spree_add)

			if spree_level > server_spree_level then
				local diff = spree_level - server_spree_level
				spree_add = spree_add - diff
			elseif spree_level < server_spree_level and managers.experience:current_level() >= tweak_data.crime_spree.catchup_min_level then
				local diff = server_spree_level - spree_level
				self._catchup_bonus = math.min(tweak_data.crime_spree.catchup_limit, math.ceil(diff * tweak_data.crime_spree.catchup_bonus))
				spree_add = spree_add + self._catchup_bonus
			end
		end

		spree_add = math.max(math.floor(spree_add), 0)
		self._spree_add = spree_add
		local reward_add = spree_add

		if spree_level <= server_spree_level then
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
end)

function CrimeSpreeManager:get_mission(mission_id)
	mission_id = mission_id or self:current_mission()
	for category, tbl in pairs(tweak_data.crime_spree.missions) do
		for idx, data in pairs(tbl) do
			if data.id == mission_id then
				return data
			end
		end
	end

	--if we've gotten to this point, it means the game has checked every level in the tweak_data table and our mission still hasn't come up
	--this means that we have an invalid mission. if we leave this in, the game will crash.
	--to prevent this, throw out the old set of missions and generate a new set.
	self:generate_new_mission_set()
end

function CrimeSpreeManager:_setup_global_from_mission_id(mission_id)
	local mission_data = self:get_mission(mission_id)
	if mission_data then
		local crime_spree_level = self:server_spree_level() or 0
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
	end
end

--Attempt #1 at adding start level offset to crime spree modifiers.
function CrimeSpreeManager:modifiers_to_select(table_name, add_repeating)
	local modifiers_table = tweak_data.crime_spree.modifiers[table_name]
	local base_number = math.floor((self:server_spree_level() - tweak_data.crime_spree.start_levels[table_name]) / tweak_data.crime_spree.modifier_levels[table_name])
	local active_number = 0

	if not add_repeating then
		base_number = math.min(base_number, #modifiers_table)
	else
		base_number = base_number * #tweak_data.crime_spree.modifiers[table_name]
	end

	for _, modifier_data in ipairs(self:server_active_modifiers()) do
		local contains = false

		for _, modifier in ipairs(modifiers_table) do
			if modifier.id == modifier_data.id then
				contains = true

				break
			end
		end

		if contains then
			active_number = active_number + 1
		else
			local repeating, tbl = self:is_repeating_modifier(modifier_data.id)

			if repeating and tbl == table_name then
				active_number = active_number + 1
			end
		end
	end

	return math.floor(math.max(base_number - active_number, 0))
end

--starting level fix
function CrimeSpreeManager:start_crime_spree(starting_level)
	print("CrimeSpreeManager:start_crime_spree")

	if not self:can_start_spree(starting_level) then
		return false
	end

	local cost = self:get_start_cost(starting_level)

	managers.custom_safehouse:deduct_coins(cost, TelemetryConst.economy_origin.start_crime_spree)
	self:reset_crime_spree()

	self._global.in_progress = true
	self._global.spree_level = starting_level or 0
	--set winning streak to proper value after self:reset_crime_spree() has been called
	self._global.winning_streak = ((starting_level * tweak_data.crime_spree.winning_streak) + 1) or 0

	self:generate_new_mission_set()

	return true
end