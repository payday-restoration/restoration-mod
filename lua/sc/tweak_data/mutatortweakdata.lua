Hooks:PostHook( MutatorTweakData, "init_birthday", "res_birthday", function(self, tweak_data)

	--Just to stop crashes
	self.birthday.special_unit_rules_data.custom = {
		buff_id = 3,
		spawn_rate = 2
	}
	
end)