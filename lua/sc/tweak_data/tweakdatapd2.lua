if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

-- Custom suit poses
Hooks:PostHook(TweakData, "_setup_scene_poses", "assfucker9000", function(self)
	self.scene_poses.player_style.loud_suit = {"military", "military"}
end)

end