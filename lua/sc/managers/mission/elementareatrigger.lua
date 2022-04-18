-- When an escape or loot secure zone is activated, mark that area for reinforcement spawngroups
-- This is done by checking the list of elements an ElementAreaTrigger executes for ElementMissionEnd or ElementCarry,
-- If it contains any of these, it is considered the escape zone/loot secure trigger
local function check_executed_objects(area_trigger, current, recursion_depth)
	current = current or area_trigger
	recursion_depth = recursion_depth or 2

	if (area_trigger._values.enabled and true or false) == (area_trigger._reinforce_point_enabled and true or false) then
		return
	end

	for _, params in pairs(current._values.on_executed) do
		local element = current:get_mission_element(params.id)
		local element_class = getmetatable(element)
		if element_class == ElementMissionEnd or element_class == ElementCarry and element._values.operation == "secure" then
			area_trigger._reinforce_point_enabled = area_trigger._values.enabled
			if area_trigger._values.enabled then
				if area_trigger._values.use_shape_element_ids then
					for _, shape_element in pairs(area_trigger._shape_elements) do
						managers.groupai:state():set_area_min_police_force(shape_element._id, 3, shape_element._values.position)
					end
				else
					managers.groupai:state():set_area_min_police_force(area_trigger._id, 3, area_trigger._values.position)
				end
				restoration:log(element_class == ElementMissionEnd and "Escape" or "Loot secure", "zone activated, enabling reinforce groups in its area")
			else
				if area_trigger._values.use_shape_element_ids then
					for _, shape_element in pairs(area_trigger._shape_elements) do
						managers.groupai:state():set_area_min_police_force(shape_element._id)
					end
				else
					managers.groupai:state():set_area_min_police_force(area_trigger._id)
				end
				restoration:log(element_class == ElementMissionEnd and "Escape" or "Loot secure", "zone deactivated, disabling reinforce groups in its area")
			end
			return true
		elseif recursion_depth > 0 and element_class == MissionScriptElement then
			if check_executed_objects(area_trigger, element, recursion_depth - 1) then
				return true
			end
		end
	end
end

Hooks:PostHook(ElementAreaTrigger, "on_set_enabled", "sh_on_set_enabled", check_executed_objects)
