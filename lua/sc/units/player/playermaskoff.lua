if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    Hooks:PostHook(PlayerMaskOff, "exit", "ResDodgeInitMessage", function(self, state_data, new_state_name)
		self._ext_damage:set_dodge_points()
	end)
end

