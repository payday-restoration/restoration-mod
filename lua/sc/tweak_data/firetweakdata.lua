function FireTweakData:_init_dot_entries_fire(entries)
	local fire_entries = {}
	entries.fire = fire_entries
	fire_entries.default_fire = {
		PROCESSED = true,
		name = "default",
		dot_length = 3.1,
		dot_trigger_chance = 0.35,
		dot_trigger_max_distance = 3000,
		dot_grace_period = 0.1,
		variant = "fire",
		dot_damage = 3.0,
		damage_class = "FlameBulletBase",
		dot_tick_period = 0.5
	}

	--Underbarrel KAC ChainsSAW Flamethrower
	fire_entries.weapon_kacchainsaw_flamethrower = {
		dot_trigger_chance = 0.5,
		dot_damage = 1.6,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}

	--Flamethrower Mk.2
	fire_entries.weapon_flamethrower_mk2 = {
		dot_trigger_chance = 0.60,
		dot_damage = 1.6,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_flamethrower_mk2_rare = {
		dot_trigger_chance = 0.60,
		dot_damage = 0.8,
		dot_length = 6.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_flamethrower_mk2_welldone = {
		dot_trigger_chance = 0.60,
		dot_damage = 3.2,
		dot_length = 1.6,
		dot_trigger_max_distance = false
	}

	--MA-17 Flamethrower
	fire_entries.weapon_system = {
		dot_trigger_chance = 0.60,
		dot_damage = 1.6,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_low = {
		dot_trigger_chance = 0.60,
		dot_damage = 0.8,
		dot_length = 6.1,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_high = {
		dot_trigger_chance = 0.60,
		dot_damage = 3.2,
		dot_length = 1.6,
		dot_trigger_max_distance = false
	}

	--Money Thrower
	fire_entries.weapon_money = {
		dot_trigger_max_distance = false,
		dot_damage = 1.6,
		dot_length = 3.1,
		burn_sound_name = "no_sound",
		dot_trigger_chance = 0.60,
		fire_effect_variant = "endless_money"
	}

	--Dragons Breath
	fire_entries.ammo_dragons_breath_auto = {
		dot_trigger_chance = 0.3,
		dot_damage = 2.25,
		dot_length = 2.1,
		dot_trigger_max_distance = false,
		dot_stun_max_distance = true,
		use_weapon_damage_falloff_chance = true
	}
	fire_entries.ammo_dragons_breath = {
		dot_trigger_chance = 0.4,
		dot_damage = 3,
		dot_length = 2.1,
		dot_trigger_max_distance = false,
		dot_stun_max_distance = true,
		use_weapon_damage_falloff_chance = true
	}
	fire_entries.ammo_dragons_breath_pump = {
		dot_trigger_chance = 0.5,
		dot_damage = 4.5,
		dot_length = 2.1,
		dot_trigger_max_distance = false,
		dot_stun_max_distance = true,
		use_weapon_damage_falloff_chance = true
	}
	fire_entries.ammo_dragons_breath_heavy = {
		dot_trigger_chance = 0.8,
		dot_damage = 6,
		dot_length = 2.1,
		dot_trigger_max_distance = false,
		dot_stun_max_distance = true,
		use_weapon_damage_falloff_chance = true
	}

	--MELEE
	fire_entries.melee_spoon_gold = {
		dot_trigger_chance = 0.5,
		dot_damage = 2.0,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}
	fire_entries.melee_therkatana = {
		dot_trigger_chance = 1,
		dot_damage = 2.0,
		dot_length = 3.1,
		dot_trigger_max_distance = false
	}

	--THROWABLES
	--This is for the explosion, not the ground fire
	fire_entries.proj_molotov = { --Molotov
		dot_trigger_chance = 1,
		dot_damage = 3.0,
		dot_length = 3.1,
		dot_trigger_max_distance = false,
		is_molotov = true
	}
	fire_entries.proj_fire_com = { --Incendiary Grenade
		dot_trigger_chance = 1,
		dot_damage = 3.0,
		dot_length = 6.1,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_ray_frag = { --M202 FLASH Rounds
		dot_trigger_chance = 1,
		dot_damage = 3.0,
		dot_length = 9.1,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary = { --40MM Incendiary Rounds
		dot_trigger_max_distance = false,
		dot_damage = 3.0,
		dot_length = 3.1,
		dot_trigger_chance = 1
	}
	fire_entries.proj_launcher_incendiary_arbiter = { --25MM Incendiary Rounds
		dot_trigger_max_distance = false,
		dot_damage = 3.0,
		dot_length = 2.1,
		dot_trigger_chance = 1
	}
	fire_entries.proj_launcher_incendiary_3gl = { --3GL Incendiary Rounds
		dot_trigger_max_distance = false,
		dot_damage = 3.0,
		dot_length = 1.1,
		dot_trigger_chance = 1
	}

	--GROUND FIRES
	fire_entries.proj_molotov_groundfire = { --Molotov
		is_molotov = true,
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5
	}
	fire_entries.proj_incendiary_groundfire = { --Incendiary Grenade
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5
	}
	fire_entries.proj_ray_groundfire = { --M202 FLASH Rounds
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5
	}
	fire_entries.proj_launcher_incendiary_groundfire = { --40MM Incendiary Rounds
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5
	}
	fire_entries.proj_launcher_incendiary_arbiter_groundfire = { --25MM Incendiary Rounds
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5
	}
	fire_entries.equipment_tripmine_groundfire = { --Tripmines
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5,
		dot_length = 3.1,
		dot_damage = 3.0,
	}
	fire_entries.hatman_molotov_groundfire = {
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5,
		dot_length = 3.1,
		dot_damage = 1.0,
	}
	fire_entries.enemy_triad_boss_groundfire = {
		dot_trigger_max_distance = false,
		dot_trigger_chance = 0.5,
		dot_length = 3.1,
		dot_damage = 1.0,
	}
	fire_entries.enemy_mutator_cloaker_groundfire = {
		dot_trigger_max_distance = false
	}
end