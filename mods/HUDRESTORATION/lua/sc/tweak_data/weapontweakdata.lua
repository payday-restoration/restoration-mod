if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function WeaponTweakData:_init_data_sentry_gun_npc()
	self.sentry_gun.name_id = "debug_sentry_gun"
	self.sentry_gun.DAMAGE = 2.5
	self.sentry_gun.SUPPRESSION = 1
	self.sentry_gun.SPREAD = 5
	self.sentry_gun.FIRE_RANGE = 5000
	self.sentry_gun.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.sentry_gun.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sentry_gun.auto.fire_rate = 0.15
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
end

function WeaponTweakData:_set_hard()
end

function WeaponTweakData:_set_overkill()
end

function WeaponTweakData:_set_overkill_145()
	self.swat_van_turret_module.HEALTH_INIT = 2775
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 600
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}

	self.ceiling_turret_module.HEALTH_INIT = 1387.5
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 300
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 1387.5
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 300
end

function WeaponTweakData:_set_easy_wish()
	self.swat_van_turret_module.HEALTH_INIT = 3237.5
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.BAG_DMG_MUL = 8

	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.5},
		{2000, 2.5},
		{3000, 1}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.5},
		{2000, 2.5},
		{3000, 1}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 2.5},
		{2000, 2.5},
		{3000, 1}
	}
	self.ceiling_turret_module.HEALTH_INIT = 1618.75
	self.ceiling_turret_module.BAG_DMG_MUL = 8
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 1618.75
	self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 8
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 350
end

function WeaponTweakData:_set_overkill_290()
	self.swat_van_turret_module.HEALTH_INIT = 3237.5
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.BAG_DMG_MUL = 8
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.875},
		{1800, 2.625},
		{3000, 1.05}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.875},
		{1800, 2.625},
		{3000, 1.05}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 2.875},
		{1800, 2.625},
		{3000, 1.05}
	}
	self.ceiling_turret_module.HEALTH_INIT = 1618.75
	self.ceiling_turret_module.BAG_DMG_MUL = 8
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 1618.75
	self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 8
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 350


	--DW Damage values below--
	self.c45_npc.DAMAGE = 2.1
	self.mp5_npc.DAMAGE = 2
	self.mp9_npc.DAMAGE = 2
	self.sr2_smg_npc.DAMAGE = 2
	self.x_c45_npc.DAMAGE = 2.1
end

function WeaponTweakData:_set_sm_wish()
	self.swat_van_turret_module.HEALTH_INIT = 3237.5
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.BAG_DMG_MUL = 8
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 3.125},
		{2000, 3.125},
		{3000, 3.125},
		{4000, 1.25}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 3.125},
		{2000, 3.125},
		{3000, 3.125},
		{4000, 1.25}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 3.125},
		{2000, 3.125},
		{3000, 3.125},
		{4000, 1.25}
	}
	self.ceiling_turret_module.HEALTH_INIT = 1618.75
	self.ceiling_turret_module.BAG_DMG_MUL = 8
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350

	self.ceiling_turret_module_no_idle.HEALTH_INIT = 1618.75
	self.ceiling_turret_module_no_idle.BAG_DMG_MUL = 8
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 350

	--OD Damage values below--
	self.c45_npc.DAMAGE = 2.1
	self.mp5_npc.DAMAGE = 2
	self.mp9_npc.DAMAGE = 2
	self.sr2_smg_npc.DAMAGE = 2
	self.x_c45_npc.DAMAGE = 2.1
end

function WeaponTweakData:_init_data_npc_melee()
	self.npc_melee = {}
	self.npc_melee.baton = {}
	self.npc_melee.baton.unit_name = Idstring("units/payday2/characters/ene_acc_baton/ene_acc_baton")
	self.npc_melee.baton.damage = 1.5
	self.npc_melee.baton.animation_param = "melee_baton"
	self.npc_melee.baton.player_blood_effect = true
	self.npc_melee.baton.armor_piercing = true
	self.npc_melee.knife_1 = {}
	self.npc_melee.knife_1.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
	self.npc_melee.knife_1.damage = 4
	self.npc_melee.knife_1.animation_param = "melee_knife"
	self.npc_melee.knife_1.player_blood_effect = true
	self.npc_melee.knife_1.armor_piercing = true
	self.npc_melee.knife_1_pumping = {}
	self.npc_melee.knife_1_pumping.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
	self.npc_melee.knife_1_pumping.damage = 6
	self.npc_melee.knife_1_pumping.animation_param = "melee_knife"
	self.npc_melee.knife_1_pumping.player_blood_effect = true
	self.npc_melee.knife_1_pumping.armor_piercing = true
	self.npc_melee.fists = {}
	self.npc_melee.fists.unit_name = nil
	self.npc_melee.fists.damage = 1.5
	self.npc_melee.fists.animation_param = "melee_fist"
	self.npc_melee.fists.player_blood_effect = true
	self.npc_melee.fists.armor_piercing = true
	self.npc_melee.fists_dozer = {}
	self.npc_melee.fists_dozer.unit_name = nil
	self.npc_melee.fists_dozer.damage = 2.25
	self.npc_melee.fists_dozer.animation_param = "melee_fist"
	self.npc_melee.fists_dozer.player_blood_effect = true
	self.npc_melee.fists_dozer.armor_piercing = true
	self.npc_melee.helloween = {}
	self.npc_melee.helloween.unit_name = Idstring("units/pd2_halloween/weapons/wpn_mel_titan_hammer/wpn_mel_titan_hammer")
	self.npc_melee.helloween.damage = 2.25
	self.npc_melee.helloween.animation_param = "melee_fireaxe"
	self.npc_melee.helloween.player_blood_effect = true
	self.npc_melee.helloween.armor_piercing = true
	self.npc_melee.helloween_sword = {}
	self.npc_melee.helloween_sword.unit_name = Idstring("units/payday2/weapons/wpn_mel_hw_sword/wpn_mel_hw_sword")
	self.npc_melee.helloween_sword.damage = 2.25
	self.npc_melee.helloween_sword.animation_param = "melee_fireaxe"
	self.npc_melee.helloween_sword.player_blood_effect = true
	self.npc_melee.helloween_sword.armor_piercing = true
end

function WeaponTweakData:_set_npc_weapon_damage_multiplier(mul)
	for name, data in pairs(self.npc_melee) do
		data.damage = data.damage * mul
	end
end

function WeaponTweakData:_init_data_c45_npc()
	self.c45_npc.sounds.prefix = "c45_npc"
	self.c45_npc.use_data.selection_index = 1
	self.c45_npc.DAMAGE = 1.8
	self.c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c45_npc.CLIP_AMMO_MAX = 17
	self.c45_npc.NR_CLIPS_MAX = 5
	self.c45_npc.hold = "pistol"
	self.c45_npc.alert_size = 3500
	self.c45_npc.suppression = 2.2
	self.colt_1911_primary_npc = deep_clone(self.c45_npc)
	self.colt_1911_primary_npc.DAMAGE = 3
	self.colt_1911_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData:_init_data_x_c45_npc()
	self.x_c45_npc.sounds.prefix = "c45_npc"
	self.x_c45_npc.use_data.selection_index = 1
	self.x_c45_npc.DAMAGE = 1.8
	self.x_c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_c45_npc.CLIP_AMMO_MAX = 34
	self.x_c45_npc.NR_CLIPS_MAX = 5
	self.x_c45_npc.hold = "akimbo_pistol"
	self.x_c45_npc.alert_size = 3500
	self.x_c45_npc.suppression = 2.2
end

function WeaponTweakData:_init_data_beretta92_npc()
	self.beretta92_npc.sounds.prefix = "beretta_npc"
	self.beretta92_npc.use_data.selection_index = 1
	self.beretta92_npc.DAMAGE = 2.8
	self.beretta92_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.beretta92_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.beretta92_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.beretta92_npc.CLIP_AMMO_MAX = 14
	self.beretta92_npc.NR_CLIPS_MAX = 4
	self.beretta92_npc.hold = "pistol"
	self.beretta92_npc.alert_size = 0
	self.beretta92_npc.suppression = 0
	self.beretta92_npc.has_suppressor = "suppressed_a"
	self.beretta92_primary_npc = deep_clone(self.beretta92_npc)
	self.beretta92_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData:_init_data_raging_bull_npc()
	self.raging_bull_npc.sounds.prefix = "rbull_npc"
	self.raging_bull_npc.use_data.selection_index = 1
	self.raging_bull_npc.DAMAGE = 8.7
	self.raging_bull_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.raging_bull_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.raging_bull_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.raging_bull_npc.CLIP_AMMO_MAX = 6
	self.raging_bull_npc.NR_CLIPS_MAX = 8
	self.raging_bull_npc.hold = "pistol"
	self.raging_bull_npc.alert_size = 10000
	self.raging_bull_npc.suppression = 3.3
	self.raging_bull_primary_npc = deep_clone(self.raging_bull_npc)
	self.raging_bull_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData:_init_data_m4_npc()
	self.m4_npc.sounds.prefix = "m4_npc"
	self.m4_npc.use_data.selection_index = 2
	self.m4_npc.DAMAGE = 2.3
	self.m4_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.m4_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m4_npc.CLIP_AMMO_MAX = 30
	self.m4_npc.NR_CLIPS_MAX = 5
	self.m4_npc.auto.fire_rate = 0.086
	self.m4_npc.hold = "rifle"
	self.m4_npc.alert_size = 4000
	self.m4_npc.suppression = 2.4
	self.m4_secondary_npc = deep_clone(self.m4_npc)
	self.m4_secondary_npc.use_data.selection_index = 1
	self.ak47_ass_npc = deep_clone(self.m4_npc)
	self.sg417_npc = deep_clone(self.m4_npc)
	self.sg417_npc.auto.fire_rate = 0.1
	self.sg417_npc.CLIP_AMMO_MAX = 20
	self.sg417_npc.DAMAGE = 5.4
	self.m4_boom_npc = deep_clone(self.m4_npc)
end

function WeaponTweakData:_init_data_x_akmsu_npc()
	self.x_akmsu_npc.sounds.prefix = "akm_npc"
	self.x_akmsu_npc.use_data.selection_index = 2
	self.x_akmsu_npc.DAMAGE = 5.4
	self.x_akmsu_npc.auto.fire_rate = 0.1
	self.x_akmsu_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.x_akmsu_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_akmsu_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.x_akmsu_npc.CLIP_AMMO_MAX = 200
	self.x_akmsu_npc.NR_CLIPS_MAX = 5
	self.x_akmsu_npc.hold = "akimbo_pistol"
	self.x_akmsu_npc.alert_size = 7500
	self.x_akmsu_npc.suppression = 3
end

function WeaponTweakData:_init_data_ak47_npc()
	self.ak47_npc.sounds.prefix = "akm_npc"
	self.ak47_npc.use_data.selection_index = 2
	self.ak47_npc.DAMAGE = 5.4
	self.ak47_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak47_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak47_npc.CLIP_AMMO_MAX = 30
	self.ak47_npc.NR_CLIPS_MAX = 5
	self.ak47_npc.auto.fire_rate = 0.2
	self.ak47_npc.hold = "rifle"
	self.ak47_npc.alert_size = 7500
	self.ak47_npc.suppression = 3
end

function WeaponTweakData:_init_data_m14_sniper_npc()
	self.m14_sniper_npc.sounds.prefix = "sniper_npc"
	self.m14_sniper_npc.use_data.selection_index = 2
	self.m14_sniper_npc.DAMAGE = 10
	self.m14_sniper_npc.can_shoot_through_enemy = true
	self.m14_sniper_npc.can_shoot_through_shield = true
	self.m14_sniper_npc.can_shoot_through_wall = true
	self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_sniper_npc.CLIP_AMMO_MAX = 10
	self.m14_sniper_npc.NR_CLIPS_MAX = 8
	self.m14_sniper_npc.hold = "rifle"
	self.m14_sniper_npc.alert_size = 10000
	self.m14_sniper_npc.suppression = 3.3
	self.m14_sniper_npc.armor_piercing = true
	self.svd_snp_npc = deep_clone(self.m14_sniper_npc)
	self.svdsil_snp_npc = deep_clone(self.m14_sniper_npc)
	self.svdsil_snp_npc.has_suppressor = "suppressed_a"
end

function WeaponTweakData:_init_data_r870_npc()
	self.r870_npc.sounds.prefix = "remington_npc"
	self.r870_npc.use_data.selection_index = 2
	self.r870_npc.DAMAGE = 8.9
	self.r870_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.r870_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_npc.CLIP_AMMO_MAX = 8
	self.r870_npc.NR_CLIPS_MAX = 4
	self.r870_npc.hold = "rifle"
	self.r870_npc.alert_size = 7500
	self.r870_npc.suppression = 3
	self.r870_npc.is_shotgun = true
	self.benelli_npc = deep_clone(self.r870_npc)
	self.benelli_npc.sounds.prefix = "remington_npc"
	self.benelli_npc.DAMAGE = 7.5
	self.benelli_npc.CLIP_AMMO_MAX = 10
end

function WeaponTweakData:_init_data_mossberg_npc()
	self.mossberg_npc.sounds.prefix = "remington_npc"
	self.mossberg_npc.use_data.selection_index = 2
	self.mossberg_npc.DAMAGE = 13.8
	self.mossberg_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mossberg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.mossberg_npc.CLIP_AMMO_MAX = 2
	self.mossberg_npc.NR_CLIPS_MAX = 6
	self.mossberg_npc.hold = "rifle"
	self.mossberg_npc.alert_size = 15000
	self.mossberg_npc.suppression = 3.6
	self.mossberg_npc.is_shotgun = true
end

function WeaponTweakData:_init_data_mp5_npc()
	self.mp5_npc.sounds.prefix = "mp5_npc"
	self.mp5_npc.use_data.selection_index = 1
	self.mp5_npc.DAMAGE = 1.8
	self.mp5_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp5_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp5_npc.CLIP_AMMO_MAX = 30
	self.mp5_npc.NR_CLIPS_MAX = 5
	self.mp5_npc.auto.fire_rate = 0.075
	self.mp5_npc.hold = "rifle"
	self.mp5_npc.alert_size = 3500
	self.mp5_npc.suppression = 3
	self.mp5_tactical_npc = deep_clone(self.mp5_npc)
	self.mp5_tactical_npc.has_suppressor = "suppressed_a"
	self.mp5_tactical_npc.DAMAGE = 3.2
	self.mp5_tactical_npc.alert_size = 500
	self.mp5_tactical_npc.suppression = 0.1
	self.ump_npc = deep_clone(self.mp5_npc)
	self.ump_npc.DAMAGE = 2.8
	self.ump_npc.auto.fire_rate = 0.083
	self.ump_npc.sounds.prefix = "mp5_npc"
	self.ump_npc.CLIP_AMMO_MAX = 25
	self.asval_smg_npc = deep_clone(self.mp5_npc)
	self.asval_smg_npc.DAMAGE = 7.5
	self.asval_smg_npc.has_suppressor = "suppressed_a"
	self.asval_smg_npc.auto.fire_rate = 0.07843137254
	self.asval_smg_npc.CLIP_AMMO_MAX = 20
	self.asval_smg_npc.suppression = 2.8
	self.asval_smg_npc.usage = "m4"
	self.akmsu_smg_npc = deep_clone(self.mp5_npc)
end

function WeaponTweakData:_init_data_mac11_npc()
	self.mac11_npc.sounds.prefix = "mp5_npc"
	self.mac11_npc.use_data.selection_index = 1
	self.mac11_npc.DAMAGE = 2.2
	self.mac11_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac11_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac11_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac11_npc.CLIP_AMMO_MAX = 60
	self.mac11_npc.NR_CLIPS_MAX = 5
	self.mac11_npc.auto.fire_rate = 0.06
	self.mac11_npc.hold = "pistol"
	self.mac11_npc.alert_size = 3500
	self.mac11_npc.suppression = 3
end

function WeaponTweakData:_init_data_g36_npc()
	self.g36_npc.sounds.prefix = "g36_npc"
	self.g36_npc.use_data.selection_index = 2
	self.g36_npc.DAMAGE = 2.3
	self.g36_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g36_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36_npc.CLIP_AMMO_MAX = 30
	self.g36_npc.NR_CLIPS_MAX = 5
	self.g36_npc.auto.fire_rate = 0.08
	self.g36_npc.hold = "rifle"
	self.g36_npc.alert_size = 3500
	self.g36_npc.suppression = 3
end

function WeaponTweakData:_init_data_mp9_npc()
	self.mp9_npc.sounds.prefix = "mp9_npc"
	self.mp9_npc.use_data.selection_index = 1
	self.mp9_npc.DAMAGE = 1.8
	self.mp9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9_npc.CLIP_AMMO_MAX = 30
	self.mp9_npc.NR_CLIPS_MAX = 5
	self.mp9_npc.auto.fire_rate = 0.06666666666
	self.mp9_npc.hold = "pistol"
	self.mp9_npc.alert_size = 3500
	self.mp9_npc.suppression = 3
	self.sr2_smg_npc = deep_clone(self.mp9_npc)
end

function WeaponTweakData:_init_data_mac10_npc()
	self.mac10_npc.sounds.prefix = "mac10_npc"
	self.mac10_npc.use_data.selection_index = 1
	self.mac10_npc.DAMAGE = 2.2
	self.mac10_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac10_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac10_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac10_npc.CLIP_AMMO_MAX = 60
	self.mac10_npc.NR_CLIPS_MAX = 5
	self.mac10_npc.auto.fire_rate = 0.06
	self.mac10_npc.hold = "pistol"
	self.mac10_npc.alert_size = 3500
	self.mac10_npc.suppression = 3
end

function WeaponTweakData:_init_data_saiga_npc()
	self.saiga_npc.sounds.prefix = "saiga_npc"
	self.saiga_npc.use_data.selection_index = 2
	self.saiga_npc.DAMAGE = 5
	self.saiga_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saiga_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_npc.auto.fire_rate = 0.1
	self.saiga_npc.CLIP_AMMO_MAX = 20
	self.saiga_npc.NR_CLIPS_MAX = 4
	self.saiga_npc.hold = "rifle"
	self.saiga_npc.alert_size = 10000
	self.saiga_npc.suppression = 3.3
	self.saiga_npc.is_shotgun = true
end

function WeaponTweakData:_init_data_swat_van_turret_module_npc()
	self.swat_van_turret_module.name_id = "debug_sentry_gun"
	self.swat_van_turret_module.DAMAGE = 1.7
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 1},
		{2000, 1},
		{3000, 1}
	}
	self.swat_van_turret_module.SUPPRESSION = 0.1
	self.swat_van_turret_module.SPREAD = 0.5
	self.swat_van_turret_module.FIRE_RANGE = 10000
	self.swat_van_turret_module.CLIP_SIZE = 200
	self.swat_van_turret_module.AUTO_RELOAD = true
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 5
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 2
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.ECM_HACKABLE = false
	self.swat_van_turret_module.FLASH_GRENADE = {
		range = 300,
		effect_duration = 6,
		chance = 1,
		check_interval = {1, 1},
		quiet_time = {10, 13}
	}
	self.swat_van_turret_module.HACKABLE_WITH_ECM = false
	self.swat_van_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
	self.swat_van_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.swat_van_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.swat_van_turret_module.auto.fire_rate = 0.13333333333
	self.swat_van_turret_module.alert_size = 2500
	self.swat_van_turret_module.headshot_dmg_mul = 1
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 3
	self.swat_van_turret_module.FIRE_DMG_MUL = 1
	self.swat_van_turret_module.BAG_DMG_MUL = 10
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.HEALTH_INIT = 1850
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 400
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
	self.swat_van_turret_module.suppression = 0.1
end

function WeaponTweakData:_init_data_ceiling_turret_module_npc()
	self.ceiling_turret_module.name_id = "debug_sentry_gun"
	self.ceiling_turret_module.DAMAGE = 1.7
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 1},
		{2000, 1},
		{3000, 1}
	}
	self.ceiling_turret_module.SUPPRESSION = 0.1
	self.ceiling_turret_module.SPREAD = 0.5
	self.ceiling_turret_module.FIRE_RANGE = 10000
	self.ceiling_turret_module.CLIP_SIZE = 200
	self.ceiling_turret_module.AUTO_RELOAD = true
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 5
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 2
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 30
	self.ceiling_turret_module.ECM_HACKABLE = false
	self.ceiling_turret_module.FLASH_GRENADE = {
		range = 300,
		effect_duration = 6,
		chance = 1,
		check_interval = {1, 1},
		quiet_time = {10, 13}
	}
	self.ceiling_turret_module.HACKABLE_WITH_ECM = false
	self.ceiling_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
	self.ceiling_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.ceiling_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.ceiling_turret_module.auto.fire_rate = 0.13333333333
	self.ceiling_turret_module.alert_size = 2500
	self.ceiling_turret_module.headshot_dmg_mul = 1
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 3
	self.ceiling_turret_module.FIRE_DMG_MUL = 1
	self.ceiling_turret_module.BAG_DMG_MUL = 10
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.HEALTH_INIT = 925
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 200
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
	self.ceiling_turret_module.suppression = 0.1
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_no_idle.CAN_GO_IDLE = false
end

function WeaponTweakData:_init_data_scar_npc()
	self.scar_npc.sounds.prefix = "scar_npc"
	self.scar_npc.use_data.selection_index = 2
	self.scar_npc.DAMAGE = 7.5
	self.scar_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.scar_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar_npc.CLIP_AMMO_MAX = 20
	self.scar_npc.NR_CLIPS_MAX = 5
	self.scar_npc.auto.fire_rate = 0.08571428571
	self.scar_npc.hold = "rifle"
	self.scar_npc.alert_size = 6000
	self.scar_npc.suppression = 2.8
	self.scar_secondary_npc = deep_clone(self.scar_npc)
	self.scar_secondary_npc.use_data.selection_index = 1
	self.asval_smg_npc = deep_clone(self.scar_npc)
	self.asval_smg_npc.has_suppressor = "suppressed_a"
	self.asval_smg_npc.auto.fire_rate = 0.07843137254
end

function WeaponTweakData:_init_data_m249_npc()
	self.m249_npc.sounds.prefix = "m249_npc"
	self.m249_npc.use_data.selection_index = 2
	self.m249_npc.DAMAGE = 3.5
	self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_npc.CLIP_AMMO_MAX = 200
	self.m249_npc.NR_CLIPS_MAX = 2
	self.m249_npc.auto.fire_rate = 0.075
	self.m249_npc.hold = "rifle"
	self.m249_npc.alert_size = 10000
	self.m249_npc.suppression = 3.3
	self.rpk_lmg_npc = deep_clone(self.m249_npc)
end

function WeaponTweakData:_init_data_hk21_npc()
	self.hk21_npc.sounds.prefix = "hk23e_npc"
	self.hk21_npc.use_data.selection_index = 2
	self.hk21_npc.DAMAGE = 4
	self.hk21_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_npc.CLIP_AMMO_MAX = 150
	self.hk21_npc.NR_CLIPS_MAX = 5
	self.hk21_npc.auto.fire_rate = 0.075
	self.hk21_npc.hold = "rifle"
	self.hk21_npc.alert_size = 10000
	self.hk21_npc.suppression = 3.3
	self.hk21_npc.usage = "ak47"
	self.hk21_sc_npc = deep_clone(self.hk21_npc)
	self.hk21_sc_npc.sounds.prefix = "m249_npc"
	self.hk21_secondary_npc = deep_clone(self.hk21_npc)
	self.hk21_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_peacemaker_npc()
	self.peacemaker_npc.sounds.prefix = "pmkr45_npc"
	self.peacemaker_npc.use_data.selection_index = 1
	self.peacemaker_npc.DAMAGE = 15
	self.peacemaker_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.peacemaker_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.peacemaker_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.peacemaker_npc.CLIP_AMMO_MAX = 6
	self.peacemaker_npc.NR_CLIPS_MAX = 8
	self.peacemaker_npc.hold = "pistol"
	self.peacemaker_npc.alert_size = 5000
	self.peacemaker_npc.armor_piercing = true
	self.peacemaker_npc.suppression = 1.8
end

function WeaponTweakData:_init_data_contraband_npc()
	self.contraband_npc.sounds.prefix = "contraband_npc"
	self.contraband_npc.use_data.selection_index = 2
	self.contraband_npc.DAMAGE = 5.4
	self.contraband_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.contraband_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.contraband_npc.CLIP_AMMO_MAX = 30
	self.contraband_npc.NR_CLIPS_MAX = 5
	self.contraband_npc.auto.fire_rate = 0.1
	self.contraband_npc.hold = "rifle"
	self.contraband_npc.alert_size = 5000
	self.contraband_npc.suppression = 1
	self.contraband_m203_npc.sounds.prefix = "contrabandm203_npc"
	self.contraband_m203_npc.use_data.selection_index = 2
	self.contraband_m203_npc.DAMAGE = 2
	self.contraband_m203_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.contraband_m203_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.contraband_m203_npc.no_trail = true
	self.contraband_m203_npc.CLIP_AMMO_MAX = 1
	self.contraband_m203_npc.NR_CLIPS_MAX = 4
	self.contraband_m203_npc.auto.fire_rate = 0.1
	self.contraband_m203_npc.hold = "rifle"
	self.contraband_m203_npc.alert_size = 2800
	self.contraband_m203_npc.suppression = 1
end

end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

function WeaponTweakData:_init_stats()
	self.stats = {}
	self.stats.alert_size = {
		30000,
		20000,
		15000,
		10000,
		7500,
		6000,
		4500,
		4000,
		3500,
		1800,
		1500,
		1200,
		1000,
		850,
		700,
		500,
		350,
		200,
		100,
		0
	}
	self.stats.suppression = {
		4.5,
		3.9,
		3.6,
		3.3,
		3,
		2.8,
		2.6,
		2.4,
		2.2,
		1.6,
		1.5,
		1.4,
		1.3,
		1.2,
		1.1,
		1,
		0.8,
		0.6,
		0.4,
		0.2
	}
	self.stats.damage = {
		0.1,
		0.2,
		0.3,
		0.4,
		0.5,
		0.6,
		0.7,
		0.8,
		0.9,
		1,
		1.1,
		1.2,
		1.3,
		1.4,
		1.5,
		1.6,
		1.7,
		1.8,
		1.9,
		2,
		2.1,
		2.2,
		2.3,
		2.4,
		2.5,
		2.6,
		2.7,
		2.8,
		2.9,
		3,
		3.1,
		3.2,
		3.3,
		3.4,
		3.5,
		3.6,
		3.7,
		3.8,
		3.9,
		4,
		4.1,
		4.2,
		4.3,
		4.4,
		4.5,
		4.6,
		4.7,
		4.8,
		4.9,
		5,
		5.1,
		5.2,
		5.3,
		5.4,
		5.5,
		5.6,
		5.7,
		5.8,
		5.9,
		6,
		6.1,
		6.2,
		6.3,
		6.4,
		6.5,
		6.6,
		6.7,
		6.8,
		6.9,
		7,
		7.1,
		7.2,
		7.3,
		7.4,
		7.5,
		7.6,
		7.7,
		7.8,
		7.9,
		8,
		8.1,
		8.2,
		8.3,
		8.4,
		8.5,
		8.6,
		8.7,
		8.8,
		8.9,
		9,
		9.1,
		9.2,
		9.3,
		9.4,
		9.5,
		9.6,
		9.7,
		9.8,
		9.9,
		10,
		10.1,
		10.2,
		10.3,
		10.4,
		10.5,
		10.6,
		10.7,
		10.8,
		10.9,
		11,
		11.1,
		11.2,
		11.3,
		11.4,
		11.5,
		11.6,
		11.7,
		11.8,
		11.9,
		12,
		12.1,
		12.2,
		12.3,
		12.4,
		12.5,
		12.6,
		12.7,
		12.8,
		12.9,
		13,
		13.1,
		13.2,
		13.3,
		13.4,
		13.5,
		13.6,
		13.7,
		13.8,
		13.9,
		14,
		14.1,
		14.2,
		14.3,
		14.4,
		14.5,
		14.6,
		14.7,
		14.8,
		14.9,
		15,
		15.1,
		15.2,
		15.3,
		15.4,
		15.5,
		15.6,
		15.7,
		15.8,
		15.9,
		16,
		16.1,
		16.2,
		16.3,
		16.4,
		16.5,
		16.6,
		16.7,
		16.8,
		16.9,
		17,
		17.1,
		17.2,
		17.3,
		17.4,
		17.5,
		17.6,
		17.7,
		17.8,
		17.9,
		18,
		18.1,
		18.2,
		18.3,
		18.4,
		18.5,
		18.6,
		18.7,
		18.8,
		18.9,
		19,
		19.1,
		19.2,
		19.3,
		19.4,
		19.5,
		19.6,
		19.7,
		19.8,
		19.9,
		20,
		20.1,
		20.2,
		20.3,
		20.4,
		20.5,
		20.6,
		20.7,
		20.8,
		20.9,
		21,
		21.1,
		21.2,
		21.3,
		21.4,
		21.5,
		21.6,
		21.7,
		21.8,
		21.9,
		22,
		22.1,
		22.2,
		22.3,
		22.4,
		22.5,
		22.6,
		22.7,
		22.8,
		22.9,
		23,
		23.1,
		23.2,
		23.3,
		23.4,
		23.5,
		23.6,
		23.7,
		23.8,
		23.9,
		24,
		24.1,
		24.2,
		24.3,
		24.4,
		24.5,
		24.6,
		24.7,
		24.8,
		24.9,
		25,
		25.1,
		25.2,
		25.3,
		25.4,
		25.5,
		25.6,
		25.7,
		25.8,
		25.9,
		26,
		26.1,
		26.2,
		26.3,
		26.4,
		26.5,
		26.6,
		26.7,
		26.8,
		26.9,
		27,
		27.1,
		27.2,
		27.3,
		27.4,
		27.5,
		27.6,
		27.7,
		27.8,
		27.9,
		28,
		28.1,
		28.2,
		28.3,
		28.4,
		28.5,
		28.6,
		28.7,
		28.8,
		28.9,
		29,
		29.1,
		29.2,
		29.3,
		29.4,
		29.5,
		29.6,
		29.7,
		29.8,
		29.9,
		30,
		30.1,
		30.2,
		30.3,
		30.4,
		30.5,
		30.6,
		30.7,
		30.8,
		30.9,
		31,
		31.1,
		31.2,
		31.3,
		31.4,
		31.5,
		31.6,
		31.7,
		31.8,
		31.9,
		32,
		32.1,
		32.2,
		32.3,
		32.4,
		32.5,
		32.6,
		32.7,
		32.8,
		32.9,
		33,
		33.1,
		33.2,
		33.3,
		33.4,
		33.5,
		33.6,
		33.7,
		33.8,
		33.9,
		34,
		34.1,
		34.2,
		34.3,
		34.4,
		34.5,
		34.6,
		34.7,
		34.8,
		34.9,
		35,
		35.1,
		35.2,
		35.3,
		35.4,
		35.5,
		35.6,
		35.7,
		35.8,
		35.9,
		36,
		36.1,
		36.2,
		36.3,
		36.4,
		36.5,
		36.6,
		36.7,
		36.8,
		36.9,
		37,
		37.1,
		37.2,
		37.3,
		37.4,
		37.5,
		37.6,
		37.7,
		37.8,
		37.9,
		38,
		38.1,
		38.2,
		38.3,
		38.4,
		38.5,
		38.6,
		38.7,
		38.8,
		38.9,	
		39,
		39.1,
		39.2,
		39.3,
		39.4,
		39.5,
		39.6,
		39.7,
		39.8,
		39.9,
		40		
	}
	self.stats.zoom = {
		63,
		60,
		55,
		50,
		45,
		40,
		35,
		30,
		25,
		20
	}
	self.stats.spread = {
		2.016,
		1.92,
		1.824,
		1.728,
		1.632,
		1.536,
		1.44,
		1.344,
		1.248,
		1.152,
		1.056,
		0.96,
		0.864,
		0.768,
		0.672,
		0.576,
		0.48,
		0.384,
		0.288,
		0.192,
		0.096
	}
	self.stats.spread_moving = {
		3,
		2.7,
		2.4,
		2.2,
		2,
		1.7,
		1.4,
		1.2,
		1,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5
	}
	self.stats.recoil = {
		3,
		2.9,
		2.8,
		2.7,
		2.6,
		2.5,
		2.4,
		2.3,
		2.2,
		2.1,
		2,
		1.9,
		1.8,
		1.7,
		1.6,
		1.5,
		1.4,
		1.3,
		1.2,
		1.1,
		1,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5
	}
	self.stats.value = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10
	}
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
	self.stats.extra_ammo = {}
	for i = -10, 100, 2 do
		table.insert(self.stats.extra_ammo, i)
	end
	self.stats.total_ammo_mod = {
		-0.99,
		-0.98,
		-0.97,
		-0.96,
		-0.95,
		-0.94,
		-0.93,
		-0.92,
		-0.91,
		-0.9,
		-0.89,
		-0.88,
		-0.87,
		-0.86,
		-0.85,
		-0.84,
		-0.83,
		-0.82,
		-0.81,
		-0.8,
		-0.79,
		-0.78,
		-0.77,
		-0.76,
		-0.75,
		-0.74,
		-0.73,
		-0.72,
		-0.71,
		-0.7,
		-0.69,
		-0.68,
		-0.67,
		-0.66,
		-0.65,
		-0.64,
		-0.63,
		-0.62,
		-0.61,
		-0.6,
		-0.59,
		-0.58,
		-0.57,
		-0.56,
		-0.55,
		-0.54,
		-0.53,
		-0.52,
		-0.51,
		-0.5,
		-0.49,
		-0.48,
		-0.47,
		-0.46,
		-0.45,
		-0.44,
		-0.43,
		-0.42,
		-0.41,
		-0.4,
		-0.39,
		-0.38,
		-0.37,
		-0.36,
		-0.35,
		-0.34,
		-0.33,
		-0.32,
		-0.31,
		-0.3,
		-0.29,
		-0.28,
		-0.27,
		-0.26,
		-0.25,
		-0.24,
		-0.23,
		-0.22,
		-0.21,
		-0.2,
		-0.19,
		-0.18,
		-0.17,
		-0.16,
		-0.15,
		-0.14,
		-0.13,
		-0.12,
		-0.11,
		-0.1,
		-0.09,
		-0.08,
		-0.07,
		-0.06,
		-0.05,
		-0.04,
		-0.03,
		-0.02,
		-0.01,
		0,
		0.01,
		0.02,
		0.03,
		0.04,
		0.05,
		0.06,
		0.07,
		0.08,
		0.09,
		0.1,
		0.11,
		0.12,
		0.13,
		0.14,
		0.15,
		0.16,
		0.17,
		0.18,
		0.19,
		0.2,
		0.21,
		0.22,
		0.23,
		0.24,
		0.25,
		0.26,
		0.27,
		0.28,
		0.29,
		0.3,
		0.31,
		0.32,
		0.33,
		0.34,
		0.35,
		0.36,
		0.37,
		0.38,
		0.39,
		0.4,
		0.41,
		0.42,
		0.43,
		0.44,
		0.45,
		0.46,
		0.47,
		0.48,
		0.49,
		0.5,
	}
	self.stats.reload = {}
	for i = 5, 20, 0.5 do
		if i <= 10 or i == math.floor(i) then
			table.insert(self.stats.reload, i / 10)
		end
	end
end

function WeaponTweakData:_pickup_chance(max_ammo, selection_index)
	local low, high
	if selection_index == 2 then
		low = 0.02
		high = 0.05
	else
		low = 0.02
		high = 0.05
	end
	return {
		max_ammo * low,
		max_ammo * high
	}
end

Hooks:PostHook( WeaponTweakData, "init", "SC_weapons", function(self)

	local tact_rel = {'deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','new_m14','scar','fal','rpk','msr','r93','m95','famas','galil','g3','scorpion','benelli','serbu','r870','ksg','g26','spas12','l85a2','vhs','hs2000','tec9','asval','sub2000','polymer','wa2000','model70','sparrow','m37','sr2','pl14','tecci','hajk','boot','packrat','schakal','desertfox','tti','siltstone','flint','coal'}
	for i, wep_id in ipairs(tact_rel) do
		self[wep_id].tactical_reload = true
		--self[wep_id].has_description = false
	end
	local tact_akimbo_pistol = {'x_deagle','x_1911','x_b92fs','jowi','x_usp','x_g17','x_g22c','x_packrat'}
	for i, wep_id in ipairs(tact_akimbo_pistol) do
		self[wep_id].tactical_akimbo = true
		self[wep_id].recategorize = "akimbo"
		self[wep_id].sub_category = "pistol"
	end
	local tact_akimbo_smg = {'x_sr2','x_mp5'}
	for i, wep_id in ipairs(tact_akimbo_smg) do
		self[wep_id].tactical_akimbo = true
		self[wep_id].recategorize = "akimbo"
		self[wep_id].sub_category = "smg"
	end
	local tact_akimbo_rifle = {'x_akmsu'}
	for i, wep_id in ipairs(tact_akimbo_rifle) do
		self[wep_id].tactical_akimbo = true
		self[wep_id].recategorize = "akimbo"
		self[wep_id].sub_category = "assault_rifle"
	end
	self.c96.uses_clip = true
	self.mosin.uses_clip = true
	self.c96.clip_capacity = 10
	self.mosin.clip_capacity = 5
	--End of Tac reloading shit--
	self.trip_mines.damage = 100
	self.trip_mines.player_damage = 100
	self.trip_mines.damage_size = 200
	self.trip_mines.delay = 0.1

	self.new_m4.desc_id = "bm_menu_sc_m4_desc"
	self.new_m4.AMMO_MAX = 150
	self.new_m4.CLIP_AMMO_MAX = 20
	self.new_m4.fire_mode_data.fire_rate = 0.08571428571
	self.new_m4.auto.fire_rate = 0.08571428571
	self.new_m4.spread.standing = 3.5
	self.new_m4.spread.crouching = 2.5
	self.new_m4.spread.steelsight = 1
	self.new_m4.spread.moving_standing = 4
	self.new_m4.spread.moving_crouching = 3
	self.new_m4.spread.moving_steelsight = 2
	self.new_m4.kick.standing = {
		0.6,
		0.8,
		-1,
		1
	}
	self.new_m4.stats = {
		damage = 23,
		spread = 14,
		recoil = 18,
		spread_moving = 7,
		zoom = 3,
		concealment = 22,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.new_m4.panic_suppression_chance = 0.0
	self.glock_17.desc_id = "bm_menu_sc_glock17_desc"
	self.glock_17.fire_mode_data.fire_rate = 0.075
	self.glock_17.single.fire_rate = 0.075
	self.glock_17.AMMO_MAX = 150
	self.glock_17.CLIP_AMMO_MAX = 18
	self.glock_17.AMMO_PICKUP = self:_pickup_chance(self.glock_17.AMMO_MAX, 1)
	self.glock_17.spread.standing = 3.5
	self.glock_17.spread.crouching = 2.5
	self.glock_17.spread.steelsight = 1
	self.glock_17.spread.moving_standing = 4
	self.glock_17.spread.moving_crouching = 3
	self.glock_17.spread.moving_steelsight = 2
	self.glock_17.kick.standing = {
		0.6,
		0.8,
		-0.5,
		0.5
	}
	self.glock_17.kick.crouching = self.glock_17.kick.standing
	self.glock_17.kick.steelsight = self.glock_17.kick.standing
	self.glock_17.stats = {
		damage = 18,
		spread = 15,
		recoil = 20,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.glock_17.panic_suppression_chance = 0.0
	self.mp9.desc_id = "bm_menu_sc_mp9_desc"
	self.mp9.CLIP_AMMO_MAX = 20
	self.mp9.auto.fire_rate = 0.06666666666
	self.mp9.fire_mode_data.fire_rate = 0.06666666666
	self.mp9.AMMO_MAX = 150
	self.mp9.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.mp9.spread.standing = 3.5
	self.mp9.spread.crouching = 2.5
	self.mp9.spread.steelsight = 1
	self.mp9.spread.moving_standing = 4
	self.mp9.spread.moving_crouching = 3
	self.mp9.spread.moving_steelsight = 2
	self.mp9.kick.standing = self.new_m4.kick.standing
	self.mp9.kick.crouching = self.new_m4.kick.standing
	self.mp9.kick.steelsight = self.new_m4.kick.standing
	self.mp9.stats = {
		damage = 26,
		spread = 12,
		recoil = 22,
		spread_moving = 8,
		zoom = 3,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.mp9.panic_suppression_chance = 0.1
	self.r870.desc_id = "bm_menu_sc_r870_desc"
	self.r870.rays = 9
	self.r870.CLIP_AMMO_MAX = 8
	self.r870.spread.standing = 3.5
	self.r870.spread.crouching = 2.5
	self.r870.spread.steelsight = 1
	self.r870.spread.moving_standing = 4
	self.r870.spread.moving_crouching = 3
	self.r870.spread.moving_steelsight = 2
	self.r870.kick.standing = {
		1.9,
		2,
		-0.2,
		0.2
	}
	self.r870.kick.crouching = self.r870.kick.standing
	self.r870.kick.steelsight = self.r870.kick.standing
	self.r870.single.fire_rate = 0.6
	self.r870.fire_mode_data.fire_rate = 0.6
	self.r870.AMMO_MAX = 60
	self.r870.damage_near = 800
	self.r870.damage_far = 1600
	self.r870.AMMO_PICKUP = self:_pickup_chance(60, 2)
	self.r870.stats = {
		damage = 89,
		spread = 8,
		recoil = 16,
		spread_moving = 6,
		zoom = 3,
		concealment = 11,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.r870.stats_modifiers = {damage = 1}
	self.r870.panic_suppression_chance = 0.0
	self.glock_18c.desc_id = "bm_menu_sc_glock18c_desc"
	self.glock_18c.fire_mode_data.fire_rate = 0.05
	self.glock_18c.auto.fire_rate = 0.05
	self.glock_18c.CLIP_AMMO_MAX = 18
	self.glock_18c.AMMO_MAX = 150
	self.glock_18c.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.glock_18c.spread.standing = 3.5
	self.glock_18c.spread.crouching = 2.5
	self.glock_18c.spread.steelsight = 1
	self.glock_18c.spread.moving_standing = 4
	self.glock_18c.spread.moving_crouching = 3
	self.glock_18c.spread.moving_steelsight = 2
	self.glock_18c.kick.standing = self.new_m4.kick.standing
	self.glock_18c.kick.crouching = self.new_m4.kick.standing
	self.glock_18c.kick.steelsight = self.new_m4.kick.standing
	self.glock_18c.stats = {
		damage = 19,
		spread = 16,
		recoil = 19,
		spread_moving = 9,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.glock_18c.panic_suppression_chance = 0.0
	self.amcar.desc_id = "bm_menu_sc_amcar_desc"
	self.amcar.CLIP_AMMO_MAX = 20
	self.amcar.AMMO_MAX = 180
	self.amcar.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.amcar.fire_mode_data.fire_rate = 0.075
	self.amcar.auto.fire_rate = 0.075
	self.amcar.spread.standing = 3.5
	self.amcar.spread.crouching = 2.5
	self.amcar.spread.steelsight = 1
	self.amcar.spread.moving_standing = 4
	self.amcar.spread.moving_crouching = 3
	self.amcar.spread.moving_steelsight = 2
	self.amcar.kick.standing = self.new_m4.kick.standing
	self.amcar.kick.crouching = self.new_m4.kick.standing
	self.amcar.kick.steelsight = self.new_m4.kick.standing
	self.amcar.stats = {
		damage = 21,
		spread = 14,
		recoil = 20,
		spread_moving = 6,
		zoom = 3,
		concealment = 24,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.amcar.panic_suppression_chance = 0.0
	self.m16.desc_id = "bm_menu_sc_m16_desc"
	self.m16.fire_mode_data.fire_rate = 0.08571428571
	self.m16.auto.fire_rate = 0.08571428571
	self.m16.CLIP_AMMO_MAX = 20
	self.m16.AMMO_MAX = 120
	self.m16.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.m16.spread.standing = 3.5
	self.m16.spread.crouching = 2.5
	self.m16.spread.steelsight = 1
	self.m16.spread.moving_standing = 4
	self.m16.spread.moving_crouching = 3
	self.m16.spread.moving_steelsight = 2
	self.m16.stats = {
		damage = 43,
		spread = 16,
		recoil = 16,
		spread_moving = 5,
		zoom = 4,
		concealment = 21,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.m16.panic_suppression_chance = 0.0
	self.olympic.desc_id = "bm_menu_sc_olympic_desc"
	self.olympic.category = "assault_rifle"
	self.olympic.CLIP_AMMO_MAX = 20
	self.olympic.AMMO_MAX = 120
	self.olympic.fire_mode_data.fire_rate = 0.075
	self.olympic.auto.fire_rate = 0.075
	self.olympic.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.olympic.spread.standing = 3.5
	self.olympic.spread.crouching = 2.5
	self.olympic.spread.steelsight = 1
	self.olympic.spread.moving_standing = 4
	self.olympic.spread.moving_crouching = 3
	self.olympic.spread.moving_steelsight = 2
	self.olympic.panic_suppression_chance = 0.0
	self.olympic.stats = {
		damage = 31,
		spread = 14,
		recoil = 17,
		spread_moving = 8,
		zoom = 3,
		concealment = 24,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ak74.desc_id = "bm_menu_sc_ak74_desc"
	self.ak74.AMMO_MAX = 150
	self.ak74.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.ak74.spread.standing = 3.5
	self.ak74.spread.crouching = 2.5
	self.ak74.spread.steelsight = 1
	self.ak74.spread.moving_standing = 4
	self.ak74.spread.moving_crouching = 3
	self.ak74.spread.moving_steelsight = 2
	self.ak74.fire_mode_data.fire_rate = 0.0923076923
	self.ak74.auto.fire_rate = 0.0923076923
	self.ak74.kick.standing = self.new_m4.kick.standing
	self.ak74.kick.crouching = self.new_m4.kick.standing
	self.ak74.kick.steelsight = self.new_m4.kick.standing
	self.ak74.stats = {
		damage = 41,
		spread = 14,
		recoil = 18,
		spread_moving = 6,
		zoom = 3,
		concealment = 16,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ak74.panic_suppression_chance = 0.0
	self.akm.desc_id = "bm_menu_sc_akm_desc"
	self.akm.AMMO_MAX = 120
	self.akm.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.akm.fire_mode_data.fire_rate = 0.1
	self.akm.auto.fire_rate = 0.1
	self.akm.spread.standing = 3.5
	self.akm.spread.crouching = 2.5
	self.akm.spread.steelsight = 1
	self.akm.spread.moving_standing = 4
	self.akm.spread.moving_crouching = 3
	self.akm.spread.moving_steelsight = 2
	self.akm.stats = {
		damage = 53,
		spread = 15,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 13,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.akm.panic_suppression_chance = 0.0
	self.akm_gold.desc_id = "bm_menu_sc_akm_gold_desc"
	self.akm_gold.spread.standing = 3.5
	self.akm_gold.spread.crouching = 2.5
	self.akm_gold.spread.steelsight = 1
	self.akm_gold.spread.moving_standing = 4
	self.akm_gold.spread.moving_crouching = 3
	self.akm_gold.spread.moving_steelsight = 2
	self.akm_gold.AMMO_MAX = 120
	self.akm_gold.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.akm_gold.fire_mode_data.fire_rate = 0.1
	self.akm_gold.auto.fire_rate = 0.1
	self.akm_gold.stats = {
		damage = 53,
		spread = 15,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 13,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.akm_gold.panic_suppression_chance = 0.0
	self.akmsu.category = "assault_rifle"
	self.akmsu.AMMO_MAX = 80
	self.akmsu.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.akmsu.fire_mode_data.fire_rate = 0.0923076923
	self.akmsu.auto.fire_rate = 0.0923076923
	self.akmsu.spread.standing = 3.5
	self.akmsu.spread.crouching = 2.5
	self.akmsu.spread.steelsight = 1
	self.akmsu.spread.moving_standing = 4
	self.akmsu.spread.moving_crouching = 3
	self.akmsu.spread.moving_steelsight = 2
	self.akmsu.panic_suppression_chance = 0.0
	self.akmsu.stats = {
		damage = 51,
		spread = 12,
		recoil = 17,
		spread_moving = 9,
		zoom = 3,
		concealment = 21,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.saiga.rays = 9
	self.saiga.spread.standing = 3.5
	self.saiga.spread.crouching = 2.5
	self.saiga.spread.steelsight = 1
	self.saiga.spread.moving_standing = 4
	self.saiga.spread.moving_crouching = 3
	self.saiga.spread.moving_steelsight = 2
	self.saiga.CLIP_AMMO_MAX = 10
	self.saiga.AMMO_MAX = 120
	self.saiga.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.saiga.fire_mode_data.fire_rate = 0.1
	self.saiga.auto.fire_rate = 0.1
	self.saiga.damage_near = 600
	self.saiga.damage_far = 1200
	self.saiga.shake.fire_multiplier = 1
	self.saiga.shake.fire_steelsight_multiplier = -1
	self.saiga.kick.standing = self.new_m4.kick.standing
	self.saiga.kick.crouching = self.new_m4.kick.standing
	self.saiga.kick.steelsight = self.new_m4.kick.standing
	self.saiga.stats = {
		damage = 39,
		spread = 6,
		recoil = 17,
		spread_moving = 7,
		zoom = 3,
		concealment = 13,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.saiga.panic_suppression_chance = 0.0
	self.ak5.spread.standing = 3.5
	self.ak5.spread.crouching = 2.5
	self.ak5.spread.steelsight = 1
	self.ak5.spread.moving_standing = 4
	self.ak5.spread.moving_crouching = 3
	self.ak5.spread.moving_steelsight = 2
	self.ak5.auto.fire_rate = 0.08571428571
	self.ak5.fire_mode_data.fire_rate = 0.08571428571
	self.ak5.kick.standing = self.new_m4.kick.standing
	self.ak5.kick.crouching = self.new_m4.kick.standing
	self.ak5.kick.steelsight = self.new_m4.kick.standing
	self.ak5.stats = {
		damage = 41,
		spread = 15,
		recoil = 18,
		spread_moving = 6,
		zoom = 3,
		concealment = 18,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ak5.panic_suppression_chance = 0.0
	self.aug.AMMO_MAX = 150
	self.aug.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.aug.auto.fire_rate = 0.086
	self.aug.fire_mode_data.fire_rate = 0.086
	self.aug.spread.standing = 3.5
	self.aug.spread.crouching = 2.5
	self.aug.spread.steelsight = 1
	self.aug.spread.moving_standing = 4
	self.aug.spread.moving_crouching = 3
	self.aug.spread.moving_steelsight = 2
	self.aug.kick.standing = self.new_m4.kick.standing
	self.aug.kick.crouching = self.new_m4.kick.standing
	self.aug.kick.steelsight = self.new_m4.kick.standing
	self.aug.stats = {
		damage = 35,
		spread = 15,
		recoil = 19,
		spread_moving = 7,
		zoom = 3,
		concealment = 20,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.aug.panic_suppression_chance = 0.0
	self.aug.CLIP_AMMO_MAX = 30
	self.g36.spread.standing = 3.5
	self.g36.spread.crouching = 2.5
	self.g36.spread.steelsight = 1
	self.g36.spread.moving_standing = 4
	self.g36.spread.moving_crouching = 3
	self.g36.spread.moving_steelsight = 2
	self.g36.auto.fire_rate = 0.08
	self.g36.fire_mode_data.fire_rate = 0.08
	self.g36.AMMO_MAX = 180
	self.g36.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.g36.CLIP_AMMO_MAX = 30
	self.g36.kick.standing = self.new_m4.kick.standing
	self.g36.kick.crouching = self.new_m4.kick.standing
	self.g36.kick.steelsight = self.new_m4.kick.standing
	self.g36.stats = {
		damage = 28,
		spread = 16,
		recoil = 17,
		spread_moving = 8,
		zoom = 3,
		concealment = 20,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.g36.panic_suppression_chance = 0.0
	self.p90.desc_id = "bm_ap_weapon_sc_desc"
	self.p90.AMMO_MAX = 180
	self.p90.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.p90.fire_mode_data.fire_rate = 0.06666666666
	self.p90.auto.fire_rate = 0.06666666666
	self.p90.panic_suppression_chance = 0.1
	self.p90.spread.standing = 3.5
	self.p90.spread.crouching = 2.5
	self.p90.spread.steelsight = 1
	self.p90.spread.moving_standing = 4
	self.p90.spread.moving_crouching = 3
	self.p90.spread.moving_steelsight = 2
	self.p90.kick.standing = self.new_m4.kick.standing
	self.p90.kick.crouching = self.new_m4.kick.standing
	self.p90.kick.steelsight = self.new_m4.kick.standing
	self.p90.stats = {
		damage = 22,
		spread = 14,
		recoil = 22,
		spread_moving = 9,
		zoom = 3,
		concealment = 25,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.p90.panic_suppression_chance = 0.1
	self.new_m14.CLIP_AMMO_MAX = 20
	self.new_m14.fire_mode_data.fire_rate = 0.08571428571
	self.new_m14.single.fire_rate = 0.08571428571
	self.new_m14.spread.standing = 3.5
	self.new_m14.spread.crouching = 2.5
	self.new_m14.spread.steelsight = 1
	self.new_m14.spread.moving_standing = 4
	self.new_m14.spread.moving_crouching = 3
	self.new_m14.spread.moving_steelsight = 2
	self.new_m14.kick.standing = self.new_m4.kick.standing
	self.new_m14.kick.crouching = self.new_m4.kick.standing
	self.new_m14.kick.steelsight = self.new_m4.kick.standing
	self.new_m14.AMMO_MAX = 60
	self.new_m14.AMMO_PICKUP = self:_pickup_chance(60, 2)
	self.new_m14.stats = {
		damage = 100,
		spread = 20,
		recoil = 15,
		spread_moving = 5,
		zoom = 3,
		concealment = 8,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.new_m14.panic_suppression_chance = 0.0
	self.deagle.has_description = false
	self.deagle.desc_id = "bm_ap_weapon_sc_desc"
	self.deagle.fire_mode_data.fire_rate = 0.2
	self.deagle.single.fire_rate = 0.2
	self.deagle.spread.standing = 3.5
	self.deagle.spread.crouching = 2.5
	self.deagle.spread.steelsight = 1
	self.deagle.spread.moving_standing = 4
	self.deagle.spread.moving_crouching = 3
	self.deagle.spread.moving_steelsight = 2
	self.deagle.kick.standing = self.r870.kick.standing
	self.deagle.kick.crouching = self.r870.kick.standing
	self.deagle.kick.steelsight = self.r870.kick.standing
	self.deagle.CLIP_AMMO_MAX = 8
	self.deagle.AMMO_MAX = 40
	self.deagle.AMMO_PICKUP = self:_pickup_chance(40, 1)
	self.deagle.stats = {
		damage = 95,
		spread = 18,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 25,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.deagle.panic_suppression_chance = 0.0
	self.new_mp5.fire_mode_data.fire_rate = 0.075
	self.new_mp5.auto.fire_rate = 0.075
	self.new_mp5.spread.standing = 3.5
	self.new_mp5.spread.crouching = 2.5
	self.new_mp5.spread.steelsight = 1
	self.new_mp5.spread.moving_standing = 4
	self.new_mp5.spread.moving_crouching = 3
	self.new_mp5.spread.moving_steelsight = 2
	self.new_mp5.panic_suppression_chance = 0.05
	self.new_mp5.kick.standing = self.new_m4.kick.standing
	self.new_mp5.kick.crouching = self.new_m4.kick.standing
	self.new_mp5.kick.steelsight = self.new_m4.kick.standing
	self.new_mp5.AMMO_MAX = 150
	self.new_mp5.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.new_mp5.stats = {
		damage = 26,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 23,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.new_mp5.panic_suppression_chance = 0.1
	self.colt_1911.fire_mode_data.fire_rate = 0.12
	self.colt_1911.single.fire_rate = 0.12
	self.colt_1911.CLIP_AMMO_MAX = 8
	self.colt_1911.AMMO_MAX = 60
	self.colt_1911.AMMO_PICKUP = self:_pickup_chance(60, 1)
	self.colt_1911.spread.standing = 3.5
	self.colt_1911.spread.crouching = 2.5
	self.colt_1911.spread.steelsight = 1
	self.colt_1911.spread.moving_standing = 4
	self.colt_1911.spread.moving_crouching = 3
	self.colt_1911.spread.moving_steelsight = 2
	self.colt_1911.kick.standing = self.glock_17.kick.standing
	self.colt_1911.kick.crouching = self.glock_17.kick.standing
	self.colt_1911.kick.steelsight = self.glock_17.kick.standing
	self.colt_1911.stats = {
		damage = 43,
		spread = 17,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.colt_1911.panic_suppression_chance = 0.0
	self.mac10.timers.reload_not_empty = 2
	self.mac10.timers.reload_empty = 2.7
	self.mac10.CLIP_AMMO_MAX = 40
	self.mac10.AMMO_MAX = 120
	self.mac10.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.mac10.spread.standing = 3.5
	self.mac10.spread.crouching = 2.5
	self.mac10.spread.steelsight = 1
	self.mac10.spread.moving_standing = 4
	self.mac10.spread.moving_crouching = 3
	self.mac10.spread.moving_steelsight = 2
	self.mac10.fire_mode_data.fire_rate = 0.06
	self.mac10.auto.fire_rate = 0.06
	self.mac10.kick.standing = self.new_m4.kick.standing
	self.mac10.kick.crouching = self.new_m4.kick.standing
	self.mac10.kick.steelsight = self.new_m4.kick.standing
	self.mac10.stats = {
		damage = 30,
		spread = 11,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 27,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.mac10.panic_suppression_chance = 0.1
	self.serbu.rays = 9
	self.serbu.spread.standing = 3.5
	self.serbu.spread.crouching = 2.5
	self.serbu.spread.steelsight = 1
	self.serbu.spread.moving_standing = 4
	self.serbu.spread.moving_crouching = 3
	self.serbu.spread.moving_steelsight = 2
	self.serbu.CLIP_AMMO_MAX = 4
	self.serbu.AMMO_MAX = 40
	self.serbu.damage_near = 600
	self.serbu.damage_far = 1200
	self.serbu.AMMO_PICKUP = self:_pickup_chance(40, 1)
	self.serbu.fire_mode_data.fire_rate = 0.6
	self.serbu.single.fire_rate = 0.6
	self.serbu.stats = {
		damage = 89,
		spread = 6,
		recoil = 16,
		spread_moving = 6,
		zoom = 3,
		concealment = 23,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.serbu.panic_suppression_chance = 0.0
	self.huntsman.rays = 9
	self.huntsman.spread.standing = 3.5
	self.huntsman.spread.crouching = 2.5
	self.huntsman.spread.steelsight = 1
	self.huntsman.spread.moving_standing = 4
	self.huntsman.spread.moving_crouching = 3
	self.huntsman.spread.moving_steelsight = 2
	self.huntsman.AMMO_MAX = 40
	self.huntsman.damage_near = 900
	self.huntsman.damage_far = 1800
	self.huntsman.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.huntsman.sounds.fire_single = "huntsman_fire"
	self.huntsman.sounds.fire_auto = "huntsman_fire"
	self.huntsman.CAN_TOGGLE_FIREMODE = true
	self.huntsman.auto = {}
	self.huntsman.auto.fire_rate = 0.00
	self.huntsman.fire_mode_data.fire_rate = 0.001
	self.huntsman.stats = {
		damage = 144,
		spread = 9,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 7,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.huntsman.panic_suppression_chance = 0.0
	self.huntsman.stats_modifiers = {damage = 1}
	self.b92fs.AMMO_MAX = 150
	self.b92fs.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.b92fs.fire_mode_data.fire_rate = 0.075
	self.b92fs.single.fire_rate = 0.075
	self.b92fs.spread.standing = 3.5
	self.b92fs.spread.crouching = 2.5
	self.b92fs.spread.steelsight = 1
	self.b92fs.spread.moving_standing = 4
	self.b92fs.spread.moving_crouching = 3
	self.b92fs.spread.moving_steelsight = 2
	self.b92fs.kick.standing = self.glock_17.kick.standing
	self.b92fs.kick.crouching = self.glock_17.kick.standing
	self.b92fs.kick.steelsight = self.glock_17.kick.standing
	self.b92fs.stats = {
		damage = 19,
		spread = 16,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.b92fs.panic_suppression_chance = 0.0
	self.new_raging_bull.fire_mode_data = {}
	self.new_raging_bull.fire_mode_data.fire_rate = 0.15
	self.new_raging_bull.single = {}
	self.new_raging_bull.single.fire_rate = 0.15
	self.new_raging_bull.spread.standing = 3.5
	self.new_raging_bull.spread.crouching = 2.5
	self.new_raging_bull.spread.steelsight = 1
	self.new_raging_bull.spread.moving_standing = 4
	self.new_raging_bull.spread.moving_crouching = 3
	self.new_raging_bull.spread.moving_steelsight = 2
	self.new_raging_bull.AMMO_MAX = 40
	self.new_raging_bull.kick.standing = self.r870.kick.standing
	self.new_raging_bull.kick.crouching = self.r870.kick.standing
	self.new_raging_bull.kick.steelsight = self.r870.kick.standing
	self.new_raging_bull.AMMO_PICKUP = self:_pickup_chance(40, 1)
	self.new_raging_bull.stats = {
		damage = 85,
		spread = 19,
		recoil = 16,
		spread_moving = 5,
		zoom = 3,
		concealment = 25,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.new_raging_bull.panic_suppression_chance = 0.0
	self.saw.has_description = true
	self.saw.spread.standing = 0
	self.saw.spread.crouching = 0
	self.saw.spread.steelsight = 0
	self.saw.spread.moving_standing = 0
	self.saw.spread.moving_crouching = 0
	self.saw.spread.moving_steelsight = 0
	self.saw.desc_id = "bm_ap_saw_sc_desc"
	self.saw.CLIP_AMMO_MAX = 20
	self.saw.AMMO_MAX = 40
	self.saw.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.saw.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.saw.kick.crouching = self.saw.kick.standing
	self.saw.kick.steelsight = self.saw.kick.standing
	self.saw.stats = {
		alert_size = 7,
		suppression = 7,
		zoom = 1,
		spread = 0,
		recoil = 0,
		spread_moving = 7,
		damage = 150,
		concealment = 16,
		value = 1,
		extra_ammo = 6,
		total_ammo_mod = 100,
		reload = 11
	}
	self.saw.panic_suppression_chance = 0.0
	self.saw_secondary.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.saw_secondary.kick.crouching = self.saw.kick.standing
	self.saw_secondary.kick.steelsight = self.saw.kick.standing
	self.saw_secondary.spread.standing = 0
	self.saw_secondary.spread.crouching = 0
	self.saw_secondary.spread.steelsight = 0
	self.saw_secondary.spread.moving_standing = 0
	self.saw_secondary.spread.moving_crouching = 0
	self.saw_secondary.spread.moving_steelsight = 0
	self.saw_secondary.has_description = true
	self.saw_secondary.desc_id = "bm_ap_saw_sc_desc"
	self.saw_secondary.CLIP_AMMO_MAX = 20
	self.saw_secondary.AMMO_MAX = 20
	self.saw_secondary.AMMO_PICKUP = self:_pickup_chance(20, 2)
	self.saw_secondary.stats = {
		alert_size = 7,
		suppression = 7,
		zoom = 1,
		spread = 0,
		recoil = 0,
		spread_moving = 7,
		damage = 150,
		concealment = 16,
		value = 1,
		extra_ammo = 6,
		total_ammo_mod = 100,
		reload = 11
	}
	self.saw_secondary.sub_category = "saw"
	self.saw_secondary.panic_suppression_chance = 0.0
	self.usp.fire_mode_data.fire_rate = 0.1
	self.usp.single.fire_rate = 0.1
	self.usp.AMMO_MAX = 80
	self.usp.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.usp.spread.standing = 3.5
	self.usp.spread.crouching = 2.5
	self.usp.spread.steelsight = 1
	self.usp.spread.moving_standing = 4
	self.usp.spread.moving_crouching = 3
	self.usp.spread.moving_steelsight = 2
	self.usp.kick.standing = self.glock_17.kick.standing
	self.usp.kick.crouching = self.glock_17.kick.standing
	self.usp.kick.steelsight = self.glock_17.kick.standing
	self.usp.CLIP_AMMO_MAX = 12
	self.usp.stats = {
		damage = 41,
		spread = 17,
		recoil = 18,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.usp.panic_suppression_chance = 0.0
	self.g22c.fire_mode_data.fire_rate = 0.08571428571
	self.g22c.single.fire_rate = 0.08571428571
	self.g22c.AMMO_MAX = 120
	self.g22c.spread.standing = 3.5
	self.g22c.spread.crouching = 2.5
	self.g22c.spread.steelsight = 1
	self.g22c.spread.moving_standing = 4
	self.g22c.spread.moving_crouching = 3
	self.g22c.spread.moving_steelsight = 2
	self.g22c.kick.standing = self.glock_17.kick.standing
	self.g22c.kick.crouching = self.glock_17.kick.standing
	self.g22c.kick.steelsight = self.glock_17.kick.standing
	self.g22c.CLIP_AMMO_MAX = 18
	self.g22c.stats = {
		damage = 32,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.g22c.panic_suppression_chance = 0.0
	self.judge.fire_mode_data = {}
	self.judge.fire_mode_data.fire_rate = 0.4
	self.judge.single = {}
	self.judge.single.fire_rate = 0.4
	self.judge.rays = 9
	self.judge.spread.standing = 3.5
	self.judge.spread.crouching = 2.5
	self.judge.spread.steelsight = 1
	self.judge.spread.moving_standing = 4
	self.judge.spread.moving_crouching = 3
	self.judge.spread.moving_steelsight = 2
	self.judge.AMMO_MAX = 30
	self.judge.damage_near = 600
	self.judge.damage_far = 1200
	self.judge.AMMO_PICKUP = self:_pickup_chance(30, 1)
	self.judge.stats = {
		damage = 139,
		spread = 6,
		recoil = 15,
		spread_moving = 5,
		zoom = 3,
		concealment = 25,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.judge.panic_suppression_chance = 0.0
	self.judge.stats_modifiers = {damage = 1}
	self.m45.CLIP_AMMO_MAX = 40
	self.m45.AMMO_MAX = 120
	self.m45.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.m45.spread.standing = 3.5
	self.m45.spread.crouching = 2.5
	self.m45.spread.steelsight = 1
	self.m45.spread.moving_standing = 4
	self.m45.spread.moving_crouching = 3
	self.m45.spread.moving_steelsight = 2
	self.m45.kick.standing = self.new_m4.kick.standing
	self.m45.kick.crouching = self.new_m4.kick.standing
	self.m45.kick.steelsight = self.new_m4.kick.standing
	self.m45.stats = {
		damage = 32,
		spread = 14,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 5,
		reload = 11
	}
	self.m45.panic_suppression_chance = 0.1
	self.s552.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.s552.fire_mode_data.fire_rate = 0.08571428571
	self.s552.auto.fire_rate = 0.08571428571
	self.s552.spread.standing = 3.5
	self.s552.spread.crouching = 2.5
	self.s552.spread.steelsight = 1
	self.s552.spread.moving_standing = 4
	self.s552.spread.moving_crouching = 3
	self.s552.spread.moving_steelsight = 2
	self.s552.kick.standing = self.new_m4.kick.standing
	self.s552.kick.crouching = self.new_m4.kick.standing
	self.s552.kick.steelsight = self.new_m4.kick.standing
	self.s552.AMMO_MAX = 150
	self.s552.stats = {
		damage = 40,
		spread = 13,
		recoil = 20,
		spread_moving = 5,
		zoom = 3,
		concealment = 22,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.s552.panic_suppression_chance = 0.0
	self.ppk.AMMO_MAX = 150
	self.ppk.CLIP_AMMO_MAX = 12
	self.ppk.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.ppk.fire_mode_data.fire_rate = 0.06666666666
	self.ppk.single.fire_rate = 0.06666666666
	self.ppk.spread.standing = 3.5
	self.ppk.spread.crouching = 2.5
	self.ppk.spread.steelsight = 1
	self.ppk.spread.moving_standing = 4
	self.ppk.spread.moving_crouching = 3
	self.ppk.spread.moving_steelsight = 2
	self.ppk.kick.standing = self.glock_17.kick.standing
	self.ppk.kick.crouching = self.glock_17.kick.standing
	self.ppk.kick.steelsight = self.glock_17.kick.standing
	self.ppk.stats = {
		damage = 29,
		spread = 15,
		recoil = 21,
		spread_moving = 9,
		zoom = 3,
		concealment = 30,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ppk.panic_suppression_chance = 0.0
	self.mp7.desc_id = "bm_ap_weapon_sc_desc"
	self.mp7.AMMO_MAX = 120
	self.mp7.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.mp7.fire_mode_data.fire_rate = 0.06315789473
	self.mp7.CAN_TOGGLE_FIREMODE = true
	self.mp7.auto = {}
	self.mp7.auto.fire_rate = 0.06315789473
	self.mp7.spread.standing = 3.5
	self.mp7.spread.crouching = 2.5
	self.mp7.spread.steelsight = 1
	self.mp7.spread.moving_standing = 4
	self.mp7.spread.moving_crouching = 3
	self.mp7.spread.moving_steelsight = 2
	self.mp7.stats = {
		damage = 35,
		spread = 14,
		recoil = 22,
		spread_moving = 7,
		zoom = 1,
		concealment = 23,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 7,
		reload = 11
	}
	self.mp7.panic_suppression_chance = 0.1
	self.scar.AMMO_MAX = 80
	self.scar.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.scar.spread.standing = 3.5
	self.scar.spread.crouching = 2.5
	self.scar.spread.steelsight = 1
	self.scar.spread.moving_standing = 4
	self.scar.spread.moving_crouching = 3
	self.scar.spread.moving_steelsight = 2
	self.scar.fire_mode_data.fire_rate = 0.09523809523
	self.scar.CAN_TOGGLE_FIREMODE = true
	self.scar.auto.fire_rate = 0.09523809523
	self.scar.stats = {
		damage = 78,
		spread = 14,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 8,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.scar.panic_suppression_chance = 0.0
	self.p226.AMMO_MAX = 120
	self.p226.CLIP_AMMO_MAX = 16
	self.p226.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.p226.fire_mode_data.fire_rate = 0.08571428571
	self.p226.single.fire_rate = 0.08571428571
	self.p226.spread.standing = 3.5
	self.p226.spread.crouching = 2.5
	self.p226.spread.steelsight = 1
	self.p226.spread.moving_standing = 4
	self.p226.spread.moving_crouching = 3
	self.p226.spread.moving_steelsight = 2
	self.p226.kick.standing = self.glock_17.kick.standing
	self.p226.kick.crouching = self.glock_17.kick.standing
	self.p226.kick.steelsight = self.glock_17.kick.standing
	self.p226.stats = {
		damage = 35,
		spread = 16,
		recoil = 19,
		spread_moving = 7,
		zoom = 3,
		concealment = 28,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.p226.panic_suppression_chance = 0.0
	self.hk21.sub_category = "smg"
	self.hk21.CLIP_AMMO_MAX = 150
	self.hk21.AMMO_MAX = 225
	self.hk21.AMMO_PICKUP = self:_pickup_chance(225, 2)
	self.hk21.fire_mode_data.fire_rate = 0.075
	self.hk21.auto.fire_rate = 0.075
	self.hk21.spread.standing = 3.5
	self.hk21.spread.crouching = 2.5
	self.hk21.spread.steelsight = 1
	self.hk21.spread.moving_standing = 4
	self.hk21.spread.moving_crouching = 3
	self.hk21.spread.moving_steelsight = 2
	self.hk21.kick.standing = self.new_m4.kick.standing
	self.hk21.kick.crouching = self.new_m4.kick.standing
	self.hk21.kick.steelsight = self.new_m4.kick.standing
	self.hk21.panic_suppression_chance = 0.1
	self.hk21.stats = {
		damage = 29,
		spread = 14,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 2,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.m249.sub_category = "smg"
	self.m249.desc_id = "bm_menu_sc_m249_desc"
	self.m249.CLIP_AMMO_MAX = 200
	self.m249.NR_CLIPS_MAX = 2
	self.m249.AMMO_MAX = 250
	self.m249.AMMO_PICKUP = self:_pickup_chance(250, 2)
	self.m249.spread.standing = 3.5
	self.m249.spread.crouching = 2.5
	self.m249.spread.steelsight = 1
	self.m249.spread.moving_standing = 4
	self.m249.spread.moving_crouching = 3
	self.m249.spread.moving_steelsight = 2
	self.m249.fire_mode_data.fire_rate = 0.075
	self.m249.auto.fire_rate = 0.075
	self.m249.kick.standing = self.new_m4.kick.standing
	self.m249.kick.crouching = self.new_m4.kick.standing
	self.m249.kick.steelsight = self.new_m4.kick.standing
	self.m249.stats = {
		damage = 25,
		spread = 13,
		recoil = 20,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.m249.panic_suppression_chance = 0.1
	self.rpk.sub_category = "smg"
	self.rpk.CLIP_AMMO_MAX = 60
	self.rpk.AMMO_MAX = 250
	self.rpk.AMMO_PICKUP = self:_pickup_chance(250, 2)
	self.rpk.fire_mode_data.fire_rate = 0.0923076923
	self.rpk.CAN_TOGGLE_FIREMODE = false
	self.rpk.auto = {}
	self.rpk.auto.fire_rate = 0.0923076923
	self.rpk.spread.standing = 3.5
	self.rpk.spread.crouching = 2.5
	self.rpk.spread.steelsight = 1
	self.rpk.spread.moving_standing = 4
	self.rpk.spread.moving_crouching = 3
	self.rpk.spread.moving_steelsight = 2
	self.rpk.panic_suppression_chance = 0.15
	self.rpk.kick.standing = self.new_m4.kick.standing
	self.rpk.kick.crouching = self.new_m4.kick.standing
	self.rpk.kick.steelsight = self.new_m4.kick.standing
	self.rpk.stats = {
		damage = 25,
		spread = 11,
		recoil = 19,
		spread_moving = 6,
		zoom = 2,
		concealment = 5,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.m95.upgrade_blocks = nil
	self.m95.has_description = true
	self.m95.desc_id = "bm_ap_weapon_sc_desc"
	self.m95.AMMO_PICKUP = self:_pickup_chance(20, 2)
	self.m95.AMMO_MAX = 20
	self.m95.spread.standing = 3.5
	self.m95.spread.crouching = 2.5
	self.m95.spread.steelsight = 1
	self.m95.spread.moving_standing = 4
	self.m95.spread.moving_crouching = 3
	self.m95.spread.moving_steelsight = 2
	self.m95.fire_mode_data.fire_rate = 1.2
	self.m95.kick.standing = self.r870.kick.standing
	self.m95.kick.crouching = self.r870.kick.standing
	self.m95.kick.steelsight = self.r870.kick.standing
	self.m95.stats = {
		damage = 343,
		spread = 19,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 1,
		suppression = 2,
		alert_size = 2,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.m95.armor_piercing_chance = 1
	self.m95.stats_modifiers = {
		damage = 1
	}
	self.m95.panic_suppression_chance = 0.0
	self.msr.upgrade_blocks = nil
	self.msr.has_description = true
	self.msr.desc_id = "bm_ap_weapon_sc_desc"
	self.msr.CLIP_AMMO_MAX = 10
	self.msr.NR_CLIPS_MAX = 5
	self.msr.AMMO_MAX = 40
	self.msr.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.msr.fire_mode_data.fire_rate = 0.66666666666
	self.msr.spread.standing = 3.5
	self.msr.spread.crouching = 2.5
	self.msr.spread.steelsight = 2
	self.msr.spread.moving_standing = 4
	self.msr.spread.moving_crouching = 3
	self.msr.spread.moving_steelsight = 2
	self.msr.kick.standing = self.r870.kick.standing
	self.msr.kick.crouching = self.r870.kick.standing
	self.msr.kick.steelsight = self.r870.kick.standing
	self.msr.stats = {
		damage = 108,
		spread = 20,
		recoil = 16,
		spread_moving = 8,
		zoom = 1,
		concealment = 18,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.msr.stats_modifiers = nil
	self.msr.panic_suppression_chance = 0.0
	self.r93.upgrade_blocks = nil
	self.r93.has_description = true
	self.r93.desc_id = "bm_ap_weapon_sc_desc"
	self.r93.CLIP_AMMO_MAX = 6
	self.r93.AMMO_MAX = 30
	self.r93.AMMO_PICKUP = self:_pickup_chance(30, 2)
	self.r93.fire_mode_data.fire_rate = 1
	self.r93.spread.standing = 3.5
	self.r93.spread.crouching = 2.5
	self.r93.spread.steelsight = 1
	self.r93.spread.moving_standing = 4
	self.r93.spread.moving_crouching = 3
	self.r93.spread.moving_steelsight = 2
	self.r93.kick.standing = self.r870.kick.standing
	self.r93.kick.crouching = self.r870.kick.standing
	self.r93.kick.steelsight = self.r870.kick.standing
	self.r93.stats = {
		damage = 229,
		spread = 20,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 5,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.r93.armor_piercing_chance = 1
	self.r93.stats_modifiers = {
		damage = 1
	}
	self.r93.panic_suppression_chance = 0.0
	self.fal.AMMO_MAX = 120
	self.fal.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.fal.CLIP_AMMO_MAX = 20
	self.fal.fire_mode_data.fire_rate = 0.086
	self.fal.CAN_TOGGLE_FIREMODE = true
	self.fal.auto = {}
	self.fal.auto.fire_rate = 0.086
	self.fal.spread = {}
	self.fal.spread.standing = 3.5
	self.fal.spread.crouching = 2.5
	self.fal.spread.steelsight = 1
	self.fal.spread.moving_standing = 4
	self.fal.spread.moving_crouching = 3
	self.fal.spread.moving_steelsight = 3
	self.fal.stats = {
		damage = 53,
		spread = 14,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 9,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.fal.panic_suppression_chance = 0.0
	self.benelli.AMMO_MAX = 80
	self.benelli.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.benelli.rays = 9
	self.benelli.fire_mode_data.fire_rate = 0.13953488372
	self.benelli.CAN_TOGGLE_FIREMODE = false
	self.benelli.single = {}
	self.benelli.single.fire_rate = 0.13953488372
	self.benelli.damage_near = 700
	self.benelli.damage_far = 1400
	self.benelli.spread.standing = 3.5
	self.benelli.spread.crouching = 2.5
	self.benelli.spread.steelsight = 1
	self.benelli.spread.moving_standing = 4
	self.benelli.spread.moving_crouching = 3
	self.benelli.spread.moving_steelsight = 2
	self.benelli.kick.standing = self.new_m4.kick.standing
	self.benelli.kick.crouching = self.new_m4.kick.standing
	self.benelli.kick.steelsight = self.new_m4.kick.standing
	self.benelli.stats = {
		damage = 64,
		spread = 7,
		recoil = 16,
		spread_moving = 7,
		zoom = 3,
		concealment = 11,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.benelli.panic_suppression_chance = 0.0
	self.striker.rays = 9
	self.striker.AMMO_MAX = 60
	self.striker.AMMO_PICKUP = self:_pickup_chance(60, 1)
	self.striker.fire_mode_data.fire_rate = 0.13953488372
	self.striker.CAN_TOGGLE_FIREMODE = false
	self.striker.single = {}
	self.striker.single.fire_rate = 0.13953488372
	self.striker.CLIP_AMMO_MAX = 12
	self.striker.damage_near = 600
	self.striker.damage_far = 1200
	self.striker.spread.standing = 3.5
	self.striker.spread.crouching = 2.5
	self.striker.spread.steelsight = 1
	self.striker.spread.moving_standing = 4
	self.striker.spread.moving_crouching = 3
	self.striker.spread.moving_steelsight = 2
	self.striker.kick.standing = self.new_m4.kick.standing
	self.striker.kick.crouching = self.new_m4.kick.standing
	self.striker.kick.steelsight = self.new_m4.kick.standing
	self.striker.stats = {
		damage = 64,
		spread = 6,
		recoil = 17,
		spread_moving = 7,
		zoom = 3,
		concealment = 21,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.striker.panic_suppression_chance = 0.0
	self.ksg.AMMO_MAX = 60
	self.ksg.damage_near = 700
	self.ksg.damage_far = 1400
	self.ksg.CLIP_AMMO_MAX = 12
	self.ksg.spread.standing = 3.5
	self.ksg.spread.crouching = 2.5
	self.ksg.spread.steelsight = 1
	self.ksg.spread.moving_standing = 4
	self.ksg.spread.moving_crouching = 3
	self.ksg.spread.moving_steelsight = 2
	self.ksg.single.fire_rate = 0.6
	self.ksg.fire_mode_data.fire_rate = 0.6
	self.ksg.AMMO_PICKUP = self:_pickup_chance(60, 2)
	self.ksg.stats = {
		damage = 89,
		spread = 7,
		recoil = 17,
		spread_moving = 7,
		zoom = 3,
		concealment = 22,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ksg.panic_suppression_chance = 0.0
	self.gre_m79.fire_mode_data.fire_rate = 3
	self.gre_m79.spread.standing = 3.5
	self.gre_m79.spread.crouching = 2.5
	self.gre_m79.spread.steelsight = 1
	self.gre_m79.spread.moving_standing = 4
	self.gre_m79.spread.moving_crouching = 3
	self.gre_m79.spread.moving_steelsight = 2
	self.gre_m79.kick.standing = self.r870.kick.standing
	self.gre_m79.kick.crouching = self.r870.kick.standing
	self.gre_m79.kick.steelsight = self.r870.kick.standing
	self.gre_m79.AMMO_MAX = 9
	self.gre_m79.AMMO_PICKUP = {0.18, 0.45}
	self.gre_m79.stats = {
		damage = 80,
		spread = 21,
		recoil = 9,
		spread_moving = 6,
		zoom = 3,
		concealment = 18,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.gre_m79.panic_suppression_chance = 0.0
	self.gre_m79.stats_modifiers = {damage = 10}
	self.g3.AMMO_MAX = 120
	self.g3.CLIP_AMMO_MAX = 30
	self.g3.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.g3.fire_mode_data.fire_rate = 0.1
	self.g3.CAN_TOGGLE_FIREMODE = true
	self.g3.auto = {}
	self.g3.auto.fire_rate = 0.1
	self.g3.spread = {}
	self.g3.spread.standing = 3.5
	self.g3.spread.crouching = 2.5
	self.g3.spread.steelsight = 1
	self.g3.spread.moving_standing = 4
	self.g3.spread.moving_crouching = 3
	self.g3.spread.moving_steelsight = 2
	self.g3.stats = {
		damage = 53,
		spread = 18,
		recoil = 16,
		spread_moving = 7,
		zoom = 3,
		concealment = 12,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.g3.panic_suppression_chance = 0.0
	self.galil.AMMO_MAX = 150
	self.galil.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.galil.FIRE_MODE = "auto"
	self.galil.fire_mode_data = {}
	self.galil.fire_mode_data.fire_rate = 0.0923076923
	self.galil.CAN_TOGGLE_FIREMODE = true
	self.galil.auto = {}
	self.galil.auto.fire_rate = 0.0923076923
	self.galil.spread.standing = 3.5
	self.galil.spread.crouching = 2.5
	self.galil.spread.steelsight = 1
	self.galil.spread.moving_standing = 4
	self.galil.spread.moving_crouching = 3
	self.galil.spread.moving_steelsight = 2
	self.galil.kick.standing = self.new_m4.kick.standing
	self.galil.kick.crouching = self.new_m4.kick.standing
	self.galil.kick.steelsight = self.new_m4.kick.standing
	self.galil.stats = {
		damage = 41,
		spread = 17,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 17,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.galil.panic_suppression_chance = 0.0
	self.famas.AMMO_MAX = 180
	self.famas.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.famas.CLIP_AMMO_MAX = 25
	self.famas.fire_mode_data.fire_rate = 0.06
	self.famas.CAN_TOGGLE_FIREMODE = true
	self.famas.auto = {}
	self.famas.auto.fire_rate = 0.06
	self.famas.spread = {}
	self.famas.spread.standing = 3.5
	self.famas.spread.crouching = 2.5
	self.famas.spread.steelsight = 1
	self.famas.spread.moving_standing = 4
	self.famas.spread.moving_crouching = 3
	self.famas.spread.moving_steelsight = 2
	self.famas.kick.standing = self.new_m4.kick.standing
	self.famas.kick.crouching = self.new_m4.kick.standing
	self.famas.kick.steelsight = self.new_m4.kick.standing
	self.famas.stats = {
		damage = 31,
		spread = 12,
		recoil = 19,
		spread_moving = 4,
		zoom = 3,
		concealment = 24,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.famas.panic_suppression_chance = 0.0
	self.scorpion.AMMO_MAX = 150
	self.scorpion.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.scorpion.FIRE_MODE = "auto"
	self.scorpion.fire_mode_data = {}
	self.scorpion.fire_mode_data.fire_rate = 0.07058823529
	self.scorpion.CAN_TOGGLE_FIREMODE = true
	self.scorpion.auto = {}
	self.scorpion.auto.fire_rate = 0.07058823529
	self.scorpion.spread = {}
	self.scorpion.spread.standing = 3.5
	self.scorpion.spread.crouching = 2.5
	self.scorpion.spread.steelsight = 1
	self.scorpion.spread.moving_standing = 4
	self.scorpion.spread.moving_crouching = 3
	self.scorpion.spread.moving_steelsight = 2
	self.scorpion.kick.standing = self.new_m4.kick.standing
	self.scorpion.kick.crouching = self.new_m4.kick.standing
	self.scorpion.kick.steelsight = self.new_m4.kick.standing
	self.scorpion.stats = {
		damage = 29,
		spread = 14,
		recoil = 19,
		spread_moving = 7,
		zoom = 1,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 7,
		reload = 11
	}
	self.scorpion.panic_suppression_chance = 0.1
	self.tec9.AMMO_MAX = 120
	self.tec9.CLIP_AMMO_MAX = 32
	self.tec9.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.tec9.FIRE_MODE = "auto"
	self.tec9.fire_mode_data = {}
	self.tec9.fire_mode_data.fire_rate = 0.067
	self.tec9.CAN_TOGGLE_FIREMODE = true
	self.tec9.auto = {}
	self.tec9.auto.fire_rate = 0.067
	self.tec9.spread = {}
	self.tec9.spread.standing = 3.5
	self.tec9.spread.crouching = 2.5
	self.tec9.spread.steelsight = 1
	self.tec9.spread.moving_standing = 4
	self.tec9.spread.moving_crouching = 3
	self.tec9.spread.moving_steelsight = 2
	self.tec9.kick.standing = self.new_m4.kick.standing
	self.tec9.kick.crouching = self.new_m4.kick.standing
	self.tec9.kick.steelsight = self.new_m4.kick.standing
	self.tec9.stats = {
		damage = 34,
		spread = 14,
		recoil = 20,
		spread_moving = 10,
		zoom = 1,
		concealment = 27,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 7,
		reload = 11
	}
	self.tec9.panic_suppression_chance = 0.1
	self.uzi.AMMO_MAX = 120
	self.uzi.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.uzi.FIRE_MODE = "auto"
	self.uzi.fire_mode_data = {}
	self.uzi.fire_mode_data.fire_rate = 0.086
	self.uzi.CAN_TOGGLE_FIREMODE = true
	self.uzi.auto = {}
	self.uzi.auto.fire_rate = 0.086
	self.uzi.spread.standing = 3.5
	self.uzi.spread.crouching = 2.5
	self.uzi.spread.steelsight = 1
	self.uzi.spread.moving_standing = 4
	self.uzi.spread.moving_crouching = 3
	self.uzi.spread.moving_steelsight = 2
	self.uzi.kick.standing = self.new_m4.kick.standing
	self.uzi.kick.crouching = self.new_m4.kick.standing
	self.uzi.kick.steelsight = self.new_m4.kick.standing
	self.uzi.stats = {
		damage = 35,
		spread = 15,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 7,
		reload = 11
	}
	self.uzi.panic_suppression_chance = 0.1
	self.uzi.timers.reload_not_empty = 2.40
	self.uzi.timers.reload_empty = 3.6
	self.jowi.spread.standing = 3.5
	self.jowi.spread.crouching = 2.5
	self.jowi.spread.steelsight = 1
	self.jowi.spread.moving_standing = 4
	self.jowi.spread.moving_crouching = 3
	self.jowi.spread.moving_steelsight = 2
	self.jowi.kick.standing = self.glock_17.kick.standing
	self.jowi.kick.crouching = self.glock_17.kick.standing
	self.jowi.kick.steelsight = self.glock_17.kick.standing
	self.jowi.AMMO_MAX = 180
	self.jowi.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.jowi.fire_mode_data.fire_rate = 0.075
	self.jowi.single = {}
	self.jowi.single.fire_rate = 0.075
	self.jowi.stats = {
		damage = 26,
		spread = 16,
		recoil = 18,
		spread_moving = 9,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.jowi.panic_suppression_chance = 0.0
	self.x_1911.spread.standing = 3.5
	self.x_1911.spread.crouching = 2.5
	self.x_1911.spread.steelsight = 1
	self.x_1911.spread.moving_standing = 4
	self.x_1911.spread.moving_crouching = 3
	self.x_1911.spread.moving_steelsight = 2
	self.x_1911.CLIP_AMMO_MAX = 16
	self.x_1911.AMMO_MAX = 80
	self.x_1911.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.x_1911.fire_mode_data.fire_rate = 0.12
	self.x_1911.single = {}
	self.x_1911.single.fire_rate = 0.12
	self.x_1911.kick.standing = self.glock_17.kick.standing
	self.x_1911.kick.crouching = self.glock_17.kick.standing
	self.x_1911.kick.steelsight = self.glock_17.kick.standing
	self.x_1911.stats = {
		damage = 43,
		spread = 17,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_1911.panic_suppression_chance = 0.0
	self.x_b92fs.spread.standing = 3.5
	self.x_b92fs.spread.crouching = 2.5
	self.x_b92fs.spread.steelsight = 1
	self.x_b92fs.spread.moving_standing = 4
	self.x_b92fs.spread.moving_crouching = 3
	self.x_b92fs.spread.moving_steelsight = 2
	self.x_b92fs.kick.standing = self.glock_17.kick.standing
	self.x_b92fs.kick.crouching = self.glock_17.kick.standing
	self.x_b92fs.kick.steelsight = self.glock_17.kick.standing
	self.x_b92fs.AMMO_MAX = 180
	self.x_b92fs.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.x_b92fs.FIRE_MODE = "single"
	self.x_b92fs.fire_mode_data.fire_rate = 0.075
	self.x_b92fs.single.fire_rate = 0.075
	self.x_b92fs.stats = {
		damage = 19,
		spread = 16,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_b92fs.panic_suppression_chance = 0.0
	self.x_deagle.has_description = false
	self.x_deagle.desc_id = "bm_ap_weapon_sc_desc"
	self.x_deagle.CLIP_AMMO_MAX = 16
	self.x_deagle.AMMO_MAX = 60
	self.x_deagle.AMMO_PICKUP = self:_pickup_chance(60, 2)
	self.x_deagle.FIRE_MODE = "single"
	self.x_deagle.fire_mode_data = {}
	self.x_deagle.fire_mode_data.fire_rate = 0.2
	self.x_deagle.single = {}
	self.x_deagle.single.fire_rate = 0.2
	self.x_deagle.spread.standing = 3.5
	self.x_deagle.spread.crouching = 2.5
	self.x_deagle.spread.steelsight = 1
	self.x_deagle.spread.moving_standing = 4
	self.x_deagle.spread.moving_crouching = 3
	self.x_deagle.spread.moving_steelsight = 2
	self.x_deagle.kick.standing = self.r870.kick.standing
	self.x_deagle.kick.crouching = self.r870.kick.standing
	self.x_deagle.kick.steelsight = self.r870.kick.standing
	self.x_deagle.animations.has_steelsight_stance = true
	self.x_deagle.stats = {
		damage = 95,
		spread = 18,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 25,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_deagle.panic_suppression_chance = 0.0
	self.g26.AMMO_MAX = 150
	self.g26.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.g26.kick.standing = self.glock_17.kick.standing
	self.g26.kick.crouching = self.glock_17.kick.standing
	self.g26.kick.steelsight = self.glock_17.kick.standing
	self.g26.fire_mode_data.fire_rate = 0.075
	self.g26.single.fire_rate = 0.075
	self.g26.spread.standing = 3.5
	self.g26.spread.crouching = 2.5
	self.g26.spread.steelsight = 1
	self.g26.spread.moving_standing = 4
	self.g26.spread.moving_crouching = 3
	self.g26.spread.moving_steelsight = 2
	self.g26.stats = {
		damage = 26,
		spread = 16,
		recoil = 18,
		spread_moving = 9,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.g26.panic_suppression_chance = 0.0
	self.spas12.rays = 9
	self.spas12.AMMO_MAX = 80
	self.spas12.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.spas12.fire_mode_data.fire_rate = 0.13953488372
	self.spas12.CAN_TOGGLE_FIREMODE = false
	self.spas12.single = {}
	self.spas12.single.fire_rate = 0.13953488372
	self.spas12.damage_near = 700
	self.spas12.damage_far = 1400
	self.spas12.spread.standing = 3.5
	self.spas12.spread.crouching = 2.5
	self.spas12.spread.steelsight = 1
	self.spas12.spread.moving_standing = 4
	self.spas12.spread.moving_crouching = 3
	self.spas12.spread.moving_steelsight = 2
	self.spas12.kick.standing = self.new_m4.kick.standing
	self.spas12.kick.crouching = self.new_m4.kick.standing
	self.spas12.kick.steelsight = self.new_m4.kick.standing
	self.spas12.stats = {
		damage = 64,
		spread = 7,
		recoil = 16,
		spread_moving = 7,
		zoom = 3,
		concealment = 14,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.spas12.panic_suppression_chance = 0.0
	self.spas12.stats_modifiers = {damage = 1}
	self.mg42.sub_category = "smg"
	self.mg42.CLIP_AMMO_MAX = 75
	self.mg42.AMMO_MAX = 200
	self.mg42.AMMO_PICKUP = self:_pickup_chance(200, 2)
	self.mg42.spread.standing = 3.5
	self.mg42.spread.crouching = 2.5
	self.mg42.spread.steelsight = 1
	self.mg42.spread.moving_standing = 4
	self.mg42.spread.moving_crouching = 3
	self.mg42.spread.moving_steelsight = 2
	self.mg42.kick.standing = self.new_m4.kick.standing
	self.mg42.kick.crouching = self.new_m4.kick.standing
	self.mg42.kick.steelsight = self.new_m4.kick.standing
	self.mg42.stats = {
		damage = 35,
		spread = 15,
		recoil = 19,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.mg42.panic_suppression_chance = 0.1
	self.c96.AMMO_MAX = 80
	self.c96.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.c96.FIRE_MODE = "auto"
	self.c96.sounds.fire_auto = "akm_fire"
	self.c96.sounds.stop_fire = "akm_stop"
	self.c96.CAN_TOGGLE_FIREMODE = true
	self.c96.fire_mode_data = {}
	self.c96.fire_mode_data.fire_rate = 0.06
	self.c96.single = {}
	self.c96.single.fire_rate = 0.06
	self.c96.spread = {}
	self.c96.spread.standing = 3.5
	self.c96.spread.crouching = 2.5
	self.c96.spread.steelsight = 1
	self.c96.spread.moving_standing = 4
	self.c96.spread.moving_crouching = 3
	self.c96.spread.moving_steelsight = 2
	self.c96.kick.standing = self.new_m4.kick.standing
	self.c96.kick.crouching = self.new_m4.kick.standing
	self.c96.kick.steelsight = self.new_m4.kick.standing
	self.c96.stats = {
		damage = 46,
		spread = 17,
		recoil = 18,
		spread_moving = 8,
		zoom = 3,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.c96.panic_suppression_chance = 0.0
	self.sterling.CLIP_AMMO_MAX = 30
	self.sterling.AMMO_MAX = 120
	self.sterling.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.sterling.fire_mode_data.fire_rate = 0.10909090909
	self.sterling.CAN_TOGGLE_FIREMODE = true
	self.sterling.auto = {}
	self.sterling.auto.fire_rate = 0.10909090909
	self.sterling.spread.standing = 3.5
	self.sterling.spread.crouching = 2.5
	self.sterling.spread.steelsight = 1
	self.sterling.spread.moving_standing = 4
	self.sterling.spread.moving_crouching = 3
	self.sterling.spread.moving_steelsight = 2
	self.sterling.kick.standing = self.new_m4.kick.standing
	self.sterling.kick.crouching = self.new_m4.kick.standing
	self.sterling.kick.steelsight = self.new_m4.kick.standing
	self.sterling.stats = {
		damage = 32,
		spread = 15,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 7,
		reload = 11
	}
	self.sterling.panic_suppression_chance = 0.1
	self.mosin.has_description = true
	self.mosin.desc_id = "bm_ap_weapon_sc_desc"
	self.mosin.CLIP_AMMO_MAX = 10
	self.mosin.AMMO_MAX = 30
	self.mosin.AMMO_PICKUP = self:_pickup_chance(30, 2)
	self.mosin.fire_mode_data.fire_rate = 1
	self.mosin.spread.standing = 3.5
	self.mosin.spread.crouching = 2.5
	self.mosin.spread.steelsight = 1
	self.mosin.spread.moving_standing = 4
	self.mosin.spread.moving_crouching = 3
	self.mosin.spread.moving_steelsight = 2
	self.mosin.kick.standing = self.r870.kick.standing
	self.mosin.kick.crouching = self.r870.kick.standing
	self.mosin.kick.steelsight = self.r870.kick.standing
	self.mosin.stats = {
		damage = 229,
		spread = 20,
		recoil = 14,
		spread_moving = 9,
		zoom = 1,
		concealment = 11,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.mosin.stats_modifiers = {
		damage = 1,
	}
	self.mosin.panic_suppression_chance = 0.0
	self.m1928.fire_mode_data.fire_rate = 0.075
	self.m1928.CAN_TOGGLE_FIREMODE = true
	self.m1928.auto = {}
	self.m1928.auto.fire_rate = 0.075
	self.m1928.spread = {}
	self.m1928.spread.standing = 3.5
	self.m1928.spread.crouching = 2.5
	self.m1928.spread.steelsight = 1
	self.m1928.spread.moving_standing = 4
	self.m1928.spread.moving_crouching = 3
	self.m1928.spread.moving_steelsight = 2
	self.m1928.CLIP_AMMO_MAX = 50
	self.m1928.AMMO_MAX = 150
	self.m1928.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.m1928.kick.standing = self.new_m4.kick.standing
	self.m1928.kick.crouching = self.new_m4.kick.standing
	self.m1928.kick.steelsight = self.new_m4.kick.standing
	self.m1928.panic_suppression_chance = 0.1
	self.m1928.stats = {
		damage = 29,
		spread = 16,
		recoil = 17,
		spread_moving = 6,
		zoom = 1,
		concealment = 18,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.m1928.panic_suppression_chance = 0.1
	self.l85a2.CLIP_AMMO_MAX = 30
	self.l85a2.AMMO_MAX = 150
	self.l85a2.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.l85a2.FIRE_MODE = "auto"
	self.l85a2.fire_mode_data = {}
	self.l85a2.fire_mode_data.fire_rate = 0.08571428571
	self.l85a2.CAN_TOGGLE_FIREMODE = true
	self.l85a2.auto = {}
	self.l85a2.auto.fire_rate = 0.08571428571
	self.l85a2.spread.standing = 3.5
	self.l85a2.spread.crouching = 2.5
	self.l85a2.spread.steelsight = 1
	self.l85a2.spread.moving_standing = 4
	self.l85a2.spread.moving_crouching = 3
	self.l85a2.spread.moving_steelsight = 2
	self.l85a2.kick = {}
	self.l85a2.kick.standing = self.new_m4.kick.standing
	self.l85a2.kick.crouching = self.new_m4.kick.standing
	self.l85a2.kick.steelsight = self.new_m4.kick.standing
	self.l85a2.stats = {
		damage = 41,
		spread = 16,
		recoil = 18,
		spread_moving = 6,
		zoom = 1,
		concealment = 16,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.l85a2.panic_suppression_chance = 0.0
	self.vhs.CLIP_AMMO_MAX = 30
	self.vhs.AMMO_MAX = 180
	self.vhs.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.vhs.fire_mode_data.fire_rate = 0.06976744186
	self.vhs.CAN_TOGGLE_FIREMODE = true
	self.vhs.auto = {}
	self.vhs.auto.fire_rate = 0.06976744186
	self.vhs.spread.standing = 3.5
	self.vhs.spread.crouching = 2.5
	self.vhs.spread.steelsight = 1
	self.vhs.spread.moving_standing = 4
	self.vhs.spread.moving_crouching = 3
	self.vhs.spread.moving_steelsight = 2
	self.vhs.kick.standing = self.new_m4.kick.standing
	self.vhs.kick.crouching = self.new_m4.kick.standing
	self.vhs.kick.steelsight = self.new_m4.kick.standing
	self.vhs.stats = {
		damage = 34,
		spread = 16,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 17,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.vhs.panic_suppression_chance = 0.0
	self.hs2000.CLIP_AMMO_MAX = 16
	self.hs2000.AMMO_MAX = 80
	self.hs2000.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.hs2000.FIRE_MODE = "single"
	self.hs2000.fire_mode_data = {}
	self.hs2000.fire_mode_data.fire_rate = 0.1
	self.hs2000.single = {}
	self.hs2000.single.fire_rate = 0.1
	self.hs2000.spread.standing = 3.5
	self.hs2000.spread.crouching = 2.5
	self.hs2000.spread.steelsight = 1
	self.hs2000.spread.moving_standing = 4
	self.hs2000.spread.moving_crouching = 3
	self.hs2000.spread.moving_steelsight = 2
	self.hs2000.kick.standing = self.glock_17.kick.standing
	self.hs2000.kick.crouching = self.glock_17.kick.standing
	self.hs2000.kick.steelsight = self.glock_17.kick.standing
	self.hs2000.stats = {
		damage = 45,
		spread = 17,
		recoil = 19,
		spread_moving = 7,
		zoom = 3,
		concealment = 27,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.hs2000.panic_suppression_chance = 0.0
	self.m134.sub_category = "smg"
	self.m134.has_description = false
	self.m134.CLIP_AMMO_MAX = 300
	self.m134.NR_CLIPS_MAX = 1
	self.m134.AMMO_MAX = 300
	self.m134.AMMO_PICKUP = self:_pickup_chance(300, 2)
	self.m134.FIRE_MODE = "auto"
	self.m134.fire_mode_data = {}
	self.m134.fire_mode_data.fire_rate = 0.03
	self.m134.CAN_TOGGLE_FIREMODE = false
	self.m134.auto = {}
	self.m134.auto.fire_rate = 0.03
	self.m134.spread = {}
	self.m134.spread.standing = 3.5
	self.m134.spread.crouching = 2.5
	self.m134.spread.steelsight = 1
	self.m134.spread.moving_standing = 4
	self.m134.spread.moving_crouching = 3
	self.m134.spread.moving_steelsight = 2
	self.m134.kick.standing = self.new_m4.kick.standing
	self.m134.kick.crouching = self.new_m4.kick.standing
	self.m134.kick.steelsight = self.new_m4.kick.standing
	self.m134.panic_suppression_chance = 0.1
	self.m134.stats = {
		damage = 22,
		spread = 15,
		recoil = 21,
		spread_moving = 9,
		zoom = 1,
		concealment = 0,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.rpg7.spread.standing = 3.5
	self.rpg7.spread.crouching = 2.5
	self.rpg7.spread.steelsight = 1
	self.rpg7.spread.moving_standing = 4
	self.rpg7.spread.moving_crouching = 3
	self.rpg7.spread.moving_steelsight = 2
	self.rpg7.kick.standing = self.r870.kick.standing
	self.rpg7.kick.crouching = self.r870.kick.standing
	self.rpg7.kick.steelsight = self.r870.kick.standing
	self.rpg7.has_description = false
	self.rpg7.fire_mode_data.fire_rate = 3
	self.rpg7.AMMO_MAX = 3
	self.rpg7.AMMO_PICKUP = {0.06, 0.38}
	self.rpg7.timers.reload_not_empty = 6.3
	self.rpg7.timers.reload_empty = 6.3
	self.rpg7.stats = {
		damage = 400,
		spread = 21,
		recoil = 8,
		spread_moving = 6,
		zoom = 3,
		concealment = 5,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.rpg7.panic_suppression_chance = 0.0
	self.rpg7.stats_modifiers = {damage = 3}
	self.cobray.timers.reload_not_empty = 2.00
	self.cobray.timers.reload_empty = 2.7
	self.cobray.CLIP_AMMO_MAX = 60
	self.cobray.NR_CLIPS_MAX = 4
	self.cobray.AMMO_MAX = 120
	self.cobray.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.cobray.spread.standing = 3.5
	self.cobray.spread.crouching = 2.5
	self.cobray.spread.steelsight = 1
	self.cobray.spread.moving_standing = 4
	self.cobray.spread.moving_crouching = 3
	self.cobray.spread.moving_steelsight = 2
	self.cobray.kick.standing = self.new_m4.kick.standing
	self.cobray.kick.crouching = self.new_m4.kick.standing
	self.cobray.kick.steelsight = self.new_m4.kick.standing
	self.cobray.fire_mode_data.fire_rate = 0.06
	self.cobray.CAN_TOGGLE_FIREMODE = true
	self.cobray.auto = {}
	self.cobray.auto.fire_rate = 0.06
	self.cobray.stats = {
		damage = 35,
		spread = 13,
		recoil = 21,
		spread_moving = 8,
		zoom = 3,
		concealment = 22,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.cobray.panic_suppression_chance = 0.1
	self.b682.rays = 9
	self.b682.AMMO_MAX = 40
	self.b682.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.b682.spread.standing = 3.5
	self.b682.spread.crouching = 2.5
	self.b682.spread.steelsight = 1
	self.b682.spread.moving_standing = 4
	self.b682.spread.moving_crouching = 3
	self.b682.spread.moving_steelsight = 2
	self.b682.damage_near = 1100
	self.b682.damage_far = 2200
	self.b682.CAN_TOGGLE_FIREMODE = false
	self.b682.auto = {}
	self.b682.auto.fire_rate = 0.12
	self.b682.fire_mode_data.fire_rate = 0.12
	self.b682.sounds.fire_single = "b682_fire"
	self.b682.sounds.fire_auto = "b682_fire"
	self.b682.stats = {
		damage = 144,
		spread = 11,
		recoil = 16,
		spread_moving = 6,
		zoom = 3,
		concealment = 5,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.b682.panic_suppression_chance = 0.0
	self.b682.stats_modifiers = {damage = 1}
	self.x_g22c.spread.standing = 3.5
	self.x_g22c.spread.crouching = 2.5
	self.x_g22c.spread.steelsight = 1
	self.x_g22c.spread.moving_standing = 4
	self.x_g22c.spread.moving_crouching = 3
	self.x_g22c.spread.moving_steelsight = 2
	self.x_g22c.kick.standing = self.glock_17.kick.standing
	self.x_g22c.kick.crouching = self.glock_17.kick.standing
	self.x_g22c.kick.steelsight = self.glock_17.kick.standing
	self.x_g22c.CLIP_AMMO_MAX = 36
	self.x_g22c.AMMO_MAX = 150
	self.x_g22c.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.x_g22c.FIRE_MODE = "single"
	self.x_g22c.fire_mode_data = {}
	self.x_g22c.fire_mode_data.fire_rate = 0.08571428571
	self.x_g22c.single = {}
	self.x_g22c.single.fire_rate = 0.08571428571
	self.x_g22c.stats = {
		damage = 32,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_g22c.panic_suppression_chance = 0.0
	self.x_g17.spread.standing = 3.5
	self.x_g17.spread.crouching = 2.5
	self.x_g17.spread.steelsight = 1
	self.x_g17.spread.moving_standing = 4
	self.x_g17.spread.moving_crouching = 3
	self.x_g17.spread.moving_steelsight = 2
	self.x_g17.kick.standing = self.glock_17.kick.standing
	self.x_g17.kick.crouching = self.glock_17.kick.standing
	self.x_g17.kick.steelsight = self.glock_17.kick.standing
	self.x_g17.CLIP_AMMO_MAX = 36
	self.x_g17.AMMO_MAX = 180
	self.x_g17.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.x_g17.FIRE_MODE = "single"
	self.x_g17.fire_mode_data.fire_rate = 0.075
	self.x_g17.single.fire_rate = 0.075
	self.x_g17.stats = {
		damage = 18,
		spread = 15,
		recoil = 20,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_g17.panic_suppression_chance = 0.0
	self.x_usp.spread.standing = 3.5
	self.x_usp.spread.crouching = 2.5
	self.x_usp.spread.steelsight = 1
	self.x_usp.spread.moving_standing = 4
	self.x_usp.spread.moving_crouching = 3
	self.x_usp.spread.moving_steelsight = 2
	self.x_usp.kick.standing = self.glock_17.kick.standing
	self.x_usp.kick.crouching = self.glock_17.kick.standing
	self.x_usp.kick.steelsight = self.glock_17.kick.standing
	self.x_usp.CLIP_AMMO_MAX = 24
	self.x_usp.AMMO_MAX = 150
	self.x_usp.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.x_usp.fire_mode_data.fire_rate = 0.1
	self.x_usp.single = {}
	self.x_usp.single.fire_rate = 0.1
	self.x_usp.stats = {
		damage = 41,
		spread = 17,
		recoil = 18,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_usp.panic_suppression_chance = 0.0
	self.flamethrower_mk2.category = "shotgun"
	self.flamethrower_mk2.recategorize = "wpn_special"
	self.flamethrower_mk2.has_description = true
	self.flamethrower_mk2.desc_id = "bm_ap_flamethrower_sc_desc"
	self.flamethrower_mk2.timers.reload_not_empty = 8
	self.flamethrower_mk2.timers.reload_empty = 8
	self.flamethrower_mk2.rays = 9
	self.flamethrower_mk2.CLIP_AMMO_MAX = 70
	self.flamethrower_mk2.AMMO_MAX = 150
	self.flamethrower_mk2.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.flamethrower_mk2.fire_mode_data.fire_rate = 0.1
	self.flamethrower_mk2.auto = {}
	self.flamethrower_mk2.auto.fire_rate = 0.1
	self.flamethrower_mk2.flame_max_range = 1600
	self.flamethrower_mk2.single_flame_effect_duration = 1
	self.flamethrower_mk2.armor_piercing_chance = 1
	self.flamethrower_mk2.can_shoot_through_enemy = false
	self.flamethrower_mk2.can_shoot_through_shield = false
	self.flamethrower_mk2.can_shoot_through_wall = false
	self.flamethrower_mk2.spread.standing = 3.5
	self.flamethrower_mk2.spread.crouching = 2.5
	self.flamethrower_mk2.spread.steelsight = 1
	self.flamethrower_mk2.spread.moving_standing = 4
	self.flamethrower_mk2.spread.moving_crouching = 3
	self.flamethrower_mk2.spread.moving_steelsight = 2
	self.flamethrower_mk2.damage_near = 700
	self.flamethrower_mk2.damage_far = 1400
	self.flamethrower_mk2.kick.standing = self.new_m4.kick.standing
	self.flamethrower_mk2.kick.crouching = self.new_m4.kick.standing
	self.flamethrower_mk2.kick.steelsight = self.new_m4.kick.standing
	self.flamethrower_mk2.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 999999,
		dot_trigger_chance = 50,
		dot_length = 5,
		dot_tick_period = 0.5
	}
	self.flamethrower_mk2.stats = {
		damage = 33,
		spread = 7,
		recoil = 22,
		spread_moving = 6,
		zoom = 3,
		concealment = 6,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.flamethrower_mk2.panic_suppression_chance = 0.0
	self.m32.spread.standing = 3.5
	self.m32.spread.crouching = 2.5
	self.m32.spread.steelsight = 1
	self.m32.spread.moving_standing = 4
	self.m32.spread.moving_crouching = 3
	self.m32.spread.moving_steelsight = 2
	self.m32.kick.standing = self.r870.kick.standing
	self.m32.kick.crouching = self.r870.kick.standing
	self.m32.kick.steelsight = self.r870.kick.standing
	self.m32.AMMO_MAX = 9
	self.m32.AMMO_PICKUP = {0.18, 0.45}
	self.m32.stats = {
		damage = 80,
		spread = 6,
		recoil = 6,
		spread_moving = 6,
		zoom = 3,
		concealment = 10,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.m32.stats_modifiers = {damage = 10}
	self.m32.panic_suppression_chance = 0.0
	self.aa12.rays = 9
	self.aa12.AMMO_MAX = 120
	self.aa12.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.aa12.damage_near = 700
	self.aa12.damage_far = 1400
	self.aa12.spread.standing = 3.5
	self.aa12.spread.crouching = 2.5
	self.aa12.spread.steelsight = 1
	self.aa12.spread.moving_standing = 4
	self.aa12.spread.moving_crouching = 3
	self.aa12.spread.moving_steelsight = 2
	self.aa12.kick.standing = self.new_m4.kick.standing
	self.aa12.kick.crouching = self.new_m4.kick.standing
	self.aa12.kick.steelsight = self.new_m4.kick.standing
	self.aa12.stats = {
		damage = 39,
		spread = 7,
		recoil = 17,
		spread_moving = 7,
		zoom = 3,
		concealment = 9,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.aa12.panic_suppression_chance = 0.0
	self.peacemaker.AMMO_MAX = 30
	self.peacemaker.AMMO_PICKUP = self:_pickup_chance(30, 1)
	self.peacemaker.spread = {}
	self.peacemaker.spread.standing = 3.5
	self.peacemaker.spread.crouching = 2.5
	self.peacemaker.spread.steelsight = 1
	self.peacemaker.spread.moving_standing = 4
	self.peacemaker.spread.moving_crouching = 3
	self.peacemaker.spread.moving_steelsight = 2
	self.peacemaker.kick.standing = self.r870.kick.standing
	self.peacemaker.kick.crouching = self.r870.kick.standing
	self.peacemaker.kick.steelsight = self.r870.kick.standing
	self.peacemaker.stats = {
		damage = 150,
		spread = 20,
		recoil = 16,
		spread_moving = 9,
		zoom = 5,
		concealment = 23,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.peacemaker.panic_suppression_chance = 0.0
	self.peacemaker.has_description = true
	self.peacemaker.desc_id = "bm_ap_weapon_sc_desc"
	self.peacemaker.can_shoot_through_enemy = true
	self.peacemaker.can_shoot_through_shield = true
	self.peacemaker.can_shoot_through_wall = true
	self.peacemaker.armor_piercing_chance = 1
	self.peacemaker.stats_modifiers = {damage = 1}
	self.winchester1874.upgrade_blocks = nil
	self.winchester1874.has_description = true
	self.winchester1874.desc_id = "bm_ap_weapon_sc_desc"
	self.winchester1874.AMMO_MAX = 40
	self.winchester1874.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.winchester1874.FIRE_MODE = "single"
	self.winchester1874.fire_mode_data = {}
	self.winchester1874.fire_mode_data.fire_rate = 0.6
	self.winchester1874.CAN_TOGGLE_FIREMODE = false
	self.winchester1874.single = {}
	self.winchester1874.single.fire_rate = 0.6
	self.winchester1874.spread = {}
	self.winchester1874.spread.standing = 3.5
	self.winchester1874.spread.crouching = 2.5
	self.winchester1874.spread.steelsight = 1
	self.winchester1874.spread.moving_standing = 4
	self.winchester1874.spread.moving_crouching = 3
	self.winchester1874.spread.moving_steelsight = 2
	self.winchester1874.kick.standing = self.r870.kick.standing
	self.winchester1874.kick.crouching = self.r870.kick.standing
	self.winchester1874.kick.steelsight = self.r870.kick.standing
	self.winchester1874.stats = {
		damage = 172,
		spread = 20,
		recoil = 16,
		spread_moving = 9,
		zoom = 1,
		concealment = 12,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.winchester1874.stats_modifiers = nil
	self.winchester1874.panic_suppression_chance = 0.0
	self.plainsrider.has_description = true
	self.plainsrider.desc_id = "bm_ap_2_weapon_sc_desc"
	self.plainsrider.spread.standing = 3.5
	self.plainsrider.spread.crouching = 2.5
	self.plainsrider.spread.steelsight = 1
	self.plainsrider.spread.moving_standing = 4
	self.plainsrider.spread.moving_crouching = 3
	self.plainsrider.spread.moving_steelsight = 2
	self.plainsrider.kick.standing = self.r870.kick.standing
	self.plainsrider.kick.crouching = self.r870.kick.standing
	self.plainsrider.kick.steelsight = self.r870.kick.standing
	self.plainsrider.AMMO_MAX = 30
	self.plainsrider.AMMO_PICKUP = {0.3, 0.75}
	self.plainsrider.charge_data.max_t = 1
	self.plainsrider.not_allowed_in_bleedout = false
	self.plainsrider.stats = {
		damage = 120,
		spread = 21,
		recoil = 25,
		spread_moving = 12,
		zoom = 5,
		concealment = 30,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.plainsrider.panic_suppression_chance = 0.0
	self.plainsrider.stats_modifiers = {damage = 2}
	self.mateba.fire_mode_data.fire_rate = 0.15
	self.mateba.single = {}
	self.mateba.single.fire_rate = 0.15
	self.mateba.AMMO_MAX = 40
	self.mateba.AMMO_PICKUP = self:_pickup_chance(40, 1)
	self.mateba.timers.reload_not_empty = 3.6
	self.mateba.timers.reload_empty = 3.6
	self.mateba.spread.standing = 3.5
	self.mateba.spread.crouching = 2.5
	self.mateba.spread.steelsight = 1
	self.mateba.spread.moving_standing = 4
	self.mateba.spread.moving_crouching = 3
	self.mateba.spread.moving_steelsight = 2
	self.mateba.kick.standing = self.r870.kick.standing
	self.mateba.kick.crouching = self.r870.kick.standing
	self.mateba.kick.steelsight = self.r870.kick.standing
	self.mateba.stats = {
		damage = 99,
		spread = 19,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 26,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.mateba.panic_suppression_chance = 0.0
	self.asval.sounds.fire = "akm_fire_single"
	self.asval.sounds.fire_single = "akm_fire_single"
	self.asval.sounds.fire_auto = "akm_fire"
	self.asval.sounds.stop_fire = "akm_stop"
	self.asval.sounds.dryfire = "primary_dryfire"
	self.asval.AMMO_MAX = 80
	self.asval.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.asval.FIRE_MODE = "auto"
	self.asval.fire_mode_data = {}
	self.asval.fire_mode_data.fire_rate = 0.06666666666
	self.asval.CAN_TOGGLE_FIREMODE = true
	self.asval.auto = {}
	self.asval.auto.fire_rate = 0.06666666666
	self.asval.spread.standing = 3.5
	self.asval.spread.crouching = 2.5
	self.asval.spread.steelsight = 1
	self.asval.spread.moving_standing = 4
	self.asval.spread.moving_crouching = 3
	self.asval.spread.moving_steelsight = 2
	self.asval.kick.standing = self.new_m4.kick.standing
	self.asval.kick.crouching = self.new_m4.kick.standing
	self.asval.kick.steelsight = self.new_m4.kick.standing
	self.asval.stats = {
		damage = 86,
		spread = 17,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 25,
		suppression = 18,
		alert_size = 18,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.asval.panic_suppression_chance = 0.0
	self.sub2000.category = "pistol"
	self.sub2000.recategorize = "pistol_carbine"
	self.sub2000.CLIP_AMMO_MAX = 30
	self.sub2000.AMMO_MAX = 150
	self.sub2000.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.sub2000.sounds.fire = "sub2k_fire"
	self.sub2000.sounds.fire_single = "sub2k_fire"
	self.sub2000.sounds.dryfire = "primary_dryfire"
	self.sub2000.sounds.fire_auto = "mac10_fire"
	self.sub2000.sounds.stop_fire = "mac10_stop"
	self.sub2000.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.sub2000.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.sub2000.fire_mode_data.fire_rate = 0.08571428571
	self.sub2000.CAN_TOGGLE_FIREMODE = false
	self.sub2000.FIRE_MODE = "single"
	self.sub2000.single = {}
	self.sub2000.single.fire_rate = 0.08571428571
	self.sub2000.spread.standing = 3.5
	self.sub2000.spread.crouching = 2.5
	self.sub2000.spread.steelsight = 1
	self.sub2000.spread.moving_standing = 4
	self.sub2000.spread.moving_crouching = 3
	self.sub2000.spread.moving_steelsight = 2
	self.sub2000.kick = {}
	self.sub2000.kick.standing = self.glock_17.kick.standing
	self.sub2000.kick.crouching = self.glock_17.kick.standing
	self.sub2000.kick.steelsight = self.glock_17.kick.standing
	self.sub2000.stats = {
		damage = 35,
		spread = 17,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.sub2000.panic_suppression_chance = 0.0
	self.wa2000.upgrade_blocks = nil
	self.wa2000.has_description = true
	self.wa2000.desc_id = "bm_ap_weapon_sc_desc"
	self.wa2000.CLIP_AMMO_MAX = 10
	self.wa2000.AMMO_MAX = 40
	self.wa2000.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.wa2000.fire_mode_data.fire_rate = 0.3
	self.wa2000.CAN_TOGGLE_FIREMODE = false
	self.wa2000.single = {}
	self.wa2000.single.fire_rate = 0.3
	self.wa2000.spread.standing = 3.5
	self.wa2000.spread.crouching = 2.5
	self.wa2000.spread.steelsight = 1
	self.wa2000.spread.moving_standing = 4
	self.wa2000.spread.moving_crouching = 3
	self.wa2000.spread.moving_steelsight = 2
	self.wa2000.kick.standing = self.r870.kick.standing
	self.wa2000.kick.crouching = self.r870.kick.standing
	self.wa2000.kick.steelsight = self.r870.kick.standing
	self.wa2000.stats = {
		damage = 172,
		spread = 19,
		recoil = 16,
		spread_moving = 6,
		zoom = 1,
		concealment = 16,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.wa2000.armor_piercing_chance = 1
	self.wa2000.stats_modifiers = nil
	self.wa2000.panic_suppression_chance = 0.0
	self.polymer.CLIP_AMMO_MAX = 30
	self.polymer.AMMO_MAX = 80
	self.polymer.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.polymer.FIRE_MODE = "auto"
	self.polymer.fire_mode_data = {}
	self.polymer.fire_mode_data.fire_rate = 0.05
	self.polymer.CAN_TOGGLE_FIREMODE = true
	self.polymer.auto = {}
	self.polymer.auto.fire_rate = 0.05
	self.polymer.spread = {}
	self.polymer.spread.standing = 3.5
	self.polymer.spread.crouching = 2.5
	self.polymer.spread.steelsight = 1
	self.polymer.spread.moving_standing = 4
	self.polymer.spread.moving_crouching = 3
	self.polymer.spread.moving_steelsight = 2
	self.polymer.kick.standing = self.new_m4.kick.standing
	self.polymer.kick.crouching = self.new_m4.kick.standing
	self.polymer.kick.steelsight = self.new_m4.kick.standing
	self.polymer.stats = {
		damage = 46,
		spread = 17,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 20,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.polymer.panic_suppression_chance = 0.1
	self.hunter.has_description = true
	self.hunter.desc_id = "bm_ap_2_weapon_sc_desc"
	self.hunter.AMMO_MAX = 20
	self.hunter.AMMO_PICKUP = {0.24, 0.6}
	self.hunter.spread.standing = 3.5
	self.hunter.spread.crouching = 2.5
	self.hunter.spread.steelsight = 1
	self.hunter.spread.moving_standing = 4
	self.hunter.spread.moving_crouching = 3
	self.hunter.spread.moving_steelsight = 2
	self.hunter.panic_suppression_chance = 0.0
	self.hunter.ignore_damage_upgrades = true
	self.hunter.stats = {
		damage = 120,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 26,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.hunter.panic_suppression_chance = 0.0
	self.hunter.stats_modifiers = {damage = 2}
	self.baka.CLIP_AMMO_MAX = 30
	self.baka.NR_CLIPS_MAX = 4
	self.baka.AMMO_MAX = 150
	self.baka.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.baka.FIRE_MODE = "auto"
	self.baka.fire_mode_data = {}
	self.baka.fire_mode_data.fire_rate = 0.06315789473
	self.baka.CAN_TOGGLE_FIREMODE = true
	self.baka.auto = {}
	self.baka.auto.fire_rate = 0.06315789473
	self.baka.spread.standing = 3.5
	self.baka.spread.crouching = 2
	self.baka.spread.steelsight = 1
	self.baka.spread.moving_standing = 4
	self.baka.spread.moving_crouching = 3
	self.baka.spread.moving_steelsight = 2
	self.baka.kick = {}
	self.baka.kick.standing = self.new_m4.kick.standing
	self.baka.kick.crouching = self.new_m4.kick.standing
	self.baka.kick.steelsight = self.new_m4.kick.standing
	self.baka.stats = {
		damage = 29,
		spread = 13,
		recoil = 22,
		spread_moving = 8,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.baka.panic_suppression_chance = 0.1
	self.arblast.has_description = true
	self.arblast.desc_id = "bm_ap_2_weapon_sc_desc"
	self.arblast.AMMO_MAX = 20
	self.arblast.AMMO_PICKUP = {0.24, 0.6}
	self.arblast.spread.standing = 3.5
	self.arblast.spread.crouching = 2.5
	self.arblast.spread.steelsight = 1
	self.arblast.spread.moving_standing = 4
	self.arblast.spread.moving_crouching = 3
	self.arblast.spread.moving_steelsight = 2
	self.arblast.kick.standing = self.r870.kick.standing
	self.arblast.kick.crouching = self.r870.kick.standing
	self.arblast.kick.steelsight = self.r870.kick.standing
	self.arblast.panic_suppression_chance = 0.0
	self.arblast.stats = {
		damage = 180,
		spread = 21,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 25,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.arblast.stats_modifiers = {damage =  2}
	self.frankish.has_description = true
	self.frankish.desc_id = "bm_ap_2_weapon_sc_desc"
	self.frankish.spread.standing = 3.5
	self.frankish.spread.crouching = 2.5
	self.frankish.spread.steelsight = 1
	self.frankish.spread.moving_standing = 4
	self.frankish.spread.moving_crouching = 3
	self.frankish.spread.moving_steelsight = 2
	self.frankish.kick.standing = self.r870.kick.standing
	self.frankish.kick.crouching = self.r870.kick.standing
	self.frankish.kick.steelsight = self.r870.kick.standing
	self.frankish.AMMO_MAX = 30
	self.frankish.AMMO_PICKUP = {0.3, 0.75}
	self.frankish.panic_suppression_chance = 0.0
	self.frankish.ignore_damage_upgrades = true
	self.frankish.stats = {
		damage = 120,
		spread = 21,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 26,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.frankish.stats_modifiers = {damage = 2}
	self.long.has_description = true
	self.long.desc_id = "bm_ap_2_weapon_sc_desc"
	self.long.spread.standing = 3.5
	self.long.spread.crouching = 2.5
	self.long.spread.steelsight = 1
	self.long.spread.moving_standing = 4
	self.long.spread.moving_crouching = 3
	self.long.spread.moving_steelsight = 2
	self.long.kick.standing = self.r870.kick.standing
	self.long.kick.crouching = self.r870.kick.standing
	self.long.kick.steelsight = self.r870.kick.standing
	self.long.charge_data.max_t = 1.5
	self.long.not_allowed_in_bleedout = false
	self.long.AMMO_MAX = 20
	self.long.AMMO_PICKUP = {0.24, 0.6}
	self.long.panic_suppression_chance = 0.0
	self.long.ignore_damage_upgrades = true
	self.long.stats = {
		damage = 180,
		spread = 21,
		recoil = 25,
		spread_moving = 12,
		zoom = 5,
		concealment = 29,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.long.stats_modifiers = {damage = 2}
	self.par.sub_category = "smg"
	self.par.CLIP_AMMO_MAX = 200
	self.par.fire_mode_data.fire_rate = 0.075
	self.par.auto.fire_rate = 0.075
	self.par.AMMO_MAX = 250
	self.par.AMMO_PICKUP = self:_pickup_chance(250, 2)
	self.par.spread.standing = 3.5
	self.par.spread.crouching = 2.5
	self.par.spread.steelsight = 1
	self.par.spread.moving_standing = 4
	self.par.spread.moving_crouching = 3
	self.par.spread.moving_steelsight = 2
	self.par.timers.reload_not_empty = 6.5
	self.par.timers.reload_empty = 6.5
	self.par.kick = {}
	self.par.kick.standing = self.new_m4.kick.standing
	self.par.kick.crouching = self.new_m4.kick.standing
	self.par.kick.steelsight = self.new_m4.kick.standing
	self.par.panic_suppression_chance = 0.1
	self.par.stats = {
		damage = 25,
		spread = 15,
		recoil = 19,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.sparrow.AMMO_MAX = 120
	self.sparrow.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.sparrow.spread.standing = 3.5
	self.sparrow.spread.crouching = 2.5
	self.sparrow.spread.steelsight = 1
	self.sparrow.spread.moving_standing = 4
	self.sparrow.spread.moving_crouching = 3
	self.sparrow.spread.moving_steelsight = 2
	self.sparrow.kick = {}
	self.sparrow.kick.standing = self.glock_17.kick.standing
	self.sparrow.kick.crouching = self.glock_17.kick.standing
	self.sparrow.kick.steelsight = self.glock_17.kick.standing
	self.sparrow.fire_mode_data.fire_rate = 0.075
	self.sparrow.single.fire_rate = 0.075
	self.sparrow.stats = {
		damage = 35,
		spread = 17,
		recoil = 17,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.sparrow.panic_suppression_chance = 0.0
	self.model70.upgrade_blocks = nil
	self.model70.spread.standing = 3.5
	self.model70.spread.crouching = 2.5
	self.model70.spread.steelsight = 1
	self.model70.spread.moving_standing = 4
	self.model70.spread.moving_crouching = 3
	self.model70.spread.moving_steelsight = 2
	self.model70.has_description = true
	self.model70.desc_id = "bm_ap_weapon_sc_desc"
	self.model70.AMMO_MAX = 30
	self.model70.CLIP_AMMO_MAX = 6
	self.model70.AMMO_PICKUP = self:_pickup_chance(30, 2)
	self.model70.kick.standing = self.r870.kick.standing
	self.model70.kick.crouching = self.r870.kick.standing
	self.model70.kick.steelsight = self.r870.kick.standing
	self.model70.stats = {
		damage = 229,
		spread = 21,
		recoil = 14,
		spread_moving = 9,
		zoom = 1,
		concealment = 6,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.model70.panic_suppression_chance = 0.0
	self.model70.stats_modifiers = {
		damage = 1,
	}
	self.m37.damage_near = 900
	self.m37.damage_far = 1800
	self.m37.rays = 9
	self.m37.CLIP_AMMO_MAX = 6
	self.m37.AMMO_MAX = 40
	self.m37.AMMO_PICKUP = self:_pickup_chance(40, 1)
	self.m37.fire_mode_data.fire_rate = 0.6
	self.m37.single.fire_rate = 0.6
	self.m37.spread.standing = 3.5
	self.m37.spread.crouching = 2.5
	self.m37.spread.steelsight = 1
	self.m37.spread.moving_standing = 4
	self.m37.spread.moving_crouching = 3
	self.m37.spread.moving_steelsight = 2
	self.m37.kick.standing = self.r870.kick.standing
	self.m37.kick.crouching = self.r870.kick.standing
	self.m37.kick.steelsight = self.r870.kick.standing
	self.m37.panic_suppression_chance = 0.0
	self.m37.stats = {
		damage = 89,
		spread = 9,
		recoil = 15,
		spread_moving = 6,
		zoom = 3,
		concealment = 23,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.china.fire_mode_data.fire_rate = 2
	self.china.single.fire_rate = 2
	self.china.AMMO_MAX = 6
	self.china.spread.standing = 3.5
	self.china.spread.crouching = 2.5
	self.china.spread.steelsight = 1
	self.china.spread.moving_standing = 4
	self.china.spread.moving_crouching = 3
	self.china.spread.moving_steelsight = 2
	self.china.kick.standing = self.r870.kick.standing
	self.china.kick.crouching = self.r870.kick.standing
	self.china.kick.steelsight = self.r870.kick.standing
	self.china.AMMO_PICKUP = {0.12, 0.38}
	self.china.stats = {
		damage = 80,
		spread = 6,
		recoil = 9,
		spread_moving = 6,
		zoom = 3,
		concealment = 10,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.china.panic_suppression_chance = 0.0
	self.china.stats_modifiers = {damage = 10}
	self.sr2.auto.fire_rate = 0.06666666666
	self.sr2.fire_mode_data.fire_rate = 0.06666666666
	self.sr2.CLIP_AMMO_MAX = 30
	self.sr2.AMMO_MAX = 150
	self.sr2.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.sr2.spread.standing = 3.5
	self.sr2.spread.crouching = 2.5
	self.sr2.spread.steelsight = 1
	self.sr2.spread.moving_standing = 4
	self.sr2.spread.moving_crouching = 3
	self.sr2.spread.moving_steelsight = 2
	self.sr2.kick = {}
	self.sr2.kick.standing = self.new_m4.kick.standing
	self.sr2.kick.crouching = self.new_m4.kick.standing
	self.sr2.kick.steelsight = self.new_m4.kick.standing
	self.sr2.stats = {
		damage = 26,
		spread = 17,
		recoil = 18,
		spread_moving = 8,
		zoom = 3,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.sr2.panic_suppression_chance = 0.1
	self.x_sr2.fire_mode_data.fire_rate = 0.06666666666
	self.x_sr2.single.fire_rate = 0.06666666666
	self.x_sr2.CLIP_AMMO_MAX = 60
	self.x_sr2.spread.standing = 3.5
	self.x_sr2.spread.crouching = 2.5
	self.x_sr2.spread.steelsight = 1
	self.x_sr2.spread.moving_standing = 4
	self.x_sr2.spread.moving_crouching = 3
	self.x_sr2.spread.moving_steelsight = 2
	self.x_sr2.kick.standing = self.new_m4.kick.standing
	self.x_sr2.kick.crouching = self.new_m4.kick.standing
	self.x_sr2.kick.steelsight = self.new_m4.kick.standing
	self.x_sr2.AMMO_MAX = 180
	self.x_sr2.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.x_sr2.stats = {
		damage = 26,
		spread = 17,
		recoil = 18,
		spread_moving = 8,
		zoom = 3,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_sr2.panic_suppression_chance = 0.1
	self.pl14.fire_mode_data.fire_rate = 0.075
	self.pl14.single.fire_rate = 0.075
	self.pl14.CLIP_AMMO_MAX = 10
	self.pl14.AMMO_MAX = 120
	self.pl14.AMMO_PICKUP = self:_pickup_chance(120, 1)
	self.pl14.spread.standing = 3.5
	self.pl14.spread.crouching = 2.5
	self.pl14.spread.steelsight = 1
	self.pl14.spread.moving_standing = 4
	self.pl14.spread.moving_crouching = 3
	self.pl14.spread.moving_steelsight = 2
	self.pl14.kick.standing = self.glock_17.kick.standing
	self.pl14.kick.crouching = self.glock_17.kick.standing
	self.pl14.kick.steelsight = self.glock_17.kick.standing
	self.pl14.stats = {
		damage = 35,
		spread = 17,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.pl14.panic_suppression_chance = 0.0
	self.x_mp5.fire_mode_data.fire_rate = 0.075
	self.x_mp5.spread.standing = 3.5
	self.x_mp5.spread.crouching = 2.5
	self.x_mp5.spread.steelsight = 1
	self.x_mp5.spread.moving_standing = 4
	self.x_mp5.spread.moving_crouching = 3
	self.x_mp5.spread.moving_steelsight = 2
	self.x_mp5.kick.standing = self.new_m4.kick.standing
	self.x_mp5.kick.crouching = self.new_m4.kick.standing
	self.x_mp5.kick.steelsight = self.new_m4.kick.standing
	self.x_mp5.AMMO_MAX = 180
	self.x_mp5.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.x_mp5.stats = {
		damage = 26,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 3,
		concealment = 23,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.x_mp5.panic_suppression_chance = 0.1
	self.x_akmsu.AMMO_MAX = 120
	self.x_akmsu.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.x_akmsu.fire_mode_data.fire_rate = 0.0923076923
	self.x_akmsu.spread.standing = 3.5
	self.x_akmsu.spread.crouching = 2.5
	self.x_akmsu.spread.steelsight = 1
	self.x_akmsu.spread.moving_standing = 4
	self.x_akmsu.spread.moving_crouching = 3
	self.x_akmsu.spread.moving_steelsight = 2
	self.x_akmsu.panic_suppression_chance = 0.0
	self.x_akmsu.kick.standing = self.new_m4.kick.standing
	self.x_akmsu.kick.crouching = self.new_m4.kick.standing
	self.x_akmsu.kick.steelsight = self.new_m4.kick.standing
	self.x_akmsu.stats = {
		damage = 51,
		spread = 12,
		recoil = 17,
		spread_moving = 9,
		zoom = 3,
		concealment = 21,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.tecci.spread.standing = 3.5
	self.tecci.spread.crouching = 2.5
	self.tecci.spread.steelsight = 1
	self.tecci.spread.moving_standing = 4
	self.tecci.spread.moving_crouching = 3
	self.tecci.spread.moving_steelsight = 2
	self.tecci.kick.standing = self.new_m4.kick.standing
	self.tecci.kick.crouching = self.new_m4.kick.standing
	self.tecci.kick.steelsight = self.new_m4.kick.standing
	self.tecci.CLIP_AMMO_MAX = 100
	self.tecci.AMMO_MAX = 120
	self.tecci.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.tecci.fire_mode_data.fire_rate = 0.08571428571
	self.tecci.CAN_TOGGLE_FIREMODE = true
	self.tecci.auto.fire_rate = 0.08571428571
	self.tecci.panic_suppression_chance = 0.0
	self.tecci.stats = {
		damage = 53,
		spread = 16,
		recoil = 17,
		spread_moving = 10,
		zoom = 3,
		concealment = 14,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.hajk.fire_mode_data.fire_rate = 0.075
	self.hajk.auto.fire_rate = 0.075
	self.hajk.AMMO_MAX = 150
	self.hajk.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.hajk.spread.standing = 3.5
	self.hajk.spread.crouching = 2.5
	self.hajk.spread.steelsight = 1
	self.hajk.spread.moving_standing = 4
	self.hajk.spread.moving_crouching = 3
	self.hajk.spread.moving_steelsight = 2
	self.hajk.kick.standing = self.new_m4.kick.standing
	self.hajk.kick.crouching = self.new_m4.kick.standing
	self.hajk.kick.steelsight = self.new_m4.kick.standing
	self.hajk.category = "assault_rifle"
	self.hajk.panic_suppression_chance = 0.0
	self.hajk.stats = {
		damage = 33,
		spread = 16,
		recoil = 21,
		spread_moving = 6,
		zoom = 3,
		concealment = 24,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.boot.AMMO_MAX = 40
	self.boot.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.boot.CLIP_AMMO_MAX = 6
	self.boot.damage_near = 800
	self.boot.damage_far = 1600
	self.boot.fire_mode_data.fire_rate = 0.75
	self.boot.single.fire_rate = 0.75
	self.boot.rays = 9
	self.boot.spread.standing = 3.5
	self.boot.spread.crouching = 2.5
	self.boot.spread.steelsight = 1
	self.boot.spread.moving_standing = 4
	self.boot.spread.moving_crouching = 3
	self.boot.spread.moving_steelsight = 2
	self.boot.kick.standing = self.r870.kick.standing
	self.boot.kick.crouching = self.r870.kick.standing
	self.boot.kick.steelsight = self.r870.kick.standing
	self.boot.stats = {
		damage = 139,
		spread = 8,
		recoil = 15,
		spread_moving = 5,
		zoom = 3,
		concealment = 7,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.boot.panic_suppression_chance = 0.0
	self.boot.stats_modifiers = {damage = 1}
	self.packrat.AMMO_MAX = 150
	self.packrat.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.packrat.fire_mode_data.fire_rate = 0.07058823529
	self.packrat.single.fire_rate = 0.07058823529
	self.packrat.spread.standing = 3.5
	self.packrat.spread.crouching = 2.5
	self.packrat.spread.steelsight = 1
	self.packrat.spread.moving_standing = 4
	self.packrat.spread.moving_crouching = 3
	self.packrat.spread.moving_steelsight = 2
	self.packrat.kick.standing = self.glock_17.kick.standing
	self.packrat.kick.crouching = self.glock_17.kick.standing
	self.packrat.kick.steelsight = self.glock_17.kick.standing
	self.packrat.panic_suppression_chance = 0.0
	self.packrat.stats = {
		damage = 29,
		spread = 17,
		recoil = 20,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.schakal.fire_mode_data.fire_rate = 0.1
	self.schakal.auto.fire_rate = 0.1
	self.schakal.AMMO_MAX = 80
	self.schakal.CLIP_AMMO_MAX = 25
	self.schakal.AMMO_PICKUP = self:_pickup_chance(80, 1)
	self.schakal.spread.standing = 3.5
	self.schakal.spread.crouching = 2.5
	self.schakal.spread.steelsight = 1
	self.schakal.spread.moving_standing = 4
	self.schakal.spread.moving_crouching = 3
	self.schakal.spread.moving_steelsight = 2
	self.schakal.kick.standing = self.new_m4.kick.standing
	self.schakal.kick.crouching = self.new_m4.kick.standing
	self.schakal.kick.steelsight = self.new_m4.kick.standing
	self.schakal.panic_suppression_chance = 0.1
	self.schakal.stats = {
		damage = 46,
		spread = 17,
		recoil = 17,
		spread_moving = 14,
		zoom = 3,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.desertfox.has_description = true
	self.desertfox.desc_id = "bm_ap_weapon_sc_desc"
	self.desertfox.CLIP_AMMO_MAX = 5
	self.desertfox.AMMO_MAX = 30
	self.desertfox.AMMO_PICKUP = self:_pickup_chance(30, 2)
	self.desertfox.fire_mode_data.fire_rate = 0.85714285714
	self.desertfox.spread.standing = 3.5
	self.desertfox.spread.crouching = 2.5
	self.desertfox.spread.steelsight = 1
	self.desertfox.spread.moving_standing = 4
	self.desertfox.spread.moving_crouching = 3
	self.desertfox.spread.moving_steelsight = 2
	self.desertfox.kick.standing = self.r870.kick.standing
	self.desertfox.kick.crouching = self.r870.kick.standing
	self.desertfox.kick.steelsight = self.r870.kick.standing
	self.desertfox.panic_suppression_chance = 0.0
	self.desertfox.stats = {
		damage = 229,
		spread = 20,
		recoil = 7,
		spread_moving = 8,
		zoom = 1,
		concealment = 19,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 10,
		reload = 11
	}
	self.desertfox.stats_modifiers = {damage = 1}
	self.x_packrat.AMMO_MAX = 180
	self.x_packrat.AMMO_PICKUP = self:_pickup_chance(180, 2)
	self.x_packrat.fire_mode_data.fire_rate = 0.07058823529
	self.x_packrat.single.fire_rate = 0.07058823529
	self.x_packrat.spread.standing = 3.5
	self.x_packrat.spread.crouching = 2.5
	self.x_packrat.spread.steelsight = 1
	self.x_packrat.spread.moving_standing = 4
	self.x_packrat.spread.moving_crouching = 3
	self.x_packrat.spread.moving_steelsight = 2
	self.x_packrat.kick.standing = self.glock_17.kick.standing
	self.x_packrat.kick.crouching = self.glock_17.kick.standing
	self.x_packrat.kick.steelsight = self.glock_17.kick.standing
	self.x_packrat.panic_suppression_chance = 0.0
	self.x_packrat.stats = {
		damage = 29,
		spread = 17,
		recoil = 20,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.rota.upgrade_blocks = nil
	self.rota.AMMO_MAX = 60
	self.rota.AMMO_PICKUP = self:_pickup_chance(60, 1)
	self.rota.spread.standing = 3.5
	self.rota.spread.crouching = 2.5
	self.rota.spread.steelsight = 1
	self.rota.spread.moving_standing = 4
	self.rota.spread.moving_crouching = 3
	self.rota.spread.moving_steelsight = 2
	self.rota.kick.standing = self.new_m4.kick.standing
	self.rota.kick.crouching = self.new_m4.kick.standing
	self.rota.kick.steelsight = self.new_m4.kick.standing
	self.rota.fire_mode_data.fire_rate = 0.13953488372
	self.rota.single.fire_rate = 0.13953488372
	self.rota.panic_suppression_chance = 0.0
	self.rota.damage_near = 800
	self.rota.damage_far = 1600
	self.rota.stats = {
		damage = 64,
		spread = 8,
		recoil = 16,
		spread_moving = 7,
		zoom = 3,
		concealment = 21,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.arbiter.fire_mode_data.fire_rate = 1.5
	self.arbiter.single.fire_rate = 1.5
	self.arbiter.CLIP_AMMO_MAX = 6
	self.arbiter.AMMO_MAX = 9
	self.arbiter.AMMO_PICKUP = {0.18, 0.45}
	self.arbiter.stats = {
		damage = 300,
		spread = 4,
		recoil = 9,
		spread_moving = 6,
		zoom = 3,
		concealment = 8,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.arbiter.stats_modifiers = {damage = 2}
	self.arbiter.panic_suppression_chance = 0.0
	self.arbiter.spread.standing = 3.5
	self.arbiter.spread.crouching = 2.5
	self.arbiter.spread.steelsight = 1
	self.arbiter.spread.moving_standing = 4
	self.arbiter.spread.moving_crouching = 3
	self.arbiter.spread.moving_steelsight = 2
	self.arbiter.kick.standing = self.r870.kick.standing
	self.arbiter.kick.crouching = self.r870.kick.standing
	self.arbiter.kick.steelsight = self.r870.kick.standing
	self.contraband.AMMO_MAX = 80
	self.contraband.AMMO_PICKUP = self:_pickup_chance(80, 2)
	self.contraband.FIRE_MODE = "auto"
	self.contraband.fire_mode_data.fire_rate = 0.1
	self.contraband.CAN_TOGGLE_FIREMODE = true
	self.contraband.auto.fire_rate = 0.1
	self.contraband.spread.standing = 3.5
	self.contraband.spread.crouching = 2.5
	self.contraband.spread.steelsight = 1
	self.contraband.spread.moving_standing = 4
	self.contraband.spread.moving_crouching = 3
	self.contraband.spread.moving_steelsight = 2
	self.contraband.panic_suppression_chance = 0.0
	self.contraband.kick.standing = self.new_m4.kick.standing
	self.contraband.kick.crouching = self.new_m4.kick.standing
	self.contraband.kick.steelsight = self.new_m4.kick.standing
	self.contraband.stats = {
		damage = 53,
		spread = 17,
		recoil = 17,
		spread_moving = 5,
		zoom = 4,
		concealment = 6,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.contraband_m203.spread.standing = 3.5
	self.contraband_m203.spread.crouching = 2.5
	self.contraband_m203.spread.steelsight = 1
	self.contraband_m203.spread.moving_standing = 4
	self.contraband_m203.spread.moving_crouching = 3
	self.contraband_m203.spread.moving_steelsight = 2
	self.contraband_m203.kick.standing = self.r870.kick.standing
	self.contraband_m203.kick.crouching = self.r870.kick.standing
	self.contraband_m203.kick.steelsight = self.r870.kick.standing
	self.contraband_m203.AMMO_PICKUP = {0.12, 0.38}
	self.contraband_m203.panic_suppression_chance = 0.0
	self.contraband_m203.ignore_damage_upgrades = true
	self.contraband_m203.AMMO_MAX = 6
	self.contraband_m203.stats = {
		damage = 200,
		spread = 21,
		recoil = 9,
		spread_moving = 6,
		zoom = 3,
		concealment = 18,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.contraband_m203.stats_modifiers = {damage = 4}
	self.ray.use_data.selection_index = 2
	self.ray.spread.standing = 3.5
	self.ray.spread.crouching = 2.5
	self.ray.spread.steelsight = 1
	self.ray.spread.moving_standing = 4
	self.ray.spread.moving_crouching = 3
	self.ray.spread.moving_steelsight = 2
	self.ray.kick.standing = self.r870.kick.standing
	self.ray.kick.crouching = self.r870.kick.standing
	self.ray.kick.steelsight = self.r870.kick.standing
	self.ray.timers.reload_not_empty = 6
	self.ray.timers.reload_empty = 6
	self.ray.has_description = false
	self.ray.fire_mode_data.fire_rate = 1.5
	self.ray.CLIP_AMMO_MAX = 4
	self.ray.AMMO_MAX = 6
	self.ray.AMMO_PICKUP = {0.12, 0.38}
	self.ray.stats = {
		damage = 400,
		spread = 13,
		recoil = 1,
		spread_moving = 6,
		zoom = 3,
		concealment = 1,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.ray.panic_suppression_chance = 0.0
	self.ray.stats_modifiers = {damage = 3}
	self.tti.category = "snp"
	self.tti.upgrade_blocks = nil
	self.tti.has_description = true
	self.tti.desc_id = "bm_ap_weapon_sc_desc"
	self.tti.CLIP_AMMO_MAX = 20
	self.tti.AMMO_MAX = 40
	self.tti.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.tti.FIRE_MODE = "single"
	self.tti.fire_mode_data = {}
	self.tti.fire_mode_data.fire_rate = 0.75
	self.tti.single = {}
	self.tti.single.fire_rate = 0.75
	self.tti.spread.standing = 3.5
	self.tti.spread.crouching = 2.5
	self.tti.spread.steelsight = 1
	self.tti.spread.moving_standing = 4
	self.tti.spread.moving_crouching = 3
	self.tti.spread.moving_steelsight = 2
	self.tti.kick.standing = self.r870.kick.standing
	self.tti.kick.crouching = self.r870.kick.standing
	self.tti.kick.steelsight = self.r870.kick.standing
	self.tti.can_shoot_through_enemy = true
	self.tti.can_shoot_through_shield = true
	self.tti.can_shoot_through_wall = true
	self.tti.stats = {
		damage = 172,
		spread = 16,
		recoil = 12,
		spread_moving = 24,
		zoom = 1,
		concealment = 16,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.tti.armor_piercing_chance = 1
	self.tti.stats_modifiers = {damage = 1}
	self.tti.panic_suppression_chance = 0.0
	self.siltstone.upgrade_blocks = nil
	self.siltstone.has_description = true
	self.siltstone.desc_id = "bm_ap_weapon_sc_desc"
	self.siltstone.CLIP_AMMO_MAX = 10
	self.siltstone.AMMO_MAX = 40
	self.siltstone.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.siltstone.fire_mode_data.fire_rate = 0.66666666666
	self.siltstone.spread.standing = 3.5
	self.siltstone.spread.crouching = 2.5
	self.siltstone.spread.steelsight = 2
	self.siltstone.spread.moving_standing = 4
	self.siltstone.spread.moving_crouching = 3
	self.siltstone.spread.moving_steelsight = 2
	self.siltstone.kick.standing = self.r870.kick.standing
	self.siltstone.kick.crouching = self.r870.kick.standing
	self.siltstone.kick.steelsight = self.r870.kick.standing
	self.siltstone.stats = {
		damage = 172,
		spread = 19,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 18,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 9,
		reload = 11
	}
	self.siltstone.stats_modifiers = nil
	self.siltstone.panic_suppression_chance = 0.0
	self.flint.AMMO_MAX = 150
	self.flint.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.flint.CLIP_AMMO_MAX = 30
	self.flint.fire_mode_data.fire_rate = 0.08571428571
	self.flint.auto.fire_rate = 0.08571428571
	self.flint.spread.standing = 3.5
	self.flint.spread.crouching = 2.5
	self.flint.spread.steelsight = 1
	self.flint.spread.moving_standing = 4
	self.flint.spread.moving_crouching = 3
	self.flint.spread.moving_steelsight = 2
	self.flint.kick.standing = self.new_m4.kick.standing
	self.flint.kick.crouching = self.new_m4.kick.standing
	self.flint.kick.steelsight = self.new_m4.kick.standing
	self.flint.stats = {
		damage = 41,
		spread = 14,
		recoil = 20,
		spread_moving = 5,
		zoom = 3,
		concealment = 17,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.flint.panic_suppression_chance = 0.0
	self.coal.AMMO_MAX = 180
	self.coal.CLIP_AMMO_MAX = 64
	self.coal.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.coal.fire_mode_data.fire_rate = 0.08823529411
	self.coal.auto.fire_rate = 0.08823529411
	self.coal.panic_suppression_chance = 0.1
	self.coal.spread.standing = 3.5
	self.coal.spread.crouching = 2.5
	self.coal.spread.steelsight = 1
	self.coal.spread.moving_standing = 4
	self.coal.spread.moving_crouching = 3
	self.coal.spread.moving_steelsight = 2
	self.coal.kick.standing = self.new_m4.kick.standing
	self.coal.kick.crouching = self.new_m4.kick.standing
	self.coal.kick.steelsight = self.new_m4.kick.standing
	self.coal.stats = {
		damage = 25,
		spread = 14,
		recoil = 21,
		spread_moving = 9,
		zoom = 3,
		concealment = 23,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.coal.panic_suppression_chance = 0.1

	--Custom weapons below--

	if self.mpx then

	self.mpx.tactical_reload = true
	self.mpx.AMMO_MAX = 150
	self.mpx.AMMO_PICKUP = self:_pickup_chance(150, 1)
	self.mpx.panic_suppression_chance = 0.1
	self.mpx.spread.standing = 3.5
	self.mpx.spread.crouching = 2.5
	self.mpx.spread.steelsight = 1
	self.mpx.spread.moving_standing = 4
	self.mpx.spread.moving_crouching = 3
	self.mpx.spread.moving_steelsight = 2
	self.mpx.kick.standing = self.new_m4.kick.standing
	self.mpx.kick.crouching = self.new_m4.kick.standing
	self.mpx.kick.steelsight = self.new_m4.kick.standing
	self.mpx.stats = {
		damage = 29,
		spread = 14,
		recoil = 21,
		spread_moving = 8,
		zoom = 3,
		concealment = 23,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}

	end

	if self.ppsh then

	self.ppsh.AMMO_MAX = 180
	self.ppsh.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.ppsh.panic_suppression_chance = 0.1
	self.ppsh.spread.standing = 3.5
	self.ppsh.spread.crouching = 2.5
	self.ppsh.spread.steelsight = 1
	self.ppsh.spread.moving_standing = 4
	self.ppsh.spread.moving_crouching = 3
	self.ppsh.spread.moving_steelsight = 2
	self.ppsh.kick.standing = self.new_m4.kick.standing
	self.ppsh.kick.crouching = self.new_m4.kick.standing
	self.ppsh.kick.steelsight = self.new_m4.kick.standing
	self.ppsh.stats = {
		damage = 25,
		spread = 15,
		recoil = 21,
		spread_moving = 9,
		zoom = 3,
		concealment = 23,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}

	end

	if self.toz34 then

	self.toz34.rays = 9
	self.toz34.AMMO_MAX = 40
	self.toz34.AMMO_PICKUP = self:_pickup_chance(40, 2)
	self.toz34.spread.standing = 3.5
	self.toz34.spread.crouching = 2.5
	self.toz34.spread.steelsight = 1
	self.toz34.spread.moving_standing = 4
	self.toz34.spread.moving_crouching = 3
	self.toz34.spread.moving_steelsight = 2
	self.toz34.damage_near = 900
	self.toz34.damage_far = 1800
	self.toz34.CAN_TOGGLE_FIREMODE = true
	self.toz34.auto = {}
	self.toz34.auto.fire_rate = 0.00
	self.toz34.fire_mode_data.fire_rate = 0.001
	self.toz34.sounds.fire_single = "b682_fire"
	self.toz34.sounds.fire_auto = "b682_fire"
	self.toz34.stats = {
		damage = 144,
		spread = 9,
		recoil = 17,
		spread_moving = 6,
		zoom = 3,
		concealment = 5,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.toz34.panic_suppression_chance = 0.0
	self.toz34.stats_modifiers = {damage = 1}

	end

	if self.toz66 then

	self.toz66.rays = 9
	self.toz66.spread.standing = 3.5
	self.toz66.spread.crouching = 2.5
	self.toz66.spread.steelsight = 1
	self.toz66.spread.moving_standing = 4
	self.toz66.spread.moving_crouching = 3
	self.toz66.spread.moving_steelsight = 2
	self.toz66.kick.standing = self.r870.kick.standing
	self.toz66.kick.crouching = self.r870.kick.standing
	self.toz66.kick.steelsight = self.r870.kick.standing
	self.toz66.AMMO_MAX = 30
	self.toz66.damage_near = 700
	self.toz66.damage_far = 1400
	self.toz66.AMMO_PICKUP = self:_pickup_chance(30, 2)
	self.toz66.sounds.fire_single = "huntsman_fire"
	self.toz66.sounds.fire_auto = "huntsman_fire"
	self.toz66.CAN_TOGGLE_FIREMODE = true
	self.toz66.auto = {}
	self.toz66.auto.fire_rate = 0.00
	self.toz66.fire_mode_data.fire_rate = 0.001
	self.toz66.stats = {
		damage = 144,
		spread = 7,
		recoil = 16,
		spread_moving = 6,
		zoom = 3,
		concealment = 7,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.toz66.panic_suppression_chance = 0.0
	self.toz66.stats_modifiers = {damage = 1}

	end

	if self.shatters_fury then

	self.shatters_fury.use_data.selection_index = 2
	self.shatters_fury.single.fire_rate = 0.6
	self.shatters_fury.fire_mode_data.fire_rate = 0.6
	self.shatters_fury.CLIP_AMMO_MAX = 5
	self.shatters_fury.AMMO_MAX = 30
	self.shatters_fury.AMMO_PICKUP = self:_pickup_chance(30, 1)
	self.shatters_fury.spread = {}
	self.shatters_fury.spread.standing = 3.5
	self.shatters_fury.spread.crouching = 2.5
	self.shatters_fury.spread.steelsight = 1
	self.shatters_fury.spread.moving_standing = 4
	self.shatters_fury.spread.moving_crouching = 3
	self.shatters_fury.spread.moving_steelsight = 2
	self.shatters_fury.kick.standing = self.r870.kick.standing
	self.shatters_fury.kick.crouching = self.r870.kick.standing
	self.shatters_fury.kick.steelsight = self.r870.kick.standing
	self.shatters_fury.stats = {
		damage = 141,
		spread = 17,
		recoil = 19,
		spread_moving = 9,
		zoom = 5,
		concealment = 23,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 1,
		reload = 11
	}
	self.shatters_fury.panic_suppression_chance = 0.0
	self.shatters_fury.has_description = true
	self.shatters_fury.desc_id = "bm_ap_weapon_sc_desc"
	self.shatters_fury.can_shoot_through_enemy = true
	self.shatters_fury.can_shoot_through_shield = true
	self.shatters_fury.can_shoot_through_wall = true
	self.shatters_fury.armor_piercing_chance = 1
	self.shatters_fury.stats_modifiers = {damage = 1}

	end

	if self.ak12 then

	self.ak12.tactical_reload = true
	self.ak12.AMMO_MAX = 150
	self.ak12.AMMO_PICKUP = self:_pickup_chance(150, 2)
	self.ak12.FIRE_MODE = "auto"
	self.ak12.fire_mode_data = {}
	self.ak12.fire_mode_data.fire_rate = 0.1
	self.ak12.CAN_TOGGLE_FIREMODE = true
	self.ak12.auto = {}
	self.ak12.auto.fire_rate = 0.1
	self.ak12.spread.standing = 3.5
	self.ak12.spread.crouching = 2.5
	self.ak12.spread.steelsight = 1
	self.ak12.spread.moving_standing = 4
	self.ak12.spread.moving_crouching = 3
	self.ak12.spread.moving_steelsight = 2
	self.ak12.kick.standing = self.new_m4.kick.standing
	self.ak12.kick.crouching = self.new_m4.kick.standing
	self.ak12.kick.steelsight = self.new_m4.kick.standing
	self.ak12.stats = {
		damage = 41,
		spread = 17,
		recoil = 19,
		spread_moving = 5,
		zoom = 3,
		concealment = 17,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.ak12.panic_suppression_chance = 0.0

	end

	if self.scar_m203 then

	self.scar_m203.fire_mode_data.fire_rate = 0.096
	self.scar_m203.AMMO_MAX = 120
	self.scar_m203.AMMO_PICKUP = self:_pickup_chance(120, 2)
	self.scar_m203.spread.standing = 3.5
	self.scar_m203.spread.crouching = 2.5
	self.scar_m203.spread.steelsight = 1
	self.scar_m203.spread.moving_standing = 4
	self.scar_m203.spread.moving_crouching = 3
	self.scar_m203.spread.moving_steelsight = 2
	self.scar_m203.kick.standing = self.new_m4.kick.standing
	self.scar_m203.kick.crouching = self.new_m4.kick.standing
	self.scar_m203.kick.steelsight = self.new_m4.kick.standing
	self.scar_m203.stats = {
		damage = 41,
		spread = 17,
		recoil = 19,
		spread_moving = 13,
		zoom = 3,
		concealment = 8,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 100,
		value = 4,
		reload = 11
	}
	self.scar_m203.panic_suppression_chance = 0.0

	end

end)

else

end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

WeaponTweakData.clone__create_table_structure = WeaponTweakData._create_table_structure
function WeaponTweakData:_create_table_structure()
	self:clone__create_table_structure()
	self.scar_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m14_sniper_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.peacemaker_npc = {
		usage = "raging_bull",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_akmsu_npc = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_c45_npc = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {}
	}
	self.ak47_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hk21_sc_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
end

WeaponTweakData.clone__precalculate_values = WeaponTweakData._precalculate_values
function WeaponTweakData:_precalculate_values()
	self:clone__precalculate_values()
	self.hk21_sc_npc.AMMO_MAX = self.hk21_sc_npc.CLIP_AMMO_MAX * self.hk21_sc_npc.NR_CLIPS_MAX
end

end