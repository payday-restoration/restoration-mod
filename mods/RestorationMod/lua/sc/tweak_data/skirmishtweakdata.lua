if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function SkirmishTweakData:_init_group_ai_data(tweak_data)
		local skirmish_data = deep_clone(tweak_data.group_ai.besiege)
		tweak_data.group_ai.skirmish = skirmish_data
	end

	function SkirmishTweakData:_init_spawn_group_weights(tweak_data)
		local skirmish_data = deep_clone(tweak_data.group_ai.besiege.assault)
		setmetatable(tweak_data.group_ai.skirmish.assault, skirmish_data)
	end

	function SkirmishTweakData:_init_wave_modifiers()
		self.wave_modifiers = {}
	end
	
end