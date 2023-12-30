Hooks:PostHook(ElementSpecialObjective, "clbk_objective_failed", "res_clbk_objective_failed", function(self, unit)
	-- Generic fallback for pathing failures to fix cases of stuck units in stealth
	if (not unit:brain():objective() or unit:brain():objective().is_default) and unit:brain()._logic_data and unit:brain()._logic_data.path_fail_t and unit:brain()._logic_data.path_fail_t == TimerManager:game():time() then
		local new_element = self:choose_followup_SO(unit)
		if new_element then
			local new_objective = new_element:get_objective(unit)
			if new_objective then
				unit:brain():set_objective(new_objective)
			end
		end
	end
end)

-- Keep position saved for AI SOs to fix some older map scripting
Hooks:PreHook(ElementSpecialObjective, "_finalize_values", "sh__finalize_values", function (self, values)
	if self:value("so_action"):begins("AI") and values.path_style == "destination" then
		self._AI_SO_pos = values.position
	end
end)

-- Keep hunt and search as actual objective types instead of making it defend_area
-- This is done to be able to differentiate between those objectives and make hunt work properly (search is currently unused)
local get_objective_original = ElementSpecialObjective.get_objective
function ElementSpecialObjective:get_objective(...)
	local objective = get_objective_original(self, ...)

	if objective and (self._is_AI_SO or string.begins(self._values.so_action, "AI")) then
		local objective_type = self._values.so_action:sub(4)
		if objective_type == "hunt" or objective_type == "search" then
			objective.type = objective_type
		end
	end

	return objective
end