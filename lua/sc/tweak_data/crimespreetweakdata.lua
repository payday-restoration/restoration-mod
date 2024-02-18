function CrimeSpreeTweakData:init(tweak_data)
	self.unlock_level = 60
	self.base_difficulty = "overkill_145"
	self.base_difficulty_index = 5
	self.starting_levels = {
		0,
		200,
		400
	}
	self.allow_highscore_continue = true
	self.initial_cost = 6
	self.cost_per_level = 0.75
	self.randomization_cost = 6
	self.randomization_multiplier = 2
	self.catchup_bonus = 0.035
	self.catchup_limit = 100
	self.catchup_min_level = 100
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
	self:init_exclusion_data()
end

function CrimeSpreeTweakData:init_exclusion_data()
	self.excluded_enemies = {
		damage = table.list_to_set({}),
		health = table.list_to_set({})
	}
end

function CrimeSpreeTweakData:init_missions(tweak_data)
	local debug_very_short_add = 5
	local debug_short_add = 8
	local debug_med_add = 10
	local debug_long_add = 15
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
				add = debug_short_add,
				id = "firestarter_2_res",
				icon = "csm_fs_2",
				level = tweak_data.narrative.stages.firestarter_2_res
			},
			{
				stage_id = "hox_3",
				add = 7,
				id = "hox_3",
				icon = "csm_hoxvenge",
				level = tweak_data.narrative.stages.hox_3
			},
			{
				stage_id = "election_day_2",
				add = 6,
				id = "ed_2",
				icon = "csm_election_2",
				level = tweak_data.narrative.stages.election_day_2
			},
			{
				stage_id = "crojob1",
				add = debug_med_add,
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
				add = 18,
				level = tweak_data.narrative.stages.arm_for
			},
			{
				stage_id = "friend",
				add = 12,
				id = "friend",
				icon = "csm_friend",
				level = tweak_data.narrative.stages.friend
			},
			{
				stage_id = "big",
				add = debug_long_add,
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
				stage_id = "roberts_v2",
				id = "roberts_v2",
				icon = "csm_go",
				add = debug_long_add,
				level = tweak_data.narrative.stages.roberts_v2
			},
			{
				stage_id = "red2",
				id = "red2",
				icon = "csm_fwb",
				add = debug_long_add,
				level = tweak_data.narrative.stages.red2
			},
			{
				stage_id = "pex",
				id = "pex",
				icon = "csm_pex",
				add = debug_short_add,
				level = tweak_data.narrative.stages.pex
			},			
			{
				stage_id = "dah",
				add = 12,
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
				add = 17,
				id = "vit",
				icon = "csm_vit",
				level = tweak_data.narrative.stages.vit
			},
			{
				stage_id = "arena",
				add = debug_long_add,
				id = "arena",
				icon = "csm_arena",
				level = tweak_data.narrative.stages.arena
			},
			{
				stage_id = "kenaz",
				add = debug_long_add,
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
			},
			{
				stage_id = "four_stores_remixed",
				add = debug_very_short_add,
				id = "four_stores_remixed",
				icon = "csm_four_stores",
				level = tweak_data.narrative.stages.four_stores_remixed
			},
			{
				stage_id = "ukrainian_job_res",
				add = debug_very_short_add,
				id = "ukrainian_job_res",
				icon = "csm_ukrainian_job",
				level = tweak_data.narrative.stages.ukrainian_job_res
			},
			{
				stage_id = "family",
				add = debug_short_add,
				id = "family",
				icon = "csm_family",
				level = tweak_data.narrative.stages.family
			},
			{
				stage_id = "wetwork",
				add = 6,
				id = "wetwork",
				icon = "csm_wetwork",
				level = tweak_data.narrative.stages.wetwork
			}
		},
		{
			{
				stage_id = "wwh",
				add = 12,
				id = "wwh",
				icon = "csm_wwh",
				level = tweak_data.narrative.stages.wwh
			},
			{
				stage_id = "rvd1",
				add = 12,
				id = "rvd1",
				icon = "csm_rvd_1",
				level = tweak_data.narrative.stages.rvd_1
			},
			{
				stage_id = "rvd2",
				add = debug_long_add,
				id = "rvd2",
				icon = "csm_rvd_2",
				level = tweak_data.narrative.stages.rvd_2
			},
			{
				stage_id = "brb",
				add = 12,
				id = "brb",
				icon = "csm_brb",
				level = tweak_data.narrative.stages.brb
			},
			{
				stage_id = "arm_cro",
				id = "arm_cro",
				icon = "csm_crossroads",
				add = debug_very_short_add,
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
				add = debug_very_short_add,
				level = tweak_data.narrative.stages.arm_und
			},
			{
				stage_id = "arm_hcm",
				id = "arm_hcm",
				icon = "csm_downtown",
				add = debug_very_short_add,
				level = tweak_data.narrative.stages.arm_hcm
			},
			{
				stage_id = "arm_par",
				id = "arm_par",
				icon = "csm_park",
				add = debug_very_short_add,
				level = tweak_data.narrative.stages.arm_par
			},
			{
				stage_id = "arm_fac",
				id = "arm_fac",
				icon = "csm_harbor",
				add = debug_very_short_add,
				level = tweak_data.narrative.stages.arm_fac
			},
			{
				stage_id = "chew",
				add = debug_very_short_add,
				id = "biker_2",
				icon = "csm_biker_2",
				level = tweak_data.narrative.stages.chew
			},
			{
				stage_id = "firestarter_1_res",
				add = debug_med_add,
				id = "firestarter_1_res",
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
				add = debug_short_add,
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
				add = debug_med_add,
				id = "spa",
				icon = "csm_brooklyn",
				level = tweak_data.narrative.stages.spa
			},
			{
				stage_id = "cane",
				add = debug_med_add,
				id = "cane",
				icon = "csm_santas_workshop",
				level = tweak_data.narrative.stages.cane
			},
			{
				stage_id = "mia_2",
				add = 9,
				id = "mia_2",
				icon = "csm_miami_2",
				level = tweak_data.narrative.stages.mia_2
			},			
			{
				stage_id = "nmh_res",
				add = debug_long_add,
				id = "nmh_res",
				icon = "csm_nmh",
				level = tweak_data.narrative.stages.nmh_res
			},
			{
				stage_id = "des",
				add = 12,
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
			},
			--{
				--stage_id = "wetwork_burn",
				--add = debug_med_add,
				--id = "wetwork_burn",
				--icon = "csm_wetwork_burn",
				--level = tweak_data.narrative.stages.wetwork_burn
			--},
			{
				stage_id = "junk",
				add = debug_short_add,
				id = "junk",
				icon = "csm_junk",
				level = tweak_data.narrative.stages.junk
			}
		},
		{
			{
				stage_id = "pbr2",
				add = debug_long_add,
				id = "pbr2",
				icon = "csm_sky",
				level = tweak_data.narrative.stages.pbr2
			},
			{
				stage_id = "pal",
				add = debug_med_add,
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
				add = debug_long_add,
				id = "hoxton_2",
				icon = "csm_hoxout_2",
				level = tweak_data.narrative.stages.hox_2
			},
			{
				stage_id = "hox_1",
				add = debug_med_add,
				id = "hoxton_1",
				icon = "csm_hoxout_1",
				level = tweak_data.narrative.stages.hox_1
			},
			{
				stage_id = "welcome_to_the_jungle_2",
				add = 16,
				id = "bo_2",
				icon = "csm_bigoil_2",
				level = tweak_data.narrative.stages.welcome_to_the_jungle_2
			},
			{
				stage_id = "mia_1",
				add = debug_long_add,
				id = "mia_1",
				icon = "csm_miami_1",
				level = tweak_data.narrative.stages.mia_1
			},
			{
				stage_id = "rat",
				add = debug_long_add,
				id = "cook_off",
				icon = "csm_rats_1",
				level = tweak_data.narrative.stages.rat
			},
			{
				stage_id = "pbr",
				id = "pbr",
				icon = "csm_mountain",
				add = 17,
				level = tweak_data.narrative.stages.pbr
			},
			{
				stage_id = "glace",
				add = debug_long_add,
				id = "glace",
				icon = "csm_glace",
				level = tweak_data.narrative.stages.glace
			},
			{
				stage_id = "run_res",
				add = 18,
				id = "run_res",
				icon = "csm_run",
				level = tweak_data.narrative.stages.run_res
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
				add = debug_long_add,
				id = "dinner",
				icon = "csm_slaughterhouse",
				level = tweak_data.narrative.stages.dinner
			},
			{
				stage_id = "jolly",
				add = debug_long_add,
				id = "jolly",
				icon = "csm_aftershock",
				level = tweak_data.narrative.stages.jolly
			},
			{
				stage_id = "mad",
				id = "mad",
				icon = "csm_mad",
				add = debug_long_add,
				level = tweak_data.narrative.stages.mad
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
				add = debug_long_add,
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
	self.start_levels = {
		forced = 500,
		loud = 0,
		stealth = 0
	}
	self.modifier_levels = {
		forced = 100,
		loud = 20,
		stealth = 26
	}
	self.modifiers = {
		forced = {
			{
				id = "bravo_replacer",
				class = "ModifierBravos",
				icon = "crime_spree_heavies",
				level = 100,
				data = {
					spawn_chance = {6.666666666667, "add"}
				}
			},
			{
				id = "grace_reduction",
				class = "ModifierGrace",
				icon = "crime_spree_no_hurt",
				level = 100,
				data = {
					penalty = {0.016666667, "add"}
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
			--Cloakers dropping Flashbangs
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
			--No more delay on Taser tase attempts
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
					inc = {1, "add"}
				}
			},
			--Titan sniper full auto
			{
				id = "heavy_sniper",
				class = "ModifierHeavySniper",
				icon = "crime_spree_heavy_sniper",
				data = {}
			},
			--Dozer Damage on visor break
			{
				id = "dozer_rage",
				class = "ModifierDozerRage",
				icon = "crime_spree_dozer_rage",
				data = {
					damage = {
						10,
						"add"
					}
				}
			},
			--More Titan HRTs
			{
				id = "cloaker_tear_gas",
				class = "ModifierCloakerTearGas",
				icon = "crime_spree_cloaker_tear_gas",
				data = {}
			},
			--Faster Sniper Aim
			{
				id = "sniper_faster_aim",
				class = "ModifierSniperAim",
				icon = "crime_spree_heavy_sniper",
				data = {
					speed = {2, "add"}
				}
			},			
			--Higher Dozer Cap T1
			{
				id = "dozer_1",
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				data = {
					inc = {1, "add"}
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
			--50% chance for more Skulldozers
			{
				id = "dozer_lmg",
				class = "ModifierSkulldozers",
				icon = "crime_spree_dozer_lmg",
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
					inc = {1, "add"}
				}
			},
			--Medic heals everyone around him in AoE on death
			{
				id = "medic_deathwish",
				class = "ModifierMedicDeathwish",
				icon = "crime_spree_medic_deathwish",
				data = {}
			},
			--"Minigun" Dozers have a 50% chance to replace Green/Black Dozers
			{
				id = "dozer_minigun",
				class = "ModifierDozerMinigun",
				icon = "crime_spree_more_dozers",
				data = {}
			},
			--Higher Medic Cap T2
			{
				id = "medic_2",
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				data = {
					inc = {1, "add"}
				}
			},
			--Dozer Explosion Resistance
			{
				id = "dozer_immunity",
				class = "ModifierExplosionImmunity",
				icon = "crime_spree_dozer_explosion",
				data = {
					explosive_resist = {50, "add"}
				}
			},
			--Dozers can now always spawn in pairs
			{
				id = "dozer_pairs",
				class = "ModifierDozerPairs",
				icon = "crime_spree_more_dozers",
				data = {}
			},
			--MedicDozers have a 50% chance to replace other dozer types
			{
				id = "dozer_medic",
				class = "ModifierDozerMedic",
				icon = "crime_spree_dozer_medic",
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
			--All assaults starts at diff 1
			{
				id = "max_assault_diff",
				class = "Modifier10SecondsResponseTime",
				icon = "crime_spree_assault_extender",
				data = {}
			},
			--Cloaker melee cuffs players
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
			},
			--Cloakers tend to spawn in groups
			{
				id = "spooc_squad",
				class = "ModifierSpoocSquad",
				icon = "crime_spree_assault_extender",
				data = {}
			},
			--gren go boom
			{
				id = "gren_boom",
				class = "ModifierBoomBoom",
				icon = "crime_spree_dozer_explosion",
				data = {}
			},
			--lets try gas
			{
				id = "lets_try_gas",
				class = "ModifierLetsTryGas",
				icon = "crime_spree_cloaker_tear_gas",
				data = {}
			},
			--yippee ki yay mother fucker
			{
				id = "bruce_willis_was_dead",
				class = "ModifierDodgeThis",
				icon = "crime_spree_no_hurt",
				data = {}
			},
			--CHECK YOUR FIRE
			{
				id = "you_team_killing_fucktard",
				class = "ModifierFriendlyFire",
				icon = "crime_spree_no_hurt",
				data = {}
			},
			--Shorter Medic Cooldown T3
			{
				id = "medic_heal_3",
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				data = {
					speed = {25, "add"}
				}
			}	
		},
		stealth = {
			{
				class = "ModifierLessPagers",
				id = "pagers_1",
				icon = "crime_spree_pager",
				level = 26,
				data = {
					count = {
						1,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_1",
				icon = "crime_spree_civs_killed",
				level = 26,
				data = {
					count = {
						6,
						"min"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_2",
				icon = "crime_spree_civs_killed",
				level = 52,
				data = {
					count = {
						4,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_2",
				icon = "crime_spree_pager",
				level = 78,
				data = {
					count = {
						2,
						"max"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_3",
				icon = "crime_spree_pager",
				level = 130,
				data = {
					count = {
						3,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_3",
				icon = "crime_spree_civs_killed",
				level = 156,
				data = {
					count = {
						2,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_4",
				icon = "crime_spree_pager",
				level = 182,
				data = {
					count = {
						4,
						"max"
					}
				}
			}
		}
	}
	--reverse order because menus are weird and changing the function for one tiny non issue isnt necessary
	self.repeating_modifiers = {
		forced = {
			{
				id = "grace_reduction",
				class = "ModifierGrace",
				icon = "crime_spree_no_hurt",
				level = 100,
				data = {
					penalty = {0.016666667, "add"}
				}
			},
			{
				id = "bravo_replacer",
				class = "ModifierBravos",
				icon = "crime_spree_heavies",
				level = 100,
				data = {
					spawn_chance = {6.666666666667, "add"}
				}
			}
		}
	}

end