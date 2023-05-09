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
	
	--Include Transport: Train Heist in I Do What I Do Best, I Take Scores
	self.complete_heist_achievements.i_take_scores = {
		stat = "armored_4_stat",
		mask = "heat",
		difficulty = overkill_and_above,
		jobs = {
			"arm_cro",
			"arm_und",
			"arm_hcm",
			"arm_par",
			"arm_fac",
			"arm_for"
		}
	}
	
	self.complete_heist_achievements.farm_1 = {
		spring_alive = true,
		award = "farm_1",
		job = "dinner",
		difficulty = overkill_and_above
	}
	
	self.enemy_melee_hit_achievements.steel_4 = {
		enemy = "tank",
		enemy_weapon = "saiga_dozer",
		award = "steel_4",
		result = "death",
		melee_id = "great"
	}
	
	--Include City SWATs in I Ain't Got Time to Bleed
	self.enemy_melee_hit_achievements.no_time_to_bleed.enemies = {
		"fbi_swat",
		"city_swat",
		"fbi_heavy_swat"
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
		"fbi_vet",
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"taser",
		"taser_titan_reaper",
		"shield",
		"boom",
		"phalanx_minion",
		"phalanx_minion_assault",
		"sniper",
		"heavy_swat_sniper",
		"city_swat_titan",
		"city_swat_titan_assault",
		"weekend_dmr",
		"weekend_lmg",
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