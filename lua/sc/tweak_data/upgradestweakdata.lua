--[[

To whom it may concern, hello! If you're seeing this, there's a good chance you might be here to remove vital files related to
making the skill overhaul in SC's mod function. While I understand that some of you may not like having your builds become
invalid in the mod, you MUST understand that the mod was balanced with these changes in mind! Especially since it's to nerf
overpowered builds and abilities that would otherwise trivialize the buffs I made to the cops, and you have to remember the 
entire point of the mod was to increase the game's difficulty. So I ask you, please, actually try the mod with revamped skilltrees 
before dismissing it. I promise you it's still fun and in fact, you may find that you enjoy this system more.

]]--

function UpgradesTweakData:_init_value_tables()
	self.values = {
		player = {},
		carry = {},
		trip_mine = {},
		ammo_bag = {},
		ecm_jammer = {},
		sentry_gun = {},
		doctor_bag = {},
		cable_tie = {},
		bodybags_bag = {},
		first_aid_kit = {},
		weapon = {},
		pistol = {},
		assault_rifle = {},
		smg = {},
		shotgun = {},
		grenade_launcher = {},
		bow = {},
		crossbow = {},
		saw = {},
		lmg = {},
		snp = {},
		akimbo = {},
		minigun = {},
		melee = {},
		temporary = {},
		cooldown = {},
		team = {}
	}
	self.values.team.player = {}
	self.values.team.weapon = {}
	self.values.team.pistol = {}
	self.values.team.akimbo = {}
	self.values.team.xp = {}
	self.values.team.armor = {}
	self.values.team.stamina = {}
	self.values.team.health = {}
	self.values.team.cash = {}
	self.values.team.damage_dampener = {}
end

local sc_sttd = UpgradesTweakData._init_pd2_values
function UpgradesTweakData:_init_pd2_values()
	sc_sttd(self, tweak_data)
	
	--Upgrade Value changes for skills and such--

	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

		--Explosives hurt--
		self.explosive_bullet.curve_pow = 3
		self.explosive_bullet.player_dmg_mul = 0.5
		self.explosive_bullet.range = 250
		self.explosive_bullet.feedback_range = self.explosive_bullet.range
		self.explosive_bullet.camera_shake_max_mul = 4

		--Restoring movement penalties--
		self.weapon_movement_penalty.minigun = 1
		self.weapon_movement_penalty.lmg = 1

	end

	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--Armor related stuff--
	self.values.player.body_armor.armor = {
		0,
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
		0.7, 
		0.6
	}
	self.values.player.body_armor.dodge = {
		0.2,
		0.1,
		0,
		-0.1,
		-0.15,
		-0.2,
		-0.3
	}
	self.values.player.body_armor.concealment = {
		30,
		25,
		23,
		21,
		15,
		5,
		0
	}
	self.values.player.body_armor.damage_shake = { 
		1, 
		0.95, 
		0.9, 
		0.85, 
		0.75, 
		0.7, 
		0.6 
	}
	self.values.player.body_armor.stamina = {
		1,
		0.95,
		0.9,
		0.85,
		0.75,
		0.7,
		0.6
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
		10,
		9,
		8,
		7,
		5,
		4,
		3
	}
	self.kill_change_regenerate_speed_percentage = true
	self.values.player.body_armor.skill_kill_change_regenerate_speed = {
		1.50,
		1.45,
		1.40,
		1.35,
		1.30,
		1.25,
		1.20
	}

	self.values.rep_upgrades.values = {0}
	
	--Custom stuff for SC's mod, mainly suppression resistance and stuff--
    	self.values.player.suppression_resist = {true}
    	self.values.player.ignore_suppression_flinch = {true}
    	self.values.player.health_revive_max = {true}
		self.values.player.no_deflection = {true}
    	self.values.player.yakuza_berserker = {true}
		self.values.player.electrocution_resistance_multiplier = {1}
		self.values.player.dodge_to_heal = {true}
		self.values.player.melee_to_heal = {true}
		self.values.player.dodge_on_revive = {true}
	--Bot boost stuff stuff--
	self.values.team.crew_add_health = {3}
	self.values.team.crew_add_armor = {1.5}
	self.values.team.crew_add_dodge = {0.03}
	self.values.team.crew_add_concealment = {1}
	self.values.team.crew_add_stamina = {25}
	self.values.team.crew_reduce_speed_penalty = {1}
	self.values.team.crew_health_regen = {0.15}
	self.values.team.crew_throwable_regen = {70}
	self.values.team.crew_faster_reload = {1.1}
	self.values.team.crew_faster_swap = {1}	

	--Crew ability stuff
	self.values.team.crew_inspire = {
		{
			60,
			60,
			60
		}
	}
	self.values.team.crew_scavenge = {
		{
			0.25,
			0.25,
			0.25
		}
	}
	self.values.team.crew_interact = {
		{
			0.85,
			0.85,
			0.85
		}
	}
	self.values.team.crew_ai_ap_ammo = {true}
	
	--Equipment--
	
	--ECMs--
	self.ecm_jammer_base_battery_life = 10
	self.ecm_jammer_base_low_battery_life = 4
	self.ecm_jammer_base_range = 2500
	self.ecm_feedback_min_duration = 20
	self.ecm_feedback_max_duration = 20
	self.ecm_feedback_interval = 1.5	
	self.ecm_feedback_retrigger_interval = 240
	
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
				self.values.temporary.revive_damage_reduction = {{
					0.9,
					5
				}}
				self.values.player.revive_damage_reduction = {0.9}
				
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
				self.values.first_aid_kit.downs_restore_chance = {0}

				--Combat Doctor
				self.doctor_bag_base = 2
				self.values.doctor_bag.quantity = {1}
				self.values.doctor_bag.amount_increase = {1}
				
				--Inspire
				self.values.player.long_dis_revive = {0.5, 0.5}
				self.skill_descs.inspire = {multibasic = "50%", multibasic2 = "20%", multibasic3 = "10", multipro = "50%"}
				self.values.cooldown.long_dis_revive = {
					{1, 60}
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
				self.values.cable_tie.pickup_chance = {true}
				self.values.cable_tie.quantity_1 = {4}
				self.values.cable_tie.quantity_2 = {4}
				self.values.player.stamina_multiplier = {2}
				self.values.team.stamina.multiplier = {1.5}

				--Clowns are Scary
				self.values.player.intimidate_range_mul = {1.5}
				self.values.player.intimidate_aura = {1000}
				self.values.player.convert_enemies_max_minions = {1, 2}

				--Joker
				self.values.player.convert_enemies = {true}
				self.values.player.convert_enemies_health_multiplier = {0.45}
				self.values.player.convert_enemies_damage_multiplier = {1.45, 1.45}
				self.values.player.convert_enemies_interaction_speed_multiplier = {0.35}

				--Stockholm Syndrome
				self.values.player.civ_calming_alerts = {true}
				self.values.player.civ_intimidation_mul = {1.5}
				self.values.player.civilian_reviver = {true}
				self.values.player.civilian_gives_ammo = {true}
				self.values.player.super_syndrome = {0}

				--Partners in Crime--
				self.values.player.passive_convert_enemies_health_multiplier = {
					0.6,
					0.2
				}				
							
				--Hostage Taker
				self.values.player.hostage_health_regen_addend = {0.01, 0.02}
				self.values.team.damage = {
					hostage_absorption = {0.1},
					hostage_absorption_limit = 4
				}
			--}
			
			--[[   ASSAULT SUBTREE   ]]--
			--{
				--Leadership--
				self.values.smg.recoil_index_addend = {1}
				self.values.team.weapon.recoil_index_addend = {1}

				--MG Handling
				self.values.smg.reload_speed_multiplier = {1.25}
				self.values.smg.hip_fire_spread_multiplier = {0.5}
				self.values.assault_rifle.hip_fire_spread_multiplier = {0.5}

				--MG Specialist
				self.values.smg.fire_rate_multiplier = {1.15, 1.15}
				self.values.smg.move_spread_multiplier = {0.5}
				self.values.assault_rifle.move_spread_multiplier = {0.5}
				self.values.smg.damage_multiplier = {1}
				
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
				self.values.shotgun.damage_multiplier = {1, 1}
				self.values.shotgun.extra_rays = {3}
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
					{1.5, 2},
					{1.5, 10}
				}
			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{
				--Stun Resistance
				self.values.player.damage_shake_addend = {1}
				self.values.player.flashbang_multiplier = {0.5, 0.25}
				
				--Die Hard
				self.values.player.armor_regen_timer_multiplier = {0.9}
				self.values.player.primary_weapon_when_downed = {true}

				--Transporter
				self.values.carry.movement_speed_multiplier = {1.5}
				self.values.carry.throw_distance_multiplier = {1.5}
				self.values.carry.movement_penalty_nullifier = {true}
				self.values.player.armor_carry_bonus = {1.005}
				
				--More Blood To Bleed
				self.values.player.health_multiplier = {1.15, 1.4}

				--Bullseye
				self.values.player.headshot_regen_armor_bonus = {0.5, 3.5}
				self.on_headshot_dealt_cooldown = 3

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
				self.values.grenade_launcher.reload_speed_multiplier = {1.25}
				self.values.crossbow.reload_speed_multiplier = {1.25}
				self.values.bow.reload_speed_multiplier = {1.25}
				self.values.saw.damage_multiplier = {1}
								
				--Extra Lead
				self.values.ammo_bag.ammo_increase = {2}
				self.values.ammo_bag.quantity = {1}

				--Saw Massacre
				self.values.saw.enemy_slicer = {true}
				self.values.saw.ignore_shields = {true}
				self.values.saw.panic_when_kill = {
					{
						area = 1000,
						chance = 0.5,
						amount = 200
					}
				}
				self.values.player.explosive_damage_reduction = {true}
				
				--Fully Loaded
				self.values.player.extra_ammo_multiplier = {1.25}
				self.values.player.pick_up_ammo_multiplier = {1.35, 2.1}
				self.values.player.regain_throwable_from_ammo = {
					{chance = 0.05, chance_inc = 1.0}
				}
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
				--Defense up (RIP)
				self.values.sentry_gun.cost_reduction = {2, 3}
				
				--Sentry Targeting Package (RIP)
				self.values.sentry_gun.spread_multiplier = {2}
				self.values.sentry_gun.rot_speed_multiplier = {2}
				self.values.sentry_gun.extra_ammo_multiplier = {2}
				
				--Logistician
				self.values.player.deploy_interact_faster = {0.75, 0.25}
				self.values.player.extra_equipment = {true}
				self.values.team.deploy_interact_faster = {0.25}
				
				--Nerves of Steel
				self.values.player.interacting_damage_multiplier = {0.5}
				self.values.player.steelsight_when_downed = {true}				

				--Engineering
				self.values.sentry_gun.armor_multiplier = {2.5}
				self.values.sentry_gun.shield = {true}	
		
				--Jack of All Trades
				self.values.player.second_deployable = {true}
				self.values.player.second_deployable_full = {true}
	
				--Tower Defence
				self.values.sentry_gun.quantity = {1, 2}
				self.skill_descs.tower_defense = { 
					[1] = 1, 
					[2] = 1, 
					multibasic = "2",
					multipro = "3"
				}
				self.values.sentry_gun.less_noisy = {true}
				self.values.sentry_gun.ap_bullets = {true}
				self.values.sentry_gun.fire_rate_reduction = {4}
				self.values.sentry_gun.damage_multiplier = {1.5}	

				--Bulletproof
				self.values.player.armor_multiplier = {1.2, 1.5}
				self.values.team.armor.regen_time_multiplier = {0.95}
				self.values.player.armor_regen_timer_multiplier_tier = {0.95}				
				
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
				self.values.player.trip_mine_deploy_time_multiplier = {
					0.8,
					0.6
				}				
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
				--Sharpshooter
				self.values.weapon.single_spread_index_addend = {1}
				self.values.assault_rifle.recoil_index_addend = {1}
				self.values.snp.recoil_index_addend = {1}
				self.sharpshooter_categories = {
					"assault_rifle",
					"smg",
					"snp"
				}
				
				--Kilmer
				self.values.assault_rifle.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.5}
				self.values.snp.enter_steelsight_speed_multiplier = {1.5}
				self.values.snp.reload_speed_multiplier = {1.25}
				self.values.assault_rifle.move_spread_multiplier = {0.5}
				self.values.snp.move_spread_multiplier = {0.5}

				--Rifleman
				self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.5}
				self.values.weapon.enter_steelsight_speed_multiplier = {1.25}
				self.values.player.single_shot_accuracy_inc = {0.9}
				
				--Explosive Headshot
				self.values.snp.graze_damage = {
					{
						radius = 300,
						damage_factor = 0.3,
						damage_factor_headshot = 0.3
					},
					{
						radius = 500,
						damage_factor = 0.6,
						damage_factor_headshot = 0.6
					}
				}				

				--Ammo Efficiency
				self.values.player.head_shot_ammo_return = {
					{ ammo = 1, time = 6, headshots = 3 },
					{ ammo = 1, time = 6, headshots = 2 }
				}

				--Aggressive Reload
				self.values.temporary.single_shot_fast_reload = {
					{
						1.25,
						6
					},
					{
						1.5,
						12
					},
				}
					
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{
				--Chameleon (RIP)
				self.values.player.suspicion_multiplier = {0.75}
				self.values.player.sec_camera_highlight_mask_off = {true}
				self.values.player.special_enemy_highlight_mask_off = {true}
				self.values.player.mask_off_pickup = {true}
				self.values.player.small_loot_multiplier = {1.3, 1.3}
				
				--Cleaner
				self.values.player.corpse_dispose_amount = {2, 3}
				self.values.player.extra_corpse_dispose_amount = {1}
				self.values.bodybags_bag.quantity = {1}
				self.values.player.cleaner_cost_multiplier = {0}
				self.values.weapon.special_damage_taken_multiplier = {1.1}
				
				--Nimble
				self.values.player.pick_lock_easy_speed_multiplier = {0.5, 0.25}
				self.values.player.pick_lock_hard = {true}

				--Sixth Sense
				self.values.player.standstill_omniscience = {true}
				self.values.player.additional_assets = {true}
				self.values.player.buy_bodybags_asset = {true}
				self.values.player.buy_spotter_asset = {true}
				
				--Systems Specialist
				self.values.player.tape_loop_duration = {25, 50}
				self.values.player.hack_fix_interaction_speed_multiplier = {0.75, 0.25}
				self.values.player.marked_inc_dmg_distance = {{2000, 1.3}}
				self.values.player.mark_enemy_time_multiplier = {2}
				
				--ECM Specialist
				self.values.ecm_jammer.quantity = {1, 2}
				self.values.ecm_jammer.duration_multiplier_2 = {1.25}
				self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
				self.values.player.melee_kill_snatch_pager_chance = {0}
				
				--ECM Overdrive
				self.values.ecm_jammer.feedback_duration_boost = {1.25}
				self.values.ecm_jammer.duration_multiplier = {1.25}
				self.values.ecm_jammer.can_open_sec_doors = {true}		
				self.values.ecm_jammer.affects_pagers = {true}
			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{
				--Duck and Cover
				self.values.player.run_dodge_chance = {0.10}
				self.values.player.zipline_dodge_chance = {0.3}
				self.values.player.run_speed_multiplier = {1.25}
				self.values.player.crouch_dodge_chance = {0.05, 0.10}

				--Evasion
				self.values.player.movement_speed_multiplier = {1.05, 1.1}
				self.values.player.climb_speed_multiplier = {1.2, 1.75}
				self.values.player.can_free_run = {true}
				self.values.player.fall_damage_multiplier = {0.25}
				self.values.player.fall_health_damage_multiplier = {0}

				--Deep Pockets
				self.values.player.melee_concealment_modifier = {2}
				self.values.player.ballistic_vest_concealment = {4}
				self.values.player.level_1_armor_addend = {2}
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
						0.15
					},
					{
						0.01,
						1,
						"below",
						35,
						0.15
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
				
				--Spotter
				self.values.weapon.silencer_damage_multiplier = {1, 1}
				self.values.player.marked_enemy_extra_damage = {true}
				self.values.player.marked_enemy_damage_mul = 1.15				

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
				self.values.pistol.fire_rate_multiplier = {1.15}

				--Over Pressurized/Gunfighter (Formerly Akimbo)
				self.values.pistol.reload_speed_multiplier = {1.25, 1.5}
				self.values.pistol.damage_multiplier = {1}
				
				--Akimbo (Formerly Over Pressurized/Custom Ammo)
				self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5}
				self.values.akimbo.recoil_multiplier = {
					1.4,
					1.3,
					1.2
				}
				self.values.akimbo.recoil_index_addend = {
					-10,
					-8,
					-5,
					-3,
					-1
				}
				self.values.akimbo.spread_index_addend = {
					-4,
					-3,
					-2,
					-1,
					0
				}				

				--Desperado
				self.values.pistol.stacked_accuracy_bonus = {
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 10},
					{accuracy_bonus = 1.1, max_stacks = 4, max_time = 20}
				}
				
				--Trigger Happy
				self.values.pistol.stacking_hit_damage_multiplier = {
					{
						damage_bonus = 1.15,
						max_stacks = 4,
						max_time = 10
					},
					{	
						damage_bonus = 1.15,
						max_stacks = 4,
						max_time = 20
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
				self.values.player.revived_health_regain = {1.4, 2.2}
				
				--Swan Song
				self.values.temporary.berserker_damage_multiplier = { {1, 3}, {1, 9} }

				--Undying
				self.values.player.cheat_death_chance = {0.2, 0.45}
				
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
				self.values.player.melee_damage_stacking = {{melee_multiplier = 0.25, max_multiplier = 2}}
				self.values.temporary.melee_kill_increase_reload_speed = {{1.25, 10}}

				--Pumping Iron	
				self.values.player.non_special_melee_multiplier = {1.05, 1.1, 1.15, 1.2}
				self.values.player.melee_damage_multiplier = {1.05, 1.1, 1.15, 1.2}
				self.values.player.melee_swing_multiplier = {1.25, 1.5}
				self.values.player.melee_swing_multiplier_delay = {0.75, 0.5}
				
				--Counter Strike
				self.values.player.counter_strike_melee = {true}
				self.values.player.counter_strike_spooc = {true}

				--Frenzy (Berserker)
				self.values.player.max_health_reduction = {0.25}
				self.values.player.healing_reduction = {0.25, 0.50}
               			self.values.player.health_damage_reduction = {0.85, 0.7}
                		self.values.player.real_health_damage_reduction = {0.7, 0.4}
				
				--Berserker (Frenzy)
				self.player_damage_health_ratio_threshold = 0.5
				self.player_damage_health_ratio_threshold_2 = 0.5
				self.values.player.damage_health_ratio_multiplier = {0.75}
				self.values.player.melee_damage_health_ratio_multiplier = {1.50}
			--}
		--}

		if Global.game_settings and Global.game_settings.single_player then
		self.values.cable_tie.quantity_1 = {16}
	end

	--Perk Deck shit--
	
	--Shared stuff--
	self.values.weapon.passive_damage_multiplier = {1.05, 1.1, 1.15, 1.2}     
	
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
		0.65,
		0.6
	}

	self.values.player.level_2_dodge_addend = {
		0.05,
		0.1,
		0.15
	}
	self.values.player.level_3_dodge_addend = {
		0.05,
		0.1,
		0.15
	}
	self.values.player.level_4_dodge_addend = {
		0.05,
		0.1,
		0.15
	}

	self.values.player.level_2_armor_multiplier = {
		1.15,
		1.3,
		1.5
	}
	self.values.player.level_3_armor_multiplier = {
		1.15,
		1.3,
		1.5
	}
	self.values.player.level_4_armor_multiplier = {
		1.15,
		1.3,
		1.5
	}

	self.values.player.tier_armor_multiplier = {
		1.1,
		1.1,
		1.2,
		1.2,
		1.25,
		1.25
	}
	--infiltrator stuff
	self.values.temporary.melee_life_leech = {
		{0.08, 08}
	}
	
	self.melee_to_hot_data = {
		armors_allowed = {"level_1", "level_2", "level_3", "level_4", "level_5", "level_6", "level_7"},
		works_with_armor_kit = true,
		tick_time = 1.25,
		total_ticks = 8,
		max_stacks = 5,
		stacking_cooldown = 0.1,
		add_stack_sources = {
			bullet = false,
			explosion = false,
			melee = true,
			taser_tased = false,
			poison = false,
			fire = false,
			projectile = false,
			swat_van = false,
			sentry_gun = false,
			civilian = false
		}
	}

	self.values.player.heal_over_time = {
		0.1
	}	

	self.values.team.armor.multiplier = {1.05}
	self.values.team.health.passive_multiplier = {1.05}
	self.hostage_max_num = {
		health_regen = 1,
		health = 4,
		stamina = 4,
		damage_dampener = 1
	}
	self.values.team.health.hostage_multiplier = {1.025}
	self.values.team.stamina.hostage_multiplier = {1.10}
	self.values.player.passive_dodge_chance = {
		0.05,
		0.1,
		0.15,
		0.2
   	}
	self.values.player.passive_health_regen = {0.025}
	self.values.player.passive_health_multiplier = {
		1.05,
		1.1,
		1.15,
		1.2,
		1.25,
		1.3,
		1.35,
		1.4,
		1.45,
		1.5
	}
	self.values.temporary.dmg_dampener_close_contact = {
		{0.95, 7},
		{0.9, 7},
		{0.8, 7}
	}
	self.max_melee_weapon_dmg_mul_stacks = 5
	self.values.melee.stacking_hit_expire_t = {10}
	self.values.melee.stacking_hit_damage_multiplier = {
		0.08,
		0.16
	}
	self.values.dmg_dampener_outnumbered_strong = {
		{0.95, 7}
	}
	self.values.player.tier_dodge_chance = {
		0.05,
		0.05,
		0.05
	}
	
	--Hey you're getting your grinder on my grinder
	self.values.player.level_5_armor_addend = {-7}
	self.damage_to_hot_data = {
		armors_allowed = {"level_5"},
		works_with_armor_kit = true,
		tick_time = 0.5,
		total_ticks = 10,
		max_stacks = false,
		stacking_cooldown = 1.5,
		add_stack_sources = {
			bullet = true,
			explosion = true,
			melee = true,
			taser_tased = true,
			poison = true,
			fire = true,
			projectile = true,
			swat_van = true,
			sentry_gun = false,
			civilian = false
		}
	}
	self.values.player.damage_to_hot = {
		0.1,
		0.2,
		0.3,
		0.4
	}	
	self.values.player.damage_to_hot_extra_ticks = {2}
	
	self.values.player.perk_armor_loss_multiplier = {
		0.5,
		0.9,
		0.85,
		0.8
	}

	--Rogue
	self.dodge_to_hot_data = {
		armors_allowed = {"level_1", "level_2", "level_3", "level_4", "level_5", "level_6", "level_7"},
		works_with_armor_kit = true,
		tick_time = 2.0,
		total_ticks = 10.0,
		max_stacks = 67,
		stacking_cooldown = 0.0,
		add_stack_sources = {
			bullet = false,
			explosion = false,
			melee = false,
			taser_tased = false,
			poison = false,
			fire = false,
			projectile = false,
			swat_van = false,
			sentry_gun = false,
			civilian = false
		}
	}

	--Gambler
 	self.loose_ammo_restore_health_values = {
		base = 2,
 		cd = 5,
 		multiplier = 0.2,
		{0, 2},
		{2, 4},
		{4, 6}
 	}
	self.loose_ammo_give_team_health_ratio = 0.5
	self.loose_ammo_give_team_ratio = 0.5
	self.values.temporary.loose_ammo_restore_health = {}	
	
	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		local base = self.loose_ammo_restore_health_values.base

		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				base + data[1],
				base + data[2]
			},
			self.loose_ammo_restore_health_values.cd
		})
	end

	self.values.temporary.loose_ammo_give_team = {{
		true,
		5
	}}
	self.values.player.loose_ammo_restore_health_give_team = {true}	

	--Sociopath more like SocioBAD
	self.values.player.killshot_regen_armor_bonus = {2.5}
	self.values.player.killshot_close_regen_armor_bonus = {2.5}
	self.values.player.killshot_close_panic_chance = {0.25}
	self.values.player.melee_kill_life_leech = {0.02}
	self.on_killshot_cooldown = 3

	--Anarchist stuff--
	self.values.player.armor_grinding = {
		{
			{3.0, 3.0},
			{3.5, 3.5},
			{4.0, 4.0},
			{4.5, 4.5},
			{5.0, 5.0},
			{5.5, 5.5},
			{6.0, 6.0}
		}
	}
	
	self.values.player.health_decrease = {0.5}
	
	self.values.player.armor_increase = {
		0.45,
		0.6,
		0.75
	}

	self.values.player.damage_to_armor = {
		{
			{1.5, 3},
			{1.8, 3},
			{2.1, 3},
			{2.4, 3},
			{2.6, 3},
			{2.8, 3},
			{3.0, 3}
		}
	}
	
	--Ex President
	self.values.player.armor_health_store_amount = {
		0.4,
		0.8,
		1.2
	}	
	self.values.player.armor_max_health_store_multiplier = {
		1.25
	}	

	--I AM A BAD MOTHERFUCKA--
	--maniac
	self.cocaine_stacks_convert_levels = {
		30,
		25
	}	
	self.cocaine_stacks_dmg_absorption_value = 0.125
	self.cocaine_stacks_tick_t = 0
	self.max_cocaine_stacks_per_tick = 300
	self.max_total_cocaine_stacks = 300
	self.cocaine_stacks_decay_t = 10
	self.cocaine_stacks_decay_amount_per_tick = 10
	self.cocaine_stacks_decay_percentage_per_tick = 0.05
	self.values.player.cocaine_stacking = {0.05}
	self.values.player.sync_cocaine_stacks = {true}
	self.values.player.cocaine_stacks_decay_multiplier = {0.5}
	self.values.player.sync_cocaine_upgrade_level = {2}
	self.values.player.cocaine_stack_absorption_multiplier = {1.25}
	
	--Chico--
	--kingpin
	self.values.temporary.chico_injector = {
		{0.5, 4},
		{0.5, 5},
		{0.5, 6}
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
	--sicario
	self.smoke_screen_armor_regen = {2.0} --Multiplier for armor regen speed.
	self.values.player.sicario_multiplier = {0.35} --Multiplier for dodge gained per second while inside grenade.
	
	--alcoholism is no joke
	--stoic
	self.values.player.armor_to_health_conversion = {
		40
	}
	self.values.player.damage_control_passive = {{
		30,
		6.25
	}}
	self.values.player.damage_control_auto_shrug = {
		5
	}
	self.values.player.damage_control_healing = {
		300
	}

	self.values.player.damage_control_cooldown_drain = {
		{ 0, 1},
		{50, 6}
	}
	
	--Yakuza--
	self.values.player.survive_one_hit = {true}
	self.values.survive_one_hit_armor = {5.0}

	self.values.player.resistance_damage_health_ratio_multiplier = {
		0.2
	}

	self.values.player.dodge_regen_damage_health_ratio_multiplier = {
		0.10
	}

	self.values.player.melee_kill_dodge_regen = {
		0.5
	}

	self.values.player.kill_dodge_regen = {
		0.5
	}
	
	--Fat benis :DDDDD
	--biker?
	self.wild_trigger_time = 10
	self.wild_max_triggers_per_time = 5	
	self.values.player.wild_health_amount = {0.1}
	self.values.player.wild_armor_amount = {0.1}
	self.values.player.less_health_wild_armor = {{
		0.1,
		0.1
	}}
	self.values.player.less_health_wild_cooldown = {{
		0.1,
		0.1
	}}
	self.values.player.less_armor_wild_health = {{
		0.1,
		0.1
	}}
	self.values.player.less_armor_wild_cooldown = {{
		0.1,
		0.1
	}}	
	
	--Tag Team--
	self.values.player.tag_team_base = {
		{
			kill_health_gain = 1.5,
			radius = 0.6,
			distance = 18,
			kill_extension = 2,
			duration = 12,
			tagged_health_gain_ratio = 0.5
		}
	}	
	self.values.player.tag_team_cooldown_drain = {
		{
			tagged = 0,
			owner = 0
		},	
		{
			tagged = 0,
			owner = 2
		},
		{
			tagged = 2,
			owner = 2
		}
	}
	self.values.player.tag_team_damage_absorption = {
		{
			kill_gain = 0.05,
			max = 2
		},
		{
			kill_gain = 0.1,
			max = 2
		}		
	}	
	
	--Hacker
	self.values.player.pocket_ecm_jammer_base = {
		{
			cooldown_drain = 4,
			duration = 12
		}
	}	
	self.values.player.pocket_ecm_heal_on_kill = {
		2
	}	
	self.values.team.pocket_ecm_heal_on_kill = {
		1
	}	
	
end

local sc_utd_init = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	sc_utd_init(self, tweak_data)
	
	self.definitions.jeb = {
		dlc = "rest",
		factory_id = "wpn_fps_pis_jeb",
		weapon_id = "jeb",
		category = "weapon"
	}	
	table.insert(self.level_tree[50].upgrades, "jeb")
end	

--Added new definitions--

local sc_definitions = UpgradesTweakData._player_definitions
function UpgradesTweakData:_player_definitions()
	sc_definitions (self, tweak_data)

	--New Definitions, calling em here to play it safe--
	self.definitions.player_revived_health_regain_1 = {
		name_id = "menu_revived_health_regain",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "revived_health_regain",
			category = "player"
		}
	}
	self.definitions.player_revived_health_regain_2 = {
		name_id = "menu_revived_health_regain",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "revived_health_regain",
			category = "player"
		}
	}		
	self.definitions.player_damage_control_auto_shrug_1 = {
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_control_auto_shrug",
			category = "player"
		}
	}
	self.definitions.player_damage_control_auto_shrug_2 = {
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "damage_control_auto_shrug",
			category = "player"
		}
	}	
	self.definitions.akimbo_spread_index_addend_1 = {
		name_id = "menu_pistol_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "spread_index_addend",
			category = "akimbo"
		}
	}	
	self.definitions.akimbo_spread_index_addend_2 = {
		name_id = "menu_pistol_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "spread_index_addend",
			category = "akimbo"
		}
	}	
	self.definitions.akimbo_spread_index_addend_3 = {
		name_id = "menu_pistol_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "spread_index_addend",
			category = "akimbo"
		}
	}
	self.definitions.akimbo_spread_index_addend_4 = {
		name_id = "menu_pistol_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 4,
			upgrade = "spread_index_addend",
			category = "akimbo"
		}
	}
	self.definitions.akimbo_spread_index_addend_5 = {
		name_id = "menu_pistol_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 5,
			upgrade = "spread_index_addend",
			category = "akimbo"
		}
	}		
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
	self.definitions.player_non_special_melee_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 3
		}
	}
	self.definitions.player_non_special_melee_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 4
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
	self.definitions.player_melee_damage_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 3
		}
	}
	self.definitions.player_melee_damage_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 4
		}
	}	
	self.definitions.player_melee_swing_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_swing_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_swing_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_swing_multiplier",
			value = 2
		}
	}	
	self.definitions.player_melee_swing_multiplier_delay_1 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_swing_multiplier_delay",
			value = 1
		}
	}
	self.definitions.player_melee_swing_multiplier_delay_2 = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_swing_multiplier_delay",
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
	self.definitions.player_electrocution_resistance_1 = {
		name_id = "menu_player_electrocution_resistance",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "electrocution_resistance_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_level_1_armor_addend = {
		name_id = "menu_player_level_1_armor_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "level_1_armor_addend",
			category = "player"
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
	self.definitions.player_no_deflection = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "no_deflection",
			value = 1
		}
	}	
	self.definitions.player_dodge_to_heal = {
		category = "feature",
		name_id = "menu_player_dodge_to_heal",
		upgrade = {
			category = "player",
			upgrade = "dodge_to_heal",
			value = 1
		}
	}
	self.definitions.player_melee_to_heal = {
		category = "feature",
		name_id = "menu_player_melee_to_heal",
		upgrade = {
			category = "player",
			upgrade = "melee_to_heal",
			value = 1
		}
	}
	self.definitions.player_dodge_on_revive = {
		category = "feature",
		name_id = "menu_player_dodge_on_revive",
		upgrade = {
			category = "player",
			upgrade = "dodge_on_revive",
			value = 1
		}
	}
	self.definitions.player_tag_team_cooldown_drain_1 = {
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "tag_team_cooldown_drain",
			category = "player"
		}
	}
	self.definitions.player_tag_team_cooldown_drain_2 = {
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "tag_team_cooldown_drain",
			category = "player"
		}
	}
	self.definitions.player_tag_team_cooldown_drain_3 = {
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "tag_team_cooldown_drain",
			category = "player"
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
	self.definitions.player_passive_health_multiplier_6 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 6
		}
	}	
	self.definitions.player_passive_health_multiplier_7 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 7
		}
	}		
	self.definitions.player_passive_health_multiplier_8 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 8
		}
	}	
	self.definitions.player_passive_health_multiplier_9 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 9
		}
	}
	self.definitions.player_passive_health_multiplier_10 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 10
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
	self.definitions.player_explosive_damage_reduction = {
		category = "feature",
		name_id = "menu_player_real_health_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "explosive_damage_reduction",
			value = 1
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
	self.definitions.player_movement_speed_multiplier_1 = {
		name_id = "menu_player_movement_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "movement_speed_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_movement_speed_multiplier_2 = {
		name_id = "menu_player_movement_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "movement_speed_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_trip_mine_deploy_time_multiplier_1 = {
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		}
	}
	self.definitions.player_trip_mine_deploy_time_multiplier_2 = {
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		}
	}	
	self.definitions.pistol_reload_speed_multiplier_1 = {
		name_id = "menu_pistol_reload_speed",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "reload_speed_multiplier",
			category = "pistol"
		}
	}
	self.definitions.pistol_reload_speed_multiplier_2 = {
		name_id = "menu_pistol_reload_speed",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "reload_speed_multiplier",
			category = "pistol"
		}
	}	
	self.definitions.shotgun_extra_rays = {
		name_id = "menu_shotgun_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "extra_rays",
			category = "shotgun"
		}
	}	
	self.definitions.cable_tie_pickup_chance = {
		name_id = "menu_shotgun_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "pickup_chance",
			category = "cable_tie"
		}
	}		
	self.definitions.player_hack_fix_interaction_speed_multiplier_1 = {
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		}
	}
	self.definitions.player_hack_fix_interaction_speed_multiplier_2 = {
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		}
	}		
	self.definitions.player_pick_lock_easy_speed_multiplier_1 = {
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "pick_lock_easy_speed_multiplier",
			category = "player"
		}
	}
	self.definitions.player_pick_lock_easy_speed_multiplier_2 = {
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "pick_lock_easy_speed_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_second_deployable_full = {
		name_id = "menu_second_deployable",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "second_deployable_full",
			category = "player"
		}
	}	
	self.definitions.temporary_single_shot_fast_reload_2 = {
		name_id = "menu_temporary_single_shot_fast_reload",
		category = "temporary",
		upgrade = {
			value = 2,
			upgrade = "single_shot_fast_reload",
			category = "temporary"
		}
	}
	self.definitions.grenade_launcher_reload_speed_multiplier = {
		name_id = "menu_assault_rifle_reload_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "reload_speed_multiplier",
			category = "grenade_launcher"
		}
	}
	self.definitions.crossbow_reload_speed_multiplier = {
		name_id = "menu_assault_rifle_reload_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "reload_speed_multiplier",
			category = "crossbow"
		}
	}	
	self.definitions.bow_reload_speed_multiplier = {
		name_id = "menu_assault_rifle_reload_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "reload_speed_multiplier",
			category = "bow"
		}
	}		
	self.definitions.deploy_interact_faster_2 = {
		name_id = "menu_deploy_interact_faster",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "deploy_interact_faster",
			category = "player"
		}
	}
	self.definitions.player_extra_equipment = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "extra_equipment",
			value = 1
		}
	}
	self.definitions.player_tag_team_damage_absorption_1 = {
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "tag_team_damage_absorption",
			category = "player"
		}
	}	
	self.definitions.player_tag_team_damage_absorption_2 = {
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "tag_team_damage_absorption",
			category = "player"
		}
	}		
	
	self.definitions.temporary_chico_injector_1 = {
		name_id = "menu_temporary_chico_injector_1",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "chico_injector",
			synced = true,
			category = "temporary"
		}
	}
	self.definitions.temporary_chico_injector_2 = {
		name_id = "menu_temporary_chico_injector_1",
		category = "temporary",
		upgrade = {
			value = 2,
			upgrade = "chico_injector",
			synced = true,
			category = "temporary"
		}
	}
	self.definitions.temporary_chico_injector_3 = {
		name_id = "menu_temporary_chico_injector_1",
		category = "temporary",
		upgrade = {
			value = 3,
			upgrade = "chico_injector",
			synced = true,
			category = "temporary"
		}
	}		
	
	--Passive Perk Deck Dam increases
	self.definitions.weapon_passive_damage_multiplier_1 = {
		name_id = "menu_weapon_passive_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "passive_damage_multiplier",
			category = "weapon"
		}
	}	
	self.definitions.weapon_passive_damage_multiplier_2 = {
		name_id = "menu_weapon_passive_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "passive_damage_multiplier",
			category = "weapon"
		}
	}
	self.definitions.weapon_passive_damage_multiplier_3 = {
		name_id = "menu_weapon_passive_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "passive_damage_multiplier",
			category = "weapon"
		}
	}	
	self.definitions.weapon_passive_damage_multiplier_4 = {
		name_id = "menu_weapon_passive_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 4,
			upgrade = "passive_damage_multiplier",
			category = "weapon"
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
	self.definitions.smg_fire_rate_multiplier_1 = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.smg_fire_rate_multiplier_2 = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "fire_rate_multiplier",
			value = 2
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
	self.definitions.smg_move_spread_multiplier = {
		name_id = "menu_snp_move_spread_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "move_spread_multiplier",
			category = "smg"
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
	self.definitions.player_heal_over_time = {
		name_id = "menu_player_heal_over_time",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "heal_over_time",
			category = "player"
		}
	}
	self.definitions.player_survive_one_hit = {
		name_id = "menu_player_survive_one_hit",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "survive_one_hit",
			category = "player"
		}
	}
	self.definitions.player_dodge_regen_damage_health_ratio_multiplier = {
		name_id = "menu_player_dodge_regen_damage_health_ratio_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "dodge_regen_damage_health_ratio_multiplier",
			category = "player"
		}
	}
	self.definitions.player_resistance_damage_health_ratio_multiplier = {
		name_id = "menu_player_resistance_damage_health_ratio_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "resistance_damage_health_ratio_multiplier",
			category = "player"
		}
	}
	self.definitions.player_melee_kill_dodge_regen = {
		name_id = "menu_player_melee_kill_dodge_regen",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "melee_kill_dodge_regen",
			category = "player"
		}
	}
	self.definitions.player_kill_dodge_regen = {
		name_id = "menu_player_kill_dodge_regen",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "kill_dodge_regen",
			category = "player"
		}
	}
end

end