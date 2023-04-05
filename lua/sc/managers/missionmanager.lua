local level_id = Global.game_settings and Global.game_settings.level_id
if Global.editor_mode then
	return
end

-- Add custom mission script changes and triggers for specific levels
-- Execution of mission scripts can trigger reinforce locations (trigger that has just a name disables previously enabled reinforcement with that id)
-- Mission script elements can be disabled or enabled
-- From Streamlined Heisting

local mission_script_elements = restoration:mission_script_patches()
if not mission_script_elements then
	return
end

Hooks:PreHook(MissionManager, "_activate_mission", "sh__activate_mission", function (self)
	for element_id, data in pairs(mission_script_elements) do
		local element = self:get_element_by_id(element_id)
		if not element then
		else
			-- Check if this element is supposed to trigger reinforce points
			if data.reinforce then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_reinforce_" .. element_id, function ()
					for _, v in pairs(data.reinforce) do
						managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
					end
				end)
			end

			-- Check if this element is supposed to trigger a difficulty change
			if data.difficulty then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_difficulty_" .. element_id, function ()
					managers.groupai:state():set_difficulty(data.difficulty)
				end)
			end

			-- Check if this element has custom values set
			if data.values then
				for k, v in pairs(data.values) do
					element._values[k] = v
				end
			end
			
			-- Check if this element is supposed to trigger a point of no return
			if data.ponr then
			local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
			local difficulty_index = tweak_data:difficulty_to_index(difficulty)
				local function set_ponr()
					local ponr_timer_balance_mul = data.ponr_player_mul and managers.groupai:state():_get_balancing_multiplier(data.ponr_player_mul) or 1
					managers.groupai:state():set_point_of_no_return_timer(data.ponr * ponr_timer_balance_mul, 0)
				end

				Hooks:PostHook(element, "on_executed", "sh_on_executed_ponr_" .. element_id, set_ponr)
				Hooks:PostHook(element, "client_on_executed", "sh_client_on_executed_ponr_" .. element_id, set_ponr)
			end

			if data.flashlight ~= nil then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_func_" .. element_id, function ()
					managers.game_play_central:set_flashlights_on(data.flashlight)
				end)
			end

			if data.func then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_func_" .. element_id, data.func)
			end
		end
	end
end)