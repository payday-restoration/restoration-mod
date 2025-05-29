if restoration:disable_mission_script_patches() then
	return
end

local mission_add = restoration:mission_script_add()
if mission_add then
	-- Load the elements from the file
	Hooks:PreHook(MissionScript, "init", "res_init", function(self, data)
		if not restoration.loaded_elements and data.name == "default" then
			restoration.loaded_elements = true
			for _, element in ipairs(mission_add.elements) do
				table.insert(data.elements, element)
			end
		end
	end)
end

local is_pro_job = Global.game_settings and Global.game_settings.one_down
local function try_insert(v, e)
	if not table.contains(v, e) then
		table.insert(v, e)
	end
end

-- Add custom mission script changes and triggers for specific levels
-- Mission script elements can be disabled or enabled
-- From Streamlined Heisting
-- Add custom mission script changes and triggers for specific levels
MissionManager.mission_script_patch_funcs = {}

-- Replace specified values on this element
function MissionManager.mission_script_patch_funcs.values(self, element, data)
	for k, v in pairs(data) do
		element._values[k] = v
		restoration:log("%s value \"%s\" has been set to \"%s\"", element:editor_name(), k, tostring(v))
	end

	-- Making sure that changing spawn_action values work (thanks Miki)
	if data.spawn_action then
		local spawn_action = table.index_of(CopActionAct._act_redirects.enemy_spawn, v)
		element._values.spawn_action = spawn_action ~= -1 and spawn_action or nil
	end

	-- Handle enemy tables (Idstring'ing a table is not ideal)
	if type(data.enemy) == "table" then
		element._enemy_table = v
		element._values.enemy = nil
	end

	-- Below from ASS
	if data.chance and element._chance then
		element._chance = data.chance
	end

	-- We love spawn group elements
	local group_data = element._group_data
	if group_data then
		group_data.amount = data.amount or group_data.amount
		group_data.spawn_type = data.spawn_type or group_data.spawn_type
		if data.ignore_disabled ~= nil then
			group_data.ignore_disabled = data.ignore_disabled
		end
	end
end

-- Modify the element's on executed
-- Can add new on executed elements, modify delays of existing on executed elements, or remove them
function MissionManager.mission_script_patch_funcs.on_executed(self, element, data)
	for _, v in pairs(data) do
		local new_element = self:get_element_by_id(v.id)
		if new_element then
			local val, i = table.find_value(element._values.on_executed, function(val) return val.id == v.id end)
			if v.remove then
				if val then
					table.remove(element._values.on_executed, i)
					restoration:log("Removed element %s from on_executed of %s", new_element:editor_name(), element:editor_name())
				end
			elseif val then
				val.delay = v.delay or 0
				val.delay_rand = v.delay_rand or 0
				restoration:log("Modified element %s in on_executed of %s", new_element:editor_name(), element:editor_name())
			else
				table.insert(element._values.on_executed, v)
				restoration:log("Added element %s to on_executed of %s", new_element:editor_name(), element:editor_name())
			end
		else
			restoration:error("Mission script element %u could not be found", v.id)
		end
	end

	-- Below from ASS, handles ElementRandom elements
	if element._original_on_executed then
		element._original_on_executed = clone(element._values.on_executed)
	end
end

-- Add a prehook to this specific element's on executed
function MissionManager.mission_script_patch_funcs.pre_func(self, element, data)
	Hooks:PreHook(element, "on_executed", "res_on_executed_pre_func_" .. element:id(), data)
	restoration:log("%s hooked as pre function call trigger", element:editor_name())
end

-- Add a posthook to this specific element's on executed
function MissionManager.mission_script_patch_funcs.func(self, element, data)
	Hooks:PostHook(element, "on_executed", "res_on_executed_func_" .. element:id(), data)
	restoration:log("%s hooked as function call trigger", element:editor_name())
end

-- Execution of mission script elements can trigger reinforce locations
-- Trigger that has just a name disables previously enabled reinforcement with that id
function MissionManager.mission_script_patch_funcs.reinforce(self, element, data)
	if Network:is_client() then
		return
	end
	Hooks:PostHook(element, "on_executed", "res_on_executed_reinforce_" .. element:id(), function()
		restoration:log("%s executed, toggled %u reinforce point(s)", element:editor_name(), #data)
		for _, v in pairs(data) do
			managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
		end
	end)
	restoration:log("%s hooked as reinforce trigger for %u area(s)", element:editor_name(), #data)
end

-- Set GroupAI difficulty when this element is executed
-- Likely not needed since Res uses its own GroupAI difficulty progression that mostly ignores mission scripting (including this patch function)
function MissionManager.mission_script_patch_funcs.difficulty(self, element, data)
	if Network:is_client() then
		return
	end
	Hooks:PostHook(element, "on_executed", "res_on_executed_difficulty_" .. element:id(), function()
		restoration:log("%s executed, set difficulty to %.2g", element:editor_name(), data)
		managers.groupai:state():set_difficulty(data)
	end)
	restoration:log("%s hooked as difficulty change trigger", element:editor_name())
end

-- Set flashlights on or off when this element is executed
function MissionManager.mission_script_patch_funcs.flashlight(self, element, data)
	local function set_flashlights()
		managers.game_play_central:set_flashlights_on(data)
	end
	Hooks:PostHook(element, "on_executed", "res_on_executed_flashlight_" .. element:id(), set_flashlights)
	Hooks:PostHook(element, "client_on_executed", "res_client_on_executed_flashlight_" .. element:id(), set_flashlights)
	restoration:log("%s hooked as flashlight state trigger", element:editor_name())
end

-- Modify the preferred groups of spawn group elements
function MissionManager.mission_script_patch_funcs.groups(self, element, data)
	if Network:is_client() then
		return
	end
	local new_groups = table.list_to_set(element._values.preferred_spawn_groups)
	for group_name, enabled in pairs(data) do
		new_groups[group_name] = enabled or nil
	end
	element._values.preferred_spawn_groups = table.map_keys(new_groups)
	restoration:log("Changed %u preferred group(s) of %s", table.size(data), element:editor_name())
end

function MissionManager.mission_script_patch_funcs.ai_area(self, element, data)
	Hooks:PostHook(element, "on_executed", "res_on_executed_ai_area_" .. element:id(), function()
		restoration:log("%s executed, creating %d AI area(s)", element:editor_name(), #data)
		for _, nav_segs in ipairs(data) do
			local area_pos = Vector3()
			for _, nav_seg_id in ipairs(nav_segs) do
				local nav_seg = managers.navigation._nav_segments[nav_seg_id]
				if not nav_seg then
					restoration:error("Nav segment %u could not be found", nav_seg_id)
					return
				end
				mvector3.add_scaled(area_pos, nav_seg.pos, 1 / #nav_segs)
			end
			self._ai_area_id = (self._ai_area_id or 10000) + 1
			managers.groupai:state():add_area(self._ai_area_id, nav_segs, area_pos)
		end
	end)
	restoration:log("%s hooked as AI area trigger", element:editor_name())
end

-- Turn Bravos on or off outside of point of no returns
-- Includes handling for Bravos mutator if active
function MissionManager.mission_script_patch_funcs.spawn_bravos(self, element, data)
	Hooks:PostHook(element, "on_executed", "res_on_executed_spawn_bravos_" .. element:id(), function()
		if not data then
			local bravos_mutator = managers.mutators:get_active_mutator(MutatorBravosOnly)
			local bravo_replacement = bravos_mutator and bravos_mutator.get_bravo_replacement and bravos_mutator:get_bravo_replacement()
			if bravo_replacement == "all" then
				return
			end
		end
		restoration.always_bravos = data
	end)
	restoration:log("%s hooked as spawn Bravos trigger", element:editor_name())
end

-- Start a point of no return when this element is executed on Pro Jobs
-- Prefer using actual point of no return elements in mission script add
function MissionManager.mission_script_patch_funcs.ponr(self, element, data)
	if not is_pro_job then
		return
	end

	local function set_ponr()
		local balance_mul = data.player_mul or { 1, 1, 1, 1, }
		local final_mul = managers.groupai:state():_get_balancing_multiplier(balance_mul) or balance_mul[#balance_mul] or 1
		managers.groupai:state():set_point_of_no_return_timer(data.length * final_mul, 0)
	end
	Hooks:PostHook(element, "on_executed", "res_on_executed_ponr_" .. element:id(), set_ponr)
	Hooks:PostHook(element, "client_on_executed", "res_client_on_executed_ponr_" .. element:id(), set_ponr)
end

-- End mission script patch point of no return if active when this element is executed on Pro Jobs
-- Prefer using actual operator elements in mission script add
function MissionManager.mission_script_patch_funcs.ponr_end(self, element, data)
	if not is_pro_job then
		return
	end

	local function end_ponr()
		managers.groupai:state():remove_point_of_no_return_timer(0)
	end
	Hooks:PostHook(element, "on_executed", "res_on_executed_ponr_end_" .. element:id(), end_ponr)
	Hooks:PostHook(element, "client_on_executed", "res_client_on_executed_ponr_end_" .. element:id(), end_ponr)
end

-- From ASS
-- Used for elements with lists in their values not containing tables
function MissionManager.mission_script_patch_funcs.modify_list_value(self, element, data)
	for k, v in pairs(data) do
		if type(element._values[k]) ~= "table" then
			restoration:warn("Invalid modify list value name \"%s\" on %s", k, element:editor_name())
		else
			for id, enabled in pairs(v) do
				if enabled then
					try_insert(element._values[k], id)
				else
					table.delete(element._values[k], id)
				end
			end
		end
	end
end

-- From ASS
-- Used for ElementInstanceInputEvent, core\lib\managers\mission\coreelementinstance
function MissionManager.mission_script_patch_funcs.event_list(self, element, data)
	local event_list = element._values.event_list
	if not event_list then
		restoration:warn("%s has no event list", element:editor_name())
		return
	end

	for instance, event in pairs(data) do
		local val, i = table.find_value(event_list, function(val) return val.instance == instance end)
		if event then
			if val then
				val.event = event
			else
				table.insert(event_list, { instance = instance, event = event, })
			end
		elseif val then
			table.remove(event_list, i)
		end
	end
	restoration:log("Changed %u event(s) in event list of %s", table.size(data), element:editor_name())
end

-- From ASS
-- Used for ElementSpecialObjective, lib\managers\mission\elementspecialobjective
function MissionManager.mission_script_patch_funcs.so_access_filter(self, element, data)
	element._values.SO_access_original = element._values.SO_access
	element._values.SO_access = managers.navigation:convert_access_filter_to_number(data)
	restoration:log("Replaced SO access filter of element %s", element:editor_name())
end

function MissionManager.mission_script_patch_funcs.enemy(self, element, data)
	element:replace_enemy_name(data)
	element:chk_used_mapped_names(true)

	restoration:log(string.format("Modified enemy spawn in element %s", element:editor_name()))
end

-- From ASS
-- Referenced from ElementAiGlobalEvent, lib\managers\mission\elementaiglobalevent
function MissionManager.mission_script_patch_funcs.hunt(self, element, data)
	Hooks:PostHook(element, "on_executed", "res_on_executed_hunt_" .. element:id(), function()
		local groupai_state = managers.groupai:state()
		local hunt_mode = groupai_state._hunt_mode
		local flag = (data and not hunt_mode and "hunt") or (hunt_mode and not data and "besiege") or nil
		if flag then
			restoration:log("%s executed, setting wave mode to %s", element:editor_name(), flag)
			if groupai_state:enemy_weapons_hot() then
				groupai_state:set_wave_mode(flag)
			else
				local key = "res_script_patch_hunt_" .. element:id()
				local events = { "enemy_weapons_hot", }
				local function clbk()
					groupai_state:set_wave_mode(flag)
					groupai_state:remove_listener(key)
				end
				groupai_state:add_listener(key, events, clbk)
			end
		end
	end)
end

Hooks:PreHook(MissionManager, "_activate_mission", "res__activate_mission", function(self)
	local mission_script_elements = restoration:mission_script_patches()
	if not mission_script_elements then
		return
	end

	for element_id, data in pairs(mission_script_elements) do
		-- Handle outdated mission script patch PONRs
		if type(data.ponr) == "number" then
			data.ponr = {
				length = data.ponr,
				player_mul = data.ponr_player_mul,
			}
		end
		data.ponr_player_mul = nil

		local element = self:get_element_by_id(element_id)
		if not element then
			restoration:error("Mission script element %u could not be found", element_id)
		else
			for patch_name, patch_data in pairs(data) do
				if self.mission_script_patch_funcs[patch_name] then
					self.mission_script_patch_funcs[patch_name](self, element, patch_data)
				else
					restoration:warn("MissionManager.mission_script_patch_funcs.%s does not exist", patch_name)
				end
			end
		end
	end
end)
