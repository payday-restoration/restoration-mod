--[[

To whom it may concern, hello! If you're seeing this, there's a good chance you might be here to remove vital files related to
making the skill overhaul in SC's mod function. While I understand that some of you may not like having your builds become
invalid in the mod, you MUST understand that the mod was balanced with these changes in mind! Especially since it's to nerf
overpowered builds and abilities that would otherwise trivialize the buffs I made to the cops, and you have to remember the 
entire point of the mod was to increase the game's difficulty. So I ask you, please, actually try the mod with revamped skilltrees 
before dismissing it. I promise you it's still fun and in fact, you may find that you enjoy this system more.

]]--

local sc_sttd = UpgradesTweakData._init_pd2_values
function UpgradesTweakData:_init_pd2_values()
	sc_sttd(self, tweak_data)

	--Upgrade Value changes for skills and such--

	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	--Explosives hurt--
	self.explosive_bullet.curve_pow = 1
	self.explosive_bullet.player_dmg_mul = 1
	self.explosive_bullet.range = 350
	self.explosive_bullet.feedback_range = self.explosive_bullet.range
	self.explosive_bullet.camera_shake_max_mul = 4

	--Restoring movement penalties--
	self.weapon_movement_penalty.minigun = 0.8
	self.weapon_movement_penalty.lmg = 0.8

	end

	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--Armor related stuff--
	self.values.player.body_armor.armor = {
		1,
		2,
		4,
		6,
		11,
		13,
		18
	}
	self.values.player.body_armor.movement = { 
		1, 
		0.95, 
		0.9, 
		0.85, 
		0.75, 
		0.72, 
		0.62
	}
	self.values.player.body_armor.dodge = {
		0.05,
		-0.05,
		-0.1,
		-0.15,
		-0.3,
		-0.35,
		-0.4
	}
	self.values.player.body_armor.concealment = {
		30,
		25,
		20,
		15,
		5,
		1,
		0
	}
	self.values.player.body_armor.damage_shake = { 
		3, 
		1.75, 
		1, 
		0.95, 
		0.8, 
		0.7, 
		0.5 
	}
	self.values.player.body_armor.stamina = {
		1.025,
		1,
		0.95,
		0.9,
		0.85,
		0.8,
		0.7
	}
	self.values.player.body_armor.skill_ammo_mul = {
		1,
		1.02,
		1.04,
		1.06,
		1.8,
		1.1,
		1.12
	}
	self.values.player.body_armor.skill_max_health_store = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}
	self.values.player.body_armor.skill_kill_change_regenerate_speed = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}

	self.values.rep_upgrades.values = {0}

	--Custom stuff for SC's mod, mainly suppression resistance and stuff--
    	self.values.player.suppression_resist = {true}
    	self.values.player.ignore_suppression_flinch = {true}
    	self.values.player.health_revive_max = {true}
    	self.values.player.yakuza_berserker = {true}
	--Bot boost stuff stuff--
	if Global.game_settings and Global.game_settings.single_player then
		self.values.team.crew_add_health = {2}
		self.values.team.crew_add_armor = {1}
		self.values.team.crew_add_dodge = {0.02}
		self.values.team.crew_add_concealment = {1}
		self.values.team.crew_add_stamina = {25}
		self.values.team.crew_reduce_speed_penalty = {1}
		self.values.team.crew_health_regen = {0.1}
		self.values.team.crew_throwable_regen = {150}
		self.values.team.crew_faster_reload = {1.1}
		self.values.team.crew_faster_swap = {1}	
	else
		self.values.team.crew_add_health = {0}
		self.values.team.crew_add_armor = {0}
		self.values.team.crew_add_dodge = {0}
		self.values.team.crew_add_concealment = {0}
		self.values.team.crew_add_stamina = {0}
		self.values.team.crew_reduce_speed_penalty = {1}
		self.values.team.crew_health_regen = {0}
		self.values.team.crew_throwable_regen = {999999999999999999999999999999999999999999999999999999999999999999}
		self.values.team.crew_faster_reload = {1}
		self.values.team.crew_faster_swap = {1}
	end

	--Crew ability stuff
	self.values.team.crew_inspire = {
		{
			30,
			30,
			30
		}
	}
	self.values.team.crew_scavenge = {
		{
			0.05,
			0.05,
			0.05
		}
	}
	self.values.team.crew_interact = {
		{
			0.9,
			0.9,
			0.9
		}
	}
	self.values.team.crew_ai_ap_ammo = {true}
	
	--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{
				--Combat Medic--
				self.values.temporary.combat_medic_damage_multiplier = {
					{1.25, 10},
					{1.25, 15}
				}
				self.revive_health_multiplier = {1.3}

				--Quick Fix
				self.values.first_aid_kit.deploy_time_multiplier = {0.5}
				self.values.temporary.first_aid_damage_reduction = { {0.85, 20} }

				--Painkillers--
				self.values.temporary.passive_revive_damage_reduction = {
					{0.75, 5},
					{0.5, 5}
				}
			
				--Uppers
				self.values.first_aid_kit.quantity = {4, 10}
				self.values.first_aid_kit.downs_restore_chance = {1}

				--Combat Doctor
				self.doctor_bag_base = 2
				self.values.doctor_bag.quantity = {1}
				self.values.doctor_bag.amount_increase = {2}
				
				--Inspire
				self.values.player.long_dis_revive = {0.5, 0.5}
				self.skill_descs.inspire = {multibasic = "50%", multibasic2 = "20%", multibasic3 = "10", multipro = "50%"}
				self.values.cooldown.long_dis_revive = {
					{1, 30}
				}
				self.morale_boost_speed_bonus = 1.2
				self.morale_boost_suppression_resistance = 1
				self.morale_boost_time = 10
				self.morale_boost_reload_speed_bonus = 1
				self.morale_boost_base_cooldown = 3.5
			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
				--Cable Guy
				self.values.cable_tie.interact_speed_multiplier = {0.25}
				self.values.cable_tie.quantity_1 = {4}
				self.values.player.stamina_multiplier = {2}
				self.values.team.stamina.multiplier = {1.5}

				--Clowns are Scary
				self.values.player.intimidate_range_mul = {1.5}
				self.values.player.intimidate_aura = {1000}
				self.values.player.convert_enemies_max_minions = {1, 2}

				--Joker
				self.values.player.convert_enemies = {true}
				self.values.player.convert_enemies_health_multiplier = {0.65}
				self.values.player.convert_enemies_damage_multiplier = {1.45}
				self.values.player.convert_enemies_interaction_speed_multiplier = {0.35}

				--Stockholm Syndrome
				self.values.player.civ_calming_alerts = {true}
				self.values.player.civ_intimidation_mul = {1.5}
				self.values.player.civilian_reviver = {true}
				self.values.player.civilian_gives_ammo = {true}
				self.values.player.super_syndrome = {0}

				--This breaks shit for some reason, not that it matters since we didn't change anything anyway.
				--Partners in Crime--
				--self.values.player.minion_master_speed_multiplier = {1.1}
				--self.values.player.minion_master_health_multiplier = {1.3}
				--self.values.player.passive_convert_enemies_health_multiplier = {0.25}
				--self.values.player.passive_convert_enemies_damage_multiplier = {1.15}				
			
				--Hostage Taker
				self.values.player.hostage_health_regen_addend = {0.015, 0.045}
			--}
			
			--[[   ASSAULT SUBTREE   ]]--
			--{
				--Leadership--
				self.values.smg.recoil_index_addend = {1}
				self.values.team.weapon.recoil_index_addend = {1}

				--MG Handling (Rifleman)
				self.values.smg.reload_speed_multiplier = {1.25}
				self.values.smg.hip_fire_spread_multiplier = {0.5}

				--MG Specialist (Marksman)
				self.values.smg.fire_rate_multiplier = {1.2}
				self.values.smg.damage_multiplier = {1.15}
				
				--Shock and Awe
				self.values.weapon.clip_ammo_increase = {1.3, 1.5}

				--Heavy Impact
				self.values.weapon.knock_down = {0.1, 0.25}
	
				--Body Expertise
				self.values.weapon.automatic_head_shot_add = {0.3, 1}

			--}
		--}
		
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{
				--Underdog
				self.values.temporary.dmg_multiplier_outnumbered = { {1.1, 7} }
				self.values.temporary.dmg_dampener_outnumbered = { {0.9, 7} }
				
				--Shotgun CQB
				self.values.shotgun.reload_speed_multiplier = {1.25, 1.5}
				self.values.shotgun.enter_steelsight_speed_multiplier = {1.5}
				self.skill_descs.shotgun_cqb = {multibasic = "25%", multibasic2 = "25%", multipro = "25%", multipro2 = "125%"}

				--Shotgun Impact
				self.values.shotgun.recoil_index_addend = {1}
				self.values.shotgun.damage_multiplier = {1.15, 1.15}
				self.skill_descs.shotgun_impact = {multibasic = "4", multipro = "35%"}
				
				--Far Away
				self.values.shotgun.steelsight_accuracy_inc = {0.6}
				self.values.shotgun.steelsight_range_inc = {1.5}

				--Close By
				self.values.shotgun.hip_run_and_shoot = {true}
				self.values.shotgun.hip_rate_of_fire = {1.35}
				
				--Overkill
				self.values.shotgun.swap_speed_multiplier = {1.8}
				self.values.saw.swap_speed_multiplier = {1.8}
				self.values.temporary.overkill_damage_multiplier = {
					{1.75, 2},
					{1.75, 10}
				}
			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{
				--Stun Resistance
				self.values.player.damage_shake_addend = {1}
				self.values.player.flashbang_multiplier = {0.75, 0.25}
				
				--Die Hard
				self.values.player.armor_regen_timer_multiplier = {0.85}
				self.values.player.primary_weapon_when_downed = {true}

				--Transporter
				self.values.carry.movement_speed_multiplier = {1.5}
				self.values.carry.throw_distance_multiplier = {1.5}
				self.values.carry.movement_penalty_nullifier = {true}
				
				--More Blood To Bleed
				self.values.player.health_multiplier = {1.25, 1.5}

				--Bullseye
				self.values.player.headshot_regen_armor_bonus = {0.05, 2.5}

				--Iron Man
				self.values.player.shield_knock = {true}

			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
				--Scavenging
				self.values.player.double_drop = {10}
				self.values.player.increased_pickup_area = {1.5}
				
				--Bulletstorm
				self.values.player.no_ammo_cost = {true, true}

				--Portable Saw
				self.values.saw.reload_speed_multiplier = {1.25}
				self.values.saw.damage_multiplier = {1.15}
				
				--Extra Lead
				self.values.ammo_bag.ammo_increase = {2}
				self.values.ammo_bag.quantity = {1}

				--Carbon Blade
				self.values.saw.enemy_slicer = {true}
				self.values.saw.ignore_shields = {true}
				self.values.saw.panic_when_kill = {
					{
						area = 1000,
						chance = 0.5,
						amount = 200
					}
				}
				
				--Fully Loaded
				self.values.player.extra_ammo_multiplier = {1.25}
				self.values.player.pick_up_ammo_multiplier = {1.35, 2.1}
				self.values.player.regain_throwable_from_ammo = {
					{chance = 0.02, chance_inc = 1.0}
				}
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
				--Defense up
				self.values.sentry_gun.cost_reduction = {2, 3}
				self.values.sentry_gun.shield = {true}	
				
				--Sentry Targeting Package
				self.values.sentry_gun.spread_multiplier = {2}
				self.values.sentry_gun.rot_speed_multiplier = {2}
				self.values.sentry_gun.extra_ammo_multiplier = {2}

				--Eco Sentry
				self.values.sentry_gun.armor_multiplier = {2.5}
			
				--Engineering
				self.values.sentry_gun.less_noisy = {true}
				self.values.sentry_gun.ap_bullets = {true}
				self.values.sentry_gun.fire_rate_reduction = {4}
				self.values.sentry_gun.damage_multiplier = {2.5}

				--Jack of All Trades
				self.values.player.deploy_interact_faster = {0.5}
				self.values.player.second_deployable = {true}
	
				--Tower Defence
				self.values.sentry_gun.quantity = {1, 2}
				self.skill_descs.tower_defense = { 
					[1] = 1, 
					[2] = 1, 
					multibasic = "2",
					multipro = "3"
				}
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{
				--Hardware Expert
				self.values.player.drill_fix_interaction_speed_multiplier = {0.5}
				self.values.player.drill_alert_rad = {900}
				self.values.player.silent_drill = {true}
				
				--Danger Close
				self.values.trip_mine.explosion_size_multiplier_1 = {1.3}
				self.values.trip_mine.damage_multiplier = {1.5}

				--Drill Sawgent
				self.values.player.drill_speed_multiplier = {0.85, 0.7}
				
				--Demoman
				--Located in tweakdata.lua since their quantity is hardcoded in the exe

				--Kickstarter
				self.values.player.drill_autorepair_1 = {0.1}
				self.values.player.drill_autorepair_2 = {0.2}
				self.values.player.drill_melee_hit_restart_chance = {true}
				
				--Fire Trap
				self.values.trip_mine.fire_trap = {
					{0, 1},
					{10, 1.5}
				}
			--}
			
			--[[   BATTLE SAPPER SUBTREE   ]]--
			--{
				--Nerves of Steel
				self.values.player.interacting_damage_multiplier = {0.5}
				self.values.player.steelsight_when_downed = {true}
	
				--Sharpshooter
				self.values.weapon.single_spread_index_addend = {1}
				self.values.assault_rifle.recoil_index_addend = {1}
				self.values.snp.recoil_index_addend = {1}
				self.sharpshooter_categories = {
					"assault_rifle",
					"smg",
					"snp"
				}

				--Spotter
				self.values.player.marked_enemy_extra_damage = {true}
				self.values.player.marked_enemy_damage_mul = 1.15
				self.values.player.marked_inc_dmg_distance = {{2500, 1.25}}
				
				--Kilmer
				self.values.assault_rifle.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.5}
				self.values.snp.enter_steelsight_speed_multiplier = {1.5}
				self.values.snp.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.move_spread_multiplier = {0.5}
				self.values.snp.move_spread_multiplier = {0.5}

				--Ammo Efficiency
				self.values.player.head_shot_ammo_return = {
					{ ammo = 1, time = 6, headshots = 3 },
					{ ammo = 1, time = 6, headshots = 2 }
				}
					
				--Bulletproof
				self.values.player.armor_multiplier = {1.35, 1.5}
				self.values.team.armor.regen_time_multiplier = {0.9}
				self.values.player.armor_regen_timer_multiplier_tier = {0.8}
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{
				--Chameleon
				self.values.player.suspicion_multiplier = {0.75}
				self.values.player.sec_camera_highlight_mask_off = {true}
				self.values.player.special_enemy_highlight_mask_off = {true}
				self.values.player.mask_off_pickup = {true}
				self.values.player.small_loot_multiplier = {1.1, 1.3}
				
				--Cleaner
				self.values.player.corpse_dispose_amount = {1, 2}
				self.values.player.extra_corpse_dispose_amount = {1}
				self.values.bodybags_bag.quantity = {1}
				self.values.player.cleaner_cost_multiplier = {0}
				self.values.weapon.special_damage_taken_multiplier = {1.05}

				--Sixth Sense
				self.values.player.standstill_omniscience = {true}
				self.values.player.additional_assets = {true}
				self.values.player.buy_bodybags_asset = {true}
				self.values.player.buy_spotter_asset = {true}
				
				--Undertaker
				self.values.player.tape_loop_duration = {10, 25}	
				self.values.player.pick_lock_easy_speed_multiplier = {0.25}
				self.values.player.pick_lock_hard = {true}
				self.values.player.mark_enemy_time_multiplier = {2}

				--ECM Overdrive
				self.values.ecm_jammer.feedback_duration_boost = {1.25}
				self.values.ecm_jammer.duration_multiplier = {1.25}
				self.values.ecm_jammer.can_open_sec_doors = {true}
				
				--ECM Specialist
				self.values.ecm_jammer.quantity = {1, 3}
				self.values.ecm_jammer.duration_multiplier_2 = {1.25}
				self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
				self.values.ecm_jammer.affects_pagers = {true}
				self.values.player.melee_kill_snatch_pager_chance = {0}
			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{
				--Duck and Cover
				self.values.player.run_dodge_chance = {0.1}
				self.values.player.run_speed_multiplier = {1.25}
				self.values.player.crouch_dodge_chance = {0.05, 0.15}

				--Evasion
				self.values.player.movement_speed_multiplier = {1.1}
				self.values.player.climb_speed_multiplier = {1.2, 1.75}
				self.values.player.can_free_run = {true}
				self.values.player.fall_damage_multiplier = {0.25}
				self.values.player.fall_health_damage_multiplier = {0}

				--Deep Pockets
				self.values.player.melee_concealment_modifier = {2}
				self.values.player.ballistic_vest_concealment = {4}
				self.values.player.level_2_armor_addend = {2}
				self.values.player.level_3_armor_addend = {2}
				self.values.player.level_4_armor_addend = {2}

				
				--Moving Target
				self.values.player.detection_risk_add_movement_speed = {
					{
						0.01,
						3,
						"below",
						35,
						0.1
					},
					{
						0.01,
						1,
						"below",
						35,
						0.1
					}
				}

				--Shockproof

			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{
				--Second Wind--
				self.values.temporary.damage_speed_multiplier = {
					{1.15, 5},
					{1.3, 8}
				}

				--Optical Illusions
				self.values.player.silencer_concealment_increase = {1}
				self.values.player.silencer_concealment_penalty_decrease = {2}

				--The Professional
				self.values.weapon.silencer_spread_index_addend = {1}
				self.values.weapon.silencer_recoil_index_addend = {1}
				self.values.weapon.silencer_enter_steelsight_speed_multiplier = {1.5}

				--Dire Need
				self.values.player.armor_depleted_stagger_shot = {0, 5}
				
				--Subsonic Rounds
				self.values.weapon.silencer_damage_multiplier = {1.075, 1.15}

				--Low Blow
				self.values.player.detection_risk_add_crit_chance = {
					{
						0.03,
						3,
						"below",
						35,
						0.3
					},
					{
						0.03,
						1,
						"below",
						35,
						0.3
					}
				}


			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{
				--Equilibrium
				self.values.pistol.swap_speed_multiplier = {1.8}
				self.values.team.pistol.recoil_index_addend = {1}
				self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
				
				--Gun Nut
				self.values.pistol.spread_index_addend = {1}
				self.values.pistol.fire_rate_multiplier = {1.5}

				--Over Pressurized/Custom Ammo (Formerly Akimbo)
				self.values.pistol.reload_speed_multiplier = {1.5}
				self.values.pistol.damage_multiplier = {1.15}
				
				--Akimbo (Formerly Over Pressurized/Custom Ammo)
				self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5}
				self.values.akimbo.recoil_multiplier = {
					1.5,
					1.25,
					1
				}

				--Desperado
				self.values.pistol.stacked_accuracy_bonus = {
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 10},
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 20}
				}
				
				--Trigger Happy
				self.values.pistol.stacking_hit_damage_multiplier = {
					{
						damage_bonus = 1.2,
						max_stacks = 4,
						max_time = 2
					},
					{	
						damage_bonus = 1.2,
						max_stacks = 4,
						max_time = 10
					}
				}

			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{
				--Running From Death (Formerly Nine Lives)
				self.values.temporary.swap_weapon_faster = {{1.25, 10}}
				self.values.temporary.reload_weapon_faster = {{1.25, 10}}
				self.values.temporary.increased_movement_speed = {{1.25, 10}}
				
				--Nine Lives (Formerly Running From Death)
				self.values.player.bleed_out_health_multiplier = {2}
				self.values.player.additional_lives = {1, 3}

				--Up You Go
				self.values.temporary.revived_damage_resist = {{0.7, 10}}
				self.values.player.revived_health_regain = {1.4}
				
				--Swan Song
				self.values.temporary.berserker_damage_multiplier = { {1, 5}, {1, 10} }

				--Undying
				self.values.player.cheat_death_chance = {0.25, 0.5}
				
				--Messiah
				self.values.player.messiah_revive_from_bleed_out = {1, 3}
				self.values.player.pistol_revive_from_bleed_out = {1, 3}
			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{
				--Martial Arts
				self.values.player.melee_damage_dampener = {0.50}
				self.values.player.melee_knockdown_mul = {1.5}
				
				--Bloodthirst
				self.values.player.melee_damage_stacking = {{melee_multiplier = 0.25, max_multiplier = 1.50}}
				self.values.temporary.melee_kill_increase_reload_speed = {{1.25, 10}}

				--Pumping Iron	
				self.values.player.non_special_melee_multiplier = {1.25, 1.50}
				self.values.player.melee_damage_multiplier = {1.25, 1.50}
				
				--Counter Strike
				self.values.player.counter_strike_melee = {true}
				self.values.player.counter_strike_spooc = {true}

				--Frenzy (Berserker)
				self.values.player.max_health_reduction = {0.2}
				self.values.player.healing_reduction = {0.25, 0.50}
               			self.values.player.health_damage_reduction = {0.85, 0.7}
                		self.values.player.real_health_damage_reduction = {0.7, 0.5}
				
				--Berserker (Frenzy)
				self.player_damage_health_ratio_threshold = 0.25
				self.player_damage_health_ratio_threshold_2 = 0.5
				self.values.player.damage_health_ratio_multiplier = {1}
				self.values.player.melee_damage_health_ratio_multiplier = {2.50}
			--}
		--}

    	if Global.game_settings and Global.game_settings.single_player then
		self.values.cable_tie.quantity_1 = {16}
	end

	--Perk Deck shit--
	self.values.temporary.armor_break_invulnerable = {
		{2, 15}
	}
	self.values.player.armor_regen_timer_stand_still_multiplier = {0.9}
	self.values.player.armor_regen_timer_multiplier_passive = {0.95}

	--Hitman
	self.values.player.perk_armor_regen_timer_multiplier = {
		0.9,
		0.8,
		0.7,
		0.6,
		0.5
	}

	self.values.player.level_2_dodge_addend = {
		0.1,
		0.2,
		0.35
	}
	self.values.player.level_3_dodge_addend = {
		0.1,
		0.2,
		0.35
	}
	self.values.player.level_4_dodge_addend = {
		0.1,
		0.2,
		0.35
	}

	self.values.player.level_5_armor_addend = {-7}
	self.values.player.level_2_armor_multiplier = {
		1.1,
		1.2,
		1.4
	}
	self.values.player.level_3_armor_multiplier = {
		1.1,
		1.2,
		1.4
	}
	self.values.player.level_4_armor_multiplier = {
		1.1,
		1.2,
		1.4
	}

	self.values.player.tier_armor_multiplier = {
		1.1,
		1.1,
		1.2,
		1.2,
		1.25,
		1.25
	}
	self.values.temporary.melee_life_leech = {
		{0.1, 10}
	}
	self.values.akimbo.recoil_multiplier = {
		1.5,
		1.25,
		1
	}
	self.values.team.armor.multiplier = {1.05}
	self.values.team.health.passive_multiplier = {1.05}
	self.hostage_max_num = {
		health_regen = 1,
		health = 4,
		stamina = 4,
		damage_dampener = 1
	}
	self.values.team.health.hostage_multiplier = {1.05}
	self.values.team.stamina.hostage_multiplier = {1.10}
	self.values.player.passive_dodge_chance = {
		0.1,
		0.2,
		0.3,
		0.4
   	}
	self.values.player.passive_health_regen = {0.025}
	self.values.player.passive_health_multiplier = {
		1.1,
		1.2,
		1.3,
		1.4,
		1.5
	}
	self.values.temporary.dmg_dampener_close_contact = {
		{0.9, 7},
		{0.85, 7},
		{0.8, 7}
	}
	self.values.dmg_dampener_outnumbered_strong = {
		{0.95, 7}
	}
	self.values.player.damage_to_hot = {
		0.1,
		0.2,
		0.3,
		0.4
	}
	self.values.player.tier_dodge_chance = {
		0.05,
		0.05,
		0.05
	}
	self.values.player.damage_to_hot_extra_ticks = {2}
	self.damage_to_hot_data = {
		armors_allowed = {"level_5"},
		works_with_armor_kit = true,
		tick_time = 0.5,
		total_ticks = 6,
		max_stacks = false,
		stacking_cooldown = 1,
		add_stack_sources = {
			bullet = true,
			explosion = true,
			melee = true,
			taser_tased = true,
			poison = true,
			fire = true,
			projectile = true,
			swat_van = true,
			civilian = false
		}
	}
	
	self.values.player.perk_armor_loss_multiplier = {
		0.5,
		0.9,
		0.85,
		0.8
	}

	--Gambler
 	self.loose_ammo_restore_health_values = {
		base = 4,
 		cd = 4,
 		multiplier = 0.2,
		{0, 2},
		{2, 4},
		{4, 6}
 	}
	self.loose_ammo_give_team_health_ratio = 0.5

	--Sociopath nerfs
	self.values.player.killshot_regen_armor_bonus = {2.5}
	self.values.player.killshot_close_regen_armor_bonus = {2.5}
	self.values.player.killshot_close_panic_chance = {0.25}
	self.on_killshot_cooldown = 2

	--Anarchist stuff--
	self.values.player.armor_grinding = {
		{
			{1.5, 1},
			{2.5, 2},
			{3.5, 3},
			{4.5, 4},
			{5.5, 5},
			{6.5, 6},
			{7.5, 7}
		}
	}
	self.values.player.health_decrease = {0.5}
	self.values.player.armor_increase = {
		0.5,
		0.55,
		0.6
	}
	self.values.player.damage_to_armor = {
		{
			{1, 2},
			{1, 2},
			{1, 2},
			{1, 2},
			{1, 2},
			{1, 2},
			{1, 2}
		}
	}

	--I AM A BAD MOTHERFUCKA--
	self.values.player.cocaine_stack_absorption_multiplier = {1.5}
	
	--Chico--
	self.values.temporary.chico_injector = {
		{0.5, 5}
	}
	self.values.player.chico_armor_multiplier = {
		1.05,
		1.1,
		1.15
	}
	self.values.player.chico_injector_low_health_multiplier = {
		{0.25, 0.2}
	}	
	self.values.player.chico_injector_health_to_speed = {
		{5, 1}
	}

	--Are these the dreamers we were told about?--
	self.values.player.dodge_shot_gain = {
		{0.2, 4}
	}
	self.values.player.dodge_replenish_armor = {true}
	self.values.player.smoke_screen_ally_dodge_bonus = {0.05}
	self.values.player.sicario_multiplier = {1.5}
end

--Added new definitions--

local sc_definitions = UpgradesTweakData._player_definitions
function UpgradesTweakData:_player_definitions()
	sc_definitions (self, tweak_data)

	--New Definitions, calling em here to play it safe--
        self.definitions.player_detection_risk_add_movement_speed_1 = {
            category = "feature",
            name_id = "menu_player_detection_risk_add_movement_speed",
            upgrade = {
                category = "player",
                upgrade = "detection_risk_add_movement_speed",
                value = 1
            }
        } 
	self.definitions.player_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_player_melee_knockdown_mul",
		upgrade = {
			category = "player",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}    
        self.definitions.player_detection_risk_add_movement_speed_2 = {
            category = "feature",
            name_id = "menu_player_detection_risk_add_movement_speed",
            upgrade = {
                category = "player",
                upgrade = "detection_risk_add_movement_speed",
                value = 2
            }
        }
	self.definitions.player_health_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "health_multiplier",
			value = 2
		}
	}
	self.definitions.pistol_stacked_accuracy_bonus_1 = {
		category = "feature",
		name_id = "menu_pistol_stacked_accuracy_bonus",
		upgrade = {
			category = "pistol",
			upgrade = "stacked_accuracy_bonus",
			value = 1
		}
	}
	self.definitions.pistol_stacked_accuracy_bonus_2 = {
		category = "feature",
		name_id = "menu_pistol_stacked_accuracy_bonus",
		upgrade = {
			category = "pistol",
			upgrade = "stacked_accuracy_bonus",
			value = 2
		}
	}
	self.definitions.player_non_special_melee_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 1
		}
	}
	self.definitions.player_non_special_melee_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 2
		}
	}
	self.definitions.player_melee_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 2
		}
	}
	self.definitions.player_messiah_revive_from_bleed_out_2 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "messiah_revive_from_bleed_out",
			value = 2
		}
	}
	self.definitions.player_suppression_resist = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "suppression_resist",
			value = 1
		}
	}
	self.definitions.player_ignore_suppression_flinch = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "ignore_suppression_flinch",
			value = 1
		}
	}
	self.definitions.player_yakuza_berserker = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "yakuza_berserker",
			value = 1
		}
	}
	self.definitions.player_level_5_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_5_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_5_armor_addend",
			value = 1
		}
	}
	self.definitions.player_health_revive_max = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "health_revive_max",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_5 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 5
		}
	}
	self.definitions.temporary_damage_speed_multiplier_1 = {
		category = "temporary",
		name_id = "menu_temporary_damage_speed_1",
		upgrade = {
			category = "temporary",
			upgrade = "damage_speed_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_damage_speed_multiplier_2 = {
		category = "temporary",
		name_id = "menu_temporary_damage_speed_1",
		upgrade = {
			category = "temporary",
			upgrade = "damage_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_real_health_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_player_real_health_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "real_health_damage_reduction",
			value = 1
		}
	}
	self.definitions.player_real_health_damage_reduction_2 = {
		category = "feature",
		name_id = "menu_player_real_health_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "real_health_damage_reduction",
			value = 2
		}
	}
	self.definitions.player_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_multiplier",
			value = 2
		}
	}
end

function UpgradesTweakData:_smg_definitions()
	self.definitions.smg_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_reload_speed_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.smg_recoil_multiplier = {
		category = "feature",
		name_id = "menu_smg_recoil_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.smg_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.smg_damage_multiplier = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_spread_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_damage_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.smg_recoil_index_addend = {
		category = "feature",
		name_id = "menu_smg_recoil_index_addend",
		upgrade = {
			category = "smg",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
end

function UpgradesTweakData:_saw_definitions()
	self.definitions.saw = {
		category = "weapon",
		weapon_id = "saw",
		factory_id = "wpn_fps_saw"
	}
	self.definitions.saw_secondary = {
		category = "weapon",
		weapon_id = "saw_secondary",
		factory_id = "wpn_fps_saw_secondary"
	}
	self.definitions.saw_extra_ammo_multiplier = {
		category = "feature",
		name_id = "menu_saw_extra_ammo_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.saw_enemy_slicer = {
		category = "feature",
		name_id = "menu_saw_enemy_slicer",
		upgrade = {
			category = "saw",
			upgrade = "enemy_slicer",
			value = 1
		}
	}
	self.definitions.saw_recoil_multiplier = {
		category = "feature",
		name_id = "menu_saw_recoil_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_1 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_2 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 2
		}
	}
	self.definitions.saw_lock_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_lock_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 2
		}
	}
	self.definitions.saw_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_spread_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.saw_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_saw_armor_piercing_chance",
		upgrade = {
			category = "saw",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.saw_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_swap_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_reload_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_saw_melee_knockdown_mul",
		upgrade = {
			category = "saw",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
	self.definitions.saw_damage_multiplier = {
		category = "feature",
		name_id = "menu_saw_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_overkill_damage_multiplier_2 = {
		category = "temporary",
		name_id = "menu_player_overkill_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "overkill_damage_multiplier",
			value = 2
		}
	}
	self.definitions.saw_ignore_shields_1 = {
		category = "feature",
		name_id = "menu_saw_ignore_shields",
		upgrade = {
			category = "saw",
			upgrade = "ignore_shields",
			value = 1
		}
	}
	self.definitions.saw_panic_when_kill_1 = {
		category = "feature",
		name_id = "menu_saw_panic_when_kill",
		upgrade = {
			category = "saw",
			upgrade = "panic_when_kill",
			value = 1
		}
	}
	self.definitions.shotgun_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_swap_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
end

end