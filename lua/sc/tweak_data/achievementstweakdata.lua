local old_init = AchievementsTweakData.init
function AchievementsTweakData:init(tweak_data)
	old_init(self, tweak_data)
	self.complete_heist_achievements.trophy_friendly_car.num_players = nil
end