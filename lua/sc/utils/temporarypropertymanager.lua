--Adds infohud hooks for property based skills (IE: Overkill).
Hooks:PostHook(TemporaryPropertyManager, "activate_property", "ResPropertyToHud", function(self, prop, time, value)
	managers.hud:start_buff(prop, time)
end)

Hooks:PostHook(TemporaryPropertyManager, "add_to_property", "ResPropertyToHud", function(self, prop, time, value)
	managers.hud:start_buff(prop, time)
end)

Hooks:PostHook(TemporaryPropertyManager, "mul_to_property", "ResPropertyToHud", function(self, prop, time, value)
	managers.hud:start_buff(prop, time)
end)