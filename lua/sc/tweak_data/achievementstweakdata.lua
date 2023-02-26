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
	
	--Turtle Always Wins doesn't check for deployable anymore, as armor kit doesn't exist in resmod.
	self.complete_heist_achievements.turtle_wins = {
		timer = 240,
		stealth = true,
		award = "ameno_6",
		job = "gallery",
		equipped_team = {
			armor = "level_7"
		}
	}		
	
	--Lets Titan Snipers count for Martial Law
	self.enemy_kill_achievements.ranc_11.enemies = {
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
		
end