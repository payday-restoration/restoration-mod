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