local math_min = math.min
local math_lerp = math.lerp
local math_map_range = math.map_range
local math_random = math.random
local table_insert = table.insert
local table_remove = table.remove
local mvec_add = mvector3.add
local mvec_cpy = mvector3.copy
local mvec_dis = mvector3.distance
local mvec_dis_sq = mvector3.distance_sq
local mvec_mul = mvector3.multiply
local mvec_set = mvector3.set
local mvec_set_l = mvector3.set_length
local mvec_set_z = mvector3.set_z
local mvec_sub = mvector3.subtract
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

Hooks:PreHook(GroupAIStateBesiege, "_set_objective_to_enemy_group", "RR_set_objective_to_enemy_group", function(self, group, grp_objective)
	if grp_objective.type == "recon_area" then -- new objective is recon_area
		local target_area = grp_objective.target_area or grp_objective.area
		grp_objective.chatter_type = target_area and (target_area.loot and "sabotagebags" or target_area.hostages and "sabotagehostages")
	elseif group.objective.type == "assault_area" and grp_objective.type == "retire" then -- current objective is assault_area and new objective is retire
		local _, group_leader_u_data = self._determine_group_leader(group.units)
		if group_leader_u_data and group_leader_u_data.char_tweak.chatter.retreat then
			self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "retreat") -- declare our retreat if we were assaulting but now retiring
		end
	end
end)

function GroupAIStateBesiege:chk_has_civilian_hostages()
	return self._hostage_headcount - self._police_hostage_headcount > 0
end

function GroupAIStateBesiege:chk_had_hostages()
	return self._had_hostages
end

function GroupAIStateBesiege:chk_assault_active_atm()
	local assault_task = self._task_data.assault
	return assault_task and (assault_task.phase == "build" or assault_task.phase == "sustain")
end

function GroupAIStateBesiege:chk_heat_bonus_retreat()
	local assault_task = self._task_data.assault
	return assault_task and (assault_task.phase == "build" or assault_task.phase == "sustain") and self._activeassaultbreak
end
	
-- Assault/Rescue team going in lines
function GroupAIStateBesiege:_voice_groupentry(group, recon)
	local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
	if group_leader_u_data and group_leader_u_data.char_tweak.chatter.entry then
		self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, (recon and "hrt" or "cs") .. math_random(1, 4))
	end
end

--Ensured PONR flag is set to nil.
Hooks:PostHook(GroupAIStateBesiege, "init", "ResInit", function(self, group_ai_state)
	self._ponr_is_on = nil

	--Sets functions that determine chatter for spawn group leaders to say upon spawning.
	--self:_init_group_entry_lines()
	--self:set_debug_draw_state(true) --Uncomment to debug AI stuff.
end)


-- Increase simultaneous spawn limit (this is just an upper bound, usually less enemies are spawned per group spawn update)
--GroupAIStateBesiege._MAX_SIMULTANEOUS_SPAWNS = 5

--Implements cooldowns and hard-diff filters for specific spawn groups, by prefiltering them before actually choosing the best groups.
local group_timestamps = {}
local _choose_best_groups_actual = GroupAIStateBesiege._choose_best_groups
function GroupAIStateBesiege:_choose_best_groups(best_groups, group, group_types, allowed_groups, weight, ...)
	local new_allowed_groups = {} --Replacement table for _choose_best_groups_actual.
	local currenttime = self._t
	local sustain = self._task_data.assault and self._task_data.assault.phase == "sustain"
	local constraints_tweak = self._tweak_data.group_constraints

	--Check each spawn group and see if it meets filter.
	for group_type, cat_weights in pairs(allowed_groups) do
		--Get spawn group constraints.
		local constraints = constraints_tweak[group_type]
		local valid = true

		--If group had constraints tied to it, then check for them.
		if constraints then
			local cooldown = constraints.cooldown
			local previoustimestamp = group_timestamps[group_type]
			if cooldown and previoustimestamp and (currenttime - previoustimestamp) < cooldown then
				valid = nil
			end

			local min_diff = constraints.min_diff
			local max_diff = constraints.max_diff
			if (min_diff and self._difficulty_value <= min_diff) or (max_diff and self._difficulty_value >= max_diff) then
				valid = nil
			end

			local sustain_only = constraints.sustain_only
			if sustain_only and sustain == false then
				valid = nil
			end
		end

		--If all constraints are met, add it to the replacement table. Otherwise, ignore it.
		if valid then
			new_allowed_groups[group_type] = cat_weights
		end
	end

	-- Call the original function with the replacement spawngroup table.
	return _choose_best_groups_actual(self, best_groups, group, group_types, new_allowed_groups, weight, ...)
end

--[[
-- Cache for normal spawngroups to avoid losing them when they're overwritten.
-- Once a captain is spawned in, this gets reset back to nil.
local cached_spawn_groups = nil
-- Hard forces the next spawn group type by temporarily replacing the assault.groups table.
-- When the group is spawned, the assault.groups table is reverted to cached_spawn_groups.
-- Used by skirmish to force captain spawns.
function GroupAIStateBesiege:force_spawn_group_hard(spawn_group)
	-- Ignore previous force attempt if ones overlap.
	-- Might change to using a LIFO queue if we need support for multiple nearby calls at some point.
	if cached_spawn_groups then
		self._tweak_data.assault.groups = cached_spawn_groups
		cached_spawn_groups = nil
	end

	--Create new forced spawngroup.
	local new_spawn_groups = nil
	if managers.skirmish:is_skirmish() then --Handle Skirmish's custom diff curve.
		new_spawn_groups = { [spawn_group] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1} }
	else
		new_spawn_groups = { [spawn_group] = {1, 1, 1} }
	end

	--Cache old spawn groups, and apply new forced spawn group table.
	cached_spawn_groups = self._tweak_data.assault.groups
	self._tweak_data.assault.groups = new_spawn_groups
end
]]--

--Refactored from vanilla code to be a bit easier to read and debug. Also adds timestamp support.
local debug_spawn_groups = true
--Should stick these in a global table somewhere since I constantly paste them in for debugging purposes.
	local function value_of(v, k, indent, seen)
		indent = indent and indent .. "    " or ""
		seen = seen or {}
		k = k or "[Unknown]"

		local type = type(v)
		if type == "table" then
			log(indent .. tostring(k) .. " = {")
			value_of_table(v, k, indent, seen)
			log(indent .. "}")
		elseif type == "userdata" then
			local v_table = getmetatable(v) or {}

			log(indent .. tostring(k) .. " = " .. tostring(v) .. " | type = " .. type .. " {")
			value_of_table(v_table, k, indent, seen)
			log(indent .. "}")
		else
			log(indent .. tostring(k) .. " = " .. tostring(v) .. " | type = " .. type)
		end
	end

	local function value_of_table(t, name, indent, seen)
		indent = indent and indent .. "    " or ""
		seen = seen or {}
		name = name or "[Unknown]"

		if seen[t] then
			log(indent .. "REFERENCE TO " .. seen[t])
			return
		end

		seen[t] = tostring(name)
		for k, v in pairs(t) do
			value_of(v, k, indent, seen)
		end
	end

function GroupAIStateBesiege:_spawn_in_group(spawn_group, spawn_group_type, grp_objective, ai_task)
	local spawn_group_desc = tweak_data.group_ai.enemy_spawn_groups[spawn_group_type]
	local wanted_nr_units = nil
	local nr_units = 0

	--Determine number of units to spawn.
	if type(spawn_group_desc.amount) == "number" then
		wanted_nr_units = spawn_group_desc.amount
	else
		wanted_nr_units = math.random(spawn_group_desc.amount[1], spawn_group_desc.amount[2])
	end

	local unit_types = spawn_group_desc.spawn --All units in spawn group.
	local valid_unit_types = {} --All units in the spawn group that are able to spawn.
	local remaining_special_pools = {} --Tracks remaining room in special spawn caps.
	local unit_categories = tweak_data.group_ai.unit_categories
	local total_wgt = 0 --Freqs of all valid unit types all added together.

	--Determine which unit types in spawn group are valid. Delay spawns if required units are above cap.
	for i = 1, #unit_types do
		local spawn_entry = unit_types[i]
		if not spawn_entry.unit then
			log("ERROR IN GROUP: " .. spawn_group_type .. " no unit defined in index " .. tostring(i))
			return
		end

		if not spawn_entry.freq then
			log("ERROR IN GROUP: " .. spawn_group_type .. " no freq defined for unit " .. spawn_entry.unit)
			return
		end

		if spawn_entry.amount_min and spawn_entry.amount_max and spawn_entry.amount_min > spawn_entry.amount_max then
			log("WARNING IN GROUP: " .. spawn_group_type .. " amount_max is smaller than amount_min for " .. spawn_entry.unit)
		end

		local cat_data = unit_categories[spawn_entry.unit]
		if not cat_data then
			log("ERROR IN GROUP: " .. spawn_group_type .. " contains fictional made up imaginary good-for-nothing unit " .. spawn_entry.unit)
			return
		end

		if cat_data.special_type then --Determine if special unit is valid, or if spawning needs to be delayed.
			--Units marked with "ignore_spawn_cap" get an effectively uncapped special pool.
			remaining_special_pools[cat_data.special_type] = cat_data.ignore_spawn_cap and 100 or managers.job:current_spawn_limit(cat_data.special_type) - self:_get_special_unit_type_count(cat_data.special_type)
			if remaining_special_pools[cat_data.special_type] < (spawn_entry.amount_min or 0) then --If essential spawn would go above cap, then delay spawn group and return.
				spawn_group.delay_t = self._t + 10
				return
			end
			
			if remaining_special_pools[cat_data.special_type] > 0 then --If special unit doesn't go above cap, then add to valid table.
				table.insert(valid_unit_types, spawn_entry)
				total_wgt = total_wgt + spawn_entry.freq
			end
		else --Unit not special, add it to valid table.
			table.insert(valid_unit_types, spawn_entry)
			total_wgt = total_wgt + spawn_entry.freq
		end
	end
	
	--Forced groups (mostly captains) spawn instantly.
	if not spawn_group_desc.force then
		for _, sp_data in ipairs(spawn_group.spawn_pts) do
			sp_data.delay_t = self._t + math.rand(0.5)
		end
	end

	local spawn_task = {
		objective = not grp_objective.element and self._create_objective_from_group_objective(grp_objective),
		units_remaining = {},
		spawn_group = spawn_group,
		force = spawn_group_desc.force,
		spawn_group_type = spawn_group_type,
		ai_task = ai_task
	}
	
	table.insert(self._spawning_groups, spawn_task)

	--Adds as many as needed to meet requirements. Removes any valid units it turns invalid.
	local function _add_unit_type_to_spawn_task(i, spawn_entry)
		local unit_invalidated = false
		local prev_amount = nil --Previous number of these guys in the spawn task.
		local new_amount = nil --New number of these guys in the spawn task.
		if not spawn_task.units_remaining[spawn_entry.unit] then --If unit isn't part of spawn task yet, add the minimum amount to start.
			prev_amount = 0
			new_amount = spawn_entry.amount_min or 1
		else --Otherwise just add 1.
			prev_amount = spawn_task.units_remaining[spawn_entry.unit].amount
			new_amount = 1 + prev_amount
		end
		local amount_increase = new_amount - prev_amount --Amount the number of this unit would increase.

		if spawn_entry.amount_max and new_amount >= spawn_entry.amount_max then --Max unit count reached, removing unit from valid units for future spawns.
			table.remove(valid_unit_types, i)
			total_wgt = total_wgt - spawn_entry.freq
			unit_invalidated = true
		end

		--Update special unit spawn caps.
		local cat_data = unit_categories[spawn_entry.unit]
		if cat_data.special_type then
			if remaining_special_pools[cat_data.special_type] >= amount_increase then
				remaining_special_pools[cat_data.special_type] = remaining_special_pools[cat_data.special_type] - amount_increase
				if remaining_special_pools[cat_data.special_type] == 0 and not unit_invalidated then --Special spawn cap reached, removing unit from valid units for future spawns.
					table.remove(valid_unit_types, i)
					total_wgt = total_wgt - spawn_entry.freq
					unit_invalidated = true
				end
			end
		end

		--Add unit to spawn task.
		spawn_task.units_remaining[spawn_entry.unit] = {
			amount = new_amount,
			spawn_entry = spawn_entry
		}
		nr_units = nr_units + amount_increase

		return unit_invalidated
	end

	--Add required units to spawn group.
	local i = 1
	local req_entry = valid_unit_types[i]
	while req_entry do --Array size changes, so iteration finishes when the current entry is nil.
		if wanted_nr_units > nr_units and req_entry.amount_min and req_entry.amount_min > 0 then
			if _add_unit_type_to_spawn_task(i, req_entry) then --Don't increment to next value if a unit was invalidated.
				i = i + 1
			end
		else
			i = i + 1
		end

		req_entry = valid_unit_types[i]
	end

	--Spawn random units.
	while wanted_nr_units > nr_units and total_wgt > 0 do
		local rand_wgt = math.random() * total_wgt
		local rand_i = 1
		local rand_entry = valid_unit_types[rand_i]

		--Loop until the unit corresponding to rand_wgt is found.
		while true do
			rand_wgt = rand_wgt - rand_entry.freq

			if rand_wgt <= 0 then
				break --Random unit entry found!
			else
				rand_i = rand_i + 1 --Move onto next unit entry.
				if not valid_unit_types[rand_i] then
					log("spawn_in_group attempted to spawn in an invalid unit!")
					log("rand_i: " .. tostring(rand_i))
					log("rand_wgt: " .. tostring(rand_wgt))
					log("total_wgt: " .. tostring(total_wgt))
					value_of_table(valid_unit_types, "valid_unit_types")
					managers.chat:send_message(ChatManager.GAME, "", "A REALLY RARE BUG HAS OCCURED.")
					managers.chat:send_message(ChatManager.GAME, "", "SEND RAVICALE#7594 YOUR MOD LOG FILE ON DISCORD.")
					break
				end
				rand_entry = valid_unit_types[rand_i]
			end
		end

		_add_unit_type_to_spawn_task(rand_i, rand_entry) --Add our random boi.
	end

	--Create group object and finalize.
	local group_desc = {
		size = nr_units,
		type = spawn_group_type
	}
	local group = self:_create_group(group_desc)
	
	group.objective = grp_objective
	group.objective.moving_out = true
	group.team = self._teams[spawn_group.team_id or tweak_data.levels:get_default_team_ID("combatant")]
	spawn_task.group = group
	group_timestamps[spawn_group_type] = self._t --Set timestamp for whatever spawngroup was just spawned in to allow for cooldown tracking.

	if debug_spawn_groups then
		log("Spawning group: " .. spawn_group_type)
		for name, spawn_info in pairs(spawn_task.units_remaining) do
			log("     " .. name .. "x" .. tostring(spawn_info.amount))
		end
	end

	return group
end

-- Make hostage count affect hesitation delay
local _begin_assault_task_original = GroupAIStateBesiege._begin_assault_task
function GroupAIStateBesiege:_begin_assault_task(...)
	self._task_data.assault.was_first = self._task_data.assault.is_first

	_begin_assault_task_original(self, ...)
	
	self._task_data.assault.force = math.ceil(self:_get_difficulty_dependent_value(self._tweak_data.assault.force) * self:_get_balancing_multiplier(self._tweak_data.assault.force_balance_mul) * restoration.global_spawn_multiplier)

	if self._hostage_headcount > 0 then
		local assault_task = self._task_data.assault
		local anticipation_duration = self:_get_anticipation_duration(self._tweak_data.assault.anticipation_duration, assault_task.was_first)
		local hesitation_delay = self:_get_difficulty_dependent_value(self._tweak_data.assault.hostage_hesitation_delay)
		local hostage_multiplier = math.clamp(self._hostage_headcount, 1, 4)
		assault_task.phase_end_t = self._t + anticipation_duration + hesitation_delay * hostage_multiplier
		assault_task.is_hesitating = true
		assault_task.voice_delay = self._t + (assault_task.phase_end_t - self._t) / 2

		self:_post_megaphone_event("mga_hostage_assault_delay")
	end
end


-- Fix reenforce group delay
local _begin_reenforce_task_original = GroupAIStateBesiege._begin_reenforce_task
function GroupAIStateBesiege:_begin_reenforce_task(...)
	local next_dispatch_t = self._task_data.reenforce.next_dispatch_t or 0

	_begin_reenforce_task_original(self, ...)

	self._task_data.reenforce.next_dispatch_t = next_dispatch_t
end


-- Improve ending condition for assault fade
-- The hardcoded amount of minimum enemies left was way too high and would lead to fade being instantly over after its minimum duration
function GroupAIStateBesiege:_upd_assault_task()
	local task_data = self._task_data.assault

	if not task_data.active then
		return
	end

	local t = self._t
	
	self:_assign_recon_groups_to_retire()

	local force_pool = self:_get_difficulty_dependent_value(self._tweak_data.assault.force_pool) * self:_get_balancing_multiplier(self._tweak_data.assault.force_pool_balance_mul) * restoration.global_spawn_multiplier
	local task_spawn_allowance = force_pool - (self._hunt_mode and 0 or task_data.force_spawned)

	if task_data.phase == "anticipation" then
		if task_spawn_allowance <= 0 then
			print("spawn_pool empty: -----------FADE-------------")

			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		--Stops drama from skipping anticipation
		elseif task_data.phase_end_t < t then
			self._assault_number = self._assault_number + 1
			
			self:_post_megaphone_event("mga_generic_c")

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

			if task_data.is_hesitating and task_data.voice_delay < self._t then
				if self._hostage_headcount > 0 then
					local best_group = nil

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
					task_data.is_hesitating = nil
				end
			end
		end
	elseif task_data.phase == "build" then
		if task_spawn_allowance <= 0 then
			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		elseif task_data.phase_end_t < t or self._drama_data.zone == "high" then
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
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		elseif end_t < t and not self._hunt_mode then
			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		end
	else
		local end_assault
		local is_skirmish = managers.skirmish:is_skirmish()
		local enemies_defeated_time_limit = is_skirmish and 0 or self._tweak_data.assault.fade_settings.enemies_defeated_time_limit or 30
		local drama_engagement_time_limit = is_skirmish and 0 or self._tweak_data.assault.fade_settings.drama_engagement_time_limit or 30
		local enemies_left = self:_count_police_force("assault")
		local min_enemies_left = task_data.force * (self._tweak_data.assault.fade_settings.enemies_defeated_percentage or 0.5)
		local enemies_defeated = enemies_left < min_enemies_left or self._t > task_data.phase_end_t + enemies_defeated_time_limit
		if enemies_defeated then
			if not task_data.said_retreat then
				task_data.said_retreat = true
				self:_police_announce_retreat()
				self:_post_megaphone_event("mga_robbers_clever")
			elseif task_data.phase_end_t < self._t then
				local drama_pass = self._drama_data.amount < tweak_data.drama.assault_fade_end
				local engagement_pass = self:_count_criminals_engaged_force(11) <= 10
				local taking_too_long = self._t > task_data.phase_end_t + drama_engagement_time_limit
				end_assault = drama_pass and engagement_pass or taking_too_long
			end
		end

		if task_data.force_end or end_assault then
			task_data.active = nil
			task_data.phase = nil
			task_data.said_retreat = nil
			task_data.force_end = nil
			local force_regroup = task_data.force_regroup
			task_data.force_regroup = nil
			self:_post_megaphone_event("mga_leave")

			if self._draw_drama then
				self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = self._t
			end

			managers.mission:call_global_event("end_assault")
			self:_begin_regroup_task(force_regroup)
			self:set_difficulty(nil, 0.3)
			return
		end
	end

	if self._drama_data.amount <= tweak_data.drama.low then
		for criminal_key, criminal_data in pairs(self._player_criminals) do
			self:criminal_spotted(criminal_data.unit)

			for _, group in pairs(self._groups) do
				if group.objective.charge then
					for _, u_data in pairs(group.units) do
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

		for _, criminal_data in pairs(self._player_criminals) do
			if not criminal_data.status then
				local dis = mvec_dis_sq(target_pos, criminal_data.m_pos)

				if not nearest_dis or dis < nearest_dis then
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
		local used_event = nil

		if task_data.use_spawn_event and task_data.phase ~= "anticipation" then
			task_data.use_spawn_event = false

			if self:_try_use_task_spawn_event(t, primary_target_area, "assault") then
				used_event = true
			end
		end

		if not used_event then
			if next(self._spawning_groups) then
				-- Nothing
			else
				self:_check_spawn_timed_groups(primary_target_area, task_data)		
			
				local spawn_group, spawn_group_type = self:_find_spawn_group_near_area(primary_target_area, self._tweak_data.assault.groups, nil, nil, nil)

				if spawn_group then
					local grp_objective = {
						attitude = "avoid",
						stance = "hos",
						pose = "crouch",
						type = "assault_area",
						area = spawn_group.area,
						coarse_path = {
							{
								spawn_group.area.pos_nav_seg,
								spawn_group.area.pos
							}
						}
					}

					self:_spawn_in_group(spawn_group, spawn_group_type, grp_objective, task_data)
				end
			end
		end
	end

	if task_data.use_smoke_timer < self._t then
		task_data.use_smoke = true
	end

	self:detonate_queued_smoke_grenades()

	self:_assign_enemy_groups_to_assault(task_data.phase)
end

--Add a check to handle Skirmish's unique diff curve
function GroupAIStateBesiege:_check_spawn_timed_groups(target_area, task_data)
	if not self._timed_groups then
		return
	end
	
	if managers.skirmish:is_skirmish() then
		diff_curve = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
	else
		diff_curve = {1, 1, 1}
	end	

	local cur_group, cur_group_tweak_data, cur_group_individual_data = nil
	local t = TimerManager:game():time()

	for group_id, cur_group_data in pairs(self._timed_groups) do
		cur_group_tweak_data = cur_group_data.tweak_data
		cur_group_individual_data = cur_group_data.individual_data

		for i = 1, #cur_group_individual_data do
			cur_group = cur_group_individual_data[i]

			if not cur_group.timer then
				cur_group.timer = t + (cur_group_tweak_data.initial_spawn_delay or cur_group_tweak_data.spawn_cooldown)
			elseif cur_group.needs_spawn then
				if cur_group.timer < t then
					if self:_spawn_timed_group(task_data, cur_group, target_area, {
						[group_id] = diff_curve
					}) then
						cur_group.needs_spawn = false
					else
						cur_group.timer = t + 1
					end
				end
			elseif cur_group.respawning_units then
				for spawn_unit_type, respawn_data in pairs(cur_group.respawning_units) do
					if respawn_data.timer < t then
						if self:_respawn_unit_for_group(task_data, cur_group, target_area, respawn_data, spawn_unit_type, {
							[group_id] = diff_curve
						}) then
							cur_group.respawning_units[spawn_unit_type] = nil

							if not next(cur_group.respawning_units) then
								cur_group.respawning_units = nil
							end
						else
							respawn_data.timer = t + 1
						end
					end
				end
			end
		end
	end
end

-- Add an alternate in_place check to prevent enemy groups from getting stuck
function GroupAIStateBesiege:_assign_enemy_groups_to_assault(phase)
	for _, group in pairs(self._groups) do
		if group.has_spawned and group.objective.type == "assault_area" then
			if group.objective.moving_out then
				local done_moving

				for _, u_data in pairs(group.units) do
					local objective = u_data.unit:brain():objective()
					if objective and objective.grp_objective == group.objective then
						if objective.in_place or objective.area and objective.area.nav_segs[u_data.unit:movement():nav_tracker():nav_segment()] then
							done_moving = true
						else
							done_moving = false
							break
						end
					end
				end

				if done_moving then
					group.objective.moving_out = nil
					group.in_place_t = self._t
					group.objective.moving_in = nil
					self:_voice_move_complete(group)
				end
			end

			if not group.objective.moving_in then
				self:_set_assault_objective_to_group(group, phase)
			end
		end
	end
end

-- Improve and heavily simplify objective assignment code, fix pull back and open fire objectives
-- Basically, a lot of this function was needlessly complex and had oversights or incorrect conditions
Hooks:OverrideFunction(GroupAIStateBesiege, "_set_assault_objective_to_group", function (self, group, phase)
	local phase_is_anticipation = phase == "anticipation"
	local current_objective = group.objective
	local approach, open_fire, pull_back, charge
	local obstructed_area = self:_chk_group_areas_tresspassed(group)
	local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
	local in_place_duration = group.in_place_t and self._t - group.in_place_t or 0
	local tactics_map = {}

	if group_leader_u_data and group_leader_u_data.tactics then
		for _, tactic_name in ipairs(group_leader_u_data.tactics) do
			tactics_map[tactic_name] = true
		end

		if current_objective.tactic and not tactics_map[current_objective.tactic] then
			current_objective.tactic = nil
		end

		for i_tactic, tactic_name in ipairs(group_leader_u_data.tactics) do
			if tactic_name == "deathguard" and not phase_is_anticipation then
				if current_objective.tactic == tactic_name then
					for u_key, u_data in pairs(self._char_criminals) do
						if u_data.status and current_objective.follow_unit == u_data.unit then
							if current_objective.area.nav_segs[u_data.tracker:nav_segment()] then
								return
							end
						end
					end
				end

				local closest_crim_u_data, closest_crim_dis_sq
				for u_key, u_data in pairs(self._char_criminals) do
					if u_data.status then
						local closest_u_id, closest_u_data, closest_u_dis_sq = self._get_closest_group_unit_to_pos(u_data.m_pos, group.units)
						if closest_u_dis_sq and (not closest_crim_dis_sq or closest_u_dis_sq < closest_crim_dis_sq) then
							closest_crim_u_data = u_data
							closest_crim_dis_sq = closest_u_dis_sq
						end
					end
				end

				if closest_crim_u_data then
					local coarse_path = managers.navigation:search_coarse({
						id = "GroupAI_deathguard",
						from_tracker = group_leader_u_data.unit:movement():nav_tracker(),
						to_tracker = closest_crim_u_data.tracker,
						access_pos = self._get_group_acces_mask(group)
					})

					if coarse_path then
						local grp_objective = {
							distance = 800,
							type = "assault_area",
							attitude = "engage",
							tactic = "deathguard",
							moving_in = true,
							follow_unit = closest_crim_u_data.unit,
							area = self:get_area_from_nav_seg_id(coarse_path[#coarse_path][1]),
							coarse_path = coarse_path
						}
						group.is_chasing = true

						self:_set_objective_to_enemy_group(group, grp_objective)
						self:_voice_deathguard_start(group)
						return
					end
				end
			elseif tactic_name == "charge" and not current_objective.moving_out then
				charge = true
			end
		end
	end

	local objective_area = current_objective.area
	if obstructed_area then
		if phase_is_anticipation then
			-- If we run into enemies during anticipation, pull back
			pull_back = true
		elseif current_objective.moving_out then
			-- If we run into enemies while moving out, open fire
			if not current_objective.open_fire then
				open_fire = true
				objective_area = obstructed_area
			end
		elseif not current_objective.pushed or charge and not current_objective.charge then
			-- If we've been in position for a while or haven't seen enemies, approach
			approach = not self:_can_group_see_target(group)
		end
	elseif not current_objective.moving_out then
		-- If we aren't moving out to an objective, open fire if we have ranged_fire tactics and see an enemy, otherwise approach
		approach = charge or group.is_chasing or not tactics_map.ranged_fire or not self:_can_group_see_target(group)
		open_fire = not approach and not current_objective.open_fire
	elseif tactics_map.ranged_fire and not current_objective.open_fire and self:_can_group_see_target(group, true) then
		-- If we see an enemy while moving out and have the ranged_fire tactics, open fire
		local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
		if forwardmost_i_nav_point then
			open_fire = true
			objective_area = self:get_area_from_nav_seg_id(current_objective.coarse_path[forwardmost_i_nav_point][1])
		end
	end

	if open_fire then
		local grp_objective = {
			attitude = "engage",
			pose = "stand",
			type = "assault_area",
			stance = "hos",
			open_fire = true,
			tactic = current_objective.tactic,
			area = objective_area,
			coarse_path = {
				{
					objective_area.pos_nav_seg,
					mvector3.copy(objective_area.pos)
				}
			}
		}

		self:_set_objective_to_enemy_group(group, grp_objective)
		self:_voice_open_fire_start(group)
	elseif approach then
		local assault_area, alternate_assault_area, alternate_assault_area_from, assault_path, alternate_assault_path
		local to_search_areas = {
			objective_area
		}
		local found_areas = {
			[objective_area] = objective_area
		}
		local group_access_mask = self._get_group_acces_mask(group)

		repeat
			local search_area = table_remove(to_search_areas, 1)

			if next(search_area.criminal.units) then
				local assault_from_here = true

				if tactics_map.flank then
					local assault_from_area = found_areas[search_area]

					if assault_from_area ~= objective_area then
						assault_from_here = false

						if not alternate_assault_area or math_random() < 0.5 then
							local new_alternate_assault_path = managers.navigation:search_coarse({
								id = "GroupAI_assault",
								from_seg = current_objective.area.pos_nav_seg,
								to_seg = search_area.pos_nav_seg,
								access_pos = group_access_mask,
								verify_clbk = callback(self, self, "is_nav_seg_safe")
							})

							if new_alternate_assault_path then
								self:_merge_coarse_path_by_area(new_alternate_assault_path)
								alternate_assault_path = new_alternate_assault_path
								alternate_assault_area = search_area
								alternate_assault_area_from = assault_from_area
							end
						end

						found_areas[search_area] = nil
					end
				end

				if assault_from_here then
					assault_path = managers.navigation:search_coarse({
						id = "GroupAI_assault",
						from_seg = current_objective.area.pos_nav_seg,
						to_seg = search_area.pos_nav_seg,
						access_pos = group_access_mask,
						verify_clbk = callback(self, self, "is_nav_seg_safe")
					})

					if assault_path then
						self:_merge_coarse_path_by_area(assault_path)
						assault_area = search_area
						break
					end
				end
			else
				for _, other_area in pairs(search_area.neighbours) do
					if not found_areas[other_area] then
						table_insert(to_search_areas, other_area)
						found_areas[other_area] = search_area
					end
				end
			end
		until #to_search_areas == 0

		if alternate_assault_area then
			assault_area = alternate_assault_area
			found_areas[assault_area] = alternate_assault_area_from
			assault_path = alternate_assault_path
		end

		if assault_area and assault_path then
			local push = found_areas[assault_area] == objective_area
			local used_grenade

			if push then
				local detonate_pos
				local c_key = charge and table.random_key(assault_area.criminal.units)
				if c_key then
					detonate_pos = assault_area.criminal.units[c_key].unit:movement():m_pos()
				end

				-- Check which grenade to use to push, grenade use is required for the push to be initiated
				-- If grenade isn't available, push regardless anyway after a short delay
				used_grenade = self:_chk_group_use_grenade(assault_area, group, detonate_pos) or group.ignore_grenade_check_t and group.ignore_grenade_check_t <= self._t

				if used_grenade then
					self:_voice_move_in_start(group)
				elseif not group.ignore_grenade_check_t then
					group.ignore_grenade_check_t = self._t + tweak_data.group_ai.ignore_grenade_time / math.max(1, table.size(assault_area.criminal.units))
				end
			else
				-- If we aren't pushing, we go to one area before the criminal area
				assault_area = found_areas[assault_area]
				if #assault_path > 2 and assault_area.nav_segs[assault_path[#assault_path - 1][1]] then
					table_remove(assault_path)
				end
			end

			if not push or used_grenade then
				local grp_objective = {
					type = "assault_area",
					stance = "hos",
					area = assault_area,
					coarse_path = assault_path,
					pose = push and "crouch" or "stand",
					attitude = push and "engage" or "avoid",
					moving_in = push,
					open_fire = push,
					pushed = push,
					charge = charge,
					interrupt_dis = charge and 0
				}
				group.is_chasing = group.is_chasing or push

				self:_set_objective_to_enemy_group(group, grp_objective)
			end
		elseif in_place_duration > 15 and not self:_can_group_see_target(group) then
			-- Log and remove groups that get stuck
			local element_id = group.spawn_group_element and group.spawn_group_element._id or 0
			local element_name = group.spawn_group_element and group.spawn_group_element._editor_name or ""

			for _, u_data in pairs(group.units) do
				u_data.unit:brain():set_active(false)
				u_data.unit:set_slot(0)
			end
		end
	elseif pull_back then
		local retreat_area
		for _, u_data in pairs(group.units) do
			local nav_seg_id = u_data.tracker:nav_segment()
			if self:is_nav_seg_safe(nav_seg_id) then
				retreat_area = self:get_area_from_nav_seg_id(nav_seg_id)
				break
			end
		end

		if not retreat_area and current_objective.coarse_path then
			local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
			if forwardmost_i_nav_point then
				-- Try retreating to the previous coarse path nav point
				local nav_point = current_objective.coarse_path[forwardmost_i_nav_point - 1] or current_objective.coarse_path[forwardmost_i_nav_point]
				retreat_area = self:get_area_from_nav_seg_id(nav_point[1])
			end
		end

		if retreat_area then
			local new_grp_objective = {
				attitude = "avoid",
				stance = "hos",
				pose = "crouch",
				type = "assault_area",
				area = retreat_area,
				coarse_path = {
					{
						retreat_area.pos_nav_seg,
						mvector3.copy(retreat_area.pos)
					}
				}
			}
			group.is_chasing = nil

			self:_set_objective_to_enemy_group(group, new_grp_objective)
		end
	end
end)

-- Helper to check if any group member has visuals on their focus target
function GroupAIStateBesiege:_can_group_see_target(group, limit_range)
	local logic_data, focus_enemy
	for _, u_data in pairs(group.units) do
		logic_data = u_data.unit:brain()._logic_data
		focus_enemy = logic_data and logic_data.attention_obj
		if focus_enemy and focus_enemy.reaction >= AIAttentionObject.REACT_AIM and focus_enemy.verified then
			if not limit_range or focus_enemy.verified_dis < (logic_data.internal_data.weapon_range and logic_data.internal_data.weapon_range.far or 3000) then
				return true
			end
		end
	end
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
					if u_data.group and u_data.group.objective and u_data.group.objective.area and u_data.group.objective.type == "assault_area" or u_data.group and u_data.group.objective and u_data.group.objective.area and u_data.group.objective.type == "retire" then
						detonate_pos = mvector3.copy(u_data.group.objective.area.pos)
					else
						for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
							if self._current_target_area and self._current_target_area.nav_segs[neighbour_nav_seg_id] then
								local random_door_id = door_list[math.random(#door_list)]

								if type(random_door_id) == "number" then
									detonate_pos = managers.navigation._room_doors[random_door_id].center
								else
									detonate_pos = random_door_id:script_data().element:nav_link_end_pos()
								end

								break
							end
						end
					end
				end

				if detonate_pos and shooter_u_data then
					self:detonate_smoke_grenade(detonate_pos, shooter_pos, duration, false)
					self:apply_grenade_cooldown()

					u_data.unit:sound():say("d01", true)

					--Plays grenade throwing animation.
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
					if u_data.group and u_data.group.objective and u_data.group.objective.area and u_data.group.objective.type == "assault_area" then
						detonate_pos = mvector3.copy(u_data.group.objective.area.pos)
					else
						for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
							if self._current_target_area and self._current_target_area.nav_segs[neighbour_nav_seg_id] then
								local random_door_id = door_list[math.random(#door_list)]

								if type(random_door_id) == "number" then
									detonate_pos = managers.navigation._room_doors[random_door_id].center
								else
									detonate_pos = random_door_id:script_data().element:nav_link_end_pos()
								end

								break
							end
						end
					end
				end

				if detonate_pos and shooter_u_data then
					self:detonate_smoke_grenade(detonate_pos, shooter_pos, duration, true)
					self:apply_grenade_cooldown(true)

					u_data.unit:sound():say("d02", true)	
					u_data.unit:movement():play_redirect("throw_grenade")					

					return true
				end
			end
		end
	end
end

-- Add custom grenade usage function
function GroupAIStateBesiege:_chk_group_use_grenade(assault_area, group, detonate_pos)
	local task_data = self._task_data.assault
	if not task_data.use_smoke then
		return
	end

	local grenade_types = {
		smoke_grenade = (not task_data.smoke_grenade_next_t or task_data.smoke_grenade_next_t < self._t) or nil,
		flash_grenade = (not task_data.flash_grenade_next_t or task_data.flash_grenade_next_t < self._t) or nil
	}
	local grenade_candidates = {}
	for grenade_type, _ in pairs(grenade_types) do
		for _, u_data in pairs(group.units) do
			if u_data.tactics_map and u_data.tactics_map[grenade_type] then
				table.insert(grenade_candidates, { grenade_type, u_data })
			end
		end
	end

	if #grenade_candidates == 0 then
		return
	end

	local candidate = table.random(grenade_candidates)
	local grenade_type = candidate[1]
	local grenade_user = candidate[2]

	local detonate_offset, detonate_offset_pos = tmp_vec1, tmp_vec2
	if detonate_pos then
		mvec_set(detonate_offset, grenade_user.m_pos)
		mvec_sub(detonate_offset, detonate_pos)
	else
		local nav_seg = managers.navigation._nav_segments[grenade_user.tracker:nav_segment()]
		for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
			local area = self:get_area_from_nav_seg_id(neighbour_nav_seg_id)
			if task_data.target_areas[1].nav_segs[neighbour_nav_seg_id] or next(area.criminal.units) then
				local random_door_id = door_list[math_random(#door_list)]
				if type(random_door_id) == "number" then
					detonate_pos = managers.navigation._room_doors[random_door_id].center
				else
					detonate_pos = random_door_id:script_data().element:nav_link_end_pos()
				end
				break
			end
		end

		if not detonate_pos then
			return
		end

		mvec_set(detonate_offset, assault_area.pos)
		mvec_sub(detonate_offset, detonate_pos)
	end

	local ray_mask = managers.slot:get_mask("world_geometry")

	--Grenadiers use tear gas pre-emptively instead of smoke grenades
	local use_teargas
	local can_use_teargas = grenade_user and grenade_user.char_tweak and grenade_user.char_tweak.use_gas and grenade_type == "smoke_grenade"
	if can_use_teargas then
		mvec_set(detonate_offset_pos, math.UP)
		mvec_mul(detonate_offset_pos, 1000)
		mvec_add(detonate_offset_pos, assault_area.pos)
		if World:raycast("ray", assault_area.pos, detonate_offset_pos, "slot_mask", ray_mask, "report") then
			mvec_set(detonate_offset_pos, assault_area.pos)
			mvec_set_z(detonate_offset_pos, detonate_offset_pos.z + 100)
			use_teargas = true
		end
	end

	if not use_teargas then
		-- Offset grenade a bit to avoid spawning exactly on the player/door
		mvec_set_z(detonate_offset, math.max(detonate_offset.z, 0))
		mvec_set_l(detonate_offset, math_random(100, 300))
		mvec_set(detonate_offset_pos, detonate_pos)
		mvec_add(detonate_offset_pos, detonate_offset)

		local ray = World:raycast("ray", detonate_pos, detonate_offset_pos, "slot_mask", ray_mask)
		if ray then
			mvec_set_l(detonate_offset, math.max(0, ray.distance - 50))
			mvec_set(detonate_offset_pos, detonate_pos)
			mvec_add(detonate_offset_pos, detonate_offset)
		end
	end

	-- Raycast down to place grenade on ground
	mvec_set(detonate_offset, math.DOWN)
	mvec_mul(detonate_offset, 1000)
	mvec_add(detonate_offset, detonate_offset_pos)

	local ground_ray = World:raycast("ray", detonate_offset_pos, detonate_offset, "slot_mask", ray_mask)
	detonate_pos = ground_ray and ground_ray.hit_position or detonate_offset_pos

	local timeout
	if use_teargas then
		self:detonate_cs_grenade(detonate_pos, mvec_cpy(grenade_user.m_pos), tweak_data.group_ai.cs_grenade_lifetime or 10)

		timeout = tweak_data.group_ai.cs_grenade_timeout or tweak_data.group_ai.smoke_and_flash_grenade_timeout
	else
		if grenade_type == "flash_grenade" and grenade_user.char_tweak.chatter.flash_grenade then
			self:chk_say_enemy_chatter(grenade_user.unit, grenade_user.m_pos, "flash_grenade")
		elseif grenade_type == "smoke_grenade" and grenade_user.char_tweak.chatter.smoke then
			self:chk_say_enemy_chatter(grenade_user.unit, grenade_user.m_pos, "smoke")
		end

		self:detonate_smoke_grenade(detonate_pos, mvec_cpy(grenade_user.m_pos), tweak_data.group_ai[grenade_type .. "_lifetime"] or 10, grenade_type == "flash_grenade")

		timeout = tweak_data.group_ai[grenade_type .. "_timeout"] or tweak_data.group_ai.smoke_and_flash_grenade_timeout
	end

	task_data.use_smoke = false
	-- Minimum grenade cooldown
	task_data.use_smoke_timer = self._t + 10
	-- Individual grenade cooldowns
	task_data[grenade_type .. "_next_t"] = self._t + math_lerp(timeout[1], timeout[2], math_random())

	return true
end

-- Keep recon groups around during anticipation
-- Making them retreat only afterwards gives them more time to complete their objectives
local _assign_recon_groups_to_retire_original = GroupAIStateBesiege._assign_recon_groups_to_retire
function GroupAIStateBesiege:_assign_recon_groups_to_retire(...)
	if self._task_data.assault.phase == "anticipation" then
		return
	end
	return _assign_recon_groups_to_retire_original(self, ...)
end

-- Tweak importance of spawn group distance in spawn group weight based on the groups to spawn
-- Also slightly optimized this function to properly check all areas
function GroupAIStateBesiege:_find_spawn_group_near_area(target_area, allowed_groups, target_pos, max_dis, verify_clbk)
	target_pos = target_pos or target_area.pos
	max_dis = max_dis or math.huge

	local t = self._t
	local valid_spawn_groups = {}
	local valid_spawn_group_distances = {}
	local shortest_dis = math.huge
	local longest_dis = -math.huge

	for _, area in pairs(self._area_data) do
		local spawn_groups = area.spawn_groups
		if spawn_groups then
			for _, spawn_group in ipairs(spawn_groups) do
				if spawn_group.delay_t <= t and (not verify_clbk or verify_clbk(spawn_group)) then
					local dis_id = tostring(spawn_group.nav_seg) .. "-" .. tostring(target_area.pos_nav_seg)

					if not self._graph_distance_cache[dis_id] then
						local path = managers.navigation:search_coarse({
							access_pos = "swat",
							from_seg = spawn_group.nav_seg,
							to_seg = target_area.pos_nav_seg,
							id = dis_id
						})

						if path and #path >= 2 then
							local dis = 0
							local current = spawn_group.pos
							for i = 2, #path do
								local nxt = path[i][2]
								if current and nxt then
									dis = dis + mvec_dis(current, nxt)
								end
								current = nxt
							end
							self._graph_distance_cache[dis_id] = dis
						end
					end

					if self._graph_distance_cache[dis_id] then
						local my_dis = self._graph_distance_cache[dis_id]
						if my_dis < max_dis then
							local spawn_group_id = spawn_group.mission_element:id()
							valid_spawn_groups[spawn_group_id] = spawn_group
							valid_spawn_group_distances[spawn_group_id] = my_dis
							if my_dis < shortest_dis then
								shortest_dis = my_dis
							end
							if my_dis > longest_dis then
								longest_dis = my_dis
							end
						end
					end
				end
			end
		end
	end

	if not next(valid_spawn_group_distances) then
		return
	end

	local total_weight = 0
	local candidate_groups = {}
	local low_weight = allowed_groups == self._tweak_data.reenforce.groups and 0.25 or allowed_groups == self._tweak_data.recon.groups and 0.5 or 0.75
	for i, dis in pairs(valid_spawn_group_distances) do
		local my_wgt = math_map_range(dis, shortest_dis, longest_dis, 1, low_weight)
		local my_spawn_group = valid_spawn_groups[i]
		local my_group_types = my_spawn_group.mission_element:spawn_groups()
		my_spawn_group.distance = dis
		total_weight = total_weight + self:_choose_best_groups(candidate_groups, my_spawn_group, my_group_types, allowed_groups, my_wgt)
	end

	if total_weight == 0 then
		return
	end

	return self:_choose_best_group(candidate_groups, total_weight)
end

-- Reorder task updates so groups that have finished spawning immediately get their objectives instead of waiting for the next update
function GroupAIStateBesiege:_upd_police_activity()
	self._police_upd_task_queued = false

	if self._police_activity_blocked then
		return
	end

	if self._ai_enabled then
		self:_upd_SO()
		self:_upd_grp_SO()
		self:_check_spawn_phalanx()
		self:_check_phalanx_group_has_spawned()
		self:_check_phalanx_damage_reduction_increase()

		-- Do _upd_group_spawning and _begin_new_tasks before the various task updates
		if self._enemy_weapons_hot then
			self:_claculate_drama_value()
			self:_upd_group_spawning()
			self:_begin_new_tasks()
			self:_upd_regroup_task()
			self:_upd_reenforce_tasks()
			self:_upd_recon_tasks()
			self:_upd_assault_task()
			self:_upd_groups()
		end
	end

	self:_queue_police_upd_task()
end


-- Update police activity in consistent intervals
function GroupAIStateBesiege:_queue_police_upd_task()
	if not self._police_upd_task_queued then
		self._police_upd_task_queued = true
		managers.enemy:queue_task("GroupAIStateBesiege._upd_police_activity", self._upd_police_activity, self, self._t + 1)
	end
end


-- Overhaul group spawning and fix forced group spawns not actually forcing the entire group to spawn
-- Group spawning now always spawns the entire group at once but uses a cooldown that prevents any regular group spawns
-- for a number of seconds equal to the amount of spawned units
local force_spawn_group_original = GroupAIStateBesiege.force_spawn_group
function GroupAIStateBesiege:force_spawn_group(...)
	self._force_next_group_spawn = true
	force_spawn_group_original(self, ...)
	self._force_next_group_spawn = nil
end

Hooks:OverrideFunction(GroupAIStateBesiege, "_perform_group_spawning", function (self, spawn_task, force, use_last)
	-- Prevent regular group spawning if cooldown is active unless it's a forced spawn
	if self._next_group_spawn_t and self._next_group_spawn_t > self._t and not force and not self._force_next_group_spawn then
		return
	end

	local produce_data = {
		name = true,
		spawn_ai = {}
	}
	local unit_categories = tweak_data.group_ai.unit_categories
	local current_unit_type = tweak_data.levels:get_ai_group_type()
	local spawn_points = spawn_task.spawn_group.spawn_pts

	local function _try_spawn_unit(u_type_name, spawn_entry)
		local hopeless = true
		for _, sp_data in ipairs(spawn_points) do
			local category = unit_categories[u_type_name]
			if (sp_data.accessibility == "any" or category.access[sp_data.accessibility]) and (not sp_data.amount or sp_data.amount > 0) and sp_data.mission_element:enabled() then
				hopeless = false

				if sp_data.delay_t < self._t then
					local units = category.unit_types[current_unit_type]
					produce_data.name = units[math.random(#units)]
					produce_data.name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", produce_data.name)
					local spawned_unit = sp_data.mission_element:produce(produce_data)
					if spawned_unit then
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
		end

		if hopeless then
			return true
		end
	end

	-- Try spawning units that are picky about their access first
	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		if not unit_categories[u_type_name].access.acrobatic then
			for _ = spawn_info.amount, 1, -1 do
				if _try_spawn_unit(u_type_name, spawn_info.spawn_entry) then
					spawn_info.amount = spawn_info.amount - 1
				else
					break
				end
			end
		end
	end

	local complete = true
	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		for _ = spawn_info.amount, 1, -1 do
			if _try_spawn_unit(u_type_name, spawn_info.spawn_entry) then
				spawn_info.amount = spawn_info.amount - 1
			else
				complete = false
				break
			end
		end
	end

	-- If there are still units to spawn, return and try spawning the rest in the next call
	if not complete then
		return
	end

	table.remove(self._spawning_groups, use_last and #self._spawning_groups or 1)

	spawn_task.group.has_spawned = true
	self:_voice_groupentry(spawn_task.group, spawn_task.group.objective.type == "recon_area") -- so it doesn't depend on setting this up in groupaitweakdata anymore as well as being more accurate to the group's actual intent
	if spawn_task.group.size <= 0 then
		self._groups[spawn_task.group.id] = nil
	end

	-- Set a cooldown before new units can be spawned via regular spawn tasks
	self._next_group_spawn_t = self._t + spawn_task.group.size * tweak_data.group_ai.spawn_cooldown_mul
end)

-- When scripted spawns are assigned to group ai, use a generic group type instead of using their category as type
-- This ensures they are not retired immediatley cause they are not part of assault/recon group types
Hooks:OverrideFunction(GroupAIStateBesiege, "assign_enemy_to_group_ai", function (self, unit, team_id)
	local assault_active = self._task_data.assault.active
	local area = self:get_area_from_nav_seg_id(unit:movement():nav_tracker():nav_segment())
	local grp_objective = {
		type = assault_active and "assault_area" or "recon_area",
		area = area,
		moving_out = false
	}

	local objective = unit:brain():objective()
	if objective then
		grp_objective.area = objective.area or objective.nav_seg and self:get_area_from_nav_seg_id(objective.nav_seg) or grp_objective.area
		objective.grp_objective = grp_objective
	end

	local group = self:_create_group({
		size = 1,
		type = assault_active and "custom_assault" or "custom_recon"
	})
	group.team = self._teams[team_id]
	group.objective = grp_objective
	group.has_spawned = true

	self:_add_group_member(group, unit:key())
	self:set_enemy_assigned(area, unit:key())
end)

-- Fix for potential crash when a group objective does not have a coarse path
local _get_group_forwardmost_coarse_path_index_original = GroupAIStateBesiege._get_group_forwardmost_coarse_path_index
function GroupAIStateBesiege:_get_group_forwardmost_coarse_path_index(group, ...)
	if group.objective and group.objective.coarse_path then
		return _get_group_forwardmost_coarse_path_index_original(self, group, ...)
	end
end

function GroupAIStateBesiege:_voice_open_fire_start(group)
	for u_key, unit_data in pairs(group.units) do
		if unit_data.char_tweak.chatter.open_fire and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "open_fire") then
			break
		end
	end
end


function GroupAIStateBesiege:_voice_move_in_start(group)
	for u_key, unit_data in pairs(group.units) do
		if unit_data.char_tweak.chatter.go_go and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "go_go") then
			break
		end
	end
end

function GroupAIStateBesiege:_voice_saw()
	for group_id, group in pairs(self._groups) do
		for u_key, u_data in pairs(group.units) do
			if u_data.char_tweak.chatter and u_data.char_tweak.chatter.saw then
				self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "saw")
			else
				
			end
		end
	end
end


function GroupAIStateBesiege:_voice_sentry()
	for group_id, group in pairs(self._groups) do
		for u_key, u_data in pairs(group.units) do
			if u_data.char_tweak.chatter and u_data.char_tweak.chatter.sentry then
				self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "sentry")
			else
				
			end
		end
	end
end

function GroupAIStateBesiege:_voice_trip_mine(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.trip_mine and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "trip_mine") then
				break
			end
		end
	end
end

--[[function GroupAIStateBesiege:_voice_saw(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.saw and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "saw") then
				break
			end
		end
	end
end]]--

--[[function GroupAIStateBesiege:_voice_sentry(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.sentry and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "sentry") then
				break
			end
		end
	end
end]]--

function GroupAIStateBesiege:_voice_friend_dead(group)
	for u_key, unit_data in pairs(group.units) do
		if unit_data.char_tweak.chatter and unit_data.char_tweak.chatter.aggressive and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "aggressive") then
			break
		end
	end
end

function GroupAIStateBesiege:_voice_friend_dead_2(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.aggressive and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "aggressive") then
				break
			end
		end
	end
end

--Disable vanilla captain spawning behavior.
function GroupAIStateBesiege:_check_spawn_phalanx()
	return
end

--Captain Assault Banner enabled on enemy spawn, rather than via groupai.
function GroupAIStateBesiege:set_damage_reduction_buff_hud()
	--Were you expecting some cute girl? Nope, it's just me! Dev Comments!
end
