function EnvEffectTweakData:molotov_fire()
	local params = {
		damage = 3,
		player_damage = 3,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 10,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "molotov_impact",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 15000,
		fire_alert_radius = 15000,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}
	return params
end

function EnvEffectTweakData:incendiary_burst_fire()
	local params = {
		damage = 3,
		player_damage = 3,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 10,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "white_explosion",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 15000,
		fire_alert_radius = 15000,
		effect_name = "effects/payday2/particles/explosions/grenade_incendiary_explosion_sc"
	}
	return params
end	

function EnvEffectTweakData:trip_mine_fire()
	local params = {
		damage = 4,
		player_damage = 4,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 10,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "molotov_impact",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 15000,
		fire_alert_radius = 15000,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}
	return params
end

function EnvEffectTweakData:incendiary_fire()
	local params = {
		damage = 3,
		player_damage = 3,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 5,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "gl_explode",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 1500,
		fire_alert_radius = 1500,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}
	return params
end

function EnvEffectTweakData:incendiary_fire_arbiter()
	local params = {
		damage = 2,
		player_damage = 2,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 5,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "gl_explode",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 1500,
		fire_alert_radius = 1500,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}
	return params
end