local old_init = AchievementsTweakData.init
function AchievementsTweakData:init(tweak_data)
	old_init(self, tweak_data)
	
	--Tag, you're it! no longer needs a full team
	self.complete_heist_achievements.trophy_friendly_car.num_players = nil
	
	--Fix for Russian Arsenal to be possible
	self.complete_heist_achievements.grv_1 = {
		award = "grv_1",
		difficulty = overkill_and_above,		
		equipped_outfit = {
			melee_weapon = "oxide",
			primaries = {
				"wpn_fps_snp_siltstone",
				"wpn_fps_ass_flint",
				"wpn_fps_smg_coal"
			}
		}
	}
	
	--Fix for Sneaky Beaky Like to be possible
	self.complete_heist_achievements.grv_4 = {
		stealth = true,
		award = "grv_4",		
		equipped_outfit = {
			melee_weapon = "oxide",
			primaries = {
				"wpn_fps_snp_siltstone",
				"wpn_fps_ass_flint",
				"wpn_fps_smg_coal"
			}
		}
	}
	
end