--[[

To whom it may concern, hello! If you're seeing this, there's a good chance you might be here to remove vital files related to
making the skill overhaul in SC's mod function. While I understand that some of you may not like having your builds become
invalid in the mod, you MUST understand that the mod was balanced with these changes in mind! Especially since it's to nerf
overpowered builds and abilities that would otherwise trivialize the buffs I made to the cops, and you have to remember the 
entire point of the mod was to increase the game's difficulty. So I ask you, please, actually try the mod with revamped skilltrees 
before dismissing it. I promise you it's still fun and in fact, you may find that you enjoy this system more.

]]--

local job = Global.level_data and Global.level_data.level_id
local per_pellet = true --restoration and restoration.Options:GetValue("OTHER/WeaponHandling/PerPelletShotguns") 

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

Hooks:PostHook(UpgradesTweakData, "init", "ResLevelTableInit", function(self, tweak_data)
	local level = {
		l2 = {
				name_id = "weapons",
				upgrades = {
					"colt_1911",
					"mac10",
					"hajk",
					"spoon",
					"x_mac10",
					"x_packrat"
				}
			},	
		l10 = {
				name_id = "lvl_10",
				upgrades = {
					"cutters",
					"shawn"
				}
			},	
		l12 = {
				name_id = "body_armor3",
				upgrades = {
					"body_armor3",
					"cobray",
					"boxcutter",
					"groza",
					"groza_underbarrel",
					"m590"
				}
			},
		l13 = {
				name_id = "weapons",
				upgrades = {
					"new_mp5",
					"serbu",
					"microphone",
					"selfie",
					"sko12"
				}
			},
		l14 = {
				name_id = "weapons",
				upgrades = {
					"bayonet",
					"m1928",
					"sparrow",
					"x_sparrow",
					"gator",
					"pl14",
					"x_pl14"
				}
			},
		l15 = {
				name_id = "weapons",
				upgrades = {
					"msr",
					"benelli",
					"plainsrider",
					"sub2000",
					"road",
					"legacy",
					"fmg9"
				}
			},
		l18 = {
				name_id = "weapons",
				upgrades = {
					"baseballbat",
					"scorpion",
					"x_scorpion",
					"oldbaton",
					"hockey",
					"meter",
					"hauteur",
					"shock",
					"fear",
				}
			},
		l19 = {
				name_id = "weapons",
				upgrades = {
					"olympic",
					"x_olympic",
					"mp9",
					"baka",
					"x_baka",
					"pugio",
					"ballistic",
					"maxim9",
					"scout",
					"korth"
				}
			},
		l20 = {
				name_id = "lvl_20",
				upgrades = {
					"schakal",
					"agave",
					"happy",
					"shepheard",
					"slap"
				}
			},
		l23 = {
				name_id = "weapons",
				upgrades = {
					"bullseye",
					"c96",
					"par",
					"m37",
					"rota",
					"cs",
					"brick",
					"ostry",
					"r700"
				}
			},
		l24 = {
				name_id = "weapons",
				upgrades = {
					"model24",
					"l85a2",
					"scalper",
					"switchblade",
					"x_m1911",
					"x_maxim9",
					"type54",
					"x_type54",
					"x_sko12"
				}
			},
		l25 = {
				name_id = "weapons",
				upgrades = {
					"boxing_gloves",
					"meat_cleaver",
					"wpn_prj_four",
					"sr2",
					"grip",
					"push",
					"breech",
					"ching",
					"erma",
					"sap"
				}
			},
		l27 = {
				name_id = "weapons",
				upgrades = {
					"famas",
					"g26",
					"twins",
					"pitchfork",
					"shrew",
					"x_shrew",
					"basset"
				}
			},
		l28 = {
				name_id = "weapons",
				upgrades = {
					"hs2000",
					"vhs",
					"bowie",
					"micstand",
					"qbu88",
					"contender"
				}
			},
		l30 = {
				name_id = "lvl_30",
				upgrades = {
					"shuno",
					"holt",
					"x_holt",
					"x_korth"
				}
			},
		l32 = {
				name_id = "weapons",
				upgrades = {
					"x46",
					"tec9",
					"tiger",
					"model70"
				}
			},
		l36 = {
				name_id = "weapons",
				upgrades = {
					"p90",
					"x_p90",
					"deagle",
					"winchester1874"
				}
			},
		l38 = {
				name_id = "weapons",
				upgrades = {
					"m134",
					"rpg7",
					"arblast",
					"scoutknife",
					"komodo",
					"hk51b",
					"bessy"
				}
			},			
		l39 = {
				name_id = "weapons",
				upgrades = {
					"m16",
					"huntsman",
					"polymer",
					"china"
				}
			},
		l40 = {
				name_id = "lvl_40",
				upgrades = {
					"shak12"
				}
			},
		l42 = {
				name_id = "weapons",
				upgrades = {
					"fal",
					"tomahawk",
					"coal"
				}
			},
		l47 = {
				name_id = "weapons",
				upgrades = {
					"freedom",
					"whiskey",
					"arbiter",
					"ms3gl",
					"system",
					"money"
				}
			},			
		l48 = {
				name_id = "weapons",
				upgrades = {
					"dingdong",
					"tenderizer",
					"hailstorm",
					"hcar",
					"piggy_hammer"
				}
			},
		l50 = {
				name_id = "lvl_50",
				upgrades = {
					"tkb"
				}
			},
		l51 = {
				name_id = "weapons",
				upgrades = {
					"machete",
					"sterling"
				}
			},
		l55 = {
				name_id = "weapons",
				upgrades = {
					"uzi",
					"x_uzi"
				}
			},
		l60 = {
				name_id = "lvl_60",
				upgrades = {}
			},
		l70 = {
				name_id = "lvl_70",
				upgrades = {}
			},
		l80 = {
				name_id = "lvl_80",
				upgrades = {}
			},
		l90 = {
				name_id = "lvl_90",
				upgrades = {}
			},
		l100 = {
				name_id = "lvl_100",
				upgrades = {}
			}			
	}

	self.values.striker.reload_speed_multiplier = {1} -- no :^)
	--Insert level variables into level_tree.
	for i=1, 100 do
		local currLevel = level["l" .. tostring(i)]
		if currLevel then
			self.level_tree[i] = currLevel
		end
	end 	
	
	self:_bessy_definitions()
	self:_money_weapon_definitions()
end)

--Money thrower definitions
function UpgradesTweakData:_money_weapon_definitions()
	self.definitions.money = {
		dlc = "pda8_wpn_money",
		factory_id = "wpn_fps_fla_money",
		weapon_id = "money",
		category = "weapon"
	}
end

--Musket Definitions
function UpgradesTweakData:_bessy_definitions()
	self.definitions.bessy = {
		dlc = "pda10",
		factory_id = "wpn_fps_spec_bessy",
		weapon_id = "bessy",
		category = "weapon"
	}
end

Hooks:PostHook(UpgradesTweakData, "_melee_weapon_definitions", "ResMeleeDef", function(self)
	--[[
		self.definitions.halloween_sword = {
			dlc = "rest",
			category = "melee_weapon"
		}
	]]--
	self.definitions.piggy_hammer = {
		dlc = "pda10",
		category = "melee_weapon"
	}
end)

--Upgrade Value changes for skills and such--
Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "ResSkillsInit", function(self)
	--Explosives hurt--
	self.explosive_bullet.curve_pow = 0.0005
	self.explosive_bullet.player_dmg_mul = 0.5
	self.explosive_bullet.range = 150
	self.explosive_bullet.feedback_range = self.explosive_bullet.range
	self.explosive_bullet.camera_shake_max_mul = 4

	--Weapon Based Movement Modifiers--
	--This is overridden/ignored if a weapon in any of these categories is given its own movement penalty
	self.weapon_movement_penalty.minigun = 0.6
	self.weapon_movement_penalty.lmg = 0.8

	self.values.player.detection_risk_stamina_regen = {
		{
			0.25,
			3,
			"above",
			50,
			2
		}
	}
	
	--Armor Stats--
	--Add 20 to the values in this table to get in game amounts.
	--Things marked with * don't follow the x, x, x, x, x*y, x, x*y (y = 2, usually) increment logic
	self.values.player.body_armor.armor = { --increments of 2
		2, --Suit
		4, --LBV
		6, --BV
		8, --HBV
		11, --Flak (2 increments + 1)
		13, --CTV
		18 --ICTV (2 increments + 1)
	}
	
	self.values.player.body_armor.movement = { --*increments of 0.04
		1,
		0.96,
		0.92,
		0.88,
		0.72, --4 increments
		0.7, --0.5 increments
		0.6 --2.5 increments
	}
	self.values.player.body_armor.dodge = { --*increments of 0.1
		0.2,
		0.1,
		0.0,
		-0.1,
		-0.15, --half increment
		-0.2, --half increment
		-0.3
	}
	self.values.player.body_armor.dodge_grace = { --UNUSED, increments of 0.075
		1, --.50,
		1, --.425,
		1, --.35,
		1, --.275,
		1, --.125,
		1, --.05,
		1  --.0
	}
	self.values.player.body_armor.concealment = { --*increments of 2
		30,
		26, --2 increments
		24,
		22,
		16,	--3 increments
		8, --4 increments
		4 --2 increments
	}
	self.values.player.body_armor.damage_shake = { --increments of 0.1
		1.0,
		0.9,
		0.8,
		0.7,
		0.5,
		0.4,
		0.2
	}
	self.values.player.body_armor.stamina = { --increments of 0.05
		1,
		0.95,
		0.9,
		0.85,
		0.75,
		0.7,
		0.6
	}
	self.values.player.body_armor.skill_ammo_mul = { --UNUSED, increments of 0.02
		1,
		1.02,
		1.04,
		1.06,
		1.1,
		1.12,
		1.16
	}
	self.max_deflection = 0.60
	self.values.player.body_armor.deflection = { --*increments of 0.05
		0.00,
		0.05,
		0.10,
		0.15,
		0.20, --1 increment instead of 2
		0.15, --subtract 1 increment instead of adding 1
		0.10 --subtract 1 increment instead of adding 2
	}
	self.values.player.body_armor.regen_delay = { --increments of 0.25
		2.25,
		2.50,
		2.75,
		3.00,
		3.75, --3 increments instead of 2
		4.00,
		4.75 --3 increments instead of 2
	}

	self.values.rep_upgrades.values = {0}
	
	--Custom stuff for SC's mod, mainly suppression resistance and stuff--
	
	--Bot boost stuff stuff--
	self.values.team.crew_add_health = {3}
	self.values.team.crew_add_armor = {1.1} --Now adds % armor, rather than flat armor.
	self.values.team.crew_add_dodge = {0.03} --Now adds % of dodge stat every second to meter.
	self.values.team.crew_add_concealment = {2}
	self.values.team.crew_add_stamina = {15}
	self.values.team.crew_reduce_speed_penalty = {1}
	self.values.team.crew_health_regen = {0.1}
	self.values.team.crew_throwable_regen = {70}
	self.values.team.crew_faster_reload = {1.1}

	--Crew ability stuff
	--Table index corresponds to number of bots.
	self.values.team.crew_inspire = {
		{
			90,
			75,
			60
		}
	}
	--Team AI ammo pickup increase
	self.values.team.crew_scavenge = {
		{
			1.3,
			1.2,
			1.1
		}
	}
	self.values.team.crew_interact = {
		{
			0.85,
			0.7,
			0.55
		}
	}
	--Also increases bot damage dealt.
	self.values.team.crew_ai_ap_ammo = {
		1.25
	}
	
	--Equipment--
	--FAKS: Intended to offer on-demand burst healing that can save people from going down.
	self.values.first_aid_kit.heal_amount = 15 --Heals 150 health on use.

	--Doctor Bags: Intended to offer consistent sustain over a long period of time.
	self.doctor_bag_base = 2 --Starting Number
	self.values.doctor_bag.heal_amount = 0.2 --Heals 20% of max health on use.
	self.values.temporary.doctor_bag_health_regen = {{0.04, 180.1}} --Heals 4% of max health every 4 seconds for the next 3 minutes.
	
	--ECMs: They're ECMs
	self.ecm_jammer_base_battery_life = 10
	self.ecm_jammer_base_low_battery_life = 4
	self.ecm_jammer_base_range = 2500
	self.ecm_feedback_min_duration = 10
	self.ecm_feedback_max_duration = 10
	self.ecm_feedback_interval = 1.2
	self.ecm_feedback_retrigger_interval = 240

	--Sentry Guns
	self.sentry_gun_base_armor = 15
	self.sentry_gun_base_ammo = 140

	--"Baked In" upgrades
	self.values.cable_tie.interact_speed_multiplier = {0.25}
	self.values.player.stamina_multiplier = {2}
	self.values.team.stamina.multiplier = {1.5}
	self.values.player.civ_calming_alerts = {true}
	self.values.carry.throw_distance_multiplier = {1.5}
	self.values.player.sec_camera_highlight_mask_off = {true}
	self.values.player.special_enemy_highlight_mask_off = {true}
	self.values.player.mask_off_pickup = {true}
	self.values.player.melee_kill_snatch_pager_chance = {1}
	self.values.player.run_speed_multiplier = {1.25}
	self.values.player.walk_speed_multiplier = {1.25}
	self.values.player.steelsight_speed_multiplier = {1.25}
	self.values.player.climb_speed_multiplier = {1.25, 1.8}
	self.values.player.can_free_run = {true}
	self.values.player.fall_health_damage_multiplier = {0}
	self.values.player.counter_strike_melee = {true}
	self.player_damage_health_ratio_threshold = 1
	self.player_damage_health_ratio_threshold_2 = 1 --Unused?
	self.values.carry.interact_speed_multiplier = {
		0.75,
		0.25
	}	

	--Allegedly used somewhere???
	self.values.akimbo.recoil_multiplier = {
		1.4,
		1.3,
		1.2
	}
	
	self.values.player.corpse_dispose_amount = {2, 3}
	self.values.bodybags_bag.quantity = {1}
	
	self.values.player.pick_lock_easy_speed_multiplier = {
		0.5, --Basic
		0.25 --Ace
	}
	--Ace
	self.values.player.pick_lock_hard = {true}	

	--Skills--
	--MASTERMIND--
		--Medic--
			--Combat Medic--
				--Basic
					self.values.player.revive_damage_reduction = {0.9}
					self.values.temporary.revive_damage_reduction = {{
						0.9,
						5
					}}
				--Ace
					self.revive_health_multiplier = {1.3}
					
					self.skill_descs.combat_medic = {
					skill_value_b1 = tostring((1 - self.values.player.revive_damage_reduction[1]) * 100).."%", -- DR
					skill_value_b2 = tostring(self.values.temporary.revive_damage_reduction[1][2]), -- DR duration in s
					skill_value_p1 = tostring(self.revive_health_multiplier[1]%1*100).."%" -- Additional HP for a teammate after reviving
					}
					
			
			--Quick Fix
				--Basic
					self.values.first_aid_kit.deploy_time_multiplier = {0.5} --Also applies to DBs.
				--Ace
					self.values.temporary.first_aid_damage_reduction = {{0.5, 5}}
					
					self.skill_descs.tea_time = {
					skill_value_b1 = tostring(self.values.first_aid_kit.deploy_time_multiplier[1] * 100).."%", -- Decreasing deploy time
					skill_value_p1 = tostring(self.values.temporary.first_aid_damage_reduction[1][1] * 100).."%", -- DR after use
					skill_value_p2 = tostring(self.values.temporary.first_aid_damage_reduction[1][2]) -- Duration of DR effect
					}

			--Painkillers--
				self.first_aid_kit.revived_damage_reduction = {
					{0.75, 5}, --Basic
					{0.5, 5} --Ace
				}
				
				self.skill_descs.fast_learner = {
				skill_value_b1 = tostring((1-self.first_aid_kit.revived_damage_reduction[1][1]) * 100).."%", -- DR for revived player
				skill_value_b2 = tostring(self.first_aid_kit.revived_damage_reduction[1][2]) -- Duration of DR effect
				}

			--Uppers
				self.values.first_aid_kit.quantity = {
					3, --Basic
					6 --Ace
				}
				--Ace
					self.values.first_aid_kit.uppers_cooldown = 60
					
					self.skill_descs.tea_cookies = {
					skill_value_b1 = tostring(self.values.first_aid_kit.quantity[1] + 3), -- Amount of FAKs (3 by default)
					skill_value_p1 = tostring(self.values.first_aid_kit.quantity[2] + 3),
					skill_value_p2 = tostring(self.values.first_aid_kit.uppers_cooldown) -- Uppers's CD
					}

			--Combat Doctor
				--Basic
					self.values.doctor_bag.amount_increase = {1}
				--Ace
					self.values.doctor_bag.quantity = {1}
					
					self.skill_descs.medic_2x = {
					skill_value_b1 = tostring(self.values.doctor_bag.amount_increase[1]), -- Charges of medbag
					skill_value_p1 = tostring(self.values.doctor_bag.quantity[1] + 1) -- Quantity of medbags
					}
			
			--Inspire
				--Basic					
					self.morale_boost_speed_bonus = 1.2
					self.morale_boost_suppression_resistance = 1
					self.morale_boost_time = 10
					self.morale_boost_reload_speed_bonus = 1.2
					self.morale_boost_base_cooldown = 3.5
					self.values.player.revive_interaction_speed_multiplier = {
						0.5
					}
				--Ace
					self.values.player.long_dis_revive = {0.5, 0.5}
					self.values.cooldown.long_dis_revive = {
						{1, 90}
					}
					
					self.skill_descs.inspire = {
					skill_value_b1 = tostring(self.values.player.revive_interaction_speed_multiplier[1] * 100).."%", -- Revive speed increase
					skill_value_b2 = tostring(self.morale_boost_reload_speed_bonus % 1 * 100).."%", -- Reload speed bonus
					skill_value_b3 = tostring(self.morale_boost_time), -- Duration of bonus
					skill_value_p1 = tostring(self.values.cooldown.long_dis_revive[1][2]) -- CD of ace version
					} 
			
		--Controller--
			--Cable Guy
				--Basic
					self.values.cable_tie.quantity_1 = {3}
				--Ace
					self.values.cable_tie.quantity_2 = {3}
					self.values.cable_tie.pickup_chance = {true}
					
					self.skill_descs.triathlete = {
					skill_value_b1 = tostring(self.values.cable_tie.quantity_1[1]), -- Additional cable ties on start
					skill_value_p1 = tostring(self.values.cable_tie.quantity_2[1])
					}

				--Clowns are Scary
					--Basic
						self.values.player.civ_intimidation_mul = {1.5}
					--Ace
						self.values.player.intimidate_range_mul = {1.5}
						self.values.player.intimidate_aura = {1000}
						
						self.skill_descs.cable_guy = {
						skill_value_b1 = tostring(self.values.player.civ_intimidation_mul[1] % 1 * 100).."%", -- Civilians remain intimidated longer
						skill_value_p1 = tostring(self.values.player.intimidate_range_mul[1] % 1 * 100).."%" -- The power and range of your intimidation
						}

				--Joker
					self.values.player.convert_enemies_max_minions = {
						1, --Basic
						2 --Ace
					}
					--Says health multiplier, but actually multiplies damage taken.
					self.values.player.passive_convert_enemies_health_multiplier = {
						0.4, --Basic
						0.2 --Ace
					}					
					--Basic
						self.values.player.convert_enemies = {true}
					--Ace
						self.values.player.convert_enemies_health_multiplier = {0.45}
						self.values.player.convert_enemies_damage_multiplier = {1.45, 1.45}
						
						self.skill_descs.stockholm_syndrome = {
						skill_value_b1 = tostring((1-self.values.player.passive_convert_enemies_health_multiplier[1])*100).."%", -- Initial DR for converted cop
						skill_value_p1 = tostring(self.values.player.passive_convert_enemies_health_multiplier[2]*100).."%" -- Additional DR for converted cop
						}

				--Stockholm Syndrome
					--Basic
						self.values.player.civilian_reviver = {true}
						self.values.player.civilian_gives_ammo = {true}						
					--Ace						
						self.values.team.damage = {
							hostage_absorption = {0.1},
							hostage_absorption_limit = 4
						}
						
						self.skill_descs.joker = {
						skill_value_p1 = tostring(self.values.team.damage.hostage_absorption[1] * 10), -- DA per hostage
						skill_value_p2 = tostring(self.values.team.damage.hostage_absorption_limit) -- Max possible DA
						}

				--Partners in Crime--
					--Basic
						self.values.player.hostage_speed_multiplier = {1.03}
					--Ace
						self.values.player.hostage_health_multiplier = {1.05}
						
						self.skill_descs.control_freak = {
						skill_value_b1 = tostring(self.values.player.hostage_speed_multiplier[1] % 1 * 100).."%", -- Movement speed per hostage
						skill_value_p1 = tostring(self.values.player.hostage_health_multiplier[1] % 1 * 100).."%" -- Max HP pool per hostage						
						}
							
				--Hostage Taker
						self.values.player.hostage_health_regen_addend = {
							0.1, --Basic
							0.2 --Unused
						}		

					--Ace
						self.values.player.civilians_dont_flee = {true}
						self.values.player.super_syndrome = {
							1
						}						
						self.values.player.hostage_health_regen_max_mult = { 1.5 }
						
						self.skill_descs.black_marketeer = {
						skill_value_b1 = tostring(self.values.player.hostage_health_regen_addend[1]*10), -- HP regen
						skill_value_p1 = tostring(self.values.player.hostage_health_regen_max_mult[1] % 1 * 100).."%" -- HP regen increase when 4+ hostages
						}
			
		--Assault--
			--Leadership--
				--Basic
					self.values.smg.recoil_index_addend = {2}
				--Ace
					self.values.team.weapon.recoil_index_addend = {2}
					
					self.skill_descs.stable_shot = {
					skill_value_b1 = tostring(self.values.smg.recoil_index_addend[1]), -- +Stability
					skill_value_p1 = tostring(self.values.team.weapon.recoil_index_addend[1]) -- +Stability for everyone
					}

			--MG Handling
				--Basic
					self.values.smg.hip_fire_spread_multiplier = {0.8, 0.5}
				--Ace
					self.values.smg.reload_speed_multiplier = {1.25}
					
					self.skill_descs.rifleman = {
					skill_value_b1 = tostring((1 - self.values.smg.hip_fire_spread_multiplier[1]) % 1 * 100).."%", -- Hipfire +accuracy
					skill_value_p1 = tostring((self.values.smg.hip_fire_spread_multiplier[1] - self.values.smg.hip_fire_spread_multiplier[2]) % 1 * 100).."%", -- another hipfire +accuracy
					skill_value_p2 = tostring(self.values.smg.reload_speed_multiplier[1] % 1 * 100).."%" -- Reload speed buff
					}
				
			--Shock and Awe
				self.values.weapon.clip_ammo_increase = {
					1.2, --Basic
					1.5 --Ace
				}
				
				self.skill_descs.spotter_teamwork = {
				skill_value_b1 = tostring(self.values.weapon.clip_ammo_increase[1] % 1 * 100).."%", -- Mag size increase
				skill_value_p1 = tostring((self.values.weapon.clip_ammo_increase[2] - self.values.weapon.clip_ammo_increase[1]) % 1 * 100).."%" -- Additional mag size increase
				}
				
				

			--MG Specialist
				--Basic
					self.values.smg.move_spread_multiplier = {0.4}
				--Ace
					self.values.smg.fire_rate_multiplier = {1.15, 1.15}
					self.values.smg.full_auto_free_ammo = {5}
					
					self.skill_descs.sharpshooter = {
					skill_value_b1 = tostring((1 - self.values.smg.move_spread_multiplier[1]) % 1 * 100) .."%", -- The movement penalty to accuracy
					skill_value_p1 = tostring(self.values.smg.fire_rate_multiplier[1] % 1 * 100).."%", -- RoF increase
					skill_value_p2 = tostring(self.values.smg.full_auto_free_ammo[1]) -- Every X bullet fired without releasing the trigger consumes no ammo					
					}
				
			--Heavy Impact
				--Basic
					self.values.weapon.knock_down = {
						0.2, --Ace
						0.2 --Unused
					}
				--Ace
					self.values.player.bipod_damage_reduction = {0.75}
					self.values.player.crouching_damage_reduction = {0.875}
					
					self.skill_descs.speedy_reload = {
					skill_value_b1 = tostring(self.values.weapon.knock_down[1] * 100).."%", -- Stagger chance
					skill_value_b2 = tostring(self.values.weapon.knock_down[1] * 2 * 100).."%", -- Double stagger chance when MG is mounted
					skill_value_p1 = tostring((1 - self.values.player.crouching_damage_reduction[1]) % 1 * 100).."%", -- DR during crounch
					skill_value_p2 = tostring((1 - self.values.player.bipod_damage_reduction[1]) % 1 * 100).."%" -- DR when MG is mounted
					}
	
			--Body Expertise aka Spray N' Pray
				self.values.player.ap_bullets = {0.5}
				self.values.smg.ap_bullets = {1.0}
				self.automatic_kills_to_damage_reset_t = 1.5 --delay to reset time (seconds)
				self.values.smg.automatic_kills_to_damage = {
					{
						3, --stack limit
						0.16667 --dmg mult add
					}
				}
				--Unused
					self.values.weapon.automatic_head_shot_add = {0.03, 0.06}
					self.values.player.universal_body_expertise = {false}
					self.values.smg.automatic_can_shoot_through_enemy = {
						{
							5, --stack limit
							1.1 --dmg mult
						}
					}
					
				self.skill_descs.single_shot_ammo_return = {
				skill_value_b1 = tostring(self.values.player.ap_bullets[1] * 100).."%", -- AP for non-MG
				skill_value_b2 = tostring(self.values.smg.ap_bullets[1] * 100).."%", -- AP for MG
				skill_value_p1 = tostring(self.automatic_kills_to_damage_reset_t), -- delay to reset time for keeping buff active
				skill_value_p2 = tostring(self.values.smg.automatic_kills_to_damage[1][2] * 100).."%", -- Damage increase per stack
				skill_value_p3 = tostring(self.values.smg.automatic_kills_to_damage[1][1]) -- Amount of stacks
				}
						
	--ENFORCER--
		--Shotgunner--
			--Shotgun Impact
				--Basic
					self.values.shotgun.recoil_index_addend = {2}
				--Ace
					self.values.shotgun.extra_rays = {per_pellet and 0 or 3}
					self.values.shotgun.damage_min_bonus = {per_pellet and 1.25 or 1}
					
					self.skill_descs.underdog = {
					skill_value_b1 = tostring(self.values.shotgun.recoil_index_addend[1]) -- +Stability
					}

			--Shotgun CQB
				--Basic
					self.values.shotgun.enter_steelsight_speed_multiplier = {1.075}
				--Ace
					self.values.shotgun.reload_speed_multiplier = {1.25, 1.25}
					
					self.skill_descs.shotgun_cqb = {
					skill_value_b1 = tostring(self.values.shotgun.enter_steelsight_speed_multiplier[1] % 1 * 100).."%", -- ADS speed buff
					skill_value_p1 = tostring(self.values.shotgun.reload_speed_multiplier[1] % 1 * 100).."%" -- Reload speed buff
					}
				
			--Underdog
				--Basic
					self.values.temporary.dmg_multiplier_outnumbered = {{1.1, 7}}
				--Ace
					self.values.temporary.dmg_dampener_outnumbered = {{0.9, 7}}
					
					self.skill_descs.shotgun_impact = {
					skill_value_b1 = tostring(self.values.temporary.dmg_multiplier_outnumbered[1][1] % 1 * 100).."%", -- Damage buff when surrounded
					skill_value_b2 = tostring(self.values.temporary.dmg_multiplier_outnumbered[1][2]), -- Duration of damage buff
					skill_value_p1 = tostring((1 - self.values.temporary.dmg_dampener_outnumbered[1][1]) % 1 * 100).."%", -- DR when surrounded
					skill_value_p2 = tostring(self.values.temporary.dmg_dampener_outnumbered[1][2]) -- Duration of DR
					}
				
			--Far Away / Pigeon Shooter
				--Basic
					self.values.shotgun.ap_bullets = {0.25}
					self.values.shotgun.can_shoot_through_enemy = {true}
				--Ace
					self.values.shotgun.steelsight_accuracy_inc = {0.7}
					self.values.shotgun.steelsight_range_inc = {1.3}
					
					self.skill_descs.far_away = {
					skill_value_b1 = tostring(self.values.shotgun.ap_bullets[1] * 100).."%", -- AP for shotguns
					skill_value_p1 = tostring(self.values.shotgun.steelsight_range_inc[1] % 1 * 100).."%" -- Accuracy + range increase
					}

			--Close By
				--Basic
					self.values.shotgun.hip_run_and_shoot = {true}
				--Ace
					self.values.shotgun.hip_rate_of_fire = {1.35}
					
					self.skill_descs.close_by = {
					skill_value_p1 = tostring(self.values.shotgun.hip_rate_of_fire[1] % 1 * 100).."%" -- Hipfire RoF increase
					}
				
			--Overkill
				self.values.temporary.overkill_damage_multiplier = {
					{1.5, 3}, --Basic
					{1.5, 9} --Ace
				}
				--Ace
					self.values.shotgun.swap_speed_multiplier = {1.6}
					self.values.saw.swap_speed_multiplier = {1.6}
					self.skill_descs.overkill = {
					skill_value_b1 = tostring(self.values.temporary.overkill_damage_multiplier[1][1] % 1 * 100).."%", -- OVK's damage increase
					skill_value_b2 = tostring(self.values.temporary.overkill_damage_multiplier[1][2]), -- Duration of OVK					
					skill_value_p1 = tostring(self.values.temporary.overkill_damage_multiplier[2][2]),
					skill_value_p2 = tostring(self.values.shotgun.swap_speed_multiplier[1] % 1 * 100).."%" -- Swap speed bonus
					}
			
		--Juggernaut--
			--Stun Resistance
				--Basic
					self.values.player.damage_shake_addend = {1}
					self.values.player.resist_melee_push = {0.025}
				--Ace
					self.values.player.flashbang_multiplier = {1, 0.5}
					
					self.skill_descs.oppressor = {
					skill_value_b1 = tostring(self.values.player.resist_melee_push[1] * 100).."%", -- Melee push resistance (depends of armor)
					skill_value_p1 = tostring(self.values.player.flashbang_multiplier[2] * 100).."%" -- Reduce duration of flashbang effect
					}
				
				--Die Hard
					self.values.player.deflection_addend = {
						0.05, --Basic
						0.10 --Ace
					}
					
					self.skill_descs.show_of_force = {
					skill_value_b1 = tostring(self.values.player.deflection_addend[1] * 100).."%", -- Additional deflection
					skill_value_p1 = tostring((self.values.player.deflection_addend[2] - self.values.player.deflection_addend[1]) * 100).."%"
					}

				--Transporter
					--Basic
						self.values.player.armor_carry_bonus = {1.005}
					--Ace
						self.values.carry.movement_penalty_nullifier = {true}
						
						self.skill_descs.pack_mule = {
						skill_value_b1 = tostring(math.ceil(self.values.player.armor_carry_bonus[1] % 1)/2).."%" -- Reducing movement penalty
						}

				--More Blood To Bleed
					--HARDCODED COCKSUCKING BULLSHIT
					--Go to tweakdata.lua
					self.values.player.health_multiplier = {
						1.1, --Basic
						1.25 --Ace
					}
					
					self.skill_descs.iron_man = {
					skill_value_b1 = tostring(self.values.player.health_multiplier[1] % 1 * 100).."%", -- Additional max HP
					skill_value_p1 = tostring((self.values.player.health_multiplier[2] - self.values.player.health_multiplier[1]) * 100).."%"
					}

				--Bullseye
					self.values.player.headshot_regen_armor_bonus = {
						0.5, --Basic
						3.5 --Ace
					}
					self.values.player.headshot_regen_armor_bonus_cd_reduction = {
						0.5, --Basic
						1 --Ace
					}
					self.on_headshot_dealt_cooldown = 5
					
					self.skill_descs.prison_wife = {
					skill_value_b1 = tostring(self.values.player.headshot_regen_armor_bonus[1] * 10), -- Armor regen on headshot
					skill_value_b2 = tostring(self.on_headshot_dealt_cooldown), -- Bullseye's CD
					skill_value_b3 = tostring(self.values.player.headshot_regen_armor_bonus_cd_reduction[1]), -- Bullseye CD reduction
					skill_value_p1 = tostring((self.values.player.headshot_regen_armor_bonus[2] - self.values.player.headshot_regen_armor_bonus[1]) * 10),
					skill_value_p2 = tostring(self.values.player.headshot_regen_armor_bonus_cd_reduction[2] - self.values.player.headshot_regen_armor_bonus_cd_reduction[1])
					}

				--Iron Man
					--Basic
						--Unlock ICTV
						self.values.player.shield_knock = {true}
					--Ace						
						self.values.player.bullet_shield_knock = {true}
						self.values.player.shield_knock_bullet = {
							max_damage = 200,
							chance = 0.8
						}						
						self.values.player.armor_regen_timer_multiplier = {0.9}
						
						self.skill_descs.juggernaut = {
						skill_value_p1 = tostring((1 - self.values.player.armor_regen_timer_multiplier[1]) * 100).."%" -- Faster armor recovery
						}
			
		--Support--
			--Scavenger
				--Basic
					self.values.player.increased_pickup_area = {1.5}
				--Ace
					self.values.player.double_drop = {5}
					
					self.skill_descs.scavenging = {
					skill_value_b1 = tostring(self.values.player.increased_pickup_area[1] % 1 * 100).."%", -- Increase ammo pick up range
					skill_value_p1 = tostring(self.values.player.double_drop[1]) -- +1 ammo box after X kills
					}
				
			--Bulletstorm
				--Identical to vanilla

			--Specialist Equipment formally Portable Saw
				--Basic
					self.values.saw.enemy_slicer = {true}
				--Ace
					self.values.saw.reload_speed_multiplier = {1.25}
					self.values.grenade_launcher.reload_speed_multiplier = {1.25}
					self.values.crossbow.reload_speed_multiplier = {1.25}
					self.values.bow.reload_speed_multiplier = {1.25}
					
					self.skill_descs.portable_saw = {
					skill_value_p1 = tostring(self.values.saw.reload_speed_multiplier[1] % 1 * 100).."%" -- Reload speed buff
					}
			
			--Extra Lead
				--Basic
					self.values.ammo_bag.ammo_increase = {2}
				--Ace
					self.values.ammo_bag.quantity = {1}
					
					self.skill_descs.ammo_2x = {
					skill_value_b1 = tostring(self.values.ammo_bag.ammo_increase[1] * 100).."%", -- Ammo increase for ammo bags
					skill_value_p1 = tostring(self.values.ammo_bag.quantity[1] + 1) -- Quantity of ammo bags
					}

			--Rip and Tear
				--Basic
					self.values.saw.ignore_shields = {true}
				--Ace
					self.values.saw.panic_when_kill = {
						{
							area = 1000,
							chance = 0.5,
							amount = 200
						}
					}
					
					self.skill_descs.carbon_blade = {
					skill_value_p1 = tostring(self.values.saw.panic_when_kill[1].chance * 100).."%", -- Chance to cause panic
					skill_value_p2 = tostring(self.values.saw.panic_when_kill[1].area / 100) -- Area of panic
					}
				
			--Fully Loaded
				--Basic
					self.values.player.extra_ammo_multiplier = {1.25}
				--Ace
					self.values.player.fully_loaded_pick_up_multiplier = {1.5}
					self.values.player.regain_throwable_from_ammo = {
						{chance = 0.05, chance_inc = 0.01}
					}
					
					self.skill_descs.bandoliers = {
					skill_value_b1 = tostring(self.values.player.extra_ammo_multiplier[1] % 1 * 100).."%", -- +Max ammo capacity
					skill_value_p1 = tostring(self.values.player.fully_loaded_pick_up_multiplier[1] % 1 * 100), -- Increase ammo pick up
					skill_value_p2 = tostring(self.values.player.regain_throwable_from_ammo[1].chance * 100).."%", --Chance to pick up throwable from ammo boxes
					skill_value_p3 = tostring(self.values.player.regain_throwable_from_ammo [1].chance_inc * 100).."%" -- Increase chance to pick up throwable if ammo box didn't give one
					}
		
	--TECHNICIAN--
		--Fortress--
			--Logistician
				self.values.player.deploy_interact_faster = {
					0.75, --Basic
					0.25 --Ace
				}
				--Ace
				self.values.team.deploy_interact_faster = {0.25}
					
				self.skill_descs.defense_up = {
				skill_value_b1 = tostring((1 - self.values.player.deploy_interact_faster[1]) % 1 * 100).."%", -- increase interaciton speed with deployables
				skill_value_p1 = tostring((1 - self.values.player.deploy_interact_faster[2]) % 1 * 100).."%",
				skill_value_p2 = tostring(self.values.team.deploy_interact_faster[1] * 100).."%" -- interaction speed bonus for teammates
				}
				
			--Nerves of Steel
				--Basic
					self.values.player.steelsight_when_downed = {true}				
				--Ace			
					self.values.player.interacting_damage_multiplier = {0.5}
					
					self.skill_descs.sentry_targeting_package = {
					skill_value_p1 = tostring(self.values.player.interacting_damage_multiplier[1] * 100).."%" -- DR during interaction
					}

			--Engineering
				--Basic
					self.values.sentry_gun.armor_multiplier = {1.4}
				--Ace
					self.values.sentry_gun.armor_multiplier2 = {1.6}
					
					self.skill_descs.eco_sentry = {
					skill_value_b1 = tostring(self.values.sentry_gun.armor_multiplier[1] % 1 * 100).."%", -- more sentry damage
					skill_value_p1 = tostring(self.values.sentry_gun.armor_multiplier2[1] % 1 * 100).."%" -- more sentry HP
					}
		
			--Jack of All Trades
				--Basic
					self.values.player.throwables_multiplier = {1.5}
				--Ace
					self.values.player.second_deployable = {true}
					
					self.skill_descs.engineering = {
					skill_value_b1 = tostring(self.values.player.throwables_multiplier[1] % 1 * 100).."%" -- more throwables
					}
	
			--Tower Defense
				--Basic
					self.values.sentry_gun.ap_bullets = {true}
					--See SentrygunWeapon.lua under the units/weapons for AP bullet stats.
				--Ace
					self.values.sentry_gun.quantity = {1, 2}
					
					self.skill_descs.jack_of_all_trades = {
					skill_value_p1 = tostring(self.values.sentry_gun.quantity[2]) -- Sentries max quantity
					}

				--Bulletproof
					--Basic
						self.values.player.unpierceable_armor = {true}
						self.values.player.level_5_armor_addend = {2}
						self.values.player.level_6_armor_addend = {2}
					--Ace
						self.values.player.armor_full_damage_absorb = {0.15}
						self.values.player.armor_regen_timer_multiplier_tier = {0.85}
						
						self.skill_descs.tower_defense = {
						skill_value_b1 = tostring(self.values.player.level_5_armor_addend[1]*10), -- +armor for Flak and CTV
						skill_value_p1 = tostring(self.values.player.armor_full_damage_absorb[1] * 100).."%", -- DA on 1st shot
						skill_value_p2 = tostring((1 - self.values.player.armor_regen_timer_multiplier_tier[1]) * 100).."%" -- Armor recovery buff
						}
			
		--Breacher--
			--Silent Drilling
				--Basic
					self.values.player.drill_alert_rad = {900}
					self.values.player.silent_drill = {true}
				--Ace
				self.values.player.drill_fix_interaction_speed_multiplier = {
					0.5, --Aced
					0.5 --Unused
				}
				
				self.skill_descs.hardware_expert = {
				skill_value_p1 = tostring(self.values.player.drill_fix_interaction_speed_multiplier[1] * 100).."%" -- Faster repair speed
				}
				
			--Demoman
				--Basic
				self.values.player.trip_mine_deploy_time_multiplier = {
					0.75, --Basic
					0.5 --Unused
				}					
				--Ace
				self.values.trip_mine.explosion_size_multiplier_1 = {1.3}		
				--Shaped Charge increase amount handled in tweakdata
				self.skill_descs.combat_engineering = {
				skill_value_b1 = tostring((1 - self.values.player.trip_mine_deploy_time_multiplier[1]) * 100).."%", -- Faster deploy time
				skill_value_p1 = tostring(self.values.trip_mine.explosion_size_multiplier_1[1] % 1 *100).."%" -- Bigger exlposion radio
				}

			--Drill Sawgent
				self.values.player.drill_speed_multiplier = {
					0.9, --Basic
					0.7 --Ace
				}
				
				self.skill_descs.drill_expert = {
				skill_value_b1 = tostring((1 - self.values.player.drill_speed_multiplier[1]) * 100).."%", -- Drill efficiency
				skill_value_p1 = tostring((self.values.player.drill_speed_multiplier[1] - self.values.player.drill_speed_multiplier[2]) * 100).."%"
				}
				
			--Fire Trap
				self.values.trip_mine.fire_trap = {
					{0, 1}, --Basic
					{10, 1.5} --Unused
				}				
				--Quantity Increase Located in tweakdata.lua since their quantity is hardcoded in the exe

			--Expert Hardware
				--Basic
					self.values.player.drill_autorepair_1 = {0.1}
					
				--Ace
					self.values.player.drill_autorepair_2 = {0.2}
					self.player_drill_stun_chance = 0.5
					
					self.skill_descs.kick_starter = {
					skill_value_b1 = tostring(self.values.player.drill_autorepair_1[1] * 100).."%", -- Auto-repair chance
					skill_value_p1 = tostring(self.values.player.drill_autorepair_2[1] * 100).."%",
					skill_value_p2 = tostring(self.player_drill_stun_chance * 100).."%" -- Stun chance
					}
				
			--Kick Starter
				--Basic
				self.values.player.drill_melee_hit_restart_chance = {true}
				--Ace
				self.values.player.no_interrupt_interaction = {true}
			
		--Combat Engineer--
			--Sharpshooter
				--Basic
					self.values.snp.recoil_index_addend = {2}
					self.values.assault_rifle.recoil_index_addend = {2}
				--Ace
					self.values.temporary.headshot_fire_rate_mult = {{1.2, 10}}
					
					self.skill_descs.steady_grip = {
					skill_value_b1 = tostring(self.values.snp.recoil_index_addend[1]), -- +Stability
					skill_value_p1 = tostring(self.values.temporary.headshot_fire_rate_mult[1][1] % 1 * 100).."%", -- RoF buff
					skill_value_p2 = tostring(self.values.temporary.headshot_fire_rate_mult [1][2]) -- Duration of buff
					}
				
			--Kilmer
				--Basic
					self.values.snp.move_spread_multiplier = {0.4}
					self.values.assault_rifle.move_spread_multiplier = {0.4}
				--Ace
					self.values.snp.reload_speed_multiplier = {1.25}					
					self.values.assault_rifle.reload_speed_multiplier = {1.25}		
					
					self.skill_descs.heavy_impact = {
					skill_value_b1 = tostring((1 - self.values.snp.move_spread_multiplier[1]) * 100).."%", -- Movespeed during ADS
					skill_value_p1 = tostring(self.values.assault_rifle.reload_speed_multiplier[1] % 1 * 100).."%" -- Reload speed
					}

			--Rifleman
				--Basic/Aced
					self.values.assault_rifle.steelsight_accuracy_inc = {0.85, 0.7}
					self.values.snp.steelsight_accuracy_inc = {0.85, 0.7}
					self.values.assault_rifle.steelsight_range_inc = {1.15, 1.3}
					self.values.snp.steelsight_range_inc = {1.15, 1.3}

					self.values.assault_rifle.enter_steelsight_speed_multiplier = {1.075}
					self.values.snp.enter_steelsight_speed_multiplier = {1.075}
					
					self.skill_descs.fire_control = {
					skill_value_b1 = tostring(self.values.snp.steelsight_range_inc[1] % 1 * 100).."%", -- Accuracy and range buff
					skill_value_p1 = tostring((self.values.snp.steelsight_range_inc[2] - self.values.snp.steelsight_range_inc[1]) * 100).."%",
					skill_value_p2 = tostring(self.values.snp.enter_steelsight_speed_multiplier[1] % 1 * 100).."%" --ADS speed buff
					}
					
			--Aggressive Reload
				self.values.temporary.single_shot_fast_reload = {
					{ --Basic
						1.25,
						10,
						false --Whether or not to allow full-auto
					},
					{ --Ace
						1.5,
						10,
						true
					},
				}
				
				self.skill_descs.shock_and_awe = {
				skill_value_b1 = tostring(self.values.temporary.single_shot_fast_reload[1][1] % 1 * 100).."%", -- Reload speed buff
				skill_value_b2 = tostring(self.values.temporary.single_shot_fast_reload[1][2]), -- Duration of buff
				skill_value_p1 = tostring(self.values.temporary.single_shot_fast_reload[2][1] % 1 * 100).."%"
				}

			--Ammo Efficiency
				self.values.player.head_shot_ammo_return = {
					{ ammo = 0.03, time = 8, headshots = 3, to_magazine = false }, --Basic
					{ ammo = 0.03, time = 12, headshots = 2, to_magazine = false } --Ace
				}
				
				self.skill_descs.fast_fire = {
				skill_value_b1 = tostring(self.values.player.head_shot_ammo_return[1].headshots), -- Amount of headshot kills to return ammo
				skill_value_b2 = tostring(self.values.player.head_shot_ammo_return[1].time), -- Timer
				skill_value_b3 = tostring(self.values.player.head_shot_ammo_return[1].ammo * 100).."%", -- Amount of ammo which will be returned in % (minimum 1 ammo)
				skill_value_p1 = tostring(self.values.player.head_shot_ammo_return[2].headshots), -- Amount of headshot kills for ace version
				skill_value_p2 = tostring(self.values.player.head_shot_ammo_return[2].time) -- Timer for ace version
				}
				
			--Mind Blown, formerly Explosive Headshot, formerly Graze
				self.values.snp.graze_damage = {
					{ --Basic
						radius = 400,
						max_chain = 3,
						damage_factor = 0.70,
						damage_factor_range = 0.00,
						range_increment = 800
					},
					{ --Ace
						radius = 500,
						max_chain = 3,
						damage_factor = 0.70,
						damage_factor_range = 0.10,
						range_increment = 800
					}
				}			
				self.values.player.headshot_no_falloff = {true}
				
				self.skill_descs.body_expertise = {
				skill_value_b1 = tostring(self.values.snp.graze_damage[1].damage_factor * 100).."%", -- Minimal ricochet damage
				skill_value_b2 = tostring((self.values.snp.graze_damage[1].radius) / 100), -- Minimal radius (in meters) to ricochet
				skill_value_b3 = tostring(self.values.snp.graze_damage[1].range_increment / 100), -- Give bonus damage and enemy chain for every X meters.
				skill_value_b4 = tostring(self.values.snp.graze_damage[1].max_chain), -- Max ricochet chain possible
				skill_value_p1 = tostring((self.values.snp.graze_damage[2].radius - self.values.snp.graze_damage[1].radius) / 100), -- This is how much increased (in meters) minimal radius
				skill_value_p2 = tostring(self.values.snp.graze_damage[2].damage_factor_range * 100).."%", -- Ricochet damage increase for every X meters
				skill_value_p3 = "100%" -- Max ricochet damage
				}

	--GHOST--
		--Shinobi--
			--Alert
				--Basic
				self.values.player.mark_enemy_time_multiplier = {2}
				--Ace
				self.values.weapon.steelsight_highlight_specials = {
					true
				}

			--Sixth Sense
				--Basic
					self.values.player.standstill_omniscience = {true}
				--Ace
					self.values.player.additional_assets = {true}
					self.values.player.buy_bodybags_asset = {true}
					self.values.player.buy_spotter_asset = {true}				

			--ECM Overdrive
			--Basic
				self.values.ecm_jammer.can_open_sec_doors = {true}		
			--Ace
				self.values.ecm_jammer.affects_pagers = {true}
				self.values.ecm_jammer.duration_multiplier = {1.25}
				self.values.ecm_jammer.feedback_duration_boost = {1.25}
				
				--Unused
				self.values.ecm_jammer.duration_multiplier_2 = {1.25}
				self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
				
				
			--Nimble
				self.values.player.tape_loop_duration = {
					10, --Baked in
					30 --Basic
				}
				self.values.player.hack_fix_interaction_speed_multiplier = {
					0.7, --Basic
					0.2 --Ace
				}
				--Ace
				
			--ECM Specialist
				self.values.ecm_jammer.quantity = {
					1, --Basic
					2 --Ace
				}
				
			--Spotter
				--Basic
				self.values.player.marked_inc_dmg_distance = {{2000, 1.25}}		
				--Ace
				self.values.player.marked_enemy_extra_damage = {true}
				self.values.player.marked_enemy_damage_mul = 1.35

				self.skill_descs.ecm_2x = {
				skill_value_b1 = tostring(self.values.player.marked_inc_dmg_distance[1][2] % 1 * 100).."%", -- +damage if player position > distance
				skill_value_b2 = tostring(self.values.player.marked_inc_dmg_distance[1][1]/100), -- distance to get +damage
				skill_value_p1 = tostring(self.values.player.marked_enemy_damage_mul) -- extra damage on all marked enemies
				}

			
		--Artful Dodger--
			--Duck and Cover
				--Basic
					self.values.player.stamina_regen_timer_multiplier = {0.75}
					self.values.player.stamina_regen_multiplier = {1.25}
				--Ace
				self.values.player.crouch_dodge_chance = {0.06, 0.10}
				self.values.player.crouch_speed_multiplier = {
					1.25,
					1.35
				}
				self.skill_descs.sprinter = {
				skill_value_b1 = tostring((1 - self.values.player.stamina_regen_timer_multiplier[1]) * 100).."%", -- decrease stamina regen delay
				skill_value_b2 = tostring(self.values.player.stamina_regen_multiplier[1] % 1 * 100).."%", -- faster stamina recovery
				skill_value_p1 = tostring(self.values.player.crouch_dodge_chance[1] * 100).."%", -- dodge regen when crouching
				skill_value_p2 = tostring((self.values.player.crouch_speed_multiplier[2] - self.values.player.crouch_speed_multiplier[1]) * 100).."%" -- faster crounch speed
				}

			--Evasion
				self.values.player.movement_speed_multiplier = {
					1.05, --Basic
					1.1 --Unused
				}
				--Basic
					self.values.player.fall_damage_multiplier = {0.25}
				
				--Ace
					--Run and Reload
					
				self.skill_descs.awareness = {
				skill_value_b1 = tostring(self.values.player.movement_speed_multiplier[1] % 1 * 100).."%", -- +movement speed
				skill_value_b2 = tostring((1 - self.values.player.fall_damage_multiplier[1]) * 100).."%" -- reduce fall damage
				}
				
			--Deep Pockets
				--Basic
					self.values.player.melee_concealment_modifier = {2}
				--Ace
					self.values.player.deep_pockets_concealment_modifier = {2}
					self.values.player.ballistic_vest_concealment = {2}
					self.values.player.level_1_armor_addend = {2}
					self.values.player.level_2_armor_addend = {2}
					self.values.player.level_3_armor_addend = {2}
					self.values.player.level_4_armor_addend = {2}
					
					self.skill_descs.thick_skin = {
					skill_value_b1 = tostring(self.values.player.melee_concealment_modifier[1]), -- concealment for melee
					skill_value_p1 = tostring(self.values.player.deep_pockets_concealment_modifier[1] + self.values.player.ballistic_vest_concealment[1]), -- concealment for all ballistic vests
					skill_value_p2 = tostring(self.values.player.deep_pockets_concealment_modifier[1]), -- concealment for other armor
					}

			--Moving Target
				--Basic
				self.values.player.steelsight_move_speed_multiplier = {1.5} --Movement speed while ADSing.
				
				self.values.player.detection_risk_add_movement_speed = {
					{ --Basic
						0.015,
						2,
						"below",
						30,
						0.15
					},
					{ --Ace
						0.015,
						1,
						"below",
						30,
						0.15
					}
				}
				--Ace
				self.values.player.run_dodge_chance = {0.15}
				self.values.player.zipline_dodge_chance = {0.3}
				
				self.skill_descs.dire_need = {
				skill_value_b1 = tostring(self.values.player.detection_risk_add_movement_speed[1][1] * 100).."%", -- movement speed per concealment
				skill_value_b2 = tostring(self.values.player.detection_risk_add_movement_speed[1][2]), -- movement speed per concealment
				skill_value_b3 = tostring(self.values.player.detection_risk_add_movement_speed[1][4]), -- concealment tresholder for movement speed
				skill_value_b4 = tostring(self.values.player.detection_risk_add_movement_speed[1][5] * 100).."%", -- max possible movement speed
				skill_value_b5 = tostring(self.values.player.steelsight_move_speed_multiplier[1] % 1 * 100).."%", -- Movement speed while ADSing. (yes, I copy pasted this comment)
				skill_value_p1 = tostring(self.values.player.detection_risk_add_movement_speed[2][1] * 100).."%", 
				skill_value_p2 = tostring(self.values.player.detection_risk_add_movement_speed[2][2]),
				skill_value_p3 = tostring(self.values.player.detection_risk_add_movement_speed[2][4]), 
				skill_value_p4 = tostring(self.values.player.detection_risk_add_movement_speed[2][5] * 100).."%",
				skill_value_p5 = tostring(self.values.player.run_dodge_chance[1] * 100).."%", -- dodge regen while running
				skill_value_p6 = tostring(self.values.player.zipline_dodge_chance[1] * 100).."%" -- dodge regen while ziplining
				}

			--Shockproof
				--Basic
					self.values.player.taser_malfunction = {{
							interval = 1,
							chance_to_trigger = 0.15
					}}
					self.values.player.knockback_resistance = {0.7}
				--Ace
					self.values.player.taser_self_shock = {
						true
					}	
					self.counter_taser_damage = 0.5			
					self.values.player.escape_taser = {
						2
					}
					self.values.player.slowing_bullet_resistance = {{
							duration = 0.5,
							power = 0.5
					}}
					
					self.skill_descs.insulation = {
					skill_value_b1 = tostring((1 - self.values.player.knockback_resistance [1]) * 100).."%", -- knockback resistance
					skill_value_p1 = tostring(self.values.player.escape_taser[1]), -- escape time
					skill_value_p2 = tostring(self.counter_taser_damage) -- Damage to taser when counter tase happen
					}

			--Sneaky Bastard
				--Basic
				self.values.player.detection_risk_add_dodge_chance = {
					{
						0.01,
						2,
						"below",
						30,
						0.1
					},
					{
						0.01,
						1,
						"below",
						30,
						0.1
					}
				}
				--Ace
					self.values.player.dodge_heal_no_armor = {0.02}
					
					self.skill_descs.jail_diet = {
					skill_value_b1 = tostring(self.values.player.detection_risk_add_dodge_chance[1][1] * 100), --Dodge increase per concealment check
					skill_value_b2 = tostring(self.values.player.detection_risk_add_dodge_chance[1][2]), -- Dodge for X concealment
					skill_value_b3 = tostring(self.values.player.detection_risk_add_dodge_chance[1][4]), --Concealment threshold
					skill_value_b4 = tostring(self.values.player.detection_risk_add_dodge_chance[1][5] * 100), --Max dodge points
					skill_value_p1 = tostring(self.values.player.detection_risk_add_dodge_chance[2][2]), -- Dodge for X concealment ACE
					skill_value_p2 = tostring(self.values.player.dodge_heal_no_armor[1] * 100).."%" -- HP regen on dodge
					}
			
		--Silent Killer--
			--Second Wind--
				--Basic
					self.values.temporary.damage_speed_multiplier = {{1.10, 3}}
				--Ace
					self.values.player.armor_depleted_stagger_shot = {0, 3}
					
					self.skill_descs.scavenger = {
					skill_value_b1 = tostring(self.values.temporary.damage_speed_multiplier[1][1] % 1 * 100).."%", -- movement speed after armor destruction
					skill_value_b2 = tostring(self.values.temporary.damage_speed_multiplier[1][2]), -- movement speed buff duration
					skill_value_p1 = tostring(self.values.player.armor_depleted_stagger_shot[2]) -- stagger effect buff duration
					
					}

			--Optical Illusions
				--Basic
				--Hardcoded, go to tweakdata.lua
					self.values.weapon.swap_speed_multiplier = {1.15}
				--Ace
					self.values.player.weapon_concealment_increase = {
						0,--Unused
						2 --Ace
					}
					
					self.skill_descs.optic_illusions = {
					skill_value_b1 = tostring(self.values.weapon.swap_speed_multiplier[1] % 1 * 100).."%", -- swap speed bonus
					skill_value_p1 = tostring(self.values.player.weapon_concealment_increase[2]) -- concealment bonus
					}

			--The Professional
				--Basic
					self.values.weapon.enter_steelsight_speed_multiplier = {
						1.0375,
						1.075
					}
				--Ace
					self.values.player.special_double_drop = {true}
					
					self.skill_descs.silence_expert = {
					skill_value_b1 = tostring(self.values.weapon.enter_steelsight_speed_multiplier[1] % 1 * 100).."%", -- ADS speed up
					skill_value_p1 = tostring((self.values.weapon.enter_steelsight_speed_multiplier[2] - self.values.weapon.enter_steelsight_speed_multiplier[1]) * 100).."%"
					}


			--Unseen Strike
				self.values.temporary.unseen_strike = {
					{ --Basic
						1.15,
						0.01 --Workaround for Buff Tracker sanity checks.
					},
					{ --Ace
						1.15,
						4
					}
				}
				self.values.player.unseen_increased_crit_chance = {
					{ --Basic
						min_time = 3,
						max_duration = 0, --Unused field, holdover from vanilla.
						crit_chance = 1.15
					},
					{ --Ace
						min_time = 3,
						max_duration = 5,
						crit_chance = 1.15
					}
				}
				
				self.skill_descs.backstab = {
				skill_value_b1 = tostring(self.values.player.unseen_increased_crit_chance[1].min_time), -- Time to activate crit bonus when player don't get damage
				skill_value_b2 = tostring(self.values.temporary.unseen_strike[1][1] % 1 * 100).."%", -- crit chance bonus
				skill_value_p1 = tostring(self.values.temporary.unseen_strike[2][2]) -- Expiring timer of crit bonus
				}
	
			--Cleaner, formally spotter
				--Basic					
					self.values.weapon.special_damage_taken_multiplier = {
						1.1, --Basic
						1.25 --Ace
					}					
				--Ace		
					self.values.player.backstab_dodge = {
						{
							0.125, --Dodge on headshot
							0.75 --Dodge on kill from behind
						}
					}
					
					self.skill_descs.hitman = {
					skill_value_b1 = tostring(self.values.weapon.special_damage_taken_multiplier[1] % 1 * 100).."%", -- more damage to specials/elites
					skill_value_p1 = tostring((self.values.weapon.special_damage_taken_multiplier[2] - self.values.weapon.special_damage_taken_multiplier[1]) * 100).."%",
					skill_value_p2 = tostring(self.values.player.backstab_dodge[1][1] * 100).."%", -- dodge on headshot kill
					skill_value_p3 = tostring(self.values.player.backstab_dodge[1][2] * 100).."%" -- dodge on "backstab" kill (from behind)
					}

			--Low Blow
				self.values.player.detection_risk_add_crit_chance = {
					{ --Basic
						0.03,
						2,
						"below",
						30,
						0.3
					},
					{ --Ace
						0.03,
						1,
						"below",
						30,
						0.3
					}
				}
				--Ace
					self.values.player.backstab_crits = {0.50}
					
					self.skill_descs.unseen_strike = {
					skill_value_b1 = tostring(self.values.player.detection_risk_add_crit_chance[1][1] * 100).."%", -- Crit chance boost
					skill_value_b2 = tostring(self.values.player.detection_risk_add_crit_chance[1][2]), -- crit chance per concealment
					skill_value_b3 = tostring(self.values.player.detection_risk_add_crit_chance[1][4]), -- concealment tresholder for crit chance
					skill_value_b4 = tostring(self.values.player.detection_risk_add_crit_chance[1][5] * 100).."%", -- Max possible crit chance
					skill_value_p1 = tostring(self.values.player.detection_risk_add_crit_chance[1][1] * 100).."%", -- Crit chance boost
					skill_value_p2 = tostring(self.values.player.detection_risk_add_crit_chance[1][2]),
					skill_value_p3 = tostring(self.values.player.detection_risk_add_crit_chance[1][4]),
					skill_value_p4 = tostring(self.values.player.detection_risk_add_crit_chance[1][5] * 100).."%",
					skill_value_p5 = tostring(self.values.player.backstab_crits[1] * 100).."%" -- Additional crit chance if you attack from behind
					}
		
	--FUGITIVE--
		--Gunslinger
			--Equilibrium
				--Basic
					self.values.team.pistol.recoil_index_addend = {2}
					self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
				--Ace
					self.values.pistol.swap_speed_multiplier = {2}
					
					self.skill_descs.equilibrium = {
					skill_value_b1 = tostring(self.values.team.pistol.recoil_index_addend[1]), -- +Stability
					skill_value_p1 = tostring((self.values.pistol.swap_speed_multiplier[1] - 1) * 100).."%" -- Swap speed bonus
					}
				
			--Gun Nut	
				--Basic
					self.values.pistol.hip_fire_spread_multiplier = {0.8}	
				--Ace
					self.values.pistol.fire_rate_multiplier = {1.15}
					self.values.pistol.ap_bullets = {1.0}
					
					self.skill_descs.dance_instructor = {
					skill_value_b1 = tostring((1 - self.values.pistol.hip_fire_spread_multiplier[1]) * 100).."%", -- Reduce hipfire spread
					skill_value_p1 = tostring(self.values.pistol.fire_rate_multiplier[1] % 1 * 100).."%", -- RoF bonus
					skill_value_p2 = tostring(self.values.pistol.ap_bullets[1] * 100) -- AP boost
					}

			--Gunfighter
				self.values.pistol.reload_speed_multiplier = {
					1.05, --Basic
					1.3 --Ace
				}
				--Basic
					self.values.pistol.move_spread_multiplier = {0.6}
					
					self.skill_descs.akimbo = {
					skill_value_b1 = tostring(self.values.pistol.reload_speed_multiplier[1] % 1 * 100).."%", -- Reload speed bonus
					skill_value_b2 = tostring((1 - self.values.pistol.move_spread_multiplier[1]) * 100).."%", -- Reduce spread
					skill_value_p1 = tostring((self.values.pistol.reload_speed_multiplier[2] - self.values.pistol.reload_speed_multiplier[1]) % 1 * 100).."%"
					}
				
			--Akimbo
				--Basic
					self.values.akimbo.recoil_index_addend = {
						0,
						10,
						10,
						10,
						10
					}

				--Ace
					self.values.akimbo.spread_index_addend = {
						0,
						10,
						10,
						10,
						10
					}
					--self.values.akimbo.extra_ammo_multiplier = {1.25}
					--self.values.akimbo.pick_up_multiplier = {1.25}

				--Reserved for future use.
				
				self.skill_descs.gun_fighter = {
				skill_value_b1 = tostring(self.values.akimbo.recoil_index_addend[2]), -- +Stability
				skill_value_p1 = tostring(self.values.akimbo.spread_index_addend[2]) -- +Accuracy
				}

			--Desperado
				self.values.pistol.stacked_accuracy_bonus = {
					{accuracy_bonus = 0.92, max_stacks = 5, max_time = 4}, --Basic
					{accuracy_bonus = 0.92, max_stacks = 5, max_time = 8} --Ace
				}
				
				self.skill_descs.expert_handling = {
				skill_value_b1 = tostring((1 - self.values.pistol.stacked_accuracy_bonus[1].accuracy_bonus) * 100).."%", -- Accuracy bonus per stack
				skill_value_b2 = tostring(self.values.pistol.stacked_accuracy_bonus[1].max_time), -- Duration of buff (basic)
				skill_value_b3 = tostring(self.values.pistol.stacked_accuracy_bonus[1].max_stacks), -- Max amount of stacks
				skill_value_p1 = tostring(self.values.pistol.stacked_accuracy_bonus[2].max_time) -- Duration of buff (ace)
				}
				
			--Trigger Happy
				self.values.pistol.stacking_hit_damage_multiplier = {
					{damage_bonus = 1.05, max_stacks = 5, max_time = 4}, --Basic
					{damage_bonus = 1.05, max_stacks = 10, max_time = 8} --Ace
				}
				
				self.skill_descs.trigger_happy = {
				skill_value_b1 = tostring(self.values.pistol.stacking_hit_damage_multiplier[1].damage_bonus % 1 * 100).."%", -- Damage bonus per stack
				skill_value_b2 = tostring(self.values.pistol.stacking_hit_damage_multiplier[1].max_time), -- Duration of buff (basic)
				skill_value_b3 = tostring(self.values.pistol.stacking_hit_damage_multiplier[1].max_stacks), -- Max stacks (basic)
				skill_value_p1 = tostring(self.values.pistol.stacking_hit_damage_multiplier[2].max_time), -- Duration of buff (ace)
				skill_value_p2 = tostring(self.values.pistol.stacking_hit_damage_multiplier[2].max_stacks - self.values.pistol.stacking_hit_damage_multiplier[1].max_stacks) -- How many additional stacks give ace version
				}
			
		--Revenant
			--Running From Death
				--Basic
					self.values.temporary.increased_movement_speed = {{1.25, 10}}
				--Ace
					self.values.temporary.revived_damage_resist = {{0.8, 10}}
					self.values.player.revive_reload = {true}
					
					self.skill_descs.nine_lives = {
					skill_value_b1 = tostring(self.values.temporary.increased_movement_speed[1][1] % 1 * 100).."%", -- Temp movement speed bonus after reviving
					skill_value_b2 = tostring(self.values.temporary.increased_movement_speed[1][2]), -- Duration of movement speed bonus
					skill_value_p1 = tostring((1 - self.values.temporary.revived_damage_resist[1][1]) * 100).."%", -- Temp DR bonus after reviving
					skill_value_p2 = tostring(self.values.temporary.revived_damage_resist[1][2]) -- Duration of DR bonus
					}
				
			--Undying (Formerly Nine Lives, Formerly Running From Death)
				self.values.player.bleed_out_health_multiplier = {
					2, --Basic
					3 --Ace
				}
				--Ace
					self.values.player.primary_weapon_when_downed = {true}
					
					self.skill_descs.running_from_death = {
					skill_value_b1 = tostring((self.values.player.bleed_out_health_multiplier[1] - 1) * 100).."%", -- Additional HP in bleedout
					skill_value_p1 = tostring((self.values.player.bleed_out_health_multiplier[2] - self.values.player.bleed_out_health_multiplier[1]) * 100).."%"
					}

			--What Doesn't Kill
				--Basic
					self.values.player.damage_absorption_low_revives = {0.1}
				--Ace
					self.values.player.damage_absorption_addend = {0.3}
					
					self.skill_descs.up_you_go = {
					skill_value_b1 = tostring(self.values.player.damage_absorption_low_revives[1] * 10), -- DA for each down
					skill_value_p1 = tostring(self.values.player.damage_absorption_addend[1] * 10) -- Permanent DA
					}

			--Swan Song
				self.values.temporary.berserker_damage_multiplier = {
					{1, 3}, --Basic
					{1, 9} --Ace
				}
				
				self.skill_descs.perseverance = {
				skill_value_b1 = tostring(self.values.temporary.berserker_damage_multiplier[1][2]), -- Swan song duration
				skill_value_p1 = tostring(self.values.temporary.berserker_damage_multiplier[2][2] - self.values.temporary.berserker_damage_multiplier[1][2])
				}

			--Haunt
				--Basic
					self.values.player.killshot_spooky_panic_chance = {0.05}
				--Ace
					self.values.player.killshot_extra_spooky_panic_chance = {0.15}
					
					self.skill_descs.feign_death = {
					skill_value_b1 = tostring(self.values.player.killshot_spooky_panic_chance[1] * 100).."%", -- Panic on kill chance for each down
					skill_value_p1 = tostring(self.values.player.killshot_extra_spooky_panic_chance[1] * 100).."%" -- Permanent flat chance to panic
					}
				
			--Messiah
				self.values.player.messiah_revive_from_bleed_out = {1, 3}
				self.values.player.pistol_revive_from_bleed_out = {1, 3}
				self.values.player.infinite_messiah = {true}
				self.values.player.additional_lives = {1, 3}				
				
			
		--Brawler--
			--Martial Arts
				--Basic
					self.values.player.melee_damage_dampener = {0.50}
				--Ace
					self.values.player.melee_knockdown_mul = {2.0}
					
					self.skill_descs.martial_arts = {
					skill_value_b1 = tostring(self.values.player.melee_damage_dampener[1] * 100).."%", -- Resist to melee damage
					skill_value_p1 = tostring((self.values.player.melee_knockdown_mul[1] - 1) * 100).."%" -- Knockdown bonus
					}
				
			--Bloodthirst
				--Basic
					self.values.player.melee_damage_stacking = {{melee_multiplier = 0.25, max_multiplier = 2}}
				--Ace
					self.values.temporary.melee_kill_increase_reload_speed = {
						{
							1.25, -- speed increase
							10 -- duration
						}
					}
					
					self.skill_descs.drop_soap = {
					skill_value_b1 = tostring(self.values.temporary.melee_kill_increase_reload_speed[1][1] % 1 * 100).."%", -- Reload speed buff
					skill_value_b2 = tostring(self.values.temporary.melee_kill_increase_reload_speed[1][2]) -- Buff duration
					}

			--Pumping Iron
				self.values.player.melee_swing_multiplier = {1.2, 1.5}
				self.values.player.melee_swing_multiplier_delay = {0.8, 0.5} --Unused
				
				self.skill_descs.steroids = {
				skill_value_b1 = tostring(self.values.player.melee_swing_multiplier[1] % 1 * 100).."%", -- Faster melee attack speed
				skill_value_p1 = tostring((self.values.player.melee_swing_multiplier[2] - self.values.player.melee_swing_multiplier[1]) * 100).."%"
				}
				
			--Counter Strike
				self.values.player.spooc_damage_resist = {
					0.2, --Basic
					0.5 --Ace
				}
				--Basic
					self.values.player.counter_strike_spooc = {true}
				--Ace
					self.values.player.deflect_ranged = {0.9}
					
				self.skill_descs.bloodthirst = {
				skill_value_b1 = tostring(self.values.player.spooc_damage_resist[1] * 100).."%", -- less HP damage when knocked down
				skill_value_p1 = tostring((1 - self.values.player.deflect_ranged[1]) * 100).."%", -- DR when charging melee
				skill_value_p2 = tostring((self.values.player.spooc_damage_resist[2] - self.values.player.spooc_damage_resist[1]) * 100).."%" -- evem less HP damage when knocked down
				}

			--Frenzy (Berserker)
				self.values.player.max_health_reduction = {1} --disable base hp loss
				self.values.player.healing_reduction = {1, 1} --disable healing reduction
				self.values.player.frenzy_deflection = {0.2, 0.5}
				self.frenzy_healing_reduction_ratio = 1.5
				
				self.skill_descs.wolverine = {
				skill_value_b1 = tostring(self.values.player.frenzy_deflection[1] * 100).."%", -- +Deflection if player lose HP
				skill_value_p1 = tostring(self.values.player.frenzy_deflection[2] * 100).."%"
				}
				
			--Berserker (Frenzy)
				--Basic
					self.values.player.melee_damage_health_ratio_multiplier = {1.0}
				--Aced
					self.values.player.damage_health_ratio_multiplier = {0.5}
					
					self.skill_descs.frenzy = {
					skill_value_b1 = tostring(self.values.player.melee_damage_health_ratio_multiplier[1] * 100).."%", -- More melee damage when losing HP
					skill_value_p1 = tostring(self.values.player.damage_health_ratio_multiplier [1] * 100).."%" -- More damage for guns when losing HP
					}

	--Singleplayer stealth stuff, to give them access to resources closer to what they would have in coop.
	if Global.game_settings and Global.game_settings.single_player then
		self.values.player.corpse_dispose_amount = {4, 5}
	end
	
	--Just to stop a softlock
	if job == "short1_stage1" or job == "short1_stage2" then
		self.values.player.corpse_dispose_amount = {1, 1}
	end

	--Perk Decks--
	self.values.team.player.civ_intimidation_mul = {
		1.25
	}		
		
	--Shared Perks--
	self.values.weapon.passive_damage_multiplier = {1.25, 1.5, 1.75, 2}
	self.values.player.melee_damage_multiplier = {1.25, 1.5, 1.75, 2}
	self.values.player.non_special_melee_multiplier = {1.25, 1.5, 1.75, 2}
	
	--Crew Chief
	self.values.team.stamina.passive_multiplier = {
		1.5,
		1.3
	}	
	self.values.team.armor.multiplier = {1.05}
	self.values.team.health.passive_multiplier = {1.05}
	self.hostage_max_num = {
		health_regen = 4,
		health = 4,
		stamina = 4,
		speed = 4,
		damage_dampener = 1
	}
	self.values.team.health.hostage_multiplier = {1.05}
	self.values.team.stamina.hostage_multiplier = {1.10}	
	self.values.player.passive_intimidate_range_mul = {
		1.25
	}	
	self.values.player.alarm_pager_speed_multiplier = {
		0.75
	}	
	
	--Muscle
	self.values.player.extra_revive_health = {0.25} --Bonus health % to add when getting up. Used by Muscle and Stoic.
	self.values.player.panic_suppression = {
		true
	}	
	self.values.player.corpse_dispose_speed_multiplier = {
		0.25
	}
	self.values.player.civ_move_multiplier = {
		0.25
	}		

	--Burglar
	self.values.player.crouch_speed_multiplier_burglar = {
		1.2
	}	
	self.values.player.crouch_dodge_chance_burglar = {0.05, 0.10}	
	self.values.player.pick_lock_speed_multiplier = {
		0.8
	}	

	self.values.player.perk_armor_regen_timer_multiplier = {
		0.9,
		0.85, --Armorer Exclusive
		0.8, --Unused
		0.75, --Unused
		0.7 --Unused
	}

	--Hitman
	self.values.player.store_temp_health = { 
		{7.5, 2.5},
		{12, 4}
	}
	self.temp_health_decay = 0.5
	self.temp_health_max = 24
	self.values.player.revive_temp_health = { 12 }
	self.values.player.temp_health_speed = { 1.2 }
	self.values.player.temp_health_deflection = { 0.1 }
	self.values.player.armor_regen_dodge = { 1 }

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
	self.infiltrator_dr_range = 1200
	self.values.player.melee_stacking_heal = {true}
	self.values.temporary.melee_life_leech = {
		{0.08, 08}
	}
	
	self.melee_to_hot_data = {
		armors_allowed = {"level_1", "level_2", "level_3", "level_4", "level_5", "level_6", "level_7"},
		works_with_armor_kit = true,
		tick_time = 1,
		total_ticks = 5,
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
	self.values.melee.stacking_hit_expire_t = {
		10,
		5 --Copycat
	}
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
	self.values.player.level_5_armor_addend_grinder = {-3}
	self.values.player.flak_jacket_concealment = {
		8,
		4
	}
	self.damage_to_hot_data = {
		armors_allowed = {"level_5"},
		works_with_armor_kit = true,
		tick_time = 1,
		total_ticks = 3,
		max_stacks = 5,
		stacking_cooldown = 0.75,
		add_stack_sources = {
			bullet = true,
			explosion = true,
			melee = true,
			taser_tased = true,
			poison = false,
			bleed = false,
			fire = false,
			projectile = true,
			swat_van = true,
			sentry_gun = false,
			civilian = false
		}
	}
	self.values.player.damage_to_hot = {
		0.2,
		0.3,
		0.4,
		
		0.0 --Unused
	}	
	self.values.player.damage_to_hot_extra_ticks = {2}
	self.values.player.hot_speed_bonus = {0.05}
	
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
		tick_time = 1,
		total_ticks = 5,
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
	self.values.player.dodge_stacking_heal = {true}
	self.values.player.dodge_on_revive = {true}
	self.values.weapon.passive_swap_speed_multiplier = {
		1.3,
		2 --Unused
	}

	--Gambler
 	self.loose_ammo_restore_health_values = {
 		cd = { --Cooldown (seconds)
 			8,
 			8,
 			8,

 			10 --Copycat
 		},
 		cdr = {1 , 4}, --Amount cooldown is reduced on ammo box pickup.
		{3, 6}, --Amounts healed per level
		{4, 7},
		{5, 8},

		{2, 5} --Copycat
 	}
	self.loose_ammo_give_team_health_ratio = 0.5 --% of healing given to team.
	self.values.player.loose_ammo_restore_health_give_team = {true}	
	self.values.player.loose_ammo_give_armor = {3}
	self.values.player.loose_ammo_give_dodge = {1}

	--Create actual upgrade table for Gambler.
	self.values.temporary.loose_ammo_restore_health = {}
	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				data[1],
				data[2]
			},
			self.loose_ammo_restore_health_values.cd[i] --I CAN'T WAIT TO BOMB SOME DODONGOS!
		})
	end

	self.values.temporary.loose_ammo_give_team = {{
		true,
		0 --Ammo sharing cooldown, not in use
	}}
	self.loose_ammo_give_team_ratio = 0.15 --% of ammo given to team.

	--Sociopath more like SocioBAD
	self.values.player.killshot_regen_armor_bonus = {2}
	self.values.player.killshot_close_regen_armor_bonus = { 
		{
			1.5, --armor regen
			2 --melee kill mult
		}
	}
	self.values.player.killshot_close_panic_chance = {0.25}
	self.values.player.melee_kill_life_leech = {
		0.02,
		0.01 --Copycat, unused
	}
	self.killshot_close_panic_range = 1200
	self.on_killshot_cooldown = 5
	self.on_killshot_cooldown_reduction = 0.5
	self.on_killshot_cooldown_reduction_melee = 1.5

	--Anarchist stuff--
	self.values.player.armor_grinding = { --increments of 0.25
		{
			{3.6, 4.5},
			{3.8, 4.75},
			{4.0, 5.0},
			{4.2, 5.25},
			{4.6, 5.75},
			{4.8, 6.0},
			{5.2, 6.5}
		}
	}
	
	self.values.player.health_decrease = {0.5}
	
	self.values.player.armor_increase = {
		0.50,
		1.00,
		1.50
	}

	self.values.player.damage_to_armor = { --increments of 0.8
		{
			{1.6, 5},
			{2.4, 5},
			{3.2, 5},
			{4.0, 5},
			{5.6, 5},
			{6.4, 5},
			{8.0, 5}
		}
	}
	
	--Ex President
	self.values.player.armor_health_store_amount = {
		0.4,
		0.6,
		0.8
	}	
	self.values.player.armor_max_health_store_multiplier = {
		1.25
	}

	self.values.player.body_armor.skill_max_health_store = { --increments of 0.4
		4.0,
		3.6,
		3.2,
		2.8,
		2.0,
		1.6,
		0.8
	}
	self.kill_change_regenerate_speed_percentage = true
	self.values.player.body_armor.skill_kill_change_regenerate_speed = { --increments of 0.02
		1.16,
		1.14,
		1.12,
		1.1,
		1.06,
		1.04,
		1.02
	}

	--I AM A BAD MOTHERFUCKA--
	--maniac
	self.cocaine_stacks_convert_levels = {
		120,
		90
	}	
	self.cocaine_stacks_dmg_absorption_value = 0.1
	self.cocaine_stacks_tick_t = 0
	self.max_cocaine_stacks_per_tick = 720
	self.max_total_cocaine_stacks = 720
	self.cocaine_stacks_decay_t = 8
	self.cocaine_stacks_decay_amount_per_tick = 120
	self.cocaine_stacks_decay_percentage_per_tick = 0
	self.values.player.cocaine_stacking = {1}
	self.values.player.sync_cocaine_stacks = {true}
	self.values.player.cocaine_stacks_decay_multiplier = {0.75}
	self.values.player.sync_cocaine_upgrade_level = {2}
	self.values.player.cocaine_stack_absorption_multiplier = {2}
	
	--Chico--
	--kingpin
	self.values.temporary.chico_injector = {
		{0.3, 4},
		{0.3, 5},
		{0.3, 6},
		{0.2, 4} --Copycat's version
	}
	self.values.player.chico_injector_speed = {
		1.2
	}
	self.values.player.chico_armor_multiplier = {
		1.05,
		1.1,
		1.15
	}
	self.values.player.chico_injector_low_health_multiplier = {
		{0.25, 0.6}
	}	
	self.values.player.chico_injector_health_to_speed = {
		{0.5, 2}
	}
	--Are these the dreamers we were told about?--
	--sicario
	self.smoke_screen_armor_regen = {2.0} --Multiplier for armor regen speed.
	self.values.player.sicario_multiplier = {0.4} --Multiplier for dodge gained per second while inside grenade.
	self.values.player.bomb_cooldown_reduction = {1} --Cooldown reduction on smoke bomb for dodging.
	
	--alcoholism is no joke
	--stoic
	self.values.player.armor_to_health_conversion = {
		50
	}
	self.values.player.damage_control_passive = {
		{
			30, --% of damage converted into DoT 
			12.5 --% of converted DoT damage applied per second
		},
		{--Copycat
			20,
			20
		}
	}
	self.values.player.damage_control_auto_shrug = {
		4
	}
	self.values.player.damage_control_healing = {
		150
	}

	self.values.player.damage_control_cooldown_drain = {
		{ 0, 4},
		{50, 6}
	}
	
	--Yakuza--
	self.values.player.max_deflection_add = {0.2}
	self.values.player.melee_double_interval = {true}
	self.values.player.survive_one_hit = {true}
	self.values.survive_one_hit_armor = {5.0}

	self.values.player.resistance_damage_health_ratio_multiplier = {
		0.2
	}

	self.values.player.dodge_regen_damage_health_ratio_multiplier = {
		0.10
	}

	self.values.player.melee_kill_dodge_regen = {
		0.75
	}

	self.values.player.kill_dodge_regen = {
		0.5
	}
	
	--Fat benis :DDDDD
	--biker?
	self.wild_trigger_time = 5
	self.wild_max_triggers_per_time = 1
	self.values.player.wild_health_amount = {0.2}
	self.values.player.wild_armor_amount = {0.0}
	self.values.player.less_health_wild_armor = {{
		0.0,
		0.0
	}}
	self.values.player.less_health_wild_cooldown = {{
		0.0,
		0.0
	}}
	self.values.player.less_armor_wild_health = {{
		0.25,
		0.2
	}}
	self.values.player.less_armor_wild_cooldown = {{
		0.25,
		0.5
	}}

	self.values.player.biker_armor_regen = {
		--Amount regenerated per tick, time between ticks, time fast forwarded when melee kills are done.
		{1.0, 5.0, 0.0},
		{2.0, 5.0, 1.0} 
	}

	--Tag Team--
	self.values.player.tag_team_base = {
		{
			kill_health_gain = 0.4,
			radius = 0.6,
			distance = 18,
			kill_extension = 0,
			kill_duration = 0,
			kill_dropoff = 0,
			duration = 11,
			tagged_health_gain_ratio = 0.5
		},
		{
			kill_health_gain = 0.4,
			radius = 0.6,
			distance = 18,
			kill_extension = 2,
			kill_duration = 2,
			kill_dropoff = 0.2,
			duration = 11,
			tagged_health_gain_ratio = 0.5
		},
		{
			kill_health_gain = 0.8,
			radius = 0.6,
			distance = 18,
			kill_extension = 2,
			kill_duration = 2,
			kill_dropoff = 0.2,
			duration = 11,
			tagged_health_gain_ratio = 0.5
		}
	}

	self.values.player.tag_team_cooldown_drain = {
		{
			tagged = 0,
			owner = 0
		},
		{
			tagged = 2,
			owner = 2
		}
	}

	self.values.player.tag_team_damage_absorption = {
		{
			kill_gain = 0.05,
			max = 0.8
		}	
	}	
	
	--Hacker
	self.values.player.pocket_ecm_jammer_base = {
		{
			cooldown_drain = 2.5,
			duration = 10,
			affects_cameras = true,
			affects_pagers = true,
			feedback_interval = 1.2,
			feedback_range = 1500
		}
	}	
	self.values.player.pocket_ecm_heal_on_kill = {
		0.5
	}	
	self.values.team.pocket_ecm_heal_on_kill = {
		0.25
	}	
	
	--Leech
	self.values.player.copr_static_damage_ratio = {
		0.1,
		0.05
	}	
	self.values.player.copr_activate_bonus_health_ratio = {
		0.05,
		0.025 --Copycat
	}	
	self.values.player.copr_teammate_heal = {
		0.01,
		0.02
	}
	self.values.player.copr_kill_life_leech = {
		3,
		3
	}	
	self.values.player.copr_speed_up_on_kill = {
		1
	}	
	self.copr_ability_cooldown = 40
	self.copr_risen_cooldown_add = 30

	--Copycat
	local health_boost = 0.05
	local armor_boost = 0.0375
	local dodge_boost = 0.0125
	local crouch_speed_multiplier = 0.05
	local carry_speed_multiplier = 0.05
	self.values.player.mrwi_health_multiplier = {
		1 + health_boost * 1,
		1 + health_boost * 2,
		1 + health_boost * 3,
		1 + health_boost * 4
	}
	self.values.player.mrwi_armor_multiplier = {
		1 + armor_boost * 1,
		1 + armor_boost * 2,
		1 + armor_boost * 3,
		1 + armor_boost * 4
	}
	self.values.player.mrwi_dodge_chance = {
		dodge_boost * 1,
		dodge_boost * 2,
		dodge_boost * 3,
		dodge_boost * 4
	}
	self.values.player.mrwi_crouch_speed_multiplier = {
		1 + crouch_speed_multiplier * 1,
		1 + crouch_speed_multiplier * 2,
		1 + crouch_speed_multiplier * 3,
		1 + crouch_speed_multiplier * 4
	}
	self.values.player.mrwi_carry_speed_multiplier = {
		1 + carry_speed_multiplier * 1,
		1 + carry_speed_multiplier * 2,
		1 + carry_speed_multiplier * 3,
		1 + carry_speed_multiplier * 4
	}
	local auto_reload_kills = 10
	self.values.player.primary_reload_secondary = {
		auto_reload_kills
	}
	self.values.player.secondary_reload_primary = {
		auto_reload_kills
	}
	self.values.weapon.mrwi_swap_speed_multiplier = {
		1.15
	}
	self.values.player.dodge_ricochet_bullets = {
		{
			1, --% Chance
			15, --Cooldown, only applies to armor break ricochets
			2 --Armor break ricochet damage mult, Resmod addition
		}
	}
	self.values.player.headshot_regen_health_bonus = {
		0.3
	}
	self.values.temporary.mrwi_health_invulnerable = {
		{
			0.5, --% Threshold
			2, --Duration
			90 --Cooldown (seconds)
		}
	}

	--Tabula Rasa/Innatae
	self.values.player.small_loot_multiplier = {1.15, 1.3}	
	self.values.player.assets_cost_multiplier = {
		0.7,
		0.4
	}	
	self.values.player.buy_cost_multiplier = {
		0.7,
		0.4
	}	
	self.values.player.cleaner_cost_multiplier = {
		0
	}
	self.values.player.passive_xp_multiplier = {
		1.45,
		1.9,
		2.35
	}	
	self.values.player.passive_loot_drop_multiplier = {
		1.1,
		1.2,
		1.3
	}	

	local editable_skill_btns = {
		engineering = {
			BTN_CHANGE_EQ = function ()
				local result = managers.localization:btn_macro("change_equipment") or managers.localization:get_default_macro("BTN_CHANGE_EQ")
				return utf8.to_upper(result)
			end
		}
	}
	self.skill_btns = {}

	for skill_id, skill_btns in pairs(editable_skill_btns) do
		self.skill_btns[skill_id] = {}

		for i, desc in pairs(skill_btns) do
			self.skill_btns[skill_id][tostring(i)] = desc
		end
	end


	
end)

--Copycat Copies
function UpgradesTweakData.mrwi_deck9_options()
	local deck9_options = {
		{ --Crew Chief
			icon_xy = {2, 0},
			name_id = "menu_st_spec_1",
			desc_id = "menu_deck1_mrwi_desc",
			upgrades = {
				"team_passive_stamina_multiplier_1",
				"player_passive_intimidate_range_mul",
				"player_alarm_pager_speed_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Muscle
			icon_xy = {3, 1},
			name_id = "menu_st_spec_2",
			desc_id = "menu_deck2_mrwi_desc",
			upgrades = {
				"player_panic_suppression",
				"player_corpse_dispose_speed_multiplier",
				"player_civ_move_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Armorer
			icon_xy = {6, 1},
			name_id = "menu_st_spec_3",
			desc_id = "menu_deck3_mrwi_desc",
			upgrades = {
				"player_perk_armor_regen_timer_multiplier_1",
				"bodybags_bag_quantity",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Rouge
			icon_xy = {4, 2},
			name_id = "menu_st_spec_4",
			desc_id = "menu_deck4_mrwi_desc",
			upgrades = {
				"player_passive_dodge_chance_1",
				"weapon_passive_swap_speed_multiplier_1",
				"player_tape_loop_duration_2",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Hitman
			icon_xy = {6, 2},
			name_id = "menu_st_spec_5",
			desc_id = "menu_deck5_mrwi_desc",
			upgrades = {
				"player_store_temp_health_1",
				"player_corpse_dispose_amount_2",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Crook
			icon_xy = {5, 3},
			name_id = "menu_st_spec_6",
			desc_id = "menu_deck6_mrwi_desc",
			upgrades = {
				"player_level_2_dodge_addend_1",
				"player_level_3_dodge_addend_1",
				"player_level_4_dodge_addend_1",
				"player_level_2_armor_multiplier_2",
				"player_level_3_armor_multiplier_2",
				"player_level_4_armor_multiplier_2",
				"player_pick_lock_speed_multiplier"	,
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Burglar
			icon_xy = {1, 2},
			name_id = "menu_st_spec_7",
			desc_id = "menu_deck7_mrwi_desc",
			upgrades = {
				"player_passive_dodge_chance_1",
				"player_crouch_dodge_chance_burglar_1",
				"player_crouch_speed_multiplier_burglar",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Infiltrator
			icon_xy = {3, 4},
			name_id = "menu_st_spec_8",
			desc_id = "menu_deck8_mrwi_desc",
			upgrades = {
				"player_damage_dampener_close_contact_1",
				"player_damage_dampener_close_contact_2",
				"melee_stacking_hit_damage_multiplier_1",
				"melee_stacking_hit_expire_t",
				"melee_stacking_hit_expire_t_2",
				"player_tape_loop_duration_2",
				"player_passive_loot_drop_multiplier_1"
			}
		},
		{ --Sociopath
			icon_xy = {0, 5},
			name_id = "menu_st_spec_9",
			desc_id = "menu_deck9_mrwi_desc",
			upgrades = {
				"player_killshot_regen_armor_bonus",
				"player_killshot_close_regen_armor_bonus",
				"player_corpse_dispose_amount_2",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Gambler
			icon_xy = {5, 5},
			name_id = "menu_st_spec_10",
			desc_id = "menu_deck10_mrwi_desc",
			upgrades = {
				"temporary_loose_ammo_restore_health_1",
				"temporary_loose_ammo_restore_health_2",
				"temporary_loose_ammo_restore_health_3",
				"temporary_loose_ammo_restore_health_4",
				"temporary_loose_ammo_give_team",
				"player_alarm_pager_speed_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Grinder
			icon_xy = {1, 6},
			name_id = "menu_st_spec_11",
			desc_id = "menu_deck11_mrwi_desc",
			upgrades = {
				"player_damage_to_hot_1",
				"player_level_5_armor_addend_grinder",
				"player_flak_jacket_concealment_1",
				"player_flak_jacket_concealment_2",
				"bodybags_bag_quantity",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Yakuza
			icon_xy = {0, 7},
			name_id = "menu_st_spec_12",
			desc_id = "menu_deck12_mrwi_desc",
			upgrades = {
				"player_kill_dodge_regen",
				"player_corpse_dispose_speed_multiplier",
				"player_civ_move_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Ex-Pres
			icon_xy = {3, 7},
			name_id = "menu_st_spec_13",
			desc_id = "menu_deck13_mrwi_desc",
			upgrades = {
				"player_armor_health_store_amount_1",
				"team_civ_intimidation_mul",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Maniac
			icon_xy = {0, 0},
			texture_bundle_folder = "coco",
			name_id = "menu_st_spec_14",
			desc_id = "menu_deck14_mrwi_desc",
			upgrades = {
				"player_cocaine_stacking_1",
				"team_civ_intimidation_mul",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Anarchist
			icon_xy = {0, 0},
			texture_bundle_folder = "opera",
			name_id = "menu_st_spec_15",
			desc_id = "menu_deck15_mrwi_desc",
			upgrades = {
				"player_armor_grinding_1",
				"team_civ_intimidation_mul",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Biker
			icon_xy = {0, 0},
			texture_bundle_folder = "wild",
			name_id = "menu_st_spec_16",
			desc_id = "menu_deck16_mrwi_desc",
			upgrades = {
				"player_wild_health_amount_1",
				"team_civ_intimidation_mul",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Kingpin
			icon_xy = {0, 0},
			texture_bundle_folder = "chico",
			name_id = "menu_st_spec_17",
			desc_id = "menu_deck17_mrwi_desc",
			upgrades = {
				"chico_injector",
				"temporary_chico_injector_1",
				"temporary_chico_injector_2",
				"temporary_chico_injector_3",
				"temporary_chico_injector_4",
				"player_chico_injector_speed",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Sicario
			icon_xy = {0, 0},
			texture_bundle_folder = "max",
			name_id = "menu_st_spec_18",
			desc_id = "menu_deck18_mrwi_desc",
			upgrades = {
				"player_passive_dodge_chance_1",
				"smoke_screen_grenade",
				"player_corpse_dispose_amount_2",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Stoic
			icon_xy = {0, 0},
			texture_bundle_folder = "myh",
			name_id = "menu_st_spec_19",
			desc_id = "menu_deck19_mrwi_desc",
			upgrades = {
				"damage_control",
				"player_damage_control_passive_1",
				"player_damage_control_passive_2",
				"player_damage_control_healing",
				"player_armor_to_health_conversion",
				"player_alarm_pager_speed_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Tag Team
			icon_xy = {0, 0},
			texture_bundle_folder = "ecp",
			name_id = "menu_st_spec_20",
			desc_id = "menu_deck20_mrwi_desc",
			upgrades = {
				"tag_team",
				"player_tag_team_base_1",
				"player_tag_team_cooldown_drain_1",
				"player_tape_loop_duration_2",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Hacker
			icon_xy = {0, 0},
			texture_bundle_folder = "joy",
			name_id = "menu_st_spec_21",
			desc_id = "menu_deck21_mrwi_desc",
			upgrades = {
				"pocket_ecm_jammer",
				"player_pocket_ecm_jammer_base",
				"player_passive_loot_drop_multiplier_1"	
			}
		},
		{ --Leech
			icon_xy = {0, 0},
			texture_bundle_folder = "copr",
			name_id = "menu_st_spec_22",
			desc_id = "menu_deck22_mrwi_desc",
			upgrades = {
				"temporary_copr_ability_1",
				"copr_ability",
				"player_copr_static_damage_ratio_1",
				"player_copr_kill_life_leech_1",
				"player_copr_activate_bonus_health_ratio_1",
				"player_copr_activate_bonus_health_ratio_2",
				"player_corpse_dispose_speed_multiplier",
				"player_civ_move_multiplier",
				"player_passive_loot_drop_multiplier_1"	
			}
		}
	}

	return deck9_options
end

--Added new definitions--

local sc_definitions = UpgradesTweakData._player_definitions
function UpgradesTweakData:_player_definitions()
	sc_definitions (self, tweak_data)

	--New Definitions, calling em here to play it safe--
	self.definitions.player_detection_risk_stamina_regen = {
		name_id = "menu_player_detection_risk_stamina_regen",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "detection_risk_stamina_regen",
			category = "player"
		}
	}		

	self.definitions.player_small_loot_multiplier_1 = {
		name_id = "menu_player_small_loot_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "small_loot_multiplier",
			category = "player"
		}
	}		
	self.definitions.player_small_loot_multiplier_2 = {
		name_id = "menu_player_small_loot_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "small_loot_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_steelsight_speed_multiplier = {
		name_id = "menu_player_steelsight_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_speed_multiplier",
			category = "player"
		}
	}
	self.definitions.player_passive_loot_drop_multiplier_1 = {
		name_id = "menu_player_passive_loot_drop_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "passive_loot_drop_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_passive_loot_drop_multiplier_2 = {
		name_id = "menu_player_passive_loot_drop_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "passive_loot_drop_multiplier",
			category = "player"
		}
	}
	self.definitions.player_passive_loot_drop_multiplier_3 = {
		name_id = "menu_player_passive_loot_drop_multiplier",
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "passive_loot_drop_multiplier",
			category = "player"
		}
	}	
	self.definitions.passive_player_xp_multiplier_1 = {
		name_id = "menu_player_xp_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "passive_xp_multiplier",
			category = "player"
		}
	}	
	self.definitions.passive_player_xp_multiplier_2 = {
		name_id = "menu_player_xp_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "passive_xp_multiplier",
			category = "player"
		}
	}	
	self.definitions.passive_player_xp_multiplier_3 = {
		name_id = "menu_player_xp_multiplier",
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "passive_xp_multiplier",
			category = "player"
		}
	}		
	self.definitions.player_assets_cost_multiplier_1 = {
		name_id = "menu_player_assets_cost_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "assets_cost_multiplier",
			category = "player"
		}
	}
	self.definitions.player_assets_cost_multiplier_2 = {
		name_id = "menu_player_assets_cost_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "assets_cost_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_flak_jacket_concealment_1 = {
		name_id = "menu_player_flak_jacket_concealment",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "flak_jacket_concealment",
			category = "player"
		}
	}	
	self.definitions.player_flak_jacket_concealment_2 = {
		name_id = "menu_player_flak_jacket_concealment",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "flak_jacket_concealment",
			category = "player"
		}
	}	
	self.definitions.player_deep_pockets_concealment_modifier_1 = {
		name_id = "menu_player_deep_pockets_concealment",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "deep_pockets_concealment_modifier",
			category = "player"
		}
	}		
	self.definitions.player_civ_move_multiplier = {
		name_id = "menu_civ_move_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "civ_move_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_crouch_speed_multiplier_burglar = {
		incremental = true,
		name_id = "menu_player_crouch_speed_multiplier_burglar",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "crouch_speed_multiplier_burglar",
			category = "player"
		}
	}	
	self.definitions.player_crouch_dodge_chance_burglar_1 = {
		name_id = "menu_player_crouch_dodge_chance_burglar",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "crouch_dodge_chance_burglar",
			category = "player"
		}
	}
	self.definitions.player_crouch_dodge_chance_burglar_2 = {
		name_id = "menu_player_crouch_dodge_chance_burglar",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "crouch_dodge_chance_burglar",
			category = "player"
		}
	}	
	self.definitions.player_drill_deploy_speed_multiplier = {
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "drill_fix_interaction_speed_multiplier",
			category = "player"
		}
	}		
	self.definitions.player_drill_fix_interaction_speed_multiplier_1 = {
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "drill_fix_interaction_speed_multiplier",
			category = "player"
		}
	}	
	self.definitions.player_drill_fix_interaction_speed_multiplier_2 = {
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "drill_fix_interaction_speed_multiplier",
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
	self.definitions.assault_rifle_spread_index_addend = {
		name_id = "menu_assault_rifle_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "spread_index_addend",
			category = "assault_rifle"
		}
	}
	self.definitions.snp_spread_index_addend = {
		name_id = "menu_snp_spread_index_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "spread_index_addend",
			category = "snp"
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
	self.definitions.weapon_special_damage_taken_multiplier_1 = {
		name_id = "menu_weapon_special_damage_taken_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "special_damage_taken_multiplier",
			category = "weapon"
		}
	}
	self.definitions.weapon_special_damage_taken_multiplier_2 = {
		name_id = "menu_weapon_special_damage_taken_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "special_damage_taken_multiplier",
			category = "weapon"
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
	self.definitions.player_deflect_ranged = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "deflect_ranged",
			value = 1
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
	self.definitions.player_level_6_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_6_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_6_armor_addend",
			value = 1
		}
	}	
	self.definitions.player_level_5_armor_addend_grinder = {
		category = "feature",
		name_id = "menu_player_level_5_armor_addend_grinder",
		upgrade = {
			category = "player",
			upgrade = "level_5_armor_addend_grinder",
			value = 1
		}
	}	
	self.definitions.player_extra_revive_health = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "extra_revive_health",
			value = 1
		}
	}
	self.definitions.player_dodge_stacking_heal = {
		category = "feature",
		name_id = "menu_player_dodge_stacking_heal",
		upgrade = {
			category = "player",
			upgrade = "dodge_stacking_heal",
			value = 1
		}
	}
	self.definitions.player_melee_stacking_heal = {
		category = "feature",
		name_id = "menu_player_melee_stacking_heal",
		upgrade = {
			category = "player",
			upgrade = "melee_stacking_heal",
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
	self.definitions.player_tag_team_base_1 = {
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "tag_team_base",
			synced = true,
			category = "player"
		}
	}
	self.definitions.player_tag_team_base_2 = {
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "tag_team_base",
			synced = true,
			category = "player"
		}
	}
	self.definitions.player_tag_team_base_3 = {
		category = "feature",
		upgrade = {
			value = 3,
			upgrade = "tag_team_base",
			synced = true,
			category = "player"
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
	self.definitions.temporary_headshot_fire_rate_mult = {
		category = "temporary",
		name_id = "menu_temporary_headshot_fire_rate_mult",
		upgrade = {
			category = "temporary",
			upgrade = "headshot_fire_rate_mult",
			value = 1
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
	self.definitions.player_weapon_concealment_increase_1 = {
		name_id = "menu_player_weapon_concealment_increase_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "weapon_concealment_increase",
			category = "player"
		}
	}
	self.definitions.player_weapon_concealment_increase_2 = {
		name_id = "menu_player_weapon_concealment_increase_2",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "weapon_concealment_increase",
			category = "player"
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
	self.definitions.shotgun_damage_min_bonus = {
		name_id = "menu_shotgun_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_min_bonus",
			category = "shotgun"
		}
	}	
	self.definitions.shotgun_can_shoot_through_enemy = {
		name_id = "menu_shotgun_can_shoot_through_enemy",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "can_shoot_through_enemy",
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
	self.definitions.player_bomb_cooldown_reduction = {
		category = "feature",
		name_id = "menu_player_bomb_cooldown_reduction",
		upgrade = {
			category = "player",
			upgrade = "bomb_cooldown_reduction",
			value = 1
		}
	}
	self.definitions.player_tag_team_damage_absorption = {
		category = "feature",
		upgrade = {
			value = 1,
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
	self.definitions.temporary_chico_injector_4 = { --Copycat Kingpin
		name_id = "menu_temporary_chico_injector_1",
		category = "temporary",
		upgrade = {
			value = 4,
			upgrade = "chico_injector",
			synced = true,
			category = "temporary"
		}
	}
	self.definitions.player_chico_injector_speed = {
		name_id = "menu_player_chico_injector_speed",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "chico_injector_speed",
			category = "player"
		}
	}
	self.definitions.player_damage_control_passive_1 = {
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_control_passive",
			category = "player"
		}
	}

	self.definitions.player_damage_control_passive_2 = { --Copycat
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "damage_control_passive",
			category = "player"
		}
	}
	self.definitions.player_copr_activate_bonus_health_ratio_2 = { --Copycat Stoic
		name_id = "menu_player_copr_activate_bonus_health_ratio_1",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "copr_activate_bonus_health_ratio",
			category = "player"
		}
	}
	self.definitions.melee_stacking_hit_expire_t_2 = { --Copycat Infiltrator
		name_id = "menu_melee_stacking_hit_expire_t_2",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "stacking_hit_expire_t",
			category = "melee"
		}
	}
	self.definitions.player_melee_kill_life_leech_2 = { --Copycath Sociopath
		name_id = "menu_player_melee_kill_life_leech",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "melee_kill_life_leech",
			category = "player"
		}
	}

	self.definitions.pistol_swap_speed_multiplier_1 = {
		name_id = "menu_pistol_swap_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "swap_speed_multiplier",
			category = "pistol"
		}
	}	
	self.definitions.pistol_move_spread_multiplier = {
		name_id = "menu_snp_move_spread_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "move_spread_multiplier",
			category = "pistol"
		}
	}
	self.definitions.player_fully_loaded_pick_up_multiplier = {
		name_id = "menu_player_fully_loaded_pick_up_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "fully_loaded_pick_up_multiplier",
			category = "player"
		}
	}
	self.definitions.player_loose_ammo_give_armor = {
		name_id = "menu_player_loose_ammo_give_armor",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "loose_ammo_give_armor",
			category = "player"
		}
	}
	self.definitions.player_loose_ammo_give_dodge = {
		name_id = "menu_player_loose_ammo_give_dodge",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "loose_ammo_give_dodge",
			category = "player"
		}
	}	
	self.definitions.temporary_loose_ammo_restore_health_4 = { --Copycat Gambler
		name_id = "menu_temporary_loose_ammo_restore_health",
		category = "temporary",
		upgrade = {
			value = 4,
			upgrade = "loose_ammo_restore_health",
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
	self.definitions.player_hostage_health_regen_max_mult = {
		name_id = "menu_player_hostage_health_regen_max_mult",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "hostage_health_regen_max_mult",
			category = "player"
		}
	}
	self.definitions.player_hostage_health_multiplier = {
		name_id = "menu_player_hostage_health_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "hostage_health_multiplier",
			category = "player"
		}
	}
	self.definitions.player_hostage_speed_multiplier = {
		name_id = "menu_player_hostage_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "hostage_speed_multiplier",
			category = "player"
		}
	}
	self.definitions.player_doctor_bag_health_regen = {
		name_id = "menu_temporary_doctor_bag_health_regen",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "doctor_bag_health_regen",
			category = "temporary"
		}
	}
	self.definitions.player_steelsight_move_speed_multiplier = {
		name_id = "menu_player_steelsight_speed_multiplier",
		category = "player",
		upgrade = {
			value = 1,
			upgrade = "steelsight_move_speed_multiplier",
			category = "player"
		}
	}
	self.definitions.player_bullet_shield_knock = {
		name_id = "menu_player_bullet_shield_knock",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "bullet_shield_knock",
			category = "player"
		}
	}
	self.definitions.player_slowing_bullet_resistance = {
		name_id = "menu_player_slowing_bullet_resistance",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "slowing_bullet_resistance",
			category = "player"
		}
	}
	self.definitions.player_knockback_resistance = {
		name_id = "menu_player_knockback_resistance",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "knockback_resistance",
			category = "player"
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_cd_reduction_1 = {
		name_id = "menu_player_headshot_regen_armor_bonus",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "headshot_regen_armor_bonus_cd_reduction",
			category = "player"
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_cd_reduction_2 = {
		name_id = "menu_player_headshot_regen_armor_bonus",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "headshot_regen_armor_bonus_cd_reduction",
			category = "player"
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
	self.definitions.smg_full_auto_free_ammo = {
		category = "feature",
		name_id = "menu_smg_full_auto_free_ammo",
		upgrade = {
			category = "smg",
			upgrade = "full_auto_free_ammo",
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
	self.definitions.smg_hip_fire_spread_multiplier_1 = {
		category = "feature",
		name_id = "menu_smg_hip_fire_spread_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_spread_multiplier_2 = {
		category = "feature",
		name_id = "menu_smg_hip_fire_spread_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_spread_multiplier",
			value = 2
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
	self.definitions.player_hot_speed_bonus = {
		name_id = "menu_player_hot_speed_bonus",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "hot_speed_bonus",
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
	self.definitions.player_melee_double_interval = {
		name_id = "menu_player_melee_double_interval",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "melee_double_interval",
			category = "player"
		}
	}
	self.definitions.player_max_deflection_add = {
		name_id = "menu_player_max_deflection_add",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "max_deflection_add",
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
	self.definitions.player_biker_armor_regen_1 = {
		name_id = "menu_player_biker_armor_regen",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "biker_armor_regen",
			category = "player"
		}
	}
	self.definitions.player_biker_armor_regen_2 = {
		name_id = "menu_player_biker_armor_regen",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "biker_armor_regen",
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
	self.definitions.player_spooc_damage_resist_1 = {
		name_id = "menu_player_spooc_damage_resist",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "spooc_damage_resist",
			category = "player"
		}
	}
	self.definitions.player_spooc_damage_resist_2 = {
		name_id = "menu_player_spooc_damage_resist",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "spooc_damage_resist",
			category = "player"
		}
	}
	self.definitions.player_frenzy_deflection_1 = {
		name_id = "menu_player_frenzy_deflection",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "frenzy_deflection",
			category = "player"
		}
	}
	self.definitions.player_frenzy_deflection_2 = {
		name_id = "menu_player_frenzy_deflection",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "frenzy_deflection",
			category = "player"
		}
	}
	self.definitions.player_deflection_addend_1 = {
		name_id = "menu_player_deflection_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "deflection_addend",
			category = "player"
		}
	}
	self.definitions.player_deflection_addend_2 = {
		name_id = "menu_player_deflection_addend",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "deflection_addend",
			category = "player"
		}
	}
	self.definitions.player_bleed_out_health_multiplier_1 = {
		name_id = "menu_player_bleed_out_health_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "bleed_out_health_multiplier",
			category = "player"
		}
	}
	self.definitions.player_bleed_out_health_multiplier_2 = {
		name_id = "menu_player_bleed_out_health_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "bleed_out_health_multiplier",
			category = "player"
		}
	}
	self.definitions.player_resist_melee_push = {
		name_id = "menu_player_resist_melee_push",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "resist_melee_push",
			category = "player"
		}
	}
	self.definitions.player_damage_absorption_addend = {
		name_id = "menu_player_damage_absorption_addend",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_absorption_addend",
			category = "player"
		}
	}
	self.definitions.player_damage_absorption_low_revives = {
		name_id = "menu_player_damage_absorption_low_revives",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_absorption_low_revives",
			category = "player"
		}
	}
	self.definitions.player_infinite_messiah = {
		name_id = "menu_player_infinite_messiah",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "infinite_messiah",
			category = "player"
		}
	}
	self.definitions.player_killshot_spooky_panic_chance = {
		name_id = "menu_player_killshot_spooky_panic_chance",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "killshot_spooky_panic_chance",
			category = "player"
		}
	}
	self.definitions.player_killshot_extra_spooky_panic_chance = {
		name_id = "menu_player_killshot_extra_spooky_panic_chance",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "killshot_extra_spooky_panic_chance",
			category = "player"
		}
	}
	self.definitions.player_throwables_multiplier = {
		name_id = "menu_player_throwables_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "throwables_multiplier",
			category = "player"
		}
	}
	self.definitions.player_dodge_heal_no_armor = {
		name_id = "menu_player_dodge_heal_no_armor",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "dodge_heal_no_armor",
			category = "player"
		}
	}
	self.definitions.player_backstab_dodge = {
		name_id = "menu_player_backstab_dodge",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "backstab_dodge",
			category = "player"
		}
	}
	self.definitions.player_backstab_crits = {
		name_id = "menu_player_backstab_crits",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "backstab_crits",
			category = "player"
		}
	}
	self.definitions.player_silencer_swap_increase = {
		name_id = "menu_player_silencer_swap_increase",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "silencer_swap_increase",
			category = "player"
		}
	}
	self.definitions.player_special_double_drop = {
		name_id = "menu_player_special_double_drop",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "special_double_drop",
			category = "player"
		}
	}
	self.definitions.player_unpierceable_armor = {
		name_id = "menu_player_unpierceable_armor",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "unpierceable_armor",
			category = "player"
		}
	}
	self.definitions.player_armor_full_damage_absorb = {
		name_id = "menu_player_armor_full_damage_absorb",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "armor_full_damage_absorb",
			category = "player"
		}
	}
	self.definitions.player_civilians_dont_flee = {
		name_id = "menu_player_civilians_dont_flee",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "civilians_dont_flee",
			category = "player"
		}
	}
	self.definitions.player_headshot_no_falloff = {
		name_id = "menu_player_headshot_no_falloff",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "headshot_no_falloff",
			category = "player"
		}
	}
	self.definitions.weapon_swap_speed_multiplier = {
		name_id = "menu_weapon_swap_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "swap_speed_multiplier",
			category = "weapon"
		}
	}	
	self.definitions.player_bipod_damage_reduction = {
		name_id = "menu_player_bipod_damage_reduction",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "bipod_damage_reduction",
			category = "player"
		}
	}
	self.definitions.player_crouching_damage_reduction = {
		name_id = "menu_player_crouching_damage_reduction",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "crouching_damage_reduction",
			category = "player"
		}
	}	
	self.definitions.player_store_temp_health_1 = {
		name_id = "menu_player_store_temp_health",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "store_temp_health",
			category = "player"
		}
	}
	self.definitions.player_store_temp_health_2 = {
		name_id = "menu_player_store_temp_health",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "store_temp_health",
			category = "player"
		}
	}
	self.definitions.player_revive_temp_health = {
		name_id = "menu_player_revive_temp_health",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "revive_temp_health",
			category = "player"
		}
	}
	self.definitions.player_temp_health_speed = {
		name_id = "menu_player_temp_health_speed",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "temp_health_speed",
			category = "player"
		}
	}
	self.definitions.player_temp_health_deflection = {
		name_id = "menu_player_temp_health_deflection",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "temp_health_deflection",
			category = "player"
		}
	}
	self.definitions.player_armor_regen_dodge = {
		name_id = "menu_player_armor_regen_dodge",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "armor_regen_dodge",
			category = "player"
		}
	}
	self.definitions.player_universal_body_expertise = {
		name_id = "menu_player_universal_body_expertise",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "universal_body_expertise",
			category = "player"
		}
	}
	self.definitions.player_no_interrupt_interaction = {
		name_id = "menu_player_no_interrupt_interaction",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "no_interrupt_interaction",
			category = "player"
		}
	}	
	self.definitions.player_revive_reload = {
		name_id = "menu_player_revive_reload",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "revive_reload",
			category = "player"
		}
	}
end

Hooks:PostHook(UpgradesTweakData, "_weapon_definitions", "ResWeaponSkills", function(self)
	self.definitions.snp_steelsight_accuracy_inc_1 = {
		name_id = "menu_snp_steelsight_accuracy_inc",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_accuracy_inc",
			category = "snp"
		}
	}	
	self.definitions.snp_steelsight_accuracy_inc_2 = {
		name_id = "menu_snp_steelsight_accuracy_inc",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "steelsight_accuracy_inc",
			category = "snp"
		}
	}
	self.definitions.assault_rifle_steelsight_accuracy_inc_1 = {
		name_id = "menu_assault_rifle_steelsight_accuracy_inc",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_accuracy_inc",
			category = "assault_rifle"
		}
	}
	self.definitions.assault_rifle_steelsight_accuracy_inc_2 = {
		name_id = "menu_assault_rifle_steelsight_accuracy_inc",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "steelsight_accuracy_inc",
			category = "assault_rifle"
		}
	}
	self.definitions.snp_steelsight_range_inc_1 = {
		name_id = "menu_snp_steelsight_range_inc",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_range_inc",
			category = "snp"
		}
	}
	self.definitions.snp_steelsight_range_inc_2 = {
		name_id = "menu_snp_steelsight_range_inc",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "steelsight_range_inc",
			category = "snp"
		}
	}
	self.definitions.assault_rifle_steelsight_range_inc_1 = {
		name_id = "menu_assault_rifle_steelsight_range_inc",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_range_inc",
			category = "assault_rifle"
		}
	}
	self.definitions.assault_rifle_steelsight_range_inc_2 = {
		name_id = "menu_assault_rifle_steelsight_range_inc",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "steelsight_range_inc",
			category = "assault_rifle"
		}
	}
	self.definitions.shotgun_ap_bullets_1 = {
		name_id = "menu_pistol_ap_bullets_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "ap_bullets",
			category = "shotgun"
		}
	}
	self.definitions.pistol_ap_bullets_1 = {
		name_id = "menu_pistol_ap_bullets_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "ap_bullets",
			category = "pistol"
		}
	}
	self.definitions.smg_ap_bullets_1 = {
		name_id = "menu_smg_ap_bullets_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "ap_bullets",
			category = "smg"
		}
	}
	self.definitions.smg_automatic_can_shoot_through_enemy_1 = {
		name_id = "menu_smg_automatic_can_shoot_through_enemy_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "automatic_can_shoot_through_enemy",
			category = "smg"
		}
	}
	self.definitions.smg_automatic_kills_to_damage_1 = {
		name_id = "menu_automatic_kills_to_damage_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "automatic_kills_to_damage",
			category = "smg"
		}
	}
	self.definitions.akimbo_pick_up_multiplier = {
		name_id = "menu_akimbo_pick_up_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "pick_up_multiplier",
			category = "akimbo"
		}
	}
	self.definitions.assault_rifle_enter_steelsight_speed_multiplier = {
		name_id = "menu_assault_rifle_enter_steelsight_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "enter_steelsight_speed_multiplier",
			category = "assault_rifle"
		}
	}
	self.definitions.snp_enter_steelsight_speed_multiplier = {
		name_id = "menu_snp_enter_steelsight_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "enter_steelsight_speed_multiplier",
			category = "snp"
		}
	}
	self.definitions.weapon_enter_steelsight_speed_multiplier_1 = {
		name_id = "menu_weapon_enter_steelsight_speed_multiplier_1",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "enter_steelsight_speed_multiplier",
			category = "weapon"
		}
	}
	self.definitions.weapon_enter_steelsight_speed_multiplier_2 = {
		name_id = "menu_weapon_enter_steelsight_speed_multiplier_2",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "enter_steelsight_speed_multiplier",
			category = "weapon"
		}
	}
end)

Hooks:PostHook(UpgradesTweakData, "init", "ResOtherModSkills", function(self)

	--MERCENARY DECK
		self.values.player.kmerc_generic_bonus_per_max_armor_rate = 0.8
		self.values.player.kmerc_swap_speed_per_max_armor = { 0.01 }
		self.values.player.kmerc_reload_speed_per_max_armor = { 0.01 }

		self.values.player.kmerc_crit_chance_per_max_armor = {
			{
				crit_chance = 0.01,
				armor_points = 2.0
			}
		}
		self.values.player.kmerc_armored_hot = {
			{
				hot_percent = 0.01,
				interval = 5,
				warmup = 2 -- heal over time counter is reset whenever armor is depleted and initially starts again at 1 second after any amount of armor is regenerated
			}
		}
		self.values.player.kmerc_fatal_triggers_invuln = {
			{
				hp = 0.1, --hp instead set to 1 upon taking fatal damage
				duration = 2 --2 second invuln upon taking fatal damage
			}
		}
		self.values.player.kmerc_passive_health_multiplier = {
			1.05,
			1.10
		}

	--LIBERATOR DECK
		self.values.player.tachi_base = {
			{
				cooldown_drain_per_kill = 1,
				regen_interval = 0.5
			}
		}
		self.values.player.tachi_restore_health = {
			0
		}
		self.values.player.tachi_restore_stamina = {
			15,
			30
		}
		self.values.player.tachi_hot_cancelled_damage_resistance_consolation = {
			0.1
		}
		self.values.player.tachi_hot_amount = {
			0.025,
			0.05,
			0.1
		}
		
		self.values.player.tachi_hot_duration = {
			4,
			6,
			8
		}

		self.definitions.player_tachi_hot_amount_3 = {
			name_id = "menu_deck_liberator_9",
			category = "feature",
			upgrade = {
				value = 3,
				upgrade = "tachi_hot_amount",
				category = "player"
			}
		}


end)