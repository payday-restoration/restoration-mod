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
		dot_grace_period = 0.5, --0.1,
		variant = "poison"
		--hurt_animation_chance = 1 --chance to cause poison stun ON HIT (boooo); you can actually wipe the stun effect by landing another hit that fails the stun check (BOOOOOOOO)
		--duration_falloff_end_mult = 0.5 --rendered non-functional after the DoTManager changes; fix later???
	}
	--GUNS
	poison_entries.weapon_dotbulletbase = { --unused?
		dot_damage = 0.5
	}
	poison_entries.weapon_tranq_light = {
		dot_damage = 1.5,
		dot_length = 1.1,
		dot_tick_period = 0.5,
		use_weapon_damage_falloff = true,
	}
	poison_entries.weapon_tranq = {
		dot_damage = 1.5,
		dot_length = 2.1,
		dot_tick_period = 0.5
	}
	poison_entries.weapon_tranq_medium = {
		dot_damage = 1.5,
		dot_length = 4.1,
		dot_tick_period = 0.5
	}
	poison_entries.weapon_tranq_heavy = {
		dot_damage = 3.0,
		dot_length = 4.1,
		dot_tick_period = 0.5
	}
	poison_entries.weapon_tranq_extreme = {
		dot_damage = 3.0,
		dot_length = 8.1,
		dot_tick_period = 0.5
	}
	poison_entries.weapon_cyanide = {
		dot_damage = 35,
		dot_length = 5.1,
		dot_tick_period = 5
	}
	poison_entries.ammo_rip_auto = {
		dot_damage = 1.5,
		dot_length = 3.1,
		use_weapon_damage_falloff = true
	}
	poison_entries.ammo_rip = {
		dot_damage = 2.0,
		dot_length = 3.1,
		use_weapon_damage_falloff = true
	}
	poison_entries.ammo_rip_pump = {
		dot_damage = 3.0,
		dot_length = 3.1,
		use_weapon_damage_falloff = true
	}
	poison_entries.ammo_rip_heavy = {
		dot_damage = 4.0,
		dot_length = 3.1,
		use_weapon_damage_falloff = true
	}
	
	--(CROSS)BOW PROJECTILES
	poison_entries.ammo_proj_elastic = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 8.1
	}
	poison_entries.ammo_proj_arblast = clone(poison_entries.ammo_proj_elastic)
	poison_entries.ammo_proj_long = clone(poison_entries.ammo_proj_elastic)
	poison_entries.ammo_proj_bow = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 6.1
	}
	poison_entries.ammo_proj_frankish = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_crossbow = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_ecp = {
		damage_class = "ProjectilesPoisonBulletBase",
		dot_damage = 1.5,
		dot_length = 4.1
	}
	--MELEE
	poison_entries.melee_piggy_hammer = {
		dot_damage = 1.5,
		dot_length = 4.1
	}
	poison_entries.melee_cqc = {
		dot_damage = 1.5,
		dot_length = 4.1
	}
	poison_entries.melee_fear = {
		dot_damage = 1.5,
		dot_length = 4.1
	}
	--THROWABLES
	poison_entries.proj_four = {
		damage_class = "ProjectilesPoisonBulletBase",
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
	poison_entries.proj_launcher_cloud_spam = {
		hurt_animation_chance = 1,
		apply_hurt_once = true,
		dot_damage = 1.5,
		dot_length = 6.15
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