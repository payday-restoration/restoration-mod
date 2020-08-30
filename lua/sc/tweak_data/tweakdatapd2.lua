-- Custom menu poses
Hooks:PostHook(TweakData, "_setup_scene_poses", "ResScenePoses", function(self)
	self.scene_poses.player_style.loud_suit = {"military", "military"}
	self.scene_poses.player_style.suit_sunny = {"lbv", "lbv"}
	self.scene_poses.player_style.winter_suit = {"rain", "rain"}
	self.scene_poses.player_style.sneak_suit = {"winter", "winter"}
	self.scene_poses.player_style.suit_pool = {"doctor", "doctor"}			
	self.scene_poses.player_style.suit_prison = {"sneak", "sneak"}
	self.scene_poses.weapon.ray = {"husk_generic1", "husk_generic2", "husk_generic3", "husk_generic4"}
	self.scene_poses.weapon.ray.required_pose = false
	self.scene_poses.weapon.osipr = {"husk_mosconi"}
end)