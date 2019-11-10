if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

-- Custom suit poses
Hooks:PostHook(TweakData, "_setup_scene_poses", "assfucker9000", function(self)
	self.scene_poses.player_style = {
		generic = {
			"standard_suit",
			"standard_suit"
		},
		sneak_suit = {
			"sneak",
			"sneak"
		},
		scrub = {
			"doctor",
			"doctor"
		},
		raincoat = {
			"rain",
			"rain"
		},
		murky_suit = {
			"military",
			"military"
		},
		tux = {
			"tuxedo",
			"tuxedo"
		},
		winter_suit = {
			"winter",
			"winter"
		},
		jumpsuit = {
			"jump",
			"jump"
		},
		clown = {
			"clown",
			"clown"
		},
		peacoat = {
			"peacoat",
			"peacoat"
		},
		miami = {
			"italian",
			"italian"
		},
		loud_suit = {
			"military",
			"military"
		},		
		jail = {
			"standard_suit",
			"standard_suit"
		}
	}
end)

end