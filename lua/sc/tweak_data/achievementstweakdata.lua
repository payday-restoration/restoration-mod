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
	
	self.enemy_melee_hit_achievements.steel_4 = {
		enemy = "tank",
		enemy_weapon = "saiga_dozer",
		award = "steel_4",
		result = "death",
		melee_id = "great"
	}
	
	self.enemy_kill_achievements.man_with_golden_gun = {
		weapon = "akm_gold",
		stat = "gage3_2_stats",
		enemy = "tank",
		enemy_weapon = "m249_dozer"
	}
	
	self.enemy_kill_achievements.pim_1.enemies = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.enemy_kill_achievements.pim_3.enemies = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"taser",
		"taser_titan_reaper",
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault",
		"sniper",
		"heavy_swat_sniper",
		"weekend_dmr",
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_hw",
		"tank_hw_black",
		"medic",
		"enforcer_assault"
	}
	
	
	--Lets Titan Snipers count for Martial Law
	self.enemy_kill_achievements.ranc_11.enemies = {
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}

		
end