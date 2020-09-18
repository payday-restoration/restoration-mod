local job = Global.level_data and Global.level_data.level_id
local PICKUP = {
	SNIPER_HIGH_DAMAGE = 6,
	SHOTGUN_HIGH_CAPACITY = 4,
	AR_HIGH_CAPACITY = 2,
	OTHER = 1,
	SNIPER_LOW_DAMAGE = 5,
	AR_MED_CAPACITY = 3
}

function WeaponTweakData:_init_data_sentry_gun_npc()
	self.sentry_gun.categories = {}
	self.sentry_gun.name_id = "debug_sentry_gun"
	self.sentry_gun.DAMAGE = 2.8
	self.sentry_gun.SUPPRESSION = 1
	self.sentry_gun.SPREAD = 2
	self.sentry_gun.FIRE_RANGE = 2800
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
	self.beretta92_npc.DAMAGE = 1
	
	--Everything else--
	self.shepheard_crew.DAMAGE = 1.8
	self.erma_crew.DAMAGE = 1.8
	self.polymer_crew.DAMAGE = 1.8		
	
	self.akm_gold_crew.DAMAGE = 1.8
	self.amcar_crew.DAMAGE = 1.8
	self.ak74_crew.DAMAGE = 1.8
	self.m4_crew.DAMAGE = 1.8
	self.aug_crew.DAMAGE = 1.8
	self.akm_crew.DAMAGE = 1.8
	self.g36_crew.DAMAGE = 1.8
	self.m14_crew.DAMAGE = 1.8
	self.ak5_crew.DAMAGE = 1.8
	self.m16_crew.DAMAGE = 1.8
	self.s552_crew.DAMAGE = 1.8
	self.scar_crew.DAMAGE = 1.8
	self.fal_crew.DAMAGE = 1.8
	self.famas_crew.DAMAGE = 1.8
	self.galil_crew.DAMAGE = 1.8
	self.g3_crew.DAMAGE = 1.8
	self.l85a2_crew.DAMAGE = 1.8
	self.vhs_crew.DAMAGE = 1.8
	self.asval_crew.DAMAGE = 1.8
	self.tecci_crew.DAMAGE = 1.8
	self.contraband_crew.DAMAGE = 1.8
	self.flint_crew.DAMAGE = 1.8
	self.corgi_crew.DAMAGE = 1.8
	self.spas12_crew.DAMAGE = 4.5
	self.b682_crew.DAMAGE = 12
	self.r870_crew.DAMAGE = 12
	self.saiga_crew.DAMAGE = 4.5
	self.huntsman_crew.DAMAGE = 12
	self.ben_crew.DAMAGE = 4.5
	self.ksg_crew.DAMAGE = 12
	self.aa12_crew.DAMAGE = 4.5
	self.boot_crew.DAMAGE = 12
	self.model70_crew.DAMAGE = 15
	self.msr_crew.DAMAGE = 15
	self.r93_crew.DAMAGE = 15
	self.m95_crew.DAMAGE = 15
	self.mosin_crew.DAMAGE = 15
	self.winchester1874_crew.DAMAGE = 15
	self.wa2000_crew.DAMAGE = 15
	self.desertfox_crew.DAMAGE = 15
	self.tti_crew.DAMAGE = 15
	self.siltstone_crew.DAMAGE = 15
	self.r700_crew.DAMAGE = 15
	self.ching_crew.DAMAGE = 15
	self.par_crew.DAMAGE = 0.6
	self.rpk_crew.DAMAGE = 0.6
	self.m249_crew.DAMAGE = 0.6
	self.hk21_crew.DAMAGE = 0.6
	self.mg42_crew.DAMAGE = 0.6
	self.m60_crew.DAMAGE = 0.6
end

function WeaponTweakData:_set_hard()
	--Bot sidearm--
	self.beretta92_npc.DAMAGE = 1
	
	--Everything else--
	self.shepheard_crew.DAMAGE = 1.8
	self.erma_crew.DAMAGE = 1.8
	self.polymer_crew.DAMAGE = 1.8				
	
	self.akm_gold_crew.DAMAGE = 1.8
	self.amcar_crew.DAMAGE = 1.8
	self.ak74_crew.DAMAGE = 1.8
	self.m4_crew.DAMAGE = 1.8
	self.aug_crew.DAMAGE = 1.8
	self.akm_crew.DAMAGE = 1.8
	self.g36_crew.DAMAGE = 1.8
	self.m14_crew.DAMAGE = 1.8
	self.ak5_crew.DAMAGE = 1.8
	self.m16_crew.DAMAGE = 1.8
	self.s552_crew.DAMAGE = 1.8
	self.scar_crew.DAMAGE = 1.8
	self.fal_crew.DAMAGE = 1.8
	self.famas_crew.DAMAGE = 1.8
	self.galil_crew.DAMAGE = 1.8
	self.g3_crew.DAMAGE = 1.8
	self.l85a2_crew.DAMAGE = 1.8
	self.vhs_crew.DAMAGE = 1.8
	self.asval_crew.DAMAGE = 1.8
	self.tecci_crew.DAMAGE = 1.8
	self.contraband_crew.DAMAGE = 1.8
	self.flint_crew.DAMAGE = 1.8
	self.corgi_crew.DAMAGE = 1.8
	self.spas12_crew.DAMAGE = 4.5
	self.b682_crew.DAMAGE = 12
	self.r870_crew.DAMAGE = 12
	self.saiga_crew.DAMAGE = 4.5
	self.huntsman_crew.DAMAGE = 12
	self.ben_crew.DAMAGE = 4.5
	self.ksg_crew.DAMAGE = 12
	self.aa12_crew.DAMAGE = 4.5
	self.boot_crew.DAMAGE = 12
	self.model70_crew.DAMAGE = 15
	self.msr_crew.DAMAGE = 15
	self.r93_crew.DAMAGE = 15
	self.m95_crew.DAMAGE = 15
	self.mosin_crew.DAMAGE = 15
	self.winchester1874_crew.DAMAGE = 15
	self.wa2000_crew.DAMAGE = 15
	self.desertfox_crew.DAMAGE = 15
	self.tti_crew.DAMAGE = 15
	self.siltstone_crew.DAMAGE = 15
	self.r700_crew.DAMAGE = 15
	self.ching_crew.DAMAGE = 15
	self.par_crew.DAMAGE = 0.6
	self.rpk_crew.DAMAGE = 0.6
	self.m249_crew.DAMAGE = 0.6
	self.hk21_crew.DAMAGE = 0.6
	self.mg42_crew.DAMAGE = 0.6
	self.m60_crew.DAMAGE = 0.6
end

function WeaponTweakData:_set_overkill()
	--Bot sidearm--
	self.beretta92_npc.DAMAGE = 2
	
	--Everything else--
	self.shepheard_crew.DAMAGE = 2.8
	self.erma_crew.DAMAGE = 2.8
	self.polymer_crew.DAMAGE = 2.8				
	
	self.akm_gold_crew.DAMAGE = 2.8
	self.amcar_crew.DAMAGE = 2.8
	self.ak74_crew.DAMAGE = 2.8
	self.m4_crew.DAMAGE = 2.8
	self.aug_crew.DAMAGE = 2.8
	self.akm_crew.DAMAGE = 2.8
	self.g36_crew.DAMAGE = 2.8
	self.m14_crew.DAMAGE = 2.8
	self.ak5_crew.DAMAGE = 2.8
	self.m16_crew.DAMAGE = 2.8
	self.s552_crew.DAMAGE = 2.8
	self.scar_crew.DAMAGE = 2.8
	self.fal_crew.DAMAGE = 2.8
	self.famas_crew.DAMAGE = 2.8
	self.galil_crew.DAMAGE = 2.8
	self.g3_crew.DAMAGE = 2.8
	self.l85a2_crew.DAMAGE = 2.8
	self.vhs_crew.DAMAGE = 2.8
	self.asval_crew.DAMAGE = 2.8
	self.tecci_crew.DAMAGE = 2.8
	self.contraband_crew.DAMAGE = 2.8
	self.flint_crew.DAMAGE = 2.8
	self.corgi_crew.DAMAGE = 2.8
	self.spas12_crew.DAMAGE = 5.5
	self.b682_crew.DAMAGE = 13
	self.r870_crew.DAMAGE = 13
	self.saiga_crew.DAMAGE = 5.5
	self.huntsman_crew.DAMAGE = 13
	self.ben_crew.DAMAGE = 5.5
	self.ksg_crew.DAMAGE = 13
	self.aa12_crew.DAMAGE = 5.5
	self.boot_crew.DAMAGE = 13
	self.model70_crew.DAMAGE = 16
	self.msr_crew.DAMAGE = 16
	self.r93_crew.DAMAGE = 16
	self.m95_crew.DAMAGE = 16
	self.mosin_crew.DAMAGE = 16
	self.winchester1874_crew.DAMAGE = 16
	self.wa2000_crew.DAMAGE = 16
	self.desertfox_crew.DAMAGE = 16
	self.tti_crew.DAMAGE = 16
	self.siltstone_crew.DAMAGE = 16
	self.r700_crew.DAMAGE = 16
	self.ching_crew.DAMAGE = 16
	self.par_crew.DAMAGE = 1.6
	self.rpk_crew.DAMAGE = 1.6
	self.m249_crew.DAMAGE = 1.6
	self.hk21_crew.DAMAGE = 1.6
	self.mg42_crew.DAMAGE = 1.6
	self.m60_crew.DAMAGE = 1.6
end

function WeaponTweakData:_set_overkill_145()
	--Bot sidearm--
	self.beretta92_npc.DAMAGE = 3
	
	--Everything else--
	self.shepheard_crew.DAMAGE = 3.8
	self.erma_crew.DAMAGE = 3.8
	self.polymer_crew.DAMAGE = 3.8			
	
	self.akm_gold_crew.DAMAGE = 3.8
	self.amcar_crew.DAMAGE = 3.8
	self.ak74_crew.DAMAGE = 3.8
	self.m4_crew.DAMAGE = 3.8
	self.aug_crew.DAMAGE = 3.8
	self.akm_crew.DAMAGE = 3.8
	self.g36_crew.DAMAGE = 3.8
	self.m14_crew.DAMAGE = 3.8
	self.ak5_crew.DAMAGE = 3.8
	self.m16_crew.DAMAGE = 3.8
	self.s552_crew.DAMAGE = 3.8
	self.scar_crew.DAMAGE = 3.8
	self.fal_crew.DAMAGE = 3.8
	self.famas_crew.DAMAGE = 3.8
	self.galil_crew.DAMAGE = 3.8
	self.g3_crew.DAMAGE = 3.8
	self.l85a2_crew.DAMAGE = 3.8
	self.vhs_crew.DAMAGE = 3.8
	self.asval_crew.DAMAGE = 3.8
	self.tecci_crew.DAMAGE = 3.8
	self.contraband_crew.DAMAGE = 3.8
	self.flint_crew.DAMAGE = 3.8
	self.corgi_crew.DAMAGE = 3.8
	self.spas12_crew.DAMAGE = 6.5
	self.b682_crew.DAMAGE = 14
	self.r870_crew.DAMAGE = 14
	self.saiga_crew.DAMAGE = 6.5
	self.huntsman_crew.DAMAGE = 14
	self.ben_crew.DAMAGE = 6.5
	self.ksg_crew.DAMAGE = 14
	self.aa12_crew.DAMAGE = 6.5
	self.boot_crew.DAMAGE = 14
	self.model70_crew.DAMAGE = 17
	self.msr_crew.DAMAGE = 17
	self.r93_crew.DAMAGE = 17
	self.m95_crew.DAMAGE = 17
	self.mosin_crew.DAMAGE = 17
	self.winchester1874_crew.DAMAGE = 17
	self.wa2000_crew.DAMAGE = 17
	self.desertfox_crew.DAMAGE = 17
	self.tti_crew.DAMAGE = 17
	self.siltstone_crew.DAMAGE = 17
	self.r700_crew.DAMAGE = 17
	self.ching_crew.DAMAGE = 17
	self.par_crew.DAMAGE = 2.6
	self.rpk_crew.DAMAGE = 2.6
	self.m249_crew.DAMAGE = 2.6
	self.hk21_crew.DAMAGE = 2.6
	self.mg42_crew.DAMAGE = 2.6
	self.m60_crew.DAMAGE = 2.6
	
	if job == "chew" or job == "glace" then
		self.swat_van_turret_module.HEALTH_INIT = 675
		self.swat_van_turret_module.SHIELD_HEALTH_INIT = 90
		self.swat_van_turret_module.AUTO_REPAIR = false
	else
		self.swat_van_turret_module.HEALTH_INIT = 1350
		self.swat_van_turret_module.SHIELD_HEALTH_INIT = 180
		self.swat_van_turret_module.AUTO_REPAIR = true
	end
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
	self.ceiling_turret_module_longer_range.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}	
	self.aa_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}
	self.crate_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}			
	

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
	self.swat_van_turret_module.BAG_DMG_MUL = 10

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
	self.ceiling_turret_module_longer_range.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}
	self.aa_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}	
	self.crate_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2},
		{2000, 1},
		{3000, 1}
	}			
	
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
	
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module_longer_range.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.aa_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.crate_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	
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
	self.m14_sniper_npc.sniper_trail = true		
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
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module_no_idle.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}
	self.ceiling_turret_module_longer_range.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}	
	self.aa_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}	
	self.crate_turret_module.DAMAGE_MUL_RANGE = {
		{1000, 2.3},
		{1800, 2.1},
		{3000, 1.05}
	}			
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
	self.m14_sniper_npc.sniper_trail = true
end

function WeaponTweakData:_init_data_npc_melee()
	self.npc_melee = {}
	
	--Police Baton
	self.npc_melee.baton = {}
	self.npc_melee.baton.unit_name = Idstring("units/payday2/characters/ene_acc_baton/ene_acc_baton")
	self.npc_melee.baton.damage = 3
	self.npc_melee.baton.animation_param = "melee_baton"
	self.npc_melee.baton.player_blood_effect = true
	self.npc_melee.baton.armor_piercing = true
	
	--KABAR knife
	self.npc_melee.knife_1 = {}
	self.npc_melee.knife_1.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
	self.npc_melee.knife_1.damage = 3
	self.npc_melee.knife_1.animation_param = "melee_knife"
	self.npc_melee.knife_1.player_blood_effect = true
	self.npc_melee.knife_1.armor_piercing = true

	--Fists
	self.npc_melee.fists = {}
	self.npc_melee.fists.unit_name = nil
	self.npc_melee.fists.damage = 3
	self.npc_melee.fists.animation_param = "melee_fist"
	self.npc_melee.fists.player_blood_effect = true
	self.npc_melee.fists.armor_piercing = true
	
	--Dozer Fists
	self.npc_melee.fists_dozer = {}
	self.npc_melee.fists_dozer.unit_name = nil
	self.npc_melee.fists_dozer.damage = 3
	self.npc_melee.fists_dozer.animation_param = "melee_fist"
	self.npc_melee.fists_dozer.player_blood_effect = true
	self.npc_melee.fists_dozer.armor_piercing = true
	
	--Halloween Dozer Hammer
	self.npc_melee.helloween = {}
	self.npc_melee.helloween.unit_name = Idstring("units/pd2_halloween/weapons/wpn_mel_titan_hammer/wpn_mel_titan_hammer")
	self.npc_melee.helloween.damage = 3
	self.npc_melee.helloween.animation_param = "melee_fireaxe"
	self.npc_melee.helloween.player_blood_effect = true
	self.npc_melee.helloween.armor_piercing = true
	
	--Halloween Dozer Sword
	self.npc_melee.helloween_sword = {}
	self.npc_melee.helloween_sword.unit_name = Idstring("units/payday2/weapons/wpn_mel_hw_sword/wpn_mel_hw_sword")
	self.npc_melee.helloween_sword.damage = 5
	self.npc_melee.helloween_sword.animation_param = "melee_fireaxe"
	self.npc_melee.helloween_sword.player_blood_effect = true
	self.npc_melee.helloween_sword.armor_piercing = true
	
	--Summers' Buzzer
	self.npc_melee.buzzer_summer = {}
	self.npc_melee.buzzer_summer.unit_name = Idstring("units/pd2_dlc_vip/characters/ene_acc_buzzer_1/ene_acc_buzzer_1")
	self.npc_melee.buzzer_summer.damage = 0
	self.npc_melee.buzzer_summer.animation_param = "melee_freedom"
	self.npc_melee.buzzer_summer.player_blood_effect = true
	self.npc_melee.buzzer_summer.armor_piercing = true
	
	--Zombie Claws (unused)
	self.npc_melee.claws = {}
	self.npc_melee.claws.unit_name = nil
	self.npc_melee.claws.damage = 3
	self.npc_melee.claws.animation_param = "melee_fist"
	self.npc_melee.claws.player_blood_effect = true
	self.npc_melee.claws.armor_piercing = true	
	
	--Zombie Bite (unused)
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
	self.c45_npc.DAMAGE = 2
	self.c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c45_npc.CLIP_AMMO_MAX = 17
	self.c45_npc.NR_CLIPS_MAX = 5
	self.c45_npc.hold = "pistol"
	self.c45_npc.alert_size = 2400
	self.c45_npc.suppression = 2.4
	self.c45_npc.FIRE_MODE = "single"
	
	self.colt_1911_primary_npc = deep_clone(self.c45_npc)
	self.colt_1911_primary_npc.use_data.selection_index = 2
	self.colt_1911_primary_npc.CLIP_AMMO_MAX = 8
	self.colt_1911_primary_npc.sounds.prefix = "c45_fire"
	self.colt_1911_primary_npc.DAMAGE = 4.5		
end

function WeaponTweakData:_init_data_x_c45_npc()
	self.x_c45_npc.categories = {
		"akimbo",
		"pistol"
	}	
	self.x_c45_npc.sounds.prefix = "g17_npc"
	self.x_c45_npc.use_data.selection_index = 1
	self.x_c45_npc.DAMAGE = 2
	self.x_c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_c45_npc.CLIP_AMMO_MAX = 34
	self.x_c45_npc.NR_CLIPS_MAX = 5
	self.x_c45_npc.hold = "akimbo_pistol"
	self.x_c45_npc.alert_size = 2400
	self.x_c45_npc.suppression = 2.4
	self.x_c45_npc.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_beretta92_npc()
	self.beretta92_npc.categories = clone(self.b92fs.categories)
	self.beretta92_npc.sounds.prefix = "beretta_npc"
	self.beretta92_npc.use_data.selection_index = 1
	self.beretta92_npc.DAMAGE = 4
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
	self.raging_bull_npc.alert_size = 3200
	self.raging_bull_npc.suppression = 3.2
	self.raging_bull_npc.FIRE_MODE = "single"
	
	self.m1911_npc = deep_clone(self.raging_bull_npc)
	self.m1911_npc.use_data.selection_index = 2
	self.m1911_npc.CLIP_AMMO_MAX = 8
	self.m1911_npc.sounds.prefix = "c45_npc"
	self.m1911_npc.alert_size = 3000
	self.m1911_npc.suppression = 3		
	self.m1911_npc.DAMAGE = 4.5		
	
	self.peacemaker_npc = deep_clone(self.raging_bull_npc)
	self.peacemaker_npc.DAMAGE = 14.1
	self.peacemaker_npc.armor_piercing = true
	
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
	self.m4_npc.alert_size = 2600
	self.m4_npc.suppression = 2.6
	self.m4_npc.FIRE_MODE = "auto"
	
	self.m4_secondary_npc = deep_clone(self.m4_npc)
	self.m4_secondary_npc.use_data.selection_index = 1
	
	--AK 101 used by Reapers
	self.ak47_ass_npc = deep_clone(self.m4_npc)
	self.ak47_ass_npc.sounds.prefix = "ak74_npc"
	
	--Bravo Rifle
	self.swamp_npc = deep_clone(self.m4_npc)
	self.swamp_npc.sounds.prefix = "m16_npc"	
	self.swamp_npc.CLIP_AMMO_MAX = 60
	
	--HK417 (unused?)
	self.sg417_npc = deep_clone(self.m4_npc)
	self.sg417_npc.sounds.prefix = "contraband_npc"
	
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
	
	--M4/203 used by Grenadier
	self.m4_boom_npc = deep_clone(self.m4_npc)
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
	self.m4_yellow_npc.alert_size = 2600
	self.m4_yellow_npc.suppression = 2.6
	self.m4_yellow_npc.FIRE_MODE = "auto"
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
	self.ak47_npc.alert_size = 2800
	self.ak47_npc.suppression = 2.8
	self.ak47_npc.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_m14_sniper_npc()
	--MSR Rifle
	self.m14_sniper_npc.categories = {"snp"}
	self.m14_sniper_npc.sounds.prefix = "sniper_npc"
	self.m14_sniper_npc.use_data.selection_index = 2
	self.m14_sniper_npc.DAMAGE = 11.25
	self.m14_sniper_npc.can_shoot_through_enemy = true
	self.m14_sniper_npc.can_shoot_through_shield = true
	self.m14_sniper_npc.can_shoot_through_wall = true
	self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_sniper_npc.CLIP_AMMO_MAX = 10
	self.m14_sniper_npc.NR_CLIPS_MAX = 8
	self.m14_sniper_npc.hold = "rifle"
	self.m14_sniper_npc.alert_size = 3400
	self.m14_sniper_npc.suppression = 3.4
	self.m14_sniper_npc.armor_piercing = true
	self.m14_sniper_npc.FIRE_MODE = "single"
	
	--Reaper variant
	self.svd_snp_npc = deep_clone(self.m14_sniper_npc)
	
	--Gangster variant
	self.svdsil_snp_npc = deep_clone(self.m14_sniper_npc)
	self.svdsil_snp_npc.has_suppressor = "suppressed_a"
	
	--Zeal Sniper variant (unused)
	self.heavy_snp_npc = deep_clone(self.m14_sniper_npc)
	self.heavy_snp_npc.sounds.prefix = "zsniper_npc"
end

function WeaponTweakData:_init_data_r870_npc()
	self.r870_npc.categories = clone(self.r870.categories)
	self.r870_npc.sounds.prefix = "remington_npc"
	self.r870_npc.use_data.selection_index = 2
	self.r870_npc.DAMAGE = 6
	self.r870_npc.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.r870_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_npc.CLIP_AMMO_MAX = 8
	self.r870_npc.NR_CLIPS_MAX = 4
	self.r870_npc.hold = "rifle"
	self.r870_npc.alert_size = 3200
	self.r870_npc.suppression = 3.2
	self.r870_npc.is_shotgun = true
	self.r870_npc.rays = 6
	self.r870_npc.spread = 3
	self.r870_npc.FIRE_MODE = "single"
	
	self.benelli_npc = deep_clone(self.r870_npc)
	self.benelli_npc.sounds.prefix = "benelli_m4_npc"
	self.benelli_npc.DAMAGE = 4.5
	self.benelli_npc.CLIP_AMMO_MAX = 10
	self.benelli_npc.alert_size = 3000
	self.benelli_npc.suppression = 3	
	
	self.bayou_npc = deep_clone(self.r870_npc)
	self.bayou_npc.sounds.prefix = "spas_npc"
	self.bayou_npc.DAMAGE = 4.5
	self.bayou_npc.CLIP_AMMO_MAX = 10
	self.bayou_npc.alert_size = 3000
	self.bayou_npc.suppression = 3		
	
	self.r870_taser_npc = deep_clone(self.r870_npc)
	self.r870_taser_npc.sounds.prefix = "keltec_npc"
	self.r870_taser_npc.DAMAGE = 5
	self.r870_taser_npc.CLIP_AMMO_MAX = 8
end

function WeaponTweakData:_init_data_mossberg_npc()
	self.mossberg_npc.categories = {"shotgun"}
	self.mossberg_npc.sounds.prefix = "remington_npc"
	self.mossberg_npc.use_data.selection_index = 2
	self.mossberg_npc.DAMAGE = 9
	self.mossberg_npc.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.mossberg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.mossberg_npc.CLIP_AMMO_MAX = 2
	self.mossberg_npc.NR_CLIPS_MAX = 6
	self.mossberg_npc.hold = "rifle"
	self.mossberg_npc.alert_size = 3600
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
	self.mp5_npc.DAMAGE = 2
	self.mp5_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp5_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp5_npc.CLIP_AMMO_MAX = 30
	self.mp5_npc.NR_CLIPS_MAX = 5
	self.mp5_npc.auto.fire_rate = 0.075
	self.mp5_npc.hold = "rifle"
	self.mp5_npc.alert_size = 2400
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
	self.ump_npc.alert_size = 2800
	self.ump_npc.suppression = 2.8
	
	--Krinkov(ASVAL atm waiting on jarey's wepom), clone of UMP
	self.asval_smg_npc = deep_clone(self.mp5_npc)		
	self.asval_smg_npc.DAMAGE = 3
	self.asval_smg_npc.auto.fire_rate = 0.083
	self.asval_smg_npc.CLIP_AMMO_MAX = 25
	self.asval_smg_npc.suppression = 2.8		
	self.asval_smg_npc.alert_size = 2800
	self.asval_smg_npc.sounds.prefix = "akmsu_npc"
	
	--Tatonka
	self.akmsu_smg_npc = deep_clone(self.ump_npc)
	self.akmsu_smg_npc.sounds.prefix = "coal_npc"
	
	--Autumn MPX
	self.mpx_npc = deep_clone(self.mp5_tactical_npc)
	self.mpx_npc.auto.fire_rate = 0.07058823529
	self.mpx_npc.DAMAGE = 3.5
end

function WeaponTweakData:_init_data_smoke_npc()
	self.smoke_npc.categories = clone(self.new_mp5.categories)
	self.smoke_npc.sounds.prefix = "mp5_npc"
	self.smoke_npc.use_data.selection_index = 1
	self.smoke_npc.DAMAGE = 2
	self.smoke_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.smoke_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.smoke_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.smoke_npc.CLIP_AMMO_MAX = 30
	self.smoke_npc.NR_CLIPS_MAX = 5
	self.smoke_npc.auto.fire_rate = 0.075
	self.smoke_npc.hold = "rifle"
	self.smoke_npc.alert_size = 2400
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
	self.mac11_npc.hold = "pistol"
	self.mac11_npc.alert_size = 2800
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
	self.g36_npc.alert_size = 2600
	self.g36_npc.suppression = 2.6
	self.g36_npc.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_mp9_npc()
	--NPC MP9
	self.mp9_npc.categories = clone(self.mp9.categories)
	self.mp9_npc.sounds.prefix = "mp9_npc"
	self.mp9_npc.use_data.selection_index = 1
	self.mp9_npc.DAMAGE = 1.8
	self.mp9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9_npc.CLIP_AMMO_MAX = 20
	self.mp9_npc.NR_CLIPS_MAX = 5
	self.mp9_npc.auto.fire_rate = 0.06666666666
	self.mp9_npc.hold = "pistol"
	self.mp9_npc.alert_size = 2200
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
	self.saiga_npc.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.saiga_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_npc.auto.fire_rate = 0.1
	self.saiga_npc.CLIP_AMMO_MAX = 20
	self.saiga_npc.NR_CLIPS_MAX = 4
	self.saiga_npc.hold = "rifle"
	self.saiga_npc.alert_size = 3200
	self.saiga_npc.suppression = 3.2
	self.saiga_npc.is_shotgun = true
	self.saiga_npc.rays = 6
	self.saiga_npc.spread = 3
	self.saiga_npc.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_swat_van_turret_module_npc()
	self.swat_van_turret_module.name_id = "debug_sentry_gun"
	self.swat_van_turret_module.DAMAGE = 1.8
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
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
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
	self.crate_turret_module.DAMAGE = 1.6
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
	self.crate_turret_module.AUTO_REPAIR_DURATION = 30
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
	self.ceiling_turret_module.DAMAGE = 1.6
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
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 30
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
	self.aa_turret_module.DAMAGE = 1.6
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
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
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
	self.s552_npc.alert_size = 2600
	self.s552_npc.suppression = 2.6
	self.s552_npc.FIRE_MODE = "auto"
	self.s552_npc.has_suppressor = "suppressed_c"
end	

function WeaponTweakData:_init_data_scar_npc()
	--M14/Socom 16
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
	self.scar_npc.alert_size = 3400
	self.scar_npc.suppression = 2.8
	self.scar_npc.FIRE_MODE = "single"
	self.scar_npc.titan_trail = true
	self.scar_secondary_npc = deep_clone(self.scar_npc)
	self.scar_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_m249_npc()
	--M249
	self.m249_npc.categories = clone(self.m249.categories)
	self.m249_npc.sounds.prefix = "m249_npc"
	self.m249_npc.use_data.selection_index = 2
	self.m249_npc.DAMAGE = 2.7
	self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_npc.CLIP_AMMO_MAX = 200
	self.m249_npc.NR_CLIPS_MAX = 2
	self.m249_npc.auto.fire_rate = 0.075
	self.m249_npc.hold = "rifle"
	self.m249_npc.alert_size = 2600
	self.m249_npc.suppression = 2
	self.m249_npc.FIRE_MODE = "auto"
	
	--RPK
	self.rpk_lmg_npc = deep_clone(self.m249_npc)
	self.rpk_lmg_npc.sounds.prefix = "rpk_npc"		
	
	--HK21
	self.hk21_sc_npc = deep_clone(self.m249_npc)
	self.hk21_sc_npc.sounds.prefix = "hk23e_npc"
	self.hk21_sc_npc.use_data.selection_index = 2
	self.hk21_sc_npc.DAMAGE = 3
	self.hk21_sc_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_sc_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_sc_npc.CLIP_AMMO_MAX = 150
	self.hk21_sc_npc.NR_CLIPS_MAX = 5
	self.hk21_sc_npc.auto.fire_rate = 0.075
	self.hk21_sc_npc.hold = "rifle"
	self.hk21_sc_npc.alert_size = 2800
	self.hk21_sc_npc.suppression = 2.4
	self.hk21_sc_npc.usage = "is_lmg"
	
	--HK23
	self.hk23_sc_npc = deep_clone(self.hk21_sc_npc)	
	self.hk23_sc_npc.DAMAGE = 2
	self.hk23_sc_npc.auto.fire_rate = 0.08
	self.hk23_sc_npc.CLIP_AMMO_MAX = 50	
	
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
	self.contraband_npc.alert_size = 2600
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
	self.contraband_m203_npc.alert_size = 2800
	self.contraband_m203_npc.suppression = 1
end

function WeaponTweakData:_init_data_mini_npc()
	self.mini_npc.categories = clone(self.m134.categories)
	self.mini_npc.sounds.prefix = "minigun_npc"
	self.mini_npc.use_data.selection_index = 2
	self.mini_npc.DAMAGE = 2.2
	self.mini_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.mini_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.mini_npc.CLIP_AMMO_MAX = 300
	self.mini_npc.NR_CLIPS_MAX = 2
	self.mini_npc.auto.fire_rate = 0.03
	self.mini_npc.hold = "rifle"
	self.mini_npc.alert_size = 2600
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
	self.x_mini_npc.DAMAGE = 2.2
	self.x_mini_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.x_mini_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.x_mini_npc.CLIP_AMMO_MAX = 600
	self.x_mini_npc.NR_CLIPS_MAX = 2
	self.x_mini_npc.auto.fire_rate = 0.01
	self.x_mini_npc.hold = "akimbo_pistol"
	self.x_mini_npc.alert_size = 2600
	self.x_mini_npc.suppression = 2
	self.x_mini_npc.FIRE_MODE = "auto"		
end

--Crew weapons but not really--
function WeaponTweakData:_init_data_flamethrower_mk2_crew()
	self.flamethrower_mk2_crew.categories = clone(self.flamethrower_mk2.categories)
	self.flamethrower_mk2_crew.sounds.prefix = "flamethrower_npc"
	self.flamethrower_mk2_crew.sounds.fire = "flamethrower_npc_fire"
	self.flamethrower_mk2_crew.sounds.stop_fire = "flamethrower_npc_fire_stop"
	self.flamethrower_mk2_crew.use_data.selection_index = 2
	self.flamethrower_mk2_crew.DAMAGE = 3.7
	self.flamethrower_mk2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.flamethrower_mk2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.flamethrower_mk2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.flamethrower_mk2_crew.CLIP_AMMO_MAX = 60
	self.flamethrower_mk2_crew.NR_CLIPS_MAX = 4
	self.flamethrower_mk2_crew.pull_magazine_during_reload = "large_metal"
	self.flamethrower_mk2_crew.hold = {"bullpup", "rifle"}
	self.flamethrower_mk2_crew.auto.fire_rate = 0.1
	self.flamethrower_mk2_crew.hud_icon = "rifle"
	self.flamethrower_mk2_crew.alert_size = 3500
	self.flamethrower_mk2_crew.suppression = 3.1
	self.flamethrower_mk2_crew.FIRE_MODE = "auto"
	
	self.flamethrower_mk2_flamer = {}
	self.flamethrower_mk2_flamer = deep_clone(self.flamethrower_mk2_crew)
	self.flamethrower_mk2_flamer.categories = clone(self.flamethrower_mk2.categories)
	self.flamethrower_mk2_flamer.sounds.prefix = "flamethrower_npc"
	self.flamethrower_mk2_flamer.sounds.fire = "flamethrower_npc_fire"
	self.flamethrower_mk2_flamer.sounds.stop_fire = "flamethrower_npc_fire_stop"
	self.flamethrower_mk2_flamer.CLIP_AMMO_MAX = 60
	self.flamethrower_mk2_flamer.NR_CLIPS_MAX = 4
	self.flamethrower_mk2_flamer.FIRE_RANGE = 1400
	self.flamethrower_mk2_flamer.DAMAGE = 3.7
	self.flamethrower_mk2_flamer.fire_dot_data = {
		dot_trigger_chance = 0,
		dot_damage = 0,
		dot_length = 0,
		dot_trigger_max_distance = 0,
		dot_tick_period = 0
	}
	self.flamethrower_mk2_flamer.FIRE_MODE = "auto"
	self.flamethrower_mk2_flamer.fire_rate = 0.1
	self.flamethrower_mk2_flamer.hold = {
		"bullpup",
		"rifle"
	}
	self.flamethrower_mk2_flamer.alert_size = 3500
	self.flamethrower_mk2_flamer.suppression = 3.1
	self.flamethrower_mk2_flamer.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.flamethrower_mk2_flamer.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.flamethrower_mk2_flamer.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.flamethrower_mk2_flamer.pull_magazine_during_reload = "large_metal"
	self.flamethrower_mk2_flamer.usage = "flamethrower"
	self.flamethrower_mk2_flamer.anim_usage = "is_bullpup"			
end

--Lotta crew guns in here now--
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
	self.raging_bull_crew.alert_size = 5000
	self.raging_bull_crew.suppression = 1.8
	self.raging_bull_crew.FIRE_MODE = "single"
	self.raging_bull_primary_crew = deep_clone(self.raging_bull_crew)
	self.raging_bull_primary_crew.use_data.selection_index = 2
end	

function WeaponTweakData:_init_data_shepheard_crew()
	self.shepheard_crew.categories = clone(self.shepheard.categories)
	self.shepheard_crew.sounds.prefix = "shepheard_npc"
	self.shepheard_crew.use_data.selection_index = 2
	self.shepheard_crew.DAMAGE = 4.8
	self.shepheard_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.shepheard_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.shepheard_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.shepheard_crew.CLIP_AMMO_MAX = 60
	self.shepheard_crew.NR_CLIPS_MAX = 5
	self.shepheard_crew.auto.fire_rate = 0.08571428571
	self.shepheard_crew.hold = "rifle"
	self.shepheard_crew.pull_magazine_during_reload = "smg"
	self.shepheard_crew.alert_size = 5000
	self.shepheard_crew.suppression = 2.2
	self.shepheard_crew.FIRE_MODE = "auto"
end	

function WeaponTweakData:_init_data_erma_crew()
	self.erma_crew.categories = clone(self.erma.categories)
	self.erma_crew.sounds.prefix = "erma_npc"
	self.erma_crew.use_data.selection_index = 2
	self.erma_crew.DAMAGE = 4.8
	self.erma_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.erma_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.erma_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.erma_crew.CLIP_AMMO_MAX = 60
	self.erma_crew.NR_CLIPS_MAX = 5
	self.erma_crew.reload = "rifle"
	self.erma_crew.pull_magazine_during_reload = "smg"
	self.erma_crew.auto.fire_rate = 0.08571428571
	self.erma_crew.hold = "rifle"
	self.erma_crew.alert_size = 5000
	self.erma_crew.suppression = 2.2
	self.erma_crew.FIRE_MODE = "auto"
end	

function WeaponTweakData:_init_data_polymer_crew()
	self.polymer_crew.categories = clone(self.polymer.categories)
	self.polymer_crew.sounds.prefix = "polymer_npc"
	self.polymer_crew.use_data.selection_index = 2
	self.polymer_crew.DAMAGE = 4.8
	self.polymer_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.polymer_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.polymer_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.polymer_crew.CLIP_AMMO_MAX = 60
	self.polymer_crew.NR_CLIPS_MAX = 5
	self.polymer_crew.reload = "rifle"
	self.polymer_crew.pull_magazine_during_reload = "smg"
	self.polymer_crew.auto.fire_rate = 0.08571428571
	self.polymer_crew.hold = {
		"bullpup",
		"rifle"
	}
	self.polymer_crew.alert_size = 5000
	self.polymer_crew.suppression = 2.2
	self.polymer_crew.FIRE_MODE = "auto"
end
	
function WeaponTweakData:_init_data_akm_gold_crew()
	self.akm_gold_crew.categories = clone(self.akm_gold.categories)
	self.akm_gold_crew.sounds.prefix = "akm_npc"
	self.akm_gold_crew.use_data.selection_index = 2
	self.akm_gold_crew.DAMAGE = 4.8
	self.akm_gold_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_gold_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_gold_crew.CLIP_AMMO_MAX = 60
	self.akm_gold_crew.NR_CLIPS_MAX = 5
	self.akm_gold_crew.pull_magazine_during_reload = "rifle"
	self.akm_gold_crew.auto.fire_rate = 0.08571428571
	self.akm_gold_crew.hold = "rifle"
	self.akm_gold_crew.alert_size = 5000
	self.akm_gold_crew.suppression = 2.2
	self.akm_gold_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_amcar_crew()
	self.amcar_crew.categories = clone(self.amcar.categories)
	self.amcar_crew.sounds.prefix = "amcar_npc"
	self.amcar_crew.use_data.selection_index = 2
	self.amcar_crew.DAMAGE = 4.8
	self.amcar_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.amcar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.amcar_crew.CLIP_AMMO_MAX = 60
	self.amcar_crew.NR_CLIPS_MAX = 5
	self.amcar_crew.pull_magazine_during_reload = "rifle"
	self.amcar_crew.auto.fire_rate = 0.08571428571
	self.amcar_crew.hold = "rifle"
	self.amcar_crew.alert_size = 5000
	self.amcar_crew.suppression = 2.2
	self.amcar_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_ak74_crew()
	self.ak74_crew.categories = clone(self.ak74.categories)
	self.ak74_crew.sounds.prefix = "ak74_npc"
	self.ak74_crew.use_data.selection_index = 2
	self.ak74_crew.DAMAGE = 4.8
	self.ak74_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak74_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak74_crew.CLIP_AMMO_MAX = 60
	self.ak74_crew.NR_CLIPS_MAX = 5
	self.ak74_crew.pull_magazine_during_reload = "rifle"
	self.ak74_crew.auto.fire_rate = 0.08571428571
	self.ak74_crew.hold = "rifle"
	self.ak74_crew.alert_size = 5000
	self.ak74_crew.suppression = 2.2
	self.ak74_crew.FIRE_MODE = "auto"
	self.ak74_secondary_crew = deep_clone(self.ak74_crew)
	self.ak74_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_m4_crew()
	self.m4_crew.categories = clone(self.new_m4.categories)
	self.m4_crew.sounds.prefix = "m4_npc"
	self.m4_crew.use_data.selection_index = 2
	self.m4_crew.DAMAGE = 4.8
	self.m4_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.m4_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m4_crew.CLIP_AMMO_MAX = 60
	self.m4_crew.NR_CLIPS_MAX = 5
	self.m4_crew.auto.fire_rate = 0.08571428571
	self.m4_crew.hold = "rifle"
	self.m4_crew.alert_size = 5000
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
	self.aug_crew.DAMAGE = 4.8
	self.aug_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.aug_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.aug_crew.CLIP_AMMO_MAX = 60
	self.aug_crew.NR_CLIPS_MAX = 5
	self.aug_crew.auto.fire_rate = 0.08571428571
	self.aug_crew.pull_magazine_during_reload = "rifle"
	self.aug_crew.hold = {"bullpup", "rifle"}
	self.aug_crew.alert_size = 5000
	self.aug_crew.suppression = 2.2
	self.aug_crew.FIRE_MODE = "auto"
	self.aug_secondary_crew = deep_clone(self.aug_crew)
	self.aug_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_akm_crew()
	self.akm_crew.categories = clone(self.akm.categories)
	self.akm_crew.sounds.prefix = "akm_npc"
	self.akm_crew.use_data.selection_index = 2
	self.akm_crew.DAMAGE = 4.8
	self.akm_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_crew.CLIP_AMMO_MAX = 60
	self.akm_crew.NR_CLIPS_MAX = 5
	self.akm_crew.pull_magazine_during_reload = "rifle"
	self.akm_crew.auto.fire_rate = 0.08571428571
	self.akm_crew.hold = "rifle"
	self.akm_crew.alert_size = 5000
	self.akm_crew.suppression = 2.2
	self.akm_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_g36_crew()
	self.g36_crew.categories = clone(self.g36.categories)
	self.g36_crew.sounds.prefix = "g36_npc"
	self.g36_crew.use_data.selection_index = 2
	self.g36_crew.DAMAGE = 4.8
	self.g36_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g36_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36_crew.CLIP_AMMO_MAX = 60
	self.g36_crew.NR_CLIPS_MAX = 5
	self.g36_crew.auto.fire_rate = 0.08571428571
	self.g36_crew.pull_magazine_during_reload = "rifle"
	self.g36_crew.hold = "rifle"
	self.g36_crew.alert_size = 5000
	self.g36_crew.suppression = 2.2
	self.g36_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_m14_crew()
	self.m14_crew.categories = clone(self.new_m14.categories)
	self.m14_crew.sounds.prefix = "m14_npc"
	self.m14_crew.use_data.selection_index = 2
	self.m14_crew.DAMAGE = 4.8
	self.m14_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_crew.CLIP_AMMO_MAX = 60
	self.m14_crew.NR_CLIPS_MAX = 8
	self.m14_crew.pull_magazine_during_reload = "rifle"
	self.m14_crew.auto.fire_rate = 0.08571428571
	self.m14_crew.hold = "rifle"
	self.m14_crew.alert_size = 5000
	self.m14_crew.suppression = 2.2
	self.m14_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_ak5_crew()
	self.ak5_crew.categories = clone(self.ak5.categories)
	self.ak5_crew.sounds.prefix = "ak5_npc"
	self.ak5_crew.use_data.selection_index = 2
	self.ak5_crew.DAMAGE = 4.8
	self.ak5_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.ak5_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak5_crew.CLIP_AMMO_MAX = 60
	self.ak5_crew.NR_CLIPS_MAX = 5
	self.ak5_crew.pull_magazine_during_reload = "rifle"
	self.ak5_crew.auto.fire_rate = 0.08571428571
	self.ak5_crew.hold = "rifle"
	self.ak5_crew.alert_size = 5000
	self.ak5_crew.suppression = 2.2
	self.ak5_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_m16_crew()
	self.m16_crew.categories = clone(self.m16.categories)
	self.m16_crew.sounds.prefix = "m16_npc"
	self.m16_crew.use_data.selection_index = 2
	self.m16_crew.DAMAGE = 4.8
	self.m16_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m16_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m16_crew.CLIP_AMMO_MAX = 60
	self.m16_crew.NR_CLIPS_MAX = 8
	self.m16_crew.auto.fire_rate = 0.08571428571
	self.m16_crew.hold = "rifle"
	self.m16_crew.alert_size = 5000
	self.m16_crew.suppression = 2.2
	self.m16_crew.pull_magazine_during_reload = "rifle"
	self.m16_crew.FIRE_MODE = "auto"
	
	--Summers M16
	self.m16_crew_summers = deep_clone(self.m16_crew)
	self.m16_crew_summers.categories = clone(self.m16.categories)
	self.m16_crew_summers.sounds.prefix = "m16_npc"
	self.m16_crew_summers.use_data.selection_index = 2
	self.m16_crew_summers.DAMAGE = 6
	self.m16_crew_summers.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m16_crew_summers.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m16_crew_summers.CLIP_AMMO_MAX = 30
	self.m16_crew_summers.NR_CLIPS_MAX = 8
	self.m16_crew_summers.auto.fire_rate = 0.08571428571
	self.m16_crew_summers.hold = "rifle"
	self.m16_crew_summers.alert_size = 5000
	self.m16_crew_summers.suppression = 2.8
	self.m16_crew_summers.pull_magazine_during_reload = "rifle"
	self.m16_crew_summers.FIRE_MODE = "auto"		
end

function WeaponTweakData:_init_data_s552_crew()
	self.s552_crew.categories = clone(self.s552.categories)
	self.s552_crew.sounds.prefix = "sig552_npc"
	self.s552_crew.use_data.selection_index = 2
	self.s552_crew.DAMAGE = 4.8
	self.s552_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.s552_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.s552_crew.CLIP_AMMO_MAX = 60
	self.s552_crew.NR_CLIPS_MAX = 5
	self.s552_crew.pull_magazine_during_reload = "rifle"
	self.s552_crew.auto.fire_rate = 0.08571428571
	self.s552_crew.hold = "rifle"
	self.s552_crew.alert_size = 5000
	self.s552_crew.suppression = 2.2
	self.s552_crew.FIRE_MODE = "auto"
	self.s552_secondary_crew = deep_clone(self.s552_crew)
	self.s552_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_scar_crew()
	self.scar_crew.categories = clone(self.scar.categories)
	self.scar_crew.sounds.prefix = "scar_npc"
	self.scar_crew.use_data.selection_index = 2
	self.scar_crew.DAMAGE = 4.8
	self.scar_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.scar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar_crew.CLIP_AMMO_MAX = 60
	self.scar_crew.NR_CLIPS_MAX = 5
	self.scar_crew.pull_magazine_during_reload = "rifle"
	self.scar_crew.auto.fire_rate = 0.08571428571
	self.scar_crew.hold = "rifle"
	self.scar_crew.alert_size = 5000
	self.scar_crew.suppression = 2.2
	self.scar_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_fal_crew()
	self.fal_crew.categories = clone(self.fal.categories)
	self.fal_crew.sounds.prefix = "fn_fal_npc"
	self.fal_crew.use_data.selection_index = 2
	self.fal_crew.DAMAGE = 4.8
	self.fal_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.fal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.fal_crew.CLIP_AMMO_MAX = 60
	self.fal_crew.NR_CLIPS_MAX = 5
	self.fal_crew.pull_magazine_during_reload = "rifle"
	self.fal_crew.auto.fire_rate = 0.08571428571
	self.fal_crew.hold = "rifle"
	self.fal_crew.alert_size = 5000
	self.fal_crew.suppression = 2.2
	self.fal_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_famas_crew()
	self.famas_crew.categories = clone(self.famas.categories)
	self.famas_crew.sounds.prefix = "famas_npc"
	self.famas_crew.use_data.selection_index = 2
	self.famas_crew.DAMAGE = 4.8
	self.famas_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.famas_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.famas_crew.CLIP_AMMO_MAX = 60
	self.famas_crew.NR_CLIPS_MAX = 5
	self.famas_crew.pull_magazine_during_reload = "rifle"
	self.famas_crew.auto.fire_rate = 0.08571428571
	self.famas_crew.hold = {"bullpup", "rifle"}
	self.famas_crew.alert_size = 5000
	self.famas_crew.suppression = 2.2
	self.famas_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_galil_crew()
	self.galil_crew.categories = clone(self.galil.categories)
	self.galil_crew.sounds.prefix = "galil_npc"
	self.galil_crew.use_data.selection_index = 2
	self.galil_crew.DAMAGE = 4.8
	self.galil_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.galil_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.galil_crew.CLIP_AMMO_MAX = 60
	self.galil_crew.NR_CLIPS_MAX = 5
	self.galil_crew.pull_magazine_during_reload = "rifle"
	self.galil_crew.auto.fire_rate = 0.08571428571
	self.galil_crew.hold = "rifle"
	self.galil_crew.alert_size = 5000
	self.galil_crew.suppression = 2.2
	self.galil_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_g3_crew()
	self.g3_crew.categories = clone(self.g3.categories)
	self.g3_crew.sounds.prefix = "g3_npc"
	self.g3_crew.use_data.selection_index = 2
	self.g3_crew.DAMAGE = 4.8
	self.g3_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.g3_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g3_crew.CLIP_AMMO_MAX = 60
	self.g3_crew.NR_CLIPS_MAX = 5
	self.g3_crew.pull_magazine_during_reload = "rifle"
	self.g3_crew.auto.fire_rate = 0.08571428571
	self.g3_crew.hold = "rifle"
	self.g3_crew.alert_size = 5000
	self.g3_crew.suppression = 2.2
	self.g3_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_l85a2_crew()
	self.l85a2_crew.categories = clone(self.l85a2.categories)
	self.l85a2_crew.sounds.prefix = "l85_npc"
	self.l85a2_crew.use_data.selection_index = 2
	self.l85a2_crew.DAMAGE = 4.8
	self.l85a2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.l85a2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.l85a2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.l85a2_crew.CLIP_AMMO_MAX = 60
	self.l85a2_crew.NR_CLIPS_MAX = 5
	self.l85a2_crew.pull_magazine_during_reload = "rifle"
	self.l85a2_crew.auto.fire_rate = 0.08571428571
	self.l85a2_crew.hold = "rifle"
	self.l85a2_crew.reload = "bullpup"
	self.l85a2_crew.alert_size = 5000
	self.l85a2_crew.suppression = 2.2
	self.l85a2_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_vhs_crew()
	self.vhs_crew.categories = clone(self.vhs.categories)
	self.vhs_crew.sounds.prefix = "vhs_npc"
	self.vhs_crew.use_data.selection_index = 2
	self.vhs_crew.DAMAGE = 4.8
	self.vhs_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.vhs_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.vhs_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.vhs_crew.CLIP_AMMO_MAX = 60
	self.vhs_crew.NR_CLIPS_MAX = 5
	self.vhs_crew.pull_magazine_during_reload = "rifle"
	self.vhs_crew.auto.fire_rate = 0.08571428571
	self.vhs_crew.hold = {"bullpup", "rifle"}
	self.vhs_crew.alert_size = 5000
	self.vhs_crew.suppression = 2.2
	self.vhs_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_asval_crew()
	self.asval_crew.categories = clone(self.asval.categories)
	self.asval_crew.sounds.prefix = "val_npc"
	self.asval_crew.use_data.selection_index = 2
	self.asval_crew.DAMAGE = 4.8
	self.asval_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.asval_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.asval_crew.CLIP_AMMO_MAX = 60
	self.asval_crew.NR_CLIPS_MAX = 5
	self.asval_crew.pull_magazine_during_reload = "rifle"
	self.asval_crew.auto.fire_rate = 0.08571428571
	self.asval_crew.hold = "rifle"
	self.asval_crew.alert_size = 5000
	self.asval_crew.suppression = 3.4
	self.asval_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_tecci_crew()
	self.tecci_crew.categories = clone(self.tecci.categories)
	self.tecci_crew.sounds.prefix = "tecci_npc"
	self.tecci_crew.use_data.selection_index = 2
	self.tecci_crew.DAMAGE = 4.8
	self.tecci_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.tecci_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.tecci_crew.CLIP_AMMO_MAX = 60
	self.tecci_crew.NR_CLIPS_MAX = 5
	self.tecci_crew.pull_magazine_during_reload = "large_plastic"
	self.tecci_crew.auto.fire_rate = 0.08571428571
	self.tecci_crew.hold = "rifle"
	self.tecci_crew.alert_size = 5000
	self.tecci_crew.suppression = 2.2
	self.tecci_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_contraband_crew()
	self.contraband_crew.categories = clone(self.contraband.categories)
	self.contraband_crew.sounds.prefix = "contraband_npc"
	self.contraband_crew.use_data.selection_index = 2
	self.contraband_crew.DAMAGE = 4.8
	self.contraband_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.contraband_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.contraband_crew.CLIP_AMMO_MAX = 60
	self.contraband_crew.NR_CLIPS_MAX = 5
	self.contraband_crew.pull_magazine_during_reload = "rifle"
	self.contraband_crew.auto.fire_rate = 0.08571428571
	self.contraband_crew.hold = {"bullpup", "rifle"}
	self.contraband_crew.reload = "rifle"
	self.contraband_crew.alert_size = 5000
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
	self.contraband_m203_crew.alert_size = 2800
	self.contraband_m203_crew.suppression = 1
	self.contraband_m203_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_flint_crew()
	self.flint_crew.categories = clone(self.flint.categories)
	self.flint_crew.sounds.prefix = "flint_npc"
	self.flint_crew.use_data.selection_index = 2
	self.flint_crew.DAMAGE = 4.8
	self.flint_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.flint_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.flint_crew.CLIP_AMMO_MAX = 60
	self.flint_crew.NR_CLIPS_MAX = 5
	self.flint_crew.pull_magazine_during_reload = "rifle"
	self.flint_crew.auto.fire_rate = 0.08571428571
	self.flint_crew.hold = "rifle"
	self.flint_crew.alert_size = 5000
	self.flint_crew.suppression = 2.2
	self.flint_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_corgi_crew()
	self.corgi_crew.categories = clone(self.corgi.categories)
	self.corgi_crew.sounds.prefix = "corgi_npc"
	self.corgi_crew.use_data.selection_index = 2
	self.corgi_crew.DAMAGE = 4.8
	self.corgi_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.corgi_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.corgi_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.corgi_crew.CLIP_AMMO_MAX = 60
	self.corgi_crew.NR_CLIPS_MAX = 5
	self.corgi_crew.pull_magazine_during_reload = "rifle"
	self.corgi_crew.auto.fire_rate = 0.08571428571
	self.corgi_crew.hold = {
		"bullpup",
		"rifle"
	}
	self.corgi_crew.alert_size = 5000
	self.corgi_crew.suppression = 2.2
	self.corgi_crew.FIRE_MODE = "auto"
end		

function WeaponTweakData:_init_data_komodo_crew()
	self.komodo_crew.categories = clone(self.komodo.categories)
	self.komodo_crew.sounds.prefix = "komodo_npc"
	self.komodo_crew.use_data.selection_index = 2
	self.komodo_crew.DAMAGE = 4.8
	self.komodo_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.komodo_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.komodo_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.komodo_crew.CLIP_AMMO_MAX = 60
	self.komodo_crew.NR_CLIPS_MAX = 5
	self.komodo_crew.pull_magazine_during_reload = "rifle"
	self.komodo_crew.auto.fire_rate = 0.08571428571
	self.komodo_crew.hold = {
		"bullpup",
		"rifle"
	}
	self.komodo_crew.alert_size = 5000
	self.komodo_crew.suppression = 2.2
	self.komodo_crew.FIRE_MODE = "auto"
end		

function WeaponTweakData:_init_data_spas12_crew()
	self.spas12_crew.categories = clone(self.spas12.categories)
	self.spas12_crew.sounds.prefix = "spas_npc"
	self.spas12_crew.use_data.selection_index = 2
	self.spas12_crew.DAMAGE = 7.5
	self.spas12_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.spas12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.spas12_crew.CLIP_AMMO_MAX = 20
	self.spas12_crew.NR_CLIPS_MAX = 4
	self.spas12_crew.hold = "rifle"
	self.spas12_crew.alert_size = 5000
	self.spas12_crew.suppression = 3.4
	self.spas12_crew.rays = 9
	self.spas12_crew.is_shotgun = true
	self.spas12_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_b682_crew()
	self.b682_crew.categories = clone(self.b682.categories)
	self.b682_crew.sounds.prefix = "b682_npc"
	self.b682_crew.use_data.selection_index = 2
	self.b682_crew.DAMAGE = 15
	self.b682_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.b682_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.b682_crew.CLIP_AMMO_MAX = 10
	self.b682_crew.NR_CLIPS_MAX = 4
	self.b682_crew.looped_reload_speed = 0.2
	self.b682_crew.hold = "rifle"
	self.b682_crew.alert_size = 5000
	self.b682_crew.suppression = 3.4
	self.b682_crew.rays = 9
	self.b682_crew.is_shotgun = true
	self.b682_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_r870_crew()
	self.r870_crew.categories = clone(self.r870.categories)
	self.r870_crew.sounds.prefix = "remington_npc"
	self.r870_crew.use_data.selection_index = 2
	self.r870_crew.DAMAGE = 15
	self.r870_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.r870_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_crew.CLIP_AMMO_MAX = 10
	self.r870_crew.NR_CLIPS_MAX = 4
	self.r870_crew.hold = "rifle"
	self.r870_crew.alert_size = 5000
	self.r870_crew.suppression = 3.4
	self.r870_crew.is_shotgun = true
	self.r870_crew.rays = 9
	self.r870_crew.FIRE_MODE = "single"
	self.benelli_crew = deep_clone(self.r870_crew)
end

function WeaponTweakData:_init_data_saiga_crew()
	self.saiga_crew.categories = clone(self.saiga.categories)
	self.saiga_crew.sounds.prefix = "saiga_npc"
	self.saiga_crew.use_data.selection_index = 2
	self.saiga_crew.DAMAGE = 7.5
	self.saiga_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.saiga_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_crew.auto.fire_rate = 0.1
	self.saiga_crew.CLIP_AMMO_MAX = 20
	self.saiga_crew.NR_CLIPS_MAX = 10
	self.saiga_crew.pull_magazine_during_reload = "rifle"
	self.saiga_crew.hold = "rifle"
	self.saiga_crew.alert_size = 4500
	self.saiga_crew.suppression = 3.4
	self.saiga_crew.rays = 9
	self.saiga_crew.is_shotgun = true
	self.saiga_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_huntsman_crew()
	self.huntsman_crew.categories = clone(self.huntsman.categories)
	self.huntsman_crew.sounds.prefix = "huntsman_npc"
	self.huntsman_crew.use_data.selection_index = 2
	self.huntsman_crew.DAMAGE = 15
	self.huntsman_crew.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.huntsman_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.huntsman_crew.CLIP_AMMO_MAX = 10
	self.huntsman_crew.NR_CLIPS_MAX = 4
	self.huntsman_crew.looped_reload_speed = 0.2
	self.huntsman_crew.hold = "rifle"
	self.huntsman_crew.alert_size = 5000
	self.huntsman_crew.suppression = 3.4
	self.huntsman_crew.is_shotgun = true
	self.huntsman_crew.rays = 9
	self.huntsman_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_ben_crew()
	self.ben_crew.categories = {"shotgun"}
	self.ben_crew.sounds.prefix = "benelli_m4_npc"
	self.ben_crew.use_data.selection_index = 2
	self.ben_crew.DAMAGE = 7.5
	self.ben_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.ben_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ben_crew.CLIP_AMMO_MAX = 20
	self.ben_crew.NR_CLIPS_MAX = 4
	self.ben_crew.hold = "rifle"
	self.ben_crew.reload = "looped"
	self.ben_crew.looped_reload_speed = 0.8
	self.ben_crew.alert_size = 5000
	self.ben_crew.suppression = 3.4
	self.ben_crew.is_shotgun = true
	self.ben_crew.rays = 9
	self.ben_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_ksg_crew()
	self.ksg_crew.categories = clone(self.ksg.categories)
	self.ksg_crew.sounds.prefix = "keltec_npc"
	self.ksg_crew.use_data.selection_index = 2
	self.ksg_crew.DAMAGE = 15
	self.ksg_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.ksg_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ksg_crew.auto.fire_rate = 0.75
	self.ksg_crew.CLIP_AMMO_MAX = 10
	self.ksg_crew.NR_CLIPS_MAX = 4
	self.ksg_crew.hold = "rifle"
	self.ksg_crew.alert_size = 5000
	self.ksg_crew.suppression = 3.4
	self.ksg_crew.is_shotgun = true
	self.ksg_crew.rays = 9
	self.ksg_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_aa12_crew()
	self.aa12_crew.categories = clone(self.aa12.categories)
	self.aa12_crew.sounds.prefix = "aa12_npc"
	self.aa12_crew.use_data.selection_index = 2
	self.aa12_crew.DAMAGE = 7.5
	self.aa12_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.aa12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.aa12_crew.auto.fire_rate = 0.1
	self.aa12_crew.CLIP_AMMO_MAX = 20
	self.aa12_crew.NR_CLIPS_MAX = 4
	self.aa12_crew.pull_magazine_during_reload = "large_plastic"
	self.aa12_crew.hold = "rifle"
	self.aa12_crew.alert_size = 5000
	self.aa12_crew.suppression = 3.4
	self.aa12_crew.is_shotgun = true
	self.aa12_crew.rays = 9
	self.aa12_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_boot_crew()
	self.boot_crew.categories = clone(self.boot.categories)
	self.boot_crew.sounds.prefix = "boot_npc"
	self.boot_crew.use_data.selection_index = 2
	self.boot_crew.DAMAGE = 15
	self.boot_crew.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.boot_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.boot_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.boot_crew.CLIP_AMMO_MAX = 10
	self.boot_crew.NR_CLIPS_MAX = 5
	self.boot_crew.auto.fire_rate = 0.6
	self.boot_crew.hold = "rifle"
	self.boot_crew.alert_size = 5000
	self.boot_crew.suppression = 3.4
	self.boot_crew.is_shotgun = true
	self.boot_crew.rays = 9
	self.boot_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_model70_crew()
	self.model70_crew.categories = clone(self.model70.categories)
	self.model70_crew.sounds.prefix = "model70_npc"
	self.model70_crew.use_data.selection_index = 2
	self.model70_crew.DAMAGE = 18
	self.model70_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.model70_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.model70_crew.CLIP_AMMO_MAX = 10
	self.model70_crew.NR_CLIPS_MAX = 8
	self.model70_crew.auto.fire_rate = 1
	self.model70_crew.hold = "rifle"
	self.model70_crew.alert_size = 5000
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
	self.msr_crew.DAMAGE = 18
	self.msr_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.msr_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.msr_crew.CLIP_AMMO_MAX = 10
	self.msr_crew.NR_CLIPS_MAX = 5
	self.msr_crew.auto.fire_rate = 0.6
	self.msr_crew.hold = "rifle"
	self.msr_crew.pull_magazine_during_reload = "rifle"
	self.msr_crew.alert_size = 5000
	self.msr_crew.suppression = 3.4
	self.msr_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_r93_crew()
	self.r93_crew.categories = clone(self.r93.categories)
	self.r93_crew.sounds.prefix = "blazer_npc"
	self.r93_crew.use_data.selection_index = 2
	self.r93_crew.DAMAGE = 18
	self.r93_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.r93_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.r93_crew.CLIP_AMMO_MAX = 10
	self.r93_crew.NR_CLIPS_MAX = 5
	self.r93_crew.pull_magazine_during_reload = "rifle"
	self.r93_crew.auto.fire_rate = 0.6
	self.r93_crew.hold = "rifle"
	self.r93_crew.alert_size = 5000
	self.r93_crew.suppression = 3.4
	self.r93_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_m95_crew()
	self.m95_crew.categories = clone(self.m95.categories)
	self.m95_crew.sounds.prefix = "barrett_npc"
	self.m95_crew.use_data.selection_index = 2
	self.m95_crew.DAMAGE = 18
	self.m95_crew.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"
	self.m95_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
	self.m95_crew.CLIP_AMMO_MAX = 10
	self.m95_crew.NR_CLIPS_MAX = 5
	self.m95_crew.pull_magazine_during_reload = "rifle"
	self.m95_crew.hold = "rifle"
	self.m95_crew.reload = "bullpup"
	self.m95_crew.auto.fire_rate = 0.6
	self.m95_crew.alert_size = 5000
	self.m95_crew.suppression = 3.4
	self.m95_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_mosin_crew()
	self.mosin_crew.categories = clone(self.mosin.categories)
	self.mosin_crew.sounds.prefix = "nagant_npc"
	self.mosin_crew.use_data.selection_index = 2
	self.mosin_crew.DAMAGE = 18
	self.mosin_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.mosin_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.mosin_crew.CLIP_AMMO_MAX = 10
	self.mosin_crew.NR_CLIPS_MAX = 8
	self.mosin_crew.auto.fire_rate = 0.6
	self.mosin_crew.hold = "rifle"
	self.mosin_crew.alert_size = 5000
	self.mosin_crew.suppression = 3.4
	self.mosin_crew.FIRE_MODE = "single"
	self.mosin_secondary_crew = deep_clone(self.mosin_crew)
	self.mosin_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_winchester1874_crew()
	self.winchester1874_crew.categories = clone(self.winchester1874.categories)
	self.winchester1874_crew.sounds.prefix = "m1873_npc"
	self.winchester1874_crew.use_data.selection_index = 2
	self.winchester1874_crew.DAMAGE = 18
	self.winchester1874_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.winchester1874_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.winchester1874_crew.CLIP_AMMO_MAX = 10
	self.winchester1874_crew.NR_CLIPS_MAX = 8
	self.winchester1874_crew.looped_reload_speed = 0.7407407
	self.winchester1874_crew.auto.fire_rate = 0.6
	self.winchester1874_crew.hold = "rifle"
	self.winchester1874_crew.alert_size = 5000
	self.winchester1874_crew.suppression = 3.4
	self.winchester1874_crew.FIRE_MODE = "single"
	self.winchester1874_secondary_crew = deep_clone(self.winchester1874_crew)
	self.winchester1874_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_wa2000_crew()
	self.wa2000_crew.categories = clone(self.wa2000.categories)
	self.wa2000_crew.sounds.prefix = "lakner_npc"
	self.wa2000_crew.use_data.selection_index = 2
	self.wa2000_crew.DAMAGE = 18
	self.wa2000_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.wa2000_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.wa2000_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.wa2000_crew.CLIP_AMMO_MAX = 10
	self.wa2000_crew.NR_CLIPS_MAX = 5
	self.wa2000_crew.pull_magazine_during_reload = "rifle"
	self.wa2000_crew.auto.fire_rate = 0.6
	self.wa2000_crew.hold = {"bullpup", "rifle"}
	self.wa2000_crew.alert_size = 5000
	self.wa2000_crew.suppression = 3.4
	self.wa2000_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_desertfox_crew()
	self.desertfox_crew.categories = clone(self.desertfox.categories)
	self.desertfox_crew.sounds.prefix = "desertfox_npc"
	self.desertfox_crew.use_data.selection_index = 2
	self.desertfox_crew.DAMAGE = 18
	self.desertfox_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.desertfox_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.desertfox_crew.CLIP_AMMO_MAX = 10
	self.desertfox_crew.NR_CLIPS_MAX = 8
	self.desertfox_crew.pull_magazine_during_reload = "rifle"
	self.desertfox_crew.auto.fire_rate = 0.6
	self.desertfox_crew.hold = "rifle"
	self.desertfox_crew.reload = "bullpup"
	self.desertfox_crew.alert_size = 5000
	self.desertfox_crew.suppression = 3.4
	self.desertfox_crew.FIRE_MODE = "single"
	self.desertfox_secondary_crew = deep_clone(self.desertfox_crew)
	self.desertfox_secondary_crew.use_data.selection_index = 1
end

function WeaponTweakData:_init_data_tti_crew()
	self.tti_crew.categories = clone(self.tti.categories)
	self.tti_crew.sounds.prefix = "tti_npc"
	self.tti_crew.use_data.selection_index = 2
	self.tti_crew.DAMAGE = 18
	self.tti_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.tti_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.tti_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.tti_crew.CLIP_AMMO_MAX = 10
	self.tti_crew.NR_CLIPS_MAX = 5
	self.tti_crew.pull_magazine_during_reload = "rifle"
	self.tti_crew.auto.fire_rate = 0.6
	self.tti_crew.hold = "rifle"
	self.tti_crew.alert_size = 5000
	self.tti_crew.suppression = 3.4
	self.tti_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_siltstone_crew()
	self.siltstone_crew.categories = clone(self.siltstone.categories)
	self.siltstone_crew.sounds.prefix = "siltstone_npc"
	self.siltstone_crew.use_data.selection_index = 2
	self.siltstone_crew.DAMAGE = 18
	self.siltstone_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.siltstone_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.siltstone_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.siltstone_crew.CLIP_AMMO_MAX = 10
	self.siltstone_crew.NR_CLIPS_MAX = 4
	self.siltstone_crew.auto.fire_rate = 0.6
	self.siltstone_crew.hold = "rifle"
	self.siltstone_crew.alert_size = 5000
	self.siltstone_crew.suppression = 3.4
	self.siltstone_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_r700_crew()
	self.r700_crew.categories = clone(self.r700.categories)
	self.r700_crew.sounds.prefix = "r700_npc"
	self.r700_crew.use_data.selection_index = 2
	self.r700_crew.DAMAGE = 18
	self.r700_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.r700_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.r700_crew.CLIP_AMMO_MAX = 10
	self.r700_crew.NR_CLIPS_MAX = 2
	self.r700_crew.auto.fire_rate = 0.6
	self.r700_crew.hold = "rifle"
	self.r700_crew.alert_size = 5000
	self.r700_crew.suppression = 3.4
	self.r700_crew.FIRE_MODE = "single"
end

function WeaponTweakData:_init_data_ching_crew()
	self.ching_crew.categories = clone(self.ching.categories)
	self.ching_crew.sounds.prefix = "ching_npc"
	self.ching_crew.use_data.selection_index = 2
	self.ching_crew.DAMAGE = 18
	self.ching_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ching_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ching_crew.CLIP_AMMO_MAX = 10
	self.ching_crew.NR_CLIPS_MAX = 8
	self.ching_crew.pull_magazine_during_reload = "rifle"
	self.ching_crew.reload = "looped"
	self.ching_crew.looped_reload_speed = 1
	self.ching_crew.auto.fire_rate = 0.6
	self.ching_crew.hold = "rifle"
	self.ching_crew.alert_size = 5000
	self.ching_crew.suppression = 3.4
	self.ching_crew.FIRE_MODE = "single"
end		

function WeaponTweakData:_init_data_par_crew()
	self.par_crew.categories = clone(self.par.categories)
	self.par_crew.sounds.prefix = "svinet_npc"
	self.par_crew.use_data.selection_index = 2
	self.par_crew.DAMAGE = 3.6
	self.par_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.par_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.par_crew.CLIP_AMMO_MAX = 100
	self.par_crew.NR_CLIPS_MAX = 2
	self.par_crew.auto.fire_rate = 0.075
	self.par_crew.hold = "rifle"
	self.par_crew.alert_size = 5000
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
	self.rpk_crew.DAMAGE = 3.6
	self.rpk_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.rpk_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.rpk_crew.CLIP_AMMO_MAX = 100
	self.rpk_crew.NR_CLIPS_MAX = 5
	self.rpk_crew.auto.fire_rate = 0.075
	self.rpk_crew.hold = "rifle"
	self.rpk_crew.alert_size = 5000
	self.rpk_crew.suppression = 2
	self.rpk_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_m249_crew()
	self.m249_crew.categories = clone(self.m249.categories)
	self.m249_crew.sounds.prefix = "m249_npc"
	self.m249_crew.use_data.selection_index = 2
	self.m249_crew.DAMAGE = 3.6
	self.m249_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_crew.CLIP_AMMO_MAX = 100
	self.m249_crew.NR_CLIPS_MAX = 2
	self.m249_crew.auto.fire_rate = 0.075
	self.m249_crew.hold = "rifle"
	self.m249_crew.alert_size = 5000
	self.m249_crew.suppression = 2
	self.m249_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_hk21_crew()
	self.hk21_crew.categories = clone(self.hk21.categories)
	self.hk21_crew.sounds.prefix = "hk23e_npc"
	self.hk21_crew.use_data.selection_index = 2
	self.hk21_crew.DAMAGE = 3.6
	self.hk21_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_crew.CLIP_AMMO_MAX = 100
	self.hk21_crew.NR_CLIPS_MAX = 5
	self.hk21_crew.auto.fire_rate = 0.075
	self.hk21_crew.hold = "rifle"
	self.hk21_crew.alert_size = 5000
	self.hk21_crew.suppression = 2.4
	self.hk21_crew.FIRE_MODE = "auto"
end

function WeaponTweakData:_init_data_mg42_crew()
	self.mg42_crew.categories = clone(self.mg42.categories)
	self.mg42_crew.sounds.prefix = "mg42_npc"
	self.mg42_crew.use_data.selection_index = 2
	self.mg42_crew.DAMAGE = 3.6
	self.mg42_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.mg42_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.mg42_crew.CLIP_AMMO_MAX = 100
	self.mg42_crew.NR_CLIPS_MAX = 3
	self.mg42_crew.auto.fire_rate = 0.075
	self.mg42_crew.hold = "rifle"
	self.mg42_crew.alert_size = 5000
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
	self.m60_crew.DAMAGE = 3.6
	self.m60_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m60_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m60_crew.CLIP_AMMO_MAX = 100
	self.m60_crew.NR_CLIPS_MAX = 3
	self.m60_crew.auto.fire_rate = 0.075
	self.m60_crew.hold = "rifle"
	self.m60_crew.alert_size = 5000
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

function WeaponTweakData:_init_stats()
	self.stats = {}
	self.stats.alert_size = {
		4200,
		4000,
		3800,
		3600,
		3400,
		3200,
		3000,
		2800,
		2600,
		2400,
		2200,
		2000,
		1800,
		1600,
		1400,
		1200,
		1000,
		800,
		600,
		400,
		200
	}
	self.stats.suppression = {
		4.2,
		4,
		3.8,
		3.6,
		3.4,
		3.2,
		3,
		2.8,
		2.6,
		2.4,
		2.2,
		2,
		1.8,
		1.6,
		1.4,
		1.2,
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
    self.stats.zoom = {}
    for i = 1, 12.1, 0.1 do
        table.insert(self.stats.zoom, 65 / i)
    end

    self.stats.stance_mults = {
    	standing = 7,
    	moving_standing = 7,
    	moving_crouching = 3,
    	crouching = 3,
    	moving_steelsight = 1,
    	steelsight = 1,
    	bipod = 1
    }

    --Controls how much total ammo influences pickup Following the formula pickup = (base_pickup% + exponent*sqrt(damage)) * ammo * skill_mults
    --These changes exist to allow for consistency to be added to low ammo pool weapons (by pushing min and max pickup closer) and to compensate for lack of rounding eating your pickups.
    self.stats.pickup_exponents = {
    	min = -0.0005,
    	max = -0.00125
    }

    self.stat_info = {}

    --Multiplier for spread on multi-pellet shotguns. This compensates for linear spread scaling which would otherwise cripple their multikill potential.
    self.stat_info.shotgun_spread_increase = 2.5

    --Generate table for spread and how it relates to accuracy.
    --The values in the table correspond to the area of spread, rather than the number of degrees as in vanilla.
    --This is because area corresponds directly to % chance to hit, so it's a more useful metric to focus on.
    self.stat_info.base_spread = 4.85 --How much spread area you have at 0 accuracy.
    self.stat_info.spread_per_accuracy = -0.24 --How much each point of accuracy reduces spread area.
    self.stats.spread = {}
    for i = 0, 20, 1 do
    	table.insert(self.stats.spread, self.stat_info.base_spread + (i * self.stat_info.spread_per_accuracy))
    end

    --Generate table for moving_spread and how it relates to stability.
    --The values in the table correspond to the area of spread.
    --These are added to the area for accuracy while moving before determining the final angles.
	self.stat_info.base_move_spread = 3.00
    self.stat_info.spread_per_stability = -0.12
	self.stats.spread_moving = {}
    for i = 0, 25, 1 do
    	table.insert(self.stats.spread_moving, self.stat_info.base_move_spread + (i * self.stat_info.spread_per_stability))
    end

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

	--Weapon swap speed multiplier from concealment.
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
		0.51,
		0.52,
		0.53,
		0.54,
		0.55,
		0.56,
		0.57,
		0.58,
		0.59,
		0.6,
		0.61,
		0.62,
		0.63,
		0.64,
		0.65,
		0.66,
		0.67,
		0.68,
		0.69,
		0.7,
		0.71,
		0.72,
		0.73,
		0.74,
		0.75,
		0.76,
		0.77,
		0.78,
		0.79,
		0.8,
		0.81,
		0.82,
		0.83,
		0.84,
		0.85,
		0.86,
		0.87,
		0.88,
		0.89,
		0.9,
		0.91,
		0.92,
		0.93,
		0.94,
		0.95,
		0.96,
		0.97,
		0.98,
		0.99,
		1,
		1.01,
		1.02,
		1.03,
		1.04,
		1.05,
		1.06,
		1.07,
		1.08,
		1.09,
		1.10,
		1.11,
		1.12,
		1.13,
		1.14,
		1.15			
	}
	self.stats.reload = {
		0.05,
		0.1,
		0.15,
		0.2,
		0.25,
		0.3,
		0.35,
		0.4,
		0.45,
		0.5,
		0.55,
		0.6,
		0.65,
		0.7,
		0.75,
		0.8,
		0.85,
		0.9,
		0.95,
		1,
		1.05,
		1.1,
		1.15,
		1.2,
		1.25,
		1.3,
		1.35,
		1.4,
		1.45,
		1.5,
		1.55,
		1.6,
		1.65,
		1.7,
		1.75,
		1.8,
		1.85,
		1.9,
		1.95,
		2
	}		
	
	self.spread = {
		dispersion = 1.0
	}
end

--Sets % of total ammo picked up before any other modifiers (IE: From skills or pickup_exponents).
--Secondary pickup is compensated in newraycastweaponbase/weaponammo by looking at their total ammo as if they were primaries.
function WeaponTweakData:_pickup_chance()
	return {
		0.028, 0.056
	}
end

Hooks:PostHook( WeaponTweakData, "init", "SC_weapons", function(self)

	--self:_init_new_weapon_sync(weapon_data)
	--self:_init_new_weapon_sync_crew()
	local tact_rel = {'deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mp9','new_mp5','mp7','p90','olympic','akmsu','akm','akm_gold','ak74','m16','amcar','new_m4','ak5','s552','g36','aug','saiga','new_m14','scar','fal','rpk','msr','r93','m95','famas','galil','g3','scorpion','benelli','serbu','r870','ksg','g26','spas12','l85a2','vhs','hs2000','tec9','asval','sub2000','polymer','wa2000','model70','sparrow','m37','sr2','pl14','tecci','hajk','boot','packrat','schakal','desertfox','tti','siltstone','flint','coal','lemming','breech','basset','shrew','corgi','shepheard','komodo','legacy','beer','czech','stech','r700','holt'}
	for i, wep_id in ipairs(tact_rel) do
		self[wep_id].tactical_reload = 1
		self[wep_id].has_description = false
	end
	local tact_akimbo_pistol = {'x_deagle','x_1911','x_b92fs','jowi','x_usp','x_g17','x_g22c','x_packrat','x_shrew','x_breech','x_g18c','x_hs2000','x_p226','x_pl14','x_ppk','x_sparrow','x_legacy','x_czech','x_stech','x_holt'}
	for i, wep_id in ipairs(tact_akimbo_pistol) do
		self[wep_id].tactical_reload = 2
		self[wep_id].recategorize = "akimbo"
		self[wep_id].categories = {"akimbo", "pistol"}
	end
	local tact_akimbo_smg = {'x_sr2','x_mp5', 'x_coal', 'x_mp7', 'x_mp9', 'x_p90', 'x_polymer', 'x_schakal', 'x_scorpion', 'x_tec9','x_shepheard'}
	for i, wep_id in ipairs(tact_akimbo_smg) do
		self[wep_id].tactical_reload = 2
		self[wep_id].recategorize = "akimbo"
		self[wep_id].categories = {"akimbo", "smg"}
	end
	local tact_akimbo_rifle = {'x_akmsu', 'x_hajk', 'x_olympic'}
	for i, wep_id in ipairs(tact_akimbo_rifle) do
		self[wep_id].tactical_reload = 2
		self[wep_id].recategorize = "akimbo"
		self[wep_id].categories = {"akimbo", "assault_rifle"}
	end
	self.c96.uses_clip = true
	self.mosin.uses_clip = true
	self.c96.clip_capacity = 10
	self.mosin.clip_capacity = 5
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
	
	self.new_m4.desc_id = "bm_menu_sc_m4_desc"
	self.new_m4.AMMO_MAX = 150
	self.new_m4.AMMO_PICKUP = self:_pickup_chance()
	self.new_m4.CLIP_AMMO_MAX = 30
	self.new_m4.fire_mode_data.fire_rate = 0.08571428571
	self.new_m4.auto.fire_rate = 0.08571428571
	self.new_m4.kick.standing = {
		0.6,
		0.8,
		-1,
		1
	}
	self.new_m4.kick.crouching = {
		0.40002,
		0.53336,
		-0.6667,
		0.6667
	}
	self.new_m4.kick.steelsight = {
		0.40002,
		0.53336,
		-0.6667,
		0.6667
	}		
	self.new_m4.supported = true
	self.new_m4.stats = {
		damage = 24,
		spread = 17,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.new_m4.stats_modifiers = nil
	self.new_m4.timers.reload_empty = 3.5		
	self.new_m4.panic_suppression_chance = 0.05
	self.glock_17.desc_id = "bm_menu_sc_glock17_desc"
	self.glock_17.fire_mode_data.fire_rate = 0.08571428571
	self.glock_17.single.fire_rate = 0.08571428571
	self.glock_17.AMMO_MAX = 90
	self.glock_17.CLIP_AMMO_MAX = 18
	self.glock_17.AMMO_PICKUP = self:_pickup_chance()
	self.glock_17.kick.standing = {
		0.6,
		0.8,
		-1,
		1
	}
	self.glock_17.kick.crouching = {
		0.40002,
		0.53336,
		-0.6667,
		0.6667
	}
	self.glock_17.kick.steelsight = {
		0.40002,
		0.53336,
		-0.6667,
		0.6667
	}
	self.glock_17.supported = true
	self.glock_17.stats = {
		damage = 20,
		spread = 18,
		recoil = 24,
		spread_moving = 7,
		zoom = 1,
		concealment = 30,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.glock_17.stats_modifiers = nil
	self.glock_17.panic_suppression_chance = 0.05
	self.mp9.desc_id = "bm_menu_sc_mp9_desc"
	self.mp9.CLIP_AMMO_MAX = 20
	self.mp9.auto.fire_rate = 0.06666666666
	self.mp9.fire_mode_data.fire_rate = 0.06666666666
	self.mp9.AMMO_MAX = 100
	self.mp9.AMMO_PICKUP = self:_pickup_chance()
	self.mp9.kick.standing = self.new_m4.kick.standing
	self.mp9.kick.crouching = self.new_m4.kick.crouching
	self.mp9.kick.steelsight = self.new_m4.kick.steelsight
	self.mp9.supported = true
	self.mp9.stats = {
		damage = 18,
		spread = 17,
		recoil = 23,
		spread_moving = 8,
		zoom = 1,
		concealment = 30,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.mp9.stats_modifiers = nil
	self.mp9.panic_suppression_chance = 0.05
	self.r870.desc_id = "bm_menu_sc_r870_desc"
	self.r870.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.r870.rays = 9
	self.r870.CLIP_AMMO_MAX = 8
	self.r870.kick.standing = self.new_m4.kick.standing
	self.r870.kick.crouching = self.new_m4.kick.crouching
	self.r870.kick.steelsight = self.new_m4.kick.steelsight
	self.r870.single.fire_rate = 0.5
	self.r870.fire_mode_data.fire_rate = 0.5
	self.r870.AMMO_MAX = 60
	self.r870.AMMO_PICKUP = self:_pickup_chance()
	self.r870.supported = true
	self.r870.stats = {
		damage = 60,
		spread = 9,
		recoil = 17,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}		
	self.r870.stats_modifiers = nil
	self.r870.panic_suppression_chance = 0.05
	self.glock_18c.desc_id = "bm_menu_sc_glock18c_desc"
	self.glock_18c.fire_mode_data.fire_rate = 0.05454545454
	self.glock_18c.auto.fire_rate = 0.05454545454
	self.glock_18c.CLIP_AMMO_MAX = 18
	self.glock_18c.AMMO_MAX = 100
	self.glock_18c.AMMO_PICKUP = self:_pickup_chance()
	self.glock_18c.kick.standing = self.new_m4.kick.standing
	self.glock_18c.kick.crouching = self.new_m4.kick.crouching
	self.glock_18c.kick.steelsight = self.new_m4.kick.steelsight
	self.glock_18c.supported = true
	self.glock_18c.stats = {
		damage = 18,
		spread = 17,
		recoil = 19,
		spread_moving = 9,
		zoom = 1,
		concealment = 28,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.glock_18c.stats_modifiers = nil
	self.glock_18c.panic_suppression_chance = 0.05
	self.amcar.desc_id = "bm_menu_sc_amcar_desc"
	self.amcar.CLIP_AMMO_MAX = 30
	self.amcar.AMMO_MAX = 180
	self.amcar.AMMO_PICKUP = self:_pickup_chance()
	self.amcar.fire_mode_data.fire_rate = 0.075
	self.amcar.auto.fire_rate = 0.075
	self.amcar.kick.standing = self.new_m4.kick.standing
	self.amcar.kick.crouching = self.new_m4.kick.crouching
	self.amcar.kick.steelsight = self.new_m4.kick.steelsight
	self.amcar.supported = true
	self.amcar.stats = {
		damage = 20,
		spread = 17,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.amcar.stats_modifiers = nil
	self.amcar.timers.reload_not_empty = 2.10
	self.amcar.timers.reload_empty = 2.9 		
	self.amcar.panic_suppression_chance = 0.05
	self.m16.desc_id = "bm_menu_sc_m16_desc"
	self.m16.fire_mode_data.fire_rate = 0.08571428571
	self.m16.auto.fire_rate = 0.08571428571
	self.m16.CLIP_AMMO_MAX = 30
	self.m16.AMMO_MAX = 120
	self.m16.FIRE_MODE = "auto"				
	self.m16.CAN_TOGGLE_FIREMODE = true
	self.m16.AMMO_PICKUP = self:_pickup_chance()
	self.m16.kick.standing = self.new_m4.kick.standing
	self.m16.kick.crouching = self.new_m4.kick.crouching
	self.m16.kick.steelsight = self.new_m4.kick.steelsight		
	self.m16.supported = true
	self.m16.stats = {
		damage = 30,
		spread = 17,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.m16.stats_modifiers = nil
	self.m16.panic_suppression_chance = 0.05
	self.olympic.desc_id = "bm_menu_sc_olympic_desc"
	self.olympic.categories = {
		"assault_rifle"
	}
	self.olympic.CLIP_AMMO_MAX = 30
	self.olympic.AMMO_MAX = 90
	self.olympic.fire_mode_data.fire_rate = 0.075
	self.olympic.auto.fire_rate = 0.075
	self.olympic.AMMO_PICKUP = self:_pickup_chance()
	self.olympic.panic_suppression_chance = 0.05
	self.olympic.kick.standing = self.new_m4.kick.standing
	self.olympic.kick.crouching = self.new_m4.kick.crouching
	self.olympic.kick.steelsight = self.new_m4.kick.steelsight		
	self.olympic.supported = true
	self.olympic.stats = {
		damage = 20,
		spread = 17,
		recoil = 21,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.olympic.stats_modifiers = nil
	self.ak74.desc_id = "bm_menu_sc_ak74_desc"
	self.ak74.AMMO_MAX = 150
	self.ak74.AMMO_PICKUP = self:_pickup_chance()
	self.ak74.fire_mode_data.fire_rate = 0.0923076923
	self.ak74.auto.fire_rate = 0.0923076923
	self.ak74.kick.standing = self.new_m4.kick.standing
	self.ak74.kick.crouching = self.new_m4.kick.crouching
	self.ak74.kick.steelsight = self.new_m4.kick.steelsight
	self.ak74.supported = true
	self.ak74.stats = {
		damage = 24,
		spread = 18,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ak74.stats_modifiers = nil
	self.ak74.panic_suppression_chance = 0.05
	self.akm.desc_id = "bm_menu_sc_akm_desc"
	self.akm.AMMO_MAX = 120
	self.akm.AMMO_PICKUP = self:_pickup_chance()
	self.akm.fire_mode_data.fire_rate = 0.1
	self.akm.auto.fire_rate = 0.1
	self.akm.kick.standing = self.new_m4.kick.standing
	self.akm.kick.crouching = self.new_m4.kick.crouching
	self.akm.kick.steelsight = self.new_m4.kick.steelsight		
	self.akm.supported = true
	self.akm.stats = {
		damage = 30,
		spread = 17,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.akm.stats_modifiers = nil
	self.akm.timers.reload_not_empty = 2
	self.akm.panic_suppression_chance = 0.05
	self.akm_gold.desc_id = "bm_menu_sc_akm_gold_desc"
	self.akm_gold.kick.standing = self.new_m4.kick.standing
	self.akm_gold.kick.crouching = self.new_m4.kick.crouching
	self.akm_gold.kick.steelsight = self.new_m4.kick.steelsight			
	self.akm_gold.AMMO_MAX = 120
	self.akm_gold.AMMO_PICKUP = self:_pickup_chance()
	self.akm_gold.fire_mode_data.fire_rate = 0.1
	self.akm_gold.auto.fire_rate = 0.1
	self.akm_gold.timers.reload_not_empty = 2
	self.akm_gold.supported = true
	self.akm_gold.stats = {
		damage = 30,
		spread = 17,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.akm_gold.stats_modifiers = nil
	self.akm_gold.panic_suppression_chance = 0.05
	self.akmsu.categories = {
		"assault_rifle"
	}
	self.akmsu.AMMO_MAX = 60
	self.akmsu.AMMO_PICKUP = self:_pickup_chance()
	self.akmsu.fire_mode_data.fire_rate = 0.0923076923
	self.akmsu.auto.fire_rate = 0.0923076923
	self.akmsu.panic_suppression_chance = 0.05
	self.akmsu.kick.standing = self.new_m4.kick.standing
	self.akmsu.kick.crouching = self.new_m4.kick.crouching
	self.akmsu.kick.steelsight = self.new_m4.kick.steelsight			
	self.akmsu.supported = true
	self.akmsu.stats = {
		damage = 30,
		spread = 17,
		recoil = 20,
		spread_moving = 9,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.akmsu.stats_modifiers = nil
	self.akmsu.timers.reload_not_empty = 1.95 
	self.akmsu.timers.reload_empty = 3.7 
	self.saiga.rays = 9
	self.saiga.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.saiga.CLIP_AMMO_MAX = 6
	self.saiga.AMMO_MAX = 120
	self.saiga.AMMO_PICKUP = self:_pickup_chance()
	self.saiga.fire_mode_data.fire_rate = 0.1
	self.saiga.auto.fire_rate = 0.1
	self.saiga.shake.fire_multiplier = 1
	self.saiga.shake.fire_steelsight_multiplier = -1
	self.saiga.kick.standing = self.new_m4.kick.standing
	self.saiga.kick.crouching = self.new_m4.kick.crouching
	self.saiga.kick.steelsight = self.new_m4.kick.steelsight
	self.saiga.supported = true
	self.saiga.stats = {
		damage = 30,
		spread = 7,
		recoil = 19,
		spread_moving = 7,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.saiga.stats_modifiers = nil
	self.saiga.panic_suppression_chance = 0.05
	self.ak5.auto.fire_rate = 0.08571428571
	self.ak5.fire_mode_data.fire_rate = 0.08571428571
	self.ak5.kick.standing = self.new_m4.kick.standing
	self.ak5.kick.crouching = self.new_m4.kick.crouching
	self.ak5.kick.steelsight = self.new_m4.kick.steelsight
	self.ak5.supported = true
	self.ak5.stats = {
		damage = 24,
		spread = 16,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ak5.stats_modifiers = nil
	self.ak5.timers.reload_empty = 3.15
	self.ak5.panic_suppression_chance = 0.05
	self.aug.AMMO_MAX = 150
	self.aug.AMMO_PICKUP = self:_pickup_chance()
	self.aug.auto.fire_rate = 0.08
	self.aug.fire_mode_data.fire_rate = 0.08
	self.aug.kick.standing = self.new_m4.kick.standing
	self.aug.kick.crouching = self.new_m4.kick.crouching
	self.aug.kick.steelsight = self.new_m4.kick.steelsight
	self.aug.supported = true
	self.aug.stats = {
		damage = 24,
		spread = 17,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.aug.stats_modifiers = nil
	self.aug.timers.reload_empty = 3.4
	self.aug.panic_suppression_chance = 0.05
	self.aug.CLIP_AMMO_MAX = 30
	self.g36.BURST_FIRE = 3
	self.g36.ADAPTIVE_BURST_SIZE = false																	
	self.g36.auto.fire_rate = 0.08
	self.g36.fire_mode_data.fire_rate = 0.08
	self.g36.AMMO_MAX = 180
	self.g36.AMMO_PICKUP = self:_pickup_chance()
	self.g36.CLIP_AMMO_MAX = 30
	self.g36.kick.standing = self.new_m4.kick.standing
	self.g36.kick.crouching = self.new_m4.kick.crouching
	self.g36.kick.steelsight = self.new_m4.kick.steelsight
	self.g36.supported = true
	self.g36.stats = {
		damage = 20,
		spread = 19,
		recoil = 22,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.g36.stats_modifiers = nil
	self.g36.timers.reload_not_empty = 2.4
	self.g36.panic_suppression_chance = 0.05
	self.p90.desc_id = "bm_ap_weapon_sc_desc"
	self.p90.AMMO_MAX = 100
	self.p90.AMMO_PICKUP = self:_pickup_chance()
	self.p90.fire_mode_data.fire_rate = 0.06666666666
	self.p90.auto.fire_rate = 0.06666666666
	self.p90.panic_suppression_chance = 0.05
	self.p90.kick.standing = self.new_m4.kick.standing
	self.p90.kick.crouching = self.new_m4.kick.crouching
	self.p90.kick.steelsight = self.new_m4.kick.steelsight
	self.p90.supported = true
	self.p90.stats = {
		damage = 18,
		spread = 15,
		recoil = 23,
		spread_moving = 9,
		zoom = 1,
		concealment = 26,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.p90.stats_modifiers = nil
	self.p90.panic_suppression_chance = 0.05
	self.new_m14.CLIP_AMMO_MAX = 20
	self.new_m14.fire_mode_data.fire_rate = 0.08571428571
	self.new_m14.single.fire_rate = 0.08571428571
	self.new_m14.kick.standing = self.new_m4.kick.standing
	self.new_m14.kick.crouching = self.new_m4.kick.crouching
	self.new_m14.kick.steelsight = self.new_m4.kick.steelsight
	self.new_m14.AMMO_MAX = 60
	self.new_m14.AMMO_PICKUP = self:_pickup_chance()
	self.new_m14.supported = true
	self.new_m14.stats = {
		damage = 60,
		spread = 20,
		recoil = 15,
		spread_moving = 5,
		zoom = 1,
		concealment = 20,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.new_m14.stats_modifiers = nil
	self.new_m14.timers.reload_not_empty = 2.60
	self.new_m14.panic_suppression_chance = 0.05
	self.deagle.has_description = false
	self.deagle.desc_id = "bm_ap_weapon_sc_desc"
	self.deagle.fire_mode_data.fire_rate = 0.1
	self.deagle.single.fire_rate = 0.1
	self.deagle.kick.standing = self.glock_17.kick.standing
	self.deagle.kick.crouching = self.glock_17.kick.crouching
	self.deagle.kick.steelsight = self.glock_17.kick.steelsight
	self.deagle.CLIP_AMMO_MAX = 8
	self.deagle.AMMO_MAX = 30
	self.deagle.AMMO_PICKUP = self:_pickup_chance()
	self.deagle.supported = true
	self.deagle.stats = {
		damage = 60,
		spread = 18,
		recoil = 18,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.deagle.stats_modifiers = nil
	self.deagle.panic_suppression_chance = 0.05
	self.new_mp5.fire_mode_data.fire_rate = 0.075
	self.new_mp5.auto.fire_rate = 0.075
	self.new_mp5.BURST_FIRE = 3
	self.new_mp5.ADAPTIVE_BURST_SIZE = false			
	self.new_mp5.panic_suppression_chance = 0.05
	self.new_mp5.kick.standing = self.new_m4.kick.standing
	self.new_mp5.kick.crouching = self.new_m4.kick.crouching
	self.new_mp5.kick.steelsight = self.new_m4.kick.steelsight
	self.new_mp5.AMMO_MAX = 90
	self.new_mp5.AMMO_PICKUP = self:_pickup_chance()
	self.new_mp5.supported = true
	self.new_mp5.stats = {
		damage = 20,
		spread = 17,
		recoil = 23,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.new_mp5.stats_modifiers = nil
	self.new_mp5.panic_suppression_chance = 0.05
	self.colt_1911.fire_mode_data.fire_rate = 0.08571428571
	self.colt_1911.single.fire_rate = 0.08571428571
	self.colt_1911.CLIP_AMMO_MAX = 8
	self.colt_1911.AMMO_MAX = 40
	self.colt_1911.AMMO_PICKUP = self:_pickup_chance()
	self.colt_1911.kick.standing = self.glock_17.kick.standing
	self.colt_1911.kick.crouching = self.glock_17.kick.crouching
	self.colt_1911.kick.steelsight = self.glock_17.kick.steelsight
	self.colt_1911.supported = true
	self.colt_1911.stats = {
		damage = 45,
		spread = 18,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 26,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.colt_1911.stats_modifiers = nil
	self.colt_1911.panic_suppression_chance = 0.05
	self.mac10.CLIP_AMMO_MAX = 20
	self.mac10.AMMO_MAX = 60
	self.mac10.AMMO_PICKUP = self:_pickup_chance()
	self.mac10.fire_mode_data.fire_rate = 0.06
	self.mac10.auto.fire_rate = 0.06
	self.mac10.kick.standing = self.new_m4.kick.standing
	self.mac10.kick.crouching = self.new_m4.kick.crouching
	self.mac10.kick.steelsight = self.new_m4.kick.steelsight
	self.mac10.supported = true
	self.mac10.stats = {
		damage = 30,
		spread = 15,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 22,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.mac10.stats_modifiers = nil
	self.mac10.timers.reload_not_empty = 1.55
	self.mac10.timers.reload_empty = 2.4	
	self.mac10.panic_suppression_chance = 0.05
	self.serbu.rays = 9
	self.serbu.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.serbu.CLIP_AMMO_MAX = 4
	self.serbu.AMMO_MAX = 30
	self.serbu.AMMO_PICKUP = self:_pickup_chance()
	self.serbu.fire_mode_data.fire_rate = 0.5
	self.serbu.single.fire_rate = 0.5
	self.serbu.kick.standing = self.new_m4.kick.standing
	self.serbu.kick.crouching = self.new_m4.kick.crouching 
	self.serbu.kick.steelsight = self.new_m4.kick.steelsight	
	self.serbu.supported = true
	self.serbu.stats = {
		damage = 60,
		spread = 8,
		recoil = 17,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.serbu.stats_modifiers = nil
	self.serbu.panic_suppression_chance = 0.05
	self.huntsman.rays = 9
	self.huntsman.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.huntsman.AMMO_MAX = 40
	self.huntsman.AMMO_PICKUP = self:_pickup_chance()
	self.huntsman.sounds.fire_single = "huntsman_fire"
	self.huntsman.sounds.fire_auto = "huntsman_fire"
	self.huntsman.BURST_FIRE = 3
	self.huntsman.BURST_FIRE_RATE_MULTIPLIER = 120				
	self.huntsman.ADAPTIVE_BURST_SIZE = false	
	self.huntsman.CAN_TOGGLE_FIREMODE = false			
	self.huntsman.DELAYED_BURST_RECOIL = true
	self.huntsman.fire_mode_data = {}
	self.huntsman.fire_mode_data.fire_rate = 0.06
	self.huntsman.single = {}
	self.huntsman.single.fire_rate = 0.06	
	self.huntsman.auto = {}		
	self.huntsman.auto.fire_rate = 0.06
	--@SC, double barrel shotguns kicking mostly side to side instead of upwards felt really fucking bad to use. Using huntsman values scaled to match the overall recoil from new_m4.
	self.huntsman.kick.standing = {
		1.5,
		1.58,
		-0.16,
		0.16
	}
	self.huntsman.kick.crouching = {
		1.06,
		1.12,
		-0.11,
		-0.11
	}
	--Better to separate these in case we ever decide to do stance changes again
	self.huntsman.kick.steelsight = {
		1.06,
		1.12,
		-0.11,
		-0.11
	}
	self.huntsman.supported = true
	self.huntsman.stats = {
		damage = 90,
		spread = 12,
		recoil = 12,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.huntsman.stats_modifiers = nil
	self.huntsman.timers.reload_not_empty = 2.3
	self.huntsman.timers.reload_empty = 2.3	
	self.huntsman.panic_suppression_chance = 0.05
	self.b92fs.AMMO_MAX = 90
	self.b92fs.AMMO_PICKUP = self:_pickup_chance()
	self.b92fs.fire_mode_data.fire_rate = 0.08571428571
	self.b92fs.single.fire_rate = 0.08571428571
	self.b92fs.kick.standing = self.glock_17.kick.standing
	self.b92fs.kick.crouching = self.glock_17.kick.crouching
	self.b92fs.kick.steelsight = self.glock_17.kick.steelsight
	self.b92fs.supported = true
	self.b92fs.stats = {
		damage = 20,
		spread = 19,
		recoil = 24,
		spread_moving = 5,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.b92fs.stats_modifiers = nil
	self.b92fs.panic_suppression_chance = 0.05
	self.new_raging_bull.fire_mode_data = {}
	self.new_raging_bull.fire_mode_data.fire_rate = 0.19047619047
	self.new_raging_bull.single = {}
	self.new_raging_bull.single.fire_rate = 0.19047619047
	self.new_raging_bull.AMMO_MAX = 30
	self.new_raging_bull.kick.standing = self.glock_17.kick.standing
	self.new_raging_bull.kick.crouching = self.glock_17.kick.crouching
	self.new_raging_bull.kick.steelsight = self.glock_17.kick.steelsight
	self.new_raging_bull.AMMO_PICKUP = self:_pickup_chance()
	self.new_raging_bull.supported = true
	self.new_raging_bull.stats = {
		damage = 60,
		spread = 17,
		recoil = 18,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.new_raging_bull.stats_modifiers = nil
	self.new_raging_bull.timers.reload_not_empty = 2.4
	self.new_raging_bull.timers.reload_empty = 2.4		
	self.new_raging_bull.panic_suppression_chance = 0.05
	self.saw.has_description = true
	self.saw.desc_id = "bm_ap_saw_sc_desc"
	self.saw.CLIP_AMMO_MAX = 20
	self.saw.AMMO_MAX = 40
	self.saw.AMMO_PICKUP = self:_pickup_chance()
	self.saw.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.saw.kick.crouching = self.saw.kick.standing
	self.saw.kick.steelsight = self.saw.kick.standing
	self.saw.supported = true
	self.saw.stats = {
		alert_size = 7,
		suppression = 7,
		zoom = 1,
		spread = 1,
		recoil = 26,
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
	self.saw_secondary.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.saw_secondary.kick.crouching = self.saw_secondary.kick.standing
	self.saw_secondary.kick.steelsight = self.saw_secondary.kick.standing
	self.saw_secondary.has_description = true
	self.saw_secondary.desc_id = "bm_ap_saw_sc_desc"
	self.saw_secondary.CLIP_AMMO_MAX = 20
	self.saw_secondary.AMMO_MAX = 20
	self.saw_secondary.AMMO_PICKUP = self:_pickup_chance()
	self.saw_secondary.supported = true
	self.saw_secondary.stats = {
		alert_size = 7,
		suppression = 7,
		zoom = 1,
		spread = 1,
		recoil = 26,
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
	self.usp.timers = {
		reload_not_empty = 1.47,
		reload_empty = 2.12,
		unequip = 0.5,
		equip = 0.35
	}		
	self.usp.fire_mode_data.fire_rate = 0.08571428571
	self.usp.single.fire_rate = 0.08571428571
	self.usp.AMMO_MAX = 60
	self.usp.AMMO_PICKUP = self:_pickup_chance()
	self.usp.kick.standing = self.glock_17.kick.standing
	self.usp.kick.crouching = self.glock_17.kick.crouching
	self.usp.kick.steelsight = self.glock_17.kick.steelsight
	self.usp.CLIP_AMMO_MAX = 12
	self.usp.supported = true
	self.usp.stats = {
		damage = 30,
		spread = 17,
		recoil = 22,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.usp.stats_modifiers = nil
	self.usp.panic_suppression_chance = 0.05
	self.g22c.timers = {
		reload_not_empty = 1.47,
		reload_empty = 2.12,
		unequip = 0.5,
		equip = 0.35
	}		
	self.g22c.fire_mode_data.fire_rate = 0.08571428571
	self.g22c.single.fire_rate = 0.08571428571
	self.g22c.AMMO_MAX = 75
	self.g22c.AMMO_PICKUP = self:_pickup_chance()
	self.g22c.kick.standing = self.glock_17.kick.standing
	self.g22c.kick.crouching = self.glock_17.kick.crouching
	self.g22c.kick.steelsight = self.glock_17.kick.steelsight
	self.g22c.CLIP_AMMO_MAX = 16
	self.g22c.supported = true
	self.g22c.stats = {
		damage = 24,
		spread = 18,
		recoil = 23,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.g22c.stats_modifiers = nil
	self.g22c.panic_suppression_chance = 0.05
	self.judge.fire_mode_data = {}
	self.judge.fire_mode_data.fire_rate = 0.272727
	self.judge.single = {}
	self.judge.single.fire_rate = 0.272727
	self.judge.rays = 9
	self.judge.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.judge.AMMO_MAX = 20
	self.judge.AMMO_PICKUP = self:_pickup_chance()
	self.judge.supported = true
	self.judge.stats = {
		damage = 90,
		spread = 5,
		recoil = 10,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.judge.stats_modifiers = nil
	self.judge.timers.reload_not_empty = 2.4
	self.judge.timers.reload_empty = 2.4
	self.judge.panic_suppression_chance = 0.05
	self.judge.stats_modifiers = {damage = 1}
	self.judge.kick.standing = self.huntsman.kick.standing
	self.judge.kick.crouching = self.huntsman.kick.crouching
	self.judge.kick.steelsight = self.huntsman.kick.steelsight
	self.m45.CLIP_AMMO_MAX = 30
	self.m45.AMMO_MAX = 75
	self.m45.AMMO_PICKUP = self:_pickup_chance()
	self.m45.kick.standing = self.new_m4.kick.standing
	self.m45.kick.crouching = self.new_m4.kick.crouching
	self.m45.kick.steelsight = self.new_m4.kick.steelsight
	self.m45.supported = true
	self.m45.stats = {
		damage = 24,
		spread = 15,
		recoil = 23,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 5,
		reload = 20
	}
	self.m45.stats_modifiers = nil
	self.m45.timers.reload_not_empty = 2.8
	self.m45.timers.reload_empty = 3.8		
	self.m45.panic_suppression_chance = 0.05
	self.s552.AMMO_PICKUP = self:_pickup_chance()
	self.s552.fire_mode_data.fire_rate = 0.08571428571
	self.s552.auto.fire_rate = 0.08571428571
	self.s552.BURST_FIRE = 3
	self.s552.ADAPTIVE_BURST_SIZE = false															
	self.s552.kick.standing = self.new_m4.kick.standing
	self.s552.kick.crouching = self.new_m4.kick.crouching
	self.s552.kick.steelsight = self.new_m4.kick.steelsight
	self.s552.AMMO_MAX = 150
	self.s552.supported = true
	self.s552.stats = {
		damage = 24,
		spread = 15,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 24,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.s552.stats_modifiers = nil
	if SystemFS:exists("assets/mod_overrides/Classic Weapon Animations") then
		self.s552.timers.reload_not_empty = 2.5
		self.s552.timers.reload_empty = 3.45
	else
		self.s552.timers.reload_not_empty = 1.7
		self.s552.timers.reload_empty = 2.35					
	end
	self.s552.panic_suppression_chance = 0.05
	self.ppk.AMMO_MAX = 90
	self.ppk.CLIP_AMMO_MAX = 12
	self.ppk.AMMO_PICKUP = self:_pickup_chance()
	self.ppk.fire_mode_data.fire_rate = 0.08571428571
	self.ppk.single.fire_rate = 0.08571428571
	self.ppk.kick.standing = self.glock_17.kick.standing
	self.ppk.kick.crouching = self.glock_17.kick.crouching
	self.ppk.kick.steelsight = self.glock_17.kick.steelsight
	self.ppk.supported = true
	self.ppk.stats = {
		damage = 20,
		spread = 20,
		recoil = 25,
		spread_moving = 9,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ppk.stats_modifiers = nil
	self.ppk.timers.reload_not_empty = 1.45
	self.ppk.timers.reload_empty = 2.2	
	self.ppk.panic_suppression_chance = 0.05
	self.mp7.desc_id = "bm_ap_weapon_sc_desc"
	self.mp7.AMMO_MAX = 75
	self.mp7.AMMO_PICKUP = self:_pickup_chance()
	self.mp7.fire_mode_data.fire_rate = 0.06315789473
	self.mp7.CAN_TOGGLE_FIREMODE = true
	self.mp7.auto = {}
	self.mp7.auto.fire_rate = 0.06315789473
	self.mp7.kick.standing = self.new_m4.kick.standing
	self.mp7.kick.crouching = self.new_m4.kick.crouching
	self.mp7.kick.steelsight = self.new_m4.kick.steelsight			
	self.mp7.supported = true
	self.mp7.stats = {
		damage = 24,
		spread = 13,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.mp7.stats_modifiers = nil
	self.mp7.timers.reload_not_empty = 1.75
	self.mp7.timers.reload_empty = 2.4	
	self.mp7.panic_suppression_chance = 0.05
	self.scar.AMMO_MAX = 80
	self.scar.AMMO_PICKUP = self:_pickup_chance()
	self.scar.fire_mode_data.fire_rate = 0.09523809523
	self.scar.CAN_TOGGLE_FIREMODE = true
	self.scar.auto.fire_rate = 0.09523809523
	self.scar.kick.standing = self.new_m4.kick.standing
	self.scar.kick.crouching = self.new_m4.kick.crouching
	self.scar.kick.steelsight = self.new_m4.kick.steelsight		
	self.scar.supported = true
	self.scar.stats = {
		damage = 45,
		spread = 18,
		recoil = 18,
		spread_moving = 5,
		zoom = 1,
		concealment = 22,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.scar.stats_modifiers = nil
	self.scar.timers.reload_not_empty = 1.75
	self.scar.panic_suppression_chance = 0.05
	self.p226.AMMO_MAX = 75
	self.p226.CLIP_AMMO_MAX = 16
	self.p226.AMMO_PICKUP = self:_pickup_chance()
	self.p226.fire_mode_data.fire_rate = 0.08571428571
	self.p226.single.fire_rate = 0.08571428571
	self.p226.kick.standing = self.glock_17.kick.standing
	self.p226.kick.crouching = self.glock_17.kick.crouching
	self.p226.kick.steelsight = self.glock_17.kick.steelsight
	self.p226.supported = true
	self.p226.stats = {
		damage = 24,
		spread = 18,
		recoil = 23,
		spread_moving = 7,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.p226.stats_modifiers = nil
	self.p226.panic_suppression_chance = 0.05
	self.hk21.categories = {
		"lmg",
		"smg"
	}
	self.hk21.CLIP_AMMO_MAX = 100
	self.hk21.AMMO_MAX = 270
	self.hk21.AMMO_PICKUP = self:_pickup_chance()
	self.hk21.fire_mode_data.fire_rate = 0.075
	self.hk21.auto.fire_rate = 0.075
	self.hk21.kick.standing = self.new_m4.kick.standing
	self.hk21.kick.crouching = self.new_m4.kick.crouching
	self.hk21.kick.steelsight = self.new_m4.kick.steelsight
	self.hk21.panic_suppression_chance = 0.05
	self.hk21.supported = true
	self.hk21.stats = {
		damage = 20,
		spread = 13,
		recoil = 24,
		spread_moving = 8,
		zoom = 1,
		concealment = 20,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.hk21.swap_speed_multiplier = 0.9
	self.hk21.stats_modifiers = nil
	self.m249.categories = {
		"lmg",
		"smg"
	}
	self.m249.desc_id = "bm_menu_sc_m249_desc"
	self.m249.CLIP_AMMO_MAX = 200
	self.m249.AMMO_MAX = 300
	self.m249.AMMO_PICKUP = self:_pickup_chance()
	self.m249.fire_mode_data.fire_rate = 0.075
	self.m249.auto.fire_rate = 0.075
	self.m249.kick.standing = self.new_m4.kick.standing
	self.m249.kick.crouching = self.new_m4.kick.crouching
	self.m249.kick.steelsight = self.new_m4.kick.steelsight
	self.m249.supported = true
	self.m249.stats = {
		damage = 18,
		spread = 14,
		recoil = 23,
		spread_moving = 9,
		zoom = 1,
		concealment = 19,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.m249.stats_modifiers = nil
	self.m249.timers.reload_not_empty = 5.5
	self.m249.timers.reload_empty = 5.5	
	self.m249.panic_suppression_chance = 0.05
	self.m249.swap_speed_multiplier = 0.9
	self.rpk.categories = {
		"lmg",
		"smg"
	}
	self.rpk.CLIP_AMMO_MAX = 100
	self.rpk.AMMO_MAX = 225
	self.rpk.AMMO_PICKUP = self:_pickup_chance()
	self.rpk.fire_mode_data.fire_rate = 0.0923076923
	self.rpk.CAN_TOGGLE_FIREMODE = false
	self.rpk.auto = {}
	self.rpk.auto.fire_rate = 0.0923076923
	self.rpk.kick.standing = self.new_m4.kick.standing
	self.rpk.kick.crouching = self.new_m4.kick.crouching
	self.rpk.kick.steelsight = self.new_m4.kick.steelsight
	self.rpk.supported = true
	self.rpk.stats = {
		damage = 24,
		spread = 13,
		recoil = 24,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.rpk.stats_modifiers = nil
	self.rpk.panic_suppression_chance = 0.055
	self.rpk.swap_speed_multiplier = 0.9
	self.m95.upgrade_blocks = nil
	self.m95.has_description = true
	self.m95.desc_id = "bm_heavy_ap_weapon_sc_desc"
	self.m95.AMMO_PICKUP = self:_pickup_chance()
	self.m95.AMMO_MAX = 20
	self.m95.fire_mode_data.fire_rate = 1.2
	self.m95.kick.standing = self.huntsman.kick.standing
	self.m95.kick.crouching = self.huntsman.kick.crouching
	self.m95.kick.steelsight = self.huntsman.kick.steelsight
	self.m95.supported = true
	self.m95.stats = {
		damage = 180,
		spread = 19,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 14,
		suppression = 2,
		alert_size = 2,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.m95.armor_piercing_chance = 1
	self.m95.can_shoot_through_titan_shield = true
	self.m95.stats_modifiers = nil
	self.m95.panic_suppression_chance = 0.05
	self.m95.swap_speed_multiplier = 1.15
	self.msr.upgrade_blocks = nil
	self.msr.has_description = true
	self.msr.desc_id = "bm_ap_weapon_sc_desc"
	self.msr.CLIP_AMMO_MAX = 10
	self.msr.NR_CLIPS_MAX = 5
	self.msr.AMMO_MAX = 40
	self.msr.AMMO_PICKUP = self:_pickup_chance()
	self.msr.fire_mode_data.fire_rate = 0.75
	self.msr.kick.standing = self.huntsman.kick.standing
	self.msr.kick.crouching = self.huntsman.kick.crouching
	self.msr.kick.steelsight = self.huntsman.kick.steelsight
	self.msr.supported = true
	self.msr.stats = {
		damage = 90,
		spread = 19,
		recoil = 14,
		spread_moving = 8,
		zoom = 1,
		concealment = 23,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.msr.stats_modifiers = nil
	self.msr.panic_suppression_chance = 0.05
	self.r93.upgrade_blocks = nil
	self.r93.has_description = true
	self.r93.desc_id = "bm_ap_weapon_sc_desc"
	self.r93.CLIP_AMMO_MAX = 6
	self.r93.AMMO_MAX = 30
	self.r93.AMMO_PICKUP = self:_pickup_chance()
	self.r93.fire_mode_data.fire_rate = 1
	self.r93.kick.standing = self.huntsman.kick.standing
	self.r93.kick.crouching = self.huntsman.kick.crouching
	self.r93.kick.steelsight = self.huntsman.kick.steelsight
	self.r93.supported = true
	self.r93.stats = {
		damage = 120,
		spread = 18,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 19,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.r93.armor_piercing_chance = 1
	self.r93.stats_modifiers = nil
	self.r93.panic_suppression_chance = 0.05
	self.fal.AMMO_MAX = 120
	self.fal.AMMO_PICKUP = self:_pickup_chance()
	self.fal.CLIP_AMMO_MAX = 30
	self.fal.fire_mode_data.fire_rate = 0.08571428571
	self.fal.CAN_TOGGLE_FIREMODE = true
	self.fal.auto = {}
	self.fal.auto.fire_rate = 0.08571428571
	self.fal.kick.standing = self.new_m4.kick.standing
	self.fal.kick.crouching = self.new_m4.kick.crouching
	self.fal.kick.steelsight = self.new_m4.kick.steelsight		
	self.fal.supported = true
	self.fal.stats = {
		damage = 30,
		spread = 16,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.fal.stats_modifiers = nil
	self.fal.panic_suppression_chance = 0.05
	self.benelli.AMMO_MAX = 80
	self.benelli.AMMO_PICKUP = self:_pickup_chance()
	self.benelli.rays = 9
	self.benelli.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.benelli.fire_mode_data.fire_rate = 0.13953488372
	self.benelli.CAN_TOGGLE_FIREMODE = false
	self.benelli.single = {}
	self.benelli.single.fire_rate = 0.13953488372
	self.benelli.kick.standing = self.new_m4.kick.standing
	self.benelli.kick.crouching = self.new_m4.kick.crouching
	self.benelli.kick.steelsight = self.new_m4.kick.steelsight
	self.benelli.supported = true
	self.benelli.stats = {
		damage = 45,
		spread = 8,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 22,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.benelli.stats_modifiers = nil
	self.benelli.panic_suppression_chance = 0.05
	self.striker.rays = 9
	self.striker.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.striker.AMMO_MAX = 40
	self.striker.AMMO_PICKUP = self:_pickup_chance()
	self.striker.fire_mode_data.fire_rate = 0.13953488372
	self.striker.CAN_TOGGLE_FIREMODE = false
	self.striker.single = {}
	self.striker.single.fire_rate = 0.13953488372
	self.striker.CLIP_AMMO_MAX = 12
	self.striker.kick.standing = self.new_m4.kick.standing
	self.striker.kick.crouching = self.new_m4.kick.crouching
	self.striker.kick.steelsight = self.new_m4.kick.steelsight
	self.striker.supported = true
	self.striker.stats = {
		damage = 45,
		spread = 7,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 20,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.striker.stats_modifiers = nil
	self.striker.panic_suppression_chance = 0.05
	self.striker.timers.shotgun_reload_first_shell_offset = 0.4
	self.ksg.rays = 9
	self.ksg.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.ksg.AMMO_MAX = 60
	self.ksg.CLIP_AMMO_MAX = 12
	self.ksg.single.fire_rate = 0.6
	self.ksg.fire_mode_data.fire_rate = 0.6
	self.ksg.kick.standing = self.new_m4.kick.standing
	self.ksg.kick.crouching = self.new_m4.kick.crouching
	self.ksg.kick.steelsight = self.new_m4.kick.steelsight		
	self.ksg.AMMO_PICKUP = self:_pickup_chance()
	self.ksg.supported = true
	self.ksg.stats = {
		damage = 60,
		spread = 8,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 23,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ksg.stats_modifiers = nil
	self.ksg.panic_suppression_chance = 0.05
	self.gre_m79.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.gre_m79.desc_id = "bm_40mm_weapon_sc_desc"
	self.gre_m79.has_description = true
	self.gre_m79.fire_mode_data.fire_rate = 1
	self.gre_m79.kick.standing = self.huntsman.kick.standing
	self.gre_m79.kick.crouching = self.huntsman.kick.crouching
	self.gre_m79.kick.steelsight = self.huntsman.kick.steelsight
	self.gre_m79.AMMO_MAX = 9
	self.gre_m79.AMMO_PICKUP = self:_pickup_chance()
	self.gre_m79.supported = true
	self.gre_m79.stats = {
		damage = 80,
		spread = 21,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.gre_m79.panic_suppression_chance = 0.05
	self.gre_m79.stats_modifiers = {damage = 10}
	self.g3.AMMO_MAX = 60
	self.g3.CLIP_AMMO_MAX = 20
	self.g3.AMMO_PICKUP = self:_pickup_chance()
	self.g3.fire_mode_data.fire_rate = 0.1
	self.g3.CAN_TOGGLE_FIREMODE = true
	self.g3.auto = {}
	self.g3.auto.fire_rate = 0.1
	self.g3.kick.standing = self.new_m4.kick.standing
	self.g3.kick.crouching = self.new_m4.kick.crouching
	self.g3.kick.steelsight = self.new_m4.kick.steelsight		
	self.g3.supported = true
	self.g3.stats = {
		damage = 60,
		spread = 18,
		recoil = 17,
		spread_moving = 7,
		zoom = 1,
		concealment = 20,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.g3.stats_modifiers = nil
	self.g3.panic_suppression_chance = 0.05
	self.galil.AMMO_MAX = 150
	self.galil.AMMO_PICKUP = self:_pickup_chance()
	self.galil.FIRE_MODE = "auto"
	self.galil.fire_mode_data = {}
	self.galil.fire_mode_data.fire_rate = 0.08
	self.galil.CAN_TOGGLE_FIREMODE = true
	self.galil.auto = {}
	self.galil.auto.fire_rate = 0.08
	self.galil.kick.standing = self.new_m4.kick.standing
	self.galil.kick.crouching = self.new_m4.kick.crouching
	self.galil.kick.steelsight = self.new_m4.kick.steelsight
	self.galil.supported = true
	self.galil.stats = {
		damage = 24,
		spread = 18,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 24,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.galil.stats_modifiers = nil
	self.galil.timers.reload_not_empty = 2.6
	self.galil.timers.reload_empty = 3.9
	self.galil.panic_suppression_chance = 0.05
	self.famas.AMMO_MAX = 180
	self.famas.AMMO_PICKUP = self:_pickup_chance()
	self.famas.CLIP_AMMO_MAX = 25
	self.famas.fire_mode_data.fire_rate = 0.06
	self.famas.CAN_TOGGLE_FIREMODE = true
	self.famas.auto = {}
	self.famas.auto.fire_rate = 0.06
	self.famas.kick.standing = self.new_m4.kick.standing
	self.famas.kick.crouching = self.new_m4.kick.crouching
	self.famas.kick.steelsight = self.new_m4.kick.steelsight
	self.famas.supported = true
	self.famas.stats = {
		damage = 20,
		spread = 19,
		recoil = 17,
		spread_moving = 4,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.famas.stats_modifiers = nil
	self.famas.timers.reload_not_empty = 2.6
	self.famas.panic_suppression_chance = 0.05
	self.famas.BURST_FIRE = 3
	self.famas.ADAPTIVE_BURST_SIZE = false
	self.scorpion.AMMO_MAX = 90
	self.scorpion.AMMO_PICKUP = self:_pickup_chance()
	self.scorpion.FIRE_MODE = "auto"
	self.scorpion.fire_mode_data = {}
	self.scorpion.fire_mode_data.fire_rate = 0.07058823529
	self.scorpion.CAN_TOGGLE_FIREMODE = true
	self.scorpion.auto = {}
	self.scorpion.auto.fire_rate = 0.07058823529
	self.scorpion.kick.standing = self.new_m4.kick.standing
	self.scorpion.kick.crouching = self.new_m4.kick.crouching
	self.scorpion.kick.steelsight = self.new_m4.kick.steelsight
	self.scorpion.supported = true
	self.scorpion.stats = {
		damage = 20,
		spread = 15,
		recoil = 22,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.scorpion.stats_modifiers = nil
	self.scorpion.timers.reload_not_empty = 1.95		
	self.scorpion.panic_suppression_chance = 0.05
	self.tec9.AMMO_MAX = 75
	self.tec9.CLIP_AMMO_MAX = 20
	self.tec9.AMMO_PICKUP = self:_pickup_chance()
	self.tec9.FIRE_MODE = "auto"
	self.tec9.fire_mode_data = {}
	self.tec9.fire_mode_data.fire_rate = 0.06
	self.tec9.CAN_TOGGLE_FIREMODE = true
	self.tec9.auto = {}
	self.tec9.auto.fire_rate = 0.06
	self.tec9.kick.standing = self.new_m4.kick.standing
	self.tec9.kick.crouching = self.new_m4.kick.crouching
	self.tec9.kick.steelsight = self.new_m4.kick.steelsight
	self.tec9.supported = true
	self.tec9.stats = {
		damage = 24,
		spread = 15,
		recoil = 18,
		spread_moving = 10,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.tec9.stats_modifiers = nil
	self.tec9.panic_suppression_chance = 0.05
	self.uzi.AMMO_MAX = 60
	self.uzi.CLIP_AMMO_MAX = 22
	self.uzi.AMMO_PICKUP = self:_pickup_chance()
	self.uzi.FIRE_MODE = "auto"
	self.uzi.fire_mode_data = {}
	self.uzi.fire_mode_data.fire_rate = 0.1
	self.uzi.CAN_TOGGLE_FIREMODE = true
	self.uzi.auto = {}
	self.uzi.auto.fire_rate = 0.1
	self.uzi.kick.standing = self.new_m4.kick.standing
	self.uzi.kick.crouching = self.new_m4.kick.crouching
	self.uzi.kick.steelsight = self.new_m4.kick.steelsight
	self.uzi.supported = true
	self.uzi.stats = {
		damage = 30,
		spread = 15,
		recoil = 23,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.uzi.stats_modifiers = nil
	self.uzi.panic_suppression_chance = 0.05
	self.uzi.timers.reload_not_empty = 2.40
	self.uzi.timers.reload_empty = 3.6
	self.jowi.kick.standing = self.glock_17.kick.standing
	self.jowi.kick.crouching = self.glock_17.kick.crouching
	self.jowi.kick.steelsight = self.glock_17.kick.steelsight
	self.jowi.AMMO_MAX = 180
	self.jowi.AMMO_PICKUP = self:_pickup_chance()
	self.jowi.fire_mode_data.fire_rate = 0.08571428571
	self.jowi.single = {}
	self.jowi.single.fire_rate = 0.08571428571
	self.jowi.supported = true
	self.jowi.stats = {
		damage = 20,
		spread = 18,
		recoil = 15,
		spread_moving = 9,
		zoom = 1,
		concealment = 32,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.jowi.stats_modifiers = nil
	self.jowi.panic_suppression_chance = 0.05
	self.x_1911.CLIP_AMMO_MAX = 16
	self.x_1911.AMMO_MAX = 80
	self.x_1911.AMMO_PICKUP = self:_pickup_chance()
	self.x_1911.fire_mode_data.fire_rate = 0.08571428571
	self.x_1911.single = {}
	self.x_1911.single.fire_rate = 0.08571428571
	self.x_1911.kick.standing = self.glock_17.kick.standing
	self.x_1911.kick.crouching = self.glock_17.kick.crouching
	self.x_1911.kick.steelsight = self.glock_17.kick.steelsight
	self.x_1911.supported = true
	self.x_1911.stats = {
		damage = 45,
		spread = 16,
		recoil = 9,
		spread_moving = 5,
		zoom = 1,
		concealment = 26,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_1911.stats_modifiers = nil
	self.x_1911.panic_suppression_chance = 0.05
	self.x_b92fs.kick.standing = self.glock_17.kick.standing
	self.x_b92fs.kick.crouching = self.glock_17.kick.crouching
	self.x_b92fs.kick.steelsight = self.glock_17.kick.steelsight
	self.x_b92fs.AMMO_MAX = 180
	self.x_b92fs.AMMO_PICKUP = self:_pickup_chance()
	self.x_b92fs.FIRE_MODE = "single"
	self.x_b92fs.fire_mode_data.fire_rate = 0.08571428571
	self.x_b92fs.single.fire_rate = 0.08571428571
	self.x_b92fs.supported = true
	self.x_b92fs.stats = {
		damage = 20,
		spread = 17,
		recoil = 14,
		spread_moving = 5,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_b92fs.stats_modifiers = nil
	self.x_b92fs.panic_suppression_chance = 0.05
	self.x_deagle.has_description = false
	self.x_deagle.desc_id = "bm_ap_weapon_sc_desc"
	self.x_deagle.CLIP_AMMO_MAX = 16
	self.x_deagle.AMMO_MAX = 60
	self.x_deagle.AMMO_PICKUP = self:_pickup_chance()
	self.x_deagle.FIRE_MODE = "single"
	self.x_deagle.fire_mode_data = {}
	self.x_deagle.fire_mode_data.fire_rate = 0.1
	self.x_deagle.single = {}
	self.x_deagle.single.fire_rate = 0.1
	self.x_deagle.kick.standing = self.glock_17.kick.standing
	self.x_deagle.kick.crouching = self.glock_17.kick.crouching
	self.x_deagle.kick.steelsight = self.glock_17.kick.steelsight
	self.x_deagle.animations.has_steelsight_stance = true
	self.x_deagle.supported = true
	self.x_deagle.stats = {
		damage = 60,
		spread = 16,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_deagle.stats_modifiers = nil
	self.x_deagle.panic_suppression_chance = 0.05
	self.g26.AMMO_MAX = 90
	self.g26.AMMO_PICKUP = self:_pickup_chance()
	self.g26.kick.standing = self.glock_17.kick.standing
	self.g26.kick.crouching = self.glock_17.kick.crouching
	self.g26.kick.steelsight = self.glock_17.kick.steelsight
	self.g26.fire_mode_data.fire_rate = 0.08571428571
	self.g26.single.fire_rate = 0.08571428571
	self.g26.supported = true
	self.g26.stats = {
		damage = 20,
		spread = 20,
		recoil = 25,
		spread_moving = 9,
		zoom = 1,
		concealment = 32,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.g26.stats_modifiers = nil
	self.g26.panic_suppression_chance = 0.05
	self.spas12.rays = 9
	self.spas12.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.spas12.AMMO_MAX = 80
	self.spas12.CLIP_AMMO_MAX = 8
	self.spas12.AMMO_PICKUP = self:_pickup_chance()
	self.spas12.fire_mode_data.fire_rate = 0.13953488372
	self.spas12.CAN_TOGGLE_FIREMODE = false
	self.spas12.single = {}
	self.spas12.single.fire_rate = 0.13953488372
	self.spas12.kick.standing = self.new_m4.kick.standing
	self.spas12.kick.crouching = self.new_m4.kick.crouching
	self.spas12.kick.steelsight = self.new_m4.kick.steelsight
	self.spas12.supported = true
	self.spas12.stats = {
		damage = 45,
		spread = 8,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 22,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.spas12.stats_modifiers = nil
	self.spas12.panic_suppression_chance = 0.05
	self.spas12.stats_modifiers = {damage = 1}
	self.mg42.categories = {
		"lmg",
		"smg"
	}
	self.mg42.CLIP_AMMO_MAX = 75
	self.mg42.AMMO_MAX = 225
	self.mg42.AMMO_PICKUP = self:_pickup_chance()
	self.mg42.kick.standing = self.new_m4.kick.standing
	self.mg42.kick.crouching = self.new_m4.kick.crouching
	self.mg42.kick.steelsight = self.new_m4.kick.steelsight
	self.mg42.supported = true
	self.mg42.stats = {
		damage = 24,
		spread = 17,
		recoil = 16,
		spread_moving = 9,
		zoom = 1,
		concealment = 18,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.mg42.stats_modifiers = nil
	self.mg42.timers.reload_not_empty = 6.25
	self.mg42.timers.reload_empty = 6.25	
	self.mg42.panic_suppression_chance = 0.05
	self.mg42.swap_speed_multiplier = 0.9
	--Broomstick--
	self.c96.sounds.fire = "c96_fire"
	self.c96.sounds.fire_single = "c96_fire"
	self.c96.sounds.fire_auto = "g18c_fire"
	self.c96.sounds.stop_fire = "g18c_stop"
	self.c96.sounds.dryfire = "secondary_dryfire"
	self.c96.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.c96.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.c96.sounds.magazine_empty = "wp_pistol_slide_lock"		
	self.c96.has_description = true
	self.c96.desc_id = "bm_c96_sc_desc"
	self.c96.AMMO_MAX = 60
	self.c96.AMMO_PICKUP = self:_pickup_chance()
	self.c96.FIRE_MODE = "auto"
	self.c96.CAN_TOGGLE_FIREMODE = true
	self.c96.fire_mode_data.fire_rate = 0.06
	self.c96.single.fire_rate = 0.06
	self.c96.kick.standing = self.new_m4.kick.standing
	self.c96.kick.crouching = self.new_m4.kick.crouching
	self.c96.kick.steelsight = self.new_m4.kick.steelsight
	self.c96.supported = true
	self.c96.stats = {
		damage = 30,
		spread = 16,
		recoil = 20,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.c96.stats_modifiers = nil
	self.c96.timers.reload_not_empty = 3.7
	self.c96.panic_suppression_chance = 0.05
	
	self.sterling.CLIP_AMMO_MAX = 20
	self.sterling.AMMO_MAX = 75
	self.sterling.AMMO_PICKUP = self:_pickup_chance()
	self.sterling.fire_mode_data.fire_rate = 0.10909090909
	self.sterling.CAN_TOGGLE_FIREMODE = true
	self.sterling.auto = {}
	self.sterling.auto.fire_rate = 0.10909090909
	self.sterling.kick.standing = self.new_m4.kick.standing
	self.sterling.kick.crouching = self.new_m4.kick.crouching
	self.sterling.kick.steelsight = self.new_m4.kick.steelsight
	self.sterling.supported = true
	self.sterling.stats = {
		damage = 24,
		spread = 15,
		recoil = 24,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.sterling.stats_modifiers = nil
	self.sterling.panic_suppression_chance = 0.05
	--Mosin--
	self.mosin.has_description = true
	self.mosin.desc_id = "bm_mosin_sc_desc"
	self.mosin.CLIP_AMMO_MAX = 5
	self.mosin.AMMO_MAX = 30
	self.mosin.AMMO_PICKUP = self:_pickup_chance()
	self.mosin.fire_mode_data.fire_rate = 1
	self.mosin.kick.standing = self.huntsman.kick.standing
	self.mosin.kick.crouching = self.huntsman.kick.crouching
	self.mosin.kick.steelsight = self.huntsman.kick.steelsight
	self.mosin.supported = true
	self.mosin.stats = {
		damage = 120,
		spread = 19,
		recoil = 12,
		spread_moving = 9,
		zoom = 1,
		concealment = 20,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.mosin.stats_modifiers = nil
	self.mosin.panic_suppression_chance = 0.05
	
	self.m1928.use_data.selection_index = 1
	self.m1928.fire_mode_data.fire_rate = 0.075
	self.m1928.CAN_TOGGLE_FIREMODE = true
	self.m1928.auto = {}
	self.m1928.auto.fire_rate = 0.075
	self.m1928.CLIP_AMMO_MAX = 50
	self.m1928.AMMO_MAX = 75
	self.m1928.AMMO_PICKUP = self:_pickup_chance()
	self.m1928.kick.standing = self.new_m4.kick.standing
	self.m1928.kick.crouching = self.new_m4.kick.crouching
	self.m1928.kick.steelsight = self.new_m4.kick.steelsight
	self.m1928.panic_suppression_chance = 0.05
	self.m1928.supported = true
	self.m1928.stats = {
		damage = 24,
		spread = 14,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.m1928.stats_modifiers = nil
	self.m1928.timers.reload_not_empty = 3.3
	self.m1928.panic_suppression_chance = 0.05
	self.l85a2.CLIP_AMMO_MAX = 30
	self.l85a2.AMMO_MAX = 150
	self.l85a2.AMMO_PICKUP = self:_pickup_chance()
	self.l85a2.FIRE_MODE = "auto"
	self.l85a2.fire_mode_data = {}
	self.l85a2.fire_mode_data.fire_rate = 0.0923076923
	self.l85a2.CAN_TOGGLE_FIREMODE = true
	self.l85a2.auto = {}
	self.l85a2.auto.fire_rate = 0.0923076923
	self.l85a2.kick = {}
	self.l85a2.kick.standing = self.new_m4.kick.standing
	self.l85a2.kick.crouching = self.new_m4.kick.crouching
	self.l85a2.kick.steelsight = self.new_m4.kick.steelsight
	self.l85a2.supported = true
	self.l85a2.stats = {
		damage = 24,
		spread = 18,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.l85a2.stats_modifiers = nil
	self.l85a2.timers.reload_not_empty = 3
	self.l85a2.timers.reload_empty = 4	
	self.l85a2.panic_suppression_chance = 0.05
	self.vhs.CLIP_AMMO_MAX = 30
	self.vhs.AMMO_MAX = 180
	self.vhs.AMMO_PICKUP = self:_pickup_chance()
	self.vhs.fire_mode_data.fire_rate = 0.06976744186
	self.vhs.CAN_TOGGLE_FIREMODE = true
	self.vhs.auto = {}
	self.vhs.auto.fire_rate = 0.06976744186
	self.vhs.kick.standing = self.new_m4.kick.standing
	self.vhs.kick.crouching = self.new_m4.kick.crouching
	self.vhs.kick.steelsight = self.new_m4.kick.steelsight
	self.vhs.supported = true
	self.vhs.stats = {
		damage = 20,
		spread = 20,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.vhs.stats_modifiers = nil
	self.vhs.timers.reload_empty = 4.6
	self.vhs.panic_suppression_chance = 0.05
	self.hs2000.CLIP_AMMO_MAX = 14
	self.hs2000.AMMO_MAX = 60
	self.hs2000.AMMO_PICKUP = self:_pickup_chance()
	self.hs2000.FIRE_MODE = "single"
	self.hs2000.fire_mode_data = {}
	self.hs2000.fire_mode_data.fire_rate = 0.08571428571
	self.hs2000.single = {}
	self.hs2000.single.fire_rate = 0.08571428571
	self.hs2000.kick.standing = self.glock_17.kick.standing
	self.hs2000.kick.crouching = self.glock_17.kick.crouching
	self.hs2000.kick.steelsight = self.glock_17.kick.steelsight
	self.hs2000.supported = true
	self.hs2000.stats = {
		damage = 30,
		spread = 16,
		recoil = 23,
		spread_moving = 7,
		zoom = 1,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.hs2000.stats_modifiers = nil
	self.hs2000.panic_suppression_chance = 0.05
	self.m134.categories = {
		"minigun",
		"smg"
	}
	self.m134.has_description = false
	self.m134.CLIP_AMMO_MAX = 300
	self.m134.NR_CLIPS_MAX = 1
	self.m134.AMMO_MAX = 300
	self.m134.AMMO_PICKUP = self:_pickup_chance()
	self.m134.FIRE_MODE = "auto"
	self.m134.fire_mode_data = {}
	self.m134.fire_mode_data.fire_rate = 0.03
	self.m134.CAN_TOGGLE_FIREMODE = false
	self.m134.auto = {}
	self.m134.auto.fire_rate = 0.03
	self.m134.kick.standing = self.new_m4.kick.standing
	self.m134.kick.crouching = self.new_m4.kick.crouching
	self.m134.kick.steelsight = self.new_m4.kick.steelsight
	self.m134.panic_suppression_chance = 0.05
	self.m134.supported = true
	self.m134.stats = {
		damage = 18,
		spread = 15,
		recoil = 21,
		spread_moving = 9,
		zoom = 1,
		concealment = 10,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.m134.stats_modifiers = nil
	--She’s a gunshot bride
	self.rpg7.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.rpg7.kick.standing = self.huntsman.kick.standing
	self.rpg7.kick.crouching = self.huntsman.kick.crouching
	self.rpg7.kick.steelsight = self.huntsman.kick.steelsight
	self.rpg7.has_description = true
	self.rpg7.desc_id = "bm_rocket_launcher_sc_desc"
	self.rpg7.fire_mode_data.fire_rate = 2
	self.rpg7.AMMO_MAX = 4
	self.rpg7.AMMO_PICKUP = self:_pickup_chance()
	self.rpg7.timers.reload_not_empty = 4.7
	self.rpg7.timers.reload_empty = 4.7
	self.rpg7.supported = true
	self.rpg7.stats = {
		damage = 400,
		spread = 16,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 12,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.rpg7.panic_suppression_chance = 0.05
	self.rpg7.stats_modifiers = {damage = 3}
	self.rpg7.swap_speed_multiplier = 1.25
	self.rpg7.turret_instakill = true
	self.cobray.timers.reload_not_empty = 2
	self.cobray.timers.reload_empty = 4.25
	self.cobray.CLIP_AMMO_MAX = 30
	self.cobray.NR_CLIPS_MAX = 4
	self.cobray.AMMO_MAX = 60
	self.cobray.AMMO_PICKUP = self:_pickup_chance()
	self.cobray.kick.standing = self.new_m4.kick.standing
	self.cobray.kick.crouching = self.new_m4.kick.crouching
	self.cobray.kick.steelsight = self.new_m4.kick.steelsight
	self.cobray.fire_mode_data.fire_rate = 0.06
	self.cobray.CAN_TOGGLE_FIREMODE = true
	self.cobray.auto = {}
	self.cobray.auto.fire_rate = 0.06
	self.cobray.supported = true
	self.cobray.stats = {
		damage = 30,
		spread = 17,
		recoil = 17,
		spread_moving = 8,
		zoom = 1,
		concealment = 22,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.cobray.stats_modifiers = nil
	self.cobray.panic_suppression_chance = 0.05
	self.b682.rays = 9
	self.b682.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.b682.AMMO_MAX = 40
	self.b682.AMMO_PICKUP = self:_pickup_chance()
	self.b682.fire_mode_data = {}
	self.b682.CAN_TOGGLE_FIREMODE = false										
	self.b682.fire_mode_data.fire_rate = 0.075
	self.b682.single = {}
	self.b682.single.fire_rate = 0.075		
	self.b682.auto = {}		
	self.b682.auto.fire_rate = 0.075			
	self.b682.sounds.fire_single = "b682_fire"
	self.b682.sounds.fire_auto = "b682_fire"		
	self.b682.kick.standing = self.huntsman.kick.standing
	self.b682.kick.crouching = self.huntsman.kick.crouching
	self.b682.kick.steelsight = self.huntsman.kick.steelsight		
	self.b682.supported = true
	self.b682.stats = {
		damage = 90,
		spread = 13,
		recoil = 13,
		spread_moving = 6,
		zoom = 1,
		concealment = 20,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.b682.stats_modifiers = nil
	self.b682.panic_suppression_chance = 0.05
	self.b682.stats_modifiers = {damage = 1}
	self.x_g22c.kick.standing = self.glock_17.kick.standing
	self.x_g22c.kick.crouching = self.glock_17.kick.crouching
	self.x_g22c.kick.steelsight = self.glock_17.kick.steelsight
	self.x_g22c.CLIP_AMMO_MAX = 32
	self.x_g22c.AMMO_MAX = 150
	self.x_g22c.AMMO_PICKUP = self:_pickup_chance()
	self.x_g22c.FIRE_MODE = "single"
	self.x_g22c.fire_mode_data = {}
	self.x_g22c.fire_mode_data.fire_rate = 0.08571428571
	self.x_g22c.single = {}
	self.x_g22c.single.fire_rate = 0.08571428571
	self.x_g22c.supported = true
	self.x_g22c.stats = {
		damage = 24,
		spread = 16,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_g22c.stats_modifiers = nil
	self.x_g22c.panic_suppression_chance = 0.05
	self.x_g17.kick.standing = self.glock_17.kick.standing
	self.x_g17.kick.crouching = self.glock_17.kick.crouching
	self.x_g17.kick.steelsight = self.glock_17.kick.steelsight
	self.x_g17.CLIP_AMMO_MAX = 36
	self.x_g17.AMMO_MAX = 180
	self.x_g17.AMMO_PICKUP = self:_pickup_chance()
	self.x_g17.FIRE_MODE = "single"
	self.x_g17.fire_mode_data.fire_rate = 0.08571428571
	self.x_g17.single.fire_rate = 0.08571428571
	self.x_g17.supported = true
	self.x_g17.stats = {
		damage = 20,
		spread = 16,
		recoil = 14,
		spread_moving = 7,
		zoom = 1,
		concealment = 30,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_g17.stats_modifiers = nil
	self.x_g17.panic_suppression_chance = 0.05
	self.x_usp.kick.standing = self.glock_17.kick.standing
	self.x_usp.kick.crouching = self.glock_17.kick.crouching
	self.x_usp.kick.steelsight = self.glock_17.kick.steelsight
	self.x_usp.CLIP_AMMO_MAX = 24
	self.x_usp.AMMO_MAX = 120
	self.x_usp.AMMO_PICKUP = self:_pickup_chance()
	self.x_usp.fire_mode_data.fire_rate = 0.08571428571
	self.x_usp.single = {}
	self.x_usp.single.fire_rate = 0.08571428571
	self.x_usp.supported = true
	self.x_usp.stats = {
		damage = 30,
		spread = 15,
		recoil = 12,
		spread_moving = 8,
		zoom = 1,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_usp.stats_modifiers = nil
	self.x_usp.panic_suppression_chance = 0.05
	self.flamethrower_mk2.categories = {
		"flamethrower",
		"shotgun"
	}
	self.flamethrower_mk2.recategorize = "wpn_special"
	self.flamethrower_mk2.has_description = true
	self.flamethrower_mk2.desc_id = "bm_ap_flamethrower_sc_desc"
	self.flamethrower_mk2.timers.reload_not_empty = 7.7
	self.flamethrower_mk2.timers.reload_empty = 7.7
	self.flamethrower_mk2.rays = 9
	self.flamethrower_mk2.CLIP_AMMO_MAX = 60
	self.flamethrower_mk2.AMMO_MAX = 120
	self.flamethrower_mk2.AMMO_PICKUP = self:_pickup_chance()
	self.flamethrower_mk2.fire_mode_data.fire_rate = 0.1
	self.flamethrower_mk2.auto = {}
	self.flamethrower_mk2.auto.fire_rate = 0.1
	self.flamethrower_mk2.flame_max_range = 1600
	self.flamethrower_mk2.single_flame_effect_duration = 1
	self.flamethrower_mk2.armor_piercing_chance = 1
	self.flamethrower_mk2.can_shoot_through_enemy = false
	self.flamethrower_mk2.can_shoot_through_shield = false
	self.flamethrower_mk2.can_shoot_through_wall = false
	self.flamethrower_mk2.kick.standing = self.new_m4.kick.standing
	self.flamethrower_mk2.kick.crouching = self.new_m4.kick.crouching
	self.flamethrower_mk2.kick.steelsight = self.new_m4.kick.steelsight
	self.flamethrower_mk2.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 999999,
		dot_trigger_chance = 50,
		dot_length = 3.1,
		dot_tick_period = 0.5
	}
	self.flamethrower_mk2.supported = true
	self.flamethrower_mk2.stats = {
		damage = 25,
		spread = 7,
		recoil = 23,
		spread_moving = 6,
		zoom = 1,
		concealment = 16,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.flamethrower_mk2.stats_modifiers = nil
	self.flamethrower_mk2.panic_suppression_chance = 0.05
	self.m32.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}				
	self.m32.kick.standing = self.huntsman.kick.standing
	self.m32.kick.crouching = self.huntsman.kick.crouching
	self.m32.kick.steelsight = self.huntsman.kick.steelsight
	self.m32.fire_mode_data.fire_rate = 0.75
	self.m32.single.fire_rate = 0.75
	self.m32.AMMO_MAX = 9
	self.m32.AMMO_PICKUP = self:_pickup_chance()
	self.m32.supported = true
	self.m32.stats = {
		damage = 80,
		spread = 6,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 15,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.m32.stats_modifiers = {damage = 10}
	self.m32.panic_suppression_chance = 0.05
	self.m32.timers.shotgun_reload_first_shell_offset = 1
	self.m32.swap_speed_multiplier = 1.2
	self.aa12.rays = 9
	self.aa12.AMMO_MAX = 80
	self.aa12.CLIP_AMMO_MAX = 10
	self.aa12.AMMO_PICKUP = self:_pickup_chance()
	self.aa12.kick.standing = self.new_m4.kick.standing
	self.aa12.kick.crouching = self.new_m4.kick.crouching
	self.aa12.kick.steelsight = self.new_m4.kick.steelsight
	self.aa12.FIRE_MODE = "auto"				
	self.aa12.CAN_TOGGLE_FIREMODE = false
	self.aa12.supported = true
	self.aa12.stats = {
		damage = 45,
		spread = 6,
		recoil = 21,
		spread_moving = 7,
		zoom = 1,
		concealment = 20,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.aa12.stats_modifiers = nil
	self.aa12.panic_suppression_chance = 0.05
	self.peacemaker.AMMO_MAX = 20
	self.peacemaker.AMMO_PICKUP = self:_pickup_chance()
	self.peacemaker.kick.standing = self.huntsman.kick.standing
	self.peacemaker.kick.crouching = self.huntsman.kick.crouching
	self.peacemaker.kick.steelsight = self.huntsman.kick.steelsight
	self.peacemaker.supported = true
	self.peacemaker.stats = {
		damage = 90,
		spread = 20,
		recoil = 12,
		spread_moving = 9,
		zoom = 1,
		concealment = 22,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.peacemaker.stats_modifiers = nil
	self.peacemaker.panic_suppression_chance = 0.05
	self.peacemaker.has_description = true
	self.peacemaker.desc_id = "bm_ap_weapon_sc_desc"
	self.peacemaker.can_shoot_through_enemy = true
	self.peacemaker.can_shoot_through_shield = true
	self.peacemaker.can_shoot_through_wall = true
	self.peacemaker.armor_piercing_chance = 1
	self.peacemaker.timers.shotgun_reload_first_shell_offset = 0.5
	self.winchester1874.upgrade_blocks = nil
	self.winchester1874.has_description = true
	self.winchester1874.desc_id = "bm_ap_weapon_sc_desc"
	self.winchester1874.AMMO_MAX = 40
	self.winchester1874.AMMO_PICKUP = self:_pickup_chance()
	self.winchester1874.FIRE_MODE = "single"
	self.winchester1874.fire_mode_data = {}
	self.winchester1874.fire_mode_data.fire_rate = 0.6
	self.winchester1874.CAN_TOGGLE_FIREMODE = false
	self.winchester1874.single = {}
	self.winchester1874.single.fire_rate = 0.6
	self.winchester1874.kick.standing = self.huntsman.kick.standing
	self.winchester1874.kick.crouching = self.huntsman.kick.crouching
	self.winchester1874.kick.steelsight = self.huntsman.kick.steelsight
	self.winchester1874.supported = true
	self.winchester1874.stats = {
		damage = 90,
		spread = 17,
		recoil = 14,
		spread_moving = 9,
		zoom = 1,
		concealment = 21,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.winchester1874.timers.shotgun_reload_first_shell_offset = 0.25		
	self.winchester1874.stats_modifiers = nil
	self.winchester1874.panic_suppression_chance = 0.05
	self.plainsrider.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.plainsrider.has_description = true
	self.plainsrider.desc_id = "bm_ap_2_weapon_sc_desc"
	self.plainsrider.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.plainsrider.kick.crouching = {
		0,
		0,
		0,
		0
	}
	self.plainsrider.kick.steelsight = {
		0,
		0,
		0,
		0
	}
	self.plainsrider.AMMO_MAX = 30
	self.plainsrider.AMMO_PICKUP = self:_pickup_chance()
	self.plainsrider.charge_data.max_t = 0.5
	self.plainsrider.not_allowed_in_bleedout = false
	self.plainsrider.supported = true
	self.plainsrider.stats = {
		damage = 60,
		spread = 21,
		recoil = 26,
		spread_moving = 12,
		zoom = 1,
		concealment = 30,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.plainsrider.panic_suppression_chance = 0.05
	self.plainsrider.stats_modifiers = {damage = 4}
	self.mateba.fire_mode_data.fire_rate = 0.15789474
	self.mateba.single = {}
	self.mateba.single.fire_rate = 0.15789474
	self.mateba.AMMO_MAX = 30
	self.mateba.AMMO_PICKUP = self:_pickup_chance()
	self.mateba.timers.reload_not_empty = 3.6
	self.mateba.timers.reload_empty = 3.6
	self.mateba.kick.standing = self.glock_17.kick.standing
	self.mateba.kick.crouching = self.glock_17.kick.crouching
	self.mateba.kick.steelsight = self.glock_17.kick.steelsight
	self.mateba.supported = true
	self.mateba.stats = {
		damage = 60,
		spread = 20,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.mateba.stats_modifiers = nil
	self.mateba.panic_suppression_chance = 0.05
	self.asval.sounds.fire = "akm_fire_single"
	self.asval.sounds.fire_single = "akm_fire_single"
	self.asval.sounds.fire_auto = "akm_fire"
	self.asval.sounds.stop_fire = "akm_stop"
	self.asval.sounds.dryfire = "primary_dryfire"
	self.asval.AMMO_MAX = 80
	self.asval.AMMO_PICKUP = self:_pickup_chance()
	self.asval.FIRE_MODE = "auto"
	self.asval.fire_mode_data = {}
	self.asval.fire_mode_data.fire_rate = 0.06666666666
	self.asval.CAN_TOGGLE_FIREMODE = true
	self.asval.auto = {}
	self.asval.auto.fire_rate = 0.06666666666
	self.asval.kick.standing = self.new_m4.kick.standing
	self.asval.kick.crouching = self.new_m4.kick.crouching
	self.asval.kick.steelsight = self.new_m4.kick.steelsight
	self.asval.supported = true
	self.asval.stats = {
		damage = 45,
		spread = 18,
		recoil = 14,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 18,
		alert_size = 18,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.asval.stats_modifiers = nil
	self.asval.panic_suppression_chance = 0.05
	self.sub2000.categories = {"pistol"}
	self.sub2000.recategorize = "pistol_carbine"
	self.sub2000.CLIP_AMMO_MAX = 30
	self.sub2000.AMMO_MAX = 120
	self.sub2000.AMMO_PICKUP = self:_pickup_chance()
	self.sub2000.sounds.fire = "sub2k_fire"
	self.sub2000.sounds.fire_single = "sub2k_fire"
	self.sub2000.sounds.dryfire = "primary_dryfire"
	self.sub2000.sounds.fire_auto = "mac10_fire"
	self.sub2000.sounds.stop_fire = "mac10_stop"
	self.sub2000.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.sub2000.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.sub2000.fire_mode_data.fire_rate = 0.07142857142
	self.sub2000.CAN_TOGGLE_FIREMODE = false
	self.sub2000.FIRE_MODE = "single"
	self.sub2000.single = {}
	self.sub2000.single.fire_rate = 0.07142857142
	self.sub2000.kick = {}
	self.sub2000.kick.standing = self.glock_17.kick.standing
	self.sub2000.kick.crouching = self.glock_17.kick.crouching
	self.sub2000.kick.steelsight = self.glock_17.kick.steelsight
	self.sub2000.supported = true
	self.sub2000.stats = {
		damage = 30,
		spread = 17,
		recoil = 22,
		spread_moving = 5,
		zoom = 1,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.sub2000.panic_suppression_chance = 0.05
	self.sub2000.stats_modifiers = nil
	self.wa2000.upgrade_blocks = nil
	self.wa2000.has_description = true
	self.wa2000.desc_id = "bm_ap_weapon_sc_desc"
	self.wa2000.CLIP_AMMO_MAX = 10
	self.wa2000.AMMO_MAX = 40
	self.wa2000.AMMO_PICKUP = self:_pickup_chance()
	self.wa2000.fire_mode_data.fire_rate = 0.4
	self.wa2000.CAN_TOGGLE_FIREMODE = false
	self.wa2000.single = {}
	self.wa2000.single.fire_rate = 0.4
	self.wa2000.kick.standing = self.huntsman.kick.standing
	self.wa2000.kick.crouching = self.huntsman.kick.crouching
	self.wa2000.kick.steelsight = self.huntsman.kick.steelsight
	self.wa2000.supported = true
	self.wa2000.stats = {
		damage = 90,
		spread = 19,
		recoil = 12,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.wa2000.armor_piercing_chance = 1
	self.wa2000.stats_modifiers = nil
	self.wa2000.panic_suppression_chance = 0.05
	self.polymer.use_data.selection_index = 2
	self.polymer.CLIP_AMMO_MAX = 30
	self.polymer.AMMO_MAX = 120
	self.polymer.AMMO_PICKUP = self:_pickup_chance()
	self.polymer.FIRE_MODE = "auto"
	self.polymer.fire_mode_data = {}
	self.polymer.fire_mode_data.fire_rate = 0.05
	self.polymer.CAN_TOGGLE_FIREMODE = true
	self.polymer.auto = {}
	self.polymer.auto.fire_rate = 0.05
	self.polymer.BURST_FIRE = 3
	self.polymer.ADAPTIVE_BURST_SIZE = false													
	self.polymer.kick.standing = self.new_m4.kick.standing
	self.polymer.kick.crouching = self.new_m4.kick.crouching
	self.polymer.kick.steelsight = self.new_m4.kick.steelsight
	self.polymer.supported = true
	self.polymer.stats = {
		damage = 30,
		spread = 14,
		recoil = 16,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.polymer.stats_modifiers = nil
	self.polymer.panic_suppression_chance = 0.05
	self.hunter.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.hunter.has_description = true
	self.hunter.desc_id = "bm_ap_3_weapon_sc_desc"
	self.hunter.AMMO_MAX = 15
	self.hunter.AMMO_PICKUP = self:_pickup_chance()
	self.hunter.panic_suppression_chance = 0.05
	self.hunter.ignore_damage_upgrades = true
	self.hunter.fire_mode_data.fire_rate = 1
	self.hunter.kick.standing = self.huntsman.kick.standing
	self.hunter.kick.crouching = self.huntsman.kick.crouching
	self.hunter.kick.steelsight = self.huntsman.kick.steelsight	
	self.hunter.supported = true
	self.hunter.stats = {
		damage = 120,
		spread = 20,
		recoil = 20,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.hunter.panic_suppression_chance = 0.05
	self.hunter.stats_modifiers = {damage = 2}
	self.baka.CLIP_AMMO_MAX = 30
	self.baka.NR_CLIPS_MAX = 4
	self.baka.AMMO_MAX = 90
	self.baka.AMMO_PICKUP = self:_pickup_chance()
	self.baka.FIRE_MODE = "auto"
	self.baka.fire_mode_data = {}
	self.baka.fire_mode_data.fire_rate = 0.06315789473
	self.baka.CAN_TOGGLE_FIREMODE = true
	self.baka.auto = {}
	self.baka.auto.fire_rate = 0.06315789473
	self.baka.kick = {}
	self.baka.kick.standing = self.new_m4.kick.standing
	self.baka.kick.crouching = self.new_m4.kick.crouching
	self.baka.kick.steelsight = self.new_m4.kick.steelsight
	self.baka.supported = true
	self.baka.stats = {
		damage = 20,
		spread = 15,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.baka.stats_modifiers = nil
	self.baka.panic_suppression_chance = 0.05
	self.arblast.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}			
	self.arblast.has_description = true
	self.arblast.desc_id = "bm_ap_3_weapon_sc_desc"
	self.arblast.AMMO_MAX = 20
	self.arblast.AMMO_PICKUP = self:_pickup_chance()
	self.arblast.fire_mode_data.fire_rate = 1.2
	self.arblast.kick.standing = self.huntsman.kick.standing
	self.arblast.kick.crouching = self.huntsman.kick.crouching
	self.arblast.kick.steelsight = self.huntsman.kick.steelsight
	self.arblast.panic_suppression_chance = 0.05
	self.arblast.supported = true
	self.arblast.stats = {
		damage = 90,
		spread = 21,
		recoil = 16,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.arblast.timers.reload_not_empty = 3.05
	self.arblast.timers.reload_empty = 3.05		
	self.arblast.stats_modifiers = {damage =  4}
	self.frankish.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}			
	self.frankish.has_description = true
	self.frankish.desc_id = "bm_ap_3_weapon_sc_desc"
	self.frankish.fire_mode_data.fire_rate = 1
	self.frankish.kick.standing = self.huntsman.kick.standing
	self.frankish.kick.crouching = self.huntsman.kick.crouching
	self.frankish.kick.steelsight = self.huntsman.kick.steelsight
	self.frankish.AMMO_MAX = 30
	self.frankish.AMMO_PICKUP = self:_pickup_chance()
	self.frankish.panic_suppression_chance = 0.05
	self.frankish.ignore_damage_upgrades = true
	self.frankish.supported = true
	self.frankish.stats = {
		damage = 60,
		spread = 19,
		recoil = 18,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.frankish.timers.reload_not_empty = 1.6
	self.frankish.timers.reload_empty = 1.6		
	self.frankish.stats_modifiers = {damage = 4}
	self.long.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}			
	self.long.has_description = true
	self.long.desc_id = "bm_ap_2_weapon_sc_desc"
	self.long.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.long.kick.crouching = {
		0,
		0,
		0,
		0
	}
	self.long.kick.steelsight = {
		0,
		0,
		0,
		0
	}		
	self.long.charge_data.max_t = 1
	self.long.not_allowed_in_bleedout = false
	self.long.AMMO_MAX = 20
	self.long.AMMO_PICKUP = self:_pickup_chance()
	self.long.panic_suppression_chance = 0.05
	self.long.ignore_damage_upgrades = true
	self.long.supported = true
	self.long.stats = {
		damage = 90,
		spread = 21,
		recoil = 26,
		spread_moving = 12,
		zoom = 1,
		concealment = 29,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.long.stats_modifiers = {damage = 4}
	self.par.categories = {
		"lmg",
		"smg"
	}
	self.par.CLIP_AMMO_MAX = 100
	self.par.fire_mode_data.fire_rate = 0.075
	self.par.auto.fire_rate = 0.075
	self.par.AMMO_MAX = 270
	self.par.AMMO_PICKUP = self:_pickup_chance()
	self.par.timers.reload_not_empty = 6.5
	self.par.timers.reload_empty = 6.5
	self.par.kick = {}
	self.par.kick.standing = self.new_m4.kick.standing
	self.par.kick.crouching = self.new_m4.kick.crouching
	self.par.kick.steelsight = self.new_m4.kick.steelsight
	self.par.panic_suppression_chance = 0.05
	self.par.supported = true
	self.par.stats = {
		damage = 20,
		spread = 14,
		recoil = 24,
		spread_moving = 9,
		zoom = 1,
		concealment = 20,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.par.stats_modifiers = nil
	self.par.swap_speed_multiplier = 0.9
	--See you, Space Cowboy
	self.sparrow.AMMO_MAX = 75
	self.sparrow.AMMO_PICKUP = self:_pickup_chance()
	self.sparrow.kick = {}
	self.sparrow.kick.standing = self.glock_17.kick.standing
	self.sparrow.kick.crouching = self.glock_17.kick.crouching
	self.sparrow.kick.steelsight = self.glock_17.kick.steelsight
	self.sparrow.fire_mode_data.fire_rate = 0.08571428571
	self.sparrow.single.fire_rate = 0.08571428571
	self.sparrow.supported = true
	self.sparrow.stats = {
		damage = 24,
		spread = 19,
		recoil = 23,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.sparrow.stats_modifiers = nil
	self.sparrow.panic_suppression_chance = 0.05
	self.model70.upgrade_blocks = nil
	self.model70.has_description = true
	self.model70.desc_id = "bm_ap_weapon_sc_desc"
	self.model70.AMMO_MAX = 30
	self.model70.CLIP_AMMO_MAX = 6
	self.model70.AMMO_PICKUP = self:_pickup_chance()
	self.model70.kick.standing = self.huntsman.kick.standing
	self.model70.kick.crouching = self.huntsman.kick.crouching
	self.model70.kick.steelsight = self.huntsman.kick.steelsight
	self.model70.supported = true
	self.model70.stats = {
		damage = 120,
		spread = 19,
		recoil = 11,
		spread_moving = 9,
		zoom = 1,
		concealment = 18,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.model70.stats_modifiers = nil
	self.model70.timers.reload_empty = 4.3	
	self.model70.panic_suppression_chance = 0.05
--GSPS--
	self.m37.rays = 9
	self.m37.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.m37.CLIP_AMMO_MAX = 6
	self.m37.AMMO_MAX = 30
	self.m37.AMMO_PICKUP = self:_pickup_chance()
	self.m37.fire_mode_data.fire_rate = 0.4
	self.m37.single.fire_rate = 0.4
	self.m37.kick.standing = self.new_m4.kick.standing
	self.m37.kick.crouching = self.new_m4.kick.standing
	self.m37.kick.steelsight = self.new_m4.kick.standing
	self.m37.panic_suppression_chance = 0.05
	self.m37.supported = true
	self.m37.stats = {
		damage = 60,
		spread = 9,
		recoil = 16,
		spread_moving = 6,
		zoom = 1,
		concealment = 20,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.m37.stats_modifiers = nil
--China Puff--
	self.china.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.china.desc_id = "bm_40mm_weapon_sc_desc"
	self.china.has_description = true
	self.china.fire_mode_data.fire_rate = 1.5
	self.china.single.fire_rate = 1.5
	self.china.AMMO_MAX = 5
	self.china.kick.standing = self.huntsman.kick.standing
	self.china.kick.crouching = self.huntsman.kick.crouching
	self.china.kick.steelsight = self.huntsman.kick.steelsight
	self.china.AMMO_PICKUP = self:_pickup_chance()
	self.china.supported = true
	self.china.stats = {
		damage = 80,
		spread = 6,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 18,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.china.panic_suppression_chance = 0.05
	self.china.stats_modifiers = {damage = 10}
	self.china.timers.shotgun_reload_first_shell_offset = 0.5
	self.sr2.auto.fire_rate = 0.06666666666
	self.sr2.fire_mode_data.fire_rate = 0.06666666666
	self.sr2.CLIP_AMMO_MAX = 30
	self.sr2.AMMO_MAX = 90
	self.sr2.AMMO_PICKUP = self:_pickup_chance()
	self.sr2.kick = {}
	self.sr2.kick.standing = self.new_m4.kick.standing
	self.sr2.kick.crouching = self.new_m4.kick.crouching
	self.sr2.kick.steelsight = self.new_m4.kick.steelsight
	self.sr2.supported = true
	self.sr2.stats = {
		damage = 20,
		spread = 18,
		recoil = 21,
		spread_moving = 8,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.sr2.stats_modifiers = nil
	self.sr2.timers.reload_not_empty = 2
	self.sr2.panic_suppression_chance = 0.05
	self.x_sr2.fire_mode_data.fire_rate = 0.06666666666
	self.x_sr2.single.fire_rate = 0.06666666666
	self.x_sr2.CLIP_AMMO_MAX = 60
	self.x_sr2.kick.standing = self.new_m4.kick.standing
	self.x_sr2.kick.crouching = self.new_m4.kick.crouching
	self.x_sr2.kick.steelsight = self.new_m4.kick.steelsight
	self.x_sr2.AMMO_MAX = 180
	self.x_sr2.AMMO_PICKUP = self:_pickup_chance()
	self.x_sr2.supported = true
	self.x_sr2.stats = {
		damage = 20,
		spread = 16,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_sr2.stats_modifiers = nil
	self.x_sr2.panic_suppression_chance = 0.05
	self.pl14.fire_mode_data.fire_rate = 0.08571428571
	self.pl14.single.fire_rate = 0.08571428571
	self.pl14.CLIP_AMMO_MAX = 10
	self.pl14.AMMO_MAX = 75
	self.pl14.AMMO_PICKUP = self:_pickup_chance()
	self.pl14.kick.standing = self.glock_17.kick.standing
	self.pl14.kick.crouching = self.glock_17.kick.crouching
	self.pl14.kick.steelsight = self.glock_17.kick.steelsight
	self.pl14.supported = true
	self.pl14.stats = {
		damage = 24,
		spread = 19,
		recoil = 23,
		spread_moving = 5,
		zoom = 1,
		concealment = 30,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.pl14.stats_modifiers = nil
	self.pl14.panic_suppression_chance = 0.05
	self.x_mp5.fire_mode_data.fire_rate = 0.075
	self.x_mp5.BURST_FIRE = 6
	self.x_mp5.ADAPTIVE_BURST_SIZE = false					
	self.x_mp5.kick.standing = self.new_m4.kick.standing
	self.x_mp5.kick.crouching = self.new_m4.kick.crouching
	self.x_mp5.kick.steelsight = self.new_m4.kick.steelsight
	self.x_mp5.AMMO_MAX = 180
	self.x_mp5.AMMO_PICKUP = self:_pickup_chance()
	self.x_mp5.supported = true
	self.x_mp5.stats = {
		damage = 20,
		spread = 14,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_mp5.stats_modifiers = nil
	self.x_mp5.panic_suppression_chance = 0.05
	self.x_mp5.timers.reload_not_empty = 1.95
	self.x_mp5.timers.reload_empty = 2.6	
	self.x_akmsu.AMMO_MAX = 120
	self.x_akmsu.AMMO_PICKUP = self:_pickup_chance()
	self.x_akmsu.fire_mode_data.fire_rate = 0.0923076923
	self.x_akmsu.panic_suppression_chance = 0.05
	self.x_akmsu.kick.standing = self.new_m4.kick.standing
	self.x_akmsu.kick.crouching = self.new_m4.kick.crouching
	self.x_akmsu.kick.steelsight = self.new_m4.kick.steelsight
	self.x_akmsu.supported = true
	self.x_akmsu.stats = {
		damage = 30,
		spread = 15,
		recoil = 10,
		spread_moving = 9,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_akmsu.stats_modifiers = nil
	self.x_akmsu.timers.reload_not_empty = 2.75
	self.x_akmsu.timers.reload_empty = 3.4		
	self.tecci.categories = {
		"assault_rifle"
	}		
	self.tecci.recategorize = "assault_rifle"
	self.tecci.kick.standing = self.new_m4.kick.standing
	self.tecci.kick.crouching = self.new_m4.kick.crouching
	self.tecci.kick.steelsight = self.new_m4.kick.steelsight
	self.tecci.CLIP_AMMO_MAX = 100
	self.tecci.AMMO_MAX = 200
	self.tecci.AMMO_PICKUP = self:_pickup_chance()
	self.tecci.fire_mode_data.fire_rate = 0.075
	self.tecci.CAN_TOGGLE_FIREMODE = true
	self.tecci.auto.fire_rate = 0.075
	self.tecci.panic_suppression_chance = 0.05
	self.tecci.supported = true
	self.tecci.stats = {
		damage = 18,
		spread = 16,
		recoil = 22,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.tecci.stats_modifiers = nil
	self.hajk.fire_mode_data.fire_rate = 0.075
	self.hajk.auto.fire_rate = 0.075
	self.hajk.AMMO_MAX = 75
	self.hajk.BURST_FIRE = 3
	self.hajk.ADAPTIVE_BURST_SIZE = false											
	self.hajk.AMMO_PICKUP = self:_pickup_chance()
	self.hajk.kick.standing = self.new_m4.kick.standing
	self.hajk.kick.crouching = self.new_m4.kick.crouching
	self.hajk.kick.steelsight = self.new_m4.kick.steelsight
	self.hajk.categories = {
		"assault_rifle"
	}
	self.hajk.panic_suppression_chance = 0.05
	self.hajk.supported = true
	self.hajk.stats = {
		damage = 24,
		spread = 17,
		recoil = 18,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.hajk.stats_modifiers = nil
	self.hajk.timers.reload_not_empty = 1.9 
	self.hajk.timers.reload_empty = 3.4		
	self.boot.AMMO_MAX = 40
	self.boot.AMMO_PICKUP = self:_pickup_chance()
	self.boot.CLIP_AMMO_MAX = 6
	self.boot.fire_mode_data.fire_rate = 0.75
	self.boot.single.fire_rate = 0.75
	self.boot.rays = 9
	self.boot.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.boot.kick.standing = self.huntsman.kick.standing
	self.boot.kick.crouching = self.huntsman.kick.crouching
	self.boot.kick.steelsight = self.huntsman.kick.steelsight
	self.boot.timers.shotgun_reload_first_shell_offset = 0.15
	self.boot.supported = true
	self.boot.stats = {
		damage = 90,
		spread = 10,
		recoil = 12,
		spread_moving = 5,
		zoom = 1,
		concealment = 20,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.boot.stats_modifiers = nil
	self.boot.panic_suppression_chance = 0.05
	self.boot.stats_modifiers = {damage = 1}
	self.packrat.AMMO_MAX = 90
	self.packrat.AMMO_PICKUP = self:_pickup_chance()
	self.packrat.fire_mode_data.fire_rate = 0.08571428571
	self.packrat.single.fire_rate = 0.08571428571
	self.packrat.kick.standing = self.glock_17.kick.standing
	self.packrat.kick.crouching = self.glock_17.kick.crouching
	self.packrat.kick.steelsight = self.glock_17.kick.steelsight
	self.packrat.panic_suppression_chance = 0.05
	self.packrat.supported = true
	self.packrat.stats = {
		damage = 20,
		spread = 19,
		recoil = 24,
		spread_moving = 7,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.packrat.stats_modifiers = nil
	self.schakal.fire_mode_data.fire_rate = 0.1
	self.schakal.auto.fire_rate = 0.1
	self.schakal.AMMO_MAX = 60
	self.schakal.CLIP_AMMO_MAX = 25
	self.schakal.BURST_FIRE = 3
	self.schakal.ADAPTIVE_BURST_SIZE = false											
	self.schakal.AMMO_PICKUP = self:_pickup_chance()
	self.schakal.kick.standing = self.new_m4.kick.standing
	self.schakal.kick.crouching = self.new_m4.kick.crouching
	self.schakal.kick.steelsight = self.new_m4.kick.steelsight
	self.schakal.panic_suppression_chance = 0.05
	self.schakal.supported = true
	self.schakal.stats = {
		damage = 30,
		spread = 15,
		recoil = 23,
		spread_moving = 14,
		zoom = 1,
		concealment = 23,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.schakal.stats_modifiers = nil
	self.desertfox.has_description = true
	self.desertfox.desc_id = "bm_ap_weapon_sc_desc"
	self.desertfox.CLIP_AMMO_MAX = 5
	self.desertfox.AMMO_MAX = 30
	self.desertfox.AMMO_PICKUP = self:_pickup_chance()
	self.desertfox.fire_mode_data.fire_rate = 0.85714285714
	self.desertfox.kick.standing = self.huntsman.kick.standing
	self.desertfox.kick.crouching = self.huntsman.kick.crouching
	self.desertfox.kick.steelsight = self.huntsman.kick.steelsight
	self.desertfox.panic_suppression_chance = 0.05
	self.desertfox.supported = true
	self.desertfox.stats = {
		damage = 120,
		spread = 19,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 20,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 10,
		reload = 20
	}
	self.desertfox.stats_modifiers = nil
	self.x_packrat.AMMO_MAX = 180
	self.x_packrat.AMMO_PICKUP = self:_pickup_chance()
	self.x_packrat.fire_mode_data.fire_rate = 0.08571428571
	self.x_packrat.single.fire_rate = 0.08571428571
	self.x_packrat.kick.standing = self.glock_17.kick.standing
	self.x_packrat.kick.crouching = self.glock_17.kick.crouching
	self.x_packrat.kick.steelsight = self.glock_17.kick.steelsight
	self.x_packrat.panic_suppression_chance = 0.05
	self.x_packrat.supported = true
	self.x_packrat.stats = {
		damage = 20,
		spread = 17,
		recoil = 14,
		spread_moving = 7,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_packrat.stats_modifiers = nil
	self.rota.upgrade_blocks = nil
	self.rota.AMMO_MAX = 40
	self.rota.AMMO_PICKUP = self:_pickup_chance()
	self.rota.rays = 9
	self.rota.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.rota.kick.standing = self.new_m4.kick.standing
	self.rota.kick.crouching = self.new_m4.kick.crouching
	self.rota.kick.steelsight = self.new_m4.kick.steelsight
	self.rota.fire_mode_data.fire_rate = 0.13953488372
	self.rota.single.fire_rate = 0.13953488372
	self.rota.panic_suppression_chance = 0.05
	self.rota.supported = true
	self.rota.stats = {
		damage = 45,
		spread = 5,
		recoil = 17,
		spread_moving = 7,
		zoom = 1,
		concealment = 22,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.rota.stats_modifiers = nil
	--Arbiter, duh--
	self.arbiter.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.arbiter.fire_mode_data.fire_rate = 0.75
	self.arbiter.single.fire_rate = 0.75
	self.arbiter.CLIP_AMMO_MAX = 6
	self.arbiter.AMMO_MAX = 6
	self.arbiter.AMMO_PICKUP = self:_pickup_chance()
	self.arbiter.supported = true
	self.arbiter.stats = {
		damage = 60,
		spread = 6,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 15,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.arbiter.stats_modifiers = {damage = 10}
	self.arbiter.panic_suppression_chance = 0.05
	self.arbiter.kick.standing = self.huntsman.kick.standing
	self.arbiter.kick.crouching = self.huntsman.kick.crouching
	self.arbiter.kick.steelsight = self.huntsman.kick.steelsight
	self.contraband.desc_id = "bm_m203_weapon_sc_desc"
	self.contraband.has_description = true
	self.contraband.AMMO_MAX = 60
	self.contraband.tactical_reload = 1
	self.contraband.AMMO_PICKUP = self:_pickup_chance()
	self.contraband.FIRE_MODE = "auto"
	self.contraband.fire_mode_data.fire_rate = 0.1
	self.contraband.CAN_TOGGLE_FIREMODE = true
	self.contraband.auto.fire_rate = 0.1
	self.contraband.panic_suppression_chance = 0.05
	self.contraband.kick.standing = self.new_m4.kick.standing
	self.contraband.kick.crouching = self.new_m4.kick.crouching
	self.contraband.kick.steelsight = self.new_m4.kick.steelsight
	self.contraband.supported = true
	self.contraband.stats = {
		damage = 45,
		spread = 18,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 16,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.contraband.stats_modifiers = nil
	self.contraband_m203.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.contraband_m203.kick.standing = self.huntsman.kick.standing
	self.contraband_m203.kick.crouching = self.huntsman.kick.crouching
	self.contraband_m203.kick.steelsight = self.huntsman.kick.steelsight
	self.contraband_m203.AMMO_PICKUP = self:_pickup_chance()
	self.contraband_m203.panic_suppression_chance = 0.05
	self.contraband_m203.ignore_damage_upgrades = true
	self.contraband_m203.AMMO_MAX = 6
	self.contraband_m203.supported = true
	self.contraband_m203.stats = {
		damage = 80,
		spread = 19,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.contraband_m203.stats_modifiers = {damage = 10}
	self.ray.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}			
	self.ray.use_data.selection_index = 2
	self.ray.has_description = true
	self.ray.desc_id = "bm_rocket_launcher_sc_desc"
	self.ray.kick.standing = self.huntsman.kick.standing
	self.ray.kick.crouching = self.huntsman.kick.crouching
	self.ray.kick.steelsight = self.huntsman.kick.steelsight
	self.ray.timers.reload_not_empty = 6
	self.ray.timers.reload_empty = 6
	self.ray.fire_mode_data.fire_rate = 1
	self.ray.CLIP_AMMO_MAX = 4
	self.ray.AMMO_MAX = 8
	self.ray.AMMO_PICKUP = self:_pickup_chance()
	self.ray.supported = true
	self.ray.stats = {
		damage = 400,
		spread = 16,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 12,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ray.panic_suppression_chance = 0.05
	self.ray.stats_modifiers = {damage = 3}
	self.ray.swap_speed_multiplier = 1.2
	self.ray.turret_instakill = true
	self.tti.upgrade_blocks = nil
	self.tti.has_description = true
	self.tti.desc_id = "bm_ap_weapon_sc_desc"
	self.tti.CLIP_AMMO_MAX = 20
	self.tti.AMMO_MAX = 40
	self.tti.AMMO_PICKUP = self:_pickup_chance()
	self.tti.FIRE_MODE = "single"
	self.tti.fire_mode_data = {}
	self.tti.fire_mode_data.fire_rate = 0.6
	self.tti.single = {}
	self.tti.single.fire_rate = 0.6
	self.tti.kick.standing = self.huntsman.kick.standing
	self.tti.kick.crouching = self.huntsman.kick.crouching
	self.tti.kick.steelsight = self.huntsman.kick.steelsight
	self.tti.can_shoot_through_enemy = true
	self.tti.can_shoot_through_shield = true
	self.tti.can_shoot_through_wall = true
	self.tti.supported = true
	self.tti.stats = {
		damage = 90,
		spread = 16,
		recoil = 13,
		spread_moving = 24,
		zoom = 1,
		concealment = 19,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.tti.armor_piercing_chance = 1
	self.tti.stats_modifiers = nil
	self.tti.panic_suppression_chance = 0.05
	self.siltstone.upgrade_blocks = nil
	self.siltstone.has_description = true
	self.siltstone.desc_id = "bm_ap_weapon_sc_desc"
	self.siltstone.CLIP_AMMO_MAX = 10
	self.siltstone.AMMO_MAX = 40
	self.siltstone.AMMO_PICKUP = self:_pickup_chance()
	self.siltstone.fire_mode_data.fire_rate = 0.6
	self.siltstone.kick.standing = self.huntsman.kick.standing
	self.siltstone.kick.crouching = self.huntsman.kick.crouching
	self.siltstone.kick.steelsight = self.huntsman.kick.steelsight
	self.siltstone.supported = true
	self.siltstone.stats = {
		damage = 90,
		spread = 18,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 22,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.siltstone.stats_modifiers = nil
	self.siltstone.panic_suppression_chance = 0.05
	self.flint.AMMO_MAX = 150
	self.flint.AMMO_PICKUP = self:_pickup_chance()
	self.flint.CLIP_AMMO_MAX = 30
	self.flint.BURST_FIRE = 3
	self.flint.BURST_FIRE_RATE_MULTIPLIER = 1.42857142857		
	self.flint.ADAPTIVE_BURST_SIZE = false									
	self.flint.fire_mode_data.fire_rate = 0.08571428571
	self.flint.auto.fire_rate = 0.08571428571
	self.flint.kick.standing = self.new_m4.kick.standing
	self.flint.kick.crouching = self.new_m4.kick.crouching
	self.flint.kick.steelsight = self.new_m4.kick.steelsight
	self.flint.supported = true
	self.flint.stats = {
		damage = 24,
		spread = 17,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.flint.stats_modifiers = nil
	self.flint.panic_suppression_chance = 0.05
	self.coal.AMMO_MAX = 100
	self.coal.CLIP_AMMO_MAX = 64
	self.coal.AMMO_PICKUP = self:_pickup_chance()
	self.coal.fire_mode_data.fire_rate = 0.08823529411
	self.coal.auto.fire_rate = 0.08823529411
	self.coal.panic_suppression_chance = 0.05
	self.coal.kick.standing = self.new_m4.kick.standing
	self.coal.kick.crouching = self.new_m4.kick.crouching
	self.coal.kick.steelsight = self.new_m4.kick.steelsight
	self.coal.supported = true
	self.coal.stats = {
		damage = 18,
		spread = 16,
		recoil = 23,
		spread_moving = 9,
		zoom = 1,
		concealment = 25,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.coal.stats_modifiers = nil
	self.coal.panic_suppression_chance = 0.05
	self.lemming.CLIP_AMMO_MAX = 20
	self.lemming.AMMO_MAX = 75
	self.lemming.AMMO_PICKUP = self:_pickup_chance()
	self.lemming.fire_mode_data.fire_rate = 0.08571428571
	self.lemming.single.fire_rate = 0.08571428571
	self.lemming.kick.standing = self.glock_17.kick.standing
	self.lemming.kick.crouching = self.glock_17.kick.crouching
	self.lemming.kick.steelsight = self.glock_17.kick.steelsight
	self.lemming.panic_suppression_chance = 0.05
	self.lemming.can_shoot_through_enemy = false
	self.lemming.can_shoot_through_shield = false
	self.lemming.can_shoot_through_wall = false
	self.lemming.armor_piercing_chance = nil
	self.lemming.supported = true
	self.lemming.stats = {
		damage = 24,
		spread = 17,
		recoil = 22,
		spread_moving = 9,
		zoom = 1,
		concealment = 27,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.lemming.stats_modifiers = nil
	self.chinchilla.fire_mode_data.fire_rate = 0.19047619
	self.chinchilla.single.fire_rate = 0.19047619
	self.chinchilla.AMMO_MAX = 30
	self.chinchilla.kick.standing = self.glock_17.kick.standing
	self.chinchilla.kick.crouching = self.glock_17.kick.crouching
	self.chinchilla.kick.steelsight = self.glock_17.kick.steelsight
	self.chinchilla.AMMO_PICKUP = self:_pickup_chance()
	self.chinchilla.supported = true
	self.chinchilla.stats = {
		damage = 60,
		spread = 19,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}		
	self.chinchilla.stats_modifiers = nil
	--Keeping
	self.x_chinchilla.tactical_akimbo = false
	self.x_chinchilla.panic_suppression_chance = 0.05
	self.x_chinchilla.fire_mode_data.fire_rate = 0.19047619
	self.x_chinchilla.single.fire_rate = 0.19047619
	self.x_chinchilla.AMMO_MAX = 60
	self.x_chinchilla.kick.standing = self.glock_17.kick.standing
	self.x_chinchilla.kick.crouching = self.glock_17.kick.crouching
	self.x_chinchilla.kick.steelsight = self.glock_17.kick.steelsight
	self.x_chinchilla.AMMO_PICKUP = self:_pickup_chance()
	self.x_chinchilla.supported = true
	self.x_chinchilla.stats = {
		damage = 60,
		spread = 17,
		recoil = 9,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_chinchilla.stats_modifiers = nil
	self.x_chinchilla.timers.reload_empty = 3.7
	self.x_chinchilla.timers.reload_not_empty = 3.7
	self.x_chinchilla.panic_suppression_chance = 0.05
	self.breech.timers = {
		reload_not_empty = 1.55,
		reload_empty = 2.1,
		unequip = 0.5,
		equip = 0.35
	}	
	self.breech.AMMO_MAX = 90
	self.breech.CLIP_AMMO_MAX = 12
	self.breech.AMMO_PICKUP = self:_pickup_chance()
	self.breech.fire_mode_data.fire_rate = 0.08571428571
	self.breech.single.fire_rate = 0.08571428571
	self.breech.kick.standing = self.glock_17.kick.standing
	self.breech.kick.crouching = self.glock_17.kick.crouching
	self.breech.kick.steelsight = self.glock_17.kick.steelsight
	self.breech.supported = true
	self.breech.stats = {
		damage = 20,
		spread = 19,
		recoil = 25,
		spread_moving = 9,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.breech.stats_modifiers = nil
	self.breech.panic_suppression_chance = 0.05
	--Galant--
	self.ching.categories = {"assault_rifle"}
	self.ching.recategorize = "rifle"
	self.ching.FIRE_MODE = "single"
	self.ching.fire_mode_data = {fire_rate = 0.1}
	self.ching.CAN_TOGGLE_FIREMODE = false
	self.ching.single = {fire_rate = 0.1}	
	self.ching.has_description = true
	self.ching.desc_id = "bm_galant_sc_desc"
	self.ching.CLIP_AMMO_MAX = 8
	self.ching.AMMO_MAX = 60
	self.ching.AMMO_PICKUP = self:_pickup_chance()
	self.ching.CAN_TOGGLE_FIREMODE = false
	self.ching.kick.standing = self.new_m4.kick.standing
	self.ching.kick.crouching = self.new_m4.kick.crouching
	self.ching.kick.steelsight = self.new_m4.kick.steelsight			
	self.ching.supported = true
	self.ching.stats = {
		damage = 60,
		spread = 18,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.ching.stats_modifiers = nil
	self.ching.armor_piercing_chance = nil
	self.ching.can_shoot_through_enemy = false
	self.ching.can_shoot_through_shield = false
	self.ching.can_shoot_through_wall = false	
	self.ching.panic_suppression_chance = 0.05
	
	self.erma.use_data.selection_index = 2
	self.erma.CLIP_AMMO_MAX = 32
	self.erma.BURST_FIRE = false
	self.erma.AMMO_MAX = 150
	self.erma.AMMO_PICKUP = self:_pickup_chance()
	self.erma.fire_mode_data.fire_rate = 0.10909090909
	self.erma.auto.fire_rate = 0.10909090909
	self.erma.CAN_TOGGLE_FIREMODE = true
	self.erma.kick.standing = self.new_m4.kick.standing
	self.erma.kick.crouching = self.new_m4.kick.crouching
	self.erma.kick.steelsight = self.new_m4.kick.steelsight
	self.erma.supported = true
	self.erma.stats = {
		damage = 24,
		spread = 16,
		recoil = 24,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 5,
		reload = 20
	}
	self.erma.stats_modifiers = nil
	self.erma.panic_suppression_chance = 0.05
	self.ecp.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}		
	self.ecp.has_description = true
	self.ecp.desc_id = "bm_ap_3_weapon_sc_desc"
	self.ecp.kick.standing = self.huntsman.kick.standing
	self.ecp.kick.crouching = self.huntsman.kick.crouching
	self.ecp.kick.steelsight = self.huntsman.kick.steelsight
	self.ecp.AMMO_MAX = 40
	self.ecp.AMMO_PICKUP = self:_pickup_chance()
	self.ecp.panic_suppression_chance = 0.05
	self.ecp.ignore_damage_upgrades = true
	self.ecp.supported = true
	self.ecp.stats = {
		damage = 45,
		spread = 17,
		recoil = 21,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ecp.stats_modifiers = {damage = 4}		
	self.shrew.fire_mode_data.fire_rate = 0.08571428571
	self.shrew.single.fire_rate = 0.08571428571
	self.shrew.CLIP_AMMO_MAX = 6
	self.shrew.AMMO_MAX = 40
	self.shrew.AMMO_PICKUP = self:_pickup_chance()
	self.shrew.kick.standing = self.glock_17.kick.standing
	self.shrew.kick.crouching = self.glock_17.kick.crouching
	self.shrew.kick.steelsight = self.glock_17.kick.steelsight
	self.shrew.supported = true
	self.shrew.stats = {
		damage = 45,
		spread = 19,
		recoil = 18,
		spread_moving = 5,
		zoom = 1,
		concealment = 27,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.shrew.stats_modifiers = nil
	self.shrew.panic_suppression_chance = 0.05
	--Keeping
	self.x_shrew.fire_mode_data.fire_rate = 0.08571428571
	self.x_shrew.single.fire_rate = 0.08571428571
	self.x_shrew.CLIP_AMMO_MAX = 12
	self.x_shrew.AMMO_MAX = 80
	self.x_shrew.AMMO_PICKUP = self:_pickup_chance()
	self.x_shrew.kick.standing = self.glock_17.kick.standing
	self.x_shrew.kick.crouching = self.glock_17.kick.crouching
	self.x_shrew.kick.steelsight = self.glock_17.kick.steelsight
	self.x_shrew.supported = true
	self.x_shrew.stats = {
		damage = 45,
		spread = 17,
		recoil = 8,
		spread_moving = 5,
		zoom = 1,
		concealment = 27,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_shrew.stats_modifiers = nil
	self.x_shrew.panic_suppression_chance = 0.05
	self.basset.rays = 9
	self.basset.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.basset.CLIP_AMMO_MAX = 6
	self.basset.AMMO_MAX = 60
	self.basset.AMMO_PICKUP = self:_pickup_chance()
	self.basset.fire_mode_data = {fire_rate = 0.1}
	self.basset.auto = {fire_rate = 0.1}
	self.basset.kick.standing = self.new_m4.kick.standing
	self.basset.kick.crouching = self.new_m4.kick.crouching
	self.basset.kick.steelsight = self.new_m4.kick.steelsight
	self.basset.panic_suppression_chance = 0.05
	self.basset.supported = true
	self.basset.stats = {
		zoom = 1,
		total_ammo_mod = 100,
		damage = 30,
		alert_size = 7,
		spread = 7,
		spread_moving = 8,
		recoil = 19,
		value = 1,
		extra_ammo = 101,
		reload = 20,
		suppression = 6,
		concealment = 24
	}		
	self.basset.stats_modifiers = nil
	--Disabled--	
	self.x_basset.use_data.selection_index = 4			
	self.x_basset.tactical_akimbo = true
	self.x_basset.rays = 9
	self.x_basset.CLIP_AMMO_MAX = 12
	self.x_basset.AMMO_MAX = 120
	self.x_basset.AMMO_PICKUP = self:_pickup_chance()
	self.x_basset.fire_mode_data = {fire_rate = 0.1}
	self.x_basset.auto = {fire_rate = 0.1}
	self.x_basset.kick.standing = self.new_m4.kick.standing
	self.x_basset.kick.crouching = self.new_m4.kick.crouching
	self.x_basset.kick.steelsight = self.new_m4.kick.steelsight
	self.x_basset.panic_suppression_chance = 0.05
	self.x_basset.supported = true
	self.x_basset.stats = {
		zoom = 1,
		total_ammo_mod = 100,
		damage = 30,
		alert_size = 7,
		spread = 5,
		spread_moving = 8,
		recoil = 9,
		value = 1,
		extra_ammo = 101,
		reload = 20,
		suppression = 6,
		concealment = 24
	}
	self.x_basset.stats_modifiers = nil
	self.corgi.CLIP_AMMO_MAX = 30
	self.corgi.AMMO_MAX = 180
	self.corgi.AMMO_PICKUP = self:_pickup_chance()
	self.corgi.fire_mode_data.fire_rate = 0.07058823529
	self.corgi.CAN_TOGGLE_FIREMODE = true
	self.corgi.auto = {}
	self.corgi.auto.fire_rate = 0.07058823529
	self.corgi.kick.standing = self.new_m4.kick.standing
	self.corgi.kick.crouching = self.new_m4.kick.crouching
	self.corgi.kick.steelsight = self.new_m4.kick.steelsight
	self.corgi.supported = true
	self.corgi.stats = {
		damage = 20,
		spread = 17,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.corgi.stats_modifiers = nil
	self.corgi.panic_suppression_chance = 0.05
	self.slap.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}			
	self.slap.desc_id = "bm_40mm_weapon_sc_desc"
	self.slap.has_description = false
	self.slap.fire_mode_data.fire_rate = 1.2
	self.slap.kick.standing = self.huntsman.kick.standing
	self.slap.kick.crouching = self.huntsman.kick.crouching
	self.slap.kick.steelsight = self.huntsman.kick.steelsight
	self.slap.AMMO_MAX = 5
	self.slap.AMMO_PICKUP = self:_pickup_chance()
	self.slap.supported = true
	self.slap.stats = {
		damage = 80,
		spread = 19,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 26,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.slap.panic_suppression_chance = 0.05
	self.slap.stats_modifiers = {damage = 10}	
	--Disabled--
	self.x_coal.use_data.selection_index = 4
	self.x_coal.AMMO_MAX = 200
	self.x_coal.CLIP_AMMO_MAX = 128
	self.x_coal.AMMO_PICKUP = self:_pickup_chance()
	self.x_coal.fire_mode_data.fire_rate = 0.08823529411
	self.x_coal.single.fire_rate = 0.08823529411
	self.x_coal.panic_suppression_chance = 0.05
	self.x_coal.kick.standing = self.new_m4.kick.standing
	self.x_coal.kick.crouching = self.new_m4.kick.crouching
	self.x_coal.kick.steelsight = self.new_m4.kick.steelsight
	self.x_coal.supported = true
	self.x_coal.stats = {
		damage = 18,
		spread = 14,
		recoil = 13,
		spread_moving = 9,
		zoom = 1,
		concealment = 25,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_coal.stats_modifiers = nil
	self.x_coal.panic_suppression_chance = 0.05	
	--Keeping
	self.x_baka.use_data.selection_index = 2
	self.x_baka.CLIP_AMMO_MAX = 60
	self.x_baka.NR_CLIPS_MAX = 4
	self.x_baka.AMMO_MAX = 180
	self.x_baka.AMMO_PICKUP = self:_pickup_chance()
	self.x_baka.FIRE_MODE = "auto"
	self.x_baka.fire_mode_data = {}
	self.x_baka.fire_mode_data.fire_rate = 0.06315789473
	self.x_baka.CAN_TOGGLE_FIREMODE = true
	self.x_baka.single.fire_rate = 0.06315789473
	self.x_baka.kick = {}
	self.x_baka.kick.standing = self.new_m4.kick.standing
	self.x_baka.kick.crouching = self.new_m4.kick.crouching
	self.x_baka.kick.steelsight = self.new_m4.kick.steelsight
	self.x_baka.supported = true
	self.x_baka.stats = {
		damage = 20,
		spread = 13,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_baka.stats_modifiers = nil
	self.x_baka.panic_suppression_chance = 0.05		
	--Disabled--
	self.x_cobray.use_data.selection_index = 4		
	self.x_cobray.timers.reload_not_empty = 2.00
	self.x_cobray.timers.reload_empty = 2.7
	self.x_cobray.CLIP_AMMO_MAX = 120
	self.x_cobray.NR_CLIPS_MAX = 4
	self.x_cobray.AMMO_MAX = 120
	self.x_cobray.AMMO_PICKUP = self:_pickup_chance()
	self.x_cobray.kick.standing = self.new_m4.kick.standing
	self.x_cobray.kick.crouching = self.new_m4.kick.crouching
	self.x_cobray.kick.steelsight = self.new_m4.kick.steelsight
	self.x_cobray.fire_mode_data.fire_rate = 0.06
	self.x_cobray.CAN_TOGGLE_FIREMODE = true
	self.x_cobray.single.fire_rate = 0.06
	self.x_cobray.supported = true
	self.x_cobray.stats = {
		damage = 30,
		spread = 15,
		recoil = 7,
		spread_moving = 8,
		zoom = 1,
		concealment = 22,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_cobray.stats_modifiers = nil
	self.x_cobray.panic_suppression_chance = 0.05	
	--Disabled--
	self.x_erma.use_data.selection_index = 4			
	self.x_erma.CLIP_AMMO_MAX = 64
	self.x_erma.AMMO_MAX = 150
	self.x_erma.AMMO_PICKUP = self:_pickup_chance()
	self.x_erma.fire_mode_data.fire_rate = 0.10909090909
	self.x_erma.single.fire_rate = 0.10909090909
	self.x_erma.CAN_TOGGLE_FIREMODE = true
	self.x_erma.kick.standing = self.new_m4.kick.standing
	self.x_erma.kick.crouching = self.new_m4.kick.crouching
	self.x_erma.kick.steelsight = self.new_m4.kick.steelsight
	self.x_erma.supported = true
	self.x_erma.stats = {
		damage = 24,
		spread = 14,
		recoil = 14,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 5,
		reload = 20
	}
	self.x_erma.stats_modifiers = nil
	self.x_erma.panic_suppression_chance = 0.05	
	--Disabled--
	self.x_hajk.use_data.selection_index = 4				
	self.x_hajk.fire_mode_data.fire_rate = 0.075
	self.x_hajk.single.fire_rate = 0.075
	self.x_hajk.CLIP_AMMO_MAX = 60
	self.x_hajk.AMMO_MAX = 150
	self.x_hajk.ADAPTIVE_BURST_SIZE = false						
	self.x_hajk.BURST_FIRE = 4				
	self.x_hajk.AMMO_PICKUP = self:_pickup_chance()
	self.x_hajk.kick.standing = self.new_m4.kick.standing
	self.x_hajk.kick.crouching = self.new_m4.kick.standing
	self.x_hajk.kick.steelsight = self.new_m4.kick.standing
	self.x_hajk.panic_suppression_chance = 0.05
	self.x_hajk.supported = true
	self.x_hajk.stats = {
		damage = 24,
		spread = 15,
		recoil = 12,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}	
	self.x_hajk.stats_modifiers = nil
	--Disabled--
	self.x_m45.use_data.selection_index = 4				
	self.x_m45.CLIP_AMMO_MAX = 60
	self.x_m45.AMMO_MAX = 150
	self.x_m45.AMMO_PICKUP = self:_pickup_chance()
	self.x_m45.kick.standing = self.new_m4.kick.standing
	self.x_m45.kick.crouching = self.new_m4.kick.crouching
	self.x_m45.kick.steelsight = self.new_m4.kick.steelsight
	self.x_m45.supported = true
	self.x_m45.stats = {
		damage = 24,
		spread = 13,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 5,
		reload = 20
	}
	self.x_m45.stats_modifiers = nil
	self.x_m45.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_m1928.use_data.selection_index = 4
	self.x_m1928.fire_mode_data.fire_rate = 0.075
	self.x_m1928.CAN_TOGGLE_FIREMODE = true
	self.x_m1928.single.fire_rate = 0.075
	self.x_m1928.CLIP_AMMO_MAX = 100
	self.x_m1928.AMMO_MAX = 180
	self.x_m1928.AMMO_PICKUP = self:_pickup_chance()
	self.x_m1928.kick.standing = self.new_m4.kick.standing
	self.x_m1928.kick.crouching = self.new_m4.kick.crouching
	self.x_m1928.kick.steelsight = self.new_m4.kick.steelsight
	self.x_m1928.supported = true
	self.x_m1928.stats = {
		damage = 24,
		spread = 12,
		recoil = 9,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.x_m1928.stats_modifiers = nil
	self.x_m1928.panic_suppression_chance = 0.05	
	--Keeping
	self.x_mac10.CLIP_AMMO_MAX = 40
	self.x_mac10.AMMO_MAX = 120
	self.x_mac10.AMMO_PICKUP = self:_pickup_chance()
	self.x_mac10.fire_mode_data.fire_rate = 0.06
	self.x_mac10.single.fire_rate = 0.06
	self.x_mac10.kick.standing = self.new_m4.kick.standing
	self.x_mac10.kick.crouching = self.new_m4.kick.crouching
	self.x_mac10.kick.steelsight = self.new_m4.kick.steelsight
	self.x_mac10.supported = true
	self.x_mac10.stats = {
		damage = 30,
		spread = 13,
		recoil = 7,
		spread_moving = 8,
		zoom = 1,
		concealment = 22,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_mac10.stats_modifiers = nil
	self.x_mac10.panic_suppression_chance = 0.05		
	--Disabled--	
	self.x_mp7.use_data.selection_index = 4		
	self.x_mp7.CLIP_AMMO_MAX = 40
	self.x_mp7.AMMO_MAX = 150
	self.x_mp7.AMMO_PICKUP = self:_pickup_chance()
	self.x_mp7.fire_mode_data.fire_rate = 0.06315789473
	self.x_mp7.CAN_TOGGLE_FIREMODE = true
	self.x_mp7.single.fire_rate = 0.06315789473
	self.x_mp7.kick.standing = self.new_m4.kick.standing
	self.x_mp7.kick.crouching = self.new_m4.kick.crouching
	self.x_mp7.kick.steelsight = self.new_m4.kick.steelsight		
	self.x_mp7.supported = true
	self.x_mp7.stats = {
		damage = 24,
		spread = 11,
		recoil = 8,
		spread_moving = 7,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.x_mp7.stats_modifiers = nil
	self.x_mp7.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_mp9.use_data.selection_index = 4				
	self.x_mp9.CLIP_AMMO_MAX = 40
	self.x_mp9.single.fire_rate = 0.06666666666
	self.x_mp9.fire_mode_data.fire_rate = 0.06666666666
	self.x_mp9.AMMO_MAX = 200
	self.x_mp9.AMMO_PICKUP = self:_pickup_chance()
	self.x_mp9.kick.standing = self.new_m4.kick.standing
	self.x_mp9.kick.crouching = self.new_m4.kick.crouching
	self.x_mp9.kick.steelsight = self.new_m4.kick.steelsight
	self.x_mp9.supported = true
	self.x_mp9.stats = {
		damage = 18,
		spread = 15,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 30,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_mp9.stats_modifiers = nil
	self.x_mp9.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_olympic.use_data.selection_index = 4			
	self.x_olympic.CLIP_AMMO_MAX = 60
	self.x_olympic.AMMO_MAX = 180
	self.x_olympic.fire_mode_data.fire_rate = 0.075
	self.x_olympic.single.fire_rate = 0.075
	self.x_olympic.AMMO_PICKUP = self:_pickup_chance()
	self.x_olympic.panic_suppression_chance = 0.05
	self.x_olympic.supported = true
	self.x_olympic.stats = {
		damage = 20,
		spread = 12,
		recoil = 10,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}	
	self.x_olympic.stats_modifiers = nil
	--Disabled--	
	self.x_p90.use_data.selection_index = 4			
	self.x_p90.AMMO_MAX = 200
	self.x_p90.AMMO_PICKUP = self:_pickup_chance()
	self.x_p90.fire_mode_data.fire_rate = 0.06666666666
	self.x_p90.single.fire_rate = 0.06666666666
	self.x_p90.panic_suppression_chance = 0.05
	self.x_p90.kick.standing = self.new_m4.kick.standing
	self.x_p90.kick.crouching = self.new_m4.kick.crouching
	self.x_p90.kick.steelsight = self.new_m4.kick.steelsight
	self.x_p90.supported = true
	self.x_p90.stats = {
		damage = 18,
		spread = 13,
		recoil = 13,
		spread_moving = 9,
		zoom = 1,
		concealment = 26,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_p90.stats_modifiers = nil
	self.x_p90.panic_suppression_chance = 0.05		
	--Disabled--	
	self.x_polymer.use_data.selection_index = 4			
	self.x_polymer.CLIP_AMMO_MAX = 60
	self.x_polymer.AMMO_MAX = 120
	self.x_polymer.AMMO_PICKUP = self:_pickup_chance()
	self.x_polymer.fire_mode_data.fire_rate = 0.05
	self.x_polymer.single.fire_rate = 0.05
	self.x_polymer.BURST_FIRE = 4										
	self.x_polymer.ADAPTIVE_BURST_SIZE = false										
	self.x_polymer.kick.standing = self.new_m4.kick.standing
	self.x_polymer.kick.crouching = self.new_m4.kick.crouching
	self.x_polymer.kick.steelsight = self.new_m4.kick.steelsight
	self.x_polymer.supported = true
	self.x_polymer.stats = {
		damage = 30,
		spread = 12,
		recoil = 6,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_polymer.stats_modifiers = nil
	self.x_polymer.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_schakal.use_data.selection_index = 4			
	self.x_schakal.fire_mode_data.fire_rate = 0.1
	self.x_schakal.single.fire_rate = 0.1
	self.x_schakal.AMMO_MAX = 120
	self.x_schakal.BURST_FIRE = 4
	self.x_schakal.ADAPTIVE_BURST_SIZE = false				
	self.x_schakal.CLIP_AMMO_MAX = 50
	self.x_schakal.AMMO_PICKUP = self:_pickup_chance()
	self.x_schakal.kick.standing = self.new_m4.kick.standing
	self.x_schakal.kick.crouching = self.new_m4.kick.standing
	self.x_schakal.kick.steelsight = self.new_m4.kick.standing
	self.x_schakal.panic_suppression_chance = 0.05
	self.x_schakal.supported = true
	self.x_schakal.stats = {
		damage = 30,
		spread = 15,
		recoil = 10,
		spread_moving = 14,
		zoom = 1,
		concealment = 23,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}	
	self.x_schakal.stats_modifiers = nil
	--Disabled--	
	self.x_scorpion.use_data.selection_index = 4				
	self.x_scorpion.CLIP_AMMO_MAX = 40
	self.x_scorpion.AMMO_MAX = 180
	self.x_scorpion.AMMO_PICKUP = self:_pickup_chance()
	self.x_scorpion.fire_mode_data.fire_rate = 0.07058823529
	self.x_scorpion.single.fire_rate = 0.07058823529
	self.x_scorpion.kick.standing = self.new_m4.kick.standing
	self.x_scorpion.kick.crouching = self.new_m4.kick.crouching
	self.x_scorpion.kick.steelsight = self.new_m4.kick.steelsight
	self.x_scorpion.supported = true
	self.x_scorpion.stats = {
		damage = 20,
		spread = 13,
		recoil = 12,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.x_scorpion.stats_modifiers = nil
	self.x_scorpion.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_sterling.use_data.selection_index = 4				
	self.x_sterling.CLIP_AMMO_MAX = 40
	self.x_sterling.AMMO_MAX = 150
	self.x_sterling.AMMO_PICKUP = self:_pickup_chance()
	self.x_sterling.fire_mode_data.fire_rate = 0.10909090909
	self.x_sterling.single.fire_rate = 0.10909090909
	self.x_sterling.kick.standing = self.new_m4.kick.standing
	self.x_sterling.kick.crouching = self.new_m4.kick.crouching
	self.x_sterling.kick.steelsight = self.new_m4.kick.steelsight
	self.x_sterling.supported = true
	self.x_sterling.stats = {
		damage = 24,
		spread = 13,
		recoil = 14,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.x_sterling.stats_modifiers = nil
	self.x_sterling.panic_suppression_chance = 0.05	
	--Disabled--	
	self.x_tec9.use_data.selection_index = 4			
	self.x_tec9.AMMO_MAX = 150
	self.x_tec9.CLIP_AMMO_MAX = 40
	self.x_tec9.AMMO_PICKUP = self:_pickup_chance()
	self.x_tec9.fire_mode_data.fire_rate = 0.06
	self.x_tec9.single.fire_rate = 0.06
	self.x_tec9.kick.standing = self.new_m4.kick.standing
	self.x_tec9.kick.crouching = self.new_m4.kick.crouching
	self.x_tec9.kick.steelsight = self.new_m4.kick.steelsight
	self.x_tec9.supported = true
	self.x_tec9.stats = {
		damage = 24,
		spread = 13,
		recoil = 8,
		spread_moving = 10,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.x_tec9.stats_modifiers = nil
	self.x_tec9.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_uzi.use_data.selection_index = 4		
	self.x_uzi.AMMO_MAX = 120
	self.x_uzi.CLIP_AMMO_MAX = 44
	self.x_uzi.AMMO_PICKUP = self:_pickup_chance()
	self.x_uzi.fire_mode_data.fire_rate = 0.086
	self.x_uzi.single.fire_rate = 0.086
	self.x_uzi.kick.standing = self.new_m4.kick.standing
	self.x_uzi.kick.crouching = self.new_m4.kick.crouching
	self.x_uzi.kick.steelsight = self.new_m4.kick.steelsight
	self.x_uzi.supported = true
	self.x_uzi.stats = {
		damage = 30,
		spread = 13,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 7,
		reload = 20
	}
	self.x_uzi.stats_modifiers = nil
	self.x_uzi.panic_suppression_chance = 0.05		
	--Keeping
	self.x_2006m.fire_mode_data.fire_rate = 0.15789473684
	self.x_2006m.single.fire_rate = 0.15789473684
	self.x_2006m.AMMO_MAX = 60
	self.x_2006m.AMMO_PICKUP = self:_pickup_chance()
	self.x_2006m.kick.standing = self.glock_17.kick.standing
	self.x_2006m.kick.crouching = self.glock_17.kick.crouching
	self.x_2006m.kick.steelsight = self.glock_17.kick.steelsight
	self.x_2006m.supported = true
	self.x_2006m.stats = {
		damage = 60,
		spread = 18,
		recoil = 9,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_2006m.stats_modifiers = nil
	self.x_2006m.panic_suppression_chance = 0.05
	self.x_2006m.weapon_hold = "x_chinchilla"
	self.x_2006m.animations.reload_name_id = "x_chinchilla"
	self.x_2006m.animations.second_gun_versions = self.x_rage.animations.second_gun_versions or {}
	self.x_2006m.animations.second_gun_versions.reload = "reload"
	self.x_2006m.timers.reload_not_empty = 4.1
	self.x_2006m.timers.reload_empty = 4.1	
	--Disabled--	
	self.x_breech.use_data.selection_index = 4			
	self.x_breech.AMMO_MAX = 180
	self.x_breech.CLIP_AMMO_MAX = 24
	self.x_breech.AMMO_PICKUP = self:_pickup_chance()
	self.x_breech.fire_mode_data.fire_rate = 0.08571428571
	self.x_breech.single.fire_rate = 0.08571428571
	self.x_breech.kick.standing = self.glock_17.kick.standing
	self.x_breech.kick.crouching = self.glock_17.kick.crouching
	self.x_breech.kick.steelsight = self.glock_17.kick.steelsight
	self.x_breech.supported = true
	self.x_breech.stats = {
		damage = 20,
		spread = 17,
		recoil = 15,
		spread_moving = 9,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_breech.stats_modifiers = nil
	self.x_breech.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_c96.use_data.selection_index = 4				
	self.x_c96.AMMO_MAX = 120
	self.x_c96.AMMO_PICKUP = self:_pickup_chance()
	self.x_c96.FIRE_MODE = "single"
	self.x_c96.sounds.fire = "c96_fire"
	self.x_c96.sounds.fire_single = "c96_fire"
	self.x_c96.sounds.fire_auto = "g18c_fire"
	self.x_c96.sounds.stop_fire = "g18c_stop"
	self.x_c96.CAN_TOGGLE_FIREMODE = true
	self.x_c96.fire_mode_data.fire_rate = 0.06
	self.x_c96.single.fire_rate = 0.06
	self.x_c96.kick.standing = self.new_m4.kick.standing
	self.x_c96.kick.crouching = self.new_m4.kick.crouching
	self.x_c96.kick.steelsight = self.new_m4.kick.steelsight
	self.x_c96.supported = true
	self.x_c96.stats = {
		damage = 30,
		spread = 14,
		recoil = 10,
		spread_moving = 8,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_c96.stats_modifiers = nil
	self.x_c96.panic_suppression_chance = 0.05
	--Keeping
	self.x_g18c.fire_mode_data.fire_rate = 0.05454545454
	self.x_g18c.single.fire_rate = 0.05454545454
	self.x_g18c.CLIP_AMMO_MAX = 36
	self.x_g18c.AMMO_MAX = 200
	self.x_g18c.AMMO_PICKUP = self:_pickup_chance()
	self.x_g18c.kick.standing = self.new_m4.kick.standing
	self.x_g18c.kick.crouching = self.new_m4.kick.crouching
	self.x_g18c.kick.steelsight = self.new_m4.kick.steelsight
	self.x_g18c.supported = true
	self.x_g18c.stats = {
		damage = 18,
		spread = 15,
		recoil = 9,
		spread_moving = 9,
		zoom = 1,
		concealment = 28,
		suppression = 10,
		alert_size = 10,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_g18c.stats_modifiers = nil
	self.x_g18c.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_hs2000.use_data.selection_index = 4			
	self.x_hs2000.CLIP_AMMO_MAX = 28
	self.x_hs2000.AMMO_MAX = 120
	self.x_hs2000.AMMO_PICKUP = self:_pickup_chance()
	self.x_hs2000.FIRE_MODE = "single"
	self.x_hs2000.fire_mode_data = {}
	self.x_hs2000.fire_mode_data.fire_rate = 0.08571428571
	self.x_hs2000.single = {}
	self.x_hs2000.single.fire_rate = 0.08571428571
	self.x_hs2000.kick.standing = self.glock_17.kick.standing
	self.x_hs2000.kick.crouching = self.glock_17.kick.crouching
	self.x_hs2000.kick.steelsight = self.glock_17.kick.steelsight
	self.x_hs2000.supported = true
	self.x_hs2000.stats = {
		damage = 30,
		spread = 14,
		recoil = 13,
		spread_moving = 7,
		zoom = 1,
		concealment = 27,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.x_hs2000.stats_modifiers = nil
	self.x_hs2000.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_p226.use_data.selection_index = 4				
	self.x_p226.AMMO_MAX = 150
	self.x_p226.CLIP_AMMO_MAX = 28
	self.x_p226.AMMO_PICKUP = self:_pickup_chance()
	self.x_p226.fire_mode_data.fire_rate = 0.08571428571
	self.x_p226.single.fire_rate = 0.08571428571
	self.x_p226.kick.standing = self.glock_17.kick.standing
	self.x_p226.kick.crouching = self.glock_17.kick.crouching
	self.x_p226.kick.steelsight = self.glock_17.kick.steelsight
	self.x_p226.supported = true
	self.x_p226.stats = {
		damage = 40,
		spread = 16,
		recoil = 13,
		spread_moving = 7,
		zoom = 1,
		concealment = 28,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 4,
		reload = 20
	}
	self.x_p226.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_pl14.use_data.selection_index = 4		
	self.x_pl14.fire_mode_data.fire_rate = 0.08571428571
	self.x_pl14.single.fire_rate = 0.08571428571
	self.x_pl14.CLIP_AMMO_MAX = 20
	self.x_pl14.AMMO_MAX = 150
	self.x_pl14.AMMO_PICKUP = self:_pickup_chance()
	self.x_pl14.kick.standing = self.glock_17.kick.standing
	self.x_pl14.kick.crouching = self.glock_17.kick.crouching
	self.x_pl14.kick.steelsight = self.glock_17.kick.steelsight
	self.x_pl14.supported = true
	self.x_pl14.stats = {
		damage = 24,
		spread = 17,
		recoil = 13,
		spread_moving = 5,
		zoom = 1,
		concealment = 30,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_pl14.stats_modifiers = nil
	self.x_pl14.panic_suppression_chance = 0.05
	--Disabled--	
	self.x_ppk.use_data.selection_index = 4				
	self.x_ppk.AMMO_MAX = 180
	self.x_ppk.CLIP_AMMO_MAX = 24
	self.x_ppk.AMMO_PICKUP = self:_pickup_chance()
	self.x_ppk.fire_mode_data.fire_rate = 0.08571428571
	self.x_ppk.single.fire_rate = 0.08571428571
	self.x_ppk.kick.standing = self.glock_17.kick.standing
	self.x_ppk.kick.crouching = self.glock_17.kick.crouching
	self.x_ppk.kick.steelsight = self.glock_17.kick.steelsight
	self.x_ppk.supported = true
	self.x_ppk.stats = {
		damage = 20,
		spread = 18,
		recoil = 15,
		spread_moving = 9,
		zoom = 1,
		concealment = 31,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_ppk.stats_modifiers = nil
	self.x_ppk.panic_suppression_chance = 0.05
	--Keeping
	self.x_rage.fire_mode_data.fire_rate = 0.19047619047
	self.x_rage.single.fire_rate = 0.19047619047
	self.x_rage.AMMO_MAX = 60
	self.x_rage.kick.standing = self.glock_17.kick.standing
	self.x_rage.kick.crouching = self.glock_17.kick.crouching
	self.x_rage.kick.steelsight = self.glock_17.kick.steelsight
	self.x_rage.AMMO_PICKUP = self:_pickup_chance()
	self.x_rage.supported = true
	self.x_rage.stats = {
		damage = 60,
		spread = 15,
		recoil = 8,
		spread_moving = 5,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_rage.stats_modifiers = nil
	self.x_rage.panic_suppression_chance = 0.05
	self.x_rage.weapon_hold = "x_chinchilla"
	self.x_rage.animations.reload_name_id = "x_chinchilla"
	self.x_rage.animations.second_gun_versions = self.x_rage.animations.second_gun_versions or {}
	self.x_rage.animations.second_gun_versions.reload = "reload"
	self.x_rage.timers.reload_not_empty = 3.3
	self.x_rage.timers.reload_empty = 3.3
	--Disabled--	
	self.x_sparrow.use_data.selection_index = 4			
	self.x_sparrow.AMMO_MAX = 150
	self.x_sparrow.AMMO_PICKUP = self:_pickup_chance()
	self.x_sparrow.kick.standing = self.glock_17.kick.standing
	self.x_sparrow.kick.crouching = self.glock_17.kick.crouching
	self.x_sparrow.kick.steelsight = self.glock_17.kick.steelsight
	self.x_sparrow.fire_mode_data.fire_rate = 0.08571428571
	self.x_sparrow.single.fire_rate = 0.08571428571
	self.x_sparrow.supported = true
	self.x_sparrow.stats = {
		damage = 24,
		spread = 17,
		recoil = 13,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_sparrow.stats_modifiers = nil
	self.x_sparrow.panic_suppression_chance = 0.05
	--Keeping
	self.x_judge.fire_mode_data.fire_rate = 0.272727
	self.x_judge.single.fire_rate = 0.272727
	self.x_judge.rays = 9
	self.x_judge.FIRE_MODE = "single"
	self.x_judge.BURST_FIRE = true
	self.x_judge.AMMO_MAX = 40
	self.x_judge.AMMO_PICKUP = self:_pickup_chance()
	self.x_judge.supported = true
	self.x_judge.stats = {
		damage = 90,
		spread = 3,
		recoil = 0,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_judge.stats_modifiers = nil
	self.x_judge.panic_suppression_chance = 0.05
	self.x_judge.weapon_hold = "x_chinchilla"
	self.x_judge.animations.reload_name_id = "x_chinchilla"
	self.x_judge.animations.second_gun_versions = self.x_judge.animations.second_gun_versions or {}
	self.x_judge.animations.second_gun_versions.reload = "reload"
	self.x_judge.kick.standing = self.huntsman.kick.standing
	self.x_judge.kick.crouching = self.huntsman.kick.standing
	self.x_judge.kick.steelsight = self.huntsman.kick.standing
	--Disabled--	
	self.x_rota.use_data.selection_index = 4			
	self.x_rota.upgrade_blocks = nil
	self.x_rota.AMMO_MAX = 80
	self.x_rota.AMMO_PICKUP = self:_pickup_chance()
	self.x_rota.rays = 9 * 1 * 1 * 1 * 1 * 1 * 1
	self.x_rota.kick.standing = self.new_m4.kick.standing
	self.x_rota.kick.crouching = self.new_m4.kick.crouching
	self.x_rota.kick.steelsight = self.new_m4.kick.steelsight
	self.x_rota.fire_mode_data.fire_rate = 0.13953488372
	self.x_rota.single.fire_rate = 0.13953488372
	self.x_rota.panic_suppression_chance = 0.05
	self.x_rota.supported = true
	self.x_rota.stats = {
		damage = 45,
		spread = 3,
		recoil = 8,
		spread_moving = 7,
		zoom = 1,
		concealment = 22,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}	
	self.x_rota.stats_modifiers = nil
	self.shuno.categories = {
		"minigun",
		"smg"
	}
	self.shuno.has_description = false
	self.shuno.CLIP_AMMO_MAX = 300
	self.shuno.NR_CLIPS_MAX = 1
	self.shuno.AMMO_MAX = 300
	self.shuno.AMMO_PICKUP = self:_pickup_chance()
	self.shuno.FIRE_MODE = "auto"
	self.shuno.fire_mode_data = {}
	self.shuno.fire_mode_data.fire_rate = 0.05
	self.shuno.CAN_TOGGLE_FIREMODE = false
	self.shuno.auto = {}
	self.shuno.auto.fire_rate = 0.05
	self.shuno.kick.standing = self.new_m4.kick.standing
	self.shuno.kick.crouching = self.new_m4.kick.crouching
	self.shuno.kick.steelsight = self.new_m4.kick.steelsight
	self.shuno.panic_suppression_chance = 0.05
	self.shuno.supported = true
	self.shuno.stats = {
		damage = 18,
		spread = 16,
		recoil = 23,
		spread_moving = 9,
		zoom = 1,
		concealment = 10,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}		
	self.shuno.stats_modifiers = nil
	self.shuno.swap_speed_multiplier = 1.25
	self.system.categories = {
		"flamethrower",
		"shotgun"
	}
	self.system.recategorize = "wpn_special"
	self.system.has_description = true
	self.system.desc_id = "bm_ap_flamethrower_sc_desc"
	self.system.timers.reload_not_empty = 8
	self.system.timers.reload_empty = 8
	self.system.rays = 9
	self.system.CLIP_AMMO_MAX = 35
	self.system.AMMO_MAX = 60
	self.system.AMMO_PICKUP = self:_pickup_chance()
	self.system.fire_mode_data.fire_rate = 0.1
	self.system.auto = {}
	self.system.auto.fire_rate = 0.1
	self.system.flame_max_range = 1400
	self.system.single_flame_effect_duration = 1
	self.system.armor_piercing_chance = 1
	self.system.can_shoot_through_enemy = false
	self.system.can_shoot_through_shield = false
	self.system.can_shoot_through_wall = false
	self.system.kick.standing = self.new_m4.kick.standing
	self.system.kick.crouching = self.new_m4.kick.crouching
	self.system.kick.steelsight = self.new_m4.kick.steelsight
	self.system.fire_dot_data = {
		dot_damage = 1,
		dot_trigger_max_distance = 999999,
		dot_trigger_chance = 50,
		dot_length = 3.1,
		dot_tick_period = 0.5
	}
	self.system.supported = true
	self.system.stats = {
		damage = 25,
		spread = 6,
		recoil = 23,
		spread_moving = 6,
		zoom = 1,
		concealment = 19,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.system.stats_modifiers = nil
	self.system.panic_suppression_chance = 0.05
	self.shepheard.use_data.selection_index = 2
	self.shepheard.CLIP_AMMO_MAX = 30
	self.shepheard.fire_mode_data.fire_rate = 0.07058823529
	self.shepheard.auto.fire_rate = 0.07058823529
	self.shepheard.panic_suppression_chance = 0.05
	self.shepheard.kick.standing = self.new_m4.kick.standing
	self.shepheard.kick.crouching = self.new_m4.kick.crouching
	self.shepheard.kick.steelsight = self.new_m4.kick.steelsight
	self.shepheard.AMMO_MAX = 180
	self.shepheard.AMMO_PICKUP = self:_pickup_chance()
	self.shepheard.supported = true
	self.shepheard.stats = {
		damage = 20,
		spread = 15,
		recoil = 22,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.shepheard.stats_modifiers = nil
	self.shepheard.panic_suppression_chance = 0.05		
	--Disabled--	
	self.x_shepheard.use_data.selection_index = 4
	self.x_shepheard.CLIP_AMMO_MAX = 60
	self.x_shepheard.fire_mode_data.fire_rate = 0.07058823529
	self.x_shepheard.single.fire_rate = 0.07058823529
	self.x_shepheard.panic_suppression_chance = 0.05
	self.x_shepheard.kick.standing = self.new_m4.kick.standing
	self.x_shepheard.kick.crouching = self.new_m4.kick.crouching
	self.x_shepheard.kick.steelsight = self.new_m4.kick.steelsight
	self.x_shepheard.AMMO_MAX = 180
	self.x_shepheard.AMMO_PICKUP = self:_pickup_chance()
	self.x_shepheard.supported = true
	self.x_shepheard.stats = {
		damage = 20,
		spread = 13,
		recoil = 12,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_shepheard.stats_modifiers = nil
	self.x_shepheard.panic_suppression_chance = 0.05				
	self.komodo.use_data.selection_index = 1
	self.komodo.desc_id = "bm_menu_sc_olympic_desc"
	self.komodo.categories = {
		"assault_rifle"
	}
	self.komodo.CLIP_AMMO_MAX = 30
	self.komodo.AMMO_MAX = 90
	self.komodo.fire_mode_data.fire_rate = 0.06666666666
	self.komodo.auto.fire_rate = 0.06666666666
	self.komodo.AMMO_PICKUP = self:_pickup_chance()
	self.komodo.panic_suppression_chance = 0.05
	self.komodo.kick.standing = self.new_m4.kick.standing
	self.komodo.kick.crouching = self.new_m4.kick.standing
	self.komodo.kick.steelsight = self.new_m4.kick.standing		
	self.komodo.supported = true
	self.komodo.stats = {
		damage = 20,
		spread = 18,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}	
	self.komodo.stats_modifiers = nil
	self.elastic.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.elastic.has_description = true
	self.elastic.desc_id = "bm_ap_2_weapon_sc_desc"
	self.elastic.timers = {
		reload_not_empty = 1.5,
		reload_empty = 1.5,
		unequip = 0.85,
		equip = 0.85
	}		
	self.elastic.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.elastic.kick.crouching = {
		0,
		0,
		0,
		0
	}
	self.elastic.kick.steelsight = {
		0,
		0,
		0,
		0
	}				
	self.elastic.charge_data.max_t = 1
	self.elastic.not_allowed_in_bleedout = false
	self.elastic.AMMO_MAX = 20
	self.elastic.AMMO_PICKUP = self:_pickup_chance()
	self.elastic.panic_suppression_chance = 0.05
	self.elastic.ignore_damage_upgrades = true
	self.elastic.supported = true
	self.elastic.stats = {
		damage = 90,
		spread = 20,
		recoil = 26,
		spread_moving = 12,
		zoom = 1,
		concealment = 30,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.elastic.stats_modifiers = {damage = 4}
	self.coach.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.coach.rays = 9
	self.coach.kick.standing = self.huntsman.kick.standing
	self.coach.kick.crouching = self.huntsman.kick.crouching
	self.coach.kick.steelsight = self.huntsman.kick.steelsight
	self.coach.AMMO_MAX = 20
	self.coach.AMMO_PICKUP = self:_pickup_chance()
	self.coach.sounds.fire_single = "coach_fire"
	self.coach.sounds.fire_auto = "coach_fire"		
	self.coach.BURST_FIRE = 3			
	self.coach.CAN_TOGGLE_FIREMODE = false								
	self.coach.BURST_FIRE_RATE_MULTIPLIER = 120
	self.coach.DELAYED_BURST_RECOIL = true
	self.coach.ADAPTIVE_BURST_SIZE = false		
	self.coach.fire_mode_data = {}
	self.coach.fire_mode_data.fire_rate = 0.06
	self.coach.single = {}
	self.coach.single.fire_rate = 0.06	
	self.coach.auto = {}		
	self.coach.auto.fire_rate = 0.06		
	self.coach.supported = true
	self.coach.stats = {
		damage = 90,
		spread = 10,
		recoil = 13,
		spread_moving = 6,
		zoom = 1,
		concealment = 21,
		suppression = 3,
		alert_size = 3,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.coach.stats_modifiers = nil
	self.coach.panic_suppression_chance = 0.05
	self.legacy.fire_mode_data.fire_rate = 0.08571428571
	self.legacy.single.fire_rate = 0.08571428571
	self.legacy.CLIP_AMMO_MAX = 12
	self.legacy.AMMO_MAX = 75
	self.legacy.AMMO_PICKUP = self:_pickup_chance()
	self.legacy.kick.standing = self.glock_17.kick.standing
	self.legacy.kick.crouching = self.glock_17.kick.crouching
	self.legacy.kick.steelsight = self.glock_17.kick.steelsight
	self.legacy.supported = true
	self.legacy.stats = {
		damage = 24,
		spread = 19,
		recoil = 23,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
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
	--Disabled--	
	self.x_legacy.use_data.selection_index = 4		
	self.x_legacy.fire_mode_data.fire_rate = 0.08571428571
	self.x_legacy.single.fire_rate = 0.08571428571
	self.x_legacy.CLIP_AMMO_MAX = 24
	self.x_legacy.AMMO_MAX = 150
	self.x_legacy.AMMO_PICKUP = self:_pickup_chance()
	self.x_legacy.kick.standing = self.glock_17.kick.standing
	self.x_legacy.kick.crouching = self.glock_17.kick.crouching
	self.x_legacy.kick.steelsight = self.glock_17.kick.steelsight
	self.x_legacy.supported = true
	self.x_legacy.stats = {
		damage = 24,
		spread = 79,
		recoil = 13,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}		
	self.x_legacy.stats_modifiers = nil
	self.x_legacy.panic_suppression_chance = 0.05
	--Beretta Auto
	self.beer.use_data.selection_index = 2
	self.beer.AMMO_MAX = 180
	self.beer.AMMO_PICKUP = self:_pickup_chance()
	self.beer.fire_mode_data.fire_rate = 0.05454545454
	self.beer.kick.standing = self.new_m4.kick.standing
	self.beer.kick.crouching = self.new_m4.kick.crouching
	self.beer.kick.steelsight = self.new_m4.kick.steelsight
	self.beer.supported = true
	self.beer.stats = {
		damage = 20,
		spread = 16,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 27,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.beer.stats_modifiers = nil
	self.beer.panic_suppression_chance = 0.05
	--Disabled
	self.x_beer.use_data.selection_index = 4
	self.x_beer.supported = true

	--CZ 75
	self.czech.AMMO_MAX = 90
	self.czech.AMMO_PICKUP = self:_pickup_chance()
	self.czech.fire_mode_data.fire_rate = 0.06
	self.czech.kick.standing = self.new_m4.kick.standing
	self.czech.kick.crouching = self.new_m4.kick.crouching
	self.czech.kick.steelsight = self.new_m4.kick.steelsight
	self.czech.supported = true
	self.czech.stats = {
		damage = 20,
		spread = 16,
		recoil = 20,
		spread_moving = 5,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.czech.stats_modifiers = nil
	self.czech.panic_suppression_chance = 0.05
	--Akimbo CZ 75
	self.x_czech.AMMO_MAX = 180
	self.x_czech.AMMO_PICKUP = self:_pickup_chance()
	self.x_czech.fire_mode_data.fire_rate = 0.06
	self.x_czech.kick.standing = self.new_m4.kick.standing
	self.x_czech.kick.crouching = self.new_m4.kick.crouching
	self.x_czech.kick.steelsight = self.new_m4.kick.steelsight
	self.x_czech.supported = true
	self.x_czech.stats = {
		damage = 20,
		spread = 14,
		recoil = 10,
		spread_moving = 5,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_czech.stats_modifiers = nil
	self.x_czech.panic_suppression_chance = 0.05
	--Igor
	self.stech.fire_mode_data.fire_rate = 0.08
	self.stech.AMMO_MAX = 75
	self.stech.AMMO_PICKUP = self:_pickup_chance()
	self.stech.kick.standing = self.new_m4.kick.standing
	self.stech.kick.crouching = self.new_m4.kick.crouching
	self.stech.kick.steelsight = self.new_m4.kick.steelsight
	self.stech.CLIP_AMMO_MAX = 20
	self.stech.supported = true
	self.stech.stats = {
		damage = 24,
		spread = 17,
		recoil = 21,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.stech.stats_modifiers = nil
	self.stech.panic_suppression_chance = 0.05
	--Akimbo Igor
	self.x_stech.fire_mode_data.fire_rate = 0.08
	self.x_stech.AMMO_MAX = 150
	self.x_stech.AMMO_PICKUP = self:_pickup_chance()
	self.x_stech.kick.standing = self.new_m4.kick.standing
	self.x_stech.kick.crouching = self.new_m4.kick.crouching
	self.x_stech.kick.steelsight = self.new_m4.kick.steelsight
	self.x_stech.CLIP_AMMO_MAX = 20
	self.x_stech.supported = true
	self.x_stech.stats = {
		damage = 24,
		spread = 15,
		recoil = 11,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_stech.stats_modifiers = nil
	self.x_stech.panic_suppression_chance = 0.05
	--Holt 9mm
	self.holt.fire_mode_data.fire_rate = 0.08571428571
	self.holt.single.fire_rate = 0.08571428571
	self.holt.CLIP_AMMO_MAX = 10
	self.holt.AMMO_MAX = 75
	self.holt.AMMO_PICKUP = self:_pickup_chance()
	self.holt.kick.standing = self.glock_17.kick.standing
	self.holt.kick.crouching = self.glock_17.kick.crouching
	self.holt.kick.steelsight = self.glock_17.kick.steelsight
	self.holt.supported = true
	self.holt.stats = {
		damage = 24,
		spread = 18,
		recoil = 23,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.holt.stats_modifiers = nil
	self.holt.panic_suppression_chance = 0.05
	--Akimbo Holt 9mm
	self.x_holt.fire_mode_data.fire_rate = 0.08571428571
	self.x_holt.single.fire_rate = 0.08571428571
	self.x_holt.CLIP_AMMO_MAX = 20
	self.x_holt.AMMO_MAX = 150
	self.x_holt.AMMO_PICKUP = self:_pickup_chance()
	self.x_holt.kick.standing = self.glock_17.kick.standing
	self.x_holt.kick.crouching = self.glock_17.kick.crouching
	self.x_holt.kick.steelsight = self.glock_17.kick.steelsight
	self.x_holt.supported = true
	self.x_holt.stats = {
		damage = 24,
		spread = 16,
		recoil = 13,
		spread_moving = 5,
		zoom = 1,
		concealment = 29,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_holt.stats_modifiers = nil
	self.x_holt.panic_suppression_chance = 0.05
	--M60
	self.m60.categories = {
		"lmg",
		"smg"
	}
	self.m60.CLIP_AMMO_MAX = 90
	self.m60.AMMO_MAX = 180
	self.m60.AMMO_PICKUP = self:_pickup_chance()
	self.m60.fire_mode_data.fire_rate = 0.10909090909
	self.m60.auto.fire_rate = 0.10909090909
	self.m60.kick.standing = self.new_m4.kick.standing
	self.m60.kick.crouching = self.new_m4.kick.crouching
	self.m60.kick.steelsight = self.new_m4.kick.steelsight
	self.m60.supported = true
	self.m60.stats = {
		damage = 30,
		spread = 15,
		recoil = 22,
		spread_moving = 9,
		zoom = 1,
		concealment = 18,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.m60.stats_modifiers = nil
	self.m60.panic_suppression_chance = 0.05	
	self.m60.swap_speed_multiplier = 0.9
	
	--R700
	self.r700.upgrade_blocks = nil
	self.r700.has_description = true
	self.r700.desc_id = "bm_ap_weapon_sc_desc"
	self.r700.CLIP_AMMO_MAX = 10
	self.r700.AMMO_MAX = 40
	self.r700.AMMO_PICKUP = self:_pickup_chance()
	self.r700.fire_mode_data.fire_rate = 0.8
	self.r700.kick.standing = self.huntsman.kick.standing
	self.r700.kick.crouching = self.huntsman.kick.crouching
	self.r700.kick.steelsight = self.huntsman.kick.steelsight
	self.r700.supported = true
	self.r700.stats = {
		damage = 90,
		spread = 21,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.r700.stats_modifiers = nil
	self.r700.panic_suppression_chance = 0.05
	--Restoration Weapons--
	
	--Raze's Fury
	self.shatters_fury.fire_mode_data.fire_rate = 0.25
	self.shatters_fury.single.fire_rate = 0.25	
	self.shatters_fury.AMMO_MAX = 30
	self.shatters_fury.CLIP_AMMO_MAX = 5
	self.shatters_fury.AMMO_PICKUP = self:_pickup_chance()
	self.shatters_fury.kick.standing = self.huntsman.kick.standing
	self.shatters_fury.kick.crouching = self.huntsman.kick.crouching
	self.shatters_fury.kick.steelsight = self.huntsman.kick.steelsight
	self.shatters_fury.supported = true
	self.shatters_fury.stats = {
		damage = 90,
		spread = 17,
		recoil = 10,
		spread_moving = 9,
		zoom = 1,
		concealment = 21,
		suppression = 4,
		alert_size = 4,
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
	--self.shatters_fury.animations.reload_name_id = "chinchilla"
	self.shatters_fury.timers.reload_not_empty = 2.4
	self.shatters_fury.timers.reload_empty = 2.4
	self.shatters_fury.swap_speed_multiplier = 0.6
	--this line doesn't do shit
	--self.shatters_fury.custom = true
	
	--OICW
	self.osipr.tactical_reload = 1		
	self.osipr.AMMO_MAX = 120
	self.osipr.AMMO_PICKUP = self:_pickup_chance()
	self.osipr.CLIP_AMMO_MAX = 30
	self.osipr.fire_mode_data.fire_rate = 0.075
	self.osipr.auto.fire_rate = 0.075
	self.osipr.kick.standing = self.new_m4.kick.standing
	self.osipr.kick.crouching = self.new_m4.kick.crouching
	self.osipr.kick.steelsight = self.new_m4.kick.steelsight
	self.osipr.supported = true
	self.osipr.stats = {
		damage = 24,
		spread = 17,
		recoil = 18,
		spread_moving = 6,
		zoom = 1,
		concealment = 20,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.osipr.stats_modifiers = nil
	self.osipr.timers.reload_not_empty = 2.16
	self.osipr.timers.reload_empty = 3.5		
	self.osipr.panic_suppression_chance = 0.05
	self.osipr.has_description = true
	self.osipr.desc_id = "bm_w_osipr_desc"
	self.osipr.custom = false	--TEMP fix for BeardLib sync
	
	self.osipr_gl.AMMO_MAX = 9
	self.osipr_gl.AMMO_PICKUP = self:_pickup_chance()
	self.osipr_gl.CLIP_AMMO_MAX = 6
	self.osipr_gl.fire_mode_data.fire_rate = 0.75
	self.osipr_gl.kick.standing = self.huntsman.kick.standing
	self.osipr_gl.kick.crouching = self.huntsman.kick.crouching
	self.osipr_gl.kick.steelsight = self.huntsman.kick.steelsight
	self.osipr_gl.supported = true
	self.osipr_gl.stats = {
		damage = 60,
		spread = 6,
		recoil = 8,
		spread_moving = 6,
		zoom = 1,
		concealment = 15,
		suppression = 20,
		alert_size = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.osipr_gl.stats_modifiers = nil
	self.osipr_gl.timers.reload_not_empty = 3.34
	self.osipr_gl.timers.reload_empty = 4.5		
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

	--Anubis .45
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
	self.socom.AMMO_PICKUP = self:_pickup_chance()
	self.socom.kick.standing = self.glock_17.kick.standing
	self.socom.kick.crouching = self.glock_17.kick.crouching
	self.socom.kick.steelsight = self.glock_17.kick.steelsight
	self.socom.supported = true
	self.socom.stats = {
		damage = 45,
		spread = 16,
		recoil = 21,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.socom.stats_modifiers = nil
	self.socom.panic_suppression_chance = 0.05
	self.socom.swap_speed_multiplier = 0.95
	
	--Akimbo Anubis .45
	self.x_socom.tactical_reload = 2
	self.x_socom.fire_mode_data.fire_rate = 0.08571428571
	self.x_socom.single.fire_rate = 0.08571428571
	self.x_socom.CLIP_AMMO_MAX = 24
	self.x_socom.AMMO_MAX = 80
	self.x_socom.AMMO_PICKUP = self:_pickup_chance()
	self.x_socom.kick.standing = self.glock_17.kick.standing
	self.x_socom.kick.crouching = self.glock_17.kick.crouching
	self.x_socom.kick.steelsight = self.glock_17.kick.steelsight
	self.x_socom.supported = true
	self.x_socom.stats = {
		damage = 45,
		spread = 14,
		recoil = 11,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.x_socom.stats_modifiers = nil
	self.x_socom.panic_suppression_chance = 0.05
	self.x_socom.swap_speed_multiplier = 0.95	
	
	--Custom weapons below--
if self.amt then --Matthelzor, Gambyt, >:3, and Alcat's Automag .44
	self.amt.tactical_reload = 1									
	self.amt.use_data.selection_index = 2
	self.amt.has_description = false
	self.amt.fire_mode_data.fire_rate = 0.1
	self.amt.single.fire_rate = 0.1
	self.amt.kick.standing = self.glock_17.kick.standing
	self.amt.kick.crouching = self.glock_17.kick.crouching
	self.amt.kick.steelsight = self.glock_17.kick.steelsight
	self.amt.CLIP_AMMO_MAX = 8
	self.amt.AMMO_MAX = 60
	self.amt.AMMO_PICKUP = self:_pickup_chance()
	self.amt.supported = true
	self.amt.stats = {
		damage = 60,
		spread = 18,
		recoil = 16,
		spread_moving = 6,
		zoom = 1,
		concealment = 24,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.amt.stats_modifiers = nil
	self.amt.panic_suppression_chance = 0.05
end	

if self.tilt then --Gambyt's AN 92
	self.tilt.has_description = false		
	self.tilt.tactical_reload = 1
	self.tilt.AMMO_MAX = 150
	self.tilt.AMMO_PICKUP = self:_pickup_chance()
	self.tilt.BURST_FIRE = 3
	self.tilt.BURST_FIRE_RATE_MULTIPLIER = 3		
	self.tilt.ADAPTIVE_BURST_SIZE = false														
	self.tilt.fire_mode_data.fire_rate = 0.1
	self.tilt.auto.fire_rate = 0.1
	self.tilt.kick.standing = self.new_m4.kick.standing
	self.tilt.kick.crouching = self.new_m4.kick.crouching
	self.tilt.kick.steelsight = self.new_m4.kick.steelsight
	self.tilt.supported = true
	self.tilt.stats = {
		damage = 24,
		spread = 18,
		recoil = 21,
		spread_moving = 6,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.tilt.stats_modifiers = nil
	self.tilt.panic_suppression_chance = 0.05
end

if self.ks23 then --Pawcio's KS23
	self.ks23.muzzleflash = "effects/particles/shotgun/muzzleflash"	
	self.ks23.desc_id = "bm_40mm_weapon_sc_desc"
	self.ks23.has_description = true
	self.ks23.use_data.selection_index = 2
	self.ks23.categories = {
			"shotgun"
	}		
	self.ks23.tactical_reload = 1		
	self.ks23.fire_mode_data.fire_rate = 1.5
	self.ks23.single.fire_rate = 1.5
	self.ks23.rays = 12
	self.ks23.AMMO_MAX = 30
	self.ks23.CLIP_AMMO_MAX = 3		
	self.ks23.kick.standing = self.huntsman.kick.standing
	self.ks23.kick.crouching = self.huntsman.kick.crouching
	self.ks23.kick.steelsight = self.huntsman.kick.steelsight
	self.ks23.AMMO_PICKUP = self:_pickup_chance() --{0.12, 0.43}
	self.ks23.supported = true
	self.ks23.stats = {
		damage = 120, --250,
		spread = 16,
		recoil = 6,
		spread_moving = 6,
		zoom = 1,
		concealment = 7,
		suppression = 2,
		alert_size = 2,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ks23.armor_piercing_chance = 1
	self.ks23.panic_suppression_chance = 0.05
	self.ks23.stats_modifiers = {damage = 1}
end					

if self.amr12 then --Gambyt's AMR 12G Shotgun
	self.amr12.rays = 9
	self.amr12.muzzleflash = "effects/particles/shotgun/shotgun_gen"
	self.amr12.AMMO_MAX = 120
	self.amr12.tactical_reload = 1		
	self.amr12.CLIP_AMMO_MAX = 5
	self.amr12.AMMO_PICKUP = self:_pickup_chance()
	self.amr12.fire_mode_data.fire_rate = 0.08571428571
	self.amr12.CAN_TOGGLE_FIREMODE = false
	self.amr12.single = {}
	self.amr12.single.fire_rate = 0.08571428571
	self.amr12.kick.standing = self.new_m4.kick.standing
	self.amr12.kick.crouching = self.new_m4.kick.crouching
	self.amr12.kick.steelsight = self.new_m4.kick.steelsight
	self.amr12.supported = true
	self.amr12.stats = {
		damage = 30,
		spread = 9,
		recoil = 17,
		zoom = 1,
		concealment = 25,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.amr12.panic_suppression_chance = 0.05
	self.amr12.stats_modifiers = {damage = 1}
	self.amr12.swap_speed_multiplier = 1.2
end

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
	self.owen.AMMO_PICKUP = self:_pickup_chance()
	self.owen.kick.standing = self.new_m4.kick.standing
	self.owen.kick.crouching = self.new_m4.kick.crouching
	self.owen.kick.steelsight = self.new_m4.kick.steelsight
	self.owen.supported = true
	self.owen.stats = {
		damage = 30,
		spread = 17,
		recoil = 18,
		spread_moving = 7,
		zoom = 1,
		concealment = 24,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.owen.panic_suppression_chance = 0.05
	self.owen.stats_modifiers = nil
end	

if self.aek971 then --Pawcio's AEK 971
	self.aek971.CLIP_AMMO_MAX = 30
	self.aek971.tactical_reload = 1												
	self.aek971.AMMO_MAX = 180
	self.aek971.AMMO_PICKUP = self:_pickup_chance()
	self.aek971.kick.standing = self.new_m4.kick.standing
	self.aek971.kick.crouching = self.new_m4.kick.crouching
	self.aek971.kick.steelsight = self.new_m4.kick.steelsight
	self.aek971.supported = true
	self.aek971.stats = {
		damage = 20,
		spread = 17,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.aek971.panic_suppression_chance = 0.05
	self.aek971.stats_modifiers = nil		
end			

if self.czevo then --Gambyt's Scorpion EVO
	self.czevo.has_description = false					
	self.czevo.use_data.selection_index = 2
	self.czevo.tactical_reload = 1
	self.czevo.categories = {
		"smg"
	}
	self.czevo.CLIP_AMMO_MAX = 30
	self.czevo.AMMO_MAX = 180
	self.czevo.AMMO_PICKUP = self:_pickup_chance()
	self.czevo.kick.standing = self.new_m4.kick.standing
	self.czevo.kick.crouching = self.new_m4.kick.crouching
	self.czevo.kick.steelsight = self.new_m4.kick.steelsight		
	self.czevo.supported = true
	self.czevo.stats = {
		damage = 20,
		spread = 16,
		recoil = 19,
		spread_moving = 8,
		zoom = 1,
		concealment = 26,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.czevo.stats_modifiers = nil
	self.czevo.panic_suppression_chance = 0.05
	self.x_czevo.use_data.selection_index = 4 
end	
	
if self.winchester1894 then --Pawcio's Winchester 1894
	self.winchester1894.tactical_reload = 1						
	self.winchester1894.has_description = true
	self.winchester1894.desc_id = "bm_ap_weapon_sc_desc"
	self.winchester1894.AMMO_MAX = 40
	self.winchester1894.AMMO_PICKUP = self:_pickup_chance()
	self.winchester1894.FIRE_MODE = "single"
	self.winchester1894.fire_mode_data = {}
	self.winchester1894.fire_mode_data.fire_rate = 0.5
	self.winchester1894.CAN_TOGGLE_FIREMODE = false
	self.winchester1894.single = {}
	self.winchester1894.single.fire_rate = 0.5
	self.winchester1894.kick.standing = self.huntsman.kick.standing
	self.winchester1894.kick.crouching = self.huntsman.kick.crouching
	self.winchester1894.kick.steelsight = self.huntsman.kick.steelsight
	self.winchester1894.supported = true
	self.winchester1894.stats = {
		damage = 90,
		spread = 17,
		recoil = 13,
		spread_moving = 9,
		zoom = 1,
		concealment = 21,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.winchester1894.timers.shotgun_reload_first_shell_offset = 0.25		
	self.winchester1894.stats_modifiers = nil
	self.winchester1894.panic_suppression_chance = 0.05
end

if self.moss464spx then --Pawcio's SPX Centerfire
	self.moss464spx.upgrade_blocks = nil
	self.moss464spx.has_description = true
	self.moss464spx.desc_id = "bm_ap_weapon_sc_desc"
	self.moss464spx.AMMO_MAX = 40
	self.moss464spx.tactical_reload = 1					
	self.moss464spx.AMMO_PICKUP = self:_pickup_chance()
	self.moss464spx.FIRE_MODE = "single"
	self.moss464spx.fire_mode_data = {}
	self.moss464spx.fire_mode_data.fire_rate = 0.4
	self.moss464spx.CAN_TOGGLE_FIREMODE = false
	self.moss464spx.single = {}
	self.moss464spx.single.fire_rate = 0.4
	self.moss464spx.kick.standing = self.huntsman.kick.standing
	self.moss464spx.kick.crouching = self.huntsman.kick.crouching
	self.moss464spx.kick.steelsight = self.huntsman.kick.steelsight
	self.moss464spx.supported = true
	self.moss464spx.stats = {
		damage = 90,
		spread = 18,
		recoil = 13,
		spread_moving = 9,
		zoom = 1,
		concealment = 21,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.moss464spx.timers.shotgun_reload_first_shell_offset = 0.25		
	self.moss464spx.stats_modifiers = nil
	self.moss464spx.panic_suppression_chance = 0.05
end		
	
if self.sg416 then --Gambyt's SG416
	self.sg416.has_description = false						
	self.sg416.tactical_reload = 1		
	self.sg416.AMMO_MAX = 150
	self.sg416.AMMO_PICKUP = self:_pickup_chance()
	self.sg416.fire_mode_data.fire_rate = 0.08571428571
	self.sg416.auto.fire_rate = 0.08571428571
	self.sg416.kick.standing = self.new_m4.kick.standing
	self.sg416.kick.crouching = self.new_m4.kick.crouching
	self.sg416.kick.steelsight = self.new_m4.kick.steelsight
	self.sg416.supported = true
	self.sg416.stats = {
		damage = 24,
		spread = 17,
		recoil = 20,
		spread_moving = 6,
		zoom = 1,
		concealment = 22,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.sg416.stats_modifiers = nil
	self.sg416.timers.reload_empty = 3.5
	self.sg416.panic_suppression_chance = 0.05
end


if self.spike then --Gambyt's Spike Rifle
	self.spike.has_description = false						
	self.spike.tactical_reload = 1		
	self.spike.AMMO_MAX = 120
	self.spike.AMMO_PICKUP = self:_pickup_chance()
	self.spike.fire_mode_data.fire_rate = 0.1
	self.spike.auto.fire_rate = 0.1
	self.spike.kick.standing = self.new_m4.kick.standing
	self.spike.kick.crouching = self.new_m4.kick.crouching
	self.spike.kick.steelsight = self.new_m4.kick.steelsight		
	self.spike.supported = true
	self.spike.stats = {
		damage = 30,
		spread = 15,
		recoil = 20,
		zoom = 1,
		concealment = 25,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.spike.stats_modifiers = nil
	self.spike.timers.reload_not_empty = 2
	self.spike.panic_suppression_chance = 0.05
end


if self.ak5s then --Gambyt's Automat-5/AK5 SMG
	self.ak5s.desc_id = nil
	self.ak5s.categories = {"smg"}
	self.ak5s.tactical_reload = 1		
	self.ak5s.use_data.selection_index = 2
	self.ak5s.CLIP_AMMO_MAX = 35
	self.ak5s.AMMO_MAX = 180
	self.ak5s.AMMO_PICKUP = self:_pickup_chance()
	self.ak5s.auto.fire_rate = 0.08275862068
	self.ak5s.fire_mode_data.fire_rate = 0.08275862068
	self.ak5s.panic_suppression_chance = 0.05
	self.ak5s.kick.standing = self.new_m4.kick.standing
	self.ak5s.kick.crouching = self.new_m4.kick.crouching
	self.ak5s.kick.steelsight = self.new_m4.kick.steelsight
	self.ak5s.AMMO_MAX = 180
	self.ak5s.AMMO_PICKUP = self:_pickup_chance()
	self.ak5s.supported = true
	self.ak5s.stats = {
		damage = 20,
		spread = 14,
		recoil = 24,
		spread_moving = 8,
		zoom = 1,
		concealment = 28,
		suppression = 9,
		alert_size = 9,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.ak5s.stats_modifiers = nil
	self.ak5s.panic_suppression_chance = 0.05		
end	

if self.lebman then --Gambyt's Vendetta 38 Pistol
	self.lebman.desc_id = nil
	self.lebman.tactical_reload = 1		
	self.lebman.use_data.selection_index = 2
	self.lebman.CLIP_AMMO_MAX = 14		
	self.lebman.AMMO_MAX = 120
	self.lebman.AMMO_PICKUP = self:_pickup_chance()
	self.lebman.fire_mode_data.fire_rate = 0.1
	self.lebman.auto.fire_rate = 0.1
	self.lebman.kick.standing = self.new_m4.kick.standing
	self.lebman.kick.crouching = self.new_m4.kick.crouching
	self.lebman.kick.steelsight = self.new_m4.kick.steelsight
	self.lebman.supported = true
	self.lebman.stats = {
		damage = 30,
		spread = 17,
		recoil = 19,
		zoom = 1,
		concealment = 26,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.lebman.stats_modifiers = nil				
	self.lebman.panic_suppression_chance = 0.05
	--Disabled
	self.x_lebman.use_data.selection_index = 4
	self.x_lebman.supported = true
end

if self.sgs then --Gambyt's Guerilla 308.
	self.sgs.upgrade_blocks = nil
	self.sgs.has_description = true
	self.sgs.desc_id = "bm_ap_weapon_sc_desc"
	self.sgs.CLIP_AMMO_MAX = 20
	self.sgs.tactical_reload = 1		
	self.sgs.AMMO_MAX = 40
	self.sgs.AMMO_PICKUP = self:_pickup_chance()
	self.sgs.FIRE_MODE = "single"
	self.sgs.fire_mode_data = {}
	self.sgs.fire_mode_data.fire_rate = 0.6
	self.sgs.single = {}
	self.sgs.single.fire_rate = 0.6
	self.sgs.kick.standing = self.huntsman.kick.standing
	self.sgs.kick.crouching = self.huntsman.kick.crouching
	self.sgs.kick.steelsight = self.huntsman.kick.steelsight
	self.sgs.can_shoot_through_enemy = true
	self.sgs.can_shoot_through_shield = true
	self.sgs.can_shoot_through_wall = true
	self.sgs.supported = true
	self.sgs.stats = {
		damage = 90,
		spread = 16,
		recoil = 12,
		zoom = 1,
		concealment = 18,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.sgs.armor_piercing_chance = 1
	self.sgs.stats_modifiers = nil
	self.sgs.panic_suppression_chance = 0.05
end		

if self.beck then --Gambyt's Reinbeck M1 Shotgun
	self.beck.has_description = true
	self.beck.desc_id = "bm_w_beck_desc"		
	self.beck.tactical_reload = 1
	self.beck.rays = 9
	self.beck.timers = {
		shotgun_reload_enter = 0.4,
		shotgun_reload_exit_empty = 1.3,
		shotgun_reload_exit_not_empty = 1,
		shotgun_reload_shell = 0.6666667,
		shotgun_reload_first_shell_offset = 0.33666667,
		unequip = 0.5,
		equip = 0.5
	}
	self.beck.CLIP_AMMO_MAX = 8 * 1
	self.beck.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.beck.kick.standing = self.huntsman.kick.standing
	self.beck.kick.crouching = self.huntsman.kick.crouching
	self.beck.kick.steelsight = self.huntsman.kick.steelsight
	self.beck.single.fire_rate = 0.5
	self.beck.fire_mode_data.fire_rate = 0.5
	self.beck.AMMO_MAX = 40 
	self.beck.AMMO_PICKUP = self:_pickup_chance()
	self.beck.supported = true
	self.beck.stats = {
		damage = 90,
		spread = 5,
		recoil = 11,
		zoom = 1,
		concealment = 18,
		suppression = 4,
		alert_size = 4,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.beck.stats_modifiers = {damage = 1}
	self.beck.panic_suppression_chance = 0.05
end

if self.car9 then --Gambyt's ACAR 9
	self.car9.desc_id = "bm_menu_sc_amcar_desc"
	self.car9.CLIP_AMMO_MAX = 20
	self.car9.AMMO_MAX = 90
	self.car9.tactical_reload = 1		
	self.car9.AMMO_PICKUP = self:_pickup_chance()
	self.car9.fire_mode_data.fire_rate = 0.06315789473
	self.car9.auto.fire_rate = 0.06315789473
	self.car9.kick.standing = self.new_m4.kick.standing
	self.car9.kick.crouching = self.new_m4.kick.crouching
	self.car9.kick.steelsight = self.new_m4.kick.steelsight
	self.car9.supported = true
	self.car9.stats = {
		damage = 20,
		spread = 18,
		recoil = 19,
		spread_moving = 6,
		zoom = 1,
		concealment = 29,
		suppression = 19,
		alert_size = 19,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.car9.timers.reload_not_empty = 2.10
	self.car9.timers.reload_empty = 2.9 		
	self.car9.panic_suppression_chance = 0.05
	self.car9.stats_modifiers = nil		
end

if self.smolak then --Gambyt's AK Draco Pistol
	self.smolak.categories = {
		"assault_rifle"
	}
	self.smolak.use_data.selection_index = 2
	self.smolak.tactical_reload = 1
	self.smolak.categories = {"pistol"}		
	self.smolak.fire_mode_data.fire_rate = 0.0923076923
	self.smolak.auto.fire_rate = 0.0923076923
	self.smolak.AMMO_MAX = 80
	self.smolak.AMMO_PICKUP = self:_pickup_chance()
	self.smolak.CAN_TOGGLE_FIREMODE = true
	self.smolak.kick.standing = self.new_m4.kick.standing
	self.smolak.kick.crouching = self.new_m4.kick.crouching
	self.smolak.kick.steelsight = self.new_m4.kick.steelsight		
	self.smolak.supported = true
	self.smolak.stats = {
		damage = 45,
		spread = 18,
		recoil = 17,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 9,
		reload = 20
	}
	self.smolak.stats_modifiers = nil
	self.smolak.panic_suppression_chance = 0.05
	self.smolak.timers.reload_not_empty = 1.95 
	self.smolak.timers.reload_empty = 3.7 
end		

if self.x_car9 then --disabled vmp akimbos
	self.x_car9.use_data.selection_index = 4
	self.x_car9.supported = true
end	

if self.x_smolak then --disabled vmp akimbos
	self.x_smolak.use_data.selection_index = 4
	self.x_smolak.supported = true
end	

if self.x_ak5s then --disabled vmp akimbos
	self.x_ak5s.use_data.selection_index = 4
	self.x_ak5s.supported = true
end	

if self.x_cold then --disabled vmp akimbos
	self.x_cold.use_data.selection_index = 4
	self.x_cold.supported = true
end		

if self.cold then --Gambyt's VMP Classic Crosskill
	self.cold.tactical_reload = 1											
	self.cold.fire_mode_data.fire_rate = 0.08571428571
	self.cold.single.fire_rate = 0.08571428571
	self.cold.CLIP_AMMO_MAX = 8
	self.cold.AMMO_MAX = 40
	self.cold.AMMO_PICKUP = self:_pickup_chance()
	self.cold.kick.standing = self.glock_17.kick.standing
	self.cold.kick.crouching = self.glock_17.kick.crouching
	self.cold.kick.steelsight = self.glock_17.kick.steelsight
	self.cold.supported = true
	self.cold.stats = {
		damage = 45,
		spread = 19,
		recoil = 19,
		spread_moving = 5,
		zoom = 1,
		concealment = 26,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.cold.stats_modifiers = nil
	self.cold.panic_suppression_chance = 0.05
	self.cold.swap_speed_multiplier = 0.75
end

if self.aknato then --Gambyt's Mamba 5.56 / Ak-101
	self.aknato.tactical_reload = 1
	self.aknato.spread = {
		standing = 3,
		crouching = 2,
		steelsight = 1,
		moving_standing = 4,
		moving_crouching = 3,
		moving_steelsight = 2
	}
	self.aknato.CLIP_AMMO_MAX = 30
	self.aknato.AMMO_MAX = 150
	self.aknato.FIRE_MODE = "auto"				
	self.aknato.CAN_TOGGLE_FIREMODE = true
	self.aknato.AMMO_PICKUP = self:_pickup_chance()
	self.aknato.kick.standing = self.new_m4.kick.standing
	self.aknato.kick.crouching = self.new_m4.kick.crouching
	self.aknato.kick.steelsight = self.new_m4.kick.steelsight		
	self.aknato.supported = true
	self.aknato.stats = {
		damage = 24,
		spread = 18,
		recoil = 21,
		zoom = 1,
		concealment = 25,
		suppression = 8,
		alert_size = 8,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.aknato.stats_modifiers = nil
	self.aknato.panic_suppression_chance = 0.05
end

if self.m590 then --Silent Enforcer and GT's Mossberg 590
	self.m590.has_description = true
	self.m590.tactical_reload = 1
	self.m590.desc_id = "bm_w_m590_desc"		
	self.m590.rays = 9
	self.m590.timers = {
		shotgun_reload_enter = 0.4,
		shotgun_reload_exit_empty = 1.3,
		shotgun_reload_exit_not_empty = 1,
		shotgun_reload_shell = 0.6666667,
		shotgun_reload_first_shell_offset = 0.33666667,
		unequip = 0.5,
		equip = 0.5
	}
	self.m590.CLIP_AMMO_MAX = 8 * 1
	self.m590.muzzleflash = "effects/particles/shotgun/muzzleflash"
	self.m590.kick.standing = self.new_m4.kick.standing
	self.m590.kick.crouching = self.new_m4.kick.standing
	self.m590.kick.steelsight = self.new_m4.kick.standing
	self.m590.single.fire_rate = 0.8
	self.m590.fire_mode_data.fire_rate = 0.8
	self.m590.AMMO_MAX = 40 
	self.m590.AMMO_PICKUP = self:_pickup_chance()
	self.m590.supported = true
	self.m590.stats = {
		damage = 90,
		spread = 9,
		recoil = 16,
		spread_moving = 5,
		zoom = 1,
		concealment = 15,
		suppression = 5,
		alert_size = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.m590.stats_modifiers = {damage = 1}
	self.m590.panic_suppression_chance = 0.05
end	

if self.hpb then --Gambyt's Browning HP	
	self.hpb.tactical_reload = 1												
	self.hpb.fire_mode_data.fire_rate = 0.08571428571
	self.hpb.single.fire_rate = 0.08571428571
	self.hpb.CLIP_AMMO_MAX = 10
	self.hpb.AMMO_MAX = 40
	self.hpb.AMMO_PICKUP = self:_pickup_chance()
	self.hpb.kick.standing = self.glock_17.kick.standing
	self.hpb.kick.crouching = self.glock_17.kick.crouching
	self.hpb.kick.steelsight = self.glock_17.kick.steelsight
	self.hpb.supported = true
	self.hpb.stats = {
		damage = 45,
		spread = 17,
		recoil = 18,
		spread_moving = 5,
		zoom = 1,
		concealment = 25,
		suppression = 6,
		alert_size = 6,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.hpb.stats_modifiers = nil
	self.hpb.panic_suppression_chance = 0.05
end	

if self.toym16 then --Gambyt's Toy M16
	self.toym16.CLIP_AMMO_MAX = 150
	self.toym16.AMMO_MAX = 900
	self.toym16.AMMO_PICKUP = self:_pickup_chance()
	self.toym16.supported = true
	self.toym16.stats = {
		damage = 4,
		spread = 21,
		recoil = 26,
		zoom = 1,
		concealment = math.random(0,32),
		suppression = 21,
		alert_size = 21,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.toym16.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.toym16.kick.crouching = {
		0,
		0,
		0,
		0
	}
	self.toym16.kick.steelsight = {
		0,
		0,
		0,
		0
	}
	self.toym16.panic_suppression_chance = 0.05
end

if self.toy1911 then --Gambyt's Toy M1911
	self.toy1911.CLIP_AMMO_MAX = 90
	self.toy1911.AMMO_MAX = 450
	self.toy1911.AMMO_PICKUP = self:_pickup_chance()
	self.toy1911.supported = true
	self.toy1911.stats = {
		damage = 4,
		spread = 21,
		recoil = 26,
		zoom = 1,
		concealment = math.random(0,32),
		suppression = 21,
		alert_size = 21,
		extra_ammo = 101,
		total_ammo_mod = 100,
		value = 1,
		reload = 20
	}
	self.toy1911.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.toy1911.kick.crouching = {
		0,
		0,
		0,
		0
	}
	self.toy1911.kick.steelsight = {
		0,
		0,
		0,
		0
	}
	self.toy1911.swap_speed_multiplier = 2
	self.toy1911.panic_suppression_chance = 0.05
end

--Vanilla Mod Pack Volume 2
if self.bdgr then --Hornet .300
	self.bdgr.tactical_reload = 1
	self.bdgr.AMMO_MAX = 120
	self.bdgr.AMMO_PICKUP = self:_pickup_chance()
	self.bdgr.supported = true
	self.bdgr.stats = {
		damage = 30,
		spread = 17,
		recoil = 15,
		zoom = 1,
		concealment = 24,
		alert_size = 19,
		suppression = 19,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 6
	}
	self.bdgr.kick = self.new_m4.kick
	self.bdgr.panic_suppression_chance = 0.05
	self.bdgr.stats_modifiers = nil
end

if self.minibeck then --Reinbeck Auto
	self.minibeck.AMMO_MAX = 30
	self.minibeck.AMMO_PICKUP = self:_pickup_chance()
	self.minibeck.supported = true
	self.minibeck.stats = {
		damage = 60,
		spread = 6,
		recoil = 7,
		zoom = 1,
		concealment = 23,
		alert_size = 5,
		suppression = 5,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 7
	}
	self.minibeck.kick = self.huntsman.kick
	self.minibeck.panic_suppression_chance = 0.05
	self.minibeck.stats_modifiers = nil
	self.minibeck.rays = 9
	self.minibeck.swap_speed_multiplier = 0.8
end

--Silent Killer Pack
if self.welrod then --Welrod
	self.welrod.AMMO_MAX = 30
	self.welrod.AMMO_PICKUP = self:_pickup_chance()
	self.welrod.supported = true
	self.welrod.stats = {
		damage = 60,
		spread = 20,
		recoil = 21,
		concealment = 26,
		suppression = 18,
		alert_size = 18,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 5
	}
	self.welrod.kick = self.new_m4.kick
	self.welrod.panic_suppression_chance = 0.05
	self.welrod.stats_modifiers = nil
	self.welrod.swap_speed_multiplier = 1.1
end

--Silent Killer Pack PB
if self.pb then
	self.pb.AMMO_MAX = 75
	self.pb.ammo_pickup = self:_pickup_chance()
	self.pb.supported = true
	self.pb.fire_mode_data.fire_rate = 0.08571428571
	self.pb.single.fire_rate = 0.08571428571
	self.pb.stats = {
		damage = 24,
		spread = 20,
		recoil = 23,
		concealment = 30,
		alert_size = 20,
		suppression = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 4
	}
	self.pb.kick = self.new_m4.kick
	self.pb.panic_suppression_chance = 0.05
	self.pb.stats_modifiers = nil
	self.pb.swap_speed_multiplier = 1.1
end

--Silent Killer Pack High Standard HDM
if self.hshdm then
	self.hshdm.AMMO_MAX = 90
	self.hshdm.ammo_pickup = self:_pickup_chance()
	self.hshdm.supported = true
	self.hshdm.fire_mode_data.fire_rate = 0.08571428571
	self.hshdm.single.fire_rate = 0.08571428571
	self.hshdm.stats = {
		damage = 20,
		spread = 19,
		recoil = 24,
		concealment = 31,
		alert_size = 21,
		suppression = 21,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 4
	}
	self.hshdm.kick = self.new_m4.kick
	self.hshdm.panic_suppression_chance = 0.05
	self.hshdm.stats_modifiers = nil
	self.hshdm.swap_speed_multiplier = 1.1
	self.x_hshdm.selection_index = 4 --No akimbos
end

--Silent Killer Pack Maxim 9
if self.max9 then
	self.max9.AMMO_MAX = 75
	self.max9.ammo_pickup = self:_pickup_chance()
	self.max9.supported = true
	self.max9.fire_mode_data.fire_rate = 0.08571428571
	self.max9.single.fire_rate = 0.08571428571
	self.max9.stats = {
		damage = 24,
		spread = 18,
		recoil = 23,
		concealment = 27,
		alert_size = 20,
		suppression = 20,
		extra_ammo = 101,
		total_ammo_mod = 100,
		reload = 20,
		value = 5
	}
	self.max9.kick = self.new_m4.kick
	self.max9.panic_suppression_chance = 0.05
	self.max9.stats_modifiers = nil
	self.max9.swap_speed_multiplier = 1.1
end

--Automatically generate reasonableish stats for custom weapons. Also sets damage falloff on shotguns.
for i, weap in pairs(self) do
	if weap.categories then
		if not weap.supported and weap.stats then
			self:generate_custom_weapon_stats(weap)	
		end

		--Calculate shotgun falloff ranges.
		for _, value in pairs(weap.categories) do
			if value == "shotgun" and weap.stats then
				weap.damage_near = 200 + 75 * (weap.stats.spread - 1)
				weap.damage_far = weap.damage_near * 2
			end
		end
	end
end
	
end)

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
	self.osipr_gl_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.flamethrower_mk2_crew.usage = "flamethrower"
	self.flamethrower_mk2_crew.anim_usage = "is_bullpup"	
	--Crew shit below--
	self.benelli_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mossberg_crew = {
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
	self.ching_crew = {
		usage = "is_sniper",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}		
	self.spas12_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.m16_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.peacemaker_crew = {
		usage = "is_revolver",
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
	self.smoke_npc = {
		usage = "is_smg",
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
end

WeaponTweakData.clone__precalculate_values = WeaponTweakData._precalculate_values
function WeaponTweakData:_precalculate_values()
	self:clone__precalculate_values()
	self.hk21_sc_npc.AMMO_MAX = self.hk21_sc_npc.CLIP_AMMO_MAX * self.hk21_sc_npc.NR_CLIPS_MAX
	self.mp5_cloak_npc.AMMO_MAX = self.mp5_cloak_npc.CLIP_AMMO_MAX * self.mp5_cloak_npc.NR_CLIPS_MAX
	self.peacemaker_npc.AMMO_MAX = self.peacemaker_npc.CLIP_AMMO_MAX * self.peacemaker_npc.NR_CLIPS_MAX
	self.m16_crew.AMMO_MAX = 9999999
	self.m16_crew_summers.AMMO_MAX = 9999999
	self.peacemaker_crew.AMMO_MAX = 9999999
	self.p90_crew.AMMO_MAX = 9999999
	self.flamethrower_mk2_crew.AMMO_MAX = 9999999
	self.olympic_crew.AMMO_MAX = 9999999
end