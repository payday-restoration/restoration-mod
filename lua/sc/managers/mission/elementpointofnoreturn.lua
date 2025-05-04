local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local to_replace_key = "time_" .. difficulty

Hooks:PostHook(ElementPointOfNoReturn, "init", "res_init", function(self)
	self._values.original_time = self._values[to_replace_key] or self._values.time_hard
end)

Hooks:PreHook(ElementPointOfNoReturn, "operation_add", "res_operation_add", function(self)
	if self._values.original_time then
		local balance_mul = self._values.time_balance_mul or { 1, 1, 1, 1, }
		local final_mul = managers.groupai:state():_get_balancing_multiplier(balance_mul) or balance_mul[#balance_mul] or 1
		self._values[to_replace_key] = self._values.original_time * final_mul
	end
end)
