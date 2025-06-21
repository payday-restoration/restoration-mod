-- Disable hunt on specific levels
Hooks:PreHook(ElementAiGlobalEvent, "on_executed", "res_on_executed", function(self)
	local wave_mode = self._wave_modes[self._values.wave_mode]
	if wave_mode == "hunt" then
		local job = Global.load_level and Global.level_data.level_id
		if table.contains(restoration.fuck_hunt, job) then
			restoration:log("Disabled hunt element %s", self._editor_name)
			self._values.enabled = false
		end
	end
end)
