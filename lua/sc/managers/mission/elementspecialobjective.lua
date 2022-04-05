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