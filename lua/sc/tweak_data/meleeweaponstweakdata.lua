
local melee_weapons_old = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(tweak_data)
   	melee_weapons_old(self, tweak_data)	
	local melee_anim = {}
		
		--melee_nin
		melee_anim = {
			'nin'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_nin_res"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.0
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].can_melee_miss = true
			self.melee_weapons[melee_id].miss_repeat_expire_t = 0.005
			self.melee_weapons[melee_id].miss_expire_t = 0.45
			self.melee_weapons[melee_id].miss_anim_speed_mult = nil
			self.melee_weapons[melee_id].melee_damage_delay = 0.015
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
			self.melee_weapons[melee_id].melee_charge_shaker = ""
			self.melee_weapons[melee_id].no_hit_shaker = true
			self.melee_weapons[melee_id].sounds.hit_air = "secondary_dryfire"
			self.melee_weapons[melee_id].sounds.charge = ""
			self.melee_weapons[melee_id].make_effect = true
			self.melee_weapons[melee_id].make_decal = true 
		end
	
		--melee_cs
		melee_anim = {
			'cs'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cs"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var3"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].timing_fix = {"var1"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.2
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.45
			self.melee_weapons[melee_id].anim_speed_mult = 0.9
			self.melee_weapons[melee_id].melee_charge_shaker = ""
		end
		
		--melee_great
		--It's basically "melee_baseballbat" but with more windup
		melee_anim = {
			'great','meter'
		}
		--unsure if this'll work, hope it does
		if self.melee_weapons.halloween_sword then
			table.insert(melee_anim, "halloween_sword")
		end
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_great"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var1"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.20
			self.melee_weapons[melee_id].melee_damage_delay = 0.6
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
		end
		self.melee_weapons.meter.anim_attack_charged_vars = nil
		
		--melee_hockey
		--Bad anim set, makes anything using it look like it doesn't have the range its given. Moved weapons out of here into "melee_baseballbat"
		melee_anim = {
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_hockey"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].timing_fix = {"var4"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.58
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
		end
		
		--melee_briefcase
		melee_anim = {
			'briefcase'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_briefcase"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.2
			self.melee_weapons[melee_id].repeat_expire_t = 1
			self.melee_weapons[melee_id].melee_damage_delay = 0.3
			self.melee_weapons[melee_id].anim_speed_mult = 1.4
		end
		
		--melee_fear
		melee_anim = {
			'fear'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fear"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_speed_mult = 1.4
		end
		
		--melee_baseballbat
		melee_anim = {
			'stick','spoon','spoon_gold',
			'freedom'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_baseballbat"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"} --No more stabbing with blunt objects
			self.melee_weapons[melee_id].expire_t = 1.025
			self.melee_weapons[melee_id].repeat_expire_t = 0.9
			self.melee_weapons[melee_id].melee_damage_delay = 0.275
			self.melee_weapons[melee_id].anim_speed_mult = 0.9473
		end
		self.melee_weapons.freedom.anim_speed_mult = 0.8
		self.melee_weapons.freedom.anim_attack_vars = {"var1","var2","var4"}
		self.melee_weapons.freedom.anim_attack_charged_vars = {"var3"} --This however, is not blunt and very capable of stabbing :^)
		
		--melee_beardy
		melee_anim = {
			'beardy','baseballbat','barbedwire','dingdong','alien_maul','hockey'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_beardy"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.2
			self.melee_weapons[melee_id].melee_damage_delay = 0.65
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
		end

		--melee_cutters
		melee_anim = {
			'cutters'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cutters"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"} --Downward swings on uncharged attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var4"} --Jab on charged attacks
			self.melee_weapons[melee_id].expire_t = 1.15
			self.melee_weapons[melee_id].repeat_expire_t = 0.95
			self.melee_weapons[melee_id].melee_damage_delay = 0.3
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
		
		--melee_knife
		melee_anim = {
			'kabartanto','kabar','rambo','bowie'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_knife"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1", "var3", "var4"}
			self.melee_weapons[melee_id].expire_t = 1.1
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1.2307
		end	
		self.melee_weapons.bowie.anim_attack_vars = {"var1","var2"} --Removes the awkward blunt side strike attack variants
		
		--melee_knife2
		melee_anim = {
			'x46','kampfmesser','model24','microphone'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_knife2"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.475
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.7307
		end
		self.melee_weapons.model24.anim_speed_mult = 0.8636
		self.melee_weapons.microphone.anim_speed_mult = 0.8636
		
		--melee_sandsteel
		melee_anim = {
			'sandsteel'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_sandsteel"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].timing_fix = {"var3"} --What attack varants are subject to "timing_fix_speed_mult"
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.75 --Applies a speed mult to attack variants in "timing_fix". Has no bearing on other timers like repeat, expire, delay
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.75
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end	
		
		--melee_boxcutter
		melee_anim = {
			'boxcutter','switchblade'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_boxcutter"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}	
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"}
			self.melee_weapons[melee_id].expire_t = 0.45
			self.melee_weapons[melee_id].repeat_expire_t = 0.35
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 0.875
		end
		
		--melee_boxing
		melee_anim = {
			'boxing_gloves'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_boxing"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"} --Jabs on uncharged melee attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var4"} --Hook/uppercut on charged melee attacks
			self.melee_weapons[melee_id].timing_fix = {"var2","var4"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.15
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.425
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 0.85
		end
		
		--melee_catch
		melee_anim = {
			'catch'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_catch"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2",}
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.525
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.675
		end	
		
		--melee_blunt
		melee_anim = {
			'baton','oldbaton','detector','shovel','shillelagh','whiskey','morning','branding_iron','slot_lever','hammer','tenderizer','croupier_rake','shock',
			'spatula','swagger','selfie','chac',
			'iceaxe'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end	
		self.melee_weapons.spatula.anim_speed_mult = 1.3
		self.melee_weapons.swagger.anim_speed_mult = 1.3
		self.melee_weapons.selfie.anim_speed_mult = 1.3
		self.melee_weapons.chac.anim_speed_mult = 1.3
		self.melee_weapons.iceaxe.anim_attack_vars = {"var1"}
		self.melee_weapons.iceaxe.make_decal = true
		self.melee_weapons.iceaxe.make_effect = true
		
		--melee_brick
		--Pretty much a clone of melee_blunt but the hand hold is wider
		melee_anim = {
			'brick'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_brick"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
		
		--melee_axe
		melee_anim = {
			'moneybundle','tomahawk','scalper','becker','gator','oxide','machete','bullseye','sap'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_machete"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.85
			self.melee_weapons[melee_id].repeat_expire_t = 0.7
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
		end
		self.melee_weapons.moneybundle.anim_speed_mult = 1.25
		
		--melee_happy
		melee_anim = {
			'happy'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_happy"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
			self.melee_weapons[melee_id].anim_speed_mult = 0.775
			self.melee_weapons[melee_id].force_play_charge = nil
			self.melee_weapons[melee_id].anims = {
			var1_attack = {
				anim = "var2"
			},		
			var2_attack = {
				anim = "var2"
			},		
			var3_attack = {
				anim = "var2"
			},
			var4_attack = {
				anim = "var2"
			},
			charge = {
				anim = "charge"
			}
		}
		end
		
		--melee_pitchfork
		melee_anim = {
			'pitchfork'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_pitchfork"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.675
			self.melee_weapons[melee_id].melee_damage_delay = 0.325
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
		end
		
		--melee_clean
		melee_anim = {
			'clean'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_clean"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 0.25
			self.melee_weapons[melee_id].repeat_expire_t = 0.2
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.6
		end
		
		--melee_pickaxe
		melee_anim = {
			'mining_pick','fireaxe','micstand'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_pickaxe"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.1
			self.melee_weapons[melee_id].repeat_expire_t = 0.95
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.975
		end
		self.melee_weapons.micstand.anim_speed_mult = 1.26666
		self.melee_weapons.mining_pick.make_decal = true
		self.melee_weapons.mining_pick.make_effect = true
		
		
		--melee_freedom
		--Moved 'freedom' to "melee_baseballbat" :^)
		melee_anim = {}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_freedom"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.25
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
		end
	
		--melee_fight
		melee_anim = {
			'fight'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fight"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var3"}
			self.melee_weapons[melee_id].timing_fix = {"var4","var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.2
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.35
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
		end
		
		--melee_twins
		melee_anim = {
			'twins'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_twins"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"} --Removes the weird pommel strike attack variant
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2"} --Charged melee attacks guarantee usage of the stab attack variant (cosmetic)
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
		end
		
		--melee_grip
		melee_anim = {
			'grip'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_grip"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.4
			self.melee_weapons[melee_id].repeat_expire_t = 0.3
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.5 --Still a bit faster than it was originally, even with this heavy of a slowdown
		end
		
		--melee_psycho
		melee_anim = {
			'chef','shawn','aziz'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_psycho"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var4"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
		end
		
		--melee_fist
		melee_anim = {
			'fists','brass_knuckles','zeus','push'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fist"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"} --Perform jab for uncharged melee attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var3"} --Perform hook for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
		
		--melee_tiger
		--Slightly different attack variants compared to "melee_fist"
		melee_anim = {
			'tiger'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_tiger"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"} --Perform uppercut for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
		
		--melee_wing
		melee_anim = {
			'wing'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_wing"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.675
			self.melee_weapons[melee_id].repeat_expire_t = 0.5
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].force_play_charge = true --flag to force animated melee weapons to replay their charge anim after successive attacks without having to redraw the weapon
		end
		
		--melee_road
		melee_anim = {
			'road'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_road"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.35
			self.melee_weapons[melee_id].force_play_charge = true
			self.melee_weapons[melee_id].anim_speed_mult = 0.85714
		end
		
		--melee_cleaver
		melee_anim = {
			'cleaver','meat_cleaver'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cleaver"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].timing_fix = {"var2","var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.975
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.85
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 1.2
		end
		
		--melee_ballistic
		melee_anim = {
			'ballistic','poker'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_ballistic"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.775
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
		end
		--It can poke now :^)
		self.melee_weapons.poker.align_objects = {"a_weapon_right"}
		self.melee_weapons.poker.anim_attack_vars = {"var1"}
		self.melee_weapons.poker.anim_attack_charged_vars = {"var2"}
		self.melee_weapons.poker.anim_speed_mult = 0.8
		
		--melee_stab
		melee_anim = {
			'toothbrush','cqc','fork','pugio','fairbair','bayonet','sword','gerber','scoutknife'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_stab"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].expire_t = 0.825
			self.melee_weapons[melee_id].repeat_expire_t = 0.5
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1.2
		end
		self.melee_weapons.scoutknife.anim_speed_mult = 0.7692
	
		--melee_taser
		melee_anim = {
			'taser'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_taser"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
		end
		
		
		--melee_agave
		melee_anim = {
			'agave'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_agave"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.675
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
		end

	--Weapon butt--
	self.melee_weapons.weapon.info_id = "bm_melee_weapon_info"
	self.melee_weapons.weapon.stats.min_damage = 4.5
	self.melee_weapons.weapon.stats.max_damage = 4.5
	self.melee_weapons.weapon.stats.min_damage_effect = 4.5
	self.melee_weapons.weapon.stats.max_damage_effect = 4.5
	self.melee_weapons.weapon.can_melee_miss = true
	self.melee_weapons.weapon.expire_t = 0.65
	self.melee_weapons.weapon.miss_expire_t = 0.75
	self.melee_weapons.weapon.repeat_expire_t = 0.5
	self.melee_weapons.weapon.miss_repeat_expire_t = 0.55
	self.melee_weapons.weapon.stats.range = 140
	self.melee_weapons.weapon.stats.concealment = 30
	--Remember the basics of CQC Snake--
	self.melee_weapons.fists.stats.min_damage = 2.4
	self.melee_weapons.fists.stats.max_damage = 4.501
	self.melee_weapons.fists.stats.min_damage_effect = 4.5
	self.melee_weapons.fists.stats.max_damage_effect = 9.0
	self.melee_weapons.fists.stats.charge_time = 0.5
	self.melee_weapons.fists.stats.range = 150
	self.melee_weapons.fists.stats.concealment = 30

	--[[     BLUNT     ]]
		--Tough love, tooth shot--
		self.melee_weapons.brass_knuckles.stats.min_damage = 3
		self.melee_weapons.brass_knuckles.stats.max_damage = 6.001
		self.melee_weapons.brass_knuckles.stats.min_damage_effect = 6.0
		self.melee_weapons.brass_knuckles.stats.max_damage_effect = 12.0
		self.melee_weapons.brass_knuckles.stats.charge_time = 0.9
		self.melee_weapons.brass_knuckles.stats.range = 155
		self.melee_weapons.brass_knuckles.stats.concealment = 29
		--Thanks Boss--	
		self.melee_weapons.fight.stats.min_damage = 1.2
		self.melee_weapons.fight.stats.max_damage = 2.401
		self.melee_weapons.fight.stats.min_damage_effect = 9.0
		self.melee_weapons.fight.stats.max_damage_effect = 18.0
		self.melee_weapons.fight.stats.charge_time = 1
		self.melee_weapons.fight.stats.range = 160
		self.melee_weapons.fight.stats.concealment = 30
		self.melee_weapons.fight.counter_damage = 12
		self.melee_weapons.fight.info_id = "bm_melee_fight_info"
		--Ding Ding--
		self.melee_weapons.boxing_gloves.info_id = "bm_melee_boxing_gloves_info"
		self.melee_weapons.boxing_gloves.stats.min_damage = 1.8
		self.melee_weapons.boxing_gloves.stats.max_damage = 3.001
		self.melee_weapons.boxing_gloves.stats.min_damage_effect = 9.0
		self.melee_weapons.boxing_gloves.stats.max_damage_effect = 18.0
		self.melee_weapons.boxing_gloves.stats.charge_time = 1
		self.melee_weapons.boxing_gloves.stats.range = 160
		self.melee_weapons.boxing_gloves.stats.concealment = 28
		self.melee_weapons.boxing_gloves.special_weapon = "stamina_restore"

		--Fleshlight--
		self.melee_weapons.aziz.stats.min_damage = 2.4
		self.melee_weapons.aziz.stats.max_damage = 4.501
		self.melee_weapons.aziz.stats.min_damage_effect = 4.5
		self.melee_weapons.aziz.stats.max_damage_effect = 9.0
		self.melee_weapons.aziz.stats.charge_time = 0.7
		self.melee_weapons.aziz.stats.range = 150
		self.melee_weapons.aziz.stats.concealment = 28

		--woo free tasers--
		self.melee_weapons.zeus.special_weapon = "taser"
		self.melee_weapons.zeus.info_id = "bm_melee_taser_info"
		self.melee_weapons.zeus.stats.min_damage = 1.2
		self.melee_weapons.zeus.stats.max_damage = 2.401
		self.melee_weapons.zeus.stats.min_damage_effect = 0.6
		self.melee_weapons.zeus.stats.max_damage_effect = 1.2
		self.melee_weapons.zeus.stats.charge_time = 0.75
		self.melee_weapons.zeus.stats.range = 155
		self.melee_weapons.zeus.stats.concealment = 28
		--RIP Buzzer meta--
		self.melee_weapons.taser.special_weapon = "taser"	
		self.melee_weapons.taser.stats.min_damage = 1.2
		self.melee_weapons.taser.stats.max_damage = 2.401
		self.melee_weapons.taser.stats.min_damage_effect = 0.6
		self.melee_weapons.taser.stats.max_damage_effect = 1.2
		self.melee_weapons.taser.stats.charge_time = 0.75
		self.melee_weapons.taser.stats.range = 155
		self.melee_weapons.taser.stats.concealment = 28

		--It's da hotline--
		self.melee_weapons.brick.special_weapon = "talk"
		self.melee_weapons.brick.stats.min_damage = 2.4
		self.melee_weapons.brick.stats.max_damage = 4.501
		self.melee_weapons.brick.stats.min_damage_effect = 6.0
		self.melee_weapons.brick.stats.max_damage_effect = 12.0
		self.melee_weapons.brick.stats.charge_time = 0.7
		self.melee_weapons.brick.stats.range = 150
		self.melee_weapons.brick.stats.concealment = 28
		--Selfies are probably one of the most obnoxious things to come with the new millennials--
		self.melee_weapons.selfie.stats.min_damage = 2.4
		self.melee_weapons.selfie.stats.max_damage = 4.501
		self.melee_weapons.selfie.stats.min_damage_effect = 9.0
		self.melee_weapons.selfie.stats.max_damage_effect = 18.0
		self.melee_weapons.selfie.stats.charge_time = 0.8
		self.melee_weapons.selfie.stats.range = 160
		self.melee_weapons.selfie.stats.concealment = 27
		--Le Spatula--	
		self.melee_weapons.spatula.stats.min_damage = 2.4
		self.melee_weapons.spatula.stats.max_damage = 4.501
		self.melee_weapons.spatula.stats.min_damage_effect = 9.0
		self.melee_weapons.spatula.stats.max_damage_effect = 18.0
		self.melee_weapons.spatula.stats.charge_time = 0.7
		self.melee_weapons.spatula.stats.range = 155
		self.melee_weapons.spatula.stats.concealment = 28
		--For that you get the belt--
		--Fitting name, because if you actually like Duke you're a sap
		self.melee_weapons.sap.stats.min_damage = 2.4
		self.melee_weapons.sap.stats.max_damage = 4.501
		self.melee_weapons.sap.stats.min_damage_effect = 6.0
		self.melee_weapons.sap.stats.max_damage_effect = 12.0
		self.melee_weapons.sap.stats.charge_time = 0.4
		self.melee_weapons.sap.stats.range = 150
		self.melee_weapons.sap.stats.concealment = 30
		--Money money money--
		self.melee_weapons.moneybundle.stats.min_damage = 2.4
		self.melee_weapons.moneybundle.stats.max_damage = 4.501
		self.melee_weapons.moneybundle.stats.min_damage_effect = 6.0
		self.melee_weapons.moneybundle.stats.max_damage_effect = 12.0
		self.melee_weapons.moneybundle.stats.charge_time = 0.6
		self.melee_weapons.moneybundle.stats.range = 150
		self.melee_weapons.moneybundle.stats.concealment = 29
		--Who's up for rockin the mic?--	
		self.melee_weapons.microphone.special_weapon = "talk"
		self.melee_weapons.microphone.stats.min_damage = 2.4
		self.melee_weapons.microphone.stats.max_damage = 4.501
		self.melee_weapons.microphone.stats.min_damage_effect = 6.0
		self.melee_weapons.microphone.stats.max_damage_effect = 12.0
		self.melee_weapons.microphone.stats.charge_time = 0.6
		self.melee_weapons.microphone.stats.range = 150
		self.melee_weapons.microphone.stats.concealment = 29
		--shillelelelelelagh--	
		self.melee_weapons.shillelagh.stats.min_damage = 4.5
		self.melee_weapons.shillelagh.stats.max_damage = 9.001
		self.melee_weapons.shillelagh.stats.min_damage_effect = 6.0
		self.melee_weapons.shillelagh.stats.max_damage_effect = 12.0
		self.melee_weapons.shillelagh.stats.charge_time = 1.7
		self.melee_weapons.shillelagh.stats.range = 170
		self.melee_weapons.shillelagh.attack_allowed_expire_t = 0.1
		self.melee_weapons.shillelagh.stats.concealment = 24
		--I don't even know what the fuck the swagger stick is supposed to be--
		self.melee_weapons.swagger.stats.min_damage = 3
		self.melee_weapons.swagger.stats.max_damage = 6.001
		self.melee_weapons.swagger.stats.min_damage_effect = 4.5
		self.melee_weapons.swagger.stats.max_damage_effect = 9.0
		self.melee_weapons.swagger.stats.charge_time = 1.1
		self.melee_weapons.swagger.stats.range = 180
		self.melee_weapons.swagger.stats.concealment = 27
		--BOOP BOOP--
		self.melee_weapons.detector.stats.min_damage = 4.5
		self.melee_weapons.detector.stats.max_damage = 9.001
		self.melee_weapons.detector.stats.min_damage_effect = 6.0
		self.melee_weapons.detector.stats.max_damage_effect = 12.0
		self.melee_weapons.detector.stats.charge_time = 1.7
		self.melee_weapons.detector.stats.range = 160
		self.melee_weapons.detector.attack_allowed_expire_t = 0.1
		self.melee_weapons.detector.stats.concealment = 27
		-- https://i.imgur.com/8IJSRPZ.jpg --
		self.melee_weapons.shock.stats.min_damage = 4.5
		self.melee_weapons.shock.stats.max_damage = 9.001
		self.melee_weapons.shock.stats.min_damage_effect = 9.0
		self.melee_weapons.shock.stats.max_damage_effect = 18.0
		self.melee_weapons.shock.stats.charge_time = 1.7
		self.melee_weapons.shock.stats.range = 160
		self.melee_weapons.shock.attack_allowed_expire_t = 0.1
		self.melee_weapons.shock.stats.concealment = 27
		--Cheers mate!--
		self.melee_weapons.whiskey.stats.min_damage = 4.5
		self.melee_weapons.whiskey.stats.max_damage = 9.001
		self.melee_weapons.whiskey.stats.min_damage_effect = 4.5
		self.melee_weapons.whiskey.stats.max_damage_effect = 9.0
		self.melee_weapons.whiskey.stats.charge_time = 1.5
		self.melee_weapons.whiskey.stats.range = 170
		self.melee_weapons.whiskey.stats.concealment = 27
		--Angry Shovel Noises--
		self.melee_weapons.shovel.stats.min_damage = 4.5
		self.melee_weapons.shovel.stats.max_damage = 9.001
		self.melee_weapons.shovel.stats.min_damage_effect = 6.0
		self.melee_weapons.shovel.stats.max_damage_effect = 12.0
		self.melee_weapons.shovel.stats.charge_time = 1.6
		self.melee_weapons.shovel.stats.range = 180
		self.melee_weapons.shovel.attack_allowed_expire_t = 0.1
		self.melee_weapons.shovel.stats.concealment = 25
		--Hammer Hammer Toilet Slammer--
		self.melee_weapons.hammer.stats.min_damage = 4.5
		self.melee_weapons.hammer.stats.max_damage = 9.001
		self.melee_weapons.hammer.stats.min_damage_effect = 4.5
		self.melee_weapons.hammer.stats.max_damage_effect = 9.0
		self.melee_weapons.hammer.stats.charge_time = 1.3
		self.melee_weapons.hammer.stats.range = 155
		self.melee_weapons.hammer.stats.concealment = 28
		--I'M GOIN'TA LIQUIFY YA!--
		self.melee_weapons.model24.stats.min_damage = 4.5
		self.melee_weapons.model24.stats.max_damage = 9.001
		self.melee_weapons.model24.stats.min_damage_effect = 4.5
		self.melee_weapons.model24.stats.max_damage_effect = 9.0
		self.melee_weapons.model24.stats.charge_time = 1.3
		self.melee_weapons.model24.stats.range = 155
		self.melee_weapons.model24.stats.concealment = 28
		--Tenderizing meat is my fetish--	
		self.melee_weapons.tenderizer.stats.min_damage = 4.5
		self.melee_weapons.tenderizer.stats.max_damage = 9.001
		self.melee_weapons.tenderizer.stats.min_damage_effect = 6.0
		self.melee_weapons.tenderizer.stats.max_damage_effect = 12.0
		self.melee_weapons.tenderizer.stats.charge_time = 1.5
		self.melee_weapons.tenderizer.stats.range = 165
		self.melee_weapons.tenderizer.stats.concealment = 26
		--Slutshaming--	
		self.melee_weapons.branding_iron.stats.min_damage = 6
		self.melee_weapons.branding_iron.stats.max_damage = 12.001
		self.melee_weapons.branding_iron.stats.min_damage_effect = 9.0
		self.melee_weapons.branding_iron.stats.max_damage_effect = 18.0
		self.melee_weapons.branding_iron.stats.charge_time = 1.9
		self.melee_weapons.branding_iron.stats.range = 180
		self.melee_weapons.branding_iron.stats.concealment = 24
		--The safeword is police brutality--
		self.melee_weapons.oldbaton.stats.min_damage = 3
		self.melee_weapons.oldbaton.stats.max_damage = 6.001
		self.melee_weapons.oldbaton.stats.min_damage_effect = 4.5
		self.melee_weapons.oldbaton.stats.max_damage_effect = 9.0
		self.melee_weapons.oldbaton.stats.charge_time = 1.2
		self.melee_weapons.oldbaton.stats.range = 180
		self.melee_weapons.oldbaton.stats.concealment = 26
		--HAHAHA EBIN CODE JOEK :DDDDDD--
		self.melee_weapons.happy.stats.min_damage = 3
		self.melee_weapons.happy.stats.max_damage = 6.001
		self.melee_weapons.happy.stats.min_damage_effect = 3.0
		self.melee_weapons.happy.stats.max_damage_effect = 6.0
		self.melee_weapons.happy.stats.charge_time = 1.1
		self.melee_weapons.happy.stats.range = 170
		self.melee_weapons.happy.stats.concealment = 28
		--STOP RESISTING ARRREST MOTHERFUCKER--
		self.melee_weapons.baton.stats.min_damage = 3
		self.melee_weapons.baton.stats.max_damage = 6.001
		self.melee_weapons.baton.stats.min_damage_effect = 3.0
		self.melee_weapons.baton.stats.max_damage_effect = 6.0
		self.melee_weapons.baton.stats.charge_time = 1.1
		self.melee_weapons.baton.stats.range = 170
		self.melee_weapons.baton.stats.concealment = 28
		--Another baton reskin, thanks Overkill--
		self.melee_weapons.croupier_rake.stats.min_damage = 3
		self.melee_weapons.croupier_rake.stats.max_damage = 6.001
		self.melee_weapons.croupier_rake.stats.min_damage_effect = 3.0
		self.melee_weapons.croupier_rake.stats.max_damage_effect = 6.0
		self.melee_weapons.croupier_rake.stats.charge_time = 1.2
		self.melee_weapons.croupier_rake.stats.range = 180
		self.melee_weapons.croupier_rake.stats.concealment = 26
		--It's a 1% chance to win the slots asshats keep an eye on the fucking BFD--
		self.melee_weapons.slot_lever.info_id = "bm_melee_slot_lever_info"
		self.melee_weapons.slot_lever.special_weapon = "hyper_crit"
		self.melee_weapons.slot_lever.stats.min_damage = 3
		self.melee_weapons.slot_lever.stats.max_damage = 6.001
		self.melee_weapons.slot_lever.stats.min_damage_effect = 3.0
		self.melee_weapons.slot_lever.stats.max_damage_effect = 6.0
		self.melee_weapons.slot_lever.stats.charge_time = 1.3
		self.melee_weapons.slot_lever.stats.range = 180
		self.melee_weapons.slot_lever.stats.concealment = 27
		--Ay, qué lindo carnaval--	
		self.melee_weapons.chac.stats.min_damage = 2.4
		self.melee_weapons.chac.stats.max_damage = 4.501
		self.melee_weapons.chac.stats.min_damage_effect = 1.5
		self.melee_weapons.chac.stats.max_damage_effect = 3.0
		self.melee_weapons.chac.stats.charge_time = 0.6
		self.melee_weapons.chac.stats.range = 155
		self.melee_weapons.chac.stats.concealment = 29
	
		--YEAH YEAH YEAH YEAH--
		self.melee_weapons.road.stats.min_damage = 4.5
		self.melee_weapons.road.stats.max_damage = 9.001
		self.melee_weapons.road.stats.min_damage_effect = 6.0
		self.melee_weapons.road.stats.max_damage_effect = 12.0
		self.melee_weapons.road.stats.charge_time = 1.9
		self.melee_weapons.road.stats.range = 185
		self.melee_weapons.road.stats.concealment = 25

		--Mic stand--
		self.melee_weapons.micstand.stats.min_damage = 4.5
		self.melee_weapons.micstand.stats.max_damage = 6.001
		self.melee_weapons.micstand.stats.min_damage_effect = 6.0
		self.melee_weapons.micstand.stats.max_damage_effect = 12.0
		self.melee_weapons.micstand.stats.charge_time = 1.9
		self.melee_weapons.micstand.stats.range = 200
		self.melee_weapons.micstand.stats.concealment = 25
		--Payday DLC? Nah it's a walking dead game you cunts.--
		self.melee_weapons.barbedwire.type = "axe"
		self.melee_weapons.barbedwire.dot_data = {
			type = "bleed",
			custom_data = {
				dot_damage = 2,
				dot_length = 3.1,
				hurt_animation_chance = 0.0
			}
		}
		self.melee_weapons.barbedwire.info_id = "bm_melee_barbedwire_info"
		self.melee_weapons.barbedwire.stats.min_damage = 6
		self.melee_weapons.barbedwire.stats.max_damage = 12.001
		self.melee_weapons.barbedwire.stats.min_damage_effect = 6.0
		self.melee_weapons.barbedwire.stats.max_damage_effect = 12.0
		self.melee_weapons.barbedwire.stats.charge_time = 2.3
		self.melee_weapons.barbedwire.stats.range = 200
		self.melee_weapons.barbedwire.stats.concealment = 22
		--We'll put you in the hospital for free eh?--
		self.melee_weapons.hockey.stats.min_damage = 6
		self.melee_weapons.hockey.stats.max_damage = 12.001
		self.melee_weapons.hockey.stats.min_damage_effect = 6.0
		self.melee_weapons.hockey.stats.max_damage_effect = 12.0
		self.melee_weapons.hockey.stats.charge_time = 2
		self.melee_weapons.hockey.stats.range = 200
		self.melee_weapons.hockey.stats.concealment = 24
		--I get it, it's the hotline--
		self.melee_weapons.baseballbat.stats.min_damage = 6
		self.melee_weapons.baseballbat.stats.max_damage = 12.001
		self.melee_weapons.baseballbat.stats.min_damage_effect = 9.0
		self.melee_weapons.baseballbat.stats.max_damage_effect = 18.0
		self.melee_weapons.baseballbat.stats.charge_time = 2.1
		self.melee_weapons.baseballbat.stats.range = 200
		self.melee_weapons.baseballbat.stats.concealment = 23
		--Binary Ruler--
		self.melee_weapons.meter.stats.min_damage = 4.5
		self.melee_weapons.meter.stats.max_damage = 9.001
		self.melee_weapons.meter.stats.min_damage_effect = 4.5
		self.melee_weapons.meter.stats.max_damage_effect = 9.0
		self.melee_weapons.meter.stats.charge_time = 1.9
		self.melee_weapons.meter.stats.range = 200
		self.melee_weapons.meter.stats.concealment = 25
		--Shephard's cane--
		self.melee_weapons.stick.type = "axe"
		self.melee_weapons.stick.stats.min_damage = 6
		self.melee_weapons.stick.stats.max_damage = 12.001
		self.melee_weapons.stick.stats.min_damage_effect = 9.0
		self.melee_weapons.stick.stats.max_damage_effect = 18.0
		self.melee_weapons.stick.stats.charge_time = 2.1
		self.melee_weapons.stick.stats.range = 200
		self.melee_weapons.stick.stats.concealment = 23
		--WHAT IB WE JUZ USED A SPUUUN :DDDDD--
		self.melee_weapons.spoon.stats.min_damage = 6
		self.melee_weapons.spoon.stats.max_damage = 12.001
		self.melee_weapons.spoon.stats.min_damage_effect = 9.0
		self.melee_weapons.spoon.stats.max_damage_effect = 18.0
		self.melee_weapons.spoon.stats.charge_time = 2
		self.melee_weapons.spoon.stats.range = 200
		self.melee_weapons.spoon.stats.concealment = 23
		--BIRE xddddddd--
		self.melee_weapons.spoon_gold.type = "axe"
		self.melee_weapons.spoon_gold.fire_dot_data = {
			dot_trigger_chance = "50",
			dot_damage = "2",
			dot_length = "3.1",
			dot_trigger_max_distance = "3000",
			dot_tick_period = "0.5"
		}	
		self.melee_weapons.spoon_gold.info_id = "bm_melee_spoon_gold_info"
		self.melee_weapons.spoon_gold.stats.min_damage = 6
		self.melee_weapons.spoon_gold.stats.max_damage = 12.001
		self.melee_weapons.spoon_gold.stats.min_damage_effect = 6.0
		self.melee_weapons.spoon_gold.stats.max_damage_effect = 12.0
		self.melee_weapons.spoon_gold.stats.charge_time = 2.3
		self.melee_weapons.spoon_gold.stats.range = 200
		self.melee_weapons.spoon_gold.stats.concealment = 22
		--Ayy Hammer--
		self.melee_weapons.alien_maul.type = "axe"
		self.melee_weapons.alien_maul.stats.min_damage = 6
		self.melee_weapons.alien_maul.stats.max_damage = 12.001
		self.melee_weapons.alien_maul.stats.min_damage_effect = 12.0
		self.melee_weapons.alien_maul.stats.max_damage_effect = 24.0
		self.melee_weapons.alien_maul.stats.charge_time = 2.2
		self.melee_weapons.alien_maul.stats.range = 210
		self.melee_weapons.alien_maul.stats.concealment = 22
		--It has a crowbar we can't use--
		self.melee_weapons.dingdong.stats.min_damage = 6
		self.melee_weapons.dingdong.stats.max_damage = 12.001
		self.melee_weapons.dingdong.stats.min_damage_effect = 12.0
		self.melee_weapons.dingdong.stats.max_damage_effect = 24.0
		self.melee_weapons.dingdong.stats.charge_time = 2.2
		self.melee_weapons.dingdong.stats.range = 210
		self.melee_weapons.dingdong.stats.concealment = 22
		--we postal now--
		self.melee_weapons.cutters.stats.min_damage = 6
		self.melee_weapons.cutters.stats.max_damage = 12.001
		self.melee_weapons.cutters.stats.min_damage_effect = 9.0
		self.melee_weapons.cutters.stats.max_damage_effect = 18.0
		self.melee_weapons.cutters.stats.charge_time = 2
		self.melee_weapons.cutters.stats.range = 170
		self.melee_weapons.cutters.stats.concealment = 24

		--I'm a little annoyed that we can't actually use it like a shield--
		--NOW WE CAN--
		self.melee_weapons.buck.info_id = "bm_melee_buck_info"	
		self.melee_weapons.buck.stats.min_damage = 3
		self.melee_weapons.buck.stats.max_damage = 6.001
		self.melee_weapons.buck.stats.min_damage_effect = 6.0
		self.melee_weapons.buck.stats.max_damage_effect = 12.0
		self.melee_weapons.buck.stats.charge_time = 1.2
		self.melee_weapons.buck.stats.range = 155
		self.melee_weapons.buck.stats.concealment = 26
		self.melee_weapons.buck.block = 0.9

		--The target is a briefcase. Discretion is of the essence.--
		self.melee_weapons.briefcase.info_id = "bm_melee_briefcase_info"	
		self.melee_weapons.briefcase.stats.min_damage = 2.4
		self.melee_weapons.briefcase.stats.max_damage = 4.501
		self.melee_weapons.briefcase.stats.min_damage_effect = 6.0
		self.melee_weapons.briefcase.stats.max_damage_effect = 12.0
		self.melee_weapons.briefcase.stats.charge_time = 1.4
		self.melee_weapons.briefcase.stats.range = 150
		self.melee_weapons.briefcase.stats.concealment = 28
		self.melee_weapons.buck.block = 0.95




	--[[     SHARP     ]]
	
		--Basically just a really short knife--	
		self.melee_weapons.tiger.info_id = "bm_melee_specialist_info"
		self.melee_weapons.tiger.special_weapon = "repeat_hitter"
		self.melee_weapons.tiger.stats.min_damage = 3
		self.melee_weapons.tiger.stats.max_damage = 6.001
		self.melee_weapons.tiger.stats.min_damage_effect = 4.0
		self.melee_weapons.tiger.stats.max_damage_effect = 8.0
		self.melee_weapons.tiger.stats.charge_time = 0.65
		self.melee_weapons.tiger.stats.range = 150
		self.melee_weapons.tiger.stats.concealment = 30
		--Not one but TWO pokers--
		self.melee_weapons.push.info_id = "bm_melee_specialist_info"
		self.melee_weapons.push.special_weapon = "repeat_hitter"
		self.melee_weapons.push.stats.min_damage = 4.5
		self.melee_weapons.push.stats.max_damage = 9.001
		self.melee_weapons.push.stats.min_damage_effect = 1.0
		self.melee_weapons.push.stats.max_damage_effect = 2.0
		self.melee_weapons.push.stats.charge_time = 1.05
		self.melee_weapons.push.stats.range = 160
		self.melee_weapons.push.stats.concealment = 28
		--A ballistic knife we can't even fire--
		self.melee_weapons.ballistic.info_id = "bm_melee_specialist_info"
		self.melee_weapons.ballistic.special_weapon = "repeat_hitter"
		self.melee_weapons.ballistic.sounds.equip = "knife_equip"
		self.melee_weapons.ballistic.sounds.hit_air = "knife_hit_air"
		self.melee_weapons.ballistic.sounds.hit_gen = "knife_hit_gen"
		self.melee_weapons.ballistic.sounds.hit_body = "knife_hit_body"
		self.melee_weapons.ballistic.sounds.charge = "knife_charge"
		self.melee_weapons.ballistic.stats.min_damage = 4.5
		self.melee_weapons.ballistic.stats.max_damage = 9.001
		self.melee_weapons.ballistic.stats.min_damage_effect = 1.0
		self.melee_weapons.ballistic.stats.max_damage_effect = 2.0
		self.melee_weapons.ballistic.stats.charge_time = 1.05
		self.melee_weapons.ballistic.stats.range = 160
		self.melee_weapons.ballistic.stats.concealment = 28
		--Unlike Sonic I don't chuckle
		self.melee_weapons.grip.info_id = "bm_melee_specialist_info"
		self.melee_weapons.grip.special_weapon = "repeat_hitter"
		self.melee_weapons.grip.stats.min_damage = 4.5
		self.melee_weapons.grip.stats.max_damage = 9.001
		self.melee_weapons.grip.stats.min_damage_effect = 1.0
		self.melee_weapons.grip.stats.max_damage_effect = 2.0
		self.melee_weapons.grip.stats.charge_time = 1.05
		self.melee_weapons.grip.stats.range = 160
		self.melee_weapons.grip.stats.concealment = 28
		--Can't fight nature jack--	
		self.melee_weapons.twins.stats.min_damage = 4.5
		self.melee_weapons.twins.stats.max_damage = 9.001
		self.melee_weapons.twins.stats.min_damage_effect = 3.0
		self.melee_weapons.twins.stats.max_damage_effect = 6.0
		self.melee_weapons.twins.stats.charge_time = 1.15
		self.melee_weapons.twins.stats.range = 170
		self.melee_weapons.twins.stats.concealment = 28


		--memed hard enough into the game--
		self.melee_weapons.sword.stats.min_damage = 3
		self.melee_weapons.sword.stats.max_damage = 6.001
		self.melee_weapons.sword.stats.min_damage_effect = 0.6
		self.melee_weapons.sword.stats.max_damage_effect = 1.2
		self.melee_weapons.sword.stats.charge_time = 0.25
		self.melee_weapons.sword.stats.range = 150
		self.melee_weapons.sword.stats.concealment = 30
		--That's a big ass toothbrush--
		self.melee_weapons.toothbrush.stats.min_damage = 3
		self.melee_weapons.toothbrush.stats.max_damage = 6.001
		self.melee_weapons.toothbrush.stats.min_damage_effect = 0.6
		self.melee_weapons.toothbrush.stats.max_damage_effect = 1.2
		self.melee_weapons.toothbrush.stats.charge_time = 0.25
		self.melee_weapons.toothbrush.stats.range = 150
		self.melee_weapons.toothbrush.stats.concealment = 30
		--This looks like a boxcutter too, but whatever--
		self.melee_weapons.gerber.stats.min_damage = 3
		self.melee_weapons.gerber.stats.max_damage = 6.001
		self.melee_weapons.gerber.stats.min_damage_effect = 0.6
		self.melee_weapons.gerber.stats.max_damage_effect = 1.2
		self.melee_weapons.gerber.stats.charge_time = 0.4
		self.melee_weapons.gerber.stats.range = 150
		self.melee_weapons.gerber.stats.concealment = 30
		--REMEMBER THE BASICS OF--
		self.melee_weapons.cqc.dot_data = {	
			type = "poison",
			custom_data = {
				dot_damage = 1.5,
				dot_length = 4.1,
				hurt_animation_chance = 0.5
			}
		}	
		self.melee_weapons.cqc.stats.min_damage = 1.2
		self.melee_weapons.cqc.stats.max_damage = 2.401
		self.melee_weapons.cqc.stats.min_damage_effect = 0.5
		self.melee_weapons.cqc.stats.max_damage_effect = 1.0
		self.melee_weapons.cqc.stats.charge_time = 0.25
		self.melee_weapons.cqc.stats.range = 150
		self.melee_weapons.cqc.stats.concealment = 30
		--you got blood on my suit--
		self.melee_weapons.wing.info_id = "bm_melee_wing_info"	
		self.melee_weapons.wing.stats.min_damage = 2.4
		self.melee_weapons.wing.stats.max_damage = 4.501
		self.melee_weapons.wing.stats.min_damage_effect = 0.5
		self.melee_weapons.wing.stats.max_damage_effect = 1.0
		self.melee_weapons.wing.stats.charge_time = 0.75
		self.melee_weapons.wing.stats.range = 160
		self.melee_weapons.wing.stats.concealment = 30
		self.melee_weapons.wing.backstab_damage_multiplier = 4
		--About time--
		self.melee_weapons.chef.info_id = "bm_melee_chef_info"
		self.melee_weapons.chef.stats.min_damage = 0.65
		self.melee_weapons.chef.stats.max_damage = 33.3
		self.melee_weapons.chef.stats.min_damage_effect = 1.0
		self.melee_weapons.chef.stats.max_damage_effect = 2.0
		self.melee_weapons.chef.stats.charge_time = 7
		self.melee_weapons.chef.stats.range = 160
		self.melee_weapons.chef.stats.concealment = 28
		self.melee_weapons.chef.special_weapon = "panic"
		--I wonder how many people caught that this is a Shawn the Sheep reference--
		self.melee_weapons.shawn.stats.min_damage = 6
		self.melee_weapons.shawn.stats.max_damage = 12.001
		self.melee_weapons.shawn.stats.min_damage_effect = 0.5
		self.melee_weapons.shawn.stats.max_damage_effect = 1.0
		self.melee_weapons.shawn.stats.charge_time = 1.05
		self.melee_weapons.shawn.stats.range = 160
		self.melee_weapons.shawn.stats.concealment = 29
		--I'm really annoyed that we don't actually poke with it--
		--We do now :^)
		self.melee_weapons.poker.stats.min_damage = 6
		self.melee_weapons.poker.stats.max_damage = 12.001
		self.melee_weapons.poker.stats.min_damage_effect = 1.0
		self.melee_weapons.poker.stats.max_damage_effect = 2.0
		self.melee_weapons.poker.stats.charge_time = 1.6
		self.melee_weapons.poker.stats.range = 180
		self.melee_weapons.poker.stats.concealment = 27
		--MotherFUCKER--	
		self.melee_weapons.fork.stats.min_damage = 3
		self.melee_weapons.fork.stats.max_damage = 6.001
		self.melee_weapons.fork.stats.min_damage_effect = 0.5
		self.melee_weapons.fork.stats.max_damage_effect = 1.0
		self.melee_weapons.fork.stats.charge_time = 0.4
		self.melee_weapons.fork.stats.range = 170
		self.melee_weapons.fork.stats.concealment = 28
		--Affix bayonets guardsmen, be ready for blood!--
		self.melee_weapons.bayonet.stats.min_damage = 3
		self.melee_weapons.bayonet.stats.max_damage = 6.001
		self.melee_weapons.bayonet.stats.min_damage_effect = 0.6
		self.melee_weapons.bayonet.stats.max_damage_effect = 1.2
		self.melee_weapons.bayonet.stats.charge_time = 0.4
		self.melee_weapons.bayonet.stats.range = 155
		self.melee_weapons.bayonet.stats.concealment = 29
		--Scout Knife--
		self.melee_weapons.scoutknife.stats.min_damage = 3
		self.melee_weapons.scoutknife.stats.max_damage = 6.001
		self.melee_weapons.scoutknife.stats.min_damage_effect = 0.6
		self.melee_weapons.scoutknife.stats.max_damage_effect = 1.2
		self.melee_weapons.scoutknife.stats.charge_time = 0.4
		self.melee_weapons.scoutknife.stats.range = 155
		self.melee_weapons.scoutknife.stats.concealment = 29
		--Even more pokey knives--
		self.melee_weapons.pugio.stats.min_damage = 3
		self.melee_weapons.pugio.stats.max_damage = 6.001
		self.melee_weapons.pugio.stats.min_damage_effect = 0.6
		self.melee_weapons.pugio.stats.max_damage_effect = 1.2
		self.melee_weapons.pugio.stats.charge_time = 0.25
		self.melee_weapons.pugio.stats.range = 155
		self.melee_weapons.pugio.stats.concealment = 29
		--Trench Knife use to be the Fugitive meta--
		self.melee_weapons.fairbair.stats.min_damage = 3
		self.melee_weapons.fairbair.stats.max_damage = 6.001
		self.melee_weapons.fairbair.stats.min_damage_effect = 0.6
		self.melee_weapons.fairbair.stats.max_damage_effect = 1.2
		self.melee_weapons.fairbair.stats.charge_time = 0.35
		self.melee_weapons.fairbair.stats.range = 165
		self.melee_weapons.fairbair.stats.concealment = 28
		--LET'S GO PRACTICE MEDICINE--
		self.melee_weapons.fear.dot_data = {
			type = "poison",
			custom_data = {
				dot_damage = 1.5,
				dot_length = 4.1,
				hurt_animation_chance = 0.5
			}
		}
		self.melee_weapons.fear.stats.min_damage = 1.2
		self.melee_weapons.fear.stats.max_damage = 2.401
		self.melee_weapons.fear.stats.min_damage_effect = 0.25
		self.melee_weapons.fear.stats.max_damage_effect = 0.5
		self.melee_weapons.fear.stats.charge_time = 0.25
		self.melee_weapons.fear.stats.range = 150
		self.melee_weapons.fear.stats.concealment = 30
		self.melee_weapons.fear.info_id = "bm_melee_cqc_info"

		--Clowns to the left of me, jokers to the right--
		self.melee_weapons.clean.dot_data = {
			type = "bleed",
			custom_data = {
				dot_damage = 2,
				dot_length = 3.1,
				hurt_animation_chance = 0.0
			}
		}
		self.melee_weapons.clean.info_id = "bm_melee_clean_info"
		self.melee_weapons.clean.stats.weapon_type = "sharp"
		self.melee_weapons.clean.stats.min_damage = 3
		self.melee_weapons.clean.stats.max_damage = 3
		self.melee_weapons.clean.stats.min_damage_effect = 0.6
		self.melee_weapons.clean.stats.max_damage_effect = 0.6
		self.melee_weapons.clean.stats.charge_time = 0.00001
		self.melee_weapons.clean.stats.range = 150
		self.melee_weapons.clean.stats.concealment = 30
		self.melee_weapons.clean.no_hit_shaker = true
		self.melee_weapons.clean.melee_charge_shaker = ""
		--Nyeh hey there's the high roller--
		self.melee_weapons.switchblade.info_id = "bm_melee_switchblade_info"	
		self.melee_weapons.switchblade.stats.min_damage = 3
		self.melee_weapons.switchblade.stats.max_damage = 6.001
		self.melee_weapons.switchblade.stats.min_damage_effect = 0.5
		self.melee_weapons.switchblade.stats.max_damage_effect = 1.0
		self.melee_weapons.switchblade.stats.charge_time = 0.6
		self.melee_weapons.switchblade.stats.range = 155
		self.melee_weapons.switchblade.stats.concealment = 30
		self.melee_weapons.switchblade.backstab_damage_multiplier = 2
		--Nevada--
		--This is a fucking boxcutter, seriously these things can barely cut through cardboard and we're supposed to kill cops with it?--
		self.melee_weapons.boxcutter.stats.weapon_type = "sharp"
		self.melee_weapons.boxcutter.stats.min_damage = 3
		self.melee_weapons.boxcutter.stats.max_damage = 6.001
		self.melee_weapons.boxcutter.stats.min_damage_effect = 0.5
		self.melee_weapons.boxcutter.stats.max_damage_effect = 1.0
		self.melee_weapons.boxcutter.stats.charge_time = 0.35
		self.melee_weapons.boxcutter.stats.range = 150
		self.melee_weapons.boxcutter.stats.concealment = 29
		--German Steel--
		self.melee_weapons.kampfmesser.stats.min_damage = 4.5
		self.melee_weapons.kampfmesser.stats.max_damage = 9.001
		self.melee_weapons.kampfmesser.stats.min_damage_effect = 1.5
		self.melee_weapons.kampfmesser.stats.max_damage_effect = 3.0
		self.melee_weapons.kampfmesser.stats.charge_time = 0.85
		self.melee_weapons.kampfmesser.stats.range = 170
		self.melee_weapons.kampfmesser.stats.concealment = 28
		--Tacticool Knife--
		self.melee_weapons.x46.stats.min_damage = 4.5
		self.melee_weapons.x46.stats.max_damage = 9.001
		self.melee_weapons.x46.stats.min_damage_effect = 1.5
		self.melee_weapons.x46.stats.max_damage_effect = 3.0
		self.melee_weapons.x46.stats.charge_time = 0.85
		self.melee_weapons.x46.stats.range = 170
		self.melee_weapons.x46.stats.concealment = 28

		--and anotha tanto--
		self.melee_weapons.hauteur.stats.min_damage = 4.5
		self.melee_weapons.hauteur.stats.max_damage = 9.001
		self.melee_weapons.hauteur.stats.min_damage_effect = 1.0
		self.melee_weapons.hauteur.stats.max_damage_effect = 2.0
		self.melee_weapons.hauteur.stats.charge_time = 0.65
		self.melee_weapons.hauteur.stats.range = 160
		self.melee_weapons.hauteur.stats.concealment = 30
		--OG Kabar Knife--
		self.melee_weapons.kabar.stats.min_damage = 4.5
		self.melee_weapons.kabar.stats.max_damage = 9.001
		self.melee_weapons.kabar.stats.min_damage_effect = 1.5
		self.melee_weapons.kabar.stats.max_damage_effect = 3.0
		self.melee_weapons.kabar.stats.charge_time = 0.75
		self.melee_weapons.kabar.stats.range = 160
		self.melee_weapons.kabar.stats.concealment = 29
		--ONE Knife--
		self.melee_weapons.kabartanto.stats.min_damage = 4.5
		self.melee_weapons.kabartanto.stats.max_damage = 9.001
		self.melee_weapons.kabartanto.stats.min_damage_effect = 1.5
		self.melee_weapons.kabartanto.stats.max_damage_effect = 3.0
		self.melee_weapons.kabartanto.stats.charge_time = 0.75
		self.melee_weapons.kabartanto.stats.range = 160
		self.melee_weapons.kabartanto.stats.concealment = 29
		--Now THIS is a knife.--
		self.melee_weapons.rambo.stats.min_damage = 6
		self.melee_weapons.rambo.stats.max_damage = 12.001
		self.melee_weapons.rambo.stats.min_damage_effect = 1.5
		self.melee_weapons.rambo.stats.max_damage_effect = 3.0
		self.melee_weapons.rambo.stats.charge_time = 1.25
		self.melee_weapons.rambo.stats.range = 165
		self.melee_weapons.rambo.stats.concealment = 27
		--I'm david bowie--	
		self.melee_weapons.bowie.stats.min_damage = 4.5
		self.melee_weapons.bowie.stats.max_damage = 9.001
		self.melee_weapons.bowie.stats.min_damage_effect = 2.4
		self.melee_weapons.bowie.stats.max_damage_effect = 4.5
		self.melee_weapons.bowie.stats.charge_time = 0.85
		self.melee_weapons.bowie.stats.range = 170
		self.melee_weapons.bowie.stats.concealment = 28
	
		--Its' another god damn machete--
		self.melee_weapons.becker.stats.min_damage = 4.5
		self.melee_weapons.becker.stats.max_damage = 9.001
		self.melee_weapons.becker.stats.min_damage_effect = 1.5
		self.melee_weapons.becker.stats.max_damage_effect = 3.0
		self.melee_weapons.becker.stats.charge_time = 0.9
		self.melee_weapons.becker.stats.range = 170
		self.melee_weapons.becker.stats.concealment = 27
		--another machete--
		self.melee_weapons.oxide.stats.min_damage = 4.5
		self.melee_weapons.oxide.stats.max_damage = 9.001
		self.melee_weapons.oxide.stats.min_damage_effect = 1.5
		self.melee_weapons.oxide.stats.max_damage_effect = 3.0
		self.melee_weapons.oxide.stats.charge_time = 0.9
		self.melee_weapons.oxide.stats.range = 170
		self.melee_weapons.oxide.stats.concealment = 27
		--More Gore--
		self.melee_weapons.gator.stats.min_damage = 6
		self.melee_weapons.gator.stats.max_damage = 12.001
		self.melee_weapons.gator.stats.min_damage_effect = 2.4
		self.melee_weapons.gator.stats.max_damage_effect = 4.5
		self.melee_weapons.gator.stats.charge_time = 1.3
		self.melee_weapons.gator.stats.range = 180
		self.melee_weapons.gator.stats.concealment = 26
		--Because we didn't have enough fucking machetes--
		self.melee_weapons.machete.stats.min_damage = 6
		self.melee_weapons.machete.stats.max_damage = 12.001
		self.melee_weapons.machete.stats.min_damage_effect = 2.4
		self.melee_weapons.machete.stats.max_damage_effect = 4.5
		self.melee_weapons.machete.stats.charge_time = 1.3
		self.melee_weapons.machete.stats.range = 180
		self.melee_weapons.machete.stats.concealment = 26
		--asdf--
		self.melee_weapons.agave.stats.min_damage = 6
		self.melee_weapons.agave.stats.max_damage = 12.001
		self.melee_weapons.agave.stats.min_damage_effect = 2.4
		self.melee_weapons.agave.stats.max_damage_effect = 4.5
		self.melee_weapons.agave.stats.charge_time = 1.45
		self.melee_weapons.agave.stats.range = 190
		self.melee_weapons.agave.attack_allowed_expire_t = 0.1
		self.melee_weapons.agave.stats.concealment = 25
	
		--Dragan's Meat...Cleaver--
		self.melee_weapons.meat_cleaver.info_id = "bm_melee_cleaver_info"
		self.melee_weapons.meat_cleaver.stats.min_damage = 6
		self.melee_weapons.meat_cleaver.stats.max_damage = 12.001
		self.melee_weapons.meat_cleaver.stats.min_damage_effect = 1.8
		self.melee_weapons.meat_cleaver.stats.max_damage_effect = 3.6
		self.melee_weapons.meat_cleaver.stats.charge_time = 1.1
		self.melee_weapons.meat_cleaver.stats.range = 155
		self.melee_weapons.meat_cleaver.stats.concealment = 26
		self.melee_weapons.meat_cleaver.headshot_damage_multiplier = 0.5
		--Throwing knives when?--
		self.melee_weapons.cleaver.info_id = "bm_melee_cleaver_info"
		self.melee_weapons.cleaver.stats.min_damage = 6
		self.melee_weapons.cleaver.stats.max_damage = 12.001
		self.melee_weapons.cleaver.stats.min_damage_effect = 1.8
		self.melee_weapons.cleaver.stats.max_damage_effect = 3.6
		self.melee_weapons.cleaver.stats.charge_time = 0.7
		self.melee_weapons.cleaver.stats.range = 165
		self.melee_weapons.cleaver.stats.concealment = 27
		self.melee_weapons.cleaver.headshot_damage_multiplier = 0.5
		--It's a hatchet--
		self.melee_weapons.bullseye.stats.min_damage = 6
		self.melee_weapons.bullseye.stats.max_damage = 12.001
		self.melee_weapons.bullseye.stats.min_damage_effect = 1.5
		self.melee_weapons.bullseye.stats.max_damage_effect = 3.0
		self.melee_weapons.bullseye.stats.charge_time = 1.25
		self.melee_weapons.bullseye.stats.range = 165
		self.melee_weapons.bullseye.stats.concealment = 27
		--Just like the injuns--
		self.melee_weapons.tomahawk.stats.min_damage = 6
		self.melee_weapons.tomahawk.stats.max_damage = 12.001
		self.melee_weapons.tomahawk.stats.min_damage_effect = 2.4
		self.melee_weapons.tomahawk.stats.max_damage_effect = 4.5
		self.melee_weapons.tomahawk.stats.charge_time = 1.45
		self.melee_weapons.tomahawk.stats.range = 180
		self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
		self.melee_weapons.tomahawk.stats.concealment = 25
		--another injun tomahawk	
		self.melee_weapons.scalper.stats.min_damage = 6
		self.melee_weapons.scalper.stats.max_damage = 12.001
		self.melee_weapons.scalper.stats.min_damage_effect = 2.4
		self.melee_weapons.scalper.stats.max_damage_effect = 4.5
		self.melee_weapons.scalper.stats.charge_time = 1.45
		self.melee_weapons.scalper.stats.range = 180
		self.melee_weapons.scalper.attack_allowed_expire_t = 0.1
		self.melee_weapons.scalper.stats.concealment = 25
		--Reminds me of how HL2 was gonna have an ice axe--
		self.melee_weapons.iceaxe.info_id = "bm_melee_iceaxe_info"
		self.melee_weapons.iceaxe.stats.min_damage = 6
		self.melee_weapons.iceaxe.stats.max_damage = 12.001
		self.melee_weapons.iceaxe.stats.min_damage_effect = 1.5
		self.melee_weapons.iceaxe.stats.max_damage_effect = 3.0
		self.melee_weapons.iceaxe.stats.charge_time = 1.55
		self.melee_weapons.iceaxe.stats.range = 180
		self.melee_weapons.iceaxe.stats.concealment = 27
		self.melee_weapons.iceaxe.headshot_damage_multiplier = 1.5
		--Whose plumes are gay now Carl? Whose plumes are gay now?--
		self.melee_weapons.morning.stats.min_damage = 6
		self.melee_weapons.morning.stats.max_damage = 12.001
		self.melee_weapons.morning.stats.min_damage_effect = 4.5
		self.melee_weapons.morning.stats.max_damage_effect = 9.0
		self.melee_weapons.morning.stats.charge_time = 1.8
		self.melee_weapons.morning.stats.range = 180
		self.melee_weapons.morning.stats.concealment = 24

		--FREEEEEEEDOM--
		self.melee_weapons.freedom.info_id = "bm_melee_great_info"
		self.melee_weapons.freedom.stats.min_damage = 6
		self.melee_weapons.freedom.stats.max_damage = 12.001
		self.melee_weapons.freedom.stats.min_damage_effect = 4.5
		self.melee_weapons.freedom.stats.max_damage_effect = 9.0
		self.melee_weapons.freedom.stats.charge_time = 2
		self.melee_weapons.freedom.stats.range = 220
		self.melee_weapons.freedom.stats.charge_bonus_start = 0.9
		self.melee_weapons.freedom.stats.charge_bonus_range = 50
		self.melee_weapons.freedom.stats.concealment = 23
		--Pitchfork--
		self.melee_weapons.pitchfork.info_id = "bm_melee_pitch_info" 
		self.melee_weapons.pitchfork.special_weapon = "charger"
		self.melee_weapons.pitchfork.chainsaw = {
			tick_damage = 4.5,
			tick_delay = 0.4,
			start_delay = 0.8
		}
		self.melee_weapons.pitchfork.stats.min_damage = 6
		self.melee_weapons.pitchfork.stats.max_damage = 12.001
		self.melee_weapons.pitchfork.stats.min_damage_effect = 3.0
		self.melee_weapons.pitchfork.stats.max_damage_effect = 6.0
		self.melee_weapons.pitchfork.stats.charge_time = 2.1
		self.melee_weapons.pitchfork.stats.range = 180
		self.melee_weapons.pitchfork.stats.concealment = 22
		--Manly Miner Men--
		self.melee_weapons.mining_pick.info_id = "bm_melee_mining_pick_info"
		self.melee_weapons.mining_pick.stats.min_damage = 6
		self.melee_weapons.mining_pick.stats.max_damage = 12.001
		self.melee_weapons.mining_pick.stats.min_damage_effect = 3.0
		self.melee_weapons.mining_pick.stats.max_damage_effect = 6.0
		self.melee_weapons.mining_pick.stats.charge_time = 1.8
		self.melee_weapons.mining_pick.stats.range = 180
		self.melee_weapons.mining_pick.stats.concealment = 25
		self.melee_weapons.mining_pick.headshot_damage_multiplier = 1.5
		--Fear the beard--	
		self.melee_weapons.beardy.stats.min_damage = 9
		self.melee_weapons.beardy.stats.max_damage = 18.001
		self.melee_weapons.beardy.stats.min_damage_effect = 3.0
		self.melee_weapons.beardy.stats.max_damage_effect = 6.0
		self.melee_weapons.beardy.stats.charge_time = 2
		self.melee_weapons.beardy.stats.range = 220
		self.melee_weapons.beardy.stats.concealment = 23
		--For the longest time the Fireaxe was the most satisfying melee weapon to use, seriously sucks they killed its swing animation--
		self.melee_weapons.fireaxe.stats.min_damage = 9
		self.melee_weapons.fireaxe.stats.max_damage = 18.001
		self.melee_weapons.fireaxe.stats.min_damage_effect = 3.0
		self.melee_weapons.fireaxe.stats.max_damage_effect = 6.0
		self.melee_weapons.fireaxe.stats.charge_time = 1.9
		self.melee_weapons.fireaxe.stats.range = 200
		self.melee_weapons.fireaxe.stats.concealment = 25

		--YOOOOOOOOOOOOOOOOOOOOOOOOOOO--
		self.melee_weapons.sandsteel.info_id = "bm_melee_katana_info"	
		self.melee_weapons.sandsteel.stats.min_damage = 6
		self.melee_weapons.sandsteel.stats.max_damage = 12.001
		self.melee_weapons.sandsteel.stats.min_damage_effect = 1.5
		self.melee_weapons.sandsteel.stats.max_damage_effect = 3.0
		self.melee_weapons.sandsteel.stats.charge_time = 1.7
		self.melee_weapons.sandsteel.stats.charge_bonus_start = 0.99
		self.melee_weapons.sandsteel.stats.charge_bonus_speed = 1.75
		self.melee_weapons.sandsteel.stats.range = 190
		self.melee_weapons.sandsteel.attack_allowed_expire_t = 0.1
		self.melee_weapons.sandsteel.stats.concealment = 24
		--C/C quality master race--
		self.melee_weapons.great.info_id = "bm_melee_great_info"
		self.melee_weapons.great.stats.min_damage = 9
		self.melee_weapons.great.stats.max_damage = 18.001
		self.melee_weapons.great.stats.min_damage_effect = 2.4
		self.melee_weapons.great.stats.max_damage_effect = 4.5
		self.melee_weapons.great.stats.charge_time = 2.1
		self.melee_weapons.great.stats.range = 200
		self.melee_weapons.great.stats.charge_bonus_start = 0.9
		self.melee_weapons.great.stats.charge_bonus_range = 50
		self.melee_weapons.great.stats.concealment = 24
	
		--Fires actual nails when--
		self.melee_weapons.nin.info_id = "bm_melee_nin_info" 
		self.melee_weapons.nin.stats.min_damage = 6
		self.melee_weapons.nin.stats.max_damage = 6
		self.melee_weapons.nin.stats.min_damage_effect = 1.8
		self.melee_weapons.nin.stats.max_damage_effect = 1.8
		self.melee_weapons.nin.stats.charge_time = 0.00001
		self.melee_weapons.nin.stats.range = 500
		self.melee_weapons.nin.stats.concealment = 24
		self.melee_weapons.nin.melee_charge_shaker = ""
		self.melee_weapons.nin.no_hit_shaker = true
	
		--Chainsaw + Gun--
		self.melee_weapons.cs.info_id = "bm_melee_cs_info"
		self.melee_weapons.cs.make_saw = true
		self.melee_weapons.cs.chainsaw = {
			tick_damage = 3,
			tick_delay = 0.25,
			start_delay = 0.8
		}
		self.melee_weapons.cs.stats.min_damage = 9
		self.melee_weapons.cs.stats.max_damage = 9
		self.melee_weapons.cs.stats.min_damage_effect = 3.0
		self.melee_weapons.cs.stats.max_damage_effect = 3.0
		self.melee_weapons.cs.stats.charge_time = 0.00001
		self.melee_weapons.cs.stats.range = 180
		self.melee_weapons.cs.stats.concealment = 21
		--how does this spin when it has a handle--
		self.melee_weapons.ostry.info_id = "bm_melee_ostry_info"
		self.melee_weapons.ostry.melee_charge_shaker = ""
		self.melee_weapons.ostry.chainsaw = {
			tick_damage = 1.8,
			tick_delay = 0.18,
			start_delay = 0.4
		}
		self.melee_weapons.ostry.stats.min_damage = 6
		self.melee_weapons.ostry.stats.max_damage = 6
		self.melee_weapons.ostry.stats.min_damage_effect = 1.2
		self.melee_weapons.ostry.stats.max_damage_effect = 1.2
		self.melee_weapons.ostry.stats.charge_time = 0.00001
		self.melee_weapons.ostry.stats.range = 160
		self.melee_weapons.ostry.stats.concealment = 26
	
		--Pooper scooper--
		self.melee_weapons.catch.stats.min_damage = 6
		self.melee_weapons.catch.stats.max_damage = 12.001
		self.melee_weapons.catch.stats.min_damage_effect = 4.5
		self.melee_weapons.catch.stats.max_damage_effect = 9.0
		self.melee_weapons.catch.stats.charge_time = 1.25
		self.melee_weapons.catch.stats.range = 160
		self.melee_weapons.catch.stats.concealment = 27
	
	-- Workaround for custom melee bug
	--[[
	self.melee_weapons.halloween_sword = deep_clone(self.melee_weapons.great)
	self.melee_weapons.halloween_sword.name_id = "bm_melee_halloween_sword"
	self.melee_weapons.halloween_sword.info_id = "bm_melee_headless_sword_info"
	self.melee_weapons.halloween_sword.special_weapon = "panic"
	self.melee_weapons.halloween_sword.unit = "units/mods/weapons/wpn_mel_halloween_sword/wpn_fps_mel_halloween_sword"
	self.melee_weapons.halloween_sword.third_unit = "units/mods/weapons/wpn_mel_halloween_sword/wpn_third_halloween_sword"
	self.melee_weapons.halloween_sword.texture_bundle_folder = "mods"
	self.melee_weapons.halloween_sword.sounds = {
		equip = "great_equip",
		hit_air = "morning_hit_air",
		hit_gen = "great_hit_gen",
		hit_body = "great_hit_body",
		charge = "great_charge"
	}
	self.melee_weapons.halloween_sword.dlc = "rest"
	self.melee_weapons.halloween_sword.stats.concealment = 23
	self.melee_weapons.halloween_sword.stats.charge_time = 5
	self.melee_weapons.halloween_sword.free = true
	self.melee_weapons.halloween_sword.stats.custom = true
	]]--
end

Hooks:PostHook(BlackMarketTweakData, "init", "CustomMelee", function(self, tweak_data)	


	if self.melee_weapons.halloween_sword then
		self.melee_weapons.halloween_sword.stats.min_damage_effect = 4.5
		self.melee_weapons.halloween_sword.stats.max_damage_effect = 9.0
	end

	local melee_anim = {}
	
	--melee_sandsteel
	melee_anim = {
		'hfblade','murasama','pkat'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_sandsteel"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].timing_fix = {"var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.75
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.75
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
	end	

	melee_anim = {
		'invincible','psick','pclub'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
	end

	melee_anim = {
		'pspear'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_pitchfork"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.675
			self.melee_weapons[melee_id].melee_damage_delay = 0.325
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
		end
	end

	melee_anim = {
		'dragon_slayer','peld'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_great"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var1"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.20
			self.melee_weapons[melee_id].melee_damage_delay = 0.6
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
		end
	end

	melee_anim = {
		'pbaxe'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_beardy"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.2
			self.melee_weapons[melee_id].melee_damage_delay = 0.65
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
		end
	end

	melee_anim = {
		'melee_g36'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_nin_res"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.0
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].can_melee_miss = true
			self.melee_weapons[melee_id].miss_repeat_expire_t = 0.005
			self.melee_weapons[melee_id].miss_expire_t = 0.45
			self.melee_weapons[melee_id].miss_anim_speed_mult = nil
			self.melee_weapons[melee_id].melee_damage_delay = 0.015
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
			self.melee_weapons[melee_id].melee_charge_shaker = ""
			self.melee_weapons[melee_id].no_hit_shaker = true
			self.melee_weapons[melee_id].sounds.hit_air = ""
			self.melee_weapons[melee_id].sounds.charge = ""
			self.melee_weapons[melee_id].make_effect = true
			self.melee_weapons[melee_id].make_decal = true 
		end
	end

	melee_anim = {
		'predator_wristblades'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_tiger"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"} --Perform uppercut for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
	end

	--melee_blunt
	melee_anim = {
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
	end

	--melee_knife
	melee_anim = {
		'toyknife'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
		self.melee_weapons[melee_id].anim_global_param = "melee_knife"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1", "var3", "var4"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.8
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
		self.melee_weapons[melee_id].anim_speed_mult = 1.2307
		end
	end	

	if self.melee_weapons.toyknife then
		self.melee_weapons.toyknife.anim_attack_vars = {"var1","var2"} --Removes the awkward blunt side strike attack variants
		self.melee_weapons.toyknife.stats.min_damage = 0.5
		self.melee_weapons.toyknife.stats.max_damage = 1.0
		self.melee_weapons.toyknife.stats.min_damage_effect = 0.3
		self.melee_weapons.toyknife.stats.max_damage_effect = 0.6
	end

	if self.melee_weapons.hfblade then --HF Blade (Katana 1.8x speed, 1/2 damage)
		self.melee_weapons.hfblade.info_id = "bm_melee_raiden_info"	
		self.melee_weapons.hfblade.stats = deep_clone(self.melee_weapons.sandsteel.stats)
		self.melee_weapons.hfblade.stats.min_damage = self.melee_weapons.hfblade.stats.min_damage / 2
		self.melee_weapons.hfblade.stats.max_damage = self.melee_weapons.hfblade.stats.max_damage / 2
		self.melee_weapons.hfblade.anim_speed_mult = self.melee_weapons.hfblade.anim_speed_mult * 1.8
	end

	if self.melee_weapons.murasama then --HF Murasama (Katana 1.8x speed, 1/2 damage)
		self.melee_weapons.murasama.info_id = "bm_melee_thejobissnotyours_info"	
		self.melee_weapons.murasama.stats = deep_clone(self.melee_weapons.sandsteel.stats)
		self.melee_weapons.murasama.stats.min_damage = self.melee_weapons.murasama.stats.min_damage / 2
		self.melee_weapons.murasama.stats.max_damage = self.melee_weapons.murasama.stats.max_damage / 2
		self.melee_weapons.murasama.anim_speed_mult = self.melee_weapons.murasama.anim_speed_mult * 1.8
	end

	if self.melee_weapons.invincible then --Pincer Blades (Lucille Bat)
		self.melee_weapons.invincible.info_id = "bm_melee_inner_child_info"
		self.melee_weapons.invincible.stats = deep_clone(self.melee_weapons.barbedwire.stats)
		self.melee_weapons.invincible.dot_data = {
			type = "bleed",
			custom_data = {
				dot_damage = 2,
				dot_length = 3.1,
				hurt_animation_chance = 0.0
			}
		}
		self.melee_weapons.invincible.anim_speed_mult = 0.8695
	end

	if self.melee_weapons.dragon_slayer then --Dragon Slayer (Halloween Dozer Sword)
		self.melee_weapons.dragon_slayer.info_id = "bm_melee_goat_info"
		self.melee_weapons.dragon_slayer.special_weapon = "panic"
		self.melee_weapons.dragon_slayer.stats = deep_clone(self.melee_weapons.halloween_sword.stats)
		self.melee_weapons.dragon_slayer.sounds = deep_clone(self.melee_weapons.halloween_sword.sounds)
		self.melee_weapons.dragon_slayer.sounds.hit_body = "cash_loot_drop_reveal"
		self.melee_weapons.dragon_slayer.sounds.hit_gen = "cash_loot_drop_reveal"
	end

	if self.melee_weapons.peld then --Predator Pack Elder Sword (Greatsword)
		self.melee_weapons.peld.stats = deep_clone(self.melee_weapons.great.stats)
	end

	if self.melee_weapons.pbaxe then --Predator Pack Axe (Bearded Axe)
		self.melee_weapons.pbaxe.stats = deep_clone(self.melee_weapons.beardy.stats)
	end

	if self.melee_weapons.pdutchknife then --Predator Pack Axe (Tanto)
		self.melee_weapons.pdutchknife.stats = deep_clone(self.melee_weapons.kabartanto.stats)
		self.melee_weapons.pdutchknife.dot_data = nil
	end
	if self.melee_weapons.pspear then --Predator Pack CombiStick (Pitchfork)
		self.melee_weapons.pspear.info_id = "bm_melee_charge_info" 
		self.melee_weapons.pspear.special_weapon = "charger"
		self.melee_weapons.pspear.chainsaw = {
			tick_damage = 4.5,
			tick_delay = 0.4,
			start_delay = 0.8
		}
		self.melee_weapons.pspear.stats = deep_clone(self.melee_weapons.pitchfork.stats)
	end

	if self.melee_weapons.pkat then --Predator Pack Katana (Golden Spoon)
		self.melee_weapons.pkat.info_id = "bm_melee_fire_info"	
		self.melee_weapons.pkat.fire_dot_data = deep_clone(self.melee_weapons.spoon_gold.fire_dot_data)
		self.melee_weapons.pkat.stats = deep_clone(self.melee_weapons.spoon_gold.stats)
		self.melee_weapons.pkat.anim_speed_mult = 0.75
	end

	if self.melee_weapons.pclub then --Preadator Pack War Club (Icepick)
		self.melee_weapons.pclub.anim_attack_vars = {"var1"}
		self.melee_weapons.pclub.make_decal = true
		self.melee_weapons.pclub.make_effect = true
		self.melee_weapons.pclub.info_id = "bm_melee_iceaxe_info"
		self.melee_weapons.pclub.stats = deep_clone(self.melee_weapons.iceaxe.stats)
		self.melee_weapons.pclub.headshot_damage_multiplier = 1.5
	end

	if self.melee_weapons.psick then --Preadator Pack Alpha Sickle (Morning Star)
		self.melee_weapons.psick.stats = deep_clone(self.melee_weapons.morning.stats)
		self.melee_weapons.psick.dot_data = nil
	end
	
	if self.melee_weapons.predator_wristblades then --Predator Pack Wristblades (Lucille Bat)
		self.melee_weapons.predator_wristblades.info_id = "bm_melee_bleed_info"
		self.melee_weapons.predator_wristblades.dot_data = {
			type = "bleed",
			custom_data = {
				dot_damage = 2,
				dot_length = 3.1,
				hurt_animation_chance = 0.0
			}
		}
		self.melee_weapons.predator_wristblades.stats = deep_clone(self.melee_weapons.barbedwire.stats)
		self.melee_weapons.predator_wristblades.anim_speed_mult = 0.6
	end

	if self.melee_weapons.melee_g36 then --G36 (Nailgun but with the G36's max damage profile + range)
		self.melee_weapons.melee_g36.info_id = "bm_melee_thebestweapon_info"	
		self.melee_weapons.melee_g36.hit_pre_calculation = true
		self.melee_weapons.melee_g36.stats = deep_clone(self.melee_weapons.nin.stats)
		self.melee_weapons.melee_g36.stats.min_damage = 2
		self.melee_weapons.melee_g36.stats.max_damage = 2
		self.melee_weapons.melee_g36.stats.range = 2800
		self.melee_weapons.melee_g36.sounds = deep_clone(self.melee_weapons.nin.sounds)
		self.melee_weapons.melee_g36.sounds.hit_body = "g36_fire_single"
		self.melee_weapons.melee_g36.sounds.hit_gen = "g36_fire_single"
		self.melee_weapons.melee_g36.sounds.hit_air = "primary_dryfire"
	end



	local blanket_speed_mult = 1.125
	for melee_id, _ in pairs(self.melee_weapons) do
		if self.melee_weapons[melee_id] then
			if not self.melee_weapons[melee_id].instant then
				self.melee_weapons[melee_id].anim_speed_mult = (self.melee_weapons[melee_id].anim_speed_mult or 1) * blanket_speed_mult
			end
			if not self.melee_weapons[melee_id].melee_charge_shaker or self.melee_weapons[melee_id].melee_charge_shaker == "player_melee_charge_fist" then
				self.melee_weapons[melee_id].melee_charge_shaker = "player_melee_charge_wing"
			end
			if self.melee_weapons[melee_id].stats then
				self.melee_weapons[melee_id].stats.min_damage_effect = self.melee_weapons[melee_id].stats.min_damage_effect / self.melee_weapons[melee_id].stats.min_damage
				self.melee_weapons[melee_id].stats.max_damage_effect = self.melee_weapons[melee_id].stats.max_damage_effect / self.melee_weapons[melee_id].stats.max_damage
			end
		end
	end
end)