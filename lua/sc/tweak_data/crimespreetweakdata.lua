function CrimeSpreeTweakData:init(tweak_data)
	self.unlock_level = 60
	self.base_difficulty = "overkill_145"
	self.base_difficulty_index = 5
	self.starting_levels = {
		0,
		20,
		40
	}
	self.allow_highscore_continue = true
	self.initial_cost = 0
	self.cost_per_level = 0.5
	self.randomization_cost = 6
	self.randomization_multiplier = 2
	self.catchup_bonus = 0.035
	self.winning_streak = 0.005
	self.winning_streak_reset_on_failure = false
	self.continue_cost = {6, 0.7}
	self.crash_causes_loss = false
	self.protection_threshold = 16
	self.announce_modifier_stinger = "stinger_feedback_positive"
	self:init_missions(tweak_data)
	self:init_rewards(tweak_data)
	self:init_modifiers(tweak_data)
	self:init_gage_assets(tweak_data)
	self:init_gui(tweak_data)
end

function CrimeSpreeTweakData:init_missions(tweak_data)
	local debug_short_add = 5
	local debug_med_add = 7
	local debug_long_add = 10
	self.missions = {
		{
			{
				stage_id = "branchbank_cash",
				id = "bb_cash",
				icon = "csm_branchbank",
				add = debug_short_add,
				level = tweak_data.narrative.stages.branchbank_cash
			},
			{
				stage_id = "firestarter_2_res",
				add = 5,
				id = "fs_2",
				icon = "csm_fs_2",
				level = tweak_data.narrative.stages.firestarter_2_res
			},
			{
				stage_id = "hox_3",
				add = 4,
				id = "hox_3",
				icon = "csm_hoxvenge",
				level = tweak_data.narrative.stages.hox_3
			},
			{
				stage_id = "election_day_2",
				add = 4,
				id = "ed_2",
				icon = "csm_election_2",
				level = tweak_data.narrative.stages.election_day_2
			},
			{
				stage_id = "crojob1",
				add = 8,
				id = "crojob1",
				icon = "csm_docks",
				level = tweak_data.narrative.stages.crojob1
			},
			{
				stage_id = "framing_frame_3",
				id = "framing_frame_3",
				icon = "csm_framing_3",
				add = debug_med_add,
				level = tweak_data.narrative.stages.framing_frame_3
			},
			{
				stage_id = "arm_for",
				id = "arm_for",
				icon = "csm_train_forest",
				add = debug_med_add,
				level = tweak_data.narrative.stages.arm_for
			},
			{
				stage_id = "friend",
				add = 8,
				id = "friend",
				icon = "csm_friend",
				level = tweak_data.narrative.stages.friend
			},
			{
				stage_id = "big",
				add = 13,
				id = "big",
				icon = "csm_big",
				level = tweak_data.narrative.stages.big
			},
			{
				stage_id = "mus",
				id = "mus",
				icon = "csm_diamond",
				add = debug_long_add,
				level = tweak_data.narrative.stages.mus
			},
			{
				stage_id = "roberts",
				id = "roberts",
				icon = "csm_go",
				add = debug_long_add,
				level = tweak_data.narrative.stages.roberts
			},
			{
				stage_id = "red2",
				id = "red2",
				icon = "csm_fwb",
				add = debug_long_add,
				level = tweak_data.narrative.stages.red2
			},
			{
				stage_id = "dah",
				add = 8,
				id = "dah",
				icon = "csm_dah",
				level = tweak_data.narrative.stages.dah
			},
			{
				stage_id = "mallcrasher",
				add = debug_short_add,
				id = "mallcrasher",
				icon = "csm_mallcrasher",
				level = tweak_data.narrative.stages.mallcrasher
			},
			{
				stage_id = "vit",
				add = 11,
				id = "vit",
				icon = "csm_vit",
				level = tweak_data.narrative.stages.vit
			},
			{
				stage_id = "arena",
				add = 10,
				id = "arena",
				icon = "csm_arena",
				level = tweak_data.narrative.stages.arena
			},
			{
				stage_id = "kenaz",
				add = 13,
				id = "kenaz",
				icon = "csm_kenaz",
				level = tweak_data.narrative.stages.kenaz
			},
			{
				stage_id = "sah",
				add = debug_med_add,
				id = "sah",
				icon = "csm_sah",
				level = tweak_data.narrative.stages.sah
			},
			{
				stage_id = "nightclub",
				add = debug_short_add,
				id = "nightclub",
				icon = "csm_nightclub",
				level = tweak_data.narrative.stages.nightclub
			},
			{
				stage_id = "bex",
				add = debug_long_add,
				id = "bex",
				icon = "csm_bex",
				level = tweak_data.narrative.stages.bex
			}
		},
		{
			{
				stage_id = "wwh",
				add = 8,
				id = "wwh",
				icon = "csm_wwh",
				level = tweak_data.narrative.stages.wwh
			},
			{
				stage_id = "rvd1",
				add = 8,
				id = "rvd1",
				icon = "csm_rvd_1",
				level = tweak_data.narrative.stages.rvd_1
			},
			{
				stage_id = "rvd2",
				add = 10,
				id = "rvd2",
				icon = "csm_rvd_2",
				level = tweak_data.narrative.stages.rvd_2
			},
			{
				stage_id = "brb",
				add = 8,
				id = "brb",
				icon = "csm_brb",
				level = tweak_data.narrative.stages.brb
			},
			{
				stage_id = "arm_cro",
				id = "arm_cro",
				icon = "csm_crossroads",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_cro
			},
			{
				stage_id = "help",
				id = "help",
				icon = "csm_prison",
				add = debug_short_add,
				level = tweak_data.narrative.stages.help
			},
			{
				stage_id = "cage",
				id = "arm_und",
				icon = "csm_overpass",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_und
			},
			{
				stage_id = "arm_hcm",
				id = "arm_hcm",
				icon = "csm_downtown",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_hcm
			},
			{
				stage_id = "arm_par",
				id = "arm_par",
				icon = "csm_park",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_par
			},
			{
				stage_id = "arm_fac",
				id = "arm_fac",
				icon = "csm_harbor",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_fac
			},
			{
				stage_id = "chew",
				add = 3,
				id = "biker_2",
				icon = "csm_biker_2",
				level = tweak_data.narrative.stages.chew
			},
			{
				stage_id = "firestarter_1_res",
				add = 4,
				id = "fs_1",
				icon = "csm_fs_1",
				level = tweak_data.narrative.stages.firestarter_1_res
			},
			{
				stage_id = "nail",
				id = "nail",
				icon = "csm_labrats",
				add = debug_short_add,
				level = tweak_data.narrative.stages.nail
			},
			{
				stage_id = "watchdogs_1_d",
				add = 6,
				id = "watchdogs_1_d",
				icon = "csm_watchdogs_1",
				level = tweak_data.narrative.stages.watchdogs_1_d
			},
			{
				stage_id = "pines",
				id = "pines",
				icon = "csm_white_xmas",
				add = debug_med_add,
				level = tweak_data.narrative.stages.pines
			},
			{
				stage_id = "moon",
				id = "moon",
				icon = "csm_stealing_xmas",
				add = debug_med_add,
				level = tweak_data.narrative.stages.moon
			},
			{
				stage_id = "spa",
				add = 8,
				id = "spa",
				icon = "csm_brooklyn",
				level = tweak_data.narrative.stages.spa
			},
			{
				stage_id = "cane",
				add = 8,
				id = "cane",
				icon = "csm_santas_workshop",
				level = tweak_data.narrative.stages.cane
			},
			{
				stage_id = "mia_2",
				add = 8,
				id = "mia_2",
				icon = "csm_miami_2",
				level = tweak_data.narrative.stages.mia_2
			},
			{
				stage_id = "nmh",
				add = 8,
				id = "nmh",
				icon = "csm_nmh",
				level = tweak_data.narrative.stages.nmh
			},
			{
				stage_id = "des",
				add = 9,
				id = "des",
				icon = "csm_des",
				level = tweak_data.narrative.stages.des
			},
			{
				stage_id = "election_day_3_skip1",
				add = debug_med_add,
				id = "election_day_3_skip1",
				icon = "csm_election_3",
				level = tweak_data.narrative.stages.election_day_3_skip1
			}
		},
		{
			{
				stage_id = "pbr2",
				add = 9,
				id = "pbr2",
				icon = "csm_sky",
				level = tweak_data.narrative.stages.pbr2
			},
			{
				stage_id = "pal",
				add = 9,
				id = "pal",
				icon = "csm_counterfeit",
				level = tweak_data.narrative.stages.pal
			},
			{
				stage_id = "flat",
				add = 12,
				id = "flat",
				icon = "csm_panic_room",
				level = tweak_data.narrative.stages.flat
			},
			{
				stage_id = "born",
				id = "born",
				icon = "csm_biker_1",
				add = debug_long_add,
				level = tweak_data.narrative.stages.born
			},
			{
				stage_id = "hox_2",
				add = 15,
				id = "hoxton_2",
				icon = "csm_hoxout_2",
				level = tweak_data.narrative.stages.hox_2
			},
			{
				stage_id = "hox_1",
				add = 10,
				id = "hoxton_1",
				icon = "csm_hoxout_1",
				level = tweak_data.narrative.stages.hox_1
			},
			{
				stage_id = "welcome_to_the_jungle_2",
				add = 14,
				id = "bo_2",
				icon = "csm_bigoil_2",
				level = tweak_data.narrative.stages.welcome_to_the_jungle_2
			},
			{
				stage_id = "mia_1",
				add = 10,
				id = "mia_1",
				icon = "csm_miami_1",
				level = tweak_data.narrative.stages.mia_1
			},
			{
				stage_id = "rat",
				add = 13,
				id = "cook_off",
				icon = "csm_rats_1",
				level = tweak_data.narrative.stages.rat
			},
			{
				stage_id = "pbr",
				id = "pbr",
				icon = "csm_mountain",
				add = debug_long_add,
				level = tweak_data.narrative.stages.pbr
			},
			{
				stage_id = "glace",
				add = 12,
				id = "glace",
				icon = "csm_glace",
				level = tweak_data.narrative.stages.glace
			},
			{
				stage_id = "run",
				add = 12,
				id = "run",
				icon = "csm_run",
				level = tweak_data.narrative.stages.run
			},
			{
				stage_id = "man",
				id = "man",
				icon = "csm_undercover",
				add = debug_long_add,
				level = tweak_data.narrative.stages.man
			},
			{
				stage_id = "dinner",
				add = 12,
				id = "dinner",
				icon = "csm_slaughterhouse",
				level = tweak_data.narrative.stages.dinner
			},
			{
				stage_id = "jolly",
				add = 12,
				id = "jolly",
				icon = "csm_aftershock",
				level = tweak_data.narrative.stages.jolly
			},
			{
				stage_id = "shoutout_raid",
				add = debug_long_add,
				id = "shoutout_raid",
				icon = "csm_shoutout_raid",
				level = tweak_data.narrative.stages.shoutout_raid
			},
			{
				stage_id = "bph",
				add = debug_long_add,
				id = "bph",
				icon = "csm_bph",
				level = tweak_data.narrative.stages.bph
			},
			{
				stage_id = "peta_1",
				add = 15,
				id = "peta_1",
				icon = "csm_peta",
				level = tweak_data.narrative.stages.peta_1
			}
		}
	}
end	

function CrimeSpreeTweakData:init_gage_assets(tweak_data)
	local asset_cost = 18
	self.max_assets_unlocked = 4
	self.assets = {increased_health = {}}
	self.assets.increased_health.name_id = "menu_cs_ga_increased_health"
	self.assets.increased_health.unlock_desc_id = "menu_cs_ga_increased_health_desc"
	self.assets.increased_health.icon = "csb_health"
	self.assets.increased_health.cost = 15
	self.assets.increased_health.data = {health = 10}
	self.assets.increased_health.class = "GageModifierMaxHealth"
	self.assets.increased_armor = {
		name_id = "menu_cs_ga_increased_armor",
		unlock_desc_id = "menu_cs_ga_increased_armor_desc",
		icon = "csb_armor",
		cost = asset_cost,
		data = {armor = 10},
		class = "GageModifierMaxArmor"
	}
	self.assets.increased_stamina = {
		name_id = "menu_cs_ga_increased_stamina",
		unlock_desc_id = "menu_cs_ga_increased_stamina_desc",
		icon = "csb_stamina",
		cost = 5,
		data = {stamina = 100},
		class = "GageModifierMaxStamina"
	}
	self.assets.increased_ammo = {
		name_id = "menu_cs_ga_increased_ammo",
		unlock_desc_id = "menu_cs_ga_increased_ammo_desc",
		icon = "csb_ammo",
		cost = asset_cost,
		data = {ammo = 15},
		class = "GageModifierMaxAmmo"
	}
	self.assets.increased_lives = {
		name_id = "menu_cs_ga_increased_lives",
		unlock_desc_id = "menu_cs_ga_increased_lives_desc",
		icon = "csb_lives",
		cost = asset_cost,
		data = {lives = 1},
		class = "GageModifierMaxLives"
	}
	self.assets.increased_throwables = {
		name_id = "menu_cs_ga_increased_throwables",
		unlock_desc_id = "menu_cs_ga_increased_throwables_desc",
		icon = "csb_throwables",
		cost = 15,
		data = {throwables = 70},
		class = "GageModifierMaxThrowables"
	}
	self.assets.increased_absorption = {
		name_id = "menu_cs_ga_increased_absorption",
		unlock_desc_id = "menu_cs_ga_increased_absorption_desc",
		icon = "csb_absorb",
		cost = 10,
		data = {absorption = 0.5},
		class = "GageModifierDamageAbsorption"
	}
	self.assets.quick_reload = {
		name_id = "menu_cs_ga_quick_reload",
		unlock_desc_id = "menu_cs_ga_quick_reload_desc",
		icon = "csb_reload",
		cost = asset_cost,
		data = {speed = 10},
		class = "GageModifierQuickReload"
	}
	self.assets.quick_switch = {
		name_id = "menu_cs_ga_quick_switch",
		unlock_desc_id = "menu_cs_ga_quick_switch_desc",
		icon = "csb_switch",
		cost = asset_cost,
		data = {speed = 25},
		class = "GageModifierQuickSwitch"
	}
	self.assets.quick_pagers = {
		name_id = "menu_cs_ga_quick_pagers",
		unlock_desc_id = "menu_cs_ga_quick_pagers_desc",
		icon = "csb_pagers",
		cost = asset_cost,
		data = {speed = 50},
		stealth = true,
		class = "GageModifierQuickPagers"
	}
	self.assets.increased_body_bags = {
		name_id = "menu_cs_ga_increased_body_bags",
		unlock_desc_id = "menu_cs_ga_increased_body_bags_desc",
		icon = "csb_bodybags",
		cost = asset_cost,
		data = {bags = 2},
		stealth = true,
		class = "GageModifierMaxBodyBags"
	}
	self.assets.quick_locks = {
		name_id = "menu_cs_ga_quick_locks",
		unlock_desc_id = "menu_cs_ga_quick_locks_desc",
		icon = "csb_locks",
		cost = asset_cost,
		data = {speed = 25},
		stealth = true,
		class = "GageModifierQuickLocks"
	}
end

function CrimeSpreeTweakData:init_modifiers(tweak_data)
	local health_increase = 0
	local damage_increase = 15
	self.max_modifiers_displayed = 3
	self.modifier_levels = {
		forced = 100,
		loud = 20,
		stealth = 26
	}
	self.modifiers = {
		forced = {
			{
				id = "damage_health_1",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 100,
				data = {
					health = {0, "add"},
					damage = {0, "add"}
				}
			}
		},
		loud = {
			--Mirrorshields
			{
				id = "shield_reflect",
				class = "ModifierShieldReflect",
				icon = "crime_spree_shield_reflect",
				data = {}
			},
			--More Titancloakers
			{
				id = "cloaker_smoke",
				class = "ModifierCloakerKick",
				icon = "crime_spree_cloaker_smoke",
				data = {}
			},
			--Shorter Medic Cooldown T1
			{
				id = "medic_heal_1",
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				data = {
					speed = {25, "add"}
				}
			},
			--50% less likely to be staggered
			{
				id = "no_hurt",
				class = "ModifierNoHurtAnims",
				icon = "crime_spree_no_hurt",
				data = {}
			},
			--Titan Taser spawn chance increase
			{
				id = "taser_overcharge",
				class = "ModifierTaserOvercharge",
				icon = "crime_spree_taser_overcharge",
				data = {}
			},
			--Increased UMP unit spawn chance
			{
				id = "heavies",
				class = "ModifierHeavies",
				icon = "crime_spree_ump_me_up",
				data = {}
			},
			--+2 Medic cap limit
			{
				id = "medic_1",
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				data = {
					inc = {2, "add"}
				}
			},
			--More Titan Shotgunners
			{
				id = "heavy_sniper",
				class = "ModifierHeavySniper",
				icon = "crime_spree_shotgun",
				data = {
					spawn_chance = {5, "add"}
				}
			},
			--Dozer DR on visor break
			{
				id = "dozer_rage",
				class = "ModifierDozerRage",
				icon = "crime_spree_dozer_rage",
				data = {
					damage_resistance = {10, "add"}
				}
			},
			--More Titan HRTs
			{
				id = "cloaker_tear_gas",
				class = "ModifierCloakerTearGas",
				icon = "crime_spree_cloaker_tear_gas",
				data = {}
			},
			--Higher Dozer Cap T1
			{
				id = "dozer_1",
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				data = {
					inc = {2, "add"}
				}
			},
			--Shorter Medic Cooldown T2
			{
				id = "medic_heal_2",
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				data = {
					speed = {25, "add"}
				}
			},
			--30% chance for Semi-auto Dozers
			{
				id = "dozer_lmg",
				class = "ModifierSkulldozers",
				icon = "crime_spree_more_dozers",
				data = {}
			},
			--More Omnia LPFs
			{
				id = "medic_adrenaline",
				class = "ModifierMedicAdrenaline",
				icon = "crime_spree_youre_that_ninja",
				data = {}
			},
			--Titanshield spawn chance increase
			{
				id = "shield_phalanx",
				class = "ModifierShieldPhalanx",
				icon = "crime_spree_shield_phalanx",
				data = {}
			},
			--Higher Dozer Cap T2
			{
				id = "dozer_2",
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				data = {
					inc = {2, "add"}
				}
			},
			--Medic heals everyone around him in AoE on death
			{
				id = "medic_deathwish",
				class = "ModifierMedicDeathwish",
				icon = "crime_spree_medic_deathwish",
				data = {}
			},
			--Titan Dozer spawn increase
			{
				id = "dozer_minigun",
				class = "ModifierDozerMinigun",
				icon = "crime_spree_titandozer",
				data = {}
			},
			--Higher Medic Cap T2
			{
				id = "medic_2",
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				data = {
					inc = {2, "add"}
				}
			},
			--Dozer Explosion Immunity
			{
				id = "dozer_immunity",
				class = "ModifierExplosionImmunity",
				icon = "crime_spree_dozer_explosion",
				data = {}
			},
			--Vet Cop Spawn increase
			{
				id = "dozer_medic",
				class = "ModifierDozerMedic",
				icon = "crime_spree_heavies",
				data = {}
			},
			--Longer assault waves
			{
				id = "assault_extender",
				class = "ModifierAssaultExtender",
				icon = "crime_spree_assault_extender",
				data = {
					duration = {50, "add"},
					spawn_pool = {50, "add"},
					deduction = {8, "add"},
					max_hostages = {4, "none"}
				}
			},
			--Cloaker jumpkicks down players
			{
				id = "cloaker_arrest",
				class = "ModifierCloakerArrest",
				icon = "crime_spree_cloaker_arrest",
				data = {}
			},
			--Medic gets damage increase for every unit that dies near him
			{
				id = "medic_rage",
				class = "ModifierMedicRage",
				icon = "crime_spree_medic_rage",
				data = {
					damage = {5, "add"}
				}
			}
		},
		stealth = {
			{
				class = "ModifierLessPagers",
				id = "pagers_1",
				icon = "crime_spree_call_me_and_tell_me_i_am_not_alone",
				level = 26,
				data = {}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_1",
				icon = "crime_spree_civs_killed",
				level = 26,
				data = {count = {
					2,
					"min"
				}}
			},
			{
				class = "ModifierLessConcealment",
				id = "conceal_1",
				icon = "crime_spree_dun_dun_dun_dunna",
				level = 26,
				data = {}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_2",
				icon = "crime_spree_civs_killed",
				level = 52,
				data = {count = {
					1,
					"min"
				}}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_2",
				icon = "crime_spree_call_me_and_tell_me_i_am_not_alone",
				level = 78,
				data = {}
			},
			{
				class = "ModifierLessConcealment",
				id = "conceal_2",
				icon = "crime_spree_dun_dun_dun_dunna",
				level = 104,
				data = {}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_3",
				icon = "crime_spree_call_me_and_tell_me_i_am_not_alone",
				level = 130,
				data = {}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_3",
				icon = "crime_spree_civs_killed",
				level = 156,
				data = {count = {
					0,
					"min"
				}}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_4",
				icon = "crime_spree_call_me_and_tell_me_i_am_not_alone",
				level = 182,
				data = {}
			}
		}
	}
	--i don't THINK this is used but i really don't want to take the chance
	self.repeating_modifiers = {
		forced = {
			{
				id = "damage_health_rpt_",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 5,
				data = {
					health = {0, "add"},
					damage = {0, "add"}
				}
			}
		}
	}

	--Grace period scaling in crime spree.
	self.grace_scaling = {
		min_level = 500,
		level_interval = 100,
		amount = 0.016666667
	}
end