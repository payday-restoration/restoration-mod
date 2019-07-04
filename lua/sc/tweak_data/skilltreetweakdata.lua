--[[

To whom it may concern, hello! If you're seeing this, there's a good chance you might be here to remove vital files related to
making the skill overhaul in SC's mod function. While I understand that some of you may not like having your builds become
invalid in the mod, you MUST understand that the mod was balanced with these changes in mind! Especially since it's to nerf
overpowered builds and abilities that would otherwise trivialize the buffs I made to the cops, and you have to remember the 
entire point of the mod was to increase the game's difficulty. So I ask you, please, actually try the mod with revamped skilltrees 
before dismissing it. I promise you it's still fun and in fact, you may find that you enjoy this system more.

]]--

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local sc_sttd = SkillTreeTweakData.init
function SkillTreeTweakData:init(tweak_data)
	sc_sttd(self, tweak_data)

	local digest = function(value)
		return Application:digest_value(value, true)
	end
	self.tier_unlocks = {
		digest(0),
		digest(1),
		digest(7),
		digest(16)
	}

   	self.default_upgrades = {
		"carry_interact_speed_multiplier_1",
		"carry_interact_speed_multiplier_2",
		"carry_movement_speed_multiplier",
		"carry_throw_distance_multiplier",
		"trip_mine_sensor_toggle",
		"trip_mine_sensor_highlight",
		"trip_mine_can_switch_on_off",
		"player_silent_kill",
		"player_can_free_run",
		"player_run_speed_multiplier",
		"jowi",
		"x_1911",
		"x_b92fs",
		"x_deagle",
		"x_g22c",
		"x_g17",
		"x_usp",
		"x_sr2",
		"x_mp5",
		"x_akmsu",
		"akimbo_recoil_index_addend_1",
		"akimbo_spread_index_addend_1",
		"ecm_jammer_can_activate_feedback",
		"ecm_jammer_interaction_speed_multiplier",
		"ecm_jammer_can_retrigger",
		"saw",
		"saw_secondary",
		"cable_tie",
		"cable_tie_interact_speed_multiplier",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"player_civ_harmless_bullets",
		"striker_reload_speed_default",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",
		"default_upgrades",
		"doctor_bag",
		"ammo_bag",
		"trip_mine",
		"ecm_jammer",
		"ecm_jammer_affects_cameras",
		"first_aid_kit",
		"sentry_gun",
		"bodybags_bag",
		"player_intimidate_enemies",
		"player_walk_speed_multiplier",
		"player_crouch_speed_multiplier",
		"player_flashbang_multiplier_1",
		"player_fall_health_damage_multiplier",
		"player_melee_kill_snatch_pager_chance",
		"player_convert_enemies_health_multiplier",
		"player_convert_enemies_interaction_speed_multiplier",
		"player_climb_speed_multiplier_1",
		"player_suspicion_bonus",
		"player_sec_camera_highlight_mask_off",
		"player_special_enemy_highlight_mask_off",
		"player_mask_off_pickup",
		"player_small_loot_multiplier_1",
		"player_pick_lock_easy_speed_multiplier_1",
		"first_aid_kit_downs_restore_chance",
		"player_suppression_resist",
		"player_electrocution_resistance_1",
		"sentry_gun_cost_reduction_1",
		"sentry_gun_cost_reduction_2",
		"sentry_gun_spread_multiplier",
		"sentry_gun_rot_speed_multiplier",
		"sentry_gun_extra_ammo_multiplier_1",	
		"sentry_gun_silent",
		"x_p226",
		"x_m45",
		"x_mp7",
		"x_ppk"		
	}

--[[   SKILLTREES   ]]--
	--{
	
		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic--			
			self.skills.combat_medic = {
				["name_id"] = "menu_combat_medic_beta_sc",
				["desc_id"] = "menu_combat_medic_beta_desc_sc",
				["icon_xy"] = {5, 7},
				[1] = {
					upgrades = {
						"temporary_revive_damage_reduction_1",
						"player_revive_damage_reduction_1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_revive_health_boost"
					},
					cost = self.costs.pro
				}
			}

			--Quick Fix--
			self.skills.tea_time = {
				["name_id"] = "menu_tea_time_beta_sc",
				["desc_id"] = "menu_tea_time_beta_desc_sc",
				["icon_xy"] = {1, 11},
				[1] = {
					upgrades = {
						"first_aid_kit_deploy_time_multiplier"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"first_aid_kit_damage_reduction_upgrade"
					},
					cost = self.costs.pro
				}
			}

			--Pain Killers--
			self.skills.fast_learner = {
				["name_id"] = "menu_fast_learner_beta_sc",
				["desc_id"] = "menu_fast_learner_beta_desc_sc",
				["icon_xy"] = {0, 10},
				[1] = {
					upgrades = {
						"player_revive_damage_reduction_level_1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_revive_damage_reduction_level_2"
					},
					cost = self.costs.pro
				}
			}

			--Uppers--
			self.skills.tea_cookies = {
				["name_id"] = "menu_tea_cookies_beta_sc",
				["desc_id"] = "menu_tea_cookies_beta_desc_sc",
				["icon_xy"] = {2, 11},
				[1] = {
					upgrades = {
						"first_aid_kit_quantity_increase_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"first_aid_kit_quantity_increase_2",
						"first_aid_kit_auto_recovery_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Combat Doctor--
			self.skills.medic_2x = {
				["name_id"] = "menu_medic_2x_beta_sc",
				["desc_id"] = "menu_medic_2x_beta_desc_sc",
				["icon_xy"] = {5, 8},
				[1] = {
					upgrades = {
						"doctor_bag_amount_increase1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"doctor_bag_quantity"
					},
					cost = self.costs.hightierpro
				}
			}

			--Inspire--
			self.skills.inspire = {
				["name_id"] = "menu_inspire_beta_sc",
				["desc_id"] = "menu_inspire_beta_desc_sc",
				["icon_xy"] = {4, 9},
				[1] = {
					upgrades = {
						"player_revive_interaction_speed_multiplier",
						"player_morale_boost"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"cooldown_long_dis_revive"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{

			--Cable Guy, formerly Endurance (WHY?)--
			self.skills.triathlete = {
				["name_id"] = "menu_triathlete_beta_sc",
				["desc_id"] = "menu_triathlete_beta_desc_sc",
				["icon_xy"] = {4, 7},
				[1] = {
					upgrades = {
						"cable_tie_quantity"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"cable_tie_pickup_chance"
					},
					cost = self.costs.pro
				}
			}


			--Clowns are Scary, mostly just renaming it because god damn it's stupid--
			self.skills.cable_guy = {
				["name_id"] = "menu_cable_guy_beta_sc",
				["desc_id"] = "menu_cable_guy_beta_desc_sc",
				["icon_xy"] = {2, 8},
				[1] = {
					upgrades = {
						"player_intimidate_range_mul",
						"player_intimidate_aura"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_civ_calming_alerts",
						"player_civ_intimidation_mul"
					},
					cost = self.costs.pro
				}
			}

			--Stockholm Syndrome--
			self.skills.joker = {
				["name_id"] = "menu_joker_beta_sc",
				["desc_id"] = "menu_joker_beta_desc_sc",
				["icon_xy"] = {3, 8},
				[1] = {
					upgrades = {
						"player_super_syndrome_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_civilian_reviver",
						"player_civilian_gives_ammo"
					},
					cost = self.costs.hightierpro
				}
			}

			--Joker--
			self.skills.stockholm_syndrome = {
				["name_id"] = "menu_stockholm_syndrome_beta_sc",
				["desc_id"] = "menu_stockholm_syndrome_beta_desc_sc",
				["icon_xy"] = {6, 8},
				[1] = {
					upgrades = {
						"player_convert_enemies",
						"player_convert_enemies_max_minions_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_convert_enemies_damage_multiplier_1",
						"player_convert_enemies_max_minions_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Partners in Crime--
			self.skills.control_freak = {
				["name_id"] = "menu_control_freak_beta_sc",
				["desc_id"] = "menu_control_freak_beta_desc_sc",
				["icon_xy"] = {1, 10},
				[1] = {
					upgrades = {
						"player_minion_master_speed_multiplier",
						"player_passive_convert_enemies_health_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_minion_master_health_multiplier",
						"player_passive_convert_enemies_health_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Hostage Taker--
			self.skills.black_marketeer = {
				["name_id"] = "menu_black_marketeer_beta_sc",
				["desc_id"] = "menu_black_marketeer_beta_desc_sc",
				["icon_xy"] = {2, 10},
				[1] = {
					upgrades = {
						"player_hostage_health_regen_addend_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_hostage_health_regen_addend_2",
						"team_damage_hostage_absorption"
					},
					cost = self.costs.hightierpro
				}
			}			

			--}
			
			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership, you always have less recoils ;^)--
			self.skills.stable_shot = {
				["name_id"] = "menu_stable_shot_beta_sc",
				["desc_id"] = "menu_stable_shot_beta_desc_sc",
				["icon_xy"] = {7, 7},
				[1] = {
					upgrades = {
						"smg_recoil_index_addend"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"team_weapon_recoil_index_addend",
						"team_weapon_suppression_recoil_index_addend"
					},
					cost = self.costs.hightierpro
				}
			}

			--MG Handling--
			self.skills.rifleman = {
				["name_id"] = "menu_scavenger_sc",
				["desc_id"] = "menu_scavenger_desc_sc",
				["icon_xy"] = {3, 3},
				[1] = {
					upgrades = {
						"smg_hip_fire_spread_multiplier",
						"assault_rifle_hip_fire_spread_multiplier",
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"smg_reload_speed_multiplier"
					},
					cost = self.costs.pro
				}
			}

			--MG Specialist--
			self.skills.sharpshooter = {
				["name_id"] = "menu_sharpshooter_sc",
				["desc_id"] = "menu_sharpshooter_desc_sc",
				["icon_xy"] = {10, 0},
				[1] = {
					upgrades = {
						"smg_move_spread_multiplier",
						"assault_rifle_move_spread_multiplier",
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"smg_fire_rate_multiplier_1"
					},
					cost = self.costs.pro
				}
			}

			--Shock and Awe--
			self.skills.spotter_teamwork = {
				["name_id"] = "menu_spotter_teamwork_beta_sc",
				["desc_id"] = "menu_spotter_teamwork_beta_desc_sc",
				["icon_xy"] = {2, 0},
				[1] = {
					upgrades = {
						"weapon_clip_ammo_increase_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_run_and_shoot_1",
						"weapon_clip_ammo_increase_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Heavy Impact--
			self.skills.speedy_reload = {
				["name_id"] = "menu_speedy_reload_sc",
				["desc_id"] = "menu_speedy_reload_desc_sc",
				["icon_xy"] = {10, 1},
				[1] = {
					upgrades = {
						"weapon_knock_down_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"weapon_knock_down_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Body Expertise--
			self.skills.single_shot_ammo_return = {
				["name_id"] = "menu_body_expertise_beta_sc",
				["desc_id"] = "menu_body_expertise_beta_desc_sc",
				["icon_xy"] = {10, 3},
				[1] = {
					upgrades = {
						"player_ap_bullets_1",
						"weapon_automatic_head_shot_add_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"weapon_automatic_head_shot_add_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
		--}
		
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{
			
			--Shotgun Impact--
			self.skills.underdog = {
				["name_id"] = "menu_shotgun_impact_beta_sc",
				["desc_id"] = "menu_shotgun_impact_beta_desc_sc",
				["icon_xy"] = {5, 0},
				[1] = {
					upgrades = {
						"shotgun_recoil_index_addend",
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"shotgun_extra_rays"
					},
					cost = self.costs.pro
				}
			}			

			--Shotgun CQB--
			self.skills.shotgun_cqb = {
				["name_id"] = "menu_shotgun_cqb_beta_sc",
				["desc_id"] = "menu_shotgun_cqb_beta_desc_sc",
				["icon_xy"] = {5, 1},
				[1] = {
					upgrades = {
						"shotgun_enter_steelsight_speed_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"shotgun_reload_speed_multiplier_1"
					},
					cost = self.costs.hightierpro
				}
			}
			
			--Underdog--
			self.skills.shotgun_impact = {
				["name_id"] = "menu_underdog_beta_sc",
				["desc_id"] = "menu_underdog_beta_desc_sc",
				["icon_xy"] = {2, 1},
				[1] = {
					upgrades = {
						"player_damage_multiplier_outnumbered"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_damage_dampener_outnumbered"
					},
					cost = self.costs.pro
				}
			}			
			
			--Pigeon Shooter--
			self.skills.far_away = {
				["name_id"] = "menu_far_away_beta_sc",
				["desc_id"] = "menu_far_away_beta_desc_sc",
				["icon_xy"] = {8, 5},
				[1] = {
					upgrades = {
						"shotgun_steelsight_accuracy_inc_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"shotgun_steelsight_range_inc_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Gung Ho--
			self.skills.close_by = {
				["name_id"] = "menu_close_by_beta_sc",
				["desc_id"] = "menu_close_by_beta_desc_sc",
				["icon_xy"] = {8, 6},
				[1] = {
					upgrades = {
						"shotgun_hip_run_and_shoot_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"shotgun_hip_rate_of_fire_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Overkill--
			self.skills.overkill = {
				["name_id"] = "menu_overkill_sc",
				["desc_id"] = "menu_overkill_desc_sc",
				["icon_xy"] = {3, 2},
				[1] = {
					upgrades = {
						"player_overkill_damage_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_overkill_all_weapons",
						"player_overkill_damage_multiplier_2",
						"saw_swap_speed_multiplier",
						"shotgun_swap_speed_multiplier"
					},
					cost = self.costs.hightierpro
				}
			}
			

			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			self.skills.oppressor = {
				["name_id"] = "menu_oppressor_beta_sc",
				["desc_id"] = "menu_oppressor_beta_desc_sc",
				["icon_xy"] = {6, 1},
				[1] = {
					upgrades = {
						"player_damage_shake_addend"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_flashbang_multiplier_2"
					},
					cost = self.costs.pro
				}
			}

			--Die Hard--
			self.skills.show_of_force = {
				["name_id"] = "menu_show_of_force_sc",
				["desc_id"] = "menu_show_of_force_desc_sc",
				["icon_xy"] = {1, 2},
				[1] = {
					upgrades = {
						"player_primary_weapon_when_downed"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_armor_regen_timer_multiplier"
					},
					cost = self.costs.pro
				}
			}

			--Transporter--
			self.skills.pack_mule = {
				["name_id"] = "menu_pack_mule_beta_sc",
				["desc_id"] = "menu_transporter_beta_desc_sc",
				["icon_xy"] = {6, 0},
				[1] = {
					upgrades = {
						"player_armor_carry_bonus_1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"carry_movement_penalty_nullifier"
					},
					cost = self.costs.pro
				}
			}

			--More Blood to Bleed, old bulletproof--
			self.skills.iron_man = {
				["name_id"] = "menu_iron_man_beta_sc",
				["desc_id"] = "menu_iron_man_beta_desc_sc",
				["icon_xy"] = {1, 1},
				[1] = {
					upgrades = {
						"player_health_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_health_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Bullseye--
			self.skills.prison_wife = {
				["name_id"] = "menu_prison_wife_beta_sc",
				["desc_id"] = "menu_prison_wife_beta_desc_sc",
				["icon_xy"] = {6, 11},
				[1] = {
					upgrades = {
						"player_headshot_regen_armor_bonus_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_headshot_regen_armor_bonus_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Iron Man--
			self.skills.juggernaut = {
				["name_id"] = "menu_juggernaut_beta_sc",
				["desc_id"] = "menu_juggernaut_beta_desc_sc",
				["icon_xy"] = {3, 1},
				[1] = {
					upgrades = {
						"body_armor6"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_shield_knock"
					},
					cost = self.costs.hightierpro
				}
			}


			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
				--Scavenging--
				self.skills.scavenging = {
					["name_id"] = "menu_scavenging_sc",
					["desc_id"] = "menu_scavenging_desc_sc",
					["icon_xy"] = {8, 11},
					[1] = {
						upgrades = {
							"player_increased_pickup_area_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_double_drop_1"
						},
						cost = self.costs.hightierpro
					}
				}

				--Bulletstorm--
				self.skills.ammo_reservoir = {
					["name_id"] = "menu_ammo_reservoir_beta_sc",
					["desc_id"] = "menu_ammo_reservoir_beta_desc_sc",
					["icon_xy"] = {4, 5},
					[1] = {
						upgrades = {
							"temporary_no_ammo_cost_1"
						},
						cost = self.costs.default
					},
					[2] = {
						upgrades = {
							"temporary_no_ammo_cost_2"
						},
						cost = self.costs.pro
					}
				}

				--Portable Saw--
				self.skills.portable_saw = {
					["name_id"] = "menu_portable_saw_beta_sc",
					["desc_id"] = "menu_portable_saw_beta_desc_sc",
					["icon_xy"] = {0, 1},
					[1] = {
						upgrades = {
							"saw_enemy_slicer"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"saw_reload_speed_multiplier",
							"grenade_launcher_reload_speed_multiplier"
						},
						cost = self.costs.hightierpro
					}
				}

				--Extra Lead--
				self.skills.ammo_2x = {
					["name_id"] = "menu_ammo_2x_beta_sc",
					["desc_id"] = "menu_ammo_2x_beta_desc_sc",
					["icon_xy"] = {7, 1},
					[1] = {
						upgrades = {
							"ammo_bag_ammo_increase1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"ammo_bag_quantity"
						},
						cost = self.costs.hightierpro
					}
				}

				--Carbon Blade--
				self.skills.carbon_blade = {
					["name_id"] = "menu_carbon_blade_beta_sc",
					["desc_id"] = "menu_carbon_blade_beta_desc_sc",
					["icon_xy"] = {0, 2},
					[1] = {
						upgrades = {
							"saw_ignore_shields_1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"saw_panic_when_kill_1"
						},
						cost = self.costs.hightierpro
					}
				}

				--Fully Loaded--
				self.skills.bandoliers = {
					["name_id"] = "menu_bandoliers_beta_sc",
					["desc_id"] = "menu_bandoliers_desc_sc",
					["icon_xy"] = {3, 0},
					[1] = {
						upgrades = {
							"extra_ammo_multiplier1"
						},
						cost = self.costs.hightier
					},
					[2] = {
						upgrades = {
							"player_pick_up_ammo_multiplier",
							"player_pick_up_ammo_multiplier_2",
							"player_regain_throwable_from_ammo_1"
						},
						cost = self.costs.hightierpro
					}
				}
				
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
	
			--Logistician--
			self.skills.defense_up = {
				["name_id"] = "menu_defense_up_beta_sc",
				["desc_id"] = "menu_defense_up_beta_desc_sc",
				["icon_xy"] = {4, 3},
				[1] = {
					upgrades = {
						"deploy_interact_faster_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"deploy_interact_faster_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Nerves of Steel--
			self.skills.sentry_targeting_package = {
				["name_id"] = "menu_fast_fire_beta_sc",
				["desc_id"] = "menu_fast_fire_beta_desc_sc",
				["icon_xy"] = {6, 6},
				[1] = {
					upgrades = {
						"player_steelsight_when_downed"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_interacting_damage_multiplier"
					},
					cost = self.costs.hightierpro
				}
			}

			--Eco Sentry--
			self.skills.eco_sentry = {
				["name_id"] = "menu_eco_sentry_beta_sc",
				["desc_id"] = "menu_eco_sentry_beta_desc_sc",
				["icon_xy"] = {9, 2},
				[1] = {
					upgrades = {
						"sentry_gun_armor_multiplier"
					},		
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"sentry_gun_shield"
					},
					cost = self.costs.hightierpro
				}
			}

			--Jack of All Trades--
			self.skills.engineering = {
				["name_id"] = "menu_jack_of_all_trades_beta_sc",
				["desc_id"] = "menu_jack_of_all_trades_beta_desc_sc",
				["icon_xy"] = {9, 4},
				[1] = {
					upgrades = {
						"second_deployable_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_second_deployable_full"
					},
					cost = self.costs.hightierpro
				}
			}

			--Tower Defense--
			self.skills.jack_of_all_trades = {
				["name_id"] = "menu_tower_defense_beta_sc",
				["desc_id"] = "menu_tower_defense_beta_desc_sc",
				["icon_xy"] = {9, 5},
				[1] = {
					upgrades = {
						"sentry_gun_quantity_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"sentry_gun_ap_bullets",
						"sentry_gun_damage_multiplier",
						"sentry_gun_fire_rate_reduction_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Bulletproof--
			self.skills.tower_defense = {
				["name_id"] = "menu_iron_man_sc",
				["desc_id"] = "menu_iron_man_desc_sc",
				["icon_xy"] = {6, 4},
				[1] = {
					upgrades = {
						"player_armor_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_armor_regen_timer_multiplier_tier",
						"player_armor_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}
						
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			self.skills.hardware_expert = {
				["name_id"] = "menu_hardware_expert_beta_sc",
				["desc_id"] = "menu_hardware_expert_beta_desc_sc",
				["icon_xy"] = {9, 6},
				[1] = {
					upgrades = {
						"player_drill_fix_interaction_speed_multiplier",
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_drill_alert",
						"player_silent_drill"
					},
					cost = self.costs.pro
				}
			}

			--Danger Close--
			self.skills.combat_engineering = {
				["name_id"] = "menu_trip_mine_expert_beta_sc",
				["desc_id"] = "menu_combat_engineering_desc_sc",
				["icon_xy"] = {4, 6},
				[1] = {
					upgrades = {
						"trip_mine_explosion_size_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"trip_mine_damage_multiplier_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Drill Sawgeant--
			self.skills.drill_expert = {
				["name_id"] = "menu_drill_expert_beta",
				["desc_id"] = "menu_drill_expert_beta_desc",
				["icon_xy"] = {3, 6},
				[1] = {
					upgrades = {
						"player_drill_speed_multiplier1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_drill_speed_multiplier2"
					},
					cost = self.costs.pro
				}
			}

			--Demoman--
			self.skills.more_fire_power = {
				["name_id"] = "menu_more_fire_power_sc",
				["desc_id"] = "menu_more_fire_power_desc_sc",
				["icon_xy"] = {9, 7},
				[1] = {
					upgrades = {
						"shape_charge_quantity_increase_1",
						"trip_mine_quantity_increase_1",
						"player_trip_mine_deploy_time_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"shape_charge_quantity_increase_2",
						"trip_mine_quantity_increase_2",
						"player_trip_mine_deploy_time_multiplier_2"
						
					},
					cost = self.costs.hightierpro
				}
			}

			--Kickstarter--
			self.skills.kick_starter = {
				["name_id"] = "menu_kick_starter_beta",
				["desc_id"] = "menu_kick_starter_beta_desc_sc",
				["icon_xy"] = {9, 8},
				[1] = {
					upgrades = {
						"player_drill_autorepair_1",
						"player_drill_autorepair_2"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_drill_melee_hit_restart_chance_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Fire Trap--
			self.skills.fire_trap = {
				["name_id"] = "menu_fire_trap_beta",
				["desc_id"] = "menu_fire_trap_beta_desc",
				["icon_xy"] = {9, 9},
				[1] = {
					upgrades = {
						"trip_mine_fire_trap_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"trip_mine_fire_trap_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
			
			--[[  BATTLE SAPPER  SUBTREE   ]]--
			--{

			--Sharpshooter--	
			self.skills.steady_grip = {
				["name_id"] = "menu_discipline_sc",
				["desc_id"] = "menu_discipline_desc_sc",
				["icon_xy"] = {0, 5},
				[1] = {
					upgrades = {
						"assault_rifle_recoil_index_addend",
						"snp_recoil_index_addend"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_not_moving_accuracy_increase_bonus_1"
					},
					cost = self.costs.pro
				}
			}

			--Kilmer--
			self.skills.heavy_impact = {
				["name_id"] = "menu_heavy_impact_beta_sc",
				["desc_id"] = "menu_heavy_impact_beta_desc_sc",
				["icon_xy"] = {1, 9},
				[1] = {
					upgrades = {
						"weapon_single_spread_index_addend"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"assault_rifle_reload_speed_multiplier",
						"snp_reload_speed_multiplier"
					},
					cost = self.costs.pro
				}
			}

			--Rifleman--
			self.skills.fire_control = {
				["name_id"] = "menu_rifleman_sc",
				["desc_id"] = "menu_rifleman_desc_sc",
				["icon_xy"] = {6, 5},
				[1] = {
					upgrades = {
						"weapon_enter_steelsight_speed_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"single_shot_accuracy_inc_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Explosive Headshot--
			self.skills.shock_and_awe = {
				["name_id"] = "menu_kilmer_sc",
				["desc_id"] = "menu_kilmer_desc_sc",
				["icon_xy"] = {11, 9},
				[1] = {
					upgrades = {
						"snp_graze_damage_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"snp_graze_damage_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Ammo Efficiency--
			self.skills.fast_fire = {
				["name_id"] = "menu_single_shot_ammo_return_sc",
				["desc_id"] = "menu_single_shot_ammo_return_desc_sc",
				["icon_xy"] = {8, 4},
				[1] = {
					upgrades = {
						"head_shot_ammo_return_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"head_shot_ammo_return_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Aggressive Reload--
			self.skills.body_expertise = {
				["name_id"] = "menu_engineering_beta_sc",
				["desc_id"] = "menu_engineering_beta_desc_sc",
				["icon_xy"] = {8, 3},
				[1] = {
					upgrades = {
						"temporary_single_shot_fast_reload_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"temporary_single_shot_fast_reload_2"
					},
					cost = self.costs.hightierpro
				}
			}
			
			
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{

			--Cleaner--
			self.skills.jail_workout = {
				["name_id"] = "menu_jail_workout_sc",
				["desc_id"] = "menu_jail_workout_desc_sc",
				["icon_xy"] = {7, 2},
				[1] = {
					upgrades = {
						"player_corpse_dispose_amount_2"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"bodybags_bag_quantity",
						"weapon_special_damage_taken_multiplier"						
					},
					cost = self.costs.pro
				}
			}

			--Nimble--
			self.skills.cleaner = {
				["name_id"] = "menu_cleaner_beta_sc",
				["desc_id"] = "menu_cleaner_beta_desc_sc",
				["icon_xy"] = {10, 4},
				[1] = {
					upgrades = {
						"player_pick_lock_easy_speed_multiplier_2"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_pick_lock_hard"
					},
					cost = self.costs.pro
				}
			}

			--Sixth Sense--
			self.skills.chameleon = {
				["name_id"] = "menu_chameleon_beta_sc",
				["desc_id"] = "menu_chameleon_beta_desc_sc",
				["icon_xy"] = {6, 10},
				[1] = {
					upgrades = {
						"player_standstill_omniscience"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_buy_bodybags_asset",
						"player_additional_assets",
						"player_buy_spotter_asset"
					},
					cost = self.costs.pro
				}
			}

			--Systems Specialist-
			self.skills.second_chances = {
				["name_id"] = "menu_second_chances_beta_sc",
				["desc_id"] = "menu_second_chances_beta_desc_sc",
				["icon_xy"] = {4, 2},
				[1] = {
					upgrades = {
						"player_tape_loop_duration_1",
						"player_hack_fix_interaction_speed_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_mark_enemy_time_multiplier",
						"weapon_steelsight_highlight_specials",
						"player_hack_fix_interaction_speed_multiplier_2",
					},
					cost = self.costs.hightierpro
				}
			}

			--ECM Specialist--
			self.skills.ecm_booster = {
				["name_id"] = "menu_ecm_booster_beta_sc",
				["desc_id"] = "menu_ecm_booster_beta_desc_sc",
				["icon_xy"] = {3, 4},
				[1] = {
					upgrades = {
						"ecm_jammer_quantity_increase_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"ecm_jammer_quantity_increase_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--ECM Overdrive--
			self.skills.ecm_2x = {
				["name_id"] = "menu_ecm_2x_beta_sc",
				["desc_id"] = "menu_ecm_2x_beta_desc_sc",
				["icon_xy"] = {6, 3},
				[1] = {
					upgrades = {
						"ecm_jammer_can_open_sec_doors",
						"ecm_jammer_duration_multiplier",
						"ecm_jammer_feedback_duration_boost"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"ecm_jammer_duration_multiplier_2",
						"ecm_jammer_feedback_duration_boost_2",
						"ecm_jammer_affects_pagers"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{

			--Duck and Cover--
			self.skills.sprinter = {
				["name_id"] = "menu_sprinter_beta_sc",
				["desc_id"] = "menu_sprinter_beta_desc_sc",
				["icon_xy"] = {7, 3},
				[1] = {
					upgrades = {
						"player_stamina_regen_timer_multiplier",
						"player_stamina_regen_multiplier"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_run_dodge_chance",
						"player_on_zipline_dodge_chance"
					},
					cost = self.costs.pro
				}
			}

			--Evasion--
			self.skills.awareness = {
				["name_id"] = "menu_awareness_beta_sc",
				["desc_id"] = "menu_awareness_beta_desc_sc",
				["icon_xy"] = {7, 10},
				[1] = {
					upgrades = {
						"player_movement_speed_multiplier_1",
						"player_fall_damage_multiplier"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_run_and_reload"
					},
					cost = self.costs.pro
				}
			}

			--Deep Pockets--
			self.skills.thick_skin = {
				["name_id"] = "menu_thick_skin_beta_sc",
				["desc_id"] = "menu_thick_skin_beta_desc_sc",
				["icon_xy"] = {10, 7},
				[1] = {
					upgrades = {
						"player_melee_concealment_modifier"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_level_1_armor_addend",
						"player_level_2_armor_addend",
						"player_level_3_armor_addend",
						"player_level_4_armor_addend",
						"player_ballistic_vest_concealment_1"
					},
					cost = self.costs.pro
				}	
			}

			--Moving Target--
			self.skills.dire_need = {
				["name_id"] = "menu_dire_need_beta_sc",
				["desc_id"] = "menu_dire_need_beta_desc_sc",
				["icon_xy"] = {2, 4},
				[1] = {
					upgrades = {
                   				"player_detection_risk_add_movement_speed_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
                   				"player_detection_risk_add_movement_speed_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Shockproof--
			self.skills.insulation = {
				["name_id"] = "menu_insulation_beta",
				["desc_id"] = "menu_insulation_beta_desc",
				["icon_xy"] = {3, 5},
				[1] = {
					upgrades = {
						"player_taser_malfunction"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_taser_self_shock",
						"player_escape_taser_1"
					},
					cost = self.costs.hightierpro
				}	
			}

			--Sneaky Bastard--
			self.skills.jail_diet = {
				["name_id"] = "menu_jail_diet_beta",
				["desc_id"] = "menu_jail_diet_beta_desc",
				["icon_xy"] = {1, 12},
				[1] = {
					upgrades = {
						"player_detection_risk_add_dodge_chance_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_detection_risk_add_dodge_chance_2"
					},
					cost = self.costs.hightierpro
				}
			}
			

			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind--
			self.skills.scavenger = {
				["name_id"] = "menu_scavenger_beta_sc",
				["desc_id"] = "menu_scavenger_beta_desc_sc",
				["icon_xy"] = {10, 9},
				[1] = {
					upgrades = {
						"temporary_damage_speed_multiplier_1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"temporary_damage_speed_multiplier_2"
					},
					cost = self.costs.pro
				}
			}

			--Optical Illusions--
			self.skills.optic_illusions = {
				["name_id"] = "menu_optic_illusions_sc",
				["desc_id"] = "menu_optic_illusions_desc_sc",
				["icon_xy"] = {10, 10},
				[1] = {
					upgrades = {
						"player_silencer_concealment_increase_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_silencer_concealment_penalty_decrease_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--The Professional--
			self.skills.silence_expert = {
				["name_id"] = "menu_silence_expert_beta_sc",
				["desc_id"] = "menu_silence_expert_beta_desc_sc",
				["icon_xy"] = {4, 4},
				[1] = {
					upgrades = {
						"weapon_silencer_recoil_index_addend"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"weapon_silencer_spread_index_addend",
						"weapon_silencer_enter_steelsight_speed_multiplier"
					},
					cost = self.costs.hightierpro
				}
			}

			--Dire Need--
			self.skills.backstab = {
				["name_id"] = "menu_backstab_beta_sc",
				["desc_id"] = "menu_backstab_beta_desc_sc",
				["icon_xy"] = {10, 8},
				[1] = {
					upgrades = {
						"player_armor_depleted_stagger_shot_1"
					},	
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_armor_depleted_stagger_shot_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Spotter--
			self.skills.hitman = {
				["name_id"] = "menu_hitman_beta_sc",
				["desc_id"] = "menu_hitman_beta_desc_sc",
				["icon_xy"] = {8, 2},
				[1] = {
					upgrades = {
						"player_marked_enemy_extra_damage"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_marked_inc_dmg_distance_1"			
					},
					cost = self.costs.hightierpro
				}
			}

			--Low Blow--
			self.skills.unseen_strike = {
				["name_id"] = "menu_unseen_strike_beta_sc",
				["desc_id"] = "menu_unseen_strike_beta_desc_sc",
				["icon_xy"] = {0, 12},
				[1] = {
					upgrades = {
						"player_detection_risk_add_crit_chance_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_detection_risk_add_crit_chance_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{

			--Equilibrium--
			self.skills.equilibrium = {
				["name_id"] = "menu_equilibrium_beta_sc",
				["desc_id"] = "menu_equilibrium_beta_desc_sc",
				["icon_xy"] = {3, 9},
				[1] = {
					upgrades = {
						"pistol_swap_speed_multiplier"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"team_pistol_recoil_index_addend",
						"team_pistol_suppression_recoil_index_addend"
					},
					cost = self.costs.pro
				}
			}

			--Gun Nut--
			self.skills.dance_instructor = {
				["name_id"] = "menu_dance_instructor_sc",
				["desc_id"] = "menu_dance_instructor_desc_sc",
				["icon_xy"] = {11, 0},
				[1] = {
					upgrades = {
						"pistol_fire_rate_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"pistol_spread_index_addend"
					},
					cost = self.costs.hightierpro
				}
			}

			--Over Pressurized/Gunfighter--
			self.skills.akimbo = {
				["name_id"] = "menu_gun_fighter_sc",
				["desc_id"] = "menu_gun_fighter_desc_sc",
				["icon_xy"] = {0, 9},
				[1] = {
					upgrades = {
						"pistol_reload_speed_multiplier_1",
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"pistol_reload_speed_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Akimbo--
  			self.skills.gun_fighter = {
				["name_id"] = "menu_akimbo_skill_sc",
				["desc_id"] = "menu_akimbo_skill_desc_sc",
				["icon_xy"] = {3, 11},
				[1] = {
					upgrades = {
						"akimbo_recoil_index_addend_2"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"akimbo_extra_ammo_multiplier_1",
						"akimbo_recoil_index_addend_3"
					},
					cost = self.costs.hightierpro
				}	
			}

			--Desperado--
			self.skills.expert_handling = {
				["name_id"] = "menu_expert_handling_sc",
				["desc_id"] = "menu_expert_handling_desc_sc",
				["icon_xy"] = {11, 1},
				[1] = {
					upgrades = {
						"pistol_stacked_accuracy_bonus_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"pistol_stacked_accuracy_bonus_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Trigger Happy--
			self.skills.trigger_happy = {
				["name_id"] = "menu_trigger_happy_beta_sc",
				["desc_id"] = "menu_trigger_happy_beta_desc_sc",
				["icon_xy"] = {11, 2},
				[1] = {
					upgrades = {
						"pistol_stacking_hit_damage_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"pistol_stacking_hit_damage_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}			

			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{

			--Running from Death--
			self.skills.nine_lives = {
				["name_id"] = "menu_nine_lives_beta_sc",
				["desc_id"] = "menu_nine_lives_beta_desc_sc",
				["icon_xy"] = {11, 3},
				[1] = {
					upgrades = {
						"player_temp_increased_movement_speed_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_temp_swap_weapon_faster_1",
						"player_temp_reload_weapon_faster_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Nine Lives--
			self.skills.running_from_death = {
				["name_id"] = "menu_running_from_death_beta_sc",
				["desc_id"] = "menu_running_from_death_beta_desc_sc",
				["icon_xy"] = {5, 2},
				[1] = {
					upgrades = {
						"player_bleed_out_health_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_additional_lives_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Up you go--
			self.skills.up_you_go = {
				["name_id"] = "menu_up_you_go_beta",
				["desc_id"] = "menu_up_you_go_beta_desc",
				["icon_xy"] = {11, 4},
				[1] = {
					upgrades = {
						"player_revived_damage_resist_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_revived_health_regain_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Swan Song--
			self.skills.perseverance = {
				["name_id"] = "menu_perseverance",
				["desc_id"] = "menu_perseverance_desc_sc",
				["icon_xy"] = {5, 12},
				[1] = {
					upgrades = {
						"temporary_berserker_damage_multiplier_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"temporary_berserker_damage_multiplier_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Undying--
			self.skills.feign_death = {
				["name_id"] = "menu_feign_death_sc",
				["desc_id"] = "menu_feign_death_desc_sc",
				["icon_xy"] = {11, 5},
				[1] = {
					upgrades = {
						"player_cheat_death_chance_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_cheat_death_chance_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Messiah--
			self.skills.messiah = {
				["name_id"] = "menu_pistol_beta_messiah_sc",
				["desc_id"] = "menu_pistol_beta_messiah_desc_sc",
				["icon_xy"] = {2, 9},
				[1] = {
					upgrades = {
						"player_messiah_revive_from_bleed_out_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_messiah_revive_from_bleed_out_2"
					},
					cost = self.costs.hightierpro
				}
			}	


			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{

			--Martial Arts--
			self.skills.martial_arts = {
				["name_id"] = "menu_martial_arts_beta_sc",
				["desc_id"] = "menu_martial_arts_beta_desc_sc",
				["icon_xy"] = {11, 7},
				[1] = {
					upgrades = {
						"player_melee_damage_dampener"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_melee_knockdown_mul"
					},
					cost = self.costs.pro
				}
			}

			--Counter Strike, formally bloodthirst--
			self.skills.bloodthirst = {
				["name_id"] = "menu_drop_soap_beta_sc",
				["desc_id"] = "menu_drop_soap_beta_desc_sc",
				["icon_xy"] = {4, 12},
				[1] = {
					upgrades = {
						"player_counter_strike_melee"
					},		
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_counter_strike_spooc"
					},
					cost = self.costs.hightierpro
				}
			}

			--Pumping Iron--
			self.skills.steroids = {
				["name_id"] = "menu_steroids_beta_sc",
				["desc_id"] = "menu_steroids_beta_desc_sc",
				["icon_xy"] = {4, 0},
				[1] = {
					upgrades = {
						"player_melee_swing_multiplier_1",
						"player_melee_swing_multiplier_delay_1"
					},
					cost = self.costs.default
				},
				[2] = {
					upgrades = {
						"player_melee_swing_multiplier_2",
						"player_melee_swing_multiplier_delay_2"
					},
					cost = self.costs.pro
				}
			}

			--Bloodthirst, formally counter-strike--
			self.skills.drop_soap = {
				["name_id"] = "menu_bloodthirst_sc",
				["desc_id"] = "menu_bloodthirst_desc_sc",
				["icon_xy"] = {11, 6},
				[1] = {
					upgrades = {
						"player_temp_melee_kill_increase_reload_speed_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_melee_damage_stacking_1"
					},
					cost = self.costs.hightierpro
				}
			}

			--Frenzy--
			self.skills.wolverine = {
				["name_id"] = "menu_wolverine_beta_sc",
				["desc_id"] = "menu_wolverine_beta_desc_sc",
				["icon_xy"] = {11, 8},
				[1] = {
					upgrades = {
						"player_healing_reduction_1",
						"player_real_health_damage_reduction_1",
						"player_max_health_reduction_1"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_healing_reduction_2",
						"player_real_health_damage_reduction_2"
					},
					cost = self.costs.hightierpro
				}
			}

			--Berserker--
			self.skills.frenzy = {
				["name_id"] = "menu_frenzy_sc",
				["desc_id"] = "menu_frenzy_desc_sc",
				["icon_xy"] = {2, 2},
				[1] = {
					upgrades = {
						"player_melee_damage_health_ratio_multiplier"
					},
					cost = self.costs.hightier
				},
				[2] = {
					upgrades = {
						"player_damage_health_ratio_multiplier"
					},
					cost = self.costs.hightierpro
				}
			}

			--}
		--}
	--}


--Begin Perk deck bullshit--


	local deck2 = {
		upgrades = {
			"weapon_passive_headshot_damage_multiplier",
			"weapon_passive_damage_multiplier_1",
			"player_non_special_melee_multiplier_1",
			"player_melee_damage_multiplier_1"
		},
		cost = 300,
		icon_xy = {1, 0},
		name_id = "menu_deckall_2",
		desc_id = "menu_deckall_2_desc_sc"
	}
	local deck4 = {
		upgrades = {
			"passive_player_xp_multiplier",
			"player_passive_suspicion_bonus",
			"player_passive_armor_movement_penalty_multiplier",
			"weapon_passive_damage_multiplier_2",
			"player_non_special_melee_multiplier_2",
			"player_melee_damage_multiplier_2"			
		},
		cost = 600,
		icon_xy = {3, 0},
		name_id = "menu_deckall_4",
		desc_id = "menu_deckall_4_desc_sc"
	}
	local deck6 = {
		upgrades = {
			"armor_kit",
			"player_pick_up_ammo_multiplier",
			"weapon_passive_damage_multiplier_3",
			"player_non_special_melee_multiplier_3",
			"player_melee_damage_multiplier_3"			
		},
		cost = 1600,
		icon_xy = {5, 0},
		name_id = "menu_deckall_6",
		desc_id = "menu_deckall_6_desc_sc"
	}
	local deck8 = {
		upgrades = {
			"weapon_passive_damage_multiplier_4",
			"passive_doctor_bag_interaction_speed_multiplier",
			"player_non_special_melee_multiplier_4",
			"player_melee_damage_multiplier_4"
		},
		cost = 3200,
		icon_xy = {7, 0},
		name_id = "menu_deckall_8",
		desc_id = "menu_deckall_8_desc_sc"
	}
	
	--Crew Chief--
	local sc_crew_chief = {
			name_id = "menu_st_spec_1",
			desc_id = "menu_st_spec_1_desc",
			{
				upgrades = {
					"player_passive_health_multiplier_1",
					"player_passive_health_multiplier_2"
				},
				cost = 200,
				icon_xy = {0, 0},
				name_id = "menu_deck1_1",
				desc_id = "menu_deck2_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"team_passive_stamina_multiplier_1",
					"player_passive_intimidate_range_mul"
				},
				cost = 400,
				icon_xy = {2, 0},
				name_id = "menu_deck1_3",
				desc_id = "menu_deck1_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_health_multiplier_3",
					"team_passive_health_multiplier"
				},
				cost = 1000,
				icon_xy = {4, 0},
				name_id = "menu_deck1_5",
				desc_id = "menu_deck1_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_tier_armor_multiplier_1",
					"player_tier_armor_multiplier_2",
					"team_passive_armor_multiplier"
				},
				cost = 2400,
				icon_xy = {6, 0},
				name_id = "menu_deck1_7",
				desc_id = "menu_deck1_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_passive_health_multiplier_4",
					"team_hostage_health_multiplier",
					"team_hostage_stamina_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				name_id = "menu_deck1_9",
				desc_id = "menu_deck1_9_desc_sc"
			}
		}

	--Muscle--
	local sc_muscle = {
			name_id = "menu_st_spec_2",
			desc_id = "menu_st_spec_2_desc",
			{
				upgrades = {
					"player_passive_health_multiplier_1",
					"player_passive_health_multiplier_2"
				},
				cost = 200,
				icon_xy = {0, 0},
				name_id = "menu_deck2_1",
				desc_id = "menu_deck2_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_passive_health_multiplier_3",
					"player_passive_health_multiplier_4"
				},
				cost = 400,
				icon_xy = {1, 1},
				name_id = "menu_deck2_3",
				desc_id = "menu_deck2_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_health_multiplier_5",
					"player_passive_health_multiplier_6"
				},
				cost = 1000,
				icon_xy = {2, 1},
				name_id = "menu_deck2_5",
				desc_id = "menu_deck2_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_panic_suppression"
				},
				cost = 2400,
				icon_xy = {3, 1},
				name_id = "menu_deck2_7",
				desc_id = "menu_deck2_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_health_multiplier_7",
					"player_passive_health_multiplier_8",			
					"player_health_revive_max",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {4, 1},
				name_id = "menu_deck2_9",
				desc_id = "menu_deck2_9_desc_sc"
			}
		}

	--Armorer--
	local sc_armorer = {
			name_id = "menu_st_spec_3",
			desc_id = "menu_st_spec_3_desc",
			{
				upgrades = {
					"player_tier_armor_multiplier_1",
					"player_tier_armor_multiplier_2"
				},
				cost = 200,
				icon_xy = {6, 0},
				name_id = "menu_deck3_1",
				desc_id = "menu_deck3_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_tier_armor_multiplier_3",
					"player_tier_armor_multiplier_4"
				},
				cost = 400,
				icon_xy = {5, 1},
				name_id = "menu_deck3_3",
				desc_id = "menu_deck3_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_tier_armor_multiplier_5"
				},
				cost = 1000,
				icon_xy = {7, 1},
				name_id = "menu_deck3_5",
				desc_id = "menu_deck3_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_regen_timer_multiplier_passive"
				},
				cost = 2400,
				icon_xy = {6, 1},
				name_id = "menu_deck3_7",
				desc_id = "menu_deck3_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_1",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 2},
				name_id = "menu_deck3_9",
				desc_id = "menu_deck3_9_desc_sc"
			}
		}

	--Rogue--
	local sc_rogue = {
			name_id = "menu_st_spec_4",
			desc_id = "menu_st_spec_4_desc",
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck4_1",
				desc_id = "menu_deck4_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_passive_dodge_chance_2"
				},
				cost = 400,
				icon_xy = {4, 2},
				name_id = "menu_deck4_3",
				desc_id = "menu_deck4_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_dodge_chance_3"
				},
				cost = 1000,
				icon_xy = {2, 2},
				name_id = "menu_deck4_5",
				desc_id = "menu_deck4_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_passive_dodge_chance_4"
				},
				cost = 2400,
				icon_xy = {3, 2},
				name_id = "menu_deck4_7",
				desc_id = "menu_deck4_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"weapon_passive_swap_speed_multiplier_1"
				},
				cost = 4000,
				icon_xy = {5, 2},
				name_id = "menu_deck4_9",
				desc_id = "menu_deck4_9_desc_sc"
			}
		}

	--Hitman--
	local sc_hitman = {
			name_id = "menu_st_spec_5",
			desc_id = "menu_st_spec_5_desc",
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_1"
				},
				cost = 200,
				icon_xy = {6, 2},
				name_id = "menu_deck5_1",
				desc_id = "menu_deck5_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"akimbo_recoil_index_addend_2"
				},
				cost = 400,
				icon_xy = {7, 2},
				name_id = "menu_deck5_3",
				desc_id = "menu_deck5_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_2"
				},
				cost = 1000,
				icon_xy = {0, 3},
				name_id = "menu_deck5_5",
				desc_id = "menu_deck5_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_3"
				},
				cost = 2400,
				icon_xy = {1, 3},
				name_id = "menu_deck5_7",
				desc_id = "menu_deck5_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_4",
					"player_passive_loot_drop_multiplier",
					"akimbo_recoil_index_addend_3"
				},
				cost = 4000,
				icon_xy = {3, 3},
				name_id = "menu_deck5_9",
				desc_id = "menu_deck5_9_desc_sc"
			}
		}

	--Crook--
	local sc_crook = {
			name_id = "menu_st_spec_6",
			desc_id = "menu_st_spec_6_desc",
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck6_1",
				desc_id = "menu_deck6_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_level_2_dodge_addend_1",
					"player_level_3_dodge_addend_1",
					"player_level_4_dodge_addend_1",
					"player_level_2_armor_multiplier_1",
					"player_level_3_armor_multiplier_1",
					"player_level_4_armor_multiplier_1"					
				},
				cost = 400,
				icon_xy = {4, 3},
				name_id = "menu_deck6_3",
				desc_id = "menu_deck6_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_level_2_dodge_addend_2",
					"player_level_3_dodge_addend_2",
					"player_level_4_dodge_addend_2",
					"player_level_2_armor_multiplier_2",
					"player_level_3_armor_multiplier_2",
					"player_level_4_armor_multiplier_2"						
				},
				cost = 1000,
				icon_xy = {5, 3},
				name_id = "menu_deck6_5",
				desc_id = "menu_deck6_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_level_2_dodge_addend_3",
					"player_level_3_dodge_addend_3",
					"player_level_4_dodge_addend_3",
					"player_level_2_armor_multiplier_3",
					"player_level_3_armor_multiplier_3",
					"player_level_4_armor_multiplier_3"						
				},
				cost = 2400,
				icon_xy = {6, 3},
				name_id = "menu_deck6_7",
				desc_id = "menu_deck6_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_perk_armor_regen_timer_multiplier_1"
				},
				cost = 4000,
				icon_xy = {6, 2},
				name_id = "menu_deck6_9",
				desc_id = "menu_deck6_9_desc_sc"
			}
		}

	--Burglar--
	local sc_burglar = {
			name_id = "menu_st_spec_7",
			desc_id = "menu_st_spec_7_desc",
			dlc = "character_pack_clover",
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck7_1",
				desc_id = "menu_deck7_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_tier_dodge_chance_1",
					"player_corpse_dispose_speed_multiplier"
				},
				cost = 400,
				icon_xy = {0, 4},
				name_id = "menu_deck7_3",
				desc_id = "menu_deck7_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_dodge_chance_2",
					"player_pick_lock_speed_multiplier"
				},
				cost = 1000,
				icon_xy = {7, 3},
				name_id = "menu_deck7_5",
				desc_id = "menu_deck7_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_passive_dodge_chance_3",
					"player_alarm_pager_speed_multiplier"
				},
				cost = 2400,
				icon_xy = {1, 4},
				name_id = "menu_deck7_7",
				desc_id = "menu_deck7_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_1",
					"player_crouch_speed_multiplier_2",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {2, 4},
				name_id = "menu_deck7_9",
				desc_id = "menu_deck7_9_desc_sc"
			}
		}

	--Infiltrator--
	local sc_infiltrator = {
			name_id = "menu_st_spec_8",
			desc_id = "menu_st_spec_8_desc",
			dlc = "character_pack_dragan",
			{
				upgrades = {
					"player_damage_dampener_close_contact_1"
				},
				cost = 200,
				icon_xy = {3, 4},
				name_id = "menu_deck8_1",
				desc_id = "menu_deck8_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_damage_dampener_close_contact_2"
				},
				cost = 400,
				icon_xy = {4, 4},
				name_id = "menu_deck8_3",
				desc_id = "menu_deck8_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_damage_dampener_close_contact_3",
					"melee_stacking_hit_expire_t",
					"melee_stacking_hit_damage_multiplier_1"
				},
				cost = 1000,
				icon_xy = {5, 4},
				name_id = "menu_deck8_5",
				desc_id = "menu_deck8_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_damage_dampener_outnumbered_strong",
					"melee_stacking_hit_damage_multiplier_2"
				},
				cost = 2400,
				icon_xy = {6, 4},
				name_id = "menu_deck8_7",
				desc_id = "menu_deck8_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_damage_to_hot_1",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {7, 4},
				name_id = "menu_deck8_9",
				desc_id = "menu_deck8_9_desc_sc"
			}
		}

	--Sociopath--
	local sc_sociopath = {
			name_id = "menu_st_spec_9",
			desc_id = "menu_st_spec_9_desc",
			dlc = "hlm2_deluxe",
			{
				upgrades = {
					"player_damage_dampener_close_contact_1"
				},
				cost = 200,
				icon_xy = {3, 4},
				name_id = "menu_deck9_1_sc",
				desc_id = "menu_deck8_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_killshot_regen_armor_bonus"
				},
				cost = 400,
				icon_xy = {0, 5},
				name_id = "menu_deck9_3",
				desc_id = "menu_deck9_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_melee_kill_life_leech"
				},
				cost = 1000,
				icon_xy = {1, 5},
				name_id = "menu_deck9_5",
				desc_id = "menu_deck9_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_killshot_close_regen_armor_bonus"
				},
				cost = 2400,
				icon_xy = {2, 5},
				name_id = "menu_deck9_7",
				desc_id = "menu_deck9_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_killshot_close_panic_chance",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {3, 5},
				name_id = "menu_deck9_9",
				desc_id = "menu_deck9_9_desc_sc"
			}
		}

	--Gambler--
	local sc_gambler = {
			name_id = "menu_st_spec_10",
			desc_id = "menu_st_spec_10_desc",
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_1"
				},
				cost = 200,
				icon_xy = {4, 5},
				name_id = "menu_deck10_1",
				desc_id = "menu_deck10_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"temporary_loose_ammo_give_team"
				},
				cost = 400,
				icon_xy = {5, 5},
				name_id = "menu_deck10_3",
				desc_id = "menu_deck10_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_loose_ammo_restore_health_give_team"
				},
				cost = 1000,
				icon_xy = {6, 5},
				name_id = "menu_deck10_5",
				desc_id = "menu_deck10_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_2"
				},
				cost = 2400,
				icon_xy = {7, 5},
				name_id = "menu_deck10_7",
				desc_id = "menu_deck10_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_3",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 6},
				name_id = "menu_deck10_9",
				desc_id = "menu_deck10_9_desc_sc"
			}
		}

	--Grinder--
	local sc_grinder = {
			name_id = "menu_st_spec_11",
			desc_id = "menu_st_spec_11_desc",
			dlc = "character_pack_sokol",
			{
				upgrades = {
					"player_damage_to_hot_1",
					"player_level_5_armor_addend"
				},
				cost = 200,
				icon_xy = {1, 6},
				name_id = "menu_deck11_1",
				desc_id = "menu_deck11_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_damage_to_hot_2"
				},
				cost = 400,
				icon_xy = {2, 6},
				name_id = "menu_deck11_3",
				desc_id = "menu_deck11_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_damage_to_hot_3"
				},
				cost = 1000,
				icon_xy = {3, 6},
				name_id = "menu_deck11_5",
				desc_id = "menu_deck11_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_damage_to_hot_4"
				},
				cost = 2400,
				icon_xy = {4, 6},
				name_id = "menu_deck11_7",
				desc_id = "menu_deck11_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_damage_to_hot_extra_ticks",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {5, 6},
				name_id = "menu_deck11_9",
				desc_id = "menu_deck11_9_desc_sc"
			}
		}

	--Yakuza--
	local sc_yakuza = {
			name_id = "menu_st_spec_12",
			desc_id = "menu_st_spec_12_desc",
			dlc = "dragon",
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_1"
				},
				cost = 200,
				icon_xy = {6, 6},
				name_id = "menu_deck12_1",
				desc_id = "menu_deck12_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_movement_speed_damage_health_ratio_multiplier"
				},
				cost = 400,
				icon_xy = {7, 6},
				name_id = "menu_deck12_3",
				desc_id = "menu_deck12_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_2"
				},
				cost = 1000,
				icon_xy = {0, 7},
				name_id = "menu_deck12_5",
				desc_id = "menu_deck12_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_3"
				},
				cost = 2400,
				icon_xy = {1, 7},
				name_id = "menu_deck12_7",
				desc_id = "menu_deck12_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_threshold_multiplier",
					"player_movement_speed_damage_health_ratio_threshold_multiplier",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {2, 7},
				name_id = "menu_deck12_9",
				desc_id = "menu_deck12_9_desc"
			}
		}

	--Ex President--
	local sc_ex = {
			name_id = "menu_st_spec_13",
			desc_id = "menu_st_spec_13_desc",
			{
				upgrades = {
					"player_armor_health_store_amount_1"
				},
				cost = 200,
				icon_xy = {3, 7},
				name_id = "menu_deck13_1",
				desc_id = "menu_deck13_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_armor_health_store_amount_2"
				},
				cost = 400,
				icon_xy = {4, 7},
				name_id = "menu_deck13_3",
				desc_id = "menu_deck13_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_armor_max_health_store_multiplier",
					"player_passive_dodge_chance_1"
				},
				cost = 1000,
				icon_xy = {5, 7},
				name_id = "menu_deck13_5",
				desc_id = "menu_deck13_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_health_store_amount_3"
				},
				cost = 2400,
				icon_xy = {6, 7},
				name_id = "menu_deck13_7",
				desc_id = "menu_deck13_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_kill_change_regenerate_speed",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {7, 7},
				name_id = "menu_deck13_9",
				desc_id = "menu_deck13_9_desc"
			}
		}


	--Maniac--
	local sc_maniac = {
			name_id = "menu_st_spec_14",
			desc_id = "menu_st_spec_14_desc",
			{
				upgrades = {
					"player_cocaine_stacking_1"
				},
				cost = 200,
				icon_xy = {0, 0},
				texture_bundle_folder = "coco",
				name_id = "menu_deck14_1",
				desc_id = "menu_deck14_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_sync_cocaine_stacks"
				},
				cost = 400,
				icon_xy = {1, 0},
				texture_bundle_folder = "coco",
				name_id = "menu_deck14_3",
				desc_id = "menu_deck14_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_cocaine_stacks_decay_multiplier_1"
				},
				cost = 1000,
				icon_xy = {2, 0},
				texture_bundle_folder = "coco",
				name_id = "menu_deck14_5",
				desc_id = "menu_deck14_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_sync_cocaine_upgrade_level_1"
				},
				cost = 2400,
				icon_xy = {3, 0},
				texture_bundle_folder = "coco",
				name_id = "menu_deck14_7",
				desc_id = "menu_deck14_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_cocaine_stack_absorption_multiplier_1",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				texture_bundle_folder = "coco",
				name_id = "menu_deck14_9",
				desc_id = "menu_deck14_9_desc_sc"
			}
		}

	--Anarchist--
	local sc_sydney = {
			name_id = "menu_st_spec_15",
			desc_id = "menu_st_spec_15_desc",
			dlc = "opera",
			{
				upgrades = {
					"player_armor_grinding_1"
				},
				cost = 200,
				icon_xy = {0, 0},
				texture_bundle_folder = "opera",
				name_id = "menu_deck15_1",
				desc_id = "menu_deck15_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_health_decrease_1",
					"player_armor_increase_1"
				},
				cost = 400,
				icon_xy = {1, 0},
				texture_bundle_folder = "opera",
				name_id = "menu_deck15_3",
				desc_id = "menu_deck15_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_armor_increase_2"
				},
				cost = 1000,
				icon_xy = {2, 0},
				texture_bundle_folder = "opera",
				name_id = "menu_deck15_5",
				desc_id = "menu_deck15_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_increase_3"
				},
				cost = 2400,
				icon_xy = {3, 0},
				texture_bundle_folder = "opera",
				name_id = "menu_deck15_7",
				desc_id = "menu_deck15_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_damage_to_armor_1",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				texture_bundle_folder = "opera",
				name_id = "menu_deck15_9",
				desc_id = "menu_deck15_9_desc_sc"
			}
		}
		
	--Rust Perlman--
	local sc_fat_dick = {
			{
				cost = 200,
				texture_bundle_folder = "wild",
				desc_id = "menu_deck16_1_desc_sc",
				name_id = "menu_deck16_1",
				upgrades = {
					"player_wild_health_amount_1",
					"player_wild_armor_amount_1"
				},
				icon_xy = {
					0,
					0
				}
			},
			deck2,
			{
				cost = 400,
				texture_bundle_folder = "wild",
				desc_id = "menu_deck16_3_desc",
				name_id = "menu_deck16_3",
				upgrades = {"player_less_health_wild_armor_1"},
				icon_xy = {
					1,
					0
				}
			},
			deck4,
			{
				cost = 1000,
				texture_bundle_folder = "wild",
				desc_id = "menu_deck16_5_desc",
				name_id = "menu_deck16_5",
				upgrades = {"player_less_health_wild_cooldown_1"},
				icon_xy = {
					2,
					0
				}
			},
			deck6,
			{
				cost = 2400,
				texture_bundle_folder = "wild",
				desc_id = "menu_deck16_7_desc",
				name_id = "menu_deck16_7",
				upgrades = {"player_less_armor_wild_health_1"},
				icon_xy = {
					3,
					0
				}
			},
			deck8,
			{
				cost = 4000,
				texture_bundle_folder = "wild",
				desc_id = "menu_deck16_9_desc",
				name_id = "menu_deck16_9",
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_less_armor_wild_cooldown_1"
				},
				icon_xy = {
					0,
					1
				}
			},
			name_id = "menu_st_spec_16",
			dlc = "wild",
			desc_id = "menu_st_spec_16_desc"
		}

	--YOU AND I--
	local sc_scarface = {
			name_id = "menu_st_spec_17",
			desc_id = "menu_st_spec_17_desc",
			dlc = "chico",
			{
				upgrades = {
					"temporary_chico_injector_1",
					"chico_injector"
				},
				cost = 200,
				icon_xy = {0, 0},
				texture_bundle_folder = "chico",
				name_id = "menu_deck17_1",
				desc_id = "menu_deck17_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"temporary_chico_injector_2"
				},
				cost = 400,
				icon_xy = {1, 0},
				texture_bundle_folder = "chico",
				name_id = "menu_deck17_3",
				desc_id = "menu_deck17_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"temporary_chico_injector_3",
					"player_chico_preferred_target"
				},
				cost = 1000,
				icon_xy = {2, 0},
				texture_bundle_folder = "chico",
				name_id = "menu_deck17_5",
				desc_id = "menu_deck17_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_chico_injector_low_health_multiplier"
				},
				cost = 2400,
				icon_xy = {3, 0},
				texture_bundle_folder = "chico",
				name_id = "menu_deck17_7",
				desc_id = "menu_deck17_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_chico_injector_health_to_speed",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				texture_bundle_folder = "chico",
				name_id = "menu_deck17_9",
				desc_id = "menu_deck17_9_desc_sc"
			}
		}

	--Chicken Tacos--
	local sc_wall = {
			name_id = "menu_st_spec_18",
			desc_id = "menu_st_spec_18_desc",
			{
				upgrades = {
					"player_tier_dodge_chance_1",
					"smoke_screen_grenade"
				},
				cost = 200,
				icon_xy = {0, 0},
				texture_bundle_folder = "max",
				name_id = "menu_deck18_1",
				desc_id = "menu_deck18_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 400,
				icon_xy = {1, 0},
				texture_bundle_folder = "max",
				name_id = "menu_deck18_3",
				desc_id = "menu_deck4_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_dodge_chance_2"
				},
				cost = 1000,
				icon_xy = {2, 0},
				texture_bundle_folder = "max",
				name_id = "menu_deck18_5",
				desc_id = "menu_deck4_3_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_passive_dodge_chance_3"
				},
				cost = 2400,
				icon_xy = {3, 0},
				texture_bundle_folder = "max",
				name_id = "menu_deck18_7",
				desc_id = "menu_deck4_3_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_smoke_screen_ally_dodge_bonus",
					"player_sicario_multiplier",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				texture_bundle_folder = "max",
				name_id = "menu_deck18_9",
				desc_id = "menu_deck18_9_desc_sc"
			}
		}
		
	--Don't cry for me, I'm already dead.--
	local sc_august = {
			desc_id = "menu_st_spec_19_desc",
			name_id = "menu_st_spec_19",
			{
				cost = 200,
				texture_bundle_folder = "myh",
				desc_id = "menu_deck19_1_desc_sc",
				name_id = "menu_deck19_1",
				upgrades = {
					"damage_control",
					"player_damage_control_passive",
					"player_damage_control_cooldown_drain_1",
					"player_armor_to_health_conversion"
				},
				icon_xy = {
					0,
					0
				}
			},
			deck2,
			{
				cost = 400,
				texture_bundle_folder = "myh",
				desc_id = "menu_deck19_3_desc_sc",
				name_id = "menu_deck19_3",
				upgrades = {"player_damage_control_auto_shrug_1"},
				icon_xy = {
					2,
					0
				}
			},
			deck4,
			{
				cost = 1000,
				texture_bundle_folder = "myh",
				desc_id = "menu_deck19_5_desc_sc",
				name_id = "menu_deck19_5",
				upgrades = {"player_damage_control_auto_shrug_2"},
				icon_xy = {
					2,
					0
				}
			},
			deck6,
			{
				cost = 2400,
				texture_bundle_folder = "myh",
				desc_id = "menu_deck19_7_desc",
				name_id = "menu_deck19_7",
				upgrades = {"player_damage_control_cooldown_drain_2"},
				icon_xy = {
					3,
					0
				}
			},
			deck8,
			{
				cost = 4000,
				texture_bundle_folder = "myh",
				desc_id = "menu_deck19_9_desc",
				name_id = "menu_deck19_9",
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_damage_control_healing"
				},
				icon_xy = {
					0,
					1
				}
			}
		}
		
	--The Doctor wrote "fucking loser" on his chart--
	local sc_nose = {
			{
				cost = 200,
				texture_bundle_folder = "ecp",
				desc_id = "menu_deck20_1_desc_sc",
				name_id = "menu_deck20_1",
				upgrades = {
					"tag_team",
					"player_tag_team_base"
				},
				icon_xy = {
					0,
					0
				}
			},
			deck2,
			{
				cost = 400,
				texture_bundle_folder = "ecp",
				desc_id = "menu_deck20_3_desc_sc",
				name_id = "menu_deck20_3",
				upgrades = {
					"player_tag_team_cooldown_drain_1"
				},
				icon_xy = {
					0,
					1
				}
			},
			deck4,
			{
				cost = 1000,
				texture_bundle_folder = "ecp",
				desc_id = "menu_deck20_5_desc_sc",
				name_id = "menu_deck20_5",
				upgrades = {
					"player_tag_team_damage_absorption_1"
				},
				icon_xy = {
					2,
					0
				}
			},
			deck6,
			{
				cost = 2400,
				texture_bundle_folder = "ecp",
				desc_id = "menu_deck20_7_desc_sc",
				name_id = "menu_deck20_7",
				upgrades = {
					"player_tag_team_damage_absorption_2"
				},
				icon_xy = {
					2,
					0
				}
			},
			deck8,
			{
				cost = 4000,
				texture_bundle_folder = "ecp",
				desc_id = "menu_deck20_9_desc_sc",
				name_id = "menu_deck20_9",
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_tag_team_cooldown_drain_2"
				},
				icon_xy = {
					0,
					1
				}
			},
			name_id = "menu_st_spec_20",
			dlc = "ecp",
			desc_id = "menu_st_spec_20_desc"
		}
		
	--You need a science skill of 100 to understand the fuck's the point of this perk deck--
	local sc_nip = {
			{
				cost = 200,
				texture_bundle_folder = "joy",
				desc_id = "menu_deck21_1_desc",
				name_id = "menu_deck21_1",
				upgrades = {
					"pocket_ecm_jammer",
					"player_pocket_ecm_jammer_base"
				},
				icon_xy = {
					0,
					0
				}
			},
			deck2,
			{
				cost = 400,
				texture_bundle_folder = "joy",
				desc_id = "menu_deck21_3_desc",
				name_id = "menu_deck21_3",
				upgrades = {
					"player_passive_health_multiplier_1",
					"player_passive_health_multiplier_2",
					"player_passive_health_multiplier_3",
					"player_passive_health_multiplier_4"					
				},
				icon_xy = {
					1,
					0
				}
			},
			deck4,
			{
				cost = 1000,
				texture_bundle_folder = "joy",
				desc_id = "menu_deck21_5_desc",
				name_id = "menu_deck21_5",
				upgrades = {
					"player_pocket_ecm_heal_on_kill_1"
				},
				icon_xy = {
					2,
					0
				}
			},
			deck6,
			{
				cost = 2400,
				texture_bundle_folder = "joy",
				desc_id = "menu_deck21_7_desc",
				name_id = "menu_deck21_7",
				upgrades = {"player_pocket_ecm_kill_dodge_1"},
				icon_xy = {
					3,
					0
				}
			},
			deck8,
			{
				cost = 4000,
				texture_bundle_folder = "joy",
				desc_id = "menu_deck21_9_desc",
				name_id = "menu_deck21_9",
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"team_pocket_ecm_heal_on_kill_1"
				},
				icon_xy = {
					0,
					1
				}
			},
			desc_id = "menu_st_spec_21_desc",
			name_id = "menu_st_spec_21"
		}	

	--Then we insert our new perk decks into the table--
	self.specializations[1] = sc_crew_chief
	self.specializations[2] = sc_muscle
	self.specializations[3] = sc_armorer
	self.specializations[4] = sc_rogue
	self.specializations[5] = sc_hitman
	self.specializations[6] = sc_crook
	self.specializations[7] = sc_burglar
	self.specializations[8] = sc_infiltrator
	self.specializations[9] = sc_sociopath
	self.specializations[10] = sc_gambler
	self.specializations[11] = sc_grinder
	self.specializations[12] = sc_yakuza
	self.specializations[13] = sc_ex
	self.specializations[14] = sc_maniac
	self.specializations[15] = sc_sydney
	self.specializations[16] = sc_fat_dick
	self.specializations[17] = sc_scarface
	self.specializations[18] = sc_wall	
	self.specializations[19] = sc_august	
	self.specializations[20] = sc_nose
	self.specializations[21] = sc_nip
end

end