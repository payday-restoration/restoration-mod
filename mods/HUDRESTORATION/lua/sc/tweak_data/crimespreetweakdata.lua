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
	self.initial_cost = 6
	self.cost_per_level = 0.5
	self.randomization_cost = 6
	self.randomization_multiplier = 2
	self.catchup_bonus = 0.035
	self.winning_streak = 0.005
	self.continue_cost = {6, 0.7}
	self.protection_threshold = 16
	self.announce_modifier_stinger = "stinger_feedback_positive"
	self:init_missions(tweak_data)
	self:init_rewards(tweak_data)
	self:init_achievements(tweak_data)
	self:init_modifiers(tweak_data)
	self:init_gage_assets(tweak_data)
	self:init_gui(tweak_data)

	self.assets.increased_absorption.data = {absorption = 10}
end

function CrimeSpreeTweakData:init_modifiers(tweak_data)
	local health_increase = 25
	local damage_increase = 25
	self.max_modifiers_displayed = 3
	self.modifier_levels = {loud = 10, stealth = 26}
	self.modifiers = {
		loud = {
			{
				id = "damage_health_1",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 10,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "cloaker_smoke",
				class = "ModifierCloakerKick",
				icon = "crime_spree_cloaker_smoke",
				level = 10,
				data = {
					effect = {"smoke", "none"}
				}
			},
			{
				id = "shield_reflect",
				class = "ModifierShieldReflect",
				icon = "crime_spree_shield_reflect",
				level = 10,
				data = {}
			},
			{
				id = "damage_health_2",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 20,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "medic_1",
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				level = 30,
				data = {
					inc = {2, "add"}
				}
			},
			{
				id = "damage_health_3",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 40,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "no_hurt",
				class = "ModifierNoHurtAnims",
				icon = "crime_spree_no_hurt",
				level = 50,
				data = {}
			},
			{
				id = "dozer_1",
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				level = 60,
				data = {
					inc = {2, "add"}
				}
			},
			{
				id = "damage_health_4",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 70,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "heavies",
				class = "ModifierHeavies",
				icon = "crime_spree_heavies",
				level = 80,
				data = {}
			},
			{
				id = "damage_health_5",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 90,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "medic_heal_1",
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				level = 100,
				data = {
					speed = {20, "add"}
				}
			},
			{
				id = "dozer_immunity",
				class = "ModifierExplosionImmunity",
				icon = "crime_spree_dozer_explosion",
				level = 110,
				data = {}
			},
			{
				id = "damage_health_6",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 120,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "dozer_2",
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				level = 130,
				data = {
					inc = {2, "add"}
				}
			},
			{
				id = "damage_health_7",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 140,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "dozer_lmg",
				class = "ModifierSkulldozers",
				icon = "crime_spree_dozer_lmg",
				level = 150,
				data = {}
			},
			{
				id = "medic_2",
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				level = 160,
				data = {
					inc = {2, "add"}
				}
			},
			{
				id = "damage_health_8",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 170,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			},
			{
				id = "medic_heal_2",
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				level = 180,
				data = {
					speed = {20, "add"}
				}
			},
			{
				id = "damage_health_9",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 190,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			}
		},
		stealth = {
			{
				id = "pagers_1",
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				level = 26,
				data = {
					count = {1, "max"}
				}
			},
			{
				id = "civs_1",
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				level = 26,
				data = {
					count = {10, "min"}
				}
			},
			{
				id = "conceal_1",
				class = "ModifierLessConcealment",
				icon = "crime_spree_concealment",
				level = 26,
				data = {
					conceal = {3, "add"}
				}
			},
			{
				id = "civs_2",
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				level = 52,
				data = {
					count = {7, "min"}
				}
			},
			{
				id = "pagers_2",
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				level = 78,
				data = {
					count = {2, "max"}
				}
			},
			{
				id = "conceal_2",
				class = "ModifierLessConcealment",
				icon = "crime_spree_concealment",
				level = 104,
				data = {
					conceal = {3, "add"}
				}
			},
			{
				id = "pagers_3",
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				level = 130,
				data = {
					count = {3, "max"}
				}
			},
			{
				id = "civs_3",
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				level = 156,
				data = {
					count = {4, "min"}
				}
			},
			{
				id = "pagers_4",
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				level = 182,
				data = {
					count = {4, "max"}
				}
			}
		}
	}
	self.repeating_modifiers = {
		loud = {
			{
				id = "damage_health_rpt_",
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				level = 5,
				data = {
					health = {2.5, "add"},
					damage = {2.5, "add"}
				}
			}
		},
		stealth = {
			{
				id = "conceal_rpt_",
				class = "ModifierLessConcealment",
				icon = "crime_spree_concealment",
				level = 13,
				data = {
					conceal = {3, "add"}
				}
			}
		}
	}
end

end