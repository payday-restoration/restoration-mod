local _process_recurring_grp_SO_orig = GroupAIStateBase._process_recurring_grp_SO
function GroupAIStateBase:_process_recurring_grp_SO(...)
	if _process_recurring_grp_SO_orig(self, ...) then
		managers.hud:post_event("cloaker_spawn")
		return true
	end
end