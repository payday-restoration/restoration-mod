if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

-- Custom suit poses
Hooks:PostHook(TweakData, "_setup_scene_poses", "assfucker9000", function(self)
	self.scene_poses.player_style.loud_suit = {"military", "military"}
	self.scene_poses.player_style.suit_sunny = {"lbv", "lbv"}
	self.scene_poses.player_style.winter_suit = {"rain", "rain"}
	self.scene_poses.player_style.suit_pool = {"doctor", "doctor"}			
end)

end