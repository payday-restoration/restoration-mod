if not tweak_data then return end
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--HE'S GOT AN RPG--
	tweak_data.projectiles.launcher_rocket.damage = 120
	tweak_data.projectiles.launcher_rocket.player_damage = 120
	tweak_data.projectiles.launcher_rocket.range = 350
	tweak_data.projectiles.launcher_rocket.curve_pow = 1

	--Grenade launcher stuff--
	tweak_data.projectiles.launcher_frag.damage = 80
	tweak_data.projectiles.launcher_frag.player_damage = 80
	tweak_data.projectiles.launcher_frag.curve_pow = 1
	tweak_data.projectiles.launcher_frag.range = 350
	tweak_data.projectiles.launcher_incendiary.damage = 3
	tweak_data.projectiles.launcher_incendiary.launch_speed = 1250
	tweak_data.projectiles.launcher_incendiary.curve_pow = 0.1
	tweak_data.projectiles.launcher_incendiary.player_damage = 3
	tweak_data.projectiles.launcher_incendiary.burn_duration = 10
	tweak_data.projectiles.launcher_incendiary.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 3000,
		dot_trigger_chance = 50,
		dot_length = 3.1,
		dot_tick_period = 0.5
	}
	tweak_data.projectiles.launcher_m203.damage = 80
	tweak_data.projectiles.launcher_m203.player_damage = 80
	tweak_data.projectiles.launcher_m203.curve_pow = 1
	tweak_data.projectiles.launcher_m203.range = 350

	--M202--
	tweak_data.projectiles.rocket_ray_frag.damage = 120
	tweak_data.projectiles.rocket_ray_frag.player_damage = 120
	tweak_data.projectiles.rocket_ray_frag.range = 350
	tweak_data.projectiles.rocket_ray_frag.curve_pow = 1

	--Arbiter--
	tweak_data.projectiles.launcher_frag_arbiter.damage = 60
	tweak_data.projectiles.launcher_frag_arbiter.player_damage = 60
	tweak_data.projectiles.launcher_frag_arbiter.launch_speed = 10000
	tweak_data.projectiles.launcher_frag_arbiter.range = 350
	tweak_data.projectiles.launcher_frag_arbiter.curve_pow = 1
	tweak_data.projectiles.launcher_frag_arbiter.init_timer = nil
	tweak_data.projectiles.launcher_frag_arbiter.mass_look_up_modifier = nil	

	tweak_data.projectiles.launcher_incendiary_arbiter.damage = 2
	tweak_data.projectiles.launcher_incendiary_arbiter.launch_speed = 1250
	tweak_data.projectiles.launcher_incendiary_arbiter.player_damage = 2
	tweak_data.projectiles.launcher_incendiary_arbiter.burn_duration = 10
	tweak_data.projectiles.launcher_incendiary_arbiter.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 3000,
		dot_trigger_chance = 50,
		dot_length = 3.1,
		dot_tick_period = 0.5
	}

	--Plainsrider--
	tweak_data.projectiles.west_arrow.damage = 24
	tweak_data.projectiles.west_arrow.launch_speed = 10000
	tweak_data.projectiles.west_arrow_exp.damage = 48
	tweak_data.projectiles.west_arrow_exp.launch_speed = 10000
	tweak_data.projectiles.bow_poison_arrow.damage = 20
	tweak_data.projectiles.bow_poison_arrow.launch_speed = 10000

	--Hunter crossbow--
	tweak_data.projectiles.crossbow_arrow.damage = 24
	tweak_data.projectiles.crossbow_poison_arrow.damage = 20
	tweak_data.projectiles.crossbow_arrow_exp.damage = 48
	tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 10000
	tweak_data.projectiles.crossbow_arrow.launch_speed = 10000
	tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 10000

	--Arblast Heavy Crossbow--
	tweak_data.projectiles.arblast_arrow.damage = 36
	tweak_data.projectiles.arblast_arrow_exp.damage = 60
	tweak_data.projectiles.arblast_poison_arrow.damage = 31
	tweak_data.projectiles.arblast_arrow_exp.launch_speed = 10000
	tweak_data.projectiles.arblast_arrow.launch_speed = 10000
	tweak_data.projectiles.arblast_poison_arrow.launch_speed = 10000

	--Franken fish--
	tweak_data.projectiles.frankish_arrow.damage = 24
	tweak_data.projectiles.frankish_arrow_exp.damage = 48
	tweak_data.projectiles.frankish_poison_arrow.damage = 20
	tweak_data.projectiles.frankish_poison_arrow.launch_speed = 10000
	tweak_data.projectiles.frankish_arrow_exp.launch_speed = 10000
	tweak_data.projectiles.frankish_arrow.launch_speed = 10000

	--BOWMEN, FORM UP--
	tweak_data.projectiles.long_arrow.damage = 36
	tweak_data.projectiles.long_arrow_exp.damage = 60
	tweak_data.projectiles.long_poison_arrow.damage = 31
	tweak_data.projectiles.long_arrow_exp.launch_speed = 10000
	tweak_data.projectiles.long_arrow.launch_speed = 10000
	tweak_data.projectiles.long_poison_arrow.launch_speed = 10000

	--GRENADE OUT--
	tweak_data.projectiles.frag.damage = 80
	tweak_data.projectiles.frag.player_damage = 80
	tweak_data.projectiles.frag.curve_pow = 1
	tweak_data.projectiles.frag.range = 350

	--Dynamite--
	tweak_data.projectiles.dynamite.damage = 80
	tweak_data.projectiles.dynamite.player_damage = 80
	tweak_data.projectiles.dynamite.curve_pow = 1
	tweak_data.projectiles.dynamite.range = 350

	--Community Frag--
	tweak_data.projectiles.frag_com.damage = 80
	tweak_data.projectiles.frag_com.player_damage = 80
	tweak_data.projectiles.frag_com.curve_pow = 1
	tweak_data.projectiles.frag_com.range = 350

	--The other community frag--
	tweak_data.projectiles.dada_com.damage = 80
	tweak_data.projectiles.dada_com.player_damage = 80
	tweak_data.projectiles.dada_com.curve_pow = 1
	tweak_data.projectiles.dada_com.range = 350

        --Molliest of tovs--
	tweak_data.projectiles.molotov.damage = 3
	tweak_data.projectiles.molotov.player_damage = 3
	tweak_data.projectiles.molotov.burn_duration = 10

	--Incendiary Nades--
	tweak_data.projectiles.fir_com.damage = 60
	tweak_data.projectiles.fir_com.curve_pow = 3
	tweak_data.projectiles.fir_com.player_damage = 60
	tweak_data.projectiles.fir_com.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 3000,
		dot_trigger_chance = 50,
		dot_length = 10,
		dot_tick_period = 0.5
	}
	tweak_data.projectiles.fir_com.range = 350

	--Throwing Card--
	tweak_data.projectiles.wpn_prj_ace.damage = 24
	tweak_data.projectiles.wpn_prj_ace.adjust_z = 0

	--Shuriken
	tweak_data.projectiles.wpn_prj_four.damage = 20

	--Throwing Knife--
	tweak_data.projectiles.wpn_prj_target.damage = 24
	tweak_data.projectiles.wpn_prj_target.adjust_z = 0
	tweak_data.projectiles.wpn_prj_target.launch_speed = 2000

	--Javelin--
	tweak_data.projectiles.wpn_prj_jav.damage = 36
	tweak_data.projectiles.wpn_prj_jav.launch_speed = 1500
	tweak_data.projectiles.wpn_prj_jav.adjust_z = 30

	--Throwing axe--
	tweak_data.projectiles.wpn_prj_hur.damage = 36
	tweak_data.projectiles.wpn_prj_hur.launch_speed = 1000
	tweak_data.projectiles.wpn_prj_hur.adjust_z = 120

	tweak_data.dot_types.poison = {
		damage_class = "PoisonBulletBase",
		dot_length = 5,
		dot_damage = 2,
		hurt_animation_chance = 0.5
	}

	--Stun nades--
	tweak_data.projectiles.concussion.damage = 0
	tweak_data.projectiles.concussion.curve_pow = 0.1
	tweak_data.projectiles.concussion.range = 1000
	tweak_data.projectiles.concussion.duration = {min = 7.5, additional = 7.5}

	--Had to include this in here due to some BS with it being in upgradestweakdata
	tweak_data.upgrades.values.player.health_multiplier = {1.25, 1.5}
	tweak_data.upgrades.values.trip_mine.quantity = {3, 7}

	tweak_data.interaction.drill_upgrade.timer = 3
	tweak_data.interaction.shaped_sharge.timer = 1

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if difficulty_index == 8 then
		tweak_data.interaction.corpse_alarm_pager.timer = 15
	elseif difficulty_index == 7 then
		tweak_data.interaction.corpse_alarm_pager.timer = 12.5
	else
		tweak_data.interaction.corpse_alarm_pager.timer = 10
	end

	--Smoke Grenades--
	tweak_data.projectiles.smoke_screen_grenade.damage = 0
	tweak_data.projectiles.smoke_screen_grenade.curve_pow = 0.1
	tweak_data.projectiles.smoke_screen_grenade.range = 1500
	tweak_data.projectiles.smoke_screen_grenade.name_id = "bm_smoke_screen_grenade"
	tweak_data.projectiles.smoke_screen_grenade.duration = 12
	tweak_data.projectiles.smoke_screen_grenade.dodge_chance = 0.1
	tweak_data.projectiles.smoke_screen_grenade.init_timer = 0
	tweak_data.projectiles.smoke_screen_grenade.accuracy_roll_chance = 0.5
	tweak_data.projectiles.smoke_screen_grenade.accuracy_fail_spread = {5, 10}

	--But why--
	tweak_data.team_ai.stop_action.delay = 0.8
	tweak_data.team_ai.stop_action.distance = 9999999999999999999999999999999999

	tweak_data.medic.cooldown = 30
	tweak_data.radius = 900
	tweak_data.medic.disabled_units = {
		"phalanx_minion",
		"spring",
		"taser_summers",
		"boom_summers",
		"medic_summers",
		"summers",
		"medic",
		"tank_titan",
		"tank_medic",
		"city_swat_titan"
	}
	tweak_data.medic.cooldown_summers = 0
	tweak_data.radius_summers = 100000
	tweak_data.medic.whitelisted_units = {
		"taser_summers",
		"boom_summers",
		"summers"
	}
	tweak_data.medic.whitelisted_units_summer_squad = {
		"summers"
	}
	tweak_data.achievement.complete_heist_achievements.pain_train.num_players = nil
	tweak_data.achievement.complete_heist_achievements.anticimex.num_players = nil
	tweak_data.achievement.complete_heist_achievements.ovk_8.num_players = nil
	tweak_data.achievement.complete_heist_achievements.steel_1.num_players = nil
	tweak_data.achievement.complete_heist_achievements.green_2.num_players = nil
	tweak_data.achievement.complete_heist_achievements.trophy_flawless.num_players = nil
	tweak_data.achievement.complete_heist_achievements.trophy_friendly_car.num_players = nil
	tweak_data.achievement.complete_heist_achievements.ovk_8.num_players = nil
	tweak_data.achievement.complete_heist_statistics_achievements.immortal_ballot.num_players = nil
	tweak_data.achievement.complete_heist_statistics_achievements.full_two_twenty.num_players = nil

	--Sounds of Animals Fighting--
	local animal_fight = {
			award = "pig_5",
			jobs = {"mia"},
			num_players = nil,
			difficulties = hard_and_above,
			equipped_team = {
				masks = {
					"white_wolf",
					"owl",
					"rabbit",
					"pig"
				}
			}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, animal_fight)

	--Four Monkeys--
	local go_bananas = {
		award = "gage4_12",
		job = {"alex"},
		num_players = nil,
		difficulties = overkill_and_above,
		equipped_team = {
			masks = {
				"silverback",
				"mandril",
				"skullmonkey",
				"orangutang"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, go_bananas)

	--Riders on the snowstorm--
	local xmas_2014 = {
		award = "deer_6",
		jobs = {"pines"},
		num_players = nil,
		difficulties = deathwish_and_above,
		equipped_team = {
			masks = {
				"krampus",
				"mrs_claus",
				"strinch",
				"robo_santa"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, xmas_2014)

	--Reindeer Games--
	local reindeer_games = {
		award = "charliesierra_9",
		num_players = nil,
		equipped_team = {
			masks = {
				"santa_happy",
				"santa_mad",
				"santa_drunk",
				"santa_surprise"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, reindeer_games)

	--Ghost Riders--
	local ghost_riders = {
		award = "bob_10",
		num_players = nil,
		equipped_team = {
			masks = {
				"skullhard",
				"skullveryhard",
				"skulloverkill",
				"skulloverkillplus",
				"gitgud_e_wish",
				"gitgud_sm_wish"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, ghost_riders)

	--Funding Father--
	local funding_father = {
		award = "bigbank_10",
		num_players = nil,
		equipped_team = {
			masks = {
				"franklin",
				"lincoln",
				"grant",
				"washington"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, funding_father)

	--Unusual Suspects--
	local guy_with_gun_now_with_night_jobs = {
		award = "gage5_6",
		num_players = nil,
		jobs = {
			"watchdogs_wrapper",
			"watchdogs",
			"watchdogs_night"
		},
		difficulties = overkill_and_above,
		equipped_team = {
			masks = {
				"galax",
				"crowgoblin",
				"evil",
				"volt"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, guy_with_gun_now_with_night_jobs)

	--Wind of change--
	local wind_of_change = {
		award = "eagle_3",
		num_players = nil,
		jobs = {"hox"},
		difficulties = overkill_and_above,
		equipped_team = {
			masks = {
				"churchill",
				"red_hurricane",
				"patton",
				"de_gaulle"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, wind_of_change)

	--Honor Among Thieves--
	local blight = {
		award = "bat_5",
		jobs = {"mus"},
		difficulties = overkill_and_above,
		equipped_team = {
			masks = {
				"medusa",
				"anubis",
				"pazuzu",
				"cursed_crown"
			}
		}
	}
	table.insert(tweak_data.achievement.complete_heist_achievements, blight)

	end

	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	tweak_data.player.stances.msr.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.r93.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.m95.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.mosin.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.winchester1874.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.wa2000.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.model70.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.tti.steelsight.shakers.breathing.amplitude = 0
	tweak_data.player.stances.siltstone.steelsight.shakers.breathing.amplitude = 0

	end
