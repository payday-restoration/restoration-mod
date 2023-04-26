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
	--Hedgehog now applies to all dozers (including titan counterparts)
	self.pincushion.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	--Killing Achivements now applies to Titan counterparts+other special units
	self.grenade_achievements.boom_shakalaka.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.grenade_achievements.steel_3.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.grenade_achievements.tango_2.enemy = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	--Side Job Kills
	self.grenade_achievements.any_sniper_kills.enemy = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.grenade_achievements.any_shield_kills.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.grenade_achievements.any_taser_kills.enemy = {
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper"
	}
	
	self.grenade_achievements.any_tank_kills.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.grenade_achievements.any_spooc_kills.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.grenade_achievements.trophy_special_kills.enemies = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc",
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper",
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault",
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr",
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black",
		"medic",
		"omnia_lpf",
		"enforcer",
		"enforcer_assault",
		"medic_summers"
	}
	
	self.grenade_achievements.trophy_medic.enemies = {
		"medic",
		"omnia_lpf",
		"medic_summers"
	}
	--Ditto but for weapons
	self.enemy_kill_achievements.fool_me_once.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_kill_achievements.surprise_motherfucker.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_kill_achievements.man_with_golden_gun.enemy_weapon = {
		"hk21_dozer",
		"m249_dozer",
		"rpk_dozer",
		"m60"
	}
	
	self.enemy_kill_achievements.dodge_this.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_kill_achievements.grand_master_sniper.enemies = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.enemy_kill_achievements.peek_a_boo.enemy = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.enemy_kill_achievements.knock_knock.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_kill_achievements.bang_for_buck.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_kill_achievements.grind_fest.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_kill_achievements.kill_streak.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_kill_achievements.any_sniper_kills.enemy = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.enemy_kill_achievements.any_shield_kills.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_kill_achievements.any_taser_kills.enemy = {
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper"
	}
	
	self.enemy_kill_achievements.any_tank_kills.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_kill_achievements.any_spooc_kills.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_kill_achievements.trophy_special_kills.enemies = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc",
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper",
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault",
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr",
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black",
		"medic",
		"omnia_lpf",
		"enforcer",
		"enforcer_assault",
		"medic_summers"
	}
	
	self.enemy_kill_achievements.trophy_medic.enemies = {
		"medic",
		"omnia_lpf",
		"medic_summers"
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
	
	self.enemy_kill_achievements.cg22_post_objective_2.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_kill_achievements.cg22_post_objective_5.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	--Lets Titan Snipers count for Martial Law
	self.enemy_kill_achievements.ranc_11.enemies = {
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	--Ditto but for melee weapons
	self.enemy_melee_hit_achievements.cloak_n_dagger.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_melee_hit_achievements.are_you_kidding_me.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_melee_hit_achievements.police_brutality.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_melee_hit_achievements.knockout.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_melee_hit_achievements.steel_2.enemy_kills.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_melee_hit_achievements.steel_4 = {
		enemy = { 
			"tank",
			"tank_hw_black"
		}
		enemy_weapon = { 
			"saiga_dozer",
			"aa12_dozer"
		}
		award = "steel_4",
		result = "death",
		melee_id = "great"
	}
	
	self.enemy_melee_hit_achievements.any_sniper_kills.enemy = {
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr"
	}
	
	self.enemy_melee_hit_achievements.any_shield_kills.enemy = {
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	self.enemy_melee_hit_achievements.any_taser_kills.enemy = {
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper"
	}
	
	self.enemy_melee_hit_achievements.any_tank_kills.enemy = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_melee_hit_achievements.any_spooc_kills.enemy = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc"
	}
	
	self.enemy_melee_hit_achievements.trophy_knockouts.enemies = {
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black"
	}
	
	self.enemy_melee_hit_achievements.trophy_medic.enemy = {
		"medic",
		"omnia_lpf",
		"medic_summers"
	}
	
	self.enemy_melee_hit_achievements.trophy_special_kills.enemies = {
		"spooc",
		"spooc_titan",
		"spooc_gangster",
		"shadow_spooc",
		"taser",
		"taser_titan",
		"taser_summers",
		"taser_titan_reaper",
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault",
		"sniper",
		"marshal_marksman",
		"heavy_swat_sniper",
		"weekend_dmr",
		"tank",
		"tank_titan",
		"tank_titan_assault",
		"tank_mini",
		"tank_medic",
		"tank_biker",
		"tank_hw",
		"tank_hw_black",
		"medic",
		"omnia_lpf",
		"enforcer",
		"enforcer_assault",
		"medic_summers"
	}
		
end