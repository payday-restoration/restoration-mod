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
		local health_increase = 0
		local damage_increase = 15
		self.max_modifiers_displayed = 3
		self.modifier_levels = {
			forced = 500,
			loud = 20,
			stealth = 26
		}
		self.modifiers = {
			forced = {
				{
					id = "damage_health_1",
					class = "ModifierEnemyHealthAndDamage",
					icon = "crime_spree_health",
					level = 400,
					data = {
						health = {0, "add"},
						damage = {15, "add"}
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
				--10% more Skulldozers
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
		self.repeating_modifiers = {
			forced = {
				{
					id = "damage_health_rpt_",
					class = "ModifierEnemyHealthAndDamage",
					icon = "crime_spree_health",
					level = 5,
					data = {
						health = {0, "add"},
						damage = {15, "add"}
					}
				}
			}
		}
	end

end