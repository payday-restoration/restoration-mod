	local init_original = DOTTweakData._init_dot_entries

	function DOTTweakData:_init_dot_entries(...)
		local entries = {}
		self.dot_entries = entries
	
		self:_init_dot_entries_poison(entries, ...)
		self:_init_dot_entries_fire(entries, ...)
		self:_init_dot_entries_bleed(entries, ...)
	end

--the tables for init_dot_entries_fire is in firetweakdata

function DOTTweakData:_init_dot_entries_poison(entries)
	local poison_entries = {}
	entries.poison = poison_entries
	poison_entries.default_poison = {
		PROCESSED = true,
		name = "default",
		dot_length = 6,
		dot_damage = 1.5,
		damage_class = "PoisonBulletBase",
		dot_tick_period = 0.5,
		dot_grace_period = 0.1,
		variant = "poison"
	}
	--GUNS
	poison_entries.weapon_dotbulletbase = { --unused?
		dot_damage = 0.5
	}
	poison_entries.weapon_tranq_light = {
		dot_damage = 1.5,
		dot_length = 1.1,
		dot_tick_period = 0.5,
		hurt_animation_chance = 0
	}
	poison_entries.weapon_tranq = {
		dot_damage = 1.5,
		dot_length = 2.1,
		dot_tick_period = 0.5,
		hurt_animation_chance = 1
	}
	poison_entries.weapon_tranq_medium = {
		dot_damage = 1.5,
		dot_length = 4.1,
		dot_tick_period = 0.5,
		hurt_animation_chance = 1
	}
	poison_entries.weapon_tranq_heavy = {
		dot_damage = 1.5,
		dot_length = 6.1,
		dot_tick_period = 0.5,
		hurt_animation_chance = 1
	}
	poison_entries.ammo_rip_auto = {
		dot_damage = 1.5,
		dot_length = 2.1,
		use_weapon_damage_falloff = true,
		duration_falloff_end_mult = 0.5,
		hurt_animation_chance = 0.1
	}
	poison_entries.ammo_rip = {
		dot_damage = 1.5,
		dot_length = 4.1,
		use_weapon_damage_falloff = true,
		duration_falloff_end_mult = 0.5,
		hurt_animation_chance = 0.2
	}
	poison_entries.ammo_rip_pump = {
		dot_damage = 1.5,
		dot_length = 6.1,
		use_weapon_damage_falloff = true,
		duration_falloff_end_mult = 0.5,
		hurt_animation_chance = 0.3
	}
	poison_entries.ammo_rip_heavy = {
		dot_damage = 1.5,
		dot_length = 8.1,
		use_weapon_damage_falloff = true,
		duration_falloff_end_mult = 0.5,
		hurt_animation_chance = 0.4
	}
	
	--(CROSS)BOW PROJECTILES
	poison_entries.ammo_proj_elastic = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 8.1,
		hurt_animation_chance = 0.8
	}
	poison_entries.ammo_proj_arblast = clone(poison_entries.ammo_proj_elastic)
	poison_entries.ammo_proj_long = clone(poison_entries.ammo_proj_elastic)
	poison_entries.ammo_proj_bow = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 6.1,
		hurt_animation_chance = 0.6
	}
	poison_entries.ammo_proj_frankish = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_crossbow = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_ecp = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 4.1,
		hurt_animation_chance = 0.4
	}
	--MELEE
	poison_entries.melee_piggy_hammer = {
		hurt_animation_chance = 0.5,
		dot_damage = 1.5,
		dot_length = 4.1
	}
	poison_entries.melee_cqc = {
		hurt_animation_chance = 0.5,
		dot_damage = 1.5,
		dot_length = 4.1
	}
	poison_entries.melee_fear = {
		hurt_animation_chance = 0.5,
		dot_damage = 1.5,
		dot_length = 4.1
	}
	--THROWABLES
	poison_entries.proj_four = {
		damage_class = "ProjectilesPoisonBulletBase",
		hurt_animation_chance = 1,
		dot_damage = 1.5,
		dot_length = 4.1
	}
	--GAS
	poison_entries.proj_gas_grenade_cloud = {
		hurt_animation_chance = 1,
		apply_hurt_once = true,
		dot_damage = 1.5,
		dot_length = 10.15
	}
	poison_entries.proj_launcher_cloud = {
		hurt_animation_chance = 1,
		apply_hurt_once = true,
		dot_damage = 1.5,
		dot_length = 8.15
	}
	poison_entries.proj_launcher_arbiter_cloud = {
		hurt_animation_chance = 1,
		apply_hurt_once = true,
		dot_damage = 1.5,
		dot_length = 6.15
	}
	poison_entries.proj_launcher_3gl_cloud = {
		hurt_animation_chance = 1,
		apply_hurt_once = true,
		dot_damage = 1.5,
		dot_length = 4.15
	}
end

function DOTTweakData:_init_dot_entries_bleed(entries)
	local bleed_entries = {}
	entries.bleed = bleed_entries
	bleed_entries.default_bleed = {
		PROCESSED = true,
		name = "default",
		dot_length = 3.1,
		dot_damage = 2.0,
		damage_class = "BleedBulletBase",
		dot_tick_period = 0.5,
		dot_grace_period = 0.1,
		hurt_animation_chance = 0,
		variant = "bleed"
	}

	bleed_entries.melee_bleed = {
		dot_damage = 2.0,
		dot_length = 3.1,
	}
end