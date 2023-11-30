function FireTweakData:_init_dot_entries_fire(entries)
	local fire_entries = {}
	entries.fire = fire_entries
	fire_entries.default_fire = {
		PROCESSED = true,
		name = "default",
		dot_length = 6,
		dot_trigger_chance = 0.35,
		dot_trigger_max_distance = 3000,
		dot_grace_period = 1,
		variant = "fire",
		dot_damage = 13,
		damage_class = "FlameBulletBase",
		dot_tick_period = 0.5
	}
	fire_entries.weapon_kacchainsaw_flamethrower = {
		dot_trigger_chance = 0.5,
		dot_damage = 1.6,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}


	
	fire_entries.weapon_flamethrower_mk2 = {
		dot_trigger_chance = 0.5,
		dot_damage = 1.6,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_flamethrower_mk2_rare = {
		dot_trigger_chance = 0.75,
		dot_damage = 15,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_flamethrower_mk2_welldone = {
		dot_trigger_chance = 0.75,
		dot_damage = 25,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}

	--
	fire_entries.weapon_system = {
		dot_trigger_chance = 0.75,
		dot_damage = 15,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_low = {
		dot_trigger_chance = 0.75,
		dot_damage = 10,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_high = {
		dot_trigger_chance = 0.75,
		dot_damage = 20,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}

	--Money Thrower
	fire_entries.weapon_money = {
		dot_trigger_max_distance = false,
		dot_damage = 10,
		dot_length = 1,
		burn_sound_name = "no_sound",
		dot_trigger_chance = 0.75,
		fire_effect_variant = "endless_money"
	}

	--Dragons Breath
	fire_entries.ammo_dragons_breath_auto = {
		dot_trigger_chance = 0.3,
		dot_damage = 2.25,
		dot_length = 2.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_dragons_breath = {
		dot_trigger_chance = 0.4,
		dot_damage = 3,
		dot_length = 2.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_dragons_breath_pump = {
		dot_trigger_chance = 0.5,
		dot_damage = 4.5,
		dot_length = 2.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_dragons_breath_heavy = {
		dot_trigger_chance = 0.8,
		dot_damage = 6,
		dot_length = 2.1,
		dot_trigger_max_distance = false
	}

	fire_entries.melee_spoon_gold = {
		dot_trigger_chance = 0.2,
		dot_damage = 7,
		dot_length = 3,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov = {
		dot_trigger_chance = 1,
		dot_damage = 21,
		dot_length = 10,
		dot_trigger_max_distance = false,
		is_molotov = true
	}
	fire_entries.proj_launcher_incendiary = {
		dot_trigger_max_distance = false,
		dot_damage = 21,
		dot_trigger_chance = 1
	}
	fire_entries.proj_launcher_incendiary_arbiter = {
		dot_trigger_max_distance = false,
		dot_damage = 21,
		dot_length = 3,
		dot_trigger_chance = 1
	}
	fire_entries.proj_fire_com = {
		dot_trigger_chance = 1,
		dot_damage = 21,
		dot_length = 2,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov_groundfire = {
		is_molotov = true,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_groundfire = {
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_arbiter_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.equipment_tripmine_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_triad_boss_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_mutator_cloaker_groundfire = {
		dot_trigger_max_distance = false
	}
end