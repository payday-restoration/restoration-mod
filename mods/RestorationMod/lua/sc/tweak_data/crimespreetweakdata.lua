if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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

		self.assets.increased_absorption.data = {absorption = 1}
	end

	function CrimeSpreeTweakData:init_modifiers(tweak_data)
		local health_increase = 25
		local damage_increase = 25
		self.max_modifiers_displayed = 3
		self.modifier_levels = {
			forced = 400,
			loud = 20,
			stealth = 9999999999999999999999999999999999
		}
		self.modifiers = {
			forced = {
				{
					id = "damage_health_1",
					class = "ModifierEnemyHealthAndDamage",
					icon = "crime_spree_health",
					level = 400,
					data = {
						health = {15, "add"},
						damage = {15, "add"}
					}
				}
			},
			loud = {
				{
					id = "shield_reflect",
					class = "ModifierShieldReflect",
					icon = "crime_spree_shield_reflect",
					data = {}
				},
				{
					id = "cloaker_smoke",
					class = "ModifierCloakerKick",
					icon = "crime_spree_cloaker_smoke",
					data = {
						effect = {"smoke", "none"}
					}
				},
				{
					id = "medic_heal_1",
					class = "ModifierHealSpeed",
					icon = "crime_spree_medic_speed",
					data = {
						speed = {20, "add"}
					}
				},
				{
					id = "no_hurt",
					class = "ModifierNoHurtAnims",
					icon = "crime_spree_no_hurt",
					data = {}
				},
				{
					id = "taser_overcharge",
					class = "ModifierTaserOvercharge",
					icon = "crime_spree_taser_overcharge",
					data = {
						speed = {50, "add"}
					}
				},
				{
					id = "heavies",
					class = "ModifierHeavies",
					icon = "crime_spree_heavies",
					data = {}
				},
				{
					id = "medic_1",
					class = "ModifierMoreMedics",
					icon = "crime_spree_more_medics",
					data = {
						inc = {2, "add"}
					}
				},
				{
					id = "heavy_sniper",
					class = "ModifierHeavySniper",
					icon = "crime_spree_heavy_sniper",
					data = {
						spawn_chance = {5, "add"}
					}
				},
				{
					id = "dozer_rage",
					class = "ModifierDozerRage",
					icon = "crime_spree_dozer_rage",
					data = {
						damage = {15, "add"}
					}
				},
				{
					id = "cloaker_tear_gas",
					class = "ModifierCloakerTearGas",
					icon = "crime_spree_cloaker_tear_gas",
					data = {
						diameter = {4, "none"},
						damage = {0, "none"},
						duration = {10, "none"}
					}
				},
				{
					id = "dozer_1",
					class = "ModifierMoreDozers",
					icon = "crime_spree_more_dozers",
					data = {
						inc = {2, "add"}
					}
				},
				{
					id = "medic_heal_2",
					class = "ModifierHealSpeed",
					icon = "crime_spree_medic_speed",
					data = {
						speed = {20, "add"}
					}
				},
				{
					id = "dozer_lmg",
					class = "ModifierSkulldozers",
					icon = "crime_spree_dozer_lmg",
					data = {}
				},
				{
					id = "medic_adrenaline",
					class = "ModifierMedicAdrenaline",
					icon = "crime_spree_medic_adrenaline",
					data = {
						damage = {25, "add"}
					}
				},
				{
					id = "shield_phalanx",
					class = "ModifierShieldPhalanx",
					icon = "crime_spree_shield_phalanx",
					data = {}
				},
				{
					id = "dozer_2",
					class = "ModifierMoreDozers",
					icon = "crime_spree_more_dozers",
					data = {
						inc = {2, "add"}
					}
				},
				{
					id = "medic_deathwish",
					class = "ModifierMedicDeathwish",
					icon = "crime_spree_medic_deathwish",
					data = {}
				},
				{
					id = "dozer_minigun",
					class = "ModifierDozerMinigun",
					icon = "crime_spree_dozer_minigun",
					data = {}
				},
				{
					id = "medic_2",
					class = "ModifierMoreMedics",
					icon = "crime_spree_more_medics",
					data = {
						inc = {2, "add"}
					}
				},
				{
					id = "dozer_immunity",
					class = "ModifierExplosionImmunity",
					icon = "crime_spree_dozer_explosion",
					data = {}
				},
				{
					id = "dozer_medic",
					class = "ModifierDozerMedic",
					icon = "crime_spree_dozer_medic",
					data = {}
				},
				{
					id = "assault_extender",
					class = "ModifierAssaultExtender",
					icon = "crime_spree_assault_extender",
					data = {
						duration = {50, "add"},
						spawn_pool = {50, "add"},
						deduction = {4, "add"},
						max_hostages = {8, "none"}
					}
				},
				{
					id = "cloaker_arrest",
					class = "ModifierCloakerArrest",
					icon = "crime_spree_cloaker_arrest",
					data = {}
				},
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
					id = "pagers_1",
					class = "ModifierLessPagers",
					icon = "crime_spree_pager",
					level = 26,
					data = {}
				},
				{
					id = "civs_1",
					class = "ModifierCivilianAlarm",
					icon = "crime_spree_civs_killed",
					level = 26,
					data = {}
				},
				{
					id = "conceal_1",
					class = "ModifierLessConcealment",
					icon = "crime_spree_concealment",
					level = 26,
					data = {}
				},
				{
					id = "civs_2",
					class = "ModifierCivilianAlarm",
					icon = "crime_spree_civs_killed",
					level = 52,
					data = {}
				},
				{
					id = "pagers_2",
					class = "ModifierLessPagers",
					icon = "crime_spree_pager",
					level = 78,
					data = {}
				},
				{
					id = "conceal_2",
					class = "ModifierLessConcealment",
					icon = "crime_spree_concealment",
					level = 104,
					data = {}
				},
				{
					id = "pagers_3",
					class = "ModifierLessPagers",
					icon = "crime_spree_pager",
					level = 130,
					data = {}
				},
				{
					id = "civs_3",
					class = "ModifierCivilianAlarm",
					icon = "crime_spree_civs_killed",
					level = 156,
					data = {}
				},
				{
					id = "pagers_4",
					class = "ModifierLessPagers",
					icon = "crime_spree_pager",
					level = 182,
					data = {}
				}
			}
		}
		self.repeating_modifiers = {
			forced = {
				{
					id = "damage_health_rpt_",
					class = "ModifierEnemyHealthAndDamage",
					icon = "crime_spree_health",
					level = 5,
					data = {
						health = {15, "add"},
						damage = {15, "add"}
					}
				}
			}
		}
	end

end