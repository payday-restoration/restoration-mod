if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local job = Global.level_data and Global.level_data.level_id

local old_init = CharacterTweakData.init
function CharacterTweakData:init(tweak_data, presets)
	local r = LevelsTweakData.LevelType.Russia
	local ai_type = tweak_data.levels:get_ai_group_type()
	self._prefix_data_p2 = {
		swat = function()
			if ai_type == r then
				return "n"
			else
				return "d"
			end
		end
	}
	old_init(self, tweak_data, presets)
	local presets = self:_presets(tweak_data)
	self:_init_boom(presets)
	self:_init_spring(presets)
	self:_process_weapon_usage_table()
end

function CharacterTweakData:_init_security(presets)
	self.security = deep_clone(presets.base)
	self.security.experience = {}
	self.security.weapon = presets.weapon.normal
	self.security.detection = presets.detection.guard
	self.security.detection_increase = 0.05
	self.security.HEALTH_INIT = 3
	self.security.headshot_dmg_mul = 1.7
	self.security.move_speed = presets.move_speed.normal
	self.security.crouch_move = nil
	self.security.surrender_break_time = {20, 30}
	self.security.suppression = presets.suppression.easy
	self.security.surrender = presets.surrender.easy
	self.security.ecm_vulnerability = 1
	self.security.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.security.weapon_voice = "3"
	self.security.experience.cable_tie = "tie_swat"
	self.security.speech_prefix_p1 = "l"
	self.security.speech_prefix_p2 = "n"
	self.security.speech_prefix_count = 4
	self.security.access = "security"
	self.security.rescue_hostages = false
	self.security.use_radio = nil
	self.security.silent_priority_shout = "f37"
	self.security.dodge = presets.dodge.poor
	self.security.deathguard = false
	self.security.chatter = presets.enemy_chatter.cop
	self.security.has_alarm_pager = true
	self.security.melee_weapon = "baton"
	self.security.no_arrest_chance_inc = 0.25
	self.security.steal_loot = nil
	table.insert(self._enemy_list, "security")
	self.security_undominatable = deep_clone(self.security)
	self.security_undominatable.surrender = nil
	table.insert(self._enemy_list, "security_undominatable")
end

function CharacterTweakData:_init_gensec(presets)
	self.gensec = deep_clone(presets.base)
	self.gensec.experience = {}
	self.gensec.weapon = presets.weapon.normal
	self.gensec.detection = presets.detection.guard
	self.gensec.detection_increase = 0.05
	self.gensec.HEALTH_INIT = 6
	self.gensec.headshot_dmg_mul = 3.4
	self.gensec.move_speed = presets.move_speed.normal
	self.gensec.crouch_move = nil
	self.gensec.surrender_break_time = {20, 30}
	self.gensec.suppression = presets.suppression.hard
	self.gensec.surrender = presets.surrender.hard
	self.gensec.ecm_vulnerability = 1
	self.gensec.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.gensec.weapon_voice = "3"
	self.gensec.experience.cable_tie = "tie_swat"
	self.gensec.speech_prefix_p1 = "l"
	self.gensec.speech_prefix_p2 = "n"
	self.gensec.speech_prefix_count = 4
	self.gensec.access = "security"
	self.gensec.rescue_hostages = false
	self.gensec.use_radio = nil
	self.gensec.silent_priority_shout = "f37"
	self.gensec.dodge = presets.dodge.athletic
	self.gensec.deathguard = false
	self.gensec.no_arrest_chance_inc = 0.25
	self.gensec.chatter = presets.enemy_chatter.cop
	self.gensec.has_alarm_pager = true
	self.gensec.melee_weapon = "baton"
	self.gensec.steal_loot = nil
	table.insert(self._enemy_list, "gensec")
end

function CharacterTweakData:_init_cop(presets)
	self.cop = deep_clone(presets.base)
	self.cop.experience = {}
	self.cop.weapon = presets.weapon.normal
	self.cop.detection = presets.detection.normal
	self.cop.HEALTH_INIT = 3
	self.cop.headshot_dmg_mul = 1.7
	self.cop.move_speed = presets.move_speed.normal
	self.cop.surrender_break_time = {10, 15}
	self.cop.suppression = presets.suppression.easy
	self.cop.surrender = presets.surrender.normal
	self.cop.ecm_vulnerability = 1
	self.cop.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.cop.weapon_voice = "1"
	self.cop.experience.cable_tie = "tie_swat"
	self.cop.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.cop.speech_prefix_p2 = "n"
	self.cop.speech_prefix_count = 4
	self.cop.access = "cop"
	self.cop.silent_priority_shout = "f37"
	self.cop.dodge = presets.dodge.average
	self.cop.deathguard = true
	self.cop.chatter = presets.enemy_chatter.cop
	self.cop.melee_weapon = "baton"
	if job == "chill_combat" then
		self.cop.steal_loot = true
	else
		self.cop.steal_loot = true
	end
 	table.insert(self._enemy_list, "cop")
	self.cop_scared = deep_clone(self.cop)
	self.cop_scared.surrender = presets.surrender.always
	self.cop_scared.surrender_break_time = nil
	table.insert(self._enemy_list, "cop_scared")
	self.cop_female = deep_clone(self.cop)
	self.cop_female.speech_prefix_p1 = "fl"
	self.cop_female.speech_prefix_p2 = self._speech_prefix_p2
	self.cop_female.speech_prefix_count = 1
 	table.insert(self._enemy_list, "cop_female")
end

function CharacterTweakData:_init_fbi(presets)
	self.fbi = deep_clone(presets.base)
 	self.fbi.experience = {}
	self.fbi.weapon = presets.weapon.normal
	self.fbi.detection = presets.detection.normal
	self.fbi.HEALTH_INIT = 6
	self.fbi.headshot_dmg_mul = 3.4
    	self.fbi.move_speed = presets.move_speed.very_fast
    	self.fbi.surrender_break_time = {7, 12}
    	self.fbi.suppression = presets.suppression.hard_def
    	self.fbi.surrender = presets.surrender.normal
    	self.fbi.ecm_vulnerability = 1
   	self.fbi.ecm_hurts = {
        	ears = {min_duration = 8, max_duration = 10}
    	}
    	self.fbi.weapon_voice = "2"
    	self.fbi.experience.cable_tie = "tie_swat"
    	self.fbi.speech_prefix_p1 = self._prefix_data_p1.cop()
    	self.fbi.speech_prefix_p2 = "n"
    	self.fbi.speech_prefix_count = 4
	self.fbi.silent_priority_shout = "f37"
    	self.fbi.access = "fbi"
    	self.fbi.dodge = presets.dodge.athletic
    	self.fbi.deathguard = true
    	self.fbi.chatter = presets.enemy_chatter.cop
    	self.fbi.steal_loot = true
	self.fbi.no_arrest = false
	table.insert(self._enemy_list, "fbi")
	self.fbi_vet = deep_clone(self.fbi)
	self.fbi_vet.tags = {"custom"}
	self.fbi_vet.no_arrest = true
    	self.fbi_vet.surrender = nil
	self.fbi_vet.suppression = nil
    	self.fbi_vet.can_shoot_while_dodging = true
	self.fbi_vet.HEALTH_INIT = 20
	self.fbi_vet.headshot_dmg_mul = 2
	self.fbi_vet.damage.bullet_dodge_chance = 55
	self.fbi_vet.smoke_dodge_increase = 10
    	self.fbi_vet.dodge = presets.dodge.veteran
	self.fbi_vet.allowed_stances = {cbt = true}
    	self.fbi_vet.move_speed = presets.move_speed.lightning
	self.fbi_vet.use_animation_on_fire_damage = false
	self.fbi_vet.priority_shout = "g29"
	self.fbi_vet.bot_priority_shout = "g29"
	self.fbi_vet.silent_priority_shout = nil
	self.fbi_vet.custom_shout = true
	self.fbi_vet.priority_shout_max_dis = 3000
	if job == "chill_combat" then
		self.fbi_vet.steal_loot = nil
	else
		self.fbi_vet.steal_loot = true
	end
	self.fbi_vet.immune_to_knock_down = true
	self.fbi_vet.damage.hurt_severity = deep_clone(presets.hurt_severities.elite)
	self.fbi_vet.damage.hurt_severity.bullet = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	self.fbi_vet.damage.hurt_severity.melee = {
		health_reference = "current",
		zones = {
			{
				health_limit = 1,
				moderate = 1
			}
		}
	}
	self.fbi_vet.dodge_with_grenade = {
		smoke = {
			duration = {12, 12}
		}
	}
	function self.fbi_vet.dodge_with_grenade.check(t, nr_grenades_used)
		local delay_till_next_use = math.lerp(17, 45, math.min(1, (nr_grenades_used or 0) / 4))
		local chance = math.lerp(1, 0.5, math.min(1, (nr_grenades_used or 0) / 10))
		if chance > math.random() then
			return true, t + delay_till_next_use
		end
		return false, t + delay_till_next_use
	end
	table.insert(self._enemy_list, "fbi_vet")
end

function CharacterTweakData:_init_medic(presets)
	self.medic = deep_clone(presets.base)
	self.medic.tags = {"medic"}
	self.medic.experience = {}
	self.medic.weapon = deep_clone(presets.weapon.normal)
	self.medic.detection = presets.detection.normal
	self.medic.HEALTH_INIT = 30
	self.medic.headshot_dmg_mul = 2.2
	self.medic.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.medic.suppression = presets.suppression.no_supress
	self.medic.surrender = presets.surrender.special
	self.medic.move_speed = presets.move_speed.very_fast
	self.medic.surrender_break_time = {7, 12}
	self.medic.ecm_vulnerability = 1
	self.medic.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.medic.weapon_voice = "2"
	self.medic.experience.cable_tie = "tie_swat"
	self.medic.speech_prefix_p1 = self._prefix_data_p1.medic()
	self.medic.speech_prefix_count = nil
	self.medic.spawn_sound_event = self._prefix_data_p1.medic() .. "_entrance"
	self.medic.access = "swat"
	self.medic.dodge = presets.dodge.athletic
	self.medic.deathguard = true
	self.medic.no_arrest = true
	self.medic.chatter = {aggressive = true, contact = true}
	if job == "chill_combat" then
		self.medic.steal_loot = nil
	else
		self.medic.steal_loot = true
	end
	self.medic.priority_shout = "f47"
	self.medic.bot_priority_shout = "f47x_any"
	self.medic.priority_shout_max_dis = 3000
	table.insert(self._enemy_list, "medic")
end

function CharacterTweakData:_init_swat(presets)
	self.swat = deep_clone(presets.base)
	self.swat.experience = {}
	self.swat.weapon = presets.weapon.normal
	self.swat.detection = presets.detection.normal
	self.swat.HEALTH_INIT = 8
	self.swat.headshot_dmg_mul = 4.5
	self.swat.move_speed = presets.move_speed.fast
	self.swat.surrender_break_time = {6, 10}
	self.swat.suppression = presets.suppression.hard_agg
	self.swat.surrender = presets.surrender.hard
	self.swat.ecm_vulnerability = 1
	self.swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.swat.weapon_voice = "2"
	self.swat.experience.cable_tie = "tie_swat"
	self.swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.swat.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.swat.speech_prefix_count = 4
	self.swat.access = "swat"
	self.swat.dodge = presets.dodge.athletic
	self.swat.no_arrest = false
	self.swat.chatter = presets.enemy_chatter.swat
	self.swat.melee_weapon = "knife_1"
	self.swat.melee_weapon_dmg_multiplier = 1
	if job == "chill_combat" then
		self.swat.steal_loot = true
	else
		self.swat.steal_loot = true
	end
	table.insert(self._enemy_list, "swat")
end

function CharacterTweakData:_init_heavy_swat(presets)
	self.heavy_swat = deep_clone(presets.base)
	self.heavy_swat.experience = {}
	self.heavy_swat.weapon = presets.weapon.normal
	self.heavy_swat.detection = presets.detection.normal
	self.heavy_swat.HEALTH_INIT = 15
	self.heavy_swat.headshot_dmg_mul = 2.5
	self.heavy_swat.move_speed = presets.move_speed.fast
	self.heavy_swat.surrender_break_time = {6, 8}
	self.heavy_swat.suppression = presets.suppression.hard_agg
	self.heavy_swat.surrender = presets.surrender.hard
	self.heavy_swat.ecm_vulnerability = 1
	self.heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.heavy_swat.weapon_voice = "2"
	self.heavy_swat.experience.cable_tie = "tie_swat"
	self.heavy_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.heavy_swat.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.heavy_swat.speech_prefix_count = 4
	self.heavy_swat.access = "swat"
	self.heavy_swat.dodge = presets.dodge.heavy
	self.heavy_swat.no_arrest = false
	self.heavy_swat.chatter = presets.enemy_chatter.swat
	if job == "chill_combat" then
		self.heavy_swat.steal_loot = nil
	else
		self.heavy_swat.steal_loot = true
	end
	table.insert(self._enemy_list, "heavy_swat")
	self.heavy_swat_sniper = deep_clone(self.heavy_swat)
	self.heavy_swat_sniper.weapon = presets.weapon.sniper
	table.insert(self._enemy_list, "heavy_swat_sniper")
end

function CharacterTweakData:_init_fbi_swat(presets)
	self.fbi_swat = deep_clone(presets.base)
	self.fbi_swat.experience = {}
	self.fbi_swat.weapon = presets.weapon.good
	self.fbi_swat.detection = presets.detection.normal
	self.fbi_swat.HEALTH_INIT = 13
	self.fbi_swat.headshot_dmg_mul = 3.25
	self.fbi_swat.move_speed = presets.move_speed.very_fast
	self.fbi_swat.surrender_break_time = {6, 10}
	self.fbi_swat.suppression = presets.suppression.hard_def
	self.fbi_swat.surrender = presets.surrender.hard
	self.fbi_swat.ecm_vulnerability = 1
	self.fbi_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_swat.weapon_voice = "2"
	self.fbi_swat.experience.cable_tie = "tie_swat"
	self.fbi_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.fbi_swat.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.fbi_swat.speech_prefix_count = 4
	self.fbi_swat.access = "swat"
	self.fbi_swat.dodge = presets.dodge.athletic_very_hard
	self.fbi_swat.no_arrest = false
	self.fbi_swat.chatter = presets.enemy_chatter.swat
	self.fbi_swat.melee_weapon = "knife_1"
	self.fbi_swat.melee_weapon_dmg_multiplier = 2
	if job == "chill_combat" then
		self.fbi_swat.steal_loot = nil
	else
		self.fbi_swat.steal_loot = true
	end
	table.insert(self._enemy_list, "fbi_swat")
	self.fbi_swat_vet = deep_clone(self.fbi_swat)
	self.fbi_swat_vet.melee_weapon_dmg_multiplier = 2
	table.insert(self._enemy_list, "fbi_swat_vet")
end

function CharacterTweakData:_init_fbi_heavy_swat(presets)
	self.fbi_heavy_swat = deep_clone(presets.base)
	self.fbi_heavy_swat.experience = {}
	self.fbi_heavy_swat.weapon = presets.weapon.normal
	self.fbi_heavy_swat.detection = presets.detection.normal
	self.fbi_heavy_swat.HEALTH_INIT = 20
	self.fbi_heavy_swat.headshot_dmg_mul = 2
	self.fbi_heavy_swat.move_speed = presets.move_speed.fast
	self.fbi_heavy_swat.surrender_break_time = {6, 8}
	self.fbi_heavy_swat.suppression = presets.suppression.hard_agg
	self.fbi_heavy_swat.surrender = presets.surrender.hard
	self.fbi_heavy_swat.ecm_vulnerability = 1
	self.fbi_heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_heavy_swat.weapon_voice = "2"
	self.fbi_heavy_swat.experience.cable_tie = "tie_swat"
	self.fbi_heavy_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.fbi_heavy_swat.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.fbi_heavy_swat.speech_prefix_count = 4
	self.fbi_heavy_swat.access = "swat"
	self.fbi_heavy_swat.dodge = presets.dodge.heavy_very_hard
	self.fbi_heavy_swat.no_arrest = false
	self.fbi_heavy_swat.chatter = presets.enemy_chatter.swat
	if job == "chill_combat" then
		self.fbi_heavy_swat.steal_loot = nil
	else
		self.fbi_heavy_swat.steal_loot = true
	end
 	table.insert(self._enemy_list, "fbi_heavy_swat")
end

function CharacterTweakData:_init_city_swat(presets)
	self.city_swat = deep_clone(presets.base)
	self.city_swat.experience = {}
	self.city_swat.damage.hurt_severity = presets.hurt_severities.elite
	self.city_swat.weapon = deep_clone(presets.weapon.expert)
	self.city_swat.weapon.is_shotgun_pump = deep_clone(presets.weapon.expert.is_shotgun_mag)
	self.city_swat.weapon.is_shotgun_pump.RELOAD_SPEED = 0.25
	self.city_swat.detection = presets.detection.normal
	self.city_swat.HEALTH_INIT = 13
	self.city_swat.headshot_dmg_mul = 1.9
	self.city_swat.move_speed = presets.move_speed.very_fast
	self.city_swat.surrender_break_time = {6, 10}
	self.city_swat.suppression = presets.suppression.hard_def
	if job == "kosugi" or job == "dark" then
		self.city_swat.surrender = presets.surrender.hard
		self.city_swat.no_arrest_chance_inc = 0.25
		self.city_swat.detection_increase = 0.05
	else
		self.city_swat.surrender = presets.surrender.hard
		self.city_swat.no_arrest_chance_inc = nil
		self.city_swat.detection_increase = nil
	end
	self.city_swat.no_arrest = false
	self.city_swat.ecm_vulnerability = 1
	self.city_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.city_swat.weapon_voice = "2"
	self.city_swat.experience.cable_tie = "tie_swat"
	self.city_swat.silent_priority_shout = "f37"
	self.city_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.city_swat.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.city_swat.speech_prefix_count = 4
	self.city_swat.access = "swat"
	self.city_swat.dodge = presets.dodge.elite
	self.city_swat.chatter = presets.enemy_chatter.swat
	self.city_swat.melee_weapon = nil
	self.city_swat.melee_weapon_dmg_multiplier = 2.5
	if job == "chill_combat" then
		self.city_swat.steal_loot = nil
	else
		self.city_swat.steal_loot = true
	end
	self.city_swat.has_alarm_pager = true
	self.city_swat.calls_in = true
	self.city_swat.use_animation_on_fire_damage = false
 	table.insert(self._enemy_list, "city_swat")
	self.city_swat_titan = deep_clone(self.city_swat)
	self.city_swat_titan.tags = {"custom"}
	self.city_swat_titan.HEALTH_INIT = 15
	self.city_swat_titan.headshot_dmg_mul = 2.5
	self.city_swat_titan.surrender = nil
	self.city_swat_titan.priority_shout = "f45"
	self.city_swat_titan.bot_priority_shout = "f45x_any"
	self.city_swat_titan.silent_priority_shout = nil
	self.city_swat_titan.priority_shout_max_dis = 3000
	self.city_swat_titan.no_retreat = true
	self.city_swat_titan.no_arrest = true
	if job == "chill_combat" then
		self.city_swat_titan.steal_loot = nil
	else
		self.city_swat_titan.steal_loot = true
	end
	self.city_swat_titan.leader = {max_nr_followers = 6}
	self.city_swat_titan.speed_multiplier_followers = {multiplier = 1.5}
	self.city_swat_titan.spawn_sound_event = "l2d_prm"
	self.city_swat_titan.die_sound_event = "mga_death_scream"
 	table.insert(self._enemy_list, "city_swat_titan")
end

function CharacterTweakData:_init_sniper(presets)
	self.sniper = deep_clone(presets.base)
	self.sniper.tags = {"sniper"}
	self.sniper.experience = {}
	self.sniper.weapon = presets.weapon.sniper
	self.sniper.detection = presets.detection.sniper
	self.sniper.HEALTH_INIT = 6
	self.sniper.headshot_dmg_mul = 3.4
	self.sniper.move_speed = presets.move_speed.very_fast
	self.sniper.shooting_death = false
	self.sniper.no_move_and_shoot = true
	self.sniper.move_and_shoot_cooldown = 1
	self.sniper.suppression = nil
	self.sniper.melee_weapon = "knife_1"
	self.sniper.ecm_vulnerability = 1
	self.sniper.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.sniper.weapon_voice = "1"
	self.sniper.experience.cable_tie = "tie_swat"
	self.sniper.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.sniper.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.sniper.speech_prefix_count = 4
	self.sniper.priority_shout = "f34"
	self.sniper.bot_priority_shout = "f34x_any"
	self.sniper.priority_shout_max_dis = 3000
	self.sniper.access = "sniper"
	self.sniper.no_retreat = true
	self.sniper.no_arrest = true
	self.sniper.chatter = presets.enemy_chatter.no_chatter
	self.sniper.steal_loot = true
	self.sniper.rescue_hostages = false
 	table.insert(self._enemy_list, "sniper")
end

function CharacterTweakData:_init_gangster(presets)
	self.gangster = deep_clone(presets.base)
	self.gangster.experience = {}
	self.gangster.weapon = presets.weapon.normal
	self.gangster.detection = presets.detection.normal
	self.gangster.HEALTH_INIT = 4
	self.gangster.headshot_dmg_mul = 2.3
	self.gangster.move_speed = presets.move_speed.fast
	self.gangster.suspicious = nil
	self.gangster.suppression = presets.suppression.easy
	self.gangster.surrender = nil
	self.gangster.ecm_vulnerability = 0
	self.gangster.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.gangster.no_arrest = true
	self.gangster.no_retreat = true
	self.gangster.weapon_voice = "3"
	self.gangster.experience.cable_tie = "tie_swat"
	self.gangster.speech_prefix_p1 = "th"
	self.gangster.speech_prefix_p2 = nil
	self.gangster.speech_prefix_count = 3
	self.gangster.silent_priority_shout = "f37"
	self.gangster.access = "gangster"
	self.gangster.rescue_hostages = false
	self.gangster.use_radio = nil
	self.gangster.dodge = presets.dodge.average
	self.gangster.challenges = {type = "gangster"}
	self.gangster.chatter = presets.enemy_chatter.no_chatter
	self.gangster.melee_weapon = "fists"
	self.gangster.steal_loot = nil
	self.gangster.calls_in = true
 	table.insert(self._enemy_list, "gangster")
end

function CharacterTweakData:_init_biker(presets)
	self.biker = deep_clone(self.gangster)
	self.biker.calls_in = true
	self.biker.speech_prefix = "bik"
	self.biker.speech_prefix_count = 2
 	table.insert(self._enemy_list, "biker")
end

function CharacterTweakData:_init_biker_escape(presets)
	self.biker_escape = deep_clone(self.gangster)
	self.biker_escape.melee_weapon = "knife_1"
	self.biker_escape.move_speed = presets.move_speed.very_fast
	self.biker_escape.HEALTH_INIT = 4
	self.biker_escape.suppression = nil
 	table.insert(self._enemy_list, "biker_escape")
end

function CharacterTweakData:_init_mobster(presets)
	self.mobster = deep_clone(self.gangster)
	self.mobster.calls_in = true
	self.mobster.melee_weapon = "fists"
	self.mobster.HEALTH_INIT = 4
	self.mobster.headshot_dmg_mul = 2.3
 	table.insert(self._enemy_list, "mobster")
end

function CharacterTweakData:_init_mobster_boss(presets)
	self.mobster_boss = deep_clone(presets.base)
	self.mobster_boss.experience = {}
	self.mobster_boss.detection = presets.detection.normal
	self.mobster_boss.weapon = deep_clone(presets.weapon.normal)
	self.mobster_boss.HEALTH_INIT = 500
	self.mobster_boss.headshot_dmg_mul = 7.99425
	self.mobster_boss.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.mobster_boss.move_speed = presets.move_speed.slow
	self.mobster_boss.allowed_poses = {stand = true}
	self.mobster_boss.crouch_move = false
	self.mobster_boss.no_run_start = true
	self.mobster_boss.no_run_stop = true
	self.mobster_boss.no_retreat = true
	self.mobster_boss.no_arrest = true
	self.mobster_boss.surrender = nil
	self.mobster_boss.ecm_vulnerability = nil
	self.mobster_boss.ecm_hurts = nil
	self.mobster_boss.weapon_voice = "3"
	self.mobster_boss.experience.cable_tie = "tie_swat"
	self.mobster_boss.access = "gangster"
	self.mobster_boss.speech_prefix_p1 = "l"
	self.mobster_boss.speech_prefix_p2 = "n"
	self.mobster_boss.speech_prefix_count = 4
	self.mobster_boss.rescue_hostages = false
	self.mobster_boss.melee_weapon = "fists_dozer"
	self.mobster_boss.steal_loot = nil
	self.mobster_boss.calls_in = nil
	self.mobster_boss.chatter = presets.enemy_chatter.no_chatter
	self.mobster_boss.use_radio = nil
	self.mobster_boss.can_be_tased = false
	self.mobster_boss.priority_shout = "g29"
	self.mobster_boss.bot_priority_shout = "g29"
	self.mobster_boss.silent_priority_shout = nil
	self.mobster_boss.custom_shout = true
	self.mobster_boss.priority_shout_max_dis = 3000
	self.mobster_boss.use_animation_on_fire_damage = false
	self.mobster_boss.flammable = true
	self.mobster_boss.immune_to_knock_down = true
	self.mobster_boss.immune_to_concussion = false
	self.mobster_boss.must_headshot = true
 	table.insert(self._enemy_list, "mobster_boss")
end

function CharacterTweakData:_init_biker_boss(presets)
	self.biker_boss = deep_clone(presets.base)
	self.biker_boss.experience = {}
	self.biker_boss.weapon = deep_clone(presets.weapon.normal)
	self.biker_boss.detection = presets.detection.normal
	self.biker_boss.HEALTH_INIT = 500
	self.biker_boss.headshot_dmg_mul = 7.99425
	self.biker_boss.damage.hurt_severity = self.presets.hurt_severities.no_hurts
	self.biker_boss.move_speed = presets.move_speed.slow
	self.biker_boss.allowed_poses = {stand = true}
	self.biker_boss.no_retreat = true
	self.biker_boss.no_arrest = true
	self.biker_boss.surrender = nil
	self.biker_boss.ecm_vulnerability = 0
	self.biker_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.biker_boss.weapon_voice = "3"
	self.biker_boss.experience.cable_tie = "tie_swat"
	self.biker_boss.access = "gangster"
	self.biker_boss.speech_prefix_p1 = "bb"
	self.biker_boss.speech_prefix_p2 = "n"
	self.biker_boss.speech_prefix_count = 1
	self.biker_boss.rescue_hostages = false
	self.biker_boss.melee_weapon = "fists_dozer"
	self.biker_boss.melee_weapon_dmg_multiplier = 1
	self.biker_boss.steal_loot = nil
	self.biker_boss.calls_in = nil
	self.biker_boss.chatter = presets.enemy_chatter.no_chatter
	self.biker_boss.use_radio = nil
	self.biker_boss.use_animation_on_fire_damage = false
	self.biker_boss.flammable = true
	self.biker_boss.can_be_tased = false
	self.biker_boss.immune_to_knock_down = true
	self.biker_boss.priority_shout = "g29"
	self.biker_boss.bot_priority_shout = "g29"
	self.biker_boss.silent_priority_shout = nil
	self.biker_boss.custom_shout = true
	self.biker_boss.priority_shout_max_dis = 3000
	self.biker_boss.immune_to_concussion = false
	self.biker_boss.must_headshot = true
 	table.insert(self._enemy_list, "biker_boss")
end

function CharacterTweakData:_init_hector_boss(presets)
	self.hector_boss = deep_clone(self.mobster_boss)
	self.hector_boss.weapon = deep_clone(presets.weapon.normal)
	self.hector_boss.can_be_tased = false
	self.hector_boss.priority_shout = "g29"
	self.hector_boss.bot_priority_shout = "g29"
	self.hector_boss.silent_priority_shout = nil
	self.hector_boss.custom_shout = true
	self.hector_boss.priority_shout_max_dis = 3000
 	table.insert(self._enemy_list, "hector_boss")
end

function CharacterTweakData:_init_hector_boss_no_armor(presets)
	self.hector_boss_no_armor = deep_clone(self.fbi)
	self.hector_boss_no_armor.no_retreat = true
	self.hector_boss_no_armor.no_arrest = true
	self.hector_boss_no_armor.surrender = nil
	self.hector_boss_no_armor.access = "gangster"
	self.hector_boss_no_armor.rescue_hostages = false
	self.hector_boss_no_armor.steal_loot = nil
	self.hector_boss_no_armor.calls_in = nil
	self.hector_boss_no_armor.chatter = presets.enemy_chatter.no_chatter
	self.hector_boss_no_armor.use_radio = nil
	self.hector_boss_no_armor.can_be_tased = false
 	table.insert(self._enemy_list, "hector_boss_no_armor")
end

function CharacterTweakData:_init_chavez_boss(presets)
	self.chavez_boss = deep_clone(presets.base)
	self.chavez_boss.experience = {}
	self.chavez_boss.weapon = deep_clone(presets.weapon.normal)
	self.chavez_boss.detection = presets.detection.normal
	self.chavez_boss.priority_shout = "g29"
	self.chavez_boss.bot_priority_shout = "g29"
	self.chavez_boss.silent_priority_shout = nil
	self.chavez_boss.custom_shout = true
	self.chavez_boss.priority_shout_max_dis = 3000
	self.chavez_boss.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.chavez_boss.HEALTH_INIT = 500
	self.chavez_boss.headshot_dmg_mul = 7.99425
	self.chavez_boss.move_speed = presets.move_speed.slow
	self.chavez_boss.allowed_poses = {stand = true}
	self.chavez_boss.no_retreat = true
	self.chavez_boss.no_arrest = true
	self.chavez_boss.surrender = nil
	self.chavez_boss.ecm_vulnerability = 0
	self.chavez_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.chavez_boss.weapon_voice = "1"
	self.chavez_boss.experience.cable_tie = "tie_swat"
	self.chavez_boss.access = "gangster"
	self.chavez_boss.speech_prefix_p1 = "bb"
	self.chavez_boss.speech_prefix_p2 = "n"
	self.chavez_boss.speech_prefix_count = 1
	self.chavez_boss.rescue_hostages = false
	self.chavez_boss.melee_weapon = "fists_dozer"
	self.chavez_boss.melee_weapon_dmg_multiplier = 1
	self.chavez_boss.steal_loot = nil
	self.chavez_boss.calls_in = nil
	self.chavez_boss.chatter = presets.enemy_chatter.no_chatter
	self.chavez_boss.use_radio = nil
	self.chavez_boss.can_be_tased = false
	self.chavez_boss.use_animation_on_fire_damage = false
	self.chavez_boss.flammable = true
	self.chavez_boss.can_be_tased = false
	self.chavez_boss.immune_to_knock_down = true
	self.chavez_boss.immune_to_concussion = false
	self.chavez_boss.must_headshot = true
	table.insert(self._enemy_list, "chavez_boss")
end

function CharacterTweakData:_init_bolivians(presets)
	self.bolivian = deep_clone(self.gangster)
	self.bolivian.detection = presets.detection.normal
	self.bolivian.access = "security"
	self.bolivian.radio_prefix = "fri_"
	self.bolivian.suspicious = true
	self.bolivian.crouch_move = nil
	self.bolivian.no_arrest = true
	table.insert(self._enemy_list, "bolivian")
	self.bolivian_indoors = deep_clone(self.bolivian)
	self.bolivian_indoors.suppression = presets.suppression.hard
	self.bolivian_indoors.has_alarm_pager = true
	self.bolivian_indoors.surrender = presets.surrender.hard
	self.bolivian_indoors.surrender_break_time = {20, 30}
	self.bolivian_indoors.detection = presets.detection.guard
	self.bolivian_indoors.HEALTH_INIT = 6
	self.bolivian_indoors.headshot_dmg_mul = 3.4
	self.bolivian_indoors.no_arrest_chance_inc = 0.25
	self.bolivian_indoors.detection_increase = 0.05
	self.bolivian_indoors.move_speed = presets.move_speed.normal
	self.bolivian_indoors.ecm_vulnerability = 1
	self.bolivian_indoors.no_arrest = false
	self.bolivian_indoors.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	table.insert(self._enemy_list, "bolivian_indoors")
end

function CharacterTweakData:_init_drug_lord_boss(presets)
	self.drug_lord_boss = deep_clone(presets.base)
	self.drug_lord_boss.experience = {}
	self.drug_lord_boss.weapon = deep_clone(presets.weapon.normal)
	self.drug_lord_boss.detection = presets.detection.normal
	self.drug_lord_boss.HEALTH_INIT = 500
	self.drug_lord_boss.headshot_dmg_mul = 7.99425
	self.drug_lord_boss.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.drug_lord_boss.move_speed = presets.move_speed.slow
	self.drug_lord_boss.allowed_poses = {stand = true}
	self.drug_lord_boss.crouch_move = false
	self.drug_lord_boss.no_run_start = true
	self.drug_lord_boss.no_run_stop = true
	self.drug_lord_boss.no_retreat = true
	self.drug_lord_boss.no_arrest = true
	self.drug_lord_boss.surrender = nil
	self.drug_lord_boss.ecm_vulnerability = 0
	self.drug_lord_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.drug_lord_boss.weapon_voice = "3"
	self.drug_lord_boss.experience.cable_tie = "tie_swat"
	self.drug_lord_boss.access = "gangster"
	self.drug_lord_boss.speech_prefix_p1 = "bb"
	self.drug_lord_boss.speech_prefix_p2 = "n"
	self.drug_lord_boss.speech_prefix_count = 1
	self.drug_lord_boss.rescue_hostages = false
	self.drug_lord_boss.silent_priority_shout = "f37"
	self.drug_lord_boss.melee_weapon = "fists_dozer"
	self.drug_lord_boss.melee_weapon_dmg_multiplier = 1
	self.drug_lord_boss.steal_loot = nil
	self.drug_lord_boss.calls_in = nil
	self.drug_lord_boss.chatter = presets.enemy_chatter.no_chatter
	self.drug_lord_boss.use_radio = nil
	self.drug_lord_boss.can_be_tased = false
	self.drug_lord_boss.use_animation_on_fire_damage = false
	self.drug_lord_boss.flammable = true
	self.drug_lord_boss.can_be_tased = false
	self.drug_lord_boss.immune_to_knock_down = true
	self.drug_lord_boss.immune_to_concussion = false
	self.drug_lord_boss.priority_shout = "g29"
	self.drug_lord_boss.bot_priority_shout = "g29"
	self.drug_lord_boss.custom_shout = true
	self.drug_lord_boss.priority_shout_max_dis = 3000
	self.drug_lord_boss.must_headshot = true
	table.insert(self._enemy_list, "drug_lord_boss")
end

function CharacterTweakData:_init_drug_lord_boss_stealth(presets)
	self.drug_lord_boss_stealth = deep_clone(presets.base)
	self.drug_lord_boss_stealth.experience = {}
	self.drug_lord_boss_stealth.weapon = deep_clone(presets.weapon.normal)
	self.drug_lord_boss_stealth.detection = presets.detection.normal
	self.drug_lord_boss_stealth.HEALTH_INIT = 6
	self.drug_lord_boss_stealth.headshot_dmg_mul = 3.4
	self.drug_lord_boss_stealth.move_speed = presets.move_speed.very_fast
	self.drug_lord_boss_stealth.no_retreat = true
	self.drug_lord_boss_stealth.no_arrest = true
	self.drug_lord_boss_stealth.surrender = nil
	self.drug_lord_boss_stealth.ecm_vulnerability = 0
	self.drug_lord_boss_stealth.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.drug_lord_boss_stealth.weapon_voice = "3"
	self.drug_lord_boss_stealth.experience.cable_tie = "tie_swat"
	self.drug_lord_boss_stealth.access = "gangster"
	self.drug_lord_boss_stealth.speech_prefix_p1 = "bb"
	self.drug_lord_boss_stealth.speech_prefix_p2 = "n"
	self.drug_lord_boss_stealth.speech_prefix_count = 1
	self.drug_lord_boss_stealth.rescue_hostages = false
	self.drug_lord_boss_stealth.silent_priority_shout = "f37"
	self.drug_lord_boss_stealth.melee_weapon = "fists_dozer"
	self.drug_lord_boss_stealth.melee_weapon_dmg_multiplier = 1
	self.drug_lord_boss_stealth.steal_loot = nil
	self.drug_lord_boss_stealth.calls_in = nil
	self.drug_lord_boss_stealth.chatter = presets.enemy_chatter.no_chatter
	self.drug_lord_boss_stealth.use_radio = nil
	self.drug_lord_boss_stealth.use_animation_on_fire_damage = true
	self.drug_lord_boss_stealth.flammable = true
	self.drug_lord_boss_stealth.can_be_tased = true
	self.drug_lord_boss_stealth.immune_to_knock_down = false
	self.drug_lord_boss_stealth.immune_to_concussion = false
	table.insert(self._enemy_list, "drug_lord_boss_stealth")
end

function CharacterTweakData:_init_tank(presets)
	self.tank = deep_clone(presets.base)
	self.tank.tags = {"tank"}
	self.tank.experience = {}
	self.tank.damage.tased_response = {
		light = {tased_time = 1, down_time = 0},
		heavy = {tased_time = 2, down_time = 0}
	}
	self.tank.weapon = deep_clone(presets.weapon.normal)
	self.tank.detection = presets.detection.normal
	self.tank.HEALTH_INIT = 500
	self.tank.headshot_dmg_mul = 12.5
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
		ears = {min_duration = 1, max_duration = 3}
	}
	self.tank.weapon_voice = "3"
	self.tank.experience.cable_tie = "tie_swat"
	self.tank.access = "tank"
	self.tank.speech_prefix_p1 = self._prefix_data_p1.bulldozer()
	self.tank.speech_prefix_p2 = nil
	self.tank.speech_prefix_count = nil
	self.tank.priority_shout = "f30"
	self.tank.bot_priority_shout = "f30x_any"
	self.tank.priority_shout_max_dis = 3000
	self.tank.rescue_hostages = true
	self.tank.deathguard = true
	self.tank.melee_weapon = "fists_dozer"
	self.tank.melee_weapon_dmg_multiplier = 1
	self.tank.melee_anims = {
		"cbt_std_melee"
	}
	self.tank.critical_hits = {
		damage_mul = 2
	}
	self.tank.damage.hurt_severity = presets.hurt_severities.no_hurts
 	self.tank.chatter = {
 		aggressive = true,
 		retreat = true,
		contact = true
 	}
	self.tank.announce_incomming = "incomming_tank"
	if job == "chill_combat" then
		self.tank.steal_loot = nil
	else
		self.tank.steal_loot = true
	end
	self.tank.calls_in = nil
	self.tank.use_animation_on_fire_damage = false
	self.tank.flammable = true
	self.tank.can_be_tased = false
	self.tank.immune_to_knock_down = false
	self.tank.must_headshot = true
 	table.insert(self._enemy_list, "tank")
	self.tank_hw = deep_clone(self.tank)
	self.tank_hw.HEALTH_INIT = 500
	self.tank_hw.critical_hits = {
		damage_mul = 2
	}
	self.tank_hw.headshot_dmg_mul = 7.99425
	self.tank_hw.immune_to_concussion = false
	self.tank_hw.use_animation_on_fire_damage = false
	self.tank_hw.flammable = true
	self.tank_hw.can_be_tased = false
	self.tank_hw.melee_anims = nil
	self.tank_hw.move_speed = presets.move_speed.slow
	if job == "chill_combat" then
		self.tank_hw.steal_loot = nil
	else
		self.tank_hw.steal_loot = true
	end
 	table.insert(self._enemy_list, "tank_hw")
	self.tank_medic = deep_clone(self.tank)
	table.insert(self.tank_medic.tags, "medic")
	table.insert(self._enemy_list, "tank_medic")
	self.tank_titan = deep_clone(self.tank)
	self.tank_titan.move_speed = presets.move_speed.very_slow
	self.tank_titan.headshot_dmg_mul = 3.997125
	if job == "chill_combat" then
		self.tank_titan.steal_loot = nil
	else
		self.tank_titan.steal_loot = true
	end
	self.tank_titan.immune_to_concussion = true
	self.tank_titan.immune_to_knock_down = true
	self.tank_titan.priority_shout = "f45"
	self.tank_titan.bot_priority_shout = "f45x_any"
	self.tank_titan.priority_shout_max_dis = 3000
	self.tank_titan.leader = {max_nr_followers = 6}
	self.tank_titan.damage_multiplier = {multiplier = 1.1}
	self.tank_titan.ecm_vulnerability = 1
	self.tank_titan.ecm_hurts = {
		ears = {min_duration = 2, max_duration = 3}
	}
	self.tank_titan.spawn_sound_event = "bdz_entrance_elite"
	self.tank_titan.die_sound_event = "mga_death_scream"
	self.tank_titan.damage.explosion_damage_mul = 0.5
 	table.insert(self._enemy_list, "tank_titan")
	self.tank_mini = deep_clone(self.tank)
	self.tank_mini.move_speed = presets.move_speed.very_slow
	table.insert(self._enemy_list, "tank_mini")
end

function CharacterTweakData:_init_spooc(presets)
	self.spooc = deep_clone(presets.base)
	self.spooc.tags = {"spooc"}
	self.spooc.experience = {}
	self.spooc.damage.hurt_severity = presets.hurt_severities.spooc
	self.spooc.weapon = deep_clone(presets.weapon.normal)
	self.spooc.detection = presets.detection.normal
	self.spooc.HEALTH_INIT = 60
	self.spooc.headshot_dmg_mul = 5.85
	self.spooc.move_speed = presets.move_speed.lightning
	self.spooc.no_retreat = true
	self.spooc.no_arrest = true
	self.spooc.surrender_break_time = {4, 6}
	self.spooc.suppression = nil
	self.spooc.surrender = presets.surrender.special
	self.spooc.priority_shout = "f33"
	self.spooc.bot_priority_shout = "f33x_any"
	self.spooc.priority_shout_max_dis = 3000
	self.spooc.rescue_hostages = true
	self.spooc.spooc_attack_timeout = {3, 3}
	self.spooc.spooc_attack_beating_time = {3, 3}
	self.spooc.spooc_attack_use_smoke_chance = 1
	self.spooc.weapon_voice = "3"
	self.spooc.experience.cable_tie = "tie_swat"
	self.spooc.speech_prefix_p1 = self._prefix_data_p1.cloaker()
	self.spooc.speech_prefix_count = nil
	self.spooc.access = "spooc"
	self.spooc.flammable = true
	self.spooc.dodge = presets.dodge.ninja
	self.spooc.chatter = presets.enemy_chatter.no_chatter
	if job == "chill_combat" then
		self.spooc.steal_loot = nil
	else
		self.spooc.steal_loot = true
	end
	self.spooc.melee_weapon = "baton"
	self.spooc.use_radio = nil
	self.spooc.can_be_tased = false
 	table.insert(self._enemy_list, "spooc")
end

function CharacterTweakData:_init_shield(presets)
	self.shield = deep_clone(presets.base)
	self.shield.tags = {"shield"}
	self.shield.experience = {}
	self.shield.weapon = deep_clone(presets.weapon.normal)
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.shield.detection = presets.detection.normal
	self.shield.HEALTH_INIT = 15
	self.shield.headshot_dmg_mul = 2.5
	self.shield.allowed_stances = {cbt = true}
	self.shield.allowed_poses = {crouch = true}
	self.shield.always_face_enemy = true
	self.shield.move_speed = presets.move_speed.fast
	self.shield.no_run_start = true
	self.shield.no_run_stop = true
	self.shield.no_retreat = true
	self.shield.no_arrest = true
	self.shield.surrender = nil
	self.shield.ecm_vulnerability = 0.9
	self.shield.suppression = nil
	self.shield.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.shield.priority_shout = "f31"
	self.shield.bot_priority_shout = "f31x_any"
	self.shield.priority_shout_max_dis = 3000
	self.shield.rescue_hostages = false
	self.shield.deathguard = false
	self.shield.no_equip_anim = true
	self.shield.wall_fwd_offset = 100
	self.shield.calls_in = nil
	self.shield.ignore_medic_revive_animation = true
	self.shield.damage.hurt_severity = presets.hurt_severities.only_explosion_hurts
	self.shield.damage.shield_knocked = true
	self.shield.use_animation_on_fire_damage = false
	self.shield.flammable = true
	self.shield.weapon_voice = "3"
	self.shield.experience.cable_tie = "tie_swat"
	self.shield.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.shield.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.shield.speech_prefix_count = 4
	self.shield.access = "shield"
	self.shield.chatter = presets.enemy_chatter.shield
	self.shield.announce_incomming = "incomming_shield"
	if job == "chill_combat" then
		self.shield.steal_loot = nil
	else
		self.shield.steal_loot = true
	end
	self.shield.use_animation_on_fire_damage = false
	self.shield.immune_to_knock_down = true
 	table.insert(self._enemy_list, "shield")
end

function CharacterTweakData:_init_phalanx_minion(presets)
	self.phalanx_minion = deep_clone(self.shield)
	self.phalanx_minion.tags = {"shield"}
	self.phalanx_minion.experience = {}
	self.phalanx_minion.weapon = deep_clone(presets.weapon.normal)
	self.phalanx_minion.detection = presets.detection.normal
	self.phalanx_minion.headshot_dmg_mul = 2.5
	self.phalanx_minion.HEALTH_INIT = 15
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 36
	self.phalanx_minion.damage.explosion_damage_mul = 0.05
	self.phalanx_minion.damage.fire_damage_mul = 0.05
	self.phalanx_minion.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.phalanx_minion.flammable = false
	self.phalanx_minion.damage.shield_knocked = true
	self.phalanx_minion.priority_shout = "f45"
	self.phalanx_minion.bot_priority_shout = "f45x_any"
	self.phalanx_minion.priority_shout_max_dis = 3000
	self.phalanx_minion.weapon_voice = "3"
	self.phalanx_minion.experience.cable_tie = "tie_swat"
	self.phalanx_minion.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.phalanx_minion.speech_prefix_p2 = self._prefix_data_p2.swat()
	self.phalanx_minion.speech_prefix_count = 4
	self.phalanx_minion.access = "shield"
	self.phalanx_minion.chatter = presets.enemy_chatter.shield
	self.phalanx_minion.announce_incomming = "incomming_shield"
	if job == "chill_combat" then
		self.phalanx_minion.steal_loot = nil
	else
		self.phalanx_minion.steal_loot = true
	end
	self.phalanx_minion.leader = {max_nr_followers = 6}
	self.phalanx_minion.damage_resist_followers = {multiplier = 0.75}
	self.phalanx_minion.ignore_medic_revive_animation = true
	self.phalanx_minion.ecm_vulnerability = 1
	self.phalanx_minion.ecm_hurts = {
		ears = {min_duration = 2, max_duration = 3}
	}
	self.phalanx_minion.use_animation_on_fire_damage = false
	self.phalanx_minion.can_be_tased = false
	self.phalanx_minion.immune_to_knock_down = true
	self.phalanx_minion.immune_to_concussion = true
	self.phalanx_minion.damage.immune_to_knockback = true
	self.phalanx_minion.spawn_sound_event = "l2d_prm"
	self.phalanx_minion.die_sound_event = "mga_death_scream"
	self.phalanx_minion.suppression = nil
 	table.insert(self._enemy_list, "phalanx_minion")
	self.phalanx_minion_assault = deep_clone(self.phalanx_minion)
	self.phalanx_minion_assault.spawn_sound_event = "mga_s01"
	self.phalanx_minion_assault.die_sound_event = "mga_death_scream"
end

function CharacterTweakData:_init_phalanx_vip(presets)
	self.phalanx_vip = deep_clone(self.phalanx_minion)
	self.phalanx_vip.LOWER_HEALTH_PERCENTAGE_LIMIT = 0.0001
	self.phalanx_vip.FINAL_LOWER_HEALTH_PERCENTAGE_LIMIT = 0.0001
	self.phalanx_vip.damage.shield_knocked = false
	self.phalanx_vip.immune_to_knock_down = true
	self.phalanx_vip.HEALTH_INIT = 30
	self.phalanx_vip.headshot_dmg_mul = 1.59885
	self.phalanx_vip.damage.explosion_damage_mul = 0.05
	self.phalanx_vip.spawn_sound_event = nil
	self.phalanx_vip.priority_shout = "f45"
	self.phalanx_vip.bot_priority_shout = "f45x_any"
	self.phalanx_vip.priority_shout_max_dis = 3000
	self.phalanx_vip.flammable = false
	self.phalanx_vip.can_be_tased = false
	self.phalanx_vip.ecm_vulnerability = nil
	self.phalanx_vip.must_headshot = true
	self.phalanx_vip.suppression = nil
	self.phalanx_vip.ecm_hurts = {}
 	table.insert(self._enemy_list, "phalanx_vip")
end

function CharacterTweakData:_init_spring(presets)
	self.spring = deep_clone(self.tank)
	self.spring.tags = {"custom"}
	self.spring.move_speed = presets.move_speed.very_slow
	self.spring.rage_move_speed = presets.move_speed.fast
	self.spring.no_run_start = true
	self.spring.no_run_stop = true
	self.spring.no_retreat = true
	self.spring.no_arrest = true
	self.spring.LOWER_HEALTH_PERCENTAGE_LIMIT = nil
	self.spring.FINAL_LOWER_HEALTH_PERCENTAGE_LIMIT = nil
	self.spring.ends_assault_on_death = true
	self.spring.immune_to_knock_down = true
	self.spring.HEALTH_INIT = 1000
	self.spring.EXTRA_HEALTH_BALANCE = 50
	self.spring.headshot_dmg_mul = 1.59885
	self.spring.damage.explosion_damage_mul = 0.1
	self.spring.priority_shout = "f45"
	self.spring.bot_priority_shout = "f45x_any"
	self.spring.priority_shout_max_dis = 3000
	self.spring.flammable = true
	self.spring.rescue_hostages = false
	self.spring.can_be_tased = false
	self.spring.ecm_vulnerability = nil
	self.spring.immune_to_concussion = true
	self.spring.ecm_hurts = {}
	self.spring.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.spring.melee_weapon = "fists_dozer"
	self.spring.melee_weapon_dmg_multiplier = 1
	self.spring.melee_anims = {
		"cbt_std_melee"
	}
	self.spring.speech_prefix_p1 = "l"
	self.spring.speech_prefix_p2 = "d"
	self.spring.speech_prefix_count = 4
	self.spring.chatter = presets.enemy_chatter.no_chatter
	self.spring.announce_incomming = "incomming_captain"
	self.spring.spawn_sound_event = "cpa_a02_01"
	self.spring.die_sound_event = "mga_death_scream"
	self.spring.critical_hits = {
		damage_mul = 2
	}
 	table.insert(self._enemy_list, "spring")
end

function CharacterTweakData:_init_taser(presets)
	self.taser = deep_clone(presets.base)
	self.taser.tags = {"taser"}
	self.taser.experience = {}
	self.taser.weapon = deep_clone(presets.weapon.normal)
	self.taser.weapon.is_rifle.tase_distance = 1400
	self.taser.weapon.is_rifle.aim_delay_tase = {0, 0.5}
	self.taser.weapon.is_rifle.tase_sphere_cast_radius = 30
	self.taser.detection = presets.detection.normal
	self.taser.HEALTH_INIT = 36
	self.taser.headshot_dmg_mul = 1.8
	self.taser.move_speed = presets.move_speed.fast
	self.taser.no_retreat = true
	self.taser.no_arrest = true
	self.taser.surrender = presets.surrender.special
	self.taser.ecm_vulnerability = 0.9
	self.taser.ecm_hurts = {
		ears = {min_duration = 6, max_duration = 8}
	}
	self.taser.surrender_break_time = {4, 6}
	self.taser.suppression = nil
	self.taser.weapon_voice = "3"
	self.taser.experience.cable_tie = "tie_swat"
	self.taser.speech_prefix_p1 = self._prefix_data_p1.taser()
	self.taser.speech_prefix_p2 = nil
	self.taser.speech_prefix_count = nil
	self.taser.access = "taser"
	self.taser.dodge = presets.dodge.athletic
	self.taser.priority_shout = "f32"
	self.taser.bot_priority_shout = "f32x_any"
	self.taser.priority_shout_max_dis = 3000
	self.taser.rescue_hostages = true
	self.taser.deathguard = true
 	self.taser.chatter = {
 		aggressive = true,
 		retreat = true,
		contact = true
 	}
	self.taser.announce_incomming = "incomming_taser"
	if job == "chill_combat" then
		self.taser.steal_loot = nil
	else
		self.taser.steal_loot = true
	end
	self.taser.special_deaths = {}
	self.taser.special_deaths.bullet = {
		[("head"):id():key()] = {
			character_name = "bodhi",
			weapon_id = "model70",
			sequence = "kill_tazer_headshot",
			special_comment = "x01"
		}
	}
 	table.insert(self._enemy_list, "taser")
end

function CharacterTweakData:_init_boom(presets)
	self.boom = deep_clone(presets.base)
	self.boom.tags = {"custom"}
	self.boom.experience = {}
	self.boom.weapon = deep_clone(presets.weapon.normal)
	self.boom.melee_weapon = "knife_1"
	self.boom.melee_weapon_dmg_multiplier = 1
	self.boom.weapon_safety_range = 1000
	self.boom.detection = presets.detection.normal
	self.boom.HEALTH_INIT = 36
	self.boom.HEALTH_SUICIDE_LIMIT = 0.25
	self.boom.flammable = false
	self.boom.use_animation_on_fire_damage = false
	self.boom.damage.explosion_damage_mul = 0
	self.boom.damage.fire_damage_mul = 0
	self.boom.damage.hurt_severity = presets.hurt_severities.boom
	self.boom.headshot_dmg_mul = 1.8
	self.boom.bag_dmg_mul = 6
	self.boom.move_speed = presets.move_speed.fast
	self.boom.no_retreat = true
	self.boom.no_arrest = true
	self.boom.surrender = nil
	self.boom.ecm_vulnerability = 0.9
	self.boom.ecm_hurts = {
		ears = {min_duration = 6, max_duration = 8}
	}
	self.boom.surrender_break_time = {4, 6}
	self.boom.suppression = nil
	self.boom.weapon_voice = "3"
	self.boom.experience.cable_tie = "tie_swat"
	self.boom.speech_prefix_p1 = "gren"
	self.boom.speech_prefix_count = nil
	self.boom.access = "taser"
	self.boom.dodge = presets.dodge.athletic
	self.boom.use_gas = true
	self.boom.priority_shout = "g29"
	self.boom.bot_priority_shout = "g29"
	self.boom.priority_shout_max_dis = 3000
	self.boom.custom_shout = true
	self.boom.rescue_hostages = true
	self.boom.deathguard = true
	self.boom.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.boom.announce_incomming = "incomming_gren"
	self.boom.spawn_sound_event = "clk_c01x_plu"
	self.boom.die_sound_event = "rmdc_x02a_any_3p"
	if job == "chill_combat" then
		self.boom.steal_loot = nil
	else
		self.boom.steal_loot = true
	end
 	table.insert(self._enemy_list, "boom")
	self.rboom = deep_clone(self.boom)
	if job == "chill_combat" then
		self.rboom.steal_loot = nil
	else
		self.rboom.steal_loot = true
	end
	self.rboom.spawn_sound_event = "clk_c01x_plu"
	self.rboom.speech_prefix_p1 = "rgren"
	self.rboom.die_sound_event = "mdc_x02a_any_3p"
 	table.insert(self._enemy_list, "rboom")
end

function CharacterTweakData:_init_inside_man(presets)
	self.inside_man = deep_clone(presets.base)
	self.inside_man.experience = {}
	self.inside_man.weapon = presets.weapon.normal
	self.inside_man.detection = presets.detection.blind
	self.inside_man.HEALTH_INIT = 4
	self.inside_man.headshot_dmg_mul = 2.5
	self.inside_man.move_speed = presets.move_speed.normal
	self.inside_man.surrender_break_time = {10, 15}
	self.inside_man.suppression = presets.suppression.no_supress
	self.inside_man.surrender = nil
	self.inside_man.ecm_vulnerability = nil
	self.inside_man.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.inside_man.weapon_voice = "1"
	self.inside_man.experience.cable_tie = "tie_swat"
	self.inside_man.speech_prefix_p1 = "l"
	self.inside_man.speech_prefix_p2 = "n"
	self.inside_man.speech_prefix_count = 4
	self.inside_man.access = "cop"
	self.inside_man.dodge = presets.dodge.average
	self.inside_man.chatter = presets.enemy_chatter.no_chatter
	self.inside_man.melee_weapon = "baton"
	self.inside_man.calls_in = nil
end

function CharacterTweakData:_init_civilian(presets)
	self.civilian = {
		experience = {}
	}
	self.civilian.detection = presets.detection.civilian
	self.civilian.HEALTH_INIT = 0.9
	self.civilian.headshot_dmg_mul = 999
	self.civilian.move_speed = presets.move_speed.civ_fast
	self.civilian.flee_type = "escape"
	self.civilian.scare_max = {10, 20}
	self.civilian.scare_shot = 1
	self.civilian.scare_intimidate = -5
	self.civilian.submission_max = {60, 120}
	self.civilian.submission_intimidate = 120
	self.civilian.run_away_delay = {5, 20}
	self.civilian.damage = presets.hurt_severities.no_hurts
	self.civilian.ecm_vulnerability = nil
	self.civilian.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.civilian.experience.cable_tie = "tie_civ"
	self.civilian.speech_prefix_p1 = "cm"
	self.civilian.speech_prefix_count = 2
	self.civilian.access = "civ_male"
	self.civilian.intimidateable = true
	self.civilian.challenges = {type = "civilians"}
	self.civilian.calls_in = true
	self.civilian.hostage_move_speed = 3
	self.civilian_armed = deep_clone(self.civilian)
	self.civilian_female = deep_clone(self.civilian)
	self.civilian_female.speech_prefix_p1 = "cf"
	self.civilian_female.speech_prefix_count = 5
	self.civilian_female.female = true
	self.civilian_female.access = "civ_female"
	self.robbers_safehouse = deep_clone(self.civilian)
	self.robbers_safehouse.scare_shot = 0
	self.robbers_safehouse.scare_intimidate = 0
	self.robbers_safehouse.intimidateable = false
	self.robbers_safehouse.ignores_aggression = true
	self.robbers_safehouse.calls_in = nil
	self.robbers_safehouse.ignores_contours = true
	self.robbers_safehouse.HEALTH_INIT = 50
	self.robbers_safehouse.headshot_dmg_mul = 1
end

function CharacterTweakData:_init_bank_manager(presets)
	self.bank_manager = {
		experience = {},
		escort = {}
	}
	self.bank_manager.detection = presets.detection.civilian
	self.bank_manager.HEALTH_INIT = self.civilian.HEALTH_INIT
	self.bank_manager.headshot_dmg_mul = self.civilian.headshot_dmg_mul
	self.bank_manager.move_speed = presets.move_speed.normal
	self.bank_manager.flee_type = "hide"
	self.bank_manager.scare_max = {10, 20}
	self.bank_manager.scare_shot = 1
	self.bank_manager.scare_intimidate = -5
	self.bank_manager.submission_max = {60, 120}
	self.bank_manager.submission_intimidate = 120
	self.bank_manager.damage = presets.hurt_severities.no_hurts
	self.bank_manager.ecm_vulnerability = nil
	self.bank_manager.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.bank_manager.experience.cable_tie = "tie_civ"
	self.bank_manager.speech_prefix_p1 = "cm"
	self.bank_manager.speech_prefix_count = 2
	self.bank_manager.access = "civ_male"
	self.bank_manager.intimidateable = true
	self.bank_manager.hostage_move_speed = 3
	self.bank_manager.challenges = {type = "civilians"}
	self.bank_manager.calls_in = true
end

function CharacterTweakData:_init_drunk_pilot(presets)
	self.drunk_pilot = deep_clone(self.civilian)
	self.drunk_pilot.move_speed = presets.move_speed.civ_fast
	self.drunk_pilot.flee_type = "hide"
	self.drunk_pilot.access = "civ_male"
	self.drunk_pilot.intimidateable = nil
	self.drunk_pilot.challenges = {type = "civilians"}
	self.drunk_pilot.calls_in = nil
	self.drunk_pilot.ignores_aggression = true
end

function CharacterTweakData:_init_boris(presets)
	self.boris = deep_clone(self.civilian)
	self.boris.flee_type = "hide"
	self.boris.access = "civ_male"
	self.boris.intimidateable = nil
	self.boris.challenges = {type = "civilians"}
	self.boris.calls_in = nil
	self.boris.ignores_aggression = true
end

function CharacterTweakData:_init_old_hoxton_mission(presets)
	self.old_hoxton_mission = deep_clone(presets.base)
	self.old_hoxton_mission.experience = {}
	self.old_hoxton_mission.no_run_start = true
	self.old_hoxton_mission.no_run_stop = true
	self.old_hoxton_mission.weapon = presets.weapon.gang_member
	self.old_hoxton_mission.detection = presets.detection.gang_member
	self.old_hoxton_mission.damage = presets.gang_member_damage
	self.old_hoxton_mission.damage.explosion_damage_mul = 0
	self.old_hoxton_mission.HEALTH_INIT = 100
	self.old_hoxton_mission.headshot_dmg_mul = 1
	self.old_hoxton_mission.move_speed = presets.move_speed.gang_member
	self.old_hoxton_mission.surrender_break_time = {6, 10}
	self.old_hoxton_mission.suppression = presets.suppression.no_supress
	self.old_hoxton_mission.surrender = false
	self.old_hoxton_mission.weapon_voice = "1"
	self.old_hoxton_mission.experience.cable_tie = "tie_swat"
	self.old_hoxton_mission.speech_prefix_p1 = "rb2"
	self.old_hoxton_mission.access = "teamAI4"
	self.old_hoxton_mission.dodge = presets.dodge.athletic
	self.old_hoxton_mission.no_arrest = true
	self.old_hoxton_mission.chatter = presets.enemy_chatter.no_chatter
	self.old_hoxton_mission.use_radio = nil
	self.old_hoxton_mission.melee_weapon = "fists"
	self.old_hoxton_mission.melee_weapon_dmg_multiplier = 1
	self.old_hoxton_mission.steal_loot = false
	self.old_hoxton_mission.rescue_hostages = false
	self.old_hoxton_mission.crouch_move = false
end

function CharacterTweakData:_init_russian(presets)
	self.russian = {}
	self.russian.always_face_enemy = true
	self.russian.no_run_start = true
	self.russian.no_run_stop = true
	self.russian.flammable = false
	self.russian.damage = presets.gang_member_damage
	self.russian.weapon = deep_clone(presets.weapon.gang_member)
	self.russian.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_74_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.russian.detection = presets.detection.gang_member
	self.russian.move_speed = presets.move_speed.gang_member
	self.russian.crouch_move = false
	self.russian.speech_prefix = "rb2"
	self.russian.weapon_voice = "1"
	self.russian.access = "teamAI1"
	self.russian.dodge = presets.dodge.athletic
	self.russian.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_german(presets)
	self.german = {}
	self.german.always_face_enemy = true
	self.german.no_run_start = true
	self.german.no_run_stop = true
	self.german.flammable = false
	self.german.damage = presets.gang_member_damage
	self.german.weapon = deep_clone(presets.weapon.gang_member)
	self.german.weapon.weapons_of_choice = {
		primary = "wpn_fps_shot_r870_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.german.detection = presets.detection.gang_member
	self.german.move_speed = presets.move_speed.gang_member
	self.german.crouch_move = false
	self.german.speech_prefix = "rb2"
	self.german.weapon_voice = "2"
	self.german.access = "teamAI1"
	self.german.dodge = presets.dodge.athletic
	self.german.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_spanish(presets)
	self.spanish = {}
	self.spanish.always_face_enemy = true
	self.spanish.no_run_start = true
	self.spanish.no_run_stop = true
	self.spanish.flammable = false
	self.spanish.damage = presets.gang_member_damage
	self.spanish.weapon = deep_clone(presets.weapon.gang_member)
	self.spanish.weapon.weapons_of_choice = {
		primary = "wpn_fps_lmg_m249_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.spanish.detection = presets.detection.gang_member
	self.spanish.move_speed = presets.move_speed.gang_member
	self.spanish.crouch_move = false
	self.spanish.speech_prefix = "rb2"
	self.spanish.weapon_voice = "3"
	self.spanish.access = "teamAI1"
	self.spanish.dodge = presets.dodge.athletic
	self.spanish.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_american(presets)
	self.american = {}
	self.american.always_face_enemy = true
	self.american.no_run_start = true
	self.american.no_run_stop = true
	self.american.flammable = false
	self.american.damage = presets.gang_member_damage
	self.american.weapon = deep_clone(presets.weapon.gang_member)
	self.american.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m14_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.american.detection = presets.detection.gang_member
	self.american.move_speed = presets.move_speed.gang_member
	self.american.crouch_move = false
	self.american.speech_prefix = "rb2"
	self.american.weapon_voice = "3"
	self.american.access = "teamAI1"
	self.american.dodge = presets.dodge.athletic
	self.american.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_jowi(presets)
	self.jowi = {}
	self.jowi.always_face_enemy = true
	self.jowi.no_run_start = true
	self.jowi.no_run_stop = true
	self.jowi.damage = presets.gang_member_damage
	self.jowi.weapon = deep_clone(presets.weapon.gang_member)
	self.jowi.weapon.weapons_of_choice = {
		primary = "wpn_fps_snp_tti_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.jowi.detection = presets.detection.gang_member
	self.jowi.move_speed = presets.move_speed.gang_member
	self.jowi.crouch_move = false
	self.jowi.speech_prefix = "rb2"
	self.jowi.weapon_voice = "3"
	self.jowi.access = "teamAI1"
	self.jowi.dodge = presets.dodge.athletic
	self.jowi.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_old_hoxton(presets)
	self.old_hoxton = {}
	self.old_hoxton.always_face_enemy = true
	self.old_hoxton.no_run_start = true
	self.old_hoxton.no_run_stop = true
	self.old_hoxton.damage = presets.gang_member_damage
	self.old_hoxton.weapon = deep_clone(presets.weapon.gang_member)
	self.old_hoxton.weapon.weapons_of_choice = {
		primary = "wpn_fps_sho_spas12_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.old_hoxton.detection = presets.detection.gang_member
	self.old_hoxton.move_speed = presets.move_speed.gang_member
	self.old_hoxton.crouch_move = false
	self.old_hoxton.speech_prefix = "rb2"
	self.old_hoxton.weapon_voice = "3"
	self.old_hoxton.access = "teamAI1"
	self.old_hoxton.dodge = presets.dodge.athletic
	self.old_hoxton.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_clover(presets)
	self.female_1 = {}
	self.female_1.always_face_enemy = true
	self.female_1.no_run_start = true
	self.female_1.no_run_stop = true
	self.female_1.damage = presets.gang_member_damage
	self.female_1.weapon = deep_clone(presets.weapon.gang_member)
	self.female_1.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_l85a2_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.female_1.detection = presets.detection.gang_member
	self.female_1.move_speed = presets.move_speed.gang_member
	self.female_1.crouch_move = false
	self.female_1.speech_prefix = "rb7"
	self.female_1.weapon_voice = "3"
	self.female_1.access = "teamAI1"
	self.female_1.dodge = presets.dodge.athletic
	self.female_1.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_dragan(presets)
	self.dragan = {}
	self.dragan.always_face_enemy = true
	self.dragan.no_run_start = true
	self.dragan.no_run_stop = true
	self.dragan.damage = presets.gang_member_damage
	self.dragan.weapon = deep_clone(presets.weapon.gang_member)
	self.dragan.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_vhs_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.dragan.detection = presets.detection.gang_member
	self.dragan.move_speed = presets.move_speed.gang_member
	self.dragan.crouch_move = false
	self.dragan.speech_prefix = "rb8"
	self.dragan.weapon_voice = "3"
	self.dragan.access = "teamAI1"
	self.dragan.dodge = presets.dodge.athletic
	self.dragan.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_jacket(presets)
	self.jacket = {}
	self.jacket.always_face_enemy = true
	self.jacket.no_run_start = true
	self.jacket.no_run_stop = true
	self.jacket.damage = presets.gang_member_damage
	self.jacket.weapon = deep_clone(presets.weapon.gang_member)
	self.jacket.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_74_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.jacket.detection = presets.detection.gang_member
	self.jacket.move_speed = presets.move_speed.gang_member
	self.jacket.crouch_move = false
	self.jacket.speech_prefix = "rb9"
	self.jacket.weapon_voice = "3"
	self.jacket.access = "teamAI1"
	self.jacket.dodge = presets.dodge.athletic
	self.jacket.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_bonnie(presets)
	self.bonnie = {}
	self.bonnie.always_face_enemy = true
	self.bonnie.no_run_start = true
	self.bonnie.no_run_stop = true
	self.bonnie.damage = presets.gang_member_damage
	self.bonnie.weapon = deep_clone(presets.weapon.gang_member)
	self.bonnie.weapon.weapons_of_choice = {
		primary = "wpn_fps_shot_b682_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.bonnie.detection = presets.detection.gang_member
	self.bonnie.move_speed = presets.move_speed.gang_member
	self.bonnie.dodge = presets.dodge.athletic
	self.bonnie.crouch_move = false
	self.bonnie.speech_prefix = "rb10"
	self.bonnie.weapon_voice = "3"
	self.bonnie.access = "teamAI1"
	self.bonnie.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_sokol(presets)
	self.sokol = {}
	self.sokol.always_face_enemy = true
	self.sokol.no_run_start = true
	self.sokol.no_run_stop = true
	self.sokol.damage = presets.gang_member_damage
	self.sokol.weapon = deep_clone(presets.weapon.gang_member)
	self.sokol.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_asval_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.sokol.detection = presets.detection.gang_member
	self.sokol.move_speed = presets.move_speed.gang_member
	self.sokol.crouch_move = false
	self.sokol.speech_prefix = "rb11"
	self.sokol.weapon_voice = "3"
	self.sokol.access = "teamAI1"
	self.sokol.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_dragon(presets)
	self.dragon = {}
	self.dragon.always_face_enemy = true
	self.dragon.no_run_start = true
	self.dragon.no_run_stop = true
	self.dragon.damage = presets.gang_member_damage
	self.dragon.weapon = deep_clone(presets.weapon.gang_member)
	self.dragon.weapon.weapons_of_choice = {
		primary = "wpn_fps_snp_wa2000_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.dragon.detection = presets.detection.gang_member
	self.dragon.move_speed = presets.move_speed.gang_member
	self.dragon.crouch_move = false
	self.dragon.speech_prefix = "rb12"
	self.dragon.weapon_voice = "3"
	self.dragon.access = "teamAI1"
	self.dragon.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_bodhi(presets)
	self.bodhi = {}
	self.bodhi.always_face_enemy = true
	self.bodhi.no_run_start = true
	self.bodhi.no_run_stop = true
	self.bodhi.damage = presets.gang_member_damage
	self.bodhi.weapon = deep_clone(presets.weapon.gang_member)
	self.bodhi.weapon.weapons_of_choice = {
		primary = "wpn_fps_snp_model70_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.bodhi.detection = presets.detection.gang_member
	self.bodhi.move_speed = presets.move_speed.gang_member
	self.bodhi.crouch_move = false
	self.bodhi.speech_prefix = "rb13"
	self.bodhi.weapon_voice = "3"
	self.bodhi.access = "teamAI1"
	self.bodhi.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_jimmy(presets)
	self.jimmy = {}
	self.jimmy.always_face_enemy = true
	self.jimmy.no_run_start = true
	self.jimmy.no_run_stop = true
	self.jimmy.damage = presets.gang_member_damage
	self.jimmy.weapon = deep_clone(presets.weapon.gang_member)
	self.jimmy.weapon.weapons_of_choice = {
		primary = "wpn_fps_sho_ben_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.jimmy.detection = presets.detection.gang_member
	self.jimmy.move_speed = presets.move_speed.gang_member
	self.jimmy.crouch_move = false
	self.jimmy.speech_prefix = "rb14"
	self.jimmy.weapon_voice = "3"
	self.jimmy.access = "teamAI1"
	self.jimmy.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_sydney(presets)
	self.sydney = {}
	self.sydney.always_face_enemy = true
	self.sydney.no_run_start = true
	self.sydney.no_run_stop = true
	self.sydney.damage = presets.gang_member_damage
	self.sydney.weapon = deep_clone(presets.weapon.gang_member)
	self.sydney.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_tecci_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.sydney.detection = presets.detection.gang_member
	self.sydney.move_speed = presets.move_speed.gang_member
	self.sydney.crouch_move = false
	self.sydney.speech_prefix = "rb15"
	self.sydney.weapon_voice = "3"
	self.sydney.access = "teamAI1"
	self.sydney.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_wild(presets)
	self.wild = {}
	self.wild.always_face_enemy = true
	self.wild.no_run_start = true
	self.wild.no_run_stop = true
	self.wild.damage = presets.gang_member_damage
	self.wild.weapon = deep_clone(presets.weapon.gang_member)
	self.wild.weapon.weapons_of_choice = {
		primary = "wpn_fps_sho_boot_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.wild.detection = presets.detection.gang_member
	self.wild.move_speed = presets.move_speed.gang_member
	self.wild.crouch_move = false
	self.wild.speech_prefix = "rb16"
	self.wild.weapon_voice = "3"
	self.wild.access = "teamAI1"
	self.wild.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_chico(presets)
	self.chico = {}
	self.chico.always_face_enemy = true
	self.chico.no_run_start = true
	self.chico.no_run_stop = true
	self.chico.damage = presets.gang_member_damage
	self.chico.weapon = deep_clone(presets.weapon.gang_member)
	self.chico.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_contraband_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.chico.detection = presets.detection.gang_member
	self.chico.move_speed = presets.move_speed.gang_member
	self.chico.crouch_move = false
	self.chico.speech_prefix = "rb17"
	self.chico.weapon_voice = "3"
	self.chico.access = "teamAI1"
	self.chico.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_init_max(presets)
	self.max = {}
	self.max.always_face_enemy = true
	self.max.no_run_start = true
	self.max.no_run_stop = true
	self.max.damage = presets.gang_member_damage
	self.max.weapon = deep_clone(presets.weapon.gang_member)
	self.max.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_akm_gold_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.max.detection = presets.detection.gang_member
	self.max.move_speed = presets.move_speed.gang_member
	self.max.crouch_move = false
	self.max.speech_prefix = "rb18"
	self.max.weapon_voice = "3"
	self.max.access = "teamAI1"
	self.max.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end

function CharacterTweakData:_presets(tweak_data)
	local presets = {}
	presets.hurt_severities = {}
	presets.hurt_severities.no_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = false
	}
	presets.hurt_severities.titan = deep_clone(presets.hurt_severities.no_hurts)
	presets.hurt_severities.titan.bullet = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.2,
					light = 0.75,
					explode = 0.05,
					heavy = 0
				},
				{
					health_limit = 0.6,
					light = 0.7,
					explode = 0.15,
					heavy = 0
				},
				{
					health_limit = 0.9,
					light = 0.6,
					explode = 0.2,
					heavy = 0
				},
				{
					light = 0.5,
					explode = 0.25,
					heavy = 0
				}
			}
	}
	presets.hurt_severities.titan.fire = {
			health_reference = "current",
			zones = {
				{fire = 1}
			}
	}
	presets.hurt_severities.titan.explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.2,
					light = 0.75,
					explode = 0.05,
					heavy = 0
				},
				{
					health_limit = 0.6,
					light = 0.7,
					explode = 0.3,
					heavy = 0
				},
				{
					health_limit = 0.9,
					light = 0.6,
					explode = 0.4,
					heavy = 0
				},
				{
					light = 0.5,
					explode = 0.5,
					heavy = 0
				}
			}
	}
	presets.hurt_severities.captain = deep_clone(presets.hurt_severities.titan)
	presets.hurt_severities.no_hurts_no_tase = deep_clone(presets.hurt_severities.no_hurts)
	presets.hurt_severities.no_hurts_no_tase.tase = false
	presets.hurt_severities.only_light_hurt = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.only_light_hurt_and_fire = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.light_hurt_fire_poison = deep_clone(presets.hurt_severities.only_light_hurt_and_fire)
	presets.hurt_severities.light_hurt_fire_poison.poison = {
		health_reference = 1,
		zones = {
			{poison = 1}
		}
	}
	presets.hurt_severities.elite = deep_clone(presets.hurt_severities.light_hurt_fire_poison)
	presets.hurt_severities.elite.fire = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.hurt_severities.elite.melee = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.3,
				none = 0.3,
				light = 0.7,
				moderate = 0,
				heavy = 0
			},
			{
				health_limit = 0.8,
				light = 1,
				moderate = 0,
				heavy = 0
			},
			{
				health_limit = 0.9,
				light = 0.8,
				moderate = 0.2,
				heavy = 0
			},
			{
				light = 0,
				moderate = 9,
				heavy = 0
			}
		}
	}
	presets.hurt_severities.only_explosion_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.only_fire_and_poison_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{poison = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.base = {
		bullet = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.2,
					light = 0.7,
					moderate = 0.05,
					heavy = 0.05
				},
				{
					health_limit = 0.6,
					light = 0.4,
					moderate = 0.4,
					heavy = 0.2
				},
				{
					health_limit = 0.9,
					light = 0.2,
					moderate = 0.2,
					heavy = 0.6
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.2,
					none = 0.6,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					heavy = 0.6,
					explode = 0.4
				},
				{heavy = 0.2, explode = 0.8}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.3,
					light = 0.7,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.8,
					light = 1,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.9,
					light = 0.6,
					moderate = 0.2,
					heavy = 0.2
				},
				{
					light = 0,
					moderate = 0,
					heavy = 9
				}
			}
		},
		fire = {
			health_reference = "current",
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = "current",
			zones = {
				{none = 0, poison = 1}
			}
		}
	}
	presets.hurt_severities.spooc = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.spooc.melee = {
		health_reference = 1,
		zones = {
			{light = 1}
		}
	}
	presets.hurt_severities.boom = deep_clone(presets.hurt_severities.elite)
	presets.hurt_severities.boom.fire = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.hurt_severities.boom.explosion = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.hurt_severities.base_no_poison = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.base_no_poison.poison = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.base = {}
	presets.base.HEALTH_INIT = 2.5
	presets.base.headshot_dmg_mul = 2
	presets.base.use_animation_on_fire_damage = true
	presets.base.SPEED_WALK = {
		ntl = 120,
		hos = 180,
		cbt = 160,
		pnc = 160
	}
	presets.base.SPEED_RUN = 370
	presets.base.crouch_move = true
	presets.base.shooting_death = true
	presets.base.suspicious = true
	presets.base.surrender_break_time = {20, 30}
	presets.base.submission_max = {45, 60}
	presets.base.submission_intimidate = 15
	presets.base.speech_prefix = "po"
	presets.base.speech_prefix_count = 1
	presets.base.rescue_hostages = true
	presets.base.use_radio = self._default_chatter
	presets.base.dodge = nil
	presets.base.challenges = {type = "law"}
	presets.base.calls_in = true
	presets.base.spotlight_important = false
	presets.base.follower = true
	presets.base.experience = {}
	presets.base.experience.cable_tie = "tie_swat"
	presets.base.damage = {}
	presets.base.damage.hurt_severity = presets.hurt_severities.base
	presets.base.damage.death_severity = 0.5
	presets.base.damage.explosion_damage_mul = 1
	presets.base.critical_hits = {
		damage_mul = 2
	}
	presets.base.damage.tased_response = {
		light = {tased_time = 5, down_time = 5},
		heavy = {tased_time = 5, down_time = 10}
	}
	presets.gang_member_damage = {}
	presets.gang_member_damage.HEALTH_INIT = 25
	presets.gang_member_damage.no_run_start = true
	presets.gang_member_damage.no_run_stop = true
	presets.gang_member_damage.headshot_dmg_mul = 1
	presets.gang_member_damage.LIVES_INIT = 4
	presets.gang_member_damage.explosion_damage_mul = 0
	presets.gang_member_damage.REGENERATE_TIME = 2
	presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.25
	presets.gang_member_damage.DOWNED_TIME = tweak_data.player.damage.DOWNED_TIME
	presets.gang_member_damage.TASED_TIME = tweak_data.player.damage.TASED_TIME
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 25
	presets.gang_member_damage.ARRESTED_TIME = tweak_data.player.damage.ARRESTED_TIME
	presets.gang_member_damage.INCAPACITATED_TIME = tweak_data.player.damage.INCAPACITATED_TIME
	presets.gang_member_damage.hurt_severity = deep_clone(presets.hurt_severities.no_hurts)
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.6
	presets.gang_member_damage.respawn_time_penalty = 0
	presets.gang_member_damage.base_respawn_time_penalty = 5
	presets.weapon = {}
	presets.weapon.normal = {
		is_pistol = {},
		is_revolver = {},
		is_rifle = {},
		is_lmg = {},
		is_shotgun_pump = {},
		is_shotgun_mag = {},
		mossberg = {},
		is_smg = {},
		mp9 = {},
		mac11 = {},
		is_revolver = {},
		akimbo_pistol = {},
		mini = {}
	}
	presets.weapon.normal.is_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_pistol.focus_delay = 10
	presets.weapon.normal.is_pistol.focus_dis = 200
	presets.weapon.normal.is_pistol.spread = 20
	presets.weapon.normal.is_pistol.miss_dis = 50
	presets.weapon.normal.is_pistol.RELOAD_SPEED = 1
	presets.weapon.normal.is_pistol.melee_speed = 1
	presets.weapon.normal.is_pistol.melee_dmg = 4
	presets.weapon.normal.is_pistol.melee_retry_delay = {0, 0}
	presets.weapon.normal.is_pistol.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.85},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.akimbo_pistol = presets.weapon.normal.is_pistol
	presets.weapon.normal.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_rifle.focus_delay = 10
	presets.weapon.normal.is_rifle.focus_dis = 200
	presets.weapon.normal.is_rifle.spread = 20
	presets.weapon.normal.is_rifle.miss_dis = 40
	presets.weapon.normal.is_rifle.RELOAD_SPEED = 1
	presets.weapon.normal.is_rifle.melee_speed = 1
	presets.weapon.normal.is_rifle.melee_dmg = 4
	presets.weapon.normal.is_rifle.tase_distance = 1400
	presets.weapon.normal.is_rifle.aim_delay_tase = {0, 0.5}
	presets.weapon.normal.is_rifle.tase_sphere_cast_radius = 30
	presets.weapon.normal.is_rifle.melee_retry_delay = {0, 0}
	presets.weapon.normal.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_rifle.autofire_rounds = {6, 11}
	presets.weapon.normal.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.normal.is_bullpup = presets.weapon.normal.is_rifle
	presets.weapon.normal.is_shotgun_pump.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_shotgun_pump.focus_delay = 10
	presets.weapon.normal.is_shotgun_pump.focus_dis = 200
	presets.weapon.normal.is_shotgun_pump.spread = 15
	presets.weapon.normal.is_shotgun_pump.miss_dis = 20
	presets.weapon.normal.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.normal.is_shotgun_pump.melee_speed = 1
	presets.weapon.normal.is_shotgun_pump.melee_dmg = 4
	presets.weapon.normal.is_shotgun_pump.melee_retry_delay = {0, 0}
	presets.weapon.normal.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.95,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 0.9,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 0.85,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 0.8,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.9},
			dmg_mul = 0.75,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 0.7,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 0.65,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 0.6,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 0.55,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.45,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 0.4,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.35,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.3,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_smg.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_smg.focus_delay = 10
	presets.weapon.normal.is_smg.focus_dis = 200
	presets.weapon.normal.is_smg.spread = 15
	presets.weapon.normal.is_smg.miss_dis = 20
	presets.weapon.normal.is_smg.RELOAD_SPEED = 1
	presets.weapon.normal.is_smg.melee_speed = 1
	presets.weapon.normal.is_smg.melee_dmg = 4
	presets.weapon.normal.is_smg.melee_retry_delay = {0, 0}
	presets.weapon.normal.is_smg.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_smg.autofire_rounds = {6, 11}
	presets.weapon.normal.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 1,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.normal.mp9.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mp9.focus_delay = 10
	presets.weapon.normal.mp9.focus_dis = 200
	presets.weapon.normal.mp9.spread = 30
	presets.weapon.normal.mp9.miss_dis = 15
	presets.weapon.normal.mp9.RELOAD_SPEED = 1
	presets.weapon.normal.mp9.melee_speed = nil
	presets.weapon.normal.mp9.melee_dmg = nil
	presets.weapon.normal.mp9.melee_retry_delay = nil
	presets.weapon.normal.mp9.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	presets.weapon.normal.mp9.autofire_rounds = {6, 11}
	presets.weapon.normal.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.5, 0.75},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 1,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {1.2, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.normal.mac11.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mac11.focus_delay = 10
	presets.weapon.normal.mac11.focus_dis = 200
	presets.weapon.normal.mac11.spread = 20
	presets.weapon.normal.mac11.miss_dis = 25
	presets.weapon.normal.mac11.RELOAD_SPEED = 1
	presets.weapon.normal.mac11.melee_speed = 1
	presets.weapon.normal.mac11.melee_dmg = 4
	presets.weapon.normal.mac11.melee_retry_delay = {0, 0}
	presets.weapon.normal.mac11.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.mac11.autofire_rounds = {6, 11}
	presets.weapon.normal.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 0.65},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.1, 0.85},
			dmg_mul = 1,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.05, 0.4},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.2},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		}
	}
	presets.weapon.normal.is_revolver.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_revolver.focus_delay = 10
	presets.weapon.normal.is_revolver.focus_dis = 200
	presets.weapon.normal.is_revolver.spread = 20
	presets.weapon.normal.is_revolver.miss_dis = 50
	presets.weapon.normal.is_revolver.RELOAD_SPEED = 1
	presets.weapon.normal.is_revolver.melee_speed = 1
	presets.weapon.normal.is_revolver.melee_dmg = 4
	presets.weapon.normal.is_revolver.melee_retry_delay = {0, 0}
	presets.weapon.normal.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 1,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_lmg = deep_clone(presets.weapon.normal.is_rifle)
	presets.weapon.normal.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.normal.is_lmg.autofire_rounds = {20, 40}
	presets.weapon.normal.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 1,
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
			acc = {0.5, 0.75},
			dmg_mul = 1,
			recoil = {0.5, 0.8},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 1,
			recoil = {1, 2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.normal.mossberg = presets.weapon.normal.is_shotgun_pump
	presets.weapon.normal.is_shotgun_mag = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.normal.is_shotgun_mag.RELOAD_SPEED = 0.25
	presets.weapon.normal.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.normal.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.95,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 0.9,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 0.85,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 900,
			acc = {0.4, 0.9},
			dmg_mul = 0.75,
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
			acc = {0.4, 0.75},
			dmg_mul = 0.7,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 0.65,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 0.55,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 0.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.45,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 0.4,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.35,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
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
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.normal.mini = {}
	presets.weapon.normal.mini.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mini.focus_delay = 10
	presets.weapon.normal.mini.focus_dis = 200
	presets.weapon.normal.mini.spread = 20
	presets.weapon.normal.mini.miss_dis = 40
	presets.weapon.normal.mini.RELOAD_SPEED = 0.25
	presets.weapon.normal.mini.melee_speed = 1
	presets.weapon.normal.mini.melee_dmg = 4
	presets.weapon.normal.mini.melee_retry_delay = {0, 0}
	presets.weapon.normal.mini.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	presets.weapon.normal.mini.autofire_rounds = {20, 40}
	presets.weapon.normal.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
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
			dmg_mul = 1,
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
			dmg_mul = 1,
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
			dmg_mul = 1,
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
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.good = {
		is_pistol = {},
		is_revolver = {},
		is_rifle = {},
		is_lmg = {},
		is_shotgun_pump = {},
		is_shotgun_mag = {},
		mossberg = {},
		is_smg = {},
		mp9 = {},
		mac11 = {},
		akimbo_pistol = {},
		mini = {}
	}
	presets.weapon.good.is_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_pistol.focus_delay = 2
	presets.weapon.good.is_pistol.focus_dis = 200
	presets.weapon.good.is_pistol.spread = 20
	presets.weapon.good.is_pistol.miss_dis = 50
	presets.weapon.good.is_pistol.RELOAD_SPEED = 1
	presets.weapon.good.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.good.is_pistol.melee_dmg = 8
	presets.weapon.good.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.good.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.good.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.akimbo_pistol = presets.weapon.good.is_pistol
	presets.weapon.good.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_rifle.focus_delay = 3
	presets.weapon.good.is_rifle.focus_dis = 200
	presets.weapon.good.is_rifle.spread = 20
	presets.weapon.good.is_rifle.miss_dis = 40
	presets.weapon.good.is_rifle.RELOAD_SPEED = 1
	presets.weapon.good.is_rifle.melee_speed = 1
	presets.weapon.good.is_rifle.melee_dmg = 8
	presets.weapon.good.is_rifle.tase_distance = 1400
	presets.weapon.good.is_rifle.aim_delay_tase = {0, 0.5}
	presets.weapon.good.is_rifle.tase_sphere_cast_radius = 30
	presets.weapon.good.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.good.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.good.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 2,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.good.is_bullpup = presets.weapon.good.is_rifle
	presets.weapon.good.is_shotgun_pump.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_shotgun_pump.focus_delay = 5
	presets.weapon.good.is_shotgun_pump.focus_dis = 200
	presets.weapon.good.is_shotgun_pump.spread = 15
	presets.weapon.good.is_shotgun_pump.miss_dis = 20
	presets.weapon.good.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.good.is_shotgun_pump.melee_speed = 1
	presets.weapon.good.is_shotgun_pump.melee_dmg = 8
	presets.weapon.good.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.good.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 1.9,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 1.8,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 1.7,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 1.6,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.9},
			dmg_mul = 1.4,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.3,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.2,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.1,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.9,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 0.8,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.7,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.6,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.5,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_shotgun_mag.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_shotgun_mag.focus_delay = 5
	presets.weapon.good.is_shotgun_mag.focus_dis = 200
	presets.weapon.good.is_shotgun_mag.spread = 15
	presets.weapon.good.is_shotgun_mag.miss_dis = 20
	presets.weapon.good.is_shotgun_mag.RELOAD_SPEED = 0.25
	presets.weapon.good.is_shotgun_mag.melee_speed = 1
	presets.weapon.good.is_shotgun_mag.melee_dmg = 8
	presets.weapon.good.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.good.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.good.is_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 1.9,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 1.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 1.7,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 1.6,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.9},
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
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 1.4,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.2,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.1,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.9,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 0.8,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 0.7,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.5,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.good.is_smg.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_smg.focus_delay = 3
	presets.weapon.good.is_smg.focus_dis = 200
	presets.weapon.good.is_smg.spread = 20
	presets.weapon.good.is_smg.miss_dis = 40
	presets.weapon.good.is_smg.RELOAD_SPEED = 1
	presets.weapon.good.is_smg.melee_speed = presets.weapon.normal.is_smg.melee_speed
	presets.weapon.good.is_smg.melee_dmg = 8
	presets.weapon.good.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.good.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.good.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.good.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 2,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 2,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 1,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.good.mp9.aim_delay = {0.1, 0.1}
	presets.weapon.good.mp9.focus_delay = 10
	presets.weapon.good.mp9.focus_dis = 200
	presets.weapon.good.mp9.spread = 30
	presets.weapon.good.mp9.miss_dis = 15
	presets.weapon.good.mp9.RELOAD_SPEED = 1
	presets.weapon.good.mp9.melee_speed = nil
	presets.weapon.good.mp9.melee_dmg = nil
	presets.weapon.good.mp9.melee_retry_delay = nil
	presets.weapon.good.mp9.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	presets.weapon.good.mp9.autofire_rounds = {6, 11}
	presets.weapon.good.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 2,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.5, 0.75},
			dmg_mul = 2,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 2,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {1.2, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.good.mac11.aim_delay = {0.1, 0.1}
	presets.weapon.good.mac11.focus_delay = 3
	presets.weapon.good.mac11.focus_dis = 200
	presets.weapon.good.mac11.spread = 15
	presets.weapon.good.mac11.miss_dis = 10
	presets.weapon.good.mac11.RELOAD_SPEED = 1
	presets.weapon.good.mac11.melee_speed = presets.weapon.normal.mac11.melee_speed
	presets.weapon.good.mac11.melee_dmg = 8
	presets.weapon.good.mac11.melee_retry_delay = presets.weapon.normal.mac11.melee_retry_delay
	presets.weapon.good.mac11.range = presets.weapon.normal.mac11.range
	presets.weapon.good.mac11.autofire_rounds = presets.weapon.normal.mac11.autofire_rounds
	presets.weapon.good.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.3, 0.35},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.1, 0.7},
			dmg_mul = 2,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.55},
			dmg_mul = 2,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.05, 0.4},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.2},
			dmg_mul = 1,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_revolver.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_revolver.focus_delay = 10
	presets.weapon.good.is_revolver.focus_dis = 200
	presets.weapon.good.is_revolver.spread = 20
	presets.weapon.good.is_revolver.miss_dis = 50
	presets.weapon.good.is_revolver.RELOAD_SPEED = 1
	presets.weapon.good.is_revolver.melee_speed = 1
	presets.weapon.good.is_revolver.melee_dmg = 8
	presets.weapon.good.is_revolver.melee_retry_delay = {0, 0}
	presets.weapon.good.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_lmg = deep_clone(presets.weapon.good.is_rifle)
	presets.weapon.good.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.good.is_lmg.autofire_rounds = {20, 40}
	presets.weapon.good.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 2,
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
			acc = {0.5, 0.75},
			dmg_mul = 2,
			recoil = {0.5, 0.8},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 2,
			recoil = {1, 1},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 1,
			recoil = {1, 2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.good.mossberg = presets.weapon.good.is_shotgun_pump
	presets.weapon.good.mini = {}
	presets.weapon.good.mini.aim_delay = {0.1, 0.1}
	presets.weapon.good.mini.focus_delay = 3
	presets.weapon.good.mini.focus_dis = 200
	presets.weapon.good.mini.spread = 20
	presets.weapon.good.mini.miss_dis = 40
	presets.weapon.good.mini.RELOAD_SPEED = 0.25
	presets.weapon.good.mini.melee_speed = 1
	presets.weapon.good.mini.melee_dmg = 8
	presets.weapon.good.mini.melee_retry_delay = {0, 0}
	presets.weapon.good.mini.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	presets.weapon.good.mini.autofire_rounds = {20, 40}
	presets.weapon.good.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
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
			dmg_mul = 2,
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
			dmg_mul = 2,
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
			dmg_mul = 1,
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
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.expert = {
		is_pistol = {},
		is_revolver = {},
		is_rifle = {},
		is_lmg = {},
		is_shotgun_pump = {},
		is_shotgun_mag = {},
		mossberg = {},
		is_smg = {},
		mp9 = {},
		mac11 = {},
		akimbo_pistol = {},
		mini = {}
	}
	presets.weapon.expert.is_pistol.aim_delay = {0, 0.1}
	presets.weapon.expert.is_pistol.focus_delay = 1
	presets.weapon.expert.is_pistol.focus_dis = 300
	presets.weapon.expert.is_pistol.spread = 20
	presets.weapon.expert.is_pistol.miss_dis = 50
	presets.weapon.expert.is_pistol.RELOAD_SPEED = 1
	presets.weapon.expert.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.expert.is_pistol.melee_dmg = 10
	presets.weapon.expert.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.expert.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.expert.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 2.5,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 2.5,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 1,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.akimbo_pistol = presets.weapon.expert.is_pistol
	presets.weapon.expert.is_rifle.aim_delay = {0, 0.1}
	presets.weapon.expert.is_rifle.focus_delay = 2
	presets.weapon.expert.is_rifle.focus_dis = 300
	presets.weapon.expert.is_rifle.spread = 20
	presets.weapon.expert.is_rifle.miss_dis = 40
	presets.weapon.expert.is_rifle.RELOAD_SPEED = 1
	presets.weapon.expert.is_rifle.melee_speed = 1
	presets.weapon.expert.is_rifle.melee_dmg = 10
	presets.weapon.expert.is_rifle.tase_distance = 1400
	presets.weapon.expert.is_rifle.aim_delay_tase = {0, 0.5}
	presets.weapon.expert.is_rifle.tase_sphere_cast_radius = 30
	presets.weapon.expert.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.expert.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.expert.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.55, 0.95},
			dmg_mul = 2.5,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.525, 0.8},
			dmg_mul = 2.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 1,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.expert.is_bullpup = presets.weapon.expert.is_rifle
	presets.weapon.expert.is_shotgun_pump.aim_delay = {0, 0.1}
	presets.weapon.expert.is_shotgun_pump.focus_delay = 2
	presets.weapon.expert.is_shotgun_pump.focus_dis = 200
	presets.weapon.expert.is_shotgun_pump.spread = 15
	presets.weapon.expert.is_shotgun_pump.miss_dis = 20
	presets.weapon.expert.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.expert.is_shotgun_pump.melee_speed = 1
	presets.weapon.expert.is_shotgun_pump.melee_dmg = 10
	presets.weapon.expert.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.expert.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.25,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.75},
			dmg_mul = 2,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 1.875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 1.75,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.1, 0.55},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.1, 0.55},
			dmg_mul = 1.125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.875,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.75,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
         		recoil = {1.5, 2},
            		mode = {
                		1,
                		0,
                		0,
               			0
            		}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_shotgun_mag.aim_delay = {0, 0.1}
	presets.weapon.expert.is_shotgun_mag.focus_delay = 2
	presets.weapon.expert.is_shotgun_mag.focus_dis = 200
	presets.weapon.expert.is_shotgun_mag.spread = 15
	presets.weapon.expert.is_shotgun_mag.miss_dis = 20
	presets.weapon.expert.is_shotgun_mag.RELOAD_SPEED = 0.25
	presets.weapon.expert.is_shotgun_mag.melee_speed = 1
	presets.weapon.expert.is_shotgun_mag.melee_dmg = 10
	presets.weapon.expert.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.expert.is_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.expert.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.375,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.25,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.9},
			dmg_mul = 1.875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 1.75,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
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
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 1.125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 0.875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.75,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.expert.is_smg.aim_delay = {0, 0.1}
	presets.weapon.expert.is_smg.focus_delay = 1
	presets.weapon.expert.is_smg.focus_dis = 200
	presets.weapon.expert.is_smg.spread = 15
	presets.weapon.expert.is_smg.miss_dis = 10
	presets.weapon.expert.is_smg.RELOAD_SPEED = 1
	presets.weapon.expert.is_smg.melee_speed = presets.weapon.normal.is_smg.melee_speed
	presets.weapon.expert.is_smg.melee_dmg = 10
	presets.weapon.expert.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.expert.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.expert.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.expert.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 2.5,
			recoil = {0.1, 0.25},
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
			dmg_mul = 2.5,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 2.5,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 1,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 1,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.expert.mp9.aim_delay = {0, 0.1}
	presets.weapon.expert.mp9.focus_delay = 10
	presets.weapon.expert.mp9.focus_dis = 200
	presets.weapon.expert.mp9.spread = 30
	presets.weapon.expert.mp9.miss_dis = 15
	presets.weapon.expert.mp9.RELOAD_SPEED = 1
	presets.weapon.expert.mp9.melee_speed = nil
	presets.weapon.expert.mp9.melee_dmg = nil
	presets.weapon.expert.mp9.melee_retry_delay = nil
	presets.weapon.expert.mp9.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	presets.weapon.expert.mp9.autofire_rounds = {6, 11}
	presets.weapon.expert.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 2.5,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.5, 0.75},
			dmg_mul = 2.5,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 2.5,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {1.2, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.expert.mac11.aim_delay = {0, 0.1}
	presets.weapon.expert.mac11.focus_delay = 1
	presets.weapon.expert.mac11.focus_dis = 200
	presets.weapon.expert.mac11.spread = 15
	presets.weapon.expert.mac11.miss_dis = 10
	presets.weapon.expert.mac11.RELOAD_SPEED = 1
	presets.weapon.expert.mac11.melee_speed = presets.weapon.normal.mac11.melee_speed
	presets.weapon.expert.mac11.melee_dmg = 10
	presets.weapon.expert.mac11.melee_retry_delay = presets.weapon.normal.mac11.melee_retry_delay
	presets.weapon.expert.mac11.range = presets.weapon.normal.mac11.range
	presets.weapon.expert.mac11.autofire_rounds = presets.weapon.normal.mac11.autofire_rounds
	presets.weapon.expert.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.5, 0.6},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2.5,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.65},
			dmg_mul = 2.5,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.35, 0.55},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 1,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_revolver.aim_delay = {0, 0.1}
	presets.weapon.expert.is_revolver.focus_delay = 10
	presets.weapon.expert.is_revolver.focus_dis = 200
	presets.weapon.expert.is_revolver.spread = 20
	presets.weapon.expert.is_revolver.miss_dis = 50
	presets.weapon.expert.is_revolver.RELOAD_SPEED = 1
	presets.weapon.expert.is_revolver.melee_speed = 1
	presets.weapon.expert.is_revolver.melee_dmg = 10
	presets.weapon.expert.is_revolver.melee_retry_delay = {0, 0}
	presets.weapon.expert.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_lmg = deep_clone(presets.weapon.expert.is_rifle)
	presets.weapon.expert.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.expert.is_lmg.autofire_rounds = {20, 40}
	presets.weapon.expert.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 2.5,
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
			acc = {0.5, 0.75},
			dmg_mul = 2.5,
			recoil = {0.5, 0.8},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 2.5,
			recoil = {1, 1},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 1,
			recoil = {1, 2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.expert.mossberg = presets.weapon.expert.is_shotgun_pump
	presets.weapon.expert.mini = {}
	presets.weapon.expert.mini.aim_delay = {0, 0.1}
	presets.weapon.expert.mini.focus_delay = 2
	presets.weapon.expert.mini.focus_dis = 300
	presets.weapon.expert.mini.spread = 20
	presets.weapon.expert.mini.miss_dis = 40
	presets.weapon.expert.mini.RELOAD_SPEED = 0.25
	presets.weapon.expert.mini.melee_speed = 1
	presets.weapon.expert.mini.melee_dmg = 10
	presets.weapon.expert.mini.melee_retry_delay = {0, 0}
	presets.weapon.expert.mini.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	presets.weapon.expert.mini.autofire_rounds = {20, 40}
	presets.weapon.expert.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
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
			dmg_mul = 2.5,
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
			dmg_mul = 2.5,
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
			dmg_mul = 1,
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
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.sniper = {
		is_rifle = {}
	}
	presets.weapon.sniper.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.sniper.is_rifle.focus_delay = 7
	presets.weapon.sniper.is_rifle.focus_dis = 200
	presets.weapon.sniper.is_rifle.spread = 30
	presets.weapon.sniper.is_rifle.miss_dis = 250
	presets.weapon.sniper.is_rifle.RELOAD_SPEED = 1
	presets.weapon.sniper.is_rifle.melee_speed = presets.weapon.normal.is_rifle.melee_speed
	presets.weapon.sniper.is_rifle.melee_dmg = presets.weapon.normal.is_rifle.melee_dmg
	presets.weapon.sniper.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.sniper.is_rifle.range = {
		close = 15000,
		optimal = 15000,
		far = 15000
	}
	presets.weapon.sniper.is_rifle.use_laser = true
	presets.weapon.sniper.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 1,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.85},
			dmg_mul = 1,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.75},
			dmg_mul = 1,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sniper_good = deep_clone(presets.weapon.sniper)
	presets.weapon.sniper_good.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 0.95},
			dmg_mul = 2,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.95},
			dmg_mul = 2,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 2,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.85},
			dmg_mul = 1,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.75},
			dmg_mul = 1,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sniper_expert = deep_clone(presets.weapon.sniper)
	presets.weapon.sniper_expert.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 2.5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 2.5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 2.5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.6, 0.85},
			dmg_mul = 1,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.6, 0.75},
			dmg_mul = 1,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sniper_easy_wish = deep_clone(presets.weapon.sniper)
	presets.weapon.sniper_easy_wish.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 2.875,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.7, 1},
			dmg_mul = 2.625,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 2.625,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 2.625,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.6, 0.85},
			dmg_mul = 1.05,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sniper_deathwish = deep_clone(presets.weapon.sniper)
	presets.weapon.sniper_deathwish.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.6, 0.85},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.6, 0.75},
			dmg_mul = 1.25,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sniper_sm_wish = deep_clone(presets.weapon.sniper)
	presets.weapon.sniper_sm_wish.is_rifle.FALLOFF = {
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 3.4375,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.7, 1},
			dmg_mul = 3.4375,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.6, 0.85},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.6, 0.75},
			dmg_mul = 3.125,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.7},
			dmg_mul = 1.25,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish = {
		is_pistol = {},
		is_revolver = {},
		is_rifle = {},
		is_lmg = {},
		is_shotgun_pump = {},
		is_shotgun_mag = {},
		mossberg = {},
		is_smg = {},
		mp9 = {},
		mac11 = {},
		akimbo_pistol = {}
	}
	presets.weapon.deathwish.is_revolver.aim_delay = {0, 0}
	presets.weapon.deathwish.is_revolver.focus_delay = 10
	presets.weapon.deathwish.is_revolver.focus_dis = 200
	presets.weapon.deathwish.is_revolver.spread = 20
	presets.weapon.deathwish.is_revolver.miss_dis = 50
	presets.weapon.deathwish.is_revolver.RELOAD_SPEED = 1
	presets.weapon.deathwish.is_revolver.melee_speed = 1
	presets.weapon.deathwish.is_revolver.melee_dmg = 12
	presets.weapon.deathwish.is_revolver.melee_retry_delay = {0, 0}
	presets.weapon.deathwish.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.deathwish.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 3.125,
			recoil = {0.4, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.85},
			dmg_mul = 3.125,
			recoil = {0.4, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.75},
			dmg_mul = 3.125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 3.125,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_pistol.aim_delay = {0, 0}
	presets.weapon.deathwish.is_pistol.focus_delay = 0
	presets.weapon.deathwish.is_pistol.focus_dis = 200
	presets.weapon.deathwish.is_pistol.spread = 20
	presets.weapon.deathwish.is_pistol.miss_dis = 50
	presets.weapon.deathwish.is_pistol.RELOAD_SPEED = 1
	presets.weapon.deathwish.is_pistol.melee_speed = presets.weapon.expert.is_pistol.melee_speed
	presets.weapon.deathwish.is_pistol.melee_dmg = 12
	presets.weapon.deathwish.is_pistol.melee_retry_delay = presets.weapon.expert.is_pistol.melee_retry_delay
	presets.weapon.deathwish.is_pistol.range = {
		close = 2000,
		optimal = 3200,
		far = 5000
	}
	presets.weapon.deathwish.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 3.125,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.9, 0.95},
			dmg_mul = 3.125,
			recoil = {0.15, 0.3},
			mode = {
				0,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 3.125,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 3.125,
			recoil = {0.4, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.25,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_rifle.aim_delay = {0, 0}
	presets.weapon.deathwish.is_rifle.focus_delay = 0
	presets.weapon.deathwish.is_rifle.focus_dis = 200
	presets.weapon.deathwish.is_rifle.spread = 20
	presets.weapon.deathwish.is_rifle.miss_dis = 40
	presets.weapon.deathwish.is_rifle.RELOAD_SPEED = 1
	presets.weapon.deathwish.is_rifle.melee_speed = 1
	presets.weapon.deathwish.is_rifle.melee_dmg = 12
	presets.weapon.deathwish.is_rifle.tase_distance = 1400
	presets.weapon.deathwish.is_rifle.aim_delay_tase = {0, 0.5}
	presets.weapon.deathwish.is_rifle.tase_sphere_cast_radius = 30
	presets.weapon.deathwish.is_rifle.melee_retry_delay = presets.weapon.expert.is_rifle.melee_retry_delay
	presets.weapon.deathwish.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	presets.weapon.deathwish.is_rifle.autofire_rounds = {4, 9}
	presets.weapon.deathwish.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 3.125,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 3.125,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 3.125,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 3.125,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 1.25,
			recoil = {0.7, 1.1},
			mode = {
				0,
				3,
				3,
				1
			}
		}
	}
	presets.weapon.deathwish.is_bullpup = presets.weapon.deathwish.is_rifle
	presets.weapon.deathwish.is_shotgun_pump.aim_delay = {0, 0}
	presets.weapon.deathwish.is_shotgun_pump.focus_delay = 0
	presets.weapon.deathwish.is_shotgun_pump.focus_dis = 200
	presets.weapon.deathwish.is_shotgun_pump.spread = 15
	presets.weapon.deathwish.is_shotgun_pump.miss_dis = 20
	presets.weapon.deathwish.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.deathwish.is_shotgun_pump.melee_speed = 1
	presets.weapon.deathwish.is_shotgun_pump.melee_dmg = 12
	presets.weapon.deathwish.is_shotgun_pump.melee_retry_delay = presets.weapon.expert.is_shotgun_pump.melee_retry_delay
	presets.weapon.deathwish.is_shotgun_pump.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	presets.weapon.deathwish.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3.125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.96875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.8125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.65625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.5,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.34375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.1875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 2.03125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.71875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.5625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.1, 0.55},
			dmg_mul = 1.40625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 1.09375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.9375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.78125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.46875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.3125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.15625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_shotgun_mag.aim_delay = {0, 0}
	presets.weapon.deathwish.is_shotgun_mag.focus_delay = 0
	presets.weapon.deathwish.is_shotgun_mag.focus_dis = 200
	presets.weapon.deathwish.is_shotgun_mag.spread = 20
	presets.weapon.deathwish.is_shotgun_mag.miss_dis = 40
	presets.weapon.deathwish.is_shotgun_mag.RELOAD_SPEED = 0.25
	presets.weapon.deathwish.is_shotgun_mag.melee_speed = 1
	presets.weapon.deathwish.is_shotgun_mag.melee_dmg = 12
	presets.weapon.deathwish.is_shotgun_mag.melee_retry_delay = presets.weapon.expert.is_shotgun_pump.melee_retry_delay
	presets.weapon.deathwish.is_shotgun_mag.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	presets.weapon.deathwish.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.deathwish.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3.125,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.96875,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.8125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.65625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.34375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.1875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 2.03125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.71875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.5625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 1.40625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 1.09375,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.9375,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.78125,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.46875,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.3125,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.15625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.deathwish.is_smg.aim_delay = {0, 0}
	presets.weapon.deathwish.is_smg.focus_delay = 0
	presets.weapon.deathwish.is_smg.focus_dis = 200
	presets.weapon.deathwish.is_smg.spread = 15
	presets.weapon.deathwish.is_smg.miss_dis = 10
	presets.weapon.deathwish.is_smg.RELOAD_SPEED = 1
	presets.weapon.deathwish.is_smg.melee_speed = presets.weapon.expert.is_smg.melee_speed
	presets.weapon.deathwish.is_smg.melee_dmg = 12
	presets.weapon.deathwish.is_smg.melee_retry_delay = presets.weapon.expert.is_smg.melee_retry_delay
	presets.weapon.deathwish.is_smg.range = {
		close = 2000,
		optimal = 3200,
		far = 6000
	}
	presets.weapon.deathwish.is_smg.autofire_rounds = {8, 16}
	presets.weapon.deathwish.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 3.125,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 3.125,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.65},
			dmg_mul = 3.125,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				3
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 3.125,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 1.25,
			recoil = {0.5, 1.5},
			mode = {
				1,
				6,
				2,
				0
			}
		}
	}
	presets.weapon.deathwish.mp9.aim_delay = {0, 0}
	presets.weapon.deathwish.mp9.focus_delay = 8
	presets.weapon.deathwish.mp9.focus_dis = 200
	presets.weapon.deathwish.mp9.spread = 30
	presets.weapon.deathwish.mp9.miss_dis = 15
	presets.weapon.deathwish.mp9.RELOAD_SPEED = 1
	presets.weapon.deathwish.mp9.melee_speed = nil
	presets.weapon.deathwish.mp9.melee_dmg = nil
	presets.weapon.deathwish.mp9.melee_retry_delay = nil
	presets.weapon.deathwish.mp9.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	presets.weapon.deathwish.mp9.autofire_rounds = {6, 11}
	presets.weapon.deathwish.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.9, 0.95},
			dmg_mul = 3.125,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.8, 0.8},
			dmg_mul = 3.125,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.125,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 3.125,
			recoil = {1, 1.2},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 1.25,
			recoil = {1.2, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.deathwish.mac11.aim_delay = {0, 0}
	presets.weapon.deathwish.mac11.focus_delay = 0
	presets.weapon.deathwish.mac11.focus_dis = 200
	presets.weapon.deathwish.mac11.spread = 15
	presets.weapon.deathwish.mac11.miss_dis = 10
	presets.weapon.deathwish.mac11.RELOAD_SPEED = 1
	presets.weapon.deathwish.mac11.melee_speed = presets.weapon.expert.mac11.melee_speed
	presets.weapon.deathwish.mac11.melee_dmg = 12
	presets.weapon.deathwish.mac11.melee_retry_delay = presets.weapon.expert.mac11.melee_retry_delay
	presets.weapon.deathwish.mac11.range = {
		close = 2000,
		optimal = 2700,
		far = 6000
	}
	presets.weapon.deathwish.mac11.autofire_rounds = {20, 30}
	presets.weapon.deathwish.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.9},
			dmg_mul = 3.125,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				3
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 3.125,
			recoil = {0.3, 0.4},
			mode = {
				0,
				1,
				3,
				3
			}
		},
		{
			r = 1000,
			acc = {0.625, 0.625},
			dmg_mul = 3.125,
			recoil = {0.3, 0.4},
			mode = {
				2,
				1,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 3.125,
			recoil = {0.65, 8},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.akimbo_pistol = presets.weapon.deathwish.is_pistol
	presets.weapon.deathwish.is_lmg = deep_clone(presets.weapon.deathwish.is_rifle)
	presets.weapon.deathwish.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.deathwish.is_lmg.aim_delay = {0, 0}
	presets.weapon.deathwish.is_lmg.focus_delay = 0
	presets.weapon.deathwish.is_lmg.autofire_rounds = {20, 40}
	presets.weapon.deathwish.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 3.125,
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
			acc = {0.5, 0.75},
			dmg_mul = 3.125,
			recoil = {0.5, 0.8},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 3.125,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 3.125,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 1.25,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.deathwish.mossberg = presets.weapon.deathwish.is_shotgun_pump
	presets.weapon.easy_wish = deep_clone(presets.weapon.expert)
	presets.weapon.easy_wish.is_bullpup = presets.weapon.easy_wish.is_rifle
	presets.weapon.easy_wish.is_shotgun_pump.melee_dmg = 10
	presets.weapon.easy_wish.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.73125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.5875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.44375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.3,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.15625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.0125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.86875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.725,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.58125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.3125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.1, 0.55},
			dmg_mul = 1.18125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 1.05,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.91875,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.75,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.375,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.125,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2.73125,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 2.5875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.44375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.15625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.0125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 1.86875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 1.725,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.58125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.3125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 1.18125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1.05,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 0.91875,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.75,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.5,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.375,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.125,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_pistol.melee_dmg = 10
	presets.weapon.easy_wish.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 2.875,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 2.875,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.65},
			dmg_mul = 2.625,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 2.625,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1.05,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.easy_wish.akimbo_pistol.melee_dmg = 10
	presets.weapon.easy_wish.akimbo_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 2.875,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 2.875,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.65},
			dmg_mul = 2.625,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 2.625,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1.05,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.easy_wish.mac11.melee_dmg = 10
	presets.weapon.easy_wish.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.5, 0.6},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2.875,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.65},
			dmg_mul = 2.875,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 1800,
			acc = {0.3, 0.65},
			dmg_mul = 2.625,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.35, 0.55},
			dmg_mul = 2.625,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 1.05,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_revolver.melee_dmg = 10
	presets.weapon.easy_wish.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2.875,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2.875,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.375, 0.55},
			dmg_mul = 2.625,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 2.625,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1.05,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_rifle.melee_dmg = 10
	presets.weapon.easy_wish.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.55, 0.95},
			dmg_mul = 2.875,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.525, 0.8},
			dmg_mul = 2.875,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.525, 0.8},
			dmg_mul = 2.625,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 2.625,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 1.05,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_smg.melee_dmg = 10
	presets.weapon.easy_wish.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 2.875,
			recoil = {0.1, 0.25},
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
			dmg_mul = 2.875,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 2.875,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.65},
			dmg_mul = 2.625,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 2.625,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 1.05,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.easy_wish.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 2.875,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 700,
			acc = {0.5, 0.75},
			dmg_mul = 2.875,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 2.875,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1800,
			acc = {0.45, 0.65},
			dmg_mul = 2.625,
			recoil = {0.3, 0.55},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 2.625,
			recoil = {1, 1.2},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1.05,
			recoil = {1.2, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.easy_wish.is_lmg.melee_dmg = 10
	presets.weapon.easy_wish.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 2.875,
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
			acc = {0.5, 0.75},
			dmg_mul = 2.875,
			recoil = {0.5, 0.8},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 2.875,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 1800,
			acc = {0.3, 0.6},
			dmg_mul = 2.625,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 2.625,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 1.05,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.easy_wish.mini.melee_dmg = 10
	presets.weapon.easy_wish.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2.875,
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
			dmg_mul = 2.875,
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
			dmg_mul = 2.875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.6},
			dmg_mul = 2.625,
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
			dmg_mul = 2.625,
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
			dmg_mul = 1.05,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	presets.weapon.sm_wish = deep_clone(presets.weapon.deathwish)
	presets.weapon.sm_wish.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 3.4375,
			recoil = {0.4, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.85},
			dmg_mul = 3.4375,
			recoil = {0.4, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.75},
			dmg_mul = 3.4375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.5, 0.75},
			dmg_mul = 3.4375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 3.125,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 3.125,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.1, 0.35},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sm_wish.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 3.4375,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.9, 0.95},
			dmg_mul = 3.4375,
			recoil = {0.15, 0.3},
			mode = {
				0,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 3.4375,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1800,
			acc = {0.7, 0.8},
			dmg_mul = 3.4375,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 3.125,
			recoil = {0.4, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.125,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.2, 0.65},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sm_wish.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 3.4375,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 3.4375,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1800,
			acc = {0.7, 0.9},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.55},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 3.125,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 3.125,
			recoil = {0.7, 1.1},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 4000,
			acc = {0.25, 0.7},
			dmg_mul = 1.25,
			recoil = {1, 2},
			mode = {
				0,
				3,
				3,
				1
			}
		}
	}
	presets.weapon.sm_wish.is_bullpup = presets.weapon.sm_wish.is_rifle
	presets.weapon.sm_wish.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3.4375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 3.265625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 3.09375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.921875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.75,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.578125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.40625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 2.234375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 2.0625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.890625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.5625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.1, 0.55},
			dmg_mul = 1.40625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.1, 0.55},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 1.09375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.9375,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.78125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.46875,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.3125,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.15625,
			recoil = {1, 1.5},
			mode = {
				1,
				1,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.sm_wish.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3.4375,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 3.265625,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 600,
			acc = {0.4, 0.9},
			dmg_mul = 3.09375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 2.921875,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.75,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 900,
			acc = {0.4, 0.75},
			dmg_mul = 2.578125,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 2.40625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.75},
			dmg_mul = 2.234375,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.75},
			dmg_mul = 2.0625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 1.890625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.75},
			dmg_mul = 1.5625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 1.40625,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 1700,
			acc = {0.1, 0.55},
			dmg_mul = 1.09375,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1800,
			acc = {0.1, 0.55},
			dmg_mul = 0.9375,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 1900,
			acc = {0.1, 0.55},
			dmg_mul = 0.78125,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 0.625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.46875,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.3125,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.15625,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2400,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.sm_wish.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 3.4375,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 3.4375,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.65},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				3
			}
		},
		{
			r = 1800,
			acc = {0.65, 0.65},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				3
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 3.125,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 3.125,
			recoil = {0.5, 1.5},
			mode = {
				1,
				6,
				2,
				0
			}
		},
		{
			r = 4000,
			acc = {0.3, 0.6},
			dmg_mul = 1.25,
			recoil = {1, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.sm_wish.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.9, 0.95},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 700,
			acc = {0.8, 0.8},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1800,
			acc = {0.6, 0.65},
			dmg_mul = 3.4375,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 3.125,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 3.125,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		},
		{
			r = 4000,
			acc = {0.1, 0.25},
			dmg_mul = 1.25,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	presets.weapon.sm_wish.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.9},
			dmg_mul = 3.4375,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				3
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 3.4375,
			recoil = {0.3, 0.4},
			mode = {
				0,
				1,
				3,
				3
			}
		},
		{
			r = 1000,
			acc = {0.625, 0.625},
			dmg_mul = 3.4375,
			recoil = {0.3, 0.4},
			mode = {
				2,
				1,
				3,
				1
			}
		},
		{
			r = 1800,
			acc = {0.625, 0.625},
			dmg_mul = 3.4375,
			recoil = {0.3, 0.4},
			mode = {
				2,
				1,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 3.125,
			recoil = {0.65, 8},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.55},
			dmg_mul = 3.125,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.sm_wish.akimbo_pistol = deep_clone(presets.weapon.sm_wish.is_pistol)
	presets.weapon.sm_wish.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 3.4375,
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
			acc = {0.5, 0.75},
			dmg_mul = 3.4375,
			recoil = {0.5, 0.8},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 3.4375,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 1800,
			acc = {0.3, 0.6},
			dmg_mul = 3.4375,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 3.125,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 3.125,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 4000,
			acc = {0.15, 0.5},
			dmg_mul = 1.25,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.gang_member = {
		is_pistol = {},
		is_revolver = {},
		is_rifle = {},
		is_lmg = {},
		is_shotgun_pump = {},
		mossberg = {},
		is_smg = {},
		mac11 = {},
		rifle = {},
		akimbo_pistol = {},
		is_shotgun_mag = {},
	}
	presets.weapon.gang_member.is_pistol.aim_delay = {0, 0}
	presets.weapon.gang_member.is_pistol.focus_delay = 0
	presets.weapon.gang_member.is_pistol.focus_dis = 200
	presets.weapon.gang_member.is_pistol.spread = 25
	presets.weapon.gang_member.is_pistol.miss_dis = 20
	presets.weapon.gang_member.is_pistol.RELOAD_SPEED = 1.5
	presets.weapon.gang_member.is_pistol.melee_speed = 3
	presets.weapon.gang_member.is_pistol.melee_dmg = 3
	presets.weapon.gang_member.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 5,
			recoil = {0.25, 0.45},
			mode = {
				0.1,
				0.3,
				4,
				7
			}
		},
		{
			r = 10000,
			acc = {1, 1},
			dmg_mul = 2.5,
			recoil = {2, 3},
			mode = {
				0.1,
				0.3,
				4,
				7
			}
		}
	}
	presets.weapon.gang_member.is_rifle.aim_delay = {0, 0}
	presets.weapon.gang_member.is_rifle.focus_delay = 0
	presets.weapon.gang_member.is_rifle.focus_dis = 200
	presets.weapon.gang_member.is_rifle.spread = 20
	presets.weapon.gang_member.is_rifle.miss_dis = 40
	presets.weapon.gang_member.is_rifle.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_rifle.melee_speed = 1
	presets.weapon.gang_member.is_rifle.melee_dmg = 4
	presets.weapon.gang_member.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {0.9, 0.975},
			dmg_mul = 1.25,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.875, 0.95},
			dmg_mul = 1.25,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.9},
			dmg_mul = 1.25,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		}
	}
	presets.weapon.gang_member.is_bullpup = presets.weapon.gang_member.is_rifle
	presets.weapon.gang_member.is_shotgun_pump = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.gang_member.is_shotgun_pump.aim_delay = {0, 0}
	presets.weapon.gang_member.is_shotgun_pump.focus_delay = 0
	presets.weapon.gang_member.is_shotgun_pump.focus_dis = 200
	presets.weapon.gang_member.is_shotgun_pump.spread = 15
	presets.weapon.gang_member.is_shotgun_pump.miss_dis = 20
	presets.weapon.gang_member.is_shotgun_pump.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_pump.melee_speed = 1
	presets.weapon.gang_member.is_shotgun_pump.melee_dmg = 4
	presets.weapon.gang_member.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.gang_member.is_smg = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {0.9, 0.975},
			dmg_mul = 1.25,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.875, 0.95},
			dmg_mul = 1.25,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.9},
			dmg_mul = 1.25,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		}
	}
	presets.weapon.gang_member.is_revolver = presets.weapon.gang_member.is_pistol
	presets.weapon.gang_member.is_lmg = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {0.7, 0.9},
			dmg_mul = 1.25,
			recoil = {0, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.75},
			dmg_mul = 1.25,
			recoil = {0.1, 0.2},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.6},
			dmg_mul = 1.25,
			recoil = {0.4, 0.6},
			mode = {
				1,
				3,
				6,
				6
			}
		}
	}
	presets.weapon.gang_member.mossberg = deep_clone(presets.weapon.gang_member.is_shotgun_pump)
	presets.weapon.gang_member.mossberg.RELOAD_SPEED = 3
	presets.weapon.gang_member.mac11 = presets.weapon.gang_member.is_smg
	presets.weapon.gang_member.rifle = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.rifle.autofire_rounds = nil
	presets.weapon.gang_member.rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 1},
			dmg_mul = 1.25,
			recoil = {1, 1},
			mode = {
				1,
				1,
				1,
				1
			}
		},
		{
			r = 3000,
			acc = {0.9, 0.95},
			dmg_mul = 1.25,
			recoil = {1, 1},
			mode = {
				1,
				1,
				1,
				1
			}
		},
		{
			r = 10000,
			acc = {0.85, 0.9},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				1,
				1,
				1
			}
		}
	}
	presets.weapon.gang_member.akimbo_pistol = presets.weapon.gang_member.is_pistol
	presets.weapon.gang_member.is_shotgun_mag = deep_clone(presets.weapon.normal.is_shotgun_mag)
	presets.weapon.gang_member.is_shotgun_mag.aim_delay = {0, 0}
	presets.weapon.gang_member.is_shotgun_mag.focus_delay = 0
	presets.weapon.gang_member.is_shotgun_mag.focus_dis = 200
	presets.weapon.gang_member.is_shotgun_mag.spread = 15
	presets.weapon.gang_member.is_shotgun_mag.miss_dis = 20
	presets.weapon.gang_member.is_shotgun_mag.melee_speed = 1
	presets.weapon.gang_member.is_shotgun_mag.melee_dmg = 4
	presets.weapon.gang_member.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_mag.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.gang_member.is_sniper = deep_clone(presets.weapon.gang_member.rifle)
	presets.detection = {}
	presets.detection.normal = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.normal.idle.dis_max = 10000
	presets.detection.normal.idle.angle_max = 120
	presets.detection.normal.idle.delay = {0, 0}
	presets.detection.normal.idle.use_uncover_range = true
	presets.detection.normal.combat.dis_max = 10000
	presets.detection.normal.combat.angle_max = 120
	presets.detection.normal.combat.delay = {0, 0}
	presets.detection.normal.combat.use_uncover_range = true
	presets.detection.normal.recon.dis_max = 10000
	presets.detection.normal.recon.angle_max = 120
	presets.detection.normal.recon.delay = {0, 0}
	presets.detection.normal.recon.use_uncover_range = true
	presets.detection.normal.guard.dis_max = 10000
	presets.detection.normal.guard.angle_max = 120
	presets.detection.normal.guard.delay = {0, 0}
	presets.detection.normal.ntl.dis_max = 4000
	presets.detection.normal.ntl.angle_max = 60
	presets.detection.normal.ntl.delay = {0.2, 2}
	presets.detection.guard = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.guard.idle.dis_max = 10000
	presets.detection.guard.idle.angle_max = 120
	presets.detection.guard.idle.delay = {0, 0}
	presets.detection.guard.idle.use_uncover_range = true
	presets.detection.guard.combat.dis_max = 10000
	presets.detection.guard.combat.angle_max = 120
	presets.detection.guard.combat.delay = {0, 0}
	presets.detection.guard.combat.use_uncover_range = true
	presets.detection.guard.recon.dis_max = 10000
	presets.detection.guard.recon.angle_max = 120
	presets.detection.guard.recon.delay = {0, 0}
	presets.detection.guard.recon.use_uncover_range = true
	presets.detection.guard.guard.dis_max = 10000
	presets.detection.guard.guard.angle_max = 120
	presets.detection.guard.guard.delay = {0, 0}
	presets.detection.guard.ntl = presets.detection.normal.ntl
	presets.detection.sniper = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.sniper.idle.dis_max = 10000
	presets.detection.sniper.idle.angle_max = 180
	presets.detection.sniper.idle.delay = {0.5, 1}
	presets.detection.sniper.idle.use_uncover_range = true
	presets.detection.sniper.combat.dis_max = 10000
	presets.detection.sniper.combat.angle_max = 120
	presets.detection.sniper.combat.delay = {0.5, 1}
	presets.detection.sniper.combat.use_uncover_range = true
	presets.detection.sniper.recon.dis_max = 10000
	presets.detection.sniper.recon.angle_max = 120
	presets.detection.sniper.recon.delay = {0.5, 1}
	presets.detection.sniper.recon.use_uncover_range = true
	presets.detection.sniper.guard.dis_max = 10000
	presets.detection.sniper.guard.angle_max = 150
	presets.detection.sniper.guard.delay = {0.3, 1}
	presets.detection.sniper.ntl = presets.detection.normal.ntl
	presets.detection.gang_member = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.gang_member.idle.dis_max = 10000
	presets.detection.gang_member.idle.angle_max = 240
	presets.detection.gang_member.idle.delay = {0, 0}
	presets.detection.gang_member.idle.use_uncover_range = true
	presets.detection.gang_member.combat.dis_max = 10000
	presets.detection.gang_member.combat.angle_max = 240
	presets.detection.gang_member.combat.delay = {0, 0}
	presets.detection.gang_member.combat.use_uncover_range = true
	presets.detection.gang_member.recon.dis_max = 10000
	presets.detection.gang_member.recon.angle_max = 240
	presets.detection.gang_member.recon.delay = {0, 0}
	presets.detection.gang_member.recon.use_uncover_range = true
	presets.detection.gang_member.guard.dis_max = 10000
	presets.detection.gang_member.guard.angle_max = 240
	presets.detection.gang_member.guard.delay = {0, 0}
	presets.detection.gang_member.ntl = presets.detection.normal.ntl
	presets.detection.civilian = {
		cbt = {},
		ntl = {}
	}
	presets.detection.civilian.cbt.dis_max = 700
	presets.detection.civilian.cbt.angle_max = 120
	presets.detection.civilian.cbt.delay = {0, 0}
	presets.detection.civilian.cbt.use_uncover_range = true
	presets.detection.civilian.ntl.dis_max = 2000
	presets.detection.civilian.ntl.angle_max = 60
	presets.detection.civilian.ntl.delay = {0.2, 3}
	presets.detection.blind = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.blind.idle.dis_max = 1
	presets.detection.blind.idle.angle_max = 0
	presets.detection.blind.idle.delay = {0, 0}
	presets.detection.blind.idle.use_uncover_range = false
	presets.detection.blind.combat.dis_max = 1
	presets.detection.blind.combat.angle_max = 0
	presets.detection.blind.combat.delay = {0, 0}
	presets.detection.blind.combat.use_uncover_range = false
	presets.detection.blind.recon.dis_max = 1
	presets.detection.blind.recon.angle_max = 0
	presets.detection.blind.recon.delay = {0, 0}
	presets.detection.blind.recon.use_uncover_range = false
	presets.detection.blind.guard.dis_max = 1
	presets.detection.blind.guard.angle_max = 0
	presets.detection.blind.guard.delay = {0, 0}
	presets.detection.blind.guard.use_uncover_range = false
	presets.detection.blind.ntl.dis_max = 1
	presets.detection.blind.ntl.angle_max = 0
	presets.detection.blind.ntl.delay = {0, 0}
	presets.detection.blind.ntl.use_uncover_range = false
	presets.dodge = {
		poor = {
			speed = 0.9,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.5,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				}
			}
		},
		average = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.35,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {4, 7},
					variations = {
						dive = {
							chance = 1,
							timeout = {5, 8}
						}
					}
				}
			}
		},
		heavy = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.75,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 9,
							timeout = {0, 7},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						}
					}
				},
				preemptive = {
					chance = 0.1,
					check_timeout = {1, 7},
					variations = {
						side_step = {
							chance = 1,
							timeout = {1, 7},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						}
					}
				},
				scared = {
					chance = 0.8,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						},
						dive = {
							chance = 2,
							timeout = {8, 10}
						}
					}
				}
			}
		},
		athletic = {
			speed = 1.3,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 3},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				preemptive = {
					chance = 0.35,
					check_timeout = {2, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 3,
							timeout = {3, 5}
						},
						dive = {
							chance = 1,
							timeout = {3, 5}
						}
					}
				}
			}
		},
		athletic_very_hard = {
			speed = 1.4,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 3},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				preemptive = {
					chance = 0.5,
					check_timeout = {2, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 3,
							timeout = {3, 5}
						},
						dive = {
							chance = 1,
							timeout = {3, 5}
						}
					}
				}
			}
		},
		heavy_very_hard = {
			speed = 1.1,
			occasions = {
				hit = {
					chance = 0.75,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 9,
							timeout = {0, 7},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						}
					}
				},
				preemptive = {
					chance = 0.25,
					check_timeout = {1, 7},
					variations = {
						side_step = {
							chance = 1,
							timeout = {1, 7},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						}
					}
				},
				scared = {
					chance = 0.8,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						},
						dive = {
							chance = 2,
							timeout = {8, 10}
						}
					}
				}
			}
		},
		athletic_overkill = {
			speed = 1.5,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 3},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				preemptive = {
					chance = 0.6,
					check_timeout = {2, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 3,
							timeout = {3, 5}
						},
						dive = {
							chance = 1,
							timeout = {3, 5}
						}
					}
				}
			}
		},
		ninja = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.7,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		},
		easy_wish = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.7,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		},
		elite = {
			speed = 1.7,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.8,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		},
		sm_wish = {
			speed = 1.8,
			occasions = {
				hit = {
					chance = 1,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		},
		veteran = {
			speed = 3,
			occasions = {
				hit = {
					chance = 5,
					check_timeout = {0, 0},
					variations = {
						dive = {
							chance = 3,
							timeout = {0, 0}
						}
					}
				},
				preemptive = {
					chance = 5,
					check_timeout = {0, 0},
					variations = {
						dive = {
							chance = 3,
							timeout = {0, 0}
						}
					}
				}
			}
		}
	}
	for preset_name, preset_data in pairs(presets.dodge) do
		for reason_name, reason_data in pairs(preset_data.occasions) do
			local total_w = 0
			for variation_name, variation_data in pairs(reason_data.variations) do
				total_w = total_w + variation_data.chance
			end
			if total_w > 0 then
				for variation_name, variation_data in pairs(reason_data.variations) do
					variation_data.chance = variation_data.chance / total_w
				end
			end
		end
	end
	presets.move_speed = {
		civ_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 210,
						strafe = 190,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 175,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 500,
						strafe = 192,
						bwd = 230
					},
					cbt = {
						fwd = 500,
						strafe = 250,
						bwd = 230
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					},
					cbt = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					}
				},
				run = {
					hos = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					},
					cbt = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					}
				}
			}
		},
		gang_member = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 150,
						bwd = 150
					},
					hos = {
						fwd = 437.5,
						strafe = 437.5,
						bwd = 437.5
					},
					cbt = {
						fwd = 437.5,
						strafe = 437.5,
						bwd = 437.5
					}
				},
				run = {
					hos = {
						fwd = 718.75,
						strafe = 718.75,
						bwd = 718.75
					},
					cbt = {
						fwd = 718.75,
						strafe = 718.75,
						bwd = 718.75
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 281.25,
						strafe = 281.25,
						bwd = 281.25
					},
					cbt = {
						fwd = 281.25,
						strafe = 281.25,
						bwd = 281.25
					}
				},
				run = {
					hos = {
						fwd = 281.25,
						strafe = 281.25,
						bwd = 281.25
					},
					cbt = {
						fwd = 281.25,
						strafe = 281.25,
						bwd = 281.25
					}
				}
			}
		},
		lightning = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 400,
						bwd = 350
					},
					cbt = {
						fwd = 750,
						strafe = 380,
						bwd = 320
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 420,
						strafe = 300,
						bwd = 250
					},
					cbt = {
						fwd = 412,
						strafe = 300,
						bwd = 280
					}
				}
			}
		},
		veteran = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					},
					cbt = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					},
					cbt = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					},
					cbt = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					},
					cbt = {
						fwd = 800,
						strafe = 800,
						bwd = 800
					}
				}
			}
		},
		very_slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 140,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 130,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			}
		},
		slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 150,
						bwd = 135
					},
					cbt = {
						fwd = 360,
						strafe = 150,
						bwd = 155
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 140,
						bwd = 150
					},
					cbt = {
						fwd = 360,
						strafe = 140,
						bwd = 155
					}
				}
			}
		},
		normal = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					},
					cbt = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 450,
						strafe = 290,
						bwd = 255
					},
					cbt = {
						fwd = 400,
						strafe = 250,
						bwd = 255
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 310,
						strafe = 260,
						bwd = 235
					},
					cbt = {
						fwd = 350,
						strafe = 260,
						bwd = 235
					}
				}
			}
		},
		fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					},
					cbt = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					}
				},
				run = {
					hos = {
						fwd = 625,
						strafe = 315,
						bwd = 280
					},
					cbt = {
						fwd = 450,
						strafe = 285,
						bwd = 280
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					},
					cbt = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 330,
						strafe = 280,
						bwd = 255
					},
					cbt = {
						fwd = 312,
						strafe = 270,
						bwd = 255
					}
				}
			}
		},
		very_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 670,
						strafe = 340,
						bwd = 325
					},
					cbt = {
						fwd = 475,
						strafe = 325,
						bwd = 300
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 350,
						strafe = 282,
						bwd = 268
					},
					cbt = {
						fwd = 312,
						strafe = 282,
						bwd = 268
					}
				}
			}
		}
	}
	for speed_preset_name, poses in pairs(presets.move_speed) do
		for pose, hastes in pairs(poses) do
			hastes.run.ntl = hastes.run.hos
		end
		poses.crouch.walk.ntl = poses.crouch.walk.hos
		poses.crouch.run.ntl = poses.crouch.run.hos
		poses.stand.run.ntl = poses.stand.run.hos
		poses.panic = poses.stand
	end
	presets.surrender = {}
	presets.surrender.always = {base_chance = 1}
	presets.surrender.never = {base_chance = 0}
	presets.surrender.gangster = {
		base_chance = 1,
		significant_chance = 0.1,
		violence_timeout = 0,
		reasons = {
			health = {
				[1] = 0.2,
				[0.3] = 1
			},
			weapon_down = 0.8,
			pants_down = 1,
			isolated = 0.1
		},
		factors = {
			flanked = 0.07,
			unaware_of_aggressor = 0.08,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0.02,
				[300] = 0.15
			}
		}
	}
	presets.surrender.guard = {
		base_chance = 0.75,
		significant_chance = 0.1,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.2,
				[0.3] = 1
			},
			weapon_down = 1,
			pants_down = 0,
			isolated = 0.1
		},
		factors = {
			flanked = 0.07,
			unaware_of_aggressor = 0.08,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0.02,
				[300] = 0.15
			}
		}
	}
	presets.surrender.easy = {
		base_chance = 0.75,
		significant_chance = 0.1,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.2,
				[0.5] = 1
			},
			weapon_down = 1,
			pants_down = 1,
			isolated = 0.1
		},
		factors = {
			flanked = 0.07,
			unaware_of_aggressor = 0.08,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0.02,
				[300] = 0.15
			}
		}
	}
	presets.surrender.normal = {
		base_chance = 0.5,
		significant_chance = 0.2,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.5] = 0.5
			},
			weapon_down = 0.5,
			pants_down = 1,
			isolated = 0.08
		},
		factors = {
			flanked = 0.05,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.11,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.hard = {
		base_chance = 0.35,
		significant_chance = 0.25,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.35] = 0.5
			},
			weapon_down = 0.2,
			pants_down = 0.8
		},
		factors = {
			isolated = 0.1,
			flanked = 0.04,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.05,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.hard_guard = {
		base_chance = 0.35,
		significant_chance = 0.25,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.35] = 0.5
			},
			weapon_down = 1,
			pants_down = 0
		},
		factors = {
			isolated = 0.1,
			flanked = 0.04,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.05,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.special = {
		base_chance = 0.25,
		significant_chance = 0.25,
		violence_timeout = 2,
		reasons = {
			health = {
				[0.5] = 0,
				[0.2] = 0.25
			},
			weapon_down = 0.02,
			pants_down = 0.6
		},
		factors = {
			isolated = 0.05,
			flanked = 0.015,
			unaware_of_aggressor = 0.02,
			enemy_weap_cold = 0.05
		}
	}
	presets.suppression = {
		easy = {
			duration = {10, 15},
			react_point = {0, 2},
			brown_point = {3, 5},
			panic_chance_mul = 1
		},
		hard_def = {
			duration = {5, 10},
			react_point = {0, 2},
			brown_point = {5, 6},
			panic_chance_mul = 1
		},
		hard_agg = {
			duration = {5, 8},
			react_point = {2, 5},
			brown_point = {5, 6},
			panic_chance_mul = 1
		},
		no_supress = {
			duration = {0.1, 0.15},
			react_point = {100, 200},
			brown_point = {400, 500},
			panic_chance_mul = 0
		}
	}
	presets.enemy_chatter = {
		no_chatter = {},
		cop = {
			aggressive = true,
			retreat = true,
			contact = true,
			go_go = true,
			suppress = true
		},
		swat = {
			aggressive = true,
			retreat = true,
			follow_me = true,
			clear = true,
			go_go = true,
			ready = true,
			smoke = true,
			contact = true,
			suppress = true
		},
		shield = {follow_me = true}
	}
	return presets
end


function CharacterTweakData:_create_table_structure()
	self.weap_ids = {
		"beretta92",
		"c45",
		"raging_bull",
		"m4",
		"ak47",
		"r870",
		"mossberg",
		"mp5",
		"mp5_tactical",
		"mp9",
		"mac11",
		"m14_sniper_npc",
		"saiga",
		"m249",
		"benelli",
		"g36",
		"ump",
		"scar_murky",
		"rpk_lmg",
		"svd_snp",
		"akmsu_smg",
		"asval_smg",
		"sr2_smg",
		"ak47_ass",
		"peacemaker",
		"x_akmsu",
		"x_c45",
		"sg417",
		"svdsil_snp",
		"mini",
		"m4_boom",
		"hk21_sc",
		"mp5_zeal"
	}
	self.weap_unit_names = {
		Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92"),
		Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45"),
		Idstring("units/payday2/weapons/wpn_npc_raging_bull/wpn_npc_raging_bull"),
		Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		Idstring("units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47"),
		Idstring("units/payday2/weapons/wpn_npc_r870/wpn_npc_r870"),
		Idstring("units/payday2/weapons/wpn_npc_sawnoff_shotgun/wpn_npc_sawnoff_shotgun"),
		Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5"),
		Idstring("units/payday2/weapons/wpn_npc_mp5_tactical/wpn_npc_mp5_tactical"),
		Idstring("units/payday2/weapons/wpn_npc_smg_mp9/wpn_npc_smg_mp9"),
		Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11"),
		Idstring("units/payday2/weapons/wpn_npc_sniper/wpn_npc_sniper"),
		Idstring("units/payday2/weapons/wpn_npc_saiga/wpn_npc_saiga"),
		Idstring("units/payday2/weapons/wpn_npc_lmg_m249/wpn_npc_lmg_m249"),
		Idstring("units/payday2/weapons/wpn_npc_benelli/wpn_npc_benelli"),
		Idstring("units/payday2/weapons/wpn_npc_g36/wpn_npc_g36"),
		Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump"),
		Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_rpk/wpn_npc_rpk"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_svd/wpn_npc_svd"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_akmsu/wpn_npc_akmsu"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_asval/wpn_npc_asval"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_sr2/wpn_npc_sr2"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_ak47/wpn_npc_ak47"),
		Idstring("units/payday2/weapons/wpn_npc_peacemaker/wpn_npc_peacemaker"),
		Idstring("units/pd2_dlc_mad/weapons/wpn_npc_akmsu/wpn_npc_x_akmsu"),
		Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_x_c45"),
		Idstring("units/pd2_dlc_chico/weapons/wpn_npc_sg417/wpn_npc_sg417"),
		Idstring("units/pd2_dlc_spa/weapons/wpn_npc_svd_silenced/wpn_npc_svd_silenced"),
		Idstring("units/pd2_dlc_drm/weapons/wpn_npc_mini/wpn_npc_mini"),
		Idstring("units/payday2/weapons/wpn_npc_m4_boom/wpn_npc_m4_boom"),
		Idstring("units/payday2/weapons/wpn_npc_hk21_sc/wpn_npc_hk21_sc"),
		Idstring("units/payday2/weapons/wpn_npc_mp5_tactical/wpn_npc_mp5_tactical")
	}
end

function CharacterTweakData:_set_easy()
	self:_multiply_all_hp(0.75, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal")
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1")
	self:_set_specials_weapon_preset("normal")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("1")
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.presets.gang_member_damage.HEALTH_INIT = 25
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.6
	self.old_hoxton_mission.HEALTH_INIT = 25
	self.spa_vip.HEALTH_INIT = 25
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 25
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[12] = Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[20] = Idstring("units/pd2_dlc_mad/weapons/wpn_npc_asval/wpn_npc_asval")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(0.75, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal")
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1")
	self:_set_specials_weapon_preset("normal")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("1")
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.presets.gang_member_damage.HEALTH_INIT = 50
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.55
	self.old_hoxton_mission.HEALTH_INIT = 50
	self.spa_vip.HEALTH_INIT = 50
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 50
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[12] = Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[20] = Idstring("units/pd2_dlc_mad/weapons/wpn_npc_asval/wpn_npc_asval")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")	
end

function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal")
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1")
	self:_set_specials_weapon_preset("normal")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("1")
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.presets.gang_member_damage.HEALTH_INIT = 75
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.5
	self.old_hoxton_mission.HEALTH_INIT = 75
	self.spa_vip.HEALTH_INIT = 75
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 75
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[12] = Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[20] = Idstring("units/pd2_dlc_mad/weapons/wpn_npc_asval/wpn_npc_asval")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_overkill()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("good")
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self:_set_characters_dodge_preset("athletic_very_hard")
	self:_set_characters_melee_preset("2")
	self:_set_specials_weapon_preset("normal")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("1")
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.presets.gang_member_damage.HEALTH_INIT = 100
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 100
	self.spa_vip.HEALTH_INIT = 100
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 100
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_overkill_145()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.5, 1)
	else
		self:_multiply_all_hp(1.5, 1)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("expert")
	self.city_swat.weapon = deep_clone(self.presets.weapon.good)
	self:_set_characters_dodge_preset("athletic_overkill")
	self:_set_characters_melee_preset("2.5")
	self:_set_specials_weapon_preset("good")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.sniper.weapon = deep_clone(self.presets.weapon.sniper_good)
	self:_set_specials_melee_preset("2")
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.presets.gang_member_damage.HEALTH_INIT = 125
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.4
	self.old_hoxton_mission.HEALTH_INIT = 125
	self.spa_vip.HEALTH_INIT = 125
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 125
	self:_multiply_all_speeds(1, 1.05)
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_easy_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.75, 0.8)
	else
		self:_multiply_all_hp(1.75, 0.8)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("expert")
	self:_set_characters_dodge_preset("athletic_overkill")
	self:_set_characters_melee_preset("2.5")
	self:_set_specials_weapon_preset("good")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("2")
	self.sniper.weapon = deep_clone(self.presets.weapon.sniper_good)
	self.city_swat.weapon = deep_clone(self.presets.weapon.good)
	self:_multiply_all_speeds(1.05, 1.1)
	self.presets.gang_member_damage.HEALTH_INIT = 150
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	self.old_hoxton_mission.HEALTH_INIT = 150
	self.spa_vip.HEALTH_INIT = 150
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 150
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_overkill_290()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.75, 0.8)
	else
		self:_multiply_all_hp(1.75, 0.8)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("easy_wish")
	self:_set_characters_dodge_preset("easy_wish")
	self:_set_characters_melee_preset("3")
	self:_set_specials_weapon_preset("expert")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("2.5")
	self.sniper.weapon = deep_clone(self.presets.weapon.sniper_expert)
	self.security.no_arrest = true
	self.gensec.no_arrest = true
	self.bolivian_indoors.no_arrest = true
	if job == "kosugi" or job == "dark" then
		self.city_swat.no_arrest = true
	else
		self.city_swat.no_arrest = false
	end
	self:_multiply_all_speeds(1.1, 1.15)
	self.presets.gang_member_damage.HEALTH_INIT = 175
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	self.old_hoxton_mission.HEALTH_INIT = 175
	self.spa_vip.HEALTH_INIT = 175
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 175
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_set_sm_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(2, 0.915)
	else
		self:_multiply_all_hp(2, 0.915)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("deathwish")
	self:_set_characters_dodge_preset("elite")
	self:_set_characters_melee_preset("3")
	self:_set_specials_weapon_preset("easy_wish")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self:_set_specials_melee_preset("3")
	self.sniper.weapon = deep_clone(self.presets.weapon.sniper_easy_wish)
	self.security.no_arrest = true
	self.gensec.no_arrest = true
	self.bolivian_indoors.no_arrest = true
	if job == "kosugi" or job == "dark" then
		self.city_swat.no_arrest = true
	else
		self.city_swat.no_arrest = false
	end
	self:_multiply_all_speeds(1.15, 1.2)
	self.presets.gang_member_damage.HEALTH_INIT = 200
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.3
	self.old_hoxton_mission.HEALTH_INIT = 200
	self.spa_vip.HEALTH_INIT = 200
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 200
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 2
	self.weap_unit_names[5] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[9] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	self.weap_unit_names[18] = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
	self.weap_unit_names[24] = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
	self.weap_unit_names[22] = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
end

function CharacterTweakData:_multiply_weapon_delay(weap_usage_table, mul)
	for _, weap_id in ipairs(self.weap_ids) do
		local usage_data = weap_usage_table[weap_id]
		if usage_data then
			usage_data.focus_delay = usage_data.focus_delay * mul
		end
	end
end

function CharacterTweakData:_multiply_all_hp(hp_mul, hs_mul)
	self.security.HEALTH_INIT = self.security.HEALTH_INIT * hp_mul
	self.gensec.HEALTH_INIT = self.gensec.HEALTH_INIT * hp_mul
	self.cop.HEALTH_INIT = self.cop.HEALTH_INIT * hp_mul
	self.cop_scared.HEALTH_INIT = self.cop_scared.HEALTH_INIT * hp_mul
	self.cop_female.HEALTH_INIT = self.cop_female.HEALTH_INIT * hp_mul
	self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT * hp_mul
	self.fbi_vet.HEALTH_INIT = self.fbi_vet.HEALTH_INIT * hp_mul
	self.medic.HEALTH_INIT = self.medic.HEALTH_INIT * hp_mul
	self.bolivian.HEALTH_INIT = self.bolivian.HEALTH_INIT * hp_mul
	self.bolivian_indoors.HEALTH_INIT = self.bolivian_indoors.HEALTH_INIT * hp_mul
	self.drug_lord_boss.HEALTH_INIT = self.drug_lord_boss.HEALTH_INIT * hp_mul
	self.drug_lord_boss_stealth.HEALTH_INIT = self.drug_lord_boss_stealth.HEALTH_INIT * hp_mul
	self.fbi_swat.HEALTH_INIT = self.fbi_swat.HEALTH_INIT * hp_mul
	self.fbi_swat_vet.HEALTH_INIT = self.fbi_swat_vet.HEALTH_INIT * hp_mul
	self.city_swat.HEALTH_INIT = self.city_swat.HEALTH_INIT * hp_mul
	self.city_swat_titan.HEALTH_INIT = self.city_swat_titan.HEALTH_INIT * hp_mul
	self.swat.HEALTH_INIT = self.swat.HEALTH_INIT * hp_mul
	self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT * hp_mul
	self.heavy_swat_sniper.HEALTH_INIT = self.heavy_swat_sniper.HEALTH_INIT * hp_mul
	self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT * hp_mul
	self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT * hp_mul
	self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT * hp_mul
	self.mobster.HEALTH_INIT = self.mobster.HEALTH_INIT * hp_mul
	self.mobster_boss.HEALTH_INIT = self.mobster_boss.HEALTH_INIT * hp_mul
	self.chavez_boss.HEALTH_INIT = self.chavez_boss.HEALTH_INIT * hp_mul
	self.hector_boss.HEALTH_INIT = self.hector_boss.HEALTH_INIT * hp_mul
	self.hector_boss_no_armor.HEALTH_INIT = self.hector_boss_no_armor.HEALTH_INIT * hp_mul
	self.biker_boss.HEALTH_INIT = self.biker_boss.HEALTH_INIT * hp_mul
	self.biker.HEALTH_INIT = self.biker.HEALTH_INIT * hp_mul
	self.tank.HEALTH_INIT = self.tank.HEALTH_INIT * hp_mul
	self.tank_mini.HEALTH_INIT = self.tank_mini.HEALTH_INIT * hp_mul
	self.tank_medic.HEALTH_INIT = self.tank_medic.HEALTH_INIT * hp_mul
	self.tank_hw.HEALTH_INIT = self.tank_hw.HEALTH_INIT * hp_mul
	self.tank_titan.HEALTH_INIT = self.tank_titan.HEALTH_INIT * hp_mul
	self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT * hp_mul
	self.shield.HEALTH_INIT = self.shield.HEALTH_INIT * hp_mul
	self.phalanx_minion.HEALTH_INIT = self.phalanx_minion.HEALTH_INIT * hp_mul
	self.phalanx_vip.HEALTH_INIT = self.phalanx_vip.HEALTH_INIT * hp_mul
	self.spring.HEALTH_INIT = self.spring.HEALTH_INIT * hp_mul
	self.taser.HEALTH_INIT = self.taser.HEALTH_INIT * hp_mul
	self.boom.HEALTH_INIT = self.boom.HEALTH_INIT * hp_mul
	self.rboom.HEALTH_INIT = self.rboom.HEALTH_INIT * hp_mul
	self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT * hp_mul
	if self.security.headshot_dmg_mul then
		self.security.headshot_dmg_mul = self.security.headshot_dmg_mul * hs_mul
	end
	if self.gensec.headshot_dmg_mul then
		self.gensec.headshot_dmg_mul = self.gensec.headshot_dmg_mul * hs_mul
	end
	if self.cop.headshot_dmg_mul then
		self.cop.headshot_dmg_mul = self.cop.headshot_dmg_mul * hs_mul
	end
	if self.cop_scared.headshot_dmg_mul then
		self.cop_scared.headshot_dmg_mul = self.cop_scared.headshot_dmg_mul * hs_mul
	end
	if self.cop_female.headshot_dmg_mul then
		self.cop_female.headshot_dmg_mul = self.cop_female.headshot_dmg_mul * hs_mul
	end
	if self.fbi.headshot_dmg_mul then
		self.fbi.headshot_dmg_mul = self.fbi.headshot_dmg_mul * hs_mul
	end
	if self.fbi_vet.headshot_dmg_mul then
		self.fbi_vet.headshot_dmg_mul = self.fbi_vet.headshot_dmg_mul * hs_mul
	end
	if self.medic.headshot_dmg_mul then
		self.medic.headshot_dmg_mul = self.medic.headshot_dmg_mul * hs_mul
	end
	if self.fbi_swat.headshot_dmg_mul then
		self.fbi_swat.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul * hs_mul
	end
	if self.fbi_swat_vet.headshot_dmg_mul then
		self.fbi_swat_vet.headshot_dmg_mul = self.fbi_swat_vet.headshot_dmg_mul * hs_mul
	end
	if self.city_swat.headshot_dmg_mul then
		self.city_swat.headshot_dmg_mul = self.city_swat.headshot_dmg_mul * hs_mul
	end
	if self.city_swat_titan.headshot_dmg_mul then
		self.city_swat_titan.headshot_dmg_mul = self.city_swat_titan.headshot_dmg_mul * hs_mul
	end
	if self.swat.headshot_dmg_mul then
		self.swat.headshot_dmg_mul = self.swat.headshot_dmg_mul * hs_mul
	end
	if self.heavy_swat.headshot_dmg_mul then
		self.heavy_swat.headshot_dmg_mul = self.heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.heavy_swat_sniper.headshot_dmg_mul then
		self.heavy_swat_sniper.headshot_dmg_mul = self.heavy_swat_sniper.headshot_dmg_mul * hs_mul
	end
	if self.fbi_heavy_swat.headshot_dmg_mul then
		self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.sniper.headshot_dmg_mul then
		self.sniper.headshot_dmg_mul = self.sniper.headshot_dmg_mul * hs_mul
	end
	if self.gangster.headshot_dmg_mul then
		self.gangster.headshot_dmg_mul = self.gangster.headshot_dmg_mul * hs_mul
	end
	if self.hector_boss.headshot_dmg_mul then
		self.hector_boss.headshot_dmg_mul = self.hector_boss.headshot_dmg_mul * hs_mul
	end
	if self.hector_boss_no_armor.headshot_dmg_mul then
		self.hector_boss_no_armor.headshot_dmg_mul = self.hector_boss_no_armor.headshot_dmg_mul * hs_mul
	end
	if self.mobster.headshot_dmg_mul then
		self.mobster.headshot_dmg_mul = self.mobster.headshot_dmg_mul * hs_mul
	end
	if self.mobster_boss.headshot_dmg_mul then
		self.mobster_boss.headshot_dmg_mul = self.mobster_boss.headshot_dmg_mul * hs_mul
	end
	if self.biker.headshot_dmg_mul then
		self.biker.headshot_dmg_mul = self.biker.headshot_dmg_mul * hs_mul
	end
	if self.biker_boss.headshot_dmg_mul then
		self.biker_boss.headshot_dmg_mul = self.biker_boss.headshot_dmg_mul * hs_mul
	end
	if self.tank.headshot_dmg_mul then
		self.tank.headshot_dmg_mul = self.tank.headshot_dmg_mul * hs_mul
	end
	if self.tank_mini.headshot_dmg_mul then
		self.tank_mini.headshot_dmg_mul = self.tank_mini.headshot_dmg_mul * hs_mul
	end
	if self.tank_medic.headshot_dmg_mul then
		self.tank_medic.headshot_dmg_mul = self.tank_medic.headshot_dmg_mul * hs_mul
	end
	if self.tank_titan.headshot_dmg_mul then
		self.tank_titan.headshot_dmg_mul = self.tank_titan.headshot_dmg_mul * hs_mul
	end
	if self.chavez_boss.headshot_dmg_mul then
		self.chavez_boss.headshot_dmg_mul = self.chavez_boss.headshot_dmg_mul * hs_mul
	end
	if self.tank_hw.headshot_dmg_mul then
		self.tank_hw.headshot_dmg_mul = self.tank_hw.headshot_dmg_mul * hs_mul
	end
	if self.spooc.headshot_dmg_mul then
		self.spooc.headshot_dmg_mul = self.spooc.headshot_dmg_mul * hs_mul
	end
	if self.shield.headshot_dmg_mul then
		self.shield.headshot_dmg_mul = self.shield.headshot_dmg_mul * hs_mul
	end
	if self.phalanx_minion.headshot_dmg_mul then
		self.phalanx_minion.headshot_dmg_mul = self.phalanx_minion.headshot_dmg_mul * hs_mul
	end
	if self.phalanx_vip.headshot_dmg_mul then
		self.phalanx_vip.headshot_dmg_mul = self.phalanx_vip.headshot_dmg_mul * hs_mul
	end
	if self.spring.headshot_dmg_mul then
		self.spring.headshot_dmg_mul = self.spring.headshot_dmg_mul * hs_mul
	end
	if self.taser.headshot_dmg_mul then
		self.taser.headshot_dmg_mul = self.taser.headshot_dmg_mul * hs_mul
	end
	if self.boom.headshot_dmg_mul then
		self.boom.headshot_dmg_mul = self.boom.headshot_dmg_mul * hs_mul
	end
	if self.rboom.headshot_dmg_mul then
		self.rboom.headshot_dmg_mul = self.rboom.headshot_dmg_mul * hs_mul
	end
	if self.biker_escape.headshot_dmg_mul then
		self.biker_escape.headshot_dmg_mul = self.biker_escape.headshot_dmg_mul * hs_mul
	end
	if self.drug_lord_boss.headshot_dmg_mul then
		self.drug_lord_boss.headshot_dmg_mul = self.drug_lord_boss.headshot_dmg_mul * hs_mul
	end
	if self.drug_lord_boss_stealth.headshot_dmg_mul then
		self.drug_lord_boss_stealth.headshot_dmg_mul = self.drug_lord_boss_stealth.headshot_dmg_mul * hs_mul
	end
	if self.bolivian.headshot_dmg_mul then
		self.bolivian.headshot_dmg_mul = self.bolivian.headshot_dmg_mul * hs_mul
	end
	if self.bolivian_indoors.headshot_dmg_mul then
		self.bolivian_indoors.headshot_dmg_mul = self.bolivian_indoors.headshot_dmg_mul * hs_mul
	end
end

function CharacterTweakData:_multiply_all_speeds(walk_mul, run_mul)
	local all_units = {
		"security",
		"gensec",
		"cop",
		"cop_scared",
		"cop_female",
		"fbi",
		"fbi_vet",
		"medic",
		"swat",
		"heavy_swat",
		"heavy_swat_sniper",
		"fbi_swat",
		"fbi_swat_vet",
		"fbi_heavy_swat",
		"city_swat",
		"city_swat_titan",
		"sniper",
		"gangster",
		"mobster",
		"mobster_boss",
		"biker_boss",
		"hector_boss",
		"chavez_boss",
		"hector_boss_no_armor",
		"tank",
		"tank_mini",
		"tank_medic",
		"tank_titan",
		"tank_hw",
		"spooc",
		"phalanx_vip",
		"spring",
		"phalanx_minion",
		"shield",
		"biker",
		"boom",
		"rboom",
		"taser"
	}
	table.insert(all_units, "bolivian")
	table.insert(all_units, "bolivian_indoors")
	table.insert(all_units, "drug_lord_boss")
	table.insert(all_units, "drug_lord_boss_stealth")
	for _, name in ipairs(all_units) do
		local speed_table = self[name].SPEED_WALK
		speed_table.hos = speed_table.hos * walk_mul
		speed_table.cbt = speed_table.cbt * walk_mul
	end
	self.security.SPEED_RUN = self.security.SPEED_RUN * run_mul
	self.gensec.SPEED_RUN = self.security.SPEED_RUN * run_mul
	self.cop.SPEED_RUN = self.cop.SPEED_RUN * run_mul
	self.cop_scared.SPEED_RUN = self.cop_scared.SPEED_RUN * run_mul
	self.cop_female.SPEED_RUN = self.cop_female.SPEED_RUN * run_mul
	self.fbi.SPEED_RUN = self.fbi.SPEED_RUN * run_mul
	self.fbi_vet.SPEED_RUN = self.fbi_vet.SPEED_RUN * run_mul
	self.medic.SPEED_RUN = self.medic.SPEED_RUN * run_mul
	self.bolivian.SPEED_RUN = self.bolivian.SPEED_RUN * run_mul
	self.bolivian_indoors.SPEED_RUN = self.bolivian_indoors.SPEED_RUN * run_mul
	self.drug_lord_boss.SPEED_RUN = self.drug_lord_boss.SPEED_RUN * run_mul
	self.drug_lord_boss_stealth.SPEED_RUN = self.drug_lord_boss_stealth.SPEED_RUN * run_mul
	self.swat.SPEED_RUN = self.swat.SPEED_RUN * run_mul
	self.heavy_swat.SPEED_RUN = self.heavy_swat.SPEED_RUN * run_mul
	self.heavy_swat_sniper.SPEED_RUN = self.heavy_swat_sniper.SPEED_RUN * run_mul
	self.fbi_swat.SPEED_RUN = self.fbi_swat.SPEED_RUN * run_mul
	self.fbi_swat_vet.SPEED_RUN = self.fbi_swat_vet.SPEED_RUN * run_mul
	self.fbi_heavy_swat.SPEED_RUN = self.fbi_heavy_swat.SPEED_RUN * run_mul
	self.city_swat.SPEED_RUN = self.city_swat.SPEED_RUN * run_mul
	self.city_swat_titan.SPEED_RUN = self.city_swat_titan.SPEED_RUN * run_mul
	self.sniper.SPEED_RUN = self.sniper.SPEED_RUN * run_mul
	self.gangster.SPEED_RUN = self.gangster.SPEED_RUN * run_mul
	self.mobster.SPEED_RUN = self.gangster.SPEED_RUN * run_mul
	self.mobster_boss.SPEED_RUN = self.mobster_boss.SPEED_RUN * run_mul
	self.chavez_boss.SPEED_RUN = self.chavez_boss.SPEED_RUN * run_mul
	self.biker_boss.SPEED_RUN = self.biker_boss.SPEED_RUN * run_mul
	self.hector_boss.SPEED_RUN = self.hector_boss.SPEED_RUN * run_mul
	self.hector_boss_no_armor.SPEED_RUN = self.hector_boss_no_armor.SPEED_RUN * run_mul
	self.tank.SPEED_RUN = self.tank.SPEED_RUN * run_mul
	self.tank_mini.SPEED_RUN = self.tank_mini.SPEED_RUN * run_mul
	self.tank_medic.SPEED_RUN = self.tank_medic.SPEED_RUN * run_mul
	self.tank_titan.SPEED_RUN = self.tank_titan.SPEED_RUN * run_mul
	self.tank_hw.SPEED_RUN = self.tank_hw.SPEED_RUN * run_mul
	self.spooc.SPEED_RUN = self.spooc.SPEED_RUN * run_mul
	self.phalanx_vip.SPEED_RUN = self.phalanx_vip.SPEED_RUN * run_mul
	self.spring.SPEED_RUN = self.spring.SPEED_RUN * run_mul
	self.phalanx_minion.SPEED_RUN = self.phalanx_minion.SPEED_RUN * run_mul
	self.shield.SPEED_RUN = self.shield.SPEED_RUN * run_mul
	self.biker.SPEED_RUN = self.biker.SPEED_RUN * run_mul
	self.taser.SPEED_RUN = self.taser.SPEED_RUN * run_mul
	self.boom.SPEED_RUN = self.boom.SPEED_RUN * run_mul
	self.rboom.SPEED_RUN = self.rboom.SPEED_RUN * run_mul
	self.biker_escape.SPEED_RUN = self.biker_escape.SPEED_RUN * run_mul
end

function CharacterTweakData:_set_characters_weapon_preset(preset)
	local all_units = {
		"security",
		"cop",
		"cop_scared",
		"cop_female",
		"gensec",
		"fbi",
		"swat",
		"gangster",
		"hector_boss_no_armor",
		"bolivian",
		"bolivian_indoors",
		"drug_lord_boss_stealth",
		"biker",
		"mobster"
	}
	for _, name in ipairs(all_units) do
		self[name].weapon = self.presets.weapon[preset]
	end
end

function CharacterTweakData:_set_characters_dodge_preset(preset)
	local all_units = {
		"gensec",
		"fbi",
		"medic",
		"taser",
		"boom",
		"rboom",
		"hector_boss_no_armor",
		"bolivian_indoors",
		"drug_lord_boss_stealth",
		"swat"
	}
	for _, name in ipairs(all_units) do
		self[name].dodge = self.presets.dodge[preset]
	end
end

function CharacterTweakData:_set_characters_melee_preset(preset)
	local all_units = {
		"security",
		"cop",
		"cop_scared",
		"cop_female",
		"gensec",
		"fbi",
		"swat",
		"gangster",
		"hector_boss_no_armor",
		"bolivian",
		"bolivian_indoors",
		"drug_lord_boss_stealth",
		"biker",
		"mobster"
	}
	for _, name in ipairs(all_units) do
		self[name].melee_weapon_dmg_multiplier = preset
	end
end

function CharacterTweakData:_set_specials_weapon_preset(preset)
	local all_units = {
		"taser",
		"medic",
		"fbi_vet",
		"boom",
		"rboom",
		"spooc",
		"shield",
		"tank",
		"tank_mini",
		"tank_medic",
		"tank_hw",
		"tank_titan",
		"city_swat_titan",
		"mobster_boss",
		"biker_boss",
		"chavez_boss",
		"hector_boss",
		"drug_lord_boss",
		"phalanx_minion",
		"spring",
		"phalanx_vip"
	}
	for _, name in ipairs(all_units) do
		self[name].weapon = deep_clone(self.presets.weapon[preset])
	end
end

function CharacterTweakData:_set_specials_melee_preset(preset)
	local all_units = {
		"taser",
		"medic",
		"fbi_vet",
		"boom",
		"rboom",
		"spooc",
		"shield",
		"tank",
		"tank_mini",
		"tank_medic",
		"tank_titan",
		"city_swat_titan",
		"sniper",
		"tank_hw",
		"mobster_boss",
		"biker_boss",
		"chavez_boss",
		"hector_boss",
		"drug_lord_boss",
		"phalanx_minion",
		"spring",
		"phalanx_vip"
	}
	for _, name in ipairs(all_units) do
		self[name].melee_weapon_dmg_multiplier = preset
	end
end

function CharacterTweakData:character_map()
	local char_map = {
		basic = {
			path = "units/payday2/characters/",
			list = {
				"civ_female_bank_1",
				"civ_female_bank_manager_1",
				"civ_female_bikini_1",
				"civ_female_bikini_2",
				"civ_female_casual_1",
				"civ_female_casual_2",
				"civ_female_casual_3",
				"civ_female_casual_4",
				"civ_female_casual_5",
				"civ_female_casual_6",
				"civ_female_casual_7",
				"civ_female_casual_8",
				"civ_female_casual_9",
				"civ_female_casual_10",
				"civ_female_crackwhore_1",
				"civ_female_curator_1",
				"civ_female_curator_2",
				"civ_female_hostess_apron_1",
				"civ_female_hostess_jacket_1",
				"civ_female_hostess_shirt_1",
				"civ_female_party_1",
				"civ_female_party_2",
				"civ_female_party_3",
				"civ_female_party_4",
				"civ_female_waitress_1",
				"civ_female_waitress_2",
				"civ_female_waitress_3",
				"civ_female_waitress_4",
				"civ_female_wife_trophy_1",
				"civ_female_wife_trophy_2",
				"civ_male_bank_1",
				"civ_male_bank_2",
				"civ_male_bank_manager_1",
				"civ_male_bank_manager_3",
				"civ_male_bank_manager_4",
				"civ_male_bank_manager_5",
				"civ_male_bartender_1",
				"civ_male_bartender_2",
				"civ_male_business_1",
				"civ_male_business_2",
				"civ_male_casual_1",
				"civ_male_casual_2",
				"civ_male_casual_3",
				"civ_male_casual_4",
				"civ_male_casual_5",
				"civ_male_casual_6",
				"civ_male_casual_7",
				"civ_male_casual_8",
				"civ_male_casual_9",
				"civ_male_casual_12",
				"civ_male_casual_13",
				"civ_male_casual_14",
				"civ_male_curator_1",
				"civ_male_curator_2",
				"civ_male_curator_3",
				"civ_male_dj_1",
				"civ_male_italian_robe_1",
				"civ_male_janitor_1",
				"civ_male_janitor_2",
				"civ_male_janitor_3",
				"civ_male_meth_cook_1",
				"civ_male_party_1",
				"civ_male_party_2",
				"civ_male_party_3",
				"civ_male_pilot_1",
				"civ_male_scientist_1",
				"civ_male_miami_store_clerk_1",
				"civ_male_taxman",
				"civ_male_trucker_1",
				"civ_male_worker_1",
				"civ_male_worker_2",
				"civ_male_worker_3",
				"civ_male_worker_docks_1",
				"civ_male_worker_docks_2",
				"civ_male_worker_docks_3",
				"civ_male_dog_abuser_1",
				"civ_male_dog_abuser_2",
				"ene_biker_1",
				"ene_biker_2",
				"ene_biker_3",
				"ene_biker_4",
				"ene_bulldozer_1",
				"ene_bulldozer_2",
				"ene_bulldozer_2_hw",
				"ene_bulldozer_3",
				"ene_bulldozer_4",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_city_swat_heavy_1",
				"ene_city_swat_heavy_2",
				"ene_murkywater_1",
				"ene_murkywater_2",
				"ene_cop_1",
				"ene_cop_2",
				"ene_cop_3",
				"ene_cop_4",
				"ene_fbi_1",
				"ene_fbi_2",
				"ene_fbi_3",
				"ene_fbi_boss_1",
				"ene_fbi_female_1",
				"ene_fbi_female_2",
				"ene_fbi_female_3",
				"ene_fbi_female_4",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_fbi_office_1",
				"ene_fbi_office_2",
				"ene_fbi_office_3",
				"ene_fbi_office_4",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_gang_black_1",
				"ene_gang_black_2",
				"ene_gang_black_3",
				"ene_gang_black_4",
				"ene_gang_mexican_1",
				"ene_gang_mexican_2",
				"ene_gang_mexican_3",
				"ene_gang_mexican_4",
				"ene_gang_russian_1",
				"ene_gang_russian_2",
				"ene_gang_russian_3",
				"ene_gang_russian_4",
				"ene_gang_russian_5",
				"ene_gang_mobster_1",
				"ene_gang_mobster_2",
				"ene_gang_mobster_3",
				"ene_gang_mobster_4",
				"ene_gang_mobster_boss",
				"ene_guard_national_1",
				"ene_hoxton_breakout_guard_1",
				"ene_hoxton_breakout_guard_2",
				"ene_male_tgt_1",
				"ene_murkywater_1",
				"ene_murkywater_2",
				"ene_prisonguard_female_1",
				"ene_prisonguard_male_1",
				"ene_secret_service_1",
				"ene_secret_service_2",
				"ene_security_1",
				"ene_security_2",
				"ene_security_3",
				"ene_security_4",
				"ene_security_5",
				"ene_security_6",
				"ene_security_7",
				"ene_security_8",
				"ene_shield_1",
				"ene_shield_2",
				"ene_city_shield",
				"ene_shield_gensec",
				"ene_phalanx_1",
				"ene_vip_1",
				"ene_vip_2",
				"ene_sniper_1",
				"ene_sniper_2",
				"ene_spook_1",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_heavy_1",
				"ene_swat_heavy_r870",
				"ene_tazer_1",
				"ene_grenadier_1",
				"ene_veteran_cop_1",
				"ene_veteran_cop_2",
				"npc_old_hoxton_prisonsuit_1",
				"npc_old_hoxton_prisonsuit_2",
				"ene_medic_r870",
				"ene_medic_m4",
				"ene_city_heavy_r870",
				"ene_city_heavy_g36"
			}
		},
		dlc1 = {
			path = "units/pd2_dlc1/characters/",
			list = {
				"civ_male_bank_manager_2",
				"civ_male_casual_10",
				"civ_male_casual_11",
				"civ_male_firefighter_1",
				"civ_male_paramedic_1",
				"civ_male_paramedic_2",
				"ene_security_gensec_1",
				"ene_security_gensec_2"
			}
		},
		dlc2 = {
			path = "units/pd2_dlc2/characters/",
			list = {
				"civ_female_bank_assistant_1",
				"civ_female_bank_assistant_2"
			}
		},
		mansion = {
			path = "units/pd2_mcmansion/characters/",
			list = {
				"ene_male_hector_1",
				"ene_male_hector_2",
				"ene_hoxton_breakout_guard_1",
				"ene_hoxton_breakout_guard_2"
			}
		},
		cage = {
			path = "units/pd2_dlc_cage/characters/",
			list = {
				"civ_female_bank_2"
			}
		},
		arena = {
			path = "units/pd2_dlc_arena/characters/",
			list = {
				"civ_female_fastfood_1",
				"civ_female_party_alesso_1",
				"civ_female_party_alesso_2",
				"civ_female_party_alesso_3",
				"civ_female_party_alesso_4",
				"civ_female_party_alesso_5",
				"civ_female_party_alesso_6",
				"civ_male_party_alesso_1",
				"civ_male_party_alesso_2",
				"civ_male_alesso_booth",
				"civ_male_fastfood_1",
				"ene_guard_security_heavy_2",
				"ene_guard_security_heavy_1"
			}
		},
		kenaz = {
			path = "units/pd2_dlc_casino/characters/",
			list = {
				"civ_male_casino_1",
				"civ_male_casino_2",
				"civ_male_casino_3",
				"civ_male_casino_4",
				"ene_secret_service_1_casino",
				"civ_male_business_casino_1",
				"civ_male_business_casino_2",
				"civ_male_impersonator",
				"civ_female_casino_1",
				"civ_female_casino_2",
				"civ_female_casino_3",
				"civ_male_casino_pitboss"
			}
		},
		vip = {
			path = "units/pd2_dlc_vip/characters/",
			list = {
				"ene_vip_1",
				"ene_vip_2",
				"ene_spring",
				"ene_phalanx_1",
				"ene_titan_shotgun"
			}
		},
		holly = {
			path = "units/pd2_dlc_holly/characters/",
			list = {
				"civ_male_hobo_1",
				"civ_male_hobo_2",
				"civ_male_hobo_3",
				"civ_male_hobo_4",
				"ene_gang_hispanic_1",
				"ene_gang_hispanic_3",
				"ene_gang_hispanic_2"
			}
		},
		red = {
			path = "units/pd2_dlc_red/characters/",
			list = {
				"civ_female_inside_man_1"
			}
		},
		dinner = {
			path = "units/pd2_dlc_dinner/characters/",
			list = {
				"civ_male_butcher_2",
				"civ_male_butcher_1"
			}
		},
		pal = {
			path = "units/pd2_dlc_pal/characters/",
			list = {
				"civ_male_mitch"
			}
		},
		cane = {
			path = "units/pd2_dlc_cane/characters/",
			list = {
				"civ_male_helper_1",
				"civ_male_helper_2",
				"civ_male_helper_3",
				"civ_male_helper_4"
			}
		},
		berry = {
			path = "units/pd2_dlc_berry/characters/",
			list = {
				"ene_murkywater_no_light",
				"npc_locke"
			}
		},
		peta = {
			path = "units/pd2_dlc_peta/characters/",
			list = {
				"civ_male_boris"
			}
		},
		mad = {
			path = "units/pd2_dlc_mad/characters/",
			list = {
				"civ_male_scientist_01",
				"civ_male_scientist_02",
				"ene_akan_fbi_heavy_g36",
				"ene_akan_fbi_heavy_r870",
				"ene_akan_fbi_shield_sr2_smg",
				"ene_akan_fbi_spooc_asval_smg",
				"ene_akan_fbi_swat_ak47_ass",
				"ene_akan_fbi_swat_dw_ak47_ass",
				"ene_akan_fbi_swat_dw_r870",
				"ene_akan_fbi_swat_dw_ump",
				"ene_akan_fbi_swat_r870",
				"ene_akan_fbi_swat_ump",
				"ene_akan_fbi_tank_r870",
				"ene_akan_fbi_tank_rpk_lmg",
				"ene_akan_fbi_tank_saiga",
				"ene_akan_cs_cop_ak47_ass",
				"ene_akan_cs_cop_akmsu_smg",
				"ene_akan_cs_cop_asval_smg",
				"ene_akan_cs_cop_r870",
				"ene_akan_cs_heavy_ak47_ass",
				"ene_akan_cs_heavy_r870",
				"ene_akan_cs_shield_c45",
				"ene_akan_cs_swat_ak47_ass",
				"ene_akan_cs_swat_r870",
				"ene_akan_cs_swat_sniper_svd_snp",
				"ene_akan_cs_tazer_ak47_ass",
				"ene_akan_fbi_heavy_dw",
				"ene_akan_fbi_heavy_dw_r870",
				"ene_akan_fbi_1",
				"ene_akan_fbi_2",
				"ene_akan_veteran_1",
				"ene_akan_grenadier_1"
			}
		},
		born = {
			path = "units/pd2_dlc_born/characters/",
			list = {
				"ene_gang_biker_boss",
				"ene_biker_female_1",
				"ene_biker_female_2",
				"ene_biker_female_3",
				"npc_male_mechanic"
			}
		},
		flat = {
			path = "units/pd2_dlc_flat/characters/",
			list = {
				"npc_chavez",
				"npc_jamaican"
			}
		},
		help = {
			path = "units/pd2_dlc_help/characters/",
			list = {
				"ene_zeal_bulldozer_halloween"
			}
		},
		glace = {
			path = "units/pd2_dlc_glace/characters/",
			list = {
				"npc_chinese_prisoner",
				"npc_prisoner_1",
				"npc_prisoner_2",
				"npc_prisoner_3",
				"npc_prisoner_4",
				"npc_prisoner_5",
				"npc_prisoner_6",
				"npc_yakuza_prisoner"
			}
		},
		moon = {
			path = "units/pd2_dlc_moon/characters/",
			list = {
				"civ_male_pilot_2"
			}
		},
		friend = {
			path = "units/pd2_dlc_friend/characters/",
			list = {
				"ene_bolivian_thug_outdoor_01",
				"ene_bolivian_thug_outdoor_02",
				"ene_drug_lord_boss",
				"ene_security_manager",
				"ene_thug_indoor_01",
				"ene_thug_indoor_02"
			}
		},
		gitgud = {
			path = "units/pd2_dlc_gitgud/characters/",
			list = {
				"ene_zeal_bulldozer",
				"ene_zeal_bulldozer_2",
				"ene_zeal_bulldozer_3",
				"ene_zeal_cloaker",
				"ene_zeal_swat",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_swat_heavy",
				"ene_zeal_heavy_shield",
				"ene_zeal_swat_shield"
			}
		},
		spa = {
			path = "units/pd2_dlc_spa/characters/",
			list = {
				"ene_sniper_3",
				"npc_spa",
				"npc_spa_2",
				"npc_spa_3",
				"npc_gage"
			}
		},
		fish = {
			path = "units/pd2_dlc_lxy/characters/",
			list = {
				"civ_female_guest_gala_1",
				"civ_female_guest_gala_2",
				"civ_male_guest_gala_1",
				"civ_male_guest_gala_2",
				"civ_male_camera_crew_1"
			}
		},
		slu = {
			path = "units/pd2_dlc_slu/characters/",
			list = {"npc_vlad", "npc_sophia"}
		},
		run = {
			path = "units/pd2_dlc_run/characters/",
			list = {"npc_matt"}
		},
		drm = {
			path = "units/pd2_dlc_drm/characters/",
			list = {
				"ene_bulldozer_medic",
				"ene_bulldozer_minigun",
				"ene_zeal_swat_heavy_sniper"
			}
		}
	}
	return char_map
end

end