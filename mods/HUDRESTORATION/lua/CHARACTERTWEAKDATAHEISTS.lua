local map = Global.level_data.level_id
local resttank = CharacterTweakData._init_tank

function CharacterTweakData:_init_tank(presets)
	resttank (self, presets)
	if map == "greenharvest_stage1" or map == "escape_garage_ghrv" or map == "escape_overpass_ghrv" then 
	self.tank = deep_clone(presets.base)
	self.tank.experience = {}
	self.tank.damage.tased_response = {
		light = {tased_time = 1, down_time = 0},
		heavy = {tased_time = 2, down_time = 0}
	}
	self.tank.weapon = deep_clone(presets.weapon.good)
	self.tank.weapon.r870.FALLOFF[1].dmg_mul = 6.5
	self.tank.weapon.r870.FALLOFF[2].dmg_mul = 4.5
	self.tank.weapon.r870.FALLOFF[3].dmg_mul = 2
	self.tank.weapon.r870.RELOAD_SPEED = 1
	self.tank.weapon.saiga = {}
	self.tank.weapon.saiga.aim_delay = {0.1, 0.1}
	self.tank.weapon.saiga.focus_delay = 4
	self.tank.weapon.saiga.focus_dis = 200
	self.tank.weapon.saiga.spread = 20
	self.tank.weapon.saiga.miss_dis = 40
	self.tank.weapon.saiga.RELOAD_SPEED = 0.5
	self.tank.weapon.saiga.melee_speed = 1
	self.tank.weapon.saiga.melee_dmg = 25
	self.tank.weapon.saiga.melee_retry_delay = {1, 2}
	self.tank.weapon.saiga.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	self.tank.weapon.saiga.autofire_rounds = presets.weapon.deathwish.m4.autofire_rounds
	self.tank.weapon.saiga.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 1.75,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.ak47 = {}
	self.tank.weapon.ak47.aim_delay = {0.1, 0.2}
	self.tank.weapon.ak47.focus_delay = 4
	self.tank.weapon.ak47.focus_dis = 800
	self.tank.weapon.ak47.spread = 20
	self.tank.weapon.ak47.miss_dis = 40
	self.tank.weapon.ak47.RELOAD_SPEED = 0.5
	self.tank.weapon.ak47.melee_speed = 1
	self.tank.weapon.ak47.melee_dmg = 25
	self.tank.weapon.ak47.melee_retry_delay = {1, 2}
	self.tank.weapon.ak47.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	self.tank.weapon.ak47.autofire_rounds = {20, 40}
	self.tank.weapon.ak47.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 4,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 3.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 3,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	self:_process_weapon_usage_table(self.tank.weapon)
	self.tank.detection = presets.detection.normal
	self.tank.HEALTH_INIT = 550
	self.tank.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank.damage.explosion_damage_mul = 1
	self.tank.move_speed = presets.move_speed.slow
	self.tank.allowed_stances = {cbt = true}
	self.tank.allowed_poses = {stand = true}
	self.tank.crouch_move = false
	self.tank.no_run_start = true
	self.tank.no_run_stop = true
	self.tank.no_retreat = true
	self.tank.no_arrest = true
	self.tank.surrender = nil
	self.tank.ecm_vulnerability = 0.85
	self.tank.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.tank.weapon_voice = "3"
	self.tank.experience.cable_tie = "tie_swat"
	self.tank.access = "tank"
	self.tank.speech_prefix_p1 = "bdz"
	self.tank.speech_prefix_p2 = nil
	self.tank.speech_prefix_count = nil
	self.tank.priority_shout = "f30"
	self.tank.rescue_hostages = false
	self.tank.deathguard = true
	self.tank.melee_weapon = "fists"
	self.tank.melee_weapon_dmg_multiplier = 2.5
	self.tank.critical_hits = {
		damage_mul = self.tank.headshot_dmg_mul * 0.5
	}
	self.tank.damage.hurt_severity = presets.hurt_severities.only_light_hurt_and_fire
	self.tank.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.tank.announce_incomming = "incomming_tank"
	self.tank.steal_loot = nil
	self.tank.calls_in = nil
	self.tank.use_animation_on_fire_damage = false
	self.tank.flammable = true
	self.tank.can_be_tased = false
	self.tank_hw = deep_clone(self.tank)
	self.tank_hw.move_speed = presets.move_speed.slow
	self.tank_hw.HEALTH_INIT = 1100
	self.tank_hw.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank_hw.damage.explosion_damage_mul = 1
	self.tank_hw.use_animation_on_fire_damage = false
	self.tank_hw.flammable = true
	self.tank_hw.can_be_tased = false
end
end
