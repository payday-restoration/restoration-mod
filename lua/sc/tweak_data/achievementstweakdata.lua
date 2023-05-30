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
	
	self.complete_heist_achievements.tawp_1 = {
		mask = "flm",
		award = "tawp_1",
		job = "help",
		difficulty = veryhard_and_above,
		specials_killed = {
			{
			enemies = {
			"spooc",
			"spooc_titan"
			},
			count = 1
			}
		}
	}
	
	self.complete_heist_achievements.trophy_courtesy = {
		complete_job = true,
		job = "pbr",
		trophy_stat = "trophy_courtesy",
		difficulty = easywish_and_above,
		killed = {
			medic = 0,
			omnia_lpf = 0
		}
	}
	
	self.complete_heist_achievements.challenge_geneva = {
		complete_job = true,
		challenge_award = "challenge_geneva",
		job = "red2",
		difficulty = overkill_and_above,
		killed = {
			medic = 0,
			omnia_lpf = 0
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
	
	--Makes Not Hard Enough actually work
	self.complete_heist_achievements.farm_1 = {
		spring_alive = true,
		award = "farm_1",
		job = "dinner",
		difficulty = overkill_and_above
	}
	
	self.pincushion = {
		award = "scorpion_3",
		weapon_category = "bow",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
			
		},
		count = 10
	}

	--Explosive stuff
	self.grenade_achievements.boom_shakalaka = {
		kill = true,
		flying_strike = true,
		award = "gage5_7",
		grenade_type = "launcher_frag",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
		}
	}
	
	self.grenade_achievements.steel_3 = {
		kill = true,
		grenade_type = "wpn_prj_jav",
		award = "steel_3",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
		}
	}
	
	self.grenade_achievements.tango_2 = {
		kill = true,
		stat = "tango_2_stats",
		grenade_type = "launcher_frag_arbiter",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		}
	}
	
	self.grenade_achievements.any_sniper_kills = {
		kill = true,
		challenge_stat = "any_sniper_kills",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		}
	}
	
	self.grenade_achievements.any_shield_kills = {
		kill = true,
		challenge_stat = "any_shield_kills",
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		}
	}
	
	self.grenade_achievements.any_taser_kills = {
		kill = true,
		challenge_stat = "any_taser_kills",
		enemies = {
			"taser",
			"taser_titan",
			"taser_titan_reaper",
			"taser_summers" --why not?
		}
	}
	
	self.grenade_achievements.any_tank_kills = {
		kill = true,
		challenge_stat = "any_tank_kills",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
			
		}
	}
	
	self.grenade_achievements.any_spooc_kills = {
		kill = true,
		challenge_stat = "any_spooc_kills",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
			
		}
	}
	
	self.grenade_achievements.trophy_special_kills = {
		kill = true,
		challenge_stat = "trophy_special_kills",
		enemies = {
			"shield",
			"spooc",
			"spooc_gangster",
			"tank",
			"tank_biker",
			"tank_hw",
			"tank_green",
			"tank_black",
			"tank_skull",
			"taser",
			"boom",
			"boom_summers",
			"taser_summers",
			"medic_summers",
			"medic",
			"sniper",
			"phalanx_minion",
			"phalanx_vip",
			"heavy_swat_sniper",
			"weekend_dmr",
			"weekend_lmg",
			"tank_titan",
			"tank_titan_assault",
			"enforcer",
			"enforcer_assault",
			"spring",
			"headless_hatman",
			"summers",
			"omnia_lpf",
			"hrt_titan",
			"fbi_vet",
			"city_swat_titan",
			"city_swat_titan_assault",
			"swat_turret",
			"biker_boss",
			"chavez_boss",
			"mobster_boss",
			"hector_boss",
			"hector_boss_no_armor",
			"tank_medic",
			"tank_mini",
			"phalanx_minion_assault",
			"spooc_titan",
			"taser_titan",
			"taser_titan_reaper",
			"autumn",
			"marshal_marksman",
			"marshal_shield",
			"snowman_boss"
		}
	}
	
	self.grenade_achievements.trophy_medic = {
		kill = true,
		challenge_stat = "trophy_medic",
		enemies = {
			"medic_summers",
			"medic",
			"omnia_lpf"
			
		}
	}
	
	self.grenade_achievements.cac_1 = {
		kill = true,
		grenade_type = "launcher_frag_slap",
		distance = 4000,
		award = "cac_1",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		}
	}
	--Weapon Kill Stuff
	self.enemy_kill_achievements.im_not_a_crook = {
		weapon = "s552",
		stat = "armored_7_stat",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		},
		mask = "nixon"
	}
	
	self.enemy_kill_achievements.fool_me_once = {
		weapon = "m45",
		stat = "armored_9_stat",
		mask = "bush",
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_vip", --why not?
			"phalanx_minion_assault",
			"marshal_shield"
		}
	}
	
	self.enemy_kill_achievements.surprise_motherfucker = {
		weapon = "m95",
		stat = "gage3_12_stats",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
			
		}
	}
	
	self.enemy_kill_achievements.man_with_golden_gun = {
		weapon = "akm_gold",
		stat = "gage3_2_stats",
		enemy = "tank",
		enemy_weapon = "m249_dozer"
	}
	
	self.enemy_kill_achievements.dodge_this = {
		in_head = true,
		stat = "gage3_11_stats",
		weapon = "m95",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
			
		}
	}
	
	self.enemy_kill_achievements.grand_master_sniper = {
		weapon = "msr",
		stat = "gage3_14_stats",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		}
	}
	
	self.enemy_kill_achievements.knock_knock = {
		weapon_type = "shotgun",
		stat = "gage4_6_stats",
		part_id = "wpn_fps_upg_a_slug",
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		}
	}
	
	self.enemy_kill_achievements.peek_a_boo = {
		weapon_type = "shotgun",
		stat = "gage4_8_stats",
		part_id = "wpn_fps_upg_a_piercing",
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		}
	}
	
	self.enemy_kill_achievements.bang_for_buck = {
		weapon_type = "shotgun",
		stat = "gage4_10_stats",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
			
		},
		parts = {
			"wpn_fps_upg_a_custom",
			"wpn_fps_upg_a_custom_free"
		}
	}
	
	self.enemy_kill_achievements.grind_fest = {
		weapon = "g3",
		stat = "gage5_1_stats",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
			
		}
	}
	
	self.enemy_kill_achievements.kill_streak = {
		weapon = "galil",
		stat = "gage5_9_stats",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
			
		}
	}
	
	self.enemy_kill_achievements.any_sniper_kills = {
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		},
		challenge_stat = "any_sniper_kills"
	}
	
	self.enemy_kill_achievements.any_shield_kills = {
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		},
		challenge_stat = "any_shield_kills"
	}
	
	self.enemy_kill_achievements.any_taser_kills = {
		enemies = {
			"taser",
			"taser_titan",
			"taser_titan_reaper",
			"taser_summers" --why not?
		},
		challenge_stat = "any_taser_kills"
	}
	
	self.enemy_kill_achievements.any_tank_kills = {
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		challenge_stat = "any_tank_kills"
	}
	
	self.enemy_kill_achievements.any_spooc_kills = {
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
		},
		challenge_stat = "any_spooc_kills"
	}
	
	self.enemy_kill_achievements.trophy_special_kills = {
		trophy_stat = "trophy_special_kills",
		enemies = {
			"shield",
			"spooc",
			"spooc_gangster",
			"tank",
			"tank_biker",
			"tank_hw",
			"tank_green",
			"tank_black",
			"tank_skull",
			"taser",
			"boom",
			"boom_summers",
			"taser_summers",
			"medic_summers",
			"medic",
			"sniper",
			"phalanx_minion",
			"phalanx_vip",
			"heavy_swat_sniper",
			"weekend_dmr",
			"weekend_lmg",
			"tank_titan",
			"tank_titan_assault",
			"enforcer",
			"enforcer_assault",
			"spring",
			"headless_hatman",
			"summers",
			"omnia_lpf",
			"hrt_titan",
			"fbi_vet",
			"city_swat_titan",
			"city_swat_titan_assault",
			"swat_turret",
			"biker_boss",
			"chavez_boss",
			"mobster_boss",
			"hector_boss",
			"hector_boss_no_armor",
			"tank_medic",
			"tank_mini",
			"phalanx_minion_assault",
			"spooc_titan",
			"taser_titan",
			"taser_titan_reaper",
			"autumn",
			"marshal_marksman",
			"marshal_shield",
			"snowman_boss"
		}
	}
	
	self.enemy_kill_achievements.trophy_medic = {
		trophy_stat = "trophy_medic",
		enemies = {
			"medic",
			"medic_summers",
			"omnia_lpf"
		}
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
	
	self.enemy_kill_achievements.cg22_personal_3.enemies = {
		"shield",
		"spooc",
		"spooc_gangster",
		"tank",
		"tank_biker",
		"tank_hw",
		"tank_green",
		"tank_black",
		"tank_skull",
		"taser",
		"boom",
		"boom_summers",
		"taser_summers",
		"medic_summers",
		"medic",
		"sniper",
		"phalanx_minion",
		"phalanx_vip",
		"heavy_swat_sniper",
		"weekend_dmr",
		"weekend_lmg",
		"tank_titan",
		"tank_titan_assault",
		"enforcer",
		"enforcer_assault",
		"spring",
		"headless_hatman",
		"summers",
		"omnia_lpf",
		"hrt_titan",
		"fbi_vet",
		"city_swat_titan",
		"city_swat_titan_assault",
		"swat_turret",
		"biker_boss",
		"chavez_boss",
		"mobster_boss",
		"hector_boss",
		"hector_boss_no_armor",
		"tank_medic",
		"tank_mini",
		"phalanx_minion_assault",
		"spooc_titan",
		"taser_titan",
		"taser_titan_reaper",
		"autumn",
		"marshal_marksman",
		"marshal_shield",
		"snowman_boss"
	}
	
	self.enemy_kill_achievements.cg22_post_objective_2 = {
		weapon = "victor",
		stat = "cg22_post_objective_2",
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
			
		},
		difficulty = veryhard_and_above
	}
	
	self.enemy_kill_achievements.cg22_post_objective_5 = {
		stat = "cg22_post_objective_5",
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		difficulty = overkill_and_above
	}
	
	--Meele Kill Stuff
	self.enemy_melee_hit_achievements.cloak_n_dagger = {
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
		},
		melee_type = "knife",
		award = "gage2_2",
		result = "death"
	}
	
	self.enemy_melee_hit_achievements.are_you_kidding_me = {
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		melee_type = "knife",
		award = "gage2_10",
		result = "death"
	}
	
	self.enemy_melee_hit_achievements.are_you_kidding_me = {
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		melee_type = "knife",
		award = "gage2_10",
		result = "death"
	}
	
	--Include City SWATs in I Ain't Got Time to Bleed
	self.enemy_melee_hit_achievements.no_time_to_bleed.enemies = {
		"fbi_swat",
		"city_swat",
		"fbi_heavy_swat"
	}
	
	self.enemy_melee_hit_achievements.police_brutality = {
		melee_id = "baton",
		award = "gage4_1",
		result = "death",
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		}
	}
	
	self.enemy_melee_hit_achievements.knockout = {
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		melee_id = "boxing_gloves",
		award = "gorilla_1",
		result = "death"
	}
	
	self.enemy_melee_hit_achievements.steel_2 = {
		award = "steel_2",
		result = "death",
		melee_weapons = {
			"morning",
			"buck",
			"beardy",
			"great"
		},
		enemy_kills = {
			enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		},
			count = 10
		}
	}
	
	self.enemy_melee_hit_achievements.steel_4 = {
		enemy = "tank",
		enemy_weapon = "saiga_dozer",
		award = "steel_4",
		result = "death",
		melee_id = "great"
	}
	
	self.enemy_melee_hit_achievements.any_sniper_kills = {
		result = "death",
		is_not_civilian = true,
		enemies = {
			"sniper",
			"marshal_marksman",
			"heavy_swat_sniper",
			"weekend_dmr"
		},
		challenge_stat = "any_sniper_kills"
	}
	
	self.enemy_melee_hit_achievements.any_shield_kills = {
		result = "death",
		is_not_civilian = true,
		enemies = {
			"shield",
			"phalanx_minion",
			"phalanx_minion_assault",
			"phalanx_vip", --why not?
			"marshal_shield"
		},
		challenge_stat = "any_shield_kills"
	}
	
	self.enemy_melee_hit_achievements.any_taser_kills = {
		result = "death",
		is_not_civilian = true,
		enemies = {
			"taser",
			"taser_titan",
			"taser_titan_reaper",
			"taser_summers" --why not?
		},
		challenge_stat = "any_taser_kills"
	}
	
	self.enemy_melee_hit_achievements.any_tank_kills = {
		result = "death",
		is_not_civilian = true,
		enemies = {
			"tank",
			"tank_medic",
			"tank_mini",
			"tank_titan",
			"tank_titan_assault",
			"spring", --why not?
			"headless_hatman",
			"tank_hw",
			"tank_hw_black",
			"tank_biker"
		},
		challenge_stat = "any_tank_kills"
	}
	
	self.enemy_melee_hit_achievements.any_spooc_kills = {
		result = "death",
		is_not_civilian = true,
		enemies = {
			"spooc",
			"spooc_gangster",
			"autumn", --why not?
			"spooc_titan"
		},
		challenge_stat = "any_spooc_kills"
	}
	
	self.enemy_melee_hit_achievements.trophy_knockouts.enemies = {
		"tank",
		"tank_medic",
		"tank_mini",
		"tank_titan",
		"tank_titan_assault",
		"spring", --why not?
		"headless_hatman",
		"tank_hw",
		"tank_hw_black",
		"tank_biker"
	}
	
	self.enemy_melee_hit_achievements.trophy_medic = {
		is_not_civilian = true,
		trophy_stat = "trophy_medic",
		enemies = {
			"medic",
			"medic_summers",
			"omnia_lpf"
		},
		result = "death"
	}
	
	self.enemy_melee_hit_achievements.trophy_special_kills = {
		trophy_stat = "trophy_special_kills",
			is_not_civilian = true,
			result = "death",
			enemies = {
			"shield",
			"spooc",
			"spooc_gangster",
			"tank",
			"tank_biker",
			"tank_hw",
			"tank_green",
			"tank_black",
			"tank_skull",
			"taser",
			"boom",
			"boom_summers",
			"taser_summers",
			"medic_summers",
			"medic",
			"sniper",
			"phalanx_minion",
			"phalanx_vip",
			"heavy_swat_sniper",
			"weekend_dmr",
			"weekend_lmg",
			"tank_titan",
			"tank_titan_assault",
			"enforcer",
			"enforcer_assault",
			"spring",
			"headless_hatman",
			"summers",
			"omnia_lpf",
			"hrt_titan",
			"fbi_vet",
			"city_swat_titan",
			"city_swat_titan_assault",
			"swat_turret",
			"biker_boss",
			"chavez_boss",
			"mobster_boss",
			"hector_boss",
			"hector_boss_no_armor",
			"tank_medic",
			"tank_mini",
			"phalanx_minion_assault",
			"spooc_titan",
			"taser_titan",
			"taser_titan_reaper",
			"autumn",
			"marshal_marksman",
			"marshal_shield",
			"snowman_boss"
		}
	}

		
end