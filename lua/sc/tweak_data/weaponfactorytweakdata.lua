--Overrides for shotgun ammo types that vary per damage tier.
	--Indented to make for easy code folding in most editors.
	--@SC Feel free to define these for the other ammo types if you want, though it may require way more presets to be made since they also touch ammo count.
	--Flechettes
	local a_piercing_auto_override = {
		desc_id = "bm_wp_upg_a_piercing_auto_desc_sc",
		stats = {
			value = 9,
			damage = -6
		},
		custom_stats = {
			damage_near_mul = 1.25,
			damage_far_mul = 1.25,
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9819,
			ammo_pickup_max_mul = 0.9764,					
			bullet_class = "BleedBulletBase",
			dot_data = { 
				type = "bleed",
				custom_data = {
					dot_damage = "1.6",
					dot_length = "3.1",
					dot_tick_period = "0.5"
				}
			}
		}
	}

	local a_piercing_semi_override = {
		desc_id = "bm_wp_upg_a_piercing_semi_desc_sc",
		stats = {
			value = 9,
			damage = -15
		},
		custom_stats = {
			damage_near_mul = 1.25,
			damage_far_mul = 1.25,
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9607,
			ammo_pickup_max_mul = 0.9486,					
			bullet_class = "BleedBulletBase",
			dot_data = { 
				type = "bleed",
				custom_data = {
					dot_damage = "2",
					dot_length = "3.1",
					dot_tick_period = "0.5"
				}
			}
		}
	}

	local a_piercing_pump_override = {
		desc_id = "bm_wp_upg_a_piercing_pump_desc_sc",
		stats = {
			value = 9,
			damage = -15
		},
		custom_stats = {
			desc_id = "bm_wp_upg_a_piercing_pump_desc_sc",
			damage_near_mul = 1.25,
			damage_far_mul = 1.25,
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9655,
			ammo_pickup_max_mul = 0.9543,			
			bullet_class = "BleedBulletBase",
			dot_data = { 
				type = "bleed",
				custom_data = {
					dot_damage = "3",
					dot_length = "3.1",
					dot_tick_period = "0.5"
				}
			}
		}
	}

	--Dragon's Breath
	local a_dragons_breath_auto_override = {
		desc_id = "bm_wp_upg_a_dragons_breath_auto_desc_sc",
		stats = {
			value = 9,
			damage = -6
		},
		custom_stats = {
			ignore_statistic = true,
			bullet_class = "FlameBulletBase",
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9819,
			ammo_pickup_max_mul = 0.9764,										
			can_shoot_through_shield = false,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = "1.6",
				dot_trigger_chance = "60",
				dot_length = "3.1",
				dot_tick_period = "0.5"
			}
		}
	}

	local a_dragons_breath_semi_override = {
		desc_id = "bm_wp_upg_a_dragons_breath_semi_desc_sc",
		stats = {
			value = 9,
			damage = -15
		},
		custom_stats = {
			ignore_statistic = true,
			bullet_class = "FlameBulletBase",
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9607,
			ammo_pickup_max_mul = 0.9486,										
			can_shoot_through_shield = false,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = "3",
				dot_trigger_chance = "60",
				dot_length = "3.1",
				dot_tick_period = "0.5"
			}
		}
	}

	local a_dragons_breath_pump_override = {
		desc_id = "bm_wp_upg_a_dragons_breath_pump_desc_sc",
		supported = true,
		stats = {
			value = 9,
			damage = -15
		},
		custom_stats = {
			ignore_statistic = true,
			bullet_class = "FlameBulletBase",
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 0.9655,
			ammo_pickup_max_mul = 0.9543,									
			can_shoot_through_shield = false,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = "3",
				dot_trigger_chance = "60",
				dot_length = "3.1",
				dot_tick_period = "0.5"
			}
		}
	}

--Vanilla Silencers
Hooks:PostHook(WeaponFactoryTweakData, "_init_silencers", "resmod_silencers", function(self)

	--The Bigger the Better
	self.parts.wpn_fps_upg_ns_ass_smg_large.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_large.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_large.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ns_ass_smg_large.perks = {"silencer"}
	
	--Medium Suppressor
	self.parts.wpn_fps_upg_ns_ass_smg_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_medium.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_medium.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ns_ass_smg_medium.perks = {"silencer"}
	
	--Low Profile Suppressor
	self.parts.wpn_fps_upg_ns_ass_smg_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_small.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_small.stats = {
		value = 3,
		suppression = 10,
		alert_size = -1,
		recoil = 1,				
		spread = -1
	}
	self.parts.wpn_fps_upg_ns_ass_smg_small.perks = {"silencer"}
	
	--Monolith Suppressor
	self.parts.wpn_fps_upg_ns_pis_large.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_large.supported = true
	self.parts.wpn_fps_upg_ns_pis_large.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ns_pis_large.perks = {"silencer"}

	--Standard Issue Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_medium.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ns_pis_medium.perks = {"silencer"}

	--Size Doesn't Matter
	self.parts.wpn_fps_upg_ns_pis_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_small.supported = true
	self.parts.wpn_fps_upg_ns_pis_small.stats = {
		value = 3,
		suppression = 10,
		alert_size = -1,
		recoil = 1,				
		spread = -1
	}
	self.parts.wpn_fps_upg_ns_pis_small.perks = {"silencer"}
	
	--Silent Killer Suppressor
	self.parts.wpn_fps_upg_ns_shot_thick.pcs = {
			10,
			20,
			30,
			40
		}	
	self.parts.wpn_fps_upg_ns_shot_thick.supported = true	
	self.parts.wpn_fps_upg_ns_shot_thick.stats = {
		value = 7,
		suppression = 12,
		alert_size = -1,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_upg_ns_shot_thick.perks = {"silencer"}
	self.parts.wpn_fps_upg_ns_shot_thick.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}			
	self.parts.wpn_fps_upg_ns_shot_thick.forbids = {
		"wpn_fps_upg_a_explosive"
	}
	
end)

--Vanilla Barrel Extensions
Hooks:PostHook(WeaponFactoryTweakData, "_init_nozzles", "resmod_nozzles", function(self)

	--Fire Breather Nozzle
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = {
		value = 4,
		suppression = -2,
		recoil = 1,
		spread = -1
	}
		
	--Stubby Compensator
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = {
		value = 4,
		spread = -1,
		concealment = 1
	}
		
	--The Tank Compensator	
	self.parts.wpn_fps_upg_ns_ass_smg_tank.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_tank.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Shark Teeth
	self.parts.wpn_fps_upg_ns_shot_shark.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_shot_shark.supported = true
	self.parts.wpn_fps_upg_ns_shot_shark.stats = {
		value = 5,
		suppression = -2,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_upg_ns_shot_shark.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}			

end)

--Vanilla Gadgets
Hooks:PostHook(WeaponFactoryTweakData, "_init_gadgets", "resmod_gadgets", function(self)

	--Assault Light
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.supported = true
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = {
		value = 3
	}

	--Tactical Laser Module
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.supported = true
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = {
		value = 4
	}

	--Pocket Laser
	self.parts.wpn_fps_upg_fl_pis_laser.pcs = {
		10,	
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_laser.supported = true
	self.parts.wpn_fps_upg_fl_pis_laser.stats = {
		value = 4
	}

	--Tactical Pistol Light
	self.parts.wpn_fps_upg_fl_pis_tlr1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_tlr1.supported = true
	self.parts.wpn_fps_upg_fl_pis_tlr1.stats = {
		value = 3
	}

end)

--Vanilla Vertical Grips
Hooks:PostHook(WeaponFactoryTweakData, "_init_vertical_grips", "resmod_vertical_grips", function(self)

	--Gonna keep these mostly as is, since these are mostly custom

	--TAC Vertical Grip
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		pcs = {},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_tac",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_verticalgrip",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			spread = -1
		}
	}
	
	--Stubby Vertical Grip
	self.parts.wpn_fps_upg_vg_ass_smg_stubby = {
		pcs = {},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_stubby",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_stubby",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby",
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
	}
	
	--AFG
	self.parts.wpn_fps_upg_vg_ass_smg_afg = {
		pcs = {},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_afg",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_afg",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg",
		supported = true,
		stats = {
			value = 1,
			recoil = -1,				
			concealment = 1
		}
	}
	
	--Vanilla 'statless' variants for weapons that have vertical grips baseline
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	self.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	self.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip)
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.pcs = nil
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_afg)
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla.pcs = nil
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_stubby)
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla.pcs = nil

end)

--Vanilla Sights
Hooks:PostHook(WeaponFactoryTweakData, "_init_sights", "resmod_sights", function(self)

	--Milspec Scope
	self.parts.wpn_fps_upg_o_specter.pcs = {
		10, 
		20,
		30, 
		40
	}
	self.parts.wpn_fps_upg_o_specter.has_description = true
	self.parts.wpn_fps_upg_o_specter.desc_id = "bm_wp_upg_o_large"
	self.parts.wpn_fps_upg_o_specter.supported = true
	self.parts.wpn_fps_upg_o_specter.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_specter.perks = {"scope"}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m249 = {
		translation = Vector3(0, -3, -3.4),
	}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_par = {
		translation = Vector3(-0.03, -2.4, -3.25),
	}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_mg42 = {
		translation = Vector3(0.02, 4.9, -2.85 ),
	}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk21 = {
		translation = Vector3(0, -2.4, -3.25),
	}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_rpk = {
		translation = Vector3(0.02, -2, -3.1),
	}
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m60 = {
		translation = Vector3(0, -3, -2.95),
	}	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_winchester = {
		translation = Vector3(0, -7, -3.3)
	}	
	self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_shatters_fury = {
		translation = Vector3(-0.05, -10, -4.65)
	}	

	--Military Red Dot
	self.parts.wpn_fps_upg_o_aimpoint.pcs = {
		10, 
		20,
		30, 
		40	
	}
	self.parts.wpn_fps_upg_o_aimpoint.has_description = true
	self.parts.wpn_fps_upg_o_aimpoint.desc_id = "bm_wp_upg_o_aim"		
	self.parts.wpn_fps_upg_o_aimpoint.supported = true		
	self.parts.wpn_fps_upg_o_aimpoint.stats = {
		value = 8,
		zoom = 10
	}
	self.parts.wpn_fps_upg_o_aimpoint.perks = {"scope"}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Preorder Military Red Dot
	self.parts.wpn_fps_upg_o_aimpoint_2.pcs = {
		10, 
		20,
		30, 
		40	
	}
	self.parts.wpn_fps_upg_o_aimpoint_2.has_description = true
	self.parts.wpn_fps_upg_o_aimpoint_2.desc_id = "bm_wp_upg_o_aim"		
	self.parts.wpn_fps_upg_o_aimpoint_2.supported = true		
	self.parts.wpn_fps_upg_o_aimpoint_2.stats = {
		value = 8,
		zoom = 10
	}
	self.parts.wpn_fps_upg_o_aimpoint_2.perks = {"scope"}
	self.parts.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Surgeon Sight
	self.parts.wpn_fps_upg_o_docter.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_docter.has_description = true
	self.parts.wpn_fps_upg_o_docter.desc_id = "bm_wp_upg_o_tiny"
	self.parts.wpn_fps_upg_o_docter.supported = true
	self.parts.wpn_fps_upg_o_docter.stats = {
		value = 5,
		zoom = 1		
	}
	self.parts.wpn_fps_upg_o_docter.perks = {"scope"}
	self.parts.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Compact Tactical (Fuck off)
	self.parts.wpn_fps_upg_o_tf90.pcs = {
		10, 
		20,
		30, 
		40
	}
	self.parts.wpn_fps_upg_o_tf90.has_description = true
	self.parts.wpn_fps_upg_o_tf90.desc_id = "bm_wp_upg_o_large"
	self.parts.wpn_fps_upg_o_tf90.supported = true
	self.parts.wpn_fps_upg_o_tf90.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_tf90.perks = {"scope"}	
	self.parts.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Holographic Sight
	self.parts.wpn_fps_upg_o_eotech.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_eotech.has_description = true
	self.parts.wpn_fps_upg_o_eotech.desc_id = "bm_wp_upg_o_small"			
	self.parts.wpn_fps_upg_o_eotech.supported = true			
	self.parts.wpn_fps_upg_o_eotech.stats = {
		value = 3,
		zoom = 2	
	}
	self.parts.wpn_fps_upg_o_eotech.perks = {"scope"}
	self.parts.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

	--The Professional's Choice Sight
	self.parts.wpn_fps_upg_o_t1micro.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_t1micro.desc_id = "bm_wp_upg_o_tiny"
	self.parts.wpn_fps_upg_o_t1micro.has_description = true		
	self.parts.wpn_fps_upg_o_t1micro.supported = true		
	self.parts.wpn_fps_upg_o_t1micro.stats = {
		value = 5,
		zoom = 1				
	}
	self.parts.wpn_fps_upg_o_t1micro.perks = {"scope"}
	self.parts.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Marksman Sight
	self.parts.wpn_upg_o_marksmansight_rear.pcs = {
			10,
			20,
			30,
			40
		}
	self.parts.wpn_upg_o_marksmansight_rear.supported = true
	self.parts.wpn_upg_o_marksmansight_rear.stats = {
			value = 1
		}
	self.parts.wpn_upg_o_marksmansight_rear.perks = {"scope"}

	--Angled Sight
	self.parts.wpn_fps_upg_o_45iron.pcs = {}
	self.parts.wpn_fps_upg_o_45iron.supported = true
	self.parts.wpn_fps_upg_o_45iron.stats = {value = 1, gadget_zoom = 1}
	self.parts.wpn_fps_upg_o_45iron.perks = {"gadget"}
	self.parts.wpn_fps_upg_o_45iron.is_a_unlockable = true
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm = {
		translation = Vector3(-3.4, 5, -13.5),
		rotation = Rotation(0, 0, -45)
	}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm_gold = {
		translation = Vector3(-3.4, 5, -13.5),
		rotation = Rotation(0, 0, -45)
	}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_winchester = {
		translation = Vector3(-5.5, -5, -15),
		rotation = Rotation(0, 0, -45)
	}	
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_amcar = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_74 = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m4 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_aug = { translation = Vector3(-3.65, 5, -11.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g36 = { translation = Vector3(-0.775, 10, -12.05),rotation = Rotation( 0.45, -0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-2.05, 0, -13.85),rotation = Rotation(0.3 ,-0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3(-1.4, 14, -12.9),rotation = Rotation(0.9, -1, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m16 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_olympic = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3(-3.15, 5, -13.4),rotation = Rotation(0.1, -0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 8, -12.5),rotation = Rotation(0.5 ,-0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_scar = { translation = Vector3(-1.65, 8, -9.9),rotation = Rotation(0.8, -0.8, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_fal = { translation = Vector3(-2.45, 10, -13.4),rotation = Rotation(0.7 ,-0.75, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_famas = { translation = Vector3(2.35, 6, -17),rotation = Rotation(-0.6, 2.2, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_galil = { translation = Vector3( -2.25,5,-13.2 ),rotation = Rotation(0.275 ,-0.2, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( -0.7,8,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -1.9,18,-9.48 ),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(-2, 8, -9.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -4.45, 15, -8 ),rotation = Rotation(0.1 ,0.0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -4.25,-2, -10.8 ),rotation = Rotation(0, 0.1, -45)}

	--Shortdot Sight (Base Sniper Scope)
	self.parts.wpn_fps_upg_o_shortdot.supported = true
	self.parts.wpn_fps_upg_o_shortdot.stats = {value = 1, zoom = 50}
	self.parts.wpn_fps_upg_o_shortdot.perks = {"scope"}
	self.parts.wpn_fps_upg_o_shortdot.reticle_obj = nil
	
	--Vanilla Shortdot
	self.parts.wpn_fps_upg_o_shortdot_vanilla = deep_clone(self.parts.wpn_fps_upg_o_shortdot)
	self.parts.wpn_fps_upg_o_shortdot_vanilla.supported = true
	self.parts.wpn_fps_upg_o_shortdot_vanilla.stats = {value = 1, zoom = 50}
	self.parts.wpn_fps_upg_o_shortdot_vanilla.reticle_obj = nil
	self.parts.wpn_fps_upg_o_shortdot_vanilla.dlc = nil
	self.parts.wpn_fps_upg_o_shortdot_vanilla.pcs = nil	

	--Theia Magnified Scope
	self.parts.wpn_fps_upg_o_leupold.pcs = {}
	self.parts.wpn_fps_upg_o_leupold.desc_id = "bm_wp_upg_o_leupold_desc_sc"
	self.parts.wpn_fps_upg_o_leupold.has_description = true
	self.parts.wpn_fps_upg_o_leupold.reticle_obj = nil
	self.parts.wpn_fps_upg_o_leupold.supported = true
	self.parts.wpn_fps_upg_o_leupold.stats = {
		value = 8,
		zoom = 50,
		concealment = -2
	}
	self.parts.wpn_fps_upg_o_leupold.perks = {"scope", "highlight"}

end)

--DLC1 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc1", "resmod_content_dlc1", function(self)

	--See More Sight
	self.parts.wpn_fps_upg_o_cmore.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_cmore.desc_id = "bm_wp_upg_o_tiny"
	self.parts.wpn_fps_upg_o_cmore.has_description = true
	self.parts.wpn_fps_upg_o_cmore.supported = true
	self.parts.wpn_fps_upg_o_cmore.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_cmore.perks = {"scope"}
	self.parts.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

end)

--DLC2 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc2", "resmod_content_dlc2", function(self)

	--Single Fire Lock
	self.parts.wpn_fps_upg_i_singlefire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_i_singlefire.has_description = true
	self.parts.wpn_fps_upg_i_singlefire.supported = true
	self.parts.wpn_fps_upg_i_singlefire.stats = {
		value = 5,
		spread = 1
	}
	self.parts.wpn_fps_upg_i_singlefire.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_upg_i_singlefire.perks = {
		"fire_mode_single"
	}		
	self.parts.wpn_fps_upg_i_singlefire.forbids = {
		"wpn_fps_upg_extra_mp_lock"
	}

	--Auto Fire Lock
	self.parts.wpn_fps_upg_i_autofire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_i_autofire.has_description = true
	self.parts.wpn_fps_upg_i_autofire.supported = true
	self.parts.wpn_fps_upg_i_autofire.stats = {
		value = 5,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_upg_i_autofire.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}			
	self.parts.wpn_fps_upg_i_autofire.perks = {
		"fire_mode_auto"
	}				
	self.parts.wpn_fps_upg_i_autofire.forbids = {
		"wpn_fps_upg_extra_mp_lock"
	}

	--Rubber Grip
	self.parts.wpn_fps_upg_m4_g_hgrip.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.supported = true
	self.parts.wpn_fps_upg_m4_g_hgrip.stats = {
		value = 2,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Vanilla Rubber Grip
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_hgrip)
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.pcs = nil

	--Straight Grip
	self.parts.wpn_fps_upg_m4_g_mgrip.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_mgrip.supported = true
	self.parts.wpn_fps_upg_m4_g_mgrip.stats = {
		value = 2,
		recoil = -2,
		concealment = 2
	}

end)

--DLC2Dec16 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc2_dec16", "resmod_content_dlc2_dec16", function(self)

	--Acough Optic Scope
	self.parts.wpn_fps_upg_o_acog.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_acog.reticle_obj = nil
	self.parts.wpn_fps_upg_o_acog.desc_id = "bm_wp_upg_o_large"
	self.parts.wpn_fps_upg_o_acog.has_description = true		
	self.parts.wpn_fps_upg_o_acog.supported = true		
	self.parts.wpn_fps_upg_o_acog.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_acog.perks = {"scope"}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_hk21 = {
		translation = Vector3(0, 0, -3.2)
	}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_m249 = {
		translation = Vector3(0, 0, -3.4)
	}
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_shatters_fury = {
		translation = Vector3(-0.05, -15, -4.65)
	}		
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_winchester = { 
		translation = Vector3(0, -7, -3.3)
	}

end)

--Gage Assignment Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_jobs", "resmod_content_jobs", function(self)

	--Bronco Scope Mount
	self.parts.wpn_fps_pis_rage_extra.pcs = {}
	self.parts.wpn_fps_pis_rage_extra.supported = true
	self.parts.wpn_fps_pis_rage_extra.stats = {value = 2}

	--Deagle Scope Mount
	self.parts.wpn_fps_pis_deagle_extra.pcs = {}
	self.parts.wpn_fps_pis_deagle_extra.supported = true
	self.parts.wpn_fps_pis_deagle_extra.stats = {value = 2}

	--Competition Foregrip
	self.parts.wpn_fps_upg_fg_jp.pcs = {}
	self.parts.wpn_fps_upg_fg_jp.supported = true
	self.parts.wpn_fps_upg_fg_jp.stats = {
		value = 5,
		concealment = -2,
		spread = 2,
		recoil = -2
	}
	
	--Gazelle Rail
	self.parts.wpn_fps_upg_fg_smr.pcs = {}
	self.parts.wpn_fps_upg_fg_smr.supported = true
	self.parts.wpn_fps_upg_fg_smr.stats = {
		value = 5,
		spread = -1,
		recoil = 1
	}

	--CAR Quadstacked Mag
	self.parts.wpn_fps_upg_m4_m_quad.pcs = {}
	self.parts.wpn_fps_upg_m4_m_quad.supported = true
	self.parts.wpn_fps_upg_m4_m_quad.stats = {
		value = 3,
		concealment = -3,
		reload = -3,
		spread = -1,
		extra_ammo = 30
	}
	
	--Battleproven Handguard
	self.parts.wpn_fps_upg_ak_fg_tapco.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_tapco.supported = true
	self.parts.wpn_fps_upg_ak_fg_tapco.stats = {
		value = 5,
		recoil = 1,
		spread = -1
	}
	
	self.parts.wpn_fps_upg_fg_midwest.pcs = {}
	self.parts.wpn_fps_upg_fg_midwest.supported = true
	self.parts.wpn_fps_upg_fg_midwest.stats = {
		value = 5,
		recoil = -1,
		spread = 1,
		concealment = -1
	}

	--AK Slavic Dragon Barrel
	self.parts.wpn_fps_upg_ak_b_draco.pcs = {}
	self.parts.wpn_fps_upg_ak_b_draco.supported = true
	self.parts.wpn_fps_upg_ak_b_draco.stats = {
		value = 2,
		spread = -2,
		concealment = 2
	}
	
	--AK Quadstacked Mag
	self.parts.wpn_fps_upg_ak_m_quad.pcs = {}
	self.parts.wpn_fps_upg_ak_m_quad.supported = true
	self.parts.wpn_fps_upg_ak_m_quad.stats = {
		value = 3,
		concealment = -3,
		extra_ammo = 30,
		reload = -3,
		spread = -1
	}
	
	--AK Rubber Grip
	self.parts.wpn_fps_upg_ak_g_hgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_hgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_hgrip.stats = {
		value = 2,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ak_g_hgrip.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_upg_ak_g_hgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}
	
	--AK Plastic Grip
	self.parts.wpn_fps_upg_ak_g_pgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_pgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_pgrip.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ak_g_pgrip.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}		
	self.parts.wpn_fps_upg_ak_g_pgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}

	--AK Wood Grip
	self.parts.wpn_fps_upg_ak_g_wgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_wgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_wgrip.stats = {
		value = 2,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_upg_ak_g_wgrip.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}		
	self.parts.wpn_fps_upg_ak_g_wgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}

	--Competitor's Compensator
	self.parts.wpn_fps_upg_ass_ns_jprifles.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_jprifles.supported = true
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats = {
		value = 5,
		spread = -2,
		concealment = 2
	}
	
	--Funnel of Fun Nozzle
	self.parts.wpn_fps_upg_ass_ns_linear.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_linear.supported = true
	self.parts.wpn_fps_upg_ass_ns_linear.stats = {
		value = 5,
		suppression = -4,
		spread = -2,
		recoil = 2
	}
	
	--Tactical Compensator
	self.parts.wpn_fps_upg_ass_ns_surefire.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_surefire.supported = true
	self.parts.wpn_fps_upg_ass_ns_surefire.stats = {
		value = 5,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--Flash Hider
	self.parts.wpn_fps_upg_pis_ns_flash.pcs = {}
	self.parts.wpn_fps_upg_pis_ns_flash.supported = true
	self.parts.wpn_fps_upg_pis_ns_flash.stats = {
		value = 4,
		spread = -1,
		concealment = 1
	}
	
	--King's Crown Compensator
	self.parts.wpn_fps_upg_shot_ns_king.pcs = {}
	self.parts.wpn_fps_upg_shot_ns_king.supported = true
	self.parts.wpn_fps_upg_shot_ns_king.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_shot_ns_king.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
		
	--Asepsis Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium_slim.pcs = {}
	self.parts.wpn_fps_upg_ns_pis_medium_slim.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium_slim.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ns_pis_medium_slim.perks = {"silencer"}
	
	--Military Laser Module
	self.parts.wpn_fps_upg_fl_ass_peq15.pcs = {}
	self.parts.wpn_fps_upg_fl_ass_peq15.supported = true
	self.parts.wpn_fps_upg_fl_ass_peq15.stats = {
		value = 5,
		concealment = -1
	}
	self.parts.wpn_fps_upg_fl_ass_peq15.perks = {"gadget"}

	--Wide Stock
	self.parts.wpn_fps_upg_m4_s_crane.pcs = {}
	self.parts.wpn_fps_upg_m4_s_crane.supported = true
	self.parts.wpn_fps_upg_m4_s_crane.stats = {
		value = 2,
		recoil = 2,
		spread = -2
	}
	self.parts.wpn_fps_upg_m4_s_crane.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--War-Torn Stock
	self.parts.wpn_fps_upg_m4_s_mk46.pcs = {}
	self.parts.wpn_fps_upg_m4_s_mk46.supported = true
	self.parts.wpn_fps_upg_m4_s_mk46.stats = {
		value = 6,
		recoil = -2,
		concealment = -2,
		spread = 2
	}
	self.parts.wpn_fps_upg_m4_s_mk46.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Pistol Red Dot Sight
	self.parts.wpn_fps_upg_o_rmr.pcs = {}
	self.parts.wpn_fps_upg_o_rmr.has_description = true
	self.parts.wpn_fps_upg_o_rmr.desc_id = "bm_wp_upg_o_small"
	self.parts.wpn_fps_upg_o_rmr.supported = true
	self.parts.wpn_fps_upg_o_rmr.stats = {
		value = 6,
		zoom = 2
	}
	self.parts.wpn_fps_upg_o_rmr.custom_stats = {disable_steelsight_stance = true}
	self.parts.wpn_fps_upg_o_rmr.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_shatters_fury = {
		translation = Vector3(0, 0, -0.45)
	}	

	--Compact Holosight
	self.parts.wpn_fps_upg_o_eotech_xps.pcs = {}
	self.parts.wpn_fps_upg_o_eotech_xps.has_description = true
	self.parts.wpn_fps_upg_o_eotech_xps.desc_id = "bm_wp_upg_o_tiny"	
	self.parts.wpn_fps_upg_o_eotech_xps.supported = true	
	self.parts.wpn_fps_upg_o_eotech_xps.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_eotech_xps.perks = {"scope"}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Speculator Sight
	self.parts.wpn_fps_upg_o_reflex.pcs = {}
	self.parts.wpn_fps_upg_o_reflex.has_description = true
	self.parts.wpn_fps_upg_o_reflex.desc_id = "bm_wp_upg_o_small"			
	self.parts.wpn_fps_upg_o_reflex.supported = true			
	self.parts.wpn_fps_upg_o_reflex.stats = {
		value = 5,
		zoom = 2
	}
	self.parts.wpn_fps_upg_o_reflex.perks = {"scope"}
	self.parts.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Trigonom Sight
	self.parts.wpn_fps_upg_o_rx01.pcs = {}
	self.parts.wpn_fps_upg_o_rx01.has_description = true
	self.parts.wpn_fps_upg_o_rx01.desc_id = "bm_wp_upg_o_aim"
	self.parts.wpn_fps_upg_o_rx01.supported = true
	self.parts.wpn_fps_upg_o_rx01.stats = {
		value = 5,
		zoom = 10
	}
	self.parts.wpn_fps_upg_o_rx01.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Solar Sight
	self.parts.wpn_fps_upg_o_rx30.pcs = {}
	self.parts.wpn_fps_upg_o_rx30.has_description = true
	self.parts.wpn_fps_upg_o_rx30.desc_id = "bm_wp_upg_o_cs_desc"
	self.parts.wpn_fps_upg_o_rx30.supported = true
	self.parts.wpn_fps_upg_o_rx30.stats = {
		value = 5,
		zoom = 5
	}
	self.parts.wpn_fps_upg_o_rx30.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Combat Sight
	self.parts.wpn_fps_upg_o_cs.pcs = {}
	self.parts.wpn_fps_upg_o_cs.has_description = true
	self.parts.wpn_fps_upg_o_cs.desc_id = "bm_wp_upg_o_cs_desc"		
	self.parts.wpn_fps_upg_o_cs.reticle_obj = nil
	self.parts.wpn_fps_upg_o_cs.supported = true
	self.parts.wpn_fps_upg_o_cs.stats = {
		value = 3,
		zoom = 5
	}
	self.parts.wpn_fps_upg_o_cs.perks = {"scope"}
	self.parts.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

end)

--CAR-4
Hooks:PostHook(WeaponFactoryTweakData, "_init_m4", "resmod_m4", function(self)

	--Exotique Receiver
	self.parts.wpn_fps_m4_upper_reciever_edge.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_upper_reciever_edge.supported = true
	self.parts.wpn_fps_m4_upper_reciever_edge.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
		
	--(CAR) Long Barrel
	self.parts.wpn_fps_m4_uupg_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_long.supported = true
	self.parts.wpn_fps_m4_uupg_b_long.stats = {
		value = 4,			
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--(CAR) Short Barrel
	self.parts.wpn_fps_m4_uupg_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_short.supported = true
	self.parts.wpn_fps_m4_uupg_b_short.stats = {
		value = 4,					
		spread = -1,
		concealment = 1
	}

	--(CAR) Medium Barrel
	self.parts.wpn_fps_m4_uupg_b_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_medium.supported = true
	self.parts.wpn_fps_m4_uupg_b_medium.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--(CAR) Stealth Barrel
	self.parts.wpn_fps_m4_uupg_b_sd.pcs = {
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_sd.supported = true
	self.parts.wpn_fps_m4_uupg_b_sd.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_m4_uupg_b_sd.perks = {"silencer"}
	
	--Aftermarket Special Handguard
	self.parts.wpn_fps_m4_uupg_fg_lr300.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_fg_lr300.supported = true
	self.parts.wpn_fps_m4_uupg_fg_lr300.stats = {
		value = 5,
		recoil = -1,
		spread = 1,
		concealment = -1
	}

	--Milspec Mag.
	self.parts.wpn_fps_m4_uupg_m_std.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_m_std.name_id = "bm_wp_upg_mil_sc"
	self.parts.wpn_fps_m4_uupg_m_std.supported = true
	self.parts.wpn_fps_m4_uupg_m_std.stats = {
		value = 1,
		extra_ammo = 10,
		reload = -2,
		concealment = -1
	}
	
	--Folding Stock
	self.parts.wpn_fps_m4_uupg_s_fold.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_s_fold.supported = true
	self.parts.wpn_fps_m4_uupg_s_fold.stats = {
		value = 5,
		recoil = -1,
		concealment = 1
	}
	
	--(CAR) Ergo Grip
	self.parts.wpn_fps_upg_m4_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_ergo.supported = true
	self.parts.wpn_fps_upg_m4_g_ergo.stats = {
		value = 2,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_upg_m4_g_ergo.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}	

	--(CAR) Pro Grip
	self.parts.wpn_fps_upg_m4_g_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_sniper.supported = true
	self.parts.wpn_fps_upg_m4_g_sniper.stats = {
		value = 6,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_m4_g_sniper.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--(CAR) Drum Magazine 
	self.parts.wpn_fps_upg_m4_m_drum = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 98},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_drum",
		dlc = "sc",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum",
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 70,
			spread = -2,
			reload = -6,
			concealment = -5
		}
	}
	self.parts.wpn_fps_upg_m4_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	
	--(CAR) Tactical Mag.
	self.parts.wpn_fps_upg_m4_m_pmag.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_m_pmag.supported = true
	self.parts.wpn_fps_upg_m4_m_pmag.stats = {
		value = 3,
		recoil = -1,
		extra_ammo = -5,
		concealment = 1
	}
	
	--Vintage Mag.
	self.parts.wpn_fps_upg_m4_m_straight.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_m_straight.name_id = "bm_wp_upg_vintage_sc"
	self.parts.wpn_fps_upg_m4_m_straight.supported = true
	self.parts.wpn_fps_upg_m4_m_straight.stats = {
		value = 2,
		concealment = 1,
		reload = 3,
		extra_ammo = -10
	}
	
	--Standard Stock
	self.parts.wpn_fps_upg_m4_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_s_standard.supported = true
	self.parts.wpn_fps_upg_m4_s_standard.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_upg_m4_s_standard.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Tactical Stock
	self.parts.wpn_fps_upg_m4_s_pts.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_s_pts.supported = true
	self.parts.wpn_fps_upg_m4_s_pts.stats = {
		value = 3,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_m4_s_pts.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--CAR-4 Override Tables
	self.wpn_fps_ass_m4.override.wpn_fps_upg_m4_s_standard_vanilla = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	}
	
	--CAR-4 Part Additions
	--Standard Stock
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	
	
	--Shorter Than Short stock
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_smg_olympic_s_short")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_smg_olympic_s_short")		
	
	--Faster/Slower ROF mods (Unused)
	--[[
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_i_faster_rof")	
	]]--
	
	self.wpn_fps_ass_m4_npc.uses_parts = deep_clone(self.wpn_fps_ass_m4.uses_parts)

end)

--STRYK 18c
Hooks:PostHook(WeaponFactoryTweakData, "_init_g18c", "resmod_g18c", function(self)

	--Ventilated Compensator
	self.parts.wpn_fps_pis_g18c_co_1.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_co_1.supported = true
	self.parts.wpn_fps_pis_g18c_co_1.stats = {
		value = 4,
		suppression = -2,
		recoil = 1,
		spread = -1
	}
	
	--Velocity Compensator
	self.parts.wpn_fps_pis_g18c_co_comp_2.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_co_comp_2.supported = true
	self.parts.wpn_fps_pis_g18c_co_comp_2.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--(STRYK 18c) Extended Mag.
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 15,
		concealment = -1,
		reload = -2
	}

	--(STRYK 18c) Stock
	self.parts.wpn_fps_pis_g18c_s_stock.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_s_stock.supported = true
	self.parts.wpn_fps_pis_g18c_s_stock.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--(STRYK 18c) Ergo Grip
	self.parts.wpn_fps_pis_g18c_g_ergo.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_g_ergo.supported = true
	self.parts.wpn_fps_pis_g18c_g_ergo.stats = {
		value = 4,
		recoil = -1,
		concealment = 1
	}

	--STRYK 18c Part Additions
	--Single/Autofire Locks
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_singlefire")	
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_autofire")		

	--Faster/Slower ROF mods (Unused)
	--[[
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_faster_rof")	
	]]--
	
	self.wpn_fps_pis_g18c_npc.uses_parts = deep_clone(self.wpn_fps_pis_g18c.uses_parts)

end)

--AMCAR
Hooks:PostHook(WeaponFactoryTweakData, "_init_amcar", "resmod_amcar", function(self)

	--AMCAR Override Tables
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_standard_vanilla = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	}
		
	--AMCAR Add Tables
	self.wpn_fps_ass_amcar.adds.wpn_fps_m4_upper_reciever_edge = {
		"wpn_fps_m4_uupg_o_flipup",
		"wpn_fps_m4_uupg_fg_rail_ext"
	}
		
	--AMCAR Default Blueprint, gotta basically override this weapon entirely to make it work with most mods
	self.wpn_fps_ass_amcar.default_blueprint = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_amcar_bolt_standard"
	}
	
	--AMCAR Part Table, ditto. Stuff commented out is WIP and I'm not gonna bother for a bit to preserve my mental state.
	self.wpn_fps_ass_amcar.uses_parts = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_m4_upper_reciever_round_vanilla",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_m4_upg_m_quick",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		--Custom parts after this point
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",		
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_smg_olympic_s_short",
		--"wpn_fps_m4_uupg_fg_lr300",
		--"wpn_fps_upg_fg_jp",
		--"wpn_fps_upg_fg_smr",		
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		--"wpn_fps_m4_upper_reciever_edge",
		--"wpn_fps_m4_uupg_o_flipup"
	}
	
	self.wpn_fps_ass_amcar_npc.uses_parts = deep_clone(self.wpn_fps_ass_amcar.uses_parts)

end)

--AMR-16 
Hooks:PostHook(WeaponFactoryTweakData, "_init_m16", "resmod_m16", function(self)

	--(AMR-16) Tactical Handguard
	self.parts.wpn_fps_m16_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m16_fg_railed.supported = true
	self.parts.wpn_fps_m16_fg_railed.stats = {
		value = 7,
		recoil = 1,
		spread = -1
	}

	--Blast From the Past Handguard
	self.parts.wpn_fps_m16_fg_vietnam.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m16_fg_vietnam.supported = true
	self.parts.wpn_fps_m16_fg_vietnam.stats = {
		value = 10,
		spread = -1,
		concealment = 1
	}

	--Overriding these
	self.wpn_fps_ass_m16.adds = {}
	self.wpn_fps_ass_m16.override = {}
	
	--AMR-16 Default Blueprint
	self.wpn_fps_ass_m16.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_m16_s_solid_vanilla",
		"wpn_fps_amcar_bolt_standard"
	}
	
	--AMR-16 Parts Table
	self.wpn_fps_ass_m16.uses_parts = {
		"wpn_fps_m16_fg_railed",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m16_fg_vietnam",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m16_s_solid_vanilla",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_upg_ass_m4_upper_reciever_ballos",
		"wpn_fps_upg_ass_m4_upper_reciever_core",
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		"wpn_fps_m4_uupg_draghandle_ballos",
		"wpn_fps_m4_uupg_draghandle_core",
		"wpn_fps_upg_ass_m4_b_beowulf",
		"wpn_fps_upg_ass_m16_fg_stag",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_ass_m16_b_legend",
		"wpn_fps_ass_m16_fg_legend",
		"wpn_fps_ass_m16_s_legend",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_m4_upg_m_quick",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		--Custom Parts below
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_smg_olympic_s_short"
	}
	
	self.wpn_fps_ass_m16_npc.uses_parts = deep_clone(self.wpn_fps_ass_m16.uses_parts)

end)

--Para
Hooks:PostHook(WeaponFactoryTweakData, "_init_olympic", "resmod_olympic", function(self)

	--(Para) Railed Handguard
	self.parts.wpn_fps_smg_olympic_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_olympic_fg_railed.supported = true
	self.parts.wpn_fps_smg_olympic_fg_railed.stats = {
		value = 4,
		recoil = 1,
		spread = -1
	}
	
	--Shorter Than Short Stock
	self.parts.wpn_fps_smg_olympic_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_olympic_s_short.supported = true
	self.parts.wpn_fps_smg_olympic_s_short.stats = {
		value = 5,
		recoil = -2,
		concealment = 2
	}

	--Para Default Blueprint
	self.wpn_fps_smg_olympic.default_blueprint = {
		"wpn_fps_smg_olympic_s_adjust",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m4_uupg_b_short_vanilla",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_smg_olympic_fg_olympic",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_amcar_bolt_standard"
	}
	
	--Para Part Table
	self.wpn_fps_smg_olympic.uses_parts = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_smg_olympic_fg_olympic",
		"wpn_fps_smg_olympic_fg_railed",
		"wpn_fps_smg_olympic_s_short",
		"wpn_fps_smg_olympic_s_adjust",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_m4_uupg_b_short_vanilla",
		"wpn_fps_m4_uupg_b_medium",
		"wpn_fps_m4_uupg_m_std_vanilla",
		--"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_upg_ass_m4_upper_reciever_ballos",
		"wpn_fps_upg_ass_m4_upper_reciever_core",
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		"wpn_fps_m4_uupg_draghandle_ballos",
		"wpn_fps_m4_uupg_draghandle_core",
		"wpn_fps_upg_smg_olympic_fg_lr300",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_upg_o_spot",
		"wpn_fps_m4_upg_m_quick",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",		
		--Custom Parts Below
		"wpn_fps_m4_uupg_s_fold"
	}
	
	self.wpn_fps_smg_olympic_npc.uses_parts = deep_clone(self.wpn_fps_smg_olympic.uses_parts)

end)

--Shared AK Parts
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak_parts", "resmod_ak_parts", function(self)

	--Railed Wooden Grip
	self.parts.wpn_upg_ak_fg_combo2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_fg_combo2.supported = true
	self.parts.wpn_upg_ak_fg_combo2.stats = {
		value = 3,
		spread = -1,
		recoil = 1
	}
	
	--The Tactical Russian Handguard
	self.parts.wpn_upg_ak_fg_combo3.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_fg_combo3.supported = true
	self.parts.wpn_upg_ak_fg_combo3.stats = {
		value = 5,
		spread = -2,
		recoil = 2
	}
	
	--(AK) Drum Mag
	self.parts.wpn_upg_ak_m_drum = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_upg_ak_m_drum",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum",
		dlc = "sc",
		supported = true,
		stats = {
			value = 5,
			spread = -2,
			concealment = -5,
			extra_ammo = 70,
			reload = -6
		}
	}
	self.parts.wpn_upg_ak_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_drum"
	self.parts.wpn_upg_ak_m_drum_vanilla = deep_clone(self.parts.wpn_upg_ak_m_drum)
	self.parts.wpn_upg_ak_m_drum_vanilla.stats = nil
	self.parts.wpn_upg_ak_m_drum_vanilla.pcs = nil	
	
	--(AK) Folding Stock
	self.parts.wpn_upg_ak_s_folding.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_folding.supported = true
	self.parts.wpn_upg_ak_s_folding.stats = {
		value = 3,
		recoil = -1,
		concealment = 1
	}
	
	--Wooden Sniper Stock
	self.parts.wpn_upg_ak_s_psl.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_psl.supported = true
	self.parts.wpn_upg_ak_s_psl.stats = {
		value = 6,
		spread = 3,
		recoil = -3,
		concealment = -3
	}
	self.parts.wpn_upg_ak_s_psl.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_upg_ak_s_psl.override = {
		wpn_fps_snp_flint_s_adapter = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		},
		wpn_fps_ass_flint_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		},	
		wpn_fps_smg_coal_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		}	
	}
	self.parts.wpn_upg_ak_s_psl.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_rk3"
	}
	
	--(AK) Folding Stock
	self.parts.wpn_upg_ak_s_skfoldable.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_skfoldable.supported = true
	self.parts.wpn_upg_ak_s_skfoldable.stats = {
		value = 3,
		recoil = -1,
		concealment = 1
	}

end)

--AK
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak74", "resmod_ak74", function(self)

	--AK74 Overrides Table
	self.wpn_fps_ass_74.override = {}

end)

--AK 7.62
Hooks:PostHook(WeaponFactoryTweakData, "_init_akm", "resmod_akm", function(self)

	--Drum Mag
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_akm_npc.uses_parts, "wpn_upg_ak_m_drum")
	self.wpn_fps_ass_akm_npc.uses_parts = deep_clone(self.wpn_fps_ass_akm.uses_parts)
	
end)

--Gold AK 7.62
Hooks:PostHook(WeaponFactoryTweakData, "_init_akm_gold", "resmod_akm_gold", function(self)

	--Drum Mag
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_akm_gold_npc.uses_parts, "wpn_upg_ak_m_drum")
	self.wpn_fps_ass_akm_gold_npc.uses_parts = deep_clone(self.wpn_fps_ass_akm_gold.uses_parts)

end)

--Krinkov
Hooks:PostHook(WeaponFactoryTweakData, "_init_akmsu", "resmod_akmsu", function(self)

	--Moscow Special Rail
	self.parts.wpn_fps_smg_akmsu_fg_rail.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_smg_akmsu_fg_rail.supported = true
	self.parts.wpn_fps_smg_akmsu_fg_rail.stats = {
		value = 1, 
		spread = 1, 
		recoil = -1,
		concealment = -1
	}

end)

--Izhma 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_saiga", "resmod_saiga", function(self)

	--(Izhma) The Tactical Russian Rail
	self.parts.wpn_upg_saiga_fg_lowerrail.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_upg_saiga_fg_lowerrail.supported = true
	self.parts.wpn_upg_saiga_fg_lowerrail.stats = {
		value = 3,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_upg_saiga_fg_lowerrail.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}	
	
	--(Izhma) Drum Mag
	self.parts.wpn_upg_saiga_m_20rnd = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_saiga_m_20rnd",
		a_obj = "a_m",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_upg_saiga_m_20rnd",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd",
		supported = true,
		stats = {value = 1, extra_ammo = 14, spread = -1, reload = -7, concealment = -3}
	}
	self.parts.wpn_upg_saiga_m_20rnd.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_saiga_m_20rnd"
	
	--Izhma Override Table
	self.wpn_fps_shot_saiga.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {
			a_obj = "a_or",
			forbids = table.list_add(self.parts.wpn_upg_o_marksmansight_rear_vanilla.forbids, {"wpn_fps_upg_o_ak_scopemount"})
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"},
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -33,
				damage = 15,
				recoil = -2,
				spread = 8,
				suppression = -1,
				spread_multi = {1, 1},	
				moving_spread = 0
			},
			custom_stats = {
				damage_near_mul = 999,
				damage_far_mul = 999,
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",					
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 30
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_auto_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_auto_override		
	}
	
	--Izhma Part Additions
	--Drum Mag
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_saiga_m_20rnd")
	table.insert(self.wpn_fps_shot_saiga_npc.uses_parts, "wpn_upg_saiga_m_20rnd")	

	self.wpn_fps_shot_saiga_npc.uses_parts = deep_clone(self.wpn_fps_shot_saiga.uses_parts)

end)

--AK5
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak5", "resmod_ak5", function(self)

	--Karbin Ceres Handguard
	self.parts.wpn_fps_ass_ak5_fg_ak5c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_fg_ak5c.supported = true
	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats = {
		value = 7,
		spread = -1,
		recoil = 1
	}
	
	--Belgian Heat Handguard
	self.parts.wpn_fps_ass_ak5_fg_fnc.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_fg_fnc.supported = true
	self.parts.wpn_fps_ass_ak5_fg_fnc.stats = {
		value = 7,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Bertil Stock
	self.parts.wpn_fps_ass_ak5_s_ak5b.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_s_ak5b.supported = true
	self.parts.wpn_fps_ass_ak5_s_ak5b.stats = {
		value = 5,
		spread = -1,
		recoil = 1
	}
	
	--Caesar Stock
	self.parts.wpn_fps_ass_ak5_s_ak5c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_s_ak5c.supported = true
	self.parts.wpn_fps_ass_ak5_s_ak5c.stats = {
		value = 7,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

end)

--UAR
Hooks:PostHook(WeaponFactoryTweakData, "_init_aug", "resmod_aug", function(self)

	--(UAR) Long Barrel
	self.parts.wpn_fps_aug_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_b_long.supported = true
	self.parts.wpn_fps_aug_b_long.stats = {
		value = 6,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--(UAR) Short Barrel
	self.parts.wpn_fps_aug_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_b_short.supported = true
	self.parts.wpn_fps_aug_b_short.stats = {
		value = 4,
		spread = -1,
		concealment = 1
	}

	--A3 Tactical Foregrip
	self.parts.wpn_fps_aug_fg_a3.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_fg_a3.supported = true
	self.parts.wpn_fps_aug_fg_a3.stats = {
		value = 7,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--UAR Default Blueprint
	self.wpn_fps_ass_aug.default_blueprint = {
		"wpn_fps_aug_body_aug",
		"wpn_fps_aug_b_medium",
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		"wpn_fps_aug_m_pmag",
		"wpn_upg_o_marksmansight_rear_vanilla"
	}
	
	--UAR Parts Table
	self.wpn_fps_ass_aug.uses_parts = {
		"wpn_fps_aug_body_aug",
		"wpn_fps_aug_fg_a3",
		"wpn_fps_aug_ris_special",
		"wpn_fps_aug_b_long",
		"wpn_fps_aug_b_medium",
		"wpn_fps_aug_b_short",
		"wpn_fps_aug_m_pmag",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_upg_o_marksmansight_front_vanilla",
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		--"wpn_fps_upg_vg_ass_smg_stubby",
		--"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_aug_body_f90",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_ass_aug_m_quick",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel"			
	}
	
	self.wpn_fps_ass_aug_npc.uses_parts = deep_clone(self.wpn_fps_ass_aug.uses_parts)

end)

--JP36
Hooks:PostHook(WeaponFactoryTweakData, "_init_g36", "resmod_g36", function(self)

	--Compact Foregrip
	self.parts.wpn_fps_ass_g36_fg_c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_fg_c.supported = true
	self.parts.wpn_fps_ass_g36_fg_c.stats = {
		value = 4,
		recoil = -1,
		concealment = 1
	}
	
	--Polizei Special Foregrip
	self.parts.wpn_fps_ass_g36_fg_ksk.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_fg_ksk.supported = true
	self.parts.wpn_fps_ass_g36_fg_ksk.stats = {
		value = 5,
		recoil = 1,
		spread = -1
	}
	
	--(JP36) Solid Stock
	self.parts.wpn_fps_ass_g36_s_kv.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_s_kv.supported = true
	self.parts.wpn_fps_ass_g36_s_kv.stats = {
		value = 4,
		recoil = 1,
		spread = -1
	}
	
	--(JP36) Sniper Stock
	self.parts.wpn_fps_ass_g36_s_sl8.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_s_sl8.supported = true
	self.parts.wpn_fps_ass_g36_s_sl8.stats = {
		value = 6,
		recoil = -1,
		spread = 1,
		concealment = -1
	}

end)

--Kobus 90
Hooks:PostHook(WeaponFactoryTweakData, "_init_p90", "resmod_p90", function(self)

	--(Kobus 90) Long Barrel
	self.parts.wpn_fps_smg_p90_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_p90_b_long.supported = true
	self.parts.wpn_fps_smg_p90_b_long.stats = {
		value = 7,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--(Kobus 90) Tan Body
	self.parts.wpn_fps_smg_p90_body_p90_tan = {
		pcs = {},
		type = "lower_reciever",
		name_id = "bm_wp_p90_body_p90_tan",
		a_obj = "a_body",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_p90_body_tan",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_body_tan",
		supported = true,
		stats = {value = 0},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_p90_body_p90_tan.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_body_p90"
	
	--Kobus 90 Part Additions
	--Tan Body
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_smg_p90_body_p90_tan")
	table.insert(self.wpn_fps_smg_p90_npc.uses_parts, "wpn_fps_smg_p90_body_p90_tan")	
	
	self.wpn_fps_smg_p90_npc.uses_parts = deep_clone(self.wpn_fps_smg_p90.uses_parts)

end)

--M308
Hooks:PostHook(WeaponFactoryTweakData, "_init_m14", "resmod_m14", function(self)

	--Abraham Body
	self.parts.wpn_fps_ass_m14_body_ebr.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_ass_m14_body_ebr.supported = true
	self.parts.wpn_fps_ass_m14_body_ebr.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
		
	--Jaeger Body
	self.parts.wpn_fps_ass_m14_body_jae.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_ass_m14_body_jae.supported = true
	self.parts.wpn_fps_ass_m14_body_jae.stats = {
		value = 2,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
		
	--M308 Additional Parts	
	--Vertical Grips
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")	
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")		
	
	--ROF Mods (Unused)
	--[[
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_i_faster_rof")		
	]]--
	
	self.wpn_fps_ass_m14_npc.uses_parts = deep_clone(self.wpn_fps_ass_m14.uses_parts)

end)

--CMP
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp9", "resmod_mp9", function(self)

	--(CMP) Extended Mag
	self.parts.wpn_fps_smg_mp9_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp9_m_extended.supported = true
	self.parts.wpn_fps_smg_mp9_m_extended.stats = {
		value = 4,
		concealment = -1,
		reload = -1,
		extra_ammo = 10
	}
	
	--(CMP) Skeletal Stock
	self.parts.wpn_fps_smg_mp9_s_skel.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp9_s_skel.supported = true
	self.parts.wpn_fps_smg_mp9_s_skel.stats = {
		value = 5,
		recoil = 1,
		spread = -1
	}
	
	--CMP Part Table
	self.wpn_fps_smg_mp9.uses_parts = {
		"wpn_fps_smg_mp9_b_dummy",
		"wpn_fps_smg_mp9_b_suppressed",
		"wpn_fps_smg_mp9_body_mp9",
		"wpn_fps_smg_mp9_m_extended",
		"wpn_fps_smg_mp9_m_short",
		"wpn_fps_smg_mp9_s_fold",
		"wpn_fps_smg_mp9_s_skel",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_t1micro",
		--"wpn_fps_upg_vg_ass_smg_stubby",
		--"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1"
	}
	self.wpn_fps_smg_mp9_npc.uses_parts = deep_clone(self.wpn_fps_smg_mp9.uses_parts)

end)

--Deagle
Hooks:PostHook(WeaponFactoryTweakData, "_init_deagle", "resmod_deagle", function(self)

	--(Deagle) Long Barrel
	self.parts.wpn_fps_pis_deagle_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_b_long.supported = true
	self.parts.wpn_fps_pis_deagle_b_long.stats = {
		value = 5,
		recoil = -1,
		spread = 1,
		concealment = -1
	}

	--OVERKILL Compensator
	self.parts.wpn_fps_pis_deagle_co_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_co_long.supported = true
	self.parts.wpn_fps_pis_deagle_co_long.stats = {
		value = 3,
		spread = 1,
		recoil = -1
	}
	
	--La Femme Compensator
	self.parts.wpn_fps_pis_deagle_co_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_co_short.supported = true
	self.parts.wpn_fps_pis_deagle_co_short.stats = {
		value = 2,
		recoil = 1,
		suppression = -2,
		spread = -1
	}

	--(Deagle) Bling Grip
	self.parts.wpn_fps_pis_deagle_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_g_bling.supported = true
	self.parts.wpn_fps_pis_deagle_g_bling.stats = {
		value = 10,
		recoil = 1,
		spread = -1
	}
	
	--(Deagle) Ergo Grip
	self.parts.wpn_fps_pis_deagle_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_g_ergo.supported = true
	self.parts.wpn_fps_pis_deagle_g_ergo.stats = {
		value = 5,
		recoil = -1,
		concealment = 1
	}

	self.parts.wpn_fps_pis_deagle_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_m_extended.supported = true
	self.parts.wpn_fps_pis_deagle_m_extended.stats = {
		value = 5,
		concealment = -1,
		reload = -1,
		extra_ammo = 2
	}
	
	--Deagle Additional Parts	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_deagle_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_deagle_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_deagle_npc.uses_parts = deep_clone(self.wpn_fps_pis_deagle.uses_parts)

end)

--Compact-5
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp5", "resmod_mp5", function(self)

	--Sehr Kurze Barrel
	self.parts.wpn_fps_smg_mp5_fg_m5k.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_m5k.supported = true
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats = {
		value = 4,
		recoil = -1,
		concealment = 1
	}
	
	--Polizei Tactical Barrel
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.supported = true
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--The Ninja Barrel
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.supported = true
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.perks = {"silencer"}
	
	--(Compact-5) Drum Mag
	self.parts.wpn_fps_smg_mp5_m_drum = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_mp5_m_drum",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum",
		dlc = "sc",
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 20,
			spread = -1,
			concealment = -2,
			reload = -2
		}
	}
	self.parts.wpn_fps_smg_mp5_m_drum.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_drum"
	
	--(Compact-5) Adjustable Stock
	self.parts.wpn_fps_smg_mp5_s_adjust.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_s_adjust.supported = true
	self.parts.wpn_fps_smg_mp5_s_adjust.stats = {
		value = 3,
		recoil = -1,
		concealment = 1
	}
	
	--(Compact-5) Bare Essentials Stock
	self.parts.wpn_fps_smg_mp5_s_ring.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_s_ring.supported = true
	self.parts.wpn_fps_smg_mp5_s_ring.stats = {
		value = 3,
		recoil = -2,
		concealment = 2
	}

end)

--Crosskill
Hooks:PostHook(WeaponFactoryTweakData, "_init_colt_1911", "resmod_1911", function(self)

	--Long Vented Slide
	self.parts.wpn_fps_pis_1911_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_b_long.supported = true
	self.parts.wpn_fps_pis_1911_b_long.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Vented Slide
	self.parts.wpn_fps_pis_1911_b_vented.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_b_vented.supported = true
	self.parts.wpn_fps_pis_1911_b_vented.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}

	--Punisher Compensator
	self.parts.wpn_fps_pis_1911_co_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_co_1.supported = true
	self.parts.wpn_fps_pis_1911_co_1.stats = {
		value = 5,
		suppression = -2,
		recoil = 1,
		spread = -1
	}
	
	--Aggressor Compensator
	self.parts.wpn_fps_pis_1911_co_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_co_2.supported = true
	self.parts.wpn_fps_pis_1911_co_2.stats = {
		value = 2,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--Bling Grip
	self.parts.wpn_fps_pis_1911_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_g_bling.supported = true
	self.parts.wpn_fps_pis_1911_g_bling.stats = {
		value = 10,
		recoil = 1,
		spread = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_1911_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_g_ergo.supported = true
	self.parts.wpn_fps_pis_1911_g_ergo.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}

	--12rnd Mag.
	self.parts.wpn_fps_pis_1911_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_m_extended.supported = true
	self.parts.wpn_fps_pis_1911_m_extended.stats = {
		value = 3,
		concealment = -1,
		extra_ammo = 4,
		reload = -1
	}

end)

--Mark 10
Hooks:PostHook(WeaponFactoryTweakData, "_init_mac10", "resmod_mac10", function(self)

	--Railed Handguard
	self.parts.wpn_fps_smg_mac10_body_ris.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_body_ris.supported = true
	self.parts.wpn_fps_smg_mac10_body_ris.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Extended Mag.
	self.parts.wpn_fps_smg_mac10_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_m_extended.supported = true
	self.parts.wpn_fps_smg_mac10_m_extended.stats = {
		value = 2,
		concealment = -1,
		extra_ammo = 10,
		reload = -1
	}

	--Skeletal Stock
	self.parts.wpn_fps_smg_mac10_s_skel.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_s_skel.supported = true
	self.parts.wpn_fps_smg_mac10_s_skel.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_smg_mac10_s_no")
	table.insert(self.wpn_fps_smg_mac10_npc.uses_parts, "wpn_fps_smg_mac10_s_no")		
	
	self.wpn_fps_smg_mac10_npc.uses_parts = deep_clone(self.wpn_fps_smg_mac10.uses_parts)	
	
end)

--Reinfeld 880
Hooks:PostHook(WeaponFactoryTweakData, "_init_r870", "resmod_r870", function(self)
	
	--Shell Rack
	self.parts.wpn_fps_shot_r870_body_rack.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_body_rack.supported = true
	self.parts.wpn_fps_shot_r870_body_rack.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	self.parts.wpn_fps_shot_r870_body_rack.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}	

	--Zombie Hunter Pump
	self.parts.wpn_fps_shot_r870_fg_wood.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_fg_wood.supported = true
	self.parts.wpn_fps_shot_r870_fg_wood.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Extended Mag.
	self.parts.wpn_fps_shot_r870_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_m_extended.supported = true
	self.parts.wpn_fps_shot_r870_m_extended.stats = {
		value = 7,
		concealment = -1,
		extra_ammo = 2
	}
	
	--Muldon Stock
	self.parts.wpn_fps_shot_r870_s_folding.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_folding.supported = true
	self.parts.wpn_fps_shot_r870_s_folding.stats = {
		value = 5,
		recoil = -2,
		concealment = 2
	}

	--Standard Stock
	self.parts.wpn_fps_shot_r870_s_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_solid.supported = true
	self.parts.wpn_fps_shot_r870_s_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_shot_r870_s_solid.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Short Enough Tactical Stock
	self.parts.wpn_fps_shot_r870_s_nostock_big.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_nostock_big.supported = true
	self.parts.wpn_fps_shot_r870_s_nostock_big.stats = {
		value = 4,
		recoil = -1,
		concealment = 1
	}

	--Short Enough Stock
	self.parts.wpn_fps_shot_r870_s_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_nostock.supported = true
	self.parts.wpn_fps_shot_r870_s_nostock.stats = {
		value = 2,
		recoil = -3,
		concealment = 3
	}
	
	--Government Issue Tactical Stock
	self.parts.wpn_fps_shot_r870_s_solid_big.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_solid_big.supported = true
	self.parts.wpn_fps_shot_r870_s_solid_big.stats = {
		value = 3,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_shot_r870_s_solid_big.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--???
	self.parts.wpn_fps_shot_r870_s_solid_single.supported = true
	self.parts.wpn_fps_shot_r870_s_solid_single.stats = {
		value = 3,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_shot_r870_s_solid_single.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Override Table
	self.wpn_fps_shot_r870.override = {
		wpn_fps_upg_a_slug = {
			supported = true,
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			stats = {
				value = 10,
				total_ammo_mod = -33,
				damage = 30,
				recoil = -2,
				spread = 8,
				spread_multi = {1, 1},	
				moving_spread = 0,
				suppression = -1,
				concealment = -5
			},
			custom_stats = {				
				damage_near_mul = 999,
				damage_far_mul = 999,
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",										
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 30
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},	
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 30
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},			
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				concealment = -7,
				damage = 60
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_pump_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
	}
	
	--Use Part Table
	self.wpn_fps_shot_r870.uses_parts = {
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_long",
		"wpn_fps_shot_r870_fg_big",
		"wpn_fps_shot_r870_fg_railed",
		"wpn_fps_shot_r870_fg_wood",
		"wpn_fps_shot_r870_m_extended",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_m4",
		--"wpn_fps_upg_m4_s_standard",
		--"wpn_fps_upg_m4_s_pts",
		"wpn_fps_shot_r870_s_nostock_big",
		"wpn_fps_shot_r870_s_nostock_single",
		"wpn_fps_shot_r870_s_nostock",
		"wpn_fps_shot_r870_s_solid_vanilla",
		"wpn_fps_shot_r870_s_solid_big",
		"wpn_fps_shot_r870_s_solid_single",
		"wpn_fps_upg_m4_g_standard",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		--"wpn_fps_upg_m4_s_crane",
		--"wpn_fps_upg_m4_s_mk46",
		--"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_shot_r870_b_legendary",
		"wpn_fps_shot_r870_s_legendary",
		"wpn_fps_shot_r870_fg_legendary",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_ns_duck",
		--"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		--Custom stuff
		"wpn_fps_shot_r870_s_folding_ext"
	}
	
	self.wpn_fps_shot_r870_npc.uses_parts = deep_clone(self.wpn_fps_shot_r870.uses_parts)

end)

--Locomotive 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_serbu", "resmod_serbu", function(self)
	
	--Extended Mag.
	self.parts.wpn_fps_shot_shorty_m_extended_short.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_m_extended_short.supported = true
	self.parts.wpn_fps_shot_shorty_m_extended_short.stats = {
		value = 1, 
		extra_ammo = 2, 
		concealment = -1
	}

	--Tactical Shorty Stock
	self.parts.wpn_fps_shot_shorty_s_nostock_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_s_nostock_short.supported = true
	self.parts.wpn_fps_shot_shorty_s_nostock_short.stats = {
		value = 4,
		recoil = -1,
		concealment = 1
	}
	
	--Police Shorty Stock
	self.parts.wpn_fps_shot_shorty_s_solid_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_s_solid_short.supported = true
	self.parts.wpn_fps_shot_shorty_s_solid_short.stats = {
		value = 3,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_shot_shorty_s_solid_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Locomotive 12g override table
	self.wpn_fps_shot_serbu.override = {
		wpn_fps_upg_a_slug = {
			supported = true,
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			stats = {
				value = 10,
				total_ammo_mod = -33,
				damage = 30,
				recoil = -2,
				spread = 8,
				spread_multi = {1, 1},	
				moving_spread = 0,
				suppression = -1,
				concealment = -5
			},
			custom_stats = {
				damage_near_mul = 999,
				damage_far_mul = 999,
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",										
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 30
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},	
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 30
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},			
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				concealment = -7,
				damage = 60
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_pump_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override			
	}
	
	--Use Part Table
	self.wpn_fps_shot_serbu.uses_parts = {
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_railed",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_m4",
		--"wpn_fps_upg_m4_s_standard",
		--"wpn_fps_upg_m4_s_pts",
		"wpn_fps_shot_shorty_s_nostock_short",
		"wpn_fps_shot_r870_s_nostock_single",
		"wpn_fps_shot_r870_s_nostock_vanilla",
		"wpn_fps_shot_r870_s_solid",
		"wpn_fps_shot_shorty_s_solid_short",
		"wpn_fps_shot_r870_s_solid_single",
		"wpn_fps_upg_m4_g_standard",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_shot_shorty_b_legendary",
		"wpn_fps_shot_shorty_s_legendary",
		"wpn_fps_shot_shorty_fg_legendary",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		--"wpn_fps_upg_m4_s_crane",
		--"wpn_fps_upg_m4_s_mk46",
		--"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_ns_duck",
		--"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		--Custom stuff
		"wpn_fps_shot_r870_s_folding_ext"
	}	
	
	self.wpn_fps_shot_serbu_npc.uses_parts = deep_clone(self.wpn_fps_shot_serbu.uses_parts)

end)

--Chimano 88
Hooks:PostHook(WeaponFactoryTweakData, "_init_g17", "resmod_g17", function(self)
		
	--Chimano 88 Part Additions
	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_g_ergo")

	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	self.wpn_fps_pis_g17_npc.uses_parts = deep_clone(self.wpn_fps_pis_g17.uses_parts)
		
end)

--Bernetti 9
Hooks:PostHook(WeaponFactoryTweakData, "_init_b92fs", "resmod_b92fs", function(self)
		
	--The Professional Compensator
	self.parts.wpn_fps_pis_beretta_co_co1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_co_co1.supported = true
	self.parts.wpn_fps_pis_beretta_co_co1.stats = {
		value = 4,
		recoil = 1,
		suppression = -2,
		spread = -1
	}
	
	--The Competitor Compensator
	self.parts.wpn_fps_pis_beretta_co_co2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_co_co2.supported = true
	self.parts.wpn_fps_pis_beretta_co_co2.stats = {
		value = 3,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_beretta_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_g_ergo.supported = true
	self.parts.wpn_fps_pis_beretta_g_ergo.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

	--Extended Mag.
	self.parts.wpn_fps_pis_beretta_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_m_extended.supported = true
	self.parts.wpn_fps_pis_beretta_m_extended.stats = {
		value = 2,
		concealment = -1,
		extra_ammo = 14,
		reload = -2
	}

	--The Elite Slide
	self.parts.wpn_fps_pis_beretta_sl_brigadier.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_sl_brigadier.supported = true
	self.parts.wpn_fps_pis_beretta_sl_brigadier.stats = {
		value = 1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--Bernetti 9 Part Additions
	table.insert(self.wpn_fps_pis_beretta.uses_parts, "wpn_fps_upg_i_93r")
	table.insert(self.wpn_fps_pis_beretta_npc.uses_parts, "wpn_fps_upg_i_93r")
	
	self.wpn_fps_pis_beretta_npc.uses_parts = deep_clone(self.wpn_fps_pis_beretta.uses_parts)
		
end)

--Mosconi 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_huntsman", "resmod_huntsman", function(self)
	
	--Road Warrior Barrel
	self.parts.wpn_fps_shot_huntsman_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_huntsman_b_short.supported = true
	self.parts.wpn_fps_shot_huntsman_b_short.stats = {
		value = 10,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_shot_huntsman_b_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Gangsta Special Stock
	self.parts.wpn_fps_shot_huntsman_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_huntsman_s_short.supported = true
	self.parts.wpn_fps_shot_huntsman_s_short.stats = {
		value = 10,
		recoil = -1,
		concealment = 1
	}

	--Mosconi Override Table
	self.wpn_fps_shot_huntsman.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -5,
				concealment = -7,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
	}
	
	self.wpn_fps_shot_huntsman_npc.uses_parts = deep_clone(self.wpn_fps_shot_huntsman.uses_parts)
	
end)

--Bronco .44
Hooks:PostHook(WeaponFactoryTweakData, "_init_raging_bull", "resmod_raging_bull", function(self)
	
	--Aggressor Barrel
	self.parts.wpn_fps_pis_rage_b_comp1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_comp1.supported = true
	self.parts.wpn_fps_pis_rage_b_comp1.stats = {
		value = 3,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Ventilated Barrel
	self.parts.wpn_fps_pis_rage_b_comp2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_comp2.supported = true
	self.parts.wpn_fps_pis_rage_b_comp2.stats = {
		value = 5,
		recoil = 1,
		spread = -1
	}

	--Overcompensating Barrel
	self.parts.wpn_fps_pis_rage_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_long.supported = true
	self.parts.wpn_fps_pis_rage_b_long.stats = {
		value = 5,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	
	--Pocket Surprise Barrel
	self.parts.wpn_fps_pis_rage_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_short.supported = true
	self.parts.wpn_fps_pis_rage_b_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}

	--Slimline Body
	self.parts.wpn_fps_pis_rage_body_smooth.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_body_smooth.supported = true
	self.parts.wpn_fps_pis_rage_body_smooth.stats = {
		value = 5,
		recoil = -1,
		concealment = 1
	}

	--Ergo Wooden Grip
	self.parts.wpn_fps_pis_rage_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_g_ergo.supported = true
	self.parts.wpn_fps_pis_rage_g_ergo.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}
	
	--Bronco .44 Part Additions
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_rage_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_rage_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")
	table.insert(self.wpn_fps_pis_rage_npc.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")		
	
	self.wpn_fps_pis_rage_npc.uses_parts = deep_clone(self.wpn_fps_pis_rage.uses_parts)	

end)

--OVE9000 SAW
Hooks:PostHook(WeaponFactoryTweakData, "_init_saw", "resmod_saw", function(self)
	
	--Nothing for now
	
end)

--Interceptor .45
Hooks:PostHook(WeaponFactoryTweakData, "_init_usp", "resmod_usp", function(self)
	
	--Expert Slide
	self.parts.wpn_fps_pis_usp_b_expert.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_b_expert.supported = true
	self.parts.wpn_fps_pis_usp_b_expert.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}
	
	--Match Slide
	self.parts.wpn_fps_pis_usp_b_match.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_b_match.supported = true
	self.parts.wpn_fps_pis_usp_b_match.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Extended Mag.
	self.parts.wpn_fps_pis_usp_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_m_extended.supported = true
	self.parts.wpn_fps_pis_usp_m_extended.stats = {
		value = 2,
		concealment = -1,
		extra_ammo = 8,
		reload = -2
	}
	
	--Ventilated .45
	self.parts.wpn_fps_pis_usp_co_comp_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_co_comp_1.supported = true
	self.parts.wpn_fps_pis_usp_co_comp_1.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Velocity .45
	self.parts.wpn_fps_pis_usp_co_comp_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_co_comp_2.supported = true
	self.parts.wpn_fps_pis_usp_co_comp_2.stats = {
		value = 5,
		recoil = 1,
		suppression = -2,
		spread = -1
	}
	
	--Part Additions
	table.insert(self.wpn_fps_pis_usp.uses_parts, "wpn_fps_upg_fl_pis_socomlam")
	table.insert(self.wpn_fps_pis_usp_npc.uses_parts, "wpn_fps_upg_fl_pis_socomlam")		
	
	self.wpn_fps_pis_usp_npc.uses_parts = deep_clone(self.wpn_fps_pis_usp.uses_parts)		

end)	

--Chimano Custom
Hooks:PostHook(WeaponFactoryTweakData, "_init_g22c", "resmod_g22c", function(self)
	
	--Long Slide
	self.parts.wpn_fps_pis_g22c_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g22c_b_long.supported = true
	self.parts.wpn_fps_pis_g22c_b_long.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Chimano Custom Overrides
	self.wpn_fps_pis_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 12,
			concealment = -1,
			reload = -2
		}
	}
	
	self.wpn_fps_pis_g22c_npc.uses_parts = deep_clone(self.wpn_fps_pis_g22c.uses_parts)	
	
end)

--The Judge
Hooks:PostHook(WeaponFactoryTweakData, "_init_judge", "resmod_judge", function(self)
	--Judge Override Table
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = {
		supported = true,
		stats = {
			value = 10,
			recoil = -5,
			spread_multi = {1, 1},	
			concealment = -7,
			total_ammo_mod = -60,
			damage = 90
		},
		custom_stats = {
			ignore_statistic = true,
			block_b_storm = true,
			rays = 1,
			damage_near_mul = 999,
			damage_far_mul = 999,
			bullet_class = "InstantExplosiveBulletBase"
		}
	}
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_slug = {
		supported = true,
		name_id = "bm_wp_upg_a_slug",
		desc_id = "bm_wp_upg_a_slug_desc",
		stats = {
			value = 10,
			concealment = -5,
			total_ammo_mod = -25,
			damage = 30,	
			recoil = -2,
			spread = 8,
			spread_multi = {1, 1},	
			suppression = -1
		},
		custom_stats = {
			muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",									
			damage_near_mul = 999,
			damage_far_mul = 999,
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true
		},
	}
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -25,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -25,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}			
	
end)	

--Swedish K
Hooks:PostHook(WeaponFactoryTweakData, "_init_m45", "resmod_m45", function(self)
	
	--Extended Mag.
	self.parts.wpn_fps_smg_m45_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_m_extended.supported = true
	self.parts.wpn_fps_smg_m45_m_extended.stats = {
		value = 4,
		concealment = -1,
		reload = -1,
		extra_ammo = 6
	}
	
	--Swedish Barrel
	self.parts.wpn_fps_smg_m45_b_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_b_green.supported = true
	self.parts.wpn_fps_smg_m45_b_green.stats = {
		value = 6,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Grease Barrel
	self.parts.wpn_fps_smg_m45_b_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_b_small.supported = true
	self.parts.wpn_fps_smg_m45_b_small.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}
	
	--Swedish Body
	self.parts.wpn_fps_smg_m45_body_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_body_green.supported = true
	self.parts.wpn_fps_smg_m45_body_green.stats = {
		value = 3,
		recoil = 1,
		spread = -1
	}

	--Folded Stock
	self.parts.wpn_fps_smg_m45_s_folded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_s_folded.supported = true
	self.parts.wpn_fps_smg_m45_s_folded.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_smg_m45_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_g_ergo.supported = true
	self.parts.wpn_fps_smg_m45_g_ergo.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Bling Grip
	self.parts.wpn_fps_smg_m45_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_g_bling.supported = true
	self.parts.wpn_fps_smg_m45_g_bling.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}

	table.insert(self.wpn_fps_smg_m45.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_smg_m45_npc.uses_parts, "wpn_fps_upg_i_singlefire")	

	table.insert(self.wpn_fps_smg_m45.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_smg_m45_npc.uses_parts, "wpn_fps_upg_i_autofire")		
	
	self.wpn_fps_smg_m45_npc.uses_parts = deep_clone(self.wpn_fps_smg_m45.uses_parts)	
	
end)	

--Commando 553
Hooks:PostHook(WeaponFactoryTweakData, "_init_s552", "resmod_s552", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_ass_s552_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_b_long.supported = true
	self.parts.wpn_fps_ass_s552_b_long.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Heat Treated Body
	self.parts.wpn_fps_ass_s552_body_standard_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_body_standard_black.supported = true
	self.parts.wpn_fps_ass_s552_body_standard_black.stats = {
		value = 7,
		recoil = -1,
		concealment = 1
	}

	--Enhanced Foregrip
	self.parts.wpn_fps_ass_s552_fg_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_fg_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats = {
		value = 0
	}
		
	--Railed Foregrip
	self.parts.wpn_fps_ass_s552_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_fg_railed.supported = true
	self.parts.wpn_fps_ass_s552_fg_railed.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Enhanced Grip
	self.parts.wpn_fps_ass_s552_g_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_g_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_g_standard_green.stats = {
		value = 0
	}
	
	--Enhanced Stock
	self.parts.wpn_fps_ass_s552_s_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_s_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_s_standard_green.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
end)

--Gruber Kurz
Hooks:PostHook(WeaponFactoryTweakData, "_init_ppk", "resmod_ppk", function(self)
	
	--Long Slide
	self.parts.wpn_fps_pis_ppk_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_ppk_b_long.supported = true
	self.parts.wpn_fps_pis_ppk_b_long.stats = {
		value = 3,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Laser Grip
	self.parts.wpn_fps_pis_ppk_g_laser.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_ppk_g_laser.supported = true
	self.parts.wpn_fps_pis_ppk_g_laser.stats = {value = 1}
	self.parts.wpn_fps_pis_ppk_g_laser.perks = {"gadget"}
	
	--Gruber Kurz Part Additions
	table.insert(self.wpn_fps_pis_ppk.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_ppk_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
	
	table.insert(self.wpn_fps_pis_ppk.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_ppk_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_ppk_npc.uses_parts = deep_clone(self.wpn_fps_pis_ppk.uses_parts)		
	
end)

--SpecOps
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp7", "resmod_mp7", function(self)

	--Extended Mag.
	self.parts.wpn_fps_smg_mp7_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_m_extended.supported = true
	self.parts.wpn_fps_smg_mp7_m_extended.stats = {
		value = 1,
		concealment = -1,
		reload = -1,
		extra_ammo = 10
	}

	--Suppressed Barrel
	self.parts.wpn_fps_smg_mp7_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_b_suppressed.supported = true
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_mp7_b_suppressed.perks = {"silencer"}

	--Unfolded Stock
	self.parts.wpn_fps_smg_mp7_s_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_s_long.supported = true
	self.parts.wpn_fps_smg_mp7_s_long.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
end)

--Eagle Heavy
Hooks:PostHook(WeaponFactoryTweakData, "_init_scar", "resmod_scar", function(self)

	--Long Barrel
	self.parts.wpn_fps_ass_scar_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_b_long.supported = true
	self.parts.wpn_fps_ass_scar_b_long.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Short Barrel
	self.parts.wpn_fps_ass_scar_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_b_short.supported = true
	self.parts.wpn_fps_ass_scar_b_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}

	--Rail Extension
	self.parts.wpn_fps_ass_scar_fg_railext.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_fg_railext.supported = true
	self.parts.wpn_fps_ass_scar_fg_railext.stats = {
		value = 4,
		recoil = 1,
		spread = -1
	}

	--Sniper Stock
	self.parts.wpn_fps_ass_scar_s_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_s_sniper.supported = true
	self.parts.wpn_fps_ass_scar_s_sniper.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Eagle Heavy Default Blueprint
	self.wpn_fps_ass_scar.default_blueprint = {
		"wpn_fps_ass_scar_m_standard",
		"wpn_fps_ass_scar_b_medium",
		"wpn_fps_ass_scar_body_standard",
		"wpn_fps_ass_scar_s_standard",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_upg_m4_g_hgrip_vanilla",
		"wpn_fps_upg_vg_ass_smg_afg_vanilla",
		"wpn_fps_ass_scar_ns_standard"
	}
	
	--Eagle Heavy Parts
	self.wpn_fps_ass_scar.uses_parts = {
		"wpn_fps_ass_scar_m_standard",
		"wpn_fps_ass_scar_ns_standard",
		"wpn_fps_ass_scar_ns_short",
		"wpn_fps_ass_scar_b_medium",
		"wpn_fps_ass_scar_b_long",
		"wpn_fps_ass_scar_b_short",
		"wpn_fps_ass_scar_body_standard",
		"wpn_fps_ass_scar_fg_railext",
		"wpn_fps_ass_scar_s_standard",
		"wpn_fps_ass_scar_s_sniper",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_ass_scar_o_flipups_down",
		"wpn_fps_upg_m4_g_hgrip_vanilla",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_vg_ass_smg_afg_vanilla",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel"				
	}

end)

--Signature .40
Hooks:PostHook(WeaponFactoryTweakData, "_init_p226", "resmod_p226", function(self)

	--Two Tone Slide
	self.parts.wpn_fps_pis_p226_b_equinox.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_b_equinox.supported = true
	self.parts.wpn_fps_pis_p226_b_equinox.stats = {
		value = 4,
		spread = -1,
		concealment = 1
	}
	
	--Long Slide
	self.parts.wpn_fps_pis_p226_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_b_long.supported = true
	self.parts.wpn_fps_pis_p226_b_long.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_p226_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_g_ergo.supported = true
	self.parts.wpn_fps_pis_p226_g_ergo.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

	--Extended Mag.
	self.parts.wpn_fps_pis_p226_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_m_extended.supported = true
	self.parts.wpn_fps_pis_p226_m_extended.stats = {
		value = 1,
		extra_ammo = 12,
		reload = -2,
		concealment = -1
	}

	--Ventilated .40
	self.parts.wpn_fps_pis_p226_co_comp_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_co_comp_1.supported = true
	self.parts.wpn_fps_pis_p226_co_comp_1.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Velocity .40
	self.parts.wpn_fps_pis_p226_co_comp_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_co_comp_2.supported = true
	self.parts.wpn_fps_pis_p226_co_comp_2.stats = {
		value = 5,
		recoil = 1,
		suppression = -2,
		spread = -1
	}
	
end)

--Brenner-21
Hooks:PostHook(WeaponFactoryTweakData, "_init_hk21", "resmod_hk21", function(self)

	--Long Barrel
	self.parts.wpn_fps_lmg_hk21_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_b_long.supported = true
	self.parts.wpn_fps_lmg_hk21_b_long.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Short Foregrip
	self.parts.wpn_fps_lmg_hk21_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_fg_short.supported = true
	self.parts.wpn_fps_lmg_hk21_fg_short.stats = {
		value = 6,
		recoil = -1,
		concealment = 1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_lmg_hk21_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_g_ergo.supported = true
	self.parts.wpn_fps_lmg_hk21_g_ergo.stats = {
		value = 3,
		spread = -1,
		recoil = 1
	}

	--Adds Rails
	self.wpn_fps_lmg_hk21.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_sig = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_bmg = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_uh = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_ass_g3_body_rail" },		
	}
		
	--HK21 Part Additions
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_upg_o_fc1")		
			
	self.wpn_fps_lmg_hk21_npc.uses_parts = deep_clone(self.wpn_fps_lmg_hk21.uses_parts)		
		
end)

--KSP
Hooks:PostHook(WeaponFactoryTweakData, "_init_m249", "resmod_m249", function(self)

	--Long Barrel
	self.parts.wpn_fps_lmg_m249_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_b_long.supported = true
	self.parts.wpn_fps_lmg_m249_b_long.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Railed Foregrip
	self.parts.wpn_fps_lmg_m249_fg_mk46.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_fg_mk46.supported = true
	self.parts.wpn_fps_lmg_m249_fg_mk46.stats = {
		value = 4,
		recoil = 1,
		spread = -1,
	}

	--Solid Stock
	self.parts.wpn_fps_lmg_m249_s_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_s_solid.supported = true
	self.parts.wpn_fps_lmg_m249_s_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--M249 Part Additions
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_fc1")		
			
	self.wpn_fps_lmg_m249_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m249.uses_parts)			

end)

--RPK
Hooks:PostHook(WeaponFactoryTweakData, "_init_rpk", "resmod_rpk", function(self)

	--Tactical Foregrip
	self.parts.wpn_fps_lmg_rpk_fg_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_rpk_fg_standard.supported = true
	self.parts.wpn_fps_lmg_rpk_fg_standard.stats = {
		value = 6,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_lmg_rpk_fg_standard.adds = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		"wpn_fps_addon_ris"
	}
	
	--Default Stock
	self.parts.wpn_fps_lmg_rpk_s_wood.adds = {
		"wpn_upg_ak_g_standard"
	}	
	
	--Plastic Stock
	self.parts.wpn_fps_lmg_rpk_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_rpk_s_standard.supported = true
	self.parts.wpn_fps_lmg_rpk_s_standard.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	self.wpn_fps_lmg_rpk.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_docter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_acog = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cs = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_sig = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_uh = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_ak_extra_ris" },			
	}
	self.wpn_fps_lmg_rpk.override = {
		wpn_lmg_rpk_m_ban = {
				unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard",
				third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_standard",
				supported = true,
				stats = {
					value = 5,
					concealment = 2,
					reload = 2,
					extra_ammo = -40,
				}
		}		
	}
	
	--Fuck
	self.wpn_fps_lmg_rpk.uses_parts = {
		"wpn_fps_lmg_rpk_b_standard",
		"wpn_fps_lmg_rpk_fg_standard",
		"wpn_fps_lmg_rpk_fg_wood",
		"wpn_lmg_rpk_m_drum",
		"wpn_fps_lmg_rpk_s_standard",
		"wpn_fps_lmg_rpk_s_wood",
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_lmg_rpk_body_lowerreceiver",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding",
		"wpn_upg_ak_s_skfoldable_vanilla",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_ns_ass_pbs1",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_ns_ass_smg_v6"
	}	
	
	--RPK Part Additions
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_fc1")		

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_psl")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_upg_ak_s_psl")		
	
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_lmg_rpk_m_ban")
	table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_lmg_rpk_m_ban")			
			
	self.wpn_fps_lmg_rpk_npc.uses_parts = deep_clone(self.wpn_fps_lmg_rpk.uses_parts)		

end)

--Thanatos .50 cal 
Hooks:PostHook(WeaponFactoryTweakData, "_init_m95", "resmod_m95", function(self)

	--Tank Buster Barrel
	self.parts.wpn_fps_snp_m95_barrel_long.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_long.supported = true
	self.parts.wpn_fps_snp_m95_barrel_long.stats = {
		value = 1,
		concealment = -1,
		recoil = -1,
		spread = 1
	}
	
	--CQB Barrel
	self.parts.wpn_fps_snp_m95_barrel_short.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_short.supported = true
	self.parts.wpn_fps_snp_m95_barrel_short.stats = {
		value = 1,
		concealment = 1,
		spread = -1
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_snp_m95_barrel_suppressed.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.supported = true
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.perks = {"silencer"}
		
	self.wpn_fps_snp_m95.override.wpn_fps_snp_model70_iron_sight = { 
		adds = {"wpn_fps_ass_vhs_o_standard"}
	}
	
	table.insert(self.wpn_fps_snp_m95.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_m95_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_m95_npc.uses_parts = deep_clone(self.wpn_fps_snp_m95.uses_parts)		

end)
	
--Rattlesnake
Hooks:PostHook(WeaponFactoryTweakData, "_init_msr", "resmod_msr", function(self)

	--Long Barrel
	self.parts.wpn_fps_snp_msr_b_long.pcs = {}
	self.parts.wpn_fps_snp_msr_b_long.supported = true
	self.parts.wpn_fps_snp_msr_b_long.stats = {
		value = 3,
		concealment = -1,
		recoil = -1,
		spread = 1
	}
	
	--Sniper Suppressor
	self.parts.wpn_fps_snp_msr_ns_suppressor.pcs = {}
	self.parts.wpn_fps_snp_msr_ns_suppressor.supported = true
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats = {
		value = 0,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_msr_ns_suppressor.perks = {"silencer"}
	
	--Tactical Aluminium Body
	self.parts.wpn_fps_snp_msr_body_msr.pcs = {}
	self.parts.wpn_fps_snp_msr_body_msr.supported = true
	self.parts.wpn_fps_snp_msr_body_msr.stats = {
		value = 0,
		recoil = -1,
		concealment = 1
	}
	
	--Default Wood Body
	self.parts.wpn_fps_snp_msr_body_wood.override = {}
	self.parts.wpn_fps_snp_msr_body_wood.override.wpn_fps_snp_model70_iron_sight = {
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_fg_railext",
		a_obj = "a_b"
	}

	self.wpn_fps_snp_msr.override = {}
	self.wpn_fps_snp_msr.override.wpn_fps_snp_model70_iron_sight = { 
		adds = {"wpn_fps_m4_uupg_o_flipup"}
	}	

	table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_msr_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_msr_npc.uses_parts = deep_clone(self.wpn_fps_snp_msr.uses_parts)			

end)	

--R93
Hooks:PostHook(WeaponFactoryTweakData, "_init_r93", "resmod_r93", function(self)

	--Short Barrel
	self.parts.wpn_fps_snp_r93_b_short.pcs = {}
	self.parts.wpn_fps_snp_r93_b_short.supported = true
	self.parts.wpn_fps_snp_r93_b_short.stats = {
		value = 0,
		spread = -1,
		concealment = 1
	}
	
	--Compensated Suppressor
	self.parts.wpn_fps_snp_r93_b_suppressed.pcs = {}
	self.parts.wpn_fps_snp_r93_b_suppressed.supported = true
	self.parts.wpn_fps_snp_r93_b_suppressed.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_r93_b_suppressed.perks = {"silencer"}
	
	--Wooden Body
	self.parts.wpn_fps_snp_r93_body_wood.pcs = {}
	self.parts.wpn_fps_snp_r93_body_wood.supported = true
	self.parts.wpn_fps_snp_r93_body_wood.stats = {
		value = 7,
		concealment = -1,
		spread = -1,
		recoil = 1
	}
	
	--Override Table
	self.wpn_fps_snp_r93.override = {
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup", "wpn_fps_shot_r870_s_nostock_single"},
		},
		wpn_fps_shot_r870_s_nostock_single = { a_obj = "a_b" }
	}

	table.insert(self.wpn_fps_snp_r93.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_r93_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_r93_npc.uses_parts = deep_clone(self.wpn_fps_snp_r93.uses_parts)	

end)	

--Falcon
Hooks:PostHook(WeaponFactoryTweakData, "_init_fal", "resmod_fal", function(self)

	--CQB Foregrip
	self.parts.wpn_fps_ass_fal_fg_01.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_01.supported = true
	self.parts.wpn_fps_ass_fal_fg_01.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}
	
	--Retro Foregrip
	self.parts.wpn_fps_ass_fal_fg_03.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_03.supported = true
	self.parts.wpn_fps_ass_fal_fg_03.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}
	
	--Marksman Foregrip
	self.parts.wpn_fps_ass_fal_fg_04.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_04.supported = true
	self.parts.wpn_fps_ass_fal_fg_04.stats = {
		value = 2,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	
	--Wooden Foregrip
	self.parts.wpn_fps_ass_fal_fg_wood.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_wood.supported = true
	self.parts.wpn_fps_ass_fal_fg_wood.stats = {
		value = 2,
		recoil = 2,
		spread = -2
	}
	
	--Tactical Grip
	self.parts.wpn_fps_ass_fal_g_01.pcs = {}
	self.parts.wpn_fps_ass_fal_g_01.supported = true
	self.parts.wpn_fps_ass_fal_g_01.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Vintage Mag (Formerly Extended Magazine)
	self.parts.wpn_fps_ass_fal_m_01.pcs = {}
	self.parts.wpn_fps_ass_fal_m_01.name_id = "bm_wp_upg_vintage_sc"
	self.parts.wpn_fps_ass_fal_m_01.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_straight"
	self.parts.wpn_fps_ass_fal_m_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_standard"
	self.parts.wpn_fps_ass_fal_m_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_standard"
	self.parts.wpn_fps_ass_fal_m_01.supported = true
	self.parts.wpn_fps_ass_fal_m_01.stats = {
		value = 2,
		extra_ammo = -10,
		concealment = 2,
		reload = 2
	}
	
	--Standard Mag (Now Extended Magazine)
	self.parts.wpn_fps_ass_fal_m_standard.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_01"
	self.parts.wpn_fps_ass_fal_m_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_01"
	
	--CQB Stock
	self.parts.wpn_fps_ass_fal_s_01.pcs = {}
	self.parts.wpn_fps_ass_fal_s_01.supported = true
	self.parts.wpn_fps_ass_fal_s_01.stats = {
		value = 2,
		concealment = 1,
		recoil = -1
	}
	
	--Marksman Stock
	self.parts.wpn_fps_ass_fal_s_03.pcs = {}
	self.parts.wpn_fps_ass_fal_s_03.supported = true
	self.parts.wpn_fps_ass_fal_s_03.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Wooden Stock
	self.parts.wpn_fps_ass_fal_s_wood.pcs = {}
	self.parts.wpn_fps_ass_fal_s_wood.supported = true
	self.parts.wpn_fps_ass_fal_s_wood.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}

end)	

--M1014
Hooks:PostHook(WeaponFactoryTweakData, "_init_ben", "resmod_ben", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_ben_b_long.pcs = {}
	self.parts.wpn_fps_sho_ben_b_long.supported = true
	self.parts.wpn_fps_sho_ben_b_long.stats = {
		value = 0,
		concealment = -1,
		extra_ammo = 2
	}

	--Short Barrel
	self.parts.wpn_fps_sho_ben_b_short.pcs = {}
	self.parts.wpn_fps_sho_ben_b_short.supported = true
	self.parts.wpn_fps_sho_ben_b_short.stats = {
		value = 0,
		concealment = 1,
		extra_ammo = -2
	}
	
	--Collapsed Stock
	self.parts.wpn_fps_sho_ben_s_collapsed.pcs = {}
	self.parts.wpn_fps_sho_ben_s_collapsed.supported = true
	self.parts.wpn_fps_sho_ben_s_collapsed.stats = {
		value = 0,
		recoil = -1,
		concealment = 1
	}
	
	--Tactical Stock
	self.parts.wpn_fps_sho_ben_s_solid.pcs = {}
	self.parts.wpn_fps_sho_ben_s_solid.supported = true
	self.parts.wpn_fps_sho_ben_s_solid.stats = {
		value = 0,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_sho_ben_s_solid.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Override Table
	self.wpn_fps_sho_ben.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -1,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},			
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override		
	}

end)	

--Street Sweeper
Hooks:PostHook(WeaponFactoryTweakData, "_init_striker", "resmod_striker", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_striker_b_long.pcs = {}
	self.parts.wpn_fps_sho_striker_b_long.supported = true
	self.parts.wpn_fps_sho_striker_b_long.stats = {
		value = 3,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_sho_striker_b_long.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_sho_striker_b_suppressed.pcs = {}
	self.parts.wpn_fps_sho_striker_b_suppressed.supported = true
	self.parts.wpn_fps_sho_striker_b_suppressed.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_sho_striker_b_suppressed.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_sho_striker_b_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_sho_striker_b_suppressed.forbids = {
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_a_dragons_breath",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_ns_duck"
	}
	
	--Override Table
	self.wpn_fps_sho_striker.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"},
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = 0,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 1,
				damage_far_mul = 1,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},	
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},				
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,	
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override	
	}

end)	

--Raven
Hooks:PostHook(WeaponFactoryTweakData, "_init_ksg", "resmod_ksg", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_ksg_b_long.pcs = {}
	self.parts.wpn_fps_sho_ksg_b_long.supported = true
	self.parts.wpn_fps_sho_ksg_b_long.stats = {
		value = 7,
		concealment = -1,
		extra_ammo = 2
	}

	--Short Barrel
	self.parts.wpn_fps_sho_ksg_b_short.pcs = {}
	self.parts.wpn_fps_sho_ksg_b_short.supported = true
	self.parts.wpn_fps_sho_ksg_b_short.stats = {
		value = 5,
		concealment = 1,
		extra_ammo = -2
	}
	
	--Flip-up Sight
	self.parts.wpn_fps_upg_o_mbus_rear.pcs = {}
	self.parts.wpn_fps_upg_o_mbus_rear.supported = true
	self.parts.wpn_fps_upg_o_mbus_rear.stats = {value = 0}
	self.parts.wpn_fps_upg_o_mbus_rear.perks = {"scope"}
	self.parts.wpn_fps_upg_o_mbus_rear.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

	--Ammunition Overrides
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_slug = {
		supported = true,
		name_id = "bm_wp_upg_a_slug",
		desc_id = "bm_wp_upg_a_slug_desc",
		stats = {
			value = 10,
			total_ammo_mod = -33,
			damage = 30,
			recoil = -2,
			spread = 8,
			spread_multi = {1, 1},	
			moving_spread = 0,
			suppression = -1,
			concealment = -5
		},
		custom_stats = {
			damage_near_mul = 999,
			damage_far_mul = 999,
			muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",														
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true
		}
	}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom_free = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}			
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive = {
		supported = true,
		stats = {
			value = 10,
			total_ammo_mod = -50,
			recoil = -5,
			spread_multi = {1, 1},	
			concealment = -7,
			damage = 60
		},
		custom_stats = {
			ignore_statistic = true,
			block_b_storm = true,
			rays = 1,
			damage_near_mul = 999,
			damage_far_mul = 999,
			bullet_class = "InstantExplosiveBulletBase"
		}
	}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
end)	

--GL40
Hooks:PostHook(WeaponFactoryTweakData, "_init_gre_m79", "resmod_gre_m79", function(self)
	
	--Pirate Barrel
	self.parts.wpn_fps_gre_m79_barrel_short.pcs = {}
	self.parts.wpn_fps_gre_m79_barrel_short.supported = true
	self.parts.wpn_fps_gre_m79_barrel_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_gre_m79_barrel_short.adds = {
		"wpn_fps_gre_m79_sight_up"
	}
	self.parts.wpn_fps_gre_m79_barrel_short.forbids = {}
	
	--Sawed-off Stock
	self.parts.wpn_fps_gre_m79_stock_short.pcs = {}
	self.parts.wpn_fps_gre_m79_stock_short.supported = true
	self.parts.wpn_fps_gre_m79_stock_short.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}

end)	

--Gewehr 3
Hooks:PostHook(WeaponFactoryTweakData, "_init_g3", "resmod_g3", function(self)
	
	--DMR Kit
	self.parts.wpn_fps_ass_g3_b_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_b_sniper.supported = true
	self.parts.wpn_fps_ass_g3_b_sniper.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_ass_g3_b_sniper.override = {}
	self.parts.wpn_fps_ass_g3_b_sniper.adds = {}
	
	--Just in case
	self.parts.wpn_fps_ammo_type.supported = true
	self.parts.wpn_fps_ammo_type.stats = {value = 1}
	self.parts.wpn_fps_ammo_type.custom_stats = {}
	
	--Assault Kit
	self.parts.wpn_fps_ass_g3_b_short.pcs = {}
	self.parts.wpn_fps_ass_g3_b_short.supported = true
	self.parts.wpn_fps_ass_g3_b_short.stats = {
		value = 2,
		spread = -1,
		concealment = 1,
	}
	self.parts.wpn_fps_ass_g3_b_short.custom_stats = {}
	
	--Precision Foregrip
	self.parts.wpn_fps_ass_g3_fg_psg.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_psg.supported = true
	self.parts.wpn_fps_ass_g3_fg_psg.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Tactical Foregrip
	self.parts.wpn_fps_ass_g3_fg_railed.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_railed.supported = true
	self.parts.wpn_fps_ass_g3_fg_railed.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Wooden Foregrip
	self.parts.wpn_fps_ass_g3_fg_retro.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_retro.supported = true
	self.parts.wpn_fps_ass_g3_fg_retro.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}
	
	--Plastic Foregrip
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.supported = true
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = {
		value = 2,
		spread = -2,
		concealment = 2
	}
	
	--Retro Grip
	self.parts.wpn_fps_ass_g3_g_retro.pcs = {}
	self.parts.wpn_fps_ass_g3_g_retro.supported = true
	self.parts.wpn_fps_ass_g3_g_retro.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Precision Grip
	self.parts.wpn_fps_ass_g3_g_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_g_sniper.supported = true
	self.parts.wpn_fps_ass_g3_g_sniper.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Precision Stock
	self.parts.wpn_fps_ass_g3_s_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_s_sniper.supported = true
	self.parts.wpn_fps_ass_g3_s_sniper.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Wooden Stock
	self.parts.wpn_fps_ass_g3_s_wood.pcs = {}
	self.parts.wpn_fps_ass_g3_s_wood.supported = true
	self.parts.wpn_fps_ass_g3_s_wood.stats = {
		value = 2,
		recoil = 1,
		spread = -1
	}
	
	--PSG Magazine
	self.parts.wpn_fps_ass_g3_m_psg = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_g3_m_psg",
		a_obj = "a_m",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_straight",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg",
		supported = true,
		stats = {value = 2, extra_ammo = -10, reload = 3, concealment = 2}
	}
	self.parts.wpn_fps_ass_g3_m_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag_psg"

	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_ass_g3_m_psg")
	table.insert(self.wpn_fps_ass_g3_npc.uses_parts, "wpn_fps_ass_g3_m_psg")	

	self.wpn_fps_ass_g3_npc.uses_parts = deep_clone(self.wpn_fps_ass_g3.uses_parts)
	
end)	

--Gecko 7.62 
Hooks:PostHook(WeaponFactoryTweakData, "_init_galil", "resmod_galil", function(self)
	
	--Fabulous Foregrip
	self.parts.wpn_fps_ass_galil_fg_fab.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_fab.supported = true
	self.parts.wpn_fps_ass_galil_fg_fab.stats = {
		value = 0,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
		
	--CQB Foregrip
	self.parts.wpn_fps_ass_galil_fg_mar.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_mar.supported = true
	self.parts.wpn_fps_ass_galil_fg_mar.stats = {
		value = 0,
		spread = -1,
		recoil = -1,
		concealment = 2
	}
	
	--Light Foregrip
	self.parts.wpn_fps_ass_galil_fg_sar.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_sar.supported = true
	self.parts.wpn_fps_ass_galil_fg_sar.stats = {
		value = 0,
		spread = -1,
		concealment = 1
	}
	
	--Sniper Foregrip
	self.parts.wpn_fps_ass_galil_fg_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_sniper.supported = true
	self.parts.wpn_fps_ass_galil_fg_sniper.stats = {
		value = 0,
		spread = 2,
		recoil = -1,
		concealment = -4
	}
	
	--Sniper Grip
	self.parts.wpn_fps_ass_galil_g_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_g_sniper.supported = true
	self.parts.wpn_fps_ass_galil_g_sniper.stats = {
		value = 0,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Fabulous Stock
	self.parts.wpn_fps_ass_galil_s_fab.pcs = {}
	self.parts.wpn_fps_ass_galil_s_fab.supported = true
	self.parts.wpn_fps_ass_galil_s_fab.stats = {
		value = 0,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--Light Stock
	self.parts.wpn_fps_ass_galil_s_light.pcs = {}
	self.parts.wpn_fps_ass_galil_s_light.supported = true
	self.parts.wpn_fps_ass_galil_s_light.stats = {
		value = 0,
		recoil = -1,
		concealment = 1
	}
	
	--Plastic Stock
	self.parts.wpn_fps_ass_galil_s_plastic.pcs = {}
	self.parts.wpn_fps_ass_galil_s_plastic.supported = true
	self.parts.wpn_fps_ass_galil_s_plastic.stats = {
		value = 0,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Skeletal Stock
	self.parts.wpn_fps_ass_galil_s_skeletal.pcs = {}
	self.parts.wpn_fps_ass_galil_s_skeletal.supported = true
	self.parts.wpn_fps_ass_galil_s_skeletal.stats = {
		value = 0,
		recoil = -2,
		concealment = 2
	}

	--Sniper Stock
	self.parts.wpn_fps_ass_galil_s_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_s_sniper.supported = true
	self.parts.wpn_fps_ass_galil_s_sniper.stats = {
		value = 0,
		recoil = -3,
		spread = 3,
		concealment = -3
	}
	
	--Wooden Stock
	self.parts.wpn_fps_ass_galil_s_wood.pcs = {}
	self.parts.wpn_fps_ass_galil_s_wood.supported = true
	self.parts.wpn_fps_ass_galil_s_wood.stats = {
		value = 0,
		recoil = 1,
		concealment = -1
	}

end)	

--Clarion 
Hooks:PostHook(WeaponFactoryTweakData, "_init_famas", "resmod_famas", function(self)

	--Long Barrel
	self.parts.wpn_fps_ass_famas_b_long.pcs = {}
	self.parts.wpn_fps_ass_famas_b_long.supported = true
	self.parts.wpn_fps_ass_famas_b_long.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Short Barrel
	self.parts.wpn_fps_ass_famas_b_short.pcs = {}
	self.parts.wpn_fps_ass_famas_b_short.supported = true
	self.parts.wpn_fps_ass_famas_b_short.stats = {
		value = 2,
		spread = -1,
		concealment = 2
	}
	
	--Sniper Barrel
	self.parts.wpn_fps_ass_famas_b_sniper.pcs = {}
	self.parts.wpn_fps_ass_famas_b_sniper.supported = true
	self.parts.wpn_fps_ass_famas_b_sniper.stats = {
		value = 2,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_ass_famas_b_suppressed.pcs = {}
	self.parts.wpn_fps_ass_famas_b_suppressed.supported = true
	self.parts.wpn_fps_ass_famas_b_suppressed.stats = {
		value = 10,
		suppression = 13,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_ass_famas_b_suppressed.perks = {"silencer"}
	
	--G2 Grip
	self.parts.wpn_fps_ass_famas_g_retro.pcs = {}
	self.parts.wpn_fps_ass_famas_g_retro.supported = true
	self.parts.wpn_fps_ass_famas_g_retro.stats = {
		value = 2,
		concealment = -1,
		recoil = 1
	}

end)		

--Cobra 
Hooks:PostHook(WeaponFactoryTweakData, "_init_scorpion", "resmod_scorpion", function(self)

	--Suppressor
	self.parts.wpn_fps_smg_scorpion_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_scorpion_b_suppressed.supported = true
	self.parts.wpn_fps_smg_scorpion_b_suppressed.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_scorpion_b_suppressed.perks = {"silencer"}
	
	--Wooden Grip
	self.parts.wpn_fps_smg_scorpion_g_wood.pcs = {}
	self.parts.wpn_fps_smg_scorpion_g_wood.supported = true
	self.parts.wpn_fps_smg_scorpion_g_wood.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_smg_scorpion_g_ergo.pcs = {}
	self.parts.wpn_fps_smg_scorpion_g_ergo.supported = true
	self.parts.wpn_fps_smg_scorpion_g_ergo.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Extended Mag
	self.parts.wpn_fps_smg_scorpion_m_extended.pcs = {}
	self.parts.wpn_fps_smg_scorpion_m_extended.supported = true
	self.parts.wpn_fps_smg_scorpion_m_extended.stats = {
		value = 3,
		concealment = -1,
		spread = -1,
		reload = 3
	}
	
	--No Stock
	self.parts.wpn_fps_smg_scorpion_s_nostock.pcs = {}
	self.parts.wpn_fps_smg_scorpion_s_nostock.supported = true
	self.parts.wpn_fps_smg_scorpion_s_nostock.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}

	--Unfolded Stock
	self.parts.wpn_fps_smg_scorpion_s_unfolded.pcs = {}
	self.parts.wpn_fps_smg_scorpion_s_unfolded.supported = true
	self.parts.wpn_fps_smg_scorpion_s_unfolded.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
end)

--Blaster 9mm 
Hooks:PostHook(WeaponFactoryTweakData, "_init_tec9", "resmod_tec9", function(self)

	--Short Barrel
	self.parts.wpn_fps_smg_tec9_b_standard.pcs = {}
	self.parts.wpn_fps_smg_tec9_b_standard.supported = true
	self.parts.wpn_fps_smg_tec9_b_standard.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	
	--Ghetto Blaster
	self.parts.wpn_fps_smg_tec9_ns_ext.pcs = {}
	self.parts.wpn_fps_smg_tec9_ns_ext.supported = true
	self.parts.wpn_fps_smg_tec9_ns_ext.stats = {
		value = 5,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Extended Mag
	self.parts.wpn_fps_smg_tec9_m_extended.pcs = {}
	self.parts.wpn_fps_smg_tec9_m_extended.supported = true
	self.parts.wpn_fps_smg_tec9_m_extended.stats = {
		value = 4,
		extra_ammo = 12,
		reload = -1,
		concealment = -1
	}
	
	--Just Bend It
	self.parts.wpn_fps_smg_tec9_s_unfolded.pcs = {}
	self.parts.wpn_fps_smg_tec9_s_unfolded.supported = true
	self.parts.wpn_fps_smg_tec9_s_unfolded.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

end)

--Uzi
Hooks:PostHook(WeaponFactoryTweakData, "_init_uzi", "resmod_uzi", function(self)

	--Silent Death
	self.parts.wpn_fps_smg_uzi_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_uzi_b_suppressed.supported = true
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_uzi_b_suppressed.perks = {"silencer"}
	
	--Tactical Foregrip
	self.parts.wpn_fps_smg_uzi_fg_rail.pcs = {}
	self.parts.wpn_fps_smg_uzi_fg_rail.supported = true
	self.parts.wpn_fps_smg_uzi_fg_rail.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	self.parts.wpn_fps_smg_uzi_fg_rail.adds = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
	}
	
	--Ergonomic Stock
	self.parts.wpn_fps_smg_uzi_s_leather.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_leather.supported = true
	self.parts.wpn_fps_smg_uzi_s_leather.stats = {
		value = 6,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Solid Stock
	self.parts.wpn_fps_smg_uzi_s_solid.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_solid.supported = true
	self.parts.wpn_fps_smg_uzi_s_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--Folded Stock
	self.parts.wpn_fps_smg_uzi_s_standard.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_standard.supported = true
	self.parts.wpn_fps_smg_uzi_s_standard.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
end)

--Skin Boosts
function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins)
	--Gotta keep the internal IDs intact to not anger remote JSONs and custom_xml. Using comments to note what is actually what.

	--Small Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p1_mod",
		a_obj = "a_body",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p1_sc",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1, concealment = 1, spread = -1},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--Large Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p2 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p2_mod",
		a_obj = "a_body",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2_sc",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1, concealment = 2, spread = -2},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--Massive Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p3_sc",
		supported = true,
		stats = {value = 1, concealment = 3, spread = -3},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--This is where it gets messy
	--Small Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_damage_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p1_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_spread_p1_sc",
		supported = true,
		stats = {value = 1, spread = 1, recoil = -1, concealment = -1},
		internal_part = true,
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}		
	
	--Large Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_damage_p2 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p2_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1_sc",
		supported = true,
		stats = {value = 1, spread = 2, recoil = -2, concealment = -2},
		internal_part = true,
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}		
	
	--Massive Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_recoil_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2_sc",
		supported = true,
		stats = {value = 1, spread = 3, recoil = -3, concealment = -3},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Small Stability Modifier
	self.parts.wpn_fps_upg_bonus_spread_n1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p1_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_recoil_p1_sc",
		supported = true,
		stats = {value = 1, spread = -1, recoil = 1},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Large Stability Modifier		
	self.parts.wpn_fps_upg_bonus_spread_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p2_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_total_ammo_p1_sc",
		supported = true,
		stats = {value = 1, spread = -2, recoil = 2},
		internal_part = true,
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}

	--Massive Recoil Modifier
	self.parts.wpn_fps_upg_bonus_team_exp_money_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_spread_n1_sc",
		supported = true,
		stats = {value = 1, spread = -3, recoil = 3},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Team Boost
	self.parts.wpn_fps_upg_bonus_total_ammo_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_team_exp_money_p3",
		desc_id = "bm_wp_upg_bonus_team_exp_money_p3_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1},
		custom_stats = {exp_multiplier = 1.05, money_multiplier = 0.9},
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_team_exp_money_p3_sc",
		internal_part = true,
		has_description = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_team",
		exclude_from_challenge = true
	}		

	--Money Boost
	self.parts.wpn_fps_upg_bonus_total_ammo_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_team_money_exp_p1",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_total_ammo_p3_sc",
		supported = true,
		stats = {value = 1},
		internal_part = true,
		custom_stats = {money_multiplier = 1.1, exp_multiplier = 0.95},
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_team",
		has_description = true,
		exclude_from_challenge = true
	}
	
	self.parts.wpn_fps_upg_bonus_sc_none = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_sc_none",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_sc_none",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		is_a_unlockable = true,
		dlc = "sc",
		perks = {"bonus"},
		has_description = true,
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}
	if weapon_skins then
			local uses_parts = {
				wpn_fps_upg_bonus_team_exp_money_p3 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_concealment_p1 = {
					exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_recoil_p1 = {
					exclude_category = {"saw", "bow"},
					exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_spread_p1 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_spread_n1 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_damage_p1 = {
			exclude_category = {"saw", "bow"},
			exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_total_ammo_p1 = {
		},
				wpn_fps_upg_bonus_concealment_p2 = {
			exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_concealment_p3 = {
			exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_damage_p2 = {
			exclude_category = {"saw", "bow"},
			exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_total_ammo_p3 = {
		},
		wpn_fps_upg_bonus_sc_none = {}
			}
		local all_pass, weapon_pass, exclude_weapon_pass, category_pass, exclude_category_pass
		for id, data in pairs(tweak_data.upgrades.definitions) do
			local weapon_tweak = tweak_data.weapon[data.weapon_id]
			local primary_category = weapon_tweak and weapon_tweak.categories and weapon_tweak.categories[1]
			if data.weapon_id and weapon_tweak and data.factory_id and self[data.factory_id] then
				for part_id, params in pairs(uses_parts) do
					weapon_pass = not params.weapon or table.contains(params.weapon, data.weapon_id)
					exclude_weapon_pass = not params.exclude_weapon or not table.contains(params.exclude_weapon, data.weapon_id)
					category_pass = not params.category or table.contains(params.category, primary_category)
					exclude_category_pass = not params.exclude_category or not table.contains(params.exclude_category, primary_category)
					all_pass = weapon_pass and exclude_weapon_pass and category_pass and exclude_category_pass
					if all_pass then
						table.insert(self[data.factory_id].uses_parts, part_id)
						table.insert(self[data.factory_id .. "_npc"].uses_parts, part_id)
					end
				end
			end
		end
		end
end

--Ammunition
Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "resmod_create_ammunition", function(self)

	--Slugs
	self.parts.wpn_fps_upg_a_slug.pcs = {}
	self.parts.wpn_fps_upg_a_slug.name_id = "bm_wp_upg_a_slug_sc"
	self.parts.wpn_fps_upg_a_slug.desc_id = "bm_wp_upg_a_slug_desc"
	self.parts.wpn_fps_upg_a_slug.supported = true
	self.parts.wpn_fps_upg_a_slug.stats = {
		value = 10,
		concealment = -5,
		total_ammo_mod = -25,
		damage = 30,	
		recoil = -2,
		spread = 8,
		spread_multi = {1, 1},	
		suppression = -1,
		moving_spread = 0
	}
	self.parts.wpn_fps_upg_a_slug.custom_stats = {
		muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",												
		damage_near_mul = 999,
		damage_far_mul = 999,
		rays = 1,
		armor_piercing_add = 1,
		can_shoot_through_enemy = true,
		can_shoot_through_shield = true,
		can_shoot_through_wall = true
	}
	
	--000 Buck
	self.parts.wpn_fps_upg_a_custom.pcs = {}
	self.parts.wpn_fps_upg_a_custom.supported = true
	self.parts.wpn_fps_upg_a_custom.stats = {
		value = 9,
		total_ammo_mod = -25,
		damage = 30
	}
	self.parts.wpn_fps_upg_a_custom.custom_stats = {
		damage_near_mul = 0.75,
		damage_far_mul = 0.75,
		rays = 6
	}
	
	--000 Buck (Free)
	self.parts.wpn_fps_upg_a_custom_free = deep_clone(self.parts.wpn_fps_upg_a_custom)
	self.parts.wpn_fps_upg_a_custom_free.dlc = nil
	self.parts.wpn_fps_upg_a_custom_free.is_a_unlockable = true
	self.parts.wpn_fps_upg_a_custom_free.alt_icon = "guis/dlcs/gage_pack_shotgun/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_a_custom"

	--HE Shells
	self.parts.wpn_fps_upg_a_explosive.pcs = {}
	self.parts.wpn_fps_upg_a_explosive.desc_id = "bm_wp_upg_a_explosive_desc_sc"
	self.parts.wpn_fps_upg_a_explosive.supported = true
	self.parts.wpn_fps_upg_a_explosive.stats = {
		value = 10,
		total_ammo_mod = -16,
		damage = 90,
		spread = 0,
		spread_multi = {1, 1},	
		concealment = 0,
		moving_spread = 3
	}
	self.parts.wpn_fps_upg_a_explosive.custom_stats = {
		ignore_statistic = true,
		rays = 1,
		block_b_storm = true,
		damage_near_mul = 999,
		damage_far_mul = 999,		
		bullet_class = "InstantExplosiveBulletBase"
	}
	
	--Flechettes
	--This part description covers heavy shotguns, other damage tiers are handled via overrides.
	self.parts.wpn_fps_upg_a_piercing.name_id = "bm_wp_upg_a_piercing"
	self.parts.wpn_fps_upg_a_piercing.desc_id = "bm_wp_upg_a_piercing_heavy_desc_sc"
	self.parts.wpn_fps_upg_a_piercing.pcs = {}
	self.parts.wpn_fps_upg_a_piercing.supported = true
	self.parts.wpn_fps_upg_a_piercing.stats = {
		value = 9,
		damage = -30
	}
	self.parts.wpn_fps_upg_a_piercing.custom_stats = {
		damage_near_mul = 1.25,
		damage_far_mul = 1.25,
		armor_piercing_add = 1,
		ammo_pickup_min_mul = 0.9400,
		ammo_pickup_max_mul = 0.9197,		
		bullet_class = "BleedBulletBase",
		dot_data = { 
			type = "bleed",
			custom_data = {
				dot_damage = "4",
				dot_length = "3.1",
				dot_tick_period = "0.5"
			}
		}
	}

	--Dragon's Breath
	--This part description covers heavy shotguns, other damage tiers are handled via overrides.
	self.parts.wpn_fps_upg_a_dragons_breath.pcs = {}
	self.parts.wpn_fps_upg_a_dragons_breath.name_id = "bm_wp_upg_a_dragons_breath"
	self.parts.wpn_fps_upg_a_dragons_breath.desc_id = "bm_wp_upg_a_dragons_breath_heavy_desc_sc"
	self.parts.wpn_fps_upg_a_dragons_breath.supported = true
	self.parts.wpn_fps_upg_a_dragons_breath.stats = {
		value = 9,
		damage = -30,
	}
	self.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
		ignore_statistic = true,
		bullet_class = "FlameBulletBase",
		armor_piercing_add = 1,
		ammo_pickup_min_mul = 0.9400,
		ammo_pickup_max_mul = 0.9197,				
		can_shoot_through_shield = false,
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		fire_dot_data = {
			dot_damage = "4",
			dot_trigger_chance = "60",
			dot_length = "3.1",
			dot_tick_period = "0.5"
		}
	}
	self.parts.wpn_fps_upg_a_dragons_breath.forbids = {
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_sho_aa12_barrel_silenced",
		"wpn_fps_sho_striker_b_suppressed"
	}

	--Incendiary Round
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.name_id = "bm_wp_upg_a_grenade_launcher_incendiary"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.desc_id = "bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats = {damage = -74}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.custom_stats = {
		launcher_grenade = "launcher_incendiary",
		ammo_pickup_min_mul = 0.5359,
		ammo_pickup_max_mul = 0.3933
	}

	--Incendiary Round (Arbiter)
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.desc_id = "bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats = {damage = -55}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.custom_stats = {
		launcher_grenade = "launcher_incendiary_arbiter",
		ammo_pickup_min_mul = 0.8163,
		ammo_pickup_max_mul = 0.6605
	}
	
	--You're pretty good
	self.parts.wpn_fps_upg_pis_adam = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_ricochet",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		texture_bundle_folder = "mmo",
		is_a_unlockable = true,
		supported = true,
		stats = {},
		custom_stats = {
			bullet_class = "InstantRicochetBulletBase"
		},
		internal_part = true,
		sub_type = "adam"
	}

end)

--Chimano Compact
Hooks:PostHook(WeaponFactoryTweakData, "_init_g26", "resmod_g26", function(self)

	--Striking Slide
	self.parts.wpn_fps_pis_g26_b_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_b_custom.supported = true
	self.parts.wpn_fps_pis_g26_b_custom.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}

	--Striking Body Kit
	self.parts.wpn_fps_pis_g26_body_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_body_custom.supported = true
	self.parts.wpn_fps_pis_g26_body_custom.stats = {
		value = 7,
		recoil = 1,
		spread = -1
	}
	
	--Platypus Grip
	self.parts.wpn_fps_pis_g26_g_gripforce.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_g_gripforce.supported = true
	self.parts.wpn_fps_pis_g26_g_gripforce.stats = {
		value = 5,
		recoil = 1,
		spread = -1
	}
	
	--Laser Grip
	self.parts.wpn_fps_pis_g26_g_laser.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_g_laser.supported = true
	self.parts.wpn_fps_pis_g26_g_laser.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_pis_g26_g_laser.perks = {"gadget"}
	
	--Striking Mag
	self.parts.wpn_fps_pis_g26_m_contour.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_m_contour.supported = true
	self.parts.wpn_fps_pis_g26_m_contour.stats = {
		value = 5,
		extra_ammo = 2,
		concealment = -1,
		reload = -1
	}
	
	--Micro Laser
	self.parts.wpn_fps_upg_fl_pis_crimson.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_crimson.supported = true
	self.parts.wpn_fps_upg_fl_pis_crimson.stats = {
		value = 4
	}
	
	--Combined Module
	self.parts.wpn_fps_upg_fl_pis_x400v.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_x400v.supported = true
	self.parts.wpn_fps_upg_fl_pis_x400v.stats = {
		value = 5,
		concealment = -1
	}
	self.parts.wpn_fps_upg_fl_pis_x400v.perks = {"gadget"}
	
	--Champion's Suppressor
	self.parts.wpn_fps_upg_ns_pis_large_kac.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_large_kac.supported = true
	self.parts.wpn_fps_upg_ns_pis_large_kac.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ns_pis_large_kac.perks = {"silencer"}
	
	--Roctec Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium_gem.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_medium_gem.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ns_pis_medium_gem.perks = {"silencer"}
	
	--Facepunch Compensator
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.supported = true
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = {
		value = 5,
		suppression = -4,
		spread = -2,
		recoil = 2
	}
	
	--IPSC Compensator
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.supported = true
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = {
		value = 5,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	self.wpn_fps_pis_g26.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 23,
			concealment = -1,
			reload = -2
		}
	}
	
	--Parts
	self.wpn_fps_pis_g26.uses_parts = {
		"wpn_fps_pis_g26_b_custom",
		"wpn_fps_pis_g26_b_standard",
		"wpn_fps_pis_g26_body_custom",
		"wpn_fps_pis_g26_body_stardard",
		"wpn_fps_pis_g26_g_gripforce",
		"wpn_fps_pis_g26_g_laser",
		"wpn_fps_pis_g26_m_contour",
		"wpn_fps_pis_g26_m_standard",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		--"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_upg_o_rms",
		"wpn_fps_upg_o_rikt",
		"wpn_fps_upg_ns_pis_typhoon",
		--Custom
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2"		
	}
	
	self.wpn_fps_pis_g26_npc.uses_parts = deep_clone(self.wpn_fps_pis_g26.uses_parts)	

end)

--Akimbo Chimano Compact
Hooks:PostHook(WeaponFactoryTweakData, "_init_jowi", "resmod_jowi", function(self)

	--Overrides
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_m_contour = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 5,
			extra_ammo = 4,
			concealment = -1,
			reload = -1
		}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 22,
			concealment = -2,
			reload = -1
		}
	}
	
	self.wpn_fps_jowi.uses_parts = {
		"wpn_fps_pis_g26_b_custom",
		"wpn_fps_pis_g26_b_standard",
		"wpn_fps_pis_g26_body_custom",
		"wpn_fps_pis_g26_body_stardard",
		"wpn_fps_pis_g26_g_gripforce",
		"wpn_fps_pis_g26_g_laser",
		"wpn_fps_pis_g26_m_contour",
		"wpn_fps_pis_g26_m_standard",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		--"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_upg_ns_pis_typhoon",
		--Custom
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2"			
	}	
	
	self.wpn_fps_jowi_npc.uses_parts = deep_clone(self.wpn_fps_jowi.uses_parts)	

end)

--Akimbo Crosskill .45s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_1911", "resmod_x_1911", function(self)

	--Overrides
	self.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 3,
			concealment = -1,
			extra_ammo = 8,
			reload = -1
		}
	}
	self.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_big = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -2,
			extra_ammo = 12,
			spread = -1,
			recoil = 1,			
			reload = -2
		}
	}

end)

--Akimbo Bernetti 9s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_b92fs", "resmod_x_b92fs", function(self)

	--Overrides
	self.wpn_fps_x_b92fs.override.wpn_fps_pis_beretta_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -1,
			extra_ammo = 28,
			reload = -2
		}
	}

end)

--Akimbo Deagles
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_deagle", "resmod_x_deagle", function(self)

	self.wpn_fps_x_deagle.override.wpn_fps_pis_deagle_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 5,
			concealment = -1,
			reload = -1,
			extra_ammo = 4
		}
	}
	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_x_deagle_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_x_deagle_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_x_deagle_npc.uses_parts = deep_clone(self.wpn_fps_x_deagle.uses_parts)	

end)

--Predator 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_spas12", "resmod_spas12", function(self)

	--Extended Mag
	self.parts.wpn_fps_sho_b_spas12_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_b_spas12_long.supported = true
	self.parts.wpn_fps_sho_b_spas12_long.stats = {
		value = 1,
		concealment = -1,
		extra_ammo = 2
	}
	
	--Folded Stock
	self.parts.wpn_fps_sho_s_spas12_folded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_folded.supported = true
	self.parts.wpn_fps_sho_s_spas12_folded.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--No Stock
	self.parts.wpn_fps_sho_s_spas12_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_nostock.supported = true
	self.parts.wpn_fps_sho_s_spas12_nostock.stats = {
		value = 4,
		recoil = -2,
		concealment = 2
	}
	
	--Solid Stock
	self.parts.wpn_fps_sho_s_spas12_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_solid.supported = true
	self.parts.wpn_fps_sho_s_spas12_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_sho_s_spas12_solid.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Overrides
	self.wpn_fps_sho_spas12.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},		
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},				
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
	}
end)

--Buzzsaw 42
Hooks:PostHook(WeaponFactoryTweakData, "_init_mg42", "resmod_mg42", function(self)
	
	--Light Barrel
	self.parts.wpn_fps_lmg_mg42_b_mg34.pcs = {}
	self.parts.wpn_fps_lmg_mg42_b_mg34.supported = true
	self.parts.wpn_fps_lmg_mg42_b_mg34.stats = {
		value = 1,
		recoil = 4
	}
	self.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats = {rof_mult = 0.667}
	self.parts.wpn_fps_lmg_mg42_b_mg34.has_description = true
	self.parts.wpn_fps_lmg_mg42_b_mg34.desc_id = "bm_wp_mg42_b_mg34_desc_sc"
	
	--Heatsinked Suppressed Barrel
	self.parts.wpn_fps_lmg_mg42_b_vg38.pcs = {}
	self.parts.wpn_fps_lmg_mg42_b_vg38.supported = true
	self.parts.wpn_fps_lmg_mg42_b_vg38.stats = {
		value = 10,
		spread = -1,
		recoil = 2,
		suppression = 13,
		alert_size = -1
	}
	self.parts.wpn_fps_lmg_mg42_b_vg38.custom_stats = {
		is_laser_gun = true
	}				
	self.parts.wpn_fps_lmg_mg42_b_vg38.perks = {"silencer"}
	
	--Rails
	self.wpn_fps_lmg_mg42.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_45iron = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_leupold = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_sig = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_uh = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_snp_mosin_rail" },
		shortdot_normal = { "wpn_fps_snp_mosin_rail" },
	}

	--Buzzsaw Part Additions
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_mg42_npc.uses_parts, "wpn_fps_upg_o_fc1")		
			
	self.wpn_fps_lmg_mg42_npc.uses_parts = deep_clone(self.wpn_fps_lmg_mg42.uses_parts)			

end)

--Broomstick
Hooks:PostHook(WeaponFactoryTweakData, "_init_c96", "resmod_c96", function(self)
	
	--Precision Barrel
	self.parts.wpn_fps_pis_c96_b_long.pcs = {}
	self.parts.wpn_fps_pis_c96_b_long.supported = true
	self.parts.wpn_fps_pis_c96_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_pis_c96_b_long.custom_stats = {}
	
	--Damper.L 44 Nozzle
	self.parts.wpn_fps_pis_c96_nozzle.pcs = {}
	self.parts.wpn_fps_pis_c96_nozzle.supported = true
	self.parts.wpn_fps_pis_c96_nozzle.stats = {
		value = 1,
		recoil = 1,
		suppression = -2,
		spread = -1
	}
	
	--Barrel Sight 44
	self.parts.wpn_fps_pis_c96_sight.pcs = {}
	self.parts.wpn_fps_pis_c96_sight.has_description = true
	self.parts.wpn_fps_pis_c96_sight.desc_id = "bm_wp_upg_o_huge"
	self.parts.wpn_fps_pis_c96_sight.supported = true
	self.parts.wpn_fps_pis_c96_sight.stats = {
		value = 1,
		zoom = 40
	}
	self.parts.wpn_fps_pis_c96_sight.perks = {"scope"}
	self.parts.wpn_fps_pis_c96_sight.reticle_obj = nil

	--High Capacity Mag
	self.parts.wpn_fps_pis_c96_m_extended.pcs = {}
	self.parts.wpn_fps_pis_c96_m_extended.supported = true
	self.parts.wpn_fps_pis_c96_m_extended.stats = {
		value = 1,
		concealment = -1,
		extra_ammo = 10
	}

	--Holster Stock
	self.parts.wpn_fps_pis_c96_s_solid.pcs = {}
	self.parts.wpn_fps_pis_c96_s_solid.supported = true
	self.parts.wpn_fps_pis_c96_s_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_pis_c96.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_c96_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_c96.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_c96_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_c96_npc.uses_parts = deep_clone(self.wpn_fps_pis_c96.uses_parts)		
	
end)

--Patchett L2A1
Hooks:PostHook(WeaponFactoryTweakData, "_init_sterling", "resmod_sterling", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_smg_sterling_b_long.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_long.supported = true
	self.parts.wpn_fps_smg_sterling_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Short Barrel
	self.parts.wpn_fps_smg_sterling_b_short.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_short.supported = true
	self.parts.wpn_fps_smg_sterling_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_smg_sterling_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_suppressed.supported = true
	self.parts.wpn_fps_smg_sterling_b_suppressed.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_smg_sterling_b_suppressed.perks = {"silencer"}
	
	--Heatsinked Suppressed Barrel
	self.parts.wpn_fps_smg_sterling_b_e11.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_e11.supported = true
	self.parts.wpn_fps_smg_sterling_b_e11.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_smg_sterling_b_e11.custom_stats = {
		is_laser_gun = true
	}	
	self.parts.wpn_fps_smg_sterling_b_e11.perks = {"silencer"}
	
	--Extended Mag
	self.parts.wpn_fps_smg_sterling_m_long.pcs = {}
	self.parts.wpn_fps_smg_sterling_m_long.supported = true
	self.parts.wpn_fps_smg_sterling_m_long.stats = {
		value = 1,
		extra_ammo = 10,
		reload = -2,
		concealment = -1
	}
	
	--Short Mag
	self.parts.wpn_fps_smg_sterling_m_short.pcs = {}
	self.parts.wpn_fps_smg_sterling_m_short.supported = true
	self.parts.wpn_fps_smg_sterling_m_short.stats = {
		value = 1,
		extra_ammo = -10,
		reload = 2,
		concealment = 1
	}
	
	--Folded Stock
	self.parts.wpn_fps_smg_sterling_s_folded.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_folded.supported = true
	self.parts.wpn_fps_smg_sterling_s_folded.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--No Stock
	self.parts.wpn_fps_smg_sterling_s_nostock.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_nostock.supported = true
	self.parts.wpn_fps_smg_sterling_s_nostock.stats = {
		value = 1,
		recoil = -2,
		concealment = 2
	}
	
	--Solid Stock
	self.parts.wpn_fps_smg_sterling_s_solid.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_solid.supported = true
	self.parts.wpn_fps_smg_sterling_s_solid.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
end)	

--Nagant
Hooks:PostHook(WeaponFactoryTweakData, "_init_mosin", "resmod_mosin", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_snp_mosin_b_standard.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_standard.supported = true
	self.parts.wpn_fps_snp_mosin_b_standard.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Short Barrel
	self.parts.wpn_fps_snp_mosin_b_short.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_short.supported = true
	self.parts.wpn_fps_snp_mosin_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Silenced Barrel
	self.parts.wpn_fps_snp_mosin_b_sniper.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_sniper.supported = true
	self.parts.wpn_fps_snp_mosin_b_sniper.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_mosin_b_sniper.perks = {"silencer"}
	
	--Discrete Stock
	self.parts.wpn_fps_snp_mosin_body_black.pcs = {}
	self.parts.wpn_fps_snp_mosin_body_black.supported = true
	self.parts.wpn_fps_snp_mosin_body_black.stats = {
		value = 1,
		concealment = 1,
		recoil = -1
	}
	
	--Nagant Bayonet
	self.parts.wpn_fps_snp_mosin_ns_bayonet.pcs = {}
	self.parts.wpn_fps_snp_mosin_ns_bayonet.supported = true
	self.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
		value = 0,
		concealment = 0,
		min_damage = 5,
		max_damage = 5,
		min_damage_effect = 2,
		max_damage_effect = 2
	}
		
	--Iron Sight
	self.parts.wpn_fps_snp_mosin_iron_sight.pcs = {}
	self.parts.wpn_fps_snp_mosin_iron_sight.supported = true
	self.parts.wpn_fps_snp_mosin_iron_sight.stats = {
		value = 0
	}
	
end)

--Chicago Typewriter
Hooks:PostHook(WeaponFactoryTweakData, "_init_m1928", "resmod_m1928", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_smg_thompson_barrel_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_barrel_long.supported = true
	self.parts.wpn_fps_smg_thompson_barrel_long.stats = {
		value = 4,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Stubby Barrel
	self.parts.wpn_fps_smg_thompson_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_barrel_short.supported = true
	self.parts.wpn_fps_smg_thompson_barrel_short.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}

	--Discrete Foregrip
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Discrete Grip
	self.parts.wpn_fps_smg_thompson_grip_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_grip_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_grip_discrete.stats = {
		value = 2,
		recoil = -1,
		concealment = 1
	}
	
	--Discrete Stock
	self.parts.wpn_fps_smg_thompson_stock_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_stock_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_stock_discrete.stats = {
		value = 3,
		recoil = -1,
		concealment = 1
	}
	
	--QD Sling Stock
	self.parts.wpn_fps_smg_thompson_stock_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_stock_nostock.supported = true
	self.parts.wpn_fps_smg_thompson_stock_nostock.stats = {
		value = 1,
		recoil = -2,
		concealment = 2
	}
	
end)

--Queen's Wrath
Hooks:PostHook(WeaponFactoryTweakData, "_init_l85a2", "resmod_l85a2", function(self)
	
	--Expert Mag
	self.parts.wpn_fps_ass_l85a2_m_emag.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_m_emag.supported = true
	self.parts.wpn_fps_ass_l85a2_m_emag.stats = {
		value = 0,
		extra_ammo = 0
	}
	
	--Versatile Foregrip
	self.parts.wpn_fps_ass_l85a2_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_fg_short.supported = true
	self.parts.wpn_fps_ass_l85a2_fg_short.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Prodigious Barrel
	self.parts.wpn_fps_ass_l85a2_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_b_long.supported = true
	self.parts.wpn_fps_ass_l85a2_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Diminutive Barrel
	self.parts.wpn_fps_ass_l85a2_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_b_short.supported = true
	self.parts.wpn_fps_ass_l85a2_b_short.stats = {
		value = 1, 
		concealment = 1, 
		spread = -1
	}
	
	--Delightful Grip
	self.parts.wpn_fps_ass_l85a2_g_worn.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_g_worn.supported = true
	self.parts.wpn_fps_ass_l85a2_g_worn.stats = {
		value = 1, 
		recoil = 1, 
		spread = -1
	}
		
end)

--Lion's Roar
Hooks:PostHook(WeaponFactoryTweakData, "_init_vhs", "resmod_vhs", function(self)
	
	--CQB Barrel
	self.parts.wpn_fps_ass_vhs_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_short.supported = true
	self.parts.wpn_fps_ass_vhs_b_short.stats = {
		value = 1,
		concealment = 1,
		spread = -1
	}
	
	--Silenced Barrel
	self.parts.wpn_fps_ass_vhs_b_silenced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_silenced.supported = true
	self.parts.wpn_fps_ass_vhs_b_silenced.stats = {
		value = 10,
		suppression = 13,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_ass_vhs_b_silenced.perks = {"silencer"}
	
	--Precision Barrel
	self.parts.wpn_fps_ass_vhs_b_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_sniper.supported = true
	self.parts.wpn_fps_ass_vhs_b_sniper.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
end)

--LEO
Hooks:PostHook(WeaponFactoryTweakData, "_init_hs2000", "resmod_hs2000", function(self)
	
	--Custom Slide
	self.parts.wpn_fps_pis_hs2000_sl_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_sl_custom.supported = true
	self.parts.wpn_fps_pis_hs2000_sl_custom.stats = {
		value = 4,
		spread = -1,
		concealment = 1
	}
	
	--Long Slide
	self.parts.wpn_fps_pis_hs2000_sl_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_sl_long.supported = true
	self.parts.wpn_fps_pis_hs2000_sl_long.stats = {
		value = 6,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Extended Mag
	self.parts.wpn_fps_pis_hs2000_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_m_extended.supported = true
	self.parts.wpn_fps_pis_hs2000_m_extended.stats = {
		value = 1,
		extra_ammo = 8,
		reload = -2,
		concealment = -1
	}
	
	--Override Table
	self.wpn_fps_pis_hs2000.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_hs2000.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	
end)

--M4/AK pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_modpack_m4_ak", "resmod_modpack_m4_ak", function(self)
	
	--DMR Kit
	self.parts.wpn_fps_upg_ass_ak_b_zastava.pcs = {}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.supported = true
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = {
		value = 1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {}

	--Modern Barrel
	self.parts.wpn_fps_upg_ak_b_ak105.pcs = {}
	self.parts.wpn_fps_upg_ak_b_ak105.supported = true
	self.parts.wpn_fps_upg_ak_b_ak105.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Crabs Rail
	self.parts.wpn_fps_upg_ak_fg_krebs.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_krebs.supported = true
	self.parts.wpn_fps_upg_ak_fg_krebs.stats = {
		value = 1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--Keymod Rail
	self.parts.wpn_fps_upg_ak_fg_trax.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_trax.supported = true
	self.parts.wpn_fps_upg_ak_fg_trax.stats = {
		value = 1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}

	--Aluminum Foregrip
	self.parts.wpn_fps_upg_ak_fg_zenit.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_zenit.supported = true
	self.parts.wpn_fps_upg_ak_fg_zenit.stats = {value = 1, spread = -1, concealment = 1}
	
	--Aluminum Grip
	self.parts.wpn_fps_upg_ak_g_rk3.pcs = {}
	self.parts.wpn_fps_upg_ak_g_rk3.supported = true
	self.parts.wpn_fps_upg_ak_g_rk3.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	self.parts.wpn_fps_upg_ak_g_rk3.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}
	
	--Low Drag Magazine
	self.parts.wpn_fps_upg_ak_m_uspalm.pcs = {}
	self.parts.wpn_fps_upg_ak_m_uspalm.supported = true
	self.parts.wpn_fps_upg_ak_m_uspalm.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Classic Stock
	self.parts.wpn_fps_upg_ak_s_solidstock.pcs = {}
	self.parts.wpn_fps_upg_ak_s_solidstock.supported = true
	self.parts.wpn_fps_upg_ak_s_solidstock.stats = {
		value = 0
	}
	
	--PBS Suppressor
	self.parts.wpn_fps_upg_ns_ass_pbs1.pcs = {}
	self.parts.wpn_fps_upg_ns_ass_pbs1.supported = true
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats = {
		value = 10,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ns_ass_pbs1.perks = {"silencer"}
	
	--Scope Mount
	self.parts.wpn_fps_upg_o_ak_scopemount.pcs = {}
	self.parts.wpn_fps_upg_o_ak_scopemount.supported = true
	self.parts.wpn_fps_upg_o_ak_scopemount.stats = {
		value = 0
	}
	
	--OVAL Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.supported = true
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = {
		value = 5,
		spread = -1,
		recoil = 1
	}
	
	--E.M.O. Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_moe.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.supported = true
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats = {
		value = 5,
		concealment = -2,
		spread = 2,
		recoil = -2
	}
	
	--Long Ergo Foregrip
	self.parts.wpn_fps_upg_ass_m16_fg_stag.pcs = {}
	self.parts.wpn_fps_upg_ass_m16_fg_stag.supported = true
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats = {
		value = 2,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Aftermarket Shorty
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.pcs = {}
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.supported = true
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.stats = {
		value = 4,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--LW Upper Receiver
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.supported = true
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = {
		value = 1,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--THRUST Upper Receiver
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.supported = true
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--THRUST Lower Receiver
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.supported = true
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--L5 Magazine
	self.parts.wpn_fps_upg_m4_m_l5.pcs = {}
	self.parts.wpn_fps_upg_m4_m_l5.supported = true
	self.parts.wpn_fps_upg_m4_m_l5.stats = {
		value = 0
	}
	
	--2 Piece Stock
	self.parts.wpn_fps_upg_m4_s_ubr.pcs = {}
	self.parts.wpn_fps_upg_m4_s_ubr.supported = true
	self.parts.wpn_fps_upg_m4_s_ubr.stats = {
		value = 1,
		recoil = 2,
		spread = -2
	}
	self.parts.wpn_fps_upg_m4_s_ubr.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--DMR Kit
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.supported = true
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {
		value = 1,
		spread = 2,
		recoil = -2,
		concealment = -2,
	}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {}
	
end)

--Vulcan Minigun
Hooks:PostHook(WeaponFactoryTweakData, "_init_m134", "resmod_m134", function(self)
	
	--Light Body
	self.parts.wpn_fps_lmg_m134_body_upper_light.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_body_upper_light.supported = true
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats = {
		value = 1,
		concealment = 1,
		recoil = -1
	}
	self.parts.wpn_fps_lmg_m134_body_upper_light.custom_stats = {}
	
	--The Stump Barrel
	self.parts.wpn_fps_lmg_m134_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_barrel_short.supported = true
	self.parts.wpn_fps_lmg_m134_barrel_short.stats = {
		value = 3,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_lmg_m134_barrel_short.custom_stats = {}

	--Aerial Assault Barrel
	self.parts.wpn_fps_lmg_m134_barrel_extreme.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_barrel_extreme.supported = true
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats = {
		value = 3,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_lmg_m134_barrel_extreme.custom_stats = {}
	
	--Override
	self.wpn_fps_lmg_m134.override = {
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			stats = {
				value = 1,
				total_ammo_mod = 20,
				extra_ammo = 60,
				concealment = -2
			},
			custom_stats = {movement_speed = 0.9},	
		}
	}				
	
	table.insert(self.wpn_fps_lmg_m134.uses_parts, "wpn_fps_upg_ammo_half_that")
	table.insert(self.wpn_fps_lmg_m134_npc.uses_parts, "wpn_fps_upg_ammo_half_that")			
			
	self.wpn_fps_lmg_m134_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m134.uses_parts)			
	
end)

--HRL-7
Hooks:PostHook(WeaponFactoryTweakData, "_init_rpg7", "resmod_rpg7", function(self)
	--Default Body
	self.parts.wpn_fps_rpg7_body.custom_stats = {movement_speed = 0.85}
end)

--Commando 101
Hooks:PostHook(WeaponFactoryTweakData, "_init_ray", "resmod_ray", function(self)
	--Default Body
	self.parts.wpn_fps_gre_ray_body.custom_stats = {movement_speed = 0.85}
	
end)

--Jacket's Piece
Hooks:PostHook(WeaponFactoryTweakData, "_init_cobray", "resmod_cobray", function(self)
	
	--80's Calling
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.pcs = {}
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.supported = true
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats = {
		value = 0
	}
	
	--Slotted Barrel Extension
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.supported = true
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.stats = {
		value = 5,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--Werbell's Suppressor
	self.parts.wpn_fps_smg_cobray_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_cobray_ns_silencer.supported = true
	self.parts.wpn_fps_smg_cobray_ns_silencer.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_cobray_ns_silencer.perks = {"silencer"}
		
	self.wpn_fps_smg_cobray.uses_parts = {
		"wpn_fps_smg_cobray_body_lower",
		"wpn_fps_smg_cobray_body_upper",
		"wpn_fps_smg_cobray_body_lower_jacket",
		"wpn_fps_smg_cobray_body_upper_jacket",
		"wpn_fps_smg_cobray_bolt",
		"wpn_fps_smg_cobray_m_standard",
		"wpn_fps_smg_cobray_ns_barrelextension",
		"wpn_fps_smg_cobray_ns_silencer",
		"wpn_fps_smg_cobray_s_m4adapter",
		"wpn_fps_smg_cobray_s_standard",
		"wpn_fps_smg_cobray_barrel",
		"wpn_fps_smg_cobray_o_adapter",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		--"wpn_fps_upg_vg_ass_smg_verticalgrip",
		--"wpn_fps_upg_vg_ass_smg_stubby",
		--"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		--Custom--
		"wpn_fps_smg_mac10_s_skel"			
	}	
		
	self.wpn_fps_smg_cobray_npc.uses_parts = deep_clone(self.wpn_fps_smg_cobray.uses_parts)		
	
end)

--Joceline
Hooks:PostHook(WeaponFactoryTweakData, "_init_b682", "resmod_b682", function(self)
	
	--Sawed Off Barrel
	self.parts.wpn_fps_shot_b682_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_b_short.supported = true
	self.parts.wpn_fps_shot_b682_b_short.stats = {
		value = 1,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_shot_b682_b_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}

	--Standard body
	self.parts.wpn_fps_shot_b682_body_standard.supported = true

	--Wrist Wrecker Stock
	self.parts.wpn_fps_shot_b682_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_s_short.supported = true
	self.parts.wpn_fps_shot_b682_s_short.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Luxurious Ammo Pouch
	self.parts.wpn_fps_shot_b682_s_ammopouch.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_s_ammopouch.supported = true
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 4
	}
	self.parts.wpn_fps_shot_b682_s_ammopouch.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Override table
	self.wpn_fps_shot_b682.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -5,
				concealment = -7,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
	}	
	
end)

--Butcher Mod Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_butchermodpack", "resmod_butchermodpack", function(self)

	--Silent Motor
	self.parts.wpn_fps_saw_body_silent.pcs = {}
	self.parts.wpn_fps_saw_body_silent.supported = true
	self.parts.wpn_fps_saw_body_silent.stats = {
		value = 1,
		concealment = 1,
		suppression = 20,
		alert_size = -1
	}
	self.parts.wpn_fps_saw_body_silent.custom_stats = {
		rof_mult = 0.85
	}
	self.parts.wpn_fps_saw_body_silent.perks = {"silencer"}	
	self.parts.wpn_fps_saw_body_silent.has_description = true
	self.parts.wpn_fps_saw_body_silent.desc_id = "bm_slow_motor_sc_desc"
	
	--Fast Motor
	self.parts.wpn_fps_saw_body_speed.pcs = {}
	self.parts.wpn_fps_saw_body_speed.supported = true
	self.parts.wpn_fps_saw_body_speed.stats = {
		value = 1,
		concealment = -1
	}
	self.parts.wpn_fps_saw_body_speed.custom_stats = {
		rof_mult = 1.15
	}
	self.parts.wpn_fps_saw_body_speed.has_description = true
	self.parts.wpn_fps_saw_body_speed.desc_id = "bm_fast_motor_sc_desc"
	
	--Durable Blade
	self.parts.wpn_fps_saw_m_blade_durable.pcs = {}
	self.parts.wpn_fps_saw_m_blade_durable.supported = true
	self.parts.wpn_fps_saw_m_blade_durable.stats = {
		value = 1,
		extra_ammo = 10,
		damage = -30,
		total_ammo_mod = 50
	}
	
	--Sharp Blade
	self.parts.wpn_fps_saw_m_blade_sharp.pcs = {}
	self.parts.wpn_fps_saw_m_blade_sharp.supported = true
	self.parts.wpn_fps_saw_m_blade_sharp.stats = {
		value = 1,
		extra_ammo = -5,
		damage = 30,
		total_ammo_mod = -25
	}
	
	--Raptor Polymer Body
	self.parts.wpn_fps_aug_body_f90.pcs = {}
	self.parts.wpn_fps_aug_body_f90.supported = true
	self.parts.wpn_fps_aug_body_f90.stats = {
		value = 1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_aug_body_f90.adds = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
	}
	
	--CQB Barrel
	self.parts.wpn_fps_ass_ak5_b_short.pcs = {}
	self.parts.wpn_fps_ass_ak5_b_short.supported = true
	self.parts.wpn_fps_ass_ak5_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Straight Magazine
	self.parts.wpn_fps_smg_mp5_m_straight.pcs = {}
	self.parts.wpn_fps_smg_mp5_m_straight.supported = true
	self.parts.wpn_fps_smg_mp5_m_straight.stats = {
		value = 1,
		recoil = -2,
		spread = 2
	}
	
	--Tactical Suppressor
	self.parts.wpn_fps_smg_mp9_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_mp9_b_suppressed.supported = true
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_mp9_b_suppressed.perks = {"silencer"}
	
	--Civilian Market Barrel
	self.parts.wpn_fps_smg_p90_b_civilian.pcs = {}
	self.parts.wpn_fps_smg_p90_b_civilian.supported = true
	self.parts.wpn_fps_smg_p90_b_civilian.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Mall Ninja Barrel
	self.parts.wpn_fps_smg_p90_b_ninja.pcs = {}
	self.parts.wpn_fps_smg_p90_b_ninja.supported = true
	self.parts.wpn_fps_smg_p90_b_ninja.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_smg_p90_b_ninja.perks = {"silencer"}
	
	--Scope Mount
	self.parts.wpn_fps_upg_o_m14_scopemount.pcs = {}
	self.parts.wpn_fps_upg_o_m14_scopemount.supported = true
	self.parts.wpn_fps_upg_o_m14_scopemount.stats = {
		value = 0,
		spread = 0,
		concealment = 0
	}
	
	--Engraved Crosskill Grips
	self.parts.wpn_fps_pis_1911_g_engraved.pcs = {}
	self.parts.wpn_fps_pis_1911_g_engraved.supported = true
	self.parts.wpn_fps_pis_1911_g_engraved.stats = {value = 3, recoil = -1, spread = 1, concealment = -1}
	
	--Engraved Bernetti Grips
	self.parts.wpn_fps_pis_beretta_g_engraved.pcs = {}
	self.parts.wpn_fps_pis_beretta_g_engraved.supported = true
	self.parts.wpn_fps_pis_beretta_g_engraved.stats = {value = 3, recoil = -1, spread = 1, concealment = -1}

	--LED Combo
	self.parts.wpn_fps_upg_fl_ass_utg.pcs = {}
	self.parts.wpn_fps_upg_fl_ass_utg.supported = true
	self.parts.wpn_fps_upg_fl_ass_utg.stats = {
		value = 5,
		concealment = -1
	}
	self.parts.wpn_fps_upg_fl_ass_utg.perks = {"gadget"}
	
	--Polymer Flashlight
	self.parts.wpn_fps_upg_fl_pis_m3x.pcs = {}
	self.parts.wpn_fps_upg_fl_pis_m3x.supported = true
	self.parts.wpn_fps_upg_fl_pis_m3x.stats = {
		value = 3
	}
	
	--Ported Compensator
	self.parts.wpn_fps_upg_ass_ns_battle.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_battle.supported = true
	self.parts.wpn_fps_upg_ass_ns_battle.stats = {
		value = 5,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--Budget Suppressor
	self.parts.wpn_fps_upg_ns_ass_filter.pcs = {}
	self.parts.wpn_fps_upg_ns_ass_filter.supported = true
	self.parts.wpn_fps_upg_ns_ass_filter.stats = {
		value = 0,
		suppression = 10,
		alert_size = -1,
		recoil = 3,				
		spread = -3
	}
	self.parts.wpn_fps_upg_ns_ass_filter.perks = {"silencer"}
	
	--Jungle Ninja Suppressor
	self.parts.wpn_fps_upg_ns_pis_jungle.pcs = {}
	self.parts.wpn_fps_upg_ns_pis_jungle.supported = true
	self.parts.wpn_fps_upg_ns_pis_jungle.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_ns_pis_jungle.perks = {"silencer"}
	
	--Shh!
	self.parts.wpn_fps_upg_ns_sho_salvo_large.pcs = {}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.supported = true
	self.parts.wpn_fps_upg_ns_sho_salvo_large.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.perks = {"silencer"}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.forbids = {
		"wpn_fps_upg_a_explosive"
	}

end)

--Akimbo G22c
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_g22c", "resmod_x_g22c", function(self)

	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 24,
		concealment = -1,
		reload = -2
	}

end)

--Akimbo G17s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_g17", "resmod_x_g17", function(self)

	self.wpn_fps_pis_x_g17.override.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.wpn_fps_pis_x_g17.override.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 30,
		concealment = -1,
		reload = -2
	}
	
	--Chimano 88 Part Additions
	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_g_ergo")

	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	self.wpn_fps_pis_x_g17_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_g17.uses_parts)	
	
end)

--Akimbo Interceptor .45s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_usp", "resmod_x_usp", function(self)
	
	--Override Tables
	self.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 3,
			reload = -2,
			concealment = -1,
			extra_ammo = 16
		}
	}
	self.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_big = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -2,
			extra_ammo = 20,
			spread = -1,
			recoil = 1,
			reload = -2
		}
	}
	
	--Part Additions
	table.insert(self.wpn_fps_pis_x_usp.uses_parts, "wpn_fps_upg_fl_pis_socomlam")
	table.insert(self.wpn_fps_pis_x_usp_npc.uses_parts, "wpn_fps_upg_fl_pis_socomlam")		
	
	self.wpn_fps_pis_x_usp_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_usp.uses_parts)		
	
end)

--Flamethrower
Hooks:PostHook(WeaponFactoryTweakData, "_init_flamethrower_mk2", "resmod_flamethrower_mk2", function(self)

	--Rare
	self.parts.wpn_fps_fla_mk2_mag_rare.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_mk2_mag_rare.name_id = "bm_wp_fla_mk2_mag_rare_sc"
	self.parts.wpn_fps_fla_mk2_mag_rare.desc_id = "bm_wp_fla_mk2_mag_rare_desc_sc"
	self.parts.wpn_fps_fla_mk2_mag_rare.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_rare.supported = true
	self.parts.wpn_fps_fla_mk2_mag_rare.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_mk2_mag_rare.custom_stats = {
		use_rare_dot = true
	}

	--Well Done
	self.parts.wpn_fps_fla_mk2_mag_welldone.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_mk2_mag_welldone.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_welldone.name_id = "bm_wp_fla_mk2_mag_welldone"
	self.parts.wpn_fps_fla_mk2_mag_welldone.desc_id = "bm_wp_fla_mk2_mag_well_desc_sc"
	self.parts.wpn_fps_fla_mk2_mag_welldone.supported = true
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_mk2_mag_welldone.custom_stats = {
		use_well_done_dot = true
	}
	
	--Part Additions
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")		
	
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")		

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_peq15")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_peq15")	

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_laser")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_laser")	

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_utg")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_utg")		
	
	self.wpn_fps_fla_mk2_npc.uses_parts = deep_clone(self.wpn_fps_fla_mk2.uses_parts)		

end)

--M32
Hooks:PostHook(WeaponFactoryTweakData, "_init_m32", "resmod_m32", function(self)

	--Short Barrel
	self.parts.wpn_fps_gre_m32_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_m32_barrel_short.supported = true
	self.parts.wpn_fps_gre_m32_barrel_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}

	--No Stock
	self.parts.wpn_fps_gre_m32_no_stock.pcs = {}
	self.parts.wpn_fps_gre_m32_no_stock.supported = true
	self.parts.wpn_fps_gre_m32_no_stock.stats = {
		value = 0,
		concealment = 1,
		recoil = -1
	}
	
	table.insert(self.wpn_fps_gre_m32.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_gre_m32_npc.uses_parts, "wpn_fps_upg_m4_s_standard")		

	self.wpn_fps_gre_m32_npc.uses_parts = deep_clone(self.wpn_fps_gre_m32.uses_parts)	

end)

--AA12
Hooks:PostHook(WeaponFactoryTweakData, "_init_aa12", "resmod_aa12", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_aa12_barrel_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_barrel_long.supported = true
	self.parts.wpn_fps_sho_aa12_barrel_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_sho_aa12_barrel_long.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_sho_aa12_barrel_silenced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.supported = true
	self.parts.wpn_fps_sho_aa12_barrel_silenced.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.perks = {"silencer"}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.sound_switch = {
		suppressed = "suppressed_a"
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.forbids = {
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_ns_duck"
	}

	--Drum Mag
	self.parts.wpn_fps_sho_aa12_mag_drum.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_mag_drum.supported = true
	self.parts.wpn_fps_sho_aa12_mag_drum.stats = {
		value = 1,
		extra_ammo = 10,
		reload = -6,
		spread = -1,
		concealment = -3
	}
	
	--Override tables
	self.wpn_fps_sho_aa12.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},			
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
	}
end)

--Peacemaker
Hooks:PostHook(WeaponFactoryTweakData, "_init_peacemaker", "resmod_peacemaker", function(self)

	--Precision Barrel
	self.parts.wpn_fps_pis_peacemaker_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_b_long.supported = true
	self.parts.wpn_fps_pis_peacemaker_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Shootout Barrel
	self.parts.wpn_fps_pis_peacemaker_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_b_short.supported = true
	self.parts.wpn_fps_pis_peacemaker_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}

	--Grand Grip
	self.parts.wpn_fps_pis_peacemaker_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_g_bling.supported = true
	self.parts.wpn_fps_pis_peacemaker_g_bling.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--Ol´ Ben's Stock
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.supported = true
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

end)

--Repeater 1874
Hooks:PostHook(WeaponFactoryTweakData, "_init_winchester1874", "resmod_winchester1874", function(self)
	
	--Long Range Barrel
	self.parts.wpn_fps_snp_winchester_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_winchester_b_long.supported = true
	self.parts.wpn_fps_snp_winchester_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Outlaw's Silenced Barrel
	self.parts.wpn_fps_snp_winchester_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_winchester_b_suppressed.supported = true
	self.parts.wpn_fps_snp_winchester_b_suppressed.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_winchester_b_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_snp_winchester_b_suppressed.sound_switch = {
		suppressed = "suppressed_a"
	}
	
	--A5 Scope
	self.parts.wpn_fps_upg_winchester_o_classic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_winchester_o_classic.has_description = true
	self.parts.wpn_fps_upg_winchester_o_classic.desc_id = "bm_wp_upg_o_huge"
	self.parts.wpn_fps_upg_winchester_o_classic.supported = true
	self.parts.wpn_fps_upg_winchester_o_classic.stats = {
		value = 0,
		zoom = 40
	}
	self.parts.wpn_fps_upg_winchester_o_classic.reticle_obj = nil
	
	--Add Table for optic adapters
	self.wpn_fps_snp_winchester.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" },
	}
		
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_specter")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_aimpoint")		

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_t1micro")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_rx30")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_reflex")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_cmore")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_acog")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_acog")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_cs")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_45iron")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_45iron")		

	self.wpn_fps_snp_winchester_npc.uses_parts = deep_clone(self.wpn_fps_snp_winchester.uses_parts)		

end)

--Plainsrider
Hooks:PostHook(WeaponFactoryTweakData, "_init_plainsrider", "resmod_plainsrider", function(self)

	--Explosive Arrows
	self.parts.wpn_fps_upg_a_bow_explosion.pcs = {}
	self.parts.wpn_fps_upg_a_bow_explosion.supported = true
	self.parts.wpn_fps_upg_a_bow_explosion.stats = {damage = 60, total_ammo_mod = -50, spread = -6}
	self.parts.wpn_fps_upg_a_bow_explosion.custom_stats = {
		launcher_grenade = "west_arrow_exp",
		block_b_storm = true
	}
	
	--Poisoned Arrows
	self.parts.wpn_fps_upg_a_bow_poison.pcs = {}
	self.parts.wpn_fps_upg_a_bow_poison.supported = true
	self.parts.wpn_fps_upg_a_bow_poison.stats = {damage = -10, total_ammo_mod = 0}
	self.parts.wpn_fps_upg_a_bow_poison.custom_stats = {
		launcher_grenade = "bow_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}

end)

--Mateba
Hooks:PostHook(WeaponFactoryTweakData, "_init_mateba", "resmod_mateba", function(self)

	--Pesante Barrel
	self.parts.wpn_fps_pis_2006m_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_long.supported = true
	self.parts.wpn_fps_pis_2006m_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Medio Barrel
	self.parts.wpn_fps_pis_2006m_b_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_medium.supported = true
	self.parts.wpn_fps_pis_2006m_b_medium.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	
	--Piccolo Barrel
	self.parts.wpn_fps_pis_2006m_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_short.supported = true
	self.parts.wpn_fps_pis_2006m_b_short.stats = {
		value = 1,
		spread = -2,
		concealment = 2
	}

	--Noir Grip
	self.parts.wpn_fps_pis_2006m_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_g_bling.supported = true
	self.parts.wpn_fps_pis_2006m_g_bling.stats = {value = 1, spread = -1, recoil = 1}

end)

--ASVAL
Hooks:PostHook(WeaponFactoryTweakData, "_init_asval", "resmod_asval", function(self)

	--Prototype Barrel
	self.parts.wpn_fps_ass_asval_b_proto.pcs = {}
	self.parts.wpn_fps_ass_asval_b_proto.supported = true
	self.parts.wpn_fps_ass_asval_b_proto.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		suppression = -10,
		alert_size = 1
	}
	self.parts.wpn_fps_ass_asval_b_proto.sound_switch = nil
	self.parts.wpn_fps_ass_asval_b_standard.perks = nil
	
	--Standard Barrel
	self.parts.wpn_fps_ass_asval_b_standard.supported = true
	self.parts.wpn_fps_ass_asval_b_standard.stats = {
		value = 1,
	}
	self.parts.wpn_fps_ass_asval_b_standard.perks = {"silencer"}
	self.parts.wpn_fps_ass_asval_b_standard.forbids = {
		"wpn_fps_m4_uupg_fg_rail_ext",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle"
	}
	self.parts.wpn_fps_ass_asval_b_standard.sound_switch = {
		suppressed = "suppressed_a"
	}
	
	--Solid Stock
	self.parts.wpn_fps_ass_asval_s_solid.pcs = {}
	self.parts.wpn_fps_ass_asval_s_solid.supported = true
	self.parts.wpn_fps_ass_asval_s_solid.stats = {
		value = 6,
		spread = 3,
		recoil = -3,
		concealment = -3
	}
	self.parts.wpn_fps_ass_asval_s_solid.forbids = {
		"wpn_fps_ass_asval_g_standard",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip"			
	}

	self.wpn_fps_ass_asval.stock_adapter = "wpn_upg_ak_s_adapter"	
	self.wpn_fps_ass_asval.override = {
		--Just in case
		wpn_upg_ak_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_upg_ak_g_hgrip = {
			unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_g_hgrip",
			third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_g_hgrip"
		},
		wpn_fps_upg_ak_g_pgrip = {
			unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_g_pgrip",
			third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_g_pgrip"
		},					
		wpn_upg_ak_s_folding = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},
		wpn_fps_upg_m4_s_standard = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},	
		wpn_fps_upg_m4_s_pts = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},			
		wpn_fps_upg_m4_s_crane = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},	
		wpn_fps_upg_m4_s_mk46 = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},	
		wpn_fps_upg_m4_s_ubr = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		},	
		wpn_fps_snp_tti_s_vltor = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		}		
	}
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_m4_uupg_fg_rail_ext")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_m4_uupg_fg_rail_ext")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_large")		

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_small")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_tank")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_tank")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_jprifles")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_jprifles")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_linear")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_linear")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_surefire")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_surefire")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_battle")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_battle")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_pts")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_psl")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_upg_ak_s_psl")			
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_crane")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_folding")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_upg_ak_s_folding")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_rk3")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_rk3")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_hgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_hgrip")		

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_pgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_pgrip")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_wgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_wgrip")		

	self.wpn_fps_ass_asval_npc.uses_parts = deep_clone(self.wpn_fps_ass_asval.uses_parts)		

end)

--Sub2000
Hooks:PostHook(WeaponFactoryTweakData, "_init_sub2000", "resmod_sub2000", function(self)

	--Appalachian Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_gen2.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_gen2.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Delabarre Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_railed.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_railed.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_railed.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--Tooth Fairy Suppressor
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.perks = {"silencer"}
	
end)

--WA2000
Hooks:PostHook(WeaponFactoryTweakData, "_init_wa2000", "resmod_wa2000", function(self)

	--Long Barrel
	self.parts.wpn_fps_snp_wa2000_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_b_long.supported = true
	self.parts.wpn_fps_snp_wa2000_b_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_snp_wa2000_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.supported = true
	self.parts.wpn_fps_snp_wa2000_b_suppressed.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.perks = {"silencer"}
	
	--Light Grip
	self.parts.wpn_fps_snp_wa2000_g_light.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_light.supported = true
	self.parts.wpn_fps_snp_wa2000_g_light.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Stealth Grip
	self.parts.wpn_fps_snp_wa2000_g_stealth.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_stealth.supported = true
	self.parts.wpn_fps_snp_wa2000_g_stealth.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Walnut Grip
	self.parts.wpn_fps_snp_wa2000_g_walnut.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_walnut.supported = true
	self.parts.wpn_fps_snp_wa2000_g_walnut.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

end)

--Kriss
Hooks:PostHook(WeaponFactoryTweakData, "_init_polymer", "resmod_polymer", function(self)
	
	--Precision Barrel
	self.parts.wpn_fps_smg_polymer_barrel_precision.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_polymer_barrel_precision.supported = true
	self.parts.wpn_fps_smg_polymer_barrel_precision.stats = {
		value = 5,
		recoil = -2,
		spread = 2,
		concealment = -2
	}
	
	--HPS Suppressor
	self.parts.wpn_fps_smg_polymer_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_polymer_ns_silencer.supported = true
	self.parts.wpn_fps_smg_polymer_ns_silencer.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_polymer_ns_silencer.perks = {"silencer"}
	
	self.wpn_fps_smg_polymer.uses_parts = {
		"wpn_fps_smg_polymer_body_standard",
		"wpn_fps_smg_polymer_bolt_standard",
		"wpn_fps_smg_polymer_dh_standard",
		"wpn_fps_smg_polymer_extra_sling",
		"wpn_fps_smg_polymer_o_iron",
		"wpn_fps_smg_polymer_fg_standard",
		"wpn_fps_smg_polymer_barrel_standard",
		"wpn_fps_smg_polymer_m_standard",
		"wpn_fps_smg_polymer_s_standard",
		"wpn_fps_smg_polymer_barrel_precision",
		"wpn_fps_smg_polymer_ns_silencer",
		"wpn_fps_smg_polymer_s_adapter",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_tf90"
	}

end)

--Pistol Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_hunter", "resmod_hunter", function(self)
	
	--Carbon Limb
	self.parts.wpn_fps_bow_hunter_b_carbon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_b_carbon.supported = true
	self.parts.wpn_fps_bow_hunter_b_carbon.stats = {value = 1, spread = 1, recoil = -1, concealment = -1}
	
	--Skeletal Limb
	self.parts.wpn_fps_bow_hunter_b_skeletal.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_b_skeletal.supported = true
	self.parts.wpn_fps_bow_hunter_b_skeletal.stats = {value = 1, spread = -1, concealment = 1}
	
	--Camo Grip
	self.parts.wpn_fps_bow_hunter_g_camo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_g_camo.supported = true
	self.parts.wpn_fps_bow_hunter_g_camo.stats = {value = 1, recoil = -1, concealment = 1}
	
	--Walnut Grip
	self.parts.wpn_fps_bow_hunter_g_walnut.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_g_walnut.supported = true
	self.parts.wpn_fps_bow_hunter_g_walnut.stats = {value = 1, recoil = 1, spread = -1}

	--Poisoned Bolts
	self.parts.wpn_fps_upg_a_crossbow_poison.pcs = {}
	self.parts.wpn_fps_upg_a_crossbow_poison.supported = true
	self.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -20, total_ammo_mod = 0}
	self.parts.wpn_fps_upg_a_crossbow_poison.is_a_unlockable = true
	self.parts.wpn_fps_upg_a_crossbow_poison.custom_stats = {
		launcher_grenade = "crossbow_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolts
	self.parts.wpn_fps_upg_a_crossbow_explosion.pcs = {}
	self.parts.wpn_fps_upg_a_crossbow_explosion.supported = true
	self.parts.wpn_fps_upg_a_crossbow_explosion.stats = {damage = 120, total_ammo_mod = -50, spread = -8, recoil = -5}
	self.parts.wpn_fps_upg_a_crossbow_explosion.custom_stats = {
		launcher_grenade = "crossbow_arrow_exp",
		block_b_storm = true
	}

end)

--Micro Uzi
Hooks:PostHook(WeaponFactoryTweakData, "_init_baka", "resmod_baka", function(self)
	
	--Custom Barrel
	self.parts.wpn_fps_smg_baka_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_comp.supported = true
	self.parts.wpn_fps_smg_baka_b_comp.stats = {
		value = 1,
		spread = -1,
		concealment = 1,
	}
	
	--Maki Suppressor
	self.parts.wpn_fps_smg_baka_b_midsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_midsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_midsupp.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	
	--Spring Suppressor
	self.parts.wpn_fps_smg_baka_b_smallsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_smallsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_smallsupp.stats = {
		value = 3,
		suppression = 10,
		alert_size = -1,
		recoil = 1,				
		spread = -1
	}
	
	--Futomaki Suppressor
	self.parts.wpn_fps_smg_baka_b_longsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_longsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_longsupp.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	
	--Unfolded Stock
	self.parts.wpn_fps_smg_baka_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_s_standard.supported = true
	self.parts.wpn_fps_smg_baka_s_standard.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--No Stock
	self.parts.wpn_fps_smg_baka_s_unfolded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_s_unfolded.supported = true
	self.parts.wpn_fps_smg_baka_s_unfolded.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}

end)

--Heavy Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_arblast", "resmod_arblast", function(self)
	
	--Poison Bolt
	self.parts.wpn_fps_bow_arblast_m_poison.pcs = {}
	self.parts.wpn_fps_bow_arblast_m_poison.supported = true
	self.parts.wpn_fps_bow_arblast_m_poison.stats = {damage = -15}
	self.parts.wpn_fps_bow_arblast_m_poison.custom_stats = {
		launcher_grenade = "arblast_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolt
	self.parts.wpn_fps_bow_arblast_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_arblast_m_explosive.supported = true
	self.parts.wpn_fps_bow_arblast_m_explosive.stats = {damage = 60, total_ammo_mod = -40, spread = -3, recoil = -6}
	self.parts.wpn_fps_bow_arblast_m_explosive.custom_stats = {
		launcher_grenade = "arblast_arrow_exp",
		block_b_storm = true
	}

end)

--Light Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_frankish", "resmod_frankish", function(self)
	
	--Poison Bolt
	self.parts.wpn_fps_bow_frankish_m_poison.pcs = {}
	self.parts.wpn_fps_bow_frankish_m_poison.supported = true
	self.parts.wpn_fps_bow_frankish_m_poison.stats = {damage = -10}
	self.parts.wpn_fps_bow_frankish_m_poison.custom_stats = {
		launcher_grenade = "frankish_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolt
	self.parts.wpn_fps_bow_frankish_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_frankish_m_explosive.supported = true
	self.parts.wpn_fps_bow_frankish_m_explosive.stats = {damage = 60, total_ammo_mod = -50, spread = -6, recoil = -6}
	self.parts.wpn_fps_bow_frankish_m_explosive.custom_stats = {
		launcher_grenade = "frankish_arrow_exp",
		block_b_storm = true
	}

end)	

--Longbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_long", "resmod_long", function(self)
	
	--Explosive Arrow
	self.parts.wpn_fps_bow_long_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_long_m_explosive.supported = true
	self.parts.wpn_fps_bow_long_m_explosive.stats = {damage = 60, total_ammo_mod = -40, spread = -3}
	self.parts.wpn_fps_bow_long_m_explosive.custom_stats = {
		launcher_grenade = "long_arrow_exp",
		block_b_storm = true
	}
	
	--Poison Arrow
	self.parts.wpn_fps_bow_long_m_poison.pcs = {}
	self.parts.wpn_fps_bow_long_m_poison.supported = true
	self.parts.wpn_fps_bow_long_m_poison.stats = {damage = -15}
	self.parts.wpn_fps_bow_long_m_poison.custom_stats = {
		launcher_grenade = "long_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}

end)

--KSP 58
Hooks:PostHook(WeaponFactoryTweakData, "_init_par", "resmod_par", function(self)

	--Short Barrel
	self.parts.wpn_fps_lmg_par_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_par_b_short.supported = true
	self.parts.wpn_fps_lmg_par_b_short.stats = {value = 1, concealment = 1, spread = -1}
	
	--Plastic Stock
	self.parts.wpn_fps_lmg_par_s_plastic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_par_s_plastic.supported = true
	self.parts.wpn_fps_lmg_par_s_plastic.stats = {
		value = 1,
		recoil = 1,
		spread = -1
	}
	
	--M240 Part Additions
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_par_npc.uses_parts, "wpn_fps_upg_o_fc1")		
			
	self.wpn_fps_lmg_par_npc.uses_parts = deep_clone(self.wpn_fps_lmg_par.uses_parts)		

end)

--Bipods
Hooks:PostHook(WeaponFactoryTweakData, "_init_bipods", "resmod_bipods", function(self)

	--Lion's Bipod
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.desc_id = "bm_sc_bipod_desc"
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.supported = true
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.stats = {value = 0, zoom = 1, concealment = -2}
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.forbids = {} --g3 various attachments workaround
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.perks = {"bipod"}
	
end)

--Baby Deagle
--Someday, you gotta carry that weight.
Hooks:PostHook(WeaponFactoryTweakData, "_init_sparrow", "resmod_sparrow", function(self)

	--Ported Barrel
	self.parts.wpn_fps_pis_sparrow_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_b_comp.supported = true
	self.parts.wpn_fps_pis_sparrow_b_comp.stats = {
		value = 1,
		spread = 1, 
		recoil = -1, 
		concealment = -1
	}
	self.parts.wpn_fps_pis_sparrow_b_comp.forbids = {}

	--Threaded Barrel
	self.parts.wpn_fps_pis_sparrow_b_threaded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_b_threaded.supported = true
	self.parts.wpn_fps_pis_sparrow_b_threaded.stats = {value = 1, recoil = 1, spread = -1}
	
	--Spike Kit
	self.parts.wpn_fps_pis_sparrow_body_941.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_body_941.supported = true
	self.parts.wpn_fps_pis_sparrow_body_941.stats = {
		value = 0
	}
	
	--Spike Grip
	self.parts.wpn_fps_pis_sparrow_g_cowboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_g_cowboy.supported = true
	self.parts.wpn_fps_pis_sparrow_g_cowboy.stats = {
		value = 0
	}
	
	--Overrides for Glock comps
	self.wpn_fps_pis_sparrow.override.wpn_fps_pis_g18c_co_comp_2 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_sparrow.override.wpn_fps_pis_g18c_co_1 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
		
	table.insert(self.wpn_fps_pis_sparrow.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_sparrow_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_sparrow.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_sparrow_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_sparrow_npc.uses_parts = deep_clone(self.wpn_fps_pis_sparrow.uses_parts)	

end)

--Platypus 70
Hooks:PostHook(WeaponFactoryTweakData, "_init_model70", "resmod_model70", function(self)
	
	--Beak Suppressor
	self.parts.wpn_fps_snp_model70_ns_suppressor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_model70_ns_suppressor.supported = true
	self.parts.wpn_fps_snp_model70_ns_suppressor.stats = {
		value = 10,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	
	--Iron Sight
	self.parts.wpn_fps_snp_model70_iron_sight.pcs = {}
	self.parts.wpn_fps_snp_model70_iron_sight.supported = true
	self.parts.wpn_fps_snp_model70_iron_sight.stats = {
		value = 0
	}

end)

--GSPS 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_m37", "resmod_m37", function(self)

	--Riot Barrel
	self.parts.wpn_fps_shot_m37_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m37_b_short.supported = true
	self.parts.wpn_fps_shot_m37_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_shot_m37_b_short.custom_stats = {											
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Stakeout Stock
	self.parts.wpn_fps_shot_m37_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m37_s_short.supported = true
	self.parts.wpn_fps_shot_m37_s_short.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Ammo overrides
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_slug = {
		supported = true,
		name_id = "bm_wp_upg_a_slug",
		desc_id = "bm_wp_upg_a_slug_desc",
		stats = {
			value = 10,
			total_ammo_mod = -33,
			damage = 30,
			recoil = -2,
			spread = 8,
			spread_multi = {1, 1},	
			moving_spread = 0,
			suppression = -1,
			concealment = -5
		},
		custom_stats = {
			muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
			damage_near_mul = 999,
			damage_far_mul = 999,
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true
		}
	}
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom_free = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}		
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_explosive = {
		supported = true,
		stats = {
			value = 10,
			total_ammo_mod = -50,
			recoil = -5,
			spread_multi = {1, 1},	
			concealment = -7,
			damage = 60
		},
		custom_stats = {
			ignore_statistic = true,
			block_b_storm = true,
			rays = 1,
			damage_near_mul = 999,
			damage_far_mul = 999,
			bullet_class = "InstantExplosiveBulletBase"
		}
	}
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_fc1")			
	
	self.wpn_fps_shot_m37_npc.uses_parts = deep_clone(self.wpn_fps_shot_m37.uses_parts)

end)

--China Puff
Hooks:PostHook(WeaponFactoryTweakData, "_init_china", "resmod_china", function(self)
	
	--Riot Stock
	self.parts.wpn_fps_gre_china_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_china_s_short.supported = true
	self.parts.wpn_fps_gre_china_s_short.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}

end)

--Heather
Hooks:PostHook(WeaponFactoryTweakData, "_init_sr2", "resmod_sr2", function(self)
	
	--Unfolded Stock
	self.parts.wpn_fps_smg_sr2_s_unfolded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_sr2_s_unfolded.supported = true
	self.parts.wpn_fps_smg_sr2_s_unfolded.stats = {value = 1, recoil = 1, spread = -1}
	
	--Tishina Suppressor
	self.parts.wpn_fps_smg_sr2_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_sr2_ns_silencer.supported = true
	self.parts.wpn_fps_smg_sr2_ns_silencer.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_sr2_ns_silencer.perks = {"silencer"}
	
end)

--Akimbo Heather
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_sr2", "resmod_x_sr2", function(self)

	--Nada

end)

--White Streak
Hooks:PostHook(WeaponFactoryTweakData, "_init_pl14", "resmod_pl14", function(self)

	--Prototype Barrel
	self.parts.wpn_fps_pis_pl14_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_pl14_b_comp.supported = true
	self.parts.wpn_fps_pis_pl14_b_comp.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_pis_pl14_b_comp.forbids = {}
	
	--Extended Magazine
	self.parts.wpn_fps_pis_pl14_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_pl14_m_extended.supported = true
	self.parts.wpn_fps_pis_pl14_m_extended.stats = {
		value = 1,
		extra_ammo = 2,
		concealment = -1
	}
	
	self.wpn_fps_pis_pl14.override.wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"}
	self.wpn_fps_pis_pl14.override.wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"}

	table.insert(self.wpn_fps_pis_pl14.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_pl14_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_pl14.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_pl14_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_pl14_npc.uses_parts = deep_clone(self.wpn_fps_pis_pl14.uses_parts)

end)

--Akimbo MP5
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_mp5", "resmod_x_mp5", function(self)

	--Mag adjustments
	self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_drum = {
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 40,
			reload = -2,
			spread = -1,
			concealment = -2
		},
	}
	self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_straight = {
		supported = true,
		stats = {
			value = 1,
			recoil = -2,
			spread = 2
		},
		animations = {}
	}

end)

--Akimbo AKMSU
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_akmsu", "resmod_x_akmsu", function(self)

	--Mag Adjustments
	self.wpn_fps_smg_x_akmsu.override = {
		wpn_fps_upg_ak_m_quad = {
			supported = true,
			stats = {
				value = 3,
				spread = -1,
				concealment = -3,
				extra_ammo = 60,
				reload = -3,
			}
		},
		wpn_fps_upg_ak_m_uspalm = {
			supported = true,
			stats = {
				value = 1,
				recoil = -1,
				concealment = 1
			}
		}
	}

end)

function WeaponFactoryTweakData:_init_tecci()
	self.parts.wpn_fps_ass_tecci_b_standard = {
		type = "barrel",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_b",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_tecci_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_long",
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "opera",
		texture_bundle_folder = "opera"
	}
	self.parts.wpn_fps_ass_tecci_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_g_standard = {
		type = "grip",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_g",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_lower_reciever = {
		type = "lower_reciever",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_body",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_lower_reciever",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_m_drum = {
		type = "magazine",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 100},
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum",
		supported = true,
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_tecci_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_ns_special = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_tecci_ns_special",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_special",
		supported = true,
		stats = {
			value = 5,
			suppression = -4,
			spread = -2,
			recoil = 2,
			concealment = -2
		},
		dlc = "opera",
		texture_bundle_folder = "opera"
	}
	self.parts.wpn_fps_ass_tecci_o_standard = {
		type = "sight",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_o",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_o_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.parts.wpn_fps_ass_tecci_s_standard = {
		type = "stock",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_s",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_upper_reciever = {
		type = "upper_reciever",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_body",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_upper_reciever",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_vg_standard = {
		type = "vertical_grip",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_vg",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_tecci_b_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_standard"
	self.parts.wpn_fps_ass_tecci_b_long.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_long"
	self.parts.wpn_fps_ass_tecci_dh_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_dh_standard"
	self.parts.wpn_fps_ass_tecci_fg_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_fg_standard"
	self.parts.wpn_fps_ass_tecci_g_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard"
	self.parts.wpn_fps_ass_tecci_lower_reciever.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_lower_reciever"
	self.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	self.parts.wpn_fps_ass_tecci_ns_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_standard"
	self.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_special"
	self.parts.wpn_fps_ass_tecci_o_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_o_standard"
	self.parts.wpn_fps_ass_tecci_s_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_s_standard"
	self.parts.wpn_fps_ass_tecci_upper_reciever.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_upper_reciever"
	self.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	self.wpn_fps_ass_tecci = {}
	self.wpn_fps_ass_tecci.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_ass_tecci.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci/wpn_fps_ass_tecci"
	self.wpn_fps_ass_tecci.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_tecci.override = {
		wpn_fps_m4_uupg_m_std = {
			animations = {
				reload = "reload",
				reload_not_empty = "reload_not_empty"
			}
		},
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			desc_id = "bm_wp_upg_a_halfthatkit_tecci_desc",
			stats = {
				value = 1,
				total_ammo_mod = 50,
				concealment = -2
			},
			custom_stats = {movement_speed = 0.75},	
		}			
	}	
	self.wpn_fps_ass_tecci.default_blueprint = {
		"wpn_fps_ass_tecci_b_standard",
		"wpn_fps_ass_tecci_dh_standard",
		"wpn_fps_ass_tecci_fg_standard",
		"wpn_fps_ass_tecci_g_standard",
		"wpn_fps_ass_tecci_lower_reciever",
		"wpn_fps_ass_tecci_m_drum",
		"wpn_fps_ass_tecci_ns_standard",
		"wpn_fps_ass_tecci_o_standard",
		"wpn_fps_ass_tecci_s_standard",
		"wpn_fps_ass_tecci_upper_reciever",
		"wpn_fps_ass_tecci_vg_standard"
	}
	self.wpn_fps_ass_tecci.uses_parts = {
		"wpn_fps_ass_tecci_b_standard",
		"wpn_fps_ass_tecci_b_long",
		"wpn_fps_ass_tecci_dh_standard",
		"wpn_fps_ass_tecci_fg_standard",
		"wpn_fps_ass_tecci_g_standard",
		"wpn_fps_ass_tecci_lower_reciever",
		"wpn_fps_ass_tecci_m_drum",
		"wpn_fps_ass_tecci_ns_standard",
		"wpn_fps_ass_tecci_ns_special",
		"wpn_fps_ass_tecci_o_standard",
		"wpn_fps_ass_tecci_s_standard",
		"wpn_fps_ass_tecci_upper_reciever",
		"wpn_fps_ass_tecci_vg_standard",
		"wpn_fps_ass_tecci_b_legend",
		"wpn_fps_ass_tecci_fg_legend",
		"wpn_fps_ass_tecci_s_legend",
		"wpn_fps_upg_m4_s_adapter",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_m4_uupg_o_flipup",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		--Stuff--
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof",	
		"wpn_fps_upg_ammo_half_that"
	}
	self.wpn_fps_ass_tecci_npc = deep_clone(self.wpn_fps_ass_tecci)
	self.wpn_fps_ass_tecci_npc.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci/wpn_fps_ass_tecci_npc"
end

function WeaponFactoryTweakData:_init_hajk()
	self.parts.wpn_fps_smg_hajk_b_standard = {
		type = "barrel",
		name_id = "bm_wp_hajk_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_hajk_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_short",
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			recoil = -1,
			concealment = 2
		},
		dlc = "born",
		texture_bundle_folder = "born"
	}
	self.parts.wpn_fps_smg_hajk_b_medium = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_hajk_b_medium",
		a_obj = "a_b",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_medium",
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			concealment = 1
		},
		dlc = "born",
		texture_bundle_folder = "born"
	}
	self.parts.wpn_fps_smg_hajk_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_hajk_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_g_standard = {
		type = "grip",
		name_id = "bm_wp_hajk_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_hajk_ns_standard",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_o_standard = {
		type = "sight",
		name_id = "bm_wp_hajk_o_sight",
		a_obj = "a_o",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_o_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
	}
	self.parts.wpn_fps_smg_hajk_s_standard = {
		type = "stock",
		name_id = "bm_wp_hajk_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_hajk_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_body_standard",
		supported = true,
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		}
	}
	self.parts.wpn_fps_smg_hajk_vg_moe = {
		type = "vertical_grip",
		name_id = "bm_wp_hajk_vg_moe",
		a_obj = "a_vg",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_vg_moe",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_hajk_b_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_standard"
	self.parts.wpn_fps_smg_hajk_b_short.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_short"
	self.parts.wpn_fps_smg_hajk_b_medium.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_medium"
	self.parts.wpn_fps_smg_hajk_fg_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_fg_standard"
	self.parts.wpn_fps_smg_hajk_g_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_g_standard"
	self.parts.wpn_fps_smg_hajk_ns_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_ns_standard"
	self.parts.wpn_fps_smg_hajk_o_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_o_standard"
	self.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_s_standard"
	self.parts.wpn_fps_smg_hajk_body_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_body_standard"
	self.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_vg_moe"
	self.wpn_fps_smg_hajk = {}
	self.wpn_fps_smg_hajk.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_smg_hajk.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty"
	}
	self.wpn_fps_smg_hajk.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk/wpn_fps_smg_hajk"
	self.wpn_fps_smg_hajk.default_blueprint = {
		"wpn_fps_smg_hajk_b_standard",
		"wpn_fps_smg_hajk_fg_standard",
		"wpn_fps_smg_hajk_g_standard",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_smg_hajk_ns_standard",
		"wpn_fps_smg_hajk_o_standard",
		"wpn_fps_smg_hajk_s_standard",
		"wpn_fps_smg_hajk_body_standard",
		"wpn_fps_smg_hajk_vg_moe"
	}
	self.wpn_fps_smg_hajk.uses_parts = {
		"wpn_fps_smg_hajk_b_standard",
		"wpn_fps_smg_hajk_b_short",
		"wpn_fps_smg_hajk_b_medium",
		"wpn_fps_smg_hajk_fg_standard",
		"wpn_fps_smg_hajk_g_standard",
		"wpn_fps_smg_hajk_ns_standard",
		"wpn_fps_smg_hajk_o_standard",
		"wpn_fps_smg_hajk_s_standard",
		"wpn_fps_smg_hajk_body_standard",
		"wpn_fps_smg_hajk_vg_moe",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		--"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_o_spot",
		"wpn_fps_m4_upg_m_quick",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof"	
	}
	self.wpn_fps_smg_hajk_npc = deep_clone(self.wpn_fps_smg_hajk)
	self.wpn_fps_smg_hajk_npc.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk/wpn_fps_smg_hajk_npc"
end

function WeaponFactoryTweakData:_init_boot()
	self.parts.wpn_fps_sho_boot_b_standard = {
		type = "barrel",
		name_id = "bm_wp_boot_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_boot_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_boot_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_short",
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			concealment = 1
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		dlc = "wild",
		texture_bundle_folder = "wild"
	}
	self.parts.wpn_fps_sho_boot_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_boot_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_long",
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		dlc = "wild",
		texture_bundle_folder = "wild"
	}
	self.parts.wpn_fps_sho_boot_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_boot_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_boot_s_short = {
		type = "stock",
		name_id = "bm_wp_boot_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_s_short",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_boot_s_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_boot_s_long",
		a_obj = "a_s",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_s_long",
		supported = true,
		stats = {
			value = 1,
			recoil = 2,
			concealment = -4
		},
		dlc = "wild",
		texture_bundle_folder = "wild"
	}
	self.parts.wpn_fps_sho_boot_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_boot_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_body_standard",
		supported = true,
		stats = {value = 1},
		animations = {
			reload_enter = "reload_enter",
			reload_exit = "reload_exit",
			reload_not_empty_exit = "reload_exit_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil_steelsight"
		}
	}
	self.parts.wpn_fps_sho_boot_body_exotic = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "lower_reciever",
		name_id = "bm_wp_boot_body_exotic",
		a_obj = "a_body",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_body_exotic",
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			concealment = -1
		},
		dlc = "wild",
		texture_bundle_folder = "wild",
		animations = {
			reload_enter = "reload_enter",
			reload_exit = "reload_exit",
			reload_not_empty_exit = "reload_exit_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil_steelsight"
		}
	}
	self.parts.wpn_fps_sho_boot_m_standard = {
		type = "magazine",
		name_id = "bm_wp_boot_s_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_m_standard",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_boot_em_extra = {
		type = "extra",
		name_id = "bm_wp_boot_s_standard",
		a_obj = "a_em",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_em_extra",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_boot_b_standard.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_standard"
	self.parts.wpn_fps_sho_boot_b_short.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_short"
	self.parts.wpn_fps_sho_boot_b_long.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_long"
	self.parts.wpn_fps_sho_boot_fg_standard.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_fg_standard"
	self.parts.wpn_fps_sho_boot_s_short.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_s_short"
	self.parts.wpn_fps_sho_boot_s_long.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_s_long"
	self.parts.wpn_fps_sho_boot_body_standard.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_body_standard"
	self.parts.wpn_fps_sho_boot_body_exotic.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_body_exotic"
	self.parts.wpn_fps_sho_boot_m_standard.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_m_standard"
	self.parts.wpn_fps_sho_boot_em_extra.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_em_extra"
	self.wpn_fps_sho_boot = {}
	self.wpn_fps_sho_boot.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -5,
				concealment = -7,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
	}
	self.wpn_fps_sho_boot.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_sho_boot.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot"
	self.wpn_fps_sho_boot.animations = {
		reload_enter = "reload_enter",
		reload_exit = "reload_exit",
		reload_not_empty_exit = "reload_exit_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_sho_boot.default_blueprint = {
		"wpn_fps_sho_boot_b_standard",
		"wpn_fps_sho_boot_fg_standard",
		"wpn_fps_sho_boot_s_short",
		"wpn_fps_sho_boot_body_standard",
		"wpn_fps_sho_boot_m_standard",
		"wpn_fps_sho_boot_em_extra"
	}
	self.wpn_fps_sho_boot.uses_parts = {
		"wpn_fps_sho_boot_b_standard",
		"wpn_fps_sho_boot_b_short",
		"wpn_fps_sho_boot_b_long",
		"wpn_fps_sho_boot_fg_standard",
		"wpn_fps_sho_boot_s_short",
		"wpn_fps_sho_boot_s_long",
		"wpn_fps_sho_boot_body_standard",
		"wpn_fps_sho_boot_body_exotic",
		"wpn_fps_sho_boot_m_standard",
		"wpn_fps_sho_boot_em_extra",
		"wpn_fps_sho_boot_b_legendary",
		"wpn_fps_sho_boot_fg_legendary",
		"wpn_fps_sho_boot_o_legendary",
		"wpn_fps_sho_boot_s_legendary",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_ns_duck"
	}
	self.wpn_fps_sho_boot_npc = deep_clone(self.wpn_fps_sho_boot)
	self.wpn_fps_sho_boot_npc.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot_npc"
end

function WeaponFactoryTweakData:_init_packrat()
	self.parts.wpn_fps_pis_packrat_b_standard = {
		type = "barrel",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_body_standard = {
		type = "lower_receiver",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_bolt_standard = {
		type = "extra",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_m_extended = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_packrat_m_extended",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_m_extended",
		supported = true,
		stats = {
			value = 1,
			extra_ammo = 10,
			concealment = -1,
			reload = -2
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_pis_packrat_m_standard = {
		type = "magazine",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_ns_wick = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_packrat_ns_extended",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_ns_wick",
		supported = true,
		stats = {
			value = 5,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_pis_packrat_o_expert = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_packrat_o_expert",
		a_obj = "a_o",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_o_expert",
		supported = true,
		stats = {value = 1},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_pis_packrat_o_standard = {
		type = "sight",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_o",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_o_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_sl_standard = {
		type = "slide",
		name_id = "bm_wp_packrat_b_standard",
		a_obj = "a_sl",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_sl_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_packrat_b_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_b_standard"
	self.parts.wpn_fps_pis_packrat_body_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_body_standard"
	self.parts.wpn_fps_pis_packrat_bolt_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_bolt_standard"
	self.parts.wpn_fps_pis_packrat_m_extended.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_m_extended"
	self.parts.wpn_fps_pis_packrat_m_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_m_standard"
	self.parts.wpn_fps_pis_packrat_ns_wick.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_ns_wick"
	self.parts.wpn_fps_pis_packrat_o_expert.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_o_expert"
	self.parts.wpn_fps_pis_packrat_o_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_o_standard"
	self.parts.wpn_fps_pis_packrat_sl_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_sl_standard"
	self.wpn_fps_pis_packrat = {}
	self.wpn_fps_pis_packrat.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_packrat.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat/wpn_fps_pis_packrat"
	self.wpn_fps_pis_packrat.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil",
		magazine_empty = "last_recoil"
	}
	self.wpn_fps_pis_packrat.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_upg_pis_ns_flash = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_slim = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_ass_filter = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_jungle = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_small = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large_kac = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_gem = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_ipsccomp = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_meatgrinder = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_o_rms = {
			parent = "slide"
		},
		wpn_fps_upg_o_rikt = {
			parent = "slide"
		},
		wpn_fps_upg_ns_pis_typhoon = {
			a_obj = "a_ns",
			parent = "barrel"
		}			
	}
	self.wpn_fps_pis_packrat.default_blueprint = {
		"wpn_fps_pis_packrat_b_standard",
		"wpn_fps_pis_packrat_body_standard",
		"wpn_fps_pis_packrat_bolt_standard",
		"wpn_fps_pis_packrat_m_standard",
		"wpn_fps_pis_packrat_o_standard",
		"wpn_fps_pis_packrat_sl_standard"
	}
	self.wpn_fps_pis_packrat.uses_parts = {
		"wpn_fps_pis_packrat_b_standard",
		"wpn_fps_pis_packrat_body_standard",
		"wpn_fps_pis_packrat_bolt_standard",
		"wpn_fps_pis_packrat_m_standard",
		"wpn_fps_pis_packrat_o_standard",
		"wpn_fps_pis_packrat_sl_standard",
		"wpn_fps_pis_packrat_m_extended",
		"wpn_fps_pis_packrat_ns_wick",
		"wpn_fps_pis_packrat_o_expert",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_upg_o_rms",
		"wpn_fps_upg_o_rikt",
		"wpn_fps_upg_ns_pis_typhoon",
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2"
	}
	self.wpn_fps_pis_packrat_npc = deep_clone(self.wpn_fps_pis_packrat)
	self.wpn_fps_pis_packrat_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat/wpn_fps_pis_packrat_npc"
end

function WeaponFactoryTweakData:_init_schakal()
	self.parts.wpn_fps_smg_schakal_b_civil = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_schakal_b_civil",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_b_civil",
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_b_standard = {
		type = "barrel",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_body_lower = {
		type = "lower_receiver",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_body_lower",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_body_upper = {
		type = "upper_reciever",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_body_upper",
		supported = true,
		stats = {value = 1},
		adds = {
			"wpn_fps_smg_schakal_vg_extra"
		}
	}
	self.parts.wpn_fps_smg_schakal_m_long = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_schakal_m_long",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 40},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_long",
		supported = true,
		stats = {
			value = 1,
			extra_ammo = 10,
			reload = -2,
			concealment = -1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_m_short = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_schakal_m_short",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 16},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_short",
		supported = true,
		stats = {
			value = 1,
			extra_ammo = -10,
			reload = 2,
			concealment = 1,
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_m_standard = {
		type = "magazine",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 28},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_ns_silencer = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_schakal_ns_silencer",
		parent = "barrel",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_ns_silencer",
		supported = true,
		stats = {
			value = 5,
			suppression = 12,
			alert_size = -1,
			spread = 2,
			recoil = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_s_civil = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_schakal_s_civil",
		a_obj = "a_s",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_civil",
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			spread = -1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_s_folded = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_schakal_s_folded",
		a_obj = "a_s",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_folded",
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_s_standard = {
		type = "stock",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_bolt_standard = {
		type = "extra",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_vg_extra = {
		type = "extra",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_vg",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_extra",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_extra_magrelease = {
		type = "extra",
		name_id = "bm_wp_schakal_standard",
		a_obj = "a_extra",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_extra_magrelease",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_schakal_vg_surefire = {
		pcs = {},
		type = "vertical_grip",
		name_id = "bm_wp_schakal_vg_surefire",
		a_obj = "a_vg",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire",
		supported = true,
		stats = {value = 1},
		perks = {"gadget"},
		sub_type = "laser",
		forbids = {
			"wpn_fps_smg_schakal_vg_extra"
		},
		adds = {
			"wpn_fps_smg_schakal_vg_surefire_flashlight"
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_schakal_vg_surefire_flashlight = {
		type = "extra",
		a_obj = "a_fl",
		sub_type = "flashlight",
		parent = "vertical_grip",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15_flashlight",
		supported = true,
		stats = {value = 1},
		perks = {"gadget"}
	}
	self.parts.wpn_fps_smg_schakal_b_civil.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_b_civil"
	self.parts.wpn_fps_smg_schakal_b_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_b_standard"
	self.parts.wpn_fps_smg_schakal_body_lower.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_body_lower"
	self.parts.wpn_fps_smg_schakal_body_upper.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_body_upper"
	self.parts.wpn_fps_smg_schakal_m_long.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_long"
	self.parts.wpn_fps_smg_schakal_m_short.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_short"
	self.parts.wpn_fps_smg_schakal_m_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_standard"
	self.parts.wpn_fps_smg_schakal_ns_silencer.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_ns_silencer"
	self.parts.wpn_fps_smg_schakal_s_civil.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_civil"
	self.parts.wpn_fps_smg_schakal_s_folded.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_folded"
	self.parts.wpn_fps_smg_schakal_s_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_standard"
	self.parts.wpn_fps_smg_schakal_dh_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_dh_standard"
	self.parts.wpn_fps_smg_schakal_bolt_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_bolt_standard"
	self.parts.wpn_fps_smg_schakal_vg_extra.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_extra"
	self.parts.wpn_fps_smg_schakal_vg_surefire.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	self.parts.wpn_fps_smg_schakal_extra_magrelease.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_extra_magrelease"
	self.wpn_fps_smg_schakal = {}
	self.wpn_fps_smg_schakal.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_smg_schakal.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal"
	self.wpn_fps_smg_schakal.animations = {
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload",
		magazine_empty = "last_recoil"
	}
	self.wpn_fps_smg_schakal.default_blueprint = {
		"wpn_fps_smg_schakal_b_standard",
		"wpn_fps_smg_schakal_body_lower",
		"wpn_fps_smg_schakal_body_upper",
		"wpn_fps_smg_schakal_m_standard",
		"wpn_fps_smg_schakal_s_standard",
		"wpn_fps_smg_schakal_dh_standard",
		"wpn_fps_smg_schakal_bolt_standard",
		"wpn_fps_smg_schakal_extra_magrelease"
	}
	self.wpn_fps_smg_schakal.uses_parts = {
		"wpn_fps_smg_schakal_b_civil",
		"wpn_fps_smg_schakal_b_standard",
		"wpn_fps_smg_schakal_body_lower",
		"wpn_fps_smg_schakal_body_upper",
		"wpn_fps_smg_schakal_m_long",
		"wpn_fps_smg_schakal_m_short",
		"wpn_fps_smg_schakal_m_standard",
		"wpn_fps_smg_schakal_ns_silencer",
		"wpn_fps_smg_schakal_s_civil",
		"wpn_fps_smg_schakal_s_folded",
		"wpn_fps_smg_schakal_s_standard",
		"wpn_fps_smg_schakal_dh_standard",
		"wpn_fps_smg_schakal_bolt_standard",
		"wpn_fps_smg_schakal_vg_extra",
		"wpn_fps_smg_schakal_vg_surefire",
		"wpn_fps_smg_schakal_extra_magrelease",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof"	
	}
	self.wpn_fps_smg_schakal_npc = deep_clone(self.wpn_fps_smg_schakal)
	self.wpn_fps_smg_schakal_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal_npc"
end

function WeaponFactoryTweakData:_init_desertfox()
	self.parts.wpn_fps_snp_desertfox_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_desertfox_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_b_long",
		supported = true,
		stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_snp_desertfox_b_short = {
		type = "barrel",
		name_id = "bm_wp_desertfox_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_b_short",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_desertfox_b_silencer = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_desertfox_b_silenced",
		a_obj = "a_b",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_b_silencer",
		supported = true,
		stats = {
			value = 10,
			suppression = 10,
			alert_size = -1,
			spread = -1,
			recoil = 1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		dlc = "pim",
		texture_bundle_folder = "pim",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_snp_desertfox_body = {
		type = "lower_receiver",
		name_id = "bm_wp_desertfox_b_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_desertfox_dh_standard = {
		type = "extra",
		name_id = "bm_wp_desertfox_b_standard",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_desertfox_mag = {
		type = "magazine",
		name_id = "bm_wp_desertfox_b_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_mag",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_desertfox_b_long.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_b_long"
	self.parts.wpn_fps_snp_desertfox_b_short.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_b_short"
	self.parts.wpn_fps_snp_desertfox_b_silencer.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_b_silencer"
	self.parts.wpn_fps_snp_desertfox_body.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_body"
	self.parts.wpn_fps_snp_desertfox_dh_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_dh_standard"
	self.parts.wpn_fps_snp_desertfox_mag.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_mag"
	self.wpn_fps_snp_desertfox = {}
	self.wpn_fps_snp_desertfox.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_snp_desertfox.unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox/wpn_fps_snp_desertfox"
	self.wpn_fps_snp_desertfox.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil"
	}				
	self.wpn_fps_snp_desertfox.override = {	
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup"}
		}
	}
	self.wpn_fps_snp_desertfox.default_blueprint = {
		"wpn_fps_snp_desertfox_b_short",
		"wpn_fps_snp_desertfox_body",
		"wpn_fps_snp_desertfox_dh_standard",
		"wpn_fps_snp_desertfox_mag",
		"wpn_fps_upg_o_shortdot"
	}
	self.wpn_fps_snp_desertfox.uses_parts = {
		"wpn_fps_snp_desertfox_b_long",
		"wpn_fps_snp_desertfox_b_short",
		"wpn_fps_snp_desertfox_b_silencer",
		"wpn_fps_snp_desertfox_body",
		"wpn_fps_snp_desertfox_dh_standard",
		"wpn_fps_snp_desertfox_mag",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_snp_model70_iron_sight",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_box",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel"
	}
	self.wpn_fps_snp_desertfox_npc = deep_clone(self.wpn_fps_snp_desertfox)
	self.wpn_fps_snp_desertfox_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox/wpn_fps_snp_desertfox_npc"
end

function WeaponFactoryTweakData:_init_x_packrat()
	self.wpn_fps_x_packrat = {}
	self.wpn_fps_x_packrat.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_x_packrat.unit = "units/pd2_dlc_pim/weapons/wpn_fps_x_packrat/wpn_fps_x_packrat"
	self.wpn_fps_x_packrat.animations = {
		reload = "reload_right",
		reload_not_empty = "reload_not_empty_right",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload_left = "reload_left",
		reload_not_empty_left = "reload_not_empty_left",
		magazine_empty = "last_recoil"
	}
	self.wpn_fps_x_packrat.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_upg_pis_ns_flash = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_slim = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_ass_filter = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_jungle = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_small = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large_kac = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_gem = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_ipsccomp = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_meatgrinder = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_o_rms = {
			parent = "slide"
		},
		wpn_fps_upg_o_rikt = {
			parent = "slide"
		},
		wpn_fps_upg_ns_pis_typhoon = {
			a_obj = "a_ns",
			parent = "barrel"
		},			
		wpn_fps_pis_packrat_m_extended = {
			supported = true,
			stats = {
				value = 1,
				extra_ammo = 20,
				concealment = -1,
				reload = -2
			}
		}
	}
	self.wpn_fps_x_packrat.default_blueprint = {
		"wpn_fps_pis_packrat_b_standard",
		"wpn_fps_pis_packrat_body_standard",
		"wpn_fps_pis_packrat_bolt_standard",
		"wpn_fps_pis_packrat_m_standard",
		"wpn_fps_pis_packrat_o_standard",
		"wpn_fps_pis_packrat_sl_standard"
	}
	self.wpn_fps_x_packrat.uses_parts = {
		"wpn_fps_pis_packrat_b_standard",
		"wpn_fps_pis_packrat_body_standard",
		"wpn_fps_pis_packrat_bolt_standard",
		"wpn_fps_pis_packrat_m_standard",
		"wpn_fps_pis_packrat_o_standard",
		"wpn_fps_pis_packrat_sl_standard",
		"wpn_fps_pis_packrat_m_extended",
		"wpn_fps_pis_packrat_ns_wick",
		"wpn_fps_pis_packrat_o_expert",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_upg_ns_pis_typhoon",
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2"
	}
	self.wpn_fps_x_packrat_npc = deep_clone(self.wpn_fps_x_packrat)
	self.wpn_fps_x_packrat_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_x_packrat/wpn_fps_x_packrat_npc"
end

--Goliath 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_rota", "resmod_rota", function(self)

	--Short Barrel
	self.parts.wpn_fps_sho_rota_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_rota_b_short.supported = true
	self.parts.wpn_fps_sho_rota_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_sho_rota_b_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Silenced Barrel
	self.parts.wpn_fps_sho_rota_b_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_rota_b_silencer.supported = true
	self.parts.wpn_fps_sho_rota_b_silencer.stats = {
		value = 2,
		suppression = 11,
		alert_size = -1,
		recoil = -1,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_sho_rota_b_silencer.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	self.parts.wpn_fps_sho_rota_b_silencer.perks = {"silencer"}
	
	self.wpn_fps_sho_rota.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = 0,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},	
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},				
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,	
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override		
	}
end)

--Spec Ops Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_tng", "resmod_tng", function(self)

	--Saiga Short Barrel
	self.parts.wpn_fps_sho_saiga_b_short.pcs = {}
	self.parts.wpn_fps_sho_saiga_b_short.supported = true
	self.parts.wpn_fps_sho_saiga_b_short.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_sho_saiga_b_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	--Hollow Handle
	self.parts.wpn_fps_sho_saiga_fg_holy.pcs = {}
	self.parts.wpn_fps_sho_saiga_fg_holy.supported = true
	self.parts.wpn_fps_sho_saiga_fg_holy.stats = {value = 1, recoil = -1, concealment = 1}
	
	--45 RDS
	self.parts.wpn_fps_upg_o_45rds.pcs = {}
	self.parts.wpn_fps_upg_o_45rds.supported = true
	self.parts.wpn_fps_upg_o_45rds.stats = {
		value = 1,
		gadget_zoom = 2
	}
	self.parts.wpn_fps_upg_o_45rds.perks = {"gadget"}
	
	--Reconnaissance Sight
	self.parts.wpn_fps_upg_o_spot.pcs = {}
	self.parts.wpn_fps_upg_o_spot.supported = true
	self.parts.wpn_fps_upg_o_spot.stats = {
		value = 8,
		zoom = 40
	}
	self.parts.wpn_fps_upg_o_spot.perks = {"scope"}
	self.parts.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Box Buddy Sight
	self.parts.wpn_fps_upg_o_box.pcs = {}
	self.parts.wpn_fps_upg_o_box.desc_id = "bm_wp_upg_o_leupold_desc_sc"
	self.parts.wpn_fps_upg_o_box.has_description = true
	self.parts.wpn_fps_upg_o_box.supported = true
	self.parts.wpn_fps_upg_o_box.stats = {
		value = 8,
		zoom = 50,
		concealment = -2
	}
	self.parts.wpn_fps_upg_o_box.perks = {"scope", "highlight"}
	self.parts.wpn_fps_upg_o_box.reticle_obj = nil
	
	--Vintage Sight
	self.parts.wpn_fps_ass_g36_o_vintage.pcs = {}
	self.parts.wpn_fps_ass_g36_o_vintage.has_description = true
	self.parts.wpn_fps_ass_g36_o_vintage.reticle_obj = nil
	self.parts.wpn_fps_ass_g36_o_vintage.supported = true
	self.parts.wpn_fps_ass_g36_o_vintage.stats = {
		value = 1,
		zoom = 40
	}
	self.parts.wpn_fps_ass_g36_o_vintage.perks = {"scope"}
	
	--JP36 Long Foregrip
	self.parts.wpn_fps_upg_g36_fg_long.pcs = {}
	self.parts.wpn_fps_upg_g36_fg_long.supported = true
	self.parts.wpn_fps_upg_g36_fg_long.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	
	--Enlightened Foregrip
	self.parts.wpn_fps_smg_mp5_fg_flash.pcs = {}
	self.parts.wpn_fps_smg_mp5_fg_flash.supported = true
	self.parts.wpn_fps_smg_mp5_fg_flash.stats = {
		value = 1,
		spread = 1,
		recoil = -1,
		concealment = -1
	}
	self.parts.wpn_fps_smg_mp5_fg_flash.perks = {"gadget"}
	
	--Spartan Stock
	self.parts.wpn_fps_smg_mp5_s_folding.pcs = {}
	self.parts.wpn_fps_smg_mp5_s_folding.supported = true
	self.parts.wpn_fps_smg_mp5_s_folding.stats = {
		value = 1, 
		spread = -1, 
		recoil = 1
	}
	
	--Donald's Horizontal Leveller
	self.parts.wpn_fps_upg_ns_duck.pcs = {}
	self.parts.wpn_fps_upg_ns_duck.desc_id = "bm_wp_ns_duck_desc_sc"
	self.parts.wpn_fps_upg_ns_duck.has_description = true
	self.parts.wpn_fps_upg_ns_duck.supported = true
	self.parts.wpn_fps_upg_ns_duck.stats = {
		value = 5,
		spread_multi = {2.25, 0.5},
		suppression = -2,
		recoil = 1,
		spread = -1
	}
	self.parts.wpn_fps_upg_ns_duck.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}
	
	self.parts.wpn_fps_pis_usp_m_big.pcs = {}
	self.parts.wpn_fps_pis_usp_m_big.supported = true
	self.parts.wpn_fps_pis_usp_m_big.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 10,
		spread = -1,
		recoil = 1,
		reload = -2
	}
	
	self.parts.wpn_fps_pis_1911_m_big.pcs = {}
	self.parts.wpn_fps_pis_1911_m_big.supported = true
	self.parts.wpn_fps_pis_1911_m_big.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 6,
		spread = -1,
		recoil = 1,			
		reload = -2
	}
	
	self.parts.wpn_fps_smg_p90_m_strap.pcs = {}
	self.parts.wpn_fps_smg_p90_m_strap.supported = true
	self.parts.wpn_fps_smg_p90_m_strap.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_ass_aug_m_quick.pcs = {}
	self.parts.wpn_fps_ass_aug_m_quick.supported = true
	self.parts.wpn_fps_ass_aug_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_m4_upg_m_quick.pcs = {}
	self.parts.wpn_fps_m4_upg_m_quick.supported = true
	self.parts.wpn_fps_m4_upg_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_upg_ak_m_quick.pcs = {}
	self.parts.wpn_fps_upg_ak_m_quick.supported = true
	self.parts.wpn_fps_upg_ak_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_ass_g36_m_quick.pcs = {}
	self.parts.wpn_fps_ass_g36_m_quick.supported = true		
	self.parts.wpn_fps_ass_g36_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_smg_mac10_m_quick.pcs = {}
	self.parts.wpn_fps_smg_mac10_m_quick.supported = true
	self.parts.wpn_fps_smg_mac10_m_quick.stats = {
		value = 2,
		spread = -1,
		extra_ammo = 10,
		reload = 2,
		concealment = -2
	}
	
	
	self.parts.wpn_fps_smg_sr2_m_quick.pcs = {}
	self.parts.wpn_fps_smg_sr2_m_quick.supported = true
	self.parts.wpn_fps_smg_sr2_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}

end)

function WeaponFactoryTweakData:_init_arbiter()
	self.parts.wpn_fps_gre_arbiter_b_standard = {
		type = "barrel",
		name_id = "bm_wp_arbiter_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_arbiter_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_b_long",
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		texture_bundle_folder = "tng",
		dlc = "tango",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_gre_arbiter_b_comp = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_arbiter_b_comp",
		a_obj = "a_b",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_b_comp",
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			concealment = 1
		},
		texture_bundle_folder = "tng",
		dlc = "tango",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_gre_arbiter_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_l85a2_fg_medium",
		a_obj = "a_body",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_m_standard = {
		type = "magazine",
		name_id = "bm_wp_l85a2_fg_medium",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_s_standard = {
		type = "stock",
		name_id = "bm_wp_mp5_s_folding",
		a_obj = "a_s",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_bolt = {
		type = "extra",
		name_id = "bm_wp_mp5_s_folding",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_bolt",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_charginghandle = {
		type = "drag_handle",
		name_id = "bm_wp_mp5_s_folding",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_charginghandle",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_ejector = {
		type = "extra",
		name_id = "bm_wp_mp5_s_folding",
		a_obj = "a_ejector",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_ejector",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_arbiter_o_standard = {
		type = "sight",
		name_id = "bm_wp_mp5_s_folding",
		a_obj = "a_o",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_o_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
	}
	self.parts.wpn_fps_gre_arbiter_b_comp.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_b_comp"
	self.parts.wpn_fps_gre_arbiter_b_long.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_b_long"
	self.parts.wpn_fps_gre_arbiter_b_standard.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_b_standard"
	self.parts.wpn_fps_gre_arbiter_body_standard.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_body_standard"
	self.parts.wpn_fps_gre_arbiter_m_standard.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_m_standard"
	self.parts.wpn_fps_gre_arbiter_s_standard.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_s_standard"
	self.parts.wpn_fps_gre_arbiter_bolt.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_bolt"
	self.parts.wpn_fps_gre_arbiter_charginghandle.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_charginghandle"
	self.parts.wpn_fps_gre_arbiter_ejector.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_ejector"
	self.parts.wpn_fps_gre_arbiter_o_standard.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_o_standard"
	self.wpn_fps_gre_arbiter = {}
	self.wpn_fps_gre_arbiter.unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter/wpn_fps_gre_arbiter"
	self.wpn_fps_gre_arbiter.optional_types = {
		"gadget",
		"sight",
		"barrel_ext"
	}
	self.wpn_fps_gre_arbiter.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil_zoom"
	}
	self.wpn_fps_gre_arbiter.stock_adapter = "wpn_fps_gre_arbiter_stock_adapter"
	self.wpn_fps_gre_arbiter.forbids = {
		"wpn_fps_addon_ris"
	}
	self.wpn_fps_gre_arbiter.adds = {}
	self.wpn_fps_gre_arbiter.default_blueprint = {
		"wpn_fps_gre_arbiter_b_standard",
		"wpn_fps_gre_arbiter_body_standard",
		"wpn_fps_gre_arbiter_m_standard",
		"wpn_fps_gre_arbiter_s_standard",
		"wpn_fps_gre_arbiter_bolt",
		"wpn_fps_gre_arbiter_charginghandle",
		"wpn_fps_gre_arbiter_ejector",
		"wpn_fps_gre_arbiter_o_standard"
	}
	self.wpn_fps_gre_arbiter.uses_parts = {
		"wpn_fps_gre_arbiter_b_comp",
		"wpn_fps_gre_arbiter_b_long",
		"wpn_fps_gre_arbiter_b_standard",
		"wpn_fps_gre_arbiter_body_standard",
		"wpn_fps_gre_arbiter_m_standard",
		"wpn_fps_gre_arbiter_s_standard",
		"wpn_fps_gre_arbiter_bolt",
		"wpn_fps_gre_arbiter_charginghandle",
		"wpn_fps_gre_arbiter_ejector",
		"wpn_fps_gre_arbiter_o_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1"			
	}
	self.wpn_fps_gre_arbiter_npc = deep_clone(self.wpn_fps_gre_arbiter)
	self.wpn_fps_gre_arbiter_npc.unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter/wpn_fps_gre_arbiter_npc"
end

function WeaponFactoryTweakData:_init_contraband()
	self.parts.wpn_fps_ass_contraband_b_standard = {
		type = "barrel",
		name_id = "bm_wp_contraband_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_body_standard = {
		type = "lower_receiver",
		name_id = "bm_wp_contraband_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_contraband_dh_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_contraband_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_g_standard = {
		type = "grip",
		name_id = "bm_wp_contraband_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_gl_m203 = {
		type = "underbarrel",
		sub_type = "grenade_launcher",
		name_id = "bm_wp_contraband_gl_m203",
		bullet_objects = {prefix = "g_grenade_", amount = 1},
		a_obj = "a_gl",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_gl_m203",
		supported = true,
		stats = {value = 1},
		animations = {bipod_reload = "reload_ul"},
		perks = {
			"underbarrel"
		}
	}
	self.parts.wpn_fps_ass_contraband_m_standard = {
		type = "magazine",
		name_id = "bm_wp_contraband_m_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_contraband_ns_standard",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_o_standard = {
		type = "sight",
		name_id = "bm_wp_contraband_o_standard",
		a_obj = "a_o",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_o_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.parts.wpn_fps_ass_contraband_s_standard = {
		type = "stock",
		name_id = "bm_wp_contraband_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_bolt_standard = {
		type = "extra",
		name_id = "bm_wp_contraband_s_standard",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_contraband_b_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_b_standard"
	self.parts.wpn_fps_ass_contraband_body_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_body_standard"
	self.parts.wpn_fps_ass_contraband_dh_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_dh_standard"
	self.parts.wpn_fps_ass_contraband_fg_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_fg_standard"
	self.parts.wpn_fps_ass_contraband_g_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_g_standard"
	self.parts.wpn_fps_ass_contraband_gl_m203.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_gl_m203"
	self.parts.wpn_fps_ass_contraband_m_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_m_standard"
	self.parts.wpn_fps_ass_contraband_ns_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_ns_standard"
	self.parts.wpn_fps_ass_contraband_o_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_o_standard"
	self.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_s_standard"
	self.parts.wpn_fps_ass_contraband_bolt_standard.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_bolt_standard"
	self.wpn_fps_ass_contraband = {}
	self.wpn_fps_ass_contraband.unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband/wpn_fps_ass_contraband"
	self.wpn_fps_ass_contraband.optional_types = {
		"gadget",
		"sight",
		"barrel_ext"
	}
	self.wpn_fps_ass_contraband.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil",
		bipod_reload = "bipod_reload",
		bipod_fire = "bipod_recoil",
		bipod_fire_steelsight = "bipod_recoil_zoom"
	}
	self.wpn_fps_ass_contraband.forbids = {
		"wpn_fps_addon_ris"
	}
	self.wpn_fps_ass_contraband.adds = {}
	self.wpn_fps_ass_contraband.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_contraband.default_blueprint = {
		"wpn_fps_ass_contraband_b_standard",
		"wpn_fps_ass_contraband_body_standard",
		"wpn_fps_ass_contraband_dh_standard",
		"wpn_fps_ass_contraband_fg_standard",
		"wpn_fps_ass_contraband_g_standard",
		"wpn_fps_ass_contraband_gl_m203",
		"wpn_fps_ass_contraband_m_standard",
		"wpn_fps_ass_contraband_ns_standard",
		"wpn_fps_ass_contraband_o_standard",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_ass_contraband_bolt_standard"
	}
	self.wpn_fps_ass_contraband.uses_parts = {
		"wpn_fps_ass_contraband_b_standard",
		"wpn_fps_ass_contraband_body_standard",
		"wpn_fps_ass_contraband_dh_standard",
		"wpn_fps_ass_contraband_fg_standard",
		"wpn_fps_ass_contraband_g_standard",
		"wpn_fps_ass_contraband_gl_m203",
		"wpn_fps_ass_contraband_m_standard",
		"wpn_fps_ass_contraband_ns_standard",
		"wpn_fps_ass_contraband_o_standard",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_ass_contraband_bolt_standard",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		--Here comes custom shit--
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_smg_olympic_s_short",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",			
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof"	
	}
	self.wpn_fps_ass_contraband_npc = deep_clone(self.wpn_fps_ass_contraband)
	self.wpn_fps_ass_contraband_npc.unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband/wpn_fps_ass_contraband_npc"
end

function WeaponFactoryTweakData:_init_tti()
	self.parts.wpn_fps_snp_tti_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_tti_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_vg_standard = {
		type = "vertical_grip",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_vg",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_vg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_s_vltor = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_tti_s_vltor",
		a_obj = "a_s",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor",
		supported = true,
		stats = {
			value = 6,
			recoil = -2,
			concealment = -2,
			spread = 2
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		},
		adds_type = {
			"stock_adapter"
		},
		dlc = "spa",
		texture_bundle_folder = "spa"
	}
	self.parts.wpn_fps_snp_tti_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_ns",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_ns_hex = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_tti_ns_hex",
		a_obj = "a_ns",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_ns_hex",
		supported = true,
		stats = {
			value = 5,
			suppression = 12,
			alert_size = -1,
			spread = 2,
			recoil = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		},
		dlc = "spa",
		texture_bundle_folder = "spa"
	}
	self.parts.wpn_fps_snp_tti_m_standard = {
		type = "magazine",
		name_id = "bm_wp_tti_vg_standard",
		bullet_objects = {prefix = "g_bullet_", amount = 20},
		a_obj = "a_m",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_g_grippy = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_tti_g_grippy",
		a_obj = "a_g",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_g_grippy",
		supported = true,
		stats = {value = 1, recoil = -1, concealment = 1},
		dlc = "spa",
		texture_bundle_folder = "spa"
	}
	self.parts.wpn_fps_snp_tti_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_dhs_switch = {
		type = "switch",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_dhs",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_dhs_switch",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_bolt_standard = {
		type = "bolt",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_bolt",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_body_receiverupper = {
		type = "upper_reciever",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_body_receiverupper",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_body_receiverlower = {
		type = "lower_receiver",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_body_receiverlower",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_b_standard = {
		type = "barrel",
		name_id = "bm_wp_tti_vg_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_tti_body_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_body_standard"
	self.parts.wpn_fps_snp_tti_vg_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_vg_standard"
	self.parts.wpn_fps_snp_tti_s_vltor.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	self.parts.wpn_fps_snp_tti_ns_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_ns_standard"
	self.parts.wpn_fps_snp_tti_ns_hex.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_ns_hex"
	self.parts.wpn_fps_snp_tti_m_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_m_standard"
	self.parts.wpn_fps_snp_tti_g_grippy.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_g_grippy"
	self.parts.wpn_fps_snp_tti_fg_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_fg_standard"
	self.parts.wpn_fps_snp_tti_dhs_switch.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_dhs_switch"
	self.parts.wpn_fps_snp_tti_dh_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_dh_standard"
	self.parts.wpn_fps_snp_tti_bolt_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_bolt_standard"
	self.parts.wpn_fps_snp_tti_body_receiverupper.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_body_receiverupper"
	self.parts.wpn_fps_snp_tti_body_receiverlower.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_body_receiverlower"
	self.parts.wpn_fps_snp_tti_b_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_b_standard"
	self.wpn_fps_snp_tti = {}
	self.wpn_fps_snp_tti.override = {	
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup"}
		}
	}							
	self.wpn_fps_snp_tti.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti/wpn_fps_snp_tti"
	self.wpn_fps_snp_tti.optional_types = {"gadget", "sight"}
	self.wpn_fps_snp_tti.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_snp_tti.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_snp_tti.default_blueprint = {
		"wpn_fps_snp_tti_vg_standard",
		"wpn_fps_snp_tti_ns_standard",
		"wpn_fps_snp_tti_m_standard",
		"wpn_fps_snp_tti_fg_standard",
		"wpn_fps_snp_tti_dhs_switch",
		"wpn_fps_snp_tti_dh_standard",
		"wpn_fps_snp_tti_bolt_standard",
		"wpn_fps_snp_tti_body_receiverupper",
		"wpn_fps_snp_tti_body_receiverlower",
		"wpn_fps_snp_tti_b_standard",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_snp_tti.uses_parts = {
		"wpn_fps_snp_tti_vg_standard",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_ns_standard",
		"wpn_fps_snp_tti_ns_hex",
		"wpn_fps_snp_tti_m_standard",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_snp_tti_fg_standard",
		"wpn_fps_snp_tti_dhs_switch",
		"wpn_fps_snp_tti_dh_standard",
		"wpn_fps_snp_tti_bolt_standard",
		"wpn_fps_snp_tti_body_receiverupper",
		"wpn_fps_snp_tti_body_receiverlower",
		"wpn_fps_snp_tti_b_standard",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_s_adapter",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_box",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		--Stuff--
		"wpn_fps_snp_model70_iron_sight",
		"wpn_fps_upg_m4_s_standard"
	}
	self.wpn_fps_snp_tti_npc = deep_clone(self.wpn_fps_snp_tti)
	self.wpn_fps_snp_tti_npc.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti/wpn_fps_snp_tti_npc"
end

function WeaponFactoryTweakData:_init_siltstone()
	self.parts.wpn_fps_snp_siltstone_b_standard = {
		type = "barrel",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_b_silenced = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_siltstone_b_silenced",
		a_obj = "a_b",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_b_silenced",
		supported = true,
		stats = {
			value = 5,
			suppression = 12,
			alert_size = -1,
			spread = 2,
			recoil = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		dlc = "grv",
		texture_bundle_folder = "grv"
	}
	self.parts.wpn_fps_snp_siltstone_ns_variation_b = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_siltstone_ns_variation_b",
		a_obj = "a_b",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_ns_variation_b",
		supported = true,
		stats = {
			value = 4,			
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "grv",
		texture_bundle_folder = "grv"
	}
	self.parts.wpn_fps_snp_siltstone_body_receiver = {
		type = "lower_receiver",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_body_receiver",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_ejector = {
		type = "extra",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_m_release",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_ejector",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_fg_polymer = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_siltstone_fg_polymer",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_fg_polymer",
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		},
		dlc = "grv",
		texture_bundle_folder = "grv"
	}
	self.parts.wpn_fps_snp_siltstone_fg_wood = {
		type = "foregrip",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_fg_wood",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_m_standard = {
		type = "magazine",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_o_scopemount = {
		type = "extra",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_o",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_o_scopemount",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_iron_sight = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_siltstone_iron_sight",
		a_obj = "a_o",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_iron_sight",
		supported = true,
		stats = {
			value = 0
		},
		dlc = "grv",
		texture_bundle_folder = "grv",
		forbids = {
			"wpn_fps_upg_o_45iron",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.parts.wpn_fps_snp_siltstone_s_polymer = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_siltstone_s_polymer",
		a_obj = "a_s",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_s_polymer",
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		},
		dlc = "grv",
		texture_bundle_folder = "grv"
	}
	self.parts.wpn_fps_snp_siltstone_s_wood = {
		type = "stock",
		name_id = "bm_wp_siltstone_body_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_s_wood",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_siltstone_b_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_b_standard"
	self.parts.wpn_fps_snp_siltstone_b_silenced.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_b_silenced"
	self.parts.wpn_fps_snp_siltstone_body_receiver.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_body_receiver"
	self.parts.wpn_fps_snp_siltstone_dh_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_dh_standard"
	self.parts.wpn_fps_snp_siltstone_ejector.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_ejector"
	self.parts.wpn_fps_snp_siltstone_fg_polymer.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_fg_polymer"
	self.parts.wpn_fps_snp_siltstone_fg_wood.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_fg_wood"
	self.parts.wpn_fps_snp_siltstone_m_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_m_standard"
	self.parts.wpn_fps_snp_siltstone_ns_variation_b.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_ns_variation_b"
	self.parts.wpn_fps_snp_siltstone_o_scopemount.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_o_scopemount"
	self.parts.wpn_fps_snp_siltstone_s_polymer.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_s_polymer"
	self.parts.wpn_fps_snp_siltstone_s_wood.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_s_wood"
	self.wpn_fps_snp_siltstone = {}
	self.wpn_fps_snp_siltstone.unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone/wpn_fps_snp_siltstone"
	self.wpn_fps_snp_siltstone.optional_types = {"gadget", "sight"}
	self.wpn_fps_snp_siltstone.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_snp_siltstone.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_box = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_leupold = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_shortdot = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_spot = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_bmg = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_fc1 = {
			"wpn_fps_snp_siltstone_o_scopemount"
		},
		wpn_fps_upg_o_uh = {
			"wpn_fps_snp_siltstone_o_scopemount"
		}			
	}
	self.wpn_fps_snp_siltstone.default_blueprint = {
		"wpn_fps_snp_siltstone_b_standard",
		"wpn_fps_snp_siltstone_body_receiver",
		"wpn_fps_snp_siltstone_dh_standard",
		"wpn_fps_snp_siltstone_ejector",
		"wpn_fps_snp_siltstone_fg_wood",
		"wpn_fps_snp_siltstone_m_standard",
		"wpn_fps_snp_siltstone_s_wood",
		"wpn_fps_upg_o_shortdot"
	}
	self.wpn_fps_snp_siltstone.uses_parts = {
		"wpn_fps_snp_siltstone_b_standard",
		"wpn_fps_snp_siltstone_b_silenced",
		"wpn_fps_snp_siltstone_body_receiver",
		"wpn_fps_snp_siltstone_dh_standard",
		"wpn_fps_snp_siltstone_ejector",
		"wpn_fps_snp_siltstone_fg_polymer",
		"wpn_fps_snp_siltstone_fg_wood",
		"wpn_fps_snp_siltstone_m_standard",
		"wpn_fps_snp_siltstone_ns_variation_b",
		"wpn_fps_snp_siltstone_o_scopemount",
		"wpn_fps_snp_siltstone_s_polymer",
		"wpn_fps_snp_siltstone_s_wood",
		"wpn_fps_snp_siltstone_iron_sight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_box",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel"	
	}
	self.wpn_fps_snp_siltstone_npc = deep_clone(self.wpn_fps_snp_siltstone)
	self.wpn_fps_snp_siltstone_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone/wpn_fps_snp_siltstone_npc"
end

function WeaponFactoryTweakData:_init_flint()
	self.parts.wpn_fps_ass_flint_b_standard = {
		type = "barrel",
		name_id = "bm_wp_flint_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_body_upperreceiver = {
		type = "upper_reciever",
		name_id = "bm_wp_flint_body_upperreceiver",
		a_obj = "a_body",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_body_receiver",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_flint_dh_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_flint_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_fg_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_flint_g_standard = {
		type = "grip",
		name_id = "bm_wp_flint_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_m_release_standard = {
		type = "extra",
		name_id = "bm_wp_flint_m_release_standard",
		a_obj = "a_m_release",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_m_release_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_m_standard = {
		type = "magazine",
		name_id = "bm_wp_flint_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_m_standard",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_flint_ns_standard",
		a_obj = "a_ns",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_o_standard = {
		type = "sight",
		name_id = "bm_wp_flint_o_standard",
		a_obj = "a_o",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_o_standard",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.parts.wpn_fps_ass_flint_s_standard = {
		type = "stock",
		name_id = "bm_wp_flint_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_flint_s_adapter = {
		type = "stock_adapter",
		name_id = "bm_wp_flint_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_s_adapter",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_flint_b_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_b_standard"
	self.parts.wpn_fps_ass_flint_body_upperreceiver.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_body_receiver"
	self.parts.wpn_fps_ass_flint_dh_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_dh_standard"
	self.parts.wpn_fps_ass_flint_fg_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_fg_standard"
	self.parts.wpn_fps_ass_flint_g_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_g_standard"
	self.parts.wpn_fps_ass_flint_m_release_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_m_release_standard"
	self.parts.wpn_fps_ass_flint_m_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_m_standard"
	self.parts.wpn_fps_ass_flint_ns_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_ns_standard"
	self.parts.wpn_fps_ass_flint_o_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_o_standard"
	self.parts.wpn_fps_ass_flint_s_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_s_standard"
	self.wpn_fps_ass_flint = {}
	self.wpn_fps_ass_flint.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint"
	self.wpn_fps_ass_flint.animations = {
		fire = "recoil",
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_ass_flint.stock_adapter = "wpn_fps_snp_flint_s_adapter"
	self.wpn_fps_ass_flint.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_ass_flint.default_blueprint = {
		"wpn_fps_ass_flint_b_standard",
		"wpn_fps_ass_flint_body_upperreceiver",
		"wpn_fps_ass_flint_m_standard",
		"wpn_fps_ass_flint_fg_standard",
		"wpn_fps_ass_flint_dh_standard",
		"wpn_fps_ass_flint_ns_standard",
		"wpn_fps_ass_flint_o_standard",
		"wpn_fps_ass_flint_s_standard",
		"wpn_fps_ass_flint_g_standard",
		"wpn_fps_ass_flint_m_release_standard"
	}
	self.wpn_fps_ass_flint.uses_parts = {
		"wpn_fps_ass_flint_b_standard",
		"wpn_fps_ass_flint_body_upperreceiver",
		"wpn_fps_ass_flint_m_standard",
		"wpn_fps_ass_flint_m_release_standard",
		"wpn_fps_ass_flint_fg_standard",
		"wpn_fps_ass_flint_dh_standard",
		"wpn_fps_ass_flint_ns_standard",
		"wpn_fps_ass_flint_o_standard",
		"wpn_fps_ass_flint_s_standard",
		"wpn_fps_ass_flint_g_standard",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ns_ass_pbs1",
		"wpn_fps_upg_ak_ns_ak105",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_ak_m_uspalm",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_ak_m_quick",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		--Stuff--
		"wpn_fps_upg_m4_s_standard",
		"wpn_upg_ak_s_psl",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof"	
	}
	self.wpn_fps_ass_flint_npc = deep_clone(self.wpn_fps_ass_flint)
	self.wpn_fps_ass_flint_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint_npc"
end

function WeaponFactoryTweakData:_init_coal()
	self.parts.wpn_fps_smg_coal_b_standard = {
		type = "barrel",
		name_id = "bm_wp_coal_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_coal_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_coal_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_coal_dh_standard = {
		type = "drag_handle",
		name_id = "bm_wp_coal_dh_standard",
		a_obj = "a_dh",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_dh_standard"
	}
	self.parts.wpn_fps_smg_coal_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_coal_fg_standard",
		a_obj = "a_fg",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_fg_standard"
	}
	self.parts.wpn_fps_smg_coal_g_standard = {
		type = "grip",
		name_id = "bm_wp_coal_g_standard",
		a_obj = "a_g",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard"
	}
	self.parts.wpn_fps_smg_coal_m_standard = {
		type = "magazine",
		name_id = "bm_wp_coal_m_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_m_standard"
	}
	self.parts.wpn_fps_smg_coal_mr_standard = {
		type = "extra",
		name_id = "bm_wp_coal_m_release_standard",
		a_obj = "a_mr",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_mr_standard"
	}
	self.parts.wpn_fps_smg_coal_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_coal_ns_standard",
		a_obj = "a_ns",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_ns_standard"
	}
	self.parts.wpn_fps_smg_coal_s_standard = {
		type = "stock",
		name_id = "bm_wp_coal_s_standard",
		a_obj = "a_s",
		supported = true,
		stats = {value = 1},
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_s_standard"
	}
	self.parts.wpn_fps_smg_coal_o_scopemount_standard = {
		type = "extra",
		name_id = "bm_wp_coal_o_scopemount_standard",
		a_obj = "a_o",
		unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_o_scopemount_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_coal_b_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_b_standard"
	self.parts.wpn_fps_smg_coal_body_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_body_standard"
	self.parts.wpn_fps_smg_coal_dh_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_dh_standard"
	self.parts.wpn_fps_smg_coal_fg_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_fg_standard"
	self.parts.wpn_fps_smg_coal_g_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard"
	self.parts.wpn_fps_smg_coal_m_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_m_standard"
	self.parts.wpn_fps_smg_coal_mr_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_mr_standard"
	self.parts.wpn_fps_smg_coal_ns_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_ns_standard"
	self.parts.wpn_fps_smg_coal_s_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_s_standard"
	self.parts.wpn_fps_smg_coal_o_scopemount_standard.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_o_scopemount_standard"
	self.wpn_fps_smg_coal = {}
	self.wpn_fps_smg_coal.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_smg_coal.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal/wpn_fps_smg_coal"
	self.wpn_fps_smg_coal.animations = {
		fire = "recoil",
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_smg_coal.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_coal.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_spot = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_bmg = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_fc1 = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		},
		wpn_fps_upg_o_uh = {
			"wpn_fps_smg_coal_o_scopemount_standard"
		}			
	}
	self.wpn_fps_smg_coal.default_blueprint = {
		"wpn_fps_smg_coal_b_standard",
		"wpn_fps_smg_coal_body_standard",
		"wpn_fps_smg_coal_m_standard",
		"wpn_fps_smg_coal_fg_standard",
		"wpn_fps_smg_coal_dh_standard",
		"wpn_fps_smg_coal_ns_standard",
		"wpn_fps_smg_coal_s_standard",
		"wpn_fps_smg_coal_g_standard",
		"wpn_fps_smg_coal_mr_standard"
	}
	self.wpn_fps_smg_coal.uses_parts = {
		"wpn_fps_smg_coal_b_standard",
		"wpn_fps_smg_coal_body_standard",
		"wpn_fps_smg_coal_fg_standard",
		"wpn_fps_smg_coal_g_standard",
		"wpn_fps_smg_coal_dh_standard",
		"wpn_fps_smg_coal_ns_standard",
		"wpn_fps_smg_coal_s_standard",
		"wpn_fps_smg_coal_m_standard",
		"wpn_fps_smg_coal_mr_standard",
		"wpn_fps_smg_coal_o_scopemount_standard",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ns_ass_pbs1",
		"wpn_fps_upg_ak_ns_ak105",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",			
		--more stuff--
		"wpn_upg_ak_s_psl",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_i_slower_rof",
		"wpn_fps_upg_i_faster_rof"	
	}
	self.wpn_fps_smg_coal_npc = deep_clone(self.wpn_fps_smg_coal)
	self.wpn_fps_smg_coal_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal/wpn_fps_smg_coal_npc"
end

--Var Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_varmods", "resmod_varmods", function(self)

	--Riktpunkt Magnifier
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.supported = true
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.stats = {
		value = 1,
		gadget_zoom = 9
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.perks = {"gadget"}
	
	--Angled Sight v2
	self.parts.wpn_fps_upg_o_45rds_v2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_45rds_v2.supported = true
	self.parts.wpn_fps_upg_o_45rds_v2.stats = {
		value = 1,
		gadget_zoom = 2
	}
	self.parts.wpn_fps_upg_o_45rds_v2.perks = {"gadget"}
	self.parts.wpn_fps_upg_o_45rds_v2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod)

end)

function WeaponFactoryTweakData:_init_lemming()
	self.parts.wpn_fps_pis_lemming_b_standard = {
		type = "barrel",
		name_id = "bm_wp_lemming_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_lemming_b_nitride = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_lemming_b_nitride",
		a_obj = "a_b",
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_b_nitride",
		supported = true,
		stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		},
		dlc = "pd2_clan",
		texture_bundle_folder = "fi7"
	}
	self.parts.wpn_fps_pis_lemming_body = {
		type = "lower_receiver",
		name_id = "bm_wp_lemming_b_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_lemming_m_standard = {
		type = "magazine",
		name_id = "bm_wp_lemming_b_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 3},
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_lemming_m_ext = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_lemming_m_ext",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 3},
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_m_ext",
		supported = true,
		stats = {
			value = 1, 
			extra_ammo = 10,
			concealment = -1,
			reload = -2
		},
		dlc = "pd2_clan",
		texture_bundle_folder = "fi7"
	}
	self.parts.wpn_fps_pis_lemming_mag_release = {
		type = "extra",
		name_id = "bm_wp_lemming_b_standard",
		a_obj = "a_mag_release",
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_mag_release",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_lemming_sl_standard = {
		type = "slide",
		name_id = "bm_wp_lemming_b_standard",
		a_obj = "a_sl",
		unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_sl_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_lemming_b_standard.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_b_standard"
	self.parts.wpn_fps_pis_lemming_b_nitride.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_b_nitride"
	self.parts.wpn_fps_pis_lemming_body.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_body"
	self.parts.wpn_fps_pis_lemming_m_standard.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_m_standard"
	self.parts.wpn_fps_pis_lemming_m_ext.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_m_ext"
	self.parts.wpn_fps_pis_lemming_mag_release.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_mag_release"
	self.parts.wpn_fps_pis_lemming_sl_standard.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_sl_standard"
	self.wpn_fps_pis_lemming = {}
	self.wpn_fps_pis_lemming.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_lemming.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming"
	self.wpn_fps_pis_lemming.animations = {
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil",
		magazine_empty = "last_recoil"
	}
	self.wpn_fps_pis_lemming.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_upg_o_rms = {
			parent = "slide"
		},
		wpn_fps_upg_o_rikt = {
			parent = "slide"
		},
		wpn_fps_upg_ns_pis_typhoon = {
			a_obj = "a_ns",
			parent = "barrel"
		},			
		wpn_fps_upg_pis_ns_flash = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_slim = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_ass_filter = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_jungle = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_small = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_large_kac = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_medium_gem = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_ipsccomp = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_upg_ns_pis_meatgrinder = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"},
		wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"},
	}
	self.wpn_fps_pis_lemming.default_blueprint = {
		"wpn_fps_pis_lemming_b_standard",
		"wpn_fps_pis_lemming_body",
		"wpn_fps_pis_lemming_m_standard",
		"wpn_fps_pis_lemming_mag_release",
		"wpn_fps_pis_lemming_sl_standard"
	}
	self.wpn_fps_pis_lemming.uses_parts = {
		"wpn_fps_pis_lemming_b_standard",
		"wpn_fps_pis_lemming_b_nitride",
		"wpn_fps_pis_lemming_body",
		"wpn_fps_pis_lemming_m_standard",
		"wpn_fps_pis_lemming_m_ext",
		"wpn_fps_pis_lemming_mag_release",
		"wpn_fps_pis_lemming_sl_standard",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_upg_o_rms",
		"wpn_fps_upg_o_rikt",
		"wpn_fps_upg_ns_pis_typhoon",
		"wpn_fps_pis_g18c_co_comp_2",
		"wpn_fps_pis_g18c_co_1",
	}
	self.wpn_fps_pis_lemming_npc = deep_clone(self.wpn_fps_pis_lemming)
	self.wpn_fps_pis_lemming_npc.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming_npc"
end

function WeaponFactoryTweakData:_init_chinchilla()
	self.parts.wpn_fps_pis_chinchilla_b_standard = {
		type = "barrel",
		name_id = "bm_wp_chinchilla_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_b_satan = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_chinchilla_b_satan",
		a_obj = "a_b",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_b_satan",
		supported = true,
		stats = {value = 1, spread = 1, recoil = -1, concealment = -1},
		stance_mod = {
			wpn_fps_pis_chinchilla = {
				translation = Vector3(0, 0, -0.58)
			}
		},
		texture_bundle_folder = "max"
	}
	self.parts.wpn_fps_pis_chinchilla_body = {
		type = "lower_receiver",
		name_id = "bm_wp_chinchilla_body",
		a_obj = "a_body",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_cylinder = {
		type = "cylinder",
		name_id = "bm_wp_chinchilla_cylinder",
		a_obj = "a_cylinder",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_cylinder",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_dh_hammer = {
		type = "drag_handle",
		name_id = "bm_wp_chinchilla_dh_standard",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_dh_hammer",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_ejector = {
		type = "ejector",
		name_id = "bm_wp_chinchilla_ejector",
		a_obj = "a_ejector",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_ejector",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_ejectorpin = {
		type = "ejectorpin",
		name_id = "bm_wp_chinchilla_ejectorpin",
		a_obj = "a_ejectorpin",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_ejectorpin",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_g_black = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_chinchilla_g_black",
		a_obj = "a_g",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_black",
		supported = true,
		stats = {value = 1, recoil = -1, concealment = 1},
		texture_bundle_folder = "max"
	}
	self.parts.wpn_fps_pis_chinchilla_g_death = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_chinchilla_g_death",
		a_obj = "a_g",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_death",
		supported = true,
		stats = {value = 1, recoil = 1, spread = -1},
		texture_bundle_folder = "max"
	}
	self.parts.wpn_fps_pis_chinchilla_g_standard = {
		type = "grip",
		name_id = "bm_wp_chinchilla_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_lock_arm = {
		type = "lock_arm",
		name_id = "bm_wp_chinchilla_lock_arm",
		a_obj = "a_lock",
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_lock_arm",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_chinchilla_m_bullets = {
		type = "magazine",
		name_id = "bm_wp_chinchilla_m_bullet1",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 6},
		unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_m_bullets",
		reload_objects = {
			reload = "g_speedloader",
			reload_not_empty = "g_speedloader"
		},
		supported = true,
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload",
			reload_left = "reload_left"
		}
	}
	self.parts.wpn_fps_pis_chinchilla_b_standard.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_b_standard"
	self.parts.wpn_fps_pis_chinchilla_b_satan.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_b_satan"
	self.parts.wpn_fps_pis_chinchilla_body.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_body"
	self.parts.wpn_fps_pis_chinchilla_cylinder.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_cylinder"
	self.parts.wpn_fps_pis_chinchilla_dh_hammer.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_dh_hammer"
	self.parts.wpn_fps_pis_chinchilla_ejector.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_ejector"
	self.parts.wpn_fps_pis_chinchilla_ejectorpin.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_ejectorpin"
	self.parts.wpn_fps_pis_chinchilla_g_black.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_black"
	self.parts.wpn_fps_pis_chinchilla_g_death.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_death"
	self.parts.wpn_fps_pis_chinchilla_g_standard.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_standard"
	self.parts.wpn_fps_pis_chinchilla_lock_arm.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_lock_arm"
	self.parts.wpn_fps_pis_chinchilla_m_bullets.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_m_bullets"
	self.wpn_fps_pis_chinchilla = {}
	self.wpn_fps_pis_chinchilla.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_chinchilla.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla/wpn_fps_pis_chinchilla"
	self.wpn_fps_pis_chinchilla.animations = {
		reload = "reload",
		reload_not_empty = "reload",
		fire = "recoil",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_pis_chinchilla.default_blueprint = {
		"wpn_fps_pis_chinchilla_b_standard",
		"wpn_fps_pis_chinchilla_body",
		"wpn_fps_pis_chinchilla_cylinder",
		"wpn_fps_pis_chinchilla_dh_hammer",
		"wpn_fps_pis_chinchilla_ejector",
		"wpn_fps_pis_chinchilla_ejectorpin",
		"wpn_fps_pis_chinchilla_g_standard",
		"wpn_fps_pis_chinchilla_lock_arm",
		"wpn_fps_pis_chinchilla_m_bullets"
	}
	self.wpn_fps_pis_chinchilla.uses_parts = {
		"wpn_fps_pis_chinchilla_b_standard",
		"wpn_fps_pis_chinchilla_b_satan",
		"wpn_fps_pis_chinchilla_body",
		"wpn_fps_pis_chinchilla_cylinder",
		"wpn_fps_pis_chinchilla_dh_hammer",
		"wpn_fps_pis_chinchilla_ejector",
		"wpn_fps_pis_chinchilla_ejectorpin",
		"wpn_fps_pis_chinchilla_g_black",
		"wpn_fps_pis_chinchilla_g_death",
		"wpn_fps_pis_chinchilla_g_standard",
		"wpn_fps_pis_chinchilla_lock_arm",
		"wpn_fps_pis_chinchilla_m_bullets"
	}
	self.wpn_fps_pis_chinchilla_npc = deep_clone(self.wpn_fps_pis_chinchilla)
	self.wpn_fps_pis_chinchilla_npc.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla/wpn_fps_pis_chinchilla_npc"
end

function WeaponFactoryTweakData:_init_x_chinchilla()
	self.wpn_fps_pis_x_chinchilla = {}
	self.wpn_fps_pis_x_chinchilla.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_x_chinchilla.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_x_chinchilla/wpn_fps_pis_x_chinchilla"
	self.wpn_fps_pis_x_chinchilla.animations = {
		fire = "recoil",
		reload = "reload_right",
		reload_left = "reload_left",
		reload_not_empty = "reload_right",
		reload_not_empty_left = "reload_left",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_pis_x_chinchilla.default_blueprint = {
		"wpn_fps_pis_chinchilla_b_standard",
		"wpn_fps_pis_chinchilla_body",
		"wpn_fps_pis_chinchilla_cylinder",
		"wpn_fps_pis_chinchilla_dh_hammer",
		"wpn_fps_pis_chinchilla_ejector",
		"wpn_fps_pis_chinchilla_ejectorpin",
		"wpn_fps_pis_chinchilla_g_standard",
		"wpn_fps_pis_chinchilla_lock_arm",
		"wpn_fps_pis_chinchilla_m_bullets"
	}
	self.wpn_fps_pis_x_chinchilla.uses_parts = {
		"wpn_fps_pis_chinchilla_b_standard",
		"wpn_fps_pis_chinchilla_b_satan",
		"wpn_fps_pis_chinchilla_body",
		"wpn_fps_pis_chinchilla_cylinder",
		"wpn_fps_pis_chinchilla_dh_hammer",
		"wpn_fps_pis_chinchilla_ejector",
		"wpn_fps_pis_chinchilla_ejectorpin",
		"wpn_fps_pis_chinchilla_g_black",
		"wpn_fps_pis_chinchilla_g_death",
		"wpn_fps_pis_chinchilla_g_standard",
		"wpn_fps_pis_chinchilla_lock_arm",
		"wpn_fps_pis_chinchilla_m_bullets"
	}
	self.wpn_fps_pis_x_chinchilla_npc = deep_clone(self.wpn_fps_pis_chinchilla)
	self.wpn_fps_pis_x_chinchilla_npc.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_x_chinchilla/wpn_fps_pis_x_chinchilla_npc"
end

function WeaponFactoryTweakData:_init_breech()
	self.parts.wpn_fps_pis_breech_b_reinforced = {
		texture_bundle_folder = "old",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_breech_b_reinforced",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_b_reinforced",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_breech_b_short = {
		texture_bundle_folder = "old",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_breech_b_short",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_b_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = -1,
			value = 1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_breech_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_breech_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_breech_body = {
		a_obj = "a_body",
		type = "body",
		name_id = "bm_wp_breech_body",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_breech_dh = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_breech_dh",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_dh",
		supported = true,
		stats = {value = 1},
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		}
	}
	self.parts.wpn_fps_pis_breech_g_custom = {
		texture_bundle_folder = "old",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_breech_g_custom",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_g_custom",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_breech_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_breech_g_std",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_breech_mag = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_breech_m",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_mag",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_breech_b_reinforced.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_b_reinforced"
	self.parts.wpn_fps_pis_breech_b_short.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_b_short"
	self.parts.wpn_fps_pis_breech_b_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_b_standard"
	self.parts.wpn_fps_pis_breech_body.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_body"
	self.parts.wpn_fps_pis_breech_dh.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_dh"
	self.parts.wpn_fps_pis_breech_g_custom.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_g_custom"
	self.parts.wpn_fps_pis_breech_g_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_g_standard"
	self.parts.wpn_fps_pis_breech_mag.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_mag"
	self.wpn_fps_pis_breech = {
		optional_types = {
			"barrel_ext",
			"gadget",
			"sight"
		},
		unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = false},
			wpn_fps_upg_o_rms = {
				parent = false
			},
			wpn_fps_upg_o_rikt = {
				parent = false
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			}
		},
		default_blueprint = {
			"wpn_fps_pis_breech_b_standard",
			"wpn_fps_pis_breech_body",
			"wpn_fps_pis_breech_dh",
			"wpn_fps_pis_breech_g_standard",
			"wpn_fps_pis_breech_mag"
		},
		uses_parts = {
			"wpn_fps_pis_breech_b_reinforced",
			"wpn_fps_pis_breech_b_short",
			"wpn_fps_pis_breech_b_standard",
			"wpn_fps_pis_breech_body",
			"wpn_fps_pis_breech_dh",
			"wpn_fps_pis_breech_g_custom",
			"wpn_fps_pis_breech_g_standard",
			"wpn_fps_pis_breech_mag",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt"
		}
	}
	self.wpn_fps_pis_breech_npc = deep_clone(self.wpn_fps_pis_breech)
	self.wpn_fps_pis_breech_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech_npc"
end

function WeaponFactoryTweakData:_init_ching()
	self.parts.wpn_fps_ass_ching_b_short = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_ching_b_short",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_b_short",
		texture_bundle_folder = "old",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			concealment = 1
		},
		override = {wpn_fps_ass_ching_extra_swiwel = {
			third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra_swiwel_empty",
			unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra_swiwel_empty"
		}}
	}
	self.parts.wpn_fps_ass_ching_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_body_standard = {
		a_obj = "a_body",
		type = "lower_receiver",
		name_id = "bm_wp_ching_body_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_bolt_standard = {
		a_obj = "a_bolt",
		type = "bolt",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_dh_standard = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_extra_swiwel_empty = {
		a_obj = "a_extra",
		type = "swiwel_2",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra_swiwel_empty",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_extra_swiwel = {
		a_obj = "a_extra",
		type = "swiwel_2",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra_swiwel",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_extra1_swiwel = {
		a_obj = "a_extra1",
		type = "swiwel_1",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra1_swiwel",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_fg_railed = {
		texture_bundle_folder = "old",
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ching_fg_railed",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_fg_railed",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {value = 1, recoil = 1, spread = -1},
		forbids = {"wpn_fps_ak_extra_ris"}
	}
	self.parts.wpn_fps_ass_ching_fg_standard = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_fg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_m_standard",
		bullet_objects = {
			amount = 8,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1},
		magazine_empty_objects = {"g_clip"}
	}
	self.parts.wpn_fps_ass_ching_s_pouch = {
		texture_bundle_folder = "old",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ching_s_pouch",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_s_pouch",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 5
		}
	}
	self.parts.wpn_fps_ass_ching_s_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_strip_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ching_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ching_b_short.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_b_short"
	self.parts.wpn_fps_ass_ching_b_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_b_standard"
	self.parts.wpn_fps_ass_ching_body_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_body_standard"
	self.parts.wpn_fps_ass_ching_bolt_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_bolt_standard"
	self.parts.wpn_fps_ass_ching_dh_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_dh_standard"
	self.parts.wpn_fps_ass_ching_extra_swiwel_empty.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_extra_swiwel_empty"
	self.parts.wpn_fps_ass_ching_extra_swiwel.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_extra_swiwel"
	self.parts.wpn_fps_ass_ching_extra1_swiwel.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_extra1_swiwel"
	self.parts.wpn_fps_ass_ching_fg_railed.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_fg_railed"
	self.parts.wpn_fps_ass_ching_fg_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_fg_standard"
	self.parts.wpn_fps_ass_ching_m_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_m_standard"
	self.parts.wpn_fps_ass_ching_s_pouch.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_s_pouch"
	self.parts.wpn_fps_ass_ching_s_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_s_standard"
	self.parts.wpn_fps_ass_ching_strip_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_strip_standad"
	self.wpn_fps_ass_ching = {
		unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching",
		optional_types = {
			"barrel_ext",
			"gadget",
			"sight"
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_docter = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_eotech = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_cmore = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_acog = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_cs = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_reflex = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_spot = {"wpn_fps_ak_extra_ris"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_ak_extra_ris"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_ak_extra_ris"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_ak_extra_ris"
			}				
		},
		default_blueprint = {
			"wpn_fps_ass_ching_b_standard",
			"wpn_fps_ass_ching_body_standard",
			"wpn_fps_ass_ching_bolt_standard",
			"wpn_fps_ass_ching_dh_standard",
			"wpn_fps_ass_ching_extra_swiwel",
			"wpn_fps_ass_ching_extra1_swiwel",
			"wpn_fps_ass_ching_fg_standard",
			"wpn_fps_ass_ching_m_standard",
			"wpn_fps_ass_ching_s_standard"
		},
		uses_parts = {
			"wpn_fps_ass_ching_b_short",
			"wpn_fps_ass_ching_b_standard",
			"wpn_fps_ass_ching_body_standard",
			"wpn_fps_ass_ching_bolt_standard",
			"wpn_fps_ass_ching_dh_standard",
			"wpn_fps_ass_ching_extra_swiwel",
			"wpn_fps_ass_ching_extra1_swiwel",
			"wpn_fps_ass_ching_fg_railed",
			"wpn_fps_ass_ching_fg_standard",
			"wpn_fps_ass_ching_m_standard",
			"wpn_fps_ass_ching_s_pouch",
			"wpn_fps_ass_ching_s_standard",
			"wpn_fps_ass_ching_strip_standard",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.wpn_fps_ass_ching_npc = deep_clone(self.wpn_fps_ass_ching)
	self.wpn_fps_ass_ching_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching_npc"
end

function WeaponFactoryTweakData:_init_erma()
	self.parts.wpn_fps_smg_erma_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_erma_b_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_body_standard = {
		a_obj = "a_body",
		type = "lower_receiver",
		name_id = "bm_wp_erma_body_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_bolt_standard = {
		a_obj = "a_bolt",
		type = "drag_handle",
		name_id = "bm_wp_erma_bolt_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_bolt_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_extra_rail = {
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_erma_extra_rail",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_extra_rail",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_mag_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_erma_mag_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_mag_standard",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_ns_standard = {
		parent = "barrel",
		a_obj = "a_ns",
		type = "barrel_ext",
		name_id = "bm_wp_erma_ns_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_o_ironsight_standard = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_erma_o_ironsight_standard",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_o_ironsight_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_s_folded = {
		texture_bundle_folder = "old",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_erma_s_folded",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_s_folded",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 0,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_smg_erma_s_unfolded = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_erma_s_unfolded",
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_s_unfolded",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_erma_b_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_b_standard"
	self.parts.wpn_fps_smg_erma_body_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_body_standard"
	self.parts.wpn_fps_smg_erma_bolt_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_bolt_standard"
	self.parts.wpn_fps_smg_erma_extra_rail.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_extra_rail"
	self.parts.wpn_fps_smg_erma_mag_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_mag_standard"
	self.parts.wpn_fps_smg_erma_ns_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_ns_standard"
	self.parts.wpn_fps_smg_erma_o_ironsight_standard.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_o_ironsight_standard"
	self.parts.wpn_fps_smg_erma_s_folded.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_s_folded"
	self.parts.wpn_fps_smg_erma_s_unfolded.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_s_unfolded"
	self.wpn_fps_smg_erma = {
		unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_docter = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_eotech = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_cmore = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_acog = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_cs = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_reflex = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_spot = {"wpn_fps_smg_erma_extra_rail"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_smg_erma_extra_rail"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_smg_erma_extra_rail"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_smg_erma_extra_rail"
			}				
		},
		default_blueprint = {
			"wpn_fps_smg_erma_b_standard",
			"wpn_fps_smg_erma_body_standard",
			"wpn_fps_smg_erma_bolt_standard",
			"wpn_fps_smg_erma_mag_standard",
			"wpn_fps_smg_erma_ns_standard",
			"wpn_fps_smg_erma_o_ironsight_standard",
			"wpn_fps_smg_erma_s_unfolded"
		},
		uses_parts = {
			"wpn_fps_smg_erma_b_standard",
			"wpn_fps_smg_erma_body_standard",
			"wpn_fps_smg_erma_bolt_standard",
			"wpn_fps_smg_erma_extra_rail",
			"wpn_fps_smg_erma_mag_standard",
			"wpn_fps_smg_erma_ns_standard",
			"wpn_fps_smg_erma_o_ironsight_standard",
			"wpn_fps_smg_erma_s_folded",
			"wpn_fps_smg_erma_s_unfolded",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1",
			--Custom stuff--
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"				
		}
	}
	self.wpn_fps_smg_erma_npc = deep_clone(self.wpn_fps_smg_erma)
	self.wpn_fps_smg_erma_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma_npc"
end

function WeaponFactoryTweakData:_init_ecp()
	self.parts.wpn_fps_bow_ecp_s_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ecp_s_standard",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_s_bare = {
		texture_bundle_folder = "ecp",
		dlc = "ecp",
		type = "stock",
		name_id = "bm_wp_ecp_s_bare",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_s_bare",
		a_obj = "a_s",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_bow_ecp_b_dummy = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_ecp_b_dummy",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_b_dummy",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_body_lower = {
		a_obj = "a_body",
		type = "lower_receiver",
		name_id = "bm_wp_ecp_body_lower",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_body_lower",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_body_upper = {
		a_obj = "a_body",
		type = "upper_receiver",
		name_id = "bm_wp_ecp_body_upper",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_body_upper",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_dh_standard = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_ecp_dh_standard",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_ejector_left = {
		a_obj = "a_ejector_left",
		type = "ejector_l",
		name_id = "bm_wp_ecp_ejector_left",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_ejector_left",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_ejector_right = {
		a_obj = "a_ejector_right",
		type = "ejector_r",
		name_id = "bm_wp_ecp_ejector_right",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_ejector_right",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_m_arrows = {
		a_obj = "a_m",
		type = "ammo",
		name_id = "bm_wp_ecp_m_arrows",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_standard",
		bullet_objects = {
			amount = 6,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_m_arrows_standard = {
		a_obj = "a_m",
		type = "ammo",
		name_id = "bm_wp_ecp_m_arrows",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_standard",
		bullet_objects = {
			amount = 6,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive = {
		is_a_unlockable = true,
		texture_bundle_folder = "ecp",
		a_obj = "a_m",
		type = "ammo",
		third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_explosive",
		sub_type = "ammo_explosive",
		dlc = "ecp",
		name_id = "bm_wp_ecp_m_arrows_explosive",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_explosive",
		pcs = {},
		bullet_objects = {
			amount = 6,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {damage = 45, total_ammo_mod = -50, spread = -3, recoil = -6},
		custom_stats = {
			launcher_grenade = "ecp_arrow_exp"
		}
	}
	self.parts.wpn_fps_bow_ecp_m_arrows_poison = {
		is_a_unlockable = true,
		texture_bundle_folder = "ecp",
		a_obj = "a_m",
		type = "ammo",
		third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_poison",
		sub_type = "ammo_poison",
		dlc = "ecp",
		name_id = "bm_wp_ecp_m_arrows_poison",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_arrows_poison",
		pcs = {},
		bullet_objects = {
			amount = 6,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {damage = -10},
		custom_stats = {
			launcher_grenade = "ecp_arrow_poison",
			dot_data = {
				type = "poison",
				custom_data = {}
			}
		}
	}
	self.parts.wpn_fps_bow_ecp_m_casing = {
		a_obj = "a_clip",
		type = "magazine",
		name_id = "bm_wp_ecp_m_casing",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_m_casing",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_meter_left = {
		a_obj = "a_meter_l",
		type = "meter_l",
		name_id = "bm_wp_ecp_meter_left",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_meter_left",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_meter_right = {
		a_obj = "a_meter_r",
		type = "meter_r",
		name_id = "bm_wp_ecp_meter_right",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_meter_right",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_ecp_o_iron = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_ecp_meter_right",
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_o_iron",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
	}
	self.parts.wpn_fps_bow_ecp_s_standard.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_s_standard"
	self.parts.wpn_fps_bow_ecp_s_bare.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_s_bare"
	self.parts.wpn_fps_bow_ecp_body_lower.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_body_lower"
	self.parts.wpn_fps_bow_ecp_body_upper.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_body_upper"
	self.parts.wpn_fps_bow_ecp_dh_standard.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_dh_standard"
	self.parts.wpn_fps_bow_ecp_ejector_left.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_ejector_left"
	self.parts.wpn_fps_bow_ecp_ejector_right.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_ejector_right"
	self.parts.wpn_fps_bow_ecp_m_casing.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_m_casing"
	self.parts.wpn_fps_bow_ecp_meter_left.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_meter_left"
	self.parts.wpn_fps_bow_ecp_meter_right.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_meter_right"
	self.parts.wpn_fps_bow_ecp_o_iron.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_o_iron"
	self.parts.wpn_fps_bow_ecp_m_arrows_standard.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_m_arrows_standard"
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_m_arrows_explosive"
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_third_bow_ecp_m_arrows_poison"
	self.wpn_fps_bow_ecp = {
		optional_types = {
			"barrel_ext",
			"gadget",
			"sight"
		},
		unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp/wpn_fps_bow_ecp",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_bow_ecp_s_standard",
			"wpn_fps_bow_ecp_b_dummy",
			"wpn_fps_bow_ecp_body_lower",
			"wpn_fps_bow_ecp_body_upper",
			"wpn_fps_bow_ecp_dh_standard",
			"wpn_fps_bow_ecp_ejector_left",
			"wpn_fps_bow_ecp_ejector_right",
			"wpn_fps_bow_ecp_m_arrows_standard",
			"wpn_fps_bow_ecp_m_casing",
			"wpn_fps_bow_ecp_meter_left",
			"wpn_fps_bow_ecp_meter_right",
			"wpn_fps_bow_ecp_o_iron"
		},
		uses_parts = {
			"wpn_fps_bow_ecp_s_standard",
			"wpn_fps_bow_ecp_s_bare",
			"wpn_fps_bow_ecp_b_dummy",
			"wpn_fps_bow_ecp_body_lower",
			"wpn_fps_bow_ecp_body_upper",
			"wpn_fps_bow_ecp_dh_standard",
			"wpn_fps_bow_ecp_ejector_left",
			"wpn_fps_bow_ecp_ejector_right",
			"wpn_fps_bow_ecp_m_arrows_standard",
			"wpn_fps_bow_ecp_m_arrows_explosive",
			"wpn_fps_bow_ecp_m_arrows_poison",
			"wpn_fps_bow_ecp_m_casing",
			"wpn_fps_bow_ecp_meter_left",
			"wpn_fps_bow_ecp_meter_right",
			"wpn_fps_bow_ecp_o_iron",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1"				
		}
	}
	self.wpn_fps_bow_ecp_npc = deep_clone(self.wpn_fps_bow_ecp)
	self.wpn_fps_bow_ecp_npc.unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp/wpn_fps_bow_ecp_npc"
end

function WeaponFactoryTweakData:_init_shrew()
	self.parts.wpn_fps_pis_shrew_b_barrel = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_b_barrel",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_body_frame = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_body_frame",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_fl_adapter = {
		a_obj = "a_fl",
		type = "adapter",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_fl_adapter",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_g_bling = {
		texture_bundle_folder = "myh",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_shrew_g_bling",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_g_bling",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_shrew_g_ergo = {
		texture_bundle_folder = "myh",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_shrew_g_ergo",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_g_ergo",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_shrew_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_h_hammer = {
		a_obj = "a_h",
		type = "hammer",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_h_hammer",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_m_extended = {
		texture_bundle_folder = "myh",
		type = "magazine",
		name_id = "bm_wp_shrew_m_extended",
		a_obj = "a_m",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_m_extended",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 2,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			extra_ammo = 2,
			concealment = -1,
			value = 1
		}
	}
	self.parts.wpn_fps_pis_shrew_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_m_standard",
		bullet_objects = {
			amount = 2,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_sl_milled = {
		texture_bundle_folder = "myh",
		a_obj = "a_sl",
		type = "slide",
		name_id = "bm_wp_shrew_sl_milled",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_sl_milled",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_shrew_sl_standard = {
		a_obj = "a_sl",
		type = "slide",
		name_id = "bm_wp_shrew_b_standard",
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_sl_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_shrew_b_barrel.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_b_barrel"
	self.parts.wpn_fps_pis_shrew_body_frame.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_body_frame"
	self.parts.wpn_fps_pis_shrew_fl_adapter.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_fl_adapter"
	self.parts.wpn_fps_pis_shrew_g_bling.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_g_bling"
	self.parts.wpn_fps_pis_shrew_g_ergo.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_g_ergo"
	self.parts.wpn_fps_pis_shrew_g_standard.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_g_standard"
	self.parts.wpn_fps_pis_shrew_h_hammer.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_h_hammer"
	self.parts.wpn_fps_pis_shrew_m_extended.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_m_extended"
	self.parts.wpn_fps_pis_shrew_m_standard.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_m_standard"
	self.parts.wpn_fps_pis_shrew_sl_milled.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_sl_milled"
	self.parts.wpn_fps_pis_shrew_sl_standard.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_sl_standard"
	self.wpn_fps_pis_shrew = {
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew/wpn_fps_pis_shrew",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty = "reload_not_empty",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_shrew_fl_adapter"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_ns_ass_filter = {parent = "barrel"},
			wpn_fps_upg_ns_pis_jungle = {parent = "barrel"},
			wpn_fps_upg_ns_pis_ipsccomp = {parent = "barrel"},
			wpn_fps_upg_ns_pis_meatgrinder = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium_slim = {parent = "barrel"},
			wpn_fps_upg_pis_ns_flash = {parent = "barrel"},
			wpn_fps_upg_ns_pis_large = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium = {parent = "barrel"},
			wpn_fps_upg_ns_pis_small = {parent = "barrel"},
			wpn_fps_upg_ns_pis_large_kac = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium_gem = {parent = "barrel"},
			wpn_fps_pis_1911_co_1 = {parent = "barrel"},
			wpn_fps_pis_1911_co_2 = {parent = "barrel"},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				parent = "barrel"
			}				
		},
		default_blueprint = {
			"wpn_fps_pis_shrew_b_barrel",
			"wpn_fps_pis_shrew_body_frame",
			"wpn_fps_pis_shrew_g_standard",
			"wpn_fps_pis_shrew_h_hammer",
			"wpn_fps_pis_shrew_m_standard",
			"wpn_fps_pis_shrew_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_shrew_b_barrel",
			"wpn_fps_pis_shrew_body_frame",
			"wpn_fps_pis_shrew_g_standard",
			"wpn_fps_pis_shrew_h_hammer",
			"wpn_fps_pis_shrew_m_standard",
			"wpn_fps_pis_shrew_sl_standard",
			"wpn_fps_pis_shrew_g_bling",
			"wpn_fps_pis_shrew_g_ergo",
			"wpn_fps_pis_shrew_m_extended",
			"wpn_fps_pis_shrew_sl_milled",
			"wpn_fps_pis_shrew_fl_adapter",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",
			--Custom--
			"wpn_fps_pis_1911_co_1",
			"wpn_fps_pis_1911_co_2",
			"wpn_fps_upg_ammo_46custom"
		}
	}
	self.wpn_fps_pis_shrew_npc = deep_clone(self.wpn_fps_pis_shrew)
	self.wpn_fps_pis_shrew_npc.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew/wpn_fps_pis_shrew_npc"
end

function WeaponFactoryTweakData:_init_x_shrew()
	self.wpn_fps_pis_x_shrew = {
		unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_x_shrew/wpn_fps_pis_x_shrew",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty = "reload_not_empty_right",
			reload_not_empty_left = "reload_not_empty_left",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_shrew_fl_adapter"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_shrew_fl_adapter"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_ns_ass_filter = {parent = "barrel"},
			wpn_fps_upg_ns_pis_jungle = {parent = "barrel"},
			wpn_fps_upg_ns_pis_ipsccomp = {parent = "barrel"},
			wpn_fps_upg_ns_pis_meatgrinder = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium_slim = {parent = "barrel"},
			wpn_fps_upg_pis_ns_flash = {parent = "barrel"},
			wpn_fps_upg_ns_pis_large = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium = {parent = "barrel"},
			wpn_fps_upg_ns_pis_small = {parent = "barrel"},
			wpn_fps_upg_ns_pis_large_kac = {parent = "barrel"},
			wpn_fps_upg_ns_pis_medium_gem = {parent = "barrel"},
			wpn_fps_pis_1911_co_1 = {parent = "barrel"},
			wpn_fps_pis_1911_co_2 = {parent = "barrel"},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				parent = "barrel"
			},				
			wpn_fps_pis_shrew_m_extended = {
				supported = true,
				stats = {
					extra_ammo = 4,
					concealment = -1,
					value = 1
				}
			},
			wpn_fps_upg_ammo_46custom = {
				supported = true,
				stats = {
					value = 0,
				}
			}
		},
		default_blueprint = {
			"wpn_fps_pis_shrew_b_barrel",
			"wpn_fps_pis_shrew_body_frame",
			"wpn_fps_pis_shrew_g_standard",
			"wpn_fps_pis_shrew_h_hammer",
			"wpn_fps_pis_shrew_m_standard",
			"wpn_fps_pis_shrew_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_shrew_b_barrel",
			"wpn_fps_pis_shrew_body_frame",
			"wpn_fps_pis_shrew_g_standard",
			"wpn_fps_pis_shrew_h_hammer",
			"wpn_fps_pis_shrew_m_standard",
			"wpn_fps_pis_shrew_sl_standard",
			"wpn_fps_pis_shrew_g_bling",
			"wpn_fps_pis_shrew_g_ergo",
			"wpn_fps_pis_shrew_m_extended",
			"wpn_fps_pis_shrew_sl_milled",
			"wpn_fps_pis_shrew_fl_adapter",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_typhoon",				
			--Custom--
			"wpn_fps_pis_1911_co_1",
			"wpn_fps_pis_1911_co_2",
			"wpn_fps_upg_ammo_46custom"
		}
	}
	self.wpn_fps_pis_x_shrew_npc = deep_clone(self.wpn_fps_pis_x_shrew)
	self.wpn_fps_pis_x_shrew_npc.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_x_shrew/wpn_fps_pis_x_shrew_npc"
end

--Grimm 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_basset", "resmod_basset", function(self)
	
	--Little Brother Foregrip
	self.parts.wpn_fps_sho_basset_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_basset_fg_short.supported = true
	self.parts.wpn_fps_sho_basset_fg_short.stats = {
		value = 1,
		recoil = -1,
		concealment = 1
	}
	
	--Big Brother Magazine
	self.parts.wpn_fps_sho_basset_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_basset_m_extended.supported = true
	self.parts.wpn_fps_sho_basset_m_extended.stats = {value = 1, extra_ammo = 2, reload = -2, concealment = -1}

	self.wpn_fps_sho_basset.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -25,
				damage = 15,	
				recoil = -2,
				spread = 8,
				spread_multi = {1, 1},	
				suppression = -1,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",														
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},					
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 30
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		},
		wpn_fps_upg_a_piercing = a_piercing_auto_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_auto_override
	}
	
	table.insert(self.wpn_fps_sho_basset.uses_parts, "wpn_upg_saiga_m_20rnd")
	table.insert(self.wpn_fps_sho_basset_npc.uses_parts, "wpn_upg_saiga_m_20rnd")	

	self.wpn_fps_sho_basset_npc.uses_parts = deep_clone(self.wpn_fps_sho_basset.uses_parts)

end)

function WeaponFactoryTweakData:_init_icc()
	self.parts.wpn_fps_smg_p90_body_boxy = {
		texture_bundle_folder = "icc",
		a_obj = "a_body",
		has_description = true,
		type = "lower_reciever",
		name_id = "bm_wp_90_body_boxy",
		desc_id = "bm_wp_90_body_boxy_desc",			
		unit = "units/pd2_dlc_icc/weapons/wpn_fps_smg_p90_body_boxy/wpn_fps_smg_p90_body_boxy",
		pcs = {},
		supported = true,
		stats = {value = 0},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		},
		third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_smg_p90_body_boxy/wpn_third_smg_p90_body_boxy"
	}
	self.parts.wpn_fps_smg_mac10_body_modern = {
		texture_bundle_folder = "icc",
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_mac10_body_modern",
		unit = "units/pd2_dlc_icc/weapons/wpn_fps_smg_mac10_body_modern/wpn_fps_smg_mac10_body_modern",
		pcs = {},
		supported = true,
		stats = {value = 0},
		animations = {
			fire = "recoil",
			reload = "reload",
			fire_steelsight = "recoil"
		},
		third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_smg_mac10_body_modern/wpn_third_smg_mac10_body_modern"
	}
	self.parts.wpn_fps_pis_deagle_b_modern = {
		a_obj = "a_b",
		texture_bundle_folder = "icc",
		type = "slide",
		name_id = "bm_wp_deagle_b_modern",
		unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_deagle_b_modern/wpn_fps_pis_deagle_b_modern",
		pcs = {},
		supported = true,
		stats = {
			value = 0
		},
		--[[
		forbids = {
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_pis_g18c_co_comp_2",
			"wpn_fps_pis_g18c_co_1"				
		},				
		]]--
		third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_deagle_b_modern/wpn_third_pis_deagle_b_modern"
	}
	self.parts.wpn_fps_pis_beretta_body_modern = {
		texture_bundle_folder = "icc",
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_beretta_body_modern",
		unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_beretta_body_modern/wpn_fps_pis_beretta_body_modern",
		pcs = {},
		supported = true,
		stats = {value = 0},
		forbids = {"wpn_fps_pis_beretta_body_rail"},
		animations = {
			fire = "recoil",
			reload = "reload",
			fire_steelsight = "recoil"
		},
		third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_beretta_body_modern/wpn_third_pis_beretta_body_modern"
	}
	self.parts.wpn_fps_pis_judge_body_modern = {
		texture_bundle_folder = "icc",
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_judge_body_modern",
		unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_judge_body_modern/wpn_fps_pis_judge_body_modern",
		pcs = {},
		supported = true,
		stats = {value = 0},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_pis_judge_fl_adapter"
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload",
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		override = {wpn_fps_pis_judge_g_standard = {
			third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_judge_body_modern/wpn_third_pis_judge_g_modern",
			unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_judge_body_modern/wpn_fps_pis_judge_g_modern"
		}},
		third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_judge_body_modern/wpn_third_pis_judge_body_modern"
	}
end	

function WeaponFactoryTweakData:_init_corgi()
	self.parts.wpn_fps_ass_corgi_body_lower_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_body_lower_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_body_lower_strap = {
		texture_bundle_folder = "rvd",
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_corgi_body_strap",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_body_lower_strap",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_ass_corgi_body_upper = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_body_upper",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_b_long = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_b_long",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_b_short = {
		texture_bundle_folder = "rvd",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_corgi_b_short",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_b_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			spread = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_ass_corgi_dh_standard = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_fg_rail = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_fg_rail",
		supported = true,
		stats = {value = 1},
		forbids = {"wpn_fps_addon_ris"}
	}
	self.parts.wpn_fps_ass_corgi_ns_standard = {
		parent = "barrel",
		a_obj = "a_ns",
		type = "barrel_ext",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_ejector_standard = {
		a_obj = "a_ejector",
		type = "ejector",
		name_id = "bm_wp_corgi_body",
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_ejector_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_corgi_b_long.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_b_long"
	self.parts.wpn_fps_ass_corgi_b_short.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_b_short"
	self.parts.wpn_fps_ass_corgi_body_lower_standard.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_body_lower_standard"
	self.parts.wpn_fps_ass_corgi_body_lower_strap.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_body_lower_strap"
	self.parts.wpn_fps_ass_corgi_body_upper.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_body_upper"
	self.parts.wpn_fps_ass_corgi_dh_standard.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_dh_standard"
	self.parts.wpn_fps_ass_corgi_ejector_standard.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_ejector_standard"
	self.parts.wpn_fps_ass_corgi_fg_rail.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_fg_rail"
	self.parts.wpn_fps_ass_corgi_ns_standard.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_ns_standard"
	self.wpn_fps_ass_corgi = {
		unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi/wpn_fps_ass_corgi",
		optional_types = {
			"gadget",
			"sight",
			"barrel_ext"
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		},
		adds = {},
		forbids = {"wpn_fps_addon_ris"},
		default_blueprint = {
			"wpn_fps_ass_corgi_body_lower_standard",
			"wpn_fps_ass_corgi_body_upper",
			"wpn_fps_ass_corgi_b_long",
			"wpn_fps_ass_corgi_dh_standard",
			"wpn_fps_ass_corgi_fg_rail",
			"wpn_fps_ass_corgi_ns_standard",
			"wpn_fps_ass_corgi_ejector_standard",
			"wpn_fps_smg_hajk_vg_moe",
			"wpn_fps_m4_uupg_m_std_vanilla"
		},
		uses_parts = {
			"wpn_fps_ass_corgi_body_lower_standard",
			"wpn_fps_ass_corgi_body_lower_strap",
			"wpn_fps_ass_corgi_body_upper",
			"wpn_fps_ass_corgi_b_long",
			"wpn_fps_ass_corgi_b_short",
			"wpn_fps_ass_corgi_dh_standard",
			"wpn_fps_ass_corgi_fg_rail",
			"wpn_fps_ass_corgi_ns_standard",
			"wpn_fps_ass_corgi_ejector_standard",
			"wpn_fps_smg_hajk_vg_moe",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_upg_m4_m_drum",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_m4_upg_m_quick",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1",
			"wpn_fps_upg_o_45steel",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_ass_corgi_npc = deep_clone(self.wpn_fps_ass_corgi)
	self.wpn_fps_ass_corgi_npc.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi/wpn_fps_ass_corgi_npc"
end

function WeaponFactoryTweakData:_init_slap()
	self.parts.wpn_fps_gre_slap_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_body_lower = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_body_lower",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_o_iron = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_o_iron",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_o_adapter = {
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_o_adapter",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_s_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_vg_standard = {
		a_obj = "a_vg",
		type = "vertical_grip",
		name_id = "bm_wp_gre_slap_barrel",
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_fps_gre_slap_vg_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_slap_b_standard.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_b_standard"
	self.parts.wpn_fps_gre_slap_body_lower.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_body_lower"
	self.parts.wpn_fps_gre_slap_o_iron.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_o_iron"
	self.parts.wpn_fps_gre_slap_o_adapter.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_o_adapter"
	self.parts.wpn_fps_gre_slap_s_standard.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_s_standard"
	self.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap_pts/wpn_third_gre_slap_vg_standard"
	self.wpn_fps_gre_slap = {
		unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap/wpn_fps_gre_slap",
		animations = {
			unequip = "unequip",
			reload = "reload",
			equip = "equip"
		},
		override = {wpn_fps_gre_m79_grenade = {third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}},
		adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_docter = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_eotech = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_cmore = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_acog = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_cs = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_reflex = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_spot = {"wpn_fps_gre_slap_o_adapter"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_gre_slap_o_adapter"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_gre_slap_o_adapter"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_gre_slap_o_adapter"
			}				
		},
		default_blueprint = {
			"wpn_fps_gre_slap_b_standard",
			"wpn_fps_gre_slap_body_lower",
			"wpn_fps_gre_slap_o_iron",
			"wpn_fps_gre_slap_s_standard",
			"wpn_fps_gre_slap_vg_standard",
			"wpn_fps_gre_m79_grenade"
		},
		uses_parts = {
			"wpn_fps_gre_slap_b_standard",
			"wpn_fps_gre_slap_body_lower",
			"wpn_fps_gre_slap_o_iron",
			"wpn_fps_gre_slap_s_standard",
			"wpn_fps_gre_slap_vg_standard",
			"wpn_fps_gre_slap_o_adapter",
			"wpn_fps_gre_m79_grenade",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1"
		}
	}
	self.wpn_fps_gre_slap_npc = deep_clone(self.wpn_fps_gre_slap)
	self.wpn_fps_gre_slap_npc.unit = "units/pd2_dlc_fgl/weapons/wpn_fps_gre_slap/wpn_fps_gre_slap_npc"
end	

function WeaponFactoryTweakData:_init_x_coal()
	self.wpn_fps_smg_x_coal = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_coal/wpn_fps_smg_x_coal",
		optional_types = {
			"barrel_ext",
			"gadget",
			"vertical_grip"
		},
		animations = {
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		default_blueprint = {
			"wpn_fps_smg_coal_b_standard",
			"wpn_fps_smg_coal_body_standard",
			"wpn_fps_smg_coal_m_standard",
			"wpn_fps_smg_coal_fg_standard",
			"wpn_fps_smg_coal_dh_standard",
			"wpn_fps_smg_coal_ns_standard",
			"wpn_fps_smg_coal_s_standard",
			"wpn_fps_smg_coal_g_standard",
			"wpn_fps_smg_coal_mr_standard"
		},
		uses_parts = {
			"wpn_fps_smg_coal_b_standard",
			"wpn_fps_smg_coal_body_standard",
			"wpn_fps_smg_coal_fg_standard",
			"wpn_fps_smg_coal_g_standard",
			"wpn_fps_smg_coal_dh_standard",
			"wpn_fps_smg_coal_ns_standard",
			"wpn_fps_smg_coal_s_standard",
			"wpn_fps_smg_coal_m_standard",
			"wpn_fps_smg_coal_mr_standard",
			"wpn_fps_smg_coal_o_scopemount_standard",
			"wpn_fps_upg_ns_ass_pbs1",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_pgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_ak_g_rk3",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_coal_npc = deep_clone(self.wpn_fps_smg_x_coal)
	self.wpn_fps_smg_x_coal_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_coal/wpn_fps_smg_x_coal_npc"
end

function WeaponFactoryTweakData:_init_x_baka()
	self.parts.wpn_fps_smg_baka_s_folded_vanilla = deep_clone(self.parts.wpn_fps_smg_baka_s_folded)
	self.parts.wpn_fps_smg_baka_s_folded_vanilla.stats = nil
	self.parts.wpn_fps_smg_baka_s_folded_vanilla.pcs = nil
	self.wpn_fps_smg_x_baka = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_baka/wpn_fps_smg_x_baka",
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_smg_baka_fl_adapter"}
		},
		default_blueprint = {
			"wpn_fps_smg_baka_body_standard",
			"wpn_fps_smg_baka_m_standard",
			"wpn_fps_smg_baka_b_standard",
			"wpn_fps_smg_baka_g_standard",
			"wpn_fps_smg_baka_s_folded_vanilla"
		},
		uses_parts = {
			"wpn_fps_smg_baka_body_standard",
			"wpn_fps_smg_baka_m_standard",
			"wpn_fps_smg_baka_b_standard",
			"wpn_fps_smg_baka_g_standard",
			"wpn_fps_smg_baka_s_folded_vanilla",
			"wpn_fps_smg_baka_b_comp",
			"wpn_fps_smg_baka_b_midsupp",
			"wpn_fps_smg_baka_b_smallsupp",
			"wpn_fps_smg_baka_b_longsupp",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_baka_npc = deep_clone(self.wpn_fps_smg_x_baka)
	self.wpn_fps_smg_x_baka_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_baka/wpn_fps_smg_x_baka_npc"
end

function WeaponFactoryTweakData:_init_x_cobray()
	self.wpn_fps_smg_x_cobray = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_cobray/wpn_fps_smg_x_cobray",
		animations = {
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_smg_cobray_body_lower",
			"wpn_fps_smg_cobray_body_upper",
			"wpn_fps_smg_cobray_bolt",
			"wpn_fps_smg_cobray_m_standard",
			"wpn_fps_smg_cobray_s_standard",
			"wpn_fps_smg_cobray_barrel"
		},
		uses_parts = {
			"wpn_fps_smg_cobray_body_lower",
			"wpn_fps_smg_cobray_body_upper",
			"wpn_fps_smg_cobray_body_lower_jacket",
			"wpn_fps_smg_cobray_body_upper_jacket",
			"wpn_fps_smg_cobray_bolt",
			"wpn_fps_smg_cobray_m_standard",
			"wpn_fps_smg_cobray_ns_barrelextension",
			"wpn_fps_smg_cobray_ns_silencer",
			"wpn_fps_smg_cobray_s_standard",
			"wpn_fps_smg_cobray_barrel",
			"wpn_fps_smg_cobray_o_adapter",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_cobray_npc = deep_clone(self.wpn_fps_smg_x_cobray)
	self.wpn_fps_smg_x_cobray_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_cobray/wpn_fps_smg_x_cobray_npc"
end

function WeaponFactoryTweakData:_init_x_erma()
	self.parts.wpn_fps_smg_erma_s_folded_vanilla = deep_clone(self.parts.wpn_fps_smg_erma_s_folded)
	self.parts.wpn_fps_smg_erma_s_folded_vanilla.stats = nil
	self.parts.wpn_fps_smg_erma_s_folded_vanilla.pcs = nil
	self.wpn_fps_smg_x_erma = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_erma/wpn_fps_smg_x_erma",
		animations = {
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_smg_erma_b_standard",
			"wpn_fps_smg_erma_body_standard",
			"wpn_fps_smg_erma_bolt_standard",
			"wpn_fps_smg_erma_mag_standard",
			"wpn_fps_smg_erma_ns_standard",
			"wpn_fps_smg_erma_o_ironsight_standard",
			"wpn_fps_smg_erma_s_folded_vanilla"
		},
		uses_parts = {
			"wpn_fps_smg_erma_b_standard",
			"wpn_fps_smg_erma_body_standard",
			"wpn_fps_smg_erma_bolt_standard",
			"wpn_fps_smg_erma_extra_rail",
			"wpn_fps_smg_erma_mag_standard",
			"wpn_fps_smg_erma_ns_standard",
			"wpn_fps_smg_erma_o_ironsight_standard",
			"wpn_fps_smg_erma_s_folded_vanilla",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_erma_npc = deep_clone(self.wpn_fps_smg_x_erma)
	self.wpn_fps_smg_x_erma_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_erma/wpn_fps_smg_x_erma_npc"
end

function WeaponFactoryTweakData:_init_x_hajk()
	self.wpn_fps_smg_x_hajk = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_hajk/wpn_fps_smg_x_hajk",
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_smg_baka_fl_adapter"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_smg_baka_fl_adapter"}
		},
		override = {
			wpn_fps_smg_hajk_body_standard = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_ass_l85a2_m_emag = {supported = true,stats = {
				value = 0,
				extra_ammo = 0
			}},
			wpn_fps_upg_m4_m_pmag = {supported = true,stats = {
				value = 3,
				recoil = -1,
				concealment = 1
			}},
			wpn_fps_upg_m4_m_l5 = {supported = true,stats = {
				value = 0
			}},
			wpn_fps_upg_m4_m_quad = {supported = true,stats = {
				value = 3,
				concealment = -3,
				reload = -3,
				extra_ammo = 60
			}},
			wpn_fps_upg_m4_m_straight = {supported = true,stats = {
				value = 2,
				concealment = 2,
				reload = 3,
				extra_ammo = -20
			}}
		},
		default_blueprint = {
			"wpn_fps_smg_hajk_b_standard",
			"wpn_fps_smg_hajk_fg_standard",
			"wpn_fps_smg_hajk_g_standard",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_smg_hajk_ns_standard",
			"wpn_fps_smg_hajk_o_standard",
			"wpn_fps_smg_hajk_s_standard",
			"wpn_fps_smg_hajk_body_standard",
			"wpn_fps_smg_hajk_vg_moe"
		},
		uses_parts = {
			"wpn_fps_smg_hajk_b_standard",
			"wpn_fps_smg_hajk_b_short",
			"wpn_fps_smg_hajk_b_medium",
			"wpn_fps_smg_hajk_fg_standard",
			"wpn_fps_smg_hajk_g_standard",
			"wpn_fps_smg_hajk_ns_standard",
			"wpn_fps_smg_hajk_o_standard",
			"wpn_fps_smg_hajk_s_standard",
			"wpn_fps_smg_hajk_body_standard",
			"wpn_fps_smg_hajk_vg_moe",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_m4_upg_m_quick",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_hajk_npc = deep_clone(self.wpn_fps_smg_x_hajk)
	self.wpn_fps_smg_x_hajk_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_hajk/wpn_fps_smg_x_hajk_npc"
end

function WeaponFactoryTweakData:_init_x_m45()
	self.parts.wpn_fps_smg_m45_s_folded_vanilla = deep_clone(self.parts.wpn_fps_smg_m45_s_folded)
	self.parts.wpn_fps_smg_m45_s_folded_vanilla.stats = nil
	self.parts.wpn_fps_smg_m45_s_folded_vanilla.pcs = nil
	self.wpn_fps_smg_x_m45 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_m45/wpn_fps_smg_x_m45",
		override = {
			wpn_fps_smg_m45_body_standard = {animations = {
				fire_steelsight = "recoil",
				fire = "recoil"
			}},
			wpn_fps_smg_m45_m_extended = {supported = true,stats = {
				value = 4,
				concealment = -1,
				reload = -1,
				extra_ammo = 12
			}}
		},
		adds = {
			wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_laser = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_utg = {"wpn_fps_shot_r870_gadget_rail"}
		},
		default_blueprint = {
			"wpn_fps_smg_m45_m_mag",
			"wpn_fps_smg_m45_b_standard",
			"wpn_fps_smg_m45_body_standard",
			"wpn_fps_smg_m45_s_folded_vanilla",
			"wpn_fps_smg_m45_g_standard"
		},
		uses_parts = {
			"wpn_fps_smg_m45_m_mag",
			"wpn_fps_smg_m45_b_standard",
			"wpn_fps_smg_m45_body_standard",
			"wpn_fps_smg_m45_g_standard",
			"wpn_fps_smg_m45_m_extended",
			"wpn_fps_smg_m45_b_small",
			"wpn_fps_smg_m45_b_green",
			"wpn_fps_smg_m45_body_green",
			"wpn_fps_smg_m45_g_bling",
			"wpn_fps_smg_m45_g_ergo",
			"wpn_fps_smg_m45_s_folded_vanilla",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_m45_npc = deep_clone(self.wpn_fps_smg_x_m45)
	self.wpn_fps_smg_x_m45_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_m45/wpn_fps_smg_x_m45_npc"
end

function WeaponFactoryTweakData:_init_x_m1928()
	self.parts.wpn_fps_smg_thompson_stock_nostock_vanilla = deep_clone(self.parts.wpn_fps_smg_thompson_stock_nostock)
	self.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.stats = nil
	self.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.pcs = nil
	self.wpn_fps_smg_x_m1928 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_m1928/wpn_fps_smg_x_m1928",
		adds = {
			wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_smg_thompson_fl_adapter"},
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_smg_thompson_fl_adapter"},
			wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_smg_thompson_fl_adapter"},
			wpn_fps_upg_fl_ass_laser = {"wpn_fps_smg_thompson_fl_adapter"},
			wpn_fps_upg_fl_ass_utg = {"wpn_fps_smg_thompson_fl_adapter"}
		},
		override = {wpn_fps_smg_thompson_body = {animations = {
			fire_steelsight = "recoil",
			fire = "recoil"
		}}},
		default_blueprint = {
			"wpn_fps_smg_thompson_barrel",
			"wpn_fps_smg_thompson_body",
			"wpn_fps_smg_thompson_drummag",
			"wpn_fps_smg_thompson_foregrip",
			"wpn_fps_smg_thompson_grip",
			"wpn_fps_smg_thompson_stock_nostock_vanilla",
			"wpn_fps_smg_thompson_ns_standard"
		},
		uses_parts = {
			"wpn_fps_smg_thompson_barrel",
			"wpn_fps_smg_thompson_barrel_long",
			"wpn_fps_smg_thompson_barrel_short",
			"wpn_fps_smg_thompson_body",
			"wpn_fps_smg_thompson_drummag",
			"wpn_fps_smg_thompson_fl_adapter",
			"wpn_fps_smg_thompson_foregrip",
			"wpn_fps_smg_thompson_foregrip_discrete",
			"wpn_fps_smg_thompson_grip",
			"wpn_fps_smg_thompson_grip_discrete",
			"wpn_fps_smg_thompson_ns_standard",
			"wpn_fps_smg_thompson_o_adapter",
			"wpn_fps_smg_thompson_stock_nostock_vanilla",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_m1928_npc = deep_clone(self.wpn_fps_smg_x_m1928)
	self.wpn_fps_smg_x_m1928_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_m1928/wpn_fps_smg_x_m1928_npc"
end

function WeaponFactoryTweakData:_init_x_mac10()
	self.wpn_fps_smg_x_mac10 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mac10/wpn_fps_smg_x_mac10",
		override = {
			wpn_fps_smg_mac10_m_extended = {supported = true,stats = {
				value = 2,
				concealment = -1,
				extra_ammo = 20,
				reload = -1
			}},
			wpn_fps_smg_mac10_m_quick = {supported = true,stats = {
				value = 2,
				spread = -1,
				reload = 2,
				extra_ammo = 20,
				concealment = -2
			}}
		},
		default_blueprint = {
			"wpn_fps_smg_mac10_body_mac10",
			"wpn_fps_smg_mac10_b_dummy",
			"wpn_fps_smg_mac10_m_short",
			"wpn_fps_smg_mac10_s_fold"
		},
		uses_parts = {
			"wpn_fps_smg_mac10_b_dummy",
			"wpn_fps_smg_mac10_body_ris",
			"wpn_fps_smg_mac10_ris_dummy",
			"wpn_fps_smg_mac10_m_extended",
			"wpn_fps_smg_mac10_m_short",
			"wpn_fps_smg_mac10_body_mac10",
			"wpn_fps_smg_mac10_s_fold",
			"wpn_fps_smg_mac10_s_skel",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_afg",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_smg_cobray_ns_silencer",
			"wpn_fps_smg_cobray_ns_barrelextension",
			"wpn_fps_smg_mac10_m_quick",
			"wpn_fps_smg_mac10_body_modern",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_mac10_npc = deep_clone(self.wpn_fps_smg_x_mac10)
	self.wpn_fps_smg_x_mac10_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mac10/wpn_fps_smg_x_mac10_npc"
end

function WeaponFactoryTweakData:_init_x_mp7()
	self.wpn_fps_smg_x_mp7 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mp7/wpn_fps_smg_x_mp7",
		override = {wpn_fps_smg_mp7_m_extended = {supported = true,stats = {
				value = 1,
				concealment = -1,
				reload = -1,
				extra_ammo = 20
		}}},
		default_blueprint = {
			"wpn_fps_smg_mp7_m_short",
			"wpn_fps_smg_mp7_b_standard",
			"wpn_fps_smg_mp7_body_standard",
			"wpn_fps_smg_mp7_s_standard"
		},
		uses_parts = {
			"wpn_fps_smg_mp7_m_short",
			"wpn_fps_smg_mp7_b_standard",
			"wpn_fps_smg_mp7_body_standard",
			"wpn_fps_smg_mp7_s_standard",
			"wpn_fps_smg_mp7_m_extended",
			"wpn_fps_smg_mp7_b_suppressed",
			"wpn_fps_smg_mp7_s_long",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_mp7_npc = deep_clone(self.wpn_fps_smg_x_mp7)
	self.wpn_fps_smg_x_mp7_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mp7/wpn_fps_smg_x_mp7_npc"
end

function WeaponFactoryTweakData:_init_x_mp9()
	self.wpn_fps_smg_x_mp9 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mp9/wpn_fps_smg_x_mp9",
		override = {wpn_fps_smg_mp9_m_extended = {supported = true,stats = {
			value = 4,
			concealment = -1,
			reload = -1,
			extra_ammo = 20
		}}},
		default_blueprint = {
			"wpn_fps_smg_mp9_body_mp9",
			"wpn_fps_smg_mp9_s_fold",
			"wpn_fps_smg_mp9_m_short",
			"wpn_fps_smg_mp9_b_dummy"
		},
		uses_parts = {
			"wpn_fps_smg_mp9_b_dummy",
			"wpn_fps_smg_mp9_b_suppressed",
			"wpn_fps_smg_mp9_body_mp9",
			"wpn_fps_smg_mp9_m_extended",
			"wpn_fps_smg_mp9_m_short",
			"wpn_fps_smg_mp9_s_fold",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_mp9_npc = deep_clone(self.wpn_fps_smg_x_mp9)
	self.wpn_fps_smg_x_mp9_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_mp9/wpn_fps_smg_x_mp9_npc"
end

function WeaponFactoryTweakData:_init_x_olympic()
	self.wpn_fps_smg_x_olympic = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_olympic/wpn_fps_smg_x_olympic",
		stock_adapter = "wpn_fps_upg_m4_s_adapter",
		override = {
			wpn_fps_m4_uupg_b_short_vanilla = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_para_b_short"},
			wpn_fps_m4_uupg_b_medium = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_para_b_medium"},
			wpn_fps_ass_l85a2_m_emag = {supported = true,stats = {
				value = 1
			}},
			wpn_fps_upg_m4_m_pmag = {supported = true,stats = {
				recoil = -1,
				concealment = 1
			}},
			wpn_fps_upg_m4_m_l5 = {supported = true,stats = {
				value = 1
			}},
			wpn_fps_upg_m4_m_quad = {supported = true,stats = {
				extra_ammo = 60,
				concealment = -3,
				reload = -3
			}},
			wpn_fps_upg_m4_m_straight = {supported = true,stats = {
				value = 1,
				extra_ammo = -20,
				reload = 3,
				concealment = 2
			}},
			wpn_fps_upg_m4_m_drum = {supported = true,stats = {
				value = 9,
				extra_ammo = 80,
				reload = -6,
				concealment = -5
			}}				
		},
		animations = {
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_smg_olympic_s_short_vanilla",
			"wpn_fps_m4_uupg_draghandle",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_m4_uupg_b_short_vanilla",
			"wpn_fps_m4_upper_reciever_round",
			"wpn_fps_m4_lower_reciever",
			"wpn_fps_smg_olympic_fg_olympic",
			"wpn_fps_ass_m16_o_handle_sight",
			"wpn_fps_amcar_bolt_standard"
		},
		uses_parts = {
			"wpn_fps_smg_olympic_s_short_vanilla",
			"wpn_fps_ass_m16_o_handle_sight",
			"wpn_fps_amcar_bolt_standard",
			"wpn_fps_m4_lower_reciever",
			"wpn_fps_upg_ass_m4_lower_reciever_core",
			"wpn_fps_m4_upper_reciever_edge",
			"wpn_fps_m4_upper_reciever_round",
			"wpn_fps_upg_ass_m4_upper_reciever_ballos",
			"wpn_fps_upg_ass_m4_upper_reciever_core",
			"wpn_fps_m4_uupg_draghandle",
			"wpn_fps_m4_uupg_draghandle_ballos",
			"wpn_fps_m4_uupg_draghandle_core",
			"wpn_fps_smg_olympic_fg_olympic",
			"wpn_fps_smg_olympic_fg_railed",
			"wpn_fps_upg_smg_olympic_fg_lr300",
			"wpn_fps_m4_uupg_b_short_vanilla",
			"wpn_fps_m4_uupg_b_medium",
			"wpn_fps_m4_uupg_m_std_vanilla",
			--"wpn_fps_upg_m4_m_drum",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_m4_upg_m_quick",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_upg_m4_g_ergo",
			"wpn_fps_upg_m4_g_sniper",
			"wpn_fps_upg_m4_g_hgrip",
			"wpn_fps_upg_m4_g_mgrip",
			"wpn_fps_snp_tti_g_grippy",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_afg",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_g_m4_surgeon",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_olympic_npc = deep_clone(self.wpn_fps_smg_x_olympic)
	self.wpn_fps_smg_x_olympic_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_olympic/wpn_fps_smg_x_olympic_npc"
end

function WeaponFactoryTweakData:_init_x_p90()
	self.wpn_fps_smg_x_p90 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_p90/wpn_fps_smg_x_p90",
		override = {
			wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
			wpn_upg_o_marksmansight_front = {a_obj = "a_of"}
		},
		default_blueprint = {
			"wpn_fps_smg_p90_body_p90",
			"wpn_fps_smg_p90_b_short",
			"wpn_fps_smg_p90_m_std",
			"wpn_upg_o_marksmansight_rear_vanilla"
		},
		uses_parts = {
			"wpn_fps_smg_p90_body_p90",
			"wpn_fps_smg_p90_m_std",
			"wpn_fps_smg_p90_b_short",
			"wpn_fps_smg_p90_b_long",
			"wpn_upg_o_marksmansight_rear_vanilla",
			"wpn_upg_o_marksmansight_front",
			"wpn_fps_smg_p90_b_legend",
			"wpn_fps_smg_p90_b_civilian",
			"wpn_fps_smg_p90_b_ninja",
			"wpn_fps_smg_p90_m_strap",
			"wpn_fps_smg_p90_body_boxy",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_p90_npc = deep_clone(self.wpn_fps_smg_x_p90)
	self.wpn_fps_smg_x_p90_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_p90/wpn_fps_smg_x_p90_npc"
end

function WeaponFactoryTweakData:_init_x_polymer()
	self.wpn_fps_smg_x_polymer = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_polymer/wpn_fps_smg_x_polymer",
		default_blueprint = {
			"wpn_fps_smg_polymer_body_standard",
			"wpn_fps_smg_polymer_bolt_standard",
			"wpn_fps_smg_polymer_dh_standard",
			"wpn_fps_smg_polymer_extra_sling",
			"wpn_fps_smg_polymer_o_iron",
			"wpn_fps_smg_polymer_fg_standard",
			"wpn_fps_smg_polymer_barrel_standard",
			"wpn_fps_smg_polymer_m_standard",
			"wpn_fps_smg_polymer_s_standard"
		},
		uses_parts = {
			"wpn_fps_smg_polymer_body_standard",
			"wpn_fps_smg_polymer_bolt_standard",
			"wpn_fps_smg_polymer_dh_standard",
			"wpn_fps_smg_polymer_extra_sling",
			"wpn_fps_smg_polymer_o_iron",
			"wpn_fps_smg_polymer_fg_standard",
			"wpn_fps_smg_polymer_barrel_standard",
			"wpn_fps_smg_polymer_m_standard",
			"wpn_fps_smg_polymer_s_standard",
			"wpn_fps_smg_polymer_barrel_precision",
			"wpn_fps_smg_polymer_ns_silencer",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_polymer_npc = deep_clone(self.wpn_fps_smg_x_polymer)
	self.wpn_fps_smg_x_polymer_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_polymer/wpn_fps_smg_x_polymer_npc"
end

function WeaponFactoryTweakData:_init_x_schakal()
	self.parts.wpn_fps_smg_schakal_s_folded_vanilla = deep_clone(self.parts.wpn_fps_smg_schakal_s_folded)
	self.parts.wpn_fps_smg_schakal_s_folded_vanilla.stats = nil
	self.parts.wpn_fps_smg_schakal_s_folded_vanilla.pcs = nil
	self.wpn_fps_smg_x_schakal = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_schakal/wpn_fps_smg_x_schakal",
		override = {
			wpn_fps_smg_schakal_m_short = {supported = true,stats = {
				value = 1,
				extra_ammo = -20,
				reload = 2,
				concealment = 1
			}},
			wpn_fps_smg_schakal_m_long = {supported = true,stats = {
				value = 1,
				extra_ammo = 20,
				reload = -2,
				concealment = -1
			}}
		},
		animations = {
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_smg_schakal_b_standard",
			"wpn_fps_smg_schakal_body_lower",
			"wpn_fps_smg_schakal_body_upper",
			"wpn_fps_smg_schakal_m_standard",
			"wpn_fps_smg_schakal_s_folded_vanilla",
			"wpn_fps_smg_schakal_dh_standard",
			"wpn_fps_smg_schakal_bolt_standard",
			"wpn_fps_smg_schakal_extra_magrelease"
		},
		uses_parts = {
			"wpn_fps_smg_schakal_b_civil",
			"wpn_fps_smg_schakal_b_standard",
			"wpn_fps_smg_schakal_body_lower",
			"wpn_fps_smg_schakal_body_upper",
			"wpn_fps_smg_schakal_m_long",
			"wpn_fps_smg_schakal_m_short",
			"wpn_fps_smg_schakal_m_standard",
			"wpn_fps_smg_schakal_ns_silencer",
			"wpn_fps_smg_schakal_s_folded_vanilla",
			"wpn_fps_smg_schakal_dh_standard",
			"wpn_fps_smg_schakal_bolt_standard",
			"wpn_fps_smg_schakal_vg_extra",
			"wpn_fps_smg_schakal_vg_surefire",
			"wpn_fps_smg_schakal_extra_magrelease",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_afg",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_schakal_npc = deep_clone(self.wpn_fps_smg_x_schakal)
	self.wpn_fps_smg_x_schakal_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_schakal/wpn_fps_smg_x_schakal_npc"
end

function WeaponFactoryTweakData:_init_x_scorpion()
	self.wpn_fps_smg_x_scorpion = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_scorpion/wpn_fps_smg_x_scorpion",
		override = {wpn_fps_smg_scorpion_m_extended = {supported = true,stats = {
				value = 3,
				concealment = -1,
				spread = -1,
				reload = 3
		}}},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_smg_scorpion_extra_rail_gadget"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_smg_scorpion_extra_rail_gadget"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_smg_scorpion_extra_rail_gadget"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_smg_scorpion_extra_rail_gadget"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_smg_scorpion_extra_rail_gadget"}
		},
		default_blueprint = {
			"wpn_fps_smg_scorpion_body_standard",
			"wpn_fps_smg_scorpion_b_standard",
			"wpn_fps_smg_scorpion_m_standard",
			"wpn_fps_smg_scorpion_s_standard",
			"wpn_fps_smg_scorpion_g_standard"
		},
		uses_parts = {
			"wpn_fps_smg_scorpion_b_standard",
			"wpn_fps_smg_scorpion_b_suppressed",
			"wpn_fps_smg_scorpion_body_standard",
			"wpn_fps_smg_scorpion_g_standard",
			"wpn_fps_smg_scorpion_g_wood",
			"wpn_fps_smg_scorpion_g_ergo",
			"wpn_fps_smg_scorpion_m_standard",
			"wpn_fps_smg_scorpion_m_extended",
			"wpn_fps_smg_scorpion_s_standard",
			"wpn_fps_smg_scorpion_extra_rail_gadget",
			"wpn_fps_smg_scorpion_extra_rail",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_afg",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_scorpion_npc = deep_clone(self.wpn_fps_smg_x_scorpion)
	self.wpn_fps_smg_x_scorpion_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_scorpion/wpn_fps_smg_x_scorpion_npc"
end

function WeaponFactoryTweakData:_init_x_sterling()
	self.parts.wpn_fps_smg_sterling_s_folded_vanilla = deep_clone(self.parts.wpn_fps_smg_sterling_s_folded)
	self.parts.wpn_fps_smg_sterling_s_folded_vanilla.stats = nil
	self.parts.wpn_fps_smg_sterling_s_folded_vanilla.pcs = nil
	self.wpn_fps_smg_x_sterling = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_sterling/wpn_fps_smg_x_sterling",
		override = {
			wpn_fps_smg_sterling_b_standard = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_smg_sterling_b_short = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_smg_sterling_b_long = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_smg_sterling_b_suppressed = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_smg_sterling_b_e11 = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_smg_sterling_m_short = {supported = true,stats = {
				value = 1,
				extra_ammo = -20,
				reload = 2,
				concealment = 1
			}},
			wpn_fps_smg_sterling_m_long = {supported = true,stats = {
				value = 1,
				extra_ammo = 20,
				reload = -2,
				concealment = -1
			}},
			wpn_fps_upg_ammo_762_sterling = {
				supported = true,
				stats = {
					value = 1
				}
			}				
		},
		default_blueprint = {
			"wpn_fps_smg_sterling_b_standard",
			"wpn_fps_smg_sterling_body_standard",
			"wpn_fps_smg_sterling_m_medium",
			"wpn_fps_smg_sterling_s_folded_vanilla"
		},
		uses_parts = {
			"wpn_fps_smg_sterling_b_long",
			"wpn_fps_smg_sterling_b_short",
			"wpn_fps_smg_sterling_b_standard",
			"wpn_fps_smg_sterling_b_suppressed",
			"wpn_fps_smg_sterling_b_e11",
			"wpn_fps_smg_sterling_body_standard",
			"wpn_fps_smg_sterling_m_long",
			"wpn_fps_smg_sterling_m_medium",
			"wpn_fps_smg_sterling_m_short",
			"wpn_fps_smg_sterling_s_folded_vanilla",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			--Custom--
			"wpn_fps_upg_ammo_762_sterling",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_sterling_npc = deep_clone(self.wpn_fps_smg_x_sterling)
	self.wpn_fps_smg_x_sterling_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_sterling/wpn_fps_smg_x_sterling_npc"
end

function WeaponFactoryTweakData:_init_x_tec9()
	self.wpn_fps_smg_x_tec9 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_tec9/wpn_fps_smg_x_tec9",
		override = {wpn_fps_smg_tec9_m_extended = {supported = true,stats = {
			value = 4,
			extra_ammo = 24,
			reload = -1,
			concealment = -1
		}}},
		default_blueprint = {
			"wpn_fps_smg_tec9_m_standard",
			"wpn_fps_smg_tec9_b_long",
			"wpn_fps_smg_tec9_body_standard"
		},
		uses_parts = {
			"wpn_fps_smg_tec9_b_long",
			"wpn_fps_smg_tec9_b_standard",
			"wpn_fps_smg_tec9_body_standard",
			"wpn_fps_smg_tec9_m_standard",
			"wpn_fps_smg_tec9_m_extended",
			"wpn_fps_smg_tec9_ns_ext",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_tec9_npc = deep_clone(self.wpn_fps_smg_x_tec9)
	self.wpn_fps_smg_x_tec9_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_tec9/wpn_fps_smg_x_tec9_npc"
end

function WeaponFactoryTweakData:_init_x_uzi()
	self.parts.wpn_fps_smg_uzi_s_standard_vanilla = deep_clone(self.parts.wpn_fps_smg_uzi_s_standard)
	self.parts.wpn_fps_smg_uzi_s_standard_vanilla.stats = nil
	self.parts.wpn_fps_smg_uzi_s_standard_vanilla.pcs = nil
	self.wpn_fps_smg_x_uzi = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_uzi/wpn_fps_smg_x_uzi",
		adds = {
			wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_laser = {"wpn_fps_shot_r870_gadget_rail"},
			wpn_fps_upg_fl_ass_utg = {"wpn_fps_shot_r870_gadget_rail"}
		},
		default_blueprint = {
			"wpn_fps_smg_uzi_b_standard",
			"wpn_fps_smg_uzi_body_standard",
			"wpn_fps_smg_uzi_fg_standard",
			"wpn_fps_smg_uzi_g_standard",
			"wpn_fps_smg_uzi_m_standard",
			"wpn_fps_smg_uzi_s_standard_vanilla"
		},
		uses_parts = {
			"wpn_fps_smg_uzi_b_standard",
			"wpn_fps_smg_uzi_b_suppressed",
			"wpn_fps_smg_uzi_body_standard",
			"wpn_fps_smg_uzi_fg_rail",
			"wpn_fps_smg_uzi_fg_standard",
			"wpn_fps_smg_uzi_g_standard",
			"wpn_fps_smg_uzi_m_standard",
			"wpn_fps_smg_uzi_s_standard_vanilla",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla",
			"wpn_fps_upg_vg_ass_smg_afg_vanilla",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_uzi_npc = deep_clone(self.wpn_fps_smg_x_uzi)
	self.wpn_fps_smg_x_uzi_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_smg_x_uzi/wpn_fps_smg_x_uzi_npc"
end

function WeaponFactoryTweakData:_init_x_2006m()
	self.wpn_fps_pis_x_2006m = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_2006m/wpn_fps_pis_x_2006m",
		animations = {
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_2006m_fl_adapter"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_2006m_fl_adapter"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_2006m_fl_adapter"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_2006m_fl_adapter"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_2006m_fl_adapter"}
		},
		override = {
			wpn_fps_pis_2006m_body_standard = {},
			wpn_fps_pis_2006m_m_standard = {
				animations = {},
			}
		},
		default_blueprint = {
			"wpn_fps_pis_2006m_b_standard",
			"wpn_fps_pis_2006m_body_standard",
			"wpn_fps_pis_2006m_g_standard",
			"wpn_fps_pis_2006m_m_standard"
		},
		uses_parts = {
			"wpn_fps_pis_2006m_b_long",
			"wpn_fps_pis_2006m_b_medium",
			"wpn_fps_pis_2006m_b_short",
			"wpn_fps_pis_2006m_b_standard",
			"wpn_fps_pis_2006m_body_standard",
			"wpn_fps_pis_2006m_fl_adapter",
			"wpn_fps_pis_2006m_g_bling",
			"wpn_fps_pis_2006m_g_standard",
			"wpn_fps_pis_2006m_m_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x"
		}
	}
	self.wpn_fps_pis_x_2006m_npc = deep_clone(self.wpn_fps_pis_x_2006m)
	self.wpn_fps_pis_x_2006m_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_2006m/wpn_fps_pis_x_2006m_npc"
end

function WeaponFactoryTweakData:_init_x_breech()
	self.wpn_fps_pis_x_breech = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_breech/wpn_fps_pis_x_breech",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			fire = "recoil",
			fire_steelsight = "recoil",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = false},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_o_rms = {
				parent = false
			},
			wpn_fps_upg_o_rikt = {
				parent = false
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_breech_dh = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}}
		},
		default_blueprint = {
			"wpn_fps_pis_breech_b_standard",
			"wpn_fps_pis_breech_body",
			"wpn_fps_pis_breech_dh",
			"wpn_fps_pis_breech_g_standard",
			"wpn_fps_pis_breech_mag"
		},
		uses_parts = {
			"wpn_fps_pis_breech_b_reinforced",
			"wpn_fps_pis_breech_b_short",
			"wpn_fps_pis_breech_b_standard",
			"wpn_fps_pis_breech_body",
			"wpn_fps_pis_breech_dh",
			"wpn_fps_pis_breech_g_custom",
			"wpn_fps_pis_breech_g_standard",
			"wpn_fps_pis_breech_mag"
		}
	}
	self.wpn_fps_pis_x_breech_npc = deep_clone(self.wpn_fps_pis_x_breech)
	self.wpn_fps_pis_x_breech_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_breech/wpn_fps_pis_x_breech_npc"
end

function WeaponFactoryTweakData:_init_x_c96()
	self.wpn_fps_pis_x_c96 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_c96/wpn_fps_pis_x_c96",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		override = {
			wpn_fps_pis_c96_m_standard = {animations = {}},
			wpn_fps_pis_c96_m_extended = {
				animations = {},
				supported = true,
				stats = {
					value = 1,
					concealment = -1,
					extra_ammo = 20
				}
			},
			wpn_fps_pis_c96_b_standard = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}},
			wpn_fps_pis_c96_b_long = {animations = {
				fire = "recoil",
				fire_steelsight = "recoil",
				magazine_empty = "last_recoil"
			}}
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_c96_rail"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_c96_rail"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_c96_rail"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_c96_rail"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_c96_rail"},
			wpn_fps_pis_c96_sight = {"wpn_fps_pis_c96_rail"}
		},
		default_blueprint = {
			"wpn_fps_pis_c96_b_standard",
			"wpn_fps_pis_c96_body_standard",
			"wpn_fps_pis_c96_g_standard",
			"wpn_fps_pis_c96_m_standard"
		},
		uses_parts = {
			"wpn_fps_pis_c96_b_long",
			"wpn_fps_pis_c96_b_standard",
			"wpn_fps_pis_c96_body_standard",
			"wpn_fps_pis_c96_g_standard",
			"wpn_fps_pis_c96_m_extended",
			"wpn_fps_pis_c96_m_standard",
			"wpn_fps_pis_c96_nozzle",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_c96_npc = deep_clone(self.wpn_fps_pis_x_c96)
	self.wpn_fps_pis_x_c96_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_c96/wpn_fps_pis_x_c96_npc"
end

function WeaponFactoryTweakData:_init_x_g18c()
	self.wpn_fps_pis_x_g18c = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_g18c/wpn_fps_pis_x_g18c",
		override = {
			wpn_fps_pis_g18c_m_mag_33rnd = {
				animations = {
					reload_not_empty = "reload_not_empty_right",
					reload = "reload_right",
					reload_left = "reload_left",
					reload_not_empty_left = "reload_not_empty_left"
				},
				supported = true,
				stats = {
					value = 6,
					extra_ammo = 30,
					concealment = -1,
					reload = -2
				}
			},
			wpn_fps_pis_g18c_m_mag_17rnd = {animations = {
				reload_not_empty = "reload_not_empty_right",
				reload = "reload_right",
				reload_left = "reload_left",
				reload_not_empty_left = "reload_not_empty_left"
			}},
			wpn_fps_pis_g18c_b_standard = {animations = {
				reload_left = "reload_left",
				fire = "recoil",
				reload_not_empty = "reload_not_empty_right",
				reload = "reload_right",
				reload_not_empty_left = "reload_not_empty_left",
				magazine_empty = "last_recoil"
			}}
		},
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		default_blueprint = {
			"wpn_fps_pis_g18c_body_frame",
			"wpn_fps_pis_g18c_b_standard",
			"wpn_fps_pis_g18c_m_mag_17rnd"
		},
		uses_parts = {
			"wpn_fps_pis_g18c_body_frame",
			"wpn_fps_pis_g18c_b_standard",
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2",
			"wpn_fps_pis_g18c_m_mag_33rnd",
			"wpn_fps_pis_g18c_m_mag_17rnd",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_pis_g18c_g_ergo",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_pis_g26_g_gripforce",
			"wpn_fps_pis_g26_g_laser",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_g18c_npc = deep_clone(self.wpn_fps_pis_x_g18c)
	self.wpn_fps_pis_x_g18c_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_g18c/wpn_fps_pis_x_g18c_npc"
end

function WeaponFactoryTweakData:_init_x_hs2000()
	self.wpn_fps_pis_x_hs2000 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_hs2000/wpn_fps_pis_x_hs2000",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_hs2000_m_extended = {supported = true,stats = {
				value = 1,
				extra_ammo = 16,
				reload = -2,
				concealment = -1
			}}
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_pis_hs2000_body_standard",
			"wpn_fps_pis_hs2000_m_standard",
			"wpn_fps_pis_hs2000_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_hs2000_body_standard",
			"wpn_fps_pis_hs2000_m_standard",
			"wpn_fps_pis_hs2000_m_extended",
			"wpn_fps_pis_hs2000_sl_standard",
			"wpn_fps_pis_hs2000_sl_custom",
			"wpn_fps_pis_hs2000_sl_long",
			"wpn_fps_pis_hs2000_b_standard",
			"wpn_fps_pis_hs2000_b_custom",
			"wpn_fps_pis_hs2000_b_long",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_hs2000_npc = deep_clone(self.wpn_fps_pis_x_hs2000)
	self.wpn_fps_pis_x_hs2000_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_hs2000/wpn_fps_pis_x_hs2000_npc"
end

function WeaponFactoryTweakData:_init_x_p226()
	self.wpn_fps_pis_x_p226 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_p226/wpn_fps_pis_x_p226",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_p226_m_extended = {supported = true,stats = {
				value = 1,
				extra_ammo = 28,
				concealment = -1,
				reload = -2
			}}
		},
		default_blueprint = {
			"wpn_fps_pis_p226_b_standard",
			"wpn_fps_pis_p226_body_standard",
			"wpn_fps_pis_p226_g_standard",
			"wpn_fps_pis_p226_m_standard",
			"wpn_fps_pis_p226_o_standard"
		},
		uses_parts = {
			"wpn_fps_pis_p226_b_standard",
			"wpn_fps_pis_p226_b_equinox",
			"wpn_fps_pis_p226_b_long",
			"wpn_fps_pis_p226_body_standard",
			"wpn_fps_pis_p226_g_standard",
			"wpn_fps_pis_p226_g_ergo",
			"wpn_fps_pis_p226_m_standard",
			"wpn_fps_pis_p226_m_extended",
			"wpn_fps_pis_p226_o_standard",
			"wpn_fps_pis_p226_o_long",
			"wpn_fps_pis_p226_co_comp_1",
			"wpn_fps_pis_p226_co_comp_2",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_p226_npc = deep_clone(self.wpn_fps_pis_x_p226)
	self.wpn_fps_pis_x_p226_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_p226/wpn_fps_pis_x_p226_npc"
end

function WeaponFactoryTweakData:_init_x_pl14()
	self.wpn_fps_pis_x_pl14 = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_pl14/wpn_fps_pis_x_pl14",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_pl14_m_extended = {supported = true,stats = {
				value = 1,
				extra_ammo = 4,
				concealment = -1
			}}
		},
		default_blueprint = {
			"wpn_fps_pis_pl14_b_standard",
			"wpn_fps_pis_pl14_body_standard",
			"wpn_fps_pis_pl14_m_standard",
			"wpn_fps_pis_pl14_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_pl14_b_comp",
			"wpn_fps_pis_pl14_b_standard",
			"wpn_fps_pis_pl14_body_standard",
			"wpn_fps_pis_pl14_m_extended",
			"wpn_fps_pis_pl14_m_standard",
			"wpn_fps_pis_pl14_sl_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_pl14_npc = deep_clone(self.wpn_fps_pis_x_pl14)
	self.wpn_fps_pis_x_pl14_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_pl14/wpn_fps_pis_x_pl14_npc"
end

function WeaponFactoryTweakData:_init_x_ppk()
	self.wpn_fps_pis_x_ppk = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_ppk/wpn_fps_pis_x_ppk",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_ppk_fl_mount"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_ppk_fl_mount"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_ppk_fl_mount"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_ppk_fl_mount"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_ppk_fl_mount"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			}
		},
		default_blueprint = {
			"wpn_fps_pis_ppk_b_standard",
			"wpn_fps_pis_ppk_body_standard",
			"wpn_fps_pis_ppk_g_standard",
			"wpn_fps_pis_ppk_m_standard"
		},
		uses_parts = {
			"wpn_fps_pis_ppk_b_standard",
			"wpn_fps_pis_ppk_b_long",
			"wpn_fps_pis_ppk_b_barrel_standard",
			"wpn_fps_pis_ppk_b_barrel_long",
			"wpn_fps_pis_ppk_dh_standard",
			"wpn_fps_pis_ppk_body_standard",
			"wpn_fps_pis_ppk_g_standard",
			"wpn_fps_pis_ppk_g_laser",
			"wpn_fps_pis_ppk_m_standard",
			"wpn_fps_pis_ppk_fl_mount",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon"
		}
	}
	self.wpn_fps_pis_x_ppk_npc = deep_clone(self.wpn_fps_pis_x_ppk)
	self.wpn_fps_pis_x_ppk_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_ppk/wpn_fps_pis_x_ppk_npc"
end

function WeaponFactoryTweakData:_init_x_rage()
	self.wpn_fps_pis_x_rage = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_rage/wpn_fps_pis_x_rage",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		override = {
			wpn_fps_pis_rage_body_standard = {},
			wpn_fps_pis_rage_body_smooth = {}
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_pis_rage_body_standard",
			"wpn_fps_pis_rage_b_standard",
			"wpn_fps_pis_rage_g_standard"
		},
		uses_parts = {
			"wpn_fps_pis_rage_body_standard",
			"wpn_fps_pis_rage_body_smooth",
			"wpn_fps_pis_rage_b_standard",
			"wpn_fps_pis_rage_b_short",
			"wpn_fps_pis_rage_b_long",
			"wpn_fps_pis_rage_b_comp1",
			"wpn_fps_pis_rage_b_comp2",
			"wpn_fps_pis_rage_g_standard",
			"wpn_fps_pis_rage_g_ergo",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_pis_rage_lock",
			"wpn_fps_upg_ns_pis_typhoon",
			--custom--
			"wpn_fps_pis_g18c_co_comp_2",
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_upg_ns_pis_meatgrinder"	
		}
	}
	self.wpn_fps_pis_x_rage_npc = deep_clone(self.wpn_fps_pis_x_rage)
	self.wpn_fps_pis_x_rage_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_rage/wpn_fps_pis_x_rage_npc"
end

function WeaponFactoryTweakData:_init_x_sparrow()
	self.wpn_fps_pis_x_sparrow = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_sparrow/wpn_fps_pis_x_sparrow",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_sparrow_fl_dummy"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_sparrow_fl_dummy"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_sparrow_fl_dummy"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_sparrow_fl_dummy"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_sparrow_fl_dummy"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			},	
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			}				
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_pis_sparrow_b_rpl",
			"wpn_fps_pis_sparrow_body_rpl",
			"wpn_fps_pis_sparrow_g_dummy",
			"wpn_fps_pis_sparrow_m_standard",
			"wpn_fps_pis_sparrow_sl_rpl"
		},
		uses_parts = {
			"wpn_fps_pis_sparrow_b_941",
			"wpn_fps_pis_sparrow_b_rpl",
			"wpn_fps_pis_sparrow_b_comp",
			"wpn_fps_pis_sparrow_b_threaded",
			"wpn_fps_pis_sparrow_body_941",
			"wpn_fps_pis_sparrow_body_rpl",
			"wpn_fps_pis_sparrow_fl_rail",
			"wpn_fps_pis_sparrow_fl_dummy",
			"wpn_fps_pis_sparrow_g_941",
			"wpn_fps_pis_sparrow_g_cowboy",
			"wpn_fps_pis_sparrow_g_dummy",
			"wpn_fps_pis_sparrow_m_standard",
			"wpn_fps_pis_sparrow_sl_941",
			"wpn_fps_pis_sparrow_sl_rpl",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon",
			--Custom--
			"wpn_fps_pis_g18c_co_comp_2",
			"wpn_fps_pis_g18c_co_1"				
		}
	}
	self.wpn_fps_pis_x_sparrow_npc = deep_clone(self.wpn_fps_pis_x_sparrow)
	self.wpn_fps_pis_x_sparrow_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_pis_x_sparrow/wpn_fps_pis_x_sparrow_npc"
end

function WeaponFactoryTweakData:_init_x_judge()
	self.wpn_fps_pis_x_judge = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_sho_x_judge/wpn_fps_pis_x_judge",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		override = {
			wpn_fps_upg_ns_shot_shark = {parent = "slide"},
			wpn_fps_upg_ns_shot_thick = {parent = "slide"},
			wpn_fps_upg_shot_ns_king = {parent = "slide"},
			wpn_fps_upg_ns_sho_salvo_large = {parent = "slide"},
			wpn_fps_upg_ns_duck = {parent = "slide"},				
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -5,
					concealment = -7,
					spread_multi = {1, 1},	
					total_ammo_mod = -62,
					damage = 90
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			wpn_fps_upg_a_slug = {
				supported = true,
				name_id = "bm_wp_upg_a_slug",
				desc_id = "bm_wp_upg_a_slug_desc",
				stats = {
					value = 10,
					concealment = -5,
					total_ammo_mod = -25,
					damage = 30,	
					recoil = -2,
					spread = 8,
					spread_multi = {1, 1},	
					suppression = -1,
					moving_spread = 0
				},
				custom_stats = {
					muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",														
					damage_near_mul = 999,
					damage_far_mul = 999,
					rays = 1,
					armor_piercing_add = 1,
					can_shoot_through_enemy = true,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
				}
			},
			wpn_fps_upg_a_custom = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},
			wpn_fps_upg_a_custom_free = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},	
			wpn_fps_pis_judge_body_standard = {},
			wpn_fps_pis_judge_body_modern = {}
		},
		adds = {
			wpn_fps_upg_fl_ass_laser = {"wpn_fps_pis_judge_fl_adapter"},
			wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_pis_judge_fl_adapter"},
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_pis_judge_fl_adapter"},
			wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_pis_judge_fl_adapter"},
			wpn_fps_upg_fl_ass_utg = {"wpn_fps_pis_judge_fl_adapter"},
			wpn_fps_upg_o_specter = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_docter = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_eotech = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_cmore = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_acog = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_cs = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_reflex = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_spot = {"wpn_fps_pis_rage_o_adapter"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_pis_rage_o_adapter"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_pis_rage_o_adapter"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_pis_rage_o_adapter"
			}				
		},
		animations = {
			reload = "reload_right",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_left = "reload_left",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_pis_judge_body_standard",
			"wpn_fps_pis_judge_b_standard",
			"wpn_fps_pis_judge_g_standard"
		},
		uses_parts = {
			"wpn_fps_pis_judge_body_standard",
			"wpn_fps_pis_judge_b_standard",
			"wpn_fps_pis_judge_g_standard",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_shot_thick",
			"wpn_fps_upg_ns_shot_shark",
			"wpn_fps_upg_shot_ns_king",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_sho_salvo_large",
			"wpn_fps_pis_judge_b_legend",
			"wpn_fps_pis_judge_g_legend",
			"wpn_fps_upg_ns_duck",
			"wpn_fps_pis_judge_body_modern"
		}
	}
	self.wpn_fps_pis_x_judge_npc = deep_clone(self.wpn_fps_pis_x_judge)
	self.wpn_fps_pis_x_judge_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_sho_x_judge/wpn_fps_pis_x_judge_npc"
end

function WeaponFactoryTweakData:_init_x_rota()
	self.wpn_fps_sho_x_rota = {
		unit = "units/pd2_dlc_osa/weapons/wpn_fps_sho_x_rota/wpn_fps_sho_x_rota",
		optional_types = {
			"barrel_ext",
			"gadget",
			"vertical_grip"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty = "reload"
		},
		default_blueprint = {
			"wpn_fps_sho_rota_b_long",
			"wpn_fps_sho_rota_body_lower",
			"wpn_fps_sho_rota_body_upper",
			"wpn_fps_sho_rota_fg_standard",
			"wpn_fps_sho_rota_g_standard",
			"wpn_fps_sho_rota_m_standard",
			"wpn_fps_sho_rota_mag_realese",
			"wpn_fps_sho_rota_o_standard",
			"wpn_fps_smg_hajk_vg_moe"
		},
		uses_parts = {
			"wpn_fps_sho_rota_b_long",
			"wpn_fps_sho_rota_b_short",
			"wpn_fps_sho_rota_b_silencer",
			"wpn_fps_sho_rota_body_lower",
			"wpn_fps_sho_rota_body_upper",
			"wpn_fps_sho_rota_fg_standard",
			"wpn_fps_sho_rota_g_standard",
			"wpn_fps_sho_rota_m_standard",
			"wpn_fps_sho_rota_mag_realese",
			"wpn_fps_sho_rota_o_standard",
			"wpn_fps_smg_hajk_vg_moe",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_shot_thick",
			"wpn_fps_upg_ns_shot_shark",
			"wpn_fps_upg_shot_ns_king",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_sho_salvo_large",
			"wpn_fps_upg_ns_duck"
		}
	}
	self.wpn_fps_sho_x_rota.override = {
		wpn_fps_upg_a_slug = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -25,
				damage = 15,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true
			}
		},
		wpn_fps_upg_a_custom = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},
		wpn_fps_upg_a_custom_free = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				damage_near_mul = 0.75,
				damage_far_mul = 0.75,
				rays = 6
			}
		},			
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -50,
				recoil = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				damage_near_mul = 999,
				damage_far_mul = 999,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
	}		
	self.wpn_fps_sho_x_rota_npc = deep_clone(self.wpn_fps_sho_x_rota)
	self.wpn_fps_sho_x_rota_npc.unit = "units/pd2_dlc_osa/weapons/wpn_fps_sho_x_rota/wpn_fps_sho_x_rota_npc"
end

function WeaponFactoryTweakData:_init_shuno()
	self.parts.wpn_fps_lmg_shuno_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_shuno_body",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_shuno_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_shuno_m_standard",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_shuno_b_standard = {
		a_obj = "a_b",
		type = "upper_reciever",
		name_id = "bm_wp_shuno_barrel",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_shuno_b_short = {
		a_obj = "a_b",
		type = "upper_reciever",
		name_id = "bm_wp_shuno_b_short",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_short",
		texture_bundle_folder = "dmg",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = -2,
			concealment = 2
		},
		override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	}
	self.parts.wpn_fps_lmg_shuno_b_heat_short = {
		a_obj = "a_b",
		type = "upper_reciever",
		name_id = "bm_wp_shuno_b_heat_short",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_short",
		texture_bundle_folder = "dmg",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = -1,
			recoil = 1,
			value = 1
		},
		override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	}
	self.parts.wpn_fps_lmg_shuno_b_heat_long = {
		texture_bundle_folder = "dmg",
		a_obj = "a_b",
		type = "upper_reciever",
		name_id = "bm_wp_shuno_b_heat_long",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_long",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = 1,
			value = 2,
			recoil = -2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_lmg_shuno_b_dummy_long = {
		name_id = "bm_wp_shuno_b_dummy_long",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_long",
		a_obj = "a_b_dumb",
		type = "barrel"
	}
	self.parts.wpn_fps_lmg_shuno_b_dummy_short = {
		name_id = "bm_wp_shuno_b_dummy_short",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short",
		a_obj = "a_b_dumb",
		type = "barrel"
	}
	self.parts.wpn_fps_lmg_shuno_s_standard = {
		name_id = "bm_wp_shuno_s_standard",
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_s_standard",
		a_obj = "a_body",
		type = "stock"
	}
	self.parts.wpn_fps_lmg_shuno_body_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_body_standard"
	self.parts.wpn_fps_lmg_shuno_m_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_m_standard"
	self.parts.wpn_fps_lmg_shuno_s_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_s_standard"
	self.parts.wpn_fps_lmg_shuno_b_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_standard"
	self.parts.wpn_fps_lmg_shuno_b_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_short"
	self.parts.wpn_fps_lmg_shuno_b_heat_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_short"
	self.parts.wpn_fps_lmg_shuno_b_heat_long.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_long"
	self.wpn_fps_lmg_shuno = {
		unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno/wpn_fps_lmg_shuno",
		animations = {
			reload_not_empty = "reload",
			reload = "reload",
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		optional_types = {
			"gadget",
			"sight",
			"barrel_ext"
		},
		default_blueprint = {
			"wpn_fps_lmg_shuno_body_standard",
			"wpn_fps_lmg_shuno_b_standard",
			"wpn_fps_lmg_shuno_m_standard",
			"wpn_fps_lmg_shuno_s_standard",
			"wpn_fps_lmg_shuno_b_dummy_long"
		},
		uses_parts = {
			"wpn_fps_lmg_shuno_body_standard",
			"wpn_fps_lmg_shuno_m_standard",
			"wpn_fps_lmg_shuno_s_standard",
			"wpn_fps_lmg_shuno_b_standard",
			"wpn_fps_lmg_shuno_b_short",
			"wpn_fps_lmg_shuno_b_heat_long",
			"wpn_fps_lmg_shuno_b_heat_short",
			"wpn_fps_lmg_shuno_b_dummy_short",
			"wpn_fps_lmg_shuno_b_dummy_long",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg",
			--Custom--
			"wpn_fps_upg_ammo_half_that",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"					
		}
	}
	self.wpn_fps_lmg_shuno.override = {
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			stats = {
				value = 1,
				total_ammo_mod = 20,
				extra_ammo = 60,
				concealment = -2
			},
			custom_stats = {movement_speed = 0.9},	
		}
	}				
	self.wpn_fps_lmg_shuno_npc = deep_clone(self.wpn_fps_lmg_shuno)
	self.wpn_fps_lmg_shuno_npc.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno/wpn_fps_lmg_shuno_npc"
end

function WeaponFactoryTweakData:_init_system()
	self.parts.wpn_fps_fla_system_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_system_body_standard",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_fla_system_b_wtf = {
		texture_bundle_folder = "sft",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_system_b_wtf",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_b_wtf",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			concealment = 1,
			spread = -1,
			value = 1
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		}				
	}
	self.parts.wpn_fps_fla_system_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_system_body_standard",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_fla_system_body_upper = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_system_body_standard",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_body_upper",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_fla_system_dh_standard = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_system_body_standard",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_fla_system_m_high = {
		texture_bundle_folder = "sft",
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_system_m_high",
		desc_id = "bm_wp_fla_mk2_mag_well_desc_sc",
		has_description = true,	
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_m_high",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 5
		},
		custom_stats = {
			use_well_done_dot = true
		}			
	}
	self.parts.wpn_fps_fla_system_m_low = {
		texture_bundle_folder = "sft",
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_system_m_low",
		desc_id = "bm_wp_fla_mk2_mag_rare_desc_sc",
		has_description = true,	
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_m_low",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 5
		},
		custom_stats = {
			use_rare_dot = true
		}			
	}
	self.parts.wpn_fps_fla_system_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_system_body_standard",
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_fps_fla_system_m_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_fla_system_b_standard.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_b_standard"
	self.parts.wpn_fps_fla_system_b_wtf.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_b_wtf"
	self.parts.wpn_fps_fla_system_body_standard.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_body_standard"
	self.parts.wpn_fps_fla_system_body_upper.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_body_upper"
	self.parts.wpn_fps_fla_system_dh_standard.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_dh_standard"
	self.parts.wpn_fps_fla_system_m_high.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_m_high"
	self.parts.wpn_fps_fla_system_m_low.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_m_low"
	self.parts.wpn_fps_fla_system_m_standard.third_unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system_pts/wpn_third_fla_system_m_standard"
	self.wpn_fps_fla_system = {
		unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system/wpn_fps_fla_system",
		animations = {
			reload_not_empty = "reload",
			reload = "reload"
		},
		default_blueprint = {
			"wpn_fps_fla_system_b_standard",
			"wpn_fps_fla_system_body_standard",
			"wpn_fps_fla_system_body_upper",
			"wpn_fps_fla_system_dh_standard",
			"wpn_fps_fla_system_m_standard"
		},
		uses_parts = {
			"wpn_fps_fla_system_b_standard",
			"wpn_fps_fla_system_b_wtf",
			"wpn_fps_fla_system_body_standard",
			"wpn_fps_fla_system_body_upper",
			"wpn_fps_fla_system_dh_standard",
			"wpn_fps_fla_system_m_high",
			"wpn_fps_fla_system_m_low",
			"wpn_fps_fla_system_m_standard",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_utg"
		}
	}
	self.wpn_fps_fla_system_npc = deep_clone(self.wpn_fps_fla_system)
	self.wpn_fps_fla_system_npc.unit = "units/pd2_dlc_sft/weapons/wpn_fps_fla_system/wpn_fps_fla_system_npc"
end


function WeaponFactoryTweakData:_init_shepheard()
	self.parts.wpn_fps_smg_shepheard_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_shepard_b_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_body = {
		a_obj = "a_body",
		type = "foregrip",
		name_id = "bm_wp_shepheard_body_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_body_short = {
		texture_bundle_folder = "joy",
		a_obj = "a_body",
		type = "foregrip",
		dlc = "pd2_clan",
		name_id = "bm_wp_shepheard_body_short",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_body_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		override = {
			wpn_fps_smg_shepheard_b_standard = {
				third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_b_short",
				unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_b_short"
			},
			wpn_fps_smg_shepheard_o_standard = {
				third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_short",
				unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_short"
			}
		},
		supported = true,
		stats = {
			concealment = 1,
			recoil = -1,
			value = 1
		}
	}
	self.parts.wpn_fps_smg_shepheard_dh_standard = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_shepheard_dh_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_dh_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_shepheard_g_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_mag_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_shepheard_m_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_extended",
		bullet_objects = {
			amount = 30,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_mag_extended = {
		type = "magazine",
		texture_bundle_folder = "joy",
		a_obj = "a_m",
		dlc = "pd2_clan",
		name_id = "bm_wp_upg_vintage_sc",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_standard",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 20,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 1,
			extra_ammo = -10,
			reload = 2,
			concealment = 2			
		}
	}
	self.parts.wpn_fps_smg_shepheard_ns_standard = {
		parent = "barrel",
		a_obj = "a_ns",
		type = "barrel_ext",
		name_id = "bm_wp_shepheard_ns_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_ns_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_s_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_shepheard_s_standard",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_s_no = {
		texture_bundle_folder = "joy",
		dlc = "pd2_clan",
		type = "stock",
		name_id = "bm_wp_shepheard_s_no",
		a_obj = "a_s",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_no",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			concealment = 2,
			recoil = -2,
			value = 1
		}
	}
	self.parts.wpn_fps_smg_shepheard_s_adapter = {
		a_obj = "a_s",
		type = "stock_adapter",
		name_id = "bm_wp_m4_s_adapter",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_adapter",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_shepheard_bolt_standard = {
		name_id = "bm_wp_ak_s_skfoldable",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_bolt_standard",
		a_obj = "a_bolt",
		type = "bolt"
	}
	self.parts.wpn_fps_smg_shepheard_o_standard = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_ak_s_skfoldable",
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_standard",
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
	}
	self.parts.wpn_fps_smg_shepheard_b_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_b_standard"
	self.parts.wpn_fps_smg_shepheard_body.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_body"
	self.parts.wpn_fps_smg_shepheard_body_short.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_body_short"
	self.parts.wpn_fps_smg_shepheard_dh_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_dh_standard"
	self.parts.wpn_fps_smg_shepheard_g_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_g_standard"
	self.parts.wpn_fps_smg_shepheard_mag_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_mag_standard"
	self.parts.wpn_fps_smg_shepheard_mag_extended.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_mag_extended"
	self.parts.wpn_fps_smg_shepheard_ns_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_ns_standard"
	self.parts.wpn_fps_smg_shepheard_s_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_s_standard"
	self.parts.wpn_fps_smg_shepheard_s_adapter.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_s_adapter"
	self.parts.wpn_fps_smg_shepheard_bolt_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_bolt_standard"
	self.parts.wpn_fps_smg_shepheard_o_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_standard"
	self.wpn_fps_smg_shepheard = {
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard/wpn_fps_smg_shepheard",
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty = "reload_not_empty"
		},
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		stock_adapter = "wpn_fps_smg_shepheard_s_adapter",
		default_blueprint = {
			"wpn_fps_smg_shepheard_b_standard",
			"wpn_fps_smg_shepheard_body",
			"wpn_fps_smg_shepheard_mag_standard",
			"wpn_fps_smg_shepheard_dh_standard",
			"wpn_fps_smg_shepheard_ns_standard",
			"wpn_fps_smg_shepheard_s_standard",
			"wpn_fps_smg_shepheard_g_standard",
			"wpn_fps_smg_shepheard_bolt_standard",
			"wpn_fps_smg_shepheard_o_standard"
		},
		uses_parts = {
			"wpn_fps_smg_shepheard_b_standard",
			"wpn_fps_smg_shepheard_body",
			"wpn_fps_smg_shepheard_body_short",
			"wpn_fps_smg_shepheard_g_standard",
			"wpn_fps_smg_shepheard_dh_standard",
			"wpn_fps_smg_shepheard_ns_standard",
			"wpn_fps_smg_shepheard_s_standard",
			"wpn_fps_smg_shepheard_s_no",
			"wpn_fps_smg_shepheard_s_adapter",
			"wpn_fps_smg_shepheard_mag_standard",
			"wpn_fps_smg_shepheard_mag_extended",
			"wpn_fps_smg_shepheard_bolt_standard",
			"wpn_fps_smg_shepheard_o_standard",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ak_ns_ak105",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_m4_s_standard_vanilla",
			"wpn_fps_upg_m4_s_pts",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1",
			--Custom--
			"wpn_fps_upg_m4_s_standard",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_shepheard_npc = deep_clone(self.wpn_fps_smg_shepheard)
	self.wpn_fps_smg_shepheard_npc.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard/wpn_fps_smg_shepheard_npc"
end	

function WeaponFactoryTweakData:_init_x_shepheard()
	self.parts.wpn_fps_smg_shepheard_s_no_vanilla = deep_clone(self.parts.wpn_fps_smg_shepheard_s_no)
	self.parts.wpn_fps_smg_shepheard_s_no_vanilla.stats = nil
	self.parts.wpn_fps_smg_shepheard_s_no_vanilla.pcs = nil
	self.wpn_fps_smg_x_shepheard = {
		unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_x_shepheard/wpn_fps_smg_x_shepheard",
		optional_types = {
			"barrel_ext",
			"gadget",
			"vertical_grip"
		},
		override = {wpn_fps_smg_shepheard_mag_extended = {supported = true,stats = {
			value = 1,
			extra_ammo = -20,
			reload = 2,
			concealment = 2		
		}}},
		default_blueprint = {
			"wpn_fps_smg_shepheard_b_standard",
			"wpn_fps_smg_shepheard_body",
			"wpn_fps_smg_shepheard_mag_standard",
			"wpn_fps_smg_shepheard_dh_standard",
			"wpn_fps_smg_shepheard_ns_standard",
			"wpn_fps_smg_shepheard_s_no_vanilla",
			"wpn_fps_smg_shepheard_g_standard",
			"wpn_fps_smg_shepheard_bolt_standard",
			"wpn_fps_smg_shepheard_o_standard"
		},
		uses_parts = {
			"wpn_fps_smg_shepheard_b_standard",
			"wpn_fps_smg_shepheard_body",
			"wpn_fps_smg_shepheard_body_short",
			"wpn_fps_smg_shepheard_g_standard",
			"wpn_fps_smg_shepheard_dh_standard",
			"wpn_fps_smg_shepheard_ns_standard",
			"wpn_fps_smg_shepheard_s_no_vanilla",
			"wpn_fps_smg_shepheard_mag_standard",
			"wpn_fps_smg_shepheard_mag_extended",
			"wpn_fps_smg_shepheard_bolt_standard",
			"wpn_fps_smg_shepheard_o_standard",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ak_ns_ak105",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_smg_x_shepheard_npc = deep_clone(self.wpn_fps_smg_x_shepheard)
	self.wpn_fps_smg_x_shepheard_npc.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_x_shepheard/wpn_fps_smg_x_shepheard_npc"
end	

function WeaponFactoryTweakData:_init_komodo()
	self.parts.wpn_fps_ass_komodo_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_komodo_barrel_standard",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_body = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_komodo_body",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_body",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_grip_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_komodo_grip",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_grip_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_ns = {
		a_obj = "a_ns",
		type = "barrel_ext",
		name_id = "bm_wp_komodo_nozzle",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_ns",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_dh = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "bm_wp_komodo_dh",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_dh",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_o_flipups_down = {
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_komodo_o_flipups_down",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_o_flipups_down",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_komodo_o_flipups_up = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_komodo_o_flipups_up",
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_fps_ass_komodo_o_flipups_up",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_ass_komodo_o_flipups_down",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_45steel"				
		}
	}
	self.parts.wpn_fps_ass_komodo_b_standard.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_b_standard"
	self.parts.wpn_fps_ass_komodo_body.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_body"
	self.parts.wpn_fps_ass_komodo_grip_standard.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_grip_standard"
	self.parts.wpn_fps_ass_komodo_ns.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_ns"
	self.parts.wpn_fps_ass_komodo_dh.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_dh"
	self.parts.wpn_fps_ass_komodo_o_flipups_up.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_o_flipups_up"
	self.parts.wpn_fps_ass_komodo_o_flipups_down.third_unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo_pts/wpn_third_ass_komodo_o_flipups_down"
	self.wpn_fps_ass_komodo = {
		unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo",
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		},
		adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_docter = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_eotech = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_cmore = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_reflex = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_acog = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_cs = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_spot = {"wpn_fps_ass_komodo_o_flipups_down"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_ass_komodo_o_flipups_down"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_ass_komodo_o_flipups_down"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_ass_komodo_o_flipups_down"
			}				
		},
		default_blueprint = {
			"wpn_fps_ass_komodo_b_standard",
			"wpn_fps_ass_komodo_body",
			"wpn_fps_ass_komodo_grip_standard",
			"wpn_fps_ass_komodo_ns",
			"wpn_fps_ass_komodo_dh",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_ass_komodo_o_flipups_up"
		},
		uses_parts = {
			"wpn_fps_ass_komodo_b_standard",
			"wpn_fps_ass_komodo_body",
			"wpn_fps_ass_komodo_grip_standard",
			"wpn_fps_ass_komodo_ns",
			"wpn_fps_ass_komodo_dh",
			"wpn_fps_ass_komodo_o_flipups_up",
			"wpn_fps_ass_komodo_o_flipups_down",
			"wpn_fps_smg_hajk_vg_moe",
			"wpn_fps_m4_uupg_m_std_vanilla",
			--"wpn_fps_upg_m4_m_drum",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_m4_upg_m_quick",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2",
			"wpn_fps_upg_ns_ass_smg_v6",
			"wpn_fps_upg_o_sig",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1",
			"wpn_fps_upg_o_45steel",				
			"wpn_fps_upg_i_slower_rof",
			"wpn_fps_upg_i_faster_rof"	
		}
	}
	self.wpn_fps_ass_komodo_npc = deep_clone(self.wpn_fps_ass_komodo)
	self.wpn_fps_ass_komodo_npc.unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo_npc"
end	

function WeaponFactoryTweakData:_init_elastic()
	self.parts.wpn_fps_bow_elastic_bow = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_elastic_body_standard",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_bow",
		supported = true,
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			charge = "charge"
		}
	}
	self.parts.wpn_fps_bow_elastic_body_regular = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_elastic_body_standard",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_body_regular",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_body_tactic = {
		texture_bundle_folder = "ram",
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_elastic_body_tactic",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_body_tactic",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 0
		}
	}
	self.parts.wpn_fps_bow_elastic_g_1 = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_elastic_g_standard",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_g_1",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_g_2 = {
		texture_bundle_folder = "ram",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_elastic_g_wood",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_g_2",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_bow_elastic_g_3 = {
		texture_bundle_folder = "ram",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_elastic_g_ergo",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_g_3",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 0
		}
	}
	self.parts.wpn_fps_bow_elastic_pin = {
		a_obj = "a_body",
		type = "ejector",
		name_id = "bm_wp_elastic_body_standard",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_pin",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_rail = {
		a_obj = "a_o",
		type = "rail",
		name_id = "bm_wp_elastic_rail",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_rail",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_whisker = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_elastic_whisker",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_whisker",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_sight = {
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_ecp_meter_right",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_sight",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
	}
	self.parts.wpn_fps_bow_elastic_m_standard = {
		parent = "lower_reciever",
		type = "ammo",
		name_id = "bm_wp_elastic_m_standard",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_m_standard",
		a_obj = "a_m",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_bow_elastic_m_explosive = {
		is_a_unlockable = true,
		texture_bundle_folder = "ram",
		a_obj = "a_m",
		sub_type = "ammo_explosive",
		type = "ammo",
		parent = "lower_reciever",
		name_id = "bm_wp_elastic_m_explosive",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_m_explosive",
		pcs = {},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {damage = 60, total_ammo_mod = -40, spread = -3},
		custom_stats = {
			launcher_grenade = "elastic_arrow_exp"
		}
	}
	self.parts.wpn_fps_bow_elastic_m_poison = {
		is_a_unlockable = true,
		texture_bundle_folder = "ram",
		a_obj = "a_m",
		sub_type = "ammo_poison",
		type = "ammo",
		parent = "lower_reciever",
		name_id = "bm_wp_elastic_m_poison",
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_fps_bow_elastic_m_poison",
		pcs = {},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {damage = -15, total_ammo_mod = 0},
		custom_stats = {
			launcher_grenade = "elastic_arrow_poison",
			dot_data = {
				type = "poison",
				custom_data = {}
			}
		}
	}
	self.parts.wpn_fps_bow_elastic_body_regular.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_body_regular"
	self.parts.wpn_fps_bow_elastic_bow.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_bow"
	self.parts.wpn_fps_bow_elastic_body_tactic.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_body_tactic"
	self.parts.wpn_fps_bow_elastic_g_1.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_g_1"
	self.parts.wpn_fps_bow_elastic_g_2.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_g_2"
	self.parts.wpn_fps_bow_elastic_g_3.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_g_3"
	self.parts.wpn_fps_bow_elastic_pin.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_pin"
	self.parts.wpn_fps_bow_elastic_rail.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_rail"
	self.parts.wpn_fps_bow_elastic_whisker.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_whisker"
	self.parts.wpn_fps_bow_elastic_sight.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_sight"
	self.parts.wpn_fps_bow_elastic_m_standard.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_m_standard"
	self.parts.wpn_fps_bow_elastic_m_explosive.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_m_explosive"
	self.parts.wpn_fps_bow_elastic_m_poison.third_unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic_pts/wpn_third_bow_elastic_m_poison"
	self.wpn_fps_bow_elastic = {
		unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic",
		optional_types = {"ammo"},
		adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_docter = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_eotech = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_cmore = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_acog = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_cs = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_reflex = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_spot = {"wpn_fps_bow_elastic_rail"},
			wpn_fps_upg_o_bmg = {
				"wpn_fps_bow_elastic_rail"
			},
			wpn_fps_upg_o_fc1 = {
				"wpn_fps_bow_elastic_rail"
			},
			wpn_fps_upg_o_uh = {
				"wpn_fps_bow_elastic_rail"
			}				
		},
		default_blueprint = {
			"wpn_fps_bow_elastic_bow",
			"wpn_fps_bow_elastic_body_regular",
			"wpn_fps_bow_elastic_g_1",
			"wpn_fps_bow_elastic_pin",
			"wpn_fps_bow_elastic_whisker",
			"wpn_fps_bow_elastic_m_standard",
			"wpn_fps_bow_elastic_sight"
		},
		uses_parts = {
			"wpn_fps_bow_elastic_bow",
			"wpn_fps_bow_elastic_body_regular",
			"wpn_fps_bow_elastic_body_tactic",
			"wpn_fps_bow_elastic_g_1",
			"wpn_fps_bow_elastic_g_2",
			"wpn_fps_bow_elastic_g_3",
			"wpn_fps_bow_elastic_pin",
			"wpn_fps_bow_elastic_rail",
			"wpn_fps_bow_elastic_whisker",
			"wpn_fps_bow_elastic_m_standard",
			"wpn_fps_bow_elastic_m_explosive",
			"wpn_fps_bow_elastic_m_poison",
			"wpn_fps_bow_elastic_sight",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_bmg",
			"wpn_fps_upg_o_uh",
			"wpn_fps_upg_o_fc1"				
		}
	}
	self.wpn_fps_bow_elastic_npc = deep_clone(self.wpn_fps_bow_elastic)
	self.wpn_fps_bow_elastic_npc.unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic_npc"
	self.wpn_fps_bow_elastic_npc.skip_thq_parts = true
end	

function WeaponFactoryTweakData:_init_legacy()
	self.parts.wpn_fps_pis_legacy_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_b_threaded = {
		texture_bundle_folder = "khp",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_legacy_b_threaded",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_b_threaded",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_legacy_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_firepin_standard = {
		a_obj = "a_firepin",
		type = "firepin",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_firepin_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_g_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_g_wood = {
		texture_bundle_folder = "khp",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_legacy_g_wood",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_g_wood",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 0
		}
	}
	self.parts.wpn_fps_pis_legacy_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_m_standard",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_safety_standard = {
		a_obj = "a_safety",
		type = "safety",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_safety_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_sl_standard = {
		a_obj = "a_sl",
		type = "slide",
		name_id = "bm_wp_legacy_b_standard",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_sl_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_fl_mount = {
		a_obj = "a_fl",
		type = "extra",
		name_id = "bm_wp_serbu_s_solid_short",
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_fl_mount",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_legacy_b_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_b_standard"
	self.parts.wpn_fps_pis_legacy_b_threaded.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_b_threaded"
	self.parts.wpn_fps_pis_legacy_body_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_body_standard"
	self.parts.wpn_fps_pis_legacy_firepin_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_firepin_standard"
	self.parts.wpn_fps_pis_legacy_g_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_g_standard"
	self.parts.wpn_fps_pis_legacy_g_wood.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_g_wood"
	self.parts.wpn_fps_pis_legacy_m_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_m_standard"
	self.parts.wpn_fps_pis_legacy_safety_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_safety_standard"
	self.parts.wpn_fps_pis_legacy_sl_standard.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_sl_standard"
	self.parts.wpn_fps_pis_legacy_fl_mount.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_fl_mount"
	self.wpn_fps_pis_legacy = {
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy/wpn_fps_pis_legacy",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_legacy_fl_mount"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_o_rms = {parent = "slide"},
			wpn_fps_upg_o_rikt = {parent = "slide"},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			}				
		},
		default_blueprint = {
			"wpn_fps_pis_legacy_b_standard",
			"wpn_fps_pis_legacy_body_standard",
			"wpn_fps_pis_legacy_firepin_standard",
			"wpn_fps_pis_legacy_g_standard",
			"wpn_fps_pis_legacy_m_standard",
			"wpn_fps_pis_legacy_safety_standard",
			"wpn_fps_pis_legacy_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_legacy_b_standard",
			"wpn_fps_pis_legacy_b_threaded",
			"wpn_fps_pis_legacy_body_standard",
			"wpn_fps_pis_legacy_firepin_standard",
			"wpn_fps_pis_legacy_g_standard",
			"wpn_fps_pis_legacy_g_wood",
			"wpn_fps_pis_legacy_m_standard",
			"wpn_fps_pis_legacy_safety_standard",
			"wpn_fps_pis_legacy_sl_standard",
			"wpn_fps_pis_legacy_fl_mount",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",				
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"
		}
	}
	self.wpn_fps_pis_legacy_npc = deep_clone(self.wpn_fps_pis_legacy)
	self.wpn_fps_pis_legacy_npc.unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy/wpn_fps_pis_legacy_npc"
end	

function WeaponFactoryTweakData:_init_x_legacy()
	self.wpn_fps_pis_x_legacy = {
		unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_x_legacy/wpn_fps_pis_x_legacy",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		adds = {
			wpn_fps_upg_fl_pis_laser = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_tlr1 = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_crimson = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_x400v = {"wpn_fps_pis_legacy_fl_mount"},
			wpn_fps_upg_fl_pis_m3x = {"wpn_fps_pis_legacy_fl_mount"}
		},
		override = {
			wpn_fps_upg_o_rmr = {parent = "slide"},
			wpn_fps_upg_o_rms = {parent = "slide"},
			wpn_fps_upg_o_rikt = {parent = "slide"},				
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},					
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			}		
		},
		animations = {
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty_left = "reload_not_empty_left",
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_pis_legacy_b_standard",
			"wpn_fps_pis_legacy_body_standard",
			"wpn_fps_pis_legacy_firepin_standard",
			"wpn_fps_pis_legacy_g_standard",
			"wpn_fps_pis_legacy_m_standard",
			"wpn_fps_pis_legacy_safety_standard",
			"wpn_fps_pis_legacy_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_legacy_b_standard",
			"wpn_fps_pis_legacy_b_threaded",
			"wpn_fps_pis_legacy_body_standard",
			"wpn_fps_pis_legacy_firepin_standard",
			"wpn_fps_pis_legacy_g_standard",
			"wpn_fps_pis_legacy_g_wood",
			"wpn_fps_pis_legacy_m_standard",
			"wpn_fps_pis_legacy_safety_standard",
			"wpn_fps_pis_legacy_sl_standard",
			"wpn_fps_pis_legacy_fl_mount",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",					
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"				
		}
	}
	self.wpn_fps_pis_x_legacy_npc = deep_clone(self.wpn_fps_pis_x_legacy)
	self.wpn_fps_pis_x_legacy_npc.unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_x_legacy/wpn_fps_pis_x_legacy_npc"
end	
	
function WeaponFactoryTweakData:_init_coach()
	self.parts.wpn_fps_sho_coach_barrel_lock = {
		name_id = "bm_wp_coach_barrel_lock",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_barrel_lock",
		a_obj = "a_barrel_lock",
		type = "barrel_lock"
	}
	self.parts.wpn_fps_sho_coach_right_hammer = {
		name_id = "bm_wp_coach_right_hammer",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_right_hammer",
		a_obj = "a_right_hammer",
		type = "right_hammer"
	}
	self.parts.wpn_fps_sho_coach_left_hammer = {
		name_id = "bm_wp_coach_left_hammer",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_left_hammer",
		a_obj = "a_left_hammer",
		type = "left_hammer"
	}
	self.parts.wpn_fps_sho_coach_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_coach_b_standard",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_b_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_coach_b_short = {
		texture_bundle_folder = "sdb",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_coach_b_short",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_b_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 10,
			spread = -2,
			concealment = 2
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		}			
	}
	self.parts.wpn_fps_sho_coach_s_long = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_coach_s_long",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_s_long",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_coach_s_short = {
		texture_bundle_folder = "sdb",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_coach_s_short",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_s_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 10,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_sho_coach_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_coach_body_standard",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_body_standard",
		supported = true,
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_coach_right_slug = {
		name_id = "bm_wp_coach_right_slug",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_right_slug",
		a_obj = "a_right_slug",
		type = "right_slug"
	}
	self.parts.wpn_fps_sho_coach_left_slug = {
		name_id = "bm_wp_coach_left_slug",
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_left_slug",
		a_obj = "a_left_slug",
		type = "left_slug"
	}
	self.parts.wpn_fps_sho_coach_barrel_lock.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_barrel_lock"
	self.parts.wpn_fps_sho_coach_right_hammer.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_right_hammer"
	self.parts.wpn_fps_sho_coach_left_hammer.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_left_hammer"
	self.parts.wpn_fps_sho_coach_b_standard.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_b_standard"
	self.parts.wpn_fps_sho_coach_b_short.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_b_short"
	self.parts.wpn_fps_sho_coach_s_long.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_s_long"
	self.parts.wpn_fps_sho_coach_s_short.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_s_short"
	self.parts.wpn_fps_sho_coach_body_standard.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_body_standard"
	self.parts.wpn_fps_sho_coach_right_slug.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_right_slug"
	self.parts.wpn_fps_sho_coach_left_slug.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_left_slug"
	self.wpn_fps_sho_coach = {
		unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach/wpn_fps_sho_coach",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		optional_types = {},
		override = {
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -5,
					spread_multi = {1, 1},	
					concealment = -7,
					total_ammo_mod = -60,
					damage = 90
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			wpn_fps_upg_a_slug = {
				supported = true,
				name_id = "bm_wp_upg_a_slug",
				desc_id = "bm_wp_upg_a_slug_desc",
				stats = {
					value = 10,
					concealment = -5,
					total_ammo_mod = -25,
					damage = 30,	
					recoil = -2,
					spread = 8,
					spread_multi = {1, 1},	
					suppression = -1
				},
				custom_stats = {
					muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",									
					damage_near_mul = 999,
					damage_far_mul = 999,
					rays = 1,
					armor_piercing_add = 1,
					can_shoot_through_enemy = true,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
				},
			},
			wpn_fps_upg_a_custom = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},
			wpn_fps_upg_a_custom_free = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			}	
		},
		default_blueprint = {
			"wpn_fps_sho_coach_b_standard",
			"wpn_fps_sho_coach_body_standard",
			"wpn_fps_sho_coach_right_hammer",
			"wpn_fps_sho_coach_left_hammer",
			"wpn_fps_sho_coach_barrel_lock",
			"wpn_fps_sho_coach_s_long",
			"wpn_fps_sho_coach_right_slug",
			"wpn_fps_sho_coach_left_slug"
		},
		uses_parts = {
			"wpn_fps_sho_coach_b_short",
			"wpn_fps_sho_coach_s_short",
			"wpn_fps_sho_coach_b_standard",
			"wpn_fps_sho_coach_body_standard",
			"wpn_fps_sho_coach_right_hammer",
			"wpn_fps_sho_coach_left_hammer",
			"wpn_fps_sho_coach_barrel_lock",
			"wpn_fps_sho_coach_s_long",
			"wpn_fps_sho_coach_right_slug",
			"wpn_fps_sho_coach_left_slug"
		}
	}
	self.wpn_fps_sho_coach_npc = deep_clone(self.wpn_fps_sho_coach)
	self.wpn_fps_sho_coach_npc.unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach/wpn_fps_sho_coach_npc"
end	

--Cartel Optics Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_mwm", "resmod_mwm", function(self)

	self.parts.wpn_fps_upg_ns_ass_smg_v6.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_v6.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_v6.stats = {
		value = 5,
		suppression = -4,
		spread = -2,
		recoil = 2
	}
	
	--Skeletal Grip
	self.parts.wpn_fps_upg_g_m4_surgeon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_g_m4_surgeon.supported = true
	self.parts.wpn_fps_upg_g_m4_surgeon.stats = {
		value = 2,
		recoil = -2,
		concealment = 2
	}
		
	--Magnifier
	self.parts.wpn_fps_upg_o_sig.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_sig.supported = true
	self.parts.wpn_fps_upg_o_sig.stats = {
		value = 2,
		gadget_zoom = 9,
		concealment = -1
	}
	self.parts.wpn_fps_upg_o_sig.perks = {
		"gadget"
	}
	self.parts.wpn_fps_upg_o_sig.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod)
	
	
	self.parts.wpn_fps_upg_o_bmg.reticle_obj = nil
	self.parts.wpn_fps_upg_o_bmg.has_description = true
	self.parts.wpn_fps_upg_o_bmg.desc_id = "bm_wp_upg_o_large"
	self.parts.wpn_fps_upg_o_bmg.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_bmg.supported = true
	self.parts.wpn_fps_upg_o_bmg.stats = {
		zoom = 30,
		value = 6
	}
	self.parts.wpn_fps_upg_o_bmg.perks = {
		"scope"
	}
	
	self.parts.wpn_fps_upg_o_rms.has_description = true
	self.parts.wpn_fps_upg_o_rms.desc_id = "bm_wp_upg_o_small"
	self.parts.wpn_fps_upg_o_rms.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_rms.supported = true
	self.parts.wpn_fps_upg_o_rms.stats = {
		zoom = 2,
		value = 6
	}
	self.parts.wpn_fps_upg_o_rms.perks = {
		"scope"
	}
	
	self.parts.wpn_fps_upg_o_rikt.has_description = true
	self.parts.wpn_fps_upg_o_rikt.desc_id = "bm_wp_upg_o_cs_desc"
	self.parts.wpn_fps_upg_o_rikt.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_rikt.supported = true
	self.parts.wpn_fps_upg_o_rikt.stats = {
		zoom = 5,
		value = 6
	}
	self.parts.wpn_fps_upg_o_rikt.perks = {
		"scope"
	}
	
	self.parts.wpn_fps_upg_o_uh.has_description = true
	self.parts.wpn_fps_upg_o_uh.desc_id = "bm_wp_upg_o_small"
	self.parts.wpn_fps_upg_o_uh.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_uh.supported = true
	self.parts.wpn_fps_upg_o_uh.stats = {
		value = 3,
		zoom = 2
	}
	self.parts.wpn_fps_upg_o_uh.perks = {
		"scope"
	}
	self.parts.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_upg_o_fc1.has_description = true
	self.parts.wpn_fps_upg_o_fc1.desc_id = "bm_wp_upg_o_tiny"
	self.parts.wpn_fps_upg_o_fc1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_fc1.supported = true
	self.parts.wpn_fps_upg_o_fc1.stats = {
		zoom = 1,
		value = 6
	}
	self.parts.wpn_fps_upg_o_fc1.perks = {
		"scope"
	}
	self.parts.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_upg_o_45steel.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_45steel.supported = true
	self.parts.wpn_fps_upg_o_45steel.stats = {
		value = 1,
		gadget_zoom = 2
	}
	self.parts.wpn_fps_upg_o_45steel.perks = {
		"gadget"
	}
	
	self.parts.wpn_fps_upg_ns_pis_typhoon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_typhoon.supported = true
	self.parts.wpn_fps_upg_ns_pis_typhoon.stats = {
		value = 5,
		suppression = -4,
		spread = -2,
		recoil = 2
	}

end)

function WeaponFactoryTweakData:_init_beer()
	self.parts.wpn_fps_pis_beer_b_robo = {
		type = "barrel",
		texture_bundle_folder = "afp",
		a_obj = "a_b",
		dlc = "afp",
		name_id = "bm_wp_beer_b_robo",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_b_robo",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = 1,
			recoil = -1,
			value = 8,
			concealment = -1
		},
		forbids = {
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt"
		},			
		override = {
			wpn_fps_pis_beer_o_std = {
				unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_o_robo"
			},
			wpn_fps_pis_beer_body_modern = {
				unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_body_robo"
			},
			wpn_fps_upg_fl_pis_laser = {
				a_obj = "a_fl_2"
			},
			wpn_fps_upg_fl_pis_tlr1 = {
				a_obj = "a_fl_2"
			},
			wpn_fps_upg_fl_pis_m3x = {
				a_obj = "a_fl_2"
			},
			wpn_fps_upg_fl_pis_crimson = {
				a_obj = "a_fl_2"
			},
			wpn_fps_upg_fl_pis_x400v = {
				a_obj = "a_fl_2"
			}
		},
		stance_mod = {
			wpn_fps_pis_beer = {
				translation = Vector3(0, 0, -1.5)
			}
		}
	}
	self.parts.wpn_fps_pis_beer_b_std = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_b_std",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_body_modern = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_body_modern",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_body_robo = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_body_robo",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_dh_hammer = {
		a_obj = "a_dh",
		type = "drag_handle",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_dh_hammer",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_g_robo = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_beer_g_robo",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_g_robo",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_beer_g_lux = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_beer_g_lux",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_g_lux",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = -1,
			value = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_pis_beer_g_std = {
		a_obj = "a_g",
		type = "grip",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_g_std",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_m_std = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_m_std",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_m_extended = {
		a_obj = "a_m",
		texture_bundle_folder = "afp",
		type = "magazine",
		dlc = "afp",
		name_id = "bm_wp_beer_m_extended",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_m_extended",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			extra_ammo = 5,
			value = 3,
			reload = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_beer_o_std = {
		texture_bundle_folder = "afp",
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_beer_s_standard",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_o_std",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_o_robo = {
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_beer_s_standard",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_o_robo",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_s_std = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "stock",
		name_id = "bm_wp_beer_s_std",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_s_std",
		a_obj = "a_s",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 7,
			recoil = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_beer_sl_std = {
		a_obj = "a_sl",
		type = "slide",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_sl_std",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_beer_b_robo.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_b_robo"
	self.parts.wpn_fps_pis_beer_o_robo.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_o_robo"
	self.parts.wpn_fps_pis_beer_g_robo.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_g_robo"
	self.parts.wpn_fps_pis_beer_g_lux.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_g_lux"
	self.parts.wpn_fps_pis_beer_g_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_g_std"
	self.parts.wpn_fps_pis_beer_b_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_b_std"
	self.parts.wpn_fps_pis_beer_sl_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_sl_std"
	self.parts.wpn_fps_pis_beer_m_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_m_std"
	self.parts.wpn_fps_pis_beer_m_extended.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_m_extended"
	self.parts.wpn_fps_pis_beer_s_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_s_std"
	self.parts.wpn_fps_pis_beer_body_modern.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_body_modern"
	self.parts.wpn_fps_pis_beer_body_robo.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_body_robo"
	self.parts.wpn_fps_pis_beer_dh_hammer.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_dh_hammer"
	self.parts.wpn_fps_pis_beer_o_std.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_third_pis_beer_o_std"
	self.wpn_fps_pis_beer = {
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer/wpn_fps_pis_beer",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {
				parent = "slide"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
		},
		default_blueprint = {
			"wpn_fps_pis_beer_b_std",
			"wpn_fps_pis_beer_body_modern",
			"wpn_fps_pis_beer_dh_hammer",
			"wpn_fps_pis_beer_g_std",
			"wpn_fps_pis_beer_m_std",
			"wpn_fps_pis_beer_o_std",
			"wpn_fps_pis_beer_sl_std"
		},
		uses_parts = {
			"wpn_fps_pis_beer_b_std",
			"wpn_fps_pis_beer_b_robo",
			"wpn_fps_pis_beer_body_modern",
			"wpn_fps_pis_beer_dh_hammer",
			"wpn_fps_pis_beer_g_std",
			"wpn_fps_pis_beer_g_lux",
			"wpn_fps_pis_beer_g_robo",
			"wpn_fps_pis_beer_m_std",
			"wpn_fps_pis_beer_m_extended",
			"wpn_fps_pis_beer_o_std",
			"wpn_fps_pis_beer_sl_std",
			"wpn_fps_pis_beer_s_std",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"					
		}
	}
	self.wpn_fps_pis_beer_npc = deep_clone(self.wpn_fps_pis_beer)
	self.wpn_fps_pis_beer_npc.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer/wpn_fps_pis_beer_npc"
end	

function WeaponFactoryTweakData:_init_czech()
	self.parts.wpn_fps_pis_czech_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_b_standard",
		supported = true,
		stats = {
			value = 1
		},
		adds = {
			"wpn_fps_pis_czech_ns_standard"
		},
		forbids = {
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_fl_pis_m3x"
		}
	}
	self.parts.wpn_fps_pis_czech_b_long = {
		type = "barrel",
		texture_bundle_folder = "afp",
		a_obj = "a_b",
		dlc = "afp",
		name_id = "bm_wp_czech_b_long",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_b_long",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = 1,
			value = 1,
			recoil = -1,
			concealment = -1
		},
		forbids = {
			"wpn_fps_pis_czech_ns_standard"
		}
	}
	self.parts.wpn_fps_pis_czech_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_body_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_czech_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_g_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_czech_g_sport = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_czech_g_sport",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_g_sport",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			recoil = 1,
			value = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_czech_g_luxury = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_czech_g_luxury",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_g_luxury",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_czech_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_m_standard",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_czech_m_extended = {
		a_obj = "a_m",
		texture_bundle_folder = "afp",
		type = "magazine",
		dlc = "afp",
		name_id = "bm_wp_czech_m_extended",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_m_extended",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 1,
			reload = -1,
			extra_ammo = 5,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_czech_s_standard = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "stock",
		name_id = "bm_wp_czech_s_standard",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_s_standard",
		a_obj = "a_s",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 4,
			recoil = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_czech_sl_standard = {
		a_obj = "a_sl",
		type = "slide",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_sl_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_czech_ns_standard = {
		parent = "barrel",
		a_obj = "a_ns",
		type = "barrel_ext",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_fps_pis_czech_ns_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_czech_b_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_b_standard"
	self.parts.wpn_fps_pis_czech_body_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_body_standard"
	self.parts.wpn_fps_pis_czech_g_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_g_standard"
	self.parts.wpn_fps_pis_czech_m_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_m_standard"
	self.parts.wpn_fps_pis_czech_s_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_s_standard"
	self.parts.wpn_fps_pis_czech_sl_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_sl_standard"
	self.parts.wpn_fps_pis_czech_ns_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_ns_standard"
	self.parts.wpn_fps_pis_czech_g_sport.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_g_sport"
	self.parts.wpn_fps_pis_czech_g_luxury.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_g_luxury"
	self.parts.wpn_fps_pis_czech_m_extended.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_m_extended"
	self.parts.wpn_fps_pis_czech_b_long.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech_pts/wpn_third_pis_czech_b_long"
	self.wpn_fps_pis_czech = {
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech/wpn_fps_pis_czech",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {
				parent = "slide"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			}				
		},
		default_blueprint = {
			"wpn_fps_pis_czech_b_standard",
			"wpn_fps_pis_czech_body_standard",
			"wpn_fps_pis_czech_g_standard",
			"wpn_fps_pis_czech_m_standard",
			"wpn_fps_pis_czech_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_czech_b_standard",
			"wpn_fps_pis_czech_b_long",
			"wpn_fps_pis_czech_body_standard",
			"wpn_fps_pis_czech_g_standard",
			"wpn_fps_pis_czech_g_sport",
			"wpn_fps_pis_czech_g_luxury",
			"wpn_fps_pis_czech_m_standard",
			"wpn_fps_pis_czech_m_extended",
			"wpn_fps_pis_czech_sl_standard",
			"wpn_fps_pis_czech_ns_standard",
			"wpn_fps_pis_czech_s_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"					
		}
	}
	self.wpn_fps_pis_czech_npc = deep_clone(self.wpn_fps_pis_czech)
	self.wpn_fps_pis_czech_npc.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_czech/wpn_fps_pis_czech_npc"
end	

function WeaponFactoryTweakData:_init_x_czech()
	self.wpn_fps_pis_x_czech = {
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_x_czech/wpn_fps_pis_x_czech",
		override = {
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_czech_m_extended = {
				supported = true,
				stats = {
					value = 1,
					reload = -1,
					extra_ammo = 10,
					concealment = -1
				}
			}
		},
		animations = {
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty_left = "reload_not_empty_left",
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			magazine_empty = "last_recoil"
		},
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		default_blueprint = {
			"wpn_fps_pis_czech_b_standard",
			"wpn_fps_pis_czech_body_standard",
			"wpn_fps_pis_czech_g_standard",
			"wpn_fps_pis_czech_m_standard",
			"wpn_fps_pis_czech_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_czech_b_standard",
			"wpn_fps_pis_czech_b_long",
			"wpn_fps_pis_czech_body_standard",
			"wpn_fps_pis_czech_g_standard",
			"wpn_fps_pis_czech_g_sport",
			"wpn_fps_pis_czech_g_luxury",
			"wpn_fps_pis_czech_m_standard",
			"wpn_fps_pis_czech_m_extended",
			"wpn_fps_pis_czech_sl_standard",
			"wpn_fps_pis_czech_ns_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon",
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"				
		}
	}
	self.wpn_fps_pis_x_czech_npc = deep_clone(self.wpn_fps_pis_x_czech)
	self.wpn_fps_pis_x_czech_npc.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_x_czech/wpn_fps_pis_x_czech_npc"
end	

function WeaponFactoryTweakData:_init_stech()
	self.parts.wpn_fps_pis_stech_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_b_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_stech_b_long = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "barrel",
		name_id = "bm_wp_stech_b_long",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_b_long",
		a_obj = "a_b",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			spread = 1,
			value = 5,
			concealment = -1,
			recoil = -1
		}
	}
	self.parts.wpn_fps_pis_stech_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_body_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_stech_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_g_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_stech_g_luxury = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_stech_g_luxury",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_g_luxury",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			recoil = 1,
			value = 4,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_stech_g_tactical = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "grip",
		name_id = "bm_wp_stech_g_tactical",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_g_tactical",
		a_obj = "a_g",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 3,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_stech_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_m_standard",
		bullet_objects = {
			amount = 20,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_stech_m_extended = {
		a_obj = "a_m",
		texture_bundle_folder = "afp",
		type = "magazine",
		dlc = "afp",
		name_id = "bm_wp_stech_m_extended",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_m_extended",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 30,
			prefix = "g_bullet_"
		},
		supported = true,
		stats = {
			value = 5,
			reload = -1,
			extra_ammo = 5,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_stech_s_standard = {
		texture_bundle_folder = "afp",
		dlc = "afp",
		type = "stock",
		name_id = "bm_wp_stech_s_standard",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_s_standard",
		a_obj = "a_s",
		pcs = {
			10,
			20,
			30,
			40
		},
		supported = true,
		stats = {
			value = 1,
			recoil = 1,
			spread = -1
		}
	}
	self.parts.wpn_fps_pis_stech_sl_standard = {
		a_obj = "a_sl",
		type = "slide",
		name_id = "default",
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_fps_pis_stech_sl_standard",
		supported = true,
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_pis_stech_b_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_b_standard"
	self.parts.wpn_fps_pis_stech_b_long.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_b_standard"
	self.parts.wpn_fps_pis_stech_body_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_body_standard"
	self.parts.wpn_fps_pis_stech_g_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_g_standard"
	self.parts.wpn_fps_pis_stech_g_luxury.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_g_luxury"
	self.parts.wpn_fps_pis_stech_g_tactical.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_g_tactical"
	self.parts.wpn_fps_pis_stech_m_extended.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_m_extended"
	self.parts.wpn_fps_pis_stech_m_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_m_standard"
	self.parts.wpn_fps_pis_stech_s_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_s_standard"
	self.parts.wpn_fps_pis_stech_sl_standard.third_unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech_pts/wpn_third_pis_stech_sl_standard"
	self.wpn_fps_pis_stech = {
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech/wpn_fps_pis_stech",
		animations = {
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload = "reload",
			magazine_empty = "last_recoil"
		},
		override = {
			wpn_fps_upg_o_rmr = {
				parent = "slide"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			}				
		},
		default_blueprint = {
			"wpn_fps_pis_stech_b_standard",
			"wpn_fps_pis_stech_body_standard",
			"wpn_fps_pis_stech_g_standard",
			"wpn_fps_pis_stech_m_standard",
			"wpn_fps_pis_stech_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_stech_b_standard",
			"wpn_fps_pis_stech_b_long",
			"wpn_fps_pis_stech_body_standard",
			"wpn_fps_pis_stech_g_standard",
			"wpn_fps_pis_stech_g_luxury",
			"wpn_fps_pis_stech_g_tactical",
			"wpn_fps_pis_stech_m_standard",
			"wpn_fps_pis_stech_m_extended",
			"wpn_fps_pis_stech_s_standard",
			"wpn_fps_pis_stech_sl_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_o_rms",
			"wpn_fps_upg_o_rikt",
			"wpn_fps_upg_ns_pis_typhoon",
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"				
		}
	}
	self.wpn_fps_pis_stech_npc = deep_clone(self.wpn_fps_pis_stech)
	self.wpn_fps_pis_stech_npc.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_stech/wpn_fps_pis_stech_npc"
end	

function WeaponFactoryTweakData:_init_x_stech()
	self.wpn_fps_pis_x_stech = {
		unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_x_stech/wpn_fps_pis_x_stech",
		override = {
			wpn_fps_upg_o_rmr = {
				parent = "slide"
			},
			wpn_fps_upg_o_rms = {
				parent = "slide"
			},
			wpn_fps_upg_o_rikt = {
				parent = "slide"
			},
			wpn_fps_upg_ns_pis_typhoon = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_pis_ns_flash = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_slim = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_ass_filter = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_jungle = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_small = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_large_kac = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_medium_gem = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_ipsccomp = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_upg_ns_pis_meatgrinder = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_1 = {
				a_obj = "a_ns",
				parent = "barrel"
			},
			wpn_fps_pis_g18c_co_comp_2 = {
				a_obj = "a_ns",
				parent = "barrel"
			},				
			wpn_fps_pis_stech_m_extended = {
				supported = true,
				stats = {
					value = 5,
					reload = -1,
					extra_ammo = 10,
					concealment = -1
				}
			}
		},
		animations = {
			reload_left = "reload_left",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty_left = "reload_not_empty_left",
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			magazine_empty = "last_recoil"
		},
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		default_blueprint = {
			"wpn_fps_pis_stech_b_standard",
			"wpn_fps_pis_stech_body_standard",
			"wpn_fps_pis_stech_g_standard",
			"wpn_fps_pis_stech_m_standard",
			"wpn_fps_pis_stech_sl_standard"
		},
		uses_parts = {
			"wpn_fps_pis_stech_b_standard",
			"wpn_fps_pis_stech_b_long",
			"wpn_fps_pis_stech_body_standard",
			"wpn_fps_pis_stech_g_standard",
			"wpn_fps_pis_stech_g_luxury",
			"wpn_fps_pis_stech_g_tactical",
			"wpn_fps_pis_stech_m_standard",
			"wpn_fps_pis_stech_m_extended",
			"wpn_fps_pis_stech_sl_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_tlr1",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_fl_pis_crimson",
			"wpn_fps_upg_fl_pis_x400v",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_ns_pis_ipsccomp",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_typhoon",
			--Stuff--
			"wpn_fps_pis_g18c_co_1",
			"wpn_fps_pis_g18c_co_comp_2"	
		}
	}
	self.wpn_fps_pis_x_stech_npc = deep_clone(self.wpn_fps_pis_x_stech)
	self.wpn_fps_pis_x_stech_npc.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_x_stech/wpn_fps_pis_x_stech_npc"
end	

--Holt 9mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_holt", "resmod_holt", function(self)

	--Bling Grip
	self.parts.wpn_fps_pis_holt_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_g_bling.supported = true
	self.parts.wpn_fps_pis_holt_g_bling.stats = {
		value = 3,
		recoil = -1,
		spread = 1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_holt_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_g_ergo.supported = true
	self.parts.wpn_fps_pis_holt_g_ergo.stats = {
		value = 2,
		spread = -1,
		recoil = 1
	}
	
	--Extended Mag
	self.parts.wpn_fps_pis_holt_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_m_extended.supported = true
	self.parts.wpn_fps_pis_holt_m_extended.stats = {
		extra_ammo = 5,
		value = 2,
		concealment = -1,
		reload = -1
	}
	
	--Override Table
	self.wpn_fps_pis_holt.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_holt.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}	

	table.insert(self.wpn_fps_pis_holt.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_holt.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
					
	self.wpn_fps_pis_holt_npc.uses_parts = deep_clone(self.wpn_fps_pis_holt.uses_parts)			

end)

--Akimbo Holt 9mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_holt", "resmod_x_holt", function(self)
	
	--Override Table
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_holt_m_extended = {
		supported = true,
		stats = {
			extra_ammo = 10,
			value = 2,
			concealment = -1,
			reload = -1
		}
	}	
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}	

	table.insert(self.wpn_fps_pis_x_holt.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_x_holt.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
					
	self.wpn_fps_pis_x_holt_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_holt.uses_parts)			

end)

--ATW Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_atw_mod", "resmod_atw_mod", function(self)
	
	self.parts.wpn_fps_ass_m14_body_ruger.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_m14_body_ruger.supported = true
	self.parts.wpn_fps_ass_m14_body_ruger.stats = {
		concealment = 1,
		recoil = -1,
		value = 1
	}

end)


--M60
Hooks:PostHook(WeaponFactoryTweakData, "_init_m60", "resmod_m60", function(self)

	--Short Barrel
	self.parts.wpn_fps_lmg_m60_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_b_short.supported = true
	self.parts.wpn_fps_lmg_m60_b_short.stats = {
		spread = -1,
		concealment = 1,
		value = 3
	}
	
	--Tactical Foregrip
	self.parts.wpn_fps_lmg_m60_fg_tactical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_tactical.supported = true
	self.parts.wpn_fps_lmg_m60_fg_tactical.stats = {
		value = 1,
		spread = -1,
		recoil = 1
	}
	
	--Tropical Foregrip
	self.parts.wpn_fps_lmg_m60_fg_tropical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_tropical.supported = true
	self.parts.wpn_fps_lmg_m60_fg_tropical.stats = {
		value = 1,
		concealment = 1,
		spread = -1
	}

	--Modern Foregrip
	self.parts.wpn_fps_lmg_m60_fg_keymod.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_keymod.supported = true
	self.parts.wpn_fps_lmg_m60_fg_keymod.stats = {
		spread = 1,
		recoil = -1,
		concealment = -1,
		value = 1
	}
		
	--M60 Part Additions
	
	--[[
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_sig")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_sig")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_fc1")		
	
	]]--
			
	self.wpn_fps_lmg_m60_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m60.uses_parts)			

end)

--R700
Hooks:PostHook(WeaponFactoryTweakData, "_init_r700", "resmod_r700", function(self)

	--Short Barrel
	self.parts.wpn_fps_snp_r700_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_r700_b_short.supported = true
	self.parts.wpn_fps_snp_r700_b_short.stats = {
		value = 3,
		concealment = 1,
		spread = -1
	}
	
	--Sniper Suppressor
	self.parts.wpn_fps_snp_r700_b_medium.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_snp_r700_b_medium.supported = true
	self.parts.wpn_fps_snp_r700_b_medium.stats = {
		value = 3,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_r700_b_medium.perks = {"silencer"}
	
	--Tactical Body
	self.parts.wpn_fps_snp_r700_s_tactical.pcs = {
		10,
		20,
		30,
		40		
	}
	self.parts.wpn_fps_snp_r700_s_tactical.supported = true
	self.parts.wpn_fps_snp_r700_s_tactical.stats = {
		value = 0,
		recoil = 1,
		spread = -1
	}
	
	--Military Stock
	self.parts.wpn_fps_snp_r700_s_military.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_r700_s_military.supported = true
	self.parts.wpn_fps_snp_r700_s_military.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 5
	}
	self.parts.wpn_fps_snp_r700_s_military.override = {}
	self.parts.wpn_fps_snp_r700_s_military.override.wpn_fps_snp_model70_iron_sight = {
		adds = {"wpn_fps_m4_uupg_o_flipup", "wpn_fps_shot_r870_s_nostock_single"}
	}		
	
	--Default Wood Body
	self.parts.wpn_fps_snp_r700_s_standard.override = {}
	self.parts.wpn_fps_snp_r700_s_standard.override.wpn_fps_snp_model70_iron_sight = {
		adds = {"wpn_fps_m4_uupg_o_flipup", "wpn_fps_shot_r870_s_nostock_single"}
	}
	
	--Override Table
	self.wpn_fps_snp_r700.override = {}
	self.wpn_fps_snp_r700.override.wpn_fps_snp_model70_iron_sight = { 
		adds = {"wpn_fps_m4_uupg_o_flipup"}
	}	
	self.wpn_fps_snp_r700.override.wpn_fps_shot_r870_s_nostock_single = { a_obj = "a_b" }
	
	self.wpn_fps_snp_r700.adds.wpn_fps_snp_model70_iron_sight = {
		"wpn_fps_snp_r700_o_rail"
	}

	table.insert(self.wpn_fps_snp_r700.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_r700_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_r700_npc.uses_parts = deep_clone(self.wpn_fps_snp_r700.uses_parts)		

end)

--Bernetti Rangerhitter
Hooks:PostHook(WeaponFactoryTweakData, "_init_sbl", "resmod_sbl", function(self)

	--BIG Barrel
	self.parts.wpn_fps_snp_sbl_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_sbl_b_long.supported = true
	self.parts.wpn_fps_snp_sbl_b_long.stats = {
		value = 3,
		concealment = -1,
		spread = 1,
		recoil = -1
	}
	
	--Sniper Suppressor
	self.parts.wpn_fps_snp_sbl_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_snp_sbl_b_short.supported = true
	self.parts.wpn_fps_snp_sbl_b_short.stats = {
		value = 3,
		suppression = 10,
		alert_size = -1,
		spread = -1,
		recoil = 1
	}
	self.parts.wpn_fps_snp_sbl_b_short.perks = {"silencer"}
	
	--Club Stock
	self.parts.wpn_fps_snp_sbl_s_saddle.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_sbl_s_saddle.supported = true
	self.parts.wpn_fps_snp_sbl_s_saddle.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	--Iron Sights (Still basically the same as ours)
	self.parts.wpn_fps_snp_sbl_o_standard.supported = true
	self.parts.wpn_fps_snp_sbl_o_standard.stats = {
		value = 1
	}	
	
	--Override Table
	self.wpn_fps_snp_sbl.override = {}
	self.wpn_fps_snp_sbl.adds = {}
					
	self.wpn_fps_snp_sbl_npc.uses_parts = deep_clone(self.wpn_fps_snp_sbl.uses_parts)		

end)

--Frenchman Model 87
Hooks:PostHook(WeaponFactoryTweakData, "_init_model3", "resmod_model3", function(self)

	--Short Barrel
	self.parts.wpn_fps_pis_model3_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_pis_model3_b_short.supported = true
	self.parts.wpn_fps_pis_model3_b_short.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}

	--Long barrel
	self.parts.wpn_fps_pis_model3_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_model3_b_long.supported = true
	self.parts.wpn_fps_pis_model3_b_long.stats = {
		value = 3,
		concealment = -1,
		spread = 1,
		recoil = -1
	}
		
	--Bling Grip
	self.parts.wpn_fps_pis_model3_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_model3_g_bling.supported = true
	self.parts.wpn_fps_pis_model3_g_bling.stats = {
		value = 2,
		spread = 1,
		concealment = -1,
		recoil = -1
	}
	
end)

--Akimbo Frenchman Model 87
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_model3", "resmod_x_model3", function(self)

--Nothing!

end)

--Reinfeld 88
Hooks:PostHook(WeaponFactoryTweakData, "_init_m1897", "resmod_m1897", function(self)

	--Short Barrel
	self.parts.wpn_fps_shot_m1897_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_shot_m1897_b_short.supported = true
	self.parts.wpn_fps_shot_m1897_b_short.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_shot_m1897_b_short.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}	
	
	--Long barrel
	self.parts.wpn_fps_shot_m1897_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m1897_b_long.supported = true
	self.parts.wpn_fps_shot_m1897_b_long.stats = {
		value = 3,
		concealment = -1,
		spread = 1,
		recoil = -1
	}
	self.parts.wpn_fps_shot_m1897_b_long.custom_stats = {
		damage_near_mul = 1,
		damage_far_mul = 1
	}		
	
	--Short Stock
	self.parts.wpn_fps_shot_m1897_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m1897_s_short.supported = true
	self.parts.wpn_fps_shot_m1897_s_short.stats = {
		value = 1,
		concealment = 1,
		recoil = -1
	}

	--Override Table
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_slug = {
		supported = true,
		name_id = "bm_wp_upg_a_slug",
		desc_id = "bm_wp_upg_a_slug_desc",
		stats = {
			value = 10,
			total_ammo_mod = -33,
			damage = 30,
			recoil = -2,
			spread = 8,
			spread_multi = {1, 1},	
			moving_spread = 0,
			suppression = -1,
			concealment = -5
		},
		custom_stats = {				
			damage_near_mul = 999,
			damage_far_mul = 999,
			muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",										
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true
		}
	}
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_custom = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_custom_free = {
		supported = true,
		stats = {
			value = 9,
			total_ammo_mod = -33,
			damage = 30
		},
		custom_stats = {
			damage_near_mul = 0.75,
			damage_far_mul = 0.75,
			rays = 6
		}
	}		
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_explosive = {
		supported = true,
		stats = {
			value = 10,
			total_ammo_mod = -50,
			recoil = -5,
			spread_multi = {1, 1},	
			concealment = -7,
			damage = 60
		},
		custom_stats = {
			ignore_statistic = true,
			block_b_storm = true,
			rays = 1,
			damage_near_mul = 999,
			damage_far_mul = 999,
			bullet_class = "InstantExplosiveBulletBase"
		}
	}
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override		

end)
					
Hooks:PostHook( WeaponFactoryTweakData, "create_bonuses", "SC_mods", function(self)
	self.parts.wpn_fps_upg_i_slower_rof = {
		type = "custom",
		--sub_type = "singlefire",
		name_id = "bm_wp_upg_i_singlefire_sc",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {rof_mult = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_slower_rof",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0,
			damage = 0,
			spread = 0,
			recoil = 0
		},
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_upg_extra_mp_lock"
		},
		internal_part = true,
		dlc = "sc"
	}
	self.parts.wpn_fps_upg_i_faster_rof = {
		type = "custom",
		--sub_type = "autofire",
		name_id = "bm_wp_upg_i_autofire_sc",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {rof_mult = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_faster_rof",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0,
			damage = 0,
			spread = 0,
			recoil = 0,
			spread_moving = 0
		},
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_upg_extra_mp_lock"
		},
		internal_part = true,
		dlc = "sc"
	}	
	
	self.parts.wpn_fps_upg_i_93r = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_93r",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {
			beretta_burst = true,
			use_auto_kick = true
		},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0,
			spread = -1,
			recoil = -2				
		},
		internal_part = true,
		dlc = "sc"
	}	
	self.parts.wpn_fps_smg_mac10_s_no = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_shepheard_s_no",
		a_obj = "a_s",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_mac10_s_no",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",			
		supported = true,			
		stats = {
			value = 1,
			concealment = 1,
			recoil = -1			
		},
		dlc = "sc"			
	}								
	self.parts.wpn_fps_shot_r870_s_folding_ext = { -- thanks jarey_!
		pcs = {},
		type = "stock",
		name_id = "bm_wp_r870_s_folding_ext",
		a_obj = "a_s",
		alt_icon = "guis/dlcs/mods/textures/pd2/blackmarket/icons/mods/wpn_fps_shot_r870_s_muldonunfolded",
		unit = "units/mods/weapons/wpn_fps_shot_r870_pts_mod/wpn_fps_shot_r870_s_muldonunfolded",
		third_unit = "units/mods/weapons/wpn_fps_shot_r870_pts_mod/wpn_third_shot_r870_s_muldonunfolded",			
		supported = true,			
		stats = {
			value = 5,
			recoil = -1,
			concealment = 1
		},
		dlc = "sc"			
	}						
	--Vlad's Rodina--
	self.parts.wpn_fps_upg_vlad_rodina_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_ak",
		desc_id = "bm_wskn_ak74_rodina_desc_sc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p3",
		has_description = true,
		override = {
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_ns_ak105 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_b_ak105 = {
				override = nil,
				adds = nil,
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_upg_ak_b_draco = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_ass_74_b_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_upg_ass_ak_b_zastava = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_upg_ak_fg_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo2 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo3 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo1 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo4 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_tapco = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_fg_midwest = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_krebs = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_trax = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_g_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_rk3 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_hgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_pgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_wgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_upg_ak_s_skfoldable_vanilla = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_upg_ak_s_folding = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_vlad_rodina_legend")

	--Midas Touch--
	self.parts.wpn_fps_upg_midas_touch_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_deagle",
		desc_id = "bm_wskn_deagle_bling_desc_sc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		has_description = true,
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2",
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_upg_o_marksmansight_front = {a_obj = "a_ol"},
			wpn_fps_pis_deagle_b_standard = {
				unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_fps_pis_deagle_b_legend",
				third_unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_third_pis_deagle_b_legend",
			},
			wpn_fps_pis_deagle_b_long = {
				unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_fps_pis_deagle_b_legend",
				third_unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_third_pis_deagle_b_legend",
			}
		}
	}
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_midas_touch_legend")

	--Dragon Lord--
	self.parts.wpn_fps_upg_dragon_lord_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_fla_mk2_body = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_fla_mk2_body_fierybeast_pts/wpn_fps_fla_mk2_body_fierybeast"
			}
		}
	}
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_dragon_lord_legend")

	--Green Grin--
	self.parts.wpn_fps_upg_green_grin_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_rpg7_m_rocket = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_rpg7_m_grinclown/wpn_fps_rpg7_m_grinclown",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_rpg7_m_grinclown/wpn_third_rpg7_m_grinclown"		}
		}
	}
	table.insert(self.wpn_fps_rpg7.uses_parts, "wpn_fps_upg_green_grin_legend")

	--The Gimp--
	self.parts.wpn_fps_upg_the_gimp_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_lmg_m134_body_upper = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_body_upper_spikey",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_body_upper_spikey",
			},
			wpn_fps_lmg_m134_body_upper_light = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_body_upper_spikey",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_body_upper_spikey",
			},
			wpn_fps_lmg_m134_barrel = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			},
			wpn_fps_lmg_m134_barrel_short = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			},
			wpn_fps_lmg_m134_barrel_extreme = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			}
		}
	}

	--Dallas Sallad--
	self.parts.wpn_fps_upg_salad_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_smg_p90_b_short = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_long = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_civilian = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_ninja = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
		}
	}
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_salad_legend")

	--Big Kahuna--
	self.parts.wpn_fps_upg_the_big_kahuna = {
		type = "bonus",
		name_id = "bm_menu_sc_legendary_r870",
		desc_id = "bm_wskn_r870_waves_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_recoil_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_shot_r870_s_solid_vanilla = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_folding = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_m4 = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_single = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_single = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_fg_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_railed = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_wood = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_wood = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_upg_ns_shot_thick = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_shot_shark = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_shot_ns_king = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_sho_salvo_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_standard = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_ergo = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_sniper = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_hgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_mgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_shot_r870_m_extended = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_shot_r870_b_long = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_fps_shot_r870_b_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_third_shot_r870_b_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_the_big_kahuna")

	--Dallas Sallad--
	self.parts.wpn_fps_upg_santa_slayers_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_pis_1911_g_standard = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_bling = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_ergo = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_engraved = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_upg_fl_pis_laser = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_tlr1 = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_crimson = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_x400v = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_m3x = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
		}
	}
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_santa_slayers_legend")

	--Pastrami--
	self.parts.wpn_fps_upg_baaah_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_snp_model70_b_standard = {
				unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_fps_snp_model70_b_legend",
				third_unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_third_snp_model70_b_legend"		
			},
			wpn_fps_snp_model70_s_standard = {
				unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_fps_snp_model70_s_legend",
				third_unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_third_snp_model70_s_legend"		
			}
		}
	}
	table.insert(self.wpn_fps_snp_model70.uses_parts, "wpn_fps_upg_baaah_legend")

	--Wolf's M240 thing--
	self.parts.wpn_fps_upg_par_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_lmg_par_b_short = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_fps_lmg_svinet_b_standard",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_third_lmg_svinet_b_legend",
			},
			wpn_fps_lmg_par_b_standard = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_fps_lmg_svinet_b_standard",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_third_lmg_svinet_b_legend",
			},
			wpn_fps_lmg_par_s_plastic = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_fps_lmg_svinet_s_legend",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_third_lmg_svinet_s_legend",
			},
			wpn_fps_lmg_par_s_standard = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_fps_lmg_svinet_s_legend",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_third_lmg_svinet_s_legend",
			}
		}
	}
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_par_legend")

	--Cola--
	self.parts.wpn_fps_upg_cola_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_deagle",
		desc_id = "bm_wskn_deagle_bling_desc_sc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		has_description = true,
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2",
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_ns_ak105 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_m4_uupg_b_medium_vanilla = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_m4_uupg_b_long = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_upg_ass_m4_b_beowulf = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_m16_fg_standard = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_fg_railed = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_fg_vietnam = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_upg_ass_m16_fg_stag = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_s_solid_vanilla = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_m4_uupg_s_fold = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_smg_olympic_s_short = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_cola_legend")

	--I forgot about the bayonetta gun--
	self.parts.wpn_fps_upg_judge_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_pis_judge_b_standard = {
				unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_fps_pis_judge_b_legend",
				third_unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_third_pis_judge_b_legend",
			},
			wpn_fps_pis_judge_g_standard = {
				unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_g_legend/wpn_fps_pis_judge_g_legend",
				third_unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_g_legend/wpn_third_pis_judge_g_legend",
			}
		}
	}
	table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_judge_legend")

	--IN THE BOOT WITH YA!--
	self.parts.wpn_fps_upg_boot_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_sho_boot_b_standard = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_b_short = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_b_long = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_fg_standard = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_fg_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_fg_legendary",
			},
			wpn_fps_sho_boot_s_short = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_s_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_s_legendary",
			},
			wpn_fps_sho_boot_s_long = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_s_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_s_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_boot_legend")

	--Wait, there's more?--
	self.parts.wpn_fps_upg_boot_legend_optic = {
		type = "sight",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_o",
		unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_o_legendary",
		third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_o_legendary",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		stance_mod = {
			wpn_fps_sho_boot = {
				translation = Vector3(0, -5, -1.5)
			}
		}
	}
	table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_boot_legend_optic")

	--Just like the real KSG, no one likes this skin--
	self.parts.wpn_fps_upg_ksg_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_sho_ksg_b_standard = {
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			},
			wpn_fps_sho_ksg_b_long = {
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			},
			wpn_fps_sho_ksg_b_short = {
				forbids = {"wpn_fps_sho_ksg_fg_short"},
				adds = {"wpn_fps_sho_ksg_fg_standard"},
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			}
		}
	}
	table.insert(self.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_ksg_legend")

	--The Not Patriot--
	self.parts.wpn_fps_upg_tecci_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_ass_tecci_b_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_b_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_b_legend",
			},
			wpn_fps_ass_tecci_b_long = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_b_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_b_legend",
			},
			wpn_fps_ass_tecci_fg_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_fg_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_fg_legend",
			},
			wpn_fps_ass_tecci_s_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_m4_uupg_s_fold = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_tecci_legend")

	--Plush Phoenix--
	self.parts.wpn_fps_upg_m14_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_ass_m14_b_standard = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_b_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_b_legendary",
			},
			wpn_fps_ass_m14_body_dmr = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_ebr = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_jae = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_ruger = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",			
			},
			wpn_fps_ass_m14_body_upper = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_upper_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_upper_legendary",
			},
			wpn_fps_ass_m14_body_lower = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_lower_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_lower_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_m14_legend")

	--Demon--
	self.parts.wpn_fps_upg_serbu_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_shot_r870_b_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_b_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_b_legendary",
			},
			wpn_fps_shot_r870_fg_small = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_fg_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_fg_legendary",
			},
			wpn_fps_upg_m4_g_standard = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},			
			wpn_fps_shot_shorty_m_extended_short = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_ergo = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_sniper = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_hgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_mgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_snp_tti_g_grippy = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},				
			wpn_fps_upg_g_m4_surgeon = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},			
			wpn_fps_shot_r870_s_nostock_vanilla = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_r870_s_folding = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_shorty_s_nostock_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			},
			wpn_fps_shot_r870_s_solid = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_single = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_shorty_s_solid_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			},
			wpn_fps_shot_r870_s_folding_ext = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			}			
		}
	}
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_serbu_legend")


--Legendary shit above--

--Custom weapon shit here--

	--Striker mods--
	if self.parts.wpn_fps_sho_striker_s_folding then
		self.parts.wpn_fps_sho_striker_s_folding.supported = true
		self.parts.wpn_fps_sho_striker_s_folding.stats = {
				value = 0,
				recoil = 0,
				concealment = 0
			}
		end

	if SystemFS:exists("assets/mod_overrides/Classic Weapon Animations") then
			self.parts.wpn_fps_pis_g17_m_standard.unit = "units/payday2/weapons/wpn_fps_pis_g17_pts/wpn_fps_pis_g17_m_standard"
		end		

	if self.wpn_fps_shot_m590 then -- Silent Enforcer & GT's Mossberg 590
		self.parts.wpn_fps_shot_m590_s_wood.supported = true
		self.parts.wpn_fps_shot_m590_s_wood.stats = {			
				value = 3,
				recoil = -1,
				spread = 1,
				concealment = -1
		}
		self.parts.wpn_fps_shot_m590_s_wood.custom_stats = {damage_near_mul = 1, damage_far_mul = 1}
		self.parts.wpn_fps_shot_m590_s_hdtf.supported = true
		self.parts.wpn_fps_shot_m590_s_hdtf.stats = {
				value = 5,
				recoil = -3,
				concealment = 3
		}
		self.parts.wpn_fps_shot_m590_s_old.supported = true
		self.parts.wpn_fps_shot_m590_s_old.stats = {
				value = 1,
				recoil = 2,
				spread = -2
		}
		self.parts.wpn_fps_shot_m590_s_old.custom_stats = {damage_near_mul = 1, damage_far_mul = 1}
		self.parts.wpn_fps_shot_m590_fg_wood.supported = true
		self.parts.wpn_fps_shot_m590_fg_wood.stats = {
				value = 2,
				recoil = 1,
				spread = -1
		}
		self.parts.wpn_fps_shot_m590_s_old.custom_stats = {damage_near_mul = 1, damage_far_mul = 1}			
		self.parts.wpn_fps_shot_m590_fg_wood.supported = true			
		self.parts.wpn_fps_shot_m590_fg_wood.stats = {
				value = 2,
				concealment = 1,
				spread = -1
		}
		self.parts.wpn_fps_shot_m590_b_short.supported = true
		self.parts.wpn_fps_shot_m590_b_short.stats = {
				value = 0,
				recoil = -1,
				extra_ammo = -2,
				concealment = 3
		}
		self.parts.wpn_fps_shot_m590_heat_shield.supported = true
		self.parts.wpn_fps_shot_m590_heat_shield.stats = {
				value = 0
		}
		self.parts.wpn_fps_shot_m590_b_silencer.supported = true
		self.parts.wpn_fps_shot_m590_b_silencer.stats = {
				value = 7,
				suppression = 12,
				alert_size = -1,
				recoil = 1,
				spread = -1
		}
		self.wpn_fps_shot_m590.override = { 
			wpn_fps_shot_r870_body_rack = {
				supported = true,
				stats = {				
					value = 2,
					spread = -1,
					concealment = -1,
					reload = 3
				}, 
				custom_stats = {damage_near_mul = 1,	damage_far_mul = 1},
				a_obj="a_rack"
			},		
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -5,
					concealment = -7,
					spread_multi = {1, 1},	
					total_ammo_mod = -62,
					damage = 250
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
			}
		}
	}		
	end	

	if self.parts.wpn_fps_ass_ns_g_sup1 then -- Gambyt's Sneaky Suppressor Pack
			self.parts.wpn_fps_ass_ns_g_sup1.supported = true
			self.parts.wpn_fps_ass_ns_g_sup1.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}	
			self.parts.wpn_fps_ass_ns_g_sup2.supported = true	
			self.parts.wpn_fps_ass_ns_g_sup2.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}			
			self.parts.wpn_fps_ass_ns_g_sup3.supported = true			
			self.parts.wpn_fps_ass_ns_g_sup3.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}			
			self.parts.wpn_fps_ass_ns_g_sup4.supported = true			
			self.parts.wpn_fps_ass_ns_g_sup4.stats = { 
				value = 5,
				suppression = 12,
				alert_size = -1,
				spread = 2,
				recoil = -2,
				concealment = -2
			}		
			self.parts.wpn_fps_ass_ns_g_sup5.supported = true		
			self.parts.wpn_fps_ass_ns_g_sup5.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}		
			self.parts.wpn_fps_ass_ns_g_sup6.supported = true		
			self.parts.wpn_fps_ass_ns_g_sup6.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}							
			self.parts.wpn_fps_ass_ns_g_sup7.supported = true							
			self.parts.wpn_fps_ass_ns_g_sup7.stats = { 
				value = 10,
				suppression = 10,
				alert_size = -1,
				spread = -1,
				recoil = 1
			}
			self.parts.wpn_fps_ass_ns_g_sup8.supported = true
			self.parts.wpn_fps_ass_ns_g_sup8.stats = { 
				value = 2,
				suppression = 11,
				alert_size = -1,
				recoil = -1,
				spread = 1,
				concealment = -1
			}
			self.parts.wpn_fps_ass_ns_g_sup9.supported = true
			self.parts.wpn_fps_ass_ns_g_sup9.stats = { 
				value = 10,
				suppression = 12,
				alert_size = -1,
				spread = 2,
				recoil = -2,
				concealment = -2
			}						
			table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1) --not a good way of fixing it, but it works, yeah?
			table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)
			table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)				
			table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)				
		end				
					
	if self.parts.wpn_fps_rail_covers then 	--Kden and Silent Enforcer's Rail Covers
		self.parts.wpn_fps_rc_dd.supported = true
		self.parts.wpn_fps_rc_dd.stats = { 
				value = 0
			}			
		self.parts.wpn_fps_rail_covers.supported = true			
		self.parts.wpn_fps_rail_covers.stats = { 
				value = 0
			}	
		end

	if self.wpn_fps_pis_hpb then --Gambyt's Browning HP
		self.parts.wpn_fps_pis_hpb_g_white.supported = true
		self.parts.wpn_fps_pis_hpb_g_white.stats = { 
				value = 3, 
				recoil = -1, 
				spread = 1, 
				concealment = -1
			}
		self.parts.wpn_fps_pis_hpb_thread.supported = true
		self.parts.wpn_fps_pis_hpb_thread.stats = { 
				value = 4,
				recoil = -1,
				concealment = 1
			}
		self.parts.wpn_fps_pis_hpb_comp2.supported = true
		self.parts.wpn_fps_pis_hpb_comp2.stats = { 
				value = 4,
				spread = -1,
				concealment = 1
			}								
		self.parts.wpn_fps_pis_hpb_m_extended.supported = true								
		self.parts.wpn_fps_pis_hpb_m_extended.stats = { 
				value = 3,
				concealment = -1,
				extra_ammo = 4,
				reload = -1
			}				
		self.parts.wpn_fps_pis_hpb_g_cherry.supported = true				
		self.parts.wpn_fps_pis_hpb_g_cherry.stats = { 
				value = 10,
				recoil = 1,
				spread = -1
			}				
		self.parts.wpn_fps_pis_hpb_g_black.supported = true				
		self.parts.wpn_fps_pis_hpb_g_black.stats = { 
				value = 2,
				recoil = -1,
				concealment = 1
			}				
		self.parts.wpn_fps_pis_hpb_a_c45.pcs = nil
		end					

	if self.wpn_fps_snp_moss464spx then -- Pawcio's SPX Centerfire
		self.parts.wpn_fps_snp_moss464spx_stock.stats = nil
		self.parts.wpn_fps_snp_moss464spx_stock.pcs = nil --already comes with this pre-attached, so it's disabled from being selectable in the stocks category.	
		self.parts.wpn_fps_upg_moss464spx_barrel_short.supported = true	
		self.parts.wpn_fps_upg_moss464spx_barrel_short.stats = {
				value = 2,
				extra_ammo = -1,							
				concealment = 2
			}								
		self.parts.wpn_fps_snp_moss464spx_supp_maxim.supported = true								
		self.parts.wpn_fps_snp_moss464spx_supp_maxim.stats = {
				value = 5,
				suppression = 13,
				alert_size = -1,
				spread = -1,
				recoil = 1,
				spread_moving = -2
			}				
		self.parts.wpn_fps_upg_moss464spx_barrel_short.override_weapon_add = nil
		self.parts.wpn_fps_upg_moss464spx_stock_cheekpiece.supported = true
		self.parts.wpn_fps_upg_moss464spx_stock_cheekpiece.stats = {
				value = 0,
				recoil = 1,
				concealment = -1
			}					
		end	

	if self.wpn_fps_ass_tilt then -- Grocery's AN 92	
		self.parts.wpn_fps_ass_tilt_a_fuerte.pcs = nil		
		self.parts.wpn_fps_ass_tilt_mag_big.supported = true		
		self.parts.wpn_fps_ass_tilt_mag_big.stats = {
				value = 3,
				concealment = -3,
				extra_ammo = 30,
				reload = -3,
				spread = -1
			}	
		self.parts.wpn_fps_ass_tilt_mag_swift.supported = true	
		self.parts.wpn_fps_ass_tilt_mag_swift.stats = {
				value = 2,
				spread = -1,
				concealment = -1,
				reload = 3
			}						
		self.parts.wpn_fps_ass_tilt_mag_tactical.supported = true						
		self.parts.wpn_fps_ass_tilt_mag_tactical.stats = {
				value = 1,
				recoil = -1,
				concealment = 1
			}	
		self.parts.wpn_fps_ass_tilt_g_wood.supported = true	
		self.parts.wpn_fps_ass_tilt_g_wood.stats = {
				value = 2,
				spread = -1,
				recoil = 1
			}
		self.parts.wpn_fps_ass_tilt_g_wood.custom_stats = {damage_near_mul = 1, damage_far_mul = 1}		
		self.parts.wpn_fps_ass_tilt_stock_wood.supported = true		
		self.parts.wpn_fps_ass_tilt_stock_wood.stats = {
				value = 1
			}			
		self.parts.wpn_fps_ass_tilt_stock_fold.supported = true			
		self.parts.wpn_fps_ass_tilt_stock_fold.stats = {
				value = 3,
				recoil = -1,
				concealment = 1
			}	
		self.parts.wpn_fps_ass_tilt_stock_tactical.supported = true	
		self.parts.wpn_fps_ass_tilt_stock_tactical.stats = {
				value = 3,
				spread = 1,
				recoil = -1,
				concealment = -1
		}
		self.parts.wpn_fps_ass_tilt_stock_tactical.custom_stats = {damage_near_mul = 1, damage_far_mul = 1}
		self.parts.wpn_fps_ass_tilt_stock_none.supported = true
		self.parts.wpn_fps_ass_tilt_stock_none.stats = {
				value = 3,
				recoil = -3,
				concealment = 3
			}																		
		end	
		
if self.wpn_fps_shot_ks23 then 	-- Pawcio's KS-23	
		self.parts.wpn_fps_upg_ks23_ammo_slug.supported = true	
		self.parts.wpn_fps_upg_ks23_ammo_slug.desc_id = "bm_wp_upg_a_slug_heavy_desc_sc"
		self.parts.wpn_fps_upg_ks23_ammo_slug.stats = {
				value = 10,
				concealment = -5,
				total_ammo_mod = -33,
				damage = 60,
				spread = 8,
				spread_multi = {1, 1},	
				recoil = -2,
				moving_spread = 0
			}
		self.parts.wpn_fps_upg_ks23_ammo_slug.custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",																
				damage_near_mul = 999,
				damage_far_mul = 999,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
				can_shoot_through_titan_shield = true
			}
		self.parts.wpn_fps_upg_ks23_barrel_short.supported = true
		self.parts.wpn_fps_upg_ks23_barrel_short.stats = {
				value = 1,
				recoil = -2,							
				concealment = 2
			}	
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip.supported = true	
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip.stats = {
				value = 1,
				spread = 1,
				recoil = -1							
			}
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip_wire.supported = true
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip_wire.stats = {
				value = 1,
				spread = 1,
				recoil = -1							
			}
		self.parts.wpn_fps_upg_ks23_ammo_buckshot_20pellet.pcs = nil
		self.parts.wpn_fps_upg_ks23_ammo_buckshot_8pellet.pcs = nil											
		end
		
	if self.parts.wpn_fps_upg_m4_m_x15drum then --Pawcio's M4 X 15 Drum Magazine
		self.parts.wpn_fps_upg_m4_m_x15drum.supported = true
		self.parts.wpn_fps_upg_m4_m_x15drum.stats = { 
				value = 3,
				concealment = -3,
				reload = -2,
				extra_ammo = 20
			}
		self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag20 = {
				supported = true,
				stats = {
					value = 3,
					concealment = -3,
					reload = -2,
					extra_ammo = 30
				}
			}				
		end	
		
	if self.wpn_fps_snp_winchester1894 then -- Pawcio's Winchester 1894				
			self.parts.wpn_fps_upg_winchester1894_body_synthetic.supported = true				
			self.parts.wpn_fps_upg_winchester1894_body_synthetic.stats = {
				value = 0
			}
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.has_description = false
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.supported = true
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.stats = {
				value = 0
			}	
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.override_weapon_add = nil
		end										

	if self.wpn_fps_pis_amt then -- Matthelzor, Gambyt, >:3, and Alcat's Automag .44				
			self.parts.wpn_fps_upg_amt_visionking.supported = true				
			self.parts.wpn_fps_upg_amt_visionking.stats = {
				value = 8,
				zoom = 6,
				concealment = -3
			}
			self.parts.wpn_fps_pis_amt_m_short.supported = true
			self.parts.wpn_fps_pis_amt_m_short.stats = {
				value = 5,
				concealment = -1,
				reload = -2,
				extra_ammo = 4
			}			
			self.parts.wpn_fps_pis_amt_b_long.supported = true			
			self.parts.wpn_fps_pis_amt_b_long.stats = {
				value = 5,
				recoil = -1,
				spread = 1,
				concealment = -1
			}	
			self.parts.wpn_fps_pis_amt_g_smooth.supported = true	
			self.parts.wpn_fps_pis_amt_g_smooth.stats = {
				value = 5,
				recoil = -1,
				concealment = 1
			}		
			self.parts.wpn_fps_pis_amt_g_rosewood.supported = true		
			self.parts.wpn_fps_pis_amt_g_rosewood.stats = {
				value = 10,
				recoil = 1,
				spread = -1
			}																				
		end

	--Gambyt's Toy M16
	if self.parts.wpn_fps_ass_toym16_b_standard then
		self.parts.wpn_fps_ass_toym16_b_standard.pcs = nil
	end

	--Gambyt's Vanilla Mod Pack
	if self.parts.wpn_fps_ass_flint_b_long then
		self.parts.wpn_fps_aug_b_big.supported = true --Stops silly incorrect logs.
		self.parts.wpn_fps_aug_b_big.pcs = nil
		self.parts.wpn_fps_ass_s552_m_ak.supported = true
		self.parts.wpn_fps_ass_s552_m_ak.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_amcar.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_amcar.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_sg.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_sg.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_heavy.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_heavy.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick.supported = true
		self.parts.wpn_fps_ass_m4_m_stick.pcs = nil	--caliber conversions STINK	
		table.insert(self.parts.wpn_upg_ak_s_psl.forbids, "wpn_fps_ass_flint_g_custom")			
		table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cqb")			
		table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cqb")			
		table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cqb")			
		table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cqb")			
		table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cqb")						
		self.wpn_fps_lmg_rpk.adds.wpn_fps_upg_o_cqb = {"wpn_fps_ak_extra_ris"} --hk21 only meme is over
		self.wpn_fps_lmg_mg42.adds.wpn_fps_upg_o_cqb = {"wpn_fps_snp_mosin_rail"}
		self.wpn_fps_lmg_hk21.adds.wpn_fps_upg_o_cqb = {"wpn_fps_ass_g3_body_rail"}
		self.parts.wpn_fps_smg_mac10_fg_m4.supported = true
		self.parts.wpn_fps_pis_lebman_b_chrome_akimbo.supported = true
		
		--Theia Micro Sight
		self.parts.wpn_fps_upg_o_cqb.supported = true
		self.parts.wpn_fps_upg_o_cqb.stats = {
			value = 5,
			zoom = 1
		}

		--Karbin Stock
		self.parts.wpn_fps_ass_ak5_s_pts.supported = true
		self.parts.wpn_fps_ass_ak5_s_pts.stats = {
			spread = 2,
			recoil = -1,
			concealment = -3,
			value = 0
		}

		--Stakeout Pump
		self.parts.wpn_fps_shot_beck_pump_custom.supported = true
		self.parts.wpn_fps_shot_beck_pump_custom.stats = {
			value = 3,
			recoil = 1,
			concealment = -2
		}

		--Classic Body
		self.parts.wpn_fps_ass_m14_body_old.supported = true
		self.parts.wpn_fps_ass_m14_body_old.stats = {
			value = 4,
			recoil = 1,
			spread = -1
		}

		--Desert Slide
		self.parts.wpn_fps_pis_beretta_sl_tan.supported = true
		self.parts.wpn_fps_pis_beretta_sl_tan.stats = {
			value = 3
		}

		--Aftermarket Stock
		self.parts.wpn_fps_pis_lebman_stock.supported = true
		self.parts.wpn_fps_pis_lebman_stock.stats = {
			value = 3,
			recoil = 1,
			spread = -1
		}

		self.parts.wpn_fps_ass_aknato_b_long.supported = true
		self.parts.wpn_fps_ass_aknato_b_long.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--Reaper Custom Frame (White Streak)
		self.parts.wpn_fps_pis_pl14_body_custom.supported = true
		self.parts.wpn_fps_pis_pl14_body_custom.stats = {
			value = 3,
			spread = -1,
			recoil = 1,
			concealment = -1
		}

		--Kalashnikov Ninja Stock
		self.parts.wpn_fps_upg_ak_s_polymerstock.supported = true
		self.parts.wpn_fps_upg_ak_s_polymerstock.stats = {
			value = 6,
			spread = 1,
			concealment = -2
		}

		--Fugitive Foregrip
		self.parts.wpn_fps_ass_amcar_fg_covers_base.supported = true
		self.parts.wpn_fps_ass_amcar_fg_covers_base.stats = {
			recoil = -1,
			concealment =1,
			value = 4
		}

		--(Reinbeck) SWAT Pump
		self.parts.wpn_fps_shot_beck_pump_swat.supported = true
		self.parts.wpn_fps_shot_beck_pump_swat.stats = {
			value = 1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}

		--(Reinfeld) Swat Pump
		self.parts.wpn_fps_shot_r870_fg_swat.supported = true
		self.parts.wpn_fps_shot_r870_fg_swat.stats = {
			value = 1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}		

		--Titanium Skeleton Grip
		self.parts.wpn_upg_ak_g_titanium.supported = true
		self.parts.wpn_upg_ak_g_titanium.stats = {
			spread = -1,
			recoil = -1,
			concealment = 2,
			value = 1
		}

		--(Czech 92) Argent Slide
		self.parts.wpn_fps_pis_czech_sl_chrome.supported = true
		self.parts.wpn_fps_pis_czech_sl_chrome.stats = {
			value = 6
		}

		--(Vendetta .38) Extended Magazine
		self.parts.wpn_fps_pis_lebman_m_extended.supported = true
		self.parts.wpn_fps_pis_lebman_m_extended.stats = {
			value = 3,
			extra_ammo = 6,
			concealment = -1,
			reload = -3
		}

		--(Vendetta .38) Room Broom Kit
		self.parts.wpn_fps_pis_lebman_body_classic.supported = true
		self.parts.wpn_fps_pis_lebman_body_classic.stats = {
			value = 6,
			spread = -2,
			recoil = 2
		}

		--(Vendetta .38) Chrome Slide
		self.parts.wpn_fps_pis_lebman_b_chrome.supported = true
		self.parts.wpn_fps_pis_lebman_b_chrome.stats = {
			value = 6
		}

		--(Commando 553) Sniper Grip
		self.parts.wpn_fps_ass_s552_g_sniper.supported = true
		self.parts.wpn_fps_ass_s552_g_sniper.stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Commando 553) Tactical Foregrip
		self.parts.wpn_fps_ass_s552_fg_tac.supported = true
		self.parts.wpn_fps_ass_s552_fg_tac.stats = {
			value = 7,
			spread = -2,
			recoil = 3,
			concealment = -2
		}

		--(Commando 553) Sniper Stock		
		self.parts.wpn_fps_ass_s552_s_sniper.supported = true		
		self.parts.wpn_fps_ass_s552_s_sniper.stats = {
			value = 1,
			spread = 2,
			recoil = -1,
			concealment = -4
		}


		--(Goliath 12G) Long Barrel
		self.parts.wpn_fps_sho_rota_b_longer.supported = true
		self.parts.wpn_fps_sho_rota_b_longer.stats = {
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Chimano 88) Bling Slide
		self.parts.wpn_fps_pis_g17_b_bling.supported = true
		self.parts.wpn_fps_pis_g17_b_bling.stats = {
			value = 1
		}

		--(IZHMA 12G) Smooth Receiver
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.supported = true
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.stats = {
			value = 1
		}			

		--(Microgun) Red Body
		self.parts.wpn_fps_lmg_shuno_body_red.supported = true
		self.parts.wpn_fps_lmg_shuno_body_red.stats = {
			value = 0
		}

		--Cylinder Foregrip
		self.parts.wpn_fps_ass_amcar_fg_cylinder.supported = true
		self.parts.wpn_fps_ass_amcar_fg_cylinder.stats = {
			value = 5,
			concealment = -3,
			spread = 1
		}

		--(Matever) Spiked Grip
		self.parts.wpn_fps_pis_2006m_g_pearl.supported = true
		self.parts.wpn_fps_pis_2006m_g_pearl.stats = {
			value = 2
		}

		--(Specops) Long Barrel
		self.parts.wpn_fps_smg_mp7_b_long.supported = true
		self.parts.wpn_fps_smg_mp7_b_long.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Uzi) Carbine Barrel
		self.parts.wpn_fps_smg_uzi_b_carbine.supported = true
		self.parts.wpn_fps_smg_uzi_b_carbine.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Jacket's Piece) Clean Hit Kit
		self.parts.wpn_fps_smg_cobray_body_upper_long.supported = true
		self.parts.wpn_fps_smg_cobray_body_upper_long.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Leo Pistol) HS Convert Frame
		self.parts.wpn_fps_pis_hs2000_body_stealth.supported = true
		self.parts.wpn_fps_pis_hs2000_body_stealth.stats = {
			value = 1
		}

		--(Signature .40) Signature Chrome Frame
		self.parts.wpn_fps_pis_p226_body_silver.supported = true
		self.parts.wpn_fps_pis_p226_body_silver.stats = {
			value = 1
		}

		--(Jackal) Medium Barrel
		self.parts.wpn_fps_smg_schakal_b_uncivil.supported = true
		self.parts.wpn_fps_smg_schakal_b_uncivil.stats = {
			value = 1,
			recoil = 1,
			spread = -1
		}

		--(Kross Vertex) Long Barrel
		self.parts.wpn_fps_smg_polymer_barrel_long.supported = true
		self.parts.wpn_fps_smg_polymer_barrel_long.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Micro Uzi) Long Barrel
		self.parts.wpn_fps_smg_baka_b_long.supported = true
		self.parts.wpn_fps_smg_baka_b_long.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--Heavy Compensator
		self.parts.wpn_fps_upg_ns_ass_smg_heavy.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_heavy.stats = {
			value = 1,
			spread = 1,
			concealment = -3
		}

		--(Claire 12G) Huntsman Barrel
		self.parts.wpn_fps_sho_coach_b_long.supported = true
		self.parts.wpn_fps_sho_coach_b_long.stats = {
			value = 1,
			spread = 2,
			recoil = -2,
			concealment = -2
		}

		--(Lion's Roar) Urban Heat Kit
		self.parts.wpn_fps_ass_vhs_body_camo.supported = true
		self.parts.wpn_fps_ass_vhs_body_camo.stats = {
			value = 1,
			spread = 1,
			recoil = 1,
			concealment = -5
		}

		--HeistEye Target Marker
		self.parts.wpn_fps_upg_fl_ass_smg_sho_marker.supported = true
		self.parts.wpn_fps_upg_fl_ass_smg_sho_marker.stats = {
			value = 3,
			concealment = -2
		}

		--(Castigo) Smooth Cylinder
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.supported = true
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats = {
			value = 1				
		}

		--(M13) Chrome Slide
		self.parts.wpn_fps_pis_legacy_sl_chrome.supported = true
		self.parts.wpn_fps_pis_legacy_sl_chrome.stats = {
			value = 1
		}

		--(White Streak) Chrome Slide
		self.parts.wpn_fps_pis_pl14_sl_chrome.supported = true
		self.parts.wpn_fps_pis_pl14_sl_chrome.stats = {
			value = 1
		}

		--(Castigo) Largo Barrel
		self.parts.wpn_fps_pis_chinchilla_b_longboy.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_longboy.stats = {
			value = 5,
			spread = 2,
			recoil = -2,
			concealment = -2
		}

		--Valkyrie Stock
		self.parts.wpn_fps_ass_m16_s_op.supported = true
		self.parts.wpn_fps_ass_m16_s_op.stats = {
			value = 2,
			spread = -1,
			recoil = 2,
			concealment = -2
		}

		--(Deagle) Steady Wooden Grip
		self.parts.wpn_fps_pis_deagle_g_wooden.supported = true
		self.parts.wpn_fps_pis_deagle_g_wooden.stats = {
			value = 1,
			recoil = 3,
			spread = -1,
			concealment = -8 --Pistols have doubled swap speed, so concealment mods have to be *really* fucking harsh.
		}
		
		--(Peacemaker) Polymer Grip
		self.parts.wpn_fps_pis_peacemaker_g_black.supported = true
		self.parts.wpn_fps_pis_peacemaker_g_black.stats = {
			value = 1
		}

		--Rutted Receiver
		self.parts.wpn_fps_ass_74_upper_receiver_bump.supported = true
		self.parts.wpn_fps_ass_74_upper_receiver_bump.stats = {
			value = 1
		}

		--Plastic Handguard.
		self.parts.wpn_fps_ass_ak_fg_waffle.supported = true
		self.parts.wpn_fps_ass_ak_fg_waffle.stats = {
			value = 1,
			spread = -1,
			recoil = -2,
			concealment = 3
		}

		--(Stryk) Striking Slide
		self.parts.wpn_fps_pis_g18c_b_long.supported = true
		self.parts.wpn_fps_pis_g18c_b_long.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Bootleg) Anarchist Grip
		self.parts.wpn_fps_ass_tecci_vg_ergo.supported = true
		self.parts.wpn_fps_ass_tecci_vg_ergo.stats = {
			value = 1,
			spread = -1,
			concealment = 1
		}

		--(Loco) Railed Pump
		self.parts.wpn_fps_shot_shorty_fg_rail.supported = true
		self.parts.wpn_fps_shot_shorty_fg_rail.stats = {
			value = 1,
			recoil = -1,
			concealment = 1				
		}					

		--(Bootleg) SG Compact Stock
		self.parts.wpn_fps_ass_tecci_s_minicontra.supported = true
		self.parts.wpn_fps_ass_tecci_s_minicontra.stats = {
			value = 2,
			recoil = 1,
			spread = 2,
			concealment = -8
		}

		--(AK17) Smooth Grip
		self.parts.wpn_fps_ass_flint_g_custom.supported = true
		self.parts.wpn_fps_ass_flint_g_custom.stats = {
			value = 2,
			recoil = -1,
			concealment = 1
		}

		--Ratnik Stock
		self.parts.wpn_fps_ass_m4_s_russian.supported = true
		self.parts.wpn_fps_ass_m4_s_russian.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Castigo) Corto Barrel
		self.parts.wpn_fps_pis_chinchilla_b_short.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_short.stats = {
			value = 1,
			spread = -1,
			recoil = -1,				
			concealment = 2
		}

		--(Castigo) Pearl Grip
		self.parts.wpn_fps_pis_chinchilla_g_pearl.supported = true
		self.parts.wpn_fps_pis_chinchilla_g_pearl.stats = {
			value = 1
		}

		--(Platypus) Discrete Stock
		self.parts.wpn_fps_snp_model70_s_discrete.supported = true
		self.parts.wpn_fps_snp_model70_s_discrete.stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}

		--(Platypus) Scout Barrel
		self.parts.wpn_fps_snp_model70_b_smol.supported = true
		self.parts.wpn_fps_snp_model70_b_smol.stats = {
			value = 1,
			spread = -1,
			recoil = -1,
			concealment = 2
		}

		--(Union 5.56) Medium Barrel
		self.parts.wpn_fps_ass_corgi_b_medium.supported = true
		self.parts.wpn_fps_ass_corgi_b_medium.stats = {
			value = 2,
			recoil = 1,
			spread = -1
		}

		--(Contractor) Long Barrel
		self.parts.wpn_fps_snp_tti_b_long.supported = true
		self.parts.wpn_fps_snp_tti_b_long.stats = {
			value = 3,
			recoil = 1,
			spread = 1,
			concealment = -5
		}

		--(Jacket's Piece) Overdose Magazine
		self.parts.wpn_fps_smg_cobray_m_extended.supported = true
		self.parts.wpn_fps_smg_cobray_m_extended.stats = {
			value = 2,
			extra_ammo = 12,
			concealment = -2,				
			reload = -3
		}
		self.parts.wpn_fps_smg_cobray_m_extended_akimbo.supported = true
		self.parts.wpn_fps_smg_cobray_m_extended_akimbo.stats = {
			value = 2,
			extra_ammo = 24,
			concealment = -2,				
			reload = -3
		}

		--(Eagle Heavy) Extended Magazine
		self.parts.wpn_fps_ass_scar_m_extended.supported = true
		self.parts.wpn_fps_ass_scar_m_extended.stats = {
			value = 2,
			extra_ammo = 10,
			concealment = -1,
			reload = -3
		}

		--(Broomstick) Snub Barrel
		--Doesn't actually seem to appear???
		self.parts.wpn_fps_pis_c96_b_short.supported = true
		self.parts.wpn_fps_pis_c96_b_short.stats = {
			value = 1,
			spread = -1,
			recoil = -2,
			concealment = 2
		}
		--self.parts.wpn_fps_pis_c96_b_short.custom_stats = nil -- just making sure these are removed.

		--(Chicago Typewriter) Refurbished Foregrip
		self.parts.wpn_fps_smg_thompson_fg_custom.supported = true
		self.parts.wpn_fps_smg_thompson_fg_custom.stats = {
			value = 1,
			spread = 1,
			recoil = 1,
			concealment = -5
		}

		--(Chicago Typewriter) Folding Stock
		self.parts.wpn_fps_smg_thompson_stock_fold.supported = true
		self.parts.wpn_fps_smg_thompson_stock_fold.stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}

		--(GSPS 12G) Ergo Stock
		self.parts.wpn_fps_shot_m37_s_ergo.supported = true
		self.parts.wpn_fps_shot_m37_s_ergo.stats = {
			spread = -1,
			value = 1,
			recoil = 1
		}

		--(GSPS 12G) Tactical Pump
		self.parts.wpn_fps_shot_m37_fg_tactical.supported = true
		self.parts.wpn_fps_shot_m37_fg_tactical.stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}

		--(GSPS 12G) Combat Pump
		self.parts.wpn_fps_shot_m37_fg_long.supported = true
		self.parts.wpn_fps_shot_m37_fg_long.stats = {
			value = 1,
			recoil = 1,
			concealment = -2
		}

		--Schäfer Grip
		self.parts.wpn_fps_ass_m4_g_sg.supported = true
		self.parts.wpn_fps_ass_m4_g_sg.stats = {
			value = 2,
			recoil = -1,
			concealment = 1
		}

		--(Nagant) Comfort Stock
		self.parts.wpn_fps_snp_mosin_body_grip.supported = true
		self.parts.wpn_fps_snp_mosin_body_grip.stats = {
			value = 1,
			recoil = 1,
			concealment = -2
		}

		--(Broomstick) Finned Barrel
		self.parts.wpn_fps_pis_c96_b_finned.supported = true
		self.parts.wpn_fps_pis_c96_b_finned.stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Peacemaker) Smooth Cylinder
		self.parts.wpn_fps_pis_peacemaker_m_smooth.supported = true
		self.parts.wpn_fps_pis_peacemaker_m_smooth.stats = {
			value = 2
		}

		--(Compact 5) Match Magazine
		self.parts.wpn_fps_smg_mp5_m_custom.supported = true
		self.parts.wpn_fps_smg_mp5_m_custom.stats = {
			value = 4,
			reload = 1,
			recoil = -1
		}

		--Grievky Nozzle
		self.parts.wpn_fps_upg_ns_ass_smg_russian.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_russian.stats = {
			value = 4,
			suppression = -2,
			recoil = 1,
			spread = -1
		}

		--Assassin Suppressor
		self.parts.wpn_fps_upg_ns_pis_cloth.supported = true
		self.parts.wpn_fps_upg_ns_pis_cloth.stats = {
			value = 7,
			suppression = 10,
			alert_size = -1
		}

		--(Galant) Prototype Carbine Stock
		self.parts.wpn_fps_ass_ching_s_why.supported = true
		self.parts.wpn_fps_ass_ching_s_why.stats = {
			value = 1,
			spread = -1,
			recoil = -1,
			concealment = 2
		}

		--(GSPS 12G) Hunting Barrel
		self.parts.wpn_fps_shot_m37_b_ridge.supported = true
		self.parts.wpn_fps_shot_m37_b_ridge.stats = {
			value = 1,
			accuracy = -1,
			recoil = 1
		}

		--(GSPS 12G) Folding Stock
		self.parts.wpn_fps_shot_m37_s_tactical.supported = true
		self.parts.wpn_fps_shot_m37_s_tactical.stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}

		--Trench Sweeper Nozzle
		self.parts.wpn_fps_upg_ns_shot_grinder.supported = true
		self.parts.wpn_fps_upg_ns_shot_grinder.stats = {
			value = 5,
			suppression = -2,
			recoil = -2,
			spread = 2
		}

		--(Parabellum) Discrete Grip
		self.parts.wpn_fps_pis_breech_g_stealth.supported = true
		self.parts.wpn_fps_pis_breech_g_stealth.stats = {
			value = 2,
			concealment = 1,
			recoil = -1
		}

		--(Repeater 1874) Mare's Leg Barrel
		self.parts.wpn_fps_snp_winchester_b_short.supported = true
		self.parts.wpn_fps_snp_winchester_b_short.stats = {
			value = 2,
			extra_ammo = -3,
			concealment = 1,
			recoil = 1
		}

		--(Contractor) Bling Slide
		self.parts.wpn_fps_pis_packrat_sl_silver.supported = true
		self.parts.wpn_fps_pis_packrat_sl_silver.stats = {
			value = 6
		}

		--(AK17) Flint Magazine
		self.parts.wpn_fps_ass_flint_m_long.supported = true
		self.parts.wpn_fps_ass_flint_m_long.stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		}

		--(AK17) Short Barrel
		self.parts.wpn_fps_ass_flint_b_short.supported = true
		self.parts.wpn_fps_ass_flint_b_short.stats = {
			value = 1,
			concealment = 1,
			recoil = -1
		}

		--(Little Friend) Skeletal Stock
		self.parts.wpn_fps_ass_contraband_s_tecci.supported = true
		self.parts.wpn_fps_ass_contraband_s_tecci.stats = {
			value = 3,
			accuracy = -1,
			concealment = 1
		}

		--(5/7 AP) Sport Barrel
		self.parts.wpn_fps_pis_lemming_b_long.supported = true
		self.parts.wpn_fps_pis_lemming_b_long.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Crosskill Classic) Wooden Grip
		self.parts.wpn_fps_pis_cold_g_wood.supported = true
		self.parts.wpn_fps_pis_cold_g_wood.stats = {
			value = 3
		}

		--(Crosskill Classic) Sneaky Frame
		self.parts.wpn_fps_pis_cold_body_custom.supported = true
		self.parts.wpn_fps_pis_cold_body_custom.stats = {
			value = 2,
			recoil = -1,
			concealment = 1
		}

		--(Crosskill Classic) Equalizer Compensator
		self.parts.wpn_fps_pis_cold_sl_comp1.supported = true
		self.parts.wpn_fps_pis_cold_sl_comp1.stats = {
			value = 7,
			spread = -2,
			recoil = 2
		}

		--(Crosskill Classic) Stonecold Compensator
		self.parts.wpn_fps_pis_cold_sl_comp2.supported = true
		self.parts.wpn_fps_pis_cold_sl_comp2.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Crosskill Classic) Extended Magazine
		self.parts.wpn_fps_pis_cold_m_extended.supported = true
		self.parts.wpn_fps_pis_cold_m_extended.stats = {
			value = 2,
			concealment = -1,
			extra_ammo = 4,		
			reload = -2
		}

		--(Grom) Short Barrel
		self.parts.wpn_fps_snp_siltstone_b_short.supported = true
		self.parts.wpn_fps_snp_siltstone_b_short.stats = {
			value = 1,
			concealment = 1,
			recoil = -1
		}

		--(5/7 AP) Striking Kit
		self.parts.wpn_fps_pis_lemming_body_silver.supported = true
		self.parts.wpn_fps_pis_lemming_body_silver.stats = {
			value = 4
		}

		--(Microgun) XL Barrel
		self.parts.wpn_fps_lmg_shuno_b_long.supported = true
		self.parts.wpn_fps_lmg_shuno_b_long.stats = {
			value = 3,
			recoil = 3,
			concealment = -6
		}

		--(Signature) Long Foregrip
		self.parts.wpn_fps_smg_shepheard_body_long.supported = true
		self.parts.wpn_fps_smg_shepheard_body_long.stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Tempest 21) Long Barrel
		self.parts.wpn_fps_ass_komodo_b_long.supported = true
		self.parts.wpn_fps_ass_komodo_b_long.stats = {
			value = 1,
			spread = 1,	
			concealment = -1,
			recoil = -1
		}

		--(Crosskill) Classic Grip
		self.parts.wpn_fps_pis_1911_g_classic.supported = true
		self.parts.wpn_fps_pis_1911_g_classic.stats = {
			value = 2,
			spread = 1,
			recoil = -1			
		}

		--Sport Grip
		self.parts.wpn_fps_ass_m4_g_fancy.supported = true
		self.parts.wpn_fps_ass_m4_g_fancy.stats = {
			value = 1,
			spread = 1,
			concealment = -3
		}

		--(AMR-16) Aftermarket Marksman Foregrip
		self.parts.wpn_fps_ass_m16_fg_smooth.supported = true
		self.parts.wpn_fps_ass_m16_fg_smooth.stats = {
			value = 5,
			concealment = 1,
			recoil = -1
		}

		--(AK17) Marksman Stock
		self.parts.wpn_fps_ass_flint_s_solid.supported = true
		self.parts.wpn_fps_ass_flint_s_solid.stats = {
			value = 1,
			recoil = -1,
			concealment = -1,				
			spread = 1
		}

		--(Little Friend) Long Barrel
		self.parts.wpn_fps_ass_contraband_b_long.supported = true
		self.parts.wpn_fps_ass_contraband_b_long.stats = {
			value = 1,
			spread = 1,	
			concealment = -1,
			recoil = -1
		}

		--(Little Friend) Short Barrel
		self.parts.wpn_fps_ass_contraband_b_short.supported = true
		self.parts.wpn_fps_ass_contraband_b_short.stats = {
			value = 1,
			spread = -1,	
			concealment = 1
		}

		--(AK17) Long Barrel
		self.parts.wpn_fps_ass_flint_b_long.supported = true
		self.parts.wpn_fps_ass_flint_b_long.stats = {
			value = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(GSPS 12G) Riot Sight 
		self.parts.wpn_fps_shot_m37_o_expert.supported = true 
		self.parts.wpn_fps_shot_m37_o_expert.stats = {
			value = 1
		}	

		--(Predator 12G) Short Barrel
		self.parts.wpn_fps_sho_b_spas12_small.supported = true
		self.parts.wpn_fps_sho_b_spas12_small.stats = {
			value = 1,
			spread = -1,
			concealment = 1
		}
		self.parts.wpn_fps_sho_b_spas12_small.custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1			
		}

		--Modern Magazine
		self.parts.wpn_fps_ass_ak_m_proto.supported = true
		self.parts.wpn_fps_ass_ak_m_proto.stats = {
			value = 2,
			reload = 1,
			recoil = -1
		}

		--(AMR-12G) Big Brother Magazine
		self.parts.wpn_fps_shot_amr12_m_extended.supported = true
		self.parts.wpn_fps_shot_amr12_m_extended.stats = {
			value = 1, 
			extra_ammo = 3, 
			reload = -1,
			concealment = -1
		}

		--(AMR-12G) Wire Stock
		self.parts.wpn_fps_shot_amr12_s_wire.supported = true
		self.parts.wpn_fps_shot_amr12_s_wire.stats = {
			value = 5,
			spread = -1,
			recoil = -1,
			concealment = 2
		}

		--(SG-416) Long Barrel
		self.parts.wpn_fps_ass_sg416_b_long.supported = true
		self.parts.wpn_fps_ass_sg416_b_long.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Spiker 7.62) Long Foregrip
		self.parts.wpn_fps_ass_spike_fg_long.supported = true
		self.parts.wpn_fps_ass_spike_fg_long.stats = {
			value = 5,
			recoil = 1,
			spread = -1
		}

		--(Spiker 7.62) Long Barrel 
		self.parts.wpn_fps_ass_spike_b_long.supported = true 
		self.parts.wpn_fps_ass_spike_b_long.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--SG416 default parts...
		self.parts.wpn_fps_ass_sg416_s_standard.supported = true
		self.parts.wpn_fps_ass_sg416_s_standard.stats = {
			value = 1	
		}
		self.parts.wpn_fps_ass_sg416_m_standard.supported = true
		self.parts.wpn_fps_ass_sg416_m_standard.stats = {
			value = 1
		}	
		self.parts.wpn_fps_ass_sg416_dh_custom.supported = true	
		self.parts.wpn_fps_ass_sg416_dh_custom.stats = {
			value = 0
		}
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_m4_uupg_m_std")
		self.wpn_fps_ass_sg416.override.wpn_fps_m4_uupg_m_std = {
			supported = true,
			stats = {
				value = 1
			}
		}

		--(SG 416) Schäfer Prototype Foregrip
		self.parts.wpn_fps_ass_sg416_fg_custom.supported = true
		self.parts.wpn_fps_ass_sg416_fg_custom.stats = {
			value = 2,
			recoil = 1,
			concealment = -2
		}

		--(Automat-5) Long Barrel
		self.parts.wpn_fps_smg_ak5s_b_long.supported = true
		self.parts.wpn_fps_smg_ak5s_b_long.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Automat-5) Aftermarket Magazine
		self.parts.wpn_fps_smg_ak5s_m_new.supported = true
		self.parts.wpn_fps_smg_ak5s_m_new.stats = {
			value = 1,
			reload = 1,
			recoil = -1
		}

		--(Automat-5) Curved Magazine
		self.parts.wpn_fps_smg_ak5s_m_curve.supported = true
		self.parts.wpn_fps_smg_ak5s_m_curve.stats = {
			value = 1
		}

		--(Automat-5) Match Magazine
		self.parts.wpn_fps_smg_ak5s_m_smol.supported = true
		self.parts.wpn_fps_smg_ak5s_m_smol.stats = {
			value = 1
		}
		
		--(Automat-5) Wrist Breaker Stock
		self.parts.wpn_fps_smg_ak5s_nostock.supported = true
		self.parts.wpn_fps_smg_ak5s_nostock.stats = {
			value = 1,
			recoil = -3,
			concealment = 3
		}

		--(Acar-9) Steel Barrel
		self.parts.wpn_fps_smg_car9_b_long.supported = true
		self.parts.wpn_fps_smg_car9_b_long.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1,
			suppression = 1
		}

		self.parts.wpn_fps_smg_car9_b_standard.supported = true

		self.parts.wpn_fps_smg_car9_b_standard.stats = {
			value = 1
		}

		--(ACAR-9) Extended Magazine
		self.parts.wpn_fps_smg_car9_m_extended.supported = true
		self.parts.wpn_fps_smg_car9_m_extended.stats = {
			value = 1,
			extra_ammo = 10,
			reload = -2,
			concealment = -1
		}

		--(ACAR-9) Hush Foregrip
		self.parts.wpn_fps_smg_car9_fg_rail.supported = true
		self.parts.wpn_fps_smg_car9_fg_rail.stats = {
			value = 2,
			recoil = -1,
			concealment = 1
		}

		--(Reinbeck) Classic Heat Barrel
		self.parts.wpn_fps_shot_beck_b_heat_dummy.supported = true
		self.parts.wpn_fps_shot_beck_b_heat_dummy.stats = {
			value = 2,
			recoil = 1,
			concealment = -2
		}

		--(Reinbeck) Enforcer Stock
		self.parts.wpn_fps_shot_beck_s_tac.supported = true
		self.parts.wpn_fps_shot_beck_s_tac.stats = {
			value = 3,
			spread = 1,
			spread_moving = 1,
			concealment = -2
		}
		self.parts.wpn_fps_shot_beck_s_tac.custom_stats = {
			damage_far_mul = 1,
			damage_near_mul = 1
		}

		--(Reinbeck) Ghost Stock
		self.parts.wpn_fps_shot_beck_s_wrist.supported = true
		self.parts.wpn_fps_shot_beck_s_wrist.stats = {
			value = 4,
			concealment = 1,
			recoil = -1
		}

		--Continental Mag
		self.parts.wpn_fps_ass_m4_m_wick.supported = true
		self.parts.wpn_fps_ass_m4_m_wick.stats = {
			value = 2,
			concealment = 2,
			reload = 1,
			extra_ammo = -10
		}

		--(Reinbeck) Extended Tube
		self.parts.wpn_fps_shot_beck_ext.supported = true
		self.parts.wpn_fps_shot_beck_ext.stats = {
			value = 7,
			concealment = -1,
			extra_ammo = 2
		}

		--(Breaker 12G) Tactical Stock
		self.parts.wpn_fps_sho_boot_s_black.supported = true
		self.parts.wpn_fps_sho_boot_s_black.stats = {
			value = 2,
			concealment = -2,
			recoil = 1
		}

		--(JP36) Sniper Grip
		self.parts.wpn_fps_ass_g36_g_sniper.supported = true
		self.parts.wpn_fps_ass_g36_g_sniper.stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}


		self.parts.wpn_fps_ass_s552_o_custom.supported = true


		self.parts.wpn_fps_ass_s552_o_custom.stats = {
			value = 0
		}

		--(HRL-7) Very Subtble Grip
		self.parts.wpn_fps_rpg7_body_subtle.supported = true
		self.parts.wpn_fps_rpg7_body_subtle.stats = {
			value = 2,
			spread = -1,
			concealment = 1
		}
		self.parts.wpn_fps_rpg7_body_subtle.custom_stats = {
			movement_speed = 0.85
		}

		--(Eagle Heavy) Eagle Aftermarket Grip
		self.parts.wpn_fps_ass_scar_g_tan.supported = true
		self.parts.wpn_fps_ass_scar_g_tan.stats = {
			value = 1,
			recoil = 1,
			concealment = -2
		}			
		
		--Low Profile Compensator
		self.parts.wpn_fps_upg_pis_ns_edge.supported = true
		self.parts.wpn_fps_upg_pis_ns_edge.stats = {
			value = 4,
			recoil = -1,
			concealment = 2,
			spread = -1
		}

		--(Reinbeck) Shell Rack
		self.parts.wpn_fps_shot_beck_shells.supported = true
		self.parts.wpn_fps_shot_beck_shells.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 1
		}

		--(Draco) Swift Magazine
		self.parts.wpn_fps_pis_smolak_m_custom.supported = true
		self.parts.wpn_fps_pis_smolak_m_custom.stats = {
			value = 1,
			spread = -1,
			concealment = -1,
			reload = 3
		}

		--(Guerilla .308) Sniper Stock
		self.parts.wpn_fps_snp_sgs_s_sniper.supported = true
		self.parts.wpn_fps_snp_sgs_s_sniper.stats = { 
			value = 2,
			spread = 1,
			concealment = -3
		}

		--(Guerilla .308) Marksman Grip
		self.parts.wpn_fps_snp_sgs_g_black.supported = true
		self.parts.wpn_fps_snp_sgs_g_black.stats = { 
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Guerilla .308) Extended Barrel
		self.parts.wpn_fps_snp_sgs_b_long.supported = true
		self.parts.wpn_fps_snp_sgs_b_long.stats = { 
			value = 2,
			spread = 1,
			concealment = -1,
			recoil = -1
		}

		--(Guerilla .308) Suppressed Barrel
		self.parts.wpn_fps_snp_sgs_b_sil.supported = true
		self.parts.wpn_fps_snp_sgs_b_sil.stats = { 
			value = 1,
			suppression = 14,
			alert_size = -1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Guerilla .308) Scout foregrip
		self.parts.wpn_fps_snp_sgs_fg_rail.supported = true
		self.parts.wpn_fps_snp_sgs_fg_rail.stats = { 
			value = 2,
			concealment = 1,
			recoil = 1,
			accuracy = -2
		}

		--(Draco Pistol) Discreet Foregrip
		self.parts.wpn_fps_pis_smolak_fg_polymer.supported = true
		self.parts.wpn_fps_pis_smolak_fg_polymer.stats = {
			value = 1,
			concealment = 1,
			recoil = -1
		}

		--(AMR-12G) Enforcer Grip
		self.parts.wpn_fps_shot_amr12_fg_railed.supported = true
		self.parts.wpn_fps_shot_amr12_fg_railed.stats = {
			value = 7,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
		self.parts.wpn_fps_shot_amr12_fg_railed.custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1			
		}

		--(AMG-12G) Breacher Foregrip
		self.parts.wpn_fps_shot_amr12_fg_short.supported = true
		self.parts.wpn_fps_shot_amr12_fg_short.stats = {
			value = 4,
			spread = -1,
			recoil = -1,
			concealment = 2
		}
		self.parts.wpn_fps_shot_amr12_fg_short.custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1			
		}

		self.parts.wpn_fps_shot_amr12_b_standard.supported = true

		self.parts.wpn_fps_shot_amr12_b_standard.stats = {
			value = 1,
		}
		self.parts.wpn_fps_shot_amr12_b_standard.custom_stats = nil

		self.wpn_fps_shot_amr12.override = {
			wpn_fps_upg_a_slug = {
				name_id = "bm_wp_upg_a_slug",
				desc_id = "bm_wp_upg_a_slug_desc",
				supported = true,
				stats = {
					value = 10,
					concealment = -5,
					total_ammo_mod = -25,
					damage = 15,
					spread = 8,
					spread_multi = {1, 1},	
					recoil = -2,
					moving_spread = 0
				},
				custom_stats = {
					muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
					damage_near_mul = 999,
					damage_far_mul = 999,
					rays = 1,
					armor_piercing_add = 1,
					can_shoot_through_enemy = true,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true
				}
			},
			wpn_fps_upg_a_custom = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 15
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},
			wpn_fps_upg_a_custom_free = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -25,
					damage = 15
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},			
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					total_ammo_mod = -50,
					recoil = -5,
					spread_multi = {1, 1},	
					damage = 30
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			wpn_fps_upg_a_piercing = a_piercing_auto_override,
			wpn_fps_upg_a_dragons_breath = a_dragons_breath_auto_override
		}
		self.wpn_fps_shot_beck.override = {
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -5,
					concealment = -7,
					spread_multi = {1, 1},	
					total_ammo_mod = -50,
					damage = 90
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			}
		}
		
	end

	if self.wpn_fps_smg_owen then 	-- Silent Enforcer's Owen Gun		
			self.parts.wpn_fps_smg_owen_m_double.supported = true		
			self.parts.wpn_fps_smg_owen_m_double.stats = {
					value = 2,
					spread = -1,
					concealment = -1,
					reload = 3
				}														
			self.parts.wpn_fps_smg_owen_sling.supported = true														
			self.parts.wpn_fps_smg_owen_sling.stats = {
					value = 0
				}			
			self.parts.wpn_fps_smg_owen_s_wood.supported = true			
			self.parts.wpn_fps_smg_owen_s_wood.stats = {
					value = 2,
					recoil = 1,
					concealment = -1
				}
			self.parts.wpn_fps_smg_owen_s_no.supported = true
			self.parts.wpn_fps_smg_owen_s_no.stats = {
					value = 2,
					recoil = -2,
					concealment = 3
				}							
			self.parts.wpn_fps_smg_owen_low_window.supported = true							
			self.parts.wpn_fps_smg_owen_low_window.stats = {
					value = 1,
					spread = -1,
					concealment = 1						
				}															
			self.parts.wpn_fps_smg_owen_b_43.supported = true															
			self.parts.wpn_fps_smg_owen_b_43.stats = {
					value = 4,
					spread = -1,
					recoil = 2,
				}					
		end				

	if self.wpn_fps_ass_aek971 then -- Pawcio's AEK 971
		self.parts.wpn_fps_upg_aek971_stock_pad.supported = true
		self.parts.wpn_fps_upg_aek971_stock_pad.stats = {
			value = 1,				
			recoil = 1,
			spread = -1
		}
		self.parts.wpn_fps_upg_aek971_mag_rpk.supported = true
		self.parts.wpn_fps_upg_aek971_mag_rpk.stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -1
		}							
		self.parts.wpn_fps_upg_aek971_mag_magpul.supported = true							
		self.parts.wpn_fps_upg_aek971_mag_magpul.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 3
		}	
		self.parts.wpn_fps_upg_aek971_mag_magpul.has_description = false														
		self.parts.wpn_fps_upg_aek971_dtk1.supported = true														
		self.parts.wpn_fps_upg_aek971_dtk1.stats = {
			value = 5,
			suppression = -4,
			spread = -2,
			recoil = 2
		}	
		self.parts.wpn_fps_upg_aek971_supp_tgp_a.supported = true	
		self.parts.wpn_fps_upg_aek971_supp_tgp_a.stats = {
			value = 2,
			suppression = 11,
			alert_size = -1,
			recoil = 1,
			concealment = -2
		}	
				
	end						

if self.wpn_fps_smg_czevo then 	--Gambyt's Scorpion EVO
	self.parts.wpn_fps_smg_czevo_a_strong.pcs = nil
	self.parts.wpn_fps_smg_czevo_a_classic.pcs = nil	
	table.list_append(self.wpn_fps_smg_czevo.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_smg_czevo.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})		
	self.parts.wpn_fps_smg_czevo_barrel_long.supported = true		
	self.parts.wpn_fps_smg_czevo_barrel_long.stats = {
				value = 1,
				spread = 1,
				concealment = -1
			}	
	self.parts.wpn_fps_smg_czevo_vg_tti.supported = true	
	self.parts.wpn_fps_smg_czevo_vg_tti.stats = {
				value = 1,
				recoil = 1,
				concealment = -2
			}					
	self.parts.wpn_fps_smg_czevo_vg_handstop.supported = true					
	self.parts.wpn_fps_smg_czevo_vg_handstop.stats = {
				value = 1,
				recoil = -1,
				concealment = 2
			}		
	self.parts.wpn_fps_smg_czevo_vg_ptk.supported = true		
	self.parts.wpn_fps_smg_czevo_vg_ptk.stats = {
				value = 1,
				spread = 1,
				concealment = -2
			}		
	self.parts.wpn_fps_smg_czevo_vg_angled.supported = true		
	self.parts.wpn_fps_smg_czevo_vg_angled.stats = {
				value = 1,
				recoil = -1,
				concealment = 2
			}																	
	self.parts.wpn_fps_smg_czevo_sight_troy.supported = true																	
	self.parts.wpn_fps_smg_czevo_sight_troy.stats = {
				value = 1
			}			
	self.parts.wpn_fps_smg_czevo_vg_cover.supported = true			
	self.parts.wpn_fps_smg_czevo_vg_cover.stats = {
				value = 1
			}					
	self.parts.wpn_fps_smg_czevo_mag_speed.pcs = nil
	self.parts.wpn_fps_smg_czevo_barrel_silenced.supported = true
	self.parts.wpn_fps_smg_czevo_barrel_silenced.stats = {
				value = 10,
				suppression = 13,
				alert_size = -1,
				concealment = -4,
				spread = 2,
				recoil = -1
			}
		end		

	if self.parts.wpn_fps_upg_o_prismatic then --Pawcio's SIGtac CP1
		self.parts.wpn_fps_upg_o_prismatic.supported = true
		self.parts.wpn_fps_upg_o_prismatic.stats = {
			concealment = -3,
			spread_moving = -3,
			zoom = 3,
			value = 5
		}
	end

	if self.parts.wpn_fps_upg_o_rmr_riser then --Pawcio's Trijicon RMR
		self.parts.wpn_fps_upg_o_rmr_riser.supported = true
		self.parts.wpn_fps_upg_o_rmr_riser.stats = {
			concealment = 0,
			zoom = 0,
			value = 0
		}
	end

	if self.parts.wpn_fps_upg_o_pkas then --Pawcio's PKA-S
		self.parts.wpn_fps_upg_o_pkas.supported = true
		self.parts.wpn_fps_upg_o_pkas.stats = {
			concealment = -1,
			spread_moving = -1,
			zoom = 1,
			value = 3
		}
	end

	if self.parts.wpn_fps_upg_o_m145 then --Pawcio's ELCAN C79
		self.parts.wpn_fps_upg_o_m145.supported = true
		self.parts.wpn_fps_upg_o_m145.stats = {
			concealment = -5,
			spread_moving = -5,
			zoom = 5,
			value = 8
		}
	end

	if self.parts.wpn_fps_upg_o_anpas13d then --Pawcio's ANPAS-13D Night Vision
		self.parts.wpn_fps_upg_o_anpas13d.supported = true
		self.parts.wpn_fps_upg_o_anpas13d.stats = {
			concealment = -3,
			spread_moving = -3,
			zoom = 3,
			value = 5
		}
	end

	if self.parts.wpn_fps_upg_o_pn23 then --Silent Enforcer's PN 23 Night
		self.parts.wpn_fps_upg_o_pn23.supported = true
		self.parts.wpn_fps_upg_o_pn23.stats = {
			concealment = -5,
			spread_moving = -5,
			zoom = 5,
			value = 8
		}
	end

	if self.parts.wpn_fps_gre_arbiter_o_smart then --Alcat's Arbiter Scope
		self.parts.wpn_fps_gre_arbiter_o_smart.supported = true
		self.parts.wpn_fps_gre_arbiter_o_smart.stats = {
			spread = 2,
			concealment = -4
		}
		self.parts.wpn_fps_gre_arbiter_o_smart.has_description = true
		self.parts.wpn_fps_gre_arbiter_o_smart.forbids = {"wpn_fps_upg_a_grenade_launcher_incendiary_arbiter"}
	end		

	if self.parts.wpn_fps_upg_o_compm4s then --Pawcio's Aimpoint Comp M4s Sight
		self.parts.wpn_fps_upg_o_compm4s.supported = true
		self.parts.wpn_fps_upg_o_compm4s.stats = {
				value = 3,
				zoom = 5
			}			
		end


	if self.parts.wpn_fps_ass_komodo_o_tele then --Alcat's F2000 Sight
		self.parts.wpn_fps_ass_komodo_o_tele.supported = true
		self.parts.wpn_fps_ass_komodo_o_tele.stats = {
			value = 1
			}			
		end	

	if self.parts.wpn_fps_upg_o_snp_m4flipup_rear then --Pawcio's Ironsights Pack
		self.parts.wpn_fps_upg_o_snp_m4flipup_rear.supported = true
		self.parts.wpn_fps_upg_o_snp_m4flipup_rear.stats = {
			value = 0
			}		
		self.parts.wpn_fps_upg_o_snp_mbus_rear.supported = true		
		self.parts.wpn_fps_upg_o_snp_mbus_rear.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_o_snp_troy_rear.supported = true
		self.parts.wpn_fps_upg_o_snp_troy_rear.stats = {
			value = 0
			}			
		self.parts.wpn_fps_upg_o_snp_troym4_rear.supported = true			
		self.parts.wpn_fps_upg_o_snp_troym4_rear.stats = {
			value = 0
			}								
		self.parts.wpn_fps_upg_o_snp_scorpionevo_rear.supported = true								
		self.parts.wpn_fps_upg_o_snp_scorpionevo_rear.stats = {
			value = 0
			}				
		self.parts.wpn_fps_upg_o_snp_kac_rear.supported = true				
		self.parts.wpn_fps_upg_o_snp_kac_rear.stats = {
			value = 0
			}				
		self.parts.wpn_fps_upg_o_snp_dd_a1_rear.supported = true				
		self.parts.wpn_fps_upg_o_snp_dd_a1_rear.stats = {
			value = 0
			}											
		end			
		
	if self.parts.wpn_fps_upg_1911_tritium then --Pawcio's Illuminated Ironsights Pack
		self.parts.wpn_fps_upg_b92fs_tritium.supported = true
		self.parts.wpn_fps_upg_b92fs_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_1911_tritium.supported = true	
		self.parts.wpn_fps_upg_1911_tritium.stats = {
			value = 0
			}		
		self.parts.wpn_fps_upg_beer_tritium.supported = true		
		self.parts.wpn_fps_upg_beer_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_czech_tritium.supported = true	
		self.parts.wpn_fps_upg_czech_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_deagle_tritium.supported = true	
		self.parts.wpn_fps_upg_deagle_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_p226_tritium.supported = true	
		self.parts.wpn_fps_upg_p226_tritium.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_pl14_tritium.supported = true
		self.parts.wpn_fps_upg_pl14_tritium.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_shrew_tritium.supported = true
		self.parts.wpn_fps_upg_shrew_tritium.stats = {
			value = 0
			}																							
		self.parts.wpn_fps_upg_stech_tritium.supported = true																							
		self.parts.wpn_fps_upg_stech_tritium.stats = {
			value = 0
			}																											
		end
					
	if self.parts.wpn_fps_upg_o_compm2 then --Pawcio's Aimpoint Comp M2 Sight		
		self.parts.wpn_fps_upg_o_compm2.supported = true		
		self.parts.wpn_fps_upg_o_compm2.stats = {
				value = 3,
				zoom = 5
			}		
		end				

	if self.parts.wpn_fps_upg_o_okp7_dove then --Pawcio's Russian Sight Pack 
		self.parts.wpn_fps_upg_o_okp7_dove.supported = true 
		self.parts.wpn_fps_upg_o_okp7_dove.stats = {
			value = 3,
			zoom = 2	
			}	
		self.parts.wpn_fps_upg_o_pso1.supported = true	
		self.parts.wpn_fps_upg_o_pso1.stats = {
			value = 8,
			zoom = 40
			}				
		self.parts.wpn_fps_upg_o_pso1_rifle.supported = true				
		self.parts.wpn_fps_upg_o_pso1_rifle.stats = {
			value = 8,
			zoom = 40
			}	
		self.parts.wpn_fps_upg_o_1pn93.supported = true	
		self.parts.wpn_fps_upg_o_1pn93.stats = {
			value = 8,
			zoom = 30
			}	
		self.parts.wpn_fps_upg_o_ekp_1s_03.supported = true	
		self.parts.wpn_fps_upg_o_ekp_1s_03.stats = {
			value = 3,
			zoom = 2	
			}									
		self.parts.wpn_fps_upg_o_1p29.supported = true									
		self.parts.wpn_fps_upg_o_1p29.stats = {
			value = 8,
			zoom = 30
			}															
		end	

	--Vanilla Mod Pack Volume 2 Support
	if self.parts.wpn_fps_smg_uzi_b_longue then
		--(Uzi) Striker Barrel
		self.parts.wpn_fps_smg_uzi_b_longue.supported = true
		self.parts.wpn_fps_smg_uzi_b_longue.stats = {
			value = 4,
			spread = 2,
			recoil = -2,
			concealment = -2
		}

		--(RPK) Lightweight combo Magazine
		self.parts.wpn_lmg_rpk_m_jungle.supported = true
		self.parts.wpn_lmg_rpk_m_jungle.stats = {
			value = 6,
			concealment = 1,
			reload = 4,
			spread = -1,
			extra_ammo = -40
		}

		--(Holt 9mm) Luxury Grip
		self.parts.wpn_fps_pis_holt_g_wrap.supported = true
		self.parts.wpn_fps_pis_holt_g_wrap.stats = {
			value = 6,
			recoil = 1,
			concealment = 1,
			spread = -2
		}

		--(R700) Hunting Stock
		self.parts.wpn_fps_snp_r700_s_redwood.supported = true
		self.parts.wpn_fps_snp_r700_s_redwood.stats = {
			value = 4,
			concealment = 1,
			recoil = -1
		}

		--(R700) Low Profile Iron Sight
		self.parts.wpn_fps_snp_r700_o_is.supported = true
		self.parts.wpn_fps_snp_r700_o_is.stats = {
			value = 1,
			zoom = 1
		}
		
		--(Bernetti Rangehitter) Mare's Leg Barrel
		self.parts.wpn_fps_snp_sbl_b_stub.supported = true
		self.parts.wpn_fps_snp_sbl_b_stub.stats = {
			value = 3,
			spread = -1,
			concealment = 1
		}		

		--(Czech 92) Angled Grip
		self.parts.wpn_fps_pis_czech_body_afg.supported = true
		self.parts.wpn_fps_pis_czech_body_afg.stats = {
			value = 3,
			recoil = -1,
			concealment = 1
		}
		
		--(Cobra) Solid Wooden Stock
		self.parts.wpn_fps_smg_scorpion_s_wood.supported = true
		self.parts.wpn_fps_smg_scorpion_s_wood.stats = {
			value = 3,
			recoil = 1,
			spread = -1
		}		

		--(Heather) Aftermarket Vertical Grip
		self.parts.wpn_fps_smg_sr2_vg_custom.supported = true
		self.parts.wpn_fps_smg_sr2_vg_custom.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Compact 5) Combat Stock
		self.parts.wpn_fps_smg_mp5_s_m4.supported = true
		self.parts.wpn_fps_smg_mp5_s_m4.stats = {
			value = 5,
			spread = 1,
			concealment = -3
		}
		
		--(Hornet .300) Bumblebee Foregrip
		self.parts.wpn_fps_bdgr_uupg_fg_railed.supported = true
		self.parts.wpn_fps_bdgr_uupg_fg_railed.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Hornet .300) Wasp foregrip
		self.parts.wpn_fps_bdgr_uupg_fg_small.supported = true
		self.parts.wpn_fps_bdgr_uupg_fg_small.stats = {
			value = 3,
			spread = -1,
			concealment = 1
		}

		--(M60) Long Barrel
		self.parts.wpn_fps_lmg_m60_b_longer.supported = true
		self.parts.wpn_fps_lmg_m60_b_longer.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
		
		--Wrapped Grip
		self.parts.wpn_fps_m4_g_wrap.supported = true
		self.parts.wpn_fps_m4_g_wrap.stats = {
			value = 2,
			recoil = 1,
			concealment = -2
		}

		--Polygonal Suppressor
		self.parts.wpn_fps_upg_ns_shot_flat.supported = true
		self.parts.wpn_fps_upg_ns_shot_flat.stats = {
			value = 5,
			spread = 2,
			recoil = -2,
			concealment = -2,
			suppression = 11,
			alert_size = -1
		}

		--Professional Suppressor
		self.parts.wpn_fps_upg_ns_ass_smg_pro.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_pro.stats = {
			value = 5,
			recoil = 2,
			spread = -1,
			concealment = -2,
			alert_size = -1,
			suppression = 12
		}

		--(Jacket's Piece) Foldable Stock
		self.parts.wpn_fps_smg_cobray_s_custom.supported = true
		self.parts.wpn_fps_smg_cobray_s_custom.stats = {
			value = 2,
			recoil = 1,
			spread = -1
		}

		--Modern Bolt
		self.parts.wpn_fps_ak_bolt_chrome.supported = true
		self.parts.wpn_fps_ak_bolt_chrome.stats = {
			value = 2,
			recoil = 1,
			concealment = -2
		}

		--(Patchett L2A1) Extended Barrel
		self.parts.wpn_fps_smg_sterling_b_poke.supported = true
		self.parts.wpn_fps_smg_sterling_b_poke.stats = {
			value = 5,
			spread = 2,
			recoil = -2,
			concealment = -2
		}

		--(Parabellum) Langer Barrel
		self.parts.wpn_fps_pis_breech_b_length.supported = true
		self.parts.wpn_fps_pis_breech_b_length.stats = {
			value = 4,
			spread = 2,
			recoil = -2,
			concealment = -2
		}

		--Constrictor Nozzle
		self.parts.wpn_fps_upg_ns_shot_close.supported = true
		self.parts.wpn_fps_upg_ns_shot_close.stats = {
			value = 4,
			spread = 1,
			concealment = -3
		}

		--(OVE9000 Saw) Ripper Blade
		self.parts.wpn_fps_saw_m_blade_scream.supported = true
		self.parts.wpn_fps_saw_m_blade_scream.stats = {
			value = 1,
			extra_ammo = -5,
			damage = 30,
			total_ammo_mod = -25
		}

		--(Compact-5) Package Deal Magazines
		self.parts.wpn_fps_smg_mp5_m_dos.supported = true
		self.parts.wpn_fps_smg_mp5_m_dos.stats = {
			value = 6,
			spread = -1,
			concealment = -1,
			reload = 2
		}

		--(GSPS 12G) High Capacity Barrel
		self.parts.wpn_fps_shot_m37_b_extend.supported = true
		self.parts.wpn_fps_shot_m37_b_extend.stats = {
			value = 7,
			extra_ammo = 1,
			reload = -1,
			concealment = -1
		}

		--(MP40) Langer Barrel
		self.parts.wpn_fps_smg_erma_b_langer.supported = true
		self.parts.wpn_fps_smg_erma_b_langer.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(MP40) Kurz Barrel
		self.parts.wpn_fps_smg_erma_b_kurz.supported = true
		self.parts.wpn_fps_smg_erma_b_kurz.stats = {
			value = 4,
			spread = -1,
			concealment = 1
		}

		--(Pistol Crossbow) Ergo Handle
		self.parts.wpn_fps_bow_hunter_body_swift.supported = true
		self.parts.wpn_fps_bow_hunter_body_swift.stats = {
			value = 5,
			reload = 1,
			concealment = -2
		}

		--(Repeater 1874) Outlaw Frame
		self.parts.wpn_fps_snp_winchester_body_bling.supported = true
		self.parts.wpn_fps_snp_winchester_body_bling.stats = {
			value = 2
		}

		--(Bernetti Auto) Expert Slide
		self.parts.wpn_fps_pis_beer_sl_expert.supported = true
		self.parts.wpn_fps_pis_beer_sl_expert.stats = {
			value = 2
		}

		--(Locomotive 12G) Trench Boom Barrel
		self.parts.wpn_fps_shot_r870_b_ithaca.supported = true
		self.parts.wpn_fps_shot_r870_b_ithaca.stats = {
			value = 6,
			spread = 2,
			concealment = -6
		}

		--(Reinbeck Auto) Shell Rack
		self.parts.wpn_fps_shot_minibeck_shells.supported = true
		self.parts.wpn_fps_shot_minibeck_shells.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 2
		}

		--(Reinbeck Auto) Extended Tube
		self.parts.wpn_fps_shot_minibeck_ext.supported = true
		self.parts.wpn_fps_shot_minibeck_ext.stats = {
			value = 3,
			extra_ammo = 1,
			concealment = -1,
			reload = -1
		}

		--(Reinbeck Auto) Solid Stock
		self.parts.wpn_fps_shot_minibeck_s_solid.supported = true
		self.parts.wpn_fps_shot_minibeck_s_solid.stats = {
			value = 5,
			recoil = 2,
			concealment = -4
		}

		--(Holt 9mm) Silver Slide
		self.parts.wpn_fps_pis_holt_b_silver.supported = true
		self.parts.wpn_fps_pis_holt_b_silver.stats = {
			value = 7
		}

		--(Signature SMG) Ergo Grip
		self.parts.wpn_fps_smg_shepheard_g_ergo.supported = true
		self.parts.wpn_fps_smg_shepheard_g_ergo.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Gruber Kurz) Expert Barrel
		self.parts.wpn_fps_pis_ppk_b_standard_expert.supported = true
		self.parts.wpn_fps_pis_ppk_b_standard_expert.stats = {
			value = 4,
			recoil = 1,
			spread = -1
		}

		--(Bronco .44) Arbitrator Grip
		self.parts.wpn_fps_pis_rage_g_fancy.supported = true
		self.parts.wpn_fps_pis_rage_g_fancy.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Castigo .44) Feroz Barrel
		self.parts.wpn_fps_pis_chinchilla_b_rage.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_rage.stats = {
			value = 4,
			recoil = 1,
			spread = -1
		}

		--(Piglet) Overcompensating Barrel
		self.parts.wpn_fps_gre_m32_barrel_extreme.supported = true
		self.parts.wpn_fps_gre_m32_barrel_extreme.stats = {
			value = 6,
			spread = 1,
			concealment = -3
		}

		--(Valkyria Rifle) Heatsinked Barrel
		self.parts.wpn_fps_ass_asval_b_heat.supported = true
		self.parts.wpn_fps_ass_asval_b_heat.stats = {
			value = 4,
			spread = -1,
			recoil = 1
		}

		--(M1014) Wrist Remover Grip
		self.parts.wpn_fps_sho_ben_s_fracture.supported = true
		self.parts.wpn_fps_sho_ben_s_fracture.stats = {
			recoil = -2,
			spread = -1,
			concealment = 3
		}

		self.parts.wpn_fps_m4_uupg_m_extend.supported = true
		self.parts.wpn_fps_m4_uupg_m_extend.stats = {
			extra_ammo = 5,
			concealment = -1,
			spread = -1
		}

		self.parts.wpn_fps_m4_uupg_m_extend_akimbo.supported = true
		self.parts.wpn_fps_m4_uupg_m_extend_akimbo.stats = {
			extra_ammo = 10,
			concealment = -1,
			spread = -1
		}

		self.parts.wpn_fps_ass_asval_o_oldrail.supported = true
		self.parts.wpn_fps_ass_asval_o_oldrail.stats = {
			value = 2
		}

		self.wpn_fps_shot_minibeck.override = {
			wpn_fps_upg_a_slug = {
				supported = true,
				name_id = "bm_wp_upg_a_slug",
				desc_id = "bm_wp_upg_a_slug_desc",
				stats = {
					value = 10,
					total_ammo_mod = -33,
					damage = 30,
					recoil = -2,
					spread = 8,
					spread_multi = {1, 1},	
					moving_spread = 0,
					suppression = -1,
					concealment = -5
				},
				custom_stats = {				
					damage_near_mul = 999,
					damage_far_mul = 999,
					muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",										
					rays = 1,
					armor_piercing_add = 1,
					can_shoot_through_enemy = true,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true
				}
			},
			wpn_fps_upg_a_custom = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -33,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},	
			wpn_fps_upg_a_custom_free = {
				supported = true,
				stats = {
					value = 9,
					total_ammo_mod = -33,
					damage = 30
				},
				custom_stats = {
					damage_near_mul = 0.75,
					damage_far_mul = 0.75,
					rays = 6
				}
			},			
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					total_ammo_mod = -50,
					recoil = -5,
					spread_multi = {1, 1},	
					concealment = -7,
					damage = 60
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			}
		}
		
		--Hammer 23 short barrel
		self.parts.wpn_fps_shot_bs23_barrel_short.supported = true
		self.parts.wpn_fps_shot_bs23_barrel_short.stats = {
			concealment = 1,
			spread = -1
		}
		self.parts.wpn_fps_shot_bs23_barrel_short.custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		}

		--Hammer 23 Sturdy Wooden Stock
		self.parts.wpn_fps_shot_bs23_stock_full.supported = true
		self.parts.wpn_fps_shot_bs23_stock_full.stats = {
			recoil = 1,
			spread = -1
		}
		self.parts.wpn_fps_shot_bs23_stock_full.custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1
		}		
		
		--Hammer 23 Hazardous stock
		self.parts.wpn_fps_shot_bs23_stock_none.supported = true
		self.parts.wpn_fps_shot_bs23_stock_none.stats = {
			recoil = -1,
			concealment = 1
		}		
		
		--Hammer 23 ammo stuff
		self.wpn_fps_shot_bs23.override = {
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -5,
					concealment = -7,
					spread_multi = {1, 1},	
					total_ammo_mod = -50,
					damage = 90
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			}
		}		
		
	end

	--Silent Killer Pack Welrod
	if self.parts.wpn_fps_pis_welrod_a_ap then
		self.parts.wpn_fps_pis_welrod_a_ap.pcs = nil --Disable AP bullets.

		--Short barrel
		self.parts.wpn_fps_pis_welrod_b_short.supported = true
		self.parts.wpn_fps_pis_welrod_b_short.stats = {
			value = 3,
			suppression = -1,
			spread = -1,
			concealment = 1
		}
		self.parts.wpn_fps_pis_welrod_b_short.has_description = nil

		--Trigger Guard
		self.parts.wpn_fps_pis_welrod_trigger_guard.supported = true
		self.parts.wpn_fps_pis_welrod_trigger_guard.stats = {
			value = 1
		}

		--Illuminated Iron Sights
		self.parts.wpn_fps_pis_welrod_glow.supported = true
	end

	--Silent Killer Pack PB
	if self.parts.wpn_fps_pis_pb_ns_std then
		self.parts.wpn_fps_pis_pb_ns_std.supported = true
		self.parts.wpn_fps_pis_pb_ns_std.stats = {
			value = 4,
			suppression = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
	end

	--Silent Killer Pack Max9
	if self.parts.wpn_fps_pis_max9_b_short then
		self.parts.wpn_fps_pis_max9_b_short.supported = true
		self.parts.wpn_fps_pis_max9_b_short.stats = {
			value = 5,
			suppression = -1,
			recoil = -1,
			concealment = 1
		}
		self.parts.wpn_fps_pis_max9_b_short.has_description = nil

		self.parts.wpn_fps_pis_max9_b_nosup.supported = true
		self.parts.wpn_fps_pis_max9_b_nosup.stats = {
			value = 5,
			alert_size = 1,
			suppression = -12,
			recoil = -1,
			spread = -1,
			concealment = 2
		}
		self.parts.wpn_fps_pis_max9_b_nosup.has_description = nil
	end

	--HX25 Grenade Launcher
	if self.parts.wpn_fps_upg_hx25_sight_iron_il then
		self.parts.wpn_fps_upg_hx25_sight_iron_il.supported = true
		self.parts.wpn_fps_upg_hx25_sight_iron_il.stats = {
			value = 1
		}

		self.parts.wpn_fps_upg_hx25_buckshot_ammo.supported = true
		self.parts.wpn_fps_upg_hx25_buckshot_ammo.desc_id = "bm_hx25_buck_sc_desc"

		self.wpn_fps_gre_hx25.override = {
			wpn_fps_upg_hx25_buckshot_ammo = {
				supported = true,
				stats = {
					value = 9,
					spread = -4,
					alert_size = -19,
					suppression = -19
				},
					custom_stats = {
					rays = 12
				}
			},
			wpn_fps_gre_hx25_explosive_ammo = {
				supported = true,
				stats = {
					value = 10
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 7,
					damage_near_mul = 999,
					damage_far_mul = 999,
					bullet_class = "InstantExplosiveBulletBase"
				}
			}
		}
	end

--Resmod Custom Weapon stuff

--Raze's Fury

self.wpn_fps_pis_shatters_fury.adds = {
	wpn_fps_upg_o_specter = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_aimpoint = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_aimpoint_2 = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_docter = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_eotech = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_t1micro = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_cmore = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_acog = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_cs = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_eotech_xps = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_reflex = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_rx01 = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_rx30 = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_spot = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_bmg = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_fc1 = {
		"wpn_fps_pis_rage_o_adapter"
	},
	wpn_fps_upg_o_uh = {
		"wpn_fps_pis_rage_o_adapter"
	}			
}
self.wpn_fps_pis_shatters_fury.override = {
	wpn_fps_pis_rage_lock = { 
		forbids = {}
	}
}	
self.wpn_fps_pis_shatters_fury.uses_parts = {
	"wpn_fps_pis_shatters_fury_body_standard",
	"wpn_fps_pis_shatters_fury_body_smooth",
	"wpn_fps_pis_shatters_fury_b_standard",
	"wpn_fps_pis_shatters_fury_b_short",
	"wpn_fps_pis_shatters_fury_b_long",
	"wpn_fps_pis_shatters_fury_b_comp1",
	"wpn_fps_pis_shatters_fury_b_comp2",
	"wpn_fps_pis_shatters_fury_g_standard",
	"wpn_fps_pis_shatters_fury_g_ergo",
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_cs",
	"wpn_fps_pis_rage_o_adapter",
	"wpn_fps_pis_rage_lock",
	"wpn_fps_upg_o_spot",
	"wpn_fps_upg_o_xpsg33_magnifier",
	"wpn_fps_upg_o_sig",
	"wpn_fps_upg_o_bmg",
	"wpn_fps_upg_o_uh",
	"wpn_fps_upg_o_fc1"		
}

--OICW
self.parts.wpn_fps_ass_osipr_scope.material_parameters = {
	gfx_reddot = {
		{
			id = Idstring("holo_reticle_scale"),
			value = Vector3(0.2, 1.5, 40),
			condition = function ()
				return not _G.IS_VR
			end
		},
		{
			id = Idstring("holo_reticle_scale"),
			value = Vector3(0.2, 1, 20),
			condition = function ()
				return _G.IS_VR
			end
		}
	}
}
self.parts.wpn_fps_ass_osipr_b_standard.custom = false
self.parts.wpn_fps_ass_osipr_body.custom = false
self.parts.wpn_fps_ass_osipr_bolt.custom = false
self.parts.wpn_fps_ass_osipr_gl.custom = false
self.parts.wpn_fps_ass_osipr_gl_incendiary.custom = false
self.parts.wpn_fps_ass_osipr_scope.custom = false
self.parts.wpn_fps_ass_osipr_m_gl.custom = false
self.parts.wpn_fps_ass_osipr_m_gl_incendiary.custom = false

--Deal with legendary and semi-hidden mods so they don't waste time triggering custom mod stat generation.
--The game seems to ignore some of these because reasons???
self.parts.wpn_fps_shot_r870_s_nostock_single.supported = true
self.parts.wpn_fps_pis_1911_fl_legendary.supported = true
self.parts.wpn_fps_pis_deagle_b_long.supported = true
self.parts.wpn_fps_sho_boot_fg_legendary.supported = true
self.parts.wpn_fps_ass_74_b_legend.supported = true
self.parts.wpn_fps_shot_shorty_fg_legendary.supported = true
self.parts.wpn_fps_lmg_svinet_b_standard.supported = true
self.parts.wpn_fps_shot_huntsman_body_standard.supported = true
self.parts.wpn_fps_ass_vhs_m.supported = true
self.parts.wpn_fps_ass_m14_body_legendary.supported = true
self.parts.wpn_fps_snp_model70_s_standard.supported = true
self.parts.wpn_fps_ass_m16_b_legend.supported = true
self.parts.wpn_fps_sho_ksg_b_legendary.supported = true
self.parts.wpn_fps_sho_boot_b_legendary.supported = true
self.parts.wpn_fps_ass_m16_s_legend.supported = true
self.parts.wpn_fps_ass_tecci_b_legend.supported = true
self.parts.wpn_fps_shot_r870_b_legendary.supported = true
self.parts.wpn_fps_pis_judge_b_legend.supported = true
self.parts.wpn_fps_shot_shorty_b_legendary.supported = true
self.parts.wpn_fps_ass_m14_b_legendary.supported = true

for _, part in pairs(self.parts) do
	if not part.supported and part.stats then
		local cosmetic_part = true
		for name, stat in pairs(part.stats) do
			if name ~= "value" and name ~= "zoom" and name ~= "gadget_zoom" and name ~= "spread_moving" and stat ~= 0 then
				cosmetic_part = nil
			end
		end

		if not cosmetic_part then
			self:generate_custom_mod_stats(part)
		end
	end
end
	
--SC mod shit below--

	self.parts.wpn_fps_upg_a_slug_fire = {
		type = "ammo",
		name_id = "bm_wp_upg_a_slug_sc_fire",
		desc_id = "bm_wp_upg_a_slug_fire_desc",
		a_obj = "a_body",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_a_slug_fire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			concealment = -5,
			total_ammo_mod = -5,
			damage = 74,	
			recoil = -2,
			spread = 12,
			suppression = -1,
			moving_spread = 0
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 1,
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			bullet_class = "FlameBulletBase",
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = "0",
				dot_trigger_chance = "100",
				dot_length = "3",
				dot_tick_period = "0.5"
			}
		},
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		hit_effect = "dragonsbreath",
		internal_part = true,
		sub_type = "ammo_dragons_breath"
	}
	self.parts.wpn_fps_upg_ammo_half_that = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_halfthatkit",
		desc_id = "bm_wp_upg_a_halfthatkit_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {},
		custom_stats = {},
		internal_part = true
	}
	self.parts.wpn_lmg_rpk_m_ban = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_rpk_m_ban_sc",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_lmg_rpk_m_standard",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard",
		supported = true,
		stats = {
			value = 5,
			concealment = 2,
			reload = 2,
			extra_ammo = -40,
		}
	}		
	self.parts.wpn_fps_upg_extra_mp_lock = {
		type = "extra",
		name_id = "bm_wp_upg_extra_mp_lock",
		desc_id = "bm_wp_upg_extra_mp_lock_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire"
		},
		perks = {
			"fire_mode_single"
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_extra_mp_unlock = {
		pcs = {},
		type = "extra",
		name_id = "bm_wp_upg_extra_mp_unlock",
		desc_id = "bm_wp_upg_extra_mp_unlock_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/dlcs/tng/textures/pd2/blackmarket/icons/side_job_rewards/gage_mod_rewards",
		dlc = "sc",
		supported = true,
		stats = {value = 1},
		custom_stats = {use_auto_kick = true},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_46custom = {
		type = "ammo",
		name_id = "bm_wp_upg_a_46custom",
		desc_id = "bm_wp_upg_a_46custom_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0,
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_65grendel = {
		type = "ammo",
		name_id = "bm_wp_upg_a_65grendel",
		desc_id = "bm_wp_upg_a_65grendel_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			damage = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_762_sterling = {
		type = "ammo",
		name_id = "bm_wp_upg_a_762_sterling",
		desc_id = "bm_wp_upg_a_762_sterling_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_p = {
		type = "ammo",
		name_id = "bm_wp_upg_a_p",
		desc_id = "bm_wp_upg_a_p_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 3,
			damage = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_mag_msr = {
		type = "ammo",
		name_id = "bm_wp_upg_a_mag_msr",
		desc_id = "bm_wp_upg_a_mag_msr_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0,
			total_ammo_mod = 0,
			damage = 0
		},		
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_40sw = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_40sw",
		desc_id = "bm_wp_upg_a_40sw_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			suppression = -1,
			total_ammo_mod = -20,
			concealment = -2,
			recoil = -1,
			damage = 10
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_storm_ammo_45acp = { --mx4 storm 90 dmg conversion
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_storm_40acp",
		desc_id = "bm_wp_upg_a_storm_40acp_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			suppression = -2,
			total_ammo_mod = -46,
			concealment = -3,
			recoil = -2,
			damage = 35
		},
		internal_part = true,
		forbids = {"wpn_fps_upg_extra_mp_unlock"}
	}
	table.list_append(self.wpn_fps_lmg_hk21.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_m249.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_rpk.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_mg42.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_par.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_hk21.uses_parts, {
		"wpn_fps_upg_i_faster_rof"	
	})
	table.list_append(self.wpn_fps_lmg_m249.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_rpk.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_mg42.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_par.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})

	--Incendiary Slugs are awesome--

	local colt_weapons = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar"
	}
	for _, factory_id in ipairs(colt_weapons) do
		if self[factory_id] and self[factory_id].uses_parts then
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_ammo_65grendel")
			table.insert(self[factory_id .. "_npc"].uses_parts, "wpn_fps_upg_ammo_65grendel")
		end
	end

	local weapons = {
		"wpn_fps_shot_saiga",
		"wpn_fps_shot_r870",
		"wpn_fps_shot_huntsman",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ben",
		"wpn_fps_sho_striker",
		"wpn_fps_sho_ksg",
		"wpn_fps_pis_judge",
		"wpn_fps_sho_spas12",
		"wpn_fps_shot_b682",
		"wpn_fps_sho_aa12",
		"wpn_fps_shot_m37",
		"wpn_fps_sho_boot"
	}
	--for _, factory_id in ipairs(weapons) do
		--if self[factory_id] and self[factory_id].uses_parts then
		--	table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_slug_fire")
		--	table.insert(self[factory_id .. "_npc"].uses_parts, "wpn_fps_upg_a_slug_fire")
		--end
	--end

end)