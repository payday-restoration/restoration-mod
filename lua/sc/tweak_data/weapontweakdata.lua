local job = Global.level_data and Global.level_data.level_id

local damage_set = {
	smg = {
		"shepheard_crew",
		"erma_crew",
		"polymer_crew",
		"pm9_crew",
		"coal_crew",
		"schakal_crew",
		"vityaz_crew",
		"hailstorm_crew"
	},
	assault_rifle = {
		"amcar_crew",
		"g36_crew",
		"s552_crew",
		"famas_crew",
		"vhs_crew",
		"ak74_crew",
		"m4_crew",
		"aug_crew",
		"ak5_crew",
		"flint_crew",
		"corgi_crew",
		"akm_crew",
		"akm_gold_crew",
		"m16_crew",
		"l85a2_crew",
		"groza_crew",
		"scar_crew",
		"galil_crew",
		"fal_crew",
		"asval_crew",
		"contraband_crew",
	},
	shotgun_auto = {
		"spas12_crew",
		"saiga_crew",
		"ultima_crew",
		"ben_crew",
		"benelli_crew",
		"aa12_crew",
		"sko12_crew",
	},
	shotgun_pump = {
		"b682_crew",
		"r870_crew",
		"mossberg_crew",
		"huntsman_crew",
		"ksg_crew",
		"boot_crew",
	},
	sniper_auto = {
		"m14_crew",
		"g3_crew",
		"shak12_crew",
		"ching_crew",
		"tti_crew",
		"qbu88_crew",
	},
	sniper_bolt = {
		"siltstone_crew",
		"wa2000_crew",
		"model70_crew",
		"msr_crew",
		"r93_crew",
		"m95_crew",
		"mosin_crew",
		"winchester1874_crew",
		"sbl_crew",
		"desertfox_crew",
		"r700_crew",
	},
	lmg = {
		"tecci_crew",
		"par_crew",
		"rpk_crew",
		"m249_crew",
		"hk21_crew",
		"hk51b_crew",
		"mg42_crew",
		"m60_crew",
	}
}
local crew_wep_preset = {
	smg = {
		mag_capacity = 50,
		fire_rate = 0.06666666667,
		damage = 4.8
	},
	assault_rifle = {
		mag_capacity = 30,
		fire_rate = 0.1,
		damage = 6.0
	},
	lmg = {
		mag_capacity = 100,
		fire_rate = 0.08,
		damage = 3.6
	},
	shotgun_auto = {
		mag_capacity = 14,
		fire_rate = 0.15,
		damage = 7.5
	},
	shotgun_pump = {
		mag_capacity = 7,
		fire_rate = 0.8,
		damage = 15.0
	},
	sniper_auto = {
		mag_capacity = 10,
		fire_rate = 0.6,
		damage = 9.0
	},
	sniper_bolt = {
		mag_capacity = 5,
		fire_rate = 1.33333,
		damage = 18.0
	}
}

--NPC STUFF
	function WeaponTweakData:_init_data_sentry_gun_npc()
		self.sentry_gun.categories = {}
		self.sentry_gun.name_id = "debug_sentry_gun"
		self.sentry_gun.DAMAGE = 2.8
		self.sentry_gun.SUPPRESSION = 1
		self.sentry_gun.SPREAD = 2
		self.sentry_gun.FIRE_RANGE = 2500
		self.sentry_gun.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.sentry_gun.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.sentry_gun.auto.fire_rate = 0.175
		self.sentry_gun.alert_size = 2500
		self.sentry_gun.BAG_DMG_MUL = 0.25
		self.sentry_gun.SHIELD_DMG_MUL = 0
		self.sentry_gun.DEATH_VERIFICATION = {0.4, 0.75}
		self.sentry_gun.DETECTION_RANGE = self.sentry_gun.FIRE_RANGE
		self.sentry_gun.KEEP_FIRE_ANGLE = 0.8
		self.sentry_gun.DETECTION_DELAY = {
			{600, 0.1},
			{
				self.sentry_gun.DETECTION_RANGE,
				0.5
			}
		}
		self.sentry_gun.MAX_VEL_SPIN = 120
		self.sentry_gun.MIN_VEL_SPIN = self.sentry_gun.MAX_VEL_SPIN * 0.05
		self.sentry_gun.SLOWDOWN_ANGLE_SPIN = 30
		self.sentry_gun.ACC_SPIN = self.sentry_gun.MAX_VEL_SPIN * 5
		self.sentry_gun.MAX_VEL_PITCH = 100
		self.sentry_gun.MIN_VEL_PITCH = self.sentry_gun.MAX_VEL_PITCH * 0.05
		self.sentry_gun.SLOWDOWN_ANGLE_PITCH = 20
		self.sentry_gun.ACC_PITCH = self.sentry_gun.MAX_VEL_PITCH * 5
		self.sentry_gun.recoil = {}
		self.sentry_gun.recoil.horizontal = {
			2,
			3,
			0,
			3
		}
		self.sentry_gun.recoil.vertical = {
			1,
			2,
			0,
			4
		}
		self.sentry_gun.challenges = {}
		self.sentry_gun.challenges.group = "sentry_gun"
		self.sentry_gun.challenges.weapon = "sentry_gun"
		self.sentry_gun.suppression = 0.8
	end
	
	function WeaponTweakData:_set_normal()

		--Bot sidearm--
		self.beretta92_npc.DAMAGE = 1.8
		
		local diff_reduction = 3
		--Everything else--
		for i, wep_id in ipairs(damage_set.smg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.smg.damage - diff_reduction
		end
		
		for i, wep_id in ipairs(damage_set.assault_rifle) do
			self[ wep_id ].DAMAGE = crew_wep_preset.assault_rifle.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_pump) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_pump.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_bolt) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_bolt.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.lmg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.lmg.damage - diff_reduction
		end
	end
	
	function WeaponTweakData:_set_hard()
		--Bot sidearm--
		self.beretta92_npc.DAMAGE = 1.8
		
		local diff_reduction = 3
		--Everything else--
		for i, wep_id in ipairs(damage_set.smg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.smg.damage - diff_reduction
		end
		
		for i, wep_id in ipairs(damage_set.assault_rifle) do
			self[ wep_id ].DAMAGE = crew_wep_preset.assault_rifle.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_pump) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_pump.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_bolt) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_bolt.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.lmg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.lmg.damage - diff_reduction
		end
	end
	
	function WeaponTweakData:_set_overkill()
		--Bot sidearm--
		self.beretta92_npc.DAMAGE = 2.8
		
		local diff_reduction = 2
		--Everything else--
		for i, wep_id in ipairs(damage_set.smg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.smg.damage - diff_reduction
		end
		
		for i, wep_id in ipairs(damage_set.assault_rifle) do
			self[ wep_id ].DAMAGE = crew_wep_preset.assault_rifle.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_pump) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_pump.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_bolt) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_bolt.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.lmg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.lmg.damage - diff_reduction
		end
	end
	
	function WeaponTweakData:_set_overkill_145()
		--Bot sidearm--
		self.beretta92_npc.DAMAGE = 3.8
		
		local diff_reduction = 1
		--Everything else--
		for i, wep_id in ipairs(damage_set.smg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.smg.damage - diff_reduction
		end
		
		for i, wep_id in ipairs(damage_set.assault_rifle) do
			self[ wep_id ].DAMAGE = crew_wep_preset.assault_rifle.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.shotgun_pump) do
			self[ wep_id ].DAMAGE = crew_wep_preset.shotgun_pump.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_auto) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_auto.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.sniper_bolt) do
			self[ wep_id ].DAMAGE = crew_wep_preset.sniper_bolt.damage - diff_reduction
		end

		for i, wep_id in ipairs(damage_set.lmg) do
			self[ wep_id ].DAMAGE = crew_wep_preset.lmg.damage - diff_reduction
		end
		
		if job == "chew" or job == "glace" then
			self.swat_van_turret_module.HEALTH_INIT = 675
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 90
			self.swat_van_turret_module.AUTO_REPAIR = false
		else
			self.swat_van_turret_module.HEALTH_INIT = 1350
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 180
			self.swat_van_turret_module.AUTO_REPAIR = true
		end
				
		self.ceiling_turret_module.HEALTH_INIT = 675
		self.ceiling_turret_module.SHIELD_HEALTH_INIT = 90
		self.ceiling_turret_module_no_idle.HEALTH_INIT = 675
		self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 90
		self.ceiling_turret_module_longer_range.HEALTH_INIT = 675
		self.ceiling_turret_module_longer_range.SHIELD_HEALTH_INIT = 90		
		self.aa_turret_module.HEALTH_INIT = 675
		self.aa_turret_module.SHIELD_HEALTH_INIT = 90
		self.crate_turret_module.HEALTH_INIT = 337.5
		self.crate_turret_module.SHIELD_HEALTH_INIT = 45		
	end
	
	function WeaponTweakData:_set_easy_wish()
		if job == "chew" or job == "glace" then
			self.swat_van_turret_module.HEALTH_INIT = 787.5
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 105
			self.swat_van_turret_module.AUTO_REPAIR = false
		else
			self.swat_van_turret_module.HEALTH_INIT = 1575
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 210
			self.swat_van_turret_module.AUTO_REPAIR = true
		end
		self.swat_van_turret_module.BAG_DMG_MUL = 14.58375
	
		self.ceiling_turret_module.HEALTH_INIT = 787.5
		self.ceiling_turret_module.BAG_DMG_MUL = 14.58375
		self.ceiling_turret_module.SHIELD_HEALTH_INIT = 105
		self.ceiling_turret_module_no_idle.HEALTH_INIT = 787.5
		self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 14.58375
		self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 105
		self.ceiling_turret_module_longer_range.HEALTH_INIT = 787.5
		self.ceiling_turret_module_longer_range.BAG_DMG_MUL = 14.58375
		self.ceiling_turret_module_longer_range.SHIELD_HEALTH_INIT = 105
		self.aa_turret_module.HEALTH_INIT = 787.5
		self.aa_turret_module.BAG_DMG_MUL = 14.58375
		self.aa_turret_module.SHIELD_HEALTH_INIT = 105
		self.crate_turret_module.HEALTH_INIT = 393.75
		self.crate_turret_module.BAG_DMG_MUL = 14.58375
		self.crate_turret_module.SHIELD_HEALTH_INIT = 52.5			
	end
	
	function WeaponTweakData:_set_overkill_290()
		if job == "chew" or job == "glace" then
			self.swat_van_turret_module.HEALTH_INIT = 787.5
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 105
			self.swat_van_turret_module.AUTO_REPAIR = false
		else
			self.swat_van_turret_module.HEALTH_INIT = 1575
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 210
			self.swat_van_turret_module.AUTO_REPAIR = true
		end
		self.swat_van_turret_module.BAG_DMG_MUL = 10
		
		self.ceiling_turret_module.HEALTH_INIT = 787.5
		self.ceiling_turret_module.BAG_DMG_MUL = 10
		self.ceiling_turret_module.SHIELD_HEALTH_INIT = 105
		self.ceiling_turret_module_no_idle.HEALTH_INIT = 787.5
		self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 10
		self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 105
		self.ceiling_turret_module_longer_range.HEALTH_INIT = 787.5
		self.ceiling_turret_module_longer_range.BAG_DMG_MUL = 10
		self.ceiling_turret_module_longer_range.SHIELD_HEALTH_INIT = 105
		self.aa_turret_module.HEALTH_INIT = 787.5
		self.aa_turret_module.BAG_DMG_MUL = 10
		self.aa_turret_module.SHIELD_HEALTH_INIT = 105
		self.crate_turret_module.HEALTH_INIT = 393.75
		self.crate_turret_module.BAG_DMG_MUL = 10
		self.crate_turret_module.SHIELD_HEALTH_INIT = 52.5	
	
		--Sniper Trail for Snipers
		self.m14_sniper_npc.trail_effect = Idstring("effects/particles/weapons/sniper_trail_sc")
	end
	
	function WeaponTweakData:_set_sm_wish()
		if job == "chew" or job == "glace" then
			self.swat_van_turret_module.HEALTH_INIT = 900
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 105
			self.swat_van_turret_module.AUTO_REPAIR = false
		else
			self.swat_van_turret_module.HEALTH_INIT = 1800
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 210
			self.swat_van_turret_module.AUTO_REPAIR = true
		end
	
		self.swat_van_turret_module.BAG_DMG_MUL = 11.4375
				
		self.ceiling_turret_module.HEALTH_INIT = 900
		self.ceiling_turret_module.BAG_DMG_MUL = 11.4375
		self.ceiling_turret_module.SHIELD_HEALTH_INIT = 105
	
		self.ceiling_turret_module_no_idle.HEALTH_INIT = 900
		self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 11.4375
		self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 105
		
		self.ceiling_turret_module_longer_range.HEALTH_INIT = 900
		self.ceiling_turret_module_longer_range.BAG_DMG_MUL = 11.4375
		self.ceiling_turret_module_longer_range.SHIELD_HEALTH_INIT = 105		
		
		self.aa_turret_module.HEALTH_INIT = 900
		self.aa_turret_module.BAG_DMG_MUL = 11.4375
		self.aa_turret_module.SHIELD_HEALTH_INIT = 105		
		
		self.crate_turret_module.HEALTH_INIT = 900
		self.crate_turret_module.BAG_DMG_MUL = 11.4375
		self.crate_turret_module.SHIELD_HEALTH_INIT = 52.5			
		
		self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 3
		self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 3
		self.ceiling_turret_module_no_idle.AUTO_REPAIR_MAX_COUNT = 3
		self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 3
	
		--Sniper Trail for Snipers
		self.m14_sniper_npc.trail_effect = Idstring("effects/particles/weapons/sniper_trail_sc")
	end
	
	function WeaponTweakData:_init_data_npc_melee()
		self.npc_melee = {}
		
		--Police Baton
		self.npc_melee.baton = {}
		self.npc_melee.baton.unit_name = Idstring("units/payday2/characters/ene_acc_baton/ene_acc_baton")
		self.npc_melee.baton.damage = 4.5
		self.npc_melee.baton.animation_param = "melee_baton"
		self.npc_melee.baton.player_blood_effect = true
		self.npc_melee.baton.armor_piercing = true
		
		--KABAR knife
		self.npc_melee.knife_1 = {}
		self.npc_melee.knife_1.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
		self.npc_melee.knife_1.damage = 4.5
		self.npc_melee.knife_1.animation_param = "melee_knife"
		self.npc_melee.knife_1.player_blood_effect = true
		self.npc_melee.knife_1.armor_piercing = true
	
		--Fists
		self.npc_melee.fists = {}
		self.npc_melee.fists.unit_name = nil
		self.npc_melee.fists.damage = 4.5
		self.npc_melee.fists.animation_param = "melee_fist"
		self.npc_melee.fists.player_blood_effect = true
		self.npc_melee.fists.armor_piercing = true
		
		--Dozer Fists
		self.npc_melee.fists_dozer = {}
		self.npc_melee.fists_dozer.unit_name = nil
		self.npc_melee.fists_dozer.damage = 4.5
		self.npc_melee.fists_dozer.animation_param = "melee_fist"
		self.npc_melee.fists_dozer.player_blood_effect = true
		self.npc_melee.fists_dozer.armor_piercing = true
		
		--Halloween Dozer Hammer
		self.npc_melee.helloween = {}
		self.npc_melee.helloween.unit_name = Idstring("units/pd2_halloween/weapons/wpn_mel_titan_hammer/wpn_mel_titan_hammer")
		self.npc_melee.helloween.damage = 4.5
		self.npc_melee.helloween.animation_param = "melee_fireaxe"
		self.npc_melee.helloween.player_blood_effect = true
		self.npc_melee.helloween.armor_piercing = true
		
		--Halloween Dozer Sword
		self.npc_melee.helloween_sword = {}
		self.npc_melee.helloween_sword.unit_name = Idstring("units/payday2/weapons/wpn_mel_hw_sword/wpn_mel_hw_sword")
		self.npc_melee.helloween_sword.damage = 4.5
		self.npc_melee.helloween_sword.animation_param = "melee_fireaxe"
		self.npc_melee.helloween_sword.player_blood_effect = true
		self.npc_melee.helloween_sword.armor_piercing = true
		
		--Halloween Dozer Axe
		self.npc_melee.helloween_axe = {}
		self.npc_melee.helloween_axe.unit_name = Idstring("units/pd2_mod_halloween/weapons/wpn_mel_hw_axe/wpn_mel_hw_axe")
		self.npc_melee.helloween_axe.damage = 4.5
		self.npc_melee.helloween_axe.animation_param = "melee_fireaxe"
		self.npc_melee.helloween_axe.player_blood_effect = true
		self.npc_melee.helloween_axe.armor_piercing = true	
		
		--Summers' Buzzer
		self.npc_melee.buzzer_summer = {}
		self.npc_melee.buzzer_summer.unit_name = Idstring("units/pd2_dlc_vip/characters/ene_acc_buzzer_1/ene_acc_buzzer_1")
		self.npc_melee.buzzer_summer.damage = 0
		self.npc_melee.buzzer_summer.animation_param = "melee_freedom"
		self.npc_melee.buzzer_summer.player_blood_effect = true
		self.npc_melee.buzzer_summer.armor_piercing = true
		
		--Kung-Fu Master Katana
		self.npc_melee.kf_katana = {}
		self.npc_melee.kf_katana.unit_name = Idstring("units/pd2_dlc_pent/weapons/ene_acc_mel_sandsteel/ene_acc_mel_sandsteel")
		self.npc_melee.kf_katana.damage = 5
		self.npc_melee.kf_katana.animation_param = "melee_baton"
		self.npc_melee.kf_katana.player_blood_effect = true
		self.npc_melee.kf_katana.armor_piercing = true

		--Zombie Claws
		self.npc_melee.claws = {}
		self.npc_melee.claws.unit_name = nil
		self.npc_melee.claws.damage = 4.5
		self.npc_melee.claws.animation_param = "melee_fist"
		self.npc_melee.claws.player_blood_effect = true
		self.npc_melee.claws.armor_piercing = true	
		
		--Zombie Bite
		self.npc_melee.bite = {}
		self.npc_melee.bite.unit_name = nil
		self.npc_melee.bite.damage = 22 * 10
		self.npc_melee.bite.animation_param = "melee_fist"
		self.npc_melee.bite.player_blood_effect = true
		self.npc_melee.bite.armor_piercing = true	
		self.npc_melee.bite.lethal = true
	end
	
	function WeaponTweakData:_set_npc_weapon_damage_multiplier(mul)
		for name, data in pairs(self.npc_melee) do
			data.damage = data.damage * mul
		end
	end
	
	function WeaponTweakData:_init_data_c45_npc()
		self.c45_npc.categories = {"pistol"}
		self.c45_npc.sounds.prefix = "g17_npc"
		self.c45_npc.use_data.selection_index = 1
		self.c45_npc.DAMAGE = 2.4
		self.c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.c45_npc.CLIP_AMMO_MAX = 17
		self.c45_npc.NR_CLIPS_MAX = 5
		self.c45_npc.hold = "pistol"
		self.c45_npc.alert_size = 2500
		self.c45_npc.suppression = 2.4
		self.c45_npc.FIRE_MODE = "single"

		self.streak_npc = deep_clone(self.c45_npc)
		self.streak_npc.sounds.prefix = "pl14_npc"	
		
		self.colt_1911_primary_npc = deep_clone(self.c45_npc)
		self.colt_1911_primary_npc.use_data.selection_index = 2
		self.colt_1911_primary_npc.CLIP_AMMO_MAX = 8
		self.colt_1911_primary_npc.sounds.prefix = "c45_fire"
		self.colt_1911_primary_npc.DAMAGE = 4.5	
	
		self.beretta92_titan_npc = deep_clone(self.c45_npc)
		self.beretta92_titan_npc.usage = "is_revolver"
		self.beretta92_titan_npc.sounds.prefix = "beretta_npc"
		self.beretta92_titan_npc.DAMAGE = 2.4
		self.beretta92_titan_npc.CLIP_AMMO_MAX = 14
		self.beretta92_titan_npc.alert_size = 0
		self.beretta92_titan_npc.suppression = 0.1
		self.beretta92_titan_npc.has_suppressor = "suppressed_a"	
	end
	
	function WeaponTweakData:_init_data_x_c45_npc()
		self.x_c45_npc.categories = {
			"akimbo",
			"pistol"
		}	
		self.x_c45_npc.sounds.prefix = "g17_npc"
		self.x_c45_npc.use_data.selection_index = 1
		self.x_c45_npc.DAMAGE = 2.4
		self.x_c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.x_c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.x_c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.x_c45_npc.CLIP_AMMO_MAX = 34
		self.x_c45_npc.NR_CLIPS_MAX = 5
		self.x_c45_npc.hold = "akimbo_pistol"
		self.x_c45_npc.alert_size = 2500
		self.x_c45_npc.suppression = 2.4
		self.x_c45_npc.FIRE_MODE = "single"

		self.x_streak_npc = deep_clone(self.x_c45_npc)
		self.x_streak_npc.sounds.prefix = "pl14_npc"		
		
		self.x_raging_bull_meme_npc = deep_clone(self.x_c45_npc)		
		self.x_raging_bull_meme_npc.sounds.prefix = "rbull_npc"
		self.x_raging_bull_meme_npc.categories = clone(self.x_rage.categories)		
		self.x_raging_bull_meme_npc.use_data.selection_index = 1
		self.x_raging_bull_meme_npc.hold = "akimbo_pistol"
		self.x_raging_bull_meme_npc.FIRE_MODE = "single"	
		
		self.x_pm9_npc = deep_clone(self.x_c45_npc)			
		self.x_pm9_npc.categories = {"akimbo", "smg"}	
		self.x_pm9_npc.DAMAGE = 2
		self.x_pm9_npc.CLIP_AMMO_MAX = 50
		self.x_pm9_npc.NR_CLIPS_MAX = 4
		self.x_pm9_npc.hold = "akimbo_pistol"
		self.x_pm9_npc.alert_size = 0
		self.x_pm9_npc.FIRE_MODE = "auto"	
		self.x_pm9_npc.sounds.prefix = "pm9_npc"
		self.x_pm9_npc.has_suppressor = "suppressed_a"
		self.x_pm9_npc.suppression = 0.1		
		self.x_pm9_npc.auto = {}			
		self.x_pm9_npc.auto.fire_rate = 0.05454545454	
	end
	
	function WeaponTweakData:_init_data_beretta92_npc()
		self.beretta92_npc.categories = clone(self.b92fs.categories)
		self.beretta92_npc.sounds.prefix = "beretta_npc"
		self.beretta92_npc.use_data.selection_index = 1
		self.beretta92_npc.DAMAGE = 4.8
		self.beretta92_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.beretta92_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.beretta92_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.beretta92_npc.CLIP_AMMO_MAX = 30
		self.beretta92_npc.NR_CLIPS_MAX = 4
		self.beretta92_npc.hold = "pistol"
		self.beretta92_npc.alert_size = 0
		self.beretta92_npc.suppression = 0.1
		self.beretta92_npc.FIRE_MODE = "single"
		self.beretta92_npc.has_suppressor = "suppressed_a"
		self.beretta92_primary_npc = deep_clone(self.beretta92_npc)
		self.beretta92_primary_npc.use_data.selection_index = 2
	end
	
	function WeaponTweakData:_init_data_raging_bull_npc()
		self.raging_bull_npc.categories = clone(self.new_raging_bull.categories)
		self.raging_bull_npc.sounds.prefix = "rbull_npc"
		self.raging_bull_npc.use_data.selection_index = 1
		self.raging_bull_npc.DAMAGE = 6
		self.raging_bull_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.raging_bull_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.raging_bull_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
		self.raging_bull_npc.CLIP_AMMO_MAX = 6
		self.raging_bull_npc.NR_CLIPS_MAX = 8
		self.raging_bull_npc.hold = "pistol"
		self.raging_bull_npc.alert_size = 2500
		self.raging_bull_npc.suppression = 3.2
		self.raging_bull_npc.FIRE_MODE = "single"
		
		self.m1911_npc = deep_clone(self.raging_bull_npc)
		self.m1911_npc.use_data.selection_index = 2
		self.m1911_npc.CLIP_AMMO_MAX = 8
		self.m1911_npc.sounds.prefix = "c45_npc"
		self.m1911_npc.anim_usage = "is_pistol"
		self.m1911_npc.hold = "pistol"
		self.m1911_npc.reload = "pistol"		
		self.m1911_npc.alert_size = 2500
		self.m1911_npc.suppression = 3		
		self.m1911_npc.DAMAGE = 4.5		
		
		self.deagle_guard_npc = deep_clone(self.raging_bull_npc)
		self.deagle_guard_npc.CLIP_AMMO_MAX = 8
		self.deagle_guard_npc.anim_usage = "is_pistol"
		self.deagle_guard_npc.hold = "pistol"
		self.deagle_guard_npc.reload = "pistol"	
		self.deagle_guard_npc.sounds.prefix = "deagle_npc"
		
		self.peacemaker_npc = deep_clone(self.raging_bull_npc)
		self.peacemaker_npc.DAMAGE = 14.1
		self.peacemaker_npc.armor_piercing = false --Reno told me do it 
		
		self.raging_bull_primary_npc = deep_clone(self.raging_bull_npc)
		self.raging_bull_primary_npc.use_data.selection_index = 2
		
		self.x_raging_bull_npc = deep_clone(self.raging_bull_npc)		
		self.x_raging_bull_npc.categories = clone(self.x_rage.categories)		
		self.x_raging_bull_npc.use_data.selection_index = 1
		self.x_raging_bull_npc.CLIP_AMMO_MAX = 12
		self.x_raging_bull_npc.NR_CLIPS_MAX = 5
		self.x_raging_bull_npc.hold = "akimbo_pistol"
		self.x_raging_bull_npc.FIRE_MODE = "single"		
	end
	
	--Vanilla Deagle, less lethal
	function WeaponTweakData:_init_data_deagle_npc()
		self.deagle_npc = deep_clone(self.raging_bull_npc)
		self.deagle_npc.DAMAGE = 1.2
		self.deagle_npc.CLIP_AMMO_MAX = 8
		self.deagle_npc.sounds.prefix = "deagle_npc"
		self.deagle_npc.anim_usage = "is_pistol"
		self.deagle_npc.hold = "pistol"
		self.deagle_npc.reload = "pistol"	
	end

	--Marshal Shield Phase 2 Shotgun, less lethal
	function WeaponTweakData:_init_data_sko12_conc_npc()
		self.sko12_conc_npc.categories = clone(self.sko12.categories)
		self.sko12_conc_npc.sounds.prefix = "sko12_npc"
		self.sko12_conc_npc.use_data.selection_index = 2
		self.sko12_conc_npc.DAMAGE = 0.1
		self.sko12_conc_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.sko12_conc_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_g2"
		self.sko12_conc_npc.CLIP_AMMO_MAX = 25
		self.sko12_conc_npc.NR_CLIPS_MAX = 10
		self.sko12_conc_npc.hold = "rifle"
		self.sko12_conc_npc.alert_size = 2500
		self.sko12_conc_npc.suppression = 1.8
		self.sko12_conc_npc.FIRE_MODE = "single"
		self.sko12_conc_npc.bullet_class = "ConcussiveInstantBulletBase"
		self.sko12_conc_npc.concussion_data = {
			mul = 0.5,
			sound_duration = {
				min = 4,
				mul = 0.3,
				additional = 4
			}
		}
	end	
	
	function WeaponTweakData:_init_data_m4_npc()
		--M4
		self.m4_npc.categories = clone(self.new_m4.categories)
		self.m4_npc.sounds.prefix = "m4_npc"
		self.m4_npc.use_data.selection_index = 2
		self.m4_npc.DAMAGE = 2.4
		self.m4_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
		self.m4_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.m4_npc.CLIP_AMMO_MAX = 30
		self.m4_npc.NR_CLIPS_MAX = 5
		self.m4_npc.auto.fire_rate = 0.08571428571
		self.m4_npc.hold = "rifle"
		self.m4_npc.alert_size = 2500
		self.m4_npc.suppression = 2.6
		self.m4_npc.FIRE_MODE = "auto"
		
		self.m4_secondary_npc = deep_clone(self.m4_npc)
		self.m4_secondary_npc.use_data.selection_index = 1
		
		--AKS 74 used by Reapers
		self.ak47_ass_npc = deep_clone(self.m4_npc)
		self.ak47_ass_npc.sounds.prefix = "ak74_npc"
		
		--AK 103 used by Reapers
		self.ak103_npc = deep_clone(self.m4_npc)
		self.ak103_npc.sounds.prefix = "akm_npc"
		
		--AK 101+GP25 used by Reaper Grenadier
		self.ak47_ass_boom_npc = deep_clone(self.ak47_ass_npc)
		self.ak47_ass_boom_npc.sounds.prefix = "ak74_npc"	
		
		--Bravo Rifle
		self.swamp_npc = deep_clone(self.m4_npc)
		self.swamp_npc.sounds.prefix = "m16_npc"	
		self.swamp_npc.CLIP_AMMO_MAX = 60
		
		--HK417 (unused?)
		self.sg417_npc = deep_clone(self.m4_npc)
		self.sg417_npc.sounds.prefix = "contraband_npc"
		
		--HK33 
		self.hk33_npc = deep_clone(self.m4_npc)
		self.hk33_npc.sounds.prefix = "g36_npc"
		
		self.hk33_bravo_npc = deep_clone(self.m4_npc)
		self.hk33_bravo_npc.sounds.prefix = "g36_npc"
		self.hk33_bravo_npc.CLIP_AMMO_MAX = 60
		
		--[[
		self.sg417_npc.auto.fire_rate = 0.1
		self.sg417_npc.CLIP_AMMO_MAX = 20
		self.sg417_npc.DAMAGE = 4.5
		self.sg417_npc.alert_size = 3000
		self.sg417_npc.suppression = 3
		]]--
		
		--Zeal S553
		self.s553_zeal_npc = deep_clone(self.m4_npc)
		self.s553_zeal_npc.sounds.prefix = "sig552_npc"		
		
		--AK12 
		self.ak12_npc = deep_clone(self.m4_npc)
		self.ak12_npc.sounds.prefix = "flint_npc"
	
		--Sexican New Vepom Shipment
		self.hajk_npc = deep_clone(self.m4_npc)
		self.hajk_npc.sounds.prefix = "hajk_npc"		
		
		--M4/203 used by Grenadier
		self.m4_boom_npc = deep_clone(self.m4_npc)
		
		--AMCAR
		self.amcar_npc = deep_clone(self.m4_npc)
		self.amcar_npc.sounds.prefix = "amcar_npc"
		self.amcar_npc.DAMAGE = 2
		self.amcar_npc.CLIP_AMMO_MAX = 30
		self.amcar_npc.auto.fire_rate = 0.075
		self.amcar_npc.alert_size = 2500
		self.amcar_npc.suppression = 2.4
		
		--AK102
		self.ak102_npc = deep_clone(self.amcar_npc)
		self.ak102_npc.sounds.prefix = "ak74_npc"	
	end
	
	function WeaponTweakData:_init_data_m4_yellow_npc()
		self.m4_yellow_npc.categories = clone(self.new_m4.categories)
		self.m4_yellow_npc.sounds.prefix = "m4_npc"
		self.m4_yellow_npc.use_data.selection_index = 2
		self.m4_yellow_npc.DAMAGE = 2.4
		self.m4_yellow_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
		self.m4_yellow_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.m4_yellow_npc.CLIP_AMMO_MAX = 30
		self.m4_yellow_npc.NR_CLIPS_MAX = 5
		self.m4_yellow_npc.auto.fire_rate = 0.08571428571
		self.m4_yellow_npc.hold = "rifle"
		self.m4_yellow_npc.alert_size = 2500
		self.m4_yellow_npc.suppression = 2.6
		self.m4_yellow_npc.FIRE_MODE = "auto"
		
		--Yellow AK used by Reaper Tasers
		self.ak47_yellow_ass_npc = deep_clone(self.m4_yellow_npc)
		self.ak47_yellow_ass_npc.sounds.prefix = "ak74_npc"		
	end
	
	function WeaponTweakData:_init_data_ak47_npc()
		--AKM
		self.ak47_npc.categories = {"assault_rifle"}
		self.ak47_npc.sounds.prefix = "akm_npc"
		self.ak47_npc.use_data.selection_index = 2
		self.ak47_npc.DAMAGE = 3
		self.ak47_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
		self.ak47_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.ak47_npc.CLIP_AMMO_MAX = 30
		self.ak47_npc.NR_CLIPS_MAX = 5
		self.ak47_npc.auto.fire_rate = 0.1
		self.ak47_npc.hold = "rifle"
		self.ak47_npc.alert_size = 2500
		self.ak47_npc.suppression = 2.8
		self.ak47_npc.FIRE_MODE = "auto"
	end
	
	function WeaponTweakData:_init_data_m14_sniper_npc()
		--MSR Rifle
		self.m14_sniper_npc.categories = {"snp"}
		self.m14_sniper_npc.sounds.prefix = "sniper_npc"
		self.m14_sniper_npc.use_data.selection_index = 2
		self.m14_sniper_npc.DAMAGE = 9
		self.m14_sniper_npc.can_shoot_through_enemy = true
		self.m14_sniper_npc.can_shoot_through_shield = true
		self.m14_sniper_npc.can_shoot_through_wall = true
		self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
		self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.m14_sniper_npc.CLIP_AMMO_MAX = 10
		self.m14_sniper_npc.NR_CLIPS_MAX = 8
		self.m14_sniper_npc.hold = "rifle"
		self.m14_sniper_npc.alert_size = 2500
		self.m14_sniper_npc.suppression = 3.4
		self.m14_sniper_npc.armor_piercing = true
		self.m14_sniper_npc.FIRE_MODE = "single"
		
		--Reaper variant
		self.svd_snp_npc = deep_clone(self.m14_sniper_npc)
		
		--Gangster variant
		self.svdsil_snp_npc = deep_clone(self.m14_sniper_npc)
		self.svdsil_snp_npc.has_suppressor = "suppressed_a"
		
		self.asval_snp_npc = deep_clone(self.m14_sniper_npc)
		self.asval_snp_npc.has_suppressor = "suppressed_a"
				
		--Railgun
		self.railgun_npc = deep_clone(self.m14_sniper_npc)	
		self.railgun_npc.CLIP_AMMO_MAX = 4
		self.railgun_npc.DAMAGE = 18
		self.railgun_npc.trail_effect = Idstring("effects/particles/weapons/titan_trail_sc")		
		--self.railgun_npc.sounds.prefix = "barrett_npc"
	end
	
	function WeaponTweakData:_init_data_heavy_snp_npc()
		--Zeal Sniper variant (unused)
		self.heavy_snp_npc = deep_clone(self.m14_sniper_npc)	
	end	
	
	function WeaponTweakData:_init_data_r870_npc()
		self.r870_npc.categories = clone(self.r870.categories)
		self.r870_npc.sounds.prefix = "remington_npc"
		self.r870_npc.use_data.selection_index = 2
		self.r870_npc.DAMAGE = 6
		self.r870_npc.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.r870_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
		self.r870_npc.CLIP_AMMO_MAX = 8
		self.r870_npc.NR_CLIPS_MAX = 4
		self.r870_npc.hold = "rifle"
		self.r870_npc.alert_size = 2500
		self.r870_npc.suppression = 3.2
		self.r870_npc.is_shotgun = true
		self.r870_npc.rays = 6
		self.r870_npc.spread = 3
		self.r870_npc.FIRE_MODE = "single"
			
		self.r870_taser_npc = deep_clone(self.r870_npc)
		self.r870_taser_npc.sounds.prefix = "keltec_npc"
		self.r870_taser_npc.DAMAGE = 5
		self.r870_taser_npc.CLIP_AMMO_MAX = 8
	
		self.m500_npc = deep_clone(self.r870_npc)
		self.m500_npc.sounds.prefix = "m590_npc"

		self.fort_500_npc = deep_clone(self.r870_npc)		
	end
	
	function WeaponTweakData:_init_data_mossberg_npc()
		self.mossberg_npc.categories = {"shotgun"}
		self.mossberg_npc.sounds.prefix = "remington_npc"
		self.mossberg_npc.use_data.selection_index = 2
		self.mossberg_npc.DAMAGE = 9
		self.mossberg_npc.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.mossberg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
		self.mossberg_npc.CLIP_AMMO_MAX = 2
		self.mossberg_npc.NR_CLIPS_MAX = 6
		self.mossberg_npc.hold = "rifle"
		self.mossberg_npc.alert_size = 2500
		self.mossberg_npc.suppression = 3.6
		self.mossberg_npc.is_shotgun = true
		self.mossberg_npc.rays = 6
		self.mossberg_npc.spread = 3
		self.mossberg_npc.FIRE_MODE = "single"
	end
	
	function WeaponTweakData:_init_data_mp5_npc()
		self.mp5_npc.categories = clone(self.new_mp5.categories)
		self.mp5_npc.sounds.prefix = "mp5_npc"
		self.mp5_npc.use_data.selection_index = 1
		self.mp5_npc.DAMAGE = 2.4
		self.mp5_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.mp5_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.mp5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.mp5_npc.CLIP_AMMO_MAX = 30
		self.mp5_npc.NR_CLIPS_MAX = 5
		self.mp5_npc.auto.fire_rate = 0.075
		self.mp5_npc.hold = "rifle"
		self.mp5_npc.alert_size = 2500
		self.mp5_npc.suppression = 2.4
		self.mp5_npc.FIRE_MODE = "auto"
		
		--Cloaker Mp5
		self.mp5_tactical_npc = deep_clone(self.mp5_npc)
		self.mp5_tactical_npc.has_suppressor = "suppressed_a"
		self.mp5_tactical_npc.alert_size = 0
		self.mp5_tactical_npc.suppression = 0.1
		
		--T. Cloaker Mp5
		self.mp5_cloak_npc = deep_clone(self.mp5_npc)
		
		--UMP
		self.ump_npc = deep_clone(self.mp5_npc)
		self.ump_npc.DAMAGE = 3
		self.ump_npc.auto.fire_rate = 0.083
		self.ump_npc.sounds.prefix = "schakal_npc"
		self.ump_npc.CLIP_AMMO_MAX = 25
		self.ump_npc.alert_size = 2500
		self.ump_npc.suppression = 2.8
		
		--Los Federales UZI
		self.uzi_npc = deep_clone(self.mp5_npc)
		self.uzi_npc.has_suppressor = "suppressed_c"
		self.uzi_npc.alert_size = 0
		self.uzi_npc.suppression = 0.1
	
		--ASVAL
		self.asval_smg_npc = deep_clone(self.mp5_npc)		
		self.asval_smg_npc.DAMAGE = 3
		self.asval_smg_npc.auto.fire_rate = 0.083
		self.asval_smg_npc.CLIP_AMMO_MAX = 25
		self.asval_smg_npc.suppression = 2.8		
		self.asval_smg_npc.alert_size = 2500
		self.asval_smg_npc.sounds.prefix = "akmsu_npc"		
		
		--vityaz
		self.akmsu_smg_npc = deep_clone(self.mp5_npc)
		self.akmsu_smg_npc.sounds.prefix = "vityaz_npc"

		self.aksu_smg_npc = deep_clone(self.ump_npc)
		self.aksu_smg_npc.sounds.prefix = "akmsu_npc"
		
		self.akmsu_tactical_smg_npc = deep_clone(self.mp5_tactical_npc)
		self.akmsu_tactical_smg_npc.has_suppressor = "suppressed_c"
	
		--Autumn MPX
		self.mpx_npc = deep_clone(self.mp5_tactical_npc)
		self.mpx_npc.auto.fire_rate = 0.07058823529
		self.mpx_npc.DAMAGE = 2.5
		
		--Titan HRT MP9
		self.mp9_titan_npc = deep_clone(self.mp5_npc)
		self.mp9_titan_npc.sounds.prefix = "mp9_npc"
		self.mp9_titan_npc.DAMAGE = 2
		self.mp9_titan_npc.CLIP_AMMO_MAX = 20
		self.mp9_titan_npc.auto.fire_rate = 0.06666666666
		self.mp9_titan_npc.hold = "pistol"
		self.mp9_titan_npc.alert_size = 2500
		self.mp9_titan_npc.suppression = 2.2
		self.mp9_titan_npc.anim_usage = "is_pistol"
		
		--Titan HRT SR2
		self.sr2_smg_titan_npc = deep_clone(self.mp9_titan_npc)
		self.sr2_smg_titan_npc.sounds.prefix = "sr2_npc"			
	end
	
	function WeaponTweakData:_init_data_smoke_npc()
		self.smoke_npc.categories = clone(self.new_mp5.categories)
		self.smoke_npc.sounds.prefix = "mp5_npc"
		self.smoke_npc.use_data.selection_index = 1
		self.smoke_npc.DAMAGE = 2.4
		self.smoke_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.smoke_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.smoke_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.smoke_npc.CLIP_AMMO_MAX = 30
		self.smoke_npc.NR_CLIPS_MAX = 5
		self.smoke_npc.auto.fire_rate = 0.075
		self.smoke_npc.hold = "rifle"
		self.smoke_npc.alert_size = 2500
		self.smoke_npc.suppression = 2.4
		self.smoke_npc.FIRE_MODE = "auto"
	end	
	
	function WeaponTweakData:_init_data_mac11_npc()
		self.mac11_npc.categories = {"smg"}
		self.mac11_npc.sounds.prefix = "mac10_npc"
		self.mac11_npc.use_data.selection_index = 1
		self.mac11_npc.DAMAGE = 3
		self.mac11_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.mac11_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.mac11_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.mac11_npc.CLIP_AMMO_MAX = 20
		self.mac11_npc.NR_CLIPS_MAX = 5
		self.mac11_npc.auto.fire_rate = 0.06
		self.mac11_npc.alert_size = 2500
		self.mac11_npc.hold = {"uzi", "pistol"}
		self.mac11_npc.suppression = 2.8
		self.mac11_npc.FIRE_MODE = "auto"
	end
	
	function WeaponTweakData:_init_data_g36_npc()
		--G36
		self.g36_npc.categories = clone(self.g36.categories)
		self.g36_npc.sounds.prefix = "g36_npc"
		self.g36_npc.use_data.selection_index = 2
		self.g36_npc.DAMAGE = 2.4
		self.g36_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
		self.g36_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.g36_npc.CLIP_AMMO_MAX = 30
		self.g36_npc.NR_CLIPS_MAX = 5
		self.g36_npc.auto.fire_rate = 0.08571428571
		self.g36_npc.hold = "rifle"
		self.g36_npc.alert_size = 2500
		self.g36_npc.suppression = 2.6
		self.g36_npc.FIRE_MODE = "auto"
	end
	
	function WeaponTweakData:_init_data_mp9_npc()
		--NPC MP9
		self.mp9_npc.categories = clone(self.mp9.categories)
		self.mp9_npc.sounds.prefix = "mp9_npc"
		self.mp9_npc.use_data.selection_index = 1
		self.mp9_npc.DAMAGE = 2
		self.mp9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.mp9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.mp9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.mp9_npc.CLIP_AMMO_MAX = 20
		self.mp9_npc.NR_CLIPS_MAX = 5
		self.mp9_npc.auto.fire_rate = 0.06666666666
		self.mp9_npc.hold = "pistol"
		self.mp9_npc.alert_size = 2500
		self.mp9_npc.suppression = 2.2
		self.mp9_npc.FIRE_MODE = "auto"
		
		--SR2
		self.sr2_smg_npc = deep_clone(self.mp9_npc)
		self.sr2_smg_npc.sounds.prefix = "sr2_npc"		
	end
	
	function WeaponTweakData:_init_data_saiga_npc()
		--Saiga
		self.saiga_npc.categories = clone(self.saiga.categories)
		self.saiga_npc.sounds.prefix = "saiga_npc"
		self.saiga_npc.use_data.selection_index = 2
		self.saiga_npc.DAMAGE = 3
		self.saiga_npc.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.saiga_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
		self.saiga_npc.auto.fire_rate = 0.1
		self.saiga_npc.CLIP_AMMO_MAX = 20
		self.saiga_npc.NR_CLIPS_MAX = 4
		self.saiga_npc.hold = "rifle"
		self.saiga_npc.alert_size = 2500
		self.saiga_npc.suppression = 3.2
		self.saiga_npc.is_shotgun = true
		self.saiga_npc.rays = 6
		self.saiga_npc.spread = 3
		self.saiga_npc.FIRE_MODE = "auto"
			
		self.aa12_npc = deep_clone(self.saiga_npc)	
		self.aa12_npc.sounds.prefix = "aa12_npc"
			
		self.benelli_npc = deep_clone(self.saiga_npc)
		self.benelli_npc.sounds.prefix = "benelli_m4_npc"
		self.benelli_npc.DAMAGE = 4.5
		self.benelli_npc.CLIP_AMMO_MAX = 10
		self.benelli_npc.alert_size = 2500
		self.benelli_npc.suppression = 3	
		self.benelli_npc.auto = nil
		self.benelli_npc.FIRE_MODE = "single"
		self.benelli_npc.usage = "is_shotgun_mag"
		self.benelli_npc.anim_usage = "is_shotgun_pump"
		
		self.bayou_npc = deep_clone(self.benelli_npc)
		self.bayou_npc.sounds.prefix = "spas_npc"
		self.bayou_npc.DAMAGE = 4.5
		self.bayou_npc.CLIP_AMMO_MAX = 10
		self.bayou_npc.alert_size = 2500
		self.bayou_npc.suppression = 3			
	end
	
	function WeaponTweakData:_init_data_swat_van_turret_module_npc()
		self.swat_van_turret_module.name_id = "debug_sentry_gun"
		self.swat_van_turret_module.DAMAGE = 2
		self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
			{1000, 1},
			{2000, 1},
			{3000, 1}
		}
		self.swat_van_turret_module.SUPPRESSION = 1
		self.swat_van_turret_module.SPREAD = 3
		self.swat_van_turret_module.FIRE_RANGE = 4000
		self.swat_van_turret_module.CLIP_SIZE = 200
		self.swat_van_turret_module.AUTO_RELOAD = true
		self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
		self.swat_van_turret_module.CAN_GO_IDLE = true
		self.swat_van_turret_module.IDLE_WAIT_TIME = 5
		self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 2
		self.swat_van_turret_module.AUTO_REPAIR_DURATION = 120
		self.swat_van_turret_module.ECM_HACKABLE = true
		self.swat_van_turret_module.FLASH_GRENADE = {
			range = 300,
			effect_duration = 6,
			chance = 1,
			check_interval = {1, 1},
			quiet_time = {10, 13}
		}
		self.swat_van_turret_module.HACKABLE_WITH_ECM = true
		self.swat_van_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
		self.swat_van_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.swat_van_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.swat_van_turret_module.auto.fire_rate = 0.13333333333
		self.swat_van_turret_module.alert_size = 2500
		self.swat_van_turret_module.headshot_dmg_mul = 1
		self.swat_van_turret_module.EXPLOSION_DMG_MUL = 3
		self.swat_van_turret_module.FIRE_DMG_MUL = 1
		self.swat_van_turret_module.BAG_DMG_MUL = 12.5
		self.swat_van_turret_module.SHIELD_DMG_MUL = 1
		if job == "chew" or job == "glace" then
			self.swat_van_turret_module.HEALTH_INIT = 450
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 60
			self.swat_van_turret_module.AUTO_REPAIR = false
		else
			self.swat_van_turret_module.HEALTH_INIT = 900
			self.swat_van_turret_module.SHIELD_HEALTH_INIT = 120
			self.swat_van_turret_module.AUTO_REPAIR = true
		end
		self.swat_van_turret_module.DEATH_VERIFICATION = {0.4, 0.75}
		self.swat_van_turret_module.DETECTION_RANGE = self.swat_van_turret_module.FIRE_RANGE
		self.swat_van_turret_module.DETECTION_DELAY = {
			{900, 0.3},
			{3500, 1.5}
		}
		self.swat_van_turret_module.KEEP_FIRE_ANGLE = 0.9
		self.swat_van_turret_module.MAX_VEL_SPIN = 72
		self.swat_van_turret_module.MIN_VEL_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 0.05
		self.swat_van_turret_module.SLOWDOWN_ANGLE_SPIN = 30
		self.swat_van_turret_module.ACC_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 5
		self.swat_van_turret_module.MAX_VEL_PITCH = 60
		self.swat_van_turret_module.MIN_VEL_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 0.05
		self.swat_van_turret_module.SLOWDOWN_ANGLE_PITCH = 20
		self.swat_van_turret_module.ACC_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 5
		self.swat_van_turret_module.recoil = {}
		self.swat_van_turret_module.recoil.horizontal = {
			1,
			1.5,
			1,
			1
		}
		self.swat_van_turret_module.recoil.vertical = {
			1,
			1.5,
			1,
			1
		}
		self.swat_van_turret_module.challenges = {}
		self.swat_van_turret_module.challenges.group = "sentry_gun"
		self.swat_van_turret_module.challenges.weapon = "sentry_gun"
		self.swat_van_turret_module.suppression = 1
	end
	
	function WeaponTweakData:_init_data_crate_turret_module_npc()
		self.crate_turret_module.name_id = "debug_sentry_gun"
		self.crate_turret_module.DAMAGE = 2
		self.crate_turret_module.DAMAGE_MUL_RANGE = {
			{1000, 1},
			{2000, 1},
			{3000, 1}
		}
		self.crate_turret_module.SUPPRESSION = 1
		self.crate_turret_module.SPREAD = 3
		self.crate_turret_module.FIRE_RANGE = 4000
		self.crate_turret_module.DETECTION_RANGE = self.crate_turret_module.FIRE_RANGE
		self.crate_turret_module.CLIP_SIZE = 200
		self.crate_turret_module.AUTO_RELOAD = true
		self.crate_turret_module.AUTO_RELOAD_DURATION = 8
		self.crate_turret_module.CAN_GO_IDLE = false
		self.crate_turret_module.IDLE_WAIT_TIME = 5
		self.crate_turret_module.AUTO_REPAIR = false
		self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = math.huge
		self.crate_turret_module.AUTO_REPAIR_DURATION = 120
		self.crate_turret_module.ECM_HACKABLE = true
		self.crate_turret_module.HACKABLE_WITH_ECM = true
		self.crate_turret_module.VELOCITY_COMPENSATION = {
			OVERCOMPENSATION = 50,
			SNAPSHOT_INTERVAL = 0.3
		}
		self.crate_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.crate_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.crate_turret_module.auto.fire_rate = 0.06
		self.crate_turret_module.alert_size = 2500
		self.crate_turret_module.headshot_dmg_mul = 1
		self.crate_turret_module.EXPLOSION_DMG_MUL = 3
		self.crate_turret_module.FIRE_DMG_MUL = 1
		self.crate_turret_module.BAG_DMG_MUL = 12.5
		self.crate_turret_module.SHIELD_DMG_MUL = 1
		self.crate_turret_module.HEALTH_INIT = 225
		self.crate_turret_module.SHIELD_HEALTH_INIT = 30
		self.crate_turret_module.DEATH_VERIFICATION = {
			0.4,
			0.75
		}
		self.crate_turret_module.DETECTION_RANGE = 8000
		self.crate_turret_module.DETECTION_DELAY = {
			{
				900,
				0.3
			},
			{
				3500,
				1.5
			}
		}
		self.crate_turret_module.KEEP_FIRE_ANGLE = 0.9
		self.crate_turret_module.MAX_VEL_SPIN = 72
		self.crate_turret_module.MIN_VEL_SPIN = self.crate_turret_module.MAX_VEL_SPIN * 0.05
		self.crate_turret_module.SLOWDOWN_ANGLE_SPIN = 30
		self.crate_turret_module.ACC_SPIN = self.crate_turret_module.MAX_VEL_SPIN * 5
		self.crate_turret_module.MAX_VEL_PITCH = 60
		self.crate_turret_module.MIN_VEL_PITCH = self.crate_turret_module.MAX_VEL_PITCH * 0.05
		self.crate_turret_module.SLOWDOWN_ANGLE_PITCH = 20
		self.crate_turret_module.ACC_PITCH = self.crate_turret_module.MAX_VEL_PITCH * 5
		self.crate_turret_module.recoil = {
			horizontal = {
				1,
				1.5,
				1,
				1
			},
			vertical = {
				1,
				1.5,
				1,
				1
			}
		}
		self.crate_turret_module.challenges = {
			group = "sentry_gun",
			weapon = "sentry_gun"
		}
		self.crate_turret_module.suppression = 0.8
	end	
	
	function WeaponTweakData:_init_data_ceiling_turret_module_npc()
		self.ceiling_turret_module.name_id = "debug_sentry_gun"
		self.ceiling_turret_module.DAMAGE = 2
		self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
			{1000, 1},
			{2000, 1},
			{3000, 1}
		}
		self.ceiling_turret_module.SUPPRESSION = 1
		self.ceiling_turret_module.SPREAD = 3
		self.ceiling_turret_module.FIRE_RANGE = 4000
		self.ceiling_turret_module.CLIP_SIZE = 200
		self.ceiling_turret_module.AUTO_RELOAD = true
		self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
		self.ceiling_turret_module.CAN_GO_IDLE = false
		self.ceiling_turret_module.IDLE_WAIT_TIME = 5
		self.ceiling_turret_module.AUTO_REPAIR = false
		self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 2
		self.ceiling_turret_module.AUTO_REPAIR_DURATION = 120
		self.ceiling_turret_module.ECM_HACKABLE = true
		self.ceiling_turret_module.FLASH_GRENADE = {
			range = 300,
			effect_duration = 6,
			chance = 1,
			check_interval = {1, 1},
			quiet_time = {10, 13}
		}
		self.ceiling_turret_module.HACKABLE_WITH_ECM = true
		self.ceiling_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
		self.ceiling_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.ceiling_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.ceiling_turret_module.auto.fire_rate = 0.13333333333
		self.ceiling_turret_module.alert_size = 2500
		self.ceiling_turret_module.headshot_dmg_mul = 1
		self.ceiling_turret_module.EXPLOSION_DMG_MUL = 3
		self.ceiling_turret_module.FIRE_DMG_MUL = 1
		self.ceiling_turret_module.BAG_DMG_MUL = 12.5
		self.ceiling_turret_module.SHIELD_DMG_MUL = 1
		self.ceiling_turret_module.HEALTH_INIT = 450
		self.ceiling_turret_module.SHIELD_HEALTH_INIT = 60
		self.ceiling_turret_module.DEATH_VERIFICATION = {0.4, 0.75}
		self.ceiling_turret_module.DETECTION_RANGE = self.ceiling_turret_module.FIRE_RANGE
		self.ceiling_turret_module.DETECTION_DELAY = {
			{900, 0.3},
			{3500, 1.5}
		}
		self.ceiling_turret_module.KEEP_FIRE_ANGLE = 0.9
		self.ceiling_turret_module.MAX_VEL_SPIN = 72
		self.ceiling_turret_module.MIN_VEL_SPIN = self.ceiling_turret_module.MAX_VEL_SPIN * 0.05
		self.ceiling_turret_module.SLOWDOWN_ANGLE_SPIN = 30
		self.ceiling_turret_module.ACC_SPIN = self.ceiling_turret_module.MAX_VEL_SPIN * 5
		self.ceiling_turret_module.MAX_VEL_PITCH = 60
		self.ceiling_turret_module.MIN_VEL_PITCH = self.ceiling_turret_module.MAX_VEL_PITCH * 0.05
		self.ceiling_turret_module.SLOWDOWN_ANGLE_PITCH = 20
		self.ceiling_turret_module.ACC_PITCH = self.ceiling_turret_module.MAX_VEL_PITCH * 5
		self.ceiling_turret_module.recoil = {}
		self.ceiling_turret_module.recoil.horizontal = {
			1,
			1.5,
			1,
			1
		}
		self.ceiling_turret_module.recoil.vertical = {
			1,
			1.5,
			1,
			1
		}
		self.ceiling_turret_module.challenges = {}
		self.ceiling_turret_module.challenges.group = "sentry_gun"
		self.ceiling_turret_module.challenges.weapon = "sentry_gun"
		self.ceiling_turret_module.suppression = 1
		self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
		self.ceiling_turret_module_no_idle.CAN_GO_IDLE = false
		self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
		self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
		self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
		self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE		
	end
	
	function WeaponTweakData:_init_data_aa_turret_module_npc()
		self.aa_turret_module.name_id = "debug_sentry_gun"
		self.aa_turret_module.DAMAGE = 2
		self.aa_turret_module.DAMAGE_MUL_RANGE = {
			{1000, 1},
			{2000, 1},
			{3000, 1}
		}
		self.aa_turret_module.SUPPRESSION = 1
		self.aa_turret_module.SPREAD = 3
		self.aa_turret_module.FIRE_RANGE = 4000
		self.aa_turret_module.CLIP_SIZE = 200
		self.aa_turret_module.AUTO_RELOAD = true
		self.aa_turret_module.AUTO_RELOAD_DURATION = 8
		self.aa_turret_module.CAN_GO_IDLE = false
		self.aa_turret_module.IDLE_WAIT_TIME = 5
		self.aa_turret_module.AUTO_REPAIR = true
		self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = math.huge
		self.aa_turret_module.AUTO_REPAIR_DURATION = 120
		self.aa_turret_module.ECM_HACKABLE = true
		self.aa_turret_module.FLASH_GRENADE = {
			range = 300,
			effect_duration = 6,
			chance = 1,
			check_interval = {1, 1},
			quiet_time = {10, 13}
		}
		self.aa_turret_module.HACKABLE_WITH_ECM = true
		self.aa_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
		self.aa_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.aa_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.aa_turret_module.auto.fire_rate = 0.13333333333
		self.aa_turret_module.alert_size = 2500
		self.aa_turret_module.headshot_dmg_mul = 1
		self.aa_turret_module.EXPLOSION_DMG_MUL = 3
		self.aa_turret_module.FIRE_DMG_MUL = 1
		self.aa_turret_module.BAG_DMG_MUL = 12.5
		self.aa_turret_module.SHIELD_DMG_MUL = 1
		self.aa_turret_module.HEALTH_INIT = 450
		self.aa_turret_module.SHIELD_HEALTH_INIT = 60
		self.aa_turret_module.DEATH_VERIFICATION = {0.4, 0.75}
		self.aa_turret_module.DETECTION_RANGE = self.aa_turret_module.FIRE_RANGE
		self.aa_turret_module.DETECTION_DELAY = {
			{900, 0.3},
			{3500, 1.5}
		}
		self.aa_turret_module.KEEP_FIRE_ANGLE = 0.9
		self.aa_turret_module.MAX_VEL_SPIN = 72
		self.aa_turret_module.MIN_VEL_SPIN = self.aa_turret_module.MAX_VEL_SPIN * 0.05
		self.aa_turret_module.SLOWDOWN_ANGLE_SPIN = 30
		self.aa_turret_module.ACC_SPIN = self.aa_turret_module.MAX_VEL_SPIN * 5
		self.aa_turret_module.MAX_VEL_PITCH = 60
		self.aa_turret_module.MIN_VEL_PITCH = self.aa_turret_module.MAX_VEL_PITCH * 0.05
		self.aa_turret_module.SLOWDOWN_ANGLE_PITCH = 20
		self.aa_turret_module.ACC_PITCH = self.aa_turret_module.MAX_VEL_PITCH * 5
		self.aa_turret_module.recoil = {}
		self.aa_turret_module.recoil.horizontal = {
			1,
			1.5,
			1,
			1
		}
		self.aa_turret_module.recoil.vertical = {
			1,
			1.5,
			1,
			1
		}
		self.aa_turret_module.challenges = {}
		self.aa_turret_module.challenges.group = "sentry_gun"
		self.aa_turret_module.challenges.weapon = "sentry_gun"
		self.aa_turret_module.suppression = 1	
	end	
			
	function WeaponTweakData:_init_data_s552_npc()
		--Sig 553
		self.s552_npc.categories = clone(self.s552.categories)
		self.s552_npc.sounds.prefix = "sig552_npc"
		self.s552_npc.use_data.selection_index = 2
		self.s552_npc.DAMAGE = 2.4
		self.s552_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.s552_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.s552_npc.CLIP_AMMO_MAX = 30
		self.s552_npc.NR_CLIPS_MAX = 5
		self.s552_npc.auto.fire_rate = 0.08571428571
		self.s552_npc.hold = "rifle"
		self.s552_npc.alert_size = 2500
		self.s552_npc.suppression = 2.6
		self.s552_npc.FIRE_MODE = "auto"
		self.s552_npc.has_suppressor = "suppressed_c"
	end	
	
	function WeaponTweakData:_init_data_scar_npc()
		--M14/Socom 16/SCAR-H
		self.scar_npc.categories = clone(self.scar.categories)
		self.scar_npc.sounds.prefix = "zsniper_npc"
		self.scar_npc.use_data.selection_index = 2
		self.scar_npc.DAMAGE = 6
		self.scar_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
		self.scar_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.scar_npc.CLIP_AMMO_MAX = 20
		self.scar_npc.NR_CLIPS_MAX = 5
		self.scar_npc.auto.fire_rate = 0.08571428571
		self.scar_npc.hold = "rifle"
		self.scar_npc.alert_size = 2500
		self.scar_npc.suppression = 2.8
		self.scar_npc.FIRE_MODE = "single"
		self.scar_npc.trail_effect = Idstring("effects/particles/weapons/titan_trail_sc")
		self.scar_npc.usage = "is_dmr"
		self.scar_npc.anim_usage = "is_rifle"	
		self.scar_secondary_npc = deep_clone(self.scar_npc)
		self.scar_secondary_npc.use_data.selection_index = 1
	end
	
	function WeaponTweakData:_init_data_dmr_npc()
		--US Marshal DMR
		self.dmr_npc = deep_clone(self.scar_npc)
		self.dmr_npc.sounds.prefix = "saint_victor_npc"
		self.dmr_npc.trail_effect = Idstring("effects/particles/weapons/titan_trail_sc")
		self.dmr_npc.trail = nil
		
		--Type-7
		self.type_7_npc = deep_clone(self.scar_npc)		
		self.type_7_npc.DAMAGE = 1
		self.type_7_npc.CLIP_AMMO_MAX = 10
		self.type_7_npc.sounds.prefix = "saint_victor_npc"		
		--Needs a new muzzleflash + Trail effect pls
		--self.type_7_npc.muzzleflash =  Idstring("effects/payday2/particles/character/taser_hittarget")
		self.type_7_npc.trail_effect = Idstring("effects/particles/weapons/titan_trail_sc")
	end	
	
	function WeaponTweakData:_init_data_m249_npc()
		--M249
		self.m249_npc.categories = clone(self.m249.categories)
		self.m249_npc.sounds.prefix = "m249_npc"
		self.m249_npc.use_data.selection_index = 2
		self.m249_npc.DAMAGE = 2.4
		self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.m249_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.m249_npc.CLIP_AMMO_MAX = 200
		self.m249_npc.NR_CLIPS_MAX = 2
		self.m249_npc.auto.fire_rate = 0.075
		self.m249_npc.hold = "rifle"
		self.m249_npc.alert_size = 2500
		self.m249_npc.suppression = 2
		self.m249_npc.FIRE_MODE = "auto"
		
		--RPK
		self.rpk_lmg_npc = deep_clone(self.m249_npc)
		self.rpk_lmg_npc.sounds.prefix = "rpk_npc"		
		
		--HK21
		self.hk21_sc_npc = deep_clone(self.m249_npc)
		self.hk21_sc_npc.sounds.prefix = "hk23e_npc"
		
		--Hatman's MG42 of EVIL
		self.mg42_npc = deep_clone(self.m249_npc)
		self.mg42_npc.sounds.prefix = "mg42_npc"
		--[[self.hk21_sc_npc.use_data.selection_index = 2
		self.hk21_sc_npc.DAMAGE = 3
		self.hk21_sc_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.hk21_sc_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	    self.hk21_sc_npc.CLIP_AMMO_MAX = 100
		self.hk21_sc_npc.NR_CLIPS_MAX = 5
		self.hk21_sc_npc.auto.fire_rate = 0.075
		self.hk21_sc_npc.hold = "rifle"
		self.hk21_sc_npc.alert_size = 2500
		self.hk21_sc_npc.suppression = 2.4
		self.hk21_sc_npc.usage = "is_lmg"]]--
		
		--HK23
		self.hk23_sc_npc = deep_clone(self.hk21_sc_npc)	
		self.hk23_sc_npc.use_data.selection_index = 2
		self.hk23_sc_npc.DAMAGE = 2
		self.hk23_sc_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.hk23_sc_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.hk23_sc_npc.auto.fire_rate = 0.08
		self.hk23_sc_npc.CLIP_AMMO_MAX = 50
		self.hk23_sc_npc.NR_CLIPS_MAX = 5
		self.hk23_sc_npc.auto.fire_rate = 0.075
		self.hk23_sc_npc.hold = "rifle"
		self.hk23_sc_npc.alert_size = 2500
		self.hk23_sc_npc.suppression = 2.4
		
		--M60
		self.m60_npc = deep_clone(self.m249_npc)	
		self.m60_npc.sounds.prefix = "m60_npc"
	
		--Bravo LMG--
		self.m249_bravo_npc = deep_clone(self.hk23_sc_npc)	
		self.m249_bravo_npc.sounds.prefix = "m249_npc"
		self.m249_bravo_npc.CLIP_AMMO_MAX = 200
		
		--Murky Bravo M60
		self.m60_bravo_npc = deep_clone(self.hk23_sc_npc)
		self.m60_bravo_npc.sounds.prefix = "m60_npc"
		self.m60_bravo_npc.CLIP_AMMO_MAX = 200
		
		--Federales Bravo HK21
		self.hk21_bravo_npc = deep_clone(self.hk23_sc_npc)
		self.hk21_bravo_npc.sounds.prefix = "hk23e_npc"
		self.hk21_bravo_npc.CLIP_AMMO_MAX = 200
		
		--M60 Omnia
		self.m60_om_npc = deep_clone(self.m249_npc)	
		self.m60_om_npc.sounds.prefix = "m60_npc"	
	end
	
	function WeaponTweakData:_init_data_contraband_npc()
		--HK417
		self.contraband_npc.categories = clone(self.contraband.categories)
		self.contraband_npc.sounds.prefix = "contraband_npc"
		self.contraband_npc.use_data.selection_index = 2
		self.contraband_npc.DAMAGE = 2.4
		self.contraband_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
		self.contraband_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.contraband_npc.CLIP_AMMO_MAX = 30
		self.contraband_npc.NR_CLIPS_MAX = 5
		self.contraband_npc.auto.fire_rate = 0.08571428571
		self.contraband_npc.hold = "rifle"
		self.contraband_npc.alert_size = 2500
		self.contraband_npc.suppression = 2.6
		self.contraband_npc.FIRE_MODE = "auto"	
	
		--M203
		self.contraband_m203_npc.sounds.prefix = "contrabandm203_npc"
		self.contraband_m203_npc.use_data.selection_index = 2
		self.contraband_m203_npc.DAMAGE = 80
		self.contraband_m203_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.contraband_m203_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.contraband_m203_npc.no_trail = true
		self.contraband_m203_npc.CLIP_AMMO_MAX = 1
		self.contraband_m203_npc.NR_CLIPS_MAX = 4
		self.contraband_m203_npc.looped_reload_speed = 0.16666667
		self.contraband_m203_npc.auto.fire_rate = 0.1
		self.contraband_m203_npc.hold = "rifle"
		self.contraband_m203_npc.alert_size = 2500
		self.contraband_m203_npc.suppression = 1
		
		--M32 
		self.m32_npc = deep_clone(self.contraband_m203_npc)
		self.m32_npc.sounds.prefix = "mgl_npc"
		self.m32_npc.anim_usage = "is_shotgun_pump"
		self.m32_npc.usage = "is_m32"
		self.m32_npc.projectile = "launcher_frag_m32"
		self.m32_npc.CLIP_AMMO_MAX = 6	
		self.m32_npc.looped_reload_speed = nil
		self.m32_npc.has_fire_animation = true
		self.m32_npc.animations = { fire = "recoil" }
		
		self.m32_boom_npc = deep_clone(self.m32_npc)
		self.m32_boom_npc.gl_cooldown_max = 10
		self.m32_boom_npc.gl_speaking_cooldown = 0.9
		self.m32_boom_npc.gl_voiceline = true
		
		--RPG-7
		self.rpg7_npc = deep_clone(self.contraband_m203_npc)
		self.rpg7_npc.sounds.prefix = "rpg_npc"
		self.rpg7_npc.anim_usage = "is_rifle"
		self.rpg7_npc.usage = "is_m32"
		self.rpg7_npc.projectile = "rocket_frag"
		self.rpg7_npc.CLIP_AMMO_MAX = 1
		self.rpg7_npc.looped_reload_speed = nil		
	end
	
	function WeaponTweakData:_init_data_mini_npc()
		self.mini_npc.categories = clone(self.m134.categories)
		self.mini_npc.sounds.prefix = "minigun_npc"
		self.mini_npc.use_data.selection_index = 2
		self.mini_npc.DAMAGE = 3
		self.mini_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.mini_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.mini_npc.CLIP_AMMO_MAX = 300
		self.mini_npc.NR_CLIPS_MAX = 2
		self.mini_npc.auto.fire_rate = 0.06
		self.mini_npc.hold = "rifle"
		self.mini_npc.alert_size = 2500
		self.mini_npc.suppression = 2
		self.mini_npc.FIRE_MODE = "auto"
		
		--Akimbo Miniguns
		self.x_mini_npc = deep_clone(self.mini_npc)		
		self.x_mini_npc.categories = {
			"akimbo",
			"minigun"
		}	
		self.x_mini_npc.sounds.prefix = "minigun_npc"
		self.x_mini_npc.use_data.selection_index = 1
		self.x_mini_npc.DAMAGE = 3
		self.x_mini_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
		self.x_mini_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
		self.x_mini_npc.CLIP_AMMO_MAX = 600
		self.x_mini_npc.NR_CLIPS_MAX = 2
		self.x_mini_npc.auto.fire_rate = 0.06
		self.x_mini_npc.hold = "akimbo_pistol"
		self.x_mini_npc.alert_size = 2500
		self.x_mini_npc.suppression = 2
		self.x_mini_npc.FIRE_MODE = "auto"		
	end
	
	function WeaponTweakData:_init_data_flamethrower_npc()
		--NPC flamethrower
		self.flamethrower_npc.categories = {
			"flamethrower"
		}
		self.flamethrower_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.flamethrower_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.flamethrower_npc.shell_ejection = "effects/payday2/particles/weapons/heat/overheat"
		self.flamethrower_npc.single_flame_effect_duration = 1
		self.flamethrower_npc.flame_effect = "effects/payday2/particles/explosions/flamethrower_cheap"
		self.flamethrower_npc.bullet_class = "FlameBulletBase"
		self.flamethrower_npc.flame_max_range = 1400
		self.flamethrower_npc.extra_flames_offset = 0.05
		self.flamethrower_npc.sounds.prefix = "flamethrower_npc"
		self.flamethrower_npc.sounds.fire = "flamethrower_npc_fire"
		self.flamethrower_npc.sounds.stop_fire = "flamethrower_npc_fire_stop"
		self.flamethrower_npc.use_data.selection_index = 2
		self.flamethrower_npc.DAMAGE = 2.4
		self.flamethrower_npc.CLIP_AMMO_MAX = 60
		self.flamethrower_npc.NR_CLIPS_MAX = 4
		self.flamethrower_npc.hold = {
			"bullpup",
			"rifle"
		}
		self.flamethrower_npc.auto.fire_rate = 0.1
		self.flamethrower_npc.alert_size = 2500
		self.flamethrower_npc.suppression = 3.1
		self.flamethrower_npc.FIRE_MODE = "auto"
	end
	
	--Lotta crew guns in here now--
	--PISTOLS
		function WeaponTweakData:_init_data_raging_bull_crew()
			self.raging_bull_crew.categories = clone(self.new_raging_bull.categories)
			self.raging_bull_crew.sounds.prefix = "rbull_npc"
			self.raging_bull_crew.use_data.selection_index = 1
			self.raging_bull_crew.DAMAGE = 4
			self.raging_bull_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.raging_bull_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.raging_bull_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
			self.raging_bull_crew.CLIP_AMMO_MAX = 6
			self.raging_bull_crew.NR_CLIPS_MAX = 8
			self.raging_bull_crew.hold = "pistol"
			self.raging_bull_crew.reload = "revolver"
			self.raging_bull_crew.alert_size = 2500
			self.raging_bull_crew.suppression = 1.8
			self.raging_bull_crew.FIRE_MODE = "single"
			self.raging_bull_primary_crew = deep_clone(self.raging_bull_crew)
			self.raging_bull_primary_crew.use_data.selection_index = 2
		end

	--SMGS
		function WeaponTweakData:_init_data_shepheard_crew()
			self.shepheard_crew.categories = clone(self.shepheard.categories)
			self.shepheard_crew.sounds.prefix = "shepheard_npc"
			self.shepheard_crew.use_data.selection_index = 2
			self.shepheard_crew.DAMAGE = crew_wep_preset.smg.damage
			self.shepheard_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.shepheard_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.shepheard_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.shepheard_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.shepheard_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.shepheard_crew.NR_CLIPS_MAX = 5
			self.shepheard_crew.hold = "rifle"
			self.shepheard_crew.pull_magazine_during_reload = "smg"
			self.shepheard_crew.alert_size = 2500
			self.shepheard_crew.suppression = 2.2
			self.shepheard_crew.FIRE_MODE = "auto"
		end	
	
		function WeaponTweakData:_init_data_erma_crew()
			self.erma_crew.categories = clone(self.erma.categories)
			self.erma_crew.sounds.prefix = "erma_npc"
			self.erma_crew.use_data.selection_index = 2
			self.erma_crew.DAMAGE = crew_wep_preset.smg.damage
			self.erma_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.erma_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.erma_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.erma_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.erma_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.erma_crew.NR_CLIPS_MAX = 5
			self.erma_crew.reload = "rifle"
			self.erma_crew.pull_magazine_during_reload = "smg"
			self.erma_crew.hold = "rifle"
			self.erma_crew.alert_size = 2500
			self.erma_crew.suppression = 2.2
			self.erma_crew.FIRE_MODE = "auto"
		end	
	
		function WeaponTweakData:_init_data_vityaz_crew()
			self.vityaz_crew.categories = clone(self.vityaz.categories)
			self.vityaz_crew.sounds.prefix = "vityaz_npc"
			self.vityaz_crew.use_data.selection_index = 2
			self.vityaz_crew.DAMAGE = crew_wep_preset.smg.damage
			self.vityaz_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.vityaz_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.vityaz_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.vityaz_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.vityaz_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.vityaz_crew.NR_CLIPS_MAX = 5
			self.vityaz_crew.pull_magazine_during_reload = "smg"
			self.vityaz_crew.hold = "rifle"
			self.vityaz_crew.alert_size = 2500
			self.vityaz_crew.suppression = 2.2
			self.vityaz_crew.FIRE_MODE = "auto"
			self.vityaz_primary_crew = deep_clone(self.vityaz_crew)
			self.vityaz_primary_crew.use_data.selection_index = 2
		end	
	
		function WeaponTweakData:_init_data_polymer_crew()
			self.polymer_crew.categories = clone(self.polymer.categories)
			self.polymer_crew.sounds.prefix = "polymer_npc"
			self.polymer_crew.use_data.selection_index = 2
			self.polymer_crew.DAMAGE = crew_wep_preset.smg.damage
			self.polymer_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.polymer_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.polymer_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.polymer_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.polymer_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.polymer_crew.NR_CLIPS_MAX = 5
			self.polymer_crew.reload = "rifle"
			self.polymer_crew.pull_magazine_during_reload = "smg"
			self.polymer_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.polymer_crew.alert_size = 2500
			self.polymer_crew.suppression = 2.2
			self.polymer_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_schakal_crew()
			self.schakal_crew.categories = clone(self.schakal.categories)
			self.schakal_crew.sounds.prefix = "schakal_npc"
			self.schakal_crew.use_data.selection_index = 2
			self.schakal_crew.DAMAGE = crew_wep_preset.smg.damage
			self.schakal_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.schakal_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.schakal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.schakal_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.schakal_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.schakal_crew.NR_CLIPS_MAX = 5
			self.schakal_crew.pull_magazine_during_reload = "pistol"
			self.schakal_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.schakal_crew.hold = "rifle"
			self.schakal_crew.alert_size = 2500
			self.schakal_crew.suppression = 2.2
			self.schakal_crew.FIRE_MODE = "auto"
		end	

		function WeaponTweakData:_init_data_pm9_crew()
			self.pm9_crew.categories = clone(self.pm9.categories)
			self.pm9_crew.sounds.prefix = "pm9_npc"
			self.pm9_crew.use_data.selection_index = 2
			self.pm9_crew.DAMAGE = crew_wep_preset.smg.damage
			self.pm9_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.pm9_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.pm9_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.pm9_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.pm9_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.pm9_crew.NR_CLIPS_MAX = 5
			self.pm9_crew.pull_magazine_during_reload = "smg"
			self.pm9_crew.hold = "pistol"
			self.pm9_crew.alert_size = 2500
			self.pm9_crew.suppression = 2.2
			self.pm9_crew.FIRE_MODE = "auto"
		end
	
		function WeaponTweakData:_init_data_coal_crew()
			self.coal_crew.categories = clone(self.coal.categories)
			self.coal_crew.sounds.prefix = "coal_npc"
			self.coal_crew.use_data.selection_index = 2
			self.coal_crew.DAMAGE = crew_wep_preset.smg.damage
			self.coal_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.coal_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.coal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.coal_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.coal_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.coal_crew.NR_CLIPS_MAX = 5
			self.coal_crew.pull_magazine_during_reload = "rifle"
			self.coal_crew.hold = "rifle"
			self.coal_crew.alert_size = 2500
			self.coal_crew.suppression = 2.2
			self.coal_crew.FIRE_MODE = "auto"
		end

		function WeaponTweakData:_init_data_hailstorm_crew()
			self.hailstorm_crew.categories = clone(self.hailstorm.categories)
			self.hailstorm_crew.sounds.prefix = "hailstorm_npc"
			self.hailstorm_crew.use_data.selection_index = 2
			self.hailstorm_crew.DAMAGE = crew_wep_preset.smg.damage
			self.hailstorm_crew.muzzleflash = "effects/payday2/particles/weapons/hailstorm_effect"
			self.hailstorm_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/hailstorm_suppressed"
			self.hailstorm_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
			self.hailstorm_crew.trail_effect = "effects/payday2/particles/weapons/hailstorm_streak"
			self.hailstorm_crew.auto.fire_rate = crew_wep_preset.smg.fire_rate
			self.hailstorm_crew.CLIP_AMMO_MAX = crew_wep_preset.smg.mag_capacity
			self.hailstorm_crew.NR_CLIPS_MAX = 5
			self.hailstorm_crew.reload = "looped"
			self.hailstorm_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.hailstorm_crew.reload = "bullpup"
			self.hailstorm_crew.alert_size = 2500
			self.hailstorm_crew.suppression = 2.2
			self.hailstorm_crew.FIRE_MODE = "auto"
		end
	
	--ARs
		function WeaponTweakData:_init_data_akm_gold_crew()
			self.akm_gold_crew.categories = clone(self.akm_gold.categories)
			self.akm_gold_crew.sounds.prefix = "akm_npc"
			self.akm_gold_crew.use_data.selection_index = 2
			self.akm_gold_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.akm_gold_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.akm_gold_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.akm_gold_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.akm_gold_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.akm_gold_crew.NR_CLIPS_MAX = 5
			self.akm_gold_crew.pull_magazine_during_reload = "rifle"
			self.akm_gold_crew.hold = "rifle"
			self.akm_gold_crew.alert_size = 2500
			self.akm_gold_crew.suppression = 2.2
			self.akm_gold_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_amcar_crew()
			self.amcar_crew.categories = clone(self.amcar.categories)
			self.amcar_crew.sounds.prefix = "amcar_npc"
			self.amcar_crew.use_data.selection_index = 2
			self.amcar_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.amcar_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.amcar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.amcar_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.amcar_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.amcar_crew.NR_CLIPS_MAX = 5
			self.amcar_crew.pull_magazine_during_reload = "rifle"
			self.amcar_crew.hold = "rifle"
			self.amcar_crew.alert_size = 2500
			self.amcar_crew.suppression = 2.2
			self.amcar_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_ak74_crew()
			self.ak74_crew.categories = clone(self.ak74.categories)
			self.ak74_crew.sounds.prefix = "ak74_npc"
			self.ak74_crew.use_data.selection_index = 2
			self.ak74_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.ak74_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.ak74_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.ak74_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.ak74_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.ak74_crew.NR_CLIPS_MAX = 5
			self.ak74_crew.pull_magazine_during_reload = "rifle"
			self.ak74_crew.hold = "rifle"
			self.ak74_crew.alert_size = 2500
			self.ak74_crew.suppression = 2.2
			self.ak74_crew.FIRE_MODE = "auto"
			self.ak74_secondary_crew = deep_clone(self.ak74_crew)
			self.ak74_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_m4_crew()
			self.m4_crew.categories = clone(self.new_m4.categories)
			self.m4_crew.sounds.prefix = "m4_npc"
			self.m4_crew.use_data.selection_index = 2
			self.m4_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.m4_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.m4_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.m4_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.m4_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.m4_crew.NR_CLIPS_MAX = 5
			self.m4_crew.hold = "rifle"
			self.m4_crew.alert_size = 2500
			self.m4_crew.suppression = 2.2
			self.m4_crew.pull_magazine_during_reload = "rifle"
			self.m4_crew.FIRE_MODE = "auto"
			self.m4_secondary_crew = deep_clone(self.m4_crew)
			self.m4_secondary_crew.use_data.selection_index = 1
			self.ak47_ass_crew = deep_clone(self.m4_crew)
		end
		
		function WeaponTweakData:_init_data_aug_crew()
			self.aug_crew.categories = clone(self.aug.categories)
			self.aug_crew.sounds.prefix = "aug_npc"
			self.aug_crew.use_data.selection_index = 2
			self.aug_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.aug_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.aug_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.aug_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.aug_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.aug_crew.NR_CLIPS_MAX = 5
			self.aug_crew.pull_magazine_during_reload = "rifle"
			self.aug_crew.hold = {"bullpup", "rifle"}
			self.aug_crew.alert_size = 2500
			self.aug_crew.suppression = 2.2
			self.aug_crew.FIRE_MODE = "auto"
			self.aug_secondary_crew = deep_clone(self.aug_crew)
			self.aug_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_akm_crew()
			self.akm_crew.categories = clone(self.akm.categories)
			self.akm_crew.sounds.prefix = "akm_npc"
			self.akm_crew.use_data.selection_index = 2
			self.akm_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.akm_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.akm_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.akm_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.akm_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.akm_crew.NR_CLIPS_MAX = 5
			self.akm_crew.pull_magazine_during_reload = "rifle"
			self.akm_crew.hold = "rifle"
			self.akm_crew.alert_size = 2500
			self.akm_crew.suppression = 2.2
			self.akm_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_g36_crew()
			self.g36_crew.categories = clone(self.g36.categories)
			self.g36_crew.sounds.prefix = "g36_npc"
			self.g36_crew.use_data.selection_index = 2
			self.g36_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.g36_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.g36_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.g36_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.g36_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.g36_crew.NR_CLIPS_MAX = 5
			self.g36_crew.pull_magazine_during_reload = "rifle"
			self.g36_crew.hold = "rifle"
			self.g36_crew.alert_size = 2500
			self.g36_crew.suppression = 2.2
			self.g36_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_ak5_crew()
			self.ak5_crew.categories = clone(self.ak5.categories)
			self.ak5_crew.sounds.prefix = "ak5_npc"
			self.ak5_crew.use_data.selection_index = 2
			self.ak5_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.ak5_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.ak5_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.ak5_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.ak5_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.ak5_crew.NR_CLIPS_MAX = 5
			self.ak5_crew.pull_magazine_during_reload = "rifle"
			self.ak5_crew.hold = "rifle"
			self.ak5_crew.alert_size = 2500
			self.ak5_crew.suppression = 2.2
			self.ak5_crew.FIRE_MODE = "auto"
		end
	
		function WeaponTweakData:_init_data_m16_crew()
			self.m16_crew.categories = clone(self.m16.categories)
			self.m16_crew.sounds.prefix = "m16_npc"
			self.m16_crew.use_data.selection_index = 2
			self.m16_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.m16_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.m16_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.m16_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.m16_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.m16_crew.NR_CLIPS_MAX = 8
			self.m16_crew.hold = "rifle"
			self.m16_crew.alert_size = 2500
			self.m16_crew.suppression = 2.2
			self.m16_crew.pull_magazine_during_reload = "rifle"
			self.m16_crew.FIRE_MODE = "auto"
		end
	
		function WeaponTweakData:_init_data_s552_crew()
			self.s552_crew.categories = clone(self.s552.categories)
			self.s552_crew.sounds.prefix = "sig552_npc"
			self.s552_crew.use_data.selection_index = 2
			self.s552_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.s552_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.s552_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.s552_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.s552_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.s552_crew.NR_CLIPS_MAX = 5
			self.s552_crew.pull_magazine_during_reload = "rifle"
			self.s552_crew.hold = "rifle"
			self.s552_crew.alert_size = 2500
			self.s552_crew.suppression = 2.2
			self.s552_crew.FIRE_MODE = "auto"
			self.s552_secondary_crew = deep_clone(self.s552_crew)
			self.s552_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_scar_crew()
			self.scar_crew.categories = clone(self.scar.categories)
			self.scar_crew.sounds.prefix = "scar_npc"
			self.scar_crew.use_data.selection_index = 2
			self.scar_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.scar_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.scar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.scar_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.scar_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.scar_crew.NR_CLIPS_MAX = 5
			self.scar_crew.pull_magazine_during_reload = "rifle"
			self.scar_crew.hold = "rifle"
			self.scar_crew.alert_size = 2500
			self.scar_crew.suppression = 2.2
			self.scar_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_fal_crew()
			self.fal_crew.categories = clone(self.fal.categories)
			self.fal_crew.sounds.prefix = "fn_fal_npc"
			self.fal_crew.use_data.selection_index = 2
			self.fal_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.fal_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.fal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.fal_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.fal_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.fal_crew.NR_CLIPS_MAX = 5
			self.fal_crew.pull_magazine_during_reload = "rifle"
			self.fal_crew.hold = "rifle"
			self.fal_crew.alert_size = 2500
			self.fal_crew.suppression = 2.2
			self.fal_crew.FIRE_MODE = "auto"
		end
	
		function WeaponTweakData:_init_data_famas_crew()
			self.famas_crew.categories = clone(self.famas.categories)
			self.famas_crew.sounds.prefix = "famas_npc"
			self.famas_crew.use_data.selection_index = 2
			self.famas_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.famas_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.famas_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.famas_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.famas_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.famas_crew.NR_CLIPS_MAX = 5
			self.famas_crew.pull_magazine_during_reload = "rifle"
			self.famas_crew.hold = {"bullpup", "rifle"}
			self.famas_crew.alert_size = 2500
			self.famas_crew.suppression = 2.2
			self.famas_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_galil_crew()
			self.galil_crew.categories = clone(self.galil.categories)
			self.galil_crew.sounds.prefix = "galil_npc"
			self.galil_crew.use_data.selection_index = 2
			self.galil_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.galil_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.galil_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.galil_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.galil_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.galil_crew.NR_CLIPS_MAX = 5
			self.galil_crew.pull_magazine_during_reload = "rifle"
			self.galil_crew.hold = "rifle"
			self.galil_crew.alert_size = 2500
			self.galil_crew.suppression = 2.2
			self.galil_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_l85a2_crew()
			self.l85a2_crew.categories = clone(self.l85a2.categories)
			self.l85a2_crew.sounds.prefix = "l85_npc"
			self.l85a2_crew.use_data.selection_index = 2
			self.l85a2_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.l85a2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.l85a2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.l85a2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.l85a2_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.l85a2_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.l85a2_crew.NR_CLIPS_MAX = 5
			self.l85a2_crew.pull_magazine_during_reload = "rifle"
			self.l85a2_crew.hold = "rifle"
			self.l85a2_crew.reload = "bullpup"
			self.l85a2_crew.alert_size = 2500
			self.l85a2_crew.suppression = 2.2
			self.l85a2_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_vhs_crew()
			self.vhs_crew.categories = clone(self.vhs.categories)
			self.vhs_crew.sounds.prefix = "vhs_npc"
			self.vhs_crew.use_data.selection_index = 2
			self.vhs_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.vhs_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.vhs_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.vhs_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.vhs_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.vhs_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.vhs_crew.NR_CLIPS_MAX = 5
			self.vhs_crew.pull_magazine_during_reload = "rifle"
			self.vhs_crew.hold = {"bullpup", "rifle"}
			self.vhs_crew.alert_size = 2500
			self.vhs_crew.suppression = 2.2
			self.vhs_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_asval_crew()
			self.asval_crew.categories = clone(self.asval.categories)
			self.asval_crew.sounds.prefix = "akm_npc"
			self.asval_crew.use_data.selection_index = 2
			self.asval_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.asval_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.asval_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.asval_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.asval_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.asval_crew.NR_CLIPS_MAX = 5
			self.asval_crew.pull_magazine_during_reload = "rifle"
			self.asval_crew.hold = "rifle"
			self.asval_crew.alert_size = 2500
			self.asval_crew.suppression = 3.4
			self.asval_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_contraband_crew()
			self.contraband_crew.categories = clone(self.contraband.categories)
			self.contraband_crew.sounds.prefix = "contraband_npc"
			self.contraband_crew.use_data.selection_index = 2
			self.contraband_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.contraband_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.contraband_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.contraband_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.contraband_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.contraband_crew.NR_CLIPS_MAX = 5
			self.contraband_crew.pull_magazine_during_reload = "rifle"
			self.contraband_crew.hold = {"bullpup", "rifle"}
			self.contraband_crew.reload = "rifle"
			self.contraband_crew.alert_size = 2500
			self.contraband_crew.suppression = 2.2
			self.contraband_crew.FIRE_MODE = "auto"
			self.contraband_m203_crew.sounds.prefix = "contrabandm203_npc"
			self.contraband_m203_crew.use_data.selection_index = 2
			self.contraband_m203_crew.DAMAGE = 2
			self.contraband_m203_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.contraband_m203_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.contraband_m203_crew.no_trail = true
			self.contraband_m203_crew.CLIP_AMMO_MAX = 1
			self.contraband_m203_crew.NR_CLIPS_MAX = 4
			self.contraband_m203_crew.auto.fire_rate = 0.1
			self.contraband_m203_crew.hold = "rifle"
			self.contraband_m203_crew.hold = {"bullpup", "rifle"}
			self.contraband_m203_crew.alert_size = 2500
			self.contraband_m203_crew.suppression = 1
			self.contraband_m203_crew.FIRE_MODE = "auto"
		end
	
		function WeaponTweakData:_init_data_groza_crew()
			self.groza_crew.categories = clone(self.groza.categories)
			self.groza_crew.sounds.prefix = "groza_npc"
			self.groza_crew.use_data.selection_index = 2
			self.groza_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.groza_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.groza_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.groza_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.groza_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.groza_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.groza_crew.NR_CLIPS_MAX = 5
			self.groza_crew.pull_magazine_during_reload = "rifle"
			self.groza_crew.hold = "rifle"
			self.groza_crew.reload = "bullpup"
			self.groza_crew.alert_size = 2500
			self.groza_crew.suppression = 2.2
			self.groza_crew.FIRE_MODE = "auto"
			self.groza_underbarrel_crew.sounds.prefix = "grozagl_npc"
			self.groza_underbarrel_crew.use_data.selection_index = 2
			self.groza_underbarrel_crew.DAMAGE = 2
			self.groza_underbarrel_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.groza_underbarrel_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.groza_underbarrel_crew.no_trail = true
			self.groza_underbarrel_crew.CLIP_AMMO_MAX = 1
			self.groza_underbarrel_crew.NR_CLIPS_MAX = 4
			self.groza_underbarrel_crew.auto.fire_rate = 0.1
			self.groza_underbarrel_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.groza_underbarrel_crew.alert_size = 2500
			self.groza_underbarrel_crew.suppression = 1
			self.groza_underbarrel_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_flint_crew()
			self.flint_crew.categories = clone(self.flint.categories)
			self.flint_crew.sounds.prefix = "flint_npc"
			self.flint_crew.use_data.selection_index = 2
			self.flint_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.flint_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.flint_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.flint_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.flint_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.flint_crew.NR_CLIPS_MAX = 5
			self.flint_crew.pull_magazine_during_reload = "rifle"
			self.flint_crew.hold = "rifle"
			self.flint_crew.alert_size = 2500
			self.flint_crew.suppression = 2.2
			self.flint_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_corgi_crew()
			self.corgi_crew.categories = clone(self.corgi.categories)
			self.corgi_crew.sounds.prefix = "corgi_npc"
			self.corgi_crew.use_data.selection_index = 2
			self.corgi_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.corgi_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.corgi_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.corgi_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.corgi_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.corgi_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.corgi_crew.NR_CLIPS_MAX = 5
			self.corgi_crew.pull_magazine_during_reload = "rifle"
			self.corgi_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.corgi_crew.alert_size = 2500
			self.corgi_crew.suppression = 2.2
			self.corgi_crew.FIRE_MODE = "auto"
		end		
		
		function WeaponTweakData:_init_data_komodo_crew()
			self.komodo_crew.categories = clone(self.komodo.categories)
			self.komodo_crew.sounds.prefix = "komodo_npc"
			self.komodo_crew.use_data.selection_index = 2
			self.komodo_crew.DAMAGE = crew_wep_preset.assault_rifle.damage
			self.komodo_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.komodo_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.komodo_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.komodo_crew.auto.fire_rate = crew_wep_preset.assault_rifle.fire_rate
			self.komodo_crew.CLIP_AMMO_MAX = crew_wep_preset.assault_rifle.mag_capacity
			self.komodo_crew.NR_CLIPS_MAX = 5
			self.komodo_crew.pull_magazine_during_reload = "rifle"
			self.komodo_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.komodo_crew.alert_size = 2500
			self.komodo_crew.suppression = 2.2
			self.komodo_crew.FIRE_MODE = "auto"
		end		
	
	--SHOTGUNS
		function WeaponTweakData:_init_data_ben_crew()
			self.ben_crew.categories = {"shotgun"}
			self.ben_crew.sounds.prefix = "benelli_m4_npc"
			self.ben_crew.use_data.selection_index = 2
			self.ben_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.ben_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.ben_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.ben_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.ben_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.ben_crew.NR_CLIPS_MAX = 4
			self.ben_crew.hold = "rifle"
			self.ben_crew.reload = "looped"
			self.ben_crew.looped_reload_speed = 0.8
			self.ben_crew.alert_size = 2500
			self.ben_crew.suppression = 3.4
			self.ben_crew.is_shotgun = true
			self.ben_crew.rays = 8
			self.ben_crew.FIRE_MODE = "auto"
			self.benelli_crew = deep_clone(self.ben_crew)
		end
		
		function WeaponTweakData:_init_data_spas12_crew()
			self.spas12_crew.categories = clone(self.spas12.categories)
			self.spas12_crew.sounds.prefix = "spas_npc"
			self.spas12_crew.use_data.selection_index = 2
			self.spas12_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.spas12_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.spas12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.spas12_crew.auto = {}
			self.spas12_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.spas12_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.spas12_crew.NR_CLIPS_MAX = 4
			self.spas12_crew.hold = "rifle"
			self.spas12_crew.alert_size = 2500
			self.spas12_crew.suppression = 3.4
			self.spas12_crew.rays = 8
			self.spas12_crew.is_shotgun = true
			self.spas12_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_ultima_crew()
			self.ultima_crew.categories = clone(self.ultima.categories)
			self.ultima_crew.sounds.prefix = "ultima_npc"
			self.ultima_crew.use_data.selection_index = 2
			self.ultima_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.ultima_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.ultima_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.ultima_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.ultima_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.ultima_crew.NR_CLIPS_MAX = 6
			self.ultima_crew.looped_reload_speed = 0.7
			self.ultima_crew.hold = "rifle"
			self.ultima_crew.alert_size = 2500
			self.ultima_crew.suppression = 3.4
			self.ultima_crew.FIRE_MODE = "auto"
			self.ultima_crew.is_shotgun = true
		end	
	
		function WeaponTweakData:_init_data_aa12_crew()
			self.aa12_crew.categories = clone(self.aa12.categories)
			self.aa12_crew.sounds.prefix = "aa12_npc"
			self.aa12_crew.use_data.selection_index = 2
			self.aa12_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.aa12_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.aa12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.aa12_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.aa12_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.aa12_crew.NR_CLIPS_MAX = 4
			self.aa12_crew.pull_magazine_during_reload = "large_plastic"
			self.aa12_crew.hold = "rifle"
			self.aa12_crew.alert_size = 2500
			self.aa12_crew.suppression = 3.4
			self.aa12_crew.is_shotgun = true
			self.aa12_crew.rays = 8
			self.aa12_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_sko12_crew()
			self.sko12_crew.categories = clone(self.sko12.categories)
			self.sko12_crew.sounds.prefix = "sko12_npc"
			self.sko12_crew.use_data.selection_index = 2
			self.sko12_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.sko12_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.sko12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.sko12_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.sko12_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.sko12_crew.NR_CLIPS_MAX = 4
			self.sko12_crew.pull_magazine_during_reload = "rifle"
			self.sko12_crew.hold = "rifle"
			self.sko12_crew.alert_size = 2500
			self.sko12_crew.suppression = 3.4
			self.sko12_crew.rays = 8
			self.sko12_crew.is_shotgun = true
			self.sko12_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_saiga_crew()
			self.saiga_crew.categories = clone(self.saiga.categories)
			self.saiga_crew.sounds.prefix = "saiga_npc"
			self.saiga_crew.use_data.selection_index = 2
			self.saiga_crew.DAMAGE = crew_wep_preset.shotgun_auto.damage
			self.saiga_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.saiga_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.saiga_crew.auto.fire_rate = crew_wep_preset.shotgun_auto.fire_rate
			self.saiga_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_auto.mag_capacity
			self.saiga_crew.NR_CLIPS_MAX = 10
			self.saiga_crew.pull_magazine_during_reload = "rifle"
			self.saiga_crew.hold = "rifle"
			self.saiga_crew.alert_size = 2500
			self.saiga_crew.suppression = 3.4
			self.saiga_crew.rays = 8
			self.saiga_crew.is_shotgun = true
			self.saiga_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_b682_crew()
			self.b682_crew.categories = clone(self.b682.categories)
			self.b682_crew.sounds.prefix = "b682_npc"
			self.b682_crew.use_data.selection_index = 2
			self.b682_crew.DAMAGE = crew_wep_preset.shotgun_pump.damage
			self.b682_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.b682_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
			self.b682_crew.auto.fire_rate = crew_wep_preset.shotgun_pump.fire_rate
			self.b682_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_pump.mag_capacity
			self.b682_crew.NR_CLIPS_MAX = 4
			self.b682_crew.looped_reload_speed = 0.2
			self.b682_crew.hold = "rifle"
			self.b682_crew.alert_size = 2500
			self.b682_crew.suppression = 3.4
			self.b682_crew.rays = 8
			self.b682_crew.is_shotgun = true
			self.b682_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_r870_crew()
			self.r870_crew.categories = clone(self.r870.categories)
			self.r870_crew.sounds.prefix = "remington_npc"
			self.r870_crew.use_data.selection_index = 2
			self.r870_crew.DAMAGE = crew_wep_preset.shotgun_pump.damage
			self.r870_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.r870_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
			self.r870_crew.auto = {}
			self.r870_crew.auto.fire_rate = crew_wep_preset.shotgun_pump.fire_rate
			self.r870_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_pump.mag_capacity
			self.r870_crew.NR_CLIPS_MAX = 4
			self.r870_crew.hold = "rifle"
			self.r870_crew.alert_size = 2500
			self.r870_crew.suppression = 3.4
			self.r870_crew.is_shotgun = true
			self.r870_crew.rays = 8
			self.r870_crew.FIRE_MODE = "single"		
		end
		
		function WeaponTweakData:_init_data_ksg_crew()
			self.ksg_crew.categories = clone(self.ksg.categories)
			self.ksg_crew.sounds.prefix = "keltec_npc"
			self.ksg_crew.use_data.selection_index = 2
			self.ksg_crew.DAMAGE = crew_wep_preset.shotgun_pump.damage
			self.ksg_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.ksg_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
			self.ksg_crew.auto.fire_rate = crew_wep_preset.shotgun_pump.fire_rate
			self.ksg_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_pump.mag_capacity
			self.ksg_crew.NR_CLIPS_MAX = 4
			self.ksg_crew.hold = "rifle"
			self.ksg_crew.alert_size = 2500
			self.ksg_crew.suppression = 3.4
			self.ksg_crew.is_shotgun = true
			self.ksg_crew.rays = 8
			self.ksg_crew.FIRE_MODE = "single"
		end

		function WeaponTweakData:_init_data_huntsman_crew()
			self.huntsman_crew.categories = clone(self.huntsman.categories)
			self.huntsman_crew.sounds.prefix = "huntsman_npc"
			self.huntsman_crew.use_data.selection_index = 2
			self.huntsman_crew.DAMAGE = crew_wep_preset.shotgun_pump.damage
			self.huntsman_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.huntsman_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
			self.huntsman_crew.auto = {}
			self.huntsman_crew.auto.fire_rate = crew_wep_preset.shotgun_pump.fire_rate
			self.huntsman_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_pump.mag_capacity
			self.huntsman_crew.NR_CLIPS_MAX = 4
			self.huntsman_crew.looped_reload_speed = 0.2
			self.huntsman_crew.hold = "rifle"
			self.huntsman_crew.alert_size = 2500
			self.huntsman_crew.suppression = 3.4
			self.huntsman_crew.is_shotgun = true
			self.huntsman_crew.rays = 8
			self.huntsman_crew.FIRE_MODE = "single"
		end
	
		function WeaponTweakData:_init_data_boot_crew()
			self.boot_crew.categories = clone(self.boot.categories)
			self.boot_crew.sounds.prefix = "boot_npc"
			self.boot_crew.use_data.selection_index = 2
			self.boot_crew.DAMAGE = crew_wep_preset.shotgun_pump.damage
			self.boot_crew.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.boot_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.boot_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.boot_crew.auto.fire_rate = crew_wep_preset.shotgun_pump.fire_rate
			self.boot_crew.CLIP_AMMO_MAX = crew_wep_preset.shotgun_pump.mag_capacity
			self.boot_crew.NR_CLIPS_MAX = 5
			self.boot_crew.hold = "rifle"
			self.boot_crew.alert_size = 2500
			self.boot_crew.suppression = 3.4
			self.boot_crew.is_shotgun = true
			self.boot_crew.rays = 8
			self.boot_crew.FIRE_MODE = "single"
		end

	--SNIPERS
		function WeaponTweakData:_init_data_m14_crew()
			self.m14_crew.categories = clone(self.new_m14.categories)
			self.m14_crew.sounds.prefix = "m14_npc"
			self.m14_crew.use_data.selection_index = 2
			self.m14_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.m14_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.m14_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.m14_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.m14_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.m14_crew.NR_CLIPS_MAX = 8
			self.m14_crew.pull_magazine_during_reload = "rifle"
			self.m14_crew.hold = "rifle"
			self.m14_crew.alert_size = 2500
			self.m14_crew.suppression = 3.4
			self.m14_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_g3_crew()
			self.g3_crew.categories = clone(self.g3.categories)
			self.g3_crew.sounds.prefix = "g3_npc"
			self.g3_crew.use_data.selection_index = 2
			self.g3_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.g3_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.g3_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.g3_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.g3_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.g3_crew.NR_CLIPS_MAX = 5
			self.g3_crew.pull_magazine_during_reload = "rifle"
			self.g3_crew.hold = "rifle"
			self.g3_crew.alert_size = 2500
			self.g3_crew.suppression = 3.4
			self.g3_crew.FIRE_MODE = "single"
		end

		function WeaponTweakData:_init_data_shak12_crew()
			self.shak12_crew.categories = clone(self.shak12.categories)
			self.shak12_crew.sounds.prefix = "shak12_npc"
			self.shak12_crew.use_data.selection_index = 2
			self.shak12_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.shak12_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.shak12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.shak12_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.shak12_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.shak12_crew.NR_CLIPS_MAX = 5
			self.shak12_crew.pull_magazine_during_reload = "rifle"
			self.shak12_crew.hold = {
				"bullpup",
				"rifle"
			}
			self.shak12_crew.alert_size = 2500
			self.shak12_crew.suppression = 2.2
			self.shak12_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_ching_crew()
			self.ching_crew.categories = clone(self.ching.categories)
			self.ching_crew.sounds.prefix = "ching_npc"
			self.ching_crew.use_data.selection_index = 2
			self.ching_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.ching_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
			self.ching_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.ching_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.ching_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.ching_crew.NR_CLIPS_MAX = 8
			self.ching_crew.pull_magazine_during_reload = "rifle"
			self.ching_crew.reload = "looped"
			self.ching_crew.looped_reload_speed = 1
			self.ching_crew.hold = "rifle"
			self.ching_crew.alert_size = 2500
			self.ching_crew.suppression = 3.4
			self.ching_crew.FIRE_MODE = "single"
		end		
		
		function WeaponTweakData:_init_data_tti_crew()
			self.tti_crew.categories = clone(self.tti.categories)
			self.tti_crew.sounds.prefix = "tti_npc"
			self.tti_crew.use_data.selection_index = 2
			self.tti_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.tti_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.tti_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.tti_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.tti_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.tti_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.tti_crew.NR_CLIPS_MAX = 5
			self.tti_crew.pull_magazine_during_reload = "rifle"
			self.tti_crew.hold = "rifle"
			self.tti_crew.alert_size = 2500
			self.tti_crew.suppression = 3.4
			self.tti_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_qbu88_crew()
			self.qbu88_crew.categories = clone(self.qbu88.categories)
			self.qbu88_crew.sounds.prefix = "qbu88_npc"
			self.qbu88_crew.use_data.selection_index = 2
			self.qbu88_crew.DAMAGE = crew_wep_preset.sniper_auto.damage
			self.qbu88_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.qbu88_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.qbu88_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.qbu88_crew.auto.fire_rate = crew_wep_preset.sniper_auto.fire_rate
			self.qbu88_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_auto.mag_capacity
			self.qbu88_crew.NR_CLIPS_MAX = 5
			self.qbu88_crew.pull_magazine_during_reload = "rifle"
			self.qbu88_crew.hold = "rifle"
			self.qbu88_crew.alert_size = 2500
			self.qbu88_crew.suppression = 3.4
			self.qbu88_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_wa2000_crew()
			self.wa2000_crew.categories = clone(self.wa2000.categories)
			self.wa2000_crew.sounds.prefix = "lakner_npc"
			self.wa2000_crew.use_data.selection_index = 2
			self.wa2000_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.wa2000_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.wa2000_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.wa2000_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.wa2000_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.wa2000_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.wa2000_crew.NR_CLIPS_MAX = 5
			self.wa2000_crew.pull_magazine_during_reload = "rifle"
			self.wa2000_crew.hold = {"bullpup", "rifle"}
			self.wa2000_crew.alert_size = 2500
			self.wa2000_crew.suppression = 3.4
			self.wa2000_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_siltstone_crew()
			self.siltstone_crew.categories = clone(self.siltstone.categories)
			self.siltstone_crew.sounds.prefix = "siltstone_npc"
			self.siltstone_crew.use_data.selection_index = 2
			self.siltstone_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.siltstone_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
			self.siltstone_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
			self.siltstone_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
			self.siltstone_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.siltstone_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.siltstone_crew.NR_CLIPS_MAX = 4
			self.siltstone_crew.hold = "rifle"
			self.siltstone_crew.alert_size = 2500
			self.siltstone_crew.suppression = 3.4
			self.siltstone_crew.FIRE_MODE = "single"
		end

		function WeaponTweakData:_init_data_model70_crew()
			self.model70_crew.categories = clone(self.model70.categories)
			self.model70_crew.sounds.prefix = "model70_npc"
			self.model70_crew.use_data.selection_index = 2
			self.model70_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.model70_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.model70_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.model70_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.model70_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.model70_crew.NR_CLIPS_MAX = 8
			self.model70_crew.hold = "rifle"
			self.model70_crew.alert_size = 2500
			self.model70_crew.suppression = 3.4
			self.model70.is_sniper = true
			self.model70_crew.FIRE_MODE = "single"
			self.model70_secondary_crew = deep_clone(self.model70_crew)
			self.model70_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_msr_crew()
			self.msr_crew.categories = clone(self.msr.categories)
			self.msr_crew.sounds.prefix = "msr_npc"
			self.msr_crew.use_data.selection_index = 2
			self.msr_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.msr_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.msr_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.msr_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.msr_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.msr_crew.NR_CLIPS_MAX = 5
			self.msr_crew.hold = "rifle"
			self.msr_crew.pull_magazine_during_reload = "rifle"
			self.msr_crew.alert_size = 2500
			self.msr_crew.suppression = 3.4
			self.msr_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_r93_crew()
			self.r93_crew.categories = clone(self.r93.categories)
			self.r93_crew.sounds.prefix = "blazer_npc"
			self.r93_crew.use_data.selection_index = 2
			self.r93_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.r93_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.r93_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.r93_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.r93_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.r93_crew.NR_CLIPS_MAX = 5
			self.r93_crew.pull_magazine_during_reload = "rifle"
			self.r93_crew.hold = "rifle"
			self.r93_crew.alert_size = 2500
			self.r93_crew.suppression = 3.4
			self.r93_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_m95_crew()
			self.m95_crew.categories = clone(self.m95.categories)
			self.m95_crew.sounds.prefix = "barrett_npc"
			self.m95_crew.use_data.selection_index = 2
			self.m95_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.m95_crew.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"
			self.m95_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
			self.m95_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.m95_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.m95_crew.NR_CLIPS_MAX = 5
			self.m95_crew.pull_magazine_during_reload = "rifle"
			self.m95_crew.hold = "rifle"
			self.m95_crew.reload = "bullpup"
			self.m95_crew.alert_size = 2500
			self.m95_crew.suppression = 3.4
			self.m95_crew.FIRE_MODE = "single"
		end
		
		function WeaponTweakData:_init_data_mosin_crew()
			self.mosin_crew.categories = clone(self.mosin.categories)
			self.mosin_crew.sounds.prefix = "nagant_npc"
			self.mosin_crew.use_data.selection_index = 2
			self.mosin_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.mosin_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.mosin_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.mosin_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.mosin_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.mosin_crew.NR_CLIPS_MAX = 8
			self.mosin_crew.hold = "rifle"
			self.mosin_crew.alert_size = 2500
			self.mosin_crew.suppression = 3.4
			self.mosin_crew.FIRE_MODE = "single"
			self.mosin_secondary_crew = deep_clone(self.mosin_crew)
			self.mosin_secondary_crew.use_data.selection_index = 1
		end
	
		function WeaponTweakData:_init_data_winchester1874_crew()
			self.winchester1874_crew.categories = clone(self.winchester1874.categories)
			self.winchester1874_crew.sounds.prefix = "m1873_npc"
			self.winchester1874_crew.use_data.selection_index = 2
			self.winchester1874_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.winchester1874_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.winchester1874_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.winchester1874_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.winchester1874_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.winchester1874_crew.NR_CLIPS_MAX = 8
			self.winchester1874_crew.looped_reload_speed = 0.7407407
			self.winchester1874_crew.hold = "rifle"
			self.winchester1874_crew.alert_size = 2500
			self.winchester1874_crew.suppression = 3.4
			self.winchester1874_crew.FIRE_MODE = "single"
			self.winchester1874_secondary_crew = deep_clone(self.winchester1874_crew)
			self.winchester1874_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_sbl_crew()
			self.sbl_crew.categories = clone(self.sbl.categories)
			self.sbl_crew.sounds.prefix = "sbl_npc"
			self.sbl_crew.use_data.selection_index = 2
			self.sbl_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.sbl_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.sbl_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.sbl_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.sbl_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.sbl_crew.NR_CLIPS_MAX = 8
			self.sbl_crew.looped_reload_speed = 0.7407407
			self.sbl_crew.hold = "rifle"
			self.sbl_crew.alert_size = 2500
			self.sbl_crew.suppression = 3.4
			self.sbl_crew.FIRE_MODE = "auto"
			self.sbl_secondary_crew = deep_clone(self.sbl_crew)
			self.sbl_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_desertfox_crew()
			self.desertfox_crew.categories = clone(self.desertfox.categories)
			self.desertfox_crew.sounds.prefix = "desertfox_npc"
			self.desertfox_crew.use_data.selection_index = 2
			self.desertfox_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.desertfox_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.desertfox_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
			self.desertfox_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.desertfox_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.desertfox_crew.NR_CLIPS_MAX = 8
			self.desertfox_crew.pull_magazine_during_reload = "rifle"
			self.desertfox_crew.hold = "rifle"
			self.desertfox_crew.reload = "bullpup"
			self.desertfox_crew.alert_size = 2500
			self.desertfox_crew.suppression = 3.4
			self.desertfox_crew.FIRE_MODE = "single"
			self.desertfox_secondary_crew = deep_clone(self.desertfox_crew)
			self.desertfox_secondary_crew.use_data.selection_index = 1
		end
		
		function WeaponTweakData:_init_data_r700_crew()
			self.r700_crew.categories = clone(self.r700.categories)
			self.r700_crew.sounds.prefix = "r700_npc"
			self.r700_crew.use_data.selection_index = 2
			self.r700_crew.DAMAGE = crew_wep_preset.sniper_bolt.damage
			self.r700_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.r700_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.r700_crew.auto.fire_rate = crew_wep_preset.sniper_bolt.fire_rate
			self.r700_crew.CLIP_AMMO_MAX = crew_wep_preset.sniper_bolt.mag_capacity
			self.r700_crew.NR_CLIPS_MAX = 2
			self.r700_crew.hold = "rifle"
			self.r700_crew.alert_size = 2500
			self.r700_crew.suppression = 3.4
			self.r700_crew.FIRE_MODE = "single"
		end

	
	--LMGS
		function WeaponTweakData:_init_data_tecci_crew()
			self.tecci_crew.categories = clone(self.tecci.categories)
			self.tecci_crew.sounds.prefix = "tecci_npc"
			self.tecci_crew.use_data.selection_index = 2
			self.tecci_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.tecci_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
			self.tecci_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.tecci_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.tecci_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.tecci_crew.NR_CLIPS_MAX = 5
			self.tecci_crew.pull_magazine_during_reload = "large_plastic"
			self.tecci_crew.hold = "rifle"
			self.tecci_crew.alert_size = 2500
			self.tecci_crew.suppression = 2.2
			self.tecci_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_par_crew()
			self.par_crew.categories = clone(self.par.categories)
			self.par_crew.sounds.prefix = "svinet_npc"
			self.par_crew.use_data.selection_index = 2
			self.par_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.par_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.par_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.par_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.par_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.par_crew.NR_CLIPS_MAX = 2
			self.par_crew.hold = "rifle"
			self.par_crew.alert_size = 2500
			self.par_crew.suppression = 2
			self.par_crew.FIRE_MODE = "auto"
			self.par_secondary_crew = deep_clone(self.par_crew)
			self.par_secondary_crew.use_data.selection_index = 1
			self.par_secondary_crew.armor_piercing = true
		end
		
		function WeaponTweakData:_init_data_rpk_crew()
			self.rpk_crew.categories = clone(self.rpk.categories)
			self.rpk_crew.sounds.prefix = "rpk_npc"
			self.rpk_crew.use_data.selection_index = 2
			self.rpk_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.rpk_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.rpk_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
			self.rpk_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.rpk_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.rpk_crew.NR_CLIPS_MAX = 5
			self.rpk_crew.hold = "rifle"
			self.rpk_crew.alert_size = 2500
			self.rpk_crew.suppression = 2
			self.rpk_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_m249_crew()
			self.m249_crew.categories = clone(self.m249.categories)
			self.m249_crew.sounds.prefix = "m249_npc"
			self.m249_crew.use_data.selection_index = 2
			self.m249_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.m249_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.m249_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.m249_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.m249_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.m249_crew.NR_CLIPS_MAX = 2
			self.m249_crew.hold = "rifle"
			self.m249_crew.alert_size = 2500
			self.m249_crew.suppression = 2
			self.m249_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_hk21_crew()
			self.hk21_crew.categories = clone(self.hk21.categories)
			self.hk21_crew.sounds.prefix = "hk23e_npc"
			self.hk21_crew.use_data.selection_index = 2
			self.hk21_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.hk21_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.hk21_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.hk21_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.hk21_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.hk21_crew.NR_CLIPS_MAX = 5
			self.hk21_crew.hold = "rifle"
			self.hk21_crew.alert_size = 2500
			self.hk21_crew.suppression = 2.4
			self.hk21_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_hk51b_crew()
			self.hk51b_crew.categories = clone(self.hk51b.categories)
			self.hk51b_crew.sounds.prefix = "hk51b_npc"
			self.hk51b_crew.use_data.selection_index = 2
			self.hk51b_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.hk51b_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.hk51b_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.hk51b_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.hk51b_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.hk51b_crew.NR_CLIPS_MAX = 5
			self.hk51b_crew.hold = "rifle"
			self.hk51b_crew.alert_size = 2500
			self.hk51b_crew.suppression = 2
			self.hk51b_crew.FIRE_MODE = "auto"
		end
		
		function WeaponTweakData:_init_data_mg42_crew()
			self.mg42_crew.categories = clone(self.mg42.categories)
			self.mg42_crew.sounds.prefix = "mg42_npc"
			self.mg42_crew.use_data.selection_index = 2
			self.mg42_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.mg42_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.mg42_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.mg42_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.mg42_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.mg42_crew.NR_CLIPS_MAX = 3
			self.mg42_crew.hold = "rifle"
			self.mg42_crew.alert_size = 2500
			self.mg42_crew.suppression = 2
			self.mg42_crew.FIRE_MODE = "auto"
			self.mg42_secondary_crew = deep_clone(self.mg42_crew)
			self.mg42_secondary_crew.use_data.selection_index = 1
			self.mg42_secondary_crew.armor_piercing = true
		end

		function WeaponTweakData:_init_data_m60_crew()
			self.m60_crew.categories = clone(self.m60.categories)
			self.m60_crew.sounds.prefix = "m60_npc"
			self.m60_crew.use_data.selection_index = 2
			self.m60_crew.DAMAGE = crew_wep_preset.lmg.damage
			self.m60_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
			self.m60_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
			self.m60_crew.auto.fire_rate = crew_wep_preset.lmg.fire_rate
			self.m60_crew.CLIP_AMMO_MAX = crew_wep_preset.lmg.mag_capacity
			self.m60_crew.NR_CLIPS_MAX = 3
			self.m60_crew.hold = "rifle"
			self.m60_crew.alert_size = 2500
			self.m60_crew.suppression = 2
			self.m60_crew.FIRE_MODE = "auto"
		end

				
	function WeaponTweakData:_init_data_x_basset_crew()
		self.x_basset_crew.categories = clone(self.x_basset.categories)
		self.x_basset_crew.sounds.prefix = "basset_x_npc"
		self.x_basset_crew.use_data.selection_index = 2
		self.x_basset_crew.DAMAGE = 1.25
		self.x_basset_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
		self.x_basset_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
		self.x_basset_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
		self.x_basset_crew.rays = 6
		self.x_basset_crew.CLIP_AMMO_MAX = 60
		self.x_basset_crew.NR_CLIPS_MAX = 5
		self.x_basset_crew.hold = "akimbo_pistol"
		self.x_basset_crew.alert_size = 1800
		self.x_basset_crew.suppression = 2
		self.x_basset_crew.FIRE_MODE = "auto"
	end

--Defines most weapon stats via loops for conciseness.
function WeaponTweakData:_init_stats()
	--Iteration causes floating point errors to pile up, which can result in weirdness in some menus.
	--This fixes that.
	local function clamp_near_zero(value)
		if math.abs(value) < 0.01 then
			return 0
		end
		return value
	end

	self.stats = {}
	self.stat_info = {} --Certain custom RM stuff falls under this for weaponlib compatibility.

	self.stats.alert_size = {
		0,
		2500
	}

	self.stats.suppression = {}
	for i = 4.2, 0.199, -0.2 do --Middle value slightly off to avoid floating point shenanigans.
		table.insert(self.stats.suppression, i)
	end

	self.stats.damage = {}
	for i = 0.1, 40.01, 0.1 do
		table.insert(self.stats.damage, i)
	end

	self.stats.zoom = {}
	for i = 1, 12.1, 0.1 do
		table.insert(self.stats.zoom, 65 / i)
	end

	--Stance multipliers for weapon spread.
	self.stat_info.stance_spread_mults = {
		moving_standing = 3.5,
		standing = 3.5,
		moving_crouching = 2.5,
		crouching = 2.5,
		moving_steelsight = 0.08,
		steelsight = 0.08,
		bipod = 1,
		player_turret = 1,
	}

	--Multiplier for spread on multi-raycast weapons. This compensates for linear spread scaling which would otherwise cripple their multikill potential.
	self.stat_info.shotgun_spread_increase = 3.5

	self.stat_info.base_spread = 10.1 --How much spread area you have at 0 accuracy.
	self.stat_info.spread_per_accuracy = -0.1 --How much each point of accuracy reduces spread area.
	self.stats.spread = {}
	for i = 0, 100, 1 do
		table.insert(self.stats.spread, self.stat_info.base_spread + (i * self.stat_info.spread_per_accuracy))
	end

	--Generate table for moving_spread
	--The values in the table correspond to the area of spread.
	--These are added to the area for accuracy while moving before determining the final angles.
	self.stat_info.base_move_spread = 4.04
	self.stat_info.spread_per_stability = -0.04
	self.stats.spread_moving = {}
	for i = 0, 100, 1 do
		table.insert(self.stats.spread_moving, self.stat_info.base_move_spread + (i * self.stat_info.spread_per_stability))
	end

	--Stance multipliers for weapon recoil.
	self.stat_info.stance_recoil_mults = {
		standing = 1,
		crouching = 0.925,
		steelsight = 0.85
	}
	self.stat_info.stance_recoil_mults_wolf_brigade = {
		standing = 0.75,
		crouching = 0.75,
		steelsight = 1
	}

	--Not in use AFAIK, keeping just in-case of anything still looking for info from here
	self.stat_info.damage_falloff = {
		base = 150,
		max = 3400,
		acc_bonus = 100,
		stab_bonus = 50,
		near_mul = 1,
		far_mul = 2,
		shotgun_penalty = 0.45
	}

	--Recoil multiplier. Used for stability.
	self.stats.recoil = {}
	for i = 0, 100, 1 do
		table.insert(self.stats.recoil, (10.2 + (i * -0.1)) * 0.75)
	end

	self.stats.value = {}
	for i = 1, 10.01, 1 do
		table.insert(self.stats.value, i)
	end

	self.stats.concealment = {
		0.3,
		0.4,
		0.5,
		0.6,
		0.65,
		0.7,
		0.75,
		0.8,
		0.825,
		0.85,
		1,
		1.05,
		1.1,
		1.15,
		1.2,
		1.225,
		1.25,
		1.275,
		1.3,
		1.325,
		1.35,
		1.375,
		1.4,
		1.425,
		1.45,
		1.475,
		1.5,
		1.525,
		1.55,
		1.6
	}

	--Weapon swap speed multiplier from concealment.
	--Calculated using fancier math than just y = mx+b to give linear returns to players.
	self.stats.mobility = {
		0.400,
		0.410,
		0.422,
		0.434,
		0.447,
		0.460,
		0.475,
		0.490,
		0.506,
		0.524, 
		0.542,
		0.562,
		0.584,
		0.607,
		0.632,
		0.660,
		0.690,
		0.722,
		0.758,
		0.798,
		0.842,
		0.891,
		0.947,
		1.009,
		1.081,
		1.164,
		1.260,
		1.373,
		1.509,
		1.675,
		1.882,
		2.148,
		2.500
	}
	
	self.stats.extra_ammo = {}
	for i = -100, 1500, 1 do
		table.insert(self.stats.extra_ammo, clamp_near_zero(i))
	end

	self.stats.total_ammo_mod = {}
		for i = -0.99, 1.155, 0.01 do
		table.insert(self.stats.total_ammo_mod, clamp_near_zero(i))
	end

	self.stats.reload = {}
	for i = 0.05, 2.01, 0.05 do
		table.insert(self.stats.reload, clamp_near_zero(i - 1) + 1)
	end

	--Different recoil tables.
	--With the exception of the none table, all of them average out to '0.85'
	--'Heavier' recoils tend to move your screen vertically more than lighter ones, and vice versa for horizontal.
	--This means that they feel meatier, but can also be more reliably controlled by a skilled player.
	--On the flip side, 'lighter' recoils will cancel themselves out more.
	self.stat_info.kick_tables = {
		--No recoil at all, used for bows and shit.
		none = {
			standing = {
				0,
				0,
				0,
				0
			},
			crouching = {
				0,
				0,
				0,
				0
			},
			steelsight = {
				0,
				0,
				0,
				0
			}
		},

		--Big, low damage bullet hoses will be around here.
		horizontal_recoil = {
			standing = {
				0.5 * self.stat_info.stance_recoil_mults.standing,
				0.4 * self.stat_info.stance_recoil_mults.standing,
				-0.55 * self.stat_info.stance_recoil_mults.standing,
				0.55 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.5 * self.stat_info.stance_recoil_mults.crouching,
				0.4 * self.stat_info.stance_recoil_mults.crouching,
				-0.55 * self.stat_info.stance_recoil_mults.crouching,
				0.55 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.5 * self.stat_info.stance_recoil_mults.steelsight,
				0.4 * self.stat_info.stance_recoil_mults.steelsight,
				-0.55 * self.stat_info.stance_recoil_mults.steelsight,
				0.55 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		horizontal_left_recoil = {
			standing = {
				0.5 * self.stat_info.stance_recoil_mults.standing,
				0.4 * self.stat_info.stance_recoil_mults.standing,
				-0.65 * self.stat_info.stance_recoil_mults.standing,
				0.45 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.5 * self.stat_info.stance_recoil_mults.crouching,
				0.4 * self.stat_info.stance_recoil_mults.crouching,
				-0.65 * self.stat_info.stance_recoil_mults.crouching,
				0.45 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.5 * self.stat_info.stance_recoil_mults.steelsight,
				0.4 * self.stat_info.stance_recoil_mults.steelsight,
				-0.65 * self.stat_info.stance_recoil_mults.steelsight,
				0.45 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		horizontal_right_recoil = {
			standing = {
				0.5 * self.stat_info.stance_recoil_mults.standing,
				0.4 * self.stat_info.stance_recoil_mults.standing,
				-0.45 * self.stat_info.stance_recoil_mults.standing,
				0.65 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.5 * self.stat_info.stance_recoil_mults.crouching,
				0.4 * self.stat_info.stance_recoil_mults.crouching,
				-0.45 * self.stat_info.stance_recoil_mults.crouching,
				0.65 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.5 * self.stat_info.stance_recoil_mults.steelsight,
				0.4 * self.stat_info.stance_recoil_mults.steelsight,
				-0.45 * self.stat_info.stance_recoil_mults.steelsight,
				0.65 * self.stat_info.stance_recoil_mults.steelsight
			}
		},


		--Your average SMG and Pistol will be around here.
		even_recoil = {
			standing = {
				0.55 * self.stat_info.stance_recoil_mults.standing,
				0.45 * self.stat_info.stance_recoil_mults.standing,
				-0.45 * self.stat_info.stance_recoil_mults.standing,
				0.45 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.55 * self.stat_info.stance_recoil_mults.crouching,
				0.4 * self.stat_info.stance_recoil_mults.crouching,
				-0.475 * self.stat_info.stance_recoil_mults.crouching,
				0.475 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.55 * self.stat_info.stance_recoil_mults.steelsight,
				0.45 * self.stat_info.stance_recoil_mults.steelsight,
				-0.45 * self.stat_info.stance_recoil_mults.steelsight,
				0.45 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		left_recoil = {
			standing = {
				0.55 * self.stat_info.stance_recoil_mults.standing,
				0.45 * self.stat_info.stance_recoil_mults.standing,
				-0.7  * self.stat_info.stance_recoil_mults.standing,
				0.3 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.55 * self.stat_info.stance_recoil_mults.crouching,
				0.45 * self.stat_info.stance_recoil_mults.crouching,
				-0.7  * self.stat_info.stance_recoil_mults.crouching,
				0.3 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.55 * self.stat_info.stance_recoil_mults.steelsight,
				0.45 * self.stat_info.stance_recoil_mults.steelsight,
				-0.7 * self.stat_info.stance_recoil_mults.steelsight,
				0.3 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		right_recoil = {
			standing = {
				0.55 * self.stat_info.stance_recoil_mults.standing,
				0.45 * self.stat_info.stance_recoil_mults.standing,
				-0.3 * self.stat_info.stance_recoil_mults.standing,
				0.7 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.55 * self.stat_info.stance_recoil_mults.crouching,
				0.45 * self.stat_info.stance_recoil_mults.crouching,
				-0.3 * self.stat_info.stance_recoil_mults.crouching,
				0.7 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.55 * self.stat_info.stance_recoil_mults.steelsight,
				0.45 * self.stat_info.stance_recoil_mults.steelsight,
				-0.3 * self.stat_info.stance_recoil_mults.steelsight,
				0.7 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		--Your average heavy pistol, light shotguns, or ARs will be around here.
		moderate_kick = {
			standing = {
				0.7 * self.stat_info.stance_recoil_mults.standing,
				0.55 * self.stat_info.stance_recoil_mults.standing,
				-0.375 * self.stat_info.stance_recoil_mults.standing,
				0.375 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				0.55 * self.stat_info.stance_recoil_mults.crouching,
				-0.375 * self.stat_info.stance_recoil_mults.crouching,
				0.375 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				0.55 * self.stat_info.stance_recoil_mults.steelsight,
				-0.375 * self.stat_info.stance_recoil_mults.steelsight,
				0.375 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		moderate_left_kick = {
			standing = {
				0.7 * self.stat_info.stance_recoil_mults.standing,
				0.5 * self.stat_info.stance_recoil_mults.standing,
				-0.6 * self.stat_info.stance_recoil_mults.standing,
				0.2 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				0.5 * self.stat_info.stance_recoil_mults.crouching,
				-0.6 * self.stat_info.stance_recoil_mults.crouching,
				0.2 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				0.5 * self.stat_info.stance_recoil_mults.steelsight,
				-0.6 * self.stat_info.stance_recoil_mults.steelsight,
				0.2 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		moderate_right_kick = {
			standing = {
				0.7 * self.stat_info.stance_recoil_mults.standing,
				0.5 * self.stat_info.stance_recoil_mults.standing,
				-0.2 * self.stat_info.stance_recoil_mults.standing,
				0.6 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				0.5 * self.stat_info.stance_recoil_mults.crouching,
				-0.2 * self.stat_info.stance_recoil_mults.crouching,
				0.6 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				0.5 * self.stat_info.stance_recoil_mults.steelsight,
				-0.2 * self.stat_info.stance_recoil_mults.steelsight,
				0.6 * self.stat_info.stance_recoil_mults.steelsight
			}
		},
		
		the_wolf_brigade = {
			standing = {
				0.7 * self.stat_info.stance_recoil_mults_wolf_brigade.standing,
				0.5 * self.stat_info.stance_recoil_mults_wolf_brigade.standing,
				-0.2 * self.stat_info.stance_recoil_mults_wolf_brigade.standing,
				0.6 * self.stat_info.stance_recoil_mults_wolf_brigade.standing
			},
			crouching = {
				0.7 * self.stat_info.stance_recoil_mults_wolf_brigade.crouching,
				0.5 * self.stat_info.stance_recoil_mults_wolf_brigade.crouching,
				-0.2 * self.stat_info.stance_recoil_mults_wolf_brigade.crouching,
				0.6 * self.stat_info.stance_recoil_mults_wolf_brigade.crouching
			},
			steelsight = {
				0.7 * self.stat_info.stance_recoil_mults_wolf_brigade.steelsight,
				0.5 * self.stat_info.stance_recoil_mults_wolf_brigade.steelsight,
				-0.2 * self.stat_info.stance_recoil_mults_wolf_brigade.steelsight,
				0.6 * self.stat_info.stance_recoil_mults_wolf_brigade.steelsight
			}
		},

		--DMRs, Sniper Rifles, and heavy shotguns will be around here.
		vertical_kick = {
			standing = {
				0.85 * self.stat_info.stance_recoil_mults.standing,
				0.7 * self.stat_info.stance_recoil_mults.standing,
				-0.225 * self.stat_info.stance_recoil_mults.standing,
				0.225 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.85 * self.stat_info.stance_recoil_mults.crouching,
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				-0.225 * self.stat_info.stance_recoil_mults.crouching,
				0.225 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.85 * self.stat_info.stance_recoil_mults.steelsight,
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				-0.225 * self.stat_info.stance_recoil_mults.steelsight,
				0.225 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		left_kick = {
			standing = {
				0.85 * self.stat_info.stance_recoil_mults.standing,
				0.7 * self.stat_info.stance_recoil_mults.standing,
				-0.4 * self.stat_info.stance_recoil_mults.standing,
				0.05 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.85 * self.stat_info.stance_recoil_mults.crouching,
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				-0.4 * self.stat_info.stance_recoil_mults.crouching,
				0.05 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.85 * self.stat_info.stance_recoil_mults.steelsight,
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				-0.4 * self.stat_info.stance_recoil_mults.steelsight,
				0.05 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		right_kick = {
			standing = {
				0.85 * self.stat_info.stance_recoil_mults.standing,
				0.7 * self.stat_info.stance_recoil_mults.standing,
				-0.05 * self.stat_info.stance_recoil_mults.standing,
				0.4 * self.stat_info.stance_recoil_mults.standing
			},
			crouching = {
				0.85 * self.stat_info.stance_recoil_mults.crouching,
				0.7 * self.stat_info.stance_recoil_mults.crouching,
				-0.05 * self.stat_info.stance_recoil_mults.crouching,
				0.4 * self.stat_info.stance_recoil_mults.crouching
			},
			steelsight = {
				0.85 * self.stat_info.stance_recoil_mults.steelsight,
				0.7 * self.stat_info.stance_recoil_mults.steelsight,
				-0.05 * self.stat_info.stance_recoil_mults.steelsight,
				0.4 * self.stat_info.stance_recoil_mults.steelsight
			}
		},

		kick_m2 = { --Why the recoil is multiplied by x10 in playerturret vs just making the kick values 0.2 instead of 0.02 I will never understand
			standing = {
				(0.85 * self.stat_info.stance_recoil_mults.standing) / 10,
				(0.7 * self.stat_info.stance_recoil_mults.standing) / 10,
				(-0.225 * self.stat_info.stance_recoil_mults.standing) / 10,
				(0.225 * self.stat_info.stance_recoil_mults.standing) / 10
			},
			crouching = {
				(0.85 * self.stat_info.stance_recoil_mults.crouching) / 10,
				(0.7 * self.stat_info.stance_recoil_mults.crouching) / 10,
				(-0.225 * self.stat_info.stance_recoil_mults.crouching) / 10,
				(0.225 * self.stat_info.stance_recoil_mults.crouching) / 10
			},
			steelsight = {
				(0.85 * self.stat_info.stance_recoil_mults.steelsight) / 10,
				(0.7 * self.stat_info.stance_recoil_mults.steelsight) / 10,
				(-0.225 * self.stat_info.stance_recoil_mults.steelsight) / 10,
				(0.225 * self.stat_info.stance_recoil_mults.steelsight) / 10
			}
		},

		metalstorm_kick = {
			standing = {
				0.85 * self.stat_info.stance_recoil_mults.standing * 6,
				0.7 * self.stat_info.stance_recoil_mults.standing * 6,
				-0.225 * self.stat_info.stance_recoil_mults.standing * 6,
				0.225 * self.stat_info.stance_recoil_mults.standing * 6
			},
			crouching = {
				0.85 * self.stat_info.stance_recoil_mults.crouching * 6,
				0.7 * self.stat_info.stance_recoil_mults.crouching * 6,
				-0.225 * self.stat_info.stance_recoil_mults.crouching * 6,
				0.225 * self.stat_info.stance_recoil_mults.crouching * 6
			},
			steelsight = {
				0.85 * self.stat_info.stance_recoil_mults.steelsight * 6,
				0.7 * self.stat_info.stance_recoil_mults.steelsight * 6,
				-0.225 * self.stat_info.stance_recoil_mults.steelsight * 6,
				0.225 * self.stat_info.stance_recoil_mults.steelsight * 6
			}
		}
	}

end

Hooks:PostHook( WeaponTweakData, "init", "SC_weapons", function(self)

	if self.osipr then
	else
		self["Resmod's custom assets aren't loading. Please check your install of Beardlib."]() --force a crash on boot if custom assets aren't loading. Better to have an early tell vs crashing on failed enemy unit spawns mid-game, right?
	end

	--self:_init_new_weapon_sync(weapon_data)
	--self:_init_new_weapon_sync_crew()
	local tact_rel = {'deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','new_m14','scar','fal','rpk','msr','r93','m95','famas','galil','g3','scorpion','benelli','serbu','r870','ksg','g26','spas12','l85a2','vhs','hs2000','tec9','asval','sub2000','polymer','wa2000','model70','sparrow','m37','sr2','pl14','tecci','hajk','boot','packrat','schakal','desertfox','tti','siltstone','flint','coal','lemming','breech','basset','shrew','corgi','shepheard','komodo','legacy','beer','czech','stech','r700','holt','maxim9','fmg9','china','scout','qbu88','m1897','sko12'}
	for i, wep_id in ipairs(tact_rel) do
		self[wep_id].tactical_reload = 1
		self[wep_id].has_description = false
	end
	local tact_akimbo_pistol = {'x_deagle','x_1911','x_b92fs','jowi','x_usp','x_g17','x_g22c','x_packrat','x_shrew','x_breech','x_g18c','x_hs2000','x_p226','x_pl14','x_ppk','x_sparrow','x_legacy','x_czech','x_stech','x_holt','x_maxim9','x_type54','x_sko12' }
	for i, wep_id in ipairs(tact_akimbo_pistol) do
		self[wep_id].tactical_reload = 2
		self[wep_id].BURST_FIRE = 2
		self[wep_id].BURST_FIRE_RATE_MULTIPLIER = 2
		self[wep_id].categories = {"akimbo", "pistol"}
	end

	local tact_akimbo_smg = {'x_sr2','x_mp5', 'x_coal', 'x_mp7', 'x_mp9', 'x_p90', 'x_polymer', 'x_schakal', 'x_scorpion', 'x_tec9','x_shepheard'}
	for i, wep_id in ipairs(tact_akimbo_smg) do
		self[wep_id].tactical_reload = 2
		self[wep_id].categories = {"akimbo", "smg"}
	end
	local tact_akimbo_rifle = {'x_akmsu', 'x_hajk', 'x_olympic'}
	for i, wep_id in ipairs(tact_akimbo_rifle) do
		self[wep_id].tactical_reload = 2
		self[wep_id].categories = {"akimbo", "assault_rifle"}
	end

	local lock_em_up = {'colt_1911','usp','p226','g22c','glock_17','glock_18c','x_g18c','b92fs','ppk','mac10','x_mac10','deagle','x_deagle','x_1911','x_b92fs','jowi','g26','c96','x_c96','sterling','m1928','hs2000','rpg7','cobray','x_usp','x_g17','x_g22c','sparrow','pl14','packrat','x_packrat','lemming','breech','erma','x_erma','shrew','x_shrew','stech','x_stech','czech','x_czech','maxim9','x_maxim9','holt','x_holt','m1911','beer','x_beer','type54','x_type54','legacy','x_legacy','coach','shepheard','x_shepheard','polymer','x_polymer','schakal','x_schakal','mp9','mp7','uzi'}
	for i, wep_id in ipairs(lock_em_up) do
		self[ wep_id ].lock_slide = true
		self[ wep_id ].sounds.magazine_empty = "wp_pistol_slide_lock"
	end
	self.sterling.lock_slide_alt = true
	self.m1911.lock_slide_alt = true
	self.rpg7.sounds.magazine_empty = nil

	lock_em_up = {'s552','new_m14','hajk','arbiter','ching','siltstone','new_m4','m16','amcar','tecci','tti','olympic','contraband','fal','scar','m249','par','m60','aa12','sko12','x_sko12'}
	for i, wep_id in ipairs(lock_em_up) do
		self[ wep_id ].lock_slide = true
		self[ wep_id ].sounds.magazine_empty = "wp_rifle_slide_lock"
	end
	self.aa12.open_bolt_offset = 5

	lock_em_up = {'hunter','frankish','arblast'}
	for i, wep_id in ipairs(lock_em_up) do
		self[ wep_id ].lock_slide = true
		self[ wep_id ].sounds.magazine_empty = nil
	end
	self.ching.lock_slide_alt = true
	self.ching.sounds.magazine_empty = "ching_magazine_empty"

	local akimbo_rev = {'x_rage','x_chinchilla','x_2006m','x_model3','x_judge',"x_korth"}
	for i, wep_id in ipairs(akimbo_rev) do
		self[wep_id].BURST_FIRE = 2
		self[wep_id].BURST_FIRE_RATE_MULTIPLIER = 2
		self[wep_id].sounds.magazine_empty = nil
	end

	local ap_50 = {
		'asval','scar','contraband','fal','galil'
	}
	for i, wep_id in ipairs(ap_50) do
		self[wep_id].armor_piercing_chance = 0.8
		self[wep_id].has_description = true
		self[wep_id].desc_id = "bm_ap_armor_50_weapon_sc_desc"
	end

	local ap_80 = {
		'g3','new_m14','ching','shak12'
	}
	for i, wep_id in ipairs(ap_80) do
		self[wep_id].armor_piercing_chance = 0.8
		self[wep_id].has_description = true
		self[wep_id].desc_id = "bm_ap_armor_80_weapon_sc_desc"
	end

	--Just fucking put this shit on everything
	for wep_id, i in pairs(self) do
		if self[ wep_id ].stats then
			self[ wep_id ].recategorize = { "unsupported" }
			self[ wep_id ].ads_speed = 0.169
			self[ wep_id ].damage_falloff = {
				start_dist = 690,
				end_dist = 6900,
				min_mult = 0.069,
			}
		end
	end
		
	local faction = {
		'p90','mp7','lemming','olympic','m16','amcar','new_m4','ak5','s552','g36','aug','famas','l85a2','vhs','tecci','hajk','komodo','new_m14','scar','fal','galil','g3','msr','tti','scout','m134','shuno','par','hk21','hk51b','m249','par','m60','corgi'
	}	
	for i, wep_id in ipairs(faction) do
		self[ wep_id ].nato = true
	end
	faction = {
		'sr2','x_sr2','akmsu','akm','akm_gold','ak74','rpk','asval','x_akmsu','flint','mosin','siltstone','shak12','rsh12','groza','coal','stech','x_stech','type54','x_type54','qbu88'
	}	
	for i, wep_id in ipairs(faction) do
		self[ wep_id ].warsaw = true
	end
		
	local recat = { "g26", "jowi", "holt", "x_holt", "glock_18c", "x_g18c", "czech", "x_czech", "stech", "x_stech", "fmg9", "b92fs", "x_b92fs", "beer", "x_beer", "maxim9", "x_maxim9", "glock_17", "x_g17", "g22c", "x_g22c", "packrat", "x_packrat", "breech", "x_breech", "ppk", "x_ppk", "lemming", "hs2000", "x_hs2000", "p226", "x_p226", "sparrow", "x_sparrow", "legacy", "x_legacy", "pl14", "x_pl14", "sub2000" }	
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_pis" }
		self[ wep_id ].damage_type = "pistol"
	end	
	
	recat = { "usp", "x_usp", "type54", "x_type54", "deagle", "x_deagle", "shrew", "x_shrew", "colt_1911", "x_1911", "model3", "x_model3", "rsh12", "new_raging_bull", "x_rage", "peacemaker", "mateba", "x_2006m", "chinchilla", "x_chinchilla", "m1911", "c96","korth","x_korth" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_pis" }
		self[ wep_id ].damage_type = "heavy_pistol"
	end
	
	recat = { "saiga", "aa12", "benelli", "ultima", "spas12", "striker", "rota", "x_rota", "basset", "x_basset", "sko12", "x_sko12" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_shot" }
		self[ wep_id ].damage_type = "shotgun"
		self[ wep_id ].damage_type_single_ray = "sniper"
	end
	
	recat = { "judge", "x_judge", "m1897", "m590", "r870", "ksg", "m37", "serbu" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_shot" }
		self[ wep_id ].damage_type = "shotgun_heavy"
		self[ wep_id ].damage_type_single_ray = "sniper"
	end
	
	recat = { "huntsman", "b682", "boot", "coach" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "break_shot" }
		self[ wep_id ].damage_type = "shotgun_heavy"
		self[ wep_id ].damage_type_single_ray = "sniper"
	end
	
	recat = { "tec9", "x_tec9", "shepheard", "x_shepheard", "vityaz", "x_vityaz", "coal", "x_coal", "pm9", "x_pm9", "baka", "x_baka", "new_mp5", "x_mp5", "sr2", "x_sr2", "mp7", "x_mp7", "mp9", "x_mp9", "scorpion", "x_scorpion", "p90", "cobray", "x_cobray","hailstorm" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_smg" }
		self[ wep_id ].damage_type = "machine_gun"
	end
	
	recat = { "uzi", "x_uzi", "schakal", "x_schakal", "polymer", "x_polymer", "m1928", "x_m1928", "mac10", "x_mac10", "m45", "x_m45", "erma", "x_erma", "sterling", "x_sterling" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_smg" }
		self[ wep_id ].damage_type = "machine_gun"
	end
	
	recat = { "amcar", "s552", "g36", "olympic" }
	for i, wep_id in ipairs(recat) do
		table.insert(self[ wep_id ].categories, "crb")
		self[ wep_id ].recategorize = { "light_ar" }
		self[ wep_id ].damage_type = "assault_rifle"
	end

	recat = { "new_m4", "ak5", "aug", "flint", "ak74", "corgi", "vhs", "famas", "komodo", "hajk" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_ar" }
		self[ wep_id ].damage_type = "assault_rifle"
	end
	
	recat = { "akmsu", "x_akmsu" }
	for i, wep_id in ipairs(recat) do
		table.insert(self[ wep_id ].categories, "crb")
		self[ wep_id ].recategorize = { "heavy_ar" }
		self[ wep_id ].damage_type = "assault_rifle"
	end
	recat = { "m16", "akm", "akm_gold", "groza", "l85a2"}
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_ar" }
		self[ wep_id ].damage_type = "assault_rifle"
	end
	
	recat = { "galil", "fal", "scar", "contraband", "asval" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "dmr_ar" }
		self[ wep_id ].damage_type = "sniper"
	end

	recat = { "ching", "g3", "new_m14", "shak12" }
	for i, wep_id in ipairs(recat) do
		table.insert(self[ wep_id ].categories, "dmr")
		self[ wep_id ].recategorize = { "dmr_ar" }
		self[ wep_id ].damage_type = "sniper"
	end
	
	recat = { "m249", "tecci", "rpk" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_mg" }
		self[ wep_id ].damage_type = "machine_gun"
		self[ wep_id ].sms = 0.8
		self[ wep_id ].weapon_movement_penalty = 0.8
	end
	
	recat = { "mg42", "m60", "hk21", "par", "hk51b", "ranc_heavy_machine_gun" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_mg" }
		self[ wep_id ].sms = 0.75
		self[ wep_id ].damage_type = "machine_gun"
		self[ wep_id ].weapon_movement_penalty = 0.75
	end
	self.ranc_heavy_machine_gun.damage_type = "anti_materiel"
	
	recat = { "shuno", "m134" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "miniguns" }
		self[ wep_id ].sms = 0.7
		self[ wep_id ].damage_type = "machine_gun"
		self[ wep_id ].weapon_movement_penalty = 0.7
	end
	
	recat = { "winchester1874", "qbu88", "msr", "r700", "tti", "scout" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "light_snp" }
		self[ wep_id ].damage_type = "sniper"
	end
	
	recat = { "siltstone", "r93", "desertfox", "sbl", "mosin", "model70", "wa2000" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].recategorize = { "heavy_snp" }
		self[ wep_id ].damage_type = "sniper"
	end
	
	recat = { "m95" }
	for i, wep_id in ipairs(recat) do
		table.insert(self[ wep_id ].categories, "amr")
		self[ wep_id ].recategorize = { "antim_snp" }
		self[ wep_id ].damage_type = "anti_materiel"
	end
	
	recat = { "mp7", "p90", "lemming" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].damage_type = "pdw"
	end

	recat = { "flamethrower_mk2", "system" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].damage_type = "flamethrower"
	end

	recat = { "p90", "aug", "arbiter", "komodo", "corgi", "vhs", "wa2000", "desertfox", "m95", "shak12", "l85a2", "groza", "groza_underbarrel", "ksg", "rota", "basset", "famas", "qbu88", "hailstorm" }
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].is_bullpup = true
	end

	recat = {
		"peacemaker","model3",
		"r870","ksg","boot","m37","m1897","m590",
		"winchester1874","mosin","m95","r93","msr","model70","r700","sbl","desertfox","scout",
		"flamethrower_mk2","system","china"
	}
	for i, wep_id in ipairs(recat) do
		self[ wep_id ].always_play_anims = true
	end
		
	--Weapon specific attachment category names
	self.new_raging_bull.override_mod_type_name = {
		["slide"] = "barrel",
		["upper_reciever"] = "cylinder"
	}
	self.x_rage.override_mod_type_name = {
		["slide"] = "barrel",
		["upper_reciever"] = "cylinder"
	}
	self.flamethrower_mk2.override_mod_type_name = {
		["magazine"] = "fuel"
	}
	self.system.override_mod_type_name = {
		["magazine"] = "fuel",
		["barrel"] = "nozzle"
	}
	self.c96.override_mod_type_name = {
		["slide"] = "barrel"
	}
	self.b92fs.override_mod_type_name = {
		["upper_reciever"] = "slide",
		["lower_reciever"] = "frame"
	}
	self.x_b92fs.override_mod_type_name = {
		["upper_reciever"] = "slide",
		["lower_reciever"] = "frame"
	}
	self.s552.override_mod_type_name = {
		["upper_reciever"] = "whole_receiver"
	}
	self.serbu.override_mod_type_name = {
		["upper_reciever"] = "whole_receiver",
	}
	self.r870.override_mod_type_name = {
		["upper_reciever"] = "whole_receiver",
		["foregrip"] = "pump",
	}
	self.ultima.override_mod_type_name = {
		["extra"] = "whole_receiver"
	}
	self.corgi.override_mod_type_name = {
		["lower_reciever"] = "stock"
	}
	self.peacemaker.override_mod_type_name = {
		["slide"] = "ro_barrel",
		["stock"] = "ro_stock",
		["bonus"] = "ro_modifier",
		["charm"] = "ro_charm",
		["grip"] = "ro_grip"
	}
	self.scar.override_mod_type_name = {
		["foregrip"] = "extra",
	}
	self.x_mac10.override_mod_type_name = {
		["lower_reciever"] = "whole_receiver",
	}
	self.mac10.override_mod_type_name = {
		["lower_reciever"] = "whole_receiver",
	}
	self.g36.override_mod_type_name = {
		["foregrip"] = "barrel",
	}
	self.elastic.override_mod_type_name = {
		["upper_reciever"] = "riser",
	}
	self.shuno.override_mod_type_name = {
		["upper_reciever"] = "barrel",
	}
	self.m134.override_mod_type_name = {
		["extra"] = "whole_receiver",
	}
	self.sparrow.override_mod_type_name = {
		["lower_reciever"] = "model"
	}
	self.g36.override_mod_type_name = {
		["foregrip"] = "forebarrelgrip"
	}
	self.galil.override_mod_type_name = {
		["barrel"] = "forebarrelgrip"
	}
	self.aug.override_mod_type_name = {
		["lower_reciever"] = "stock",
		["extra"] = "foregrip"
	}
	self.deagle.override_mod_type_name = {
		["slide"] = "barrel"
	}
	self.x_deagle.override_mod_type_name = {
		["slide"] = "barrel"
	}
	self.m590.override_mod_type_name = {
		["lower_reciever"] = "whole_receiver"
	}
	self.p90.override_mod_type_name = {
		["lower_reciever"] = "stock"
	}
	self.m1928.override_mod_type_name = {
		["foregrip"] = "vertical_grip"
	}

	self.c96.uses_clip = true
	self.mosin.uses_clip = true
	self.ching.uses_clip = true
	self.c96.clip_capacity = 10
	self.mosin.clip_capacity = 5
	self.ching.clip_capacity = 8
	self.x_c96.uses_clip = true
	self.x_c96.clip_capacity = 20
	--End of Tac reloading shit--
	self.trip_mines.damage = 40
	self.trip_mines.player_damage = 20
	self.trip_mines.damage_size = 200
	self.trip_mines.delay = 0.1
	
	--Hopefully now there's less bitching and moaning
	for i, weap in pairs(self) do
		if weap.stats and weap.stats.total_ammo_mod then
			weap.stats.total_ammo_mod = 100
		end
	end
	
	for i, weap in pairs(self) do
		if weap.stats and weap.stats.reload then
			weap.stats.reload = 20
		end
	end		
	
	for i, weap in pairs(self) do
		if weap.stats and weap.stats.extra_ammo then
			weap.stats.extra_ammo = 101
		end
	end
	
	--Test to just give everything sniper auto hit cause reasons
	for i, weap in pairs(self) do
		if weap.autohit then
			weap.autohit.INIT_RATIO = 0.05
			weap.autohit.MAX_RATIO = 0.4
			weap.autohit.far_angle = 0.2
			weap.autohit.far_dis = 5000
			weap.autohit.MIN_RATIO = 0.2
			weap.autohit.near_angle = 2				
		end
	end		
	
	--burst fire
	for i, weap in pairs(self) do
		if weap.CAN_TOGGLE_FIREMODE then
			weap.BURST_FIRE = false
		end
	end	

	--No more upgrade blocks!
	for i, weap in pairs(self) do
		if weap.upgrade_blocks then
			weap.upgrade_blocks = nil
		end
	end
	

	--[[     LIGHT PISTOLS     ]]

		--PRIMARIES

			--Akimbo Geck M2 (Maxim 9)
				self.x_maxim9.categories = {
					"akimbo",
					"pistol",
					"tranq"
				}
				self.x_maxim9.has_description = true
				self.x_maxim9.desc_id = "bm_tranq_x_maxim_sc_desc"	
				self.x_maxim9.fire_mode_data.fire_rate = 0.08571428571
				self.x_maxim9.single.fire_rate = 0.08571428571
				self.x_maxim9.CLIP_AMMO_MAX = 36
				self.x_maxim9.AMMO_MAX = 180
				self.x_maxim9.kick = self.stat_info.kick_tables.even_recoil
				self.x_maxim9.supported = true
				self.x_maxim9.ads_speed = 0.220
				self.x_maxim9.damage_falloff = {
					start_dist = 1900,
					end_dist = 4000,
					min_mult = 0.3333
				}
				self.x_maxim9.stats = {
					damage = 18,
					spread = 45,
					recoil = 83,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 20,
					alert_size = 1,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_maxim9.stats_modifiers = nil
				self.x_maxim9.panic_suppression_chance = 0.05	
				self.x_maxim9.timers.reload_exit_empty = 0.55
				self.x_maxim9.timers.reload_exit_not_empty = 0.65	

			--Akimbo Stryk18c
				--Keeping
				self.x_g18c.has_description = true
				self.x_g18c.desc_id = "bm_x_g18c_sc_desc"						
				self.x_g18c.fire_mode_data.fire_rate = 0.05454545454
				self.x_g18c.single.fire_rate = 0.05454545454
				self.x_g18c.CLIP_AMMO_MAX = 34
				self.x_g18c.AMMO_MAX = 180
				self.x_g18c.kick = self.stat_info.kick_tables.moderate_kick
				self.x_g18c.supported = true
				self.x_g18c.ads_speed = 0.200
				self.x_g18c.damage_falloff = {
					start_dist = 1500,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.x_g18c.stats = {
					damage = 20,
					spread = 42,
					recoil = 61,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_g18c.stats_modifiers = nil
				self.x_g18c.panic_suppression_chance = 0.05
				self.x_g18c.timers.reload_exit_empty = 0.55
				self.x_g18c.timers.reload_exit_not_empty = 0.65	

			--Akimbo CZ 75
				self.x_czech.has_description = true
				self.x_czech.desc_id = "bm_x_czech_sc_desc"						
				self.x_czech.CLIP_AMMO_MAX = 36
				self.x_czech.AMMO_MAX = 180
				self.x_czech.fire_mode_data.fire_rate = 0.06
				self.x_czech.kick = self.stat_info.kick_tables.even_recoil
				self.x_czech.supported = true
				self.x_czech.ads_speed = 0.200
				self.x_czech.damage_falloff = {
					start_dist = 1700,
					end_dist = 3300,
					min_mult = 0.3
				}
				self.x_czech.stats = {
					damage = 20,
					spread = 49,
					recoil = 71,
					spread_moving = 9,
					zoom = 1,
					concealment = 29,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_czech.stats_modifiers = nil
				self.x_czech.panic_suppression_chance = 0.05
				self.x_czech.timers.reload_exit_empty = 0.55
				self.x_czech.timers.reload_exit_not_empty = 0.65	

			--Akimbo Chimano Compact
				self.jowi.has_description = true
				self.jowi.desc_id = "bm_x_jowi_sc_desc"					
				self.jowi.kick = self.stat_info.kick_tables.even_recoil
				self.jowi.CLIP_AMMO_MAX = 20
				self.jowi.AMMO_MAX = 180
				self.jowi.fire_mode_data.fire_rate = 0.08571428571
				self.jowi.single = {}
				self.jowi.single.fire_rate = 0.08571428571
				self.jowi.supported = true
				self.jowi.ads_speed = 0.200
				self.jowi.damage_falloff = {
					start_dist = 1200,
					end_dist = 3000,
					min_mult = 0.25
				}
				self.jowi.stats = {
					damage = 24,
					spread = 42,
					recoil = 85,
					spread_moving = 9,
					zoom = 1,
					concealment = 32,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.jowi.stats_modifiers = nil
				self.jowi.panic_suppression_chance = 0.05
				self.jowi.timers.reload_exit_empty = 0.55
				self.jowi.timers.reload_exit_not_empty = 0.65	

			--Akimbo Igor (APS)
				self.x_stech.has_description = true
				self.x_stech.desc_id = "bm_x_stech_sc_desc"				
				self.x_stech.fire_mode_data.fire_rate = 0.08
				self.x_stech.AMMO_MAX = 150
				self.x_stech.kick = self.stat_info.kick_tables.moderate_kick
				self.x_stech.CLIP_AMMO_MAX = 40
				self.x_stech.supported = true
				self.x_stech.ads_speed = 0.200
				self.x_stech.damage_falloff = {
					start_dist = 1800,
					end_dist = 3800,
					min_mult = 0.2083
				}
				self.x_stech.stats = {
					damage = 24,
					spread = 50,
					recoil = 71,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_stech.stats_modifiers = nil
				self.x_stech.panic_suppression_chance = 0.05
				self.x_stech.timers.reload_exit_empty = 0.55
				self.x_stech.timers.reload_exit_not_empty = 0.65	

			--Akimbo Chimano .88
				self.x_g17.has_description = true
				self.x_g17.desc_id = "bm_x_g17_sc_desc"					
				self.x_g17.kick = self.stat_info.kick_tables.even_recoil
				self.x_g17.CLIP_AMMO_MAX = 34
				self.x_g17.AMMO_MAX = 150
				self.x_g17.FIRE_MODE = "single"
				self.x_g17.fire_mode_data.fire_rate = 0.08571428571
				self.x_g17.single.fire_rate = 0.08571428571
				self.x_g17.supported = true
				self.x_g17.ads_speed = 0.200
				self.x_g17.damage_falloff = {
					start_dist = 1500,
					end_dist = 3500,
					min_mult = 0.25
				}
				self.x_g17.stats = {
					damage = 24,
					spread = 49,
					recoil = 79,
					spread_moving = 9,
					zoom = 1,
					concealment = 31,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_g17.stats_modifiers = nil
				self.x_g17.panic_suppression_chance = 0.05
				self.x_g17.timers.reload_exit_empty = 0.55
				self.x_g17.timers.reload_exit_not_empty = 0.65

			--Akimbo Bernetti 9
				self.x_b92fs.has_description = true
				self.x_b92fs.desc_id = "bm_x_b92fs_sc_desc"						
				self.x_b92fs.kick = self.stat_info.kick_tables.even_recoil
				self.x_b92fs.CLIP_AMMO_MAX = 30
				self.x_b92fs.AMMO_MAX = 150
				self.x_b92fs.FIRE_MODE = "single"
				self.x_b92fs.fire_mode_data.fire_rate = 0.08571428571
				self.x_b92fs.single.fire_rate = 0.08571428571
				self.x_b92fs.supported = true
				self.x_b92fs.ads_speed = 0.200
				self.x_b92fs.damage_falloff = {
					start_dist = 1600,
					end_dist = 3700,
					min_mult = 0.25
				}
				self.x_b92fs.stats = {
					damage = 24,
					spread = 51,
					recoil = 77,
					spread_moving = 5,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_b92fs.stats_modifiers = nil
				self.x_b92fs.panic_suppression_chance = 0.05
				self.x_b92fs.timers.reload_exit_empty = 0.55
				self.x_b92fs.timers.reload_exit_not_empty = 0.65

			--Akimbo Holt 9mm
				self.x_holt.has_description = true
				self.x_holt.desc_id = "bm_x_holt_sc_desc"					
				self.x_holt.fire_mode_data.fire_rate = 0.08571428571
				self.x_holt.single.fire_rate = 0.08571428571
				self.x_holt.CLIP_AMMO_MAX = 20
				self.x_holt.AMMO_MAX = 150
				self.x_holt.kick = self.stat_info.kick_tables.even_recoil
				self.x_holt.supported = true
				self.x_holt.ads_speed = 0.200
				self.x_holt.damage_falloff = {
					start_dist = 1300,
					end_dist = 3300,
					min_mult = 0.25
				}
				self.x_holt.stats = {
					damage = 24,
					spread = 47,
					recoil = 83,
					spread_moving = 5,
					zoom = 1,
					concealment = 31,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_holt.stats_modifiers = nil
				self.x_holt.panic_suppression_chance = 0.05
				self.x_holt.timers.reload_exit_empty = 0.55
				self.x_holt.timers.reload_exit_not_empty = 0.65

			--Wasp-DS (FMG-9)
				self.fmg9.has_description = true
				self.fmg9.desc_id = "bm_fmg9_sc_desc"				
				self.fmg9.categories = {"pistol"}
				self.fmg9.fire_mode_data.fire_rate = 0.05454545454
				self.fmg9.auto.fire_rate = 0.05454545454
				self.fmg9.CLIP_AMMO_MAX = 33
				self.fmg9.AMMO_MAX = 150
				self.fmg9.use_data.selection_index = 2
				self.fmg9.kick = self.stat_info.kick_tables.left_recoil
				self.fmg9.supported = true
				self.fmg9.timers = {
					reload_not_empty = 1.9,
					reload_empty = 3.65,
					unequip = 1.7,
					equip = 1.4,
					reload_exit_empty = 0.65,
					reload_exit_not_empty = 0.8
				}	
				self.fmg9.ads_speed = 0.240
				self.fmg9.damage_falloff = {
					start_dist = 2200,
					end_dist = 4100,
					min_mult = 0.3
				}
				self.fmg9.stats = {
					damage = 24,
					spread = 59,
					recoil = 89,
					spread_moving = 9,
					zoom = 1,
					concealment = 28,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.fmg9.stats_modifiers = nil
				self.fmg9.panic_suppression_chance = 0.05	
				self.fmg9.swap_speed_multiplier = 0.6
			
			--Beretta Auto (93R)
				self.beer.has_description = true
				self.beer.desc_id = "bm_beer_sc_desc"				
				self.beer.use_data.selection_index = 2
				self.beer.BURST_FIRE = 3
				self.beer.BURST_FIRE_RATE_MULTIPLIER = nil
				self.beer.ADAPTIVE_BURST_SIZE = false		
				self.beer.CAN_TOGGLE_FIREMODE = false
				self.beer.FIRE_MODE = "single"	
				self.beer.AMMO_MAX = 150
				self.beer.CLIP_AMMO_MAX = 15
				self.beer.fire_mode_data.fire_rate = 0.05454545454
				self.beer.kick = self.stat_info.kick_tables.even_recoil
				self.beer.shake = {
					fire_multiplier = 0.65,
					fire_steelsight_multiplier = 0.65
				}
				self.beer.supported = true
				self.beer.ads_speed = 0.220
				self.beer.damage_falloff = {
					start_dist = 2600,
					end_dist = 4500,
					min_mult = 0.3
				}
				self.beer.stats = {
					damage = 24,
					spread = 64,
					recoil = 87,
					spread_moving = 5,
					zoom = 1,
					concealment = 28,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.beer.stats_modifiers = nil
				self.beer.panic_suppression_chance = 0.05
				self.beer.timers = {
					reload_not_empty = 1.47,
					reload_empty = 2.12,
					unequip = 0.5,
					equip = 0.5,
					reload_exit_empty = 0.9,
					reload_exit_not_empty = 0.65
				}

			--Akimbo Contractor Pistols
				self.x_packrat.has_description = true
				self.x_packrat.desc_id = "bm_x_packrat_sc_desc"				
				self.x_packrat.AMMO_MAX = 150
				self.x_packrat.CLIP_AMMO_MAX = 30
				self.x_packrat.fire_mode_data.fire_rate = 0.08571428571
				self.x_packrat.single.fire_rate = 0.08571428571
				self.x_packrat.kick = self.stat_info.kick_tables.even_recoil
				self.x_packrat.panic_suppression_chance = 0.05
				self.x_packrat.supported = true
				self.x_packrat.ads_speed = 0.200
				self.x_packrat.damage_falloff = {
					start_dist = 1800,
					end_dist = 4300,
					min_mult = 0.25
				}
				self.x_packrat.stats = {
					damage = 24,
					spread = 49,
					recoil = 73,
					spread_moving = 7,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_packrat.stats_modifiers = nil
				self.x_packrat.timers.reload_exit_empty = 0.55
				self.x_packrat.timers.reload_exit_not_empty = 0.65

			--Akimbo Chimano Custom
				self.x_g22c.has_description = true
				self.x_g22c.desc_id = "bm_x_g22c_sc_desc"					
				self.x_g22c.kick = self.stat_info.kick_tables.even_recoil
				self.x_g22c.CLIP_AMMO_MAX = 32
				self.x_g22c.AMMO_MAX = 120
				self.x_g22c.FIRE_MODE = "single"
				self.x_g22c.fire_mode_data = {}
				self.x_g22c.fire_mode_data.fire_rate = 0.08571428571
				self.x_g22c.single = {}
				self.x_g22c.single.fire_rate = 0.08571428571
				self.x_g22c.supported = true
				self.x_g22c.ads_speed = 0.220
				self.x_g22c.damage_falloff = {
					start_dist = 1300,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.x_g22c.stats = {
					damage = 30,
					spread = 42,
					recoil = 83,
					spread_moving = 10,
					zoom = 1,
					concealment = 28,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_g22c.stats_modifiers = nil
				self.x_g22c.panic_suppression_chance = 0.05
				self.x_g22c.timers.reload_exit_empty = 0.55
				self.x_g22c.timers.reload_exit_not_empty = 0.65


		--SECONDARIES

			--Gecko M2 (Maxim 9)
				self.maxim9.categories = {
					"pistol",
					"tranq"
				}
				self.maxim9.has_description = true
				self.maxim9.desc_id = "bm_tranq_maxim_sc_desc"	
				self.maxim9.fire_mode_data.fire_rate = 0.08571428571
				self.maxim9.single.fire_rate = 0.08571428571
				self.maxim9.CLIP_AMMO_MAX = 18
				self.maxim9.AMMO_MAX = 90
				self.maxim9.kick = self.stat_info.kick_tables.even_recoil
				self.maxim9.supported = true
				self.maxim9.ads_speed = 0.220
				self.maxim9.damage_falloff = {
					start_dist = 1900,
					end_dist = 4000,
					min_mult = 0.3333
				}
				self.maxim9.stats = {
					damage = 18,
					spread = 55,
					recoil = 93,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 20,
					alert_size = 1,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.maxim9.stats_modifiers = nil
				self.maxim9.panic_suppression_chance = 0.05	
				self.maxim9.timers.reload_exit_empty = 0.5
				self.maxim9.timers.reload_exit_not_empty = 0.65

			--5/7 AP (Five-seveN)
				self.lemming.has_description = true
				self.lemming.desc_id = "bm_lemming_sc_desc"			
				self.lemming.categories = {
					"pistol",
					"pdw"
				}
				self.lemming.CLIP_AMMO_MAX = 20
				self.lemming.AMMO_MAX = 90
				self.lemming.fire_mode_data.fire_rate = 0.08571428571
				self.lemming.single.fire_rate = 0.08571428571
				self.lemming.kick = self.stat_info.kick_tables.even_recoil
				self.lemming.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
				self.lemming.panic_suppression_chance = 0.05
				self.lemming.can_shoot_through_enemy = false
				self.lemming.can_shoot_through_shield = false
				self.lemming.can_shoot_through_wall = false
				self.lemming.armor_piercing_chance = 0.8
				self.lemming.hs_mult = 1.33333
				self.lemming.supported = true
				self.lemming.ads_speed = 0.220
				self.lemming.damage_falloff = {
					start_dist = 2500,
					end_dist = 4800,
					min_mult = 0.555555
				}
				self.lemming.stats = {
					damage = 18,
					spread = 66,
					recoil = 91,
					spread_moving = 9,
					zoom = 1,
					concealment = 27,
					suppression = 13,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.lemming.stats_modifiers = nil
				self.lemming.timers.reload_exit_empty = 0.55
				self.lemming.timers.reload_exit_not_empty = 0.45

			--Stryk 18c (Glock 18)
				self.glock_18c.desc_id = "bm_g18c_sc_desc"
				self.glock_18c.has_description = true
				self.glock_18c.fire_mode_data.fire_rate = 0.05454545454
				self.glock_18c.auto.fire_rate = 0.05454545454
				self.glock_18c.CLIP_AMMO_MAX = 17
				self.glock_18c.AMMO_MAX = 90
				self.glock_18c.kick = self.stat_info.kick_tables.left_recoil
				self.glock_18c.supported = true
				self.glock_18c.ads_speed = 0.200
				self.glock_18c.damage_falloff = {
					start_dist = 1500,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.glock_18c.stats = {
					damage = 20,
					spread = 52,
					recoil = 71,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.glock_18c.stats_modifiers = nil
				self.glock_18c.panic_suppression_chance = 0.05
				self.glock_18c.timers.reload_exit_empty = 0.5
				self.glock_18c.timers.reload_exit_not_empty = 0.65

			--CZ 75
				self.czech.has_description = true
				self.czech.desc_id = "bm_czech_sc_desc"				
				self.czech.CLIP_AMMO_MAX = 18
				self.czech.AMMO_MAX = 90
				self.czech.fire_mode_data.fire_rate = 0.06
				self.czech.kick = self.stat_info.kick_tables.even_recoil
				self.czech.shake = {
					fire_multiplier = 0.65,
					fire_steelsight_multiplier = 0.65
				}
				self.czech.supported = true
				self.czech.ads_speed = 0.200
				self.czech.damage_falloff = {
					start_dist = 1700,
					end_dist = 3300,
					min_mult = 0.3
				}
				self.czech.stats = {
					damage = 20,
					spread = 59,
					recoil = 81,
					spread_moving = 9,
					zoom = 1,
					concealment = 29,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.czech.stats_modifiers = nil
				self.czech.panic_suppression_chance = 0.05
				self.czech.timers = {
					reload_not_empty = 1.47,
					reload_empty = 2.12,
					unequip = 0.5,
					equip = 0.5,
					reload_exit_empty = 0.9,
					reload_exit_not_empty = 0.65
				}
	
			--Igor
				self.stech.has_description = true
				self.stech.desc_id = "bm_x_stech_sc_desc"						
				self.stech.fire_mode_data.fire_rate = 0.08
				self.stech.AMMO_MAX = 75
				self.stech.kick = self.stat_info.kick_tables.moderate_kick
				self.stech.CLIP_AMMO_MAX = 20
				self.stech.supported = true
				self.stech.ads_speed = 0.200
				self.stech.damage_falloff = {
					start_dist = 1800,
					end_dist = 3800,
					min_mult = 0.2083
				}
				self.stech.stats = {
					damage = 24,
					spread = 60,
					recoil = 81,
					spread_moving = 9,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.stech.stats_modifiers = nil
				self.stech.panic_suppression_chance = 0.05
				self.stech.timers.reload_exit_empty = 0.7
				self.stech.timers.reload_exit_not_empty = 0.6
			
			--Gruber Kurz (PPK)
				self.ppk.has_description = true
				self.ppk.desc_id = "bm_ppk_sc_desc"					
				self.ppk.AMMO_MAX = 75
				self.ppk.CLIP_AMMO_MAX = 7
				self.ppk.fire_mode_data.fire_rate = 0.08571428571
				self.ppk.single.fire_rate = 0.08571428571
				self.ppk.kick = self.stat_info.kick_tables.right_recoil
				self.ppk.supported = true
				self.ppk.ads_speed = 0.180
				self.ppk.damage_falloff = {
					start_dist = 1100,
					end_dist = 2900,
					min_mult = 0.2083
				}
				self.ppk.stats = {
					damage = 24,
					spread = 54,
					recoil = 95,
					spread_moving = 9,
					zoom = 1,
					concealment = 32,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ppk.stats_modifiers = nil
				self.ppk.panic_suppression_chance = 0.05
				self.ppk.reload_speed_multiplier = 1.35
				self.ppk.timers.reload_not_empty = 1.45
				self.ppk.timers.reload_exit_not_empty = 0.6
				self.ppk.timers.reload_empty = 2.2	
				self.ppk.timers.reload_exit_empty = 0.65
				self.ppk.weapon_movement_penalty = 1.025

			--Chimano Compact (Glock 26)
				self.g26.has_description = true
				self.g26.desc_id = "bm_jowi_sc_desc"				
				self.g26.CLIP_AMMO_MAX = 10
				self.g26.AMMO_MAX = 75
				self.g26.kick = self.stat_info.kick_tables.even_recoil
				self.g26.fire_mode_data.fire_rate = 0.08571428571
				self.g26.single.fire_rate = 0.08571428571
				self.g26.supported = true
				self.g26.ads_speed = 0.180
				self.g26.damage_falloff = {
					start_dist = 1200,
					end_dist = 3000,
					min_mult = 0.25
				}
				self.g26.stats = {
					damage = 24,
					spread = 52,
					recoil = 95,
					spread_moving = 9,
					zoom = 1,
					concealment = 32,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.g26.stats_modifiers = nil
				self.g26.panic_suppression_chance = 0.05
				self.g26.timers.reload_exit_empty = 0.5
				self.g26.timers.reload_exit_not_empty = 0.65

			--M13
				self.legacy.has_description = true
				self.legacy.desc_id = "bm_legacy_sc_desc"				
				self.legacy.fire_mode_data.fire_rate = 0.08571428571
				self.legacy.single.fire_rate = 0.08571428571
				self.legacy.CLIP_AMMO_MAX = 13
				self.legacy.AMMO_MAX = 75
				self.legacy.kick = self.stat_info.kick_tables.left_recoil
				self.legacy.supported = true
				self.legacy.ads_speed = 0.200
				self.legacy.damage_falloff = {
					start_dist = 1300,
					end_dist = 3300,
					min_mult = 0.25
				}
				self.legacy.stats = {
					damage = 24,
					spread = 54,
					recoil = 93,
					spread_moving = 9,
					zoom = 1,
					concealment = 31,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.legacy.stats_modifiers = nil
				self.legacy.timers = {
					reload_not_empty = 1.47,
					reload_empty = 2.12,
					unequip = 0.5,
					equip = 0.35
				}		
				self.legacy.panic_suppression_chance = 0.05
				self.legacy.timers.reload_exit_empty = 0.5
				self.legacy.timers.reload_exit_not_empty = 0.65

			--Holt 9mm (Hudson H9)
				self.holt.has_description = true
				self.holt.desc_id = "bm_holt_sc_desc"				
				self.holt.fire_mode_data.fire_rate = 0.08571428571
				self.holt.single.fire_rate = 0.08571428571
				self.holt.CLIP_AMMO_MAX = 15
				self.holt.AMMO_MAX = 75
				self.holt.kick = self.stat_info.kick_tables.even_recoil
				self.holt.supported = true
				self.holt.ads_speed = 0.200
				self.holt.damage_falloff = {
					start_dist = 1300,
					end_dist = 3300,
					min_mult = 0.25
				}
				self.holt.stats = {
					damage = 24,
					spread = 57,
					recoil = 93,
					spread_moving = 5,
					zoom = 1,
					concealment = 31,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.holt.stats_modifiers = nil
				self.holt.panic_suppression_chance = 0.05
				self.holt.timers.reload_exit_empty = 0.5
				self.holt.timers.reload_exit_not_empty = 0.65

			--Chimano 88 (Glock 17)
				self.glock_17.has_description = true
				self.glock_17.desc_id = "bm_g17_sc_desc"
				self.glock_17.fire_mode_data.fire_rate = 0.08571428571
				self.glock_17.single.fire_rate = 0.08571428571
				self.glock_17.AMMO_MAX = 75
				self.glock_17.CLIP_AMMO_MAX = 17
				self.glock_17.kick = self.stat_info.kick_tables.even_recoil
				self.glock_17.supported = true
				self.glock_17.ads_speed = 0.200
				self.glock_17.damage_falloff = {
					start_dist = 1500,
					end_dist = 3500,
					min_mult = 0.25
				}
				self.glock_17.stats = {
					damage = 24,
					spread = 59,
					recoil = 89,
					spread_moving = 9,
					zoom = 1,
					concealment = 31,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.glock_17.stats_modifiers = nil
				self.glock_17.panic_suppression_chance = 0.05
				self.glock_17.timers.reload_exit_empty = 0.5
				self.glock_17.timers.reload_exit_not_empty = 0.65

			--Bernetti 9 (M92FS)
				self.b92fs.has_description = true
				self.b92fs.desc_id = "bm_b92fs_sc_desc"			
				self.b92fs.CLIP_AMMO_MAX = 15
				self.b92fs.AMMO_MAX = 75
				self.b92fs.fire_mode_data.fire_rate = 0.08571428571
				self.b92fs.single.fire_rate = 0.08571428571
				self.b92fs.kick = self.stat_info.kick_tables.even_recoil
				self.b92fs.supported = true
				self.b92fs.ads_speed = 0.200
				self.b92fs.damage_falloff = {
					start_dist = 1600,
					end_dist = 3700,
					min_mult = 0.25
				}
				self.b92fs.stats = {
					damage = 24,
					spread = 61,
					recoil = 87,
					spread_moving = 5,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.b92fs.stats_modifiers = nil
				self.b92fs.panic_suppression_chance = 0.05
				self.b92fs.timers.reload_exit_empty = 0.5
				self.b92fs.timers.reload_exit_not_empty = 0.65

			--White Streak
				self.pl14.has_description = true
				self.pl14.desc_id = "bm_pl14_sc_desc"				
				self.pl14.fire_mode_data.fire_rate = 0.08571428571
				self.pl14.single.fire_rate = 0.08571428571
				self.pl14.CLIP_AMMO_MAX = 15
				self.pl14.AMMO_MAX = 75
				self.pl14.kick = self.stat_info.kick_tables.left_recoil
				self.pl14.supported = true
				self.pl14.ads_speed = 0.200
				self.pl14.damage_falloff = {
					start_dist = 1700,
					end_dist = 4000,
					min_mult = 0.25
				}
				self.pl14.stats = {
					damage = 24,
					spread = 54,
					recoil = 89,
					spread_moving = 5,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.pl14.stats_modifiers = nil
				self.pl14.panic_suppression_chance = 0.05
				self.pl14.timers.reload_exit_empty = 0.5
				self.pl14.timers.reload_exit_not_empty = 0.65
		
			--Contractor Pistol
				self.packrat.has_description = true
				self.packrat.desc_id = "bm_packrat_sc_desc"			
				self.packrat.AMMO_MAX = 75
				self.packrat.CLIP_AMMO_MAX = 15
				self.packrat.fire_mode_data.fire_rate = 0.08571428571
				self.packrat.single.fire_rate = 0.08571428571
				self.packrat.kick = self.stat_info.kick_tables.even_recoil
				self.packrat.panic_suppression_chance = 0.05
				self.packrat.supported = true
				self.packrat.ads_speed = 0.200
				self.packrat.damage_falloff = {
					start_dist = 1800,
					end_dist = 4300,
					min_mult = 0.25
				}
				self.packrat.stats = {
					damage = 24,
					spread = 59,
					recoil = 83,
					spread_moving = 7,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.packrat.stats_modifiers = nil
				self.packrat.reload_speed_multiplier = 1.1
				self.packrat.timers.reload_exit_empty = 0.5
				self.packrat.timers.reload_exit_not_empty = 0.65

			--Parabellum (Luger)
				self.breech.has_description = true
				self.breech.desc_id = "bm_breech_sc_desc"				
				self.breech.timers = {
					reload_not_empty = 1.55,
					reload_empty = 2.1,
					unequip = 0.5,
					equip = 0.35
				}	
				self.breech.AMMO_MAX = 75
				self.breech.CLIP_AMMO_MAX = 8
				self.breech.fire_mode_data.fire_rate = 0.08571428571
				self.breech.single.fire_rate = 0.08571428571
				self.breech.kick = self.stat_info.kick_tables.even_recoil
				self.breech.supported = true
				self.breech.ads_speed = 0.180
				self.breech.damage_falloff = {
					start_dist = 2000,
					end_dist = 4500,
					min_mult = 0.25
				}
				self.breech.stats = {
					damage = 24,
					spread = 61,
					recoil = 93,
					spread_moving = 9,
					zoom = 1,
					concealment = 32,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.breech.stats_modifiers = nil
				self.breech.panic_suppression_chance = 0.05
				self.breech.reload_speed_multiplier = 1.25
				self.breech.weapon_movement_penalty = 1.025
				self.breech.timers.reload_exit_empty = 0.35
				self.breech.timers.reload_not_empty = 1.2
				self.breech.timers.reload_not_empty = 1.2
				self.breech.timers.reload_exit_not_empty = 0.5

			--Chimano Custom (Glock 22)
				self.g22c.has_description = true
				self.g22c.desc_id = "bm_g22c_sc_desc"			
				self.g22c.timers = {
					reload_not_empty = 1.47,
					reload_empty = 2.12,
					unequip = 0.5,
					equip = 0.35
				}		
				self.g22c.fire_mode_data.fire_rate = 0.08571428571
				self.g22c.single.fire_rate = 0.08571428571
				self.g22c.AMMO_MAX = 60
				self.g22c.kick = self.stat_info.kick_tables.left_recoil
				self.g22c.CLIP_AMMO_MAX = 15
				self.g22c.supported = true
				self.g22c.ads_speed = 0.220
				self.g22c.damage_falloff = {
					start_dist = 1300,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.g22c.stats = {
					damage = 30,
					spread = 52,
					recoil = 93,
					spread_moving = 8,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.g22c.stats_modifiers = nil
				self.g22c.panic_suppression_chance = 0.05
				self.g22c.timers.reload_exit_empty = 0.5
				self.g22c.timers.reload_exit_not_empty = 0.65

			--Baby Deagle
				self.sparrow.has_description = true
				self.sparrow.desc_id = "bm_sparrow_sc_desc"				
				self.sparrow.CLIP_AMMO_MAX = 12
				self.sparrow.AMMO_MAX = 60
				self.sparrow.kick = {}
				self.sparrow.kick = self.stat_info.kick_tables.even_recoil
				self.sparrow.fire_mode_data.fire_rate = 0.08571428571
				self.sparrow.single.fire_rate = 0.08571428571
				self.sparrow.supported = true
				self.sparrow.ads_speed = 0.220
				self.sparrow.damage_falloff = {
					start_dist = 1600,
					end_dist = 3500,
					min_mult = 0.3
				}
				self.sparrow.stats = {
					damage = 30,
					spread = 54,
					recoil = 89,
					spread_moving = 8,
					zoom = 1,
					concealment = 29,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.sparrow.stats_modifiers = nil
				self.sparrow.panic_suppression_chance = 0.05
				self.sparrow.timers.reload_exit_empty = 0.7
				self.sparrow.timers.reload_exit_not_empty = 0.65

			--Signature .40 (P226)
				self.p226.has_description = true
				self.p226.desc_id = "bm_p226_sc_desc"					
				self.p226.AMMO_MAX = 60
				self.p226.CLIP_AMMO_MAX = 15
				self.p226.fire_mode_data.fire_rate = 0.08571428571
				self.p226.single.fire_rate = 0.08571428571
				self.p226.kick = self.stat_info.kick_tables.even_recoil
				self.p226.supported = true
				self.p226.ads_speed = 0.220
				self.p226.damage_falloff = {
					start_dist = 1800,
					end_dist = 3800,
					min_mult = 0.3
				}
				self.p226.stats = {
					damage = 30,
					spread = 59,
					recoil = 87,
					spread_moving = 80,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.p226.stats_modifiers = nil
				self.p226.panic_suppression_chance = 0.05
				self.p226.timers.reload_exit_empty = 0.5
				self.p226.timers.reload_exit_not_empty = 0.65
	
			--Leo (HS2000)
				self.hs2000.has_description = true
				self.hs2000.desc_id = "bm_hs2000_sc_desc"						
				self.hs2000.CLIP_AMMO_MAX = 16
				self.hs2000.AMMO_MAX = 60
				self.hs2000.tactical_reload = 1
				self.hs2000.FIRE_MODE = "single"
				self.hs2000.fire_mode_data = {}
				self.hs2000.fire_mode_data.fire_rate = 0.08571428571
				self.hs2000.single = {}
				self.hs2000.single.fire_rate = 0.08571428571
				self.hs2000.kick = self.stat_info.kick_tables.left_recoil
				self.hs2000.supported = true
				self.hs2000.ads_speed = 0.220
				self.hs2000.damage_falloff = {
					start_dist = 1900,
					end_dist = 4000,
					min_mult = 0.3
				}
				self.hs2000.stats = {
					damage = 30,
					spread = 60,
					recoil = 85,
					spread_moving = 8,
					zoom = 1,
					concealment = 27,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.hs2000.stats_modifiers = nil
				self.hs2000.panic_suppression_chance = 0.05
				self.hs2000.timers.reload_exit_empty = 0.5
				self.hs2000.timers.reload_exit_not_empty = 0.65

	--[[     HEAVY PISTOLS     ]]

		--PRIMARIES

			--Akimbo Crosskill Guard
				self.x_shrew.has_description = true
				self.x_shrew.desc_id = "bm_x_shrew_sc_desc"				
				self.x_shrew.fire_mode_data.fire_rate = 0.08571428571
				self.x_shrew.single.fire_rate = 0.08571428571
				self.x_shrew.CLIP_AMMO_MAX = 12
				self.x_shrew.AMMO_MAX = 80
				self.x_shrew.kick = self.stat_info.kick_tables.moderate_kick
				self.x_shrew.supported = true
				self.x_shrew.ads_speed = 0.180
				self.x_shrew.damage_falloff = {
					start_dist = 1100,
					end_dist = 3000,
					min_mult = 0.2
				}
				self.x_shrew.stats = {
					damage = 45,
					spread = 42,
					recoil = 79,
					spread_moving = 5,
					zoom = 1,
					concealment = 29,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_shrew.stats_modifiers = nil
				self.x_shrew.panic_suppression_chance = 0.05
				self.x_shrew.reload_speed_multiplier = 1.1
				self.x_shrew.timers.reload_exit_empty = 0.55
				self.x_shrew.timers.reload_exit_not_empty = 0.65

			--Akimbo Interceptor .45
				self.x_usp.has_description = true
				self.x_usp.desc_id = "bm_x_usp_sc_desc"					
				self.x_usp.kick = self.stat_info.kick_tables.right_recoil
				self.x_usp.CLIP_AMMO_MAX = 24
				self.x_usp.AMMO_MAX = 80
				self.x_usp.fire_mode_data.fire_rate = 0.08571428571
				self.x_usp.single = {}
				self.x_usp.single.fire_rate = 0.08571428571
				self.x_usp.supported = true
				self.x_usp.ads_speed = 0.260
				self.x_usp.damage_falloff = {
					start_dist = 1600,
					end_dist = 3600,
					min_mult = 0.2
				}
				self.x_usp.stats = {
					damage = 45,
					spread = 51,
					recoil = 73,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_usp.stats_modifiers = nil
				self.x_usp.panic_suppression_chance = 0.05
				self.x_usp.timers.reload_exit_empty = 0.55
				self.x_usp.timers.reload_exit_not_empty = 0.65

			--Akimbo Crosskill
				self.x_1911.has_description = true
				self.x_1911.desc_id = "bm_x_1911_sc_desc"					
				self.x_1911.CLIP_AMMO_MAX = 16
				self.x_1911.AMMO_MAX = 80
				self.x_1911.fire_mode_data.fire_rate = 0.08571428571
				self.x_1911.single = {}
				self.x_1911.single.fire_rate = 0.08571428571
				self.x_1911.kick = self.stat_info.kick_tables.even_recoil
				self.x_1911.supported = true
				self.x_1911.ads_speed = 0.220
				self.x_1911.damage_falloff = {
					start_dist = 1400,
					end_dist = 3400,
					min_mult = 0.2
				}
				self.x_1911.stats = {
					damage = 45,
					spread = 45,
					recoil = 77,
					spread_moving = 5,
					zoom = 1,
					concealment = 27,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_1911.stats_modifiers = nil
				self.x_1911.panic_suppression_chance = 0.05
				self.x_1911.reload_speed_multiplier = 1.05
				self.x_1911.timers.reload_exit_empty = 0.55
				self.x_1911.timers.reload_exit_not_empty = 0.65

			--Akimbo Model 54--		
				self.x_type54.has_description = true
				self.x_type54.desc_id = "bm_x_type54_sc_desc"			
				self.x_type54.CLIP_AMMO_MAX = 18
				self.x_type54.AMMO_MAX = 80
				self.x_type54.FIRE_MODE = "single"
				self.x_type54.fire_mode_data = {}
				self.x_type54.fire_mode_data.fire_rate = 0.08571428571
				self.x_type54.single = {}
				self.x_type54.single.fire_rate = 0.08571428571
				self.x_type54.kick = self.stat_info.kick_tables.left_recoil
				self.x_type54.supported = true
				self.x_type54.ads_speed = 0.220
				self.x_type54.damage_falloff = {
					start_dist = 1800,
					end_dist = 4000,
					min_mult = 0.2222
				}
				self.x_type54.stats = {
					damage = 45,
					spread = 56,
					recoil = 79,
					spread_moving = 7,
					zoom = 1,
					concealment = 28,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.x_type54.stats_modifiers = nil
				self.x_type54.panic_suppression_chance = 0.05
				self.x_type54.timers.reload_exit_empty = 0.55
				self.x_type54.timers.reload_exit_not_empty = 0.65		
			--Akimbo Model 54 Underbarrel
				self.x_type54_underbarrel.rays = 8
				self.x_type54_underbarrel.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.x_type54_underbarrel.AMMO_MAX = 30
				self.x_type54_underbarrel.BURST_FIRE = 2
				self.x_type54_underbarrel.tactical_reload = nil
				self.x_type54_underbarrel.CLIP_AMMO_MAX = 2
				self.x_type54_underbarrel.fire_mode_data = {}
				self.x_type54_underbarrel.fire_mode_data.fire_rate = 0.24
				self.x_type54_underbarrel.kick = self.stat_info.kick_tables.vertical_kick
				self.x_type54_underbarrel.supported = true
				self.x_type54_underbarrel.ads_speed = 0.220
				self.x_type54_underbarrel.damage_falloff = {
					start_dist = 800,
					end_dist = 2500,
					min_mult = 0.25
				}
				self.x_type54_underbarrel.stats = {
					damage = 90,
					spread = 46,
					recoil = 69,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_type54_underbarrel.stats_modifiers = nil
				self.x_type54_underbarrel.panic_suppression_chance = 0.05	
				self.x_type54_underbarrel.ignore_crit_damage = false
				self.x_type54_underbarrel.ignore_damage_multipliers = false
				self.x_type54_underbarrel.ignore_damage_upgrades = false	
				self.x_type54_underbarrel.timers.reload_exit_empty = 0.55
				self.x_type54_underbarrel.timers.reload_exit_not_empty = 0.65

			--Disable Akimbo Crosskill Chunky
				self.x_m1911.use_data.selection_index = 5

			--Broomstick (C96)
				--Moved to primary
				self.c96.use_data.selection_index = 2	
				self.c96.sounds.fire = "c96_fire"
				self.c96.sounds.fire_single = "c96_fire"
				self.c96.sounds.dryfire = "secondary_dryfire"
				self.c96.sounds.enter_steelsight = "pistol_steel_sight_enter"
				self.c96.sounds.leave_steelsight = "pistol_steel_sight_exit"
				self.c96.sounds.magazine_empty = "wp_pistol_slide_lock"		
				self.c96.has_description = true
				self.c96.desc_id = "bm_c96_sc_desc"
				self.c96.AMMO_MAX = 80
				self.c96.FIRE_MODE = "auto"
				self.c96.BURST_FIRE = false
				self.c96.CAN_TOGGLE_FIREMODE = true
				self.c96.fire_mode_data.fire_rate = 0.06
				self.c96.single.fire_rate = 0.06
				self.c96.kick = self.stat_info.kick_tables.even_recoil
				self.c96.supported = true
				self.c96.ads_speed = 0.280
				self.c96.damage_falloff = {
					start_dist = 2400,
					end_dist = 5000,
					min_mult = 0.2222
				}
				self.c96.stats = {
					damage = 45,
					spread = 67,
					recoil = 71,
					spread_moving = 8,
					zoom = 1,
					concealment = 27,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.c96.stats_modifiers = nil
				self.c96.timers.reload_not_empty = 3.7
				self.c96.timers.reload_exit_empty = 0.6
				self.c96.timers.reload_not_empty = 2.7
				self.c96.timers.reload_exit_not_empty = 1.9
				self.c96.panic_suppression_chance = 0.05
				self.c96.reload_speed_multiplier = 1.5

			--Cavity 9mm
				self.sub2000.has_description = true
				self.sub2000.desc_id = "bm_sub2000_sc_desc"			
				self.sub2000.categories = {"pistol"}
				self.sub2000.CLIP_AMMO_MAX = 22
				self.sub2000.AMMO_MAX = 80
				self.sub2000.sounds.fire = "sub2k_fire"
				self.sub2000.sounds.fire_single = "sub2k_fire"
				self.sub2000.sounds.dryfire = "primary_dryfire"
				self.sub2000.sounds.enter_steelsight = "secondary_steel_sight_enter"
				self.sub2000.sounds.leave_steelsight = "secondary_steel_sight_exit"
				self.sub2000.fire_mode_data.fire_rate = 0.07142857142
				self.sub2000.CAN_TOGGLE_FIREMODE = false
				self.sub2000.FIRE_MODE = "single"
				self.sub2000.single = {}
				self.sub2000.single.fire_rate = 0.07142857142
				self.sub2000.kick = {}
				self.sub2000.kick = self.stat_info.kick_tables.horizontal_recoil
				self.sub2000.supported = true
				self.sub2000.ads_speed = 0.280
				self.sub2000.damage_falloff = {
					start_dist = 2400,
					end_dist = 4500,
					min_mult = 0.2
				}
				self.sub2000.stats = {
					damage = 45,
					spread = 72,
					recoil = 91,
					spread_moving = 5,
					zoom = 1,
					concealment = 29,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.sub2000.panic_suppression_chance = 0.05
				self.sub2000.stats_modifiers = nil
				self.sub2000.swap_speed_multiplier = 0.5
				self.sub2000.timers.reload_exit_empty = 0.85
				self.sub2000.timers.reload_exit_not_empty = 0.95

			--Akimbo Deagle
				self.x_deagle.has_description = true
				self.x_deagle.desc_id = "bm_x_deagle_sc_desc"					
				self.x_deagle.use_data.selection_index = 2
				self.x_deagle.CLIP_AMMO_MAX = 14
				self.x_deagle.AMMO_MAX = 60
				self.x_deagle.FIRE_MODE = "single"
				self.x_deagle.fire_mode_data = {}
				self.x_deagle.fire_mode_data.fire_rate = 0.133333
				self.x_deagle.kick = self.stat_info.kick_tables.moderate_right_kick
				self.x_deagle.animations.has_steelsight_stance = true
				self.x_deagle.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
				self.x_deagle.supported = true
				self.x_deagle.ads_speed = 0.360
				self.x_deagle.damage_falloff = {
					start_dist = 1400,
					end_dist = 4200,
					min_mult = 0.4
				}
				self.x_deagle.stats = {
					damage = 60,
					spread = 51,
					recoil = 21,
					spread_moving = 5,
					zoom = 1,
					concealment = 23,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_deagle.stats_modifiers = nil
				self.x_deagle.armor_piercing_chance = 0.5
				self.x_deagle.can_shoot_through_enemy = true
				self.x_deagle.panic_suppression_chance = 0.05
				self.x_deagle.timers.reload_exit_empty = 0.55
				self.x_deagle.timers.reload_exit_not_empty = 0.65

			--Kahn .357				
				self.x_korth.has_description = true
				self.x_korth.desc_id = "bm_ap_armor_50_weapon_sc_desc"	
				self.x_korth.fire_mode_data.fire_rate = 0.15789474
				self.x_korth.CLIP_AMMO_MAX = 16
				self.x_korth.AMMO_MAX = 60
				self.x_korth.kick = self.stat_info.kick_tables.moderate_right_kick
				self.x_korth.supported = true
				self.x_korth.ads_speed = 0.300
				self.x_korth.damage_falloff = {
					start_dist = 1100,
					end_dist = 4000,
					min_mult = 0.3333
				}
				self.x_korth.stats = {
					damage = 60,
					spread = 63,
					recoil = 47,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_korth.stats_modifiers = nil
				self.x_korth.armor_piercing_chance = 0.5
				self.x_korth.can_shoot_through_enemy = true
				self.x_korth.panic_suppression_chance = 0.05
				self.x_korth.timers.reload_empty = 3.1
				self.x_korth.timers.reload_not_empty = 3.1
				self.x_korth.timers.reload_exit_empty = 1.3
				self.x_korth.timers.reload_exit_not_empty = 1.3
			
			--Akimbo Matever
				--Keeping
				self.x_2006m.has_description = true
				self.x_2006m.desc_id = "bm_x_2006m_sc_desc"
				self.x_2006m.fire_mode_data.fire_rate = 0.15789473684
				self.x_2006m.AMMO_MAX = 60
				self.x_2006m.kick = self.stat_info.kick_tables.vertical_kick
				self.x_2006m.supported = true
				self.x_2006m.ads_speed = 0.260
				self.x_2006m.damage_falloff = {
					start_dist = 1200,
					end_dist = 4200,
					min_mult = 0.3333
				}
				self.x_2006m.stats = {
					damage = 60,
					spread = 61,
					recoil = 41,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_2006m.stats_modifiers = nil
				self.x_2006m.armor_piercing_chance = 0.5
				self.x_2006m.can_shoot_through_enemy = true
				self.x_2006m.panic_suppression_chance = 0.05
				self.x_2006m.reload_speed_multiplier = 0.9
				self.x_2006m.weapon_hold = "jowi_pistol"
				self.x_2006m.animations.reload_name_id = "x_judge"
				self.x_2006m.animations.second_gun_versions = self.x_2006m.animations.second_gun_versions or {}
				self.x_2006m.animations.second_gun_versions.reload = "reload"
				self.x_2006m.timers.reload_empty = 3.1
				self.x_2006m.timers.reload_not_empty = 3.1
				self.x_2006m.timers.reload_exit_empty = 1.3
				self.x_2006m.timers.reload_exit_not_empty = 1.3

			--Akimbo Model 87
				self.x_model3.has_description = true
				self.x_model3.desc_id = "bm_x_model3_sc_desc"			
				self.x_model3.fire_mode_data.fire_rate = 0.15789473684
				self.x_model3.AMMO_MAX = 60
				self.x_model3.kick = self.stat_info.kick_tables.moderate_kick
				self.x_model3.supported = true
				self.x_model3.ads_speed = 0.280
				self.x_model3.damage_falloff = {
					start_dist = 1000,
					end_dist = 3800,
					min_mult = 0.3333
				}
				self.x_model3.stats = {
					damage = 60,
					spread = 63,
					recoil = 39,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_model3.stats_modifiers = nil
				self.x_model3.armor_piercing_chance = 0.5
				self.x_model3.can_shoot_through_enemy = true
				self.x_model3.weapon_hold = "jowi_pistol"
				self.x_model3.animations.reload_name_id = "x_judge"
				self.x_model3.animations.second_gun_versions = self.x_model3.animations.second_gun_versions or {}
				self.x_model3.animations.second_gun_versions.reload = "reload"
				self.x_model3.timers.reload_empty = 3.1
				self.x_model3.timers.reload_not_empty = 3.1
				self.x_model3.timers.reload_exit_empty = 1.3
				self.x_model3.timers.reload_exit_not_empty = 1.3		

			--Akimbo Broncos
				--Keeping
				self.x_rage.has_description = true
				self.x_rage.desc_id = "bm_x_rage_sc_desc"					
				self.x_rage.fire_mode_data.fire_rate = 0.19047619047
				self.x_rage.AMMO_MAX = 60
				self.x_rage.kick = self.stat_info.kick_tables.vertical_kick
				self.x_rage.supported = true
				self.x_rage.ads_speed = 0.300
				self.x_rage.damage_falloff = {
					start_dist = 1500,
					end_dist = 4400,
					min_mult = 0.4
				}
				self.x_rage.stats = {
					damage = 60,
					spread = 64,
					recoil = 35,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_rage.stats_modifiers = nil
				self.x_rage.armor_piercing_chance = 0.5
				self.x_rage.can_shoot_through_enemy = true
				self.x_rage.panic_suppression_chance = 0.05
				self.x_rage.reload_speed_multiplier = 0.9
				self.x_rage.weapon_hold = "jowi_pistol"
				self.x_rage.animations.reload_name_id = "x_judge"
				self.x_rage.animations.second_gun_versions = self.x_rage.animations.second_gun_versions or {}
				self.x_rage.animations.second_gun_versions.reload = "reload"
				self.x_rage.timers.reload_empty = 3.1
				self.x_rage.timers.reload_not_empty = 3.1
				self.x_rage.timers.reload_exit_empty = 1.3
				self.x_rage.timers.reload_exit_not_empty = 1.3

			--Akimbo Castigo
				self.x_chinchilla.has_description = true
				self.x_chinchilla.desc_id = "bm_x_chinchilla_sc_desc"				
				self.x_chinchilla.panic_suppression_chance = 0.05
				self.x_chinchilla.fire_mode_data.fire_rate = 0.19047619
				self.x_chinchilla.AMMO_MAX = 60
				self.x_chinchilla.kick = self.stat_info.kick_tables.vertical_kick
				self.x_chinchilla.supported = true
				self.x_chinchilla.ads_speed = 0.300
				self.x_chinchilla.damage_falloff = {
					start_dist = 1800,
					end_dist = 4500,
					min_mult = 0.4
				}
				self.x_chinchilla.stats = {
					damage = 60,
					spread = 70,
					recoil = 35,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_chinchilla.stats_modifiers = nil
				self.x_chinchilla.armor_piercing_chance = 0.5
				self.x_chinchilla.can_shoot_through_enemy = true
				self.x_chinchilla.timers.reload_empty = 3.5
				self.x_chinchilla.timers.reload_not_empty = 3.5
				self.x_chinchilla.timers.reload_exit_empty = 0.5
				self.x_chinchilla.timers.reload_exit_not_empty = 0.5
				self.x_chinchilla.panic_suppression_chance = 0.05
		
			--RUS-12 Angry Tiger
				self.rsh12.has_description = true
				self.rsh12.desc_id = "bm_rsh12_sc_desc"				
				self.rsh12.fire_mode_data.fire_rate = 0.1935
				self.rsh12.AMMO_MAX = 40
				self.rsh12.CLIP_AMMO_MAX = 5
				self.rsh12.use_data.selection_index = 2
				self.rsh12.kick = self.stat_info.kick_tables.vertical_kick
				--if restoration.Options:GetValue("OTHER/ComboSounds") then
					self.rsh12.sounds.fire = "ching_fire"
					self.rsh12.sounds.fire2 = "b682_fire"
				--end
				self.rsh12.supported = true
				self.rsh12.ads_speed = 0.300
				self.rsh12.damage_falloff = {
					start_dist = 3000,
					end_dist = 5200,
					min_mult = 0.5
				}
				self.rsh12.stats = {
					damage = 90,
					spread = 76,
					recoil = 41,
					spread_moving = 9,
					zoom = 1,
					concealment = 22,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.rsh12.stats_modifiers = nil
				self.rsh12.reload_speed_multiplier = 0.9
				self.rsh12.timers.reload_not_empty = 2.1
				self.rsh12.timers.reload_empty = 2.1
				self.rsh12.timers.reload_exit_empty = 0.6
				self.rsh12.timers.reload_exit_not_empty = 0.6
				self.rsh12.panic_suppression_chance = 0.05
				self.rsh12.can_shoot_through_enemy = true
				self.rsh12.can_shoot_through_shield = true
				self.rsh12.can_shoot_through_wall = true
				self.rsh12.object_damage_mult = 2
				self.rsh12.armor_piercing_chance = 1

		--SECONDARIES

			--Model 54--
				self.type54.has_description = true
				self.type54.desc_id = "bm_type54_sc_desc"					
				self.type54.CLIP_AMMO_MAX = 9
				self.type54.AMMO_MAX = 40
				self.type54.tactical_reload = 1
				self.type54.FIRE_MODE = "single"
				self.type54.fire_mode_data = {}
				self.type54.fire_mode_data.fire_rate = 0.08571428571
				self.type54.single = {}
				self.type54.single.fire_rate = 0.08571428571
				self.type54.kick = self.stat_info.kick_tables.left_recoil
				self.type54.supported = true
				self.type54.ads_speed = 0.220
				self.type54.damage_falloff = {
					start_dist = 1800,
					end_dist = 4000,
					min_mult = 0.2222
				}
				self.type54.stats = {
					damage = 45,
					spread = 66,
					recoil = 89,
					spread_moving = 7,
					zoom = 1,
					concealment = 28,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.type54.stats_modifiers = nil
				self.type54.panic_suppression_chance = 0.05	
				self.type54.reload_speed_multiplier = 1.05
				self.type54.timers.reload_exit_empty = 0.55
				self.type54.timers.reload_exit_not_empty = 0.45
			--Model 54 Underbarrel
				self.type54_underbarrel.rays = 8
				self.type54_underbarrel.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.type54_underbarrel.AMMO_MAX = 15
				self.type54_underbarrel.CLIP_AMMO_MAX = 1
				self.type54_underbarrel.fire_mode_data = {}
				self.type54_underbarrel.fire_mode_data.fire_rate = 0.24
				self.type54_underbarrel.kick = self.stat_info.kick_tables.vertical_kick
				self.type54_underbarrel.supported = true
				self.type54_underbarrel.ads_speed = 0.220
				self.type54_underbarrel.damage_falloff = {
					start_dist = 800,
					end_dist = 2500,
					min_mult = 0.25
				}
				self.type54_underbarrel.stats = {
					damage = 90,
					spread = 56,
					recoil = 79,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.type54_underbarrel.stats_modifiers = nil
				self.type54_underbarrel.panic_suppression_chance = 0.05	
				self.type54_underbarrel.ignore_crit_damage = false
				self.type54_underbarrel.ignore_damage_multipliers = false
				self.type54_underbarrel.ignore_damage_upgrades = false	
				self.type54_underbarrel.timers.reload_exit_empty = 0.35
				self.type54_underbarrel.timers.reload_exit_not_empty = 0.35

			--Crosskill Guard
				self.shrew.has_description = true
				self.shrew.desc_id = "bm_shrew_sc_desc"			
				self.shrew.fire_mode_data.fire_rate = 0.08571428571
				self.shrew.single.fire_rate = 0.08571428571
				self.shrew.CLIP_AMMO_MAX = 6
				self.shrew.AMMO_MAX = 40
				self.shrew.kick = self.stat_info.kick_tables.moderate_kick
				self.shrew.supported = true
				self.shrew.ads_speed = 0.200
				self.shrew.damage_falloff = {
					start_dist = 1100,
					end_dist = 3000,
					min_mult = 0.2
				}
				self.shrew.stats = {
					damage = 45,
					spread = 52,
					recoil = 89,
					spread_moving = 5,
					zoom = 1,
					concealment = 29,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.shrew.stats_modifiers = nil
				self.shrew.panic_suppression_chance = 0.05
				self.shrew.reload_speed_multiplier = 1.1

			--Interceptor .45
				self.usp.has_description = true
				self.usp.desc_id = "bm_usp_sc_desc"			
				self.usp.timers = {
					reload_not_empty = 1.47,
					reload_empty = 2.12,
					unequip = 0.5,
					equip = 0.35
				}
				self.usp.fire_mode_data.fire_rate = 0.08571428571
				self.usp.single.fire_rate = 0.08571428571
				self.usp.AMMO_MAX = 40
				self.usp.kick = self.stat_info.kick_tables.right_recoil
				self.usp.CLIP_AMMO_MAX = 12
				self.usp.tactical_reload = 1
				self.usp.supported = true
				self.usp.ads_speed = 0.260
				self.usp.damage_falloff = {
					start_dist = 1600,
					end_dist = 3600,
					min_mult = 0.2
				}
				self.usp.stats = {
					damage = 45,
					spread = 61,
					recoil = 83,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.usp.stats_modifiers = nil
				self.usp.panic_suppression_chance = 0.05
				self.usp.timers.reload_exit_empty = 0.5
				self.usp.timers.reload_exit_not_empty = 0.65

			--Crosskill (1911)
				self.colt_1911.has_description = true
				self.colt_1911.desc_id = "bm_1911_sc_desc"				
				self.colt_1911.fire_mode_data.fire_rate = 0.08571428571
				self.colt_1911.single.fire_rate = 0.08571428571
				self.colt_1911.CLIP_AMMO_MAX = 8
				self.colt_1911.AMMO_MAX = 40
				self.colt_1911.kick = self.stat_info.kick_tables.even_recoil
				self.colt_1911.supported = true
				self.colt_1911.ads_speed = 0.220
				self.colt_1911.damage_falloff = {
					start_dist = 1400,
					end_dist = 3400,
					min_mult = 0.2
				}
				self.colt_1911.stats = {
					damage = 45,
					spread = 55,
					recoil = 87,
					spread_moving = 5,
					zoom = 1,
					concealment = 27,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.colt_1911.stats_modifiers = nil
				self.colt_1911.panic_suppression_chance = 0.05
				self.colt_1911.reload_speed_multiplier = 1.05
				self.colt_1911.timers.reload_exit_empty = 0.5
				self.colt_1911.timers.reload_exit_not_empty = 0.65

			--Crosskill Chunky (M1911)
				self.m1911.has_description = true
				self.m1911.desc_id = "bm_m1911_sc_desc"				
				self.m1911.tactical_reload = 1	
				self.m1911.fire_mode_data.fire_rate = 0.08571428571
				self.m1911.single.fire_rate = 0.08571428571
				self.m1911.CLIP_AMMO_MAX = 7
				self.m1911.AMMO_MAX = 40
				self.m1911.kick = self.stat_info.kick_tables.even_recoil
				self.m1911.supported = true
				self.m1911.ads_speed = 0.220
				self.m1911.damage_falloff = {
					start_dist = 1500,
					end_dist = 3500,
					min_mult = 0.2
				}
				self.m1911.stats = {
					damage = 45,
					spread = 58,
					recoil = 85,
					spread_moving = 5,
					zoom = 1,
					concealment = 28,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.m1911.stats_modifiers = nil
				self.m1911.panic_suppression_chance = 0.05
				self.m1911.reload_speed_multiplier = 1.1
				self.m1911.timers.reload_exit_empty = 0.5
				self.m1911.timers.reload_exit_not_empty = 0.65
				self.m1911.animations.reload_name_id = "sparrow"

			--Deagle
				--Back to secondary
				self.deagle.has_description = true
				self.deagle.desc_id = "bm_deagle_sc_desc"						
				self.deagle.use_data.selection_index = 1
				self.deagle.fire_mode_data.fire_rate = 0.133333
				self.deagle.kick = self.stat_info.kick_tables.moderate_right_kick
				self.deagle.CLIP_AMMO_MAX = 7
				self.deagle.AMMO_MAX = 30
				self.deagle.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
				self.deagle.supported = true
				self.deagle.ads_speed = 0.360
				self.deagle.damage_falloff = {
					start_dist = 1400,
					end_dist = 4200,
					min_mult = 0.4
				}
				self.deagle.stats = {
					damage = 60,
					spread = 61,
					recoil = 31,
					spread_moving = 6,
					zoom = 1,
					concealment = 23,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.deagle.stats_modifiers = nil
				self.deagle.armor_piercing_chance = 0.5
				self.deagle.can_shoot_through_enemy = true
				self.deagle.panic_suppression_chance = 0.05
				self.deagle.timers.reload_exit_empty = 0.75
				self.deagle.timers.reload_exit_not_empty = 0.8

			--Kahn .357				
				self.korth.has_description = true
				self.korth.desc_id = "bm_ap_armor_50_weapon_sc_desc"	
				self.korth.fire_mode_data.fire_rate = 0.15789474
				self.korth.CLIP_AMMO_MAX = 8
				self.korth.AMMO_MAX = 30
				self.korth.kick = self.stat_info.kick_tables.moderate_right_kick
				self.korth.supported = true
				self.korth.ads_speed = 0.300
				self.korth.damage_falloff = {
					start_dist = 1100,
					end_dist = 4000,
					min_mult = 0.3333
				}
				self.korth.stats = {
					damage = 60,
					spread = 73,
					recoil = 57,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.korth.stats_modifiers = nil
				self.korth.armor_piercing_chance = 0.5
				self.korth.can_shoot_through_enemy = true
				self.korth.panic_suppression_chance = 0.05
				self.korth.timers.reload_exit_empty = 0.8
				self.korth.timers.reload_exit_not_empty = 0.8

			--Matever .357
				self.mateba.has_description = true
				self.mateba.desc_id = "bm_2006m_sc_desc"					
				self.mateba.fire_mode_data.fire_rate = 0.15789474
				self.mateba.AMMO_MAX = 30
				self.mateba.timers.reload_not_empty = 3.6
				self.mateba.timers.reload_empty = 3.6
				self.mateba.kick = self.stat_info.kick_tables.moderate_kick
				self.mateba.supported = true
				self.mateba.ads_speed = 0.260
				self.mateba.damage_falloff = {
					start_dist = 1200,
					end_dist = 4200,
					min_mult = 0.3333
				}
				self.mateba.stats = {
					damage = 60,
					spread = 71,
					recoil = 51,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.mateba.stats_modifiers = nil
				self.mateba.armor_piercing_chance = 0.5
				self.mateba.can_shoot_through_enemy = true
				self.mateba.panic_suppression_chance = 0.05
				self.mateba.reload_speed_multiplier = 1.3
				self.mateba.timers.reload_exit_empty = 0.55
				self.mateba.timers.reload_exit_not_empty = 0.55

			--Frenchman Model 87
				self.model3.has_description = true
				self.model3.desc_id = "bm_model3_sc_desc"			
				self.model3.fire_mode_data.fire_rate = 0.15789473684
				self.model3.AMMO_MAX = 30
				self.model3.kick = self.stat_info.kick_tables.moderate_kick
				self.model3.supported = true
				self.model3.ads_speed = 0.280
				self.model3.damage_falloff = {
					start_dist = 1000,
					end_dist = 3800,
					min_mult = 0.3333
				}
				self.model3.stats = {
					damage = 60,
					spread = 76,
					recoil = 49,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.model3.stats_modifiers = nil
				self.model3.armor_piercing_chance = 0.5
				self.model3.can_shoot_through_enemy = true
				self.model3.reload_speed_multiplier = 0.95
				self.model3.timers.reload_not_empty = 2.2
				self.model3.timers.reload_exit_not_empty = 0.4
				self.model3.timers.reload_empty = 2.2
				self.model3.timers.reload_exit_empty = 0.4
				self.model3.panic_suppression_chance = 0.05	

			--Bronco
				self.new_raging_bull.has_description = true
				self.new_raging_bull.desc_id = "bm_rage_sc_desc"				
				self.new_raging_bull.fire_mode_data.fire_rate = 0.19047619047
				self.new_raging_bull.AMMO_MAX = 30
				self.new_raging_bull.kick = self.stat_info.kick_tables.moderate_kick
				self.new_raging_bull.supported = true
				self.new_raging_bull.ads_speed = 0.300
				self.new_raging_bull.damage_falloff = {
					start_dist = 1400,
					end_dist = 4000,
					min_mult = 0.4
				}
				self.new_raging_bull.stats = {
					damage = 60,
					spread = 76,
					recoil = 47,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.new_raging_bull.stats_modifiers = nil
				self.new_raging_bull.armor_piercing_chance = 0.5
				self.new_raging_bull.can_shoot_through_enemy = true
				self.new_raging_bull.reload_speed_multiplier = 0.9
				self.new_raging_bull.timers.reload_not_empty = 2.1
				self.new_raging_bull.timers.reload_empty = 2.1
				self.new_raging_bull.timers.reload_exit_empty = 0.6
				self.new_raging_bull.timers.reload_exit_not_empty = 0.6
				self.new_raging_bull.panic_suppression_chance = 0.05

			--Castigo
				self.chinchilla.has_description = true
				self.chinchilla.desc_id = "bm_chinchilla_sc_desc"			
				self.chinchilla.fire_mode_data.fire_rate = 0.19047619
				self.chinchilla.AMMO_MAX = 30
				self.chinchilla.kick = self.stat_info.kick_tables.moderate_kick
				self.chinchilla.supported = true
				self.chinchilla.ads_speed = 0.300
				self.chinchilla.damage_falloff = {
					start_dist = 1600,
					end_dist = 4200,
					min_mult = 0.4
				}
				self.chinchilla.stats = {
					damage = 60,
					spread = 80,
					recoil = 45,
					spread_moving = 5,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}		
				self.chinchilla.stats_modifiers = nil
				self.chinchilla.armor_piercing_chance = 0.5
				self.chinchilla.can_shoot_through_enemy = true
				self.chinchilla.reload_speed_multiplier = 1.2
				self.chinchilla.timers.reload_exit_empty = 0.5
				self.chinchilla.timers.reload_exit_not_empty = 0.5
			
			--Wow wow (Peacemaker)
				self.peacemaker.has_description = true
				self.peacemaker.desc_id = "bm_ap_weapon_peacemaker_sc_desc"
				self.peacemaker.AMMO_MAX = 20
				self.peacemaker.kick = self.stat_info.kick_tables.right_kick
				self.peacemaker.fire_mode_data.fire_rate = 0.352941
				self.peacemaker.fire_rate_multiplier = 2.5
				self.peacemaker.BURST_FIRE = 6
				self.peacemaker.BURST_FIRE_RATE_MULTIPLIER = 1.2352941
				self.peacemaker.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
				self.peacemaker.supported = true
				self.peacemaker.ads_speed = 0.240
				self.peacemaker.damage_falloff = {
					start_dist = 1800,
					end_dist = 4500,
					min_mult = 0.3333
				}
				self.peacemaker.stats = {
					damage = 90,
					spread = 81,
					recoil = 61,
					spread_moving = 9,
					zoom = 1,
					concealment = 24,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.peacemaker.stats_modifiers = nil
				self.peacemaker.panic_suppression_chance = 0.05
				self.peacemaker.object_damage_mult = 2
				self.peacemaker.armor_piercing_chance = 1
				self.peacemaker.can_shoot_through_enemy = true
				self.peacemaker.can_shoot_through_wall = true
				self.peacemaker.can_shoot_through_shield = true
				self.peacemaker.reload_speed_multiplier = 1.35
				self.peacemaker.timers.shotgun_reload_first_shell_offset = 0.5
				self.peacemaker.timers.shotgun_reload_exit_empty = 0.7
				self.peacemaker.timers.shotgun_reload_exit_not_empty = 0.7



	--[[     LIGHT SMGs     ]]

		--PRIMARIES

			--Hailstorm Mk5
				self.hailstorm.categories = { 
					"smg",
					"typh"
				}
				self.hailstorm.CLIP_AMMO_MAX = 120
				self.hailstorm.AMMO_MAX = 240
				self.hailstorm.FIRE_MODE = "auto"
				self.hailstorm.charge_data = {
					max_t = 0.2,
					cooldown_t = 0.6
				}
				self.hailstorm.fire_mode_data.fire_rate = 0.03333333333
				self.hailstorm.fire_mode_data.volley.spread_mul = 2
				self.hailstorm.fire_mode_data.volley.damage_mul = 1
				self.hailstorm.fire_mode_data.volley.ammo_usage = 15
				self.hailstorm.fire_mode_data.volley.rays = 15
				self.hailstorm.fire_mode_data.volley.can_shoot_through_wall = false
				self.hailstorm.fire_mode_data.volley.can_shoot_through_shield = true
				self.hailstorm.fire_mode_data.volley.can_shoot_through_enemy = true
				self.hailstorm.fire_mode_data.volley.armor_piercing_chance = 1
				self.hailstorm.fire_mode_data.volley.muzzleflash = "effects/payday2/particles/weapons/hailstorm_volley_effect"
				self.hailstorm.fire_mode_data.volley.muzzleflash_silenced = "effects/payday2/particles/weapons/hailstorm_suppressed_volley"
				self.hailstorm.fire_mode_data.volley.object_damage_mult = 0.75
				self.hailstorm.fire_mode_data.toggable = {
					"volley",
					"auto"
				}
				self.hailstorm.sms = 0.7
				self.hailstorm.muzzleflash = "effects/payday2/particles/weapons/hailstorm_effect"
				self.hailstorm.kick = self.stat_info.kick_tables.moderate_kick
				self.hailstorm.kick.volley = self.stat_info.kick_tables.metalstorm_kick
				self.hailstorm.shake.bypass_global_shake = true
				self.hailstorm.supported = true
				self.hailstorm.ads_speed = 0.380
				self.hailstorm.damage_falloff = {
					start_dist = 800,
					end_dist = 3000,
					min_mult = 0.4,
					ignore_rays = true
				}
				self.hailstorm.stats = {
					damage = 15,
					spread = 41,
					recoil = 83,
					spread_moving = 6,
					zoom = 1,
					concealment = 19,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}		
				self.hailstorm.stats_modifiers = nil
				self.hailstorm.reload_speed_multiplier = 0.85
				self.hailstorm.panic_suppression_chance = 0.05
				self.hailstorm.timers.reload_exit_empty = 0.08
				self.hailstorm.timers.reload_exit_not_empty = 0.08

			--Akimbo Micro-Uzi
				--Keeping
				self.x_baka.use_data.selection_index = 2
				self.x_baka.CLIP_AMMO_MAX = 64
				self.x_baka.AMMO_MAX = 180
				self.x_baka.FIRE_MODE = "auto"
				self.x_baka.fire_mode_data = {}
				self.x_baka.fire_mode_data.fire_rate = 0.05
				self.x_baka.CAN_TOGGLE_FIREMODE = true
				self.x_baka.kick = {}
				self.x_baka.kick = self.stat_info.kick_tables.moderate_kick
				self.x_baka.supported = true
				self.x_baka.ads_speed = 0.220
				self.x_baka.damage_falloff = {
					start_dist = 1200,
					end_dist = 3500,
					min_mult = 0.3
				}
				self.x_baka.stats = {
					damage = 20,
					spread = 43,
					recoil = 63,
					spread_moving = 8,
					zoom = 1,
					concealment = 28,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_baka.stats_modifiers = nil
				self.x_baka.panic_suppression_chance = 0.05
				self.x_baka.reload_speed_multiplier = 0.75
				self.x_baka.timers.reload_empty = 3
				self.x_baka.timers.reload_not_empty = 2
				self.x_baka.timers.reload_exit_empty = 0.95
				self.x_baka.timers.reload_exit_not_empty = 1.3

			--Miyaka 10
				--Moved to Primary slot
				self.pm9.use_data.selection_index = 2	
				self.pm9.CLIP_AMMO_MAX = 25
				self.pm9.AMMO_MAX = 180
				self.pm9.fire_mode_data.fire_rate = 0.05454545454
				self.pm9.kick = self.stat_info.kick_tables.even_recoil
				self.pm9.supported = true
				self.pm9.ads_speed = 0.220
				self.pm9.damage_falloff = {
					start_dist = 1200,
					end_dist = 3600,
					min_mult = 0.3
				}
				self.pm9.stats = {
					damage = 20,
					spread = 55,
					recoil = 79,
					spread_moving = 8,
					zoom = 1,
					concealment = 29,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.pm9.stats_modifiers = nil
				self.pm9.panic_suppression_chance = 0.05
				self.pm9.timers.reload_exit_empty = 0.55
				self.pm9.timers.reload_exit_not_empty = 0.55

			--Akimbo Heather
				self.x_sr2.fire_mode_data.fire_rate = 0.063157894
				self.x_sr2.CLIP_AMMO_MAX = 60
				self.x_sr2.kick = self.stat_info.kick_tables.even_recoil
				self.x_sr2.sounds.fire = "sr2_fire_single"
				self.x_sr2.sounds.fire_single = "sr2_fire_single"
				self.x_sr2.sounds.fire_auto = "sr2_fire"
				self.x_sr2.sounds.stop_fire = "sr2_stop"
				self.x_sr2.AMMO_MAX = 180
				self.x_sr2.supported = true
				self.x_sr2.ads_speed = 0.280
				self.x_sr2.damage_falloff = {
					start_dist = 1400,
					end_dist = 4000,
					min_mult = 0.3
				}
				self.x_sr2.stats = {
					damage = 20,
					spread = 50,
					recoil = 75,
					spread_moving = 8,
					zoom = 1,
					concealment = 29,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_sr2.stats_modifiers = nil
				self.x_sr2.panic_suppression_chance = 0.05
				self.x_sr2.reload_speed_multiplier = 0.75
				self.x_sr2.timers.reload_not_empty = 2.1
				self.x_sr2.timers.reload_exit_not_empty = 1.5
				self.x_sr2.timers.reload_empty = 3
				self.x_sr2.timers.reload_exit_empty = 0.9
				self.x_sr2.weapon_hold = "x_akmsu"
				self.x_sr2.animations.reload_name_id = "x_akmsu"
				self.x_sr2.animations.second_gun_versions = self.x_sr2.animations.second_gun_versions or {}
				self.x_sr2.animations.second_gun_versions.reload = "reload"

			--AK GEN 21 Tactical
				self.vityaz.tactical_reload = 1	
				self.vityaz.use_data.selection_index = 2
				self.vityaz.BURST_FIRE = false
				self.vityaz.AMMO_MAX = 150
				self.vityaz.CAN_TOGGLE_FIREMODE = true
				self.vityaz.kick = self.stat_info.kick_tables.right_recoil
				self.vityaz.supported = true
				self.vityaz.ads_speed = 0.260
				self.vityaz.damage_falloff = {
					start_dist = 1300,
					end_dist = 4500,
					min_mult = 0.25
				}
				self.vityaz.stats = {
					damage = 24,
					spread = 57,
					recoil = 87,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 5,
					reload = 20
				}
				self.vityaz.stats_modifiers = nil
				self.vityaz.panic_suppression_chance = 0.05
				self.vityaz.timers.reload_exit_empty = 1.05
				self.vityaz.timers.reload_exit_not_empty = 0.95

			--Singature SMG (MPX)
				--HOW MANY SIGNATURES DOES THIS GAME HAVE AAAAAAAAAAAAAAAAAAAAAA
				self.shepheard.use_data.selection_index = 2
				self.shepheard.CLIP_AMMO_MAX = 30
				self.shepheard.fire_mode_data.fire_rate = 0.07058823529
				self.shepheard.panic_suppression_chance = 0.05
				self.shepheard.kick = self.stat_info.kick_tables.even_recoil
				self.shepheard.AMMO_MAX = 150
				self.shepheard.supported = true
				self.shepheard.ads_speed = 0.260
				self.shepheard.damage_falloff = {
					start_dist = 900,
					end_dist = 4200,
					min_mult = 0.25
				}
				self.shepheard.stats = {
					damage = 24,
					spread = 60,
					recoil = 85,
					spread_moving = 8,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.shepheard.stats_modifiers = nil
				self.shepheard.panic_suppression_chance = 0.05
				self.shepheard.timers.reload_exit_empty = 0.6
				self.shepheard.timers.reload_exit_not_empty = 0.75

			--Tatonka (PP-19 Bizon)
				--Moved to primary
				self.coal.use_data.selection_index = 2
				self.coal.AMMO_MAX = 150
				self.coal.CLIP_AMMO_MAX = 64
				self.coal.fire_mode_data.fire_rate = 0.08571
				self.coal.panic_suppression_chance = 0.05
				self.coal.kick = self.stat_info.kick_tables.horizontal_right_recoil
				self.coal.supported = true
				self.coal.ads_speed = 0.320
				self.coal.damage_falloff = {
					start_dist = 1400,
					end_dist = 3600,
					min_mult = 0.2083
				}
				self.coal.stats = {
					damage = 24,
					spread = 58,
					recoil = 89,
					spread_moving = 9,
					zoom = 1,
					concealment = 25,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.coal.stats_modifiers = nil
				self.coal.panic_suppression_chance = 0.05
				self.coal.timers.reload_empty = 4.2
				self.coal.timers.reload_not_empty = 2.8
				self.coal.timers.reload_exit_empty = 0.6
				self.coal.timers.reload_exit_not_empty = 1

			--Akimbo Cobra
				self.x_scorpion.CLIP_AMMO_MAX = 40
				self.x_scorpion.AMMO_MAX = 150
				self.x_scorpion.fire_mode_data.fire_rate = 0.07058823529
				self.x_scorpion.single.fire_rate = 0.07058823529
				self.x_scorpion.kick = self.stat_info.kick_tables.even_recoil
				self.x_scorpion.supported = true
				self.x_scorpion.ads_speed = 0.220
				self.x_scorpion.damage_falloff = {
					start_dist = 1500,
					end_dist = 4000,
					min_mult = 0.2083
				}
				self.x_scorpion.stats = {
					damage = 24,
					spread = 46,
					recoil = 75,
					spread_moving = 7,
					zoom = 1,
					concealment = 30,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.x_scorpion.stats_modifiers = nil
				self.x_scorpion.panic_suppression_chance = 0.05	
				self.x_scorpion.reload_speed_multiplier = 0.75
				self.x_scorpion.timers.reload_not_empty = 2.1
				self.x_scorpion.timers.reload_exit_not_empty = 1.5
				self.x_scorpion.timers.reload_empty = 3
				self.x_scorpion.timers.reload_exit_empty = 0.9

			--Akimbo MP5
				self.x_mp5.fire_mode_data.fire_rate = 0.075
				self.x_mp5.BURST_FIRE = false
				self.x_mp5.FIRE_MODE = "auto"
				self.x_mp5.ADAPTIVE_BURST_SIZE = false					
				self.x_mp5.kick = self.stat_info.kick_tables.moderate_kick
				self.x_mp5.AMMO_MAX = 150
				self.x_mp5.supported = true
				self.x_mp5.ads_speed = 0.280
				self.x_mp5.damage_falloff = {
					start_dist = 1000,
					end_dist = 4200,
					min_mult = 0.25
				}
				self.x_mp5.stats = {
					damage = 24,
					spread = 53,
					recoil = 79,
					spread_moving = 8,
					zoom = 1,
					concealment = 22,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_mp5.stats_modifiers = nil
				self.x_mp5.panic_suppression_chance = 0.05
				self.x_mp5.reload_speed_multiplier = 0.65
				self.x_mp5.timers.reload_empty = 2.6
				self.x_mp5.timers.reload_not_empty = 1.7
				self.x_mp5.timers.reload_exit_empty = 0.75
				self.x_mp5.timers.reload_exit_not_empty = 1.1

		--SECONDARIES

			--Spec Ops (MP7)
				self.mp7.categories = {
					"smg",
					"pdw"
				}
				self.mp7.has_description = true
				self.mp7.desc_id = "bm_mp7_sc_desc"	
				self.mp7.AMMO_MAX = 90
				self.mp7.fire_mode_data.fire_rate = 0.06315789473
				self.mp7.CAN_TOGGLE_FIREMODE = true
				self.mp7.auto = {}
				self.mp7.auto.fire_rate = 0.06315789473
				self.mp7.can_shoot_through_enemy = false
				self.mp7.can_shoot_through_shield = false
				self.mp7.can_shoot_through_wall = false
				self.mp7.hs_mult = 1.33333
				self.mp7.armor_piercing_chance = 0.8
				self.mp7.kick = self.stat_info.kick_tables.even_recoil
				self.mp7.supported = true
				self.mp7.ads_speed = 0.260
				self.mp7.damage_falloff = {
					start_dist = 1600,
					end_dist = 4200,
					min_mult = 0.555555
				}
				self.mp7.stats = {
					damage = 18,
					spread = 71,
					recoil = 89,
					spread_moving = 7,
					zoom = 1,
					concealment = 26,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.mp7.stats_modifiers = nil
				self.mp7.timers.reload_not_empty = 1.75
				self.mp7.timers.reload_empty = 2.4	
				self.mp7.timers.reload_exit_empty = 0.45
				self.mp7.timers.reload_exit_not_empty = 0.6
				self.mp7.panic_suppression_chance = 0.05

			--P90
				self.p90.categories = {
					"smg",
					"pdw"
				}
				self.p90.has_description = true
				self.p90.desc_id = "bm_p90_sc_desc"	
				self.p90.AMMO_MAX = 90
				self.p90.fire_mode_data.fire_rate = 0.070588235
				self.p90.armor_piercing_chance = 0.8
				self.p90.can_shoot_through_enemy = false
				self.p90.can_shoot_through_shield = false
				self.p90.can_shoot_through_wall = false
				self.p90.panic_suppression_chance = 0.05
				self.p90.hs_mult = 1.33333
				self.p90.kick = self.stat_info.kick_tables.horizontal_recoil
				self.p90.supported = true
				self.p90.ads_speed = 0.240
				self.p90.damage_falloff = {
					start_dist = 2000,
					end_dist = 5000,
					min_mult = 0.555555
				}
				self.p90.stats = {
					damage = 18,
					spread = 76,
					recoil = 87,
					spread_moving = 7,
					zoom = 1,
					concealment = 26,
					suppression = 12,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.p90.stats_modifiers = nil
				self.p90.panic_suppression_chance = 0.05
				self.p90.timers.reload_exit_empty = 0.55
				self.p90.timers.reload_exit_not_empty = 0.9

			--Blaster 9mm (Tec 9)
				self.tec9.AMMO_MAX = 90
				self.tec9.CLIP_AMMO_MAX = 32
				self.tec9.FIRE_MODE = "auto"
				self.tec9.fire_mode_data = {}
				self.tec9.fire_mode_data.fire_rate = 0.06
				self.tec9.CAN_TOGGLE_FIREMODE = true
				self.tec9.auto = {}
				self.tec9.auto.fire_rate = 0.06
				self.tec9.kick = self.stat_info.kick_tables.left_recoil
				self.tec9.supported = true
				self.tec9.ads_speed = 0.220
				self.tec9.damage_falloff = {
					start_dist = 1000,
					end_dist = 3600,
					min_mult = 0.3
				}
				self.tec9.stats = {
					damage = 20,
					spread = 51,
					recoil = 85,
					spread_moving = 10,
					zoom = 1,
					concealment = 28,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.tec9.stats_modifiers = nil
				self.tec9.panic_suppression_chance = 0.05
				self.tec9.timers.reload_exit_empty = 0.7
				self.tec9.timers.reload_exit_not_empty = 0.65

			--Micro Uzi
				self.baka.CLIP_AMMO_MAX = 32
				self.baka.NR_CLIPS_MAX = 4
				self.baka.AMMO_MAX = 90
				self.baka.FIRE_MODE = "auto"
				self.baka.fire_mode_data = {}
				self.baka.fire_mode_data.fire_rate = 0.05
				self.baka.CAN_TOGGLE_FIREMODE = true
				self.baka.kick = {}
				self.baka.kick = self.stat_info.kick_tables.even_recoil
				self.baka.supported = true
				self.baka.ads_speed = 0.220
				self.baka.damage_falloff = {
					start_dist = 1200,
					end_dist = 3800,
					min_mult = 0.3
				}
				self.baka.stats = {
					damage = 20,
					spread = 53,
					recoil = 73,
					spread_moving = 8,
					zoom = 1,
					concealment = 29,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.baka.stats_modifiers = nil
				self.baka.panic_suppression_chance = 0.05
				self.baka.timers.reload_exit_empty = 0.55
				self.baka.timers.reload_exit_not_empty = 0.55

			--Jacket's Piece (M11/9)
				self.cobray.CLIP_AMMO_MAX = 32
				self.cobray.AMMO_MAX = 90
				self.cobray.kick = self.stat_info.kick_tables.even_recoil
				self.cobray.fire_mode_data.fire_rate = 0.06
				self.cobray.CAN_TOGGLE_FIREMODE = true
				self.cobray.supported = true
				self.cobray.ads_speed = 0.280
				self.cobray.damage_falloff = {
					start_dist = 1400,
					end_dist = 4000,
					min_mult = 0.3
				}
				self.cobray.stats = {
					damage = 20,
					spread = 55,
					recoil = 79,
					spread_moving = 1,
					zoom = 1,
					concealment = 28,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.cobray.stats_modifiers = nil
				self.cobray.panic_suppression_chance = 0.05
				self.cobray.timers.reload_empty = 3.4
				self.cobray.timers.reload_not_empty = 1.9
				self.cobray.timers.reload_exit_empty = 1.5
				self.cobray.timers.reload_exit_not_empty = 0.6
				self.cobray.reload_speed_multiplier = 1.3

			--Heather (SR2M)
				self.sr2.fire_mode_data.fire_rate = 0.063157894
				self.sr2.CLIP_AMMO_MAX = 30
				self.sr2.AMMO_MAX = 90
				self.sr2.kick = {}
				self.sr2.kick = self.stat_info.kick_tables.even_recoil
				self.sr2.supported = true
				self.sr2.ads_speed = 0.280
				self.sr2.damage_falloff = {
					start_dist = 1600,
					end_dist = 4200,
					min_mult = 0.3
				}
				self.sr2.stats = {
					damage = 20,
					spread = 60,
					recoil = 85,
					spread_moving = 8,
					zoom = 1,
					concealment = 29,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.sr2.stats_modifiers = nil
				self.sr2.panic_suppression_chance = 0.05
				self.sr2.reload_speed_multiplier = 1.1
				self.sr2.timers.reload_not_empty = 2
				self.sr2.timers.reload_exit_empty = 0.8
				self.sr2.timers.reload_exit_not_empty = 0.7

			--CMP (MP9)
				self.mp9.desc_id = "bm_menu_sc_mp9_desc"
				self.mp9.CLIP_AMMO_MAX = 20
				self.mp9.auto.fire_rate = 0.06666666666
				self.mp9.fire_mode_data.fire_rate = 0.06666666666
				self.mp9.AMMO_MAX = 90
				self.mp9.kick = self.stat_info.kick_tables.even_recoil
				self.mp9.supported = true
				self.mp9.ads_speed = 0.220
				self.mp9.damage_falloff = {
					start_dist = 1400,
					end_dist = 4500,
					min_mult = 0.3
				}
				self.mp9.stats = {
					damage = 20,
					spread = 58,
					recoil = 87,
					spread_moving = 8,
					zoom = 1,
					concealment = 30,
					suppression = 11,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.mp9.stats_modifiers = nil
				self.mp9.panic_suppression_chance = 0.05

			--Cobra
				self.scorpion.AMMO_MAX = 75
				self.scorpion.FIRE_MODE = "auto"
				self.scorpion.fire_mode_data = {}
				self.scorpion.fire_mode_data.fire_rate = 0.07058823529
				self.scorpion.CAN_TOGGLE_FIREMODE = true
				self.scorpion.auto = {}
				self.scorpion.auto.fire_rate = 0.07058823529
				self.scorpion.kick = self.stat_info.kick_tables.even_recoil
				self.scorpion.supported = true
				self.scorpion.ads_speed = 0.220
				self.scorpion.damage_falloff = {
					start_dist = 1500,
					end_dist = 4000,
					min_mult = 0.2083
				}
				self.scorpion.stats = {
					damage = 24,
					spread = 56,
					recoil = 85,
					spread_moving = 7,
					zoom = 1,
					concealment = 30,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.scorpion.stats_modifiers = nil
				self.scorpion.timers.reload_exit_empty = 0.6
				self.scorpion.timers.reload_exit_not_empty = 0.65	
				self.scorpion.panic_suppression_chance = 0.05

			--Compact-5
				self.new_mp5.fire_mode_data.fire_rate = 0.075
				self.new_mp5.has_description = true
				self.new_mp5.desc_id = "bm_mp5_sc_desc"
				self.new_mp5.BURST_FIRE = 3
				self.new_mp5.ADAPTIVE_BURST_SIZE = false			
				self.new_mp5.panic_suppression_chance = 0.05
				self.new_mp5.kick = self.stat_info.kick_tables.even_recoil
				self.new_mp5.AMMO_MAX = 75
				self.new_mp5.supported = true
				self.new_mp5.ads_speed = 0.280
				self.new_mp5.damage_falloff = {
					start_dist = 1000,
					end_dist = 4800,
					min_mult = 0.25
				}
				self.new_mp5.stats = {
					damage = 24,
					spread = 63,
					recoil = 89,
					spread_moving = 8,
					zoom = 1,
					concealment = 22,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.new_mp5.stats_modifiers = nil
				self.new_mp5.panic_suppression_chance = 0.05
				self.new_mp5.reload_speed_multiplier = 1.025
				self.new_mp5.timers.reload_exit_empty = 0.6
				self.new_mp5.timers.reload_exit_not_empty = 0.85

	--[[     HEAVY SMGs     ]]

		--PRIMARIES

			--MP40
				self.erma.has_description = true
				self.erma.desc_id = "bm_erma_sc_desc"
				self.erma.use_data.selection_index = 2
				self.erma.CLIP_AMMO_MAX = 32
				self.erma.BURST_FIRE = false
				self.erma.AMMO_MAX = 120
				self.erma.fire_mode_data.fire_rate = 0.10909090909
				self.erma.auto.fire_rate = 0.10909090909
				self.erma.CAN_TOGGLE_FIREMODE = true
				self.erma.kick = self.stat_info.kick_tables.horizontal_recoil
				self.erma.supported = true
				self.erma.ads_speed = 0.260
				self.erma.damage_falloff = {
					start_dist = 2000,
					end_dist = 5200,
					min_mult = 0.25
				}
				self.erma.stats = {
					damage = 30,
					spread = 68,
					recoil = 91,
					spread_moving = 8,
					zoom = 1,
					concealment = 27,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 5,
					reload = 20
				}
				self.erma.stats_modifiers = nil
				self.erma.panic_suppression_chance = 0.05
				self.erma.timers.reload_exit_empty = 0.6
				self.erma.timers.reload_exit_not_empty = 0.7

			--Akimbo MAC-10
				--Keeping
				self.x_mac10.CLIP_AMMO_MAX = 40
				self.x_mac10.AMMO_MAX = 120
				self.x_mac10.fire_mode_data.fire_rate = 0.05
				self.x_mac10.single.fire_rate = 0.06
				self.x_mac10.kick = self.stat_info.kick_tables.even_recoil
				self.x_mac10.supported = true
				self.x_mac10.ads_speed = 0.240
				self.x_mac10.damage_falloff = {
					start_dist = 1100,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.x_mac10.stats = {
					damage = 30,
					spread = 34,
					recoil = 59,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_mac10.stats_modifiers = nil
				self.x_mac10.panic_suppression_chance = 0.05
				self.x_mac10.reload_speed_multiplier = 0.75
				self.x_mac10.timers.reload_empty = 3
				self.x_mac10.timers.reload_not_empty = 2
				self.x_mac10.timers.reload_exit_empty = 0.95
				self.x_mac10.timers.reload_exit_not_empty = 1.3

			--Kross Vertex (Vector)
				self.polymer.use_data.selection_index = 2
				self.polymer.CLIP_AMMO_MAX = 30
				self.polymer.AMMO_MAX = 120
				self.polymer.FIRE_MODE = "auto"
				self.polymer.fire_mode_data = {}
				self.polymer.fire_mode_data.fire_rate = 0.0545454545
				self.polymer.CAN_TOGGLE_FIREMODE = true
				self.polymer.BURST_FIRE = 2
				self.polymer.ADAPTIVE_BURST_SIZE = false													
				self.polymer.kick = self.stat_info.kick_tables.moderate_kick
				self.polymer.supported = true
				self.polymer.ads_speed = 0.260
				self.polymer.damage_falloff = {
					start_dist = 1200,
					end_dist = 3500,
					min_mult = 0.3
				}
				self.polymer.stats = {
					damage = 30,
					spread = 52,
					recoil = 87,
					spread_moving = 8,
					zoom = 1,
					concealment = 24,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.polymer.stats_modifiers = nil
				self.polymer.panic_suppression_chance = 0.05
				self.polymer.timers.reload_exit_empty = 0.8
				self.polymer.timers.reload_exit_not_empty = 0.85

			--Jackal SMG (UMP-45)
				--Moved to primary
				self.schakal.use_data.selection_index = 2
				self.schakal.fire_mode_data.fire_rate = 0.1
				self.schakal.auto.fire_rate = 0.1
				self.schakal.AMMO_MAX = 120
				self.schakal.CLIP_AMMO_MAX = 25
				self.schakal.BURST_FIRE = 2
				self.schakal.ADAPTIVE_BURST_SIZE = false											
				self.schakal.kick = self.stat_info.kick_tables.even_recoil
				self.schakal.panic_suppression_chance = 0.05
				self.schakal.supported = true
				self.schakal.ads_speed = 0.260
				self.schakal.damage_falloff = {
					start_dist = 1600,
					end_dist = 3800,
					min_mult = 0.3
				}
				self.schakal.stats = {
					damage = 30,
					spread = 66,
					recoil = 83,
					spread_moving = 7,
					zoom = 1,
					concealment = 24,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.schakal.stats_modifiers = nil
				self.schakal.reload_speed_multiplier = 1.05
				self.schakal.timers.reload_exit_empty = 0.6
				self.schakal.timers.reload_exit_not_empty = 0.85

		--SECONDARIES

			--Swedish K (M/45)
				self.m45.CLIP_AMMO_MAX = 36
				self.m45.AMMO_MAX = 60
				self.m45.kick = self.stat_info.kick_tables.even_recoil
				self.m45.supported = true
				self.m45.ads_speed = 0.260
				self.m45.damage_falloff = {
					start_dist = 1800,
					end_dist = 5000,
					min_mult = 0.2
				}
				self.m45.stats = {
					damage = 30,
					spread = 61,
					recoil = 87,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 5,
					reload = 20
				}
				self.m45.stats_modifiers = nil
				self.m45.timers.reload_empty = 3.65
				self.m45.timers.reload_not_empty = 2.55
				self.m45.timers.reload_exit_empty = 0.9
				self.m45.timers.reload_exit_not_empty = 0.9	
				self.m45.panic_suppression_chance = 0.05

			--Patchett
				self.sterling.CLIP_AMMO_MAX = 20
				self.sterling.AMMO_MAX = 60
				self.sterling.fire_mode_data.fire_rate = 0.10909090909
				self.sterling.CAN_TOGGLE_FIREMODE = true
				self.sterling.auto = {}
				self.sterling.auto.fire_rate = 0.10909090909
				self.sterling.kick = self.stat_info.kick_tables.right_recoil
				self.sterling.supported = true
				self.sterling.ads_speed = 0.240
				self.sterling.damage_falloff = {
					start_dist = 2000,
					end_dist = 5200,
					min_mult = 0.2
				}
				self.sterling.stats = {
					damage = 30,
					spread = 57,
					recoil = 91,
					spread_moving = 8,
					zoom = 1,
					concealment = 28,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.sterling.stats_modifiers = nil
				self.sterling.panic_suppression_chance = 0.05
				self.sterling.reload_speed_multiplier = 1.2
				self.sterling.timers.reload_exit_empty = 0.6
				self.sterling.timers.reload_exit_not_empty = 0.6

			--MAC-10
				self.mac10.CLIP_AMMO_MAX = 20
				self.mac10.AMMO_MAX = 60
				self.mac10.fire_mode_data.fire_rate = 0.05
				self.mac10.auto.fire_rate = 0.06
				self.mac10.kick = self.stat_info.kick_tables.even_recoil
				self.mac10.supported = true
				self.mac10.ads_speed = 0.240
				self.mac10.damage_falloff = {
					start_dist = 1100,
					end_dist = 3200,
					min_mult = 0.3
				}
				self.mac10.stats = {
					damage = 30,
					spread = 44,
					recoil = 69,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.mac10.stats_modifiers = nil
				self.mac10.timers.reload_empty = 2.2
				self.mac10.timers.reload_not_empty = 1.5
				self.mac10.timers.reload_exit_empty = 0.8
				self.mac10.timers.reload_exit_not_empty = 0.9
				self.mac10.panic_suppression_chance = 0.05

			--chicago typewriter
				self.m1928.use_data.selection_index = 1
				self.m1928.desc_id = "bm_thompson_sc_desc"
				self.m1928.has_description = true
				self.m1928.fire_mode_data.fire_rate = 0.08571428
				self.m1928.CAN_TOGGLE_FIREMODE = true
				self.m1928.CLIP_AMMO_MAX = 50
				self.m1928.AMMO_MAX = 60
				self.m1928.kick = self.stat_info.kick_tables.horizontal_recoil
				self.m1928.panic_suppression_chance = 0.05
				self.m1928.supported = true
				self.m1928.ads_speed = 0.400
				self.m1928.damage_falloff = {
					start_dist = 2100,
					end_dist = 4800,
					min_mult = 0.3
				}
				self.m1928.stats = {
					damage = 30,
					spread = 62,
					recoil = 87,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.m1928.stats_modifiers = nil
				self.m1928.timers.reload_not_empty = 3.3
				self.m1928.timers.reload_exit_not_empty = 1.2
				self.m1928.timers.reload_empty = 4.0
				self.m1928.timers.reload_exit_empty = 1.35
				self.m1928.panic_suppression_chance = 0.05

			--Uzi
				--Let's assume it's in .41AE
				self.uzi.has_description = true
				self.uzi.desc_id = "bm_uzi_sc_desc"
				self.uzi.AMMO_MAX = 60
				self.uzi.CLIP_AMMO_MAX = 20
				self.uzi.FIRE_MODE = "auto"
				self.uzi.fire_mode_data = {}
				self.uzi.fire_mode_data.fire_rate = 0.1
				self.uzi.CAN_TOGGLE_FIREMODE = true
				self.uzi.auto = {}
				self.uzi.auto.fire_rate = 0.1
				self.uzi.kick = self.stat_info.kick_tables.even_recoil
				self.uzi.supported = true
				self.uzi.ads_speed = 0.240
				self.uzi.damage_falloff = {
					start_dist = 1800,
					end_dist = 4000,
					min_mult = 0.5
				}
				self.uzi.stats = {
					damage = 30,
					spread = 58,
					recoil = 81,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 7,
					reload = 20
				}
				self.uzi.stats_modifiers = nil
				self.uzi.panic_suppression_chance = 0.05
				self.uzi.reload_speed_multiplier = 1.1
				self.uzi.timers.reload_not_empty = 1.95
				self.uzi.timers.reload_empty = 3.6
				self.uzi.timers.reload_exit_empty = 0.7
				self.uzi.timers.reload_exit_not_empty = 1.3

	--[[     LIGHT MGs      ]]

		--Microgun (I hate how this is probably one of the more "functional" handheld minigun configurations)
			self.shuno.categories = {
				"minigun",
				"smg"
			}
			self.shuno.has_description = true
			self.shuno.desc_id = "bm_shuno_sc_desc"
			self.shuno.CLIP_AMMO_MAX = 300
			self.shuno.NR_CLIPS_MAX = 1
			self.shuno.AMMO_MAX = 600
			self.shuno.FIRE_MODE = "auto"
			self.shuno.fire_mode_data = {}
			self.shuno.fire_mode_data.fire_rate = 0.03
			self.shuno.CAN_TOGGLE_FIREMODE = false
			self.shuno.kick = self.stat_info.kick_tables.moderate_kick
			self.shuno.panic_suppression_chance = 0.05
			self.shuno.supported = true
			self.shuno.ads_speed = 0.600
			self.shuno.damage_falloff = {
				start_dist = 1800,
				end_dist = 4500,
				min_mult = 0.5
			}
			self.shuno.stats = {
				damage = 20,
				spread = 11,
				recoil = 87,
				spread_moving = 25,
				zoom = 1,
				concealment = 16,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}		
			self.shuno.stats_modifiers = nil
			self.shuno.timers.equip = 2.35
			self.shuno.timers.reload_exit_empty = 5
			self.shuno.timers.reload_exit_not_empty = 5
			self.shuno.sounds.no_fix = true
			self.shuno.sounds.spin_start = "turret_spin_start"
			self.shuno.sounds.spin_end = "turret_spin_stop"

		--Boot (HK416c)
			self.tecci.has_description = true
			self.tecci.desc_id = "bm_w_tecci_desc_sc"
			self.tecci.categories = {
				"lmg",
				"smg"
			}
			self.tecci.kick = self.stat_info.kick_tables.right_recoil
			self.tecci.CLIP_AMMO_MAX = 100
			self.tecci.AMMO_MAX = 360
			self.tecci.fire_mode_data.fire_rate = 0.075
			self.tecci.CAN_TOGGLE_FIREMODE = true
			self.tecci.auto.fire_rate = 0.08
			self.tecci.panic_suppression_chance = 0.05
			self.tecci.supported = true
			self.tecci.ads_speed = 0.440
			self.tecci.damage_falloff = {
				start_dist = 2000,
				end_dist = 6000,
				min_mult = 0.5
			}
			self.tecci.stats = {
				damage = 20,
				spread = 71,
				recoil = 73,
				spread_moving = 5,
				zoom = 1,
				concealment = 23,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.tecci.stats_modifiers = nil
			self.tecci.timers.reload_exit_empty = 0.9
			self.tecci.timers.reload_exit_not_empty = 1.0

		--KSP (M249)
			self.m249.categories = {
				"lmg",
				"smg"
			}
			self.m249.desc_id = "bm_m249_sc_desc"
			self.m249.has_description = true
			self.m249.CLIP_AMMO_MAX = 200
			self.m249.AMMO_MAX = 300
			self.m249.fire_mode_data.fire_rate = 0.08
			self.m249.kick = self.stat_info.kick_tables.even_recoil
			self.m249.supported = true
			self.m249.ads_speed = 0.520
			self.m249.damage_falloff = {
				start_dist = 2500,
				end_dist = 7000,
				min_mult = 0.4166
			}
			self.m249.stats = {
				damage = 24,
				spread = 63,
				recoil = 75,
				spread_moving = 5,
				zoom = 1,
				concealment = 17,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.m249.shell_ejection = "_dmc/effects/shell_lmg_down"
			self.m249.stats_modifiers = nil
			self.m249.timers.equip = 1.2
			self.m249.timers.reload_not_empty = 4.15
			self.m249.timers.reload_exit_empty = 1.2
			self.m249.timers.reload_exit_not_empty = 2.5
			self.m249.panic_suppression_chance = 0.05
			self.m249.reload_speed_multiplier = 0.75
	
		--RPK
			self.rpk.desc_id = "bm_rpk_sc_desc"
			self.rpk.has_description = true		
			self.rpk.categories = {
				"lmg",
				"smg"
			}
			self.rpk.CLIP_AMMO_MAX = 75
			self.rpk.AMMO_MAX = 240
			self.rpk.fire_mode_data.fire_rate = 0.1
			self.rpk.CAN_TOGGLE_FIREMODE = true
			self.rpk.BURST_FIRE = false
			self.rpk.kick = self.stat_info.kick_tables.right_kick
			self.rpk.supported = true
			self.rpk.ads_speed = 0.480
			self.rpk.damage_falloff = {
				start_dist = 3000,
				end_dist = 5300,
				min_mult = 0.6
			}
			self.rpk.stats = {
				damage = 30,
				spread = 77,
				recoil = 77,
				spread_moving = 5,
				zoom = 1,
				concealment = 20,
				suppression = 7,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.rpk.stats_modifiers = nil
			self.rpk.panic_suppression_chance = 0.055
			self.rpk.bipod_req_scope = true
			self.rpk.timers.reload_exit_empty = 1.45
			self.rpk.timers.reload_exit_not_empty = 0.85
			self.rpk.reload_speed_multiplier = 0.95
		
		--Minigun
			self.m134.categories = {
				"minigun",
				"smg"
			}
			self.m134.has_description = true
			self.m134.desc_id = "bm_m134_sc_desc"	
			self.m134.CLIP_AMMO_MAX = 400
			self.m134.NR_CLIPS_MAX = 1
			self.m134.AMMO_MAX = 400
			self.m134.FIRE_MODE = "auto"
			self.m134.fire_mode_data = {}
			self.m134.fire_mode_data.fire_rate = 0.03
			--self.m134.fire_rate_init_count = 20
			--self.m134.fire_rate_init_mult = 2
			--self.m134.fire_rate_init_ramp_up = true
			self.m134.CAN_TOGGLE_FIREMODE = false
			self.m134.reload_speed_multiplier = 0.85
			self.m134.kick = self.stat_info.kick_tables.moderate_kick
			self.m134.panic_suppression_chance = 0.05
			self.m134.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
			self.m134.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
			self.m134.supported = true
			self.m134.ads_speed = 0.660
			self.m134.sprintout_anim_time = 0.8 --for w/e reason the M134's exit sprint animation is twice as long as other guns, this is just here to make the animation smoothly match up with the desired speed (ads_speed)
			self.m134.damage_falloff = {
				start_dist = 2000,
				end_dist = 7100,
				min_mult = 0.6
			}
			self.m134.stats = {
				damage = 30,
				spread = 10,
				recoil = 77,
				spread_moving = 5,
				zoom = 1,
				concealment = 14,
				suppression = 7,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,	
				reload = 20
			}
			self.m134.stats_modifiers = {}
			self.m134.jab_range = 50
			self.m134.timers.reload_empty = 7
			self.m134.timers.reload_not_empty = 7
			self.m134.timers.reload_exit_empty = 2
			self.m134.timers.reload_exit_not_empty = 2
			self.m134.sounds.no_fix = true
			self.m134.sounds.spin_start = "swatturret_spin_start"
			self.m134.sounds.spin_end = "swatturret_spin_stop"

	--[[     HEAVY MGs     ]]

		--PRIMARIES
			--M60
				self.m60.has_description = true
				self.m60.desc_id = "bm_m60_sc_desc"		
				self.m60.categories = {
					"lmg",
					"smg"
				}
				self.m60.CLIP_AMMO_MAX = 75
				self.m60.AMMO_MAX = 120
				self.m60.fire_mode_data.fire_rate = 0.10909090909
				self.m60.kick = self.stat_info.kick_tables.moderate_kick
				self.m60.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.m60.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
				self.m60.supported = true
				self.m60.ads_speed = 0.620
				self.m60.damage_falloff = {
					start_dist = 3200,
					end_dist = 6700,
					min_mult = 0.5
				}
				self.m60.stats = {
					damage = 60,
					spread = 73,
					recoil = 67,
					spread_moving = 5,
					zoom = 1,
					concealment = 17,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.m60.stats_modifiers = nil
				self.m60.panic_suppression_chance = 0.05
				self.m60.reload_speed_multiplier = 0.9
				self.m60.timers.reload_exit_empty = 1.4
				self.m60.timers.reload_not_empty = 4.7
				self.m60.timers.reload_exit_not_empty = 2.8
	
			--KSP 58
				self.par.has_description = true
				self.par.desc_id = "bm_par_sc_desc"				
				self.par.categories = {
					"lmg",
					"smg"
				}
				self.par.CLIP_AMMO_MAX = 50
				self.par.fire_mode_data.fire_rate = 0.096
				self.par.AMMO_MAX = 120
				self.par.timers.reload_not_empty = 6.5
				self.par.timers.reload_empty = 6.5
				self.par.kick = {}
				self.par.kick = self.stat_info.kick_tables.moderate_right_kick
				self.par.panic_suppression_chance = 0.05
				self.par.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.par.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
				self.par.supported = true
				self.par.ads_speed = 0.600
				self.par.damage_falloff = {
					start_dist = 3000,
					end_dist = 6300,
					min_mult = 0.5
				}
				self.par.stats = {
					damage = 60,
					spread = 68,
					recoil = 65,
					spread_moving = 5,
					zoom = 1,
					concealment = 16,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.par.stats_modifiers = nil
				self.par.no_bipod_anims = true
				self.par.timers.reload_not_empty = 6.3
				self.par.timers.reload_empty = 6.3
				self.par.timers.reload_exit_empty = 1.325
				self.par.timers.reload_exit_not_empty = 1.325	
	
			--Buzzsaw (MG42)
				self.mg42.categories = {
					"lmg",
					"smg",
					"wolf_brigade"
				}
				self.mg42.sounds.fire = "mg42_fire"
				self.mg42.sounds.fire_single = "mg42_fire"
				self.mg42.CLIP_AMMO_MAX = 50
				self.mg42.AMMO_MAX = 160
				self.mg42.has_description = true
				self.mg42.desc_id = "bm_wolf_brigade_sc_desc"
				self.mg42.kick = self.stat_info.kick_tables.the_wolf_brigade
				self.mg42.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.mg42.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
				self.mg42.supported = true
				self.mg42.ads_speed = 0.600
				self.mg42.damage_falloff = {
					start_dist = 2800,
					end_dist = 5500,
					min_mult = 0.6666
				}
				self.mg42.stats = {
					damage = 45,
					spread = 65,
					recoil = 63,
					spread_moving = 5,
					zoom = 1,
					concealment = 17,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.mg42.stats_modifiers = nil
				self.mg42.panic_suppression_chance = 0.05
				self.mg42.reload_speed_multiplier = 1
				self.mg42.timers.reload_exit_empty = 1.65
				self.mg42.timers.reload_exit_not_empty = 1.65
	
			--Brenner 21 (HK21)
				self.hk21.categories = {
					"lmg",
					"smg"
				}
				self.hk21.desc_id = "bm_hk21_sc_desc"
				self.hk21.has_description = true
				self.hk21.CLIP_AMMO_MAX = 100
				self.hk21.AMMO_MAX = 160
				self.hk21.fire_mode_data.fire_rate = 0.075
				self.hk21.CAN_TOGGLE_FIREMODE = true
				self.hk21.fake_semi_anims = true
				self.hk21.kick = self.stat_info.kick_tables.right_kick
				self.hk21.panic_suppression_chance = 0.05
				self.hk21.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.hk21.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
				self.hk21.supported = true
				self.hk21.ads_speed = 0.620
				self.hk21.damage_falloff = {
					start_dist = 2300,
					end_dist = 7100,
					min_mult = 0.6666
				}
				self.hk21.stats = {
					damage = 45,
					spread = 66,
					recoil = 71,
					spread_moving = 7,
					zoom = 1,
					concealment = 16,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.hk21.stats_modifiers = nil
				self.hk21.reload_speed_multiplier = 0.9
				self.hk21.bipod_req_scope = true
				self.hk21.animations.ignore_nonemptyreload = true
				self.hk21.timers.reload_not_empty = self.hk21.timers.reload_empty
				self.hk21.timers.reload_exit_empty = 1.3
				self.hk21.timers.reload_exit_not_empty = 1.3
		
			--Versteckt-51 (HK51B)
				--HK21 nerfs have made this more viable as a primary
				self.hk51b.categories = {
					"lmg",
					"smg"
				}
				self.hk51b.desc_id = "bm_hk51b_sc_desc"
				self.hk51b.has_description = true
				self.hk51b.CLIP_AMMO_MAX = 50
				self.hk51b.AMMO_MAX = 160
				self.hk51b.fire_mode_data.fire_rate = 0.063157
				self.hk51b.CAN_TOGGLE_FIREMODE = true
				self.hk51b.BURST_FIRE = 3
				self.hk51b.kick = self.stat_info.kick_tables.right_kick
				self.hk51b.panic_suppression_chance = 0.05
				self.hk51b.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.hk51b.shell_ejection = "effects/payday2/particles/weapons/shells/shell_762_lmg"
				self.hk51b.supported = true
				self.hk51b.ads_speed = 0.480
				self.hk51b.damage_falloff = {
					start_dist = 1100,
					end_dist = 5200,
					min_mult = 0.6666
				}
				self.hk51b.stats = {
					damage = 45,
					spread = 60,
					recoil = 67,
					spread_moving = 7,
					zoom = 1,
					concealment = 20,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.hk51b.stats_modifiers = nil
				self.hk51b.timers.reload_empty = 3.3
				self.hk51b.timers.reload_not_empty = 3
				self.hk51b.timers.reload_exit_empty = 0.8
				self.hk51b.timers.reload_exit_not_empty = 0.5
				self.hk51b.reload_speed_multiplier = 0.85

		--EMPLACEMENTS

			--M2HB
				self.ranc_heavy_machine_gun.categories = {
					"lmg",
					"smg"
				}
				self.ranc_heavy_machine_gun.upgrade_blocks = nil
				self.ranc_heavy_machine_gun.CLIP_AMMO_MAX  = 100
				self.ranc_heavy_machine_gun.AMMO_MAX = 100
				self.ranc_heavy_machine_gun.fire_mode_data.fire_rate = 0.1
				self.ranc_heavy_machine_gun.kick = self.stat_info.kick_tables.kick_m2
				self.ranc_heavy_machine_gun.supported = true
				self.ranc_heavy_machine_gun.ads_speed = 0.600
				self.ranc_heavy_machine_gun.damage_falloff = {
					start_dist = 3000,
					end_dist = 7500,
					min_mult = 0.75
				}
				self.ranc_heavy_machine_gun.stats = {
					damage = 120,
					spread = 81,
					recoil = 81,
					spread_moving = 8,
					zoom = 1,
					concealment = 20,
					suppression = 3,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.ranc_heavy_machine_gun.stats_modifiers = nil
				self.ranc_heavy_machine_gun.armor_piercing_chance = 1
				self.ranc_heavy_machine_gun.can_shoot_through_enemy = true
				self.ranc_heavy_machine_gun.can_shoot_through_shield = true
				self.ranc_heavy_machine_gun.can_shoot_through_wall = true
				self.ranc_heavy_machine_gun.can_shoot_through_titan_shield = true



	--[[     LIGHT ARs     ]]

		--PRIMARIES
	
			--AMCAR (M733)
				self.amcar.desc_id = "bm_amcar_sc_desc"
				self.amcar.has_description = true
				self.amcar.CLIP_AMMO_MAX = 30
				self.amcar.AMMO_MAX = 180
				self.amcar.fire_mode_data.fire_rate = 0.075
				self.amcar.kick = self.stat_info.kick_tables.even_recoil
				self.amcar.supported = true
				self.amcar.ads_speed = 0.320
				self.amcar.damage_falloff = {
					start_dist = 2100,
					end_dist = 6000,
					min_mult = 0.5
				}
				self.amcar.stats = {
					damage = 20,
					spread = 75,
					recoil = 83,
					spread_moving = 6,
					zoom = 1,
					concealment = 24,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.amcar.stats_modifiers = nil
				self.amcar.timers.reload_not_empty = 2.1
				self.amcar.timers.reload_empty = 2.85
				self.amcar.timers.reload_exit_empty = 0.4
				self.amcar.timers.reload_exit_not_empty = 0.5
				if SystemFS:exists("assets/mod_overrides/AR15 Overhaul") then
					self.amcar.timers.reload_exit_empty = 1
					self.amcar.timers.reload_exit_not_empty = 1
				end
				self.amcar.reload_speed_multiplier = 0.975
				self.amcar.panic_suppression_chance = 0.05
			
			--Commando 553
				self.s552.desc_id = "bm_s552_sc_desc"
				self.s552.has_description = true					
				self.s552.fire_mode_data.fire_rate = 0.08571428571
				self.s552.auto.fire_rate = 0.08571428571
				self.s552.BURST_FIRE = 3
				self.s552.ADAPTIVE_BURST_SIZE = false															
				self.s552.kick = self.stat_info.kick_tables.moderate_kick
				self.s552.AMMO_MAX = 180
				self.s552.supported = true
				self.s552.ads_speed = 0.300
				self.s552.damage_falloff = {
					start_dist = 3300,
					end_dist = 8000,
					min_mult = 0.6
				}
				self.s552.stats = {
					damage = 20,
					spread = 86,
					recoil = 83,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.s552.stats_modifiers = nil
				self.s552.reload_speed_multiplier = 1
				if SystemFS:exists("assets/mod_overrides/Classic Weapon Animations") then
					self.s552.timers.reload_not_empty = 2.5
					self.s552.timers.reload_empty = 3.45
					self.s552.reload_speed_multiplier = 1.46
				else
					self.s552.timers.reload_not_empty = 1.7
					self.s552.timers.reload_empty = 2.35					
				end
				self.s552.reload_speed_multiplier = self.s552.reload_speed_multiplier * 0.9
				self.s552.timers.reload_exit_empty = 0.55
				self.s552.timers.reload_exit_not_empty = 0.75
				self.s552.panic_suppression_chance = 0.05

			--JP36
				self.g36.desc_id = "bm_g36_sc_desc"
				self.g36.has_description = true				
				self.g36.BURST_FIRE = 3
				self.g36.ADAPTIVE_BURST_SIZE = false																	
				self.g36.auto.fire_rate = 0.08
				self.g36.fire_mode_data.fire_rate = 0.08
				self.g36.AMMO_MAX = 180
				self.g36.CLIP_AMMO_MAX = 30
				self.g36.kick = self.stat_info.kick_tables.even_recoil
				self.g36.supported = true
				self.g36.ads_speed = 0.300
				self.g36.damage_falloff = {
					start_dist = 2800,
					end_dist = 6300,
					min_mult = 0.5
				}
				self.g36.stats = {
					damage = 20,
					spread = 79,
					recoil = 87,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.g36.stats_modifiers = nil
				self.g36.reload_speed_multiplier = 1.2
				self.g36.timers.reload_exit_empty = 0.7
				self.g36.timers.reload_not_empty = 2.3
				self.g36.timers.reload_exit_not_empty = 1.2
				self.g36.panic_suppression_chance = 0.05

			--Lion's Roar
				self.vhs.desc_id = "bm_vhs_sc_desc"
				self.vhs.has_description = true					
				self.vhs.CLIP_AMMO_MAX = 30
				self.vhs.AMMO_MAX = 180
				self.vhs.fire_mode_data.fire_rate = 0.070588235
				self.vhs.CAN_TOGGLE_FIREMODE = true
				self.vhs.kick = self.stat_info.kick_tables.moderate_kick
				self.vhs.supported = true
				self.vhs.ads_speed = 0.300
				self.vhs.damage_falloff = {
					start_dist = 3000,
					end_dist = 7000,
					min_mult = 0.5
				}
				self.vhs.stats = {
					damage = 20,
					spread = 89,
					recoil = 85,
					spread_moving = 6,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.vhs.stats_modifiers = nil
				self.vhs.panic_suppression_chance = 0.05
				self.vhs.reload_speed_multiplier = 1.2
				self.vhs.timers.reload_empty = 4.6
				self.vhs.timers.reload_exit_empty = 0.75
				self.vhs.timers.reload_exit_not_empty = 1

			--CAR 4
				self.new_m4.desc_id = "bm_m4_sc_desc"
				self.new_m4.has_description = true
				self.new_m4.CLIP_AMMO_MAX = 30
				self.new_m4.AMMO_MAX = 150
				self.new_m4.fire_mode_data.fire_rate = 0.08
				self.new_m4.kick = self.stat_info.kick_tables.moderate_kick
				self.new_m4.supported = true
				self.new_m4.ads_speed = 0.340
				self.new_m4.damage_falloff = {
					start_dist = 2200,
					end_dist = 6200,
					min_mult = 0.4166
				}
				self.new_m4.stats = {
					damage = 24,
					spread = 81,
					recoil = 83,
					spread_moving = 6,
					zoom = 1,
					concealment = 24,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.new_m4.stats_modifiers = nil
				self.new_m4.reload_speed_multiplier = 1
				if SystemFS:exists("assets/mod_overrides/AR15 Overhaul") then
					self.new_m4.timers.reload_not_empty = 1.6
					self.new_m4.timers.reload_empty = 2.3
					self.new_m4.timers.reload_exit_empty = 0.88
					self.new_m4.timers.reload_exit_not_empty = 0.7
					self.new_m4.reload_speed_multiplier = 0.7455
				else
					self.new_m4.timers.reload_not_empty = 2.5
					self.new_m4.timers.reload_empty = 3.43
					self.new_m4.timers.reload_exit_empty = 1
					self.new_m4.timers.reload_exit_not_empty = 0.95
					self.new_m4.reload_speed_multiplier = 1.05
				end
				self.new_m4.reload_speed_multiplier = self.new_m4.reload_speed_multiplier * 1.02
				self.new_m4.panic_suppression_chance = 0.05

			--Ak5
				self.ak5.desc_id = "bm_ak5_sc_desc"
				self.ak5.has_description = true
				self.ak5.fire_mode_data.fire_rate = 0.0857142
				self.ak5.kick = self.stat_info.kick_tables.moderate_right_kick
				if math.random() <= 0.05 then
					--The 5 in ak5 stands for
					self.ak5.shell_ejection = "effects/payday2/particles/weapons/shells/shell_shak"
				end
				self.ak5.supported = true
				self.ak5.ads_speed = 0.320
				self.ak5.damage_falloff = {
					start_dist = 2400,
					end_dist = 6600,
					min_mult = 0.4166
				}
				self.ak5.stats = {
					damage = 24,
					spread = 81,
					recoil = 87,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ak5.stats_modifiers = nil
				self.ak5.timers.reload_empty = 3.15
				self.ak5.timers.reload_exit_empty = 1.00
				self.ak5.timers.reload_exit_not_empty = 0.95
				self.ak5.panic_suppression_chance = 0.05
				self.ak5.reload_speed_multiplier = 1.05

			--Union 5.56
				self.corgi.desc_id = "bm_corgi_sc_desc"
				self.corgi.has_description = true			
				self.corgi.CLIP_AMMO_MAX = 30
				self.corgi.AMMO_MAX = 150
				self.corgi.fire_mode_data.fire_rate = 0.07058823529
				self.corgi.CAN_TOGGLE_FIREMODE = true
				self.corgi.kick = self.stat_info.kick_tables.moderate_kick
				self.corgi.supported = true
				self.corgi.ads_speed = 0.300
				self.corgi.damage_falloff = {
					start_dist = 2500,
					end_dist = 6800,
					min_mult = 0.4166
				}
				self.corgi.stats = {
					damage = 24,
					spread = 84,
					recoil = 77,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.corgi.stats_modifiers = nil
				self.corgi.panic_suppression_chance = 0.05
				self.corgi.timers.reload_exit_empty = 0.6
				self.corgi.timers.reload_exit_not_empty = 0.75
				self.corgi.reload_speed_multiplier = 0.85

			--UAR (AUG)
				self.aug.desc_id = "bm_aug_sc_desc"
				self.aug.has_description = true					
				self.aug.AMMO_MAX = 150
				self.aug.CLIP_AMMO_MAX = 30
				self.aug.fire_mode_data.fire_rate = 0.08333
				self.aug.kick = self.stat_info.kick_tables.moderate_kick
				self.aug.supported = true
				self.aug.ads_speed = 0.300
				self.aug.damage_falloff = {
					start_dist = 3000,
					end_dist = 7000,
					min_mult = 0.4166
				}
				self.aug.stats = {
					damage = 24,
					spread = 88,
					recoil = 81,
					spread_moving = 6,
					zoom = 1,
					concealment = 26,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.aug.stats_modifiers = nil
				self.aug.timers.reload_exit_empty = 1.05
				self.aug.timers.reload_exit_not_empty = 1.7
				self.aug.panic_suppression_chance = 0.05
				self.aug.reload_speed_multiplier = 0.975

			--Ak17
				self.flint.desc_id = "bm_flint_sc_desc"
				self.flint.has_description = true				
				self.flint.AMMO_MAX = 150
				self.flint.CLIP_AMMO_MAX = 30
				self.flint.BURST_FIRE = 2
				self.flint.BURST_DELAY = 0.06
				self.flint.ADAPTIVE_BURST_SIZE = false									
				self.flint.fire_mode_data.fire_rate = 0.08571428571
				self.flint.kick = self.stat_info.kick_tables.moderate_right_kick
				self.flint.supported = true
				self.flint.ads_speed = 0.340
				self.flint.damage_falloff = {
					start_dist = 3000,
					end_dist = 5000,
					min_mult = 0.5
				}
				self.flint.stats = {
					damage = 24,
					spread = 81,
					recoil = 83,
					spread_moving = 6,
					zoom = 1,
					concealment = 24,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.flint.stats_modifiers = nil
				self.flint.panic_suppression_chance = 0.05
				self.flint.timers.reload_exit_empty = 0.55
				self.flint.timers.reload_not_empty = 2.2
				self.flint.timers.reload_exit_not_empty = 0.75

			--AK
				self.ak74.desc_id = "bm_ak74_sc_desc"
				self.ak74.has_description = true					
				self.ak74.AMMO_MAX = 150
				self.ak74.fire_mode_data.fire_rate = 0.0923076923
				self.ak74.kick = self.stat_info.kick_tables.right_recoil
				self.ak74.supported = true
				self.ak74.ads_speed = 0.320
				self.ak74.damage_falloff = {
					start_dist = 3300,
					end_dist = 5200,
					min_mult = 0.5
				}
				self.ak74.stats = {
					damage = 24,
					spread = 80,
					recoil = 81,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ak74.stats_modifiers = nil
				self.ak74.panic_suppression_chance = 0.05
				self.ak74.reload_speed_multiplier = 1.15
				self.ak74.timers.reload_exit_empty = 0.55
				self.ak74.timers.reload_exit_not_empty = 0.9

		--SECONDARIES

			--Para
				self.olympic.desc_id = "bm_menu_sc_olympic_desc"
				self.olympic.has_description = true		
				self.olympic.categories = {
					"assault_rifle"
				}
				self.olympic.CLIP_AMMO_MAX = 30
				self.olympic.AMMO_MAX = 90
				self.olympic.fire_mode_data.fire_rate = 0.075
				self.olympic.auto.fire_rate = 0.075
				self.olympic.panic_suppression_chance = 0.05
				self.olympic.kick = self.stat_info.kick_tables.even_recoil
				self.olympic.supported = true
				self.olympic.ads_speed = 0.280
				self.olympic.damage_falloff = {
					start_dist = 2000,
					end_dist = 5700,
					min_mult = 0.5
				}
				self.olympic.stats = {
					damage = 20,
					spread = 73,
					recoil = 83,
					spread_moving = 8,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.olympic.stats_modifiers = nil
				self.olympic.timers.reload_exit_empty = 0.8
				self.olympic.timers.reload_exit_not_empty = 0.85

			--Clarion (IS THAT A DEAGLE)
				self.famas.desc_id = "bm_menu_sc_famas_desc"
				self.famas.has_description = true					
				self.famas.use_data.selection_index = 1
				self.famas.AMMO_MAX = 90
				self.famas.CLIP_AMMO_MAX = 25
				self.famas.fire_mode_data.fire_rate = 0.0545454
				self.famas.CAN_TOGGLE_FIREMODE = true
				self.famas.auto = {}
				self.famas.auto.fire_rate = 0.06
				self.famas.kick = self.stat_info.kick_tables.vertical_kick
				self.famas.supported = true
				self.famas.ads_speed = 0.300
				self.famas.damage_falloff = {
					start_dist = 2800,
					end_dist = 6500,
					min_mult = 0.5
				}
				self.famas.stats = {
					damage = 20,
					spread = 85,
					recoil = 81,
					spread_moving = 4,
					zoom = 1,
					concealment = 28,
					suppression = 10,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.famas.stats_modifiers = nil
				self.famas.timers.reload_not_empty = 2.6
				self.famas.timers.reload_exit_empty = 0.4
				self.famas.timers.reload_exit_not_empty = 0.55
				self.famas.panic_suppression_chance = 0.05
				self.famas.BURST_FIRE = 3
				self.famas.ADAPTIVE_BURST_SIZE = false
				self.famas.reload_speed_multiplier = 1.1

			--Tempest 21
				self.komodo.use_data.selection_index = 1
				self.komodo.desc_id = "bm_menu_sc_komodo_desc"
				self.komodo.has_description = true		
				self.komodo.categories = {
					"assault_rifle"
				}
				self.komodo.CLIP_AMMO_MAX = 30
				self.komodo.AMMO_MAX = 75
				self.komodo.fire_mode_data.fire_rate = 0.08
				self.komodo.panic_suppression_chance = 0.05
				self.komodo.kick = self.stat_info.kick_tables.moderate_kick	
				self.komodo.supported = true
				self.komodo.ads_speed = 0.300
				self.komodo.damage_falloff = {
					start_dist = 2200,
					end_dist = 6000,
					min_mult = 0.5
				}
				self.komodo.stats = {
					damage = 24,
					spread = 81,
					recoil = 77,
					spread_moving = 8,
					zoom = 1,
					concealment = 27,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}	
				self.komodo.stats_modifiers = nil
				self.komodo.timers.reload_empty = 2.82
				self.komodo.timers.reload_exit_empty = 0.7
				self.komodo.timers.reload_not_empty = 2.10
				self.komodo.timers.reload_exit_not_empty = 0.8
				self.komodo.reload_speed_multiplier = 0.82

			--CR 805
				self.hajk.desc_id = "bm_menu_sc_hajk_desc"
				self.hajk.has_description = true				
				self.hajk.fire_mode_data.fire_rate = 0.085714285
				self.hajk.AMMO_MAX = 75
				self.hajk.BURST_FIRE = 2
				self.hajk.ADAPTIVE_BURST_SIZE = false											
				self.hajk.kick = self.stat_info.kick_tables.moderate_kick
				self.hajk.categories = {
					"assault_rifle"
				}
				self.hajk.panic_suppression_chance = 0.05
				self.hajk.supported = true
				self.hajk.ads_speed = 0.340
				self.hajk.damage_falloff = {
					start_dist = 2500,
					end_dist = 6800,
					min_mult = 0.5
				}
				self.hajk.stats = {
					damage = 24,
					spread = 81,
					recoil = 85,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.hajk.stats_modifiers = nil
				self.hajk.timers.reload_not_empty = 1.9 
				self.hajk.timers.reload_empty = 3.4	
				self.hajk.timers.reload_exit_empty = 0.35
				self.hajk.timers.reload_exit_not_empty = 0.65

	--[[     HEAVY ARs     ]]

		--PRIMARIES

			--AMR-16
				self.m16.desc_id = "bm_m16_sc_desc"
				self.m16.has_description = true
				self.m16.fire_mode_data.fire_rate = 0.08571428571
				self.m16.CLIP_AMMO_MAX = 30
				self.m16.AMMO_MAX = 120
				self.m16.FIRE_MODE = "auto"				
				self.m16.CAN_TOGGLE_FIREMODE = true
				self.m16.kick = self.stat_info.kick_tables.moderate_kick		
				self.m16.supported = true
				self.m16.ads_speed = 0.360
				self.m16.damage_falloff = {
					start_dist = 2200,
					end_dist = 6200,
					min_mult = 0.3333
				}
				self.m16.stats = {
					damage = 30,
					spread = 83,
					recoil = 85,
					spread_moving = 5,
					zoom = 1,
					concealment = 21,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.m16.stats_modifiers = nil
				self.m16.panic_suppression_chance = 0.05
				self.m16.reload_speed_multiplier = 1.12
				self.m16.timers.reload_exit_empty = 0.7
				self.m16.timers.reload_exit_not_empty = 0.95

			--Queen's Wrath
				self.l85a2.desc_id = "bm_l85a2_sc_desc"
				self.l85a2.has_description = true
				self.l85a2.CLIP_AMMO_MAX = 30
				self.l85a2.AMMO_MAX = 120
				self.l85a2.FIRE_MODE = "auto"
				self.l85a2.fire_mode_data = {}
				self.l85a2.fire_mode_data.fire_rate = 0.096
				self.l85a2.sounds.enter_steelsight = "lmg_steelsight_enter"
				self.l85a2.sounds.leave_steelsight = "lmg_steelsight_exit"
				self.l85a2.CAN_TOGGLE_FIREMODE = true
				self.l85a2.kick = {}
				self.l85a2.kick = self.stat_info.kick_tables.moderate_kick
				self.l85a2.supported = true
				self.l85a2.ads_speed = 0.420
				self.l85a2.damage_falloff = {
					start_dist = 3200,
					end_dist = 7800,
					min_mult = 0.3333
				}	
				self.l85a2.stats = {
					damage = 30,
					spread = 91,
					recoil = 91,
					spread_moving = 6,
					zoom = 1,
					concealment = 19,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.l85a2.stats_modifiers = nil
				self.l85a2.timers.reload_not_empty = 3
				self.l85a2.timers.reload_empty = 4	
				self.l85a2.timers.reload_exit_empty = 0.75
				self.l85a2.timers.reload_exit_not_empty = 1.05
				self.l85a2.panic_suppression_chance = 0.05

			--Akimbo Krinkov
				self.x_akmsu.desc_id = "bm_x_akmsu_sc_desc"
				self.x_akmsu.has_description = true		
				self.x_akmsu.sounds.fire = "akm_fire_single"
				self.x_akmsu.sounds.fire_single = "akm_fire_single"
				self.x_akmsu.sounds.fire_auto = "akm_fire"
				self.x_akmsu.sounds.stop_fire = "akm_stop"
				self.x_akmsu.sounds.dryfire = "primary_dryfire"	
				self.x_akmsu.AMMO_MAX = 120
				self.x_akmsu.fire_mode_data.fire_rate = 0.0923076923
				self.x_akmsu.panic_suppression_chance = 0.05
				self.x_akmsu.kick = self.stat_info.kick_tables.right_kick
				self.x_akmsu.supported = true
				self.x_akmsu.ads_speed = 0.320
				self.x_akmsu.damage_falloff = {
					start_dist = 2500,
					end_dist = 4200,
					min_mult = 0.6
				}
				self.x_akmsu.stats = {
					damage = 30,
					spread = 63,
					recoil = 63,
					spread_moving = 9,
					zoom = 1,
					concealment = 27,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_akmsu.stats_modifiers = nil
				self.x_akmsu.reload_speed_multiplier = 0.75
				self.x_akmsu.timers.reload_not_empty = 2.1
				self.x_akmsu.timers.reload_exit_not_empty = 1.5
				self.x_akmsu.timers.reload_empty = 3
				self.x_akmsu.timers.reload_exit_empty = 0.9

			--AK.762
				self.akm.desc_id = "bm_akm_sc_desc"
				self.akm.has_description = true
				self.akm.AMMO_MAX = 120
				self.akm.fire_mode_data.fire_rate = 0.1
				self.akm.auto.fire_rate = 0.1
				self.akm.kick = self.stat_info.kick_tables.moderate_right_kick		
				self.akm.supported = true
				self.akm.ads_speed = 0.340
				self.akm.damage_falloff = {
					start_dist = 2800,
					end_dist = 5000,
					min_mult = 0.6
				}
				self.akm.stats = {
					damage = 30,
					spread = 77,
					recoil = 73,
					spread_moving = 6,
					zoom = 1,
					concealment = 26,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.akm.stats_modifiers = nil
				self.akm.timers.reload_exit_empty = 0.8
				self.akm.timers.reload_exit_not_empty = 0.95
				self.akm.timers.reload_not_empty = 2.2
				self.akm.reload_speed_multiplier = 1.17
				self.akm.panic_suppression_chance = 0.05
				--Gold AK
				self.akm_gold.bmp = 1000
				self.akm_gold.desc_id = "bm_akm_gold_sc_desc"
				self.akm_gold.has_description = true
				self.akm_gold.kick = self.stat_info.kick_tables.moderate_right_kick			
				self.akm_gold.AMMO_MAX = 120
				self.akm_gold.fire_mode_data.fire_rate = 0.1
				self.akm_gold.auto.fire_rate = 0.1
				self.akm_gold.timers.reload_exit_empty = 0.8
				self.akm_gold.timers.reload_exit_not_empty = 0.95
				self.akm_gold.timers.reload_not_empty = 2.2
				self.akm_gold.reload_speed_multiplier = 1.17
				self.akm_gold.supported = true
				self.akm_gold.ads_speed = 0.380
				self.akm_gold.damage_falloff = {
					start_dist = 2800,
					end_dist = 5000,
					min_mult = 0.6
				}
				self.akm_gold.stats = {
					damage = 30,
					spread = 77,
					recoil = 75,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.akm_gold.stats_modifiers = nil
				self.akm_gold.panic_suppression_chance = 0.05

			--Byk-1 (OTs-14)
				self.groza.desc_id = "bm_groza_sc_desc"
				self.groza.has_description = true
				self.groza.AMMO_MAX = 90
				self.groza.CLIP_AMMO_MAX = 30
				self.groza.tactical_reload = 1
				self.groza.FIRE_MODE = "auto"
				self.groza.fire_mode_data.fire_rate = 0.08571428571
				self.groza.CAN_TOGGLE_FIREMODE = true
				self.groza.auto.fire_rate = 0.08571428571
				self.groza.panic_suppression_chance = 0.05
				self.groza.kick = self.stat_info.kick_tables.moderate_right_kick
				self.groza.supported = true
				self.groza.ads_speed = 0.360
				self.groza.damage_falloff = {
					start_dist = 2100,
					end_dist = 4800,
					min_mult = 0.6
				}
				self.groza.stats = {
					damage = 30,
					spread = 82,
					recoil = 75,
					spread_moving = 5,
					zoom = 1,
					concealment = 19,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.groza.stats_modifiers = nil
				self.groza.reload_speed_multiplier = 1
				if SystemFS:exists("assets/mod_overrides/Groza Animation Overhaul") then
					self.groza.timers.reload_not_empty = 1.95
					self.groza.timers.reload_empty = 2.75
					self.groza.timers.reload_exit_empty = 0.75
					self.groza.timers.reload_exit_not_empty = 0.7
					self.groza.reload_speed_multiplier = 0.95
					self.groza_underbarrel.timers.reload_not_empty = 1.2
					self.groza_underbarrel.timers.reload_empty = 1.2
					self.groza_underbarrel.timers.reload_exit_empty = 0.7
					self.groza_underbarrel.timers.reload_exit_not_empty = 0.7
				else
					self.groza.timers.reload_exit_empty = 0.55
					self.groza.timers.reload_exit_not_empty = 0.65
					self.groza_underbarrel.timers.reload_not_empty = 0.85
					self.groza_underbarrel.timers.reload_empty = 0.85
					self.groza_underbarrel.timers.reload_exit_empty = 0.65
					self.groza_underbarrel.timers.reload_exit_not_empty = 0.65
					self.groza_underbarrel.reload_speed_multiplier = 0.66666
				end
				self.groza.reload_speed_multiplier = self.groza.reload_speed_multiplier * 0.86
				self.groza_underbarrel.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.groza_underbarrel.fire_mode_data.fire_rate = 1.2
				self.groza_underbarrel.kick = self.stat_info.kick_tables.moderate_kick
				self.groza_underbarrel.panic_suppression_chance = 0.05
				self.groza_underbarrel.ignore_damage_upgrades = true
				self.groza_underbarrel.sms = 0.85
				self.groza_underbarrel.AMMO_MAX = 6
				self.groza_underbarrel.supported = true
				self.groza_underbarrel.ads_speed = 0.360
				self.groza_underbarrel.stats = {
					damage = 40,
					spread = 61,
					recoil = 51,
					spread_moving = 5,
					zoom = 1,
					concealment = 18,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.groza_underbarrel.stats_modifiers = {damage = 10}

		--SECONDARIES

			--Krinkov
				self.akmsu.categories = {
					"assault_rifle"
				}
				self.akmsu.AMMO_MAX = 60
				self.akmsu.has_description = true
				self.akmsu.desc_id = "bm_akmsu_sc_desc"
				self.akmsu.fire_mode_data.fire_rate = 0.0923076923
				self.akmsu.auto.fire_rate = 0.0923076923
				self.akmsu.panic_suppression_chance = 0.05
				self.akmsu.kick = self.stat_info.kick_tables.moderate_right_kick	
				self.akmsu.supported = true
				self.akmsu.ads_speed = 0.320
				self.akmsu.damage_falloff = {
					start_dist = 2500,
					end_dist = 4200,
					min_mult = 0.6
				}
				self.akmsu.stats = {
					damage = 30,
					spread = 73,
					recoil = 73,
					spread_moving = 9,
					zoom = 1,
					concealment = 27,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.akmsu.stats_modifiers = nil
				self.akmsu.timers.reload_not_empty = 1.95 
				self.akmsu.timers.reload_empty = 3.7
				self.akmsu.timers.reload_exit_empty = 0.75
				self.akmsu.timers.reload_exit_not_empty = 0.77
				self.akmsu.reload_speed_multiplier = 1.11

	--[[     DMRs     ]]

		--PRIMARIES

			--Valkyria (AS Val)
				self.asval.desc_id = "bm_asval_sc_desc"
				self.asval.has_description = true
				self.asval.sounds.fire = "akm_fire"
				self.asval.sounds.fire_single = "akm_fire_single"
				self.asval.sounds.fire_auto = "akm_fire"
				self.asval.sounds.stop_fire = "akm_stop"
				self.asval.sounds.dryfire = "primary_dryfire"
				self.asval.AMMO_MAX = 80
				self.asval.CLIP_AMMO_MAX = 20
				self.asval.FIRE_MODE = "auto"
				self.asval.fire_mode_data = {}
				self.asval.fire_mode_data.fire_rate = 0.06666666666
				self.asval.CAN_TOGGLE_FIREMODE = true
				self.asval.kick = self.stat_info.kick_tables.moderate_kick
				self.asval.supported = true
				self.asval.ads_speed = 0.340
				self.asval.damage_falloff = {
					start_dist = 900,
					end_dist = 4800,
					min_mult = 0.44444
				}
				self.asval.stats = {
					damage = 45,
					spread = 80,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 24,
					suppression = 20,
					alert_size = 1,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.asval.stats_modifiers = nil
				self.asval.can_shoot_through_enemy = true
				self.asval.panic_suppression_chance = 0.05
				self.asval.timers.reload_exit_empty = 0.65
				self.asval.timers.reload_exit_not_empty = 0.85
				self.asval.reload_speed_multiplier = 1.08

			--Eagle Heavy
				self.scar.desc_id = "bm_scar_sc_desc"
				self.scar.has_description = true		
				self.scar.AMMO_MAX = 80
				self.scar.CLIP_AMMO_MAX = 20
				self.scar.fire_mode_data.fire_rate = 0.1
				self.scar.CAN_TOGGLE_FIREMODE = true
				self.scar.FIRE_MODE = "auto"
				self.scar.auto.fire_rate = 0.1
				self.scar.kick = self.stat_info.kick_tables.moderate_right_kick		
				self.scar.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.scar.supported = true
				self.scar.ads_speed = 0.380
				self.scar.damage_falloff = {
					start_dist = 3200,
					end_dist = 7000,
					min_mult = 0.6666
				}
				self.scar.stats = {
					damage = 45,
					spread = 86,
					recoil = 69,
					spread_moving = 5,
					zoom = 1,
					concealment = 21,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.scar.stats_modifiers = nil
				self.scar.panic_suppression_chance = 0.05
				self.scar.can_shoot_through_enemy = true
				self.scar.timers.reload_exit_empty = 0.7
				self.scar.timers.reload_not_empty = 1.75
				self.scar.timers.reload_exit_not_empty = 1.3
		
			--Gecko 7.62 (Galil ARM 7.62)
				self.galil.has_description = true
				self.galil.desc_id = "bm_galil_sc_desc"
				self.galil.AMMO_MAX = 80
				self.galil.CLIP_AMMO_MAX = 25
				self.galil.FIRE_MODE = "auto"
				self.galil.fire_mode_data = {}
				self.galil.fire_mode_data.fire_rate = 0.09230769230
				self.galil.CAN_TOGGLE_FIREMODE = true
				self.galil.auto = {}
				self.galil.auto.fire_rate = 0.09230769230
				self.galil.kick = self.stat_info.kick_tables.moderate_kick	
				self.galil.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.galil.supported = true
				self.galil.ads_speed = 0.400
				self.galil.damage_falloff = {
					start_dist = 3000,
					end_dist = 6600,
					min_mult = 0.6666
				}
				self.galil.stats = {
					damage = 45,
					spread = 81,
					recoil = 65,
					spread_moving = 6,
					zoom = 1,
					concealment = 23,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.galil.stats_modifiers = nil
				self.galil.panic_suppression_chance = 0.05
				self.galil.can_shoot_through_enemy = true
				self.galil.timers.reload_empty = 3.9
				self.galil.timers.reload_exit_empty = 0.325
				self.galil.timers.reload_not_empty = 2.7
				self.galil.timers.reload_exit_not_empty = 0.75
				self.galil.reload_speed_multiplier = 1.1

			--Falcon (FAL)
				self.fal.AMMO_MAX = 80
				self.fal.has_description = true
				self.fal.desc_id = "bm_fal_sc_desc"
				self.fal.CLIP_AMMO_MAX = 30
				self.fal.fire_mode_data.fire_rate = 0.0923076923
				self.fal.CAN_TOGGLE_FIREMODE = true
				self.fal.FIRE_MODE = "auto"
				self.fal.auto = {}
				self.fal.auto.fire_rate = 0.0923076923
				self.fal.kick = self.stat_info.kick_tables.moderate_right_kick
				self.fal.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.fal.supported = true
				self.fal.ads_speed = 0.400
				self.fal.damage_falloff = {
					start_dist = 3500,
					end_dist = 7200,
					min_mult = 0.6666
				}
				self.fal.stats = {
					damage = 45,
					spread = 83,
					recoil = 67,
					spread_moving = 5,
					zoom = 1,
					concealment = 20,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.fal.stats_modifiers = nil
				self.fal.panic_suppression_chance = 0.05
				self.fal.can_shoot_through_enemy = true
				self.fal.timers.reload_exit_empty = 0.75
				self.fal.timers.reload_exit_not_empty = 0.75

			--Little Friend Rifle (HK417)
				self.contraband.desc_id = "bm_m203_weapon_sc_desc"
				self.contraband.has_description = true
				self.contraband.AMMO_MAX = 60
				self.contraband.tactical_reload = 1
				self.contraband.FIRE_MODE = "auto"
				self.contraband.fire_mode_data.fire_rate = 0.1
				self.contraband.CAN_TOGGLE_FIREMODE = true
				self.contraband.kick = self.stat_info.kick_tables.moderate_kick
				self.contraband.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.contraband.supported = true
				self.contraband.ads_speed = 0.440
				self.contraband.damage_falloff = {
					start_dist = 2200,
					end_dist = 6200,
					min_mult = 0.6666
				}	
				self.contraband.stats = {
					damage = 45,
					spread = 84,
					recoil = 65,
					spread_moving = 5,
					zoom = 1,
					concealment = 18,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.contraband.stats_modifiers = nil
				self.contraband.panic_suppression_chance = 0.05
				self.contraband.can_shoot_through_enemy = true
				self.contraband.timers.reload_exit_empty = 0.725
				self.contraband.timers.reload_exit_not_empty = 0.8
				self.contraband_m203.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.contraband_m203.fire_mode_data.fire_rate = 1.2
				self.contraband_m203.kick = self.stat_info.kick_tables.vertical_kick
				self.contraband_m203.panic_suppression_chance = 0.05
				self.contraband_m203.ignore_damage_upgrades = true
				self.contraband_m203.AMMO_MAX = 6
				self.contraband_m203.supported = true
				self.contraband_m203.ads_speed = 0.440
				self.contraband_m203.stats = {
					damage = 80,
					spread = 64,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 18,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.contraband_m203.stats_modifiers = {damage = 10}
				self.contraband_m203.sms = 0.85
				self.contraband_m203.timers.reload_exit_empty = 0.4
				self.contraband_m203.timers.reload_exit_not_empty = 0.4
			
			--KS12 Urban (ShAK-12/ASh-12.7)
				self.shak12.desc_id = "bm_shak12_sc_desc"
				self.shak12.has_description = true			
				self.shak12.tactical_reload = 1	
				self.shak12.CLIP_AMMO_MAX = 20
				self.shak12.AMMO_MAX = 60
				self.shak12.FIRE_MODE = "single"
				self.shak12.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.shak12.fire_mode_data.fire_rate = 0.12
				self.shak12.fire_rate_multiplier = 1.5
				self.shak12.kick = self.stat_info.kick_tables.even_recoil
				--if restoration.Options:GetValue("OTHER/ComboSounds") then
					self.shak12.sounds.fire2 = "mp5_fire_single"
				--end
				self.shak12.supported = true
				self.shak12.ads_speed = 0.380
				self.shak12.damage_falloff = {
					start_dist = 1800,
					end_dist = 5800,
					min_mult = 0.5
				}
				self.shak12.stats = {
					damage = 60,
					spread = 80,
					recoil = 63,
					spread_moving = 5,
					zoom = 1,
					concealment = 22,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.shak12.stats_modifiers = nil
				self.shak12.reload_speed_multiplier = 0.85
				self.shak12.can_shoot_through_enemy = true
				self.shak12.can_shoot_through_wall = true
				self.shak12.panic_suppression_chance = 0.05	
				self.shak12.timers.reload_empty = 2.75
				self.shak12.timers.reload_exit_empty = 0.65
				self.shak12.timers.reload_not_empty = 1.8
				self.shak12.timers.reload_exit_not_empty = 0.95

			--M308 (M1A SOCOM/M14)
				self.new_m14.CLIP_AMMO_MAX = 20
				self.new_m14.has_description = true
				self.new_m14.desc_id = "bm_m14_sc_desc"
				self.new_m14.fire_mode_data.fire_rate = 0.08571428571
				self.new_m14.FIRE_MODE = "single"
				self.new_m14.kick = self.stat_info.kick_tables.vertical_kick
				self.new_m14.AMMO_MAX = 60
				self.new_m14.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.new_m14.supported = true
				self.new_m14.ads_speed = 0.420
				self.new_m14.damage_falloff = {
					start_dist = 3200,
					end_dist = 8200,
					min_mult = 0.5
				}
				self.new_m14.stats = {
					damage = 60,
					spread = 90,
					recoil = 59,
					spread_moving = 7,
					zoom = 1,
					concealment = 19,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.new_m14.stats_modifiers = nil
				self.new_m14.can_shoot_through_enemy = true
				self.new_m14.can_shoot_through_wall = true
				self.new_m14.timers.reload_not_empty = 2.60
				self.new_m14.timers.reload_exit_empty = 0.9
				self.new_m14.timers.reload_exit_not_empty = 1.1
				self.new_m14.panic_suppression_chance = 0.05
		
			--Gewehr 3 (G3A3)
				self.g3.AMMO_MAX = 60
				self.g3.CLIP_AMMO_MAX = 20
				self.g3.fire_mode_data.fire_rate = 0.1142857
				self.g3.CAN_TOGGLE_FIREMODE = true
				self.g3.FIRE_MODE = "single"
				self.g3.kick = self.stat_info.kick_tables.right_kick
				self.g3.desc_id = "bm_g3_sc_desc"
				self.g3.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.g3.supported = true
				self.g3.ads_speed = 0.400
				self.g3.damage_falloff = {
					start_dist = 3000,
					end_dist = 7800,
					min_mult = 0.5
				}
				self.g3.stats = {
					damage = 60,
					spread = 94,
					recoil = 63,
					spread_moving = 7,
					zoom = 1,
					concealment = 20,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 4,
					reload = 20
				}
				self.g3.stats_modifiers = nil
				self.g3.panic_suppression_chance = 0.05
				self.g3.can_shoot_through_enemy = true
				self.g3.can_shoot_through_wall = true
				self.g3.timers.reload_not_empty = 2.5
				self.g3.timers.reload_empty = 3.8
				self.g3.timers.reload_exit_empty = 0.9
				self.g3.timers.reload_exit_not_empty = 1.05
				self.g3.reload_speed_multiplier = 1.45
				
			--Galant (M1 Garand)
				self.ching.categories = {"assault_rifle" }
				self.ching.FIRE_MODE = "single"
				self.ching.fire_mode_data.fire_rate = 0.12
				self.ching.CAN_TOGGLE_FIREMODE = false
				self.ching.has_description = true
				self.ching.desc_id = "bm_galant_sc_desc"
				self.ching.CLIP_AMMO_MAX = 8
				self.ching.AMMO_MAX = 60
				self.ching.CAN_TOGGLE_FIREMODE = false
				self.ching.kick = self.stat_info.kick_tables.vertical_kick	
				self.ching.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.ching.supported = true
				self.ching.ads_speed = 0.320
				self.ching.damage_falloff = {
					start_dist = 4000,
					end_dist = 8900,
					min_mult = 0.5
				}
				self.ching.stats = {
					damage = 60,
					spread = 86,
					recoil = 69,
					spread_moving = 6,
					zoom = 1,
					concealment = 22,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.ching.stats_modifiers = nil	
				self.ching.can_shoot_through_enemy = true
				self.ching.can_shoot_through_wall = true
				self.ching.panic_suppression_chance = 0.05
				self.ching.timers.reload_exit_empty = 0.85
				self.ching.timers.reload_not_empty = 2.2
				self.ching.timers.reload_exit_not_empty = 1

	--[[     LIGHT SNIPERS     ]]	
		
		--PRIMARIES

			--Kang Arms X1 (QBU-88)
				self.qbu88.desc_id = "bm_qbu88_sc_desc"
				self.qbu88.has_description = true				
				self.qbu88.categories = {
					"snp",
					"semi_snp"
				}
				self.qbu88.upgrade_blocks = nil
				self.qbu88.CLIP_AMMO_MAX = 10
				self.qbu88.AMMO_MAX = 60
				self.qbu88.fire_mode_data.fire_rate = 0.2
				self.qbu88.fire_rate_multiplier = 1.5 --So the recoil anim while ADS progresses faster
				self.qbu88.sms = 0.9
				self.qbu88.CAN_TOGGLE_FIREMODE = false
				self.qbu88.kick = self.stat_info.kick_tables.vertical_kick
				self.qbu88.supported = true
				self.qbu88.ads_speed = 0.480
				self.qbu88.damage_falloff = {
					start_dist = 2600,
					end_dist = 6800,
					min_mult = 0.3
				}
				self.qbu88.stats = {
					damage = 60,
					spread = 89,
					recoil = 57,
					spread_moving = 6,
					zoom = 1,
					concealment = 23,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.qbu88.armor_piercing_chance = 1
				self.qbu88.stats_modifiers = nil
				self.qbu88.panic_suppression_chance = 0.05
				self.qbu88.reload_speed_multiplier = 0.9
				self.qbu88.timers.equip = 0.5
				self.qbu88.timers.reload_empty = 2.9
				self.qbu88.timers.reload_not_empty = 2.1
				self.qbu88.timers.reload_exit_empty = 0.55
				self.qbu88.timers.reload_exit_not_empty = 0.65
	
			--Contractor .308
				self.tti.categories = {
					"snp",
					"semi_snp"
				}
				self.tti.upgrade_blocks = nil
				self.tti.has_description = true
				self.tti.desc_id = "bm_tti_sc_desc"
				self.tti.CLIP_AMMO_MAX = 20
				self.tti.AMMO_MAX = 60
				self.tti.FIRE_MODE = "single"
				self.tti.fire_mode_data = {}
				self.tti.fire_mode_data.fire_rate = 0.142857
				self.tti.sms = 0.9
				self.tti.kick = self.stat_info.kick_tables.vertical_kick
				self.tti.can_shoot_through_enemy = true
				self.tti.can_shoot_through_shield = true
				self.tti.can_shoot_through_wall = true
				self.tti.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.tti.supported = true
				self.tti.ads_speed = 0.520
				self.tti.damage_falloff = {
					start_dist = 3500,
					end_dist = 8500,
					min_mult = 0.5
				}
				self.tti.stats = {
					damage = 60,
					spread = 86,
					recoil = 51,
					spread_moving = 6,
					zoom = 1,
					concealment = 18,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.tti.stats_modifiers = nil
				self.tti.reload_speed_multiplier = 0.9
				self.tti.timers.unequip = 0.7
				self.tti.timers.equip = 0.7
				self.tti.timers.reload_exit_empty = 0.725
				self.tti.timers.reload_exit_not_empty = 0.8
				self.tti.panic_suppression_chance = 0.05

			--Repeater 1874
				self.winchester1874.has_description = true
				self.winchester1874.desc_id = "bm_winchester1874_sc_desc"			
				self.winchester1874.upgrade_blocks = nil
				self.winchester1874.AMMO_MAX = 40
				self.winchester1874.CLIP_AMMO_MAX = 10
				self.winchester1874.FIRE_MODE = "single"
				self.winchester1874.fire_mode_data = {}
				self.winchester1874.fire_mode_data.fire_rate = 0.857142857
				self.winchester1874.fire_rate_multiplier = 1.714285
				self.winchester1874.CAN_TOGGLE_FIREMODE = false
				self.winchester1874.kick = self.stat_info.kick_tables.left_kick
				self.winchester1874.supported = true
				self.winchester1874.ads_speed = 0.320
				self.winchester1874.damage_falloff = {
					start_dist = 1300,
					end_dist = 5200,
					min_mult = 0.3333
				}
				self.winchester1874.stats = {
					damage = 90,
					spread = 85,
					recoil = 77,
					spread_moving = 9,
					zoom = 1,
					concealment = 22,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.winchester1874.timers.shotgun_reload_first_shell_offset = 0.25
				self.winchester1874.timers.shotgun_reload_exit_empty = 1
				self.winchester1874.tactical_reload = 1
				self.winchester1874.stats_modifiers = nil
				self.winchester1874.panic_suppression_chance = 0.05
	
			--Rattlesnake
				self.msr.desc_id = "bm_msr_sc_desc"
				self.msr.has_description = true					
				self.msr.upgrade_blocks = nil
				self.msr.CLIP_AMMO_MAX = 10
				self.msr.NR_CLIPS_MAX = 5
				self.msr.AMMO_MAX = 40
				self.msr.fire_mode_data.fire_rate = 1.09090909
				self.msr.fire_rate_multiplier = 1.1818181
				self.msr.kick = self.stat_info.kick_tables.vertical_kick
				self.msr.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.msr.supported = true
				self.msr.ads_speed = 0.420
				self.msr.damage_falloff = {
					start_dist = 4200,
					end_dist = 8500,
					min_mult = 0.5
				}
				self.msr.stats = {
					damage = 90,
					spread = 95,
					recoil = 57,
					spread_moving = 8,
					zoom = 1,
					concealment = 21,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.msr.stats_modifiers = nil
				self.msr.panic_suppression_chance = 0.05
				self.msr.reload_speed_multiplier = 0.9
				self.msr.timers.reload_not_empty = 2.55
				self.msr.timers.reload_exit_empty = 0.7
				self.msr.timers.reload_exit_not_empty = 0.75
	
			--R700
				self.r700.desc_id = "bm_r700_sc_desc"
				self.r700.has_description = true				
				self.r700.upgrade_blocks = nil
				self.r700.CLIP_AMMO_MAX = 5
				self.r700.AMMO_MAX = 40
				self.r700.fire_mode_data.fire_rate = 1
				self.r700.fire_rate_multiplier = 1.41666
				self.r700.kick = self.stat_info.kick_tables.vertical_kick
				self.r700.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.r700.supported = true
				self.r700.ads_speed = 0.360
				self.r700.damage_falloff = {
					start_dist = 4600,
					end_dist = 9000,
					min_mult = 0.5
				}
				self.r700.stats = {
					damage = 90,
					spread = 96,
					recoil = 51,
					spread_moving = 8,
					zoom = 1,
					concealment = 24,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.r700.stats_modifiers = nil
				self.r700.panic_suppression_chance = 0.05
				self.r700.reload_speed_multiplier = 1.3
				self.r700.timers.reload_exit_empty = 1.15
				self.r700.timers.reload_exit_not_empty = 0.95

		--SECONDARIES

			--Scout
				self.scout.upgrade_blocks = nil
				self.scout.has_description = true
				self.scout.desc_id = "bm_ap_weapon_sc_desc"
				self.scout.CLIP_AMMO_MAX = 5
				self.scout.AMMO_MAX = 20
				self.scout.fire_mode_data.fire_rate = 1.034482
				self.scout.fire_rate_multiplier = 0.948275
				self.scout.kick = self.stat_info.kick_tables.vertical_kick
				self.scout.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.scout.supported = true
				self.scout.ads_speed = 0.360
				self.scout.damage_falloff = {
					start_dist = 4000,
					end_dist = 8600,
					min_mult = 0.5
				}
				self.scout.stats = {
					damage = 90,
					spread = 96,
					recoil = 49,
					spread_moving = 8,
					zoom = 1,
					concealment = 23,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.scout.stats_modifiers = nil
				self.scout.panic_suppression_chance = 0.05
				self.scout.reload_speed_multiplier = 1.25
				self.scout.timers.reload_exit_empty = 0.5
				self.scout.timers.reload_exit_not_empty = 0.95

	--[[     HEAVY SNIPERS     ]]

		--PRIMARIES

			--Lebensauger .308
				self.wa2000.categories = {
					"snp",
					"semi_snp"
				}
				self.wa2000.upgrade_blocks = nil
				self.wa2000.has_description = true
				self.wa2000.desc_id = "bm_wa2000_sc_desc"
				self.wa2000.CLIP_AMMO_MAX = 6
				self.wa2000.AMMO_MAX = 40
				self.wa2000.fire_mode_data.fire_rate = 0.3
				self.wa2000.sms = 0.8
				self.wa2000.CAN_TOGGLE_FIREMODE = false
				self.wa2000.kick = self.stat_info.kick_tables.vertical_kick
				self.wa2000.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.wa2000.supported = true
				self.wa2000.ads_speed = 0.440
				self.wa2000.damage_falloff = {
					start_dist = 3200,
					end_dist = 7200,
					min_mult = 0.5
				}
				self.wa2000.stats = {
					damage = 90,
					spread = 94,
					recoil = 37,
					spread_moving = 6,
					zoom = 1,
					concealment = 20,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.wa2000.armor_piercing_chance = 1
				self.wa2000.stats_modifiers = nil
				self.wa2000.panic_suppression_chance = 0.05
				self.wa2000.reload_speed_multiplier = 1.1
				self.wa2000.timers.reload_exit_empty = 0.85
				self.wa2000.timers.reload_exit_not_empty = 1

			--Grom (SVD)
				self.siltstone.categories = {
					"snp",
					"semi_snp"
				}
				self.siltstone.upgrade_blocks = nil
				self.siltstone.has_description = true
				self.siltstone.desc_id = "bm_siltstone_sc_desc"
				self.siltstone.CLIP_AMMO_MAX = 10
				self.siltstone.AMMO_MAX = 40
				self.siltstone.fire_mode_data.fire_rate = 0.4
				self.siltstone.sms = 0.8
				self.siltstone.kick = self.stat_info.kick_tables.right_kick
				self.siltstone.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.siltstone.supported = true
				self.siltstone.ads_speed = 0.500
				self.siltstone.damage_falloff = {
					start_dist = 2600,
					end_dist = 6800,
					min_mult = 0.5
				}
				self.siltstone.stats = {
					damage = 90,
					spread = 90,
					recoil = 41,
					spread_moving = 8,
					zoom = 1,
					concealment = 18,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.siltstone.reload_speed_multiplier = 0.82
				self.siltstone.armor_piercing_chance = 1
				self.siltstone.stats_modifiers = nil
				self.siltstone.panic_suppression_chance = 0.05
				self.siltstone.timers.reload_exit_empty = 0.4
				self.siltstone.timers.reload_exit_not_empty = 0.4

			--Bernetti Rangehitter
				self.sbl.upgrade_blocks = nil
				self.sbl.has_description = true
				self.sbl.desc_id = "bm_sbl_sc_desc"
				self.sbl.CLIP_AMMO_MAX = 6
				self.sbl.AMMO_MAX = 30
				self.sbl.FIRE_MODE = "single"
				self.sbl.fire_mode_data = {}
				self.sbl.fire_mode_data.fire_rate = 0.857142857 --leave this be, it's synced to the lever action, use fire_rate_multiplier for changing ROF
				self.sbl.fire_rate_multiplier = 1.4285714285
				self.sbl.CAN_TOGGLE_FIREMODE = false
				self.sbl.kick = self.stat_info.kick_tables.left_kick
				self.sbl.tactical_reload = 1
				self.sbl.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.sbl.supported = true
				self.sbl.ads_speed = 0.340
				self.sbl.damage_falloff = {
					start_dist = 2100,
					end_dist = 6500,
					min_mult = 0.375
				}
				self.sbl.stats = {
					damage = 120,
					spread = 84,
					recoil = 67,
					spread_moving = 9,
					zoom = 1,
					concealment = 21,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}	
				self.sbl.stats_modifiers = nil
				self.sbl.panic_suppression_chance = 0.05
				self.sbl.timers.shotgun_reload_first_shell_offset = 0.25
				self.sbl.timers.shotgun_reload_exit_empty = 1
	
			--Nagant 
				self.mosin.bmp = 1
				self.mosin.has_description = true
				self.mosin.desc_id = "bm_mosin_sc_desc"
				self.mosin.CLIP_AMMO_MAX = 5
				self.mosin.AMMO_MAX = 30
				self.mosin.fire_mode_data.fire_rate = 1.2
				self.mosin.fire_rate_multiplier = 1.4
				self.mosin.kick = self.stat_info.kick_tables.vertical_kick
				self.mosin.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.mosin.supported = true
				self.mosin.ads_speed = 0.360
				self.mosin.damage_falloff = {
					start_dist = 3500,
					end_dist = 7000,
					min_mult = 0.5
				}
				self.mosin.stats = {
					damage = 120,
					spread = 91,
					recoil = 55,
					spread_moving = 9,
					zoom = 1,
					concealment = 22,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.mosin.stats_modifiers = nil
				self.mosin.panic_suppression_chance = 0.05
				self.mosin.timers.reload_empty = 3.6
				self.mosin.timers.reload_not_empty = 2.6
				self.mosin.timers.reload_exit_empty = 0.6
				self.mosin.timers.reload_exit_not_empty = 1.6

			--Platypus 70
				self.model70.upgrade_blocks = nil
				self.model70.has_description = true
				self.model70.desc_id = "bm_model70_sc_desc"
				self.model70.AMMO_MAX = 30
				self.model70.CLIP_AMMO_MAX = 5
				self.model70.fire_mode_data.fire_rate = 1
				self.model70.fire_rate_multiplier = 1.3333
				self.model70.kick = self.stat_info.kick_tables.vertical_kick
				self.model70.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.model70.supported = true
				self.model70.ads_speed = 0.380
				self.model70.damage_falloff = {
					start_dist = 4200,
					end_dist = 8500,
					min_mult = 0.5
				}
				self.model70.stats = {
					damage = 120,
					spread = 96,
					recoil = 47,
					spread_moving = 9,
					zoom = 1,
					concealment = 21,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.model70.stats_modifiers = nil
				self.model70.reload_speed_multiplier = 1.125
				self.model70.panic_suppression_chance = 0.05
				self.model70.timers.reload_empty = 4.3	
				self.model70.timers.reload_exit_empty = 0.8
				self.model70.timers.reload_exit_not_empty = 0.95

			--R93 (Blaser R93)
				self.r93.has_description = true
				self.r93.desc_id = "bm_r93_sc_desc"					
				self.r93.upgrade_blocks = nil
				self.r93.CLIP_AMMO_MAX = 5
				self.r93.AMMO_MAX = 30
				self.r93.fire_mode_data.fire_rate = 1.2
				self.r93.fire_rate_multiplier = 1.5
				self.r93.kick = self.stat_info.kick_tables.vertical_kick
				self.r93.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.r93.supported = true
				self.r93.ads_speed = 0.440
				self.r93.damage_falloff = {
					start_dist = 4800,
					end_dist = 8700,
					min_mult = 0.75
				}
				self.r93.stats = {
					damage = 120,
					spread = 97,
					recoil = 41,
					spread_moving = 8,
					zoom = 1,
					concealment = 19,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 9,
					reload = 20
				}
				self.r93.armor_piercing_chance = 1
				self.r93.stats_modifiers = nil
				self.r93.panic_suppression_chance = 0.05
				self.r93.timers.reload_exit_empty = 0.85
				self.r93.timers.reload_exit_not_empty = 0.95

			--Desert Fox (Desert Tech SRS)
				self.desertfox.has_description = true
				self.desertfox.desc_id = "bm_desertfox_sc_desc"				
				self.desertfox.CLIP_AMMO_MAX = 5
				self.desertfox.AMMO_MAX = 30
				self.desertfox.fire_mode_data.fire_rate = 1.3333
				self.desertfox.fire_rate_multiplier = 1.3333
				self.desertfox.kick = self.stat_info.kick_tables.right_kick
				self.desertfox.panic_suppression_chance = 0.05
				self.desertfox.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
				self.desertfox.supported = true
				self.desertfox.ads_speed = 0.400
				self.desertfox.damage_falloff = {
					start_dist = 5500,
					end_dist = 10000,
					min_mult = 0.75
				}
				self.desertfox.stats = {
					damage = 120,
					spread = 95,
					recoil = 43,
					spread_moving = 8,
					zoom = 1,
					concealment = 22,
					suppression = 5,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 10,
					reload = 20
				}
				self.desertfox.stats_modifiers = nil
				self.desertfox.reload_speed_multiplier = 0.95
				self.desertfox.timers.reload_exit_empty = 0.7
				self.desertfox.timers.reload_exit_not_empty = 0.75

	--[[     ANTI-MATERIEL SNIPERS     ]]

		--Thanatos .50 cal
			self.m95.upgrade_blocks = nil
			self.m95.has_description = true
			self.m95.desc_id = "bm_m95_sc_desc"
			self.m95.AMMO_MAX = 20
			self.m95.fire_mode_data.fire_rate = 1.5
			self.m95.fire_rate_multiplier = 1
			self.m95.kick = self.stat_info.kick_tables.left_kick
			self.m95.supported = true
			self.m95.ads_speed = 0.540
			self.m95.damage_falloff = {
				start_dist = 5000,
				end_dist = 20000,
				min_mult = 0.6666
			}
			self.m95.stats = {
				damage = 180,
				spread = 96,
				recoil = 13,
				spread_moving = 8,
				zoom = 1,
				concealment = 16,
				suppression = 4,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.m95.armor_piercing_chance = 1
			self.m95.can_shoot_through_titan_shield = true
			self.m95.hs_mult = 2
			self.m95.stats_modifiers = nil
			self.m95.panic_suppression_chance = 0.05
			self.m95.timers.reload_exit_empty = 0.85
			self.m95.timers.reload_exit_not_empty = 1.1



	--[[     LIGHT SHOTGUNS     ]]

		--PRIMARIES

			--Izhma 12G
				self.saiga.desc_id = "bm_saiga_sc_desc"
				self.saiga.has_description = true			
				self.saiga.rays = 8
				self.saiga.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.saiga.CLIP_AMMO_MAX = 5
				self.saiga.AMMO_MAX = 80
				self.saiga.fire_mode_data.fire_rate = 0.12
				self.saiga.shake.fire_multiplier = 1
				self.saiga.shake.fire_steelsight_multiplier = -1
				self.saiga.kick = self.stat_info.kick_tables.right_kick
				self.saiga.supported = true
				self.saiga.ads_speed = 0.380
				self.saiga.damage_falloff = {
					start_dist = 300,
					end_dist = 2600,
					min_mult = 0.5
				}
				self.saiga.stats = {
					damage = 45,
					spread = 31,
					recoil = 49,
					spread_moving = 7,
					zoom = 1,
					concealment = 25,
					suppression = 9,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.saiga.stats_modifiers = nil
				self.saiga.panic_suppression_chance = 0.05
				self.saiga.reload_speed_multiplier = 1.3
				self.saiga.timers.reload_exit_empty = 0.75
				self.saiga.timers.reload_exit_not_empty = 0.875

			--VD-12 (SKO12)
				self.sko12.use_data.selection_index = 2
				self.sko12.rays = 8
				self.sko12.AMMO_MAX = 80
				self.sko12.CLIP_AMMO_MAX = 25
				self.sko12.fire_mode_data.fire_rate = 0.1875
				self.sko12.kick = self.stat_info.kick_tables.moderate_kick
				self.sko12.FIRE_MODE = "single"				
				self.sko12.CAN_TOGGLE_FIREMODE = false
				self.sko12.supported = true
				self.sko12.ads_speed = 0.500
				self.sko12.damage_falloff = {
					start_dist = 1000,
					end_dist = 3100,
					min_mult = 0.5
				}
				self.sko12.stats = {
					damage = 45,
					spread = 39,
					recoil = 57,
					spread_moving = 7,
					zoom = 1,
					concealment = 20,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.sko12.stats_modifiers = nil
				self.sko12.sms = 0.8
				self.sko12.panic_suppression_chance = 0.05
				self.sko12.timers.reload_empty = 3.4
				self.sko12.timers.reload_exit_empty = 1.0
				self.sko12.timers.reload_not_empty = 2.9
				self.sko12.timers.reload_exit_not_empty = 0.8
				--Akimbo VD-12 
				--DISABLED
				self.x_sko12.use_data.selection_index = 5

			--Steakout (AA-12)
				self.aa12.rays = 8
				self.aa12.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.aa12.AMMO_MAX = 80
				self.aa12.desc_id = "bm_aa12_sc_desc"
				self.aa12.has_description = true
				self.aa12.CLIP_AMMO_MAX = 8
				self.aa12.kick = self.stat_info.kick_tables.moderate_kick
				self.aa12.FIRE_MODE = "auto"				
				self.aa12.CAN_TOGGLE_FIREMODE = false
				self.aa12.supported = true
				self.aa12.ads_speed = 0.440
				self.aa12.damage_falloff = {
					start_dist = 1100,
					end_dist = 3200,
					min_mult = 0.5
				}
				self.aa12.stats = {
					damage = 45,
					spread = 39,
					recoil = 67,
					spread_moving = 7,
					zoom = 1,
					concealment = 20,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.aa12.stats_modifiers = nil
				self.aa12.panic_suppression_chance = 0.05
				self.aa12.reload_speed_multiplier = 1.1
				self.aa12.timers.reload_exit_empty = 1.1
				self.aa12.timers.reload_exit_not_empty = 0.9

			--Argos III (Ultima)
				self.ultima.desc_id = "bm_ultima_sc_desc"
				self.ultima.has_description = true					
				self.ultima.rays = 8
				self.ultima.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.ultima.CLIP_AMMO_MAX = 7
				self.ultima.AMMO_MAX = 80
				self.ultima.use_data.selection_index = 2
				self.ultima.fire_mode_data.fire_rate = 0.14634146
				self.ultima.kick = self.stat_info.kick_tables.moderate_kick
				self.ultima.supported = true
				self.ultima.ads_speed = 0.340
				self.ultima.damage_falloff = {
					start_dist = 1000,
					end_dist = 3000,
					min_mult = 0.5
				}
				self.ultima.stats = {
					damage = 45,
					spread = 26,
					recoil = 45,
					spread_moving = 7,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}	
				self.ultima.stats_modifiers = nil
				self.ultima.panic_suppression_chance = 0.05	
				self.ultima.reload_speed_multiplier = 0.7
				self.ultima.timers.shotgun_reload.not_empty = {
					reload_enter = 0.4666666666666667,
					reload_first_shell_offset = 0,
					reload_shell = 1.08,
					reload_exit = 1,
					reload_num = 2
				}
				self.ultima.timers.shotgun_reload_exit_not_empty = 0.7
				self.ultima.timers.shotgun_reload_exit_empty = 0.3

			--Predator 12G
				self.spas12.desc_id = "bm_spas12_sc_desc"
				self.spas12.has_description = true					
				self.spas12.rays = 8
				self.spas12.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.spas12.AMMO_MAX = 80
				self.spas12.CLIP_AMMO_MAX = 6
				self.spas12.CAN_TOGGLE_FIREMODE = false
				self.spas12.fire_mode_data.fire_rate = 0.15789473
				self.spas12.BURST_FIRE = 2
				self.spas12.BURST_FIRE_RATE_MULTIPLIER = 5
				self.spas12.BURST_FIRE_RECOIL_MULTIPLIER = 0.25
				self.spas12.BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.35
				self.spas12.BURST_FIRE_SPREAD_MULTIPLIER = 3
				self.spas12.BURST_DELAY = 0.250
				self.spas12.kick = self.stat_info.kick_tables.left_kick
				self.spas12.supported = true
				self.spas12.ads_speed = 0.400
				self.spas12.damage_falloff = {
					start_dist = 1200,
					end_dist = 3300,
					min_mult = 0.5
				}
				self.spas12.stats = {
					damage = 45,
					spread = 35,
					recoil = 53,
					spread_moving = 7,
					zoom = 1,
					concealment = 24,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.spas12.stats_modifiers = nil
				self.spas12.panic_suppression_chance = 0.05
				self.spas12.reload_fix_offset = 0.25
				self.spas12.timers.shotgun_reload_enter = 0.3
				self.spas12.timers.shotgun_reload_first_shell_offset = 0.33
				self.spas12.timers.shotgun_reload_shell = 0.5666666666666667
				self.spas12.timers.shotgun_reload_exit_not_empty = 0.2
				self.spas12.timers.shotgun_reload_exit_empty = 1.5

			--M1014
				self.benelli.desc_id = "bm_benelli_sc_desc"
				self.benelli.has_description = true					
				self.benelli.AMMO_MAX = 80
				self.benelli.CLIP_AMMO_MAX = 5
				self.benelli.rays = 8
				self.benelli.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.benelli.fire_mode_data.fire_rate = 0.1333333
				self.benelli.CAN_TOGGLE_FIREMODE = false
				self.benelli.kick = self.stat_info.kick_tables.moderate_kick
				self.benelli.supported = true
				self.benelli.ads_speed = 0.380
				self.benelli.damage_falloff = {
					start_dist = 1400,
					end_dist = 3500,
					min_mult = 0.5
				}
				self.benelli.stats = {
					damage = 45,
					spread = 40,
					recoil = 47,
					spread_moving = 7,
					zoom = 1,
					concealment = 22,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.benelli.stats_modifiers = nil
				self.benelli.panic_suppression_chance = 0.05
				self.benelli.reload_fix_offset = 0.25
				self.benelli.timers.shotgun_reload_enter = 0.3
				self.benelli.timers.shotgun_reload_first_shell_offset = 0.33
				self.benelli.timers.shotgun_reload_shell = 0.5666666666666667
				self.benelli.timers.shotgun_reload_exit_not_empty = 0.2
				self.benelli.timers.shotgun_reload_exit_empty = 1.5

		--SECONDARIES

			--Grimm 12G
				self.basset.rays = 8
				self.basset.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.basset.CLIP_AMMO_MAX = 5
				self.basset.AMMO_MAX = 40
				self.basset.fire_mode_data.fire_rate = 0.12
				self.basset.kick = self.stat_info.kick_tables.moderate_left_kick
				self.basset.panic_suppression_chance = 0.05
				self.basset.supported = true
				self.basset.ads_speed = 0.360
				self.basset.damage_falloff = {
					start_dist = 300,
					end_dist = 2600,
					min_mult = 0.5
				}
				self.basset.stats = {
					zoom = 1,
					total_ammo_mod = 100,
					damage = 45,
					alert_size = 2,
					spread = 31,
					spread_moving = 8,
					recoil = 51,
					value = 1,
					extra_ammo = 101,
					reload = 20,
					suppression = 9,
					concealment = 25
				}		
				self.basset.stats_modifiers = nil
				self.basset.reload_speed_multiplier = 0.925
				self.basset.sounds.fire_single = "basset_x_fire_single"
				self.basset.timers.reload_exit_empty = 0.55
				self.basset.timers.reload_exit_not_empty = 0.65

			--Street Sweeper
				self.striker.rays = 8
				self.striker.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.striker.AMMO_MAX = 40
				self.striker.fire_mode_data.fire_rate = 0.14634146
				self.striker.CAN_TOGGLE_FIREMODE = false
				self.striker.CLIP_AMMO_MAX = 12
				self.striker.kick = self.stat_info.kick_tables.right_kick
				self.striker.supported = true
				self.striker.ads_speed = 0.420
				self.striker.damage_falloff = {
					start_dist = 800,
					end_dist = 3200,
					min_mult = 0.5
				}
				self.striker.stats = {
					damage = 45,
					spread = 31,
					recoil = 43,
					spread_moving = 7,
					zoom = 1,
					concealment = 23,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.striker.stats_modifiers = nil
				self.striker.panic_suppression_chance = 0.05
				self.striker.timers.shotgun_reload_first_shell_offset = 0.03333333

			--Goliath 12G
				self.rota.upgrade_blocks = nil
				self.rota.AMMO_MAX = 40
				self.rota.rays = 8
				self.rota.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.rota.kick = self.stat_info.kick_tables.vertical_kick
				self.rota.fire_mode_data.fire_rate = 0.1333333
				self.rota.panic_suppression_chance = 0.05
				self.rota.supported = true
				self.rota.ads_speed = 0.360
				self.rota.damage_falloff = {
					start_dist = 1200,
					end_dist = 3500,
					min_mult = 0.5
				}
				self.rota.stats = {
					damage = 45,
					spread = 36,
					recoil = 41,
					spread_moving = 7,
					zoom = 1,
					concealment = 25,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.rota.stats_modifiers = nil
				self.rota.timers.reload_exit_empty = 0.5
				self.rota.timers.reload_exit_not_empty = 0.5

	--[[     HEAVY SHOTGUNS     ]]

		--PRIMARIES

			--Akimbo Judge
				--Keeping
				self.x_judge.desc_id = "bm_x_judge_sc_desc"
				self.x_judge.has_description = true							
				self.x_judge.categories = {
					"akimbo",
					"shotgun",
					"shotgun_pistol"
				}
				self.x_judge.fire_mode_data.fire_rate = 0.272727
				self.x_judge.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.x_judge.rays = 8
				self.x_judge.BURST_FIRE = 2
				self.x_judge.AMMO_MAX = 60
				self.x_judge.supported = true
				self.x_judge.ads_speed = 0.320
				self.x_judge.damage_falloff = {
					start_dist = 600,
					end_dist = 2600,
					min_mult = 0.3333
				}
				self.x_judge.stats = {
					damage = 60,
					spread = 23,
					recoil = 53,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.x_judge.stats_modifiers = nil
				self.x_judge.panic_suppression_chance = 0.05
				self.x_judge.kick = self.stat_info.kick_tables.vertical_kick
				self.x_judge.reload_speed_multiplier = 0.9
				self.x_judge.weapon_hold = "jowi_pistol"
				self.x_judge.animations.reload_name_id = "x_judge"
				self.x_judge.animations.second_gun_versions = self.x_judge.animations.second_gun_versions or {}
				self.x_judge.animations.second_gun_versions.reload = "reload"
				self.x_judge.timers.reload_empty = 3.1
				self.x_judge.timers.reload_not_empty = 3.1
				self.x_judge.timers.reload_exit_empty = 1.3
				self.x_judge.timers.reload_exit_not_empty = 1.3

			--Mosconi 12G Tactical (Mossberg 590)
				self.m590.desc_id = "bm_menu_sc_m590_desc"
				self.m590.has_description = true
				self.m590.tactical_reload = 1	
				self.m590.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.m590.rays = 8
				self.m590.CLIP_AMMO_MAX = 7
				self.m590.kick = self.stat_info.kick_tables.vertical_kick
				self.m590.AMMO_MAX = 60
				self.m590.supported = true
				self.m590.ads_speed = 0.380
				self.m590.damage_falloff = {
					start_dist = 900,
					end_dist = 2800,
					min_mult = 0.3333
				}
				self.m590.stats = {
					damage = 60,
					spread = 40,
					recoil = 45,
					spread_moving = 6,
					zoom = 1,
					concealment = 23,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}		
				self.m590.stats_modifiers = nil
				self.m590.panic_suppression_chance = 0.05
				self.m590.timers.shotgun_reload_enter = 0.3
				self.m590.timers.shotgun_reload_first_shell_offset = 0.33
				self.m590.timers.shotgun_reload_shell = 0.5666666666666667
				self.m590.timers.shotgun_reload_exit_not_empty = 0.3
				self.m590.timers.shotgun_reload_exit_empty = 0.7

			--Reinfeld 880 (R870)
				self.r870.desc_id = "bm_menu_sc_r870_desc"
				self.r870.has_description = true
				self.r870.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.r870.rays = 8
				self.r870.CLIP_AMMO_MAX = 8
				self.r870.kick = self.stat_info.kick_tables.vertical_kick
				self.r870.single.fire_rate = 0.5
				self.r870.fire_mode_data.fire_rate = 0.5
				self.r870.AMMO_MAX = 60
				self.r870.supported = true
				self.r870.ads_speed = 0.400
				self.r870.damage_falloff = {
					start_dist = 1000,
					end_dist = 3000,
					min_mult = 0.3333
				}
				self.r870.stats = {
					damage = 60,
					spread = 42,
					recoil = 51,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}		
				self.r870.stats_modifiers = nil
				self.r870.panic_suppression_chance = 0.05
				self.r870.timers.shotgun_reload_enter = 0.3
				self.r870.timers.shotgun_reload_first_shell_offset = 0.33
				self.r870.timers.shotgun_reload_shell = 0.5666666666666667
				self.r870.timers.shotgun_reload_exit_not_empty = 0.3
				self.r870.timers.shotgun_reload_exit_empty = 0.7
	
			--Raven (KSG)
				self.ksg.desc_id = "bm_menu_sc_ksg_desc"
				self.ksg.has_description = true			
				self.ksg.rays = 8
				self.ksg.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.ksg.AMMO_MAX = 60
				self.ksg.CLIP_AMMO_MAX = 14
				self.ksg.fire_mode_data.fire_rate = 0.5
				self.ksg.fire_rate_multiplier = 0.83333
				self.ksg.kick = self.stat_info.kick_tables.vertical_kick		
				self.ksg.supported = true
				self.ksg.ads_speed = 0.380
				self.ksg.damage_falloff = {
					start_dist = 1100,
					end_dist = 3200,
					min_mult = 0.3333
				}
				self.ksg.stats = {
					damage = 60,
					spread = 45,
					recoil = 41,
					spread_moving = 7,
					zoom = 1,
					concealment = 23,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ksg.stats_modifiers = nil
				self.ksg.panic_suppression_chance = 0.05
				self.ksg.fire_anim_offset2 = 0.03
				self.ksg.reload_fix_offset2 = 0.025
				self.ksg.reload_fix_mult2 = 1.08
				self.ksg.reload_speed_multiplier = 0.9
				self.ksg.timers.shotgun_reload_exit_not_empty = 0.9
				self.ksg.timers.shotgun_reload_exit_empty = 0.9

			--Reinfeld 88 (WHY IS THIS UNDER THE REMINGTON LABEL)
				self.m1897.desc_id = "bm_menu_sc_m1897_desc"
				self.m1897.has_description = true				
				self.m1897.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.m1897.rays = 8
				self.m1897.CLIP_AMMO_MAX = 5
				self.m1897.kick = self.stat_info.kick_tables.vertical_kick
				self.m1897.fire_mode_data.fire_rate = 0.6
				self.m1897.fire_rate_multiplier = 1.1
				self.m1897.BURST_FIRE = 1
				self.m1897.BURST_FIRE_RATE_MULTIPLIER = 1.5
				self.m1897.BURST_SLAM = true
				self.m1897.AUTO_BURST = true
				self.m1897.BURST_FIRE_RECOIL_MULTIPLIER = 1.1
				self.m1897.BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.1
				self.m1897.BURST_FIRE_SPREAD_MULTIPLIER = 3
				self.m1897.AMMO_MAX = 60
				self.m1897.supported = true
				self.m1897.ads_speed = 0.380
				self.m1897.damage_falloff = {
					start_dist = 1300,
					end_dist = 3400,
					min_mult = 0.3333
				}
				self.m1897.stats = {
					damage = 60,
					spread = 51,
					recoil = 41,
					spread_moving = 6,
					zoom = 1,
					concealment = 22,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}		
				self.m1897.stats_modifiers = nil
				self.m1897.panic_suppression_chance = 0.05
				self.m1897.timers.shotgun_reload_exit_not_empty = 0.9
				self.m1897.timers.shotgun_reload_exit_empty = 0.9
		
		--SECONDARIES

			--Loco 12g
				self.serbu.has_description = true
				self.serbu.desc_id = "bm_serbu_sc_desc"
				self.serbu.rays = 8
				self.serbu.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.serbu.CLIP_AMMO_MAX = 4
				self.serbu.AMMO_MAX = 30
				self.serbu.fire_mode_data.fire_rate = 0.5
				self.serbu.single.fire_rate = 0.5
				self.serbu.kick = self.stat_info.kick_tables.moderate_kick
				self.serbu.supported = true
				self.serbu.ads_speed = 0.360
				self.serbu.damage_falloff = {
					start_dist = 900,
					end_dist = 2400,
					min_mult = 0.3333
				}
				self.serbu.stats = {
					damage = 60,
					spread = 36,
					recoil = 41,
					spread_moving = 6,
					zoom = 1,
					concealment = 25,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.serbu.stats_modifiers = nil
				self.serbu.panic_suppression_chance = 0.05
				self.serbu.timers.shotgun_reload_enter = 0.3
				self.serbu.timers.shotgun_reload_first_shell_offset = 0.33
				self.serbu.timers.shotgun_reload_shell = 0.5666666666666667
				self.serbu.timers.shotgun_reload_exit_not_empty = 0.3
				self.serbu.timers.shotgun_reload_exit_empty = 0.7

			--GSPS (Ithaca Model 37)
				self.m37.desc_id = "bm_slamfire_generic_desc"
				self.m37.has_description = true				
				self.m37.rays = 8
				self.m37.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.m37.CLIP_AMMO_MAX = 5
				self.m37.AMMO_MAX = 30
				self.m37.fire_mode_data.fire_rate = 0.6
				self.m37.fire_rate_multiplier = 1.1
				self.m37.BURST_FIRE = 1
				self.m37.BURST_FIRE_RATE_MULTIPLIER = 1.5
				self.m37.BURST_SLAM = true
				self.m37.AUTO_BURST = true
				self.m37.BURST_FIRE_RECOIL_MULTIPLIER = 1.1
				self.m37.BURST_FIRE_LAST_RECOIL_MULTIPLIER = 1.1
				self.m37.BURST_FIRE_SPREAD_MULTIPLIER = 3
				self.m37.kick = self.stat_info.kick_tables.right_kick
				self.m37.panic_suppression_chance = 0.05
				self.m37.supported = true
				self.m37.ads_speed = 0.380
				self.m37.damage_falloff = {
					start_dist = 1000,
					end_dist = 3000,
					min_mult = 0.3333
				}
				self.m37.stats = {
					damage = 60,
					spread = 43,
					recoil = 51,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.m37.stats_modifiers = nil
				self.m37.timers.shotgun_reload_exit_not_empty = 0.9
				self.m37.timers.shotgun_reload_exit_empty = 0.9

			--Judge
				self.judge.categories = {
					"shotgun",
					"shotgun_pistol"
				}
				self.judge.fire_mode_data.fire_rate = 0.272727
				self.judge.rays = 8
				self.judge.kick = self.stat_info.kick_tables.left_kick
				self.judge.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.judge.AMMO_MAX = 30
				self.judge.supported = true
				self.judge.ads_speed = 0.320
				self.judge.damage_falloff = {
					start_dist = 600,
					end_dist = 2600,
					min_mult = 0.3333
				}
				self.judge.stats = {
					damage = 60,
					spread = 33,
					recoil = 63,
					spread_moving = 5,
					zoom = 1,
					concealment = 25,
					suppression = 7,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.judge.stats_modifiers = nil
				self.judge.reload_speed_multiplier = 0.9
				self.judge.timers.reload_not_empty = 2.1
				self.judge.timers.reload_empty = 2.1
				self.judge.timers.reload_exit_empty = 0.6
				self.judge.timers.reload_exit_not_empty = 0.6
				self.judge.panic_suppression_chance = 0.05

	--[[     BREAK-ACTION SHOTGUNS     ]]

		--PRIMARIES

			--Joceline O/U 12G (Beretta 682 Hybrid)
				self.b682.desc_id = "bm_b682_sc_desc"
				self.b682.has_description = true						
				self.b682.rays = 8
				self.b682.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.b682.AMMO_MAX = 40
				self.b682.fire_mode_data = {}
				self.b682.CAN_TOGGLE_FIREMODE = false
				self.b682.fire_mode_data.fire_rate = 0.171428
				self.b682.sounds.fire_single = "b682_fire"
				self.b682.sounds.fire_auto = "b682_fire"		
				self.b682.kick = self.stat_info.kick_tables.vertical_kick
				self.b682.supported = true
				self.b682.ads_speed = 0.480
				self.b682.damage_falloff = {
					start_dist = 1200,
					end_dist = 3500,
					min_mult = 0.25
				}
				self.b682.stats = {
					damage = 90,
					spread = 61,
					recoil = 41,
					spread_moving = 6,
					zoom = 1,
					concealment = 20,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.b682.stats_modifiers = nil
				self.b682.panic_suppression_chance = 0.05
				self.b682.stats_modifiers = {damage = 1}
				self.b682.reload_speed_multiplier = 1.2
				self.b682.timers.reload_exit_empty = 0.5
				self.b682.timers.reload_exit_not_empty = 0.9

			--Breaker 12g (Model 1887)
				self.boot.desc_id = "bm_menu_sc_boot_desc"
				self.boot.has_description = true
				self.boot.AMMO_MAX = 40
				self.boot.CLIP_AMMO_MAX = 6
				self.boot.tactical_reload = 1
				self.boot.fire_mode_data.fire_rate = 1
				self.boot.single.fire_rate = 0.85
				self.boot.rays = 8
				self.boot.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.boot.kick = self.stat_info.kick_tables.right_kick
				self.boot.supported = true
				self.boot.ads_speed = 0.420
				self.boot.damage_falloff = {
					start_dist = 800,
					end_dist = 3000,
					min_mult = 0.25
				}
				self.boot.stats = {
					damage = 90,
					spread = 44,
					recoil = 33,
					spread_moving = 5,
					zoom = 1,
					concealment = 26,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.boot.timers = {
					shotgun_reload_enter = 0.733,
					shotgun_reload_exit_empty = 0.8,
					shotgun_reload_exit_not_empty = 0.5,
					shotgun_reload_shell = 0.33,
					shotgun_reload_first_shell_offset = 0.14,
					unequip = 0.55,
					equip = 0.85
				}
				self.boot.stats_modifiers = nil
				self.boot.panic_suppression_chance = 0.05
				self.boot.stats_modifiers = {damage = 1}
				self.boot.reload_speed_multiplier = 0.75

			--Mosconi 12G
				self.huntsman.desc_id = "bm_menu_sc_huntsman_desc"
				self.huntsman.has_description = true		
				self.huntsman.rays = 8
				self.huntsman.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.huntsman.AMMO_MAX = 40
				self.huntsman.sounds.fire_single = "huntsman_fire"
				self.huntsman.sounds.fire_auto = "huntsman_fire"
				self.huntsman.BURST_FIRE = 2
				self.huntsman.BURST_FIRE_RATE_MULTIPLIER = 5
				self.huntsman.ADAPTIVE_BURST_SIZE = false	
				self.huntsman.CAN_TOGGLE_FIREMODE = false			
				self.huntsman.DELAYED_BURST_RECOIL = false
				self.huntsman.fire_mode_data = {}
				self.huntsman.fire_mode_data.fire_rate = 0.171428
				self.huntsman.kick = self.stat_info.kick_tables.vertical_kick
				self.huntsman.supported = true
				self.huntsman.ads_speed = 0.440
				self.huntsman.damage_falloff = {
					start_dist = 1000,
					end_dist = 3100,
					min_mult = 0.25
				}
				self.huntsman.stats = {
					damage = 90,
					spread = 58,
					recoil = 43,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.huntsman.stats_modifiers = nil
				self.huntsman.timers.reload_not_empty = 2.3
				self.huntsman.timers.reload_empty = 2.3
				self.huntsman.timers.reload_exit_empty = 0.3
				self.huntsman.timers.reload_exit_not_empty = 0.3
				self.huntsman.reload_speed_multiplier = 1.2
				self.huntsman.panic_suppression_chance = 0.05
			
		--SECONDARIES

			--Claire 12G
				self.coach.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
				self.coach.rays = 8
				self.coach.kick = self.stat_info.kick_tables.vertical_kick
				self.coach.AMMO_MAX = 20
				self.coach.sounds.fire_single = "coach_fire"
				self.coach.sounds.fire_auto = "coach_fire"		
				self.coach.BURST_FIRE = 2
				self.coach.CAN_TOGGLE_FIREMODE = false							
				self.coach.BURST_FIRE_RATE_MULTIPLIER = 5
				self.coach.DELAYED_BURST_RECOIL = false
				self.coach.ADAPTIVE_BURST_SIZE = false		
				self.coach.fire_mode_data = {}
				self.coach.fire_mode_data.fire_rate = 0.171428
				self.coach.supported = true
				self.coach.ads_speed = 0.440
				self.coach.damage_falloff = {
					start_dist = 1000,
					end_dist = 3100,
					min_mult = 0.25
				}
				self.coach.stats = {
					damage = 90,
					spread = 58,
					recoil = 43,
					spread_moving = 6,
					zoom = 1,
					concealment = 21,
					suppression = 6,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.coach.stats_modifiers = nil
				self.coach.panic_suppression_chance = 0.05
				self.coach.timers.reload_exit_empty = 0.3
				self.coach.timers.reload_exit_not_empty = 0.3
				self.coach.reload_speed_multiplier = 1.2

	--[[     FLAMETHROWERS     ]]

		--PRIMARIES
		
			--Flamethrower Mk1
				self.flamethrower_mk2.categories = {
					"flamethrower",
					"shotgun"
				}
				self.flamethrower_mk2.has_description = true
				self.flamethrower_mk2.desc_id = "bm_ap_flamethrower_sc_desc"
				self.flamethrower_mk2.rays = 20
				self.flamethrower_mk2.CLIP_AMMO_MAX = 60
				self.flamethrower_mk2.AMMO_MAX = 120
				self.flamethrower_mk2.fire_mode_data.fire_rate = 0.1
				self.flamethrower_mk2.single_flame_effect_duration = 1
				self.flamethrower_mk2.armor_piercing_chance = 1
				self.flamethrower_mk2.can_shoot_through_enemy = false
				self.flamethrower_mk2.can_shoot_through_shield = false
				self.flamethrower_mk2.can_shoot_through_wall = false
				self.flamethrower_mk2.kick = self.stat_info.kick_tables.horizontal_recoil
				self.flamethrower_mk2.fire_dot_data = {
					dot_damage = 1.6,
					dot_trigger_chance = 50,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
				self.flamethrower_mk2.supported = true
				self.flamethrower_mk2.ads_speed = 0.480
				self.flamethrower_mk2.damage_falloff = {
					start_dist = 500,
					end_dist = 1600,
					min_mult = 0,
				}
				self.flamethrower_mk2.stats = {
					damage = 24,
					spread = 41,
					recoil = 97,
					spread_moving = 6,
					zoom = 1,
					concealment = 16,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.flamethrower_mk2.flame_max_range = 1600
				self.flamethrower_mk2.sms = 0.65
				self.flamethrower_mk2.stats_modifiers = nil
				self.flamethrower_mk2.panic_suppression_chance = 0.05
				self.flamethrower_mk2.timers.reload_not_empty = 7.7
				self.flamethrower_mk2.timers.reload_empty = 7.7
				self.flamethrower_mk2.timers.reload_exit_empty = 1.7
				self.flamethrower_mk2.timers.reload_exit_not_empty = 1.7
				self.flamethrower_mk2.shake.bypass_global_shake = true

			--MA-17 Flamethrower
				self.system.categories = {
					"flamethrower",
					"shotgun"
				}
				self.system.use_data.selection_index = 2
				self.system.has_description = true
				self.system.desc_id = "bm_ap_flamethrower_sc_desc"
				self.system.timers.reload_not_empty = 8
				self.system.timers.reload_empty = 8
				self.system.rays = 20
				self.system.CLIP_AMMO_MAX = 45
				self.system.AMMO_MAX = 120
				self.system.fire_mode_data.fire_rate = 0.1
				self.system.single_flame_effect_duration = 1
				self.system.armor_piercing_chance = 1
				self.system.can_shoot_through_enemy = false
				self.system.can_shoot_through_shield = false
				self.system.can_shoot_through_wall = false
				self.system.kick = self.stat_info.kick_tables.horizontal_recoil
				self.system.fire_dot_data = {
					dot_damage = 1.6,
					dot_trigger_chance = 50,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
				self.system.supported = true
				self.system.ads_speed = 0.420
				self.system.damage_falloff = {
					start_dist = 300,
					end_dist = 1200,
					min_mult = 0,
				}
				self.system.stats = {
					damage = 24,
					spread = 31,
					recoil = 97,
					spread_moving = 6,
					zoom = 1,
					concealment = 20,
					suppression = 8,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.system.flame_max_range = 1200
				self.system.sms = 0.75
				self.system.stats_modifiers = nil
				self.system.panic_suppression_chance = 0.05
				self.system.reload_speed_multiplier = 1.2
				self.system.timers.reload_empty = 8.5
				self.system.timers.reload_not_empty = 8.5
				self.system.timers.reload_exit_empty = 1.5
				self.system.timers.reload_exit_not_empty = 1.5
				self.system.shake.bypass_global_shake = true

			--Cash Blaster
				if self.money then			
					self.money.fire_variant = "money"
					self.money.categories = {
						"flamethrower",
						"shotgun"
					}
					self.money.damage_type = "flamethrower"
					self.money.use_data.selection_index = 2
					self.money.has_description = true
					self.money.desc_id = "bm_ap_money_sc_desc"
					self.money.timers.reload_not_empty = 8
					self.money.timers.reload_empty = 8
					self.money.rays = 20
					self.money.CLIP_AMMO_MAX = 45
					self.money.AMMO_MAX = 120
					self.money.fire_mode_data.fire_rate = 0.1
					self.money.single_flame_effect_duration = 1
					self.money.armor_piercing_chance = 1
					self.money.can_shoot_through_enemy = false
					self.money.can_shoot_through_shield = false
					self.money.can_shoot_through_wall = false
					self.money.kick = self.stat_info.kick_tables.horizontal_recoil
					self.money.fire_dot_data = {
						dot_damage = 1.6,
						dot_trigger_chance = 50,
						dot_length = 3.1,
						dot_tick_period = 0.5
					}
					self.money.supported = true
					self.money.ads_speed = 0.420
					self.money.damage_falloff = {
						start_dist = 400,
						end_dist = 1400,
						min_mult = 0,
					}
					self.money.stats = {
						damage = 24,
						spread = 31,
						recoil = 97,
						spread_moving = 6,
						zoom = 1,
						concealment = 20,
						suppression = 8,
						alert_size = 2,
						extra_ammo = 101,
						total_ammo_mod = 100,
						value = 1,
						reload = 20
					}
					self.money.flame_max_range = 1400
					self.money.sms = 0.75
					self.money.stats_modifiers = nil
					self.money.panic_suppression_chance = 0.05
					self.money.reload_speed_multiplier = 1.2
					self.money.timers.reload_empty = 8.5
					self.money.timers.reload_not_empty = 8.5
					self.money.timers.reload_exit_empty = 1.5
					self.money.timers.reload_exit_not_empty = 1.5
					self.money.sounds.no_fix = true		
					self.money.shake.bypass_global_shake = true
				end
	


	--[[     (CROSS)BOWS     ]]

		--PRIMARIES

			--Airbow
				self.ecp.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.ecp.damage_type = "sniper"
				self.ecp.has_description = true
				self.ecp.desc_id = "bm_airbow_sc_desc"
				self.ecp.kick = self.stat_info.kick_tables.right_kick
				self.ecp.AMMO_MAX = 40
				self.ecp.panic_suppression_chance = 0.05
				self.ecp.ignore_damage_upgrades = true
				self.ecp.supported = true
				self.ecp.ads_speed = 0.420
				self.ecp.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.ecp.stats = {
					damage = 45,
					spread = 81,
					recoil = 89,
					spread_moving = 8,
					zoom = 1,
					concealment = 25,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ecp.stats_modifiers = {damage = 4}
				self.ecp.fire_mode_data.fire_rate = 0.45
				self.ecp.fire_rate_multiplier = 0.6
				self.ecp.timers.reload_exit_empty = 0.6
				self.ecp.timers.reload_exit_not_empty = 0.6
				self.ecp.reload_speed_multiplier = 0.75
	
			--Light Crossbow
				self.frankish.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}
				self.frankish.damage_type = "sniper"
				self.frankish.has_description = true
				self.frankish.desc_id = "bm_xbow_sc_desc"
				self.frankish.fire_mode_data.fire_rate = 1
				self.frankish.kick = self.stat_info.kick_tables.horizontal_recoil
				self.frankish.AMMO_MAX = 30
				self.frankish.panic_suppression_chance = 0.05
				self.frankish.ignore_damage_upgrades = true
				self.frankish.supported = true
				self.frankish.ads_speed = 0.260
				self.frankish.stats = {
					damage = 60,
					spread = 91,
					recoil = 85,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.frankish.timers.reload_not_empty = 1.55
				self.frankish.timers.reload_empty = 1.55
				self.frankish.timers.reload_exit_empty = 0.6
				self.frankish.timers.reload_exit_not_empty = 0.6
				self.frankish.stats_modifiers = {damage = 4}
			
			--Heavy Crossbow
				self.arblast.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}			
				self.arblast.damage_type = "anti_materiel"
				self.arblast.has_description = true
				self.arblast.desc_id = "bm_xbow_sc_desc"
				self.arblast.AMMO_MAX = 20
				self.arblast.fire_mode_data.fire_rate = 1.2
				self.arblast.kick = self.stat_info.kick_tables.horizontal_recoil
				self.arblast.panic_suppression_chance = 0.05
				self.arblast.supported = true
				self.arblast.ads_speed = 0.360
				self.arblast.stats = {
					damage = 90,
					spread = 100,
					recoil = 81,
					spread_moving = 8,
					zoom = 1,
					concealment = 25,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.arblast.timers.reload_not_empty = 3.05
				self.arblast.timers.reload_empty = 3.05		
				self.arblast.stats_modifiers = {damage =  4}
				self.arblast.timers.reload_exit_empty = 0.9
				self.arblast.timers.reload_exit_not_empty = 0.9
				self.arblast.timers.reload_not_empty = 2.8
				self.arblast.timers.reload_empty = 2.8

			--Plainsrider bow.
				self.plainsrider.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.plainsrider.damage_type = "sniper"
				self.plainsrider.has_description = true
				self.plainsrider.desc_id = "bm_bow_sc_desc"
				--self.plainsrider.desc_id = "bm_bow_alt_sc_desc"
				self.plainsrider.kick = self.stat_info.kick_tables.none
				self.plainsrider.AMMO_MAX = 30
				self.plainsrider.charge_data.max_t = 0.5
				self.plainsrider.not_allowed_in_bleedout = false
				self.plainsrider.supported = true
				self.plainsrider.ads_speed = 0.200
				self.plainsrider.stats = {
					damage = 60,
					spread = 100,
					recoil = 97,
					spread_moving = 12,
					zoom = 1,
					concealment = 30,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.plainsrider.panic_suppression_chance = 0.05
				self.plainsrider.stats_modifiers = {damage = 4}
				self.plainsrider.timers.reload_not_empty = 0.5
				self.plainsrider.timers.reload_empty = self.plainsrider.timers.reload_not_empty
				self.plainsrider.timers.reload_exit_not_empty = 0.4
				self.plainsrider.timers.reload_exit_empty = self.plainsrider.timers.reload_exit_not_empty
				self.plainsrider.bow_reload_speed_multiplier = nil
				self.plainsrider.reload_speed_multiplier = 2.9

			--English Longbow
				self.long.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}
				self.long.damage_type = "anti_materiel"
				self.long.has_description = true
				self.long.desc_id = "bm_bow_sc_desc"
				self.long.kick = self.stat_info.kick_tables.none	
				self.long.charge_data.max_t = 0.6
				self.long.not_allowed_in_bleedout = false
				self.long.AMMO_MAX = 20
				self.long.panic_suppression_chance = 0.05
				self.long.ignore_damage_upgrades = true
				self.long.supported = true
				self.long.ads_speed = 0.240
				self.long.stats = {
					damage = 90,
					spread = 100,
					recoil = 97,
					spread_moving = 12,
					zoom = 1,
					concealment = 29,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.long.stats_modifiers = {damage = 4}
				self.long.timers.reload_not_empty = 0.8
				self.long.timers.reload_empty = self.long.timers.reload_not_empty
				self.long.timers.reload_exit_not_empty = 0.7
				self.long.timers.reload_exit_empty = self.long.timers.reload_exit_not_empty
				self.long.reload_speed_multiplier = 2.7
	
			--DECA Technologies Compound Bow
				self.elastic.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase",
						"enter_steelsight_speed_multiplier"
					}
				}
				self.elastic.damage_type = "anti_materiel"
				self.elastic.has_description = true
				self.elastic.desc_id = "bm_bow_sc_desc"
				self.elastic.timers = {
					reload_not_empty = 1.5,
					reload_empty = 1.5,
					unequip = 0.85,
					equip = 0.85
				}		
				self.elastic.kick = self.stat_info.kick_tables.none			
				self.elastic.charge_data.max_t = 0.7
				self.elastic.not_allowed_in_bleedout = false
				self.elastic.AMMO_MAX = 20
				self.elastic.panic_suppression_chance = 0.05
				self.elastic.ignore_damage_upgrades = true
				self.elastic.supported = true
				self.elastic.ads_speed = 0.260	
				self.elastic.sprintout_anim_time = 0.5221
				self.elastic.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.elastic.stats = {
					damage = 90,
					spread = 96,
					recoil = 97,
					spread_moving = 12,
					zoom = 1,
					concealment = 30,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.elastic.stats_modifiers = {damage = 4}
				self.elastic.timers.reload_not_empty = 0.9
				self.elastic.timers.reload_empty = self.elastic.timers.reload_not_empty
				self.elastic.timers.reload_exit_not_empty = 0.6
				self.elastic.timers.reload_exit_empty = self.elastic.timers.reload_exit_not_empty
				self.elastic.reload_speed_multiplier = 2.3

		--SECONDARIES

			--Pistol Crossbow
				self.hunter.categories = {
					"crossbow",
					"crossbow_pistol"
				}
				self.hunter.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.hunter.damage_type = "sniper"
				self.hunter.has_description = true
				self.hunter.desc_id = "bm_xbow_sc_desc"
				self.hunter.AMMO_MAX = 15
				self.hunter.panic_suppression_chance = 0.05
				self.hunter.ignore_damage_upgrades = true
				self.hunter.fire_mode_data.fire_rate = 1
				self.hunter.kick = self.stat_info.kick_tables.horizontal_recoil
				self.hunter.supported = true
				self.hunter.ads_speed = 0.200
				self.hunter.stats = {
					damage = 120,
					spread = 96,
					recoil = 89,
					spread_moving = 8,
					zoom = 1,
					concealment = 26,
					suppression = 20,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.hunter.panic_suppression_chance = 0.05
				self.hunter.stats_modifiers = {damage = 2}
				self.hunter.timers.reload_exit_empty = 0.3
				self.hunter.timers.reload_exit_not_empty = 0.3

	--[[     LAUNCHERS     ]]

		--PRIMARIES

			--GL40
				self.gre_m79.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.gre_m79.desc_id = "bm_w_gre_m79_sc_desc"
				self.gre_m79.has_description = true
				self.gre_m79.fire_mode_data.fire_rate = 1.2
				self.gre_m79.kick = self.stat_info.kick_tables.vertical_kick
				self.gre_m79.AMMO_MAX = 10
				self.gre_m79.supported = true
				self.gre_m79.ads_speed = 0.360
				self.gre_m79.stats = {
					damage = 72,
					spread = 91,
					recoil = 73,
					spread_moving = 6,
					zoom = 1,
					concealment = 20,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.gre_m79.panic_suppression_chance = 0.05
				self.gre_m79.sms = 0.85
				self.gre_m79.stats_modifiers = {damage = 10}
				self.gre_m79.reload_speed_multiplier = 1.25
				self.gre_m79.timers.reload_exit_empty = 0.4
				self.gre_m79.timers.reload_exit_not_empty = 0.4

			--Piglet
				self.m32.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}				
				self.m32.kick = self.stat_info.kick_tables.right_kick
				self.m32.has_description = true
				self.m32.desc_id = "bm_m32_sc_desc"
				self.m32.fire_mode_data.fire_rate = 0.6
				self.m32.fire_rate_multiplier = 1.5
				--self.m32.BURST_FIRE = 2
				--self.m32.BURST_FIRE_RATE_MULTIPLIER = 3
				--self.m32.BURST_FIRE_RECOIL_MULTIPLIER = 1.5
				self.m32.AMMO_MAX = 10
				self.m32.supported = true
				self.m32.ads_speed = 0.460
				self.m32.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.m32.stats = {
					damage = 72,
					spread = 26,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 12,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.m32.stats_modifiers = {damage = 10}
				self.m32.sms = 0.85
				self.m32.panic_suppression_chance = 0.05
				self.m32.timers.shotgun_reload_first_shell_offset = 1
				self.m32.reload_speed_multiplier = 1.5
	
			--Commando 101
				self.ray.categories = {"grenade_launcher", "rocket_launcher"}
				self.ray.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}			
				self.ray.use_data.selection_index = 2
				self.ray.has_description = true
				self.ray.desc_id = "bm_ray_sc_desc"
				self.ray.kick = self.stat_info.kick_tables.vertical_kick
				self.ray.timers.reload_not_empty = 6
				self.ray.timers.reload_empty = 6
				self.ray.fire_mode_data.fire_rate = 1.2
				self.ray.CLIP_AMMO_MAX = 4
				self.ray.AMMO_MAX = 8
				self.ray.BURST_FIRE = 4
				self.ray.BURST_DELAY = 2
				self.ray.BURST_FIRE_RATE_MULTIPLIER = 8
				self.ray.supported = true
				self.ray.shake.fire_steelsight_multiplier = -2
				self.ray.ads_speed = 0.540
				self.ray.stats = {
					damage = 300,
					spread = 76,
					recoil = 71,
					spread_moving = 6,
					zoom = 5,
					concealment = 10,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ray.weapon_movement_penalty = 1
				self.ray.sms = 0.8
				self.ray.rms = 0.25
				self.ray.panic_suppression_chance = 0.05
				self.ray.stats_modifiers = {damage = 3}
				self.ray.turret_instakill = true
				self.ray.timers.reload_empty = 6
				self.ray.timers.reload_not_empty = 6
				self.ray.timers.reload_exit_empty = 1.9
				self.ray.timers.reload_exit_not_empty = 1.9

		--SECONDARIES

			--3GL
				self.ms3gl.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.ms3gl.desc_id = "bm_ms3gl_sc_desc"
				self.ms3gl.has_description = true
				--self.ms3gl.green_display = true
				self.ms3gl.timers = {
					shotgun_reload_enter = 1,
					shotgun_reload_exit_empty = 0.9,
					shotgun_reload_exit_not_empty = 0.9,
					shotgun_reload_shell = 1,
					shotgun_reload_first_shell_offset = 0.2,
					unequip = 0.6,
					equip = 0.75
				}
				self.ms3gl.FIRE_MODE = "single"
				self.ms3gl.BURST_FIRE = 3
				self.ms3gl.BURST_DELAY = 1.25
				self.ms3gl.BURST_FIRE_RATE_MULTIPLIER = 3
				self.ms3gl.BURST_COUNT = nil
				self.ms3gl.fire_mode_data = {
					fire_rate = 0.4
				}
				self.ms3gl.burst = nil
				self.ms3gl.AMMO_MAX = 10
				self.ms3gl.kick = self.stat_info.kick_tables.vertical_kick
				self.ms3gl.supported = true
				self.ms3gl.ads_speed = 0.460
				self.ms3gl.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.ms3gl.stats = {
					damage = 36,
					spread = 18,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 19,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.ms3gl.panic_suppression_chance = 0.05
				self.ms3gl.sms = 0.85
				self.ms3gl.stats_modifiers = {damage = 10}
				self.ms3gl.always_use_empty_reload = true

			--Arbiter, duh
				self.arbiter.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.arbiter.fire_mode_data.fire_rate = 0.5
				self.arbiter.CLIP_AMMO_MAX = 5
				self.arbiter.tactical_reload = 1
				self.arbiter.AMMO_MAX = 6
				self.arbiter.supported = true
				self.arbiter.ads_speed = 0.460
				self.arbiter.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.arbiter.stats = {
					damage = 60,
					spread = 26,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 13,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.arbiter.stats_modifiers = {damage = 10}
				self.arbiter.sms = 0.85
				self.arbiter.panic_suppression_chance = 0.05
				self.arbiter.kick = self.stat_info.kick_tables.vertical_kick
				self.arbiter.reload_speed_multiplier = 0.85
				self.arbiter.timers.reload_exit_empty = 0.84
				self.arbiter.timers.reload_exit_not_empty = 0.9

			--Compact 40mm
				self.slap.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}			
				self.slap.desc_id = "bm_40mm_weapon_sc_desc"
				self.slap.has_description = false
				self.slap.fire_mode_data.fire_rate = 1.2
				self.slap.kick = self.stat_info.kick_tables.vertical_kick
				self.slap.AMMO_MAX = 5
				self.slap.supported = true
				self.slap.ads_speed = 0.360
				self.slap.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.slap.stats = {
					damage = 72,
					spread = 91,
					recoil = 73,
					spread_moving = 6,
					zoom = 1,
					concealment = 22,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.slap.panic_suppression_chance = 0.05
				self.slap.sms = 0.85
				self.slap.stats_modifiers = {damage = 10}
				self.slap.timers.reload_empty = 3
				self.slap.timers.reload_not_empty = 3
				self.slap.timers.reload_exit_empty = 1.2
				self.slap.timers.reload_exit_not_empty = 1.2
				self.slap.reload_speed_multiplier = 1.2

			--China Puff
				self.china.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.china.desc_id = "bm_40mm_weapon_sc_desc"
				self.china.has_description = true
				self.china.fire_mode_data.fire_rate = 1.3
				self.china.fire_rate_multiplier = 0.75
				self.china.AMMO_MAX = 5
				self.china.kick = self.stat_info.kick_tables.vertical_kick
				self.china.supported = true
				self.china.ads_speed = 0.500
				self.china.stats = {
					damage = 72,
					spread = 26,
					recoil = 63,
					spread_moving = 6,
					zoom = 1,
					concealment = 12,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.china.panic_suppression_chance = 0.05
				self.china.sms = 0.85
				self.china.stats_modifiers = {damage = 10}
				self.china.reload_speed_multiplier = 0.8
				self.china.timers.shotgun_reload_first_shell_offset = 0.5
				self.china.timers.shotgun_reload_exit_empty = 1.4
				self.china.timers.shotgun_reload_exit_not_empty = 0.7

			--HRL-7
				self.rpg7.categories = {"grenade_launcher", "rocket_launcher"}
				self.rpg7.upgrade_blocks = {
					weapon = {
						"clip_ammo_increase"
					}
				}		
				self.rpg7.kick = self.stat_info.kick_tables.vertical_kick
				self.rpg7.has_description = true
				self.rpg7.desc_id = "bm_rocket_launcher_sc_desc"
				self.rpg7.fire_mode_data.fire_rate = 3
				self.rpg7.AMMO_MAX = 3
				self.rpg7.supported = true
				self.rpg7.ads_speed = 0.460
				self.rpg7.damage_falloff = {
					start_dist = 3000,
					end_dist = 9000,
					min_mult = 1
				}
				self.rpg7.stats = {
					damage = 400,
					spread = 76,
					recoil = 71,
					spread_moving = 6,
					zoom = 1,
					concealment = 10,
					suppression = 1,
					alert_size = 2,
					extra_ammo = 101,
					total_ammo_mod = 100,
					value = 1,
					reload = 20
				}
				self.rpg7.weapon_movement_penalty = 1
				self.rpg7.sms = 0.8
				self.rpg7.rms = 0.5
				self.rpg7.panic_suppression_chance = 0.05
				self.rpg7.stats_modifiers = {damage = 3}
				self.rpg7.reload_speed_multiplier = 1.1
				self.rpg7.turret_instakill = true
				self.rpg7.timers.reload_empty = 4.1
				self.rpg7.timers.reload_not_empty = 4.1
				self.rpg7.timers.reload_exit_empty = 3.1
				self.rpg7.timers.reload_exit_not_empty = 3.1



	--OVE9000 SAW
		self.saw.has_description = true
		self.saw.desc_id = "bm_ap_saw_sc_desc"
		self.saw.CLIP_AMMO_MAX = 20
		self.saw.AMMO_MAX = 40
		self.saw.kick = self.stat_info.kick_tables.none
		self.saw.supported = true
		self.saw.stats = {
			alert_size = 2,
			suppression = 8,
			zoom = 1,
			spread = 1,
			recoil = 97,
			spread_moving = 7,
			damage = 90,
			concealment = 20,
			value = 1,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20
		}
		self.saw.stats_modifiers = nil
		self.saw.panic_suppression_chance = 0.05
		self.saw.timers.reload_exit_not_empty = 1.8
		self.saw.timers.reload_not_empty = 3.75
		self.saw.timers.reload_exit_empty = 1.8
		self.saw.timers.reload_empty = 3.75
		self.saw_secondary.kick = self.stat_info.kick_tables.none
		self.saw_secondary.has_description = true
		self.saw_secondary.desc_id = "bm_ap_saw_sc_desc"
		self.saw_secondary.CLIP_AMMO_MAX = 20
		self.saw_secondary.AMMO_MAX = 20
		self.saw_secondary.supported = true
		self.saw_secondary.stats = {
			alert_size = 2,
			suppression = 8,
			zoom = 1,
			spread = 1,
			recoil = 97,
			spread_moving = 7,
			damage = 90,
			concealment = 20,
			value = 1,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20
		}
		self.saw_secondary.stats_modifiers = nil
		self.saw_secondary.panic_suppression_chance = 0.05
		self.saw_secondary.timers.reload_exit_not_empty = 1.8
		self.saw_secondary.timers.reload_not_empty = 3.75
		self.saw_secondary.timers.reload_exit_empty = 1.8
		self.saw_secondary.timers.reload_empty = 3.75
	


	--[[     DISABLED SHIT NO ONE CARES ABOUT     ]]--
	
		--Akimbo MP40
		--DISABLED--
			self.x_erma.use_data.selection_index = 5			
			self.x_erma.CLIP_AMMO_MAX = 64
			self.x_erma.AMMO_MAX = 150
			self.x_erma.fire_mode_data.fire_rate = 0.10909090909
			self.x_erma.single.fire_rate = 0.10909090909
			self.x_erma.CAN_TOGGLE_FIREMODE = true
			self.x_erma.kick = self.stat_info.kick_tables.moderate_kick
			self.x_erma.supported = true
			self.x_erma.stats = {
				damage = 24,
				spread = 66,
				recoil = 79,
				spread_moving = 8,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 5,
				reload = 20
			}
			self.x_erma.stats_modifiers = nil
			self.x_erma.panic_suppression_chance = 0.05	
	
		--Akimbo Para
		--DISABLED--
			self.x_olympic.use_data.selection_index = 5			
			self.x_olympic.CLIP_AMMO_MAX = 60
			self.x_olympic.AMMO_MAX = 180
			self.x_olympic.fire_mode_data.fire_rate = 0.075
			self.x_olympic.single.fire_rate = 0.075
			self.x_olympic.kick = self.stat_info.kick_tables.even_recoil
			self.x_olympic.panic_suppression_chance = 0.05
			self.x_olympic.supported = true
			self.x_olympic.stats = {
				damage = 20,
				spread = 56,
				recoil = 75,
				spread_moving = 8,
				zoom = 1,
				concealment = 24,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}	
			self.x_olympic.stats_modifiers = nil	
	
		--Akimbo CR805
		--DISABLED--
			self.x_hajk.use_data.selection_index = 5				
			self.x_hajk.fire_mode_data.fire_rate = 0.075
			self.x_hajk.single.fire_rate = 0.075
			self.x_hajk.CLIP_AMMO_MAX = 60
			self.x_hajk.AMMO_MAX = 150
			self.x_hajk.ADAPTIVE_BURST_SIZE = false						
			self.x_hajk.BURST_FIRE = 2				
			self.x_hajk.kick = self.stat_info.kick_tables.moderate_kick
			self.x_hajk.panic_suppression_chance = 0.05
			self.x_hajk.supported = true
			self.x_hajk.stats = {
				damage = 24,
				spread = 71,
				recoil = 77,
				spread_moving = 6,
				zoom = 1,
				concealment = 21,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}	
			self.x_hajk.stats_modifiers = nil
	
		--Akimbo Kross Vertex
		--DISABLED--	
			self.x_polymer.use_data.selection_index = 5			
			self.x_polymer.CLIP_AMMO_MAX = 60
			self.x_polymer.AMMO_MAX = 120
			self.x_polymer.fire_mode_data.fire_rate = 0.05
			self.x_polymer.single.fire_rate = 0.05
			self.x_polymer.BURST_FIRE = 2										
			self.x_polymer.ADAPTIVE_BURST_SIZE = false										
			self.x_polymer.kick = self.stat_info.kick_tables.vertical_kick
			self.x_polymer.supported = true
			self.x_polymer.stats = {
				damage = 30,
				spread = 56,
				recoil = 69,
				spread_moving = 8,
				zoom = 1,
				concealment = 24,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_polymer.stats_modifiers = nil
			self.x_polymer.panic_suppression_chance = 0.05
	
		--Akimbo Jackal
		--DISABLED--	
			self.x_schakal.use_data.selection_index = 5
			self.x_schakal.fire_mode_data.fire_rate = 0.1
			self.x_schakal.single.fire_rate = 0.1
			self.x_schakal.AMMO_MAX = 120
			self.x_schakal.BURST_FIRE = 2
			self.x_schakal.ADAPTIVE_BURST_SIZE = false				
			self.x_schakal.CLIP_AMMO_MAX = 50
			self.x_schakal.kick = self.stat_info.kick_tables.even_recoil
			self.x_schakal.panic_suppression_chance = 0.05
			self.x_schakal.supported = true
			self.x_schakal.stats = {
				damage = 30,
				spread = 71,
				recoil = 75,
				spread_moving = 14,
				zoom = 1,
				concealment = 23,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}	
			self.x_schakal.stats_modifiers = nil
	
		--Akimbo Chicago typewriter
		--DISABLED--
			self.x_m1928.use_data.selection_index = 5
			self.x_m1928.fire_mode_data.fire_rate = 0.075
			self.x_m1928.CAN_TOGGLE_FIREMODE = true
			self.x_m1928.single.fire_rate = 0.075
			self.x_m1928.CLIP_AMMO_MAX = 100
			self.x_m1928.AMMO_MAX = 180
			self.x_m1928.kick = self.stat_info.kick_tables.even_recoil
			self.x_m1928.supported = true
			self.x_m1928.stats = {
				damage = 24,
				spread = 56,
				recoil = 73,
				spread_moving = 6,
				zoom = 1,
				concealment = 22,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.x_m1928.stats_modifiers = nil
			self.x_m1928.panic_suppression_chance = 0.05	
	
		--Akimbo Jacket's Piece
		--DISABLED--
			self.x_cobray.use_data.selection_index = 5		
			self.x_cobray.timers.reload_not_empty = 2.00
			self.x_cobray.timers.reload_empty = 2.7
			self.x_cobray.CLIP_AMMO_MAX = 120
			self.x_cobray.NR_CLIPS_MAX = 4
			self.x_cobray.AMMO_MAX = 120
			self.x_cobray.kick = self.stat_info.kick_tables.moderate_kick
			self.x_cobray.fire_mode_data.fire_rate = 0.06
			self.x_cobray.CAN_TOGGLE_FIREMODE = true
			self.x_cobray.single.fire_rate = 0.06
			self.x_cobray.supported = true
			self.x_cobray.stats = {
				damage = 30,
				spread = 71,
				recoil = 69,
				spread_moving = 8,
				zoom = 1,
				concealment = 22,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_cobray.stats_modifiers = nil
			self.x_cobray.panic_suppression_chance = 0.05
	
		--Akimbo Tatonka
		--DISABLED--
			self.x_coal.use_data.selection_index = 5
			self.x_coal.AMMO_MAX = 200
			self.x_coal.CLIP_AMMO_MAX = 128
			self.x_coal.fire_mode_data.fire_rate = 0.08823529411
			self.x_coal.single.fire_rate = 0.08823529411
			self.x_coal.panic_suppression_chance = 0.05
			self.x_coal.kick = self.stat_info.kick_tables.moderate_right_kick
			self.x_coal.supported = true
			self.x_coal.stats = {
				damage = 18,
				spread = 66,
				recoil = 79,
				spread_moving = 9,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_coal.stats_modifiers = nil
			self.x_coal.panic_suppression_chance = 0.05	
	
		--Akimbo Spec Ops (Akimbo MP7)
		--DISABLED--	
			self.x_mp7.use_data.selection_index = 5		
			self.x_mp7.CLIP_AMMO_MAX = 40
			self.x_mp7.AMMO_MAX = 150
			self.x_mp7.fire_mode_data.fire_rate = 0.06315789473
			self.x_mp7.CAN_TOGGLE_FIREMODE = true
			self.x_mp7.single.fire_rate = 0.06315789473
			self.x_mp7.kick = self.stat_info.kick_tables.even_recoil
			self.x_mp7.supported = true
			self.x_mp7.stats = {
				damage = 24,
				spread = 51,
				recoil = 71,
				spread_moving = 7,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 7,
				reload = 20
			}
			self.x_mp7.stats_modifiers = nil
			self.x_mp7.panic_suppression_chance = 0.05
	
		--Akimbo Kobus 90
		--DISABLED--	
			self.x_p90.use_data.selection_index = 5			
			self.x_p90.AMMO_MAX = 200
			self.x_p90.fire_mode_data.fire_rate = 0.06666666666
			self.x_p90.single.fire_rate = 0.06666666666
			self.x_p90.panic_suppression_chance = 0.05
			self.x_p90.kick = self.stat_info.kick_tables.even_recoil
			self.x_p90.supported = true
			self.x_p90.stats = {
				damage = 18,
				spread = 61,
				recoil = 79,
				spread_moving = 9,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_p90.stats_modifiers = nil
			self.x_p90.panic_suppression_chance = 0.05
	
		--Akimbo Grimms
		--DISABLED--
			self.x_basset.use_data.selection_index = 5			
			self.x_basset.tactical_akimbo = true
			self.x_basset.rays = 8
			self.x_basset.CLIP_AMMO_MAX = 12
			self.x_basset.AMMO_MAX = 120
			self.x_basset.fire_mode_data = {fire_rate = 0.1}
			self.x_basset.auto = {fire_rate = 0.1}
			self.x_basset.kick = self.stat_info.kick_tables.moderate_kick
			self.x_basset.panic_suppression_chance = 0.05
			self.x_basset.supported = true
			self.x_basset.stats = {
				zoom = 1,
				total_ammo_mod = 100,
				damage = 30,
				alert_size = 2,
				spread = 21,
				spread_moving = 8,
				recoil = 73,
				value = 1,
				extra_ammo = 101,
				reload = 20,
				suppression = 8,
				concealment = 24
			}
			self.x_basset.stats_modifiers = nil
				
		--Akimbo Goliath 12g
		--DISABLED--
			self.x_rota.use_data.selection_index = 5			
			self.x_rota.upgrade_blocks = nil
			self.x_rota.AMMO_MAX = 80
			self.x_rota.rays = 8 * 1 * 1 * 1 * 1 * 1 * 1
			self.x_rota.kick = self.stat_info.kick_tables.vertical_kick
			self.x_rota.fire_mode_data.fire_rate = 0.13953488372
			self.x_rota.single.fire_rate = 0.13953488372
			self.x_rota.panic_suppression_chance = 0.05
			self.x_rota.supported = true
			self.x_rota.stats = {
				damage = 45,
				spread = 11,
				recoil = 71,
				spread_moving = 7,
				zoom = 1,
				concealment = 22,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}	
			self.x_rota.stats_modifiers = nil
	
		--Akimbo CMP
		--DISABLED--	
			self.x_mp9.use_data.selection_index = 5				
			self.x_mp9.CLIP_AMMO_MAX = 40
			self.x_mp9.single.fire_rate = 0.06666666666
			self.x_mp9.fire_mode_data.fire_rate = 0.06666666666
			self.x_mp9.AMMO_MAX = 200
			self.x_mp9.kick = self.stat_info.kick_tables.even_recoil
			self.x_mp9.supported = true
			self.x_mp9.stats = {
				damage = 18,
				spread = 71,
				recoil = 79,
				spread_moving = 8,
				zoom = 1,
				concealment = 30,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_mp9.stats_modifiers = nil
			self.x_mp9.panic_suppression_chance = 0.05
	
		--Akimbo Patchett
		--DISABLED--	
			self.x_sterling.use_data.selection_index = 5				
			self.x_sterling.CLIP_AMMO_MAX = 40
			self.x_sterling.AMMO_MAX = 150
			self.x_sterling.fire_mode_data.fire_rate = 0.10909090909
			self.x_sterling.single.fire_rate = 0.10909090909
			self.x_sterling.kick = self.stat_info.kick_tables.right_recoil
			self.x_sterling.supported = true
			self.x_sterling.stats = {
				damage = 24,
				spread = 61,
				recoil = 79,
				spread_moving = 8,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 7,
				reload = 20
			}
			self.x_sterling.stats_modifiers = nil
			self.x_sterling.panic_suppression_chance = 0.05
	
		--Akimbo Blaster 9mm
		--DISABLED--	
			self.x_tec9.use_data.selection_index = 5			
			self.x_tec9.AMMO_MAX = 150
			self.x_tec9.CLIP_AMMO_MAX = 40
			self.x_tec9.fire_mode_data.fire_rate = 0.06
			self.x_tec9.single.fire_rate = 0.06
			self.x_tec9.kick = self.stat_info.kick_tables.even_recoil
			self.x_tec9.supported = true
			self.x_tec9.stats = {
				damage = 24,
				spread = 61,
				recoil = 71,
				spread_moving = 10,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 7,
				reload = 20
			}
			self.x_tec9.stats_modifiers = nil
			self.x_tec9.panic_suppression_chance = 0.05
	
		--Akimbo Uzi
		--DISABLED--	
			self.x_uzi.use_data.selection_index = 5		
			self.x_uzi.AMMO_MAX = 120
			self.x_uzi.CLIP_AMMO_MAX = 44
			self.x_uzi.fire_mode_data.fire_rate = 0.086
			self.x_uzi.single.fire_rate = 0.086
			self.x_uzi.kick = self.stat_info.kick_tables.even_recoil
			self.x_uzi.supported = true
			self.x_uzi.stats = {
				damage = 30,
				spread = 61,
				recoil = 79,
				spread_moving = 8,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 7,
				reload = 20
			}
			self.x_uzi.stats_modifiers = nil
			self.x_uzi.panic_suppression_chance = 0.05	
	
		--Akimbo Parabellum
		--DISABLED--	
			self.x_breech.use_data.selection_index = 5			
			self.x_breech.AMMO_MAX = 180
			self.x_breech.CLIP_AMMO_MAX = 24
			self.x_breech.fire_mode_data.fire_rate = 0.08571428571
			self.x_breech.single.fire_rate = 0.08571428571
			self.x_breech.kick = self.stat_info.kick_tables.even_recoil
			self.x_breech.supported = true
			self.x_breech.stats = {
				damage = 20,
				spread = 81,
				recoil = 81,
				spread_moving = 9,
				zoom = 1,
				concealment = 31,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_breech.stats_modifiers = nil
			self.x_breech.panic_suppression_chance = 0.05
	
		--akimbo Broomstick
		--DISABLED--	
			self.x_c96.use_data.selection_index = 5				
			self.x_c96.AMMO_MAX = 120
			self.x_c96.FIRE_MODE = "single"
			self.x_c96.sounds.fire = "c96_fire"
			self.x_c96.sounds.fire_single = "c96_fire"
			self.x_c96.sounds.fire_auto = "g18c_fire"
			self.x_c96.sounds.stop_fire = "g18c_stop"
			self.x_c96.CAN_TOGGLE_FIREMODE = true
			self.x_c96.fire_mode_data.fire_rate = 0.06
			self.x_c96.single.fire_rate = 0.06
			self.x_c96.kick = self.stat_info.kick_tables.moderate_kick
			self.x_c96.supported = true
			self.x_c96.stats = {
				damage = 30,
				spread = 66,
				recoil = 75,
				spread_moving = 8,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_c96.stats_modifiers = nil
			self.x_c96.panic_suppression_chance = 0.05
	
		--Akimbo Leo
		--DISABLED--	
			self.x_hs2000.use_data.selection_index = 5			
			self.x_hs2000.CLIP_AMMO_MAX = 28
			self.x_hs2000.AMMO_MAX = 120
			self.x_hs2000.FIRE_MODE = "single"
			self.x_hs2000.fire_mode_data = {}
			self.x_hs2000.fire_mode_data.fire_rate = 0.08571428571
			self.x_hs2000.single = {}
			self.x_hs2000.single.fire_rate = 0.08571428571
			self.x_hs2000.kick = self.stat_info.kick_tables.left_recoil
			self.x_hs2000.supported = true
			self.x_hs2000.stats = {
				damage = 30,
				spread = 66,
				recoil = 79,
				spread_moving = 7,
				zoom = 1,
				concealment = 27,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 4,
				reload = 20
			}
			self.x_hs2000.stats_modifiers = nil
			self.x_hs2000.panic_suppression_chance = 0.05
	
		--Akimbo Signature .40
		--DISABLED--	
			self.x_p226.use_data.selection_index = 5				
			self.x_p226.AMMO_MAX = 150
			self.x_p226.CLIP_AMMO_MAX = 28
			self.x_p226.fire_mode_data.fire_rate = 0.08571428571
			self.x_p226.single.fire_rate = 0.08571428571
			self.x_p226.kick = self.stat_info.kick_tables.even_recoil
			self.x_p226.supported = true
			self.x_p226.stats = {
				damage = 40,
				spread = 76,
				recoil = 79,
				spread_moving = 7,
				zoom = 1,
				concealment = 28,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 4,
				reload = 20
			}
			self.x_p226.panic_suppression_chance = 0.05
	
		--Akimbo White Streak
		--DISABLED--	
			self.x_pl14.use_data.selection_index = 5		
			self.x_pl14.fire_mode_data.fire_rate = 0.08571428571
			self.x_pl14.single.fire_rate = 0.08571428571
			self.x_pl14.CLIP_AMMO_MAX = 20
			self.x_pl14.AMMO_MAX = 150
			self.x_pl14.kick = self.stat_info.kick_tables.even_recoil
			self.x_pl14.supported = true
			self.x_pl14.stats = {
				damage = 24,
				spread = 81,
				recoil = 79,
				spread_moving = 5,
				zoom = 1,
				concealment = 30,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_pl14.stats_modifiers = nil
			self.x_pl14.panic_suppression_chance = 0.05
	
		--Akimbo Gruber Kurz
		--DISABLED--	
			self.x_ppk.use_data.selection_index = 5				
			self.x_ppk.AMMO_MAX = 180
			self.x_ppk.CLIP_AMMO_MAX = 24
			self.x_ppk.fire_mode_data.fire_rate = 0.08571428571
			self.x_ppk.single.fire_rate = 0.08571428571
			self.x_ppk.kick = self.stat_info.kick_tables.even_recoil
			self.x_ppk.supported = true
			self.x_ppk.stats = {
				damage = 20,
				spread = 86,
				recoil = 81,
				spread_moving = 9,
				zoom = 1,
				concealment = 31,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_ppk.stats_modifiers = nil
			self.x_ppk.panic_suppression_chance = 0.05
	
		--Akimbo Baby Deagle
		--DISABLED--	
			self.x_sparrow.use_data.selection_index = 5			
			self.x_sparrow.AMMO_MAX = 150
			self.x_sparrow.kick = self.stat_info.kick_tables.even_recoil
			self.x_sparrow.fire_mode_data.fire_rate = 0.08571428571
			self.x_sparrow.single.fire_rate = 0.08571428571
			self.x_sparrow.supported = true
			self.x_sparrow.stats = {
				damage = 24,
				spread = 81,
				recoil = 79,
				spread_moving = 5,
				zoom = 1,
				concealment = 29,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_sparrow.stats_modifiers = nil
			self.x_sparrow.panic_suppression_chance = 0.05
	
		--Akimbo Swedish K
		--DISABLED--
			self.x_m45.use_data.selection_index = 5				
			self.x_m45.CLIP_AMMO_MAX = 60
			self.x_m45.AMMO_MAX = 150
			self.x_m45.kick = self.stat_info.kick_tables.moderate_kick
			self.x_m45.supported = true
			self.x_m45.stats = {
				damage = 24,
				spread = 61,
				recoil = 79,
				spread_moving = 8,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 5,
				reload = 20
			}
			self.x_m45.stats_modifiers = nil
			self.x_m45.panic_suppression_chance = 0.05
	
		--Akimbo Signature SMG
		--DISABLED--	
			self.x_shepheard.use_data.selection_index = 5
			self.x_shepheard.CLIP_AMMO_MAX = 60
			self.x_shepheard.fire_mode_data.fire_rate = 0.07058823529
			self.x_shepheard.single.fire_rate = 0.07058823529
			self.x_shepheard.panic_suppression_chance = 0.05
			self.x_shepheard.kick = self.stat_info.kick_tables.moderate_kick
			self.x_shepheard.AMMO_MAX = 180
			self.x_shepheard.supported = true
			self.x_shepheard.stats = {
				damage = 20,
				spread = 61,
				recoil = 77,
				spread_moving = 8,
				zoom = 1,
				concealment = 28,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.x_shepheard.stats_modifiers = nil
			self.x_shepheard.panic_suppression_chance = 0.05
	
		--Akimbo M13
		--DISABLED--	
			self.x_legacy.use_data.selection_index = 5		
			self.x_legacy.fire_mode_data.fire_rate = 0.08571428571
			self.x_legacy.single.fire_rate = 0.08571428571
			self.x_legacy.CLIP_AMMO_MAX = 24
			self.x_legacy.AMMO_MAX = 150
			self.x_legacy.kick = self.stat_info.kick_tables.left_recoil
			self.x_legacy.supported = true
			self.x_legacy.stats = {
				damage = 24,
				spread = 79,
				recoil = 79,
				spread_moving = 5,
				zoom = 1,
				concealment = 29,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}		
			self.x_legacy.stats_modifiers = nil
			self.x_legacy.panic_suppression_chance = 0.05
	
		--Akimbo Beretta Auto
		--DISABLED
			self.x_beer.use_data.selection_index = 5
			self.x_beer.supported = true
	
		--Akimbo AK Gen 21 Tactical
		--DISABLED-- 
			self.x_vityaz.use_data.selection_index = 5
		
		--Akimbo Miyaka 10
		--DISABLED--	
			self.x_pm9.use_data.selection_index = 5	
		
	
	
	--[[     Restoration Weapons     ]]--
	
	--Phoenix .500
	if self.shatters_fury then
		self.shatters_fury.recategorize = { "heavy_pis" }
		self.shatters_fury.damage_type = "heavy_pistol"
		self.shatters_fury.always_play_anims = true
		self.shatters_fury.fire_mode_data.fire_rate = 0.1935
		self.shatters_fury.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"	
		--if restoration.Options:GetValue("OTHER/ComboSounds") then
			self.shatters_fury.sounds.fire_single = "pmkr45_fire"
			self.shatters_fury.sounds.stop_fire = "b682_fire" --"hajk_x_fire_single
		--end
		self.shatters_fury.weapon_hold = "model3"
		self.shatters_fury.AMMO_MAX = 40
		self.shatters_fury.CLIP_AMMO_MAX = 5
		self.shatters_fury.kick = self.stat_info.kick_tables.vertical_kick
		self.shatters_fury.supported = true
		self.shatters_fury.ads_speed = 0.340
		self.shatters_fury.damage_falloff = {
			start_dist = 3500,
			end_dist = 6000,
			min_mult = 0.5
		}
		self.shatters_fury.stats = {
			damage = 90,
			spread = 81,
			recoil = 39,
			spread_moving = 9,
			zoom = 1,
			concealment = 22,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.shatters_fury.stats_modifiers = nil
		self.shatters_fury.panic_suppression_chance = 0.05
		self.shatters_fury.has_description = true
		self.shatters_fury.desc_id = "bm_wp_shatters_fury_desc"
		self.shatters_fury.can_shoot_through_enemy = true
		self.shatters_fury.can_shoot_through_shield = true
		self.shatters_fury.can_shoot_through_wall = true
		self.shatters_fury.armor_piercing_chance = 1
		self.shatters_fury.object_damage_mult = 2
		--self.shatters_fury.animations.reload_name_id = "chinchilla"
		self.shatters_fury.reload_speed_multiplier = 0.9
		self.shatters_fury.timers = deep_clone(self.new_raging_bull.timers)
		--this line doesn't do shit
		--self.shatters_fury.custom = true
	end
	
	--OICW
	if self.osipr then
		self.osipr.recategorize = { "light_ar" }
		self.osipr.damage_type = "assault_rifle"
		self.osipr.is_bullpup = true
		self.osipr.nato = true
		self.osipr.tactical_reload = 1		
		self.osipr.AMMO_MAX = 120
		self.osipr.CLIP_AMMO_MAX = 30
		self.osipr.fire_mode_data.fire_rate = 0.075
		self.osipr.auto.fire_rate = 0.075
		self.osipr.kick = self.stat_info.kick_tables.moderate_kick
		self.osipr.supported = true
		self.osipr.ads_speed = 0.360
		self.osipr.damage_falloff = {
			start_dist = 2400,
			end_dist = 6200,
			min_mult = 0.4166
		}
		self.osipr.stats = {
			damage = 24,
			spread = 81,
			recoil = 85,
			spread_moving = 6,
			zoom = 1,
			concealment = 20,
			suppression = 10,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.osipr.stats_modifiers = nil
		self.osipr.timers.reload_not_empty = 2.16
		self.osipr.timers.reload_exit_not_empty = 0.9
		self.osipr.timers.reload_empty = 3.2	
		self.osipr.timers.reload_exit_empty = 0.9
		self.osipr.panic_suppression_chance = 0.05
		self.osipr.has_description = true
		self.osipr.desc_id = "bm_w_osipr_desc"
		self.osipr.custom = false	--TEMP fix for BeardLib sync
	end
	
	if self.osipr_gl then
		self.osipr_gl.AMMO_MAX = 9
		self.osipr_gl.tactical_reload = 1
		self.osipr_gl.is_bullpup = true
		self.osipr_gl.CLIP_AMMO_MAX = 5
		self.osipr_gl.fire_mode_data.fire_rate = 0.5
		self.osipr_gl.kick = self.stat_info.kick_tables.vertical_kick
		self.osipr_gl.supported = true
		self.osipr_gl.use_data.selection_index = 4
		self.osipr_gl.green_display = true
		self.osipr_gl.ads_speed = 0.360
		self.osipr_gl.damage_falloff = {
			start_dist = 3000,
			end_dist = 9000,
			min_mult = 1
		}
		self.osipr_gl.stats = {
			damage = 60,
			spread = 26,
			recoil = 71,
			spread_moving = 6,
			zoom = 1,
			concealment = 20,
			suppression = 1,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.osipr_gl.stats_modifiers = nil
		self.osipr_gl.sms = 0.85
		self.osipr_gl.timers.reload_not_empty = 3.34
		self.osipr_gl.timers.reload_exit_not_empty = 0.8
		self.osipr_gl.timers.reload_empty = 4.5		
		self.osipr_gl.timers.reload_exit_empty = 0.6
		self.osipr_gl.panic_suppression_chance = 0.05
		self.osipr_gl.custom = false	--Temp fix for BeardLib sync 
		self.osipr_gl_npc.sounds.prefix = "contrabandm203_npc"
		self.osipr_gl_npc.use_data.selection_index = 2
		self.osipr_gl_npc.DAMAGE = 2
		self.osipr_gl_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
		self.osipr_gl_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
		self.osipr_gl_npc.no_trail = true
		self.osipr_gl_npc.CLIP_AMMO_MAX = 3
		self.osipr_gl_npc.NR_CLIPS_MAX = 1
		self.osipr_gl_npc.auto.fire_rate = 0.1
		self.osipr_gl_npc.hold = "rifle"
		self.osipr_gl_npc.alert_size = 2800
		self.osipr_gl_npc.suppression = 1
		self.osipr_gl_npc.FIRE_MODE = "auto"
	end

	--Anubis .45
	if self.socom then
		self.socom.recategorize = { "heavy_pis" }
		self.socom.damage_type = "heavy_pistol"	
		self.socom.timers = {
			reload_not_empty = 1.5435,
			reload_empty = 2.226,
			unequip = 0.5,
			equip = 0.35
		}	
		self.socom.tactical_reload = 1	
		self.socom.fire_mode_data.fire_rate = 0.08571428571
		self.socom.single.fire_rate = 0.08571428571
		self.socom.CLIP_AMMO_MAX = 12
		self.socom.AMMO_MAX = 40
		self.socom.kick = self.stat_info.kick_tables.even_recoil
		self.socom.supported = true
		self.socom.ads_speed = 0.260
		self.socom.damage_falloff = {
			start_dist = 1800,
			end_dist = 4000,
			min_mult = 0.2
		}
		self.socom.stats = {
			damage = 45,
			spread = 65,
			recoil = 87,
			spread_moving = 5,
			zoom = 1,
			concealment = 25,
			suppression = 9,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.socom.stats_modifiers = nil
		self.socom.panic_suppression_chance = 0.05
		self.socom.animations.reload_name_id = "sparrow"
		self.socom.timers.reload_exit_empty = 0.5
		self.socom.timers.reload_exit_not_empty = 0.65
	end
	
	--Akimbo Anubis .45
	if self.x_socom then
		self.x_socom.recategorize = { "heavy_pis" }
		self.x_socom.damage_type = "heavy_pistol"
		self.x_socom.tactical_reload = 2
		self.x_socom.BURST_FIRE = 2
		self.x_socom.BURST_FIRE_RATE_MULTIPLIER = 2
		self.x_socom.fire_mode_data.fire_rate = 0.08571428571
		self.x_socom.CLIP_AMMO_MAX = 24
		self.x_socom.AMMO_MAX = 80
		self.x_socom.kick = self.stat_info.kick_tables.even_recoil
		self.x_socom.supported = true
		self.x_socom.ads_speed = 0.260
		self.x_socom.damage_falloff = {
			start_dist = 1800,
			end_dist = 4000,
			min_mult = 0.2
		}
		self.x_socom.stats = {
			damage = 45,
			spread = 55,
			recoil = 77,
			spread_moving = 5,
			zoom = 1,
			concealment = 25,
			suppression = 9,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.x_socom.stats_modifiers = nil
		self.x_socom.panic_suppression_chance = 0.05
		self.x_socom.timers.reload_exit_empty = 0.55
		self.x_socom.timers.reload_exit_not_empty = 0.65
	end
	
	--[[     Custom weapons below     ]]--


	if self.toym16 then --Gambyt's Toy M16
		self.toym16.CLIP_AMMO_MAX = 150
		self.toym16.AMMO_MAX = 900
		self.toym16.supported = true
		self.toym16.ads_speed = 0.220
		self.toym16.damage_falloff = {
			start_dist = 500,
			end_dist = 3000,
			min_mult = 0.5
		}
		self.toym16.stats = {
			damage = 4,
			spread = 100,
			recoil = 97,
			zoom = 1,
			concealment = 32,
			suppression = 1,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.toym16.kick = self.stat_info.kick_tables.none
		self.toym16.panic_suppression_chance = 0.05
		self.toym16.shake = {
			fire_multiplier = 0.01,
			fire_steelsight_multiplier = 0.01,
			bypass_global_shake = true
		}
		self.toym16.timers.reload_not_empty = 2.10
		self.toym16.timers.reload_empty = 2.9 		
		self.toym16.timers.reload_exit_empty = 0.4
		self.toym16.timers.reload_exit_not_empty = 0.5
	end

	if self.toy1911 then --Gambyt's Toy M1911
		self.toy1911.CLIP_AMMO_MAX = 90
		self.toy1911.AMMO_MAX = 450
		self.toy1911.supported = true
		self.toy1911.ads_speed = 0.200
		self.toy1911.damage_falloff = {
			start_dist = 250,
			end_dist = 1500,
			min_mult = 0.5
		}
		self.toy1911.stats = {
			damage = 4,
			spread = 100,
			recoil = 97,
			zoom = 1,
			concealment = 32,
			suppression = 1,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.toy1911.kick = self.stat_info.kick_tables.none
		self.toy1911.panic_suppression_chance = 0.05
		self.toy1911.shake = {
			fire_multiplier = 0.01,
			fire_steelsight_multiplier = 0.01,
			bypass_global_shake = true
		}
		self.toy1911.timers.reload_exit_empty = 0.5
		self.toy1911.timers.reload_exit_not_empty = 0.65	
	end

	if self.hpb then --Gambyt's Browning HP	
		self.hpb.recategorize = {"light_pis"}
		self.hpb.has_description = false
		self.hpb.tactical_reload = 1
		self.hpb.fire_mode_data.fire_rate = 0.08571428571
		self.hpb.single.fire_rate = 0.08571428571
		self.hpb.CLIP_AMMO_MAX = 16
		self.hpb.AMMO_MAX = 75
		self.hpb.kick = self.stat_info.kick_tables.even_recoil
		self.hpb.supported = true
		self.hpb.ads_speed = 0.200
		self.hpb.damage_falloff = {
			start_dist = 1500,
			end_dist = 3600,
			min_mult = 0.25
		}
		self.hpb.stats = {
			damage = 24,
			spread = 60,
			recoil = 89,
			spread_moving = 5,
			zoom = 1,
			concealment = 31,
			suppression = 11,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.hpb.stats_modifiers = nil
		self.hpb.panic_suppression_chance = 0.05
		self.hpb.timers.reload_exit_empty = 0.5
		self.hpb.timers.reload_exit_not_empty = 0.65
	end	

	--Vanilla Mod Pack
		if self.lebman then --Gambyt's Vendetta 38 Pistol
			self.lebman.recategorize = {"light_pis"}
			self.lebman.desc_id = nil
			self.lebman.tactical_reload = 1		
			self.lebman.use_data.selection_index = 2
			self.lebman.CLIP_AMMO_MAX = 11
			self.lebman.AMMO_MAX = 120
			self.lebman.fire_mode_data.fire_rate = 0.06
			self.lebman.kick = self.stat_info.kick_tables.moderate_kick
			self.lebman.supported = true
			self.lebman.ads_speed = 0.280
			self.lebman.damage_falloff = {
				start_dist = 1200,
				end_dist = 3000,
				min_mult = 0.3
			}
			self.lebman.stats = {
				damage = 30,
				spread = 50,
				recoil = 77,
				zoom = 1,
				concealment = 26,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.lebman.stats_modifiers = nil
			self.lebman.panic_suppression_chance = 0.05
			self.lebman.reload_speed_multiplier = 1.2
			self.lebman.timers.reload_empty = self.czech.timers.reload_empty
			self.lebman.timers.reload_not_empty = self.czech.timers.reload_not_empty
			self.lebman.timers.reload_exit_empty = self.czech.timers.reload_exit_empty
			self.lebman.timers.reload_exit_not_empty = self.czech.timers.reload_exit_not_empty
			--DISABLED
			self.x_lebman.use_data.selection_index = 5
			self.x_lebman.supported = true
		end
	
		if self.ak5s then --Gambyt's Automat-5/AK5 SMG
			self.ak5s.recategorize = { "light_smg" }
			self.ak5s.desc_id = nil
			self.ak5s.categories = {"smg"}
			self.ak5s.tactical_reload = 1		
			self.ak5s.use_data.selection_index = 2
			self.ak5s.CLIP_AMMO_MAX = 30
			self.ak5s.AMMO_MAX = 150
			self.ak5s.auto.fire_rate = 0.08275862068
			self.ak5s.fire_mode_data.fire_rate = 0.08275862068
			self.ak5s.panic_suppression_chance = 0.05
			self.ak5s.kick = self.stat_info.kick_tables.even_recoil
			self.ak5s.supported = true
			self.ak5s.ads_speed = 0.280
			self.ak5s.damage_falloff = {
				start_dist = 1500,
				end_dist = 4600,
				min_mult = 0.25
			}
			self.ak5s.stats = {
				damage = 24,
				spread = 66,
				recoil = 85,
				spread_moving = 8,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.ak5s.stats_modifiers = nil
			self.ak5s.panic_suppression_chance = 0.05
			self.ak5s.timers.reload_empty = 3.3
			self.ak5s.timers.reload_exit_empty = 0.8
			self.ak5s.timers.reload_not_empty = 2.52
			self.ak5s.timers.reload_exit_not_empty = 0.7
			self.ak5s.reload_speed_multiplier = 1.05
		end	
	
		if self.car9 then --Gambyt's ACAR 9
			self.car9.recategorize = { "light_smg" }
			self.car9.damage_type = "machine_gun"
			self.car9.desc_id = "bm_menu_sc_amcar_desc"
			self.car9.lock_slide = true
			self.car9.sounds.magazine_empty = "wp_pistol_slide_lock"
			self.car9.CLIP_AMMO_MAX = 32
			self.car9.AMMO_MAX = 90
			self.car9.tactical_reload = 1
			self.car9.fire_mode_data.fire_rate = 0.06315789473
			self.car9.kick = self.stat_info.kick_tables.even_recoil
			self.car9.supported = true
			self.car9.ads_speed = 0.280
			self.car9.damage_falloff = {
				start_dist = 1500,
				end_dist = 4000,
				min_mult = 0.3
			}
			self.car9.stats = {
				damage = 20,
				spread = 58,
				recoil = 85,
				spread_moving = 6,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.car9.reload_speed_multiplier = 1.1
			self.car9.timers.reload_not_empty = self.new_m4.timers.reload_not_empty
			self.car9.timers.reload_empty = self.new_m4.timers.reload_empty
			self.car9.timers.reload_exit_empty = self.new_m4.timers.reload_exit_empty
			self.car9.timers.reload_exit_not_empty = self.new_m4.timers.reload_exit_not_empty	
			self.car9.panic_suppression_chance = 0.05
			self.car9.stats_modifiers = nil
		end
			
		if self.amr12 then --Gambyt's AMR 12G Shotgun
			self.amr12.recategorize = { "light_shot" }	
			self.amr12.damage_type = "shotgun"
			self.amr12.damage_type_single_ray = "sniper"
			self.amr12.rays = 8
			self.amr12.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.amr12.AMMO_MAX = 120
			self.amr12.tactical_reload = 1		
			self.amr12.CLIP_AMMO_MAX = 5
			self.amr12.fire_mode_data.fire_rate = 0.125
			self.amr12.FIRE_MODE = "auto"		
			self.amr12.CAN_TOGGLE_FIREMODE = true
			self.amr12.BURST_FIRE = false
			self.amr12.kick = self.stat_info.kick_tables.vertical_kick
			self.amr12.supported = true
			self.amr12.ads_speed = 0.400
			self.amr12.damage_falloff = {
				start_dist = 400,
				end_dist = 2800,
				min_mult = 0.5
			}
			self.amr12.stats = {
				damage = 45,
				spread = 31,
				recoil = 49,
				zoom = 1,
				concealment = 21,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.amr12.panic_suppression_chance = 0.05
			self.amr12.stats_modifiers = {damage = 1}
			self.amr12.sounds.stop_fire = "contraband_fire_single"
			self.amr12.timers = deep_clone(self.olympic.timers)
		end
	
		if self.minibeck then --Reinbeck Auto
			self.minibeck.recategorize = { "light_shot" }
			self.minibeck.damage_type = "shotgun"
			self.minibeck.damage_type_single_ray = "sniper"
			self.minibeck.tactical_reload = 1
			self.minibeck.fire_mode_data.fire_rate = 0.15789473
			self.minibeck.CLIP_AMMO_MAX = 5
			self.minibeck.AMMO_MAX = 40
			self.minibeck.supported = true
			self.minibeck.ads_speed = 0.360
			self.minibeck.damage_falloff = {
				start_dist = 900,
				end_dist = 3000,
				min_mult = 0.5
			}
			self.minibeck.stats = {
				damage = 45,
				spread = 26,
				recoil = 69,
				zoom = 1,
				concealment = 25,
				alert_size = 2,
				suppression = 8,
				extra_ammo = 101,
				total_ammo_mod = 100,
				reload = 20,
				value = 7
			}
			self.minibeck.kick = self.stat_info.kick_tables.vertical_kick
			self.minibeck.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.minibeck.panic_suppression_chance = 0.05
			self.minibeck.stats_modifiers = nil
			self.minibeck.rays = 8
			self.minibeck.reload_speed_multiplier = 1
			self.minibeck.reload_fix_offset = 0.25
			self.minibeck.timers.shotgun_reload_enter = 0.3
			self.minibeck.timers.shotgun_reload_first_shell_offset = 0.33
			self.minibeck.timers.shotgun_reload_shell = 0.5666666666666667
			self.minibeck.timers.shotgun_reload_exit_not_empty = 0.2
			self.minibeck.timers.shotgun_reload_exit_empty = 1.5
		end
		
		if self.beck then --Gambyt's Reinbeck M1 Shotgun
			self.beck.recategorize = { "heavy_shot" }
			self.beck.damage_type = "shotgun_heavy"
			self.beck.damage_type_single_ray = "sniper"
			self.beck.has_description = true
			self.beck.desc_id = "bm_w_beck_desc"
			self.beck.tactical_reload = 1
			self.beck.rays = 8
			self.beck.CLIP_AMMO_MAX = 6
			self.beck.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.beck.kick = self.stat_info.kick_tables.left_kick
			self.beck.fire_mode_data.fire_rate = 0.5
			self.beck.fire_rate_multiplier = 0.9166666
			self.beck.AMMO_MAX = 60 
			self.beck.supported = true
			self.beck.ads_speed = 0.420
			self.beck.damage_falloff = {
				start_dist = 1000,
				end_dist = 3200,
				min_mult = 0.3333
			}
			self.beck.stats = {
				damage = 60,
				spread = 45,
				recoil = 55,
				spread_moving = 6,
				zoom = 1,
				concealment = 23,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.beck.stats_modifiers = {damage = 1}
			self.beck.panic_suppression_chance = 0.05
			self.beck.timers.shotgun_reload_enter = 0.3
			self.beck.timers.shotgun_reload_first_shell_offset = 0.33
			self.beck.timers.shotgun_reload_shell = 0.5666666666666667
			self.beck.timers.shotgun_reload_exit_not_empty = 0.3
			self.beck.timers.shotgun_reload_exit_empty = 0.7
		end
	
		if self.bs23 then --Hammer 23
			self.bs23.recategorize = { "break_shot" }
			self.bs23.damage_type = "shotgun_heavy"
			self.bs23.damage_type_single_ray = "anti_materiel"
			self.bs23.always_play_anims = true
			self.bs23.tactical_reload = 1
			self.bs23.AMMO_MAX = 40
			self.bs23.CLIP_AMMO_MAX = 3
			self.bs23.reload_speed_multiplier = 1.3
			self.bs23.fire_rate_multiplier = 1.20
			self.bs23.fire_mode_data.fire_rate = 1.3
			self.bs23.rays = 8
			self.bs23.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
			self.bs23.kick = self.stat_info.kick_tables.right_kick
			self.bs23.supported = true
			self.bs23.ads_speed = 0.440
			self.bs23.damage_falloff = {
				start_dist = 1000,
				end_dist = 3100,
				min_mult = 0.25
			}
			self.bs23.stats = {
				damage = 90,
				spread = 51,
				recoil = 41,
				spread_moving = 5,
				zoom = 1,
				concealment = 21,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.bs23.stats_modifiers = nil
			self.bs23.panic_suppression_chance = 0.05
			self.bs23.timers.unequip = 0.6
			self.bs23.timers.equip = 1
			self.bs23.timers.shotgun_reload_first_shell_offset = 0.45
			self.bs23.timers.shotgun_reload_exit_empty = 1.4
			self.bs23.timers.shotgun_reload_exit_not_empty = 0.7
		end
	
		if self.sg416 then --Gambyt's SG416
			self.sg416.nato = true
			self.sg416.recategorize = { "light_ar" }
			self.sg416.damage_type = "assault_rifle"
			self.sg416.has_description = false						
			self.sg416.tactical_reload = 1		
			self.sg416.AMMO_MAX = 150
			self.sg416.sounds.fire = "m16_fire_single"
			self.sg416.sounds.fire_single = "m16_fire_single"
			self.sg416.sounds.fire_auto = "m16_fire"
			self.sg416.fire_mode_data.fire_rate = 0.08571428571
			self.sg416.kick = self.stat_info.kick_tables.moderate_kick
			self.sg416.supported = true
			self.sg416.ads_speed = 0.340
			self.sg416.damage_falloff = {
				start_dist = 2400,
				end_dist = 6300,
				min_mult = 0.4166
			}
			self.sg416.stats = {
				damage = 24,
				spread = 81,
				recoil = 85,
				spread_moving = 6,
				zoom = 1,
				concealment = 22,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.sg416.stats_modifiers = nil
			self.sg416.reload_speed_multiplier = 1.15
			self.sg416.timers.reload_not_empty = self.new_m4.timers.reload_not_empty
			self.sg416.timers.reload_empty = self.new_m4.timers.reload_empty
			self.sg416.timers.reload_exit_empty = self.new_m4.timers.reload_exit_empty
			self.sg416.timers.reload_exit_not_empty = self.new_m4.timers.reload_exit_empty
			self.sg416.panic_suppression_chance = 0.05
		end
	
		if self.aknato then --Gambyt's Mamba 5.56 / Ak-101
			self.aknato.nato = true
			self.aknato.recategorize = {"light_ar"}
			self.aknato.tactical_reload = 1
			self.aknato.CLIP_AMMO_MAX = 30
			self.aknato.AMMO_MAX = 150
			self.aknato.FIRE_MODE = "auto"				
			self.aknato.BURST_FIRE = false
			self.aknato.CAN_TOGGLE_FIREMODE = true
			self.aknato.sounds.fire = "m4_olympic_fire_single"
			self.aknato.sounds.fire_single = "m4_olympic_fire_single"
			self.aknato.sounds.fire_auto = "m4_olympic_fire"
			self.aknato.sounds.stop_fire = "m4_olympic_stop"
			self.aknato.kick = self.stat_info.kick_tables.right_recoil	
			self.aknato.supported = true
			self.aknato.ads_speed = 0.320
			self.aknato.damage_falloff = {
				start_dist = 2600,
				end_dist = 6200,
				min_mult = 0.4166
			}
			self.aknato.stats = {
				damage = 24,
				spread = 81,
				recoil = 89,
				spread_moving = 6,
				zoom = 1,
				concealment = 24,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.aknato.stats_modifiers = nil
			self.aknato.panic_suppression_chance = 0.05
			self.aknato.timers = deep_clone(self.akm.timers)
		end	
	
		if self.smolak then --Gambyt's AK Dragon 5.45 Pistol
			self.smolak.warsaw = true
			self.smolak.categories = {"assault_rifle"}
			self.smolak.recategorize = {"light_ar"}
			self.smolak.use_data.selection_index = 2
			self.smolak.tactical_reload = 1
			self.smolak.fire_mode_data.fire_rate = 0.08
			self.smolak.AMMO_MAX = 150
			self.smolak.CAN_TOGGLE_FIREMODE = true
			self.smolak.kick = self.stat_info.kick_tables.right_kick		
			self.smolak.supported = true
			self.smolak.ads_speed = 0.280
			self.smolak.damage_falloff = {
				start_dist = 1800,
				end_dist = 4400,
				min_mult = 0.5
			}
			self.smolak.stats = {
				damage = 24,
				spread = 73,
				recoil = 81,
				spread_moving = 5,
				zoom = 1,
				concealment = 28,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.smolak.stats_modifiers = nil
			self.smolak.panic_suppression_chance = 0.05
			self.smolak.reload_speed_multiplier = 1.2
			self.smolak.timers = deep_clone(self.asval.timers)
		end	
	
		if self.spike then --Gambyt's Spike Rifle
			self.spike.warsaw = true
			self.spike.recategorize = { "heavy_ar" }
			self.spike.is_bullpup = true
			self.spike.has_description = false						
			self.spike.tactical_reload = 1		
			self.spike.AMMO_MAX = 120
			self.spike.fire_mode_data.fire_rate = 0.1
			self.spike.kick = self.stat_info.kick_tables.right_kick		
			self.spike.supported = true
			self.spike.ads_speed = 0.300
			self.spike.damage_falloff = {
				start_dist = 2800,
				end_dist = 5000,
				min_mult = 0.6
			}
			self.spike.stats = {
				damage = 30,
				spread = 80,
				recoil = 75,
				zoom = 1,
				concealment = 25,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.spike.stats_modifiers = nil
			self.spike.reload_speed_multiplier = 0.8
			self.spike.timers.reload_empty = self.basset.timers.reload_empty
			self.spike.timers.reload_not_empty = self.basset.timers.reload_not_empty
			self.spike.timers.reload_exit_empty = self.basset.timers.reload_exit_empty
			self.spike.timers.reload_exit_not_empty = self.basset.timers.reload_exit_not_empty
			self.spike.panic_suppression_chance = 0.05
		end
	
		if self.bdgr then --Hornet .300
			--Making it a secondary
			self.bdgr.recategorize = { "heavy_ar" }
			self.bdgr.damage_type = "assault_rifle"
			self.bdgr.use_data.selection_index = 1				
			self.bdgr.fire_mode_data.fire_rate = 0.075
			self.bdgr.tactical_reload = 1
			self.bdgr.AMMO_MAX = 60
			self.bdgr.supported = true
			self.bdgr.ads_speed = 0.300
			self.bdgr.damage_falloff = {
				start_dist = 1500,
				end_dist = 3800,
				min_mult = 0.6
			}
			self.bdgr.stats = {
				damage = 30,
				spread = 78,
				recoil = 71,
				zoom = 1,
				concealment = 24,
				alert_size = 2,
				suppression = 20,
				extra_ammo = 101,
				total_ammo_mod = 100,
				reload = 20,
				value = 6
			}
			self.bdgr.kick = self.stat_info.kick_tables.moderate_kick
			self.bdgr.panic_suppression_chance = 0.05
			self.bdgr.stats_modifiers = nil
			self.bdgr.timers = deep_clone(self.m16.timers)
			self.bdgr.timers.reload_exit_empty = 0.65
			self.bdgr.timers.reload_not_empty = 2.6
			self.bdgr.timers.reload_exit_not_empty = 0.65
		end
	
		if self.sgs then --Gambyt's Guerilla 308.	
			self.sgs.nato = true
			self.sgs.categories = {
				"snp",
				"semi_snp"
			}
			self.sgs.recategorize = { "light_snp" }
			self.sgs.damage_type = "sniper"
			self.sgs.upgrade_blocks = nil
			self.sgs.has_description = true
			self.sgs.desc_id = "bm_ap_weapon_sc_desc"
			self.sgs.CLIP_AMMO_MAX = 20
			self.sgs.tactical_reload = 1
			self.sgs.AMMO_MAX = 60
			self.sgs.FIRE_MODE = "single"
			self.sgs.fire_mode_data.fire_rate = 0.15
			self.sgs.sms = 0.9
			self.sgs.kick = self.stat_info.kick_tables.vertical_kick
			self.sgs.can_shoot_through_enemy = true
			self.sgs.can_shoot_through_shield = true
			self.sgs.can_shoot_through_wall = true
			self.sgs.supported = true
			self.sgs.ads_speed = 0.480
			self.sgs.damage_falloff = {
				start_dist = 3800,
				end_dist = 9000,
				min_mult = 0.5
			}
			self.sgs.stats = {
				damage = 60,
				spread = 90,
				recoil = 57,
				zoom = 1,
				concealment = 20,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.sgs.armor_piercing_chance = 1
			self.sgs.stats_modifiers = nil
			self.sgs.panic_suppression_chance = 0.05
			self.sgs.timers = deep_clone(self.shepheard.timers)
		end	

	--Quake Weapon Pack
		if self.qrl then
			self.qrl.categories = {"grenade_launcher", "rocket_launcher"}
			self.qrl.upgrade_blocks = {
				weapon = {
					"clip_ammo_increase"
				}
			}		
			self.qrl.ads_speed = 0.320
			self.qrl.damage_falloff = {
				start_dist = 3000,
				end_dist = 9000,
				min_mult = 1
			}
			self.qrl.AMMO_MAX = 20
			self.qrl.CLIP_AMMO_MAX = 4
			self.qrl.stats = {
				damage = 240,
				spread = 76,
				recoil = 65,
				zoom = 1,
				concealment = 10,
				alert_size = 2,
				suppression = 1,
				extra_ammo = 101,
				total_ammo_mod = 100,
				reload = 20,
				value = 7
			}
			self.qrl.timers.reload_not_empty = 3.5
			self.qrl.timers.reload_empty = 3.5
			self.qrl.reload_speed_multiplier = 2
			self.qrl.stats_modifiers = {damage = 2}
			self.qrl.kick = self.stat_info.kick_tables.vertical_kick
		end

		if self.qsho then
			self.qsho.should_reload_immediately = true
			self.qsho.has_description = true
			self.qsho.no_auto_anims = true	
			self.qsho.desc_id = "bm_quake_shotgun_sc_desc"
			self.qsho.AMMO_MAX = 20
			self.qsho.kick = self.stat_info.kick_tables.vertical_kick
			self.qsho.supported = true
			self.qsho.ads_speed = 0.440
			self.qsho.damage_falloff = {
				start_dist = 1000,
				end_dist = 3000,
				min_mult = 0.25
			}
			self.qsho.stats = {
				damage = 90,
				spread = 16,
				recoil = 41,
				zoom = 1,
				concealment = 25,
				alert_size = 2,
				suppression = 6,
				extra_ammo = 101,
				total_ammo_mod = 100,
				reload = 20,
				value = 7
			}
			self.qsho.stats_modifiers = nil
			self.qsho.rays = 16
			self.qsho.panic_suppression_chance = 0.05
			self.qsho.timers.reload_not_empty = 3.5
			self.qsho.timers.reload_empty = 3.5
			self.qsho.reload_speed_multiplier = 4
		end



	if self.derringer then --Carl's Derringer
		self.derringer.recategorize = {"heavy_pis"}
		self.derringer.damage_type = "heavy_pistol"
		self.derringer.always_play_anims = true
		self.derringer.AMMO_MAX = 20
		self.derringer.kick = self.stat_info.kick_tables.right_kick
		self.derringer.sounds.fire_single = "c45_fire"
		self.derringer.sounds.stop_fire = "pmkr45_fire"
		self.derringer.supported = true
		self.derringer.ads_speed = 0.200
		self.derringer.damage_falloff = {
			start_dist = 1100,
			end_dist = 3200,
			min_mult = 0.1111
		}
		self.derringer.stats = {
			damage = 90,
			spread = 41,
			recoil = 51,
			zoom = 1,
			concealment = 32,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.derringer.stats_modifiers = nil
		self.derringer.panic_suppression_chance = 0.05
		self.derringer.has_description = true
		self.derringer.desc_id = "bm_ap_weapon_sc_desc"
		self.derringer.can_shoot_through_enemy = true
		self.derringer.can_shoot_through_shield = true
		self.derringer.can_shoot_through_wall = true
		self.derringer.armor_piercing_chance = 1
		self.derringer.weapon_hold = "model3"
		self.derringer.animations.reload_name_id = "raging_bull"
		self.derringer.timers.reload_not_empty = 2.1
		self.derringer.timers.reload_empty = 2.1
		self.derringer.timers.reload_exit_empty = 0.6
		self.derringer.timers.reload_exit_not_empty = 0.6
	end

	if self.tilt then --Carl's AN 92
		self.tilt.warsaw = true
		self.tilt.recategorize = { "light_ar" }	
		self.tilt.damage_type = "assault_rifle"
		self.tilt.has_description = true
		self.tilt.desc_id = "bm_tilt_sc_desc"
		self.tilt.sounds.fire = "flint_fire_single"
		self.tilt.sounds.fire_single = "flint_fire_single"
		self.tilt.sounds.fire_auto = "flint_fire"
		self.tilt.sounds.stop_fire = "flint_stop"
		self.tilt.tactical_reload = 1
		self.tilt.AMMO_MAX = 150
		self.tilt.BURST_FIRE = 2
		self.tilt.BURST_FIRE_RATE_MULTIPLIER = 3
		self.tilt.BURST_DELAY = 0.06
		self.tilt.ADAPTIVE_BURST_SIZE = false
		self.tilt.fire_rate_init_count = 2
		self.tilt.fire_rate_init_mult = 3
		self.tilt.fire_mode_data.fire_rate = 0.1
		self.tilt.auto.fire_rate = 0.1
		self.tilt.kick = self.stat_info.kick_tables.moderate_kick
		self.tilt.supported = true
		self.tilt.ads_speed = 0.340
		self.tilt.damage_falloff = {
			start_dist = 2500,
			end_dist = 5000,
			min_mult = 0.5
		}
		self.tilt.stats = {
			damage = 24,
			spread = 78,
			recoil = 87,
			spread_moving = 6,
			zoom = 1,
			concealment = 25,
			suppression = 10,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.tilt.stats_modifiers = nil
		self.tilt.panic_suppression_chance = 0.05
		self.tilt.timers = deep_clone(self.flint.timers)
	end

	if self.czevo then --Carl's Scorpion EVO
		self.czevo.recategorize = { "light_smg" }					
		self.czevo.has_description = false					
		self.czevo.use_data.selection_index = 2
		self.czevo.tactical_reload = 1
		self.czevo.categories = {
			"smg"
		}
		self.czevo.CLIP_AMMO_MAX = 30
		self.czevo.AMMO_MAX = 180
		self.czevo.kick = self.stat_info.kick_tables.even_recoil
		self.czevo.supported = true
		self.czevo.ads_speed = 0.240
		self.czevo.damage_falloff = {
			start_dist = 1000,
			end_dist = 3800,
			min_mult = 0.3
		}
		self.czevo.stats = {
			damage = 20,
			spread = 56,
			recoil = 87,
			spread_moving = 8,
			zoom = 1,
			concealment = 26,
			suppression = 11,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.czevo.stats_modifiers = nil
		self.czevo.panic_suppression_chance = 0.05
		self.czevo.timers = deep_clone(self.shepheard.timers)
		self.x_czevo.use_data.selection_index = 5 
	end	


	
	if self.tingledingle then --Zdanns's TBP
		self.tingledingle.bmp = 999999
		self.tingledingle.no_auto_anims = true		
		self.tingledingle.recategorize = { "light_ar" }
		self.tingledingle.damage_type = "assault_rifle"
		self.tingledingle.tactical_reload = 1
		self.tingledingle.CLIP_AMMO_MAX = 35
		self.tingledingle.AMMO_MAX = 180
		self.tingledingle.FIRE_MODE = "auto"
		self.tingledingle.fire_mode_data = {}
		self.tingledingle.fire_mode_data.fire_rate = 0.125
		self.tingledingle.CAN_TOGGLE_FIREMODE = true
		self.tingledingle.sounds.stop_fire = "saiga_stop"
		self.tingledingle.kick = {}
		self.tingledingle.kick = self.stat_info.kick_tables.moderate_kick
		self.tingledingle.supported = true
		self.tingledingle.ads_speed = 0.500
		self.tingledingle.damage_falloff = {
			start_dist = 690,
			end_dist = 6900,
			min_mult = 0.05
		}	
		self.tingledingle.stats = {
			damage = 18,
			spread = 71,
			recoil = 81,
			spread_moving = 6,
			zoom = 1,
			concealment = 29,
			suppression = 12,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.tingledingle.stats_modifiers = nil
		self.tingledingle.panic_suppression_chance = 0.05
		self.tingledingle.timers = deep_clone(self.ecp.timers)
	end

	if self.hmcar then
		self.hmcar.categories = {
			"snp",
			"semi_snp"
		}
		self.hmcar.recategorize = { "heavy_snp" }	
		self.hmcar.damage_type = "sniper"
		self.hmcar.has_description = true
		self.hmcar.desc_id = "bm_hmcar_sc_desc"
		self.hmcar.FIRE_MODE = "auto"
		self.hmcar.charge_data = {
			max_t = 0.0,
			cooldown_t = 3
		}
		self.hmcar.fire_mode_data.volley = {}
		self.hmcar.fire_mode_data.volley.spread_mul = 1
		self.hmcar.fire_mode_data.volley.damage_mul = 2
		self.hmcar.fire_mode_data.volley.damage_mul_step = true
		self.hmcar.fire_mode_data.volley.ammo_usage = 2
		self.hmcar.fire_mode_data.volley.rays = 1
		self.hmcar.fire_mode_data.volley.can_shoot_through_wall = true
		self.hmcar.fire_mode_data.volley.can_shoot_through_shield = true
		self.hmcar.fire_mode_data.volley.can_shoot_through_enemy = true
		self.hmcar.fire_mode_data.volley.can_shoot_through_titan_shield = true
		self.hmcar.fire_mode_data.volley.armor_piercing_chance = 1
		self.hmcar.fire_mode_data.volley.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
		self.hmcar.fire_mode_data.volley.trail_effect = "effects/particles/weapons/sniper_trail_sc"
		self.hmcar.fire_mode_data.toggable = {
			"volley",
			"auto"
		}
		self.hmcar.no_charge_anims = true
		self.hmcar.trail_effect = "effects/particles/weapons/titan_trail_sc"
		self.hmcar.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
		self.hmcar.kick = self.stat_info.kick_tables.vertical_kick
		self.hmcar.CLIP_AMMO_MAX = 10
		self.hmcar.AMMO_MAX = 30
		self.hmcar.no_auto_anims = true
		self.hmcar.fire_mode_data.fire_rate = 1
		self.hmcar.can_shoot_through_enemy = true
		self.hmcar.can_shoot_through_shield = true
		self.hmcar.can_shoot_through_wall = true
		self.hmcar.supported = true
		self.hmcar.ads_speed = 0.500
		self.hmcar.damage_falloff = {
			start_dist = 6900,
			end_dist = 9600,
			min_mult = 0.5
		}	
		self.hmcar.stats = {
			damage = 90,
			spread = 86,
			recoil = 51,
			spread_moving = 6,
			zoom = 1,
			concealment = 18,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.hmcar.stats_modifiers = nil
		self.hmcar.reload_speed_multiplier = 0.75
		self.hmcar.tsnipar = true
		self.hmcar.sounds.fire_single = "zsniper_npc1a_1shot"
		self.hmcar.sounds.fire = "zsniper_npc1a_1shot"
		self.hmcar.sounds.fire_auto = "zsniper_npc1a_1shot"
		self.hmcar.sounds.charge = "sniper_npc1c_1shot"
	end

	if self.raygun then --Leather Dann's CoD:Zombies Raygun
		self.raygun.categories = {
			"grenade_launcher",
			"gl_pistol",
			"raygun"
		}
		self.raygun.use_data.selection_index = 2
		self.raygun.AMMO_MAX = 40
		self.raygun.supported = true
		self.raygun.fire_mode_data.fire_rate = 0.33149171270
		self.raygun.ads_speed = 0.200
		self.raygun.stats = {
			damage = 18,
			spread = 86,
			recoil = 85,
			zoom = 1,
			concealment = 18,
			alert_size = 2,
			suppression = 6,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 10
		}
		self.raygun.panic_suppression_chance = 0.05
		self.raygun.timers.reload_exit_not_empty = 0.7
		self.raygun.timers.reload_exit_empty = 0.7
	end



	if self.p99 then --Pawcio's P99
		self.p99.recategorize = {"light_pis"}
		self.p99.damage_type = "pistol"
		self.p99.lock_slide = true
		self.p99.fire_mode_data.fire_rate = 0.08571428571
		self.p99.single.fire_rate = 0.08571428571
		self.p99.tactical_reload = 1
		self.p99.CLIP_AMMO_MAX = 15
		self.p99.AMMO_MAX = 75
		self.p99.sounds.stop_fire = "mp9_stop"
		self.p99.kick = self.stat_info.kick_tables.left_recoil
		self.p99.supported = true
		self.p99.ads_speed = 0.200
		self.p99.damage_falloff = {
			start_dist = 1500,
			end_dist = 3500,
			min_mult = 0.25
		}
		self.p99.stats = {
			damage = 24,
			spread = 60,
			recoil = 87,
			spread_moving = 9,
			zoom = 1,
			concealment = 30,
			suppression = 11,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.p99.stats_modifiers = nil
		self.p99.timers = {
			reload_not_empty = 1.47,
			reload_empty = 2.12,
			unequip = 0.5,
			equip = 0.35
		}		
		self.p99.panic_suppression_chance = 0.05
		self.p99.timers.reload_exit_empty = 0.5
		self.p99.timers.reload_exit_not_empty = 0.65
	end

	if self.g19 then --Pawcio's Glock 19
		self.g19.recategorize = {"light_pis"}
		self.g19.damage_type = "pistol"
		self.g19.lock_slide = true
		self.g19.fire_mode_data.fire_rate = 0.08571428571
		self.g19.single.fire_rate = 0.08571428571
		self.g19.no_auto_anims = true
		self.g19.tactical_reload = 1
		self.g19.CLIP_AMMO_MAX = 15
		self.g19.AMMO_MAX = 75
		self.g19.sounds.stop_fire = "mp9_stop"
		self.g19.kick = self.stat_info.kick_tables.even_recoil
		self.g19.supported = true
		self.g19.ads_speed = 0.200
		self.g19.damage_falloff = {
			start_dist = 1400,
			end_dist = 3400,
			min_mult = 0.25
		}
		self.g19.stats = {
			damage = 24,
			spread = 58,
			recoil = 87,
			spread_moving = 9,
			zoom = 1,
			concealment = 31,
			suppression = 11,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.g19.stats_modifiers = nil
		self.g19.reload_speed_multiplier = 1.1
		self.g19.weapon_hold = "packrat"
		self.g19.timers = deep_clone(self.lemming.timers)
	end

	if self.fp45 then --Pawcio's FP45 Liberator
		self.fp45.recategorize = {"heavy_pis"}
		self.fp45.damage_type = "heavy_pistol"
		self.fp45.has_description = true
		self.fp45.desc_id = "bm_ap_weapon_sc_desc"
		self.fp45.lock_slide = true
		self.fp45.always_play_anims = true
		self.fp45.fire_mode_data.fire_rate = 0.08571428571
		self.fp45.single.fire_rate = 0.08571428571
		self.fp45.CLIP_AMMO_MAX = 1
		self.fp45.AMMO_MAX = 20
		self.fp45.kick = self.stat_info.kick_tables.left_recoil
		self.fp45.supported = true
		self.fp45.ads_speed = 0.200
		self.fp45.damage_falloff = {
			start_dist = 1000,
			end_dist = 3000,
			min_mult = 0.25
		}
		self.fp45.stats = {
			damage = 90,
			spread = 51,
			recoil = 87,
			spread_moving = 9,
			zoom = 1,
			concealment = 32,
			suppression = 11,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.fp45.stats_modifiers = nil
		self.fp45.panic_suppression_chance = 0.05
		self.fp45.armor_piercing_chance = 1
		self.fp45.can_shoot_through_enemy = true
		self.fp45.can_shoot_through_wall = true
		self.fp45.can_shoot_through_shield = true
		self.fp45.reload_speed_multiplier = 1.1
		self.fp45.timers.reload_not_empty = 6.4
		self.fp45.timers.reload_exit_not_empty = 1.3
		self.fp45.timers.reload_empty = 6.4
		self.fp45.timers.reload_exit_empty = 1.3
	end

	if self.ppsh then --Pawcio's PPSH
		self.ppsh.recategorize = {"heavy_smg"}
		self.ppsh.damage_type = "machine_gun"
		self.ppsh.lock_slide = true
		self.ppsh.warsaw = true
		self.ppsh.sounds.magazine_empty = "wp_pistol_slide_lock"
		self.ppsh.use_data.selection_index = 2
		self.ppsh.fire_mode_data.fire_rate = 0.054545
		self.ppsh.CAN_TOGGLE_FIREMODE = true
		self.ppsh.CLIP_AMMO_MAX = 71
		self.ppsh.AMMO_MAX = 120
		self.ppsh.kick = self.stat_info.kick_tables.horizontal_recoil
		self.ppsh.panic_suppression_chance = 0.05
		self.ppsh.supported = true
		self.ppsh.ads_speed = 0.460
		self.ppsh.damage_falloff = {
			start_dist = 1600,
			end_dist = 3900,
			min_mult = 0.3333
		}
		self.ppsh.stats = {
			damage = 30,
			spread = 52,
			recoil = 79,
			spread_moving = 6,
			zoom = 1,
			concealment = 18,
			suppression = 9,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.ppsh.stats_modifiers = nil
		self.ppsh.panic_suppression_chance = 0.05
		self.ppsh.timers.reload_not_empty = 3.3
		self.ppsh.timers.reload_exit_not_empty = 1.05
		self.ppsh.timers.reload_empty = 3.78
		self.ppsh.timers.reload_exit_empty = 1
		self.ppsh.sounds.fire_single = "mac10_fire_single"
		self.ppsh.sounds.fire_single2 = "ppsh41_fire"
	end

	if self.mp153 then  --Pawcio's MP-153
		self.mp153.recategorize = { "light_shot" }
		self.mp153.damage_type = "shotgun"
		self.mp153.damage_type_single_ray = "sniper"
		self.mp153.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.mp153.sounds.stop_fire = "saiga_stop"
		self.mp153.tactical_reload = 1
		self.mp153.rays = 8
		self.mp153.AMMO_MAX = 80
		self.mp153.fire_mode_data.fire_rate = 0.12
		self.mp153.kick = self.stat_info.kick_tables.moderate_kick
		self.mp153.supported = true
		self.mp153.ads_speed = 0.400
		self.mp153.damage_falloff = {
			start_dist = 1100,
			end_dist = 3100,
			min_mult = 0.5
		}
		self.mp153.stats = {
			damage = 45,
			spread = 31,
			recoil = 51,
			zoom = 1,
			concealment = 21,
			alert_size = 2,
			suppression = 8,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 7
		}
		self.mp153.stats_modifiers = nil
		self.mp153.panic_suppression_chance = 0.05
		self.mp153.reload_speed_multiplier = 1
		self.mp153.timers.shotgun_reload_exit_empty = 1.65
		self.mp153.timers.shotgun_reload_exit_not_empty = 0.75
	end
	
	if self.jackhammer then --Pawcio's Jackhammer
		self.jackhammer.recategorize = { "light_shot" }
		self.jackhammer.damage_type = "shotgun"
		self.jackhammer.damage_type_single_ray = "sniper"
		self.jackhammer.upgrade_blocks = nil
		self.jackhammer.CLIP_AMMO_MAX = 10
		self.jackhammer.AMMO_MAX = 40
		self.jackhammer.rays = 8
		self.jackhammer.CAN_TOGGLE_FIREMODE = true
		self.jackhammer.BURST_FIRE = false
		self.jackhammer.FIRE_MODE = "auto"
		self.jackhammer.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.jackhammer.kick = self.stat_info.kick_tables.vertical_kick
		self.jackhammer.fire_mode_data.fire_rate = 0.25
		self.jackhammer.panic_suppression_chance = 0.05
		self.jackhammer.supported = true
		self.jackhammer.ads_speed = 0.400
		self.jackhammer.damage_falloff = {
			start_dist = 1600,
			end_dist = 3800,
			min_mult = 0.5
		}
		self.jackhammer.stats = {
			damage = 45,
			spread = 31,
			recoil = 53,
			spread_moving = 7,
			zoom = 1,
			concealment = 25,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.jackhammer.stats_modifiers = nil
		self.jackhammer.timers.reload_exit_empty = 0.9
		self.jackhammer.timers.reload_empty = 2.9
		self.jackhammer.timers.reload_exit_not_empty = 1.5
		self.jackhammer.timers.reload_not_empty = 2.2
	end

	if self.quadbarrel then --Pawcio's Doomstick
		self.quadbarrel.recategorize = {"break_shot"}
		self.quadbarrel.damage_type = "shotgun_heavy"
		self.quadbarrel.damage_type_single_ray = "sniper"
		self.quadbarrel.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.quadbarrel.rays = 8
		self.quadbarrel.kick = self.stat_info.kick_tables.vertical_kick
		self.quadbarrel.AMMO_MAX = 40
		self.quadbarrel.sounds.stop_fire = "saiga_stop"
		self.quadbarrel.BURST_FIRE = 2
		self.quadbarrel.BURST_DELAY = 0.75
		self.quadbarrel.CAN_TOGGLE_FIREMODE = false
		self.quadbarrel.BURST_FIRE_RATE_MULTIPLIER = 5
		self.quadbarrel.DELAYED_BURST_RECOIL = false
		self.quadbarrel.ADAPTIVE_BURST_SIZE = false		
		self.quadbarrel.fire_mode_data = {}
		self.quadbarrel.fire_mode_data.fire_rate = 0.171428
		self.quadbarrel.supported = true
		self.quadbarrel.ads_speed = 0.500
		self.quadbarrel.damage_falloff = {
			start_dist = 900,
			end_dist = 3000,
			min_mult = 0.25
		}
		self.quadbarrel.stats = {
			damage = 90,
			spread = 58,
			recoil = 43,
			spread_moving = 6,
			zoom = 1,
			concealment = 21,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.quadbarrel.stats_modifiers = nil
		self.quadbarrel.panic_suppression_chance = 0.05
	end

	if self.ks23 then --Pawcio's KS23
		self.ks23.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.ks23.desc_id = "bm_ks23_sc_desc"
		self.ks23.has_description = false
		self.ks23.always_play_anims = true
		self.ks23.use_data.selection_index = 2
		self.ks23.categories = {
				"shotgun"
		}
		self.ks23.recategorize = { "break_shot" }
		self.ks23.damage_type = "shotgun_heavy"
		self.ks23.damage_type_single_ray = "anti_materiel"
		self.ks23.tactical_reload = 1
		self.ks23.reload_speed_multiplier = 1.3
		self.ks23.fire_rate_multiplier = 1.20
		self.ks23.fire_mode_data.fire_rate = 1.3
		self.ks23.rays = 8
		self.ks23.AMMO_MAX = 40
		self.ks23.CLIP_AMMO_MAX = 3		
		self.ks23.kick = self.stat_info.kick_tables.vertical_kick
		self.ks23.supported = true
		self.ks23.ads_speed = 0.480
		self.ks23.damage_falloff = {
			start_dist = 1000,
			end_dist = 3100,
			min_mult = 0.25
		}
		self.ks23.stats = {
			damage = 90,
			spread = 52,
			recoil = 47,
			spread_moving = 6,
			zoom = 1,
			concealment = 17,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.ks23.armor_piercing_chance = 1
		self.ks23.panic_suppression_chance = 0.05
		self.ks23.stats_modifiers = nil
		self.ks23.timers.unequip = 0.6
		self.ks23.timers.equip = 1
		self.ks23.timers.shotgun_reload_first_shell_offset = 0.45
		self.ks23.timers.shotgun_reload_exit_empty = 1.4
		self.ks23.timers.shotgun_reload_exit_not_empty = 0.7
	end	

	if self.super then --Pawcio's DOOM Super Shotgun
		self.super.recategorize = { "break_shot" }	
		self.super.damage_type = "shotgun_heavy"
		self.super.damage_type_single_ray = "anti_materiel"
		self.super.should_reload_immediately = true
		self.super.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps" --"effects/particles/shotgun/shotgun_gen"
		self.super.rays = 16
		self.super.kick = self.stat_info.kick_tables.vertical_kick
		self.super.CLIP_AMMO_MAX = 1
		self.super.AMMO_MAX = 30
		self.super.CAN_TOGGLE_FIREMODE = false							
		self.super.BURST_FIRE = false
		self.super.fire_mode_data.fire_rate = 0.5
		self.super.supported = true
		self.super.ads_speed = 0.400
		self.super.damage_falloff = {
			start_dist = 1100,
			end_dist = 2800,
			min_mult = 0.25
		}
		self.super.stats = {
			damage = 120,
			spread = 36,
			recoil = 21,
			spread_moving = 6,
			zoom = 1,
			concealment = 23,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.super.stats_modifiers = nil
		self.super.panic_suppression_chance = 0.05
		self.super.reload_speed_multiplier = 1.5
		self.super.timers.reload_exit_empty = 0.4
		self.super.timers.reload_exit_not_empty = 0.4
	end

	if self.g36k then --Pawcio's SCAR-L
		self.g36k.recategorize = { "light_ar" }
		self.g36k.damage_type = "assault_rifle"
		self.g36k.tactical_reload = 1
		self.g36k.nato = true
		self.g36k.desc_id = "bm_g36_sc_desc"
		self.g36k.has_description = true				
		self.g36k.BURST_FIRE = 3
		self.g36k.ADAPTIVE_BURST_SIZE = false
		self.g36k.fire_mode_data.fire_rate = 0.08
		self.g36k.AMMO_MAX = 150
		self.g36k.CLIP_AMMO_MAX = 30
		self.g36k.kick = self.stat_info.kick_tables.even_recoil
		self.g36k.supported = true
		self.g36k.ads_speed = 0.320
		self.g36k.damage_falloff = {
			start_dist = 2400,
			end_dist = 6400,
			min_mult = 0.4166
		}
		self.g36k.stats = {
			damage = 24,
			spread = 81,
			recoil = 85,
			spread_moving = 8,
			zoom = 1,
			concealment = 24,
			suppression = 10,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.g36k.stats_modifiers = nil
		self.g36k.reload_speed_multiplier = 1.2
		self.g36k.timers.reload_not_empty = 2.4
		self.g36k.timers.reload_exit_empty = 0.7
		self.g36k.timers.reload_exit_not_empty = 0.8
		self.g36k.sounds = deep_clone(self.g36.sounds)
		--self.g36k.sounds.fire_single2 = "g36k_fire"
		self.g36k.panic_suppression_chance = 0.05
	end

	if self.ar18 then --Pawcio's SCAR-L
		self.ar18.recategorize = { "light_ar" }
		self.ar18.damage_type = "assault_rifle"
		self.ar18.tactical_reload = 1
		self.ar18.nato = true
		self.ar18.desc_id = "bm_g36_sc_desc"
		self.ar18.has_description = true				
		self.ar18.BURST_FIRE = false
		self.ar18.ADAPTIVE_BURST_SIZE = false
		self.ar18.fire_mode_data.fire_rate = 0.08
		self.ar18.AMMO_MAX = 150
		self.ar18.CLIP_AMMO_MAX = 20
		self.ar18.kick = self.stat_info.kick_tables.moderate_kick
		self.ar18.supported = true
		self.ar18.ads_speed = 0.320
		self.ar18.damage_falloff = {
			start_dist = 2400,
			end_dist = 6400,
			min_mult = 0.4166
		}
		self.ar18.stats = {
			damage = 24,
			spread = 83,
			recoil = 85,
			spread_moving = 5,
			zoom = 1,
			concealment = 21,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.ar18.stats_modifiers = nil
		self.ar18.timers = deep_clone(self.ak5.timers)
		self.ar18.panic_suppression_chance = 0.05
	end


	if self.ak12 then --Pawcio's KF2 AK-12 (AK-200 Prototype)	
		self.ak12.recategorize = { "light_ar" }
		self.ak12.damage_type = "assault_rifle"
		self.ak12.tactical_reload = 1
		self.ak12.warsaw = true
		self.ak12.AMMO_MAX = 150
		self.ak12.CLIP_AMMO_MAX = 30
		self.ak12.BURST_FIRE = 3
		self.ak12.BURST_FIRE_RATE_MULTIPLIER = 1.6666666		
		self.ak12.ADAPTIVE_BURST_SIZE = false									
		self.ak12.fire_mode_data.fire_rate = 0.1
		self.ak12.kick = self.stat_info.kick_tables.moderate_right_kick
		self.ak12.supported = true
		self.ak12.ads_speed = 0.340
		self.ak12.damage_falloff = {
			start_dist = 2600,
			end_dist = 5100,
			min_mult = 0.5
		}
		self.ak12.stats = {
			damage = 24,
			spread = 81,
			recoil = 85,
			spread_moving = 6,
			zoom = 1,
			concealment = 22,
			suppression = 10,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 4,
			reload = 20
		}
		self.ak12.stats_modifiers = nil
		self.ak12.panic_suppression_chance = 0.05
		self.ak12.ignore_reload_objects = true --ignores the object hiding flag set via weaponbase in favor of playerstandard's
		self.ak12.timers.reload_empty = 2.55
		self.ak12.timers.reload_exit_empty = 0.55
		self.ak12.timers.reload_not_empty = 1.4
		self.ak12.timers.reload_exit_not_empty = 1.2
		self.ak12.timers.equip = 0.85
	end

	if self.scarl then --Pawcio's SCAR-L
		self.scarl.recategorize = { "heavy_ar" }
		self.scarl.damage_type = "assault_rifle"
		self.scarl.tactical_reload = 1
		self.scarl.nato = true
		self.scarl.lock_slide = true
		self.scarl.sounds.magazine_empty = "wp_rifle_slide_lock"
		self.scarl.sounds.fire_single = "m4_olympic_fire_single"
		self.scarl.sounds.stop_fire = "scar_stop"
		self.scarl.CLIP_AMMO_MAX = 30
		self.scarl.AMMO_MAX = 120
		self.scarl.FIRE_MODE = "auto"
		self.scarl.fire_mode_data = {}
		self.scarl.fire_mode_data.fire_rate = 0.096
		self.scarl.CAN_TOGGLE_FIREMODE = true
		self.scarl.kick = {}
		self.scarl.kick = self.stat_info.kick_tables.moderate_kick
		self.scarl.supported = true
		self.scarl.ads_speed = 0.360
		self.scarl.damage_falloff = {
			start_dist = 2800,
			end_dist = 6500,
			min_mult = 0.3333
		}	
		self.scarl.stats = {
			damage = 30,
			spread = 86,
			recoil = 87,
			spread_moving = 6,
			zoom = 1,
			concealment = 21,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.scarl.stats_modifiers = nil
		self.scarl.panic_suppression_chance = 0.05
		self.scarl.timers = deep_clone(self.new_m4.timers)
	end

	if self.xeno then --Pawcio's Pulse Rifle
		self.xeno.recategorize = {"dmr_ar"}
		self.xeno.damage_type = "assault_rifle"
		self.xeno.desc_id = "bm_xeno_sc_desc"
		self.xeno.has_description = true
		self.xeno.CLIP_AMMO_MAX = 40
		self.xeno.AMMO_MAX = 60
		self.xeno.fire_mode_data.fire_rate = 0.06666666
		self.xeno.CAN_TOGGLE_FIREMODE = false
		self.xeno.BURST_FIRE = 4
		self.xeno.kick = self.stat_info.kick_tables.moderate_kick
		self.xeno.supported = true
		self.xeno.ads_speed = 0.460
		self.xeno.damage_falloff = {
			start_dist = 1600,
			end_dist = 5100,
			min_mult = 0.6666
		}	
		self.xeno.stats = {
			damage = 45,
			spread = 71,
			recoil = 73,
			spread_moving = 5,
			zoom = 1,
			concealment = 19,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.xeno.stats_modifiers = nil
		self.xeno.armor_piercing_chance = 0.5
		self.xeno.can_shoot_through_enemy = true
		self.xeno.panic_suppression_chance = 0.05
		self.xeno.timers.reload_exit_not_empty = 1.2
		self.xeno.timers.reload_exit_empty = 1.2

		--since it overrides the tec9's soundbank
		self.tec9.sounds.fire = "mp9_fire_single"
		self.tec9.sounds.fire_single = "mp9_fire_single"
	end	

	if self.sks then
		self.sks.categories = { 
			"assault_rifle"
		}
		self.sks.sounds.magazine_empty = "wp_rifle_slide_lock"
		self.sks.lock_slide = true
		self.sks.lock_slide_alt = true
		self.sks.recategorize = {"dmr_ar"}
		self.sks.damage_type = "sniper"
		self.sks.AMMO_MAX = 80
		self.sks.CLIP_AMMO_MAX = 10
		self.sks.tactical_reload = 1
		self.sks.FIRE_MODE = "single"
		self.sks.fire_mode_data = {}
		self.sks.fire_mode_data.fire_rate = 0.085714
		self.sks.kick = self.stat_info.kick_tables.moderate_right_kick
		self.sks.supported = true
		self.sks.ads_speed = 0.320
		self.sks.damage_falloff = {
			start_dist = 2500,
			end_dist = 5200,
			min_mult = 0.4
		}
		self.sks.stats = {
			damage = 45,
			spread = 81,
			recoil = 79,
			spread_moving = 6,
			zoom = 1,
			concealment = 24,
			suppression = 8,
			alert_size = 1,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.sks.stats_modifiers = nil
		self.sks.can_shoot_through_enemy = true
		self.sks.panic_suppression_chance = 0.05
		self.sks.timers.reload_exit_not_empty = 0.6
		self.sks.timers.reload_exit_empty = 0.6
	end

	if self.vss then
		self.vss.categories = { 
			"assault_rifle",
			"dmr",
		}
		self.vss.recategorize = {"dmr_ar"}
		self.vss.warsaw = true
		self.vss.damage_type = "sniper"
		self.vss.desc_id = "bm_vss_sc_desc"
		self.vss.has_description = true
		self.vss.AMMO_MAX = 60
		self.vss.CLIP_AMMO_MAX = 10
		self.vss.tactical_reload = 1
		self.vss.FIRE_MODE = "single"
		self.vss.fire_mode_data = {}
		self.vss.fire_mode_data.fire_rate = 0.075
		self.vss.CAN_TOGGLE_FIREMODE = true
		self.vss.kick = self.stat_info.kick_tables.moderate_kick
		self.vss.supported = true
		self.vss.ads_speed = 0.380
		self.vss.damage_falloff = {
			start_dist = 900,
			end_dist = 5200,
			min_mult = 0.33333
		}
		self.vss.stats = {
			damage = 60,
			spread = 82,
			recoil = 75,
			spread_moving = 6,
			zoom = 1,
			concealment = 19,
			suppression = 20,
			alert_size = 1,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.vss.stats_modifiers = nil
		self.vss.can_shoot_through_enemy = true
		self.vss.can_shoot_through_wall = true
		self.vss.panic_suppression_chance = 0.05
		self.vss.sounds.fire = "val_fire"
		self.vss.sounds.fire_single = "val_fire_single"
		self.vss.sounds.fire_auto = "val_fire"
		self.vss.sounds.stop_fire = "val_stop"
		self.vss.timers.reload_exit_empty = 0.65
		self.vss.timers.reload_exit_not_empty = 0.85
		self.vss.reload_speed_multiplier = 1.1
	end

	if self.g3hk79 then
		self.g3hk79.categories = { 
			"assault_rifle",
			"dmr",
		}
		self.g3hk79.recategorize = {"dmr_ar"}
		self.g3hk79.damage_type = "sniper"
		self.g3hk79.has_description = true
		self.g3hk79.desc_id = "bm_g3hk79_sc_desc"
		self.g3hk79.AMMO_MAX = 40
		self.g3hk79.tactical_reload = 1
		self.g3hk79.CLIP_AMMO_MAX = 20
		self.g3hk79.fire_mode_data.fire_rate = 0.12
		self.g3hk79.CAN_TOGGLE_FIREMODE = true
		self.g3hk79.sounds.fire = "g3_fire_single"
		self.g3hk79.sounds.fire_single = "g3_fire_single"
		self.g3hk79.sounds.fire_auto = "g3_fire"
		self.g3hk79.sounds.stop_fire = "g3_stop"
		self.g3hk79.FIRE_MODE = "single"
		self.g3hk79.kick = self.stat_info.kick_tables.right_kick
		self.g3hk79.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.g3hk79.supported = true
		self.g3hk79.ads_speed = 0.460
		self.g3hk79.damage_falloff = {
			start_dist = 3000,
			end_dist = 7800,
			min_mult = 0.5
		}
		self.g3hk79.stats = {
			damage = 60,
			spread = 89,
			recoil = 61,
			spread_moving = 7,
			zoom = 1,
			concealment = 21,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 4,
			reload = 20
		}
		self.g3hk79.stats_modifiers = nil
		self.g3hk79.panic_suppression_chance = 0.05
		self.g3hk79.can_shoot_through_enemy = true
		self.g3hk79.can_shoot_through_wall = true
		self.g3hk79.timers.reload_exit_empty = 0.9
		self.g3hk79.timers.reload_exit_not_empty = 1
		self.g3hk79.reload_speed_multiplier = 1
	end
				
	if self.moss464spx then --Pawcio's SPX Centerfire
		self.moss464spx.recategorize = {"light_snp"}
		self.moss464spx.damage_type = "sniper"
		self.moss464spx.always_play_anims = true
		self.moss464spx.upgrade_blocks = nil
		self.moss464spx.has_description = true
		self.moss464spx.sounds.stop_fire = "saiga_stop"
		self.moss464spx.desc_id = "bm_ap_weapon_sc_desc"
		self.moss464spx.AMMO_MAX = 40
		self.moss464spx.tactical_reload = 1					
		self.moss464spx.FIRE_MODE = "single"
		self.moss464spx.fire_mode_data = {}
		self.moss464spx.fire_mode_data.fire_rate = 0.857142857
		self.moss464spx.fire_rate_multiplier = 1.7142857
		self.moss464spx.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
		self.moss464spx.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.moss464spx.CAN_TOGGLE_FIREMODE = false
		self.moss464spx.single = {}
		self.moss464spx.single.fire_rate = 0.4
		self.moss464spx.kick = self.stat_info.kick_tables.left_kick
		self.moss464spx.supported = true
		self.moss464spx.ads_speed = 0.320
		self.moss464spx.damage_falloff = {
			start_dist = 1700,
			end_dist = 6000,
			min_mult = 0.5
		}
		self.moss464spx.stats = {
			damage = 90,
			spread = 83,
			recoil = 71,
			spread_moving = 9,
			zoom = 1,
			concealment = 21,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.moss464spx.timers = deep_clone(self.sbl.timers)	
		self.moss464spx.stats_modifiers = nil
		self.moss464spx.panic_suppression_chance = 0.05
		self.moss464spx.weapon_hold = "sbl"
	end	

	if self.winchester1894 then --Pawcio's Winchester 1894
		self.winchester1894.recategorize = {"light_snp"}
		self.winchester1894.damage_type = "sniper"
		self.winchester1894.always_play_anims = true					
		self.winchester1894.tactical_reload = 1						
		self.winchester1894.has_description = true
		self.winchester1894.desc_id = "bm_ap_weapon_sc_desc"
		self.winchester1894.sounds.stop_fire = "saiga_stop"
		self.winchester1894.AMMO_MAX = 40
		self.winchester1894.FIRE_MODE = "single"
		self.winchester1894.fire_mode_data = {}
		self.winchester1894.fire_mode_data.fire_rate = 0.857142857
		self.winchester1894.fire_rate_multiplier = 1.7142857
		self.winchester1894.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
		self.winchester1894.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.winchester1894.CAN_TOGGLE_FIREMODE = false
		self.winchester1894.single = {}
		self.winchester1894.single.fire_rate = 0.5
		self.winchester1894.kick = self.stat_info.kick_tables.right_kick
		self.winchester1894.supported = true
		self.winchester1894.ads_speed = 0.340
		self.winchester1894.damage_falloff = {
			start_dist = 1900,
			end_dist = 6200,
			min_mult = 0.5
		}
		self.winchester1894.stats = {
			damage = 90,
			spread = 88,
			recoil = 75,
			spread_moving = 9,
			zoom = 1,
			concealment = 20,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.winchester1894.timers = deep_clone(self.sbl.timers)	
		self.winchester1894.stats_modifiers = nil
		self.winchester1894.panic_suppression_chance = 0.05
		self.winchester1894.weapon_hold = "sbl"
	end		

	if self.m1894 then --Pawcio's Marlin 1894
		self.m1894.recategorize = {"light_snp"}
		self.m1894.damage_type = "sniper"
		self.m1894.always_play_anims = true
		self.m1894.tactical_reload = 1						
		self.m1894.has_description = true
		self.m1894.desc_id = "bm_ap_weapon_sc_desc"
		self.m1894.AMMO_MAX = 20
		self.m1894.CLIP_AMMO_MAX = 5
		self.m1894.FIRE_MODE = "single"
		self.m1894.sounds.stop_fire = "mp9_stop"
		self.m1894.fire_mode_data = {}
		self.m1894.fire_mode_data.fire_rate = 0.857142857
		self.m1894.fire_rate_multiplier = 1.4285714
		self.m1894.CAN_TOGGLE_FIREMODE = false
		self.m1894.kick = self.stat_info.kick_tables.right_kick
		self.m1894.supported = true
		self.m1894.ads_speed = 0.260
		self.m1894.damage_falloff = {
			start_dist = 1400,
			end_dist = 5000,
			min_mult = 0.2222
		}
		self.m1894.stats = {
			damage = 90,
			spread = 78,
			recoil = 69,
			spread_moving = 9,
			zoom = 1,
			concealment = 27,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.m1894.timers.shotgun_reload_shell = 0.664
		self.m1894.timers.shotgun_reload_first_shell_offset = 0.15
		self.m1894.timers.shotgun_reload_exit_not_empty = 0.45
		self.m1894.stats_modifiers = nil
		self.m1894.panic_suppression_chance = 0.05
	end

	if self.k31 then --Pawcio's K31
		self.k31.recategorize = {"heavy_snp"}
		self.k31.damage_type = "sniper"
		self.k31.always_play_anims = true
		self.k31.CLIP_AMMO_MAX = 6
		self.k31.AMMO_MAX = 30
		self.k31.fire_mode_data.fire_rate = 0.9375
		self.k31.fire_rate_multiplier = 1.171875
		self.k31.kick = self.stat_info.kick_tables.vertical_kick
		self.k31.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.k31.supported = true
		self.k31.ads_speed = 0.360
		self.k31.damage_falloff = {
			start_dist = 3400,
			end_dist = 9000,
			min_mult = 0.5
		}
		self.k31.stats = {
			damage = 120,
			spread = 96,
			recoil = 51,
			spread_moving = 9,
			zoom = 1,
			concealment = 22,
			suppression = 5,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.k31.stats_modifiers = nil
		self.k31.panic_suppression_chance = 0.05
		self.k31.reload_speed_multiplier = 1.1
		self.k31.empty_use_mag = true
		self.k31.timers.shotgun_reload_first_shell_offset = 0.12
		self.k31.timers.shotgun_reload_exit_empty = 0.6
		self.k31.timers.shotgun_reload_exit_not_empty = 1.2
	end

	if self.l115 then --Pawcio's L115
		self.l115.recategorize = { "heavy_snp" }
		self.l115.upgrade_blocks = nil
		self.l115.has_description = true
		self.l115.always_play_anims = true
		self.l115.desc_id = "bm_ap_weapon_sc_desc"
		self.l115.tactical_reload = 1
		self.l115.CLIP_AMMO_MAX = 5
		self.l115.AMMO_MAX = 30
		self.l115.fire_mode_data.fire_rate = 1.09090909
		self.l115.fire_rate_multiplier = 1.1818181
		self.l115.sounds.stop_fire = "saiga_stop"
		self.l115.kick = self.stat_info.kick_tables.vertical_kick
		self.l115.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.l115.supported = true
		self.l115.ads_speed = 0.400
		self.l115.damage_falloff = {
			start_dist = 5000,
			end_dist = 9500,
			min_mult = 0.75
		}
		self.l115.stats = {
			damage = 120,
			spread = 96,
			recoil = 35,
			spread_moving = 8,
			zoom = 1,
			concealment = 20,
			suppression = 5,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.l115.armor_piercing_chance = 1
		self.l115.stats_modifiers = nil
		self.l115.panic_suppression_chance = 0.05
		self.l115.timers.reload_not_empty = 2.55
		self.l115.timers.reload_exit_empty = 0.7
		self.l115.timers.reload_exit_not_empty = 0.75
	end

	if self.svd then
		self.svd.recategorize = { "heavy_snp" }
		self.svd.categories = {
			"snp",
			"semi_snp"
		}
		self.svd.lock_slide = true
		self.svd.upgrade_blocks = nil
		--self.svd.has_description = true
		--self.svd.desc_id = "bm_siltstone_sc_desc"
		self.svd.tactical_reload = 1
		self.svd.CLIP_AMMO_MAX = 10
		self.svd.AMMO_MAX = 40
		self.svd.fire_mode_data.fire_rate = 0.4
		self.svd.sms = 0.8
		self.svd.kick = self.stat_info.kick_tables.right_kick
		self.svd.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.svd.supported = true
		self.svd.ads_speed = 0.500
		self.svd.damage_falloff = {
			start_dist = 2400,
			end_dist = 6500,
			min_mult = 0.5
		}
		self.svd.stats = {
			damage = 90,
			spread = 90,
			recoil = 41,
			spread_moving = 8,
			zoom = 1,
			concealment = 18,
			suppression = 5,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.svd.reload_speed_multiplier = 0.82
		self.svd.armor_piercing_chance = 1
		self.svd.stats_modifiers = nil
		self.svd.sounds.fire = "siltstone_fire"
		self.svd.panic_suppression_chance = 0.05
		self.svd.timers.reload_exit_empty = 0.4
		self.svd.timers.reload_exit_not_empty = 0.4
	end

	if self.musket then --Pawcio's Musket
		self.musket.categories = {
			"snp"
		}
		self.musket.recategorize = { "antim_snp" }
		self.musket.damage_type = "sniper"
		self.musket.always_play_anims = true
		self.musket.upgrade_blocks = nil
		self.musket.has_description = true
		self.musket.desc_id = "bm_heavy_ap_weapon_sc_desc"
		self.musket.CLIP_AMMO_MAX = 1
		self.musket.AMMO_MAX = 20
		self.musket.fire_mode_data.fire_rate = 1.5
		self.musket.lock_slide = true
		self.musket.sounds.magazine_empty = "shotgun_dryfire"
		self.musket.sounds.stop_fire = "saiga_stop"
		self.musket.kick = self.stat_info.kick_tables.moderate_right_kick
		self.musket.supported = true
		self.musket.ads_speed = 0.280
		self.musket.damage_falloff = {
			start_dist = 2200,
			end_dist = 6500,
			min_mult = 0.16666
		}
		self.musket.stats = {
			damage = 180,
			spread = 61,
			recoil = 77,
			spread_moving = 8,
			zoom = 1,
			concealment = 18,
			suppression = 4,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.musket.armor_piercing_chance = 1
		self.musket.can_shoot_through_titan_shield = true
		self.musket.stats_modifiers = nil
		self.musket.panic_suppression_chance = 0.05
		self.musket.reload_speed_multiplier = 1.2
		self.musket.timers.reload_exit_not_empty = 0.9
		self.musket.timers.reload_exit_empty = 0.9
	end

	if self.m107cq then --Pawcio's M107
		self.m107cq.categories = {
			"snp",
			"semi_snp",
			"amr"
		}
		self.m107cq.recategorize = { "antim_snp" }
		self.m107cq.hs_mult = 2
		self.m107cq.damage_type = "anti_materiel"
		self.m107cq.upgrade_blocks = nil
		self.m107cq.has_description = true
		self.m107cq.desc_id = "bm_m107cq_sc_desc"
		self.m107cq.tactical_reload = 1
		self.m107cq.AMMO_MAX = 30
		self.m107cq.fire_mode_data.fire_rate = 0.6
		self.m107cq.sms = 0.7
		self.m107cq.kick = deep_clone(self.stat_info.kick_tables.right_kick)
		self.m107cq.kick.crouching = self.m107cq.kick.standing
		self.m107cq.kick.steelsight = self.m107cq.kick.standing
		self.m107cq.supported = true
		self.m107cq.ads_speed = 0.640
		self.m107cq.damage_falloff = {
			start_dist = 4000,
			end_dist = 10000,
			min_mult = 0.75
		}
		self.m107cq.stats = {
			damage = 120,
			spread = 91,
			recoil = 6,
			spread_moving = 8,
			zoom = 1,
			concealment = 12,
			suppression = 4,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.m107cq.armor_piercing_chance = 1
		self.m107cq.can_shoot_through_titan_shield = true
		self.m107cq.stats_modifiers = nil
		self.m107cq.panic_suppression_chance = 0.05
		self.m107cq.timers.reload_not_empty = 3.5
		self.m107cq.timers.reload_empty = 5.4
		self.m107cq.timers.reload_exit_not_empty = 1.4
		self.m107cq.timers.reload_exit_empty = 0.7
	end

	if self.m200 then --Pawcio's Intervention
		self.m200.categories = {
			"snp",
			"amr"
		}
		self.m200.recategorize = { "antim_snp" }
		self.m200.hs_mult = 2
		self.m200.damage_type = "anti_materiel"
		self.m200.always_play_anims = true
		self.m200.upgrade_blocks = nil
		self.m200.has_description = true
		self.m200.desc_id = "bm_m200_sc_desc"
		self.m200.AMMO_MAX = 20
		self.m200.CLIP_AMMO_MAX = 7
		self.m200.tactical_reload = 1
		self.m200.kick = self.stat_info.kick_tables.moderate_right_kick
		self.m200.supported = true
		self.m200.ads_speed = 0.600
		self.m200.damage_falloff = {
			start_dist = 6000,
			end_dist = 15000,
			min_mult = 0.5
		}
		self.m200.stats = {
			damage = 180,
			spread = 98,
			recoil = 13,
			spread_moving = 8,
			zoom = 1,
			concealment = 14,
			suppression = 4,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.m200.fire_mode_data.fire_rate = 1.2
		self.m200.fire_rate_multiplier = 1
		self.m200.timers = {
			reload_not_empty = 2.7,
			reload_empty = 4.3,
			unequip = 0.7,
			equip = 0.9,
			reload_exit_empty = 0.6,
			reload_exit_not_empty = 0.95
		}
		self.m200.reload_speed_multiplier = 0.9
		self.m200.armor_piercing_chance = 1
		self.m200.can_shoot_through_titan_shield = true
		self.m200.stats_modifiers = nil
		self.m200.panic_suppression_chance = 0.05
	end

	if self.hx25 then --Pawcio's KF2 HX-25
		self.hx25.categories = {
			"grenade_launcher",
			"gl_pistol"
		}
		self.hx25.AMMO_MAX = 10
		self.hx25.rays = 7
		self.hx25.supported = true
		self.hx25.sms = 0.85
		self.hx25.ads_speed = 0.240
		self.hx25.damage_falloff = {
			start_dist = 1800,
			end_dist = 3300,
			min_mult = 0.05
		}
		self.hx25.stats = {
			damage = 36,
			spread = 41,
			recoil = 69,
			zoom = 1,
			concealment = 26,
			alert_size = 2,
			suppression = 6,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 7
		}
		self.hx25.kick = self.stat_info.kick_tables.right_kick
		self.hx25.panic_suppression_chance = 0.05
		self.hx25.rays = 8
		self.hx25.ignore_rays = true --Flag to ignore the default explosive rounds getting hit with a min-damage mult in the menus
		self.hx25.stats_modifiers = {damage = 10}
		self.hx25.reload_speed_multiplier = 1.25
		self.hx25.timers.reload_not_empty = 2.1
		self.hx25.timers.reload_empty = 2.1
		self.hx25.timers.reload_exit_not_empty = 0.6
		self.hx25.timers.reload_exit_empty = 0.6
	end

	if self.as24 then --Pawcio's A-24
		self.as24.fire_mode_data.fire_rate = 0.5
		self.as24.CLIP_AMMO_MAX = 20
		self.as24.AMMO_MAX = 20
		self.as24.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
		self.as24.supported = true
		self.as24.ads_speed = 0.500
		self.as24.damage_falloff = {
			start_dist = 3000,
			end_dist = 9000,
			min_mult = 1
		}
		self.as24.stats = {
			damage = 60,
			spread = 18,
			recoil = 71,
			spread_moving = 6,
			zoom = 1,
			concealment = 18,
			suppression = 1,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.as24.stats_modifiers = {damage = 10}
		self.as24.panic_suppression_chance = 0.05
		self.as24.kick = self.stat_info.kick_tables.vertical_kick
		self.as24.weapon_movement_penalty = 0.8
	end

	if self.deckard then 
		self.deckard.recategorize = {"heavy_pis"}
		self.deckard.has_description = true
		self.deckard.desc_id = "bm_ap_armor_50_weapon_sc_desc"
		self.deckard.armor_piercing_chance = 0.5
		self.deckard.can_shoot_through_enemy = true
		self.deckard.plasma_b = true
		self.deckard.fire_mode_data = {}
		self.deckard.fire_mode_data.fire_rate = 0.19047619047
		self.deckard.AMMO_MAX = 30
		self.deckard.kick = self.stat_info.kick_tables.moderate_kick
		self.deckard.supported = true
		self.deckard.ads_speed = 0.300
		self.deckard.damage_falloff = {
			start_dist = 1300,
			end_dist = 4100,
			min_mult = 0.3333
		}
		self.deckard.stats = {
			damage = 60,
			spread = 71,
			recoil = 51,
			spread_moving = 5,
			zoom = 1,
			concealment = 23,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.deckard.stats_modifiers = nil
		self.deckard.reload_speed_multiplier = 0.9
		self.deckard.timers.reload_not_empty = 2.1
		self.deckard.timers.reload_empty = 2.1
		self.deckard.timers.reload_exit_empty = 0.6
		self.deckard.timers.reload_exit_not_empty = 0.6
		self.deckard.panic_suppression_chance = 0.05
	end


	if self.coltds then --Mira's Colt Detective
		self.coltds.recategorize = {"heavy_pis"}
		self.coltds.damage_type = "heavy_pistol"
		self.coltds.autograph_multiplier = 2
		self.coltds.has_description = true
		self.coltds.desc_id = "bm_lemon_dmc_desc"
		self.coltds.fire_mode_data = {}
		self.coltds.fire_mode_data.fire_rate = 0.133333
		self.coltds.AMMO_MAX = 30
		self.coltds.kick = self.stat_info.kick_tables.moderate_kick
		self.coltds.supported = true
		self.coltds.ads_speed = 0.240
		self.coltds.damage_falloff = {
			start_dist = 1200,
			end_dist = 4000,
			min_mult = 0.222222
		}
		self.coltds.stats = {
			damage = 45,
			spread = 61,
			recoil = 51,
			spread_moving = 5,
			zoom = 1,
			concealment = 28,
			suppression = 9,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.coltds.stats_modifiers = nil
		self.coltds.timers = deep_clone(self.chinchilla.timers)
		self.coltds.panic_suppression_chance = 0.05
	end

	if self.smg45 then --Mira's LWRC/Striker 45
		self.smg45.recategorize = {"heavy_smg"}
		self.smg45.damage_type = "machine_gun"
		self.smg45.has_description = true
		self.smg45.fire_mode_data.fire_rate = 0.1
		self.smg45.tactical_reload = 1
		self.smg45.AMMO_MAX = 60
		self.smg45.CLIP_AMMO_MAX = 25
		self.smg45.BURST_FIRE = 2
		self.smg45.ADAPTIVE_BURST_SIZE = false											
		self.smg45.kick = self.stat_info.kick_tables.even_recoil
		self.smg45.panic_suppression_chance = 0.05
		self.smg45.supported = true
		self.smg45.ads_speed = 0.260
		self.smg45.damage_falloff = {
			start_dist = 1600,
			end_dist = 3800,
			min_mult = 0.3
		}
		self.smg45.stats = {
			damage = 30,
			spread = 66,
			recoil = 83,
			spread_moving = 7,
			zoom = 1,
			concealment = 24,
			suppression = 9,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.smg45.stats_modifiers = nil
		self.smg45.reload_speed_multiplier = 1.05
		self.smg45.timers.reload_exit_empty = 0.6
		self.smg45.timers.reload_exit_not_empty = 0.85
	end
	
	if self.troglodyte then --Leon and Mira's AWM-F
		self.troglodyte.recategorize = { "heavy_snp" }
		self.troglodyte.use_data.selection_index = 2
		self.troglodyte.upgrade_blocks = nil
		self.troglodyte.has_description = true
		self.troglodyte.always_play_anims = true
		self.troglodyte.desc_id = "bm_ap_weapon_sc_desc"
		self.troglodyte.tactical_reload = 1
		self.troglodyte.CLIP_AMMO_MAX = 5
		self.troglodyte.AMMO_MAX = 30
		self.troglodyte.fire_mode_data.fire_rate = 1.09090909
		self.troglodyte.fire_rate_multiplier = 1.1818181
		self.troglodyte.sounds.stop_fire = "saiga_stop"
		self.troglodyte.kick = self.stat_info.kick_tables.vertical_kick
		self.troglodyte.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.troglodyte.supported = true
		self.troglodyte.ads_speed = 0.360
		self.troglodyte.damage_falloff = {
			start_dist = 5000,
			end_dist = 9500,
			min_mult = 0.5
		}
		self.troglodyte.stats = {
			damage = 30,
			spread = 94,
			recoil = 27,
			spread_moving = 8,
			zoom = 1,
			concealment = 26,
			suppression = 5,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.troglodyte.stats_modifiers = {
			damage = 4
		}
		self.troglodyte.armor_piercing_chance = 1
		self.troglodyte.panic_suppression_chance = 0.05
		self.troglodyte.timers.reload_not_empty = 2.55
		self.troglodyte.timers.reload_exit_empty = 0.7
		self.troglodyte.timers.reload_exit_not_empty = 0.75
	end

	--Predator Pack
		if self.owlfbullpup then
			self.owlfbullpup.recategorize = { "heavy_ar" }
			self.owlfbullpup.damage_type = "assault_rifle"
			self.owlfbullpup.tactical_reload = 1
			self.owlfbullpup.CLIP_AMMO_MAX = 30
			self.owlfbullpup.AMMO_MAX = 120
			self.owlfbullpup.FIRE_MODE = "auto"
			self.owlfbullpup.CAN_TOGGLE_FIREMODE = true
			self.owlfbullpup.kick = {}
			self.owlfbullpup.kick = self.stat_info.kick_tables.moderate_kick
			self.owlfbullpup.supported = true
			self.owlfbullpup.ads_speed = 0.340
			self.owlfbullpup.damage_falloff = {
				start_dist = 2500,
				end_dist = 6600,
				min_mult = 0.3333
			}
			self.owlfbullpup.stats = {
				damage = 30,
				spread = 86,
				recoil = 83,
				spread_moving = 5,
				zoom = 1,
				concealment = 21,
				suppression = 8,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 1,
				reload = 20
			}
			self.owlfbullpup.stats_modifiers = nil
			self.owlfbullpup.panic_suppression_chance = 0.05
			self.owlfbullpup.timers.reload_exit_empty = 0.55
			self.owlfbullpup.timers.reload_exit_not_empty = 0.7
		end

		if self.plasmaproto then
			self.plasmaproto.categories = { 
				"assault_rifle",
				"dmr",
			}
			self.plasmaproto.recategorize = { "dmr_ar" }
			self.plasmaproto.damage_type = "sniper"
			self.plasmaproto.plasma_b = true
			self.plasmaproto.CLIP_AMMO_MAX = 25
			self.plasmaproto.AMMO_MAX = 60
			self.plasmaproto.FIRE_MODE = "auto"
			self.plasmaproto.CAN_TOGGLE_FIREMODE = true
			self.plasmaproto.sounds.stop_fire = "g36_stop"
			self.plasmaproto.kick = {}
			self.plasmaproto.kick = self.stat_info.kick_tables.right_kick
			self.plasmaproto.supported = true
			self.plasmaproto.ads_speed = 0.460
			self.plasmaproto.damage_falloff = {
				start_dist = 3200,
				end_dist = 8000,
				min_mult = 0.6666
			}	
			self.plasmaproto.stats = {
				damage = 60,
				spread = 71,
				recoil = 77,
				spread_moving = 6,
				zoom = 1,
				concealment = 20,
				suppression = 7,
				alert_size = 2,
				extra_ammo = 101,
				total_ammo_mod = 100,
				value = 9,
				reload = 20
			}
			self.plasmaproto.stats_modifiers = nil
			self.plasmaproto.panic_suppression_chance = 0.05
			self.plasmaproto.armor_piercing_chance = 0.8
			self.plasmaproto.timers.reload_exit_empty = 0.9
			self.plasmaproto.timers.reload_exit_not_empty = 0.65
		end

	if self.m6d then --RJC9000 and Offyerrocker's M6D
		self.m6d.recategorize = { "heavy_pis" }		
		self.m6d.damage_type = "heavy_pistol"
		self.m6d.has_description = true
		self.m6d.kick = self.stat_info.kick_tables.vertical_kick
		self.m6d.FIRE_MODE = "auto"
		self.m6d.CAN_TOGGLE_FIREMODE = true
		self.m6d.BURST_FIRE = false
		self.m6d.fire_mode_data.fire_rate = 0.285714
		self.m6d.no_auto_anims = true
		self.m6d.CLIP_AMMO_MAX = 12
		self.m6d.AMMO_MAX = 20
		self.m6d.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
		self.m6d.supported = true
		self.m6d.ads_speed = 0.200
		self.m6d.damage_falloff = {
			start_dist = 2500,
			end_dist = 5000,
			min_mult = 0.5
		}
		self.m6d.stats = {
			damage = 90,
			spread = 86,
			recoil = 27,
			spread_moving = 6,
			zoom = 1,
			concealment = 22,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.m6d.stats_modifiers = nil
		self.m6d.panic_suppression_chance = 0.05
		self.m6d.sounds.fire = "m6d_fire"
		self.m6d.sounds.fire_single = "m6d_fire"
		self.m6d.sounds.fire_single2 = "akm_stop"
		self.m6d.sounds.fire_auto = "m6d_fire"
		self.m6d.sounds.stop_fire = "akm_stop"
		self.m6d.armor_piercing_chance = 1
		self.m6d.timers = deep_clone(self.deagle.timers)
	end

	if self.nova4 then --RJC9000 and Synd1cate's Infinite Warfare NV4
		self.nova4.categories = { "assault_rifle" }
		self.nova4.recategorize = { "light_ar" }
		self.nova4.damage_type = "assault_rifle"
		self.nova4.tactical_reload = nil
		self.nova4.has_description = true
		self.nova4.desc_id = "bm_nova4_sc_desc"
		self.nova4.CLIP_AMMO_MAX = 30
		self.nova4.AMMO_MAX = 150
		self.nova4.lock_slide_alt = true
		self.nova4.lock_slide = true
		self.nova4.CAN_TOGGLE_FIREMODE = false
		self.nova4.FIRE_MODE = "auto"
		self.nova4.kick = {}
		self.nova4.kick = self.stat_info.kick_tables.moderate_kick
		self.nova4.supported = true
		self.nova4.ads_speed = 0.260
		self.nova4.damage_falloff = {
			start_dist = 4000,
			end_dist = 4001,
			min_mult = 0.416666
		}	
		self.nova4.stats = {
			damage = 24,
			spread = 86,
			recoil = 91,
			spread_moving = 5,
			zoom = 1,
			concealment = 20,
			suppression = 10,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.nova4.stats_modifiers = nil
		self.nova4.panic_suppression_chance = 0.05
		self.nova4.sounds.magazine_empty = "wp_rifle_slide_lock"
		self.nova4.timers.reload_exit_empty = 1.3
		self.nova4.timers.reload_empty = 2.55
		self.nova4.timers.reload_exit_not_empty = 0.8
		self.nova4.timers.reload_not_empty = 2.2
	end

	if self.mcx_spear then --RJC9000 and PlayBONK's SIG MCX Spear
		self.mcx_spear.categories = { "assault_rifle" }
		self.mcx_spear.recategorize = { "dmr_ar" }
		self.mcx_spear.damage_type = "sniper"
		self.mcx_spear.tactical_reload = 1
		self.mcx_spear.CLIP_AMMO_MAX = 20
		self.mcx_spear.AMMO_MAX = 60
		self.mcx_spear.FIRE_MODE = "auto"
		self.mcx_spear.CAN_TOGGLE_FIREMODE = true
		self.mcx_spear.sounds.stop_fire = "g36_stop"
		self.mcx_spear.kick = {}
		self.mcx_spear.kick = self.stat_info.kick_tables.right_kick
		self.mcx_spear.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.mcx_spear.supported = true
		self.mcx_spear.ads_speed = 0.420
		self.mcx_spear.damage_falloff = {
			start_dist = 2600,
			end_dist = 6500,
			min_mult = 0.6666
		}	
		self.mcx_spear.stats = {
			damage = 45,
			spread = 83,
			recoil = 73,
			spread_moving = 5,
			zoom = 1,
			concealment = 21,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.mcx_spear.stats_modifiers = nil
		self.mcx_spear.panic_suppression_chance = 0.05
		self.mcx_spear.can_shoot_through_enemy = true
		self.mcx_spear.can_shoot_through_wall = false
		self.mcx_spear.can_shoot_through_shield = false
		self.mcx_spear.armor_piercing_chance = 0.8
		self.mcx_spear.timers.reload_empty = 3.1
		self.mcx_spear.timers.reload_exit_empty = 0.9
		self.mcx_spear.timers.reload_not_empty = 2.2
		self.mcx_spear.timers.reload_exit_not_empty = 1.12
	end

	if self.amt then --Matthelzor, Gambyt, >:3, and Alcat's Automag .44
		self.amt.recategorize = { "heavy_pis" }		
		self.amt.damage_type = "heavy_pistol"			
		self.amt.tactical_reload = 1
		self.amt.use_data.selection_index = 2
		self.amt.has_description = true
		self.amt.desc_id = "bm_ap_armor_50_weapon_sc_desc"
		self.amt.armor_piercing_chance = 0.5
		self.amt.can_shoot_through_enemy = true
		self.amt.fire_mode_data.fire_rate = 0.133333
		self.amt.kick = self.stat_info.kick_tables.moderate_right_kick
		self.amt.CLIP_AMMO_MAX = 8
		self.amt.AMMO_MAX = 60
		self.amt.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
		self.amt.supported = true
		self.amt.ads_speed = 0.360
		self.amt.damage_falloff = {
			start_dist = 1500,
			end_dist = 4500,
			min_mult = 0.4
		}
		self.amt.stats = {
			damage = 60,
			spread = 63,
			recoil = 33,
			spread_moving = 6,
			zoom = 1,
			concealment = 23,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.amt.stats_modifiers = nil
		self.amt.panic_suppression_chance = 0.05
		self.amt.timers = deep_clone(self.deagle.timers)
	end	

	if self.xr2 then --KillerKrayola + Pawcio + splish's BO3 XR-2
		self.xr2.recategorize = { "dmr_ar" }
		self.xr2.damage_type = "assault_rifle"
		self.xr2.desc_id = "bm_xr2_sc_desc"
		self.xr2.has_description = true
		self.xr2.is_bullpup = true
		self.xr2.CLIP_AMMO_MAX = 30
		self.xr2.AMMO_MAX = 80
		self.xr2.fire_mode_data.fire_rate = 0.13333
		self.xr2.FIRE_MODE = "single"
		self.xr2.CAN_TOGGLE_FIREMODE = false
		self.xr2.BURST_FIRE = 3
		self.xr2.BURST_DELAY = 0.2
		self.xr2.BURST_FIRE_RATE_MULTIPLIER = 1.888888
		self.xr2.BURST_FIRE_RECOIL_MULTIPLIER = 0.7
		self.xr2.AUTO_BURST = true
		self.xr2.kick = self.stat_info.kick_tables.moderate_kick
		self.xr2.supported = true
		self.xr2.ads_speed = 0.380
		self.xr2.damage_falloff = {
			start_dist = 3400,
			end_dist = 6800,
			min_mult = 0.666666
		}
		self.xr2.stats = {
			damage = 45,
			spread = 88,
			recoil = 65,
			spread_moving = 6,
			zoom = 1,
			concealment = 24,
			suppression = 7,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.xr2.stats_modifiers = nil
		self.xr2.armor_piercing_chance = 0.5
		self.xr2.can_shoot_through_enemy = true
		self.xr2.panic_suppression_chance = 0.05
		self.xr2.timers.reload_exit_empty = 0.6
		self.xr2.timers.reload_not_empty = 0.8
		self.xr2.timers.reload_not_empty = 1.9
		self.xr2.timers.reload_exit_not_empty = 0.9
	end

	if self.crysis3_typhoon then
		self.crysis3_typhoon.categories = { 
			"smg",
			"typh"
		}
		self.crysis3_typhoon.damage_type = "machine_gun"
		self.crysis3_typhoon.recategorize = { "light_smg" } --"Light" SMG
		self.crysis3_typhoon.use_data.selection_index = 2
		self.crysis3_typhoon.has_description = true
		self.crysis3_typhoon.rays = 1
		self.crysis3_typhoon.CLIP_AMMO_MAX = 180
		self.crysis3_typhoon.AMMO_MAX = 360
		self.crysis3_typhoon.FIRE_MODE = "auto"
		self.crysis3_typhoon.charge_data = {
			max_t = 0.0,
			cooldown_t = 0.15
		}
		self.crysis3_typhoon.fire_mode_data = {}
		self.crysis3_typhoon.fire_mode_data.fire_rate = 0.02
		self.crysis3_typhoon.fire_mode_data.ammo_usage = 5
		self.crysis3_typhoon.fire_mode_data.volley = {}
		self.crysis3_typhoon.fire_mode_data.volley.spread_mul = 2
		self.crysis3_typhoon.fire_mode_data.volley.damage_mul = 1
		self.crysis3_typhoon.fire_mode_data.volley.ammo_usage = 10
		self.crysis3_typhoon.fire_mode_data.volley.rays = 10
		self.crysis3_typhoon.fire_mode_data.volley.can_shoot_through_wall = false
		self.crysis3_typhoon.fire_mode_data.volley.can_shoot_through_shield = true
		self.crysis3_typhoon.fire_mode_data.volley.can_shoot_through_enemy = true
		self.crysis3_typhoon.fire_mode_data.volley.armor_piercing_chance = 1
		self.crysis3_typhoon.fire_mode_data.volley.muzzleflash = "effects/payday2/particles/weapons/hailstorm_volley_effect"
		self.crysis3_typhoon.fire_mode_data.volley.muzzleflash_silenced = "effects/payday2/particles/weapons/hailstorm_suppressed_volley"
		self.crysis3_typhoon.fire_mode_data.volley.object_damage_mult = 0.75
		self.crysis3_typhoon.fire_mode_data.toggable = {
			"volley",
			"auto"
		}
		self.crysis3_typhoon.sms = 0.7
		self.crysis3_typhoon.CAN_TOGGLE_FIREMODE = false
		self.crysis3_typhoon.muzzleflash = "effects/payday2/particles/weapons/hailstorm_effect"
		self.crysis3_typhoon.kick = self.stat_info.kick_tables.moderate_kick
		self.crysis3_typhoon.kick.volley = self.stat_info.kick_tables.metalstorm_kick
		self.crysis3_typhoon.shake.bypass_global_shake = true
		self.crysis3_typhoon.no_charge_anims = true
		self.crysis3_typhoon.supported = true
		self.crysis3_typhoon.ads_speed = 0.400
		self.crysis3_typhoon.damage_falloff = {
			start_dist = 1000,
			end_dist = 3600,
			min_mult = 0.5,
			ignore_rays = true
		}
		self.crysis3_typhoon.stats = {
			damage = 10,
			spread = 11,
			recoil = 91,
			spread_moving = 6,
			zoom = 1,
			concealment = 17,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}		
		self.crysis3_typhoon.bmp = 100
		self.crysis3_typhoon.stats_modifiers = nil
		self.crysis3_typhoon.panic_suppression_chance = 0.05
		self.crysis3_typhoon.timers.reload_exit_empty = 0.5
		self.crysis3_typhoon.timers.reload_not_empty = 5
		self.crysis3_typhoon.timers.reload_exit_not_empty = 2.2
		self.crysis3_typhoon.sounds.no_fix = true
		self.crysis3_typhoon.sounds.fire = "typhoon_fire_single"
		self.crysis3_typhoon.sounds.fire_single = "typhoon_fire_single"
		self.crysis3_typhoon.sounds.fire_auto = "typhoon_fire"
		self.crysis3_typhoon.sounds.stop_fire = "typhoon_fire_stop"
		self.crysis3_typhoon.sounds.spin_start2 = "typhoon_wind_up"
		self.crysis3_typhoon.sounds.spin_end2 = "typhoon_wind_down"
		--Use akimbo P90 sounds as source for reflections
		--Provided there isn't another weapon that uses this soundbank, this should only ever play reflections
		self.crysis3_typhoon.sounds.fire2 = "p90_x_stop"
		self.crysis3_typhoon.sounds.fire_single2 = "typhoon_wind_up"
		self.crysis3_typhoon.sounds.fire_auto2 = "p90_x_fire"
		self.crysis3_typhoon.sounds.stop_fire2 = "p90_x_stop"
		self.crysis3_typhoon.sounds.stop_fire3 = "typhoon_wind_down"
	end

	if self.rsass then --youngrich99 and FrenchyAU's Remington RSASS
		self.rsass.recategorize = { "light_snp" }
		self.rsass.categories = {
			"snp",
			"semi_snp"
		}
		self.rsass.lock_slide = true
		self.rsass.upgrade_blocks = nil
		self.rsass.tactical_reload = 1
		self.rsass.CLIP_AMMO_MAX = 20
		self.rsass.AMMO_MAX = 60
		self.rsass.FIRE_MODE = "single"
		self.rsass.fire_mode_data.fire_rate = 0.142857
		self.rsass.sms = 0.9
		self.rsass.kick = self.stat_info.kick_tables.vertical_kick
		self.rsass.can_shoot_through_enemy = true
		self.rsass.can_shoot_through_shield = true
		self.rsass.can_shoot_through_wall = true
		self.rsass.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
		self.rsass.supported = true
		self.rsass.ads_speed = 0.500
		self.rsass.damage_falloff = {
			start_dist = 3500,
			end_dist = 8500,
			min_mult = 0.5
		}
		self.rsass.stats = {
			damage = 60,
			spread = 83,
			recoil = 57,
			spread_moving = 6,
			zoom = 1,
			concealment = 18,
			suppression = 6,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.rsass.armor_piercing_chance = 1
		self.rsass.stats_modifiers = nil
		self.rsass.panic_suppression_chance = 0.05
		self.rsass.timers.reload_not_empty = 2.5
		self.rsass.timers.reload_empty = 3.43
		self.rsass.timers.reload_exit_empty = 1
		self.rsass.timers.reload_exit_not_empty = 0.95
	end

	--[[     CAP/WEAPONLIB REQUIRING THINGS     ]]	
	-- Currently low priority. If it REQUIRES Weaponlib (some Weaponlib weapons just need CAP's functionality) then it's a no-go outright
	if self.owen then -- Silent Enforcer's Owen Gun
		self.owen.use_data.selection_index = 2
		self.owen.tactical_reload = 1
		self.owen.has_description = false														
		self.owen.categories = {
				"smg"
			}		
		self.owen.fire_mode_data.fire_rate = 0.0857
		self.owen.auto.fire_rate = 0.0857
		self.owen.AMMO_MAX = 120
		self.owen.CLIP_AMMO_MAX = 33
		self.owen.kick = self.stat_info.kick_tables.even_recoil
		self.owen.supported = true
		self.owen.stats = {
			damage = 30,
			spread = 81,
			recoil = 85,
			spread_moving = 7,
			zoom = 1,
			concealment = 24,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.owen.panic_suppression_chance = 0.05
		self.owen.stats_modifiers = nil
	end	

	if self.aek971 then --Pawcio's AEK 971
		self.aek971.warsaw = true
		self.aek971.CLIP_AMMO_MAX = 30
		self.aek971.tactical_reload = 1												
		self.aek971.AMMO_MAX = 180
		self.aek971.kick = self.stat_info.kick_tables.moderate_kick
		self.aek971.supported = true
		self.aek971.stats = {
			damage = 20,
			spread = 81,
			recoil = 89,
			spread_moving = 6,
			zoom = 1,
			concealment = 28,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 9,
			reload = 20
		}
		self.aek971.panic_suppression_chance = 0.05
		self.aek971.stats_modifiers = nil		
	end			

	--Silent Killer Pack
	if self.welrod then --Welrod
		self.welrod.AMMO_MAX = 30
		self.welrod.supported = true
		self.welrod.stats = {
			damage = 60,
			spread = 96,
			recoil = 89,
			concealment = 26,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 5
		}
		self.welrod.kick = self.stat_info.kick_tables.even_recoil
		self.welrod.panic_suppression_chance = 0.05
		self.welrod.stats_modifiers = nil
	end

	--Silent Killer Pack PB
	if self.pb then
		self.pb.AMMO_MAX = 75
		self.pb.supported = true
		self.pb.fire_mode_data.fire_rate = 0.08571428571
		self.pb.single.fire_rate = 0.08571428571
		self.pb.stats = {
			damage = 24,
			spread = 96,
			recoil = 93,
			concealment = 30,
			alert_size = 2,
			suppression = 8,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 4
		}
		self.pb.kick = self.stat_info.kick_tables.even_recoil
		self.pb.panic_suppression_chance = 0.05
		self.pb.stats_modifiers = nil
	end

	--Silent Killer Pack High Standard HDM
	if self.hshdm then
		self.hshdm.AMMO_MAX = 90
		self.hshdm.supported = true
		self.hshdm.fire_mode_data.fire_rate = 0.08571428571
		self.hshdm.single.fire_rate = 0.08571428571
		self.hshdm.stats = {
			damage = 20,
			spread = 91,
			recoil = 93,
			concealment = 31,
			alert_size = 2,
			suppression = 8,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 4
		}
		self.hshdm.kick = self.stat_info.kick_tables.even_recoil
		self.hshdm.panic_suppression_chance = 0.05
		self.hshdm.stats_modifiers = nil
		self.x_hshdm.selection_index = 5 --No akimbos
	end

	--Silent Killer Pack Maxim 9
	if self.max9 then
		self.max9.AMMO_MAX = 75
		self.max9.supported = true
		self.max9.fire_mode_data.fire_rate = 0.08571428571
		self.max9.single.fire_rate = 0.08571428571
		self.max9.stats = {
			damage = 24,
			spread = 86,
			recoil = 93,
			concealment = 27,
			alert_size = 2,
			suppression = 8,
			extra_ammo = 101,
			total_ammo_mod = 100,
			reload = 20,
			value = 5
		}
		self.max9.kick = self.stat_info.kick_tables.even_recoil
		self.max9.panic_suppression_chance = 0.05
		self.max9.stats_modifiers = nil
	end

	if self.x_car9 then --disabled vmp akimbos
		self.x_car9.use_data.selection_index = 5
		self.x_car9.supported = true
	end	

	if self.x_smolak then --disabled vmp akimbos
		self.x_smolak.use_data.selection_index = 5
		self.x_smolak.supported = true
	end	

	if self.x_ak5s then --disabled vmp akimbos
		self.x_ak5s.use_data.selection_index = 5
		self.x_ak5s.supported = true
	end	

	if self.x_cold then --disabled vmp akimbos
		self.x_cold.use_data.selection_index = 5
		self.x_cold.supported = true
	end		

	if self.cold then --Gambyt's VMP Crosskill Protector
		self.cold.use_data.selection_index = 5
		self.cold.tactical_reload = 1											
		self.cold.fire_mode_data.fire_rate = 0.08571428571
		self.cold.single.fire_rate = 0.08571428571
		self.cold.CLIP_AMMO_MAX = 8
		self.cold.AMMO_MAX = 40
		self.cold.kick = self.stat_info.kick_tables.even_recoil
		self.cold.supported = true
		self.cold.stats = {
			damage = 45,
			spread = 91,
			recoil = 85,
			spread_moving = 5,
			zoom = 1,
			concealment = 26,
			suppression = 8,
			alert_size = 2,
			extra_ammo = 101,
			total_ammo_mod = 100,
			value = 1,
			reload = 20
		}
		self.cold.stats_modifiers = nil
		self.cold.panic_suppression_chance = 0.05
	end


	--Automatically generate reasonableish stats for custom weapons.
	--Someone please help me fix this for the new stat indexes -DMC
	for i, weap in pairs(self) do
		if weap.categories and weap.stats then
			if not weap.supported then
				weap.always_play_anims = true
				self:generate_custom_weapon_stats(weap)	
			end

			if weap.fire_mode_data then
				if weap.fire_mode_data.single then
					weap.fire_mode_data.single = nil
				end
				if weap.fire_mode_data.auto then
					weap.fire_mode_data.auto = nil
				end
			end

			if weap.supported and weap.recategorize[1] == "unsupported" then
				weap.recategorize[1] = "wpn_special"
			end
			
			if weap.bipod_camera_spin_limit then
				weap.bipod_camera_spin_limit = 65
				weap.bipod_camera_pitch_limit = 20
				weap.bipod_deploy_multiplier = 1.5
			end
			-- roughly normalizes swap speeds before additional modifiers are in play
			weap.desired_swap_time = 1.5

			weap.reload_speed_multiplier = (weap.reload_speed_multiplier or 1) * 1.1
			if weap.shake and not weap.shake.bypass_global_shake then
				weap.shake = {
					fire_multiplier = 0.75,
					fire_steelsight_multiplier = -0.5
				}
			end

			if weap.damage_type and not weap.object_damage_mult then
				if weap.damage_type == "anti_materiel" then
					weap.object_damage_mult = 4
				elseif weap.damage_type == "sniper" then
					weap.object_damage_mult = 2
					if (weap.categories[2] and weap.categories[2] == "semi_snp") or (weap.categories[1] == "assault_rifle") then
						weap.object_damage_mult = 1.25
					end
				elseif weap.damage_type == "pdw" then
					weap.object_damage_mult = 1.5
				elseif weap.damage_type == "heavy_pistol" then
					weap.object_damage_mult = 1.25
				elseif weap.damage_type == "shotgun" then
					weap.object_damage_mult = 0.75
				elseif weap.damage_type == "flamethrower" then
					weap.object_damage_mult = 0.25
				else
					--weap.object_damage_mult = 1
				end
				if weap.damage_type_single_ray == "sniper" then
					weap.object_damage_mult_single_ray = 2
					if weap.recategorize[1] == "light_shot" then
						weap.object_damage_mult_single_ray = 1.25
					end
				elseif weap.damage_type_single_ray == "anti_materiel" then
					weap.object_damage_mult_single_ray = 4
				end
			end
			
			for i, category in pairs(weap.categories) do
				if category == "shotgun" then
					weap.trail_effect = "effects/payday2/particles/weapons/hailstorm_streak"
				end
			end
	
			if restoration.Options:GetValue("OTHER/AutoDMRs") then
				if weap.recategorize[1] == "dmr_ar" and weap.CAN_TOGGLE_FIREMODE and weap.CAN_TOGGLE_FIREMODE == true and weap.FIRE_MODE == "single" then
					weap.FIRE_MODE = "auto"
				end
			end
			if restoration.Options:GetValue("OTHER/WpnCat") and restoration.Options:GetValue("OTHER/WpnCat") ~= 2 then
				weap.recategorize = nil
				if weap.categories[1] == "akimbo" then
					weap.recategorize = { weap.categories[2] }
				end
				if weap.categories[1] == "snp" then
					weap.recategorize = { "assault_rifle" }
				end
				if weap.categories[1] == "minigun" or weap.categories[1] == "lmg" then
					weap.recategorize = { "smg" }
				end
			end
			--[[
			if weap.ads_speed then
				weap.ads_speed = weap.ads_speed + 0.150
			end
			]]
			self:get_swap_speed_multiplier(weap)
			self:calculate_ammo_pickup(weap)
		end
	end
end)

function WeaponTweakData:get_swap_speed_multiplier(weapon)
	local swap_speed_mult = 1
	if not weapon.swap_speed_multiplier then
		swap_speed_mult = swap_speed_mult / ( weapon.desired_swap_time / (weapon.timers.unequip + weapon.timers.equip) )
		weapon.swap_speed_multiplier = swap_speed_mult
	end
end

function WeaponTweakData:calculate_ammo_pickup(weapon)
	--Define % of total ammo to pickup baseline per damage tier.
	--More damaging guns should pick up less ammo, as a tradeoff for their higher output.
	local damage_tiers_pickup = {
		{damage = 18,  pickup = {0.057, 0.028}}, --Low damage/high pickup guns should have high variability, so that they still sometimes feel ammo tension.
		{damage = 20,  pickup = {0.055, 0.027}},
		{damage = 24,  pickup = {0.053, 0.027}},
		{damage = 30,  pickup = {0.051, 0.026}},
		{damage = 45,  pickup = {0.049, 0.025}},
		{damage = 60,  pickup = {0.046, 0.024}},
		{damage = 90,  pickup = {0.043, 0.023}},
		{damage = 120, pickup = {0.040, 0.022}},
		{damage = 180, pickup = {0.037, 0.020}},
		{damage = 240, pickup = {0.033, 0.018}},
		{damage = 360, pickup = {0.029, 0.016}},
		{damage = 600, pickup = {0.025, 0.014}}, --Light GLs
		{damage = 800, pickup = {0.021, 0.011}}, --Heavy GLs
		{damage = 900, pickup = {0.016, 0.008}}, --Rocket Launchers
		{damage = 1200, pickup = {0.011, 0.005}}
	}

	--Determine the damage tier the gun falls under.
	weapon.AMMO_PICKUP = {0, 0}
	local damage_mul = weapon.stats_modifiers and weapon.stats_modifiers.damage or 1
	for i, pickup_tier in ipairs(damage_tiers_pickup) do
		weapon.AMMO_PICKUP[1] = pickup_tier.pickup[1]
		weapon.AMMO_PICKUP[2] = pickup_tier.pickup[2]
		if weapon.stats.damage * damage_mul <= pickup_tier.damage - 1 then --subtract 1 to counteract floating point error.
			break
		end
	end

	--Determine how much to multiply things by.
	local pickup_multiplier = weapon.AMMO_MAX
	local category_pickup_muls = { --Different gun categories have different pickup mults to compensate for various factors.
		akimbo = 1.1,
		pistol = 1.2, --Compensate for low range.
		smg = 1.1,
			pdw = 0.8,
			lmg = 0.6,
			minigun = 0.4,
		shotgun = 0.8, --Compensate for ease of aim+multikills and/or versatility.
		--snp = 1, 
			semi_snp = 0.8,
		saw = 1.25, --Compensate for jankiness.
		bow = 0.7, --Compensate for picking arrows back up.
		crossbow = 0.7,
		tranq = 0.7,
		--Custom weapon pickup
		raygun = 1.25, --Non recoverable projectiles + never really dealing full damage meant the raygun had a super negative ammo economy
		typh = 0.8,
	}

	--Get weapon category specific pickup multipliers.
	for i = 1, #weapon.categories do
		local category = weapon.categories[i]
		pickup_multiplier = pickup_multiplier * (category_pickup_muls[category] or 1)
	end

	--Double multiplier if gun is a secondary, to compensate for lower total ammo.
	if weapon.use_data.selection_index == 1 then
		pickup_multiplier = pickup_multiplier * 2
	end

	--Blanket pickup
	pickup_multiplier = pickup_multiplier * 1.35

	--Set actual pickup values to use.
	weapon.AMMO_PICKUP[1] = weapon.AMMO_PICKUP[1] * pickup_multiplier
	weapon.AMMO_PICKUP[2] = weapon.AMMO_PICKUP[2] * pickup_multiplier
end

WeaponTweakData.clone__create_table_structure = WeaponTweakData._create_table_structure
function WeaponTweakData:_create_table_structure()
	self:clone__create_table_structure()	
	self.hk23_sc_npc = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}	
	self.m249_bravo_npc = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}			
	self.scar_npc = {
		usage = "is_dmr",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}	
	self.hk21_sc_npc = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.peacemaker_npc = {
		usage = "is_revolver",
		sounds = {},
		use_data = {}
	}
	self.m249_npc = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mossberg_npc = {
		usage = "mossberg",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mp9_npc = {
		usage = "mp9",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m14_sniper_npc = {
		usage = "is_sniper",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {}
	}	
	self.benelli_npc = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}	
	self.osipr_gl_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m4_yellow_npc = {
		usage = "is_rifle_single_fire",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}	
	self.smoke_npc = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}		

	--Crew shit below--
	for i, wep_id in ipairs(damage_set.smg) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_smg"
		end
	end
	
	for i, wep_id in ipairs(damage_set.assault_rifle) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_rifle"
		end
	end

	for i, wep_id in ipairs(damage_set.shotgun_auto) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_shotgun_mag"
		end
	end

	for i, wep_id in ipairs(damage_set.shotgun_pump) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_shotgun_pump"
		end
	end

	for i, wep_id in ipairs(damage_set.sniper_auto) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_dmr"
		end
	end

	for i, wep_id in ipairs(damage_set.sniper_bolt) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_sniper"
		end
	end

	for i, wep_id in ipairs(damage_set.lmg) do
		if self[ wep_id ] and self[ wep_id ].usage then
			self[ wep_id ].usage = "is_lmg"
		end
	end

	self.flamethrower_mk2_crew.usage = "flamethrower"
	self.flamethrower_mk2_crew.anim_usage = "is_bullpup"	

	self.peacemaker_crew = {
		usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}

	self.shepheard_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.p90_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}

	self.benelli_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ben_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.spas12_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ultima_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}

	self.m16_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}

	self.ching_crew = {
		usage = "rifle",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}

	}		
	self.m14_crew = {
		usage = "rifle",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}	
	self.g3_crew = {
		usage = "rifle",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}

	self.mossberg_crew = {
		usage = "mossberg",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.huntsman_crew = {
		usage = "mossberg",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.b682_crew = {
		usage = "mossberg",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}

end

WeaponTweakData.clone__precalculate_values = WeaponTweakData._precalculate_values
function WeaponTweakData:_precalculate_values()
	self:clone__precalculate_values()
	self.hk21_sc_npc.AMMO_MAX = self.hk21_sc_npc.CLIP_AMMO_MAX * self.hk21_sc_npc.NR_CLIPS_MAX
	self.mp5_cloak_npc.AMMO_MAX = self.mp5_cloak_npc.CLIP_AMMO_MAX * self.mp5_cloak_npc.NR_CLIPS_MAX
	self.peacemaker_npc.AMMO_MAX = self.peacemaker_npc.CLIP_AMMO_MAX * self.peacemaker_npc.NR_CLIPS_MAX
end

Hooks:PostHook( WeaponTweakData, "init", "resmod_cap", function(self)
	if self.SetupAttachmentPoint then
		--[
		self:SetupAttachmentPoint( "par", {
			name = "a_o", -- Name of Attachment Point ( This can be a preexisting one or a new one. )
			base_a_obj = "a_o", -- ( Optional ) Attachment point position to base the attachment point off of.
			--part_attach_data = {
			--	{"wpn_fps_lmg_par_upper_reciever"}, -- Attachments to attach to. ( Supports multiple if the attachment has multiple variants. )
			--	"g_cover" -- The object on the attachment to attach to. ( If this object is animated 90% of the time it should move with it. )
			--},
			position = Vector3( 0, 6, 0 ), -- Position to offset from the part object. ( Default: Vector3( 0, 0, 0 ) )
			rotation = RotationCAP( 0, 0, 0 ) -- Rotation to offset from the part object. ( Default: Rotation( 0, 0, 0 ) )
		})
		--]]
		--[
		self:SetupAttachmentPoint( "m249", {
			name = "a_o",
			base_a_obj = "a_o",
			--part_attach_data = {
			--	{"wpn_fps_lmg_m249_upper_reciever"},
			--	"g_dustcover"
			--},
			position = Vector3( 0, 3, 0 ),
			rotation = RotationCAP( 0, 0, 0 )
		})
		--]]

		self:SetupAttachmentPoint( "m60", {
			name = "a_o",
			base_a_obj = "a_o",
			--part_attach_data = {
			--	{"wpn_fps_lmg_m60_upper_reciever"},
			--	"g_dustcover"
			--},
			position = Vector3( 0, 6.1, 0.5 ),
			rotation = RotationCAP( 0, 0, 0 )
		})

		--[[
		self:SetupAttachmentPoint( "mg42", {
			name = "a_o",
			base_a_obj = "a_o",
			--part_attach_data = {
			--	{"wpn_fps_lmg_mg42_reciever"},
			--	"g_lid"
			--},
			position = Vector3( 0, 0, 0 ),
			rotation = RotationCAP( 0, 0, 0 )
		})
		--]]

		self:SetupAttachmentPoint( "hk21", {
			name = "a_s_fix",
			base_a_obj = "a_s",
			position = Vector3( 0, 1.35, 0 ),
			rotation = RotationCAP( 0, 0, 0 )
		})

		self:SetupAttachmentPoint( "ak5", {
			name = "a_s_fix",
			base_a_obj = "a_s",
			position = Vector3( 0, 0, -1.1 ),
			rotation = RotationCAP( 0, 0, 0 )
		})


		self:SetupAttachmentPoint( "groza", {
			name = "a_m_fix",
			base_a_obj = "a_m",
			position = Vector3( 0, 0.6, -0.6 ),
			rotation = RotationCAP( 0, 0, 0 )
		})

		self:SetupAttachmentPoint( "asval", {
			name = "a_m_fix",
			base_a_obj = "a_m",
			part_attach_data = {
				{"wpn_fps_ass_asval_m_standard_dummy"},
				"g_mag"
			},
			position = Vector3( 0, -4, 6 ),
			rotation = RotationCAP( 0, 0, 0 )
		})
	end
end)	
