Hooks:PostHook( WeaponTweakData, "init", "sw659Init", function(self)
	
	self.sw659_crew = deep_clone(self.usp_crew)
	self.x_sw659_crew = deep_clone(self.x_usp_crew)

end )