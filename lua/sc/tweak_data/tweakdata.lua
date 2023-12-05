if not tweak_data then 
	return 
end

tweak_data.accessibility_colors.screenflash.hit_flash.default = Color(255, 255, 250, 180) / 255
tweak_data.hud.revive_colors_resmod = {
	restoration.Options:GetValue("HUD/Colors/DownsZero"),
	restoration.Options:GetValue("HUD/Colors/DownsOne"),
	restoration.Options:GetValue("HUD/Colors/DownsTwo"),
	restoration.Options:GetValue("HUD/Colors/DownsThreePlus"),
	restoration.Options:GetValue("HUD/Colors/DownsThreePlus")
}

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

tweak_data.scene_pose_items.husk_bessy = {
	"primary"
}

tweak_data.scene_poses.weapon.bessy = {
	"husk_bessy",
	required_pose = true
}


--Swap Speed Multipliers
--TODO: Move to stat_info
tweak_data.pistol = {
	swap_bonus = 1.8,
	ads_move_speed_mult = 0.8,
	moving_spread_mult = 0.5,
	hipfire_spread_mult = 0.75
}

tweak_data.bow = {
	swap_bonus = 1,
	ads_move_speed_mult = 0.6
}
tweak_data.crossbow = {
	swap_bonus = 1,
	ads_move_speed_mult = 0.5
}
	tweak_data.crossbow_pistol = {
		ads_move_speed_mult = 1.6,
		swap_bonus = 1.8
	}

tweak_data.grenade_launcher = {
	ads_move_speed_mult = 0.5,
}
	tweak_data.gl_pistol = {
		ads_move_speed_mult = 1.6,
		swap_bonus = 1.8
	}
	tweak_data.rocket_launcher = {
		ads_move_speed_mult = 0.4, --lowered to 0.2
	}

tweak_data.shotgun = {
	ads_move_speed_mult = 0.5,
	ads_moving_spread_mult = 1.25
}
	tweak_data.shotgun_light = {
		hipfire_spread_mult = 1.25,
		--ads_multishot_spread_mult = 4,
		moving_spread_mult = 1.5
	}
	tweak_data.shotgun_heavy = {
		hipfire_spread_mult = 0.45,
		--ads_multishot_spread_mult = 0.9
	}
	tweak_data.shotgun_break = {
		hipfire_spread_mult = 1.15,
		--ads_multishot_spread_mult = 1
	}
	tweak_data.shotgun_pistol = {
		ads_move_speed_mult = 1.6,
		swap_bonus = 1.8
	}
	tweak_data.flamethrower = {
		ads_move_speed_mult = 1,
	}
		tweak_data.flamethrower_lmg = {
			ads_move_speed_mult = 0.7,
		}

tweak_data.smg = {
	swap_bonus = 1.2,
	ads_move_speed_mult = 0.7,
	moving_spread_mult = 0.6,
	hipfire_spread_mult = 0.9
}
	tweak_data.pdw = {
		ads_move_speed_mult = 0.7142857, --lowered to 0.5
	}
	tweak_data.lmg = {
		ads_moving_recoil = 1.15,
		swap_bonus = 0.83334,
		ads_move_speed_mult = 0.5, --lowered to 0.35
		moving_spread_mult = 8.3333,
		ads_moving_spread_mult = 3,
		hipfire_spread_mult = 3.3333
	}
		tweak_data.lmg_moving = {
			ads_moving_recoil = 0.8695652
		}
		tweak_data.rambo = {
			hipfire_spread_mult = 0.5
		}
		tweak_data.wolf_brigade = {
			ads_moving_recoil = 0.8695652,
			moving_spread_mult = 0.2,
			hipfire_spread_mult = 0.5
		}
	tweak_data.minigun = {
		swap_bonus = 0.83334,
		ads_move_speed_mult = 0.5, --lowered to 0.35
		moving_spread_mult = 8.3333,
		hipfire_spread_mult = 3.3333
	}
		tweak_data.sasha = {
			hipfire_spread_mult = 0.6
		}

tweak_data.snp = {
	swap_bonus = 1,
	ads_move_speed_mult = 0.45,
	ads_stationary_spread_mult = 0.2,
	hipfire_spread_mult = 1.5,
	hipfire_moving_spread_mult = 1.5
}
	tweak_data.semi_snp = {
		hipfire_spread_mult = 2.5,
		ads_moving_recoil = 1.1,
		hipfire_moving_spread_mult = 1.5,
		ads_moving_spread_mult = 1.1,
		ads_move_speed_mult = 0.888889 --lowered to 0.4
	}
		tweak_data.s7 = {
			hipfire_spread_mult = 0.05,
			hipfire_moving_spread_mult = 0.1,
			ads_moving_spread_mult = 0.1,
		}
	tweak_data.amr = {
		hipfire_spread_mult = 2,
		ads_move_speed_mult = 0.6
	}

tweak_data.assault_rifle = {
	swap_bonus = 1,
	ads_moving_recoil = 1.05,
	ads_stationary_spread_mult = 0.9,
	ads_move_speed_mult = 0.45,
	hipfire_spread_mult = 1.15
}
	tweak_data.crb = {
		ads_moving_recoil = 0.95238,
		hipfire_spread_mult = 0.86956,
		swap_bonus = 1.1,
		ads_move_speed_mult = 1.11111 --raised to 0.5
	}
	tweak_data.dmr = {
		hipfire_spread_mult = 1.7391304,
		moving_spread_mult = 1.5,
		ads_move_speed_mult = 0.888889 --lowered to 0.4
	}

tweak_data.akimbo = {
	swap_bonus = 0.8,
	ads_move_speed_mult = 0.75,
	ads_moving_spread_mult = 3,
	hipfire_spread_mult = 2,
	moving_spread_mult = 3
}

tweak_data.cs_spread = {
	hipfire_spread_mult = 0.1,
	hipfire_moving_spread_mult = 50
}

--Max concealment for guns.
tweak_data.concealment_cap = 32

--HE'S GOT AN RPG--
tweak_data.projectiles.launcher_rocket.damage = 120
tweak_data.projectiles.launcher_rocket.player_damage = 60
tweak_data.projectiles.launcher_rocket.range = 500
tweak_data.projectiles.launcher_rocket.curve_pow = 1
tweak_data.projectiles.launcher_rocket.turret_instakill = true

--M202--
tweak_data.projectiles.rocket_ray_frag.damage = 90
tweak_data.projectiles.rocket_ray_frag.player_damage = 45
tweak_data.projectiles.rocket_ray_frag.range = 500
tweak_data.projectiles.rocket_ray_frag.curve_pow = 2
tweak_data.projectiles.rocket_ray_frag.turret_instakill = true
tweak_data.projectiles.rocket_ray_frag.incendiary = true
tweak_data.projectiles.rocket_ray_frag.dot_data_name = "proj_ray_frag"

--Grenade launcher stuff--
local frag_40mm = {
	'launcher_frag','launcher_frag_china','launcher_frag_m32','launcher_m203','underbarrel_m203_groza','launcher_frag_slap'
}
for i, proj_id in ipairs(frag_40mm) do
	tweak_data.projectiles[proj_id].damage = 72
	tweak_data.projectiles[proj_id].player_damage = 36
	tweak_data.projectiles[proj_id].curve_pow = 1.5
	tweak_data.projectiles[proj_id].range = 500
end

local incendiary_40mm = {
	'launcher_incendiary','launcher_incendiary_china','launcher_incendiary_m32','launcher_incendiary_slap'
}
for i, proj_id in ipairs(incendiary_40mm) do
	tweak_data.projectiles[proj_id].damage = 6
	tweak_data.projectiles[proj_id].curve_pow = 1.5
	tweak_data.projectiles[proj_id].range = 500
	tweak_data.projectiles[proj_id].player_damage = 3
	tweak_data.projectiles[proj_id].burn_duration = 5
	tweak_data.projectiles[proj_id].dot_data_name = "proj_launcher_incendiary"
end

local electric_40mm = {
	'launcher_electric','launcher_electric_china','launcher_electric_m32','underbarrel_electric','underbarrel_electric_groza','launcher_electric_slap'
}
for i, proj_id in ipairs(electric_40mm) do
	tweak_data.projectiles[proj_id].damage = 40
	tweak_data.projectiles[proj_id].player_damage = 20
	tweak_data.projectiles[proj_id].curve_pow = 1.5
	tweak_data.projectiles[proj_id].range = 500
end

local poison_40mm = {
	'launcher_poison_gre_m79','launcher_poison_china','launcher_poison_m32','launcher_poison_contraband','launcher_poison_groza','launcher_poison_slap'
}
for i, proj_id in ipairs(poison_40mm) do
	tweak_data.projectiles[proj_id].damage = 0
	tweak_data.projectiles[proj_id].player_damage = 0
	tweak_data.projectiles[proj_id].curve_pow = 0
	tweak_data.projectiles[proj_id].range = 0
	tweak_data.projectiles[proj_id].poison_gas_range = 600
	tweak_data.projectiles[proj_id].poison_gas_duration = 10
	tweak_data.projectiles[proj_id].poison_gas_fade_time = 0.1
	tweak_data.projectiles[proj_id].poison_gas_tick_time = 0.3
	tweak_data.projectiles[proj_id].poison_gas_dot_data_name = "proj_launcher_cloud"
end

--Arbiter--
tweak_data.projectiles.launcher_frag_arbiter.damage = 60
tweak_data.projectiles.launcher_frag_arbiter.player_damage = 30
tweak_data.projectiles.launcher_frag_arbiter.range = 300
tweak_data.projectiles.launcher_frag_arbiter.curve_pow = 0.75
tweak_data.projectiles.launcher_frag_arbiter.init_timer = nil
tweak_data.projectiles.launcher_frag_arbiter.effect_name = "effects/payday2/particles/explosions/shapecharger_explosion"
tweak_data.projectiles.launcher_incendiary_arbiter.damage = 4
tweak_data.projectiles.launcher_incendiary_arbiter.player_damage = 2
tweak_data.projectiles.launcher_incendiary_arbiter.burn_duration = 5
tweak_data.projectiles.launcher_incendiary_arbiter.init_timer = nil
tweak_data.projectiles.launcher_incendiary_arbiter.dot_data_name = "proj_launcher_incendiary_arbiter"
tweak_data.projectiles.launcher_electric_arbiter.damage = 30
tweak_data.projectiles.launcher_electric_arbiter.player_damage = 15
tweak_data.projectiles.launcher_electric_arbiter.range = 300
tweak_data.projectiles.launcher_electric_arbiter.curve_pow = 0.75
tweak_data.projectiles.launcher_electric_arbiter.init_timer = nil
tweak_data.projectiles.launcher_poison_arbiter.damage = 0
tweak_data.projectiles.launcher_poison_arbiter.player_damage = 0
tweak_data.projectiles.launcher_poison_arbiter.curve_pow = 0
tweak_data.projectiles.launcher_poison_arbiter.range = 0
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_range = 600
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_duration = 8
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_dot_data_name = "proj_launcher_arbiter_cloud"

--SABR Grenade Launcher.
tweak_data.projectiles.launcher_frag_osipr = {
	damage = 60,
	launch_speed = 2500,
	curve_pow = 0.75,
	player_damage = 30,
	range = 300,
	init_timer = nil,
	mass_look_up_modifier = 0,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag",
	effect_name = "effects/payday2/particles/explosions/shapecharger_explosion"
}
tweak_data.projectiles.launcher_incendiary_osipr = {
	damage = 4,
	launch_speed = 2500,
	curve_pow = 0.75,
	player_damage = 2,
	dot_data_name = "proj_launcher_incendiary_arbiter",
	range = 350,
	init_timer = nil,
	mass_look_up_modifier = 0,
	sound_event = "gl_explode",
	sound_event_impact_duration = 0.25,
	name_id = "bm_launcher_incendiary",
	burn_duration = 5,
	burn_tick_period = 0.5
}
tweak_data.projectiles.launcher_electric_osipr = {
	damage = 30,
	launch_speed = 2500,
	curve_pow = 0.75,
	player_damage = 15,
	range = 300,
	init_timer = nil,
	mass_look_up_modifier = 0,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag"
}
tweak_data.projectiles.launcher_poison_osipr = {
	launch_speed = 2500,
	init_timer = 2.5,
	mass_look_up_modifier = 0,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag",
	damage = 0,
	player_damage = 0,
	curve_pow = 0,
	range = 0,
	poison_gas_range = 600,
	poison_gas_duration = 8,
	poison_gas_fade_time = 0.1,
	poison_gas_tick_time = 0.3,
	poison_gas_dot_data_name = "proj_launcher_arbiter_cloud"
}

--3GL
tweak_data.projectiles.launcher_frag_ms3gl.damage = 36
tweak_data.projectiles.launcher_frag_ms3gl.player_damage = 18
tweak_data.projectiles.launcher_frag_ms3gl.curve_pow = 1
tweak_data.projectiles.launcher_frag_ms3gl.range = 500
tweak_data.projectiles.launcher_incendiary_ms3gl.damage = 2
tweak_data.projectiles.launcher_incendiary_ms3gl.player_damage = 1
tweak_data.projectiles.launcher_incendiary_ms3gl.burn_duration = 5
tweak_data.projectiles.launcher_incendiary_ms3gl.dot_data_name = "proj_launcher_incendiary_3gl"
tweak_data.projectiles.launcher_electric_ms3gl.damage = 18
tweak_data.projectiles.launcher_electric_ms3gl.player_damage = 6
tweak_data.projectiles.launcher_electric_ms3gl.curve_pow = 1
tweak_data.projectiles.launcher_electric_ms3gl.range = 500
tweak_data.projectiles.launcher_poison.damage = 0
tweak_data.projectiles.launcher_poison.player_damage = 0
tweak_data.projectiles.launcher_poison.curve_pow = 0
tweak_data.projectiles.launcher_poison.range = 0
tweak_data.projectiles.launcher_poison.poison_gas_range = 600
tweak_data.projectiles.launcher_poison.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison.poison_gas_dot_data_name = "proj_launcher_3gl_cloud"

--Gee 3GL, why do you get to have 2 poison grenades? ( except now you don't :^) )
--In the event you somehow manage to keep this "attached" via the exclusive kit
tweak_data.projectiles.launcher_poison_ms3gl_conversion.damage = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.player_damage = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.curve_pow = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.range = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_range = 600
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_dot_data_name = "proj_launcher_3gl_cloud"

--Plainsrider--
tweak_data.projectiles.west_arrow.damage = 24
tweak_data.projectiles.west_arrow_exp.damage = 48
tweak_data.projectiles.bow_poison_arrow.damage = 18

--Hunter crossbow--
tweak_data.projectiles.crossbow_arrow.damage = 24
tweak_data.projectiles.crossbow_arrow_exp.damage = 36
tweak_data.projectiles.crossbow_poison_arrow.damage = 18

--Arblast Heavy Crossbow--
tweak_data.projectiles.arblast_arrow.damage = 36
tweak_data.projectiles.arblast_arrow_exp.damage = 60
tweak_data.projectiles.arblast_poison_arrow.damage = 24

--Franken fish--
tweak_data.projectiles.frankish_arrow.damage = 24
tweak_data.projectiles.frankish_arrow_exp.damage = 48
tweak_data.projectiles.frankish_poison_arrow.damage = 18

--BOWMEN, FORM UP--
tweak_data.projectiles.long_arrow.damage = 36
tweak_data.projectiles.long_arrow_exp.damage = 60
tweak_data.projectiles.long_poison_arrow.damage = 24

--le happy merchant--
tweak_data.projectiles.ecp_arrow.damage = 18
tweak_data.projectiles.ecp_arrow_exp.damage = 36
tweak_data.projectiles.ecp_arrow_poison.damage = 12

--The not longbow--
tweak_data.projectiles.elastic_arrow.damage = 36
tweak_data.projectiles.elastic_arrow_exp.damage = 60
tweak_data.projectiles.elastic_arrow_poison.damage = 24

--GRENADE OUT--
tweak_data.projectiles.frag.damage = 80
tweak_data.projectiles.frag.player_damage = 40
tweak_data.projectiles.frag.curve_pow = 0.5
tweak_data.projectiles.frag.range = 500

--Dynamite--
tweak_data.projectiles.dynamite.damage = 80
tweak_data.projectiles.dynamite.player_damage = 40
tweak_data.projectiles.dynamite.curve_pow = 0.5
tweak_data.projectiles.dynamite.range = 400

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

--SEEEEEEMTEEEEEEEEEEX
tweak_data.projectiles.sticky_grenade.damage = 80
tweak_data.projectiles.sticky_grenade.player_damage = 40
tweak_data.projectiles.sticky_grenade.curve_pow = 0.5
tweak_data.projectiles.sticky_grenade.range = 400
tweak_data.projectiles.sticky_grenade.in_air_timer = 3
tweak_data.projectiles.sticky_grenade.detonate_timer = 3 --unused
tweak_data.projectiles.sticky_grenade.warning_data = {
	play_when_attached = true,
	beep_speeds = {
		0.1,
		0.025
	},
	sound_data = {
		event_name = "grenade_sticky_beep",
		event_stop_name = "grenade_sticky_beep_stop"
	},
	light_data = {
		type_str = "omni|specular",
		range = 1250,
		beep_mul = 0.2,
		falloff_exp = 0.5,
		beep_fade_speed = 3.5,
		specular_mul = 0.05,
		link_to_unit = true,
		color = Vector3(255, 255, 0)
	}
}

--Molliest of tovs--
tweak_data.projectiles.molotov.range = 300
tweak_data.projectiles.molotov.damage = 3.0
tweak_data.projectiles.molotov.player_damage = 3.0
tweak_data.projectiles.molotov.burn_duration = 10
tweak_data.projectiles.molotov.dot_data_name = "proj_molotov"

--Incendiary Nades, idea to make em a mollie--
tweak_data.projectiles.fir_com.range = 450
tweak_data.projectiles.fir_com.damage = 3.0
tweak_data.projectiles.fir_com.player_damage = 3.0
tweak_data.projectiles.fir_com.burn_duration = 12
tweak_data.projectiles.fir_com.dot_data_name = "proj_fire_com"

--Throwing Card--
tweak_data.projectiles.wpn_prj_ace.damage = 24
tweak_data.projectiles.wpn_prj_ace.adjust_z = 0

--Shuriken
tweak_data.projectiles.wpn_prj_four.damage = 20
tweak_data.projectiles.wpn_prj_four.adjust_z = 0

--Throwing Knife--
tweak_data.projectiles.wpn_prj_target.damage = 24
tweak_data.projectiles.wpn_prj_target.adjust_z = 0

--Javelin--
tweak_data.projectiles.wpn_prj_jav.damage = 36
tweak_data.projectiles.wpn_prj_jav.adjust_z = 0

--Throwing axe--
tweak_data.projectiles.wpn_prj_hur.damage = 36
tweak_data.projectiles.wpn_prj_hur.adjust_z = 0

--Balled Snow--
if tweak_data.projectiles.xmas_snowball then
	tweak_data.projectiles.xmas_snowball.damage = 18
	tweak_data.projectiles.xmas_snowball.player_dmg_mul = 0
	tweak_data.projectiles.xmas_snowball.camera_shake_max_mul = 0
	tweak_data.projectiles.xmas_snowball.feedback_range = -100
	tweak_data.projectiles.xmas_snowball.curve_pow = 0.05
	tweak_data.projectiles.xmas_snowball.range = 100
	tweak_data.projectiles.xmas_snowball.adjust_z = 0
end

--ZAPper grenade
tweak_data.projectiles.wpn_gre_electric.damage = 40
tweak_data.projectiles.wpn_gre_electric.player_damage = 20
tweak_data.projectiles.wpn_gre_electric.curve_pow = 0.5
tweak_data.projectiles.wpn_gre_electric.range = 500

--Viper Gas
tweak_data.projectiles.poison_gas_grenade.damage = 0
tweak_data.projectiles.poison_gas_grenade.player_damage = 0
tweak_data.projectiles.poison_gas_grenade.curve_pow = 0
tweak_data.projectiles.poison_gas_grenade.range = 0
tweak_data.projectiles.poison_gas_grenade.name_id = "bm_poison_gas_grenade"
tweak_data.projectiles.poison_gas_grenade.poison_gas_range = 600
tweak_data.projectiles.poison_gas_grenade.poison_gas_duration = 12
tweak_data.projectiles.poison_gas_grenade.poison_gas_fade_time = 0.1
tweak_data.projectiles.poison_gas_grenade.poison_gas_tick_time = 0.3
tweak_data.projectiles.poison_gas_grenade.poison_gas_dot_data_name = "proj_gas_grenade_cloud"
--[[
tweak_data.dot_types.poison = {
	damage_class = "PoisonBulletBase",
	dot_length = 4.1,
	dot_damage = 1.5,
	hurt_animation_chance = 0.5
}

tweak_data.dot_types.bleed = {
	damage_class = "BleedBulletBase",
	dot_length = 3.1,
	dot_damage = 2,
	hurt_animation_chance = 0
}
]]--

--Fire!
tweak_data.fire.effects.money_short = {
	expensive = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
	cheap = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
	normal = "effects/payday2/particles/explosions/sparkle_enemies_11sec"
}
tweak_data.fire.effects.money_endless = {
	expensive = "effects/payday2/particles/explosions/sparkle_enemies",
	cheap = "effects/payday2/particles/explosions/sparkle_enemies",
	normal = "effects/payday2/particles/explosions/sparkle_enemies"
}

--Stun nades--
tweak_data.projectiles.concussion.damage = 0
tweak_data.projectiles.concussion.curve_pow = 0.8
tweak_data.projectiles.concussion.range = 1000
tweak_data.projectiles.concussion.duration = {min = 7.5, additional = 0}

--Had to include this in here due to some BS with it being in upgradestweakdata
tweak_data.upgrades.values.player.health_multiplier = {1.1, 1.25}
tweak_data.upgrades.values.trip_mine.quantity = {3, 6}
tweak_data.upgrades.values.shape_charge.quantity = {2, 4}
tweak_data.upgrades.values.weapon.swap_speed_multiplier = {1.15}

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

tweak_data.narrative.jobs["chill_combat"].contact = "bain"	
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
tweak_data.projectiles.smoke_screen_grenade.accuracy_roll_chance = 0.75
tweak_data.projectiles.smoke_screen_grenade.accuracy_fail_spread = {5, 10}

--Bravo grenades.
tweak_data.projectiles.bravo_frag = {
	name_id = "bm_bravo_frag",
	damage = 15.0, --150 damage at point blank.
	player_damage = 15.0,
	curve_pow = 0.1,
	range = 500
}

--Spring Cluster Grenades.
tweak_data.projectiles.cluster_fuck = {
	name_id = "bm_cluster_fuck",
	damage = 15.0, --150 damage at point blank.
	player_damage = 15.0,
	curve_pow = 0.1,
	range = 500,
	cluster = "child_grenade",
	cluster_count = 3
}

tweak_data.projectiles.child_grenade = {
	name_id = "bm_child_grenade",
	init_timer = 1,
	damage = 10.0, --100 damage at point blank.
	player_damage = 10.0,
	curve_pow = 0.1,
	range = 500,
	launch_speed = 100
}

if difficulty_index <= 4 then --Enemy grenades deal reduced damage on lower difficulties.
	tweak_data.projectiles.bravo_frag.damage = 9.0
	tweak_data.projectiles.bravo_frag.player_damage = 9.0
	tweak_data.projectiles.cluster_fuck.damage = 9.0
	tweak_data.projectiles.cluster_fuck.player_damage = 9.0
	tweak_data.projectiles.cluster_fuck.cluster_count = 2
	tweak_data.projectiles.child_grenade.damage = 6.0
	tweak_data.projectiles.child_grenade.player_damage = 6.0
end

local velocity = {
	'launcher_frag','launcher_incendiary','launcher_electric','launcher_poison_gre_m79', --M79
	'launcher_frag_china','launcher_incendiary_china','launcher_electric_china', 'launcher_poison_china', --China Lake
	'launcher_frag_m32','launcher_incendiary_m32','launcher_electric_m32', 'launcher_poison_m32', --M32
	'launcher_m203','underbarrel_electric','launcher_poison_contraband', --HK417 UGL
	'underbarrel_m203_groza','underbarrel_electric_groza','launcher_poison_groza', -- Groza UGL
	'launcher_frag_slap','launcher_incendiary_slap','launcher_electric_slap','launcher_poison_slap', --M320
	'launcher_frag_ms3gl','launcher_incendiary_ms3gl','launcher_electric_ms3gl','launcher_poison_ms3gl_conversion','launcher_poison', --3GL
}
local velocity_mult = 0.25
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 7500 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = 0
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
tweak_data.projectiles.rocket_ray_frag.launch_speed = 11500 * velocity_mult

velocity = {
	'launcher_frag_arbiter','launcher_incendiary_arbiter','launcher_electric_arbiter','launcher_poison_arbiter',
	'launcher_frag_osipr','launcher_incendiary_osipr','launcher_electric_osipr'
}
velocity_mult = 0.4
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 21000 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = 0
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
tweak_data.projectiles.rocket_frag.launch_speed = 30000 * velocity_mult

velocity_mult = 0.8
velocity = {
	'west_arrow',
	'crossbow_arrow',
	'frankish_arrow'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 3500 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
	velocity = {
		'bow_poison_arrow',
		'crossbow_poison_arrow',
		'frankish_poison_arrow'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 3500 * velocity_mult * 0.85
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
	velocity = {
		'west_arrow_exp',
		'crossbow_arrow_exp',
		'frankish_arrow_exp'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 3500 * velocity_mult * 0.45
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end

velocity = {
	'long_arrow',
	'arblast_arrow'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 6500 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
	velocity = {
		'long_poison_arrow',
		'arblast_poison_arrow'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 6500 * velocity_mult * 0.85
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
	velocity = {
		'long_arrow_exp',
		'arblast_arrow_exp'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 6500 * velocity_mult * 0.45
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end

velocity = {
	'elastic_arrow',
	'ecp_arrow'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 9500 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
	velocity = {
		'elastic_arrow_poison',
		'ecp_arrow_poison'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 9500 * velocity_mult * 0.85
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
	velocity = {
		'elastic_arrow_exp',
		'ecp_arrow_exp'
	}
	for i, proj_id in ipairs(velocity) do
		tweak_data.projectiles[proj_id].launch_speed = 9500 * velocity_mult * 0.45
		tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end

velocity = {
	'frag','frag_com','dada_com','fir_com','wpn_gre_electric','concussion','poison_gas_grenade','sticky_grenade',
	'dynamite','molotov'
}
--[[
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 900
	tweak_data.projectiles[proj_id].adjust_z = 50
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
tweak_data.projectiles.dynamite.launch_speed = 600
tweak_data.projectiles.molotov.launch_speed = 700
--]]
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 250
	tweak_data.projectiles[proj_id].adjust_z = 15
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 3.25
end
tweak_data.projectiles.dynamite.launch_speed = 150
tweak_data.projectiles.sticky_grenade.launch_speed = 225
tweak_data.projectiles.molotov.launch_speed = 200
velocity = {
	'wpn_prj_ace','wpn_prj_four',
}
for i, proj_id in ipairs(velocity) do
	if tweak_data.projectiles[proj_id] then
		tweak_data.projectiles[proj_id].launch_speed = 1500
		tweak_data.projectiles[proj_id].adjust_z = 50
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
end
velocity = {
	'wpn_prj_target'
}
for i, proj_id in ipairs(velocity) do
	if tweak_data.projectiles[proj_id] then
		tweak_data.projectiles[proj_id].launch_speed = 2500
		tweak_data.projectiles[proj_id].adjust_z = 50
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
end
velocity = {
	'wpn_prj_hur'
}
for i, proj_id in ipairs(velocity) do
	if tweak_data.projectiles[proj_id] then
		tweak_data.projectiles[proj_id].launch_speed = 1800
		tweak_data.projectiles[proj_id].adjust_z = 50
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
end
velocity = {
	'wpn_prj_jav'
}
for i, proj_id in ipairs(velocity) do
	if tweak_data.projectiles[proj_id] then
		tweak_data.projectiles[proj_id].launch_speed = 2500
		tweak_data.projectiles[proj_id].adjust_z = 50
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
end
velocity = {
	'xmas_snowball'
}
for i, proj_id in ipairs(velocity) do
	if tweak_data.projectiles[proj_id] then
		tweak_data.projectiles[proj_id].launch_speed = 1000
		tweak_data.projectiles[proj_id].adjust_z = 50
		tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
	end
end

--Hatman Molotov
tweak_data.projectiles.hatman_molotov = {}
tweak_data.projectiles.hatman_molotov.range = 300
tweak_data.projectiles.hatman_molotov.damage = 6.0
tweak_data.projectiles.hatman_molotov.player_damage = 6.0
tweak_data.projectiles.hatman_molotov.env_effect = "hatman_molotov_fire"

--But why--
tweak_data.team_ai.stop_action.delay = 0.8
tweak_data.team_ai.stop_action.distance = 9999999999999999999999999999999999

--Mutator tweak vars, makes it easier to toggle stuff on/off as needed
tweak_data.disable_shotgun_push = false

tweak_data.medic.cooldown = 0
tweak_data.medic.radius = 900
tweak_data.medic.lpf_radius = 800

--ASU damage bonus (Titan HRT)
tweak_data.asu_buff_radius = 800
if difficulty_index <= 6 then
	tweak_data.asu_damage_buff = 10
elseif difficulty_index == 5 then
	tweak_data.asu_damage_buff = 15
else
	tweak_data.asu_damage_buff = 20
end	

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
	tweak_data.experience_manager.pro_job_new = 1.2
end

local dyslexia = { --for reference, I actually am diagnosed with Dyslexia
	[1] = {
		primaries = {
			{ "pistol" },

			{ "lmg" },

			{ "shotgun" },

			{ "assault_rifle" },

			{ "wpn_special" }
		},
		secondaries = {
			{ "pistol" },

			{ "lmg" },

			{ "shotgun" },

			{ "assault_rifle" },

			{ "wpn_special" }
		}
	},
	[2] = {
		primaries = {},
		secondaries = {}
	}
}

if restoration.Options:GetValue("OTHER/WpnCat") == 1 then
	for i, weap in pairs(tweak_data.weapon) do
		local is_secondary = weap.use_data and weap.use_data.selection_index and weap.use_data.selection_index == 2
		if is_secondary and weap.recategorize and weap.recategorize[1] == "unsupported" then
			table.insert(dyslexia[1].primaries, { "unsupported" })
			break
		end
	end
	for i, weap in pairs(tweak_data.weapon) do
		local is_secondary = weap.use_data and weap.use_data.selection_index and weap.use_data.selection_index == 1
		if is_secondary and weap.recategorize and weap.recategorize[1] == "unsupported" then
			table.insert(dyslexia[1].secondaries, { "unsupported" })
			break
		end
	end
elseif restoration.Options:GetValue("OTHER/WpnCat") == 2 then
	--PRIMARIES
	table.insert(dyslexia[2].primaries, { "light_pis" })
	table.insert(dyslexia[2].primaries, { "heavy_pis" })	
	table.insert(dyslexia[2].primaries, { "light_smg" })
	table.insert(dyslexia[2].primaries, { "heavy_smg" })
	table.insert(dyslexia[2].primaries, { "light_shot" })
	table.insert(dyslexia[2].primaries, { "heavy_shot" })
	table.insert(dyslexia[2].primaries, { "break_shot" })	
	table.insert(dyslexia[2].primaries, { "light_ar" })
	table.insert(dyslexia[2].primaries, { "heavy_ar" })
	table.insert(dyslexia[2].primaries, { "dmr_ar" })
	table.insert(dyslexia[2].primaries, { "light_snp" })
	table.insert(dyslexia[2].primaries, { "heavy_snp" })
	table.insert(dyslexia[2].primaries, { "antim_snp" })		
	table.insert(dyslexia[2].primaries, { "light_mg" })
	table.insert(dyslexia[2].primaries, { "heavy_mg" })
	table.insert(dyslexia[2].primaries, { "miniguns" })
	table.insert(dyslexia[2].primaries, { "wpn_special" })
	for i, weap in pairs(tweak_data.weapon) do
		local is_secondary = weap.use_data and weap.use_data.selection_index and weap.use_data.selection_index == 2
		if is_secondary and weap.recategorize and weap.recategorize[1] == "unsupported" then
			table.insert(dyslexia[2].primaries, { "unsupported" })
			break
		end
	end
	--SECONDARIES
	table.insert(dyslexia[2].secondaries, { "light_pis" })
	table.insert(dyslexia[2].secondaries, { "heavy_pis" })
	table.insert(dyslexia[2].secondaries, { "light_smg" })
	table.insert(dyslexia[2].secondaries, { "heavy_smg" })
	table.insert(dyslexia[2].secondaries, { "light_shot" })
	table.insert(dyslexia[2].secondaries, { "heavy_shot" })
	table.insert(dyslexia[2].secondaries, { "break_shot" })
	table.insert(dyslexia[2].secondaries, { "light_ar" })
	table.insert(dyslexia[2].secondaries, { "heavy_ar" })
	for i, weap in pairs(tweak_data.weapon) do
		local is_secondary = weap.use_data and weap.use_data.selection_index and weap.use_data.selection_index == 1
		if is_secondary and weap.recategorize and weap.recategorize[1] == "dmr_ar" then
			table.insert(dyslexia[2].secondaries, { "dmr_ar" })
			break
		end
	end
	table.insert(dyslexia[2].secondaries, { "light_snp" })
	table.insert(dyslexia[2].secondaries, { "heavy_snp" })
	table.insert(dyslexia[2].secondaries, { "wpn_special" })
	for i, weap in pairs(tweak_data.weapon) do
		local is_secondary = weap.use_data and weap.use_data.selection_index and weap.use_data.selection_index == 1
		if is_secondary and weap.recategorize and weap.recategorize[1] == "unsupported" then
			table.insert(dyslexia[2].secondaries, { "unsupported" })
			break
		end
	end
end

tweak_data.gui.buy_weapon_categories = dyslexia[restoration.Options:GetValue("OTHER/WpnCat") or 1]


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

local twp = tweak_data.player
local pivot_shoulder_translation
local pivot_shoulder_rotation
local pivot_head_translation
local pivot_head_rotation
--Can't get this shit to work in PlayerTweakData
if twp.stances.m6d then
	pivot_shoulder_translation = Vector3(8.47169, 40.6363, -2.73086)
	pivot_shoulder_rotation = Rotation(0.100026, -0.68821, 0.629665)
	pivot_head_translation = Vector3(4.5, 28, -6.25)
	pivot_head_rotation = Rotation(0, 0, 0)
	twp.stances.m6d.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.m6d.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(-0.02, 35, 0.25)
	pivot_head_rotation = Rotation(0, 0.5, 0)
	twp.stances.m6d.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.m6d.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(4.25, 26, -6.25)
	pivot_head_rotation = Rotation(0, 0, 0)
	twp.stances.m6d.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.m6d.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

if twp.stances.papa320 then
	pivot_shoulder_translation = Vector3(8.45416, 39.1301, -4.58611)
	pivot_shoulder_rotation = Rotation(0.100083, -0.688408, 0.630516)
	pivot_head_translation = Vector3(1.5, 28, -5)
	pivot_head_rotation = Rotation(0, 0.2, -6)
	twp.stances.papa320.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.papa320.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0.2, 25, -5)
	pivot_head_rotation = Rotation(0, 0.2, -10)
	twp.stances.papa320.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.papa320.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 37, -0.2)
	pivot_head_rotation = Rotation(0, 0, 0)
	twp.stances.papa320.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	twp.stances.papa320.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end


local twf = tweak_data.weapon.factory --ugly fuckin fix but I just could not get this to work otherwise
function WeaponFactoryTweakData:_clone_part_type_for_weapon_resmod(part_type, factory_id, amount)
	local factory_data = twf[factory_id]
	local parts = {}
	local part_data = nil

	for _, part_id in ipairs(factory_data.uses_parts) do
		part_data = twf.parts[part_id]

		if part_data.type and part_data.type == part_type then
			table.insert(parts, part_id)
		end
	end

	for _, part_id in ipairs(parts) do
		twf:_clone_part_for_weapon(part_id, factory_id, amount)
	end
end
twf:_clone_part_type_for_weapon_resmod("barrel_ext", "wpn_fps_ass_tkb", 2)

if BeardLib then
	local modded_perk_deck = false
	--Global perk deck cards
		local deck2 = {
			upgrades = {
				"weapon_passive_headshot_damage_multiplier",
				"weapon_passive_damage_multiplier_1",
				"player_non_special_melee_multiplier_1", --This bonus doesn't actually do anything, but it is what's displayed in menus.
				"player_melee_damage_multiplier_1"
			},
			cost = 0,
			icon_xy = {1, 0},
			name_id = "menu_deckall_2",
			desc_id = "menu_deckall_2_desc_sc"
		}
		local deck4 = {
			upgrades = {
				"passive_player_xp_multiplier_1",
				"player_passive_suspicion_bonus",
				"player_passive_armor_movement_penalty_multiplier",
				"weapon_passive_damage_multiplier_2",
				"player_non_special_melee_multiplier_2",
				"player_melee_damage_multiplier_2"			
			},
			cost = 0,
			icon_xy = {3, 0},
			name_id = "menu_deckall_4",
			desc_id = "menu_deckall_4_desc_sc"
		}
		local deck6 = {
			upgrades = {
				"armor_kit",
				"weapon_passive_damage_multiplier_3",
				"player_non_special_melee_multiplier_3",
				"player_melee_damage_multiplier_3"			
			},
			cost = 0,
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
			cost = 0,
			icon_xy = {7, 0},
			name_id = "menu_deckall_8",
			desc_id = "menu_deckall_8_desc_sc"
		}

	if BeardLib.Utils:FindMod("Mercenary Perk Deck") then
		modded_perk_deck = true
		local kmerc_deck = {
			name_id = "menu_deck_kmerc_title",
			desc_id = "menu_deck_kmerc_desc",
			category = {
				"mod"
			},
			{
				name_id = "menu_deck_kmerc_1",
				desc_id = "menu_deck_kmerc_1_desc_sc",
				cost = 0,
				upgrades = {
					"player_kmerc_reactive_absorption",
					"player_kmerc_passive_health_multiplier_1"
				},
				texture_bundle_folder = "kmerc",
				icon_xy = {
					0,
					0
				}
			},
			deck2,
			{
				name_id = "menu_deck_kmerc_3",
				desc_id = "menu_deck_kmerc_3_desc_sc",
				cost = 0,
				upgrades = {
					"player_kmerc_reload_speed_bonus_per_max_armor",
					"player_kmerc_swap_speed_bonus_per_max_armor",
					"player_tier_armor_multiplier_1"
				},
				texture_bundle_folder = "kmerc",
				icon_xy = {1,0}
			},
			deck4,
			{
				name_id = "menu_deck_kmerc_5",
				desc_id = "menu_deck_kmerc_5_desc_sc",
				cost = 0,
				upgrades = {
					"player_kmerc_fatal_triggers_invuln",
					"player_kmerc_passive_health_multiplier_2"
				},
				texture_bundle_folder = "kmerc",
				icon_xy = {
					2,
					0
				}
			},
			deck6,
			{
				name_id = "menu_deck_kmerc_7",
				desc_id = "menu_deck_kmerc_7_desc_sc",
				cost = 0,
				upgrades = {
					"player_kmerc_armored_hot"
				},
				texture_bundle_folder = "kmerc",
				icon_xy = {
					3,
					0
				}
			},
			deck8,
			{
				name_id = "menu_deck_kmerc_9",
				desc_id = "menu_deck_kmerc_9_desc_sc",
				cost = 0,
				upgrades = {
					"player_kmerc_bloody_armor"
				},
				texture_bundle_folder = "kmerc",
				icon_xy = {
					0,
					1
				}
			}
		}	

		for i, k in pairs(tweak_data.skilltree.specializations) do 
			if tweak_data.skilltree.specializations[i].name_id and tweak_data.skilltree.specializations[i].name_id == "menu_deck_kmerc_title" then
				tweak_data.skilltree.specializations[i] = kmerc_deck
			end
		end
	end
	if BeardLib.Utils:FindMod("Liberator Perk Deck") then
		modded_perk_deck = true
		local silence_deck = {
			name_id = "menu_deck_liberator_title",
			desc_id = "menu_deck_liberator_desc",
			category = {
				"mod",
				"activated"
			},
			{
				upgrades = {
					"tachi", --unlocks throwable
					"player_tachi_base", --base throwable stats (number of charges, cooldown speed etc)
					"player_tachi_restore_health_1",
					"player_tachi_restore_stamina_1",
					"player_tachi_hot_amount_1",
					"player_tachi_hot_duration_1"
				},
				cost = 0,
				icon_xy = {0, 0},
				texture_bundle_folder = "liberator",
				name_id = "menu_deck_liberator_1",
				desc_id = "menu_deck_liberator_1_desc_sc"
			},
			deck2,
			{
				upgrades = {
					"player_tachi_hot_duration_2",
					"player_tachi_hot_cancelled_damage_resistance_consolation"
				},
				cost = 0,
				icon_xy = {1,0},
				texture_bundle_folder = "liberator",
				name_id = "menu_deck_liberator_3",
				desc_id = "menu_deck_liberator_3_desc_sc"
			},
			deck4,
			{
				upgrades = {
					"player_tachi_hot_amount_2",
					"player_tachi_restore_stamina_2",
					"player_passive_dodge_chance_1"
				},
				cost = 0,
				icon_xy = {2, 0},
				texture_bundle_folder = "liberator",
				name_id = "menu_deck_liberator_5",
				desc_id = "menu_deck_liberator_5_desc_sc"
			},
			deck6,
			{
				upgrades = {
					"player_passive_health_multiplier_1",
					"player_passive_health_multiplier_2",
					"player_tachi_hot_duration_3"
				},
				cost = 0,
				icon_xy = {3, 0},
				texture_bundle_folder = "liberator",
				name_id = "menu_deck_liberator_7",
				desc_id = "menu_deck_liberator_7_desc_sc"
			},
			deck8,
			{
				upgrades = {
					"player_tachi_hot_amount_3"
				},
				cost = 0,
				icon_xy = {0,1},
				texture_bundle_folder = "liberator",
				name_id = "menu_deck_liberator_9",
				desc_id = "menu_deck_liberator_9_desc_sc"
			}
		}

		for i, k in pairs(tweak_data.skilltree.specializations) do 
			if tweak_data.skilltree.specializations[i].name_id and tweak_data.skilltree.specializations[i].name_id == "menu_deck_liberator_title" then
				tweak_data.skilltree.specializations[i] = silence_deck
			end
		end

		tweak_data.blackmarket.projectiles.tachi = {
			name_id = "bm_tachi",
			desc_id = "bm_tachi_desc",
			ability = "tachi",
			custom = true,
			ignore_statistics = true,
			based_on = "chico_injector",
			texture_bundle_folder = "liberator",
			icon = "chico_injector",
			max_amount = 1,
			base_cooldown = 30,
			sounds = {
				activate = "perkdeck_activate",
				cooldown = "perkdeck_cooldown_over"
			}
		}
	end

	if modded_perk_deck then
		tweak_data.skilltree.specialization_category = {
			{
				name_id = "menu_st_category_all",
				category = "all"
			},
			{
				name_id = "menu_st_category_offensive",
				category = "offensive"
			},
			{
				name_id = "menu_st_category_defensive",
				category = "defensive"
			},
			{
				name_id = "menu_st_category_supportive",
				category = "supportive"
			},
			{
				name_id = "menu_st_category_activated",
				category = "activated"
			},
			{
				name_id = "menu_st_category_challenge",
				category = "challenge"
			},
			{
				name_id = "menu_st_category_mod",
				category = "mod"
			},
			{
				name_id = "menu_st_category_favorites",
				category = "favorites"
			}
		}
	end
end
