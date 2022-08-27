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
--TODO: Move to stat_info
tweak_data.pistol = {
	swap_bonus = 1.75,
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
	ads_move_speed_mult = 0.45
}
	tweak_data.crossbow_pistol = {
		ads_move_speed_mult = 1.7777,
		swap_bonus = 1.75
	}

tweak_data.grenade_launcher = {
	ads_move_speed_mult = 0.45,
}
	tweak_data.gl_pistol = {
		ads_move_speed_mult = 1.7777,
		swap_bonus = 1.75
	}
	tweak_data.rocket_launcher = {
		ads_move_speed_mult = 0.5,
	}

tweak_data.shotgun = {
	ads_move_speed_mult = 0.6,
}
	tweak_data.shotgun_pistol = {
		ads_move_speed_mult = 1.3333,
		swap_bonus = 1.75
	}
	tweak_data.flamethrower = {
		ads_move_speed_mult = 1,
	}

tweak_data.smg = {
	swap_bonus = 1.25,
	ads_move_speed_mult = 0.7,
	moving_spread_mult = 0.6,
	hipfire_spread_mult = 0.9
}
	tweak_data.pdw = {
		ads_move_speed_mult = 0.6428,
	}
	tweak_data.lmg = {
		swap_bonus = 0.8,
		ads_move_speed_mult = 0.55,
		moving_spread_mult = 5,
		hipfire_spread_mult = 4.4444
	}
		tweak_data.wolf_brigade = {
			hipfire_spread_mult = 0.5
		}
	tweak_data.minigun = {
		swap_bonus = 0.8,
		ads_move_speed_mult = 0.55,
		moving_spread_mult = 5,
		hipfire_spread_mult = 4.4444
	}

tweak_data.snp = {
	swap_bonus = 1,
	ads_move_speed_mult = 0.45,
	hipfire_moving_spread_mult = 2
}
	tweak_data.semi_snp = {
		hipfire_spread_mult = 1.5,
		hipfire_moving_spread_mult = 1.5
	}

tweak_data.assault_rifle = {
	swap_bonus = 1,
	ads_move_speed_mult = 0.45
}
	tweak_data.crb = {
		swap_bonus = 1.1,
		ads_move_speed_mult = 1.111111
	}
	tweak_data.dmr = {
		hipfire_spread_mult = 1.5,
		hipfire_moving_spread_mult = 1.5
	}

tweak_data.akimbo = {
	swap_bonus = 0.8,
	ads_move_speed_mult = 0.75,
	hipfire_spread_mult = 1.5
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
tweak_data.projectiles.rocket_ray_frag.incendiary = {
	burn_duration = 10,
	damage = 3,
	player_damage = 1.5
}

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
	tweak_data.projectiles[proj_id].player_damage = 3
	tweak_data.projectiles[proj_id].burn_duration = 5
	tweak_data.projectiles[proj_id].fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 3000,
		dot_trigger_chance = 50,
		dot_length = 3.1,
		dot_tick_period = 0.5
	}
end

local electric_40mm = {
	'launcher_electric','launcher_electric_china','launcher_electric_m32','underbarrel_electric','underbarrel_electric_groza','launcher_incendiary_slap'
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
	tweak_data.projectiles[proj_id].poison_gas_duration = 16
	tweak_data.projectiles[proj_id].poison_gas_fade_time = 0.1
	tweak_data.projectiles[proj_id].poison_gas_tick_time = 0.3
	tweak_data.projectiles[proj_id].poison_gas_dot_data = {
		hurt_animation_chance = 1,
		dot_damage = 1.5,
		dot_length = 8.15,
		dot_tick_period = 0.5
	}
end

--Arbiter--
tweak_data.projectiles.launcher_frag_arbiter.damage = 60
tweak_data.projectiles.launcher_frag_arbiter.player_damage = 30
tweak_data.projectiles.launcher_frag_arbiter.range = 250
tweak_data.projectiles.launcher_frag_arbiter.curve_pow = 0.75
tweak_data.projectiles.launcher_frag_arbiter.init_timer = nil
tweak_data.projectiles.launcher_frag_arbiter.effect_name = "effects/payday2/particles/explosions/shapecharger_explosion"
tweak_data.projectiles.launcher_incendiary_arbiter.damage = 4
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
tweak_data.projectiles.launcher_electric_arbiter.damage = 30
tweak_data.projectiles.launcher_electric_arbiter.player_damage = 15
tweak_data.projectiles.launcher_electric_arbiter.range = 250
tweak_data.projectiles.launcher_electric_arbiter.curve_pow = 0.75
tweak_data.projectiles.launcher_electric_arbiter.init_timer = nil
tweak_data.projectiles.launcher_poison_arbiter.damage = 0
tweak_data.projectiles.launcher_poison_arbiter.player_damage = 0
tweak_data.projectiles.launcher_poison_arbiter.curve_pow = 0
tweak_data.projectiles.launcher_poison_arbiter.range = 0
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_range = 600
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_duration = 12
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_dot_data = {
	hurt_animation_chance = 1,
	dot_damage = 1.5,
	dot_length = 6.15,
	dot_tick_period = 0.5
}

--SABR Grenade Launcher.
tweak_data.projectiles.launcher_frag_osipr = {
	damage = 60,
	launch_speed = 2500,
	curve_pow = 0.75,
	player_damage = 30,
	range = 250,
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
	fire_dot_data = {
		dot_trigger_chance = 50,
		dot_damage = 1,
		dot_length = 3.1,
		dot_trigger_max_distance = 3000,
		dot_tick_period = 0.5
	},
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
	range = 250,
	init_timer = nil,
	mass_look_up_modifier = 0,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag"
}

--3GL
tweak_data.projectiles.launcher_frag_ms3gl.damage = 36
tweak_data.projectiles.launcher_frag_ms3gl.player_damage = 18
tweak_data.projectiles.launcher_frag_ms3gl.curve_pow = 1
tweak_data.projectiles.launcher_frag_ms3gl.range = 500
tweak_data.projectiles.launcher_incendiary_ms3gl.damage = 2
tweak_data.projectiles.launcher_incendiary_ms3gl.player_damage = 1
tweak_data.projectiles.launcher_incendiary_ms3gl.burn_duration = 5
tweak_data.projectiles.launcher_incendiary_ms3gl.fire_dot_data = {
	dot_damage = 1,
	dot_trigger_max_distance = 3000,
	dot_trigger_chance = 50,
	dot_length = 3.1,
	dot_tick_period = 0.5
}
tweak_data.projectiles.launcher_electric_ms3gl.damage = 18
tweak_data.projectiles.launcher_electric_ms3gl.player_damage = 6
tweak_data.projectiles.launcher_electric_ms3gl.curve_pow = 1
tweak_data.projectiles.launcher_electric_ms3gl.range = 500
tweak_data.projectiles.launcher_poison.damage = 0
tweak_data.projectiles.launcher_poison.player_damage = 0
tweak_data.projectiles.launcher_poison.curve_pow = 0
tweak_data.projectiles.launcher_poison.range = 0
tweak_data.projectiles.launcher_poison.poison_gas_range = 600
tweak_data.projectiles.launcher_poison.poison_gas_duration = 8
tweak_data.projectiles.launcher_poison.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison.poison_gas_dot_data = {
	hurt_animation_chance = 1,
	dot_damage = 1.5,
	dot_length = 4.15,
	dot_tick_period = 0.5
}
--Gee 3GL, why do you get to have 2 poison grenades? ( except now you don't :^) )
--In the event you somehow manage to keep this "attached" via the exclusive kit
tweak_data.projectiles.launcher_poison_ms3gl_conversion.damage = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.player_damage = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.curve_pow = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.range = 0
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_range = 600
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_duration = 8
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_fade_time = 0.1
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_tick_time = 0.3
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_dot_data = {
	hurt_animation_chance = 1,
	dot_damage = 1.5,
	dot_length = 4.1,
	dot_tick_period = 0.5
}

--Plainsrider--
tweak_data.projectiles.west_arrow.damage = 24
tweak_data.projectiles.west_arrow_exp.damage = 48
tweak_data.projectiles.bow_poison_arrow.damage = 20

--Hunter crossbow--
tweak_data.projectiles.crossbow_arrow.damage = 24
tweak_data.projectiles.crossbow_arrow_exp.damage = 48
tweak_data.projectiles.crossbow_poison_arrow.damage = 20

--Arblast Heavy Crossbow--
tweak_data.projectiles.arblast_arrow.damage = 36
tweak_data.projectiles.arblast_arrow_exp.damage = 60
tweak_data.projectiles.arblast_poison_arrow.damage = 30

--Franken fish--
tweak_data.projectiles.frankish_arrow.damage = 24
tweak_data.projectiles.frankish_arrow_exp.damage = 48
tweak_data.projectiles.frankish_poison_arrow.damage = 20

--BOWMEN, FORM UP--
tweak_data.projectiles.long_arrow.damage = 36
tweak_data.projectiles.long_arrow_exp.damage = 60
tweak_data.projectiles.long_poison_arrow.damage = 30

--le happy merchant--
tweak_data.projectiles.ecp_arrow.damage = 18
tweak_data.projectiles.ecp_arrow_exp.damage = 36
tweak_data.projectiles.ecp_arrow_poison.damage = 14

--The not longbow--
tweak_data.projectiles.elastic_arrow.damage = 36
tweak_data.projectiles.elastic_arrow_exp.damage = 60
tweak_data.projectiles.elastic_arrow_poison.damage = 30

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

--Molliest of tovs--
tweak_data.projectiles.molotov.damage = 3
tweak_data.projectiles.molotov.player_damage = 3
tweak_data.projectiles.molotov.burn_duration = 10

--Incendiary Nades, idea to make em a mollie--
tweak_data.projectiles.fir_com.damage = 6
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
tweak_data.projectiles.wpn_prj_ace.launch_speed = 1800
tweak_data.projectiles.wpn_prj_ace.adjust_z = 0

--Shuriken
tweak_data.projectiles.wpn_prj_four.damage = 20
tweak_data.projectiles.wpn_prj_four.launch_speed = 1800
tweak_data.projectiles.wpn_prj_four.adjust_z = 0

--Throwing Knife--
tweak_data.projectiles.wpn_prj_target.damage = 24
tweak_data.projectiles.wpn_prj_target.launch_speed = 1800
tweak_data.projectiles.wpn_prj_target.adjust_z = 0

--Javelin--
tweak_data.projectiles.wpn_prj_jav.damage = 36
tweak_data.projectiles.wpn_prj_jav.launch_speed = 1800
tweak_data.projectiles.wpn_prj_jav.adjust_z = 0

--Throwing axe--
tweak_data.projectiles.wpn_prj_hur.damage = 36
tweak_data.projectiles.wpn_prj_hur.launch_speed = 1800
tweak_data.projectiles.wpn_prj_hur.adjust_z = 0

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
tweak_data.projectiles.poison_gas_grenade.poison_gas_duration = 20
tweak_data.projectiles.poison_gas_grenade.poison_gas_fade_time = 0.1
tweak_data.projectiles.poison_gas_grenade.poison_gas_tick_time = 0.3
tweak_data.projectiles.poison_gas_grenade.poison_gas_dot_data = {
	hurt_animation_chance = 1,
	dot_damage = 1.5,
	dot_length = 10.15,
	dot_tick_period = 0.5
}

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

velocity_mult = 0.65
velocity = {
	'west_arrow','bow_poison_arrow','west_arrow_exp',
	'crossbow_arrow','crossbow_poison_arrow','crossbow_arrow_exp',
	'frankish_arrow','frankish_poison_arrow','frankish_arrow_exp'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 3800 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
velocity = {
	'long_arrow','long_poison_arrow','long_arrow_exp',
	'arblast_arrow','arblast_poison_arrow','arblast_arrow_exp'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 5500 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
velocity = {
	'elastic_arrow','elastic_arrow_poison','elastic_arrow_exp',
	'ecp_arrow','ecp_arrow_poison','ecp_arrow_exp'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 8000 * velocity_mult
	tweak_data.projectiles[proj_id].adjust_z = tweak_data.projectiles[proj_id].launch_speed / 100 * velocity_mult
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end

velocity = {
	'frag','frag_com','dada_com','fir_com','wpn_gre_electric','concussion','poison_gas_grenade',
	'dynamite','molotov'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].launch_speed = 900
	tweak_data.projectiles[proj_id].adjust_z = 50
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end
tweak_data.projectiles.molotov.launch_speed = 700
velocity = {
	'wpn_prj_ace','wpn_prj_four','wpn_prj_target',
	'wpn_prj_hur','wpn_prj_jav'
}
for i, proj_id in ipairs(velocity) do
	tweak_data.projectiles[proj_id].adjust_z = 50
	tweak_data.projectiles[proj_id].mass_look_up_modifier = 0
end




--Hatman Molotov
tweak_data.projectiles.hatman_molotov = {}
tweak_data.projectiles.hatman_molotov.env_effect = "hatman_molotov_fire"

--But why--
tweak_data.team_ai.stop_action.delay = 0.8
tweak_data.team_ai.stop_action.distance = 9999999999999999999999999999999999

--Mutator tweak vars, makes it easier to toggle stuff on/off as needed
tweak_data.disable_shotgun_push = false

tweak_data.medic.cooldown = 90
tweak_data.medic.radius = 400
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
	"headless_hatman",
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

tweak_data.money_manager.weapon_cost = {}
local cost = 42000
for i = 1, 10000, 1 do
	table.insert( tweak_data.money_manager.weapon_cost, tostring(cost) )
	cost = cost + 23000
end

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

			{ "smg" },

			{ "shotgun" },

			{ "assault_rifle" },

			{ "wpn_special" }
		},
		secondaries = {
			{ "pistol" },

			{ "smg" },

			{ "shotgun" },

			{ "assault_rifle" },

			{ "wpn_special" }
		}
	},
	[2] = {
		primaries = {
			{ "light_pis" },
			{ "heavy_pis" },
			
			{ "light_smg" },
			{ "heavy_smg" },

			{ "light_shot" },
			{ "heavy_shot" },
			{ "break_shot" },
			
			{ "light_ar" },
			{ "heavy_ar" },
			{ "dmr_ar" },

			{ "light_snp" },
			{ "heavy_snp" },
			{ "antim_snp" },
			
			{ "light_mg" },
			{ "heavy_mg" },
			{ "miniguns" },
		
			{ "wpn_special" }
		},
		secondaries = {
			{ "light_pis" },
			{ "heavy_pis" },
			
			{ "light_smg" },
			{ "heavy_smg" },
			
			{ "light_shot" },
			{ "heavy_shot" },
			{ "break_shot" },
			
			{ "light_ar" },
			{ "heavy_ar" },

			{ "light_snp" },
			
			{ "wpn_special" }
		}
	}
}

if restoration.Options:GetValue("OTHER/WpnCat") then
	tweak_data.gui.buy_weapon_categories = dyslexia[restoration.Options:GetValue("OTHER/WpnCat")]
end

--[[
	if SystemFS:exists("assets/mod_overrides/Marlin Model 1894 Custom/main.xml") or SystemFS:exists("assets/mod_overrides/Mosin Nagant M9130 Obrez/main.xml") then
		table.insert(tweak_data.gui.buy_weapon_categories.secondaries, {"snp"})
	end		

	if SystemFS:exists("assets/mod_overrides/Volmer HK51-B/main.xml") then
		table.insert(tweak_data.gui.buy_weapon_categories.secondaries, {"lmg"})
	end		
]]	

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
tweak_data.player.stances.r700.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.sbl.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.desertfox.steelsight.shakers.breathing.amplitude = 0
