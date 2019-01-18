if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_init = AchievementsTweakData.init
	function AchievementsTweakData:init(tweak_data)
		old_init(self, tweak_data)
		self.complete_heist_achievements.trophy_friendly_car.num_players = nil
	end

end