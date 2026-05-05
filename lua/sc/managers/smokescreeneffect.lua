Hooks:PostHook(SmokeScreenEffect, "init", "remod_smoke_rad", function(self, position, normal, time, has_dodge_bonus, grenade_unit)
	self._radius = 600
	self._thrower = grenade_unit and grenade_unit:base():thrower_unit()
end)

function SmokeScreenEffect:thrower()
	return self._thrower
end