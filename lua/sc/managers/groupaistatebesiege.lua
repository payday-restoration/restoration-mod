local math_abs = math.abs
local math_min = math.min
local math_lerp = math.lerp
local math_random = math.random
local table_insert = table.insert
local table_remove = table.remove
local mvec_dis = mvector3.distance
local mvec_dis_sq = mvector3.distance_sq

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

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

--Exactly the same as the _get_megaphone_sound_source in TradeManager (without application error calls).
--Used to play voice lines to correspond to specific spawn groups.
function GroupAIStateBesiege:_get_megaphone_sound_source()
	local level_id = Global.level_data.level_id
	local pos = nil

	if not level_id then
		pos = Vector3(0, 0, 0)
	elseif not tweak_data.levels[level_id].megaphone_pos then
		pos = Vector3(0, 0, 0)
	else
		pos = tweak_data.levels[level_id].megaphone_pos
	end

	local sound_source = SoundDevice:create_source("megaphone")

	sound_source:set_position(pos)

	return sound_source
end

--Ensured PONR flag is set to nil.
Hooks:PostHook(GroupAIStateBesiege, "init", "ResInit", function(self, group_ai_state)
	self._ponr_is_on = nil

	--Sets functions that determine chatter for spawn group leaders to say upon spawning.
	--self:_init_group_entry_lines()
	--self:set_debug_draw_state(true) --Uncomment to debug AI stuff.
end)

-- Update police activity in consistent intervals
function GroupAIStateBesiege:_queue_police_upd_task()
	if not self._police_upd_task_queued then
		self._police_upd_task_queued = true
		managers.enemy:queue_task("GroupAIStateBesiege._upd_police_activity", self._upd_police_activity, self, self._t + 1)
	end
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

		-- Do _upd_group_spawning and _begin_new_tasks before the various task updates
		if self._enemy_weapons_hot then
			self:_check_spawn_phalanx() -- useless to check in stealth
			self:_check_phalanx_group_has_spawned() -- useless to check in stealth
			self:_check_phalanx_damage_reduction_increase() -- useless to check in stealth
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

-- Make hostage count affect hesitation delay
local _begin_assault_task_original = GroupAIStateBesiege._begin_assault_task
function GroupAIStateBesiege:_begin_assault_task(...)
	self._task_data.assault.was_first = self._task_data.assault.is_first

	_begin_assault_task_original(self, ...)

	if self._hostage_headcount > 0 then
		local assault_task = self._task_data.assault
		local anticipation_duration = self:_get_anticipation_duration(self._tweak_data.assault.anticipation_duration, assault_task.was_first)
		local hesitation_delay = self:_get_difficulty_dependent_value(self._tweak_data.assault.hostage_hesitation_delay)
		local hostage_multiplier = math.clamp(self._hostage_headcount, 1, 4)
		assault_task.phase_end_t = self._t + anticipation_duration + hesitation_delay * hostage_multiplier
		assault_task.is_hesitating = true
		assault_task.voice_delay = self._t + (assault_task.phase_end_t - self._t) / 2
	end
end

-- Improve ending condition for assault fade
-- The hardcoded amount of minimum enemies left was way too high and would lead to fade being instantly over after its minimum duration
local _upd_assault_task_original = GroupAIStateBesiege._upd_assault_task
function GroupAIStateBesiege:_upd_assault_task(...)
	local task_data = self._task_data.assault

	if not task_data.active then
		return
	end

	if task_data.phase ~= "fade" then
		return _upd_assault_task_original(self, ...)
	end

	self:_assign_recon_groups_to_retire()

	if not self._hunt_mode then
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

	if task_data.use_smoke_timer < self._t then
		task_data.use_smoke = true
	end

	self:detonate_queued_smoke_grenades()

	self:_assign_enemy_groups_to_assault(task_data.phase)
end

--Check for if use_smoke IS a thing instead of calculating smoke grenade time.
function GroupAIStateBesiege:is_smoke_grenade_active()
	if not self._task_data.assault.use_smoke then
		return
	end
	
	return self._task_data.assault.use_smoke
end

Hooks:PostHook(GroupAIStateBesiege, "_end_regroup_task", "RR_end_regroup_task", function(self)
	self._had_hostages = self._hostage_headcount > 3
end)

-- Reduce the importance of spawn group distance in spawn group weight to encourage enemies spawning from more directions
-- Also slightly optimized this function to properly check all areas
function GroupAIStateBesiege:_find_spawn_group_near_area(target_area, allowed_groups, target_pos, max_dis, verify_clbk)
	target_pos = target_pos or target_area.pos

	local t = self._t
	local valid_spawn_groups = {}
	local valid_spawn_group_distances = {}

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
						if not max_dis or my_dis < max_dis then
							local spawn_group_id = spawn_group.mission_element:id()
							valid_spawn_groups[spawn_group_id] = spawn_group
							valid_spawn_group_distances[spawn_group_id] = my_dis
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
	for i, dis in pairs(valid_spawn_group_distances) do
		local my_wgt = math_lerp(1, 0.75, math_min(1, dis / 5000))
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

--Set timestamp for whatever spawngroup was just spawned in to allow for cooldown tracking.
local _spawn_in_group_actual = GroupAIStateBesiege._spawn_in_group
function GroupAIStateBesiege:_spawn_in_group(spawn_group, spawn_group_type, ...)
	group_timestamps[spawn_group_type] = self._t

	return _spawn_in_group_actual(self, spawn_group, spawn_group_type, ...)
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
			return true
		end
	end

	local complete = true
	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		if not group_ai_tweak.unit_categories[u_type_name].access.acrobatic then
			for i = spawn_info.amount, 1, -1 do
				if _try_spawn_unit(u_type_name, spawn_info.spawn_entry) then
					spawn_info.amount = spawn_info.amount - 1
				else
					complete = false
					break
				end
			end
		end
	end

	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		for i = spawn_info.amount, 1, -1 do
			if _try_spawn_unit(u_type_name, spawn_info.spawn_entry) then
				spawn_info.amount = spawn_info.amount - 1
			else
				complete = false
				break
			end
		end
	end

	if complete then
		spawn_task.group.has_spawned = true
		self:_voice_groupentry(spawn_task.group, spawn_task.group.objective.type == "recon_area") -- so it doesn't depend on setting this up in groupaitweakdata anymore as well as being more accurate to the group's actual intent

		table.remove(self._spawning_groups, use_last and #self._spawning_groups or 1)

		if spawn_task.group.size <= 0 then
			self._groups[spawn_task.group.id] = nil
		end
	end
end

--Returns whether or not detection should decay over time for coplogics.
--Currently matches whether or not an assault is active. Kept seperate to reduce coupling in case we want different behavior in the future.
function GroupAIStateBesiege:is_detection_persistent()
	local assault_task = self._task_data.assault
	return assault_task and (assault_task.phase == "build" or assault_task.phase == "sustain")
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

-- Fix more cases of stuck enemies
function GroupAIStateBesiege:_set_assault_objective_to_group(group, phase)
	local phase_is_anticipation = phase == "anticipation"
	local current_objective = group.objective
	local approach, open_fire, push, pull_back, charge
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
					local search_params = {
						id = "GroupAI_deathguard",
						from_tracker = group_leader_u_data.unit:movement():nav_tracker(),
						to_tracker = closest_crim_u_data.tracker,
						access_pos = self._get_group_acces_mask(group)
					}
					local coarse_path = managers.navigation:search_coarse(search_params)

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
		elseif current_objective.moving_out and tactics_map.ranged_fire then
			-- If we run into enemies while moving out, open fire (if we aren't already doing that)
			open_fire = not current_objective.open_fire
		elseif current_objective.moving_out and tactics_map.elite_ranged_fire then
			-- Clone of Ranged Fire for now, might add more later
			open_fire = not current_objective.open_fire			
		elseif not current_objective.pushed or charge and not current_objective.charge then
			-- If we run into enemies and haven't pushed yet, push
			push = true
		end
	elseif not current_objective.moving_out then
		-- Check if there are any criminals close to our objective area
		local has_criminals_close = next(objective_area.criminal.units) and true
		if not has_criminals_close then
			local objective_pos = objective_area.pos
			local max_dis_sq = charge and 1000000 or 4000000
			for _, neighbour in pairs(objective_area.neighbours) do
				for _, c_data in pairs(neighbour.criminal.units) do
					-- Don't just check for neighboring areas, also check for distance (in case areas are very large)
					if math_abs(c_data.m_pos.z - objective_pos.z) < 500 and mvec_dis_sq(c_data.m_pos, objective_pos) < max_dis_sq then
						has_criminals_close = true
						break
					end
				end
				if has_criminals_close then
					break
				end
			end
		end

		-- Check if any of our group members can see an enemy
		local has_visible_target, logic_data, focus_enemy
		for _, u_data in pairs(group.units) do
			logic_data = u_data.unit:brain()._logic_data
			focus_enemy = logic_data and logic_data.attention_obj
			if focus_enemy and focus_enemy.reaction >= AIAttentionObject.REACT_AIM and focus_enemy.verified then
				has_visible_target = true
				break
			end
		end

		if charge then
			-- When we are charging, always move closer, push if enemies are already close
			approach = not has_criminals_close
			push = not approach
		elseif not has_criminals_close or not group.in_place_t then
			-- If no criminals are close or if we just spawned, approach if we can't see any enemy, are not using ranged fire or have been in place for a while
			-- Open fire otherwise (if we aren't already doing that)
			approach = not has_visible_target or not tactics_map.ranged_fire or not tactics_map.elite_ranged_fire or in_place_duration > 10
			open_fire = not approach and not current_objective.open_fire
		else
			-- If none of the above applies, push if we can't see any enemy or if we're chasing, open fire otherwise (if we aren't already doing that)
			push = not has_visible_target or group.is_chasing or not tactics_map.ranged_fire or not tactics_map.elite_ranged_fire
			open_fire = not push and not current_objective.open_fire
		end
	else
		-- If we see an enemy while moving out and have the ranged_fire tactics, open fire and stay in position for a bit
		if (tactics_map.ranged_fire or tactics_map.elite_ranged_fire) and not current_objective.open_fire then
			for _, u_data in pairs(group.units) do
				local logic_data = u_data.unit:brain()._logic_data
				local focus_enemy = logic_data and logic_data.attention_obj
				if focus_enemy and focus_enemy.reaction >= AIAttentionObject.REACT_AIM and focus_enemy.verified then
					if focus_enemy.verified_dis < (logic_data.internal_data.weapon_range and logic_data.internal_data.weapon_range.far or 3000) then
						local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
						if forwardmost_i_nav_point then
							open_fire = true
							objective_area = self:get_area_from_nav_seg_id(current_objective.coarse_path[forwardmost_i_nav_point][1])
						end
					end
					break
				end
			end
		end
	end

	if open_fire then
		objective_area = obstructed_area or objective_area
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
	elseif approach or push then
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

				if not push and tactics_map.flank then
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
			-- If we aren't pushing we're not going to the actual criminal area, but one area before that (if that area isn't our current one)
			if not push and found_areas[assault_area] ~= objective_area then
				assault_area = found_areas[assault_area]
				if #assault_path > 2 and assault_area.nav_segs[assault_path[#assault_path - 1][1]] then
					table_remove(assault_path)
				end
			end

			local used_grenade
			if push then
				local detonate_pos
				if charge then
					for _, c_data in pairs(assault_area.criminal.units) do
						if not c_data.ai then
							detonate_pos = c_data.unit:movement():m_pos()
							break
						end
					end
				end

				-- Check which grenade to use to push, grenade use is required for the push to be initiated
				-- If grenade isn't available, push regardless anyway after a short delay
				used_grenade = self:_chk_group_use_grenade(group, detonate_pos) or group.ignore_grenade_check_t and group.ignore_grenade_check_t <= self._t

				if used_grenade then
					self:_voice_move_in_start(group)
				elseif not group.ignore_grenade_check_t then
					group.ignore_grenade_check_t = self._t + 3
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
					moving_in = push and true or nil,
					open_fire = push or nil,
					pushed = push or nil,
					charge = charge,
					interrupt_dis = charge and 0 or nil
				}
				group.is_chasing = group.is_chasing or push

				self:_set_objective_to_enemy_group(group, grp_objective)
			end
		end
	elseif pull_back then
		local retreat_area

		for _, u_data in pairs(group.units) do
			local nav_seg_id = u_data.tracker:nav_segment()

			if current_objective.area.nav_segs[nav_seg_id] then
				retreat_area = current_objective.area
				break
			end

			if self:is_nav_seg_safe(nav_seg_id) then
				retreat_area = self:get_area_from_nav_seg_id(nav_seg_id)
				break
			end
		end

		if not retreat_area and current_objective.coarse_path then
			local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)
			if forwardmost_i_nav_point then
				retreat_area = self:get_area_from_nav_seg_id(current_objective.coarse_path[forwardmost_i_nav_point][1])
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
function GroupAIStateBesiege:_chk_group_use_grenade(group, detonate_pos)
	local task_data = self._task_data.assault
	if not task_data.use_smoke then
		-- If a grenade was previously used within a certain timeframe, count that as a successful current use
		return task_data.use_smoke_push_t and task_data.use_smoke_push_t <= self._t
	end

	local grenade_types = {
		smoke_grenade = true,
		flash_grenade = true
	}
	local grenade_candidates = {}
	for _, u_data in pairs(group.units) do
		if u_data.tactics_map then
			for grenade_type, _ in pairs(grenade_types) do
				if u_data.tactics_map[grenade_type] then
					table.insert(grenade_candidates, { grenade_type, u_data })
				end
			end
		end
	end

	if #grenade_candidates == 0 then
		return
	end

	local candidate = table.random(grenade_candidates)
	local grenade_type = candidate[1]
	local grenade_user = candidate[2]

	local area
	if detonate_pos then
		area = self:get_area_from_nav_seg_id(managers.navigation:get_nav_seg_from_pos(detonate_pos, true))
	else
		local nav_seg = managers.navigation._nav_segments[grenade_user.tracker:nav_segment()]
		for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
			area = self:get_area_from_nav_seg_id(neighbour_nav_seg_id)
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
	end

	if not detonate_pos then
		return
	end

	--[[If players camp a specific area for too long, turn the originally chosen grenade into a teargas grenade instead
	local use_teargas
	if area and area.criminal_entered_t and table.size(area.neighbours) <= 2 and math_random() < (self._t - area.criminal_entered_t - 60) / 240 then
		-- Check if a player actually currently is in this area
		local num_player_criminals = 0
		detonate_pos = mvector3.copy(area.pos)
		for _, c_data in pairs(area.criminal.units) do
			if not c_data.ai then
				num_player_criminals = num_player_criminals + 1
				mvector3.add(detonate_pos, c_data.m_pos)
			end
		end
		if num_player_criminals > 0 then
			mvector3.divide(detonate_pos, num_player_criminals + 1)
			mvector3.set_z(detonate_pos, area.pos.z)
			use_teargas = true
		end
	end]]--

	--[[if use_teargas then
		area.criminal_entered_t = nil
		grenade_type = "cs_grenade"

		self:detonate_cs_grenade(detonate_pos, mvector3.copy(grenade_user.m_pos), tweak_data.group_ai.cs_grenade_lifetime or 10)]]--
	--else
		if grenade_type == "flash_grenade" and grenade_user.char_tweak.chatter.flash_grenade then
			self:chk_say_enemy_chatter(grenade_user.unit, grenade_user.m_pos, "flash_grenade")
		elseif grenade_type == "smoke_grenade" and grenade_user.char_tweak.chatter.smoke then
			self:chk_say_enemy_chatter(grenade_user.unit, grenade_user.m_pos, "smoke")
		end

		grenade_user.unit:movement():play_redirect("throw_grenade")	
		self:detonate_smoke_grenade(detonate_pos, mvector3.copy(grenade_user.m_pos), tweak_data.group_ai[grenade_type .. "_lifetime"] or 10, grenade_type == "flash_grenade")
	--end

	local timeout = tweak_data.group_ai[grenade_type .. "_timeout"] or tweak_data.group_ai.smoke_and_flash_grenade_timeout
	task_data.use_smoke_push_t = self._t + timeout[1] * 0.15
	task_data.use_smoke_timer = self._t + math_lerp(timeout[1], timeout[2], math_random())
	task_data.use_smoke = false

	return true
end

--Sets the cooldown for smoke and flash grenades.
function GroupAIStateBesiege:apply_grenade_cooldown(flash)
	if not self._task_data.assault then
		return
	end
	
	local cooldown
	if flash then
		cooldown = tweak_data.group_ai.flash_grenade_lifetime + math.lerp(tweak_data.group_ai.flash_grenade_timeout[1], tweak_data.group_ai.flash_grenade_timeout[2], math.random())
	else
		cooldown = tweak_data.group_ai.smoke_grenade_lifetime + math.lerp(tweak_data.group_ai.smoke_grenade_timeout[1], tweak_data.group_ai.smoke_grenade_timeout[2], math.random())
	end

	local task_data = self._task_data.assault	
	task_data.use_smoke_timer = self._t + cooldown
	task_data.use_smoke = nil
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

function GroupAIStateBesiege:_voice_saw(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.saw and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "saw") then
				break
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

function GroupAIStateBesiege:_voice_sentry(dead_unit)
	local dead_unit_u_key = dead_unit:key()
	local group = self._police[dead_unit_u_key] and self._police[dead_unit_u_key].group
	if group then
		for u_key, unit_data in pairs(group.units) do
			if dead_unit_u_key ~= u_key and unit_data.char_tweak.chatter.sentry and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "sentry") then
				break
			end
		end
	end
end

function GroupAIStateBesiege:_voice_friend_dead(group)
	for u_key, unit_data in pairs(group.units) do
		if unit_data.char_tweak.chatter and unit_data.char_tweak.chatter.enemyidlepanic and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "aggressive") then
			break
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
