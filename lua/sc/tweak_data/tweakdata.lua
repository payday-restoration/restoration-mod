if not tweak_data then 
	return 
end

tweak_data.ammo = {}
tweak_data.ammo.ricochet = {}
tweak_data.ammo.ricochet.max_ricochets = 5
tweak_data.ammo.ricochet.angles = {0, 175}
tweak_data.ammo.ricochet.spread_angle = {10, 30}
tweak_data.ammo.ricochet.autohit = {
	MIN_RATIO = 0.6,
	MAX_RATIO = 1,
	INIT_RATIO = 0.6,
	far_dis = 50000,
	far_angle = 60,
	near_angle = 60
}

--Swap Speed Multipliers
tweak_data.pistol = {swap_bonus = 1.5}
tweak_data.akimbo = {swap_bonus = 0.6}

--Max concealment for guns.
tweak_data.concealment_cap = 32

--HE'S GOT AN RPG--
tweak_data.projectiles.launcher_rocket.damage = 120
tweak_data.projectiles.launcher_rocket.player_damage = 60
tweak_data.projectiles.launcher_rocket.range = 500
tweak_data.projectiles.launcher_rocket.curve_pow = 1

--Grenade launcher stuff--
tweak_data.projectiles.launcher_frag.damage = 80
tweak_data.projectiles.launcher_frag.player_damage = 40
tweak_data.projectiles.launcher_frag.curve_pow = 1
tweak_data.projectiles.launcher_frag.range = 500
tweak_data.projectiles.launcher_incendiary.damage = 3
tweak_data.projectiles.launcher_incendiary.launch_speed = 1250
tweak_data.projectiles.launcher_incendiary.curve_pow = 1
tweak_data.projectiles.launcher_incendiary.player_damage = 3
tweak_data.projectiles.launcher_incendiary.burn_duration = 5
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
tweak_data.projectiles.launcher_m203.range = 500
tweak_data.projectiles.launcher_frag_m32.damage = 80
tweak_data.projectiles.launcher_frag_china.damage = 80

--M202--
tweak_data.projectiles.rocket_ray_frag.damage = 120
tweak_data.projectiles.rocket_ray_frag.player_damage = 60
tweak_data.projectiles.rocket_ray_frag.range = 500
tweak_data.projectiles.rocket_ray_frag.curve_pow = 1

--Arbiter--
tweak_data.projectiles.launcher_frag_arbiter.damage = 60
tweak_data.projectiles.launcher_frag_arbiter.player_damage = 30
tweak_data.projectiles.launcher_frag_arbiter.launch_speed = 2500
tweak_data.projectiles.launcher_frag_arbiter.range = 250
tweak_data.projectiles.launcher_frag_arbiter.curve_pow = 1
tweak_data.projectiles.launcher_frag_arbiter.init_timer = nil

tweak_data.projectiles.launcher_incendiary_arbiter.damage = 2
tweak_data.projectiles.launcher_incendiary_arbiter.launch_speed = 2500
tweak_data.projectiles.launcher_incendiary_arbiter.player_damage = 2
tweak_data.projectiles.launcher_incendiary_arbiter.burn_duration = 5
tweak_data.projectiles.launcher_incendiary_arbiter.init_timer = nil
tweak_data.projectiles.launcher_incendiary_arbiter.fire_dot_data = {
	dot_damage = 1,
	dot_trigger_max_distance = 3000,
	dot_trigger_chance = 50,
	dot_length = 3.1,
	dot_tick_period = 0.5
}

--Plainsrider--
tweak_data.projectiles.west_arrow.damage = 24
tweak_data.projectiles.west_arrow.launch_speed = 2500
tweak_data.projectiles.west_arrow_exp.damage = 48
tweak_data.projectiles.west_arrow_exp.launch_speed = 2500
tweak_data.projectiles.bow_poison_arrow.damage = 20
tweak_data.projectiles.bow_poison_arrow.launch_speed = 2500

--Hunter crossbow--
tweak_data.projectiles.crossbow_arrow.damage = 24
tweak_data.projectiles.crossbow_poison_arrow.damage = 20
tweak_data.projectiles.crossbow_arrow_exp.damage = 48
tweak_data.projectiles.crossbow_arrow_exp.launch_speed = 3125
tweak_data.projectiles.crossbow_arrow.launch_speed = 3125
tweak_data.projectiles.crossbow_poison_arrow.launch_speed = 3125

--Arblast Heavy Crossbow--
tweak_data.projectiles.arblast_arrow.damage = 36
tweak_data.projectiles.arblast_arrow_exp.damage = 60
tweak_data.projectiles.arblast_poison_arrow.damage = 30
tweak_data.projectiles.arblast_arrow_exp.launch_speed = 4375
tweak_data.projectiles.arblast_arrow.launch_speed = 4375
tweak_data.projectiles.arblast_poison_arrow.launch_speed = 4375

--Franken fish--
tweak_data.projectiles.frankish_arrow.damage = 24
tweak_data.projectiles.frankish_arrow_exp.damage = 48
tweak_data.projectiles.frankish_poison_arrow.damage = 20
tweak_data.projectiles.frankish_poison_arrow.launch_speed = 3750
tweak_data.projectiles.frankish_arrow_exp.launch_speed = 3750
tweak_data.projectiles.frankish_arrow.launch_speed = 3750

--BOWMEN, FORM UP--
tweak_data.projectiles.long_arrow.damage = 36
tweak_data.projectiles.long_arrow_exp.damage = 60
tweak_data.projectiles.long_poison_arrow.damage = 30
tweak_data.projectiles.long_arrow_exp.launch_speed = 3125
tweak_data.projectiles.long_arrow.launch_speed = 3125
tweak_data.projectiles.long_poison_arrow.launch_speed = 3125

--le happy merchant--
tweak_data.projectiles.ecp_arrow.damage = 18
tweak_data.projectiles.ecp_arrow_exp.damage = 36
tweak_data.projectiles.ecp_arrow_poison.damage = 14
tweak_data.projectiles.ecp_arrow_poison.launch_speed = 3125
tweak_data.projectiles.ecp_arrow_exp.launch_speed = 3125
tweak_data.projectiles.ecp_arrow.launch_speed = 3125	

--The not longbow--
tweak_data.projectiles.elastic_arrow.damage = 36
tweak_data.projectiles.elastic_arrow_exp.damage = 60
tweak_data.projectiles.elastic_arrow_poison.damage = 30
tweak_data.projectiles.elastic_arrow_exp.launch_speed = 3125
tweak_data.projectiles.elastic_arrow.launch_speed = 3125
tweak_data.projectiles.elastic_arrow_poison.launch_speed = 3125	

--GRENADE OUT--
tweak_data.projectiles.frag.damage = 80
tweak_data.projectiles.frag.player_damage = 40
tweak_data.projectiles.frag.curve_pow = 0.5
tweak_data.projectiles.frag.range = 500

--Dynamite--
tweak_data.projectiles.dynamite.damage = 80
tweak_data.projectiles.dynamite.player_damage = 40
tweak_data.projectiles.dynamite.curve_pow = 0.5
tweak_data.projectiles.dynamite.range = 500

--Community Frag--
tweak_data.projectiles.frag_com.damage = 80
tweak_data.projectiles.frag_com.player_damage = 40
tweak_data.projectiles.frag_com.curve_pow = 0.5
tweak_data.projectiles.frag_com.range = 500

--The other community frag--
tweak_data.projectiles.dada_com.damage = 80
tweak_data.projectiles.dada_com.player_damage = 40
tweak_data.projectiles.dada_com.curve_pow = 0.5
tweak_data.projectiles.dada_com.range = 500

--Molliest of tovs--
tweak_data.projectiles.molotov.damage = 3
tweak_data.projectiles.molotov.player_damage = 3
tweak_data.projectiles.molotov.burn_duration = 10

--Incendiary Nades, idea to make em a mollie--
tweak_data.projectiles.fir_com.damage = 3
tweak_data.projectiles.fir_com.player_damage = 3
tweak_data.projectiles.fir_com.fire_dot_data = {
	dot_damage = 1,
	dot_trigger_max_distance = 3000,
	dot_trigger_chance = 50,
	dot_length = 3.1,
	dot_tick_period = 0.5
}
tweak_data.projectiles.fir_com.range = 75
tweak_data.blackmarket.projectiles.fir_com.impact_detonation = false

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
tweak_data.projectiles.concussion.curve_pow = 1
tweak_data.projectiles.concussion.range = 1000
tweak_data.projectiles.concussion.duration = {min = 7.5, additional = 0}

--Had to include this in here due to some BS with it being in upgradestweakdata
tweak_data.upgrades.values.player.health_multiplier = {1.15, 1.4}
tweak_data.upgrades.values.trip_mine.quantity = {3, 7}
tweak_data.upgrades.values.shape_charge.quantity = {3, 5}

tweak_data.interaction.drill_upgrade.timer = 3
tweak_data.interaction.gen_int_saw_upgrade.timer = 3


local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
if difficulty_index == 8 then
	tweak_data.interaction.corpse_alarm_pager.timer = 15
elseif difficulty_index == 7 then
	tweak_data.interaction.corpse_alarm_pager.timer = 12.5
else
	tweak_data.interaction.corpse_alarm_pager.timer = 10
end	

tweak_data.narrative.jobs["chill_combat"].contact = "events"	
tweak_data.narrative.jobs.chill_combat.contract_visuals = {}	
tweak_data.narrative.jobs.chill_combat.contract_visuals.preview_image = {
	id = "chill_combat"
}	

--Smoke Grenades--
tweak_data.projectiles.smoke_screen_grenade.damage = 0
tweak_data.projectiles.smoke_screen_grenade.curve_pow = 1
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

tweak_data.medic.cooldown = 90
tweak_data.medic.radius = 400
tweak_data.medic.lpf_radius = 800

if difficulty_index <= 4 then
	tweak_data.medic.doc_radius = 1500
elseif difficulty_index == 5 then
	tweak_data.medic.doc_radius = 2500
elseif difficulty_index == 6 then
	tweak_data.medic.doc_radius = 5000
else
	tweak_data.medic.doc_radius = 9999999
end			

tweak_data.medic.disabled_units = {
	"phalanx_vip",
	"spring",
	"taser_summers",
	"boom_summers",
	"medic_summers",
	"summers",
	"autumn",
	"medic",
	"sniper",
	"tank_medic",
	"omnia_lpf"
}
tweak_data.medic.cooldown_summers = 0
tweak_data.radius_summers = 100000
tweak_data.medic.whitelisted_units = {
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

tweak_data.casino = {
	unlock_level = 0,
	entrance_level = {
		14,
		28,
		40,
		45,
		55,
		65,
		75
	},
	entrance_fee = {
		15000,
		15000,
		15000,
		15000,
		15000,
		15000,
		15000
	},
	prefer_cost = 5000,
	prefer_chance = 0.1,
	secure_card_cost = {
		10000,
		20000,
		30000
	},
	secure_card_level = {
		0,
		0,
		0
	},
	infamous_cost = 100000,
	infamous_chance = 3
}	

tweak_data.experience_manager.stage_failed_multiplier = 0.5
-- From update 34
tweak_data.experience_manager.stage_completion = {
	200,
	250,
	300,
	350,
	425,
	475,
	550
}
tweak_data.experience_manager.job_completion = {
	2000,
	4000,
	10000,
	16000,
	20000,
	28000,
	32000
}

tweak_data.experience_manager.pro_day_multiplier = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

if Global.game_settings and Global.game_settings.one_down then
	tweak_data.experience_manager.limited_bonus_multiplier = 1.2
end

	tweak_data.gui.buy_weapon_categories = {
		primaries = {
			{"assault_rifle"},
			{"shotgun"},
			{"lmg"},
			{"snp"},
			{"pistol"},
			{
				"akimbo",
				"pistol"
			},
			{
				"akimbo",
				"smg"
			},
			{
				"akimbo",
				"shotgun"
			},
			{
				"akimbo",
				"assault_rifle"
			},			
			{"wpn_special"},
			{"smg"}
		},
		secondaries = {
			{"pistol"},
			{"smg"},
			{"wpn_special"},
			{"shotgun"},
			{"assault_rifle"}
		}
	}
	if SystemFS:exists("assets/mod_overrides/Marlin Model 1894 Custom/main.xml") or SystemFS:exists("assets/mod_overrides/Mosin Nagant M9130 Obrez/main.xml") then
		table.insert(tweak_data.gui.buy_weapon_categories.secondaries, {"snp"})
	end		

	if SystemFS:exists("assets/mod_overrides/Volmer HK51-B/main.xml") then
		table.insert(tweak_data.gui.buy_weapon_categories.secondaries, {"lmg"})
	end						

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

tweak_data.player.stances.msr.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.r93.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.m95.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.mosin.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.winchester1874.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.wa2000.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.model70.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.tti.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.siltstone.steelsight.shakers.breathing.amplitude = 0