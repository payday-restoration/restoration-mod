Hooks:PostHook(CopActionIdle, "init", "res_init", function(self, action_desc, common_data)
	self._turn_allowed = true
	self._start_fwd = common_data.rot:y()
end)