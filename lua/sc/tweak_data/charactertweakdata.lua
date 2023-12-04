local job = Global.level_data and Global.level_data.level_id
local enemy_melee_damage_base = 4.5
local enemy_melee_damage_good = 6.75
local enemy_melee_damage_expert = 9
local enemy_melee_damage_deathwish = 11.25
local enemy_melee_damage_gang_member = 9
local enemy_melee_speed = {
	normal = 1,
	good = 1,
	expert = 1,
	deathwish = 1,
}

local old_init = CharacterTweakData.init
function CharacterTweakData:init(tweak_data, presets)
	old_init(self, tweak_data, presets)
	restoration.log_shit("here be SC Tweak Data loading")
	local presets = self:_presets(tweak_data)
	local func = "_init_region_" .. tostring(tweak_data.levels:get_ai_group_type())

	self[func](self)

	self._prefix_data_p1 = {
		cop = function ()
			return self._unit_prefixes.cop
		end,
		swat = function ()
			return self._unit_prefixes.swat
		end,
		heavy_swat = function ()
			return self._unit_prefixes.heavy_swat
		end,
		taser = function ()
			return self._unit_prefixes.taser
		end,
		cloaker = function ()
			return self._unit_prefixes.cloaker
		end,
		bulldozer = function ()
			return self._unit_prefixes.bulldozer
		end,
		medic = function ()
			return self._unit_prefixes.medic
		end
	}
	
	self:_init_boom(presets)
	self:_init_spring(presets)
	self:_init_summers(presets)
	self:_init_autumn(presets)
	self:_init_omnia_lpf(presets)
	self:_init_tank_biker(presets)
	self:_init_zombie(presets)
	self:_process_weapon_usage_table()
	
	--Dozer Armor Multiplier, lower means more EHP
	self.tank_armor_damage_mul = 1
	self.tank_glass_damage_mul = 1
end

function CharacterTweakData:_init_region_america()
	self._default_chatter = "dispatch_generic_message"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "d"
end

function CharacterTweakData:_init_region_russia()
	self._default_chatter = "dsp_radio_russian"
	self._unit_prefixes = {
		cop = "r",
		swat = "r",
		heavy_swat = "r",
		taser = "rtsr",
		cloaker = "rclk",
		bulldozer = "rbdz",
		medic = "rmdc"
	}
	self._speech_prefix_p2 = "n"
end

function CharacterTweakData:_init_region_zombie()
	self._default_chatter = "dsp_radio_zombie"
	self._unit_prefixes = {
		cop = "z",
		swat = "z",
		heavy_swat = "z",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "n"
end

function CharacterTweakData:_init_region_murkywater()
	self._default_chatter = "dsp_radio_russian"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l5d",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "nothing"
	}
	self._speech_prefix_p2 = "n"
end

function CharacterTweakData:_init_region_federales()
	self._default_chatter = "mex_dispatch_generic_message"
	self._unit_prefixes = {
		cop = "m",
		swat = "m",
		heavy_swat = "m",
		taser = "mtsr",
		cloaker = "mclk",
		bulldozer = "mbdz",
		medic = "mmdc"
	}
	self._speech_prefix_p2 = "n"
end	

function CharacterTweakData:_init_region_nypd()
	self._default_chatter = "dispatch_generic_message"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "d"
end

function CharacterTweakData:_init_region_lapd()
	self._default_chatter = "dispatch_generic_message"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "d"
end		

function CharacterTweakData:_init_region_fbi()
	self._default_chatter = "dispatch_generic_message"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "d"
end

function CharacterTweakData:get_ai_group_type()    
	return self.tweak_data.levels:get_ai_group_type()
end

function CharacterTweakData:_init_security(presets)	
	self.security = deep_clone(presets.base)
	self.security.tags = {"law"}
	self.security.experience = {}
	self.security.weapon = presets.weapon.normal
	self.security.detection = presets.detection.guard
	self.security.HEALTH_INIT = 4
	self.security.headshot_dmg_mul = 2.25
	self.security.damage_resistance = presets.damage_resistance.none
	self.security.move_speed = presets.move_speed.normal
	self.security.crouch_move = nil
	self.security.surrender_break_time = {20, 30}
	self.security.suppression = presets.suppression.easy
	self.security.surrender = presets.surrender.easy
	self.security.ecm_vulnerability = 0.6
	self.security.ecm_hurts = {
		ears = 6
	}
	self.security.weapon_voice = "3"
	self.security.melee_weapon = "baton"
	self.security.experience.cable_tie = "tie_swat"
	self.security.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.security.speech_prefix_p2 = "n"
	self.security.speech_prefix_count = 4
	self.security.access = "security"
	if job == "nmh" or job == "nmh_res" then
		self.security.has_alarm_pager = false
	else
		self.security.has_alarm_pager = true
	end
	self.security.use_radio = nil
	self.security.silent_priority_shout = "f37"
	self.security.dodge = presets.dodge.poor
	self.security.deathguard = false
	self.security.chatter = presets.enemy_chatter.guard
	if self:get_ai_group_type() == "murkywater" then
		self.security.radio_prefix = "fri_"
	elseif self:get_ai_group_type() == "russia" then
		self.security.radio_prefix = "rus_"
	end			
	self.security.static_dodge_preset = true
	self.security.shooting_death = false
	self.security.heal_cooldown = 1
	table.insert(self._enemy_list, "security")
	
	self.security_undominatable = deep_clone(self.security)
	self.security_undominatable.surrender = nil
	self.security_undominatable.unintimidateable = true
	table.insert(self._enemy_list, "security_undominatable")
	
	self.mute_security_undominatable = deep_clone(self.security)
	self.mute_security_undominatable.suppression = nil
	self.mute_security_undominatable.surrender = nil
	self.mute_security_undominatable.has_alarm_pager = false
	self.mute_security_undominatable.chatter = presets.enemy_chatter.no_chatter
	self.mute_security_undominatable.weapon_voice = "3"
	self.mute_security_undominatable.speech_prefix_p1 = "bb"
	self.mute_security_undominatable.speech_prefix_p2 = "n"
	self.mute_security_undominatable.speech_prefix_count = 1
	if job == "tag" or job == "xmn_tag" then
		self.mute_security_undominatable.failure_on_death = true
		self.mute_security_undominatable.unintimidateable = true
	end
	table.insert(self._enemy_list, "mute_security_undominatable")	
	
	self.security_mex = deep_clone(self.security)
	self.security_mex.speech_prefix_p1 = "m"
	self.security_mex.radio_prefix = "mex_"
	if job == "fex" then
		self.security_mex.melee_weapon = "fists"
	else
		self.security_mex.melee_weapon = "baton"
	end

	table.insert(self._enemy_list, "security_mex")	
	
	self.security_mex_no_pager = deep_clone(self.security)
	self.security_mex_no_pager.speech_prefix_p1 = "m"
	self.security_mex_no_pager.radio_prefix = "mex_"
	self.security_mex_no_pager.has_alarm_pager = false
	if job == "fex" then
		self.security_mex_no_pager.melee_weapon = "fists"
	else
		self.security_mex_no_pager.melee_weapon = "baton"
	end

	table.insert(self._enemy_list, "security_mex_no_pager")		
end

function CharacterTweakData:_init_gensec(presets)	
	self.gensec = deep_clone(presets.base)
	self.gensec.tags = {"law"}
	self.gensec.experience = {}
	self.gensec.weapon = presets.weapon.normal
	self.gensec.detection = presets.detection.guard
	self.gensec.HEALTH_INIT = 6
	self.gensec.headshot_dmg_mul = 3.4
	self.gensec.damage_resistance = presets.damage_resistance.none
	self.gensec.move_speed = presets.move_speed.very_fast
	self.gensec.crouch_move = nil
	self.gensec.surrender_break_time = {20, 30}
	self.gensec.suppression = presets.suppression.hard_def
	self.gensec.surrender = presets.surrender.easy
	self.gensec.ecm_vulnerability = 0.6
	self.gensec.ecm_hurts = {
		ears = 6
	}
	self.gensec.weapon_voice = "3"
	self.gensec.experience.cable_tie = "tie_swat"
	self.gensec.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.gensec.speech_prefix_p2 = "n"
	self.gensec.speech_prefix_count = 4
	self.gensec.access = "security"
	self.gensec.use_radio = nil
	self.gensec.silent_priority_shout = "f37"
	self.gensec.dodge = presets.dodge.athletic
	self.gensec.deathguard = false
	self.gensec.chatter = presets.enemy_chatter.guard
	if self:get_ai_group_type() == "murkywater" then
		self.gensec.radio_prefix = "fri_"
	elseif self:get_ai_group_type() == "russia" then
		self.gensec.radio_prefix = "rus_"
	end			
	if job == "nmh" or job == "nmh_res" then
		self.gensec.has_alarm_pager = false
	else
		self.gensec.has_alarm_pager = true
	end
	self.gensec.melee_weapon = "baton"
	self.gensec.heal_cooldown = 1
	table.insert(self._enemy_list, "gensec")
	
	--Guard variant, different entry type as a failsafe
	self.gensec_guard = deep_clone(self.gensec)	
	self.gensec_guard.access = "security"
	table.insert(self._enemy_list, "gensec_guard")
end

function CharacterTweakData:_init_cop(presets)	
	self.cop = deep_clone(presets.base)
	self.cop.tags = {"law"}
	self.cop.experience = {}
	self.cop.weapon = presets.weapon.normal
	self.cop.detection = presets.detection.normal
	self.cop.HEALTH_INIT = 4
	self.cop.headshot_dmg_mul = 2.25
	self.cop.damage_resistance = presets.damage_resistance.none
	self.cop.move_speed = presets.move_speed.normal
	self.cop.surrender_break_time = {10, 15}
	self.cop.suppression = presets.suppression.easy
	self.cop.surrender = presets.surrender.easy
	self.cop.ecm_vulnerability = 0.6
	self.cop.ecm_hurts = {
		ears = 6
	}
	self.cop.weapon_voice = "1"
	self.cop.experience.cable_tie = "tie_swat"
	self.cop.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.cop.speech_prefix_p2 = "n"
	self.cop.speech_prefix_count = 4
	if job == "wwh" then
		self.cop.access = "cop"
	else
		self.cop.access = "fbi"
	end
	self.cop.silent_priority_shout = "f37"
	self.cop.dodge = presets.dodge.average
	self.cop.deathguard = true
	self.cop.shooting_death = false
	self.cop.chatter = presets.enemy_chatter.cop
	self.cop.melee_weapon = "baton"
	self.cop.rescue_hostages = true
	self.cop.steal_loot = true
	self.cop.static_dodge_preset = true
	self.cop.has_alarm_pager = false
	self.cop.heal_cooldown = 1
	self.cop.overheal_mult = 2
	table.insert(self._enemy_list, "cop")
	self.cop_scared = deep_clone(self.cop)
	self.cop_scared.surrender = presets.surrender.always
	self.cop_scared.surrender_break_time = nil
	table.insert(self._enemy_list, "cop_scared")
	
	self.cop_forest = deep_clone(self.cop)
	self.cop_forest.speech_prefix_p1 = "l"
	self.cop_forest.speech_prefix_p2 = "n"
	self.cop_forest.speech_prefix_count = 4		
	self.cop_forest.access = "gangster"
	table.insert(self._enemy_list, "cop_forest")
	
	self.cop_female = deep_clone(self.cop)
	self.cop_female.speech_prefix_p1 = "fl"
	self.cop_female.speech_prefix_p2 = "n"
	self.cop_female.speech_prefix_count = 1
	self.cop_female.tags = {"law", "female_enemy"}
	table.insert(self._enemy_list, "cop_female")
	self.cop_civ = deep_clone(self.cop)
	self.cop_civ.weapon = presets.weapon.normal
	self.cop_civ.detection = presets.detection.normal_undercover
	self.cop_civ.HEALTH_INIT = 0.9
	self.cop_civ.headshot_dmg_mul = 1.7
	self.cop_civ.surrender = nil
	self.cop_civ.unintimidateable = true
	self.cop_civ.silent_priority_shout = nil
	self.cop_civ.melee_weapon = nil
	self.cop_civ.move_speed = presets.move_speed.very_fast
	table.insert(self._enemy_list, "cop_civ")
	
	self.dave = deep_clone(self.cop)
	self.dave.weapon = deep_clone(presets.weapon.expert)
	self.dave.detection = presets.detection.normal
	self.dave.dodge = presets.dodge.elite
	self.dave.HEALTH_INIT = 20
	self.dave.headshot_dmg_mul = 2
	self.dave.silent_priority_shout = nil
	self.dave.melee_weapon = "fists_dozer"
	self.dave.move_speed = presets.move_speed.lightning
	self.dave.custom_voicework = "big_dave"
	self.dave.can_shoot_while_dodging = true
	self.dave.can_slide_on_suppress = true
	self.dave.steal_loot = true
	self.dave.access = "fbi"
	self.dave.speech_prefix_p1 = "fuckyou"
	self.dave.speech_prefix_count = nil   
	self.dave.heal_cooldown = 5
	self.dave.overheal_mult = 1
end

function CharacterTweakData:_init_fbi(presets)	
	self.fbi = deep_clone(presets.base)
	self.fbi.tags = {"law"}
	self.fbi.experience = {}
	self.fbi.weapon = presets.weapon.normal
	self.fbi.detection = presets.detection.normal
	self.fbi.HEALTH_INIT = 6
	self.fbi.headshot_dmg_mul = 3.4
	self.fbi.damage_resistance = presets.damage_resistance.none
	self.fbi.move_speed = presets.move_speed.very_fast
	self.fbi.surrender_break_time = {7, 12}
	self.fbi.suppression = presets.suppression.hard_def
	self.fbi.surrender = presets.surrender.easy
	self.fbi.ecm_vulnerability = 0.6
	self.fbi.ecm_hurts = {
			ears = 6
		}
	self.fbi.weapon_voice = "2"
	self.fbi.experience.cable_tie = "tie_swat"
	self.fbi.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.fbi.speech_prefix_p2 = "n"
	self.fbi.speech_prefix_count = 4
	self.fbi.can_slide_on_suppress = true
	self.fbi.silent_priority_shout = "f37"
	self.fbi.access = "fbi"
	self.fbi.dodge = presets.dodge.athletic
	self.fbi.deathguard = true
	self.fbi.chatter = presets.enemy_chatter.cop
	self.fbi.steal_loot = true
	self.fbi.rescue_hostages = true
	self.fbi.no_arrest = false
	self.fbi.heal_cooldown = 1
	self.fbi.overheal_mult = 2
	table.insert(self._enemy_list, "fbi")
	
	--Female FBI Agents (Unused)
	self.fbi_female = deep_clone(self.fbi)
	self.fbi_female.speech_prefix_p1 = "fl"
	self.fbi_female.speech_prefix_p2 = "n"
	self.fbi_female.speech_prefix_count = 1
	self.fbi_female.tags = {"law", "female_enemy"}
	table.insert(self._enemy_list, "fbi_female")
	
	--Veteran Cop
	self.fbi_vet = deep_clone(self.fbi)
	self.fbi_vet.tags = {"law", "custom", "special"}
	self.fbi_vet.priority_shout = "g29"
	self.fbi_vet.bot_priority_shout = "g29"
	self.fbi_vet.priority_shout_max_dis = 3000
	self.fbi_vet.is_special = true
	self.fbi_vet.custom_shout = true		
	self.fbi_vet.can_shoot_while_dodging = true
	self.fbi_vet.can_slide_on_suppress = true
	self.fbi_vet.HEALTH_INIT = 12
	self.fbi_vet.headshot_dmg_mul = 1.5
	self.fbi_vet.gas_on_death = true
	self.fbi_vet.dodge = presets.dodge.veteran
	self.fbi_vet.access = "spooc"
	self.fbi_vet.damage.hurt_severity = presets.hurt_severities.elite
	self.fbi_vet.use_animation_on_fire_damage = false
	self.fbi_vet.move_speed = presets.move_speed.lightning
	self.fbi_vet.surrender = nil
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
	   self.fbi_vet.custom_voicework = nil	
	else   
	   self.fbi_vet.custom_voicework = "bruce"
	end   
	self.fbi_vet.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.05

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}	
	self.fbi_vet.static_dodge_preset = true
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.fbi_vet.speech_prefix_p1 = self._prefix_data_p1.swat()
		self.fbi_vet.speech_prefix_p2 = self._speech_prefix_p2
		self.fbi_vet.speech_prefix_count = 4
	else
		self.fbi_vet.speech_prefix_p1 = "heck"
		self.fbi_vet.speech_prefix_count = nil	
	end
	self.fbi_vet.heal_cooldown = 1
	self.fbi_vet.overheal_mult = 1
	table.insert(self._enemy_list, "fbi_vet")	

	--FBI Boss
	self.fbi_vet_boss = deep_clone(self.fbi_vet)
	self.fbi_vet_boss.HEALTH_INIT = 24
	self.fbi_vet_boss.headshot_dmg_mul = 3.4		
	self.fbi_vet_boss.melee_weapon = "buzzer_summer"
	self.fbi_vet_boss.tase_on_melee = true
	self.fbi_vet_boss.heal_cooldown = 1.875
	self.fbi_vet_boss.rescue_hostages = false
	self.fbi_vet_boss.steal_loot = false	
	self.fbi_vet_boss.gas_on_death = false
	table.insert(self._enemy_list, "fbi_vet_boss")	
		
	self.meme_man = deep_clone(self.fbi_vet)		
	self.meme_man.tags = {"law", "tank", "special"}		
	self.meme_man.HEALTH_INIT = 500
	self.meme_man.headshot_dmg_mul = 12.5		
	self.meme_man.can_shoot_while_dodging = true
	self.meme_man.smoke_dodge_increase = 10
	self.meme_man.priority_shout = "f30"
	self.meme_man.bot_priority_shout = "f30x_any"
	self.meme_man.priority_shout_max_dis = 3000		
	self.meme_man.dodge = presets.dodge.veteran
	self.meme_man.allowed_stances = {cbt = true} 
	self.meme_man.access = "gangster"
	self.meme_man.use_animation_on_fire_damage = false
	self.meme_man.move_speed = presets.move_speed.lightning
	self.meme_man.surrender = nil
	self.meme_man.is_special = true
	self.meme_man.no_asu = true
	self.meme_man.heal_cooldown = 22.5
	self.meme_man.rescue_hostages = false
	self.meme_man.steal_loot = false
	table.insert(self._enemy_list, "meme_man")	
	self.meme_man_shield = deep_clone(self.meme_man)		
	self.meme_man_shield.tags = {"medic", "special", "shield"}		
	self.meme_man_shield.priority_shout = "f30"
	self.meme_man_shield.bot_priority_shout = "f30x_any"
	self.meme_man_shield.priority_shout_max_dis = 3000				
	self.meme_man_shield.access = "gangster"
	self.meme_man_shield.use_animation_on_fire_damage = false
	self.meme_man_shield.surrender = nil
	self.meme_man_shield.is_special = true
	self.meme_man_shield.rotation_speed = 0.75
	self.meme_man_shield.no_asu = true
	self.meme_man_shield.unintimidateable = true
	self.meme_man_shield.allowed_poses = {crouch = true}
	self.meme_man_shield.always_face_enemy = true
	self.meme_man_shield.move_speed = presets.move_speed.fast
	self.meme_man_shield.no_run_start = true
	self.meme_man_shield.no_run_stop = true
	self.meme_man_shield.no_retreat = true
	self.meme_man_shield.no_limping = true
	self.meme_man_shield.no_arrest = true
	self.meme_man_shield.no_equip_anim = true
	self.meme_man_shield.wall_fwd_offset = 100
	self.meme_man_shield.calls_in = nil
	self.meme_man_shield.ignore_medic_revive_animation = true
	self.meme_man_shield.damage.hurt_severity = presets.hurt_severities.only_explosion_hurts
	self.meme_man_shield.damage.shield_knocked = true		
	table.insert(self._enemy_list, "meme_man_shield")	

	--April Fools Vet Cop
	self.vetlod = deep_clone(self.fbi_vet)	
	self.vetlod.speech_prefix_p1 = "buge"
	self.vetlod.speech_prefix_p2 = nil
	self.vetlod.speech_prefix_count = nil		
	self.vetlod.custom_voicework = "tdozer"
	self.vetlod.access = "fbi"
	table.insert(self._enemy_list, "vetlod")							
end

function CharacterTweakData:_init_medic(presets)	
	self.medic = deep_clone(presets.base)
	self.medic.tags = {"law", "medic", "special"}
	self.medic.experience = {}
	self.medic.weapon = deep_clone(presets.weapon.normal)
	self.medic.detection = presets.detection.normal
	self.medic.HEALTH_INIT = 30
	self.medic.headshot_dmg_mul = 2.2
	self.medic.damage_resistance = presets.damage_resistance.none
	self.medic.damage.dot_damage_mul = 0.75
	self.medic.damage.hurt_severity = presets.hurt_severities.base_no_poison
	self.medic.suppression = nil
	self.medic.surrender = presets.surrender.special
	self.medic.move_speed = presets.move_speed.very_fast
	self.medic.surrender_break_time = {7, 12}
	self.medic.ecm_vulnerability = 0.6
	self.medic.ecm_hurts = {
		ears = 6
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
	if self:get_ai_group_type() == "murkywater" then
	    self.medic.custom_voicework = "murky_medic"
	else	
	    self.medic.custom_voicework = nil
	end	
	
	self.medic.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.medic.priority_shout = "f47"
	self.medic.bot_priority_shout = "f47x_any"
	self.medic.priority_shout_max_dis = 3000
	self.medic.is_special = true
	self.medic.static_weapon_preset = true
	self.medic.no_asu = true
	self.medic.no_omnia_heal = true
	self.medic.can_be_healed = false
	table.insert(self._enemy_list, "medic")
	
	self.medic_summers = deep_clone(self.medic)
	self.medic_summers.HEALTH_INIT = 120
	self.medic_summers.headshot_dmg_mul = 1.5
	self.medic_summers.damage_resistance = presets.damage_resistance.none
	self.medic_summers.tags = {"custom", "special"}
	self.medic_summers.ignore_medic_revive_animation = false
	self.medic_summers.surrender = nil
	self.medic_summers.flammable = false
	self.medic_summers.use_animation_on_fire_damage = false
	self.medic_summers.damage.explosion_damage_mul = 0.25
	self.medic_summers.damage.rocket_damage_mul = 0.25
	self.medic_summers.damage.fire_damage_mul = 0.25
	self.medic_summers.damage.fire_pool_damage_mul = 0.25
	self.medic_summers.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.medic_summers.ecm_vulnerability = 0
	self.medic_summers.ecm_hurts = {}			
	self.medic_summers.immune_to_concussion = true
	self.medic_summers.no_damage_mission = true
	self.medic_summers.no_limping = true
	self.medic_summers.no_retreat = true
	self.medic_summers.no_arrest = true
	self.medic_summers.immune_to_knock_down = true
	self.medic_summers.immune_to_ff_exp = true
	self.medic_summers.immune_to_ff_fire = true
	self.medic_summers.priority_shout = "f45"
	self.medic_summers.bot_priority_shout = "f45x_any"
	self.medic_summers.speech_prefix_p1 = "rmdc"
	self.medic_summers.speech_prefix_p2 = nil
	self.medic_summers.custom_voicework = nil
	self.medic_summers.spawn_sound_event = "rmdc_entrance"
	self.medic_summers.die_sound_event = "mga_death_scream"
	self.medic_summers.use_radio = "dsp_radio_russian"
	self.medic_summers.chatter = presets.enemy_chatter.omnia_lpf
	self.medic_summers.is_special = true
	self.medic_summers.static_weapon_preset = false
	self.medic_summers.no_asu = true
	self.medic_summers.do_omnia = true
	self.medic_summers.follower = true
	self.medic_summers.no_omnia_heal = true
	self.medic_summers.can_be_healed = false
	self.medic_summers.min_obj_interrupt_dis = 300
	self.medic_summers.reduce_summers_dr_on_death = true
	table.insert(self._enemy_list, "medic_summers")
end

function CharacterTweakData:_init_omnia_lpf(presets)	
	self.omnia_lpf = deep_clone(presets.base)
	self.omnia_lpf.experience = {}
	self.omnia_lpf.weapon = deep_clone(presets.weapon.normal)
	self.omnia_lpf.detection = presets.detection.normal
	self.omnia_lpf.HEALTH_INIT = 45
	self.omnia_lpf.headshot_dmg_mul = 2.2
	self.omnia_lpf.damage.melee_damage_mul = 1.25
	self.omnia_lpf.damage_resistance = presets.damage_resistance.none
	self.omnia_lpf.move_speed = presets.move_speed.very_fast
	self.omnia_lpf.surrender_break_time = {7, 12}
	self.omnia_lpf.suppression = nil
	self.omnia_lpf.surrender = nil
	self.omnia_lpf.ecm_vulnerability = 0.6
	self.omnia_lpf.ecm_hurts = {
		ears = 6
	}
	self.omnia_lpf.weapon_voice = "2"
	self.omnia_lpf.experience.cable_tie = "tie_swat"	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.omnia_lpf.speech_prefix_p1 = self._prefix_data_p1.medic()
		self.omnia_lpf.speech_prefix_count = nil
		self.omnia_lpf.spawn_sound_event = "rmdc_entrance"
	else
		self.omnia_lpf.speech_prefix_p1 = "piss and shit"
		self.omnia_lpf.speech_prefix_p2 = nil
		self.omnia_lpf.speech_prefix_count = nil
		self.omnia_lpf.spawn_sound_event = nil
	end				
	self.omnia_lpf.access = "swat"
	self.omnia_lpf.dodge = presets.dodge.elite
	self.omnia_lpf.no_arrest = true
	self.omnia_lpf.chatter = presets.enemy_chatter.omnia_lpf
	self.omnia_lpf.melee_weapon = "baton"
	self.omnia_lpf.melee_weapon_dmg_multiplier = 1
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.omnia_lpf.custom_voicework = nil
	elseif self:get_ai_group_type() == "zombie" then
		self.omnia_lpf.custom_voicework = "awoolpf"
	else
		self.omnia_lpf.custom_voicework = "olpf"
	end
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.omnia_lpf.yellow_blood = false
	else
		self.omnia_lpf.yellow_blood = true
	end
	self.omnia_lpf.priority_shout = "f47"
	self.omnia_lpf.bot_priority_shout = "f47x_any"
	self.omnia_lpf.tags = {"law", "lpf", "special", "customvo"}
	self.omnia_lpf.do_omnia = true
	self.omnia_lpf.no_omnia_heal = true
	self.omnia_lpf.can_be_healed = false
	self.omnia_lpf.spawn_sound_event_2 = "cloaker_spawn"
	self.omnia_lpf.die_sound_event_2 = "mga_death_scream"		
	self.omnia_lpf.is_special = true
	self.omnia_lpf.no_asu = true
	self.omnia_lpf.marshal_logic = true
	table.insert(self._enemy_list, "omnia_lpf")
end

function CharacterTweakData:_init_swat(presets)	
	self.swat = deep_clone(presets.base)
	self.swat.tags = {"law"}
	self.swat.experience = {}
	self.swat.weapon = presets.weapon.normal
	self.swat.detection = presets.detection.normal
	self.swat.HEALTH_INIT = 8
	self.swat.headshot_dmg_mul = 3.5
	self.swat.damage_resistance = presets.damage_resistance.none
	self.swat.move_speed = presets.move_speed.very_fast
	self.swat.surrender_break_time = {6, 10}
	self.swat.suppression = presets.suppression.hard_agg
	self.swat.surrender = presets.surrender.hard
	self.swat.ecm_vulnerability = 0.6
	self.swat.ecm_hurts = {
		ears = 6
	}
	self.swat.weapon_voice = "2"
	self.swat.experience.cable_tie = "tie_swat"
	self.swat.speech_prefix_p1 = self._prefix_data_p1.cop()
	self.swat.speech_prefix_p2 = "n"
	self.swat.speech_prefix_count = 4
	self.swat.can_slide_on_suppress = true	
	--Just in case, makes them be able to go for the hostage
	if managers.skirmish and managers.skirmish:is_skirmish() then
		self.swat.access = "fbi"
	else
		self.swat.access = "swat"
	end
	self.swat.dodge = presets.dodge.athletic
	self.swat.no_arrest = false
	self.swat.chatter = presets.enemy_chatter.swat
	self.swat.melee_weapon = nil
	self.swat.melee_weapon_dmg_multiplier = 1
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "zombie" then
	    self.swat.has_alarm_pager = true
	else
	    self.swat.has_alarm_pager = false
	end
	if job == "kosugi" or job == "dark" then
		self.swat.shooting_death = false
		self.swat.radio_prefix = "fri_"
		self.swat.use_radio = "dsp_radio_russian"
	else
		self.swat.shooting_death = true
	end		
	self.swat.silent_priority_shout = "f37"
	self.swat.heal_cooldown = 1.25
	self.swat.overheal_mult = 2
	table.insert(self._enemy_list, "swat")
	
	self.zeal_swat = deep_clone(self.swat)
	table.insert(self._enemy_list, "zeal_swat")
	
	self.hrt = deep_clone(self.swat)
	self.hrt.access = "fbi"
	self.hrt.headshot_dmg_mul = 2
	self.hrt.rescue_hostages = true
	self.hrt.steal_loot = true	
	table.insert(self._enemy_list, "hrt")
	
	self.hrt_titan = deep_clone(self.hrt)
	self.hrt_titan.tags = {"law", "custom", "special"}
	self.hrt_titan.priority_shout = "g29"
	self.hrt_titan.bot_priority_shout = "g29"
	self.hrt_titan.is_special = true
	self.hrt_titan.priority_shout_max_dis = 3000
	self.hrt_titan.silent_priority_shout = nil
	self.hrt_titan.custom_shout = true	
	self.hrt_titan.can_slide_on_suppress = true
	self.hrt_titan.damage.hurt_severity = presets.hurt_severities.elite_easy
	self.hrt_titan.use_animation_on_fire_damage = true
	self.hrt_titan.move_speed = presets.move_speed.very_fast
	self.hrt_titan.dodge = presets.dodge.elite
	self.hrt_titan.HEALTH_INIT = 13
	self.hrt_titan.headshot_dmg_mul = 1.625
	self.hrt_titan.surrender = nil
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.hrt_titan.custom_voicework = nil
	else
		self.hrt_titan.custom_voicework = "asu"
	end	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
	    self.hrt_titan.speech_prefix_p1 = self._prefix_data_p1.cop()
	    self.hrt_titan.speech_prefix_p2 = "n"
	    self.hrt_titan.speech_prefix_count = 4
	else
	    self.hrt_titan.speech_prefix_p1 = "gaming"
	    self.hrt_titan.speech_prefix_p2 = nil
	    self.hrt_titan.speech_prefix_count = nil
	end	
	self.hrt_titan.static_dodge_preset = true
	self.hrt_titan.heal_cooldown = 1.875
	self.hrt_titan.overheal_mult = 1
	self.hrt_titan.rescue_hostages = true
	self.hrt_titan.steal_loot = true		
	self.hrt_titan.do_asu = true
	self.hrt_titan.no_asu = true
	self.hrt_titan.marshal_logic = true
	table.insert(self._enemy_list, "hrt_titan")
end

function CharacterTweakData:_init_heavy_swat(presets)	
	self.heavy_swat = deep_clone(presets.base)
	self.heavy_swat.tags = {"law"}
	self.heavy_swat.experience = {}
	self.heavy_swat.weapon = presets.weapon.normal
	self.heavy_swat.detection = presets.detection.normal
	self.heavy_swat.HEALTH_INIT = 13
	self.heavy_swat.headshot_dmg_mul = 3.25
	self.heavy_swat.damage_resistance = presets.damage_resistance.none
	self.heavy_swat.damage.explosion_damage_mul = 0.75
	self.heavy_swat.damage.fire_damage_mul = 0.75
	self.heavy_swat.damage.fire_pool_damage_mul = 0.75
	self.heavy_swat.move_speed = presets.move_speed.fast
	self.heavy_swat.surrender_break_time = {6, 8}
	self.heavy_swat.suppression = presets.suppression.hard_agg
	self.heavy_swat.surrender = presets.surrender.hard
	self.heavy_swat.damage.hurt_severity = presets.hurt_severities.heavy
	self.heavy_swat.ecm_vulnerability = 0.6
	self.heavy_swat.ecm_hurts = {
		ears = 6
	}
	self.heavy_swat.weapon_voice = "2"
	self.heavy_swat.experience.cable_tie = "tie_swat"
	self.heavy_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.heavy_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.heavy_swat.speech_prefix_count = 4
	self.heavy_swat.can_slide_on_suppress = true	
	self.heavy_swat.access = "swat"
	self.heavy_swat.dodge = presets.dodge.heavy
	self.heavy_swat.no_arrest = false
	self.heavy_swat.chatter = presets.enemy_chatter.swat
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "zombie" then
	    self.heavy_swat.has_alarm_pager = true
	else
	    self.heavy_swat.has_alarm_pager = false
	end
	if job == "kosugi" or job == "dark" then
		self.heavy_swat.shooting_death = false
		self.heavy_swat.radio_prefix = "fri_"
		self.heavy_swat.use_radio = "dsp_radio_russian"
	else
		self.heavy_swat.shooting_death = true
	end			
	self.heavy_swat.silent_priority_shout = "f37"
	self.heavy_swat.static_weapon_preset = false
	self.heavy_swat.static_dodge_preset = true
	self.heavy_swat.static_melee_preset = false	
	self.heavy_swat.heal_cooldown = 2.5
	table.insert(self._enemy_list, "heavy_swat")
	
	self.zeal_heavy_swat = deep_clone(self.heavy_swat)
	table.insert(self._enemy_list, "zeal_heavy_swat")
	
	--Titan Sniper
	self.heavy_swat_sniper = deep_clone(self.heavy_swat)
	self.heavy_swat_sniper.tags = {"law", "sniper", "special", "customvo"}
	self.heavy_swat_sniper.priority_shout = "f34"
	self.heavy_swat_sniper.bot_priority_shout = "f34x_any"
	self.heavy_swat_sniper.priority_shout_max_dis = 3000
	self.heavy_swat_sniper.weapon = deep_clone(presets.weapon.normal)
	self.heavy_swat_sniper.HEALTH_INIT = 19.5
	self.heavy_swat_sniper.headshot_dmg_mul = 3.25
	self.heavy_swat_sniper.damage_resistance = presets.damage_resistance.none
	self.heavy_swat_sniper.surrender_break_time = {6, 10}
	self.heavy_swat_sniper.suppression = nil
	self.heavy_swat_sniper.surrender = nil
	self.heavy_swat_sniper.no_arrest = true
	self.heavy_swat_sniper.ecm_vulnerability = 0.6
	self.heavy_swat_sniper.ecm_hurts = {
		ears = 6
	}
	self.heavy_swat_sniper.experience.cable_tie = "tie_swat"
	self.heavy_swat_sniper.speech_prefix_p1 = "fug"
	self.heavy_swat_sniper.speech_prefix_p2 = nil
	self.heavy_swat_sniper.speech_prefix_count = 1
	self.heavy_swat_sniper.access = "swat"
	self.heavy_swat_sniper.damage.hurt_severity = presets.hurt_severities.elite
	self.heavy_swat_sniper.use_animation_on_fire_damage = false
	self.heavy_swat_sniper.move_speed = presets.move_speed.very_fast
	self.heavy_swat_sniper.dodge = presets.dodge.elite
	self.heavy_swat_sniper.chatter = presets.enemy_chatter.swat
	self.heavy_swat_sniper.melee_weapon = nil
	self.heavy_swat_sniper.melee_weapon_dmg_multiplier = 2.5
	self.heavy_swat_sniper.has_alarm_pager = false
	self.heavy_swat_sniper.calls_in = true
	self.heavy_swat_sniper.static_dodge_preset = true
	self.heavy_swat_sniper.static_melee_preset = true	
	self.heavy_swat_sniper.custom_voicework = nil
	self.heavy_swat_sniper.spawn_sound_event = "cloaker_spawn"
	self.heavy_swat_sniper.die_sound_event = "mga_death_scream"
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.heavy_swat_sniper.custom_voicework = "tswat_ru"
	else
		self.heavy_swat_sniper.custom_voicework = "tsniper"
	end
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
	self.heavy_swat_sniper.yellow_blood = false
	else
	self.heavy_swat_sniper.yellow_blood = true
	end
	self.heavy_swat_sniper.is_special = true
	self.heavy_swat_sniper.no_asu = true
	self.heavy_swat_sniper.marshal_logic = true
	self.heavy_swat_sniper.heal_cooldown = 2.5
	table.insert(self._enemy_list, "heavy_swat_sniper")
	
	--Weekend Snipers
	self.weekend_dmr = deep_clone(self.heavy_swat_sniper)
	self.weekend_dmr.speech_prefix_p1 = "cum"
	self.weekend_dmr.speech_prefix_p2 = nil
	self.weekend_dmr.speech_prefix_count = nil
	if self:get_ai_group_type() == "russia" then
		self.weekend_dmr.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "murkywater" then
		self.weekend_dmr.custom_voicework = "bravo_elite_murky"	
	elseif self:get_ai_group_type() == "federales" then
		self.weekend_dmr.custom_voicework = "bravo_elite_mex"
	else
		self.weekend_dmr.custom_voicework = "bravo_dmr"
	end	
	self.weekend_dmr.HEALTH_INIT = 24.375
	self.weekend_dmr.headshot_dmg_mul = 4.0625
	self.weekend_dmr.heal_cooldown = 2.5
	self.weekend_dmr.marshal_logic = true
	self.weekend_dmr.can_throw_frag = true
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "zombie" then
		self.weekend_dmr.yellow_blood = true
	else	
		self.weekend_dmr.yellow_blood = false
	end
	table.insert(self._enemy_list, "weekend_dmr")
end

function CharacterTweakData:_init_fbi_swat(presets)	
	self.fbi_swat = deep_clone(presets.base)
	self.fbi_swat.tags = {"law"}
	self.fbi_swat.experience = {}
	self.fbi_swat.weapon = deep_clone(presets.weapon.good)
	self.fbi_swat.detection = presets.detection.normal
	self.fbi_swat.HEALTH_INIT = 15
	self.fbi_swat.headshot_dmg_mul = 3
	self.fbi_swat.damage_resistance = presets.damage_resistance.none
	self.fbi_swat.move_speed = presets.move_speed.very_fast
	self.fbi_swat.surrender_break_time = {6, 10}
	self.fbi_swat.suppression = presets.suppression.hard_def
	self.fbi_swat.surrender = presets.surrender.hard
	self.fbi_swat.ecm_vulnerability = 0.6
	self.fbi_swat.ecm_hurts = {
		ears = 6
	}
	self.fbi_swat.weapon_voice = "2"
	self.fbi_swat.experience.cable_tie = "tie_swat"
	self.fbi_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.fbi_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.fbi_swat.speech_prefix_count = 4
	self.fbi_swat.can_slide_on_suppress = true	
	self.fbi_swat.access = "swat"
	self.fbi_swat.dodge = presets.dodge.athletic_very_hard
	self.fbi_swat.no_arrest = false
	self.fbi_swat.chatter = presets.enemy_chatter.swat
	if self:get_ai_group_type() == "zombie" then
	    self.fbi_swat.has_alarm_pager = true
	else
	    self.fbi_swat.has_alarm_pager = false
	end
	self.fbi_swat.silent_priority_shout = "f37"
	self.fbi_swat.melee_weapon = "knife_1"
	self.fbi_swat.melee_weapon_dmg_multiplier = 2
	self.fbi_swat.static_weapon_preset = true
	self.fbi_swat.static_dodge_preset = true
	self.fbi_swat.static_melee_preset = true
	self.fbi_swat.heal_cooldown = 1.25
	self.fbi_swat.overheal_mult = 1.5
	table.insert(self._enemy_list, "fbi_swat")
	
	self.fbi_swat_vet = deep_clone(self.fbi_swat)
	self.fbi_swat_vet.melee_weapon_dmg_multiplier = 2
	table.insert(self._enemy_list, "fbi_swat_vet")
end

function CharacterTweakData:_init_fbi_heavy_swat(presets)	
	self.fbi_heavy_swat = deep_clone(presets.base)
	self.fbi_heavy_swat.tags = {"law"}
	self.fbi_heavy_swat.experience = {}
	self.fbi_heavy_swat.weapon = deep_clone(presets.weapon.normal)
	self.fbi_heavy_swat.detection = presets.detection.normal
	self.fbi_heavy_swat.HEALTH_INIT = 20
	self.fbi_heavy_swat.headshot_dmg_mul = 2
	self.fbi_heavy_swat.damage.explosion_damage_mul = 0.75
	self.fbi_heavy_swat.damage.fire_damage_mul = 0.75
	self.fbi_heavy_swat.damage.fire_pool_damage_mul = 0.75	
	self.fbi_heavy_swat.damage_resistance = presets.damage_resistance.none
	self.fbi_heavy_swat.damage.non_ap_damage_mul = 1
	self.fbi_heavy_swat.move_speed = presets.move_speed.fast
	self.fbi_heavy_swat.surrender_break_time = {6, 8}
	self.fbi_heavy_swat.suppression = presets.suppression.hard_agg
	self.fbi_heavy_swat.surrender = presets.surrender.hard
	self.fbi_heavy_swat.damage.hurt_severity = presets.hurt_severities.heavy
	self.fbi_heavy_swat.ecm_vulnerability = 0.6
	self.fbi_heavy_swat.ecm_hurts = {
		ears = 6
	}
	self.fbi_heavy_swat.weapon_voice = "2"
	self.fbi_heavy_swat.experience.cable_tie = "tie_swat"
	self.fbi_heavy_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.fbi_heavy_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.fbi_heavy_swat.speech_prefix_count = 4
	self.fbi_heavy_swat.can_slide_on_suppress = true	
	self.fbi_heavy_swat.access = "swat"
	self.fbi_heavy_swat.dodge = presets.dodge.heavy_very_hard
	self.fbi_heavy_swat.no_arrest = false
	self.fbi_heavy_swat.melee_weapon = "knife_1"
	self.fbi_heavy_swat.melee_weapon_dmg_multiplier = 1
	self.fbi_heavy_swat.chatter = presets.enemy_chatter.swat
	if self:get_ai_group_type() == "zombie" then
	    self.fbi_heavy_swat.has_alarm_pager = true
	else
	    self.fbi_heavy_swat.has_alarm_pager = false
	end
	self.fbi_heavy_swat.silent_priority_shout = "f37"
	self.fbi_heavy_swat.static_weapon_preset = true
	self.fbi_heavy_swat.static_dodge_preset = true
	self.fbi_heavy_swat.static_melee_preset = true	
	self.fbi_heavy_swat.heal_cooldown = 1.875
	table.insert(self._enemy_list, "fbi_heavy_swat")
end

function CharacterTweakData:_init_city_swat(presets)	
	self.city_swat = deep_clone(presets.base)
	self.city_swat.tags = {"law", "city_swat"}
	self.city_swat.experience = {}
	self.city_swat.weapon = deep_clone(presets.weapon.expert)
	self.city_swat.detection = presets.detection.normal
	self.city_swat.HEALTH_INIT = 15
	self.city_swat.headshot_dmg_mul = 3
	self.city_swat.damage_resistance = presets.damage_resistance.none
	self.city_swat.move_speed = presets.move_speed.very_fast
	self.city_swat.surrender_break_time = {6, 10}
	self.city_swat.suppression = presets.suppression.hard_def
	self.city_swat.surrender = presets.surrender.hard
	self.city_swat.no_arrest = false
	self.city_swat.ecm_vulnerability = 0.6
	self.city_swat.ecm_hurts = {
		ears = 6
	}
	self.city_swat.weapon_voice = "2"
	self.city_swat.experience.cable_tie = "tie_swat"
	self.city_swat.silent_priority_shout = "f37"
	self.city_swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.city_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.city_swat.speech_prefix_count = 4
	self.city_swat.can_slide_on_suppress = true	
	self.city_swat.access = "swat"
	self.city_swat.dodge = presets.dodge.athletic_overkill
	self.city_swat.chatter = presets.enemy_chatter.swat
	self.city_swat.melee_weapon = "knife_1"
	self.city_swat.melee_weapon_dmg_multiplier = 2.5
	if job == "kosugi" then
		self.city_swat.shooting_death = false
		self.city_swat.radio_prefix = "fri_"
		self.city_swat.use_radio = "dsp_radio_russian"
	else
		self.city_swat.shooting_death = true
	end	
	self.city_swat.has_alarm_pager = true
	self.city_swat.calls_in = true
	self.city_swat.static_weapon_preset = true
	self.city_swat.static_dodge_preset = true
	self.city_swat.static_melee_preset = true	
	self.city_swat.custom_voicework = nil
	self.city_swat.heal_cooldown = 1.25
	self.city_swat.overheal_mult = 1.5
	table.insert(self._enemy_list, "city_swat")
	
	--Guard variant, different entry type as a failsafe
	self.city_swat_guard = deep_clone(self.city_swat)	
	self.city_swat_guard.headshot_dmg_mul = 8.5
	self.city_swat_guard.access = "security"
	self.city_swat_guard.chatter = presets.enemy_chatter.guard
	if job == "nmh" or job == "nmh_res" then
		self.city_swat_guard.has_alarm_pager = false
	else
		self.city_swat_guard.has_alarm_pager = true
	end
	self.city_swat_guard.melee_weapon = "baton"
	self.city_swat_guard.use_radio = nil
	table.insert(self._enemy_list, "city_swat_guard")
			
	--Weekend
	self.weekend = deep_clone(self.city_swat)
	if self:get_ai_group_type() == "russia" then
		self.weekend.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "murkywater" then
		self.weekend.custom_voicework = "bravo_murky"	
	elseif self:get_ai_group_type() == "federales" then
		self.weekend.custom_voicework = "bravo_mex"
	else
		self.weekend.custom_voicework = "bravo"
	end	
	self.weekend.HEALTH_INIT = 18.75
	self.weekend.headshot_dmg_mul = 3.75
	self.weekend.speech_prefix_p1 = "null"
	self.weekend.speech_prefix_p2 = nil
	self.weekend.speech_prefix_count = nil	
	self.weekend.heal_cooldown = 1.25
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "zombie" then
		self.weekend.yellow_blood = true
	else	
		self.weekend.yellow_blood = false
	end	
	self.weekend.can_throw_frag = true
	self.weekend.surrender = presets.surrender.bravo
	table.insert(self._enemy_list, "weekend")	

	--Weekend (Guard Variant)
	self.weekend_guard = deep_clone(self.weekend)
	self.weekend_guard.can_throw_frag = false
	self.weekend_guard.yellow_blood = false
	self.weekend_guard.chatter = presets.enemy_chatter.guard
	if job == "shoutout_raid" then
		self.weekend_guard.access = "swat"
	else
		self.weekend_guard.access = "security"
	end
	table.insert(self._enemy_list, "weekend_guard")
	
	--Titan SWAT (LMG)
	self.city_swat_titan = deep_clone(self.city_swat)
	self.city_swat_titan.tags = {"law", "custom", "special"}
	self.city_swat_titan.priority_shout = "g29"
	self.city_swat_titan.bot_priority_shout = "g29"
	self.city_swat_titan.priority_shout_max_dis = 3000
	self.city_swat_titan.is_special = true
	self.city_swat_titan.silent_priority_shout = nil
	self.city_swat_titan.custom_shout = true		
	self.city_swat_titan.can_slide_on_suppress = true
	self.city_swat_titan.dt_suppress = {
		range = 1400
	}
	self.city_swat_titan.speech_prefix_p1 = "null"
	self.city_swat_titan.speech_prefix_p2 = nil
	self.city_swat_titan.speech_prefix_count = nil	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.city_swat_titan.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "zombie" then
		self.city_swat_titan.custom_voicework = "skeleton"
	else
		self.city_swat_titan.custom_voicework = "pdth"
	end
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.city_swat_titan.yellow_blood = false
	else
		self.city_swat_titan.yellow_blood = true
	end
	self.city_swat_titan.HEALTH_INIT = 22.5
	self.city_swat_titan.headshot_dmg_mul = 2.65
	self.city_swat_titan.damage.hurt_severity = presets.hurt_severities.elite_easy
	self.city_swat_titan.damage.bullet_damage_mul = 1
	self.city_swat_titan.damage.explosion_damage_mul = 0.8		
	self.city_swat_titan.use_animation_on_fire_damage = true
	self.city_swat_titan.move_speed = presets.move_speed.fast
	self.city_swat_titan.dodge = presets.dodge.elite
	self.city_swat_titan.surrender = nil
	self.city_swat_titan.static_weapon_preset = true
	self.city_swat_titan.static_dodge_preset = true
	self.city_swat_titan.static_melee_preset = true	
	self.city_swat_titan.heal_cooldown = 1.875
	self.city_swat_titan.overheal_mult = 1.25
	self.city_swat_titan.marshal_logic = true
	self.city_swat_titan.no_xmas_hat = true
	--for shieldless titan units
	self.city_swat_titan.modify_health_on_tweak_change = true
	self.city_swat_titan.tmp_invulnerable_on_tweak_change = 1.5 --better than 3 seconds
	table.insert(self._enemy_list, "city_swat_titan")
	
	--Titan SWAT (Shotgunner)
	self.city_swat_titan_assault = deep_clone(self.city_swat_titan)
	self.city_swat_titan_assault.marshal_logic = nil
	self.city_swat_titan_assault.dt_suppress = nil
	self.city_swat_titan_assault.dt_sgunner = {
		range = 600
	}
	table.insert(self._enemy_list, "city_swat_titan_assault")
		
	--Weekend LMG
	self.weekend_lmg = deep_clone(self.city_swat_titan)		
	if self:get_ai_group_type() == "russia" then
		self.weekend_lmg.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "murkywater" then
		self.weekend_lmg.custom_voicework = "bravo_elite_murky"	
	elseif self:get_ai_group_type() == "federales" then
		self.weekend_lmg.custom_voicework = "bravo_elite_mex"
	else
		self.weekend_lmg.custom_voicework = "bravo_elite"
	end		
	self.weekend_lmg.speech_prefix_p1 = "null"
	self.weekend_lmg.speech_prefix_p2 = nil
	self.weekend_lmg.speech_prefix_count = nil
	self.weekend_lmg.HEALTH_INIT = 28.125
	self.weekend_lmg.headshot_dmg_mul = 3.3125
	self.weekend_lmg.heal_cooldown = 1.875
	self.weekend_lmg.can_throw_frag = true
	if self:get_ai_group_type() == "murkywater" or self:get_ai_group_type() == "zombie" then
		self.weekend_lmg.yellow_blood = true
	else	
		self.weekend_lmg.yellow_blood = false
	end
	table.insert(self._enemy_list, "weekend_lmg")
	
	--Weekend LMG (Guard Variant)
	self.weekend_elite_guard = deep_clone(self.weekend_lmg)	
	self.weekend_elite_guard.tags = {"law", "city_swat"}
	self.weekend_elite_guard.dt_suppress = nil
	self.weekend_elite_guard.silent_priority_shout = "f37"
	self.weekend_elite_guard.can_throw_frag = false
	self.weekend_elite_guard.yellow_blood = false
	self.weekend_elite_guard.chatter = presets.enemy_chatter.guard
	if job == "shoutout_raid" then
		self.weekend_elite_guard.access = "swat"
	else
		self.weekend_elite_guard.access = "security"
	end
	table.insert(self._enemy_list, "weekend_elite_guard")
	
end

function CharacterTweakData:_init_sniper(presets)	
	self.sniper = deep_clone(presets.base)
	self.sniper.tags = {"law", "sniper", "special"}
	self.sniper.experience = {}
	self.sniper.weapon = deep_clone(presets.weapon.normal)
	self.sniper.detection = presets.detection.sniper
	self.sniper.HEALTH_INIT = 2
	self.sniper.headshot_dmg_mul = 2
	self.sniper.damage_resistance = presets.damage_resistance.none
	self.sniper.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.sniper.immune_to_knock_down = true
	self.sniper.allowed_poses = {stand = true}
	self.sniper.move_speed = presets.move_speed.very_fast
	self.sniper.shooting_death = false
	self.sniper.no_move_and_shoot = true
	self.sniper.move_and_shoot_cooldown = 1
	self.sniper.suppression = nil
	self.sniper.melee_weapon = nil
	self.sniper.ecm_vulnerability = 0.6
	self.sniper.ecm_hurts = {
		ears = 6
	}
	self.sniper.weapon_voice = "1"
	self.sniper.experience.cable_tie = "tie_swat"
	self.sniper.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.sniper.speech_prefix_p2 = "n"
	self.sniper.speech_prefix_count = 4
	self.sniper.priority_shout = "f34"
	self.sniper.bot_priority_shout = "f34x_any"
	self.sniper.priority_shout_max_dis = 3000
	self.sniper.access = "sniper"
	self.sniper.no_retreat = true
	self.sniper.no_limping = true
	self.sniper.no_arrest = true
	self.sniper.chatter = presets.enemy_chatter.no_chatter
	self.sniper.static_dodge_preset = true
	self.sniper.crouch_move = nil
	self.sniper.is_special = true
	self.sniper.no_asu = true
	self.sniper.die_sound_event = "mga_death_scream"
	self.sniper.spawn_sound_event = "mga_deploy_snipers"
	self.sniper.do_not_drop_ammo = true
	self.sniper.no_mutator_weapon_override = true
	self.sniper.can_be_healed = false
	table.insert(self._enemy_list, "sniper")
end

function CharacterTweakData:_init_marshal_marksman(presets)	
	--Clones the Titan Sniper
	self.marshal_marksman = deep_clone(self.heavy_swat_sniper)
	self.marshal_marksman.speech_prefix_p1 = "cum"
	self.marshal_marksman.speech_prefix_p2 = nil
	self.marshal_marksman.speech_prefix_count = nil
	self.marshal_marksman.yellow_blood = false
	if self:get_ai_group_type() == "russia" then
		self.marshal_marksman.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "murkywater" then
		self.marshal_marksman.custom_voicework = "bravo_elite_murky"	
	elseif self:get_ai_group_type() == "federales" then
		self.marshal_marksman.custom_voicework = "bravo_elite_mex"
	else
		self.marshal_marksman.custom_voicework = "bravo_dmr"
	end		

	table.insert(self._enemy_list, "marshal_marksman")
end

function CharacterTweakData:_init_marshal_shield(presets)
	self.marshal_shield = deep_clone(presets.base)
	self.marshal_shield.tags = {
		"law",
		"shield"
	}
	self.marshal_shield.experience = {}
	self.marshal_shield.weapon = deep_clone(presets.weapon.normal)
	self.marshal_shield.static_weapon_preset = true
	self.marshal_shield.detection = presets.detection.normal
	self.marshal_shield.HEALTH_INIT = 13
	self.marshal_shield.headshot_dmg_mul = 2.2
	self.marshal_shield.allowed_stances = {
		cbt = true
	}
	self.marshal_shield.allowed_poses = {
		crouch = true
	}
	self.marshal_shield.always_face_enemy = true
	self.marshal_shield.move_speed = presets.move_speed.fast
	self.marshal_shield.no_run_start = true
	self.marshal_shield.no_run_stop = true
	self.marshal_shield.no_retreat = true
	self.marshal_shield.no_arrest = true
	self.marshal_shield.surrender = nil
	self.marshal_shield.rotation_speed = 0.75
	self.marshal_shield.ecm_vulnerability = 0
	self.marshal_shield.ecm_hurts = {
		ears = {
			max_duration = 0,
			min_duration = 0
		}
	}
	self.marshal_shield.rescue_hostages = false
	self.marshal_shield.deathguard = false
	self.marshal_shield.no_equip_anim = true
	self.marshal_shield.wall_fwd_offset = 100
	self.marshal_shield.damage.explosion_damage_mul = 0.8
	self.marshal_shield.calls_in = nil
	self.marshal_shield.ignore_medic_revive_animation = true
	self.marshal_shield.shooting_death = false
	self.marshal_shield.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.marshal_shield.damage.shield_knocked = false
	self.marshal_shield.immune_to_concussion = true
	self.marshal_shield.damage.immune_to_knockback = true
	self.marshal_shield.immune_to_knock_down = true
	self.marshal_shield.use_animation_on_fire_damage = false
	self.marshal_shield.flammable = true
	self.marshal_shield.weapon_voice = "3"
	self.marshal_shield.experience.cable_tie = "tie_swat"
	self.marshal_shield.speech_prefix_p1 = "cum"
	self.marshal_shield.speech_prefix_p2 = nil
	self.marshal_shield.speech_prefix_count = nil
	self.marshal_shield.yellow_blood = nil
	self.marshal_shield.no_asu = true
	if self:get_ai_group_type() == "russia" then
		self.marshal_shield.custom_voicework = "tswat_ru"
	elseif self:get_ai_group_type() == "murkywater" then
		self.marshal_shield.custom_voicework = "bravo_elite_murky"	
	elseif self:get_ai_group_type() == "federales" then
		self.marshal_shield.custom_voicework = "bravo_elite_mex"
	else
		self.marshal_shield.custom_voicework = "bravo_dmr"
	end		
	self.marshal_shield.speech_prefix_count = nil
	self.marshal_shield.priority_shout = "f31"
	self.marshal_shield.access = "shield"
	self.marshal_shield.chatter = presets.enemy_chatter.shield
	self.marshal_shield.announce_incomming = "incomming_shield"
	self.marshal_shield.spawn_sound_event = "shield_identification"
	self.marshal_shield.steal_loot = nil
	self.marshal_shield.no_mutator_weapon_override = true
	self.marshal_shield.is_special = true
	table.insert(self._enemy_list, "marshal_shield")

	self.marshal_shield_break = deep_clone(self.marshal_shield)
	self.marshal_shield_break.rotation_speed = 3
	self.marshal_shield_break.tags = {
		"law"
	}
	self.marshal_shield_break.HEALTH_INIT = 22.5
	self.marshal_shield_break.headshot_dmg_mul = 2.2
	self.marshal_shield_break.allowed_stances = nil
	self.marshal_shield_break.allowed_poses = nil
	self.marshal_shield_break.no_equip_anim = nil
	self.marshal_shield_break.no_run_start = nil
	self.marshal_shield_break.no_run_stop = nil
	self.marshal_shield_break.always_face_enemy = nil
	self.marshal_shield_break.wall_fwd_offset = nil
	self.marshal_shield_break.priority_shout = nil
	self.marshal_shield_break.access = "swat"
	
	self.marshal_shield_break.chatter = presets.enemy_chatter.swat
	self.marshal_shield_break.announce_incomming = nil
	self.marshal_shield_break.damage.hurt_severity = presets.hurt_severities.base
	self.marshal_shield_break.damage.explosion_damage_mul = 1
	self.marshal_shield_break.use_animation_on_fire_damage = nil
	self.marshal_shield_break.damage.shield_knocked = nil
	self.marshal_shield_break.modify_health_on_tweak_change = true
	self.marshal_shield_break.tmp_invulnerable_on_tweak_change = 1.5 --still better than 3 seconds
	self.marshal_shield_break.no_mutator_weapon_override = true
	self.marshal_shield_break.unintimidateable = true
	self.marshal_shield_break.no_asu = true
	table.insert(self._enemy_list, "marshal_shield_break")
end

function CharacterTweakData:_init_gangster(presets)
	self.gangster = deep_clone(presets.base)
	self.gangster.tags = {"gangster"}
	self.gangster.experience = {}
	self.gangster.weapon = presets.weapon.normal
	self.gangster.detection = presets.detection.normal
	self.gangster.HEALTH_INIT = 4
	self.gangster.headshot_dmg_mul = 2.25
	self.gangster.damage_resistance = presets.damage_resistance.none
	self.gangster.move_speed = presets.move_speed.normal
	self.gangster.suspicious = nil
	self.gangster.suppression = presets.suppression.easy
	self.gangster.surrender = nil
	self.gangster.ecm_vulnerability = 0.6
	self.gangster.ecm_hurts = {
		ears = 6
	}
	self.gangster.no_arrest = true
	self.gangster.no_retreat = true
	self.gangster.weapon_voice = "3"
	self.gangster.experience.cable_tie = "tie_swat"
	self.gangster.no_omnia_heal = true
	self.gangster.no_asu = true	
	self.gangster.use_radio = nil		
	if job == "man" then	
		self.gangster.speech_prefix_p1 = self._prefix_data_p1.cop()
		self.gangster.tags = {"law"}
		self.gangster.HEALTH_INIT = 4
		self.gangster.speech_prefix_p2 = "n"
		self.gangster.speech_prefix_count = 4	
		self.gangster.no_arrest = false
		self.gangster.rescue_hostages = true
		self.gangster.use_radio = self._default_chatter	
		self.gangster.no_omnia_heal = false		
		self.gangster.no_asu = false
	else
		self.gangster.speech_prefix_p1 = "lt"
		self.gangster.speech_prefix_p2 = nil
		self.gangster.speech_prefix_count = 2
	end
	self.gangster.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.gangster.silent_priority_shout = "f37"
	if job == "alex_3" or job == "alex_3_res" or job == "mex" then
		self.gangster.access = "security"
	else
		self.gangster.access = "gangster"
	end
	self.gangster.dodge = presets.dodge.average
	self.gangster.challenges = {type = "gangster"}
	self.gangster.melee_weapon = "fists"
	self.gangster.steal_loot = nil
	self.gangster.calls_in = true
	self.gangster.static_dodge_preset = true
	self.gangster.unintimidateable = true
	self.gangster.always_drop = true
	self.gangster.heal_cooldown = 1
	table.insert(self._enemy_list, "gangster")
	
	self.enforcer = deep_clone(self.gangster)
	self.enforcer.tags = {"gangster", "custom", "special"}
	self.enforcer.HEALTH_INIT = 250
	self.enforcer.headshot_dmg_mul = 2.701
	self.enforcer.damage_resistance = presets.damage_resistance.none
	self.enforcer.is_special = true
	self.enforcer.no_limping = true
	self.enforcer.move_speed = presets.move_speed.slow	
	self.enforcer.melee_weapon = "fists_dozer"	
	self.enforcer.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.enforcer.damage.explosion_damage_mul = 1.25
	self.enforcer.damage.rocket_damage_mul = 1.25
	self.enforcer.surrender = nil	
	self.enforcer.unintimidateable = nil
	self.enforcer.priority_shout = "g29"
	self.enforcer.bot_priority_shout = "g29"
	self.enforcer.priority_shout_max_dis = 3000
	self.enforcer.silent_priority_shout = nil
	self.enforcer.custom_shout = true		
	self.enforcer.allowed_poses = {stand = true}
	self.enforcer.crouch_move = false
	self.enforcer.no_run_start = true
	self.enforcer.no_run_stop = true
	self.enforcer.use_animation_on_fire_damage = false
	self.enforcer.flammable = true
	self.enforcer.can_be_tased = false
	self.enforcer.immune_to_concussion = false
	self.enforcer.no_headshot_add_mul = true
	self.enforcer.immune_to_knock_down = true
	self.enforcer.must_headshot = true	
	table.insert(self._enemy_list, "enforcer")	
	
	self.enforcer_assault = deep_clone(self.enforcer)
	self.enforcer_assault.tags = {"law", "custom", "special"}
	self.enforcer_assault.access = "swat"
	self.enforcer_assault.speech_prefix_p1 = self._prefix_data_p1.cloaker()
	self.enforcer_assault.speech_prefix_count = nil
	table.insert(self._enemy_list, "enforcer_assault")	
end

function CharacterTweakData:_init_biker(presets)
	self.biker = deep_clone(self.gangster)
	self.biker.tags = {"gangster"}
	if job == "mex" then
		self.biker.access = "security"
	else
		self.biker.access = "gangster"
	end		
	self.biker.HEALTH_INIT = 4
	self.biker.headshot_dmg_mul = 2.25
	self.biker.damage_resistance = presets.damage_resistance.none
	self.biker.calls_in = true
	self.biker.speech_prefix_p1 = "bik"
	self.biker.speech_prefix_p2 = nil
	self.biker.speech_prefix_count = 2	
	self.biker.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.biker.static_dodge_preset = true
	self.biker.always_drop = true
	self.biker.heal_cooldown = 1
	self.biker.melee_weapon = "knife_1"
	table.insert(self._enemy_list, "biker")
	
	self.biker_female = deep_clone(self.biker)
	self.biker_female.speech_prefix_p1 = "fl"
	self.biker_female.speech_prefix_p2 = "n"
	self.biker_female.speech_prefix_count = 1
	table.insert(self._enemy_list, "biker_female")	
	
	self.biker_guard = deep_clone(self.biker)
	self.biker_guard.suppression = presets.suppression.hard_def
	self.biker_guard.has_alarm_pager = true
	self.biker_guard.radio_prefix = "fri_"
	self.biker_guard.detection = presets.detection.guard
	self.biker_guard.HEALTH_INIT = 6
	self.biker_guard.headshot_dmg_mul = 3.4
	self.biker_guard.move_speed = presets.move_speed.very_fast
	self.biker_guard.ecm_vulnerability = 0.6
	self.biker_guard.no_arrest = false
	self.biker_guard.ecm_hurts = {
		ears = 6
	}
	self.biker_guard.speech_prefix_p1 = "bik"
	self.biker_guard.speech_prefix_p2 = nil
	self.biker_guard.speech_prefix_count = 2
	self.biker_guard.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.biker_guard.static_dodge_preset = false
	self.biker_guard.heal_cooldown = 1
	table.insert(self._enemy_list, "biker_guard")
end

function CharacterTweakData:_init_triad(presets)
	self.triad = deep_clone(self.gangster)
	self.triad.tags = {"gangster"}
	self.triad.access = "gangster"
	self.triad.calls_in = true

	table.insert(self._enemy_list, "triad")
end

function CharacterTweakData:_init_triad_boss(presets)
	self.triad_boss = deep_clone(presets.base)
	self.triad_boss.experience = {}
	self.triad_boss.weapon = deep_clone(presets.weapon.normal)
	self.triad_boss.detection = presets.detection.normal
	self.triad_boss.HEALTH_INIT = 750
	self.triad_boss.headshot_dmg_mul = 5.5
	self.triad_boss.damage_resistance = presets.damage_resistance.none
	self.triad_boss.damage.hurt_severity = presets.hurt_severities.boss
	self.triad_boss.damage.explosion_damage_mul = 1.25
	self.triad_boss.damage.rocket_damage_mul = 1.25
	self.triad_boss.can_be_tased = false
	self.triad_boss.suppression = nil
	self.triad_boss.move_speed = presets.move_speed.very_slow
	self.triad_boss.allowed_stances = {
		cbt = true
	}
	self.triad_boss.allowed_poses = {
		stand = true
	}
	self.triad_boss.crouch_move = false
	self.triad_boss.no_run_start = true
	self.triad_boss.no_run_stop = true
	self.triad_boss.no_retreat = true
	self.triad_boss.no_arrest = true
	self.triad_boss.surrender = nil
	self.triad_boss.ecm_vulnerability = 0
	self.triad_boss.ecm_hurts = {}
	self.triad_boss.weapon_voice = "3"
	self.triad_boss.experience.cable_tie = "tie_swat"
	self.triad_boss.access = "gangster"
	self.triad_boss.speech_prefix_p1 = "bb"
	self.triad_boss.speech_prefix_p2 = "n"
	self.triad_boss.speech_prefix_count = 1
	self.triad_boss.die_sound_event = "Play_yuw_pent_death"
	self.triad_boss.rescue_hostages = false
	self.triad_boss.melee_weapon = "fists_dozer"
	self.triad_boss.steal_loot = nil
	self.triad_boss.calls_in = nil
	self.triad_boss.chatter = presets.enemy_chatter.no_chatter
	self.triad_boss.use_radio = nil
	self.triad_boss.use_animation_on_fire_damage = false
	self.triad_boss.flammable = true
	self.triad_boss.immune_to_knock_down = true
	self.triad_boss.immune_to_concussion = true
	self.triad_boss.priority_shout = "g29"
	self.triad_boss.bot_priority_shout = "g29"	
	self.triad_boss.silent_priority_shout = nil
	self.triad_boss.priority_shout_max_dis = 3000
	self.triad_boss.custom_shout = true
	self.triad_boss.must_headshot = true
	self.triad_boss.static_dodge_preset = true
	self.triad_boss.is_special = true
	self.triad_boss.no_asu = true
	self.triad_boss.always_drop = true	
	self.triad_boss.no_omnia_heal = true	
	self.triad_boss.can_be_healed = false	
	self.triad_boss.can_reload_while_moving_tmp = true
	self.triad_boss.throwable = "molotov"
	self.triad_boss.invulnerable_to_slotmask = {
		"enemies",
		17
	}	
	table.insert(self._enemy_list, "triad_boss")

	self.triad_boss_no_armor = deep_clone(self.gangster)
	self.triad_boss_no_armor.HEALTH_INIT = 4
	self.triad_boss_no_armor.headshot_dmg_mul = 2.25	
	self.triad_boss_no_armor.damage_resistance = presets.damage_resistance.none
	self.triad_boss_no_armor.suspicious = nil
	self.triad_boss_no_armor.detection = presets.detection.normal
	self.triad_boss_no_armor.no_retreat = true
	self.triad_boss_no_armor.no_arrest = true
	self.triad_boss_no_armor.surrender = nil
	self.triad_boss_no_armor.unintimidateable = true
	self.triad_boss_no_armor.rescue_hostages = false
	self.triad_boss_no_armor.steal_loot = nil
	self.triad_boss_no_armor.calls_in = nil
	self.triad_boss_no_armor.chatter = presets.enemy_chatter.no_chatter
	self.triad_boss_no_armor.use_radio = nil
	self.triad_boss_no_armor.radio_prefix = "fri_"
	self.triad_boss_no_armor.can_be_healed = false	

	table.insert(self._enemy_list, "triad_boss_no_armor")
end

function CharacterTweakData:_init_deep_boss(presets)
	self.deep_boss = deep_clone(presets.base)
	self.deep_boss.experience = {}
	self.deep_boss.weapon = deep_clone(presets.weapon.good)
	self.deep_boss.weapon.is_rifle.melee_retry_delay = {
		7,
		8
	}
	self.deep_boss.detection = presets.detection.normal
	self.deep_boss.HEALTH_INIT = 750
	self.deep_boss.headshot_dmg_mul = 5.5
	self.deep_boss.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.deep_boss.damage.explosion_damage_mul = 0.5
	self.deep_boss.can_be_tased = false
	self.deep_boss.suppression = nil
	self.deep_boss.move_speed = presets.move_speed.slow
	self.deep_boss.allowed_stances = {
		cbt = true
	}
	self.deep_boss.allowed_poses = {
		stand = true
	}
	self.deep_boss.crouch_move = false
	self.deep_boss.no_equip_anim = true
	self.deep_boss.no_run_start = true
	self.deep_boss.no_run_stop = true
	self.deep_boss.no_retreat = true
	self.deep_boss.no_arrest = true
	self.deep_boss.surrender = nil
	self.deep_boss.ecm_vulnerability = 0
	self.deep_boss.ecm_hurts = {
		ears = {
			max_duration = 0,
			min_duration = 0
		}
	}
	self.deep_boss.weapon_voice = "3"
	self.deep_boss.experience.cable_tie = "tie_swat"
	self.deep_boss.access = "gangster"
	self.deep_boss.speech_prefix_p1 = "bb"
	self.deep_boss.speech_prefix_p2 = "n"
	self.deep_boss.speech_prefix_count = 1
	self.deep_boss.spawn_sound_event = "Play_gab_deep_11"
	self.deep_boss.die_sound_event = "Play_gab_deep_15"
	self.deep_boss.rescue_hostages = false
	self.deep_boss.priority_shout = "g29"
	self.deep_boss.bot_priority_shout = "g29"
	self.deep_boss.custom_shout = true
	self.deep_boss.melee_weapon = "fists_electric"
	self.deep_boss.melee_weapon_dmg_multiplier = 1
	self.deep_boss.steal_loot = nil
	self.deep_boss.calls_in = nil
	self.deep_boss.chatter = presets.enemy_chatter.no_chatter
	self.deep_boss.use_radio = nil
	self.deep_boss.use_animation_on_fire_damage = false
	self.deep_boss.flammable = false
	self.deep_boss.immune_to_knock_down = true
	self.deep_boss.immune_to_concussion = true
	self.deep_boss.can_reload_while_moving_tmp = true
	self.deep_boss.ignore_headshot = false
	self.deep_boss.no_headshot_add_mul = true
	--self.deep_boss.player_health_scaling_mul = 1.1
	self.deep_boss.can_be_healed = false	
	self.deep_boss.no_omnia_heal = true	
	self.deep_boss.no_asu = true	

	table.insert(self._enemy_list, "deep_boss")
end

function CharacterTweakData:_init_snowman_boss(presets)
	self.snowman_boss = deep_clone(self.tank)
	self.snowman_boss.experience = {}
	self.snowman_boss.tags = {
		"law",
		"tank",
		"snowman",
		"special"
	}
	self.snowman_boss.headshot_dmg_mul = 18.75
	self.snowman_boss.HEALTH_INIT = 400	
	self.snowman_boss.speech_prefix_p1 = "snowman"
	self.snowman_boss.speech_prefix_p2 = nil
	self.snowman_boss.speech_prefix_count = nil
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.snowman_boss.custom_voicework = "tdozer_ru"
	else
		self.snowman_boss.custom_voicework = "tdozer"
	end
	self.snowman_boss.aoe_damage_data = {
		verification_delay = 0.3,
		activation_range = 300,
		activation_delay = 1,
		env_tweak_name = "snowman_boss_aoe_fire",
		check_player = true,
		check_npc_slotmask = {
			"criminals",
			-2,
			-3
		}
	}	
	
	table.insert(self._enemy_list, "snowman_boss")
end

function CharacterTweakData:_init_piggydozer(presets)
	self.piggydozer = deep_clone(self.tank)
	self.piggydozer.experience = {}
	self.piggydozer.tags = {
		"tank",
		"eventboss",
		"special"
	}
	self.piggydozer.headshot_dmg_mul = 18.75
	self.piggydozer.HEALTH_INIT = 400
	self.piggydozer.speech_prefix_p1 = "fuckingpig"
	self.piggydozer.speech_prefix_p2 = nil
	self.piggydozer.speech_prefix_count = nil
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.piggydozer.custom_voicework = "tdozer_ru"
	else
		self.piggydozer.custom_voicework = "tdozer"
	end
	self.piggydozer.aoe_damage_data = {
		verification_delay = 0.3,
		activation_range = 300,
		activation_delay = 1,
		env_tweak_name = "triad_boss_aoe_fire",
		play_voiceline = true,
		check_player = true,
		check_npc_slotmask = {
			"criminals",
			-2,
			-3
		}
	}

	table.insert(self._enemy_list, "piggydozer")
end

function CharacterTweakData:_init_captain(presets)
	self.captain = deep_clone(self.gangster)
	self.captain.calls_in = true
	self.captain.no_limping = true
	self.captain.immune_to_knock_down = true
	self.captain.immune_to_concussion = true
	self.captain.no_retreat = true
	self.captain.no_arrest = true
	self.captain.surrender = nil
	self.captain.unintimidateable = true
	self.captain.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.captain.flammable = false
	self.captain.can_be_tased = false
	self.captain.suppression = nil
	table.insert(self._enemy_list, "captain")
	
	self.captain_female = deep_clone(self.captain)
	self.captain_female.speech_prefix_p1 = "fl"
	self.captain_female.speech_prefix_p2 = "n"
	self.captain_female.speech_prefix_count = 1
	table.insert(self._enemy_list, "captain_female")	
end

function CharacterTweakData:_init_biker_escape(presets)
	self.biker_escape = deep_clone(self.gangster)
	self.biker_escape.melee_weapon = "knife_1"
	self.biker_escape.move_speed = presets.move_speed.very_fast
	self.biker_escape.HEALTH_INIT = 4
	self.biker_escape.damage_resistance = presets.damage_resistance.none
	self.biker_escape.suppression = nil
	table.insert(self._enemy_list, "biker_escape")
end

function CharacterTweakData:_init_mobster(presets)
	self.mobster = deep_clone(self.gangster)
	self.mobster.tags = {"gangster"}
	self.mobster.calls_in = true
	self.mobster.melee_weapon = "fists"
	self.mobster.HEALTH_INIT = 4
	self.mobster.headshot_dmg_mul = 2.25
	self.mobster.damage_resistance = presets.damage_resistance.none
	self.mobster.speech_prefix_p1 = "rt"
	self.mobster.speech_prefix_p2 = nil
	self.mobster.speech_prefix_count = 2
	self.mobster.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.mobster.static_dodge_preset = true
	self.mobster.always_drop = true
	self.mobster.heal_cooldown = 1
	table.insert(self._enemy_list, "mobster")
end

function CharacterTweakData:_init_mobster_boss(presets)
	self.mobster_boss = deep_clone(presets.base)
	self.mobster_boss.tags = {"custom", "special"}
	self.mobster_boss.experience = {}
	self.mobster_boss.detection = presets.detection.normal
	self.mobster_boss.weapon = deep_clone(presets.weapon.normal)
	self.mobster_boss.HEALTH_INIT = 750
	self.mobster_boss.headshot_dmg_mul = 5.5
	self.mobster_boss.damage_resistance = presets.damage_resistance.none
	self.mobster_boss.damage.hurt_severity = presets.hurt_severities.boss
	self.mobster_boss.damage.explosion_damage_mul = 1.25
	self.mobster_boss.damage.rocket_damage_mul = 1.25
	self.mobster_boss.move_speed = presets.move_speed.very_slow
	self.mobster_boss.allowed_poses = {stand = true}
	self.mobster_boss.crouch_move = false
	self.mobster_boss.no_run_start = true
	self.mobster_boss.no_run_stop = true
	self.mobster_boss.no_retreat = true
	self.mobster_boss.no_limping = true
	self.mobster_boss.no_arrest = true
	self.mobster_boss.surrender = nil
	self.mobster_boss.ecm_vulnerability = 0
	self.mobster_boss.ecm_hurts = {}
	self.mobster_boss.weapon_voice = "3"
	self.mobster_boss.experience.cable_tie = "tie_swat"
	self.mobster_boss.access = "gangster"
	self.mobster_boss.speech_prefix_p1 = "l"
	self.mobster_boss.speech_prefix_p2 = "n"
	self.mobster_boss.speech_prefix_count = 4
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
	self.mobster_boss.immune_to_concussion = true
	self.mobster_boss.must_headshot = true
	self.mobster_boss.static_dodge_preset = true
	self.mobster_boss.is_special = true
	self.mobster_boss.no_asu = true
	self.mobster_boss.always_drop = true
	self.mobster_boss.heal_cooldown = 22.5
	self.mobster_boss.die_sound_event = "l1n_burndeath"
	self.mobster_boss.no_omnia_heal = true
	self.mobster_boss.can_be_healed = false
	table.insert(self._enemy_list, "mobster_boss")
end

function CharacterTweakData:_init_biker_boss(presets)
	self.biker_boss = deep_clone(presets.base)
	self.biker_boss.tags = {"custom", "special"}
	self.biker_boss.experience = {}
	self.biker_boss.weapon = deep_clone(presets.weapon.normal)
	self.biker_boss.detection = presets.detection.normal
	self.biker_boss.HEALTH_INIT = 750
	self.biker_boss.headshot_dmg_mul = 5.5
	self.biker_boss.damage_resistance = presets.damage_resistance.none
	self.biker_boss.damage.explosion_damage_mul = 1.25
	self.biker_boss.damage.rocket_damage_mul = 1.25
	self.biker_boss.damage.hurt_severity = self.presets.hurt_severities.boss
	self.biker_boss.move_speed = presets.move_speed.very_slow
	self.biker_boss.allowed_poses = {stand = true}
	self.biker_boss.no_retreat = true
	self.biker_boss.no_limping = true
	self.biker_boss.no_run_start = true
	self.biker_boss.no_run_stop = true	
	self.biker_boss.no_arrest = true
	self.biker_boss.surrender = nil
	self.biker_boss.ecm_vulnerability = 0
	self.biker_boss.ecm_hurts = {}
	self.biker_boss.weapon_voice = "3"
	self.biker_boss.experience.cable_tie = "tie_swat"
	self.biker_boss.access = "gangster"
	self.biker_boss.speech_prefix_p1 = "bb"
	self.biker_boss.speech_prefix_p2 = "n"
	self.biker_boss.speech_prefix_count = 1
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
	self.biker_boss.immune_to_concussion = true
	self.biker_boss.must_headshot = true
	self.biker_boss.static_dodge_preset = true
	self.biker_boss.always_drop = true
	self.biker_boss.is_special = true
	self.biker_boss.no_asu = true
	self.biker_boss.heal_cooldown = 22.5
	self.biker_boss.die_sound_event = "fl1n_x02a_any_3p"
	self.biker_boss.no_omnia_heal = true
	self.biker_boss.can_be_healed = false
	table.insert(self._enemy_list, "biker_boss")
end

function CharacterTweakData:_init_hector_boss(presets)
	self.hector_boss = deep_clone(self.mobster_boss)
	self.hector_boss.tags = {"custom", "special"}
	self.hector_boss.weapon = deep_clone(presets.weapon.normal)
	self.hector_boss.can_be_tased = false
	self.hector_boss.priority_shout = "g29"
	self.hector_boss.bot_priority_shout = "g29"
	self.hector_boss.silent_priority_shout = nil
	self.hector_boss.custom_shout = true
	self.hector_boss.priority_shout_max_dis = 3000
	self.hector_boss.is_special = true
	self.hector_boss.no_asu = true
	self.hector_boss.always_drop = true
	self.hector_boss.heal_cooldown = 22.5
	self.hector_boss.die_sound_event = "l1n_burndeath"
	table.insert(self._enemy_list, "hector_boss")
end

function CharacterTweakData:_init_hector_boss_no_armor(presets)
	self.hector_boss_no_armor = deep_clone(self.fbi)
	self.hector_boss_no_armor.no_retreat = true
	self.hector_boss_no_armor.no_limping = true
	self.hector_boss_no_armor.no_arrest = true
	self.hector_boss_no_armor.surrender = nil
	self.hector_boss_no_armor.unintimidateable = true
	self.hector_boss_no_armor.access = "gangster"
	self.hector_boss_no_armor.rescue_hostages = false
	self.hector_boss_no_armor.steal_loot = nil
	self.hector_boss_no_armor.calls_in = nil
	self.hector_boss_no_armor.chatter = presets.enemy_chatter.no_chatter
	self.hector_boss_no_armor.use_radio = nil
	self.hector_boss_no_armor.can_be_tased = true
	self.hector_boss_no_armor.always_drop = true
	self.hector_boss_no_armor.heal_cooldown = 1
	table.insert(self._enemy_list, "hector_boss_no_armor")
end

function CharacterTweakData:_init_chavez_boss(presets)
	self.chavez_boss = deep_clone(presets.base)
	self.chavez_boss.experience = {}
	self.chavez_boss.tags = {"custom", "special"}
	self.chavez_boss.weapon = deep_clone(presets.weapon.normal)
	self.chavez_boss.detection = presets.detection.normal
	self.chavez_boss.priority_shout = "g29"
	self.chavez_boss.bot_priority_shout = "g29"
	self.chavez_boss.silent_priority_shout = nil
	self.chavez_boss.custom_shout = true
	self.chavez_boss.priority_shout_max_dis = 3000
	self.chavez_boss.damage.hurt_severity = presets.hurt_severities.boss
	self.chavez_boss.HEALTH_INIT = 750
	self.chavez_boss.headshot_dmg_mul = 5.5
	self.chavez_boss.damage_resistance = presets.damage_resistance.none
	self.chavez_boss.damage.explosion_damage_mul = 1.25
	self.chavez_boss.damage.rocket_damage_mul = 1.25
	self.chavez_boss.move_speed = presets.move_speed.very_slow
	self.chavez_boss.allowed_poses = {stand = true}
	self.chavez_boss.no_retreat = true
	self.chavez_boss.no_limping = true
	self.chavez_boss.no_arrest = true
	self.chavez_boss.no_run_start = true
	self.chavez_boss.no_run_stop = true		
	self.chavez_boss.surrender = nil
	self.chavez_boss.ecm_vulnerability = 0
	self.chavez_boss.ecm_hurts = {}
	self.chavez_boss.weapon_voice = "1"
	self.chavez_boss.experience.cable_tie = "tie_swat"
	self.chavez_boss.access = "gangster"
	self.chavez_boss.speech_prefix_p1 = "bb"
	self.chavez_boss.speech_prefix_p2 = "n"
	self.chavez_boss.speech_prefix_count = 1
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
	self.chavez_boss.immune_to_concussion = true
	self.chavez_boss.must_headshot = true
	self.chavez_boss.static_dodge_preset = true
	self.chavez_boss.is_special = true
	self.chavez_boss.no_asu = true
	self.chavez_boss.always_drop = true
	self.chavez_boss.heal_cooldown = 22.5
	self.chavez_boss.die_sound_event = "l1n_burndeath"
	self.chavez_boss.no_omnia_heal = true
	self.chavez_boss.can_be_healed = false
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
	self.bolivian.speech_prefix_p1 = "lt"
	self.bolivian.speech_prefix_p2 = nil
	self.bolivian.speech_prefix_count = 2
	self.bolivian.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.bolivian.static_dodge_preset = true
	self.bolivian.always_drop = true
	self.bolivian.heal_cooldown = 1
	table.insert(self._enemy_list, "bolivian")
	
	self.bolivian_indoors = deep_clone(self.bolivian)
	self.bolivian_indoors.suppression = presets.suppression.hard
	self.bolivian_indoors.has_alarm_pager = true
	self.bolivian_indoors.surrender = presets.surrender.easy
	self.bolivian_indoors.surrender_break_time = {20, 30}
	self.bolivian_indoors.detection = presets.detection.guard
	self.bolivian_indoors.HEALTH_INIT = 6
	self.bolivian_indoors.access = "security"
	self.bolivian_indoors.headshot_dmg_mul = 3.4
	self.bolivian_indoors.damage_resistance = presets.damage_resistance.none
	self.bolivian_indoors.move_speed = presets.move_speed.very_fast
	self.bolivian_indoors.ecm_vulnerability = 0.6
	self.bolivian_indoors.no_arrest = false
	self.bolivian_indoors.ecm_hurts = {
		ears = 6
	}
	self.bolivian_indoors.speech_prefix_p1 = "lt"
	self.bolivian_indoors.speech_prefix_p2 = nil
	self.bolivian_indoors.speech_prefix_count = 2
	self.bolivian_indoors.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.bolivian_indoors.static_dodge_preset = false
	self.bolivian_indoors.unintimidateable = false
	table.insert(self._enemy_list, "bolivian_indoors")
end

function CharacterTweakData:_init_bolivian_indoors_mex(presets)
	self.bolivian_indoors_mex = deep_clone(self.bolivian_indoors)
	self.bolivian_indoors_mex.has_alarm_pager = true
	if job == "mex" then
		self.bolivian_indoors_mex.access = "security"
	else
		self.bolivian_indoors_mex.access = "gangster"
	end				

	table.insert(self._enemy_list, "bolivian_indoors_mex")
end

function CharacterTweakData:_init_ranchmanager(presets)
	self.ranchmanager = deep_clone(self.bolivian)
	self.ranchmanager.access = "security_patrol"
	
	table.insert(self._enemy_list, "ranchmanager")	
end

function CharacterTweakData:_init_team_ai(presets)
	local team_ai_tweak_names = {
		"russian",
		"german",
		"spanish",
		"american",
		"jowi",
		"old_hoxton",
		"female_1",
		"dragan",
		"jacket",
		"bonnie",
		"sokol",
		"dragon",
		"bodhi",
		"jimmy",
		"sydney",
		"wild",
		"chico",
		"max",
		"joy",
		"myh",
		"ecp_female",
		"ecp_male"
	}
	local char_weapon_tables = self.char_wep_tables

	for _, tweak_name in ipairs(team_ai_tweak_names) do
		local char_tweaks = {}
		self[tweak_name] = char_tweaks
		char_tweaks.damage = presets.gang_member_damage
		char_tweaks.weapon = clone(presets.weapon.gang_member)
		char_tweaks.weapon.weapons_of_choice = {
			primary = "wpn_fps_ass_m4_npc",
			secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
		}
		char_tweaks.always_face_enemy = true
		char_tweaks.no_run_start = true
		char_tweaks.no_run_stop = true
		char_tweaks.flammable = false		
		char_tweaks.detection = presets.detection.gang_member
		char_tweaks.move_speed = presets.move_speed.gang_member
		char_tweaks.crouch_move = false
		char_tweaks.dodge = nil
		char_tweaks.speech_prefix = "rb2"
		char_tweaks.weapon_voice = "1"
		char_tweaks.access = "teamAI1"
		char_tweaks.arrest = {
			timeout = 240,
			aggression_timeout = 6,
			arrest_timeout = 240
		}
	end
	
	--Dallas
	local russian_rand_weap = {
		"wpn_fps_ass_amcar_pdth_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_74_npc",
		"wpn_fps_ass_74_npc",
		"wpn_fps_ass_74_npc",
		"wpn_fps_ass_74_pdth_npc"
	}
	self.russian.weapon.weapons_of_choice.primary = table.random(russian_rand_weap)

	--Wolf
	self.german.weapon_voice = "2"
	local german_rand_weap = {
		"wpn_fps_shot_r870_pdth_npc",
		"wpn_fps_shot_r870_npc",
		"wpn_fps_shot_r870_npc",
		"wpn_fps_shot_r870_npc"
	}
	self.german.weapon.weapons_of_choice.primary = table.random(german_rand_weap)
	
	--Chains
	self.spanish.weapon_voice = "3"
	local spanish_rand_weap = {
		"wpn_fps_lmg_hk21_pdth_npc",
		"wpn_fps_lmg_m249_npc",
		"wpn_fps_lmg_m249_npc",
		"wpn_fps_lmg_m249_npc"
	}
	self.spanish.weapon.weapons_of_choice.primary = table.random(spanish_rand_weap)	
	
	--Houston
	self.american.weapon_voice = "3"
	local american_rand_weap = {
		"wpn_fps_ass_m14_pdth_npc",
		"wpn_fps_ass_m14_npc",
		"wpn_fps_ass_m14_npc",
		"wpn_fps_ass_m14_npc"
	}	
	self.american.weapon.weapons_of_choice.primary = table.random(american_rand_weap)	
	
	--Wick
	self.jowi.weapon_voice = "3"
	local jowi_rand_weap = {
		"wpn_fps_snp_tti_wick_bubba_npc",
		"wpn_fps_snp_tti_wick_npc",
		"wpn_fps_snp_tti_wick_npc",
		"wpn_fps_snp_tti_wick_npc",
		"wpn_fps_snp_tti_npc",
		"wpn_fps_snp_tti_npc",
		"wpn_fps_snp_tti_npc",
		"wpn_fps_snp_tti_npc",
		"wpn_fps_snp_tti_npc",
	}	
	self.jowi.weapon.weapons_of_choice.primary = table.random(jowi_rand_weap)	
	
	--Old Hoxton
	self.old_hoxton.weapon_voice = "3"
	self.old_hoxton.weapon.weapons_of_choice.primary = "wpn_fps_sho_spas12_npc"
	
	--Clover
	self.female_1.speech_prefix = "rb7"
	self.female_1.weapon_voice = "3"
	local clover_rand_weap = {
		"wpn_fps_ass_l85a2_mil_npc",
		"wpn_fps_ass_l85a2_npc",
		"wpn_fps_ass_l85a2_npc",
	}	
	self.female_1.weapon.weapons_of_choice.primary = table.random(clover_rand_weap)
	
	--Dragan	
	self.dragan.speech_prefix = "rb8"
	self.dragan.weapon_voice = "3"
	self.dragan.weapon.weapons_of_choice.primary = "wpn_fps_ass_vhs_npc"
	
	--Jacket
	self.jacket.speech_prefix = "rb9"
	self.jacket.weapon_voice = "3"
	local jacket_rand_weap = {
		"wpn_fps_ass_m16_a1_npc",
		"wpn_fps_ass_akm_solid_npc",
		"wpn_fps_ass_akm_solid_npc",
		"wpn_fps_ass_akm_solid_npc",
		"wpn_fps_ass_m16_a3_npc",
		"wpn_fps_ass_m16_a3_npc",
		"wpn_fps_ass_m16_a3_npc",
		"wpn_fps_ass_m16_a3_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc",
		"wpn_fps_ass_amcar_npc"
	}	
	self.jacket.weapon.weapons_of_choice.primary = table.random(jacket_rand_weap)
	
	--Bonnie
	self.bonnie.speech_prefix = "rb10"
	self.bonnie.weapon_voice = "3"
	local bonnie_rand_weap = {
		"wpn_fps_shot_b682_725_npc",
		"wpn_fps_shot_b682_npc",
		"wpn_fps_shot_b682_npc",
	}	
	self.bonnie.weapon.weapons_of_choice.primary = table.random(bonnie_rand_weap)
	
	--Sokol
	self.sokol.speech_prefix = "rb11"
	self.sokol.weapon_voice = "3"
	local sokol_rand_weap = {
		"wpn_fps_ass_asval_npc",
		"wpn_fps_ass_asval_npc",
		"wpn_fps_ass_asval_npc",
		"wpn_fps_ass_asval_vss_npc",
	}	
	self.sokol.weapon.weapons_of_choice.primary = table.random(sokol_rand_weap)
	
	--Jiro
	self.dragon.speech_prefix = "rb12"
	self.dragon.weapon_voice = "3"
	local dragon_rand_weap = {
		"wpn_fps_snp_wa2000_npc",
		"wpn_fps_snp_r700_npc",
		"wpn_fps_snp_r700_npc",
		"wpn_fps_snp_r700_npc",
		"wpn_fps_snp_r700_npc"
	}
	self.dragon.weapon.weapons_of_choice.primary = table.random(dragon_rand_weap)
	
	--Bodhi
	self.bodhi.speech_prefix = "rb13"
	self.bodhi.weapon_voice = "3"
	self.bodhi.weapon.weapons_of_choice.primary = "wpn_fps_snp_model70_npc"
	
	--Jimmy
	self.jimmy.speech_prefix = "rb14"
	self.jimmy.weapon_voice = "3"
	local jimmy_rand_weap = {
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_jim_npc",
	}	
	self.jimmy.weapon.weapons_of_choice.primary = table.random(jimmy_rand_weap)
	
	--Sydney
	self.sydney.speech_prefix = "rb15"
	self.sydney.weapon_voice = "3"
	self.sydney.weapon.weapons_of_choice.primary = "wpn_fps_ass_tecci_long_npc"
	
	--Rust (Ron "Fat Dick" Perlman)
	self.wild.speech_prefix = "rb16"
	self.wild.weapon_voice = "3"
	self.wild.weapon.weapons_of_choice.primary = "wpn_fps_sho_boot_npc"
	
	--Scarface [REDACTED]
	self.chico.speech_prefix = "rb17"
	self.chico.weapon_voice = "3"
	self.chico.weapon.weapons_of_choice.primary = "wpn_fps_ass_contraband_npc"
	
	--Sangres
	self.max.speech_prefix = "rb18"
	self.max.weapon_voice = "3"
	self.max.weapon.weapons_of_choice.primary = "wpn_fps_ass_akm_gold_npc"
	
	--Joy
	self.joy.speech_prefix = "rb19"
	self.joy.weapon_voice = "3"
	self.joy.weapon.weapons_of_choice.primary = "wpn_fps_smg_shepheard_npc"
	
	--Duke
	self.myh.speech_prefix = "rb22"
	self.myh.weapon_voice = "3"
	self.myh.weapon.weapons_of_choice.primary = "wpn_fps_ass_ching_npc"
	
	--Hila	
	self.ecp_female.speech_prefix = "rb21"
	self.ecp_female.weapon_voice = "3"
	local ecp_female_rand_weap = {
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_npc",
		"wpn_fps_sho_ben_jim_npc",
	}	
	self.ecp_female.weapon.weapons_of_choice.primary = table.random(ecp_female_rand_weap)
	
	--Ethan
	self.ecp_male.weapon.weapons_of_choice.primary = "wpn_fps_ass_m4_npc"
	self.ecp_male.speech_prefix = "rb20"
	self.ecp_male.weapon_voice = "3"
end

function CharacterTweakData:_init_drug_lord_boss(presets)
	self.drug_lord_boss = deep_clone(presets.base)
	self.drug_lord_boss.experience = {}
	self.drug_lord_boss.tags = {"custom", "special"}
	self.drug_lord_boss.weapon = deep_clone(presets.weapon.normal)
	self.drug_lord_boss.detection = presets.detection.normal
	self.drug_lord_boss.HEALTH_INIT = 750
	self.drug_lord_boss.headshot_dmg_mul = 5.5
	self.drug_lord_boss.damage_resistance = presets.damage_resistance.none
	self.drug_lord_boss.damage.explosion_damage_mul = 1.25
	self.drug_lord_boss.damage.rocket_damage_mul = 1.25
	self.drug_lord_boss.damage.hurt_severity = presets.hurt_severities.titan
	self.drug_lord_boss.move_speed = presets.move_speed.very_slow
	self.drug_lord_boss.allowed_poses = {stand = true}
	self.drug_lord_boss.crouch_move = false
	self.drug_lord_boss.no_run_start = true
	self.drug_lord_boss.no_run_stop = true
	self.drug_lord_boss.no_retreat = true
	self.drug_lord_boss.no_limping = true
	self.drug_lord_boss.no_arrest = true
	self.drug_lord_boss.surrender = nil
	self.drug_lord_boss.ecm_vulnerability = 0
	self.drug_lord_boss.ecm_hurts = {}
	self.drug_lord_boss.weapon_voice = "3"
	self.drug_lord_boss.experience.cable_tie = "tie_swat"
	self.drug_lord_boss.access = "gangster"
	self.drug_lord_boss.speech_prefix_p1 = "bb"
	self.drug_lord_boss.speech_prefix_p2 = "n"
	self.drug_lord_boss.speech_prefix_count = 1
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
	self.drug_lord_boss.immune_to_concussion = true
	self.drug_lord_boss.priority_shout = "g29"
	self.drug_lord_boss.bot_priority_shout = "g29"
	self.drug_lord_boss.custom_shout = true
	self.drug_lord_boss.priority_shout_max_dis = 3000
	self.drug_lord_boss.must_headshot = true
	self.drug_lord_boss.static_dodge_preset = true
	self.drug_lord_boss.is_special = true
	self.drug_lord_boss.no_asu = true
	self.drug_lord_boss.always_drop = true
	self.drug_lord_boss.heal_cooldown = 22.5
	self.drug_lord_boss.no_omnia_heal = true
	self.drug_lord_boss.die_sound_event = "l1n_burndeath"
	self.drug_lord_boss.can_be_healed = false
	
	--M203 Launcher
	self.drug_lord_boss.throwable = "launcher_m203"
	self.drug_lord_boss.throwable_on_sight = true
	self.drug_lord_boss.throwable_cooldown = 10	
	table.insert(self._enemy_list, "drug_lord_boss")
end

function CharacterTweakData:_init_drug_lord_boss_stealth(presets)
	self.drug_lord_boss_stealth = deep_clone(presets.base)
	self.drug_lord_boss_stealth.experience = {}
	self.drug_lord_boss_stealth.weapon = deep_clone(presets.weapon.normal)
	self.drug_lord_boss_stealth.detection = presets.detection.normal
	self.drug_lord_boss_stealth.HEALTH_INIT = 6
	self.drug_lord_boss_stealth.headshot_dmg_mul = 3.4
	self.drug_lord_boss_stealth.damage_resistance = presets.damage_resistance.none
	self.drug_lord_boss_stealth.move_speed = presets.move_speed.very_fast
	self.drug_lord_boss_stealth.no_retreat = true
	self.drug_lord_boss_stealth.no_limping = true
	self.drug_lord_boss_stealth.no_arrest = true
	self.drug_lord_boss_stealth.surrender = nil
	self.drug_lord_boss_stealth.unintimidateable = true
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
	self.drug_lord_boss_stealth.always_drop = true
	self.drug_lord_boss_stealth.heal_cooldown = 1
	self.drug_lord_boss_stealth.no_omnia_heal = true
	self.drug_lord_boss_stealth.no_asu = true	
	self.drug_lord_boss_stealth.can_be_healed = false
	self.drug_lord_boss_stealth.die_sound_event = "l2n_x01a_any_3p"
	table.insert(self._enemy_list, "drug_lord_boss_stealth")
end

function CharacterTweakData:_init_tank(presets)	
	self.tank = deep_clone(presets.base)
	self.tank.tags = {"law", "tank", "special"}
	self.tank.experience = {}
	self.tank.damage.tased_response = {
		light = {tased_time = 1, down_time = 0},
		heavy = {tased_time = 2, down_time = 0}
	}
	self.tank.damage.explosion_damage_mul = 2.5
	self.tank.damage.rocket_damage_mul = 2.5
	self.tank.weapon = deep_clone(presets.weapon.normal)
	self.tank.detection = presets.detection.normal
	self.tank.HEALTH_INIT = 500
	--1020 head health, 400 "real damage" and an extra 620 from their armor plates
	self.tank.headshot_dmg_mul = 12.5
	self.tank.damage_resistance = presets.damage_resistance.none
	self.tank.move_speed = presets.move_speed.slow
	self.tank.allowed_stances = {cbt = true}
	self.tank.allowed_poses = {stand = true}
	self.tank.crouch_move = false
	self.tank.no_run_start = true
	self.tank.no_run_stop = true
	self.tank.no_retreat = true
	self.tank.no_limping = true
	self.tank.no_arrest = true
	self.tank.surrender = nil
	self.tank.ecm_vulnerability = 0
	self.tank.ecm_hurts = {}
	if self:get_ai_group_type() == "federales" or self:get_ai_group_type() == "russia" then
        self.tank.die_sound_event = "bdz_x02a_any_3p"
    else
        self.tank.die_sound_event = nil
	end
	self.tank.weapon_voice = "3"
	self.tank.experience.cable_tie = "tie_swat"
	self.tank.access = "tank"
	self.tank.speech_prefix_p1 = self._prefix_data_p1.bulldozer()
	self.tank.speech_prefix_p2 = nil
	self.tank.speech_prefix_count = nil
	self.tank.spawn_sound_event = self._prefix_data_p1.bulldozer() .. "_entrance"
	self.tank.priority_shout = "f30"
	self.tank.bot_priority_shout = "f30x_any"
	self.tank.priority_shout_max_dis = 3000
	self.tank.deathguard = true
	self.tank.melee_weapon = "fists_dozer"
	self.tank.melee_weapon_dmg_multiplier = 1
	self.tank.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.tank.chatter = {
		reload = true, --this is just here for tdozers
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.tank.announce_incomming = "incomming_tank"
	self.tank.kill_taunt = "post_kill_taunt"
	self.tank.steal_loot = nil
	self.tank.calls_in = nil
	self.tank.use_animation_on_fire_damage = false
	self.tank.flammable = true
	self.tank.can_be_tased = false
	self.tank.immune_to_concussion = false
	self.tank.no_headshot_add_mul = true
	self.tank.immune_to_knock_down = true
	self.tank.tank_concussion = true
	self.tank.must_headshot = true
	self.tank.static_dodge_preset = true
	self.tank.no_recoil = true
	self.tank.is_special = true
	self.tank.no_asu = true
	self.tank.heal_cooldown = 22.5
	self.tank.min_obj_interrupt_dis = 600
	self.tank.no_xmas_hat = true
	self.tank.immune_to_ff_exp = true
	table.insert(self._enemy_list, "tank")
	
	
	--Blackdozers, Move faster than other dozers but have a bit less EHP
	self.tank_black = deep_clone(self.tank)
	self.tank_black.move_speed = presets.move_speed.normal
	self.tank_black.HEALTH_INIT = 425
	table.insert(self._enemy_list, "tank_black")
	
	
	--Skulldozers, More tanky but moves as slow as Titandozers
	self.tank_skull = deep_clone(self.tank)
	self.tank_skull.dt_suppress = {
		range = 300
	}
	self.tank_skull.HEALTH_INIT = 625
	self.tank_skull.marshal_logic = true
	self.tank_skull.headshot_dmg_mul = 9.5
	self.tank_skull.move_speed = presets.move_speed.very_slow
	table.insert(self._enemy_list, "tank_skull")
	
	--Medic Dozer, ditto from Blackdozers
	self.tank_medic = deep_clone(self.tank)
	self.tank_medic.headshot_dmg_mul = 18.75
	self.tank_medic.HEALTH_INIT = 400
	self.tank_medic.no_asu = true
	self.tank_medic.no_omnia_heal = true
	self.tank_medic.can_be_healed = false
	self.tank_medic.move_speed = presets.move_speed.normal
	self.tank_medic.spawn_sound_event = self._prefix_data_p1.bulldozer() .. "_entrance_elite"
	table.insert(self.tank_medic.tags, "medic")
	table.insert(self._enemy_list, "tank_medic")
	
	--Titandozer
	self.tank_titan = deep_clone(self.tank)
	self.tank_titan.weapon = deep_clone(presets.weapon.normal)
	self.tank_titan.tags = {"law", "tank", "special", "tank_titan", "customvo"}	
	self.tank_titan.move_speed = presets.move_speed.very_slow
	self.tank_titan.damage.hurt_severity = presets.hurt_severities.titan	
	self.tank_titan.HEALTH_INIT = 750
	self.tank_titan.headshot_dmg_mul = 5.5
	self.tank_titan.immune_to_concussion = true
	self.tank_titan.immune_to_knock_down = true
	self.tank_titan.priority_shout_max_dis = 3000
	self.tank_titan.ecm_vulnerability = 0		
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.tank_titan.custom_voicework = "tdozer_ru"
	else
		self.tank_titan.custom_voicework = "tdozer"
	end
	self.tank_titan.speech_prefix_p1 = "heck"
	self.tank_titan.speech_prefix_p2 = nil
	self.tank_titan.speech_prefix_count = nil
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.tank_titan.yellow_blood = false
	else
		self.tank_titan.yellow_blood = true
	end
	self.tank_titan.ecm_hurts = {}
	self.tank_titan.die_sound_event = "mga_death_scream"
	self.tank_titan.damage.explosion_damage_mul = 1.25
	self.tank_titan.damage.rocket_damage_mul = 1.25
	self.tank_titan.is_special = true
	self.tank_titan.no_asu = true
	self.tank_titan.heal_cooldown = 22.5
	table.insert(self._enemy_list, "tank_titan")
	
	--Titandozer, assault variant
	self.tank_titan_assault = deep_clone(self.tank_titan)
	self.tank_titan_assault.tags = {"law", "tank", "special", "tank_titan"}
	self.tank_titan_assault.spawn_sound_event_2 = "cloaker_spawn"
	table.insert(self._enemy_list, "tank_titan_assault")

	--Halloween Bulldozer (Black)
	self.tank_hw_black = deep_clone(self.tank_black)
	self.tank_hw_black.weapon = deep_clone(presets.weapon.normal)
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.tank_hw_black.custom_voicework = "tdozer_ru"
	else
		self.tank_hw_black.custom_voicework = "tdozer"
	end
	--Dozerish head health, lowered to account for no visor so they're about the same head health
	self.tank_hw_black.headshot_dmg_mul = 5.5
	self.tank_hw_black.ignore_headshot = false
	self.tank_hw_black.melee_anims = nil
	self.tank_hw_black.speech_prefix_p1 = "tank_hw_black"
	self.tank_hw_black.speech_prefix_p2 = nil
	self.tank_hw_black.speech_prefix_count = nil	
	table.insert(self._enemy_list, "tank_hw_black")	
	
	--Halloween Bulldozer (Titan)
	self.tank_hw = deep_clone(self.tank_titan_assault)
	self.tank_hw.weapon = deep_clone(presets.weapon.normal)
	self.tank_hw.ignore_headshot = false
	self.tank_hw.melee_anims = nil
	self.tank_hw.move_speed = presets.move_speed.very_slow
	table.insert(self._enemy_list, "tank_hw")	
	
	--Benelli (Bravo) Dozer
	self.tank_mini = deep_clone(self.tank)
	self.tank_mini.HEALTH_INIT = 625
	self.tank_mini.headshot_dmg_mul = 15.625
	self.tank_mini.weapon = deep_clone(presets.weapon.normal)
	self.tank_mini.can_throw_frag = true
	self.tank_mini.grenade_toss_chance = 0.4
	self.tank_mini.spawn_sound_event = self._prefix_data_p1.bulldozer() .. "_entrance_elite"
	table.insert(self._enemy_list, "tank_mini")	
end

function CharacterTweakData:_init_tank_biker(presets)
	self.tank_biker = deep_clone(self.tank)
	self.tank_biker.speech_prefix_p1 = "https://www.youtube.com/watch?v=_jRbH9bcOMQ"
	self.tank_biker.speech_prefix_p2 = nil
	self.tank_biker.speech_prefix_count = nil
	self.tank_biker.spawn_sound_event = nil
	self.tank_biker.spawn_sound_event_2 = nil
	self.tank_biker.access = "gangster"
	self.tank_biker.custom_voicework = "tank_biker"
	self.tank_biker.use_radio = nil
	self.tank_biker.no_omnia_heal = true
	self.tank_biker.no_asu = true
	self.tank_biker.move_speed = presets.move_speed.very_slow
	table.insert(self._enemy_list, "tank_biker")	
end

function CharacterTweakData:_init_spooc(presets)	
	self.spooc = deep_clone(presets.base)
	self.spooc.tags = {"law", "spooc", "special"}
	self.spooc.experience = {}
	self.spooc.damage.hurt_severity = presets.hurt_severities.spooc
	self.spooc.weapon = deep_clone(presets.weapon.normal)
	self.spooc.detection = presets.detection.normal
	self.spooc.HEALTH_INIT = 60
	self.spooc.headshot_dmg_mul = 5.85
	self.spooc.damage_resistance = presets.damage_resistance.none
	self.spooc.damage.explosion_damage_mul = 1.25
	self.spooc.move_speed = presets.move_speed.lightning
	self.spooc.no_retreat = true
	self.spooc.no_arrest = true
	self.spooc.surrender_break_time = {4, 6}
	self.spooc.suppression = nil
	self.spooc.surrender = nil
	self.spooc.priority_shout = "f33"
	self.spooc.bot_priority_shout = "f33x_any"
	self.spooc.priority_shout_max_dis = 3000
	self.spooc.spooc_attack_timeout = {4, 4}
	self.spooc.spooc_attack_beating_time = {3, 3}
	self.spooc.spooc_attack_use_smoke_chance = 0
	self.spooc.weapon_voice = "3"
	self.spooc.experience.cable_tie = "tie_swat"
	self.spooc.speech_prefix_p1 = self._prefix_data_p1.cloaker()
	self.spooc.speech_prefix_count = nil
	self.spooc.access = "spooc"
	self.spooc.flammable = true
	self.spooc.dodge = presets.dodge.ninja
	self.spooc.chatter = presets.enemy_chatter.cloaker
	self.spooc.steal_loot = nil
	self.spooc.melee_weapon = nil
	self.spooc.use_radio = nil
	self.spooc.can_be_tased = true
	self.spooc.static_dodge_preset = true
	self.spooc.is_special = true
	self.spooc.charging_detect = false
	self.spooc.jump_detect = true
	self.spooc.static_weapon_preset = true
	self.spooc.no_asu = true
	self.spooc.kick_damage = 8.0 --Amount of damage dealt when cloakers hick players.
	self.spooc.spawn_sound_event_2 = "clk_c01x_plu"
	self.spooc.spooc_sound_events = {
		detect_stop = "cloaker_detect_stop",
		detect = "cloaker_detect_mono"
	}
	self.spooc.heal_cooldown = 11.25
	self.spooc.special_deaths = {
		melee = {
			[("head"):id():key()] = {
				sequence = "dismember_head",
				melee_weapon_id = "sandsteel",
				character_name = "dragon",
				sound_effect = "split_gen_head"
			},
			[("body"):id():key()] = {
				sequence = "dismember_body_top",
				melee_weapon_id = "sandsteel",
				character_name = "dragon",
				sound_effect = "split_gen_body"
			}
		}
	}
	self.spooc.min_obj_interrupt_dis = 800
	table.insert(self._enemy_list, "spooc")

	self.spooc_titan = deep_clone(self.spooc)
	self.spooc_titan.tags = {"law", "custom", "special", "spooc"}
	self.spooc_titan.special_deaths = nil
	self.spooc_titan.HEALTH_INIT = 90
	self.spooc_titan.headshot_dmg_mul = 5.85	
	self.spooc_titan.damage.bullet_damage_mul = 1.5
	self.spooc_titan.damage.explosion_damage_mul = 1.75
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then	
		self.spooc_titan.speech_prefix_p1 = self._prefix_data_p1.cloaker()
		self.spooc_titan.speech_prefix_count = nil
	else
		self.spooc_titan.speech_prefix_p1 = "t_spk"
		self.spooc_titan.speech_prefix_count = nil
	end
	self.spooc_titan.damage.hurt_severity = presets.hurt_severities.spooc_titan
	self.spooc_titan.can_cloak = true
	self.spooc_titan.can_be_tased = false
	self.spooc_titan.priority_shout_max_dis = 0
	self.spooc_titan.unintimidateable = true
	self.spooc_titan.charging_detect = true
	self.spooc_titan.jump_detect = true
	self.spooc_titan.spawn_sound_event = "cloaker_presence_loop"
	self.spooc_titan.die_sound_event = "cloaker_presence_stop"
	self.spooc_titan.is_special = true
	self.spooc_titan.no_asu = true
	self.spooc_titan.cannot_attach_projectiles = true	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.spooc_titan.custom_voicework = nil
	else
		self.spooc_titan.custom_voicework = "tspook"
	end		
	self.spooc_titan.die_sound_event_2 = "mga_death_scream"
	self.spooc_titan.heal_cooldown = 15
	self.spooc_titan.no_xmas_hat = true
	table.insert(self._enemy_list, "spooc_titan")

	--Kung Fu Master/Test Subject
	self.spooc_gangster = deep_clone(self.spooc)	
	self.spooc_gangster.tags = {"gangster", "spooc", "special"}	
	if job == "mad" then
		self.spooc_gangster.speech_prefix_p1 = "android"
		self.spooc_gangster.speech_prefix_p2 = nil
		self.spooc_gangster.speech_prefix_count = nil
	else
		self.spooc_gangster.speech_prefix_p1 = "lt"
		self.spooc_gangster.speech_prefix_p2 = nil
		self.spooc_gangster.speech_prefix_count = 2
	end	
	self.spooc_gangster.HEALTH_INIT = 24
	self.spooc_gangster.damage.hurt_severity = presets.hurt_severities.elite
	self.spooc_gangster.headshot_dmg_mul = 3.4	
	self.spooc_gangster.no_omnia_heal = true
	self.spooc_gangster.dodge = presets.dodge.veteran	
	self.spooc_gangster.rescue_hostages = false
	self.spooc_gangster.steal_loot = false	
	self.spooc_gangster.access = "gangster"
	self.spooc_gangster.priority_shout = nil
	self.spooc_gangster.bot_priority_shout = nil
	if job == "pent" then
		self.spooc_gangster.melee_weapon = "kf_katana"	
	else 
		self.spooc_gangster.melee_weapon = "fists"
	end
	self.spooc_gangster.kick_damage = 12.0
	self.spooc_gangster.no_arrest = true
	self.spooc_gangster.no_retreat = true
	self.spooc_gangster.chatter = {
		aggressive = true,
		retreat = true,
		contact = true,
		go_go = true,
		suppress = true
	}
	self.spooc_gangster.silent_priority_shout = nil
	self.spooc_gangster.challenges = {type = "gangster"}	
	self.spooc_gangster.static_dodge_preset = true
	self.spooc_gangster.special_deaths = nil
	self.spooc_gangster.unintimidateable = true		
	self.spooc_gangster.spawn_sound_event_2 = nil
    self.spooc_gangster.spooc_sound_events = {
        detect_stop = "cloaker_detect_stop",
        detect = "asdf",
		taunt_during_assault = "asdf",
		taunt_after_assault = "asdf"
    }	
	self.spooc_gangster.min_obj_interrupt_dis = 800
	self.spooc_gangster.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.05

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}	
	table.insert(self._enemy_list, "spooc_gangster")	
end

function CharacterTweakData:_init_shadow_spooc(presets)
	self.shadow_spooc = deep_clone(presets.base)
	self.shadow_spooc.tags = {"law", "spooc", "special"}
	self.shadow_spooc.experience = {}
	self.shadow_spooc.damage.hurt_severity = presets.hurt_severities.spooc
	self.shadow_spooc.weapon = deep_clone(presets.weapon.normal)
	self.shadow_spooc.detection = presets.detection.normal
	self.shadow_spooc.HEALTH_INIT = 60
	self.shadow_spooc.headshot_dmg_mul = 5.85
	self.shadow_spooc.damage_resistance = presets.damage_resistance.none
	self.shadow_spooc.damage.explosion_damage_mul = 1.25
	self.shadow_spooc.move_speed = presets.move_speed.lightning
	self.shadow_spooc.no_retreat = true
	self.shadow_spooc.no_arrest = true
	self.shadow_spooc.surrender_break_time = {4, 6}
	self.shadow_spooc.suppression = nil
	self.shadow_spooc.surrender = nil
	self.shadow_spooc.priority_shout = "f33"
	self.shadow_spooc.bot_priority_shout = "f33x_any"
	self.shadow_spooc.priority_shout_max_dis = 3000
	self.shadow_spooc.spooc_attack_timeout = {4, 4}
	self.shadow_spooc.spooc_attack_beating_time = {3, 3}
	self.shadow_spooc.spooc_attack_use_smoke_chance = 0
	self.shadow_spooc.weapon_voice = "3"
	self.shadow_spooc.experience.cable_tie = "tie_swat"
	self.shadow_spooc.speech_prefix_p1 = "uno_clk"
	self.shadow_spooc.speech_prefix_count = nil
	self.shadow_spooc.use_radio = nil
	self.shadow_spooc.chatter = presets.enemy_chatter.no_chatter
	self.shadow_spooc.do_not_drop_ammo = false
	self.shadow_spooc.steal_loot = nil
	self.shadow_spooc.spawn_sound_event = "uno_cloaker_presence_loop"
	self.shadow_spooc.die_sound_event = "uno_cloaker_presence_stop"
	self.shadow_spooc.spooc_sound_events = {
		detect_stop = "uno_cloaker_detect_stop",
		taunt_during_assault = "",
		taunt_after_assault = "",
		detect = "uno_cloaker_detect"
	}
	self.shadow_spooc.access = "spooc"
	self.shadow_spooc.flammable = true
	self.shadow_spooc.dodge = presets.dodge.ninja
	self.shadow_spooc.chatter = presets.enemy_chatter.no_chatter
	self.shadow_spooc.steal_loot = nil
	self.shadow_spooc.melee_weapon = nil
	self.shadow_spooc.use_radio = nil
	self.shadow_spooc.can_be_tased = true
	self.shadow_spooc.static_dodge_preset = true
	self.shadow_spooc.is_special = true
	self.shadow_spooc.charging_detect = false
	self.shadow_spooc.jump_detect = true	
	self.shadow_spooc.no_asu = true
	self.shadow_spooc.heal_cooldown = 11.25
	self.shadow_spooc.min_obj_interrupt_dis = 800
	table.insert(self._enemy_list, "shadow_spooc")
end	

function CharacterTweakData:_init_shield(presets)	
	self.shield = deep_clone(presets.base)
	self.shield.tags = {"law", "shield", "special"}
	self.shield.experience = {}
	self.shield.weapon = deep_clone(presets.weapon.normal)
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.shield.static_weapon_preset = true
	self.shield.detection = presets.detection.normal
	self.shield.HEALTH_INIT = 13
	self.shield.headshot_dmg_mul = 2.2
	self.shield.damage_resistance = presets.damage_resistance.none
	self.shield.damage.explosion_damage_mul = 0.8
	self.shield.allowed_stances = {cbt = true}
	self.shield.allowed_poses = {crouch = true}
	self.shield.always_face_enemy = true
	self.shield.rotation_speed = 0.75
	self.shield.move_speed = presets.move_speed.fast
	self.shield.no_run_start = true
	self.shield.no_run_stop = true
	self.shield.no_retreat = true
	self.shield.no_limping = true
	self.shield.no_arrest = true
	self.shield.surrender = nil
	self.shield.ecm_vulnerability = 0.6
	self.shield.suppression = nil
	self.shield.ecm_hurts = {
		ears = 6
	}
	self.shield.priority_shout = "f31"
	self.shield.bot_priority_shout = "f31x_any"
	self.shield.priority_shout_max_dis = 3000
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
	self.shield.speech_prefix_p2 = self._speech_prefix_p2
	self.shield.speech_prefix_count = 4
	self.shield.access = "shield"
	self.shield.chatter = presets.enemy_chatter.shield
	self.shield.announce_incomming = "incomming_shield"
	self.shield.spawn_sound_event = "shield_identification"
	self.shield.steal_loot = nil
	self.shield.use_animation_on_fire_damage = false
	self.shield.immune_to_knock_down = true
	self.shield.static_dodge_preset = true
	self.shield.is_special = true
	self.shield.no_asu = true
	self.shield.heal_cooldown = 5
	self.shield.min_obj_interrupt_dis = 300
	self.shield.no_mutator_weapon_override = true
	table.insert(self._enemy_list, "shield")
end

function CharacterTweakData:_init_phalanx_minion(presets)	
	self.phalanx_minion = deep_clone(self.shield)
	self.phalanx_minion.tags = {"law", "shield", "special", "shield_titan"}
	self.phalanx_minion.experience = {}
	self.phalanx_minion.weapon = deep_clone(presets.weapon.normal)
	self.phalanx_minion.static_weapon_preset = true
	self.phalanx_minion.detection = presets.detection.normal
	self.phalanx_minion.headshot_dmg_mul = 2.0
	self.phalanx_minion.HEALTH_INIT = 19.5
	self.phalanx_minion.damage_resistance = presets.damage_resistance.none
	self.phalanx_minion.damage.explosion_damage_mul = 0.25
	self.phalanx_minion.damage.rocket_damage_mul = 0.25
	self.phalanx_minion.damage.fire_pool_damage_mul = 0.25
	self.phalanx_minion.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.phalanx_minion.flammable = false
	self.phalanx_minion.damage.shield_knocked = false
	self.phalanx_minion.priority_shout = "f31"
	self.phalanx_minion.bot_priority_shout = "f31x_any"		
	self.phalanx_minion.move_speed = presets.move_speed.normal
	self.phalanx_minion.priority_shout_max_dis = 3000
	self.phalanx_minion.weapon_voice = "3"
	self.phalanx_minion.experience.cable_tie = "tie_swat"
	self.phalanx_minion.access = "shield"
	self.phalanx_minion.chatter = presets.enemy_chatter.shield
	self.phalanx_minion.announce_incomming = "incomming_shield"
	self.phalanx_minion.steal_loot = nil
	self.phalanx_minion.ignore_medic_revive_animation = true
	self.phalanx_minion.ecm_vulnerability = 0.6
	self.phalanx_minion.ecm_hurts = {
		ears = 6
	}
	self.phalanx_minion.use_animation_on_fire_damage = false
	self.phalanx_minion.can_be_tased = false
	self.phalanx_minion.immune_to_knock_down = true
	self.phalanx_minion.immune_to_concussion = true
	self.phalanx_minion.damage.immune_to_knockback = true
	self.phalanx_minion.spawn_sound_event_2 = "hos_shield_indication_sound_terminator_style" --that's a big ass name
	self.phalanx_minion.suppression = nil
	self.phalanx_minion.is_special = true
	self.phalanx_minion.rotation_speed = 0.75
	self.phalanx_minion.no_asu = true
	self.phalanx_minion.no_retreat = true
	self.phalanx_minion.speech_prefix_p1 = "fug"
	self.phalanx_minion.speech_prefix_p2 = nil
	self.phalanx_minion.speech_prefix_count = 1	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.phalanx_minion.custom_voicework = "tswat_ru"
	else
		self.phalanx_minion.custom_voicework = "tshield"
	end

	self.phalanx_minion.yellow_blood = true
	self.phalanx_minion.heal_cooldown = 7.5
	self.phalanx_minion.no_mutator_weapon_override = true
	self.phalanx_minion.no_xmas_hat = true
	table.insert(self._enemy_list, "phalanx_minion")
	
	self.phalanx_minion_assault = deep_clone(self.phalanx_minion)
	self.phalanx_minion_assault.spawn_sound_event_2 = "cloaker_spawn"
	self.phalanx_minion_assault.spawn_sound_event_3 = "hos_shield_indication_sound_terminator_style" --that's a big ass name
	self.phalanx_minion_assault.no_retreat = false
	table.insert(self._enemy_list, "phalanx_minion_assault")
end

function CharacterTweakData:_init_phalanx_vip(presets)
	self.phalanx_vip = deep_clone(self.phalanx_minion)
	self.phalanx_vip.tags = {"law", "shield", "special", "shield_titan", "captain", "phalanx_vip"}
	self.phalanx_vip.damage.shield_knocked = false
	self.phalanx_vip.damage.immune_to_knockback = true
	self.phalanx_vip.immune_to_knock_down = true
	self.phalanx_vip.HEALTH_INIT = 130
	self.phalanx_vip.headshot_dmg_mul = 2.0
	self.phalanx_vip.damage_resistance = presets.damage_resistance.none
	self.phalanx_vip.damage.explosion_damage_mul = 0.05
	self.phalanx_vip.damage.rocket_damage_mul = 0.05
	self.phalanx_vip.damage.fire_pool_damage_mul = 0.05
	self.phalanx_vip.damage.bullet_damage_mul = 0.25
	self.phalanx_vip.damage.fire_damage_mul = 0.25
	if self:get_ai_group_type() == "russia" then
		self.phalanx_vip.spawn_sound_event = "cpw_a01"
		self.phalanx_vip.spawn_sound_event_2 = "cloaker_spawn"
	else
		self.phalanx_vip.spawn_sound_event = "cpa_a02_01"
		self.phalanx_vip.spawn_sound_event_2 = nil
	end	
	self.phalanx_vip.priority_shout = "f45"
	self.phalanx_vip.bot_priority_shout = "f45x_any"
	self.phalanx_vip.priority_shout_max_dis = 3000
	self.phalanx_vip.flammable = false
	self.phalanx_vip.can_be_tased = false
	self.phalanx_vip.ecm_vulnerability = nil	
	self.phalanx_vip.die_sound_event = "mga_death_scream"
	self.phalanx_vip.die_sound_event_2 = "l2n_x01a_any_3p"
	self.phalanx_vip.kill_taunt = "a02"
	self.phalanx_vip.must_headshot = true
	self.phalanx_vip.ends_assault_on_death = true
	self.phalanx_vip.do_omnia = true
	self.phalanx_vip.suppression = nil
	self.phalanx_vip.ecm_hurts = {}
	self.phalanx_vip.is_special = true
	self.phalanx_vip.rotation_speed = 0.75
	self.phalanx_vip.no_asu = true
	self.phalanx_vip.no_retreat = true
	self.phalanx_vip.yellow_blood = false
	self.phalanx_vip.custom_voicework = nil
	self.phalanx_vip.speech_prefix_p1 = "cpw"
	self.phalanx_vip.speech_prefix_p2 = nil
	self.phalanx_vip.speech_prefix_count = nil
	self.phalanx_vip.no_damage_mission = true
	self.phalanx_vip.slowing_bullets = {
        duration = 1.5,
        power = 0.75
    }	
	self.phalanx_vip.static_weapon_preset = false
	--self.phalanx_vip.death_animation = "death_run" 
	--self.phalanx_vip.death_animation_vars = {"var3", "heavy", "fwd", "high"}
	self.phalanx_vip.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		heal_chatter_winters = true,
		entrance = true
	}		
	self.phalanx_vip.no_omnia_heal = true	
	self.phalanx_vip.can_be_healed = false
	self.phalanx_vip.captain_type = restoration.captain_types.winter
	self.phalanx_vip.no_mutator_weapon_override = true
	table.insert(self._enemy_list, "phalanx_vip")
	
	--Winters, shield broken
	self.phalanx_vip_break = deep_clone(self.phalanx_vip)
	self.phalanx_vip_break.tags = {"law", "special", "captain"}
	self.phalanx_vip_break.rotation_speed = 3
	self.phalanx_vip_break.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.phalanx_vip_break.dodge = presets.dodge.elite
	self.phalanx_vip_break.move_speed = presets.move_speed.very_fast
	self.phalanx_vip_break.can_throw_frag = true	
	self.phalanx_vip_break.grenade_cooldown = 12
	self.phalanx_vip_break.grenade_toss_chance = 1
	self.phalanx_vip_break.HEALTH_INIT = 140
	self.phalanx_vip_break.headshot_dmg_mul = 2.5
	self.phalanx_vip_break.allowed_stances = nil
	self.phalanx_vip_break.allowed_poses = nil
	self.phalanx_vip_break.no_equip_anim = nil
	self.phalanx_vip_break.no_run_start = nil
	self.phalanx_vip_break.no_run_stop = nil
	self.phalanx_vip_break.always_face_enemy = nil
	self.phalanx_vip_break.wall_fwd_offset = nil	
	self.phalanx_vip_break.damage.explosion_damage_mul = 0.40
	self.phalanx_vip_break.damage.rocket_damage_mul = 0.40
	self.phalanx_vip_break.damage.fire_pool_damage_mul = 0.20
	self.phalanx_vip_break.damage.bullet_damage_mul = 0.45
	self.phalanx_vip_break.damage.fire_damage_mul = 0.30		
	self.phalanx_vip_break.modify_health_on_tweak_change = true
	self.phalanx_vip_break.announce_incomming = nil
	self.phalanx_vip_break.marshal_logic = true	
	self.phalanx_vip_break.can_be_healed = false
	self.phalanx_vip_break.tmp_invulnerable_on_tweak_change = 15
	table.insert(self._enemy_list, "phalanx_vip_break")		
end

function CharacterTweakData:_init_spring(presets)
	self.spring = deep_clone(self.tank)
	self.spring.tags = {"law", "custom", "special", "captain", "spring"}
	self.spring.move_speed = presets.move_speed.very_slow
	self.spring.rage_move_speed = presets.move_speed.fast
	self.spring.can_throw_frag = true
	self.spring.can_ff_exp = true
	self.spring.grenade_cooldown = 12
	self.spring.grenade_toss_chance = 1
	self.spring.no_run_start = true
	self.spring.no_run_stop = true
	self.spring.no_retreat = true
	self.spring.no_limping = true
	self.spring.no_arrest = true
	self.spring.LOWER_HEALTH_PERCENTAGE_LIMIT = nil
	self.spring.FINAL_LOWER_HEALTH_PERCENTAGE_LIMIT = nil
	self.spring.ends_assault_on_death = true
	self.spring.no_damage_mission = true
	self.spring.immune_to_knock_down = true
	self.spring.HEALTH_INIT = 1000
	self.spring.EXTRA_HEALTH_BALANCE = 50
	self.spring.damage_resistance = presets.damage_resistance.none
	self.spring.headshot_dmg_mul = 3.997125
	self.spring.damage.explosion_damage_mul = 1.25
	self.spring.damage.rocket_damage_mul = 1.25
	self.spring.damage.bullet_damage_mul = 1
	self.spring.damage.fire_damage_mul = 1
	self.spring.priority_shout = "f45"
	self.spring.bot_priority_shout = "f45x_any"
	self.spring.priority_shout_max_dis = 3000
	self.spring.flammable = true
	self.spring.can_be_tased = false
	self.spring.ecm_vulnerability = nil
	self.spring.immune_to_concussion = true
	self.spring.ecm_hurts = {}
	self.spring.damage.hurt_severity = presets.hurt_severities.captain
	self.spring.melee_weapon = "fists_dozer"
	self.spring.melee_weapon_dmg_multiplier = 1
	self.spring.speech_prefix_p1 = "cpa"
	self.spring.speech_prefix_p2 = nil
	self.spring.speech_prefix_count = nil
	self.spring.custom_voicework = "spring"
	self.spring.kill_taunt = "a02"
	self.spring.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.spring.announce_incomming = "incomming_captain"
	self.spring.spawn_sound_event_2 = "cloaker_spawn"
	self.spring.die_sound_event_2 = "mga_death_scream"
	self.spring.static_dodge_preset = true
	self.spring.is_special = true
	self.spring.no_asu = true
	self.spring.no_omnia_heal = true
	self.spring.can_be_healed = false
	self.spring.min_obj_interrupt_dis = 300
	self.spring.dt_suppress = {
		range = 2000
	}
	self.spring.captain_type = restoration.captain_types.spring
	self.spring.no_xmas_hat = true
	table.insert(self._enemy_list, "spring")
	
	--Headless Titandozer Boss 
	self.headless_hatman = deep_clone(self.spring)
	self.headless_hatman.tags = {"law", "custom", "special", "captain", "headless_hatman"}
	self.headless_hatman.speech_prefix_p1 = "cpa"
	self.headless_hatman.speech_prefix_p2 = nil
	self.headless_hatman.speech_prefix_count = nil
	self.headless_hatman.spawn_sound_event_2 = nil
	self.headless_hatman.custom_voicework = "hatman"
	self.headless_hatman.slowing_bullets = {
		duration = 1,
		power = 0.5
	}
	self.headless_hatman.can_throw_frag = false
	self.headless_hatman.can_throw_molotov = true
	self.headless_hatman.can_ff_fire = true
	self.headless_hatman.no_omnia_heal = true
	self.headless_hatman.can_be_healed = false
	self.headless_hatman.dt_suppress = nil
	self.headless_hatman.captain_type = restoration.captain_types.hvh
	table.insert(self._enemy_list, "headless_hatman")
end

function CharacterTweakData:_init_summers(presets)	
	self.summers = deep_clone(presets.base)
	self.summers.tags = {"law", "custom", "special", "summers"}
	self.summers.experience = {}
	self.summers.weapon = deep_clone(presets.weapon.normal)
	self.summers.melee_weapon_dmg_multiplier = 1
	self.summers.detection = presets.detection.normal
	self.summers.HEALTH_INIT = 144
	self.summers.flammable = false
	self.summers.use_animation_on_fire_damage = false
	self.summers.base_summers_dr = 0.25
	self.summers.damage.explosion_damage_mul = 0.25
	self.summers.damage.rocket_damage_mul = 0.25
	self.summers.damage.fire_damage_mul = 0.25
	self.summers.damage.fire_pool_damage_mul = 0.25
	self.summers.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.summers.headshot_dmg_mul = 1.5
	self.summers.damage_resistance = presets.damage_resistance.none
	self.summers.bag_dmg_mul = 6
	self.summers.move_speed = presets.move_speed.fast
	self.summers.crouch_move = false
	self.summers.no_retreat = true
	self.summers.no_limping = true
	self.summers.no_arrest = true
	self.summers.ends_assault_on_death = true
	self.summers.no_damage_mission = true
	self.summers.immune_to_knock_down = true
	self.summers.priority_shout = "f45"
	self.summers.bot_priority_shout = "f45x_any"
	self.summers.priority_shout_max_dis = 3000
	self.summers.surrender = nil
	self.summers.ecm_vulnerability = 0
	self.summers.ecm_hurts = {}
	self.summers.surrender_break_time = {4, 6}
	self.summers.suppression = nil
	self.summers.weapon_voice = "3"
	self.summers.experience.cable_tie = "tie_swat"
	self.summers.speech_prefix_p1 = "rtsr"
	self.summers.speech_prefix_p2 = nil
	self.summers.speech_prefix_count = nil
	self.summers.access = "taser"
	self.summers.dodge = presets.dodge.elite
	self.summers.can_be_tased = false
	self.summers.immune_to_concussion = true
	self.summers.immune_to_ff_exp = true
	self.summers.immune_to_ff_fire = true
	self.summers.deathguard = true
	self.summers.chatter = presets.enemy_chatter.summers
	self.summers.announce_incomming = "incomming_captain"
	if self:get_ai_group_type() == "russia" then
		self.summers.spawn_sound_event = "cloaker_spawn"
	else
		self.summers.spawn_sound_event = "cpa_a02_01"
	end
	self.summers.die_sound_event = "mga_death_scream"
	self.summers.fire_bag_death = true	
	self.summers.use_radio = "dsp_radio_russian"
	self.summers.steal_loot = nil
	self.summers.is_special = true
	self.summers.no_asu = true
	self.summers.leader = {max_nr_followers = 3}
	self.summers.no_omnia_heal = true
	self.summers.can_be_healed = false
	self.summers.min_obj_interrupt_dis = 300
	self.summers.captain_type = restoration.captain_types.summer
	self.summers.no_mutator_weapon_override = true
	table.insert(self._enemy_list, "summers")
end

function CharacterTweakData:_init_autumn(presets)
	self.autumn = deep_clone(presets.base)
	self.autumn.tags = {"law", "custom", "special", "customvo", "autumn"}
	self.autumn.experience = {}
	self.autumn.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.autumn.weapon = deep_clone(presets.weapon.normal)
	self.autumn.detection = presets.detection.normal
	self.autumn.damage.immune_to_knockback = true
	self.autumn.immune_to_knock_down = true		
	self.autumn.immune_to_concussion = true		
	self.autumn.HEALTH_INIT = 120
	self.autumn.headshot_dmg_mul = 2.925
	self.autumn.damage_resistance = presets.damage_resistance.none
	self.autumn.damage.bullet_damage_mul = 0.65
	self.autumn.damage.fire_damage_mul = 0.75
	self.autumn.damage.fire_pool_damage_mul = 0.75
	self.autumn.flammable = false
	self.autumn.damage.explosion_damage_mul = 1
	self.autumn.damage.rocket_damage_mul = 1
	self.autumn.move_speed = presets.move_speed.lightning
	self.autumn.can_cloak = true
	self.autumn.no_retreat = true
	self.autumn.no_limping = true
	self.autumn.no_arrest = true
	self.autumn.surrender_break_time = {4, 6}
	self.autumn.suppression = nil
	self.autumn.surrender = nil
	self.autumn.can_be_tased = false
	self.autumn.priority_shout_max_dis = 0
	self.autumn.unintimidateable = true
	self.autumn.must_headshot = true
	self.autumn.priority_shout_max_dis = 3000
	self.autumn.rescue_hostages = true
	self.autumn.spooc_attack_timeout = {4, 4}
	self.autumn.spooc_attack_beating_time = {0, 0}
	self.autumn.no_damage_mission = true
	self.autumn.spawn_sound_event_2 = "cloaker_spawn"
	self.autumn.can_deploy_tear_gas = true
	self.autumn.chance_use_gas = 0.2
	self.autumn.cuff_on_melee = true
	--self.autumn.spawn_sound_event_2 = "cpa_a02_01"--uncomment for testing purposes
	self.autumn.spooc_attack_use_smoke_chance = 1
	self.autumn.weapon_voice = "3"
	self.autumn.experience.cable_tie = "tie_swat"
	self.autumn.speech_prefix_p1 = "cpa"
	self.autumn.speech_prefix_count = nil
	self.autumn.custom_voicework = "autumn"		
	self.autumn.ends_assault_on_death = true	
	self.autumn.access = "spooc"
	self.autumn.dodge = presets.dodge.autumn
	self.autumn.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.autumn.steal_loot = nil
	self.autumn.melee_weapon = nil
	self.autumn.use_radio = nil
	self.autumn.static_dodge_preset = true
	self.autumn.is_special = true
	self.autumn.no_asu = true
	self.autumn.cannot_attach_projectiles = true	
	self.autumn.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.5

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}
	self.autumn.do_autumn_blackout = true --if true, deployables in a radius around this cop will be disabled
	self.autumn.no_omnia_heal = true
	self.autumn.can_be_healed = false
	self.autumn.min_obj_interrupt_dis = 300
	self.autumn.captain_type = restoration.captain_types.autumn
	self.autumn.no_xmas_hat = true
	table.insert(self._enemy_list, "autumn")
end	

function CharacterTweakData:_init_taser(presets)	
	self.taser = deep_clone(presets.base)
	self.taser.tags = {"law", "taser", "special"}
	self.taser.experience = {}
	self.taser.weapon = deep_clone(presets.weapon.normal)
	self.taser.weapon.is_rifle.tase_distance = 1400
	self.taser.weapon.is_rifle.aim_delay_tase = {2, 2}
	self.taser.weapon.is_rifle.tase_sphere_cast_radius = 30
	self.taser.detection = presets.detection.normal
	self.taser.HEALTH_INIT = 30
	self.taser.headshot_dmg_mul = 1.5
	self.taser.damage.explosion_damage_mul = 0.75
	self.taser.damage.fire_damage_mul = 0.75
	self.taser.damage.fire_pool_damage_mul = 0.75		
	self.taser.damage_resistance = presets.damage_resistance.none
	self.taser.move_speed = presets.move_speed.fast
	self.taser.no_retreat = true
	self.taser.no_arrest = true
	self.taser.surrender = presets.surrender.special
	self.taser.ecm_vulnerability = 0.6
	self.taser.ecm_hurts = {
		ears = 6
	}
	self.taser.surrender_break_time = {4, 6}
	self.taser.suppression = nil
	self.taser.weapon_voice = "3"
	self.taser.experience.cable_tie = "tie_swat"
	self.taser.speech_prefix_p1 = self._prefix_data_p1.taser()
	self.taser.speech_prefix_p2 = nil
	self.taser.speech_prefix_count = nil
	self.taser.kill_taunt = "post_tasing_taunt"
	self.taser.spawn_sound_event = self._prefix_data_p1.taser() .. "_entrance"
	self.taser.access = "taser"
	self.taser.dodge = presets.dodge.athletic
	self.taser.priority_shout = "f32"
	self.taser.bot_priority_shout = "f32x_any"
	self.taser.priority_shout_max_dis = 3000
	self.taser.deathguard = true
	self.taser.shock_damage = 8.0 --Amount of damage dealt when taser shocks down.
	self.taser.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.taser.announce_incomming = "incomming_taser"
	self.taser.steal_loot = nil
	self.taser.special_deaths = {}
	self.taser.special_deaths.bullet = {
		[("head"):id():key()] = {
			character_name = "bodhi",
			weapon_id = "model70",
			sequence = "kill_tazer_headshot",
			special_comment = "x01"
		}
	}
	self.taser.is_special = true
	self.taser.no_asu = true
	self.taser.heal_cooldown = 7.5
	self.taser.min_obj_interrupt_dis = 1000
	table.insert(self._enemy_list, "taser")
	
	self.taser_summers = deep_clone(self.taser)
	self.taser_summers.HEALTH_INIT = 120
	self.taser_summers.headshot_dmg_mul = 1.5
	self.taser_summers.damage_resistance = presets.damage_resistance.none
	self.taser_summers.tags = {"female_enemy","taser", "custom", "special"}
	self.taser_summers.ignore_medic_revive_animation = false
	self.taser_summers.flammable = false
	self.taser_summers.use_animation_on_fire_damage = false
	self.taser_summers.damage.explosion_damage_mul = 0.25
	self.taser_summers.damage.rocket_damage_mul = 0.25
	self.taser_summers.damage.fire_damage_mul = 0.25
	self.taser_summers.damage.fire_pool_damage_mul = 0.25
	self.taser_summers.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.taser_summers.ecm_vulnerability = 0
	self.taser_summers.ecm_hurts = {}
	self.taser_summers.chatter = presets.enemy_chatter.summers
	self.taser_summers.no_retreat = true
	self.taser_summers.no_limping = true
	self.taser_summers.immune_to_concussion = true
	self.taser_summers.immune_to_ff_fire = true
	self.taser_summers.immune_to_ff_exp = true
	self.taser_summers.no_damage_mission = true
	self.taser_summers.no_arrest = true
	self.taser_summers.immune_to_knock_down = true
	self.taser_summers.priority_shout = "f45"
	self.taser_summers.bot_priority_shout = "f45x_any"
	self.taser_summers.speech_prefix_p1 = "fl"
	self.taser_summers.speech_prefix_p2 = "n"
	self.taser_summers.speech_prefix_count = 1
	self.taser_summers.die_sound_event = "mga_death_scream"
	self.taser_summers.use_radio = "dsp_radio_russian"
	self.taser_summers.spawn_sound_event = nil
	self.taser_summers.custom_voicework = nil
	self.taser_summers.is_special = true	
	self.taser_summers.no_asu = true
	self.taser_summers.follower = true
	self.taser_summers.tase_on_melee = true
	self.taser_summers.melee_weapon = "buzzer_summer"
	self.taser_summers.slowing_bullets = {
		duration = 3,
		power = 1,
		taunt = true
	}
	self.taser_summers.no_omnia_heal = true
	self.taser_summers.can_be_healed = false
	self.taser_summers.min_obj_interrupt_dis = 300
	self.taser_summers.reduce_summers_dr_on_death = true
	table.insert(self._enemy_list, "taser_summers")
	
	self.taser_titan = deep_clone(self.taser)
	self.taser_titan.tags = {"taser", "taser_titan", "custom", "special"}
	self.taser_titan.HEALTH_INIT = 45
	self.taser_titan.headshot_dmg_mul = 2.2
	self.taser_titan.priority_shout = "f32"
	self.taser_titan.bot_priority_shout = "f32x_any"	
	self.taser_titan.titan_taser_charge = true
	self.taser_titan.immune_to_concussion = true	
	self.taser_titan.use_animation_on_fire_damage = false
	self.taser_titan.can_be_tased = false	
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.taser_titan.spawn_sound_event = "rtsr_elite"
	else
		self.taser_titan.spawn_sound_event = "tsr_elite"
	end	
	self.taser_titan.spawn_sound_event_2 = "cloaker_spawn"
	self.taser_titan.die_sound_event = "mga_death_scream"
	self.taser_titan.custom_voicework = nil
	self.taser_titan.surrender = nil
	self.taser_titan.dodge = presets.dodge.elite
	self.taser_titan.static_dodge_preset = true
	self.taser_titan.is_special = true	
	self.taser_titan.no_asu = true
	self.taser_titan.no_xmas_hat = true
	if self:get_ai_group_type() == "russia" or self:get_ai_group_type() == "federales" then
		self.taser_titan.yellow_blood = false
	else
		self.taser_titan.yellow_blood = true
	end	
	self.taser_titan.move_speed = presets.move_speed.fast
	self.taser_titan.heal_cooldown = 11.25
	self.taser_titan.slowing_bullets = {
		duration = 3,
		power = 1,
		taunt = true
	}
	table.insert(self._enemy_list, "taser_titan")
	
	self.taser_titan_reaper = deep_clone(self.taser_titan)
	self.taser_titan_reaper.marshal_logic = true
	self.taser_titan_reaper.slowing_bullets = {
		duration = 3,
		power = 1,
		taunt = true
	}	
	table.insert(self._enemy_list, "taser_titan_reaper")
end

function CharacterTweakData:_init_boom(presets)		
	self.boom = deep_clone(presets.base)
	self.boom.tags = {"law", "boom", "custom", "special", "customvo"}
	self.boom.experience = {}
	self.boom.weapon = deep_clone(presets.weapon.normal)
	self.boom.melee_weapon = nil
	self.boom.melee_weapon_dmg_multiplier = 1
	self.boom.weapon_safety_range = 1000
	self.boom.detection = presets.detection.normal
	self.boom.HEALTH_INIT = 30
	self.boom.HEALTH_SUICIDE_LIMIT = 0.25
	self.boom.damage_resistance = presets.damage_resistance.none
	self.boom.flammable = true
	self.boom.use_animation_on_fire_damage = true
	self.boom.damage.explosion_damage_mul = 0.5
	self.boom.damage.rocket_damage_mul = 0.5
	self.boom.damage.dot_damage_mul = 0.5
	self.boom.damage.fire_damage_mul = 0.5
	self.boom.damage.fire_pool_damage_mul = 0.5
	self.boom.damage.hurt_severity = presets.hurt_severities.boom
	self.boom.headshot_dmg_mul = 1.5
	self.boom.bag_dmg_mul = 6
	self.boom.move_speed = presets.move_speed.fast
	self.boom.no_retreat = true
	self.boom.no_arrest = true
	self.boom.use_gas = true
	self.boom.surrender = nil
	self.boom.ecm_vulnerability = 0.6
	self.boom.ecm_hurts = {
		ears = 6
	}
	self.boom.surrender_break_time = {4, 6}
	self.boom.suppression = nil
	self.boom.weapon_voice = "3"
	self.boom.experience.cable_tie = "tie_swat"
	self.boom.speech_prefix_p1 = nil
	self.boom.speech_prefix_p2 = nil
	self.boom.speech_prefix_count = nil
	self.boom.access = "taser"
	self.boom.dodge = presets.dodge.athletic
	self.boom.can_deploy_tear_gas = true
	self.boom.chance_use_gas = 0.5
	self.boom.priority_shout = "g29"
	self.boom.bot_priority_shout = "g29"
	self.boom.priority_shout_max_dis = 3000
	self.boom.custom_shout = true
	self.boom.deathguard = true
	self.boom.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.boom.announce_incomming = "incomming_gren"
	self.boom.steal_loot = nil
	if self:get_ai_group_type() == "federales" then
		self.boom.custom_voicework = "grenadier_bex"
	--Temp, until we get a better one
	elseif self:get_ai_group_type() == "russia" then
		self.boom.custom_voicework = "tswat_ru"
	else
		self.boom.custom_voicework = "grenadier"
	end
	self.boom.is_special = true	
	self.boom.no_asu = true	
	self.boom.marshal_logic = true
	self.boom.heal_cooldown = 7.5
	table.insert(self._enemy_list, "boom")
	
	self.boom_summers = deep_clone(self.boom)
	self.boom_summers.flammable = false
	self.boom_summers.use_animation_on_fire_damage = false
	self.boom_summers.damage.explosion_damage_mul = 0.25
	self.boom_summers.damage.rocket_damage_mul = 0.25
	self.boom_summers.damage.fire_damage_mul = 0.25
	self.boom_summers.damage.fire_pool_damage_mul = 0.25
	self.boom_summers.damage.hurt_severity = presets.hurt_severities.only_light_hurt_no_explode
	self.boom_summers.chatter = presets.enemy_chatter.summers
	self.boom_summers.speech_prefix_p1 = "fl"
	self.boom_summers.speech_prefix_p2 = "n"
	self.boom_summers.speech_prefix_count = 1
	self.boom_summers.custom_voicework = nil
	self.boom_summers.die_sound_event = "mga_death_scream"
	self.boom_summers.use_radio = "dsp_radio_russian"
	self.boom_summers.HEALTH_INIT = 120
	self.boom_summers.headshot_dmg_mul = 1.5
	self.boom_summers.damage_resistance = presets.damage_resistance.none
	self.boom_summers.tags = {"female_enemy", "custom", "special"}
	self.boom_summers.ignore_medic_revive_animation = false
	self.boom_summers.can_deploy_tear_gas = false
	self.boom_summers.can_throw_molotov = true
	self.boom_summers.can_ff_fire = true
	self.boom_summers.no_retreat = true
	self.boom_summers.no_limping = true
	self.boom_summers.no_arrest = true
	self.boom_summers.immune_to_knock_down = true
	self.boom_summers.immune_to_concussion = true
	self.boom_summers.immune_to_ff_exp = true
	self.boom_summers.immune_to_ff_fire = true
	self.boom_summers.no_damage_mission = true
	self.boom_summers.priority_shout = "f45"
	self.boom_summers.bot_priority_shout = "f45x_any"
	self.boom_summers.custom_shout = false
	self.boom_summers.follower = true
	self.boom_summers.ecm_vulnerability = 0
	self.boom_summers.ecm_hurts = {}		
	self.boom_summers.no_omnia_heal = true
	self.boom_summers.can_be_healed = false
	self.boom_summers.marshal_logic = nil
	self.boom_summers.min_obj_interrupt_dis = 300
	self.boom_summers.reduce_summers_dr_on_death = true
	table.insert(self._enemy_list, "boom_summers")		
	
	self.boom_titan = deep_clone(self.boom)
	self.boom_titan.damage.hurt_severity = presets.hurt_severities.boom_titan
	self.boom_titan.move_speed = presets.move_speed.normal
	self.boom_titan.heal_cooldown = 11.5
	self.boom_titan.HEALTH_INIT = 45
	self.boom_titan.bag_death = true
	self.boom_titan.headshot_dmg_mul = 2.2	
	self.boom_titan.throwable_cooldown = 10	
	self.boom_titan.marshal_logic = nil
	
	table.insert(self._enemy_list, "boom_titan")		
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
	self.inside_man.suppression = nil
	self.inside_man.surrender = nil
	self.inside_man.unintimidateable = true
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
	self.inside_man.no_omnia_heal = true
	
	self.inside_woman = deep_clone(self.inside_man)
	self.inside_woman.speech_prefix_p1 = "fl"
	self.inside_woman.speech_prefix_p2 = "n"
	self.inside_woman.speech_prefix_count = 1	
end

function CharacterTweakData:_init_civilian(presets)
	self.civilian = {
		experience = {}
	}
	self.civilian.tags = {"civilian"}
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
	self.civilian.damage = {
		hurt_severity = presets.hurt_severities.no_hurts
	}
	self.civilian.flammable = false
	self.civilian.ecm_vulnerability = nil
	self.civilian.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.civilian.experience.cable_tie = "tie_civ"
	self.civilian.die_sound_event = "l1n_x01a_any_3p"
	self.civilian.custom_shout = true
	self.civilian.silent_priority_shout = "g27" --pd3 moment, not sure if this voiceline is always loaded though
	self.civilian.speech_prefix_p1 = "cm"
	self.civilian.speech_prefix_count = 2
	self.civilian.access = "civ_male"
	self.civilian.intimidateable = true
	if job == "haunted" then
		self.civilian.no_civ_penalty = true --they're not real anyway
	else
		self.civilian.no_civ_penalty = false
	end
	self.civilian.challenges = {type = "civilians"}
	if job == "nmh" or job == "nmh_res" then
		self.civilian.calls_in = false
	else
		self.civilian.calls_in = true
	end
	self.civilian.hostage_move_speed = 1.5
	self.civilian_female = deep_clone(self.civilian)
	self.civilian_female.die_sound_event = "fl1n_x02a_any_3p"
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
	self.robbers_safehouse.HEALTH_INIT = 20
	self.robbers_safehouse.headshot_dmg_mul = 1
	self.robbers_safehouse.use_ik = true	
end

function CharacterTweakData:_init_civilian_mariachi(presets)
	self.civilian_mariachi = deep_clone(self.civilian)
end	

function CharacterTweakData:_init_civilian_no_penalty(presets)
	self.civilian_no_penalty = deep_clone(self.civilian)
	self.civilian_no_penalty.no_civ_penalty = true
end

function CharacterTweakData:_init_bank_manager(presets)
	self.bank_manager = {
		experience = {},
		escort = {}
	}
	self.bank_manager.tags = {"civilian"}
	self.bank_manager.die_sound_event = "l1n_x01a_any_3p"
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
	self.bank_manager.damage = {
		hurt_severity = presets.hurt_severities.no_hurts
	}
	self.bank_manager.silent_priority_shout = "g27"
	self.bank_manager.custom_shout = true
	self.bank_manager.flammable = false
	self.bank_manager.ecm_vulnerability = nil
	self.bank_manager.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.bank_manager.experience.cable_tie = "tie_civ"
	self.bank_manager.speech_prefix_p1 = "cm"
	self.bank_manager.speech_prefix_count = 2
	self.bank_manager.access = "civ_male"
	self.bank_manager.intimidateable = true
	self.bank_manager.hostage_move_speed = 1.5
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
	self.old_hoxton_mission.damage.rocket_damage_mul = 0
	self.old_hoxton_mission.HEALTH_INIT = 20
	self.old_hoxton_mission.headshot_dmg_mul = 1
	self.old_hoxton_mission.move_speed = presets.move_speed.gang_member
	self.old_hoxton_mission.no_omnia_heal = true
	--Cause they don't like being told what to do
	self.old_hoxton_mission.allowed_poses = {stand = true}
	self.old_hoxton_mission.surrender_break_time = {6, 10}
	self.old_hoxton_mission.suppression = nil
	self.old_hoxton_mission.surrender = false
	self.old_hoxton_mission.weapon_voice = "1"
	self.old_hoxton_mission.experience.cable_tie = "tie_swat"
	self.old_hoxton_mission.speech_prefix_p1 = "rb2"
	self.old_hoxton_mission.access = "teamAI4"
	self.old_hoxton_mission.dodge = nil
	self.old_hoxton_mission.no_arrest = true
	self.old_hoxton_mission.chatter = presets.enemy_chatter.no_chatter
	self.old_hoxton_mission.use_radio = nil
	self.old_hoxton_mission.melee_weapon = "fists"
	self.old_hoxton_mission.melee_weapon_dmg_multiplier = 1
	self.old_hoxton_mission.crouch_move = false
	self.old_hoxton_mission.static_dodge_preset = true
	--No more being mean to Hoxton
	self.old_hoxton_mission.is_escort = true
	self.old_hoxton_mission.speech_escort = "f38"
	self.old_hoxton_mission.escort_idle_talk = false	
	
	self.anubis = deep_clone(self.old_hoxton_mission)	
end

function CharacterTweakData:_init_spa_vip(presets)
	self.spa_vip = deep_clone(self.old_hoxton_mission)
	self.spa_vip.spotlight_important = 100
	self.spa_vip.is_escort = true
	self.spa_vip.escort_idle_talk = false
	self.spa_vip.escort_scared_dist = 100
	self.spa_vip.no_omnia_heal = true
end

function CharacterTweakData:_init_spa_vip_hurt(presets)
	self.spa_vip_hurt = deep_clone(self.civilian)
	self.spa_vip_hurt.move_speed = presets.move_speed.slow
	self.spa_vip_hurt.flee_type = "hide"
	self.spa_vip_hurt.access = "civ_male"
	self.spa_vip_hurt.intimidateable = nil
	self.spa_vip_hurt.challenges = {type = "civilians"}
	self.spa_vip_hurt.calls_in = nil
	self.spa_vip_hurt.ignores_aggression = true
	self.spa_vip_hurt.no_omnia_heal = true
end

function CharacterTweakData:_init_zombie(presets)
	self.zombie_light = deep_clone(self.swat)
	table.insert(self._enemy_list, "zombie_light")	

end

function CharacterTweakData:_presets(tweak_data)
	local presets = {}
	presets.enemy_chatter = {
		no_chatter = {},
		guard = {
			aggressive = true,
			contact = true,
			clear_whisper = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			suppress = true,
			dodge = true,
			cuffed = true
		},
		cop = {
			entry = true,
			aggressive = true,
			enemyidlepanic = true,
			controlpanic = true,
			dodge = true,
			cuffed = true,
			entry = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sabotagebags = true,
			sabotagehostages = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		},
		swat = {
			entry = true,
			aggressive = true,
			enemyidlepanic = true,
			controlpanic = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			inpos = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			sabotagepower = true,
			sabotagedrill = true,
			sabotagegeneric = true,
			sabotagegear = true,
			sabotagebags = true,
			sabotagehostages = true,
			suppress = true,
			dodge = true,
			cuffed = true
		},
		gangster = {
			aggressive = true,
			contact = true,
			go_go = true,
			suppress = true,
			enemyidlepanic = true
		},
		omnia_lpf = {
			entry = true,
			aggressive = true,
			enemyidlepanic = true,
			controlpanic = true,
			retreat = true,
			contact = true,
			clear = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			inpos = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			sabotagepower = true,
			sabotagedrill = true,
			sabotagegeneric = true,
			sabotagegear = true,
			sabotagebags = true,
			sabotagehostages = true,
			suppress = true,
			dodge = true,
			cuffed = true
		},			
		summers = {
			entry = true,
			aggressive = true,
			enemyidlepanic = true,
			controlpanic = true,
			retreat = true,
			contact = true,
			clear = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			inpos = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			sabotagepower = true,
			sabotagedrill = true,
			sabotagegeneric = true,
			sabotagegear = true,
			sabotagebags = true,
			sabotagehostages = true,
			suppress = true,
			dodge = true,
			cuffed = true
		},
		shield = {
			entry = true,
			aggressive = true,
			enemyidlepanic = true,
			controlpanic = true,
			retreat = true,
			contact = true,
			clear = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			inpos = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			sabotagepower = true,
			sabotagedrill = true,
			sabotagegeneric = true,
			sabotagegear = true,
			sabotagebags = true,
			sabotagehostages = true,
			suppress = true,
			dodge = true,
			cuffed = true
		},
		cloaker = {
			contact = true,
			cloakercontact = true,
			cloakeravoidance = true,
			aggressive = true
		}			
	}
	
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
		bleed = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = false
	}
	presets.hurt_severities.only_light_hurt_no_explode = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{light = 1}
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
				{light = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		bleed = {
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
					light = 0.995,
					explode = 0.005
				}
			}
	}
	presets.hurt_severities.titan.fire = {
			health_reference = "current",
			zones = {
				{light = 1}
			}
	}
	presets.hurt_severities.titan.explosion = {
			health_reference = "current",
			zones = {
				{light = 1}
			}
	}
	presets.hurt_severities.captain = deep_clone(presets.hurt_severities.titan)
	presets.hurt_severities.captain.bullet = {
			health_reference = "current",
			zones = {
				{
					light = 0.995,
					explode = 0.005
				}
			}
	}	
	presets.hurt_severities.boss = deep_clone(presets.hurt_severities.titan)
	presets.hurt_severities.boss.bullet = {
			health_reference = "current",
			zones = {
				{
					light = 0.995,
					moderate = 0.005
				}
			}
	}		
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
		bleed = {
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
				{light = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		bleed = {
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
	presets.hurt_severities.elite_easy = deep_clone(presets.hurt_severities.light_hurt_fire_poison)
	presets.hurt_severities.elite_easy.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.3,
				none = 0.2,
				light = 0.7,
				moderate = 0.05,
				heavy = 0
			},
			{
				health_limit = 0.6,
				light = 0.4,
				moderate = 0.4,
				heavy = 0
			},
			{
				health_limit = 0.9,
				light = 0.2,
				moderate = 0.2,
				heavy = 0
			},
			{
				light = 0,
				moderate = 1,
				heavy = 0
			}
		}
	}	
	presets.hurt_severities.elite_easy.melee = {
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
		bleed = {
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
		bleed = {
			health_reference = 1,
			zones = {
				{none = 1}
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
				{light = 1}
			}
		},
		poison = {
			health_reference = "current",
			zones = {
				{none = 0, poison = 1}
			}
		},
		bleed = {
			health_reference = "current",
			zones = {
				{none = 1}
			}
		},
		tase = true,
	}
	presets.hurt_severities.heavy = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.heavy.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.3,
				none = 0.2,
				light = 0.7,
				moderate = 0.1
			},
			{
				health_limit = 0.6,
				light = 0.4,
				moderate = 0.6
			},
			{
				health_limit = 0.9,
				light = 0.2,
				moderate = 0.8
			},
			{
				light = 0,
				moderate = 1,
				heavy = 0
			}
		}
	}	
	presets.hurt_severities.spooc = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.spooc_titan = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.spooc_titan.fire = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.hurt_severities.spooc_titan.melee = {
		health_reference = "current",
		zones = {
			{none = 1}
		}
	}	
	presets.hurt_severities.boom = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.boom.explosion = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.hurt_severities.boom.poison = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	
	--Titan Grenadier
	presets.hurt_severities.boom_titan = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.boom_titan.explosion = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}	
	presets.hurt_severities.boom_titan.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.3,
				none = 0.2,
				light = 0.7,
				moderate = 0.1
			},
			{
				health_limit = 0.6,
				light = 0.4,
				moderate = 0.6
			},
			{
				health_limit = 0.9,
				light = 0.2,
				moderate = 0.8
			},
			{
				light = 0,
				moderate = 1,
				heavy = 0
			}
		}
	}	
	presets.hurt_severities.boom_titan.poison = {
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
	
	presets.damage_resistance = {}
	--Damage Resistance tables
	presets.damage_resistance.none = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}		
	presets.damage_resistance.hrt = {
		assault_rifle = 1,
		sniper = 0.75,
		anti_materiel = 0.75,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 0.75,
		pistol = 1, 
		heavy_pistol = 0.75,
		blunt = 0.75,
		sharp = 1.25
	}	
	presets.damage_resistance.light_swat = {
		assault_rifle = 0.75,
		sniper = 1.25,
		anti_materiel = 1,
		shotgun = 0.75,
		machine_gun = 0.75, 
		pdw = 1,
		pistol = 0.75, 
		heavy_pistol = 1.25,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.heavy_swat = {
		assault_rifle = 0.75,
		sniper = 1,
		anti_materiel = 1,
		shotgun = 0.75,
		machine_gun = 0.75, 
		pdw = 1.125,
		pistol = 0.75, 
		heavy_pistol = 1,
		blunt = 1.25,
		sharp = 0.75
	}	
	presets.damage_resistance.medic = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1.5,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.sniper = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.boss = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 2,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}		
	presets.damage_resistance.tank = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 2,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.spooc = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1.5,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.shield = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1.5,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.taser = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1.5,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}	
	presets.damage_resistance.boom = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1.5,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}
	
	presets.base = {}
	presets.base.HEALTH_INIT = 2
	presets.base.headshot_dmg_mul = 2
	presets.base.use_animation_on_fire_damage = true
	presets.base.can_be_healed = true --Just in case
	presets.base.SPEED_WALK = {
		ntl = 120,
		hos = 180,
		cbt = 160,
		pnc = 160
	}
	presets.base.SPEED_RUN = 370
	presets.base.chatter = presets.enemy_chatter.no_chatter
	presets.base.crouch_move = true
	presets.base.shooting_death = true
	presets.base.rotation_speed = 3
	presets.base.suspicious = true
	presets.base.surrender_break_time = {20, 30}
	presets.base.submission_max = {45, 60}
	presets.base.submission_intimidate = 15
	presets.base.speech_prefix = "po"
	presets.base.speech_prefix_count = 1
	presets.base.kill_taunt = "i03"
	presets.base.follower = false
	presets.base.rescue_hostages = false
	presets.base.steal_loot = false
	presets.base.use_radio = self._default_chatter
	presets.base.dodge = nil
	presets.base.challenges = {type = "law"}
	presets.base.calls_in = true
	presets.base.ignore_medic_revive_animation = false
	presets.base.spotlight_important = false
	presets.base.experience = {}
	presets.base.experience.cable_tie = "tie_swat"
	presets.base.damage = {}
	presets.base.damage.hurt_severity = presets.hurt_severities.base
	presets.base.damage.death_severity = 0.5
	presets.base.damage_resistance = {
		assault_rifle = 1,
		sniper = 1,
		anti_materiel = 1,
		shotgun = 1,
		machine_gun = 1, 
		pdw = 1,
		pistol = 1, 
		heavy_pistol = 1,
		blunt = 1,
		sharp = 1
	}
	presets.base.damage.explosion_damage_mul = 1
	presets.base.damage.rocket_damage_mul = 1
	presets.base.overheal_mult = 1
	presets.base.critical_hits = {
		damage_mul = 1.5
	}
	presets.base.damage.tased_response = {
		light = {tased_time = 5, down_time = 5},
		heavy = {tased_time = 5, down_time = 10}
	}
	presets.base.static_weapon_preset = false
	presets.base.static_dodge_preset = false
	presets.base.static_melee_preset = false
	presets.gang_member_damage = {}
	presets.gang_member_damage.HEALTH_INIT = 25
	presets.gang_member_damage.no_run_start = true
	presets.gang_member_damage.no_run_stop = true
	presets.gang_member_damage.headshot_dmg_mul = 1
	presets.gang_member_damage.LIVES_INIT = 4
	presets.gang_member_damage.explosion_damage_mul = 0
	presets.gang_member_damage.rocket_damage_mul = 0
	presets.gang_member_damage.REGENERATE_TIME = 3
	presets.gang_member_damage.REGENERATE_TIME_AWAY = 1.5
	presets.gang_member_damage.DOWNED_TIME = tweak_data.player.damage.DOWNED_TIME
	presets.gang_member_damage.TASED_TIME = tweak_data.player.damage.TASED_TIME
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 20
	presets.gang_member_damage.ARRESTED_TIME = 30
	presets.gang_member_damage.INCAPACITATED_TIME = tweak_data.player.damage.INCAPACITATED_TIME
	presets.gang_member_damage.hurt_severity = deep_clone(presets.hurt_severities.no_hurts)
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
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
		mini = {},
		is_sniper = {},
		is_flamethrower = {},
		is_m32 = {},
		is_dmr = {}
	}
	presets.weapon.normal.is_pistol.aim_delay = {0.15, 0.15}
	presets.weapon.normal.is_pistol.focus_delay = 10
	presets.weapon.normal.is_pistol.focus_dis = 200
	presets.weapon.normal.is_pistol.spread = 20
	presets.weapon.normal.is_pistol.miss_dis = 40
	presets.weapon.normal.is_pistol.RELOAD_SPEED = 1
	presets.weapon.normal.is_pistol.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_pistol.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_pistol.melee_retry_delay = {2, 2}
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
			r = 1500,
			acc = {0.375, 0.55},
			dmg_mul = 0.95,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.375, 0.55},
			dmg_mul = 0.9,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.375, 0.55},
			dmg_mul = 0.85,
			recoil = {0.15, 0.3},
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
			dmg_mul = 0.8,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.375, 0.55},
			dmg_mul = 0.75,
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
			dmg_mul = 0.7,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.25, 0.45},
			dmg_mul = 0.65,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2200,
			acc = {0.25, 0.45},
			dmg_mul = 0.6,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.25, 0.45},
			dmg_mul = 0.55,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 0.45,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.01, 0.35},
			dmg_mul = 0.4,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 0.35,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 0.3,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 0.25,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.akimbo_pistol = deep_clone(presets.weapon.normal.is_pistol)
	presets.weapon.normal.akimbo_pistol.RELOAD_SPEED = 0.8
	presets.weapon.normal.is_rifle.aim_delay = {0.15, 0.15}
	presets.weapon.normal.is_rifle.focus_delay = 10
	presets.weapon.normal.is_rifle.focus_dis = 200
	presets.weapon.normal.is_rifle.spread = 20
	presets.weapon.normal.is_rifle.miss_dis = 30
	presets.weapon.normal.is_rifle.RELOAD_SPEED = 1
	presets.weapon.normal.is_rifle.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_rifle.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_rifle.tase_distance = 1400
	presets.weapon.normal.is_rifle.aim_delay_tase = {2, 2}
	presets.weapon.normal.is_rifle.tase_sphere_cast_radius = 30
	presets.weapon.normal.is_rifle.melee_retry_delay = {2, 2}
	presets.weapon.normal.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_rifle.autofire_rounds = {6, 11}
	presets.weapon.normal.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
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
			acc = {0.5, 0.9},
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
			acc = {0.3, 0.8},
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
			r = 2200,
			acc = {0.2, 0.5},
			dmg_mul = 0.95,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.2, 0.5},
			dmg_mul = 0.9,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.2, 0.5},
			dmg_mul = 0.85,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.2, 0.5},
			dmg_mul = 0.8,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.2, 0.5},
			dmg_mul = 0.75,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.2, 0.5},
			dmg_mul = 0.7,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.2, 0.5},
			dmg_mul = 0.65,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
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
			dmg_mul = 0.55,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.45,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.4,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}		
	}
	
	--Single shot only rifles, used for specific enemies
	presets.weapon.normal.is_rifle_single_fire = deep_clone(presets.weapon.normal.is_rifle)
	presets.weapon.normal.is_rifle_single_fire.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.8},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.2, 0.5},
			dmg_mul = 0.95,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.2, 0.5},
			dmg_mul = 0.9,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.2, 0.5},
			dmg_mul = 0.85,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.2, 0.5},
			dmg_mul = 0.8,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.2, 0.5},
			dmg_mul = 0.75,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.2, 0.5},
			dmg_mul = 0.7,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.2, 0.5},
			dmg_mul = 0.65,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
			recoil = {1, 1.25},
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
			dmg_mul = 0.55,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.45,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.4,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		}		
	}
	
	presets.weapon.normal.is_bullpup = presets.weapon.normal.is_rifle
	presets.weapon.normal.is_shotgun_pump.aim_delay = {0.2, 0.2}
	presets.weapon.normal.is_shotgun_pump.focus_delay = 10
	presets.weapon.normal.is_shotgun_pump.focus_dis = 200
	presets.weapon.normal.is_shotgun_pump.spread = 15
	presets.weapon.normal.is_shotgun_pump.miss_dis = 20
	presets.weapon.normal.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.normal.is_shotgun_pump.melee_speed = nil
	presets.weapon.normal.is_shotgun_pump.melee_dmg = nil
	presets.weapon.normal.is_shotgun_pump.melee_retry_delay = nil
	presets.weapon.normal.is_shotgun_pump.no_melee = true
	presets.weapon.normal.is_shotgun_pump.range = {
		close = 500,
		optimal = 1000,
		far = 2000
	}
	presets.weapon.normal.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.9},
			dmg_mul = 0.95,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
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
			r = 1300,
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
			r = 1400,
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
			r = 1500,
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
			r = 1600,
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
			r = 1700,
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
			r = 1800,
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
			r = 1900,
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
			r = 2000,
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
			r = 2100,
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
			r = 2200,
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
			r = 2300,
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
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.3,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_smg.aim_delay = {0.2, 0.2}
	presets.weapon.normal.is_smg.focus_delay = 10
	presets.weapon.normal.is_smg.focus_dis = 200
	presets.weapon.normal.is_smg.spread = 15
	presets.weapon.normal.is_smg.miss_dis = 20
	presets.weapon.normal.is_smg.RELOAD_SPEED = 1
	presets.weapon.normal.is_smg.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_smg.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_smg.melee_retry_delay = {2, 2}
	presets.weapon.normal.is_smg.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_smg.autofire_rounds = {6, 11}
	presets.weapon.normal.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
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
			acc = {0.5, 0.9},
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
			acc = {0.3, 0.8},
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
			r = 1100,
			acc = {0.3, 0.8},
			dmg_mul = 0.95,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1200,
			acc = {0.3, 0.8},
			dmg_mul = 0.9,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 1300,
			acc = {0.3, 0.8},
			dmg_mul = 0.85,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 1400,
			acc = {0.3, 0.8},
			dmg_mul = 0.8,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.3, 0.8},
			dmg_mul = 0.75,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.3, 0.8},
			dmg_mul = 0.7,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.3, 0.8},
			dmg_mul = 0.65,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1800,
			acc = {0.3, 0.8},
			dmg_mul = 0.6,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.3, 0.8},
			dmg_mul = 0.55,
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
			dmg_mul = 0.5,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.45},
			dmg_mul = 0.45,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.1, 0.45},
			dmg_mul = 0.4,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.1, 0.45},
			dmg_mul = 0.35,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 0.3,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 0.25,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.normal.mp9.aim_delay = {0.15, 0.15}
	presets.weapon.normal.mp9.focus_delay = 20
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
			r = 100,
			acc = {0.7, 0.75},
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
			r = 500,
			acc = {0.5, 0.55},
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
			acc = {0.45, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.45, 0.45},
			dmg_mul = 0.95,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.45, 0.45},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.45, 0.45},
			dmg_mul = 0.85,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.45, 0.45},
			dmg_mul = 0.8,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.45, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1800,
			acc = {0.45, 0.45},
			dmg_mul = 0.7,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 1900,
			acc = {0.45, 0.45},
			dmg_mul = 0.65,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.3, 0.3},
			dmg_mul = 0.6,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 0.55,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.45,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.4,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.35,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.3,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.mac11 = presets.weapon.normal.is_smg
	presets.weapon.normal.is_revolver.aim_delay = {0.15, 0.15}
	presets.weapon.normal.is_revolver.focus_delay = 10
	presets.weapon.normal.is_revolver.focus_dis = 200
	presets.weapon.normal.is_revolver.spread = 20
	presets.weapon.normal.is_revolver.miss_dis = 50
	presets.weapon.normal.is_revolver.RELOAD_SPEED = 1
	presets.weapon.normal.is_revolver.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_revolver.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_revolver.melee_retry_delay = {2, 2}
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
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 0.95,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 0.9,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2600,
			acc = {0.01, 0.35},
			dmg_mul = 0.85,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 0.8,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 0.75,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 0.7,
			recoil = {1, 1.5},
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
			dmg_mul = 0.65,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.55,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
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
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 1,
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
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2500,
			acc = {0.15, 0.5},
			dmg_mul = 0.95,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2600,
			acc = {0.15, 0.5},
			dmg_mul = 0.9,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2700,
			acc = {0.15, 0.5},
			dmg_mul = 0.85,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2800,
			acc = {0.15, 0.5},
			dmg_mul = 0.8,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2900,
			acc = {0.15, 0.5},
			dmg_mul = 0.75,
			recoil = {1, 2},
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
			dmg_mul = 0.7,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3100,
			acc = {0.15, 0.5},
			dmg_mul = 0.65,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3200,
			acc = {0.15, 0.5},
			dmg_mul = 0.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3300,
			acc = {0.15, 0.5},
			dmg_mul = 0.55,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3400,
			acc = {0.15, 0.5},
			dmg_mul = 0.5,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3500,
			acc = {0.15, 0.5},
			dmg_mul = 0.45,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3600,
			acc = {0.15, 0.5},
			dmg_mul = 0.4,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.normal.mossberg = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.normal.mossberg.RELOAD_SPEED = 1.5
	presets.weapon.normal.is_shotgun_mag = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.normal.is_shotgun_mag.RELOAD_SPEED = 0.5
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
			r = 700,
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
			r = 800,
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
			r = 900,
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
			r = 1000,
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
			r = 1100,
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
			r = 1200,
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
			r = 1300,
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
			r = 1400,
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
			r = 1500,
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
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 0.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		}
	}	
	presets.weapon.normal.is_shotgun_semi = deep_clone(presets.weapon.normal.is_shotgun_mag)
	presets.weapon.normal.is_shotgun_semi.RELOAD_SPEED = 0.25	
	presets.weapon.normal.is_flamethrower = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.normal.is_flamethrower.melee_speed = nil
	presets.weapon.normal.is_flamethrower.melee_dmg = nil
	presets.weapon.normal.is_flamethrower.melee_retry_delay = nil	
	presets.weapon.normal.is_flamethrower.no_melee = true
	presets.weapon.normal.is_flamethrower.autofire_rounds = {25, 50}
	presets.weapon.normal.is_flamethrower.RELOAD_SPEED = 0.5
	presets.weapon.normal.is_flamethrower.range = {
		close = 250,
		optimal = 750,
		far = 1400
	}
	presets.weapon.normal.is_flamethrower.FALLOFF = {
		{
			r = 250,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 500,
			acc = {0.5, 0.5},
			dmg_mul = 1,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1400,
			acc = {0.25, 0.25},
			dmg_mul = 1,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1401,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		}
	}
	presets.weapon.normal.mini = {}
	presets.weapon.normal.mini.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mini.focus_delay = 10
	presets.weapon.normal.mini.focus_dis = 200
	presets.weapon.normal.mini.spread = 20
	presets.weapon.normal.mini.miss_dis = 40
	presets.weapon.normal.mini.RELOAD_SPEED = 0.35
	presets.weapon.normal.mini.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.mini.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.mini.melee_retry_delay = {2, 2}
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
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.95,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.35},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.35},
			dmg_mul = 0.85,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.1, 0.35},
			dmg_mul = 0.8,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 0.75,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 0.7,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.35},
			dmg_mul = 0.65,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	
	--Sniper Rifle Handling
	presets.weapon.normal.is_sniper = deep_clone(presets.weapon.normal.is_rifle)
	presets.weapon.normal.is_sniper.aim_delay = {2, 2}
	presets.weapon.normal.is_sniper.focus_delay = 10
	presets.weapon.normal.is_sniper.focus_dis = 200
	--As far as I'm aware this line doesn't even do anything, changing it regardless to satisfy my OCD
	presets.weapon.normal.is_sniper.spread = 0
	presets.weapon.normal.is_sniper.miss_dis = 250
	presets.weapon.normal.is_sniper.RELOAD_SPEED = 1
	presets.weapon.normal.is_sniper.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_sniper.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_sniper.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.normal.is_sniper.range = {
		close = 2000,
		optimal = 8000,
		far = 16000
	}
	presets.weapon.normal.is_sniper.use_laser = true
	presets.weapon.normal.is_sniper.sniper_charge_attack = true
	presets.weapon.normal.is_sniper.FALLOFF = {
		{
			r = 2000,
			acc = {1, 1},
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
			acc = {1, 1},
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
			r = 8000,
			acc = {1, 1},
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
			r = 12000,
			acc = {1, 1},
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
			r = 16000,
			acc = {1, 1},
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
	
	--M32 handling, normal
	presets.weapon.normal.is_m32 = deep_clone(presets.weapon.normal.is_shotgun_pump)
	presets.weapon.normal.is_m32.melee_speed = enemy_melee_speed.normal
	presets.weapon.normal.is_m32.melee_dmg = enemy_melee_damage_base
	presets.weapon.normal.is_m32.melee_retry_delay = {2, 2}		
	presets.weapon.normal.is_m32.autofire_rounds = {25, 50}
	presets.weapon.normal.is_m32.RELOAD_SPEED = 0.5
	presets.weapon.normal.is_m32.range = {
		close = 200,
		optimal = 250,
		far = 750
	}
	presets.weapon.normal.is_m32.FALLOFF = {
		{
			r = 300,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}	
	
	--DMRs, Normal
	presets.weapon.normal.is_dmr = deep_clone(presets.weapon.normal.is_rifle)
	presets.weapon.normal.is_dmr.FALLOFF = {
		{
			r = 1000,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.85},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.8},
			dmg_mul = 1,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.7},
			dmg_mul = 1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}		
	
	presets.weapon.good = deep_clone(presets.weapon.normal)
	presets.weapon.good.is_pistol.aim_delay = {0.15, 0.15}
	presets.weapon.good.is_pistol.focus_delay = 2
	presets.weapon.good.is_pistol.focus_dis = 200
	presets.weapon.good.is_pistol.spread = 20
	presets.weapon.good.is_pistol.miss_dis = 30
	presets.weapon.good.is_pistol.RELOAD_SPEED = 1
	presets.weapon.good.is_pistol.melee_speed = enemy_melee_speed.good
	presets.weapon.good.is_pistol.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.good.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.good.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.375, 0.55},
			dmg_mul = 1.425,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.375, 0.55},
			dmg_mul = 1.35,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.375, 0.55},
			dmg_mul = 1.275,
			recoil = {0.15, 0.4},
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
			dmg_mul = 1.2,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.375, 0.55},
			dmg_mul = 1.125,
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
			dmg_mul = 1.05,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.25, 0.45},
			dmg_mul = 0.975,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.25, 0.45},
			dmg_mul = 0.9,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.25, 0.45},
			dmg_mul = 0.825,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 0.75,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 0.675,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.01, 0.35},
			dmg_mul = 0.6,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 0.525,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 0.45,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 0.375,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.akimbo_pistol = deep_clone(presets.weapon.good.is_pistol)
	presets.weapon.good.akimbo_pistol.RELOAD_SPEED = 0.8	
	presets.weapon.good.is_rifle.aim_delay = {0.15, 0.15}
	presets.weapon.good.is_rifle.focus_delay = 3
	presets.weapon.good.is_rifle.focus_dis = 200
	presets.weapon.good.is_rifle.spread = 20
	presets.weapon.good.is_rifle.miss_dis = 20
	presets.weapon.good.is_rifle.RELOAD_SPEED = 1
	presets.weapon.good.is_rifle.melee_speed = enemy_melee_speed.good
	presets.weapon.good.is_rifle.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_rifle.tase_distance = 1400
	presets.weapon.good.is_rifle.aim_delay_tase = {2, 2}
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
			acc = {0.85, 0.9},
			dmg_mul = 1.5,
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
			acc = {0.75, 0.9},
			dmg_mul = 1.5,
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
			acc = {0.5, 0.8},
			dmg_mul = 1.5,
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
			acc = {0.3, 0.5},
			dmg_mul = 1.5,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.3, 0.5},
			dmg_mul = 1.425,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.3, 0.5},
			dmg_mul = 1.35,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.3, 0.5},
			dmg_mul = 1.275,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},		
		{
			r = 2500,
			acc = {0.3, 0.5},
			dmg_mul = 1.2,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},		
		{
			r = 2600,
			acc = {0.3, 0.5},
			dmg_mul = 1.125,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.3, 0.5},
			dmg_mul = 1.05,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.3, 0.5},
			dmg_mul = 0.975,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.3, 0.5},
			dmg_mul = 0.9,
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
			dmg_mul = 0.825,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.75,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.675,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.01, 0.35},
			dmg_mul = 0.6,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	
	--Single shot only rifles, used for specific enemies
	presets.weapon.good.is_rifle_single_fire = deep_clone(presets.weapon.good.is_rifle)
	presets.weapon.good.is_rifle_single_fire.FALLOFF = {
		{
			r = 100,
			acc = {0.85, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.75, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.8},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.3, 0.5},
			dmg_mul = 1.425,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.3, 0.5},
			dmg_mul = 1.35,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.3, 0.5},
			dmg_mul = 1.275,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2500,
			acc = {0.3, 0.5},
			dmg_mul = 1.2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2600,
			acc = {0.3, 0.5},
			dmg_mul = 1.125,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.3, 0.5},
			dmg_mul = 1.05,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.3, 0.5},
			dmg_mul = 0.975,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.3, 0.5},
			dmg_mul = 0.9,
			recoil = {1, 1.25},
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
			dmg_mul = 0.825,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.75,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.675,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.01, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}	
	
	presets.weapon.good.is_bullpup = presets.weapon.good.is_rifle
	presets.weapon.good.is_shotgun_pump.aim_delay = {0.2, 0.2}
	presets.weapon.good.is_shotgun_pump.focus_delay = 5
	presets.weapon.good.is_shotgun_pump.focus_dis = 200
	presets.weapon.good.is_shotgun_pump.spread = 15
	presets.weapon.good.is_shotgun_pump.miss_dis = 20
	presets.weapon.good.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.good.is_shotgun_pump.melee_speed = nil
	presets.weapon.good.is_shotgun_pump.melee_dmg = nil
	presets.weapon.good.is_shotgun_pump.melee_retry_delay = nil
	presets.weapon.good.is_shotgun_pump.no_melee = true
	presets.weapon.good.is_shotgun_pump.range = {
		close = 500,
		optimal = 1000,
		far = 2000
	}
	presets.weapon.good.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.9},
			dmg_mul = 1.425,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.9},
			dmg_mul = 1.35,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.9},
			dmg_mul = 1.275,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.9},
			dmg_mul = 1.2,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.9},
			dmg_mul = 1.125,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.9},
			dmg_mul = 1.05,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 0.975,
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
			r = 1900,
			acc = {0.4, 0.75},
			dmg_mul = 0.825,
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
			acc = {0.4, 0.75},
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
			r = 2100,
			acc = {0.4, 0.75},
			dmg_mul = 0.675,
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
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.525,
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
			dmg_mul = 0.45,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_shotgun_mag.aim_delay = {0.2, 0.2}
	presets.weapon.good.is_shotgun_mag.focus_delay = 5
	presets.weapon.good.is_shotgun_mag.focus_dis = 200
	presets.weapon.good.is_shotgun_mag.spread = 15
	presets.weapon.good.is_shotgun_mag.miss_dis = 20
	presets.weapon.good.is_shotgun_mag.RELOAD_SPEED = 0.5
	presets.weapon.good.is_shotgun_mag.melee_speed = nil
	presets.weapon.good.is_shotgun_mag.melee_dmg = nil
	presets.weapon.good.is_shotgun_mag.melee_retry_delay = nil
	presets.weapon.good.is_shotgun_mag.no_melee = true
	presets.weapon.good.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.good.is_shotgun_mag.range = {
		close = 500,
		optimal = 1000,
		far = 2000
	}
	presets.weapon.good.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 700,
			acc = {0.4, 0.9},
			dmg_mul = 1.425,
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
			dmg_mul = 1.35,
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
			dmg_mul = 1.275,
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
			acc = {0.4, 0.9},
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
			r = 1100,
			acc = {0.4, 0.9},
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
			r = 1200,
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
			r = 1300,
			acc = {0.4, 0.75},
			dmg_mul = 0.975,
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
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.825,
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
			dmg_mul = 0.75,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		}
	}
	presets.weapon.good.is_shotgun_semi = deep_clone(presets.weapon.good.is_shotgun_mag)
	presets.weapon.good.is_shotgun_semi.RELOAD_SPEED = 0.25		
	presets.weapon.good.is_flamethrower = deep_clone(presets.weapon.good.is_shotgun_pump)
	presets.weapon.good.is_flamethrower.melee_speed = nil
	presets.weapon.good.is_flamethrower.melee_dmg = nil
	presets.weapon.good.is_flamethrower.melee_retry_delay = nil
	presets.weapon.good.is_flamethrower.no_melee = true
	presets.weapon.good.is_flamethrower.autofire_rounds = {25, 50}
	presets.weapon.good.is_flamethrower.RELOAD_SPEED = 0.5
	presets.weapon.good.is_flamethrower.range = {
		close = 250,
		optimal = 750,
		far = 1400
	}
	presets.weapon.good.is_flamethrower.FALLOFF = {
		{
			r = 250,
			acc = {1, 1},
			dmg_mul = 1.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 500,
			acc = {0.5, 0.5},
			dmg_mul = 1.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1400,
			acc = {0.25, 0.25},
			dmg_mul = 1.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1401,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		}
	}
	presets.weapon.good.is_smg.aim_delay = {0.15, 0.15}
	presets.weapon.good.is_smg.focus_delay = 3
	presets.weapon.good.is_smg.focus_dis = 200
	presets.weapon.good.is_smg.spread = 20
	presets.weapon.good.is_smg.miss_dis = 20
	presets.weapon.good.is_smg.RELOAD_SPEED = 1
	presets.weapon.good.is_smg.melee_speed = enemy_melee_speed.good
	presets.weapon.good.is_smg.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.good.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.good.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.good.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 1.5,
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
			acc = {0.5, 0.95},
			dmg_mul = 1.5,
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
			acc = {0.3, 0.75},
			dmg_mul = 1.5,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1100,
			acc = {0.3, 0.75},
			dmg_mul = 1.425,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1200,
			acc = {0.3, 0.75},
			dmg_mul = 1.35,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1300,
			acc = {0.3, 0.75},
			dmg_mul = 1.275,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1400,
			acc = {0.3, 0.75},
			dmg_mul = 1.2,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 1500,
			acc = {0.3, 0.75},
			dmg_mul = 1.125,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.3, 0.75},
			dmg_mul = 1.05,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.3, 0.75},
			dmg_mul = 0.975,
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
			acc = {0.3, 0.75},
			dmg_mul = 0.9,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.3, 0.75},
			dmg_mul = 0.825,
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
			dmg_mul = 0.75,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.45},
			dmg_mul = 0.675,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.1, 0.45},
			dmg_mul = 0.6,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.1, 0.45},
			dmg_mul = 0.525,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 0.45,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 0.375,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.good.mp9.aim_delay = {0.15, 0.15}
	presets.weapon.good.mp9.focus_delay = 20
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
			r = 100,
			acc = {0.7, 0.75},
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
			r = 500,
			acc = {0.5, 0.55},
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
			acc = {0.45, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.45, 0.45},
			dmg_mul = 0.95,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.45, 0.45},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.45, 0.45},
			dmg_mul = 0.85,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.45, 0.45},
			dmg_mul = 0.8,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.45, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1800,
			acc = {0.45, 0.45},
			dmg_mul = 0.7,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 1900,
			acc = {0.45, 0.45},
			dmg_mul = 0.65,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.3, 0.3},
			dmg_mul = 0.6,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 0.55,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.45,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.4,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.35,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.3,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.mac11 = presets.weapon.good.is_smg
	presets.weapon.good.is_revolver.aim_delay = {0.15, 0.15}
	presets.weapon.good.is_revolver.focus_delay = 10
	presets.weapon.good.is_revolver.focus_dis = 200
	presets.weapon.good.is_revolver.spread = 20
	presets.weapon.good.is_revolver.miss_dis = 30
	presets.weapon.good.is_revolver.RELOAD_SPEED = 1
	presets.weapon.good.is_revolver.melee_speed = enemy_melee_speed.good
	presets.weapon.good.is_revolver.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_revolver.melee_retry_delay = {2, 2}
	presets.weapon.good.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 1.425,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 1.35,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.01, 0.35},
			dmg_mul = 1.275,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 1.2,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 1.125,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 1.05,
			recoil = {1, 1.5},
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
			dmg_mul = 0.975,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 0.9,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 0.825,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.01, 0.35},
			dmg_mul = 0.75,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
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
			dmg_mul = 1.5,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2500,
			acc = {0.15, 0.5},
			dmg_mul = 1.425,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2600,
			acc = {0.15, 0.5},
			dmg_mul = 1.35,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2700,
			acc = {0.15, 0.5},
			dmg_mul = 1.275,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2800,
			acc = {0.15, 0.5},
			dmg_mul = 1.2,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2900,
			acc = {0.15, 0.5},
			dmg_mul = 1.125,
			recoil = {1, 2},
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
		},
		{
			r = 3100,
			acc = {0.15, 0.5},
			dmg_mul = 0.975,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3200,
			acc = {0.15, 0.5},
			dmg_mul = 0.9,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3300,
			acc = {0.15, 0.5},
			dmg_mul = 0.825,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3400,
			acc = {0.15, 0.5},
			dmg_mul = 0.75,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3500,
			acc = {0.15, 0.5},
			dmg_mul = 0.675,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3600,
			acc = {0.15, 0.5},
			dmg_mul = 0.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.good.mossberg = deep_clone(presets.weapon.good.is_shotgun_pump)
	presets.weapon.good.mossberg.RELOAD_SPEED = 1.5
	presets.weapon.good.mini = {}
	presets.weapon.good.mini.aim_delay = {0.1, 0.1}
	presets.weapon.good.mini.focus_delay = 3
	presets.weapon.good.mini.focus_dis = 200
	presets.weapon.good.mini.spread = 20
	presets.weapon.good.mini.miss_dis = 40
	presets.weapon.good.mini.RELOAD_SPEED = 0.35
	presets.weapon.good.mini.melee_speed = enemy_melee_speed.good
	presets.weapon.good.mini.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.mini.melee_retry_delay = {2, 2}
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
			dmg_mul = 1.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1.425,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.35},
			dmg_mul = 1.35,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.35},
			dmg_mul = 1.275,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.1, 0.35},
			dmg_mul = 1.2,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 1.125,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 1.05,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.35},
			dmg_mul = 0.975,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2700,
			acc = {0.1, 0.35},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}	
	}
	
	--Very Hard/Overkill Sniper
	presets.weapon.good.is_sniper = deep_clone(presets.weapon.normal.is_sniper)
	presets.weapon.good.is_sniper.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_sniper.FALLOFF = {
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.5,
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
			acc = {1, 1},
			dmg_mul = 1.5,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {1, 1},
			dmg_mul = 1.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 12000,
			acc = {1, 1},
			dmg_mul = 1.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 16000,
			acc = {1, 1},
			dmg_mul = 1.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}	
	
	--DMRs, Good
	presets.weapon.good.is_dmr = deep_clone(presets.weapon.good.is_rifle)
	presets.weapon.good.is_dmr.melee_dmg = enemy_melee_damage_good
	presets.weapon.good.is_dmr.FALLOFF = {
		{
			r = 1000,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.6, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.85},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.8},
			dmg_mul = 1.5,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}			
	
	presets.weapon.expert = deep_clone(presets.weapon.good)
	presets.weapon.expert.is_pistol.aim_delay = {0.15, 0.15}
	presets.weapon.expert.is_pistol.focus_delay = 1
	presets.weapon.expert.is_pistol.focus_dis = 300
	presets.weapon.expert.is_pistol.spread = 20
	presets.weapon.expert.is_pistol.miss_dis = 20
	presets.weapon.expert.is_pistol.RELOAD_SPEED = 1
	presets.weapon.expert.is_pistol.melee_speed = enemy_melee_speed.expert
	presets.weapon.expert.is_pistol.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.expert.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.expert.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 2,
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
			dmg_mul = 2,
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
			dmg_mul = 2,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.65},
			dmg_mul = 1.9,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.4, 0.65},
			dmg_mul = 1.8,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.65},
			dmg_mul = 1.7,
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
			dmg_mul = 1.6,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.4, 0.65},
			dmg_mul = 1.5,
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
			dmg_mul = 1.4,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.3, 0.5},
			dmg_mul = 1.3,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.3, 0.5},
			dmg_mul = 1.2,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.3, 0.5},
			dmg_mul = 1.1,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 0.9,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.8,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.7,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.6,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}	
	}
	presets.weapon.expert.akimbo_pistol = deep_clone(presets.weapon.expert.is_pistol)
	presets.weapon.expert.akimbo_pistol.RELOAD_SPEED = 0.8		
	presets.weapon.expert.is_rifle.aim_delay = {0.15, 0.15}
	presets.weapon.expert.is_rifle.focus_delay = 2
	presets.weapon.expert.is_rifle.focus_dis = 300
	presets.weapon.expert.is_rifle.spread = 20
	presets.weapon.expert.is_rifle.miss_dis = 10
	presets.weapon.expert.is_rifle.RELOAD_SPEED = 1
	presets.weapon.expert.is_rifle.melee_speed = enemy_melee_speed.expert
	presets.weapon.expert.is_rifle.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_rifle.tase_distance = 1400
	presets.weapon.expert.is_rifle.aim_delay_tase = {2, 2}
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
			acc = {0.9, 1.0},
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
			acc = {0.7, 0.95},
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
			acc = {0.65, 0.8},
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
			acc = {0.5, 0.7},
			dmg_mul = 2,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.5, 0.7},
			dmg_mul = 1.9,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.5, 0.7},
			dmg_mul = 1.8,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.5, 0.7},
			dmg_mul = 1.7,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.5, 0.7},
			dmg_mul = 1.6,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2700,
			acc = {0.5, 0.7},
			dmg_mul = 1.4,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.5, 0.7},
			dmg_mul = 1.3,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.5, 0.7},
			dmg_mul = 1.2,
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
			dmg_mul = 1.1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3100,
			acc = {0.2, 0.4},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.2, 0.4},
			dmg_mul = 0.9,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.2, 0.4},
			dmg_mul = 0.8,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	
	--Single shot only rifles, used for specific enemies
	presets.weapon.expert.is_rifle_single_fire = deep_clone(presets.weapon.expert.is_rifle)
	presets.weapon.expert.is_rifle_single_fire.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 1.0},
			dmg_mul = 2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.8},
			dmg_mul = 2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.5, 0.7},
			dmg_mul = 1.9,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.5, 0.7},
			dmg_mul = 1.8,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.5, 0.7},
			dmg_mul = 1.7,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.5, 0.7},
			dmg_mul = 1.6,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2700,
			acc = {0.5, 0.7},
			dmg_mul = 1.4,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.5, 0.7},
			dmg_mul = 1.3,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.5, 0.7},
			dmg_mul = 1.2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 1.1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3100,
			acc = {0.2, 0.4},
			dmg_mul = 1,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.2, 0.4},
			dmg_mul = 0.9,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.2, 0.4},
			dmg_mul = 0.8,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}	
	
	presets.weapon.expert.is_bullpup = presets.weapon.expert.is_rifle
	presets.weapon.expert.is_shotgun_pump.aim_delay = {0.2, 0.2}
	presets.weapon.expert.is_shotgun_pump.focus_delay = 2
	presets.weapon.expert.is_shotgun_pump.focus_dis = 200
	presets.weapon.expert.is_shotgun_pump.spread = 15
	presets.weapon.expert.is_shotgun_pump.miss_dis = 10
	presets.weapon.expert.is_shotgun_pump.RELOAD_SPEED = 0.25
	presets.weapon.expert.is_shotgun_pump.melee_speed = nil
	presets.weapon.expert.is_shotgun_pump.melee_dmg = nil
	presets.weapon.expert.is_shotgun_pump.melee_retry_delay = nil
	presets.weapon.expert.is_shotgun_pump.no_melee = true
	presets.weapon.expert.is_shotgun_pump.range = {
		close = 500,
		optimal = 1000,
		far = 2000
	}
	presets.weapon.expert.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 2,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.6, 0.9},
			dmg_mul = 1.9,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.9},
			dmg_mul = 1.8,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
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
			r = 1400,
			acc = {0.4, 0.9},
			dmg_mul = 1.6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.9},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1.4,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 1.3,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.75},
			dmg_mul = 1.2,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.75},
			dmg_mul = 1.1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.75},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.4, 0.75},
			dmg_mul = 0.9,
			recoil = {1, 1.5},
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
			r = 2300,
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
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.6,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_shotgun_mag.aim_delay = {0.2, 0.2}
	presets.weapon.expert.is_shotgun_mag.focus_delay = 2
	presets.weapon.expert.is_shotgun_mag.focus_dis = 200
	presets.weapon.expert.is_shotgun_mag.spread = 15
	presets.weapon.expert.is_shotgun_mag.miss_dis = 10
	presets.weapon.expert.is_shotgun_mag.RELOAD_SPEED = 0.5
	presets.weapon.expert.is_shotgun_mag.melee_speed = nil
	presets.weapon.expert.is_shotgun_mag.melee_dmg = nil
	presets.weapon.expert.is_shotgun_mag.melee_retry_delay = nil
	presets.weapon.expert.is_shotgun_mag.no_melee = true
	presets.weapon.expert.is_shotgun_mag.range = {
		close = 500,
		optimal = 1000,
		far = 2000
	}
	presets.weapon.expert.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.expert.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
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
			r = 700,
			acc = {0.5, 0.9},
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
			r = 800,
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
			r = 900,
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
			r = 1000,
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
			r = 1100,
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
			r = 1200,
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
			r = 1300,
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
			r = 1400,
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
			r = 1500,
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
		}
	}
	presets.weapon.expert.is_shotgun_semi = deep_clone(presets.weapon.expert.is_shotgun_mag)
	presets.weapon.expert.is_shotgun_semi.RELOAD_SPEED = 0.25			
	presets.weapon.expert.is_flamethrower = deep_clone(presets.weapon.expert.is_shotgun_pump)
	presets.weapon.expert.is_flamethrower.autofire_rounds = {25, 50}
	presets.weapon.expert.is_flamethrower.RELOAD_SPEED = 0.5
	presets.weapon.expert.is_flamethrower.range = {
		close = 250,
		optimal = 750,
		far = 1400
	}
	presets.weapon.expert.is_flamethrower.FALLOFF = {
		{
			r = 250,
			acc = {1, 1},
			dmg_mul = 2,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 500,
			acc = {0.5, 0.5},
			dmg_mul = 2,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1400,
			acc = {0.25, 0.25},
			dmg_mul = 2,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1401,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		}
	}
	presets.weapon.expert.is_smg.aim_delay = {0.2, 0.2}
	presets.weapon.expert.is_smg.focus_delay = 1
	presets.weapon.expert.is_smg.focus_dis = 200
	presets.weapon.expert.is_smg.spread = 15
	presets.weapon.expert.is_smg.miss_dis = 10
	presets.weapon.expert.is_smg.RELOAD_SPEED = 1
	presets.weapon.expert.is_smg.melee_speed = enemy_melee_speed.expert
	presets.weapon.expert.is_smg.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.expert.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.expert.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.expert.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.85, 0.95},
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
			acc = {0.8, 0.9},
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
			acc = {0.5, 0.65},
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
			r = 1100,
			acc = {0.5, 0.65},
			dmg_mul = 1.9,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1200,
			acc = {0.5, 0.65},
			dmg_mul = 1.8,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1300,
			acc = {0.5, 0.65},
			dmg_mul = 1.7,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1400,
			acc = {0.5, 0.65},
			dmg_mul = 1.6,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.5, 0.65},
			dmg_mul = 1.5,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.5, 0.65},
			dmg_mul = 1.4,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.5, 0.65},
			dmg_mul = 1.3,
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
			acc = {0.5, 0.65},
			dmg_mul = 1.2,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1900,
			acc = {0.5, 0.65},
			dmg_mul = 1.1,
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
			r = 2100,
			acc = {0.4, 0.6},
			dmg_mul = 0.9,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.4, 0.6},
			dmg_mul = 0.8,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.4, 0.6},
			dmg_mul = 0.7,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 2400,
			acc = {0.2, 0.35},
			dmg_mul = 0.6,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0.2, 0.35},
			dmg_mul = 0.5,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}		
	}
	presets.weapon.expert.mp9.aim_delay = {0.15, 0.15}
	presets.weapon.expert.mp9.focus_delay = 20
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
			r = 100,
			acc = {0.7, 0.75},
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
			r = 500,
			acc = {0.5, 0.55},
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
			acc = {0.45, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.45, 0.45},
			dmg_mul = 0.95,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.45, 0.45},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.45, 0.45},
			dmg_mul = 0.85,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.45, 0.45},
			dmg_mul = 0.8,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.45, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1800,
			acc = {0.45, 0.45},
			dmg_mul = 0.7,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 1900,
			acc = {0.45, 0.45},
			dmg_mul = 0.65,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.3, 0.3},
			dmg_mul = 0.6,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 0.55,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.45,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.4,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.35,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.3,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}		
	}
	presets.weapon.expert.mac11 = presets.weapon.expert.is_smg
	presets.weapon.expert.is_revolver.aim_delay = {0, 0.1}
	presets.weapon.expert.is_revolver.focus_delay = 10
	presets.weapon.expert.is_revolver.focus_dis = 200
	presets.weapon.expert.is_revolver.spread = 20
	presets.weapon.expert.is_revolver.miss_dis = 30
	presets.weapon.expert.is_revolver.RELOAD_SPEED = 1
	presets.weapon.expert.is_revolver.melee_speed = enemy_melee_speed.expert
	presets.weapon.expert.is_revolver.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_revolver.melee_retry_delay = {2, 2}
	presets.weapon.expert.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.is_revolver.FALLOFF = {
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
			dmg_mul = 2,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 1.9,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 1.8,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.01, 0.35},
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
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 1.6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 1.4,
			recoil = {1, 1.5},
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
			dmg_mul = 1.3,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 1.2,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 1.1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 3300,
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
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 2,
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
			dmg_mul = 2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2500,
			acc = {0.15, 0.5},
			dmg_mul = 1.9,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2600,
			acc = {0.15, 0.5},
			dmg_mul = 1.8,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2700,
			acc = {0.15, 0.5},
			dmg_mul = 1.7,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2800,
			acc = {0.15, 0.5},
			dmg_mul = 1.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2900,
			acc = {0.15, 0.5},
			dmg_mul = 1.5,
			recoil = {1, 2},
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
			dmg_mul = 1.4,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3100,
			acc = {0.15, 0.5},
			dmg_mul = 1.3,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3200,
			acc = {0.15, 0.5},
			dmg_mul = 1.2,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3300,
			acc = {0.15, 0.5},
			dmg_mul = 1.1,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},		
		{
			r = 3400,
			acc = {0.15, 0.5},
			dmg_mul = 1,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3500,
			acc = {0.15, 0.5},
			dmg_mul = 0.9,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3600,
			acc = {0.15, 0.5},
			dmg_mul = 0.8,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.expert.mossberg = deep_clone(presets.weapon.expert.is_shotgun_pump)
	presets.weapon.expert.mossberg.RELOAD_SPEED = 1.5
	presets.weapon.expert.mini = {}
	presets.weapon.expert.mini.aim_delay = {0, 0.1}
	presets.weapon.expert.mini.focus_delay = 2
	presets.weapon.expert.mini.focus_dis = 300
	presets.weapon.expert.mini.spread = 20
	presets.weapon.expert.mini.miss_dis = 40
	presets.weapon.expert.mini.RELOAD_SPEED = 0.35
	presets.weapon.expert.mini.melee_speed = enemy_melee_speed.expert
	presets.weapon.expert.mini.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.mini.melee_retry_delay = {2, 2}
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
			dmg_mul = 2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 2,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1.9,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 2100,
			acc = {0.2, 0.5},
			dmg_mul = 1.8,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},		
		{
			r = 2200,
			acc = {0.1, 0.35},
			dmg_mul = 1.7,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.35},
			dmg_mul = 1.6,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 1.5,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 1.4,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.35},
			dmg_mul = 1.3,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.35},
			dmg_mul = 1.2,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}				
	}
	
	--Expert Sniper Handling
	presets.weapon.expert.is_sniper = deep_clone(presets.weapon.normal.is_sniper)
	presets.weapon.expert.is_sniper.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_sniper.FALLOFF = {
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 2,
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
			acc = {1, 1},
			dmg_mul = 2,
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
			acc = {1, 1},
			dmg_mul = 2,
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
			acc = {1, 1},
			dmg_mul = 2,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 12000,
			acc = {1, 1},
			dmg_mul = 2,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 16000,
			acc = {1, 1},
			dmg_mul = 2,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}	
	
	--DMRs, Expert
	presets.weapon.expert.is_dmr = deep_clone(presets.weapon.expert.is_rifle)
	presets.weapon.expert.is_dmr.melee_dmg = enemy_melee_damage_expert
	presets.weapon.expert.is_dmr.FALLOFF = {
		{
			r = 1000,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.6, 0.9},
			dmg_mul = 2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.85},
			dmg_mul = 2,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.8},
			dmg_mul = 2,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.7},
			dmg_mul = 2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}				
	
	presets.weapon.deathwish = deep_clone(presets.weapon.expert)
	presets.weapon.deathwish.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 2.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.6, 0.9},
			dmg_mul = 2.375,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.9},
			dmg_mul = 2.25,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.9},
			dmg_mul = 2.125,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {1, 1.5},
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
			dmg_mul = 1.875,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 1.75,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 1.625,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.75},
			dmg_mul = 1.38,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.75},
			dmg_mul = 1.265,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.75},
			dmg_mul = 1.15,
			recoil = {1, 1.5},
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
			dmg_mul = 1.035,
			recoil = {1, 1.5},
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
			dmg_mul = 0.92,
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
			dmg_mul = 0.805,
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
			dmg_mul = 0.69,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_flamethrower = deep_clone(presets.weapon.deathwish.is_shotgun_pump)
	presets.weapon.deathwish.is_flamethrower.autofire_rounds = {25, 50}
	presets.weapon.deathwish.is_flamethrower.RELOAD_SPEED = 0.5
	presets.weapon.deathwish.is_flamethrower.range = {
		close = 250,
		optimal = 750,
		far = 1400
	}
	presets.weapon.deathwish.is_flamethrower.FALLOFF = {
		{
			r = 250,
			acc = {1, 1},
			dmg_mul = 2.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 500,
			acc = {0.5, 0.5},
			dmg_mul = 2.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1400,
			acc = {0.25, 0.25},
			dmg_mul = 2.5,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		},
		{
			r = 1401,
			acc = {0, 0},
			dmg_mul = 0,
			recoil = {0, 0},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {25, 50}
		}
	}
	presets.weapon.deathwish.is_shotgun_mag.RELOAD_SPEED = 0.5	
	presets.weapon.deathwish.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
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
			r = 700,
			acc = {0.5, 0.9},
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
			r = 800,
			acc = {0.4, 0.9},
			dmg_mul = 2.25,
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
			r = 1000,
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
			r = 1100,
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
			r = 1200,
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
			r = 1300,
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
			r = 1400,
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
			r = 1500,
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
			r = 1800,
			acc = {0.4, 0.75},
			dmg_mul = 1.15,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		}		
	}
	presets.weapon.deathwish.is_shotgun_semi = deep_clone(presets.weapon.deathwish.is_shotgun_mag)
	presets.weapon.deathwish.is_shotgun_semi.RELOAD_SPEED = 0.25		
	presets.weapon.deathwish.is_pistol.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_pistol.FALLOFF = {
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
			r = 1500,
			acc = {0.4, 0.65},
			dmg_mul = 2.375,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.4, 0.65},
			dmg_mul = 2.25,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.4, 0.65},
			dmg_mul = 2.125,
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
			dmg_mul = 1.84,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.65},
			dmg_mul = 1.725,
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
			dmg_mul = 1.61,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2100,
			acc = {0.3, 0.5},
			dmg_mul = 1.495,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2200,
			acc = {0.3, 0.5},
			dmg_mul = 1.38,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.3, 0.5},
			dmg_mul = 1.265,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 1.15,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 1.035,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.92,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.805,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.69,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.575,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}			
	}
	presets.weapon.deathwish.akimbo_pistol = deep_clone(presets.weapon.deathwish.is_pistol)
	presets.weapon.deathwish.akimbo_pistol.RELOAD_SPEED = 0.8			
	presets.weapon.deathwish.mac11 = presets.weapon.deathwish.is_smg
	presets.weapon.deathwish.is_revolver.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_revolver.FALLOFF = {
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
			r = 1800,
			acc = {0.375, 0.55},
			dmg_mul = 2.3,
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
			dmg_mul = 2.3,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.01, 0.35},
			dmg_mul = 2.185,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.01, 0.35},
			dmg_mul = 2.07,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.01, 0.35},
			dmg_mul = 1.955,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.01, 0.35},
			dmg_mul = 1.84,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.01, 0.35},
			dmg_mul = 1.725,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.01, 0.35},
			dmg_mul = 1.61,
			recoil = {1, 1.5},
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
			dmg_mul = 1.495,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.01, 0.35},
			dmg_mul = 1.38,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.01, 0.35},
			dmg_mul = 1.265,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 3300,
			acc = {0.01, 0.35},
			dmg_mul = 1.15,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}					
	}
	presets.weapon.deathwish.is_rifle.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 1.0},
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
			acc = {0.7, 0.95},
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
			acc = {0.65, 0.8},
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
			r = 1800,
			acc = {0.6, 0.8},
			dmg_mul = 2.3,
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
			dmg_mul = 2.3,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2200,
			acc = {0.5, 0.7},
			dmg_mul = 2.185,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.5, 0.7},
			dmg_mul = 2.07,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.5, 0.7},
			dmg_mul = 1.955,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.5, 0.7},
			dmg_mul = 1.84,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},		
		{
			r = 2600,
			acc = {0.5, 0.7},
			dmg_mul = 1.725,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.5, 0.7},
			dmg_mul = 1.61,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2800,
			acc = {0.5, 0.7},
			dmg_mul = 1.495,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.5, 0.7},
			dmg_mul = 1.38,
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
			dmg_mul = 1.265,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3100,
			acc = {0.2, 0.4},
			dmg_mul = 1.15,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.2, 0.4},
			dmg_mul = 1.035,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.2, 0.4},
			dmg_mul = 0.92,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}			
	}
	
	--Single shot only rifles, used for specific enemies
	presets.weapon.deathwish.is_rifle_single_fire = deep_clone(presets.weapon.deathwish.is_rifle)
	presets.weapon.deathwish.is_rifle_single_fire.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 1.0},
			dmg_mul = 2.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 2.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.8},
			dmg_mul = 2.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.6, 0.8},
			dmg_mul = 2.3,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 2.3,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2200,
			acc = {0.5, 0.7},
			dmg_mul = 2.185,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2300,
			acc = {0.5, 0.7},
			dmg_mul = 2.07,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.5, 0.7},
			dmg_mul = 1.955,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.5, 0.7},
			dmg_mul = 1.84,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2600,
			acc = {0.5, 0.7},
			dmg_mul = 1.725,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.5, 0.7},
			dmg_mul = 1.61,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2800,
			acc = {0.5, 0.7},
			dmg_mul = 1.495,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.5, 0.7},
			dmg_mul = 1.38,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},			
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 1.265,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3100,
			acc = {0.2, 0.4},
			dmg_mul = 1.15,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.2, 0.4},
			dmg_mul = 1.035,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.2, 0.4},
			dmg_mul = 0.92,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		}			
	}
	
	presets.weapon.deathwish.is_bullpup = presets.weapon.deathwish.is_rifle
	presets.weapon.deathwish.is_smg.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_smg.FALLOFF = {
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
			r = 1100,
			acc = {0.4, 0.65},
			dmg_mul = 2.375,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.65},
			dmg_mul = 2.25,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1300,
			acc = {0.4, 0.65},
			dmg_mul = 2.125,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.65},
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
			r = 1500,
			acc = {0.4, 0.65},
			dmg_mul = 1.875,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.4, 0.65},
			dmg_mul = 1.75,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 1700,
			acc = {0.4, 0.65},
			dmg_mul = 1.625,
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
			dmg_mul = 1.38,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.65},
			dmg_mul = 1.265,
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
			dmg_mul = 1.15,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2100,
			acc = {0.4, 0.6},
			dmg_mul = 1.035,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},		
		{
			r = 2200,
			acc = {0.4, 0.6},
			dmg_mul = 0.92,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},	
		{
			r = 2300,
			acc = {0.4, 0.6},
			dmg_mul = 0.805,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},			
		{
			r = 2400,
			acc = {0.2, 0.35},
			dmg_mul = 0.75,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		},
		{
			r = 2500,
			acc = {0.2, 0.35},
			dmg_mul = 0.575,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}					
	}
	presets.weapon.deathwish.mp9.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.75},
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
			r = 500,
			acc = {0.5, 0.55},
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
			acc = {0.45, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.45, 0.45},
			dmg_mul = 0.95,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.45, 0.45},
			dmg_mul = 0.9,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1500,
			acc = {0.45, 0.45},
			dmg_mul = 0.85,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1600,
			acc = {0.45, 0.45},
			dmg_mul = 0.8,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1700,
			acc = {0.45, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 1800,
			acc = {0.45, 0.45},
			dmg_mul = 0.7,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 1900,
			acc = {0.45, 0.45},
			dmg_mul = 0.65,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.3, 0.3},
			dmg_mul = 0.6,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.25},
			dmg_mul = 0.55,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.25},
			dmg_mul = 0.45,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.25},
			dmg_mul = 0.4,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2800,
			acc = {0.1, 0.25},
			dmg_mul = 0.35,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.1, 0.25},
			dmg_mul = 0.3,
			recoil = {1.2, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}	
	}
	presets.weapon.deathwish.is_lmg.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_lmg.FALLOFF = {
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
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 2.5,
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
			dmg_mul = 2.3,
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
			dmg_mul = 2.3,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2500,
			acc = {0.15, 0.5},
			dmg_mul = 2.185,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2600,
			acc = {0.15, 0.5},
			dmg_mul = 2.07,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2700,
			acc = {0.15, 0.5},
			dmg_mul = 1.955,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2800,
			acc = {0.15, 0.5},
			dmg_mul = 1.84,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 2900,
			acc = {0.15, 0.5},
			dmg_mul = 1.725,
			recoil = {1, 2},
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
			dmg_mul = 1.61,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3100,
			acc = {0.15, 0.5},
			dmg_mul = 1.495,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3200,
			acc = {0.15, 0.5},
			dmg_mul = 1.38,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3300,
			acc = {0.15, 0.5},
			dmg_mul = 1.265,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},		
		{
			r = 3400,
			acc = {0.15, 0.5},
			dmg_mul = 1.15,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3500,
			acc = {0.15, 0.5},
			dmg_mul = 1.035,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		},	
		{
			r = 3600,
			acc = {0.15, 0.5},
			dmg_mul = 0.92,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	presets.weapon.deathwish.mini.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.mini.FALLOFF = {
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
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 2.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 2.5,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 1800,
			acc = {0.4, 0.6},
			dmg_mul = 2.3,
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
			dmg_mul = 2.185,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 2100,
			acc = {0.2, 0.5},
			dmg_mul = 2.07,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},		
		{
			r = 2200,
			acc = {0.1, 0.35},
			dmg_mul = 1.955,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.35},
			dmg_mul = 1.84,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2400,
			acc = {0.1, 0.35},
			dmg_mul = 1.725,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2500,
			acc = {0.1, 0.35},
			dmg_mul = 1.61,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.1, 0.35},
			dmg_mul = 1.495,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.1, 0.35},
			dmg_mul = 1.38,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}	
	}
	
	--Deathwish Sniper Handling
	presets.weapon.deathwish.is_sniper = deep_clone(presets.weapon.normal.is_sniper)
	presets.weapon.deathwish.is_sniper.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_sniper.FALLOFF = {
		{
			r = 1000,
			acc = {1, 1},
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
			r = 1800,
			acc = {1, 1},
			dmg_mul = 2.3,
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
			acc = {1, 1},
			dmg_mul = 2.3,
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
			acc = {1, 1},
			dmg_mul = 2.3,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 12000,
			acc = {1, 1},
			dmg_mul = 2.3,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 16000,
			acc = {1, 1},
			dmg_mul = 2.3,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}			
	}	
	
	--DMRs, Deathwish
	presets.weapon.deathwish.is_dmr = deep_clone(presets.weapon.deathwish.is_rifle)
	presets.weapon.deathwish.is_dmr.melee_dmg = enemy_melee_damage_deathwish
	presets.weapon.deathwish.is_dmr.FALLOFF = {
		{
			r = 1000,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.6, 0.9},
			dmg_mul = 2.3,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 2000,
			acc = {0.6, 0.9},
			dmg_mul = 2.3,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.85},
			dmg_mul = 2.3,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 6000,
			acc = {0.5, 0.8},
			dmg_mul = 2.3,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 8000,
			acc = {0.5, 0.7},
			dmg_mul = 2.3,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}					
	
	presets.weapon.gang_member = deep_clone(presets.weapon.deathwish)
	presets.weapon.gang_member.is_pistol.aim_delay = {0, 0}
	presets.weapon.gang_member.is_pistol.focus_delay = 0
	presets.weapon.gang_member.is_pistol.focus_dis = 200
	presets.weapon.gang_member.is_pistol.spread = 25
	presets.weapon.gang_member.is_pistol.miss_dis = 20
	presets.weapon.gang_member.is_pistol.RELOAD_SPEED = 1.5
	presets.weapon.gang_member.is_pistol.melee_speed = 1
	presets.weapon.gang_member.is_pistol.melee_dmg = enemy_melee_damage_gang_member
	presets.weapon.gang_member.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 1},
			dmg_mul = 1.25,
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
			acc = {0.8, 0.9},
			dmg_mul = 1.25,
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
			acc = {0.7, 0.8},
			dmg_mul = 1.25,
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
			acc = {0.6, 0.7},
			dmg_mul = 1.25,
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
			acc = {0.5, 0.6},
			dmg_mul = 1.25,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2400,
			acc = {0.4, 0.5},
			dmg_mul = 1.25,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.3, 0.4},
			dmg_mul = 1.25,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2600,
			acc = {0.3, 0.4},
			dmg_mul = 1.1875,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2700,
			acc = {0.3, 0.4},
			dmg_mul = 1.125,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.3, 0.4},
			dmg_mul = 1.0625,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.3, 0.4},
			dmg_mul = 1,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3000,
			acc = {0.3, 0.4},
			dmg_mul = 0.9375,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.3, 0.4},
			dmg_mul = 0.875,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.3, 0.4},
			dmg_mul = 0.8125,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3400,
			acc = {0.3, 0.4},
			dmg_mul = 0.6875,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3500,
			acc = {0.3, 0.4},
			dmg_mul = 0.625,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 3600,
			acc = {0.3, 0.4},
			dmg_mul = 0.5625,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3700,
			acc = {0.3, 0.4},
			dmg_mul = 0.5,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3800,
			acc = {0.3, 0.4},
			dmg_mul = 0.4375,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 3900,
			acc = {0.3, 0.4},
			dmg_mul = 0.375,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 4000,
			acc = {0.3, 0.4},
			dmg_mul = 0.3125,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 4100,
			acc = {0.3, 0.4},
			dmg_mul = 0.25,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 4200,
			acc = {0.3, 0.4},
			dmg_mul = 0.1875,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 4300,
			acc = {0.3, 0.4},
			dmg_mul = 0.125,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},	
		{
			r = 4400,
			acc = {0.3, 0.4},
			dmg_mul = 0.0625,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
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
	presets.weapon.gang_member.is_rifle.melee_dmg = enemy_melee_damage_gang_member
	presets.weapon.gang_member.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 1},
			dmg_mul = 1.25,
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
			acc = {0.8, 0.9},
			dmg_mul = 1.25,
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
			acc = {0.7, 0.8},
			dmg_mul = 1.25,
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
			acc = {0.6, 0.7},
			dmg_mul = 1.25,
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
			acc = {0.5, 0.6},
			dmg_mul = 1.25,
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
			acc = {0.4, 0.5},
			dmg_mul = 1.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 3100,
			acc = {0.3, 0.4},
			dmg_mul = 1.1875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.3, 0.4},
			dmg_mul = 1.125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.3, 0.4},
			dmg_mul = 1.0625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3400,
			acc = {0.3, 0.4},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3500,
			acc = {0.3, 0.4},
			dmg_mul = 0.9375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3600,
			acc = {0.3, 0.4},
			dmg_mul = 0.875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3700,
			acc = {0.3, 0.4},
			dmg_mul = 0.8125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3800,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3900,
			acc = {0.3, 0.4},
			dmg_mul = 0.6875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4000,
			acc = {0.3, 0.4},
			dmg_mul = 0.625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},		
		{
			r = 4100,
			acc = {0.3, 0.4},
			dmg_mul = 0.5625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4200,
			acc = {0.3, 0.4},
			dmg_mul = 0.5,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4300,
			acc = {0.3, 0.4},
			dmg_mul = 0.4375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4400,
			acc = {0.3, 0.4},
			dmg_mul = 0.375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4500,
			acc = {0.3, 0.4},
			dmg_mul = 0.3125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4600,
			acc = {0.3, 0.4},
			dmg_mul = 0.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4700,
			acc = {0.3, 0.4},
			dmg_mul = 0.1875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4800,
			acc = {0.3, 0.4},
			dmg_mul = 0.125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4900,
			acc = {0.3, 0.4},
			dmg_mul = 0.0625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}			
	}
	presets.weapon.gang_member.is_bullpup = presets.weapon.gang_member.is_rifle	
	presets.weapon.gang_member.is_shotgun_pump.aim_delay = {0, 0}
	presets.weapon.gang_member.is_shotgun_pump.focus_delay = 0
	presets.weapon.gang_member.is_shotgun_pump.focus_dis = 200
	presets.weapon.gang_member.is_shotgun_pump.spread = 15
	presets.weapon.gang_member.is_shotgun_pump.miss_dis = 20
	presets.weapon.gang_member.is_shotgun_pump.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_pump.melee_speed = 1
	presets.weapon.gang_member.is_shotgun_pump.melee_dmg = enemy_melee_damage_gang_member
	presets.weapon.gang_member.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 900,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},		
		{
			r = 1000,
			acc = {0.4, 0.9},
			dmg_mul = 0.95,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.9},
			dmg_mul = 0.9,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.9},
			dmg_mul = 0.85,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.9},
			dmg_mul = 0.8,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.9},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
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
			dmg_mul = 0.7,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 0.65,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 0.6,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.75},
			dmg_mul = 0.55,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.75},
			dmg_mul = 0.5,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.75},
			dmg_mul = 0.45,
			recoil = {0.75, 0.75},
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
			dmg_mul = 0.4,
			recoil = {0.75, 0.75},
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
			dmg_mul = 0.35,
			recoil = {0.75, 0.75},
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
			dmg_mul = 0.3,
			recoil = {0.75, 0.75},
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
			dmg_mul = 0.25,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2600,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2700,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2800,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {0.75, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2900,
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
	presets.weapon.gang_member.is_smg = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.is_revolver = presets.weapon.gang_member.is_pistol
	presets.weapon.gang_member.is_lmg = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.8, 0.9},
			dmg_mul = 1.25,
			recoil = {0.35, 0.75},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.7, 0.8},
			dmg_mul = 1.25,
			recoil = {0.35, 0.75},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.7},
			dmg_mul = 1.25,
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
			acc = {0.5, 0.6},
			dmg_mul = 1.25,
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
			acc = {0.4, 0.5},
			dmg_mul = 1.25,
			recoil = {0.4, 1.0},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 2600,
			acc = {0.3, 0.4},
			dmg_mul = 1.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},
		{
			r = 2700,
			acc = {0.2, 0.3},
			dmg_mul = 1.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 2800,
			acc = {0.2, 0.3},
			dmg_mul = 1.1875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 2900,
			acc = {0.2, 0.3},
			dmg_mul = 1.125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3000,
			acc = {0.2, 0.3},
			dmg_mul = 1.0625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3100,
			acc = {0.2, 0.3},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3200,
			acc = {0.2, 0.3},
			dmg_mul = 0.9375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3300,
			acc = {0.2, 0.3},
			dmg_mul = 0.875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3400,
			acc = {0.2, 0.3},
			dmg_mul = 0.8125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3500,
			acc = {0.2, 0.3},
			dmg_mul = 0.75,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3600,
			acc = {0.2, 0.3},
			dmg_mul = 0.6875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3700,
			acc = {0.2, 0.3},
			dmg_mul = 0.625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},		
		{
			r = 3800,
			acc = {0.2, 0.3},
			dmg_mul = 0.5625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 3900,
			acc = {0.2, 0.3},
			dmg_mul = 0.5,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4000,
			acc = {0.2, 0.3},
			dmg_mul = 0.4375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4100,
			acc = {0.2, 0.3},
			dmg_mul = 0.375,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4200,
			acc = {0.2, 0.3},
			dmg_mul = 0.3125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4300,
			acc = {0.2, 0.3},
			dmg_mul = 0.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4400,
			acc = {0.2, 0.3},
			dmg_mul = 0.1875,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4500,
			acc = {0.2, 0.3},
			dmg_mul = 0.125,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		},	
		{
			r = 4600,
			acc = {0.2, 0.3},
			dmg_mul = 0.0625,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}				
	}
	presets.weapon.gang_member.mossberg = deep_clone(presets.weapon.gang_member.is_shotgun_pump)
	presets.weapon.gang_member.mac11 = presets.weapon.gang_member.is_smg
	presets.weapon.gang_member.rifle = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.rifle.spread = 6
	presets.weapon.gang_member.rifle.autofire_rounds = nil
	presets.weapon.gang_member.rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.8, 0.9},
			dmg_mul = 1.25,
			recoil = {1.5, 1.5},
			mode = {
				1,
				1,
				1,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 1.25,
			recoil = {2, 2},
			mode = {
				1,
				1,
				1,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 1.25,
			recoil = {2, 2},
			mode = {
				1,
				1,
				1,
				1
			}
		}
	}
	presets.weapon.gang_member.akimbo_pistol = presets.weapon.gang_member.is_pistol	
	presets.weapon.gang_member.is_shotgun_mag.aim_delay = {0, 0}
	presets.weapon.gang_member.is_shotgun_mag.focus_delay = 0
	presets.weapon.gang_member.is_shotgun_mag.focus_dis = 200
	presets.weapon.gang_member.is_shotgun_mag.spread = 15
	presets.weapon.gang_member.is_shotgun_mag.miss_dis = 20
	presets.weapon.gang_member.is_shotgun_mag.melee_speed = 1
	presets.weapon.gang_member.is_shotgun_mag.melee_dmg = enemy_melee_damage_gang_member
	presets.weapon.gang_member.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_mag.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_mag.autofire_rounds = {4, 9}
	presets.weapon.gang_member.is_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}		
	presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
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
			r = 900,
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
			r = 1000,
			acc = {0.4, 0.9},
			dmg_mul = 0.95,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1100,
			acc = {0.4, 0.9},
			dmg_mul = 0.9,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1200,
			acc = {0.4, 0.9},
			dmg_mul = 0.85,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1300,
			acc = {0.4, 0.9},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1400,
			acc = {0.4, 0.9},
			dmg_mul = 0.75,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1500,
			acc = {0.4, 0.75},
			dmg_mul = 0.7,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1600,
			acc = {0.4, 0.75},
			dmg_mul = 0.65,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1700,
			acc = {0.4, 0.75},
			dmg_mul = 0.6,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1800,
			acc = {0.4, 0.75},
			dmg_mul = 0.55,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 1900,
			acc = {0.4, 0.75},
			dmg_mul = 0.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.75},
			dmg_mul = 0.45,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2100,
			acc = {0.1, 0.55},
			dmg_mul = 0.4,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2200,
			acc = {0.1, 0.55},
			dmg_mul = 0.35,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2300,
			acc = {0.1, 0.55},
			dmg_mul = 0.3,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2400,
			acc = {0.1, 0.55},
			dmg_mul = 0.25,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2500,
			acc = {0.1, 0.55},
			dmg_mul = 0.2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2600,
			acc = {0.1, 0.55},
			dmg_mul = 0.15,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2700,
			acc = {0.1, 0.55},
			dmg_mul = 0.1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2800,
			acc = {0.1, 0.55},
			dmg_mul = 0.05,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 2900,
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
	--This doesn't really matter since Semi-autos for bots just use is_shotgun_mag anyway, but just in case
	presets.weapon.gang_member.is_shotgun_semi = deep_clone(presets.weapon.gang_member.is_shotgun_mag)		
	presets.weapon.gang_member.is_sniper = deep_clone(presets.weapon.gang_member.rifle)
	restoration.log_shit("SC: normal presets")
	presets.weapon.normal.akimbo_pistol = deep_clone(presets.weapon.normal.is_pistol)
	presets.weapon.normal.rifle = deep_clone(presets.weapon.normal.is_rifle)
	
	restoration.log_shit("SC: good presets")
	presets.weapon.good.rifle = deep_clone(presets.weapon.good.is_rifle)
	
	restoration.log_shit("SC: expert presets")
	presets.weapon.expert.rifle = deep_clone(presets.weapon.expert.is_rifle)

	restoration.log_shit("SC: deathwish presets")
	presets.weapon.deathwish.rifle = deep_clone(presets.weapon.deathwish.is_rifle)
	
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
	presets.detection.normal_undercover = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.normal_undercover.idle.dis_max = 700
	presets.detection.normal_undercover.idle.angle_max = 60
	presets.detection.normal_undercover.idle.delay = {0, 0}
	presets.detection.normal_undercover.idle.use_uncover_range = false
	presets.detection.normal_undercover.combat.dis_max = 10000
	presets.detection.normal_undercover.combat.angle_max = 120
	presets.detection.normal_undercover.combat.delay = {0, 0}
	presets.detection.normal_undercover.combat.use_uncover_range = true
	presets.detection.normal_undercover.recon.dis_max = 10000
	presets.detection.normal_undercover.recon.angle_max = 120
	presets.detection.normal_undercover.recon.delay = {0, 0}
	presets.detection.normal_undercover.recon.use_uncover_range = true
	presets.detection.normal_undercover.guard.dis_max = 10000
	presets.detection.normal_undercover.guard.angle_max = 120
	presets.detection.normal_undercover.guard.delay = {0, 0}
	presets.detection.normal_undercover.ntl.dis_max = 4000
	presets.detection.normal_undercover.ntl.angle_max = 60
	presets.detection.normal_undercover.ntl.delay = {0.2, 2}
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
			speed = 1,
			occasions = {
				hit = {
					chance = 0.8,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.8,
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
					chance = 0.8,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.8,
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
					chance = 0.65,
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
					chance = 0.325,
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
					chance = 0.65,
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
					chance = 0.7,
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
					chance = 0.9,
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
					chance = 1,
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
					chance = 0.75,
					check_timeout = {1, 2},
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
					chance = 1,
					check_timeout = {0, 1},
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
					chance = 0.375,
					check_timeout = {0, 6},
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
					chance = 0.75,
					check_timeout = {0, 1},
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
					chance = 1,
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
					chance = 0.8,
					check_timeout = {0, 1},
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
					chance = 1,
					check_timeout = {0, 0},
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
		heavy_overkill = {
			speed = 1.2,
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
					chance = 0.5,
					check_timeout = {0, 5},
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
					chance = 0.75,
					check_timeout = {0, 0},
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
		autumn = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 1,
					check_timeout = {0, 0},
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
					chance = 0.9,
					check_timeout = {0, 0},
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
					check_timeout = {0, 0},
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
		deathwish = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 1,
					check_timeout = {0, 0},
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
					chance = 1,
					check_timeout = {0, 0},
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
					chance = 1,
					check_timeout = {0, 0},
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
					chance = 1,
					check_timeout = {0, 0},
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
					check_timeout = {0, 0},
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
					chance = 1,
					check_timeout = {0, 0},
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
			speed = 1.75,
			occasions = {
				hit = {
					chance = 1,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 3,
							timeout = {0, 0},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {0, 0}
						},
						wheel = {
							chance = 2,
							timeout = {0, 0}
						}
					}
				},
				preemptive = {
					chance = 1,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 3,
							timeout = {0, 0},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {0, 0}
						},
						wheel = {
							chance = 2,
							timeout = {0, 0}
						}
					}
				},
				scared = {
					chance = 1,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {0, 0},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {0, 0}
						},
						wheel = {
							chance = 3,
							timeout = {0, 0}
						},
						dive = {
							chance = 1,
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
						fwd = 350,
						strafe = 350,
						bwd = 350
					},
					cbt = {
						fwd = 350,
						strafe = 350,
						bwd = 350
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 350,
						bwd = 350
					},
					cbt = {
						fwd = 800,
						strafe = 350,
						bwd = 350
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 225,
						strafe = 225,
						bwd = 225
					},
					cbt = {
						fwd = 225,
						strafe = 225,
						bwd = 225
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 225,
						bwd = 225
					},
					cbt = {
						fwd = 360,
						strafe = 225,
						bwd = 225
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
						bwd = 110
					},
					hos = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					},
					cbt = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					},
					cbt = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 130,
						strafe = 130,
						bwd = 130
					},
					cbt = {
						fwd = 130,
						strafe = 130,
						bwd = 130
					}
				},
				run = {
					hos = {
						fwd = 130,
						strafe = 130,
						bwd = 130
					},
					cbt = {
						fwd = 130,
						strafe = 130,
						bwd = 130
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
						bwd = 110
					},
					hos = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					},
					cbt = {
						fwd = 144,
						strafe = 144,
						bwd = 144
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 144,
						bwd = 144
					},
					cbt = {
						fwd = 360,
						strafe = 144,
						bwd = 144
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 130,
						strafe = 130,
						bwd = 130
					},
					cbt = {
						fwd = 130,
						strafe = 130,
						bwd = 130
					}
				},
				run = {
					hos = {
						fwd = 208,
						strafe = 130,
						bwd = 130
					},
					cbt = {
						fwd = 208,
						strafe = 130,
						bwd = 130
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
						bwd = 110
					},
					hos = {
						fwd = 262,
						strafe = 262,
						bwd = 262
					},
					cbt = {
						fwd = 262,
						strafe = 262,
						bwd = 262
					}
				},
				run = {
					hos = {
						fwd = 431,
						strafe = 262,
						bwd = 262
					},
					cbt = {
						fwd = 431,
						strafe = 262,
						bwd = 262
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 168,
						strafe = 168,
						bwd = 168
					},
					cbt = {
						fwd = 168,
						strafe = 168,
						bwd = 168
					}
				},
				run = {
					hos = {
						fwd = 268,
						strafe = 168,
						bwd = 168
					},
					cbt = {
						fwd = 268,
						strafe = 168,
						bwd = 168
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
						fwd = 297,
						strafe = 297,
						bwd = 297
					},
					cbt = {
						fwd = 297,
						strafe = 297,
						bwd = 297
					}
				},
				run = {
					hos = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					},
					cbt = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 191,
						strafe = 191,
						bwd = 191
					},
					cbt = {
						fwd = 191,
						strafe = 191,
						bwd = 191
					}
				},
				run = {
					hos = {
						fwd = 305,
						strafe = 191,
						bwd = 191
					},
					cbt = {
						fwd = 305,
						strafe = 191,
						bwd = 191
					}
				}
			}
		},
		fast_dozer = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					},
					cbt = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					}
				},
				run = {
					hos = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					},
					cbt = {
						fwd = 488,
						strafe = 297,
						bwd = 297
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 191,
						strafe = 191,
						bwd = 191
					},
					cbt = {
						fwd = 191,
						strafe = 191,
						bwd = 191
					}
				},
				run = {
					hos = {
						fwd = 305,
						strafe = 191,
						bwd = 191
					},
					cbt = {
						fwd = 305,
						strafe = 191,
						bwd = 191
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
						fwd = 332,
						strafe = 332,
						bwd = 332
					},
					cbt = {
						fwd = 332,
						strafe = 332,
						bwd = 332
					}
				},
				run = {
					hos = {
						fwd = 546,
						strafe = 332,
						bwd = 332
					},
					cbt = {
						fwd = 546,
						strafe = 332,
						bwd = 332
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 213,
						strafe = 213,
						bwd = 213
					},
					cbt = {
						fwd = 213,
						strafe = 213,
						bwd = 213
					}
				},
				run = {
					hos = {
						fwd = 340,
						strafe = 213,
						bwd = 213
					},
					cbt = {
						fwd = 340,
						strafe = 213,
						bwd = 213
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
	presets.surrender.never = {base_chance = 0, impossible = true}
	presets.surrender.easy = {
		base_chance = 0.75,
		significant_chance = 0.35,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.25,
				[0.75] = 0.5,
				[0.5] = 0.75,
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
				[300] = 0.2
			}
		}
	}
	presets.surrender.hard = {
		base_chance = 0.5,
		significant_chance = 0.35,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.25,
				[0.75] = 0.5,
				[0.5] = 0.75,
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
				[300] = 0.2
			}
		}
	}
	presets.surrender.bravo = {
		base_chance = 0.3,
		significant_chance = 0.35,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.25,
				[0.75] = 0.5,
				[0.5] = 0.75,
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
				[300] = 0.2
			}
		}
	}	
	presets.surrender.special = {
		base_chance = 0.25,
		significant_chance = 0.35,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.25,
				[0.75] = 0.5,
				[0.5] = 0.75,
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
				[300] = 0.2
			}
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
	return presets
end

Hooks:PostHook(CharacterTweakData, "_create_table_structure", "remod_create_table_structure", function(self)

	--Vanilla Murky Scar-H turns into Scar-L
	self.weap_unit_names[table.index_of(self.weap_ids, "scar_murky")] = Idstring("units/payday2/weapons/wpn_npc_scar_light/wpn_npc_scar_light")
	
	--Vanilla RPK SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "rpk_lmg")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_rpk_sc/wpn_npc_rpk_sc")
	
	--Vanilla SVD SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "svd_snp")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_svd_sc/wpn_npc_svd_sc")	
	
	--Vanilla AKMSU SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "akmsu_smg")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_akmsu_sc/wpn_npc_akmsu_sc")
	
	--Vanilla Cloaker Asval SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "asval_smg")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_asval_sc/wpn_npc_asval_sc")
	
	--Vanilla SR2 SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "sr2_smg")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_sr2_sc/wpn_npc_sr2_sc")
	
	--Vanilla AK101 SC'd
	self.weap_unit_names[table.index_of(self.weap_ids, "ak47_ass")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak47_sc/wpn_npc_ak47_sc")

	--Vanilla Zeal Sniper made M14/SCAR-H DMR
	self.weap_unit_names[table.index_of(self.weap_ids, "heavy_zeal_sniper")] = Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")	
	
	--Peacemaker
	table.insert(self.weap_ids, "peacemaker")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_peacemaker/wpn_npc_peacemaker"))
	
	--[[
	--Unused, commenting out
	--Akimbo AKMSUs
	table.insert(self.weap_ids, "x_akmsu")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_akmsu_sc/wpn_npc_x_akmsu"))		
	]]--
		
	--Grenadier M4
	table.insert(self.weap_ids, "m4_boom")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_m4_boom/wpn_npc_m4_boom"))	

	--HK21
	table.insert(self.weap_ids, "hk21_sc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_hk21_sc/wpn_npc_hk21_sc"))		

	--Dozer HK21
	table.insert(self.weap_ids, "hk21_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_hk21_dozer/wpn_npc_hk21_dozer"))		
		
	table.insert(self.weap_ids, "mg42_hatman")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_halloween/weapons/wpn_npc_mg42_hatman/wpn_npc_mg42_hatman"))		
		
	--Cloaker Cloaker MP5
	table.insert(self.weap_ids, "mp5_cloak")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_vip/weapons/wpn_npc_mp5_cloak/wpn_npc_mp5_cloak"))

	--LPF S552 
	table.insert(self.weap_ids, "s552_sc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_s552_sc/wpn_npc_s552_sc"))	

	--Titan Taser Shotgun
	table.insert(self.weap_ids, "r870_taser")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_r870_taser_sc/wpn_npc_r870_taser_sc"))

	--OICW
	table.insert(self.weap_ids, "oicw")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_oicw/wpn_npc_oicw"))		
	
	--Spring HMG
	table.insert(self.weap_ids, "hmg_spring")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_vip/weapons/wpn_npc_hmg_spring/wpn_npc_hmg_spring"))	

	--AK103 Elite
	table.insert(self.weap_ids, "ak47_ass_elite")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak103/wpn_npc_ak103"))		
	
	--ASVAL Elite
	table.insert(self.weap_ids, "asval_smg_elite")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_asval_sc/wpn_npc_asval_sc"))	
	
	--AK101 Grenadier
	table.insert(self.weap_ids, "ak47_ass_boom")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak47_boom/wpn_npc_ak47_boom"))	

	--Autumn SMG
	table.insert(self.weap_ids, "autumn_smg")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_vip/weapons/wpn_npc_mpx/wpn_npc_mpx"))	
	
	--Zeal S553
	table.insert(self.weap_ids, "s553_zeal")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_s553/wpn_npc_s553"))	
	
	--HK23
	table.insert(self.weap_ids, "lmg_titan")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_hk23_sc/wpn_npc_hk23_sc"))	

	--Akimbo Miniguns
	table.insert(self.weap_ids, "x_mini_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_mini/x_mini_npc"))	

	--Akimbo Raging Bulls
	table.insert(self.weap_ids, "x_raging_bull_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_raging_bull/x_raging_bull_npc"))	
	
	--Bravo Rifle
	table.insert(self.weap_ids, "bravo_rifle")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_swamp/wpn_npc_swamp"))		
	
	--Bravo Shotgun
	table.insert(self.weap_ids, "bravo_shotgun")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_bayou/wpn_npc_bayou"))	
	
	--Bravo LMG
	table.insert(self.weap_ids, "bravo_lmg")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_lmg_m249_bravo/wpn_npc_lmg_m249_bravo"))

	--Bravo DMR
	table.insert(self.weap_ids, "bravo_dmr")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater"))	
	
	--Summers Flamethrower
	table.insert(self.weap_ids, "flamethrower_mk2_flamer_summers")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_vip/weapons/wpn_npc_flamethrower_summers/wpn_npc_flamethrower_summers"))	

	--SCAR-L
	table.insert(self.weap_ids, "scar_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_scar_light/wpn_npc_scar_light"))		
	
	--Crosskill .45 
	table.insert(self.weap_ids, "m1911_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_1911/wpn_npc_1911"))	
	
	--M60
	table.insert(self.weap_ids, "m60")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_m60/wpn_npc_m60"))	

	--Bravo M60
	table.insert(self.weap_ids, "m60_bravo")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_m60_bravo/wpn_npc_m60_bravo"))	

	--OMNIA M60
	table.insert(self.weap_ids, "m60_om")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_m60_om/wpn_npc_m60_om"))	

	--Deagle
	table.insert(self.weap_ids, "deagle_guard")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_degle/wpn_npc_degle"))	

	--ASU MP9
	table.insert(self.weap_ids, "mp9_titan")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_smg_mp9_titan/wpn_npc_smg_mp9_titan"))	
	
	--ASU SR2
	table.insert(self.weap_ids, "sr2_titan")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_sr2_titan/wpn_npc_sr2_titan"))

	--Titanshield M9
	table.insert(self.weap_ids, "beretta92_titan")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_beretta92_titan/wpn_npc_beretta92_titan"))	

	--CR 805B 
	table.insert(self.weap_ids, "hajk_cop")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_hajk/wpn_npc_hajk"))	
	
	--Uzi
	table.insert(self.weap_ids, "uzi_cop")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_uzi/wpn_npc_uzi"))		
	
	--AMCAR
	table.insert(self.weap_ids, "amcar")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_amcar/wpn_npc_amcar"))		
	
	--AK102
	table.insert(self.weap_ids, "ak102")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak102/wpn_npc_ak102"))	

	--HK416
	table.insert(self.weap_ids, "m416_npc")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_lapd/weapons/wpn_npc_m416/wpn_npc_m416"))

	--Railgun
	table.insert(self.weap_ids, "railgun_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_railgun/wpn_npc_railgun"))	
	
	--HK33
	table.insert(self.weap_ids, "hk33")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_hk33/wpn_npc_hk33"))		
	
	--Bravo HK33
	table.insert(self.weap_ids, "hk33_bravo")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_hk33_bravo/wpn_npc_hk33_bravo"))	

	--M500
	table.insert(self.weap_ids, "m500")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_m500/wpn_npc_m500"))	
	
	--Dozer M500
	table.insert(self.weap_ids, "m500_dozer")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_m500_dozer/wpn_npc_m500_dozer"))	

	--Meme Akimbo Raging Bulls
	table.insert(self.weap_ids, "x_raging_bull_meme_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_raging_bull/x_raging_bull_meme_npc"))	

	--Bravo HK21
	table.insert(self.weap_ids, "hk21_bravo_npc")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_hk21_bravo/wpn_npc_hk21_bravo"))	
	
	--M32
	table.insert(self.weap_ids, "m32")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_m32/wpn_npc_m32"))

	--RPG7
	table.insert(self.weap_ids, "rpg7")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_rpg7/wpn_npc_rpg7"))		
	
	--Akimbo PM9s
	table.insert(self.weap_ids, "x_pm9_enemy")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_pent/weapons/wpn_pm9_npc/x_pm9_npc"))

	--AA12
	table.insert(self.weap_ids, "aa12_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_aa12/wpn_npc_aa12"))		
	
	--AK12
	table.insert(self.weap_ids, "ak12")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak12/wpn_npc_ak12"))		
	
	--Fort 500
	table.insert(self.weap_ids, "fort_500")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_fort_500/wpn_npc_fort_500"))	

	--White Streak
	table.insert(self.weap_ids, "streak")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_pl14/wpn_npc_pl14"))	

	--Akimbo White Streak
	table.insert(self.weap_ids, "x_streak")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_pl14/wpn_npc_x_pl14"))

	--Tactical AKMSU
	table.insert(self.weap_ids, "akmsu_smg_tactical")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_akmsu_tactical/wpn_npc_akmsu_tactical"))	
	
	--AKSU SMG
	table.insert(self.weap_ids, "aksu_smg")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_aksu/wpn_npc_aksu"))	
	
	--Taser AK101
	table.insert(self.weap_ids, "ak47_yellow")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_ak47_taser/wpn_npc_ak47_taser"))		
	
	--DRAK Titan Taser Gauss Rifle
	table.insert(self.weap_ids, "gauss_gun")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_basscannon/wpn_npc_basscannon"))
	
	--Titandozer M32
	table.insert(self.weap_ids, "m32_large")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_m32_large/wpn_npc_m32_large"))		

	--Dozer Benelli
	table.insert(self.weap_ids, "benelli_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_benelli_dozer/wpn_npc_benelli_dozer"))		
	
	--Dozer R870
	table.insert(self.weap_ids, "r870_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_r870_dozer/wpn_npc_r870_dozer"))		
		
	--Dozer Saiga
	table.insert(self.weap_ids, "saiga_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_saiga_dozer/wpn_npc_saiga_dozer"))	

	--Dozer M249
	table.insert(self.weap_ids, "m249_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_lmg_m249_dozer/wpn_npc_lmg_m249_dozer"))	
	
	--Dozer Fort 500
	table.insert(self.weap_ids, "fort_500_dozer")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_fort_500_dozer/wpn_npc_fort_500_dozer"))	
	
	--Dozer Vityaz
	table.insert(self.weap_ids, "akmsu_smg_dozer")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_akmsu_dozer/wpn_npc_akmsu_dozer"))	
	
	--Dozer MP5
	table.insert(self.weap_ids, "mp5_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_mp5_dozer/wpn_npc_mp5_dozer"))
		
	--Dozer AA12
	table.insert(self.weap_ids, "aa12_dozer")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_aa12_dozer/wpn_npc_aa12_dozer"))	

	--Dozer RPK
	table.insert(self.weap_ids, "rpk_dozer")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_reapers/weapons/wpn_npc_rpk_dozer/wpn_npc_rpk_dozer"))	
	
	--Reaper Bravo Rifle
	table.insert(self.weap_ids, "bravo_ak17")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_ak17_bravo/wpn_npc_ak17_bravo"))
	
	--Reaper Bravo Shotgun
	table.insert(self.weap_ids, "bravo_argos")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_argos_bravo/wpn_npc_argos_bravo"))	
	
	--Reaper Bravo RPK74
	table.insert(self.weap_ids, "bravo_rpk74")
	table.insert(self.weap_unit_names, Idstring("units/pd2_mod_bravo/weapons/wpn_npc_lmg_rpk74_bravo/wpn_npc_lmg_rpk74_bravo"))	

	--Scab Shotgunner!
	--Concussion rounds AA12
	table.insert(self.weap_ids, "aa12_conc_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_aa12_conc/wpn_npc_aa12_conc"))	

	--Concussion rounds Saiga
	table.insert(self.weap_ids, "saiga_conc_npc")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_saiga_conc/wpn_npc_saiga_conc"))		

end)

function CharacterTweakData:_set_easy()
	self:_multiply_all_hp(0.75, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal", "normal")
	self.autumn.damage.bullet_damage_mul = 0.65
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard
	
	--Guard City
	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.normal)
	
	--No normal tase for Elektra on lower difficulties
	self.taser_summers.weapon.is_rifle.tase_distance = 0
	
	--No Frags on Spring on lower difficulties
	self.spring.can_throw_frag = false
	self.headless_hatman.can_throw_molotov = false
	
	--No Gas on Autumn on lower difficulties
	self.autumn.can_deploy_tear_gas = false
	self.autumn.chance_use_gas = 0		
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.normal)
	self.weekend.dodge = self.presets.dodge.athletic_very_hard
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.normal)
	
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1", "1")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self.presets.gang_member_damage.HEALTH_INIT = 25
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 25
	self.spa_vip.HEALTH_INIT = 25
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 25
	self:_multiply_all_speeds(1, 1)
end

function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(0.75, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal", "normal")
	self.autumn.damage.bullet_damage_mul = 0.65
	
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat.melee_weapon_dmg_multiplier = 1
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard
	
	--FTSU Guard
	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_guard.melee_weapon_dmg_multiplier = 1
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_titan.melee_weapon_dmg_multiplier = 1
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_titan_assault.melee_weapon_dmg_multiplier = 1
			
	--Set damage dealt for false downs.
	self.spooc.kick_damage = 4.0
	self.taser.shock_damage = 4.0

	--No normal tase for Elektra on lower difficulties
	self.taser_summers.weapon.is_rifle.tase_distance = 0
	
	--No Frags on Spring on lower difficulties
	self.spring.can_throw_frag = false		
	self.headless_hatman.can_throw_molotov = false
	
	--No Gas on Autumn on lower difficulties
	self.autumn.can_deploy_tear_gas = false
	self.autumn.chance_use_gas = 0		
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.normal)
	self.weekend.melee_weapon_dmg_multiplier = 1
	self.weekend.dodge = self.presets.dodge.athletic_very_hard	
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.normal)
	self.weekend_lmg.melee_weapon_dmg_multiplier = 1
		
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1", "1")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self.presets.gang_member_damage.HEALTH_INIT = 50
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 50
	self.spa_vip.HEALTH_INIT = 50
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 50
	self:_multiply_all_speeds(1, 1)
end

function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("normal", "normal")
	self.autumn.damage.bullet_damage_mul = 0.65
	
	self.city_swat.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.normal)
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.normal)
		
	--Set damage dealt for false downs.
	self.spooc.kick_damage = 5.0
	self.taser.shock_damage = 5.0

	--No normal tase for Elektra on lower difficulties
	self.taser_summers.weapon.is_rifle.tase_distance = 0	

	--No Frags on Spring on lower difficulties
	self.spring.can_throw_frag = false		
	self.headless_hatman.can_throw_molotov = false
	
	--No Gas on Autumn on lower difficulties
	self.autumn.can_deploy_tear_gas = false
	self.autumn.chance_use_gas = 0		
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.normal)
	self.weekend.dodge = self.presets.dodge.athletic_very_hard
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.normal)
	
	--Melee Mults
	self.city_swat.melee_weapon_dmg_multiplier = 1
	self.city_swat_guard.melee_weapon_dmg_multiplier = 1
	self.city_swat_titan.melee_weapon_dmg_multiplier = 1
	self.city_swat_titan_assault.melee_weapon_dmg_multiplier = 1
	self.weekend_lmg.melee_weapon_dmg_multiplier = 1
		
	self:_set_characters_dodge_preset("athletic")
	self:_set_characters_melee_preset("1", "1")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self.presets.gang_member_damage.HEALTH_INIT = 75
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 75
	self.spa_vip.HEALTH_INIT = 75
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 75
	self:_multiply_all_speeds(1, 1)
end

function CharacterTweakData:_set_overkill()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("good", "normal")
	self.autumn.damage.bullet_damage_mul = 0.65
	
	self.city_swat.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard

	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.good)

	--Set damage dealt for false downs.
	self.spooc.kick_damage = 6.0
	self.taser.shock_damage = 6.0

	--No normal tase for Elektra on lower difficulties
	self.taser_summers.weapon.is_rifle.tase_distance = 0		
	
	--No Frags on Spring on lower difficulties
	self.spring.can_throw_frag = false	
	self.headless_hatman.can_throw_molotov = false
	
	--No Gas on Autumn on lower difficulties
	self.autumn.can_deploy_tear_gas = false
	self.autumn.chance_use_gas = 0	
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.good)
	self.weekend.dodge = self.presets.dodge.athletic_very_hard
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.good)
	
	--Melee Mults
	self.city_swat.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_guard.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan_assault.melee_weapon_dmg_multiplier = 1.5
	self.weekend_lmg.melee_weapon_dmg_multiplier = 1.5
							
	self:_set_characters_dodge_preset("athletic_very_hard")
	self:_set_characters_melee_preset("1.5", "1")
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self.presets.gang_member_damage.HEALTH_INIT = 100
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 100
	self.spa_vip.HEALTH_INIT = 100
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 100
	self:_multiply_all_speeds(1, 1)	
end

function CharacterTweakData:_set_overkill_145()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1, 1)
	else
		self:_multiply_all_hp(1, 1)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("expert", "good")
	
	self.city_swat.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard
	
	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard		
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.good)

	--Set damage dealt for false downs.
	self.spooc.kick_damage = 6.0
	self.taser.shock_damage = 6.0
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.good)
	self.weekend.dodge = self.presets.dodge.athletic_very_hard		
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.good)
	
	
	--Melee Mults
	self.city_swat.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_guard.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan_assault.melee_weapon_dmg_multiplier = 1.5
	self.weekend_lmg.melee_weapon_dmg_multiplier = 1.5		
										
	self:_set_characters_dodge_preset("athletic_overkill")
	self:_set_characters_melee_preset("2", "1.5")
	self.fbi.can_shoot_while_dodging = true
	self.swat.can_shoot_while_dodging = true
	self.hrt.can_shoot_while_dodging = true	
	
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.autumn.damage.bullet_damage_mul = 0.6
		
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self.presets.gang_member_damage.HEALTH_INIT = 125
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.old_hoxton_mission.HEALTH_INIT = 125
	self.spa_vip.HEALTH_INIT = 125
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 125
	self:_multiply_all_speeds(1, 1)
end

function CharacterTweakData:_set_easy_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.5, 1)
	else
		self:_multiply_all_hp(1.5, 1)
	end
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	
	--Tankier Dozer Armor
	self.tank_armor_damage_mul = 0.8
	self.tank_glass_damage_mul = 0.8
	
	--Set damage dealt for false downs.
	self.spooc.kick_damage = 6.0
	self.taser.shock_damage = 6.0
	
	self:_set_characters_weapon_preset("expert", "good")
	self:_set_characters_dodge_preset("athletic_overkill")
	self.fbi.can_shoot_while_dodging = true
	self.swat.can_shoot_while_dodging = true	
	self.hrt.can_shoot_while_dodging = true
	self:_set_characters_melee_preset("2", "1.5")
	
	--Weekend Rifles/Shotguns
	self.weekend.weapon = deep_clone(self.presets.weapon.good)
	self.weekend.dodge = self.presets.dodge.athletic_very_hard	
	
	--Weekend LMG Variants
	self.weekend_lmg.weapon = deep_clone(self.presets.weapon.good)
	
	--Melee Mults
	self.city_swat.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_guard.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan.melee_weapon_dmg_multiplier = 1.5
	self.city_swat_titan_assault.melee_weapon_dmg_multiplier = 1.5
	self.weekend_lmg.melee_weapon_dmg_multiplier = 1.5		
				
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil

	self.city_swat.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat.dodge = self.presets.dodge.athletic_very_hard	

	self.city_swat_guard.weapon = deep_clone(self.presets.weapon.good)
	self.city_swat_guard.dodge = self.presets.dodge.athletic_very_hard	
	
	self.city_swat_titan.weapon = deep_clone(self.presets.weapon.good)			
	self.city_swat_titan_assault.weapon = deep_clone(self.presets.weapon.good)	
	self.autumn.damage.bullet_damage_mul = 0.5
	self.presets.gang_member_damage.HEALTH_INIT = 150
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	self.old_hoxton_mission.HEALTH_INIT = 150
	self.spa_vip.HEALTH_INIT = 150
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 150
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self:_multiply_all_speeds(1, 1)
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
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("deathwish", "expert")
	self:_set_characters_dodge_preset("deathwish")
	self:_set_characters_melee_preset("2.5", "2")
	self.fbi.can_shoot_while_dodging = true
	self.swat.can_shoot_while_dodging = true	
	self.hrt.can_shoot_while_dodging = true		
	
	--Tankier Dozer Armor
	self.tank_armor_damage_mul = 0.5
	self.tank_glass_damage_mul = 0.5
	
	--Speed boost on BlackDozers/MedicDozers
	self.tank_black.move_speed = self.presets.move_speed.fast
	self.tank_medic.move_speed = self.presets.move_speed.fast
			
	--Set damage dealt for false downs.
	self.spooc.kick_damage = 6.0
	self.taser.shock_damage = 6.0

	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.shield.damage.explosion_damage_mul = 0.7		
		
	self.fbi_heavy_swat.weapon = deep_clone(self.presets.weapon.good)
	self.fbi_heavy_swat.melee_weapon_dmg_multiplier = 1.5
	self.fbi_heavy_swat.dodge = deep_clone(self.presets.dodge.heavy_overkill)
	
	--Titan SWAT stun resistance
	self.city_swat_titan.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.city_swat_titan.use_animation_on_fire_damage = false
	self.city_swat_titan.dt_suppress = {
		range = 1600
	}
	self.city_swat_titan_assault.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.city_swat_titan_assault.use_animation_on_fire_damage = false
	self.city_swat_titan_assault.dt_sgunner = {
		range = 800
	}
	self.weekend_lmg.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.weekend_lmg.use_animation_on_fire_damage = false		
	
	self.spring.dt_suppress = {
		range = 2500
	}
		
	self.autumn.damage.bullet_damage_mul = 0.45
	self.presets.gang_member_damage.HEALTH_INIT = 175
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	self.old_hoxton_mission.HEALTH_INIT = 175
	self.spa_vip.HEALTH_INIT = 175
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 175
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	self:_multiply_all_speeds(1, 1.05)
end

function CharacterTweakData:_set_sm_wish()
	--Harder heads base, not sure if needed anymore tbh
	--[[
	self.swat.headshot_dmg_mul = 2
	self.heavy_swat.headshot_dmg_mul = 2.2
	self.fbi_swat.headshot_dmg_mul = 2.2
	self.fbi_heavy_swat.headshot_dmg_mul = 1.5
	self.city_swat.headshot_dmg_mul = 2.2
	self.weekend.headshot_dmg_mul = 2.75	
	self.city_swat_titan.headshot_dmg_mul = 2.5
	self.city_swat_titan_assault.headshot_dmg_mul = 2.5
	self.weekend_lmg.headshot_dmg_mul = 3.125
	]]--

	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(2, 0.915)
	else
		self:_multiply_all_hp(2, 0.915)
	end
	
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.deathwish, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self:_set_characters_weapon_preset("deathwish", "expert")
	self:_set_characters_dodge_preset("deathwish")
	self:_set_characters_melee_preset("2.5", "2")
	self.fbi.can_shoot_while_dodging = true
	self.swat.can_shoot_while_dodging = true
	self.hrt.can_shoot_while_dodging = true		
	
	--Tankier Dozer Armor
	self.tank_armor_damage_mul = 0.5
	self.tank_glass_damage_mul = 0.5

	--Speed boost on BlackDozers/MedicDozers, Blackdozers will also always run
	self.tank_black.move_speed = self.presets.move_speed.fast_dozer
	self.tank_medic.move_speed = self.presets.move_speed.fast	
				
	--Set damage dealt for false downs.
	self.spooc.kick_damage = 8.0
	self.taser.shock_damage = 8.0
		
	--Shields get overhealed by LPF/Winters
	self.shield.overheal_mult = 2
	self.marshal_shield.overheal_mult = 2
	self.phalanx_minion.overheal_mult = 2
	self.phalanx_minion_assault.overheal_mult = 2
	
	--Winters' shields are immune to ECM feedback effects :)
	self.phalanx_minion.ecm_vulnerability = 0
	
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	
	--No Glint versions of weapons	
	self.weap_unit_names[table.index_of(self.weap_ids, "m14_sniper_npc")] = Idstring("units/payday2/weapons/wpn_npc_sniper_sc/wpn_npc_sniper_sc")
	self.weap_unit_names[table.index_of(self.weap_ids, "svd_snp")] = Idstring("units/pd2_mod_reapers/weapons/wpn_npc_svd_noglint_sc/wpn_npc_svd_noglint_sc")
	
	self.shield.damage.hurt_severity = self.presets.hurt_severities.no_hurts
	self.shield.damage.explosion_damage_mul = 0.7
	
	self.fbi_swat.weapon = deep_clone(self.presets.weapon.expert)
	self.fbi_swat.melee_weapon_dmg_multiplier = 2
	
	self.fbi_heavy_swat.weapon = deep_clone(self.presets.weapon.good)
	self.fbi_heavy_swat.melee_weapon_dmg_multiplier = 1.5
	self.fbi_heavy_swat.dodge = deep_clone(self.presets.dodge.heavy_overkill)	

	self.city_swat.can_shoot_while_dodging = true
	self.city_swat_guard.can_shoot_while_dodging = true	
		
	self:_multiply_all_speeds(1.05, 1.1)
	self.presets.gang_member_damage.HEALTH_INIT = 200
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.25
	self.old_hoxton_mission.HEALTH_INIT = 200
	self.spa_vip.HEALTH_INIT = 200
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 200
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
	
	--Titan SWAT smoke dodging
	self.city_swat_titan.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.25

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}	
	self.city_swat_titan_assault.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.25

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}	
	self.weekend_lmg.dodge_with_grenade = {
		smoke = {duration = {
			12,
			12
		}},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = 30
			local chance = 0.25

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}		
	
	--Titan SWAT stun resistance
	self.city_swat_titan.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.city_swat_titan.use_animation_on_fire_damage = false
	self.city_swat_titan.dt_suppress = {
		range = 1800
	}
	self.city_swat_titan_assault.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.city_swat_titan_assault.use_animation_on_fire_damage = false
	self.city_swat_titan_assault.dt_sgunner = {
		range = 1000
	}
	self.weekend_lmg.damage.hurt_severity = self.presets.hurt_severities.elite	
	self.weekend_lmg.use_animation_on_fire_damage = false				
	
	--Titandozers become immune to stunning
	self.tank_titan.damage.hurt_severity = self.presets.hurt_severities.no_hurts_no_tase
	self.tank_titan_assault.damage.hurt_severity = self.presets.hurt_severities.no_hurts_no_tase	
	self.tank_hw.damage.hurt_severity = self.presets.hurt_severities.no_hurts_no_tase
		
	self.autumn.damage.bullet_damage_mul = 0.4
	
	self.tank_skull.dt_suppress = {
		range = 500
	}
	
	self.spring.dt_suppress = {
		range = 3000
	}	
end

function CharacterTweakData:is_special_unit(enemy_tweak)
	local is_special = false
	if self[enemy_tweak].is_special then
		is_special = true
	end
	return is_special
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
	for _, enemy_tweak in ipairs(self._enemy_list) do
		if self[enemy_tweak] then
			self[enemy_tweak].HEALTH_INIT = self[enemy_tweak].HEALTH_INIT * hp_mul
			if self[enemy_tweak].headshot_dmg_mul then
				self[enemy_tweak].headshot_dmg_mul = self[enemy_tweak].headshot_dmg_mul * hs_mul
			end
		end
	end
end

function CharacterTweakData:_multiply_all_speeds(walk_mul, run_mul)
	for _, enemy_tweak in ipairs(self._enemy_list) do
		if self[enemy_tweak] then
			local speed_preset = deep_clone(self[enemy_tweak].move_speed)

			self[enemy_tweak].move_speed = speed_preset

			speed_preset.stand.walk.hos.fwd = speed_preset.stand.walk.hos.fwd * walk_mul
			speed_preset.stand.walk.hos.strafe = speed_preset.stand.walk.hos.strafe * walk_mul
			speed_preset.stand.walk.hos.bwd = speed_preset.stand.walk.hos.bwd * walk_mul
			speed_preset.stand.walk.cbt.fwd = speed_preset.stand.walk.cbt.fwd * walk_mul
			speed_preset.stand.walk.cbt.strafe = speed_preset.stand.walk.cbt.strafe * walk_mul
			speed_preset.stand.walk.cbt.bwd = speed_preset.stand.walk.cbt.bwd * walk_mul
			speed_preset.stand.run.hos.fwd = speed_preset.stand.run.hos.fwd * run_mul
			speed_preset.stand.run.hos.strafe = speed_preset.stand.run.hos.strafe * run_mul
			speed_preset.stand.run.hos.bwd = speed_preset.stand.run.hos.bwd * run_mul
			speed_preset.stand.run.cbt.fwd = speed_preset.stand.run.cbt.fwd * run_mul
			speed_preset.stand.run.cbt.strafe = speed_preset.stand.run.cbt.strafe * run_mul
			speed_preset.stand.run.cbt.bwd = speed_preset.stand.run.cbt.bwd * run_mul
			speed_preset.crouch.walk.hos.fwd = speed_preset.crouch.walk.hos.fwd * walk_mul
			speed_preset.crouch.walk.hos.strafe = speed_preset.crouch.walk.hos.strafe * walk_mul
			speed_preset.crouch.walk.hos.bwd = speed_preset.crouch.walk.hos.bwd * walk_mul
			speed_preset.crouch.walk.cbt.fwd = speed_preset.crouch.walk.cbt.fwd * walk_mul
			speed_preset.crouch.walk.cbt.strafe = speed_preset.crouch.walk.cbt.strafe * walk_mul
			speed_preset.crouch.walk.cbt.bwd = speed_preset.crouch.walk.cbt.bwd * walk_mul
			speed_preset.crouch.run.hos.fwd = speed_preset.crouch.run.hos.fwd * run_mul
			speed_preset.crouch.run.hos.strafe = speed_preset.crouch.run.hos.strafe * run_mul
			speed_preset.crouch.run.hos.bwd = speed_preset.crouch.run.hos.bwd * run_mul
			speed_preset.crouch.run.cbt.fwd = speed_preset.crouch.run.cbt.fwd * run_mul
			speed_preset.crouch.run.cbt.strafe = speed_preset.crouch.run.cbt.strafe * run_mul
			speed_preset.crouch.run.cbt.bwd = speed_preset.crouch.run.cbt.bwd * run_mul
		end
	end
end

function CharacterTweakData:_set_characters_weapon_preset(preset, special_preset)
	for _, enemy_tweak in ipairs(self._enemy_list) do
		if self[enemy_tweak] then
			if not self[enemy_tweak].static_weapon_preset then
				if not self:is_special_unit(enemy_tweak) then
					self[enemy_tweak].weapon = deep_clone(self.presets.weapon[preset])
				else
					self[enemy_tweak].weapon = deep_clone(self.presets.weapon[special_preset])
				end
			end
		end
	end
end

function CharacterTweakData:_set_characters_dodge_preset(preset)
	for _, enemy_tweak in ipairs(self._enemy_list) do
		if self[enemy_tweak] then
			if not self[enemy_tweak].static_dodge_preset then
				if not self:is_special_unit(enemy_tweak) then
					self[enemy_tweak].dodge = self.presets.dodge[preset]
				end
			end
		end
	end
end

function CharacterTweakData:_set_characters_melee_preset(preset, special_preset)
	for _, enemy_tweak in ipairs(self._enemy_list) do
		if self[enemy_tweak] then
			if not self[enemy_tweak].static_melee_preset then
				if not self:is_special_unit(enemy_tweak) then
					self[enemy_tweak].melee_weapon_dmg_multiplier = preset
				else
					self[enemy_tweak].melee_weapon_dmg_multiplier = special_preset
				end
			end
		end
	end
end

local orig_character_map = CharacterTweakData.character_map
function CharacterTweakData:character_map()
	local char_map = orig_character_map()
	--Basic
	
		--CS Tier
		table.insert(char_map.basic.list, "ene_bulldozer_1_sc")
		table.insert(char_map.basic.list, "ene_bulldozer_1_hard")	
		table.insert(char_map.basic.list, "ene_swat_1_sc")
		table.insert(char_map.basic.list, "ene_swat_2_sc")		
		table.insert(char_map.basic.list, "ene_swat_3")
		table.insert(char_map.basic.list, "ene_swat_heavy_1_sc")
		table.insert(char_map.basic.list, "ene_swat_heavy_r870_sc")	
		table.insert(char_map.basic.list, "ene_sniper_2_sc")
		table.insert(char_map.basic.list, "ene_tazer_1_sc")
		table.insert(char_map.basic.list, "ene_shield_2_sc")
		
		--FBI
		table.insert(char_map.basic.list, "ene_bulldozer_2_sc")
		table.insert(char_map.basic.list, "ene_medic_mp5")
		table.insert(char_map.basic.list, "ene_grenadier_1")
		table.insert(char_map.basic.list, "ene_fbi_swat_1_sc")
		table.insert(char_map.basic.list, "ene_fbi_swat_2_sc")
		table.insert(char_map.basic.list, "ene_fbi_swat_3")
		table.insert(char_map.basic.list, "ene_fbi_heavy_1_sc")
		table.insert(char_map.basic.list, "ene_fbi_heavy_r870_sc")		
		table.insert(char_map.basic.list, "ene_veteran_cop_1")
		table.insert(char_map.basic.list, "ene_veteran_cop_2")		
		table.insert(char_map.basic.list, "ene_sniper_1_sc")
		table.insert(char_map.basic.list, "ene_shield_1_sc")
		
		--GenSec	
		table.insert(char_map.basic.list, "ene_bulldozer_3_sc")
		table.insert(char_map.basic.list, "ene_city_swat_1_sc")
		table.insert(char_map.basic.list, "ene_city_swat_2_sc")
		table.insert(char_map.basic.list, "ene_city_swat_3_sc")
		table.insert(char_map.basic.list, "ene_city_heavy_g36_sc")
		table.insert(char_map.basic.list, "ene_city_heavy_r870_sc")
		table.insert(char_map.basic.list, "ene_city_heavy_ump_sc")
		table.insert(char_map.basic.list, "ene_city_shield")
		table.insert(char_map.basic.list, "ene_shield_gensec")		
		table.insert(char_map.basic.list, "ene_sniper_3")
		
		--Zeal (The Few that are here and not in gitgud)
		table.insert(char_map.basic.list, "ene_city_guard_1")
		table.insert(char_map.basic.list, "ene_city_guard_2")
		table.insert(char_map.basic.list, "ene_city_guard_3")		
		
		--Other
		table.insert(char_map.basic.list, "ene_bulldozer_2_hw")		
		table.insert(char_map.basic.list, "ene_vip_2")		
		table.insert(char_map.basic.list, "ene_mememan_1")
		table.insert(char_map.basic.list, "ene_mememan_2")
		table.insert(char_map.basic.list, "ene_bulldozer_biker_1")
		table.insert(char_map.basic.list, "ene_guard_biker_1")
		table.insert(char_map.basic.list, "ene_gang_black_enforcer")
		table.insert(char_map.basic.list, "ene_gang_mobster_enforcer")
		table.insert(char_map.basic.list, "ene_veteran_lod_1")
		table.insert(char_map.basic.list, "ene_veteran_lod_2")
		table.insert(char_map.basic.list, "ene_hoxton_breakout_guard_1")
		table.insert(char_map.basic.list, "ene_hoxton_breakout_guard_2")
		table.insert(char_map.basic.list, "ene_hoxton_breakout_responder_1")
		table.insert(char_map.basic.list, "ene_hoxton_breakout_responder_2")
		table.insert(char_map.basic.list, "ene_cop_1_forest")
		table.insert(char_map.basic.list, "ene_cop_2_forest")
			
	--dlc1
		table.insert(char_map.dlc1.list, "ene_security_gensec_guard_1")
		table.insert(char_map.dlc1.list, "ene_security_gensec_guard_2")
		table.insert(char_map.dlc1.list, "ene_security_gensec_3")
		
	--drm	
		table.insert(char_map.drm.list, "ene_bulldozer_medic_sc")
		
	--flat
		table.insert(char_map.flat.list, "ene_gang_colombian_1")
		table.insert(char_map.flat.list, "ene_gang_colombian_2")	
		table.insert(char_map.flat.list, "ene_gang_colombian_3")
		table.insert(char_map.flat.list, "ene_gang_colombian_boss")
		table.insert(char_map.flat.list, "ene_gang_colombian_enforcer")
	--chas
		table.insert(char_map.chas.list, "ene_cop_1")
		table.insert(char_map.chas.list, "ene_cop_2")
		table.insert(char_map.chas.list, "ene_cop_3")
		table.insert(char_map.chas.list, "ene_cop_4")
		
	--pent
		table.insert(char_map.pent.list, "ene_male_kungfumaster_1")
		table.insert(char_map.pent.list, "ene_male_kungfumaster_2")
	--ranc
		table.insert(char_map.ranc.list, "ene_cop_1")
		table.insert(char_map.ranc.list, "ene_cop_2")	
		table.insert(char_map.ranc.list, "ene_cop_3")
		table.insert(char_map.ranc.list, "ene_cop_4")
	--Christmas
		table.insert(char_map.cg22.list, "ene_bulldozer_snowman")		
	--vip
		char_map.vip = {
			path = "units/pd2_dlc_vip/characters/",
			list = {
				"ene_vip_1",
				"ene_vip_2",
				"ene_vip_2_assault",					
				"ene_spring",
				"ene_vip_autumn",
				"ene_spook_cloak_1",
				"ene_summers",
				"ene_phalanx_medic",
				"ene_phalanx_grenadier",
				"ene_phalanx_taser",
				"ene_phalanx_1",
				"ene_phalanx_1_assault",					
				"ene_titan_shotgun",
				"ene_titan_rifle",
				"ene_omnia_lpf",
				"ene_fbi_titan_1",
				"ene_titan_sniper",
				"ene_titan_taser"
			}
		}
	--gitgud
		char_map.gitgud = {
			path = "units/pd2_dlc_gitgud/characters/",
			list = {
				"ene_zeal_bulldozer",
				"ene_zeal_bulldozer_2",
				"ene_zeal_bulldozer_3",
				"ene_zeal_bulldozer_sc",
				"ene_zeal_bulldozer_2_sc",
				"ene_zeal_bulldozer_3_sc",
				"ene_bulldozer_minigun",				
				"ene_zeal_cloaker",
				"ene_zeal_cloaker_sc",
				"ene_zeal_swat",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_city_3",
				"ene_zeal_medic",				
				"ene_grenadier_1",				
				"ene_zeal_sniper",
				"ene_zeal_swat_heavy",
				"ene_zeal_swat_shield",
				"ene_zeal_swat_shield_sc",
				"ene_zeal_tazer",
				"ene_zeal_tazer_sc",
				"ene_zeal_fbi_m4",
				"ene_zeal_fbi_mp5",
				"ene_zeal_swat_heavy_sc",
				"ene_zeal_swat_heavy_r870_sc",
				"ene_zeal_swat_heavy_benelli"
			}
		}
	--drm
		table.insert(char_map.drm.list, "ene_bulldozer_medic_classic")
	--bex
		char_map.bex = {
			path = "units/pd2_dlc_bex/characters/",
			list = {
				"ene_swat_policia_federale",
				"ene_swat_policia_federale_r870",
				"ene_swat_policia_federale_city",
				"ene_swat_policia_federale_city_r870",
				"ene_swat_policia_federale_fbi",
				"ene_swat_policia_federale_fbi_r870",
				"ene_swat_medic_policia_federale",
				"ene_swat_medic_policia_federale_r870",
				"ene_swat_cloaker_policia_federale",
				"ene_swat_policia_sniper",
				"ene_swat_shield_policia_federale_mp9",
				"ene_swat_shield_policia_federale_c45",
				"ene_swat_tazer_policia_federale",
				"ene_swat_heavy_policia_federale",
				"ene_swat_heavy_policia_federale_r870",
				"ene_swat_heavy_policia_federale_g36",
				"ene_swat_heavy_policia_federale_fbi",
				"ene_swat_heavy_policia_federale_fbi_r870",
				"ene_swat_heavy_policia_federale_fbi_g36",
				"ene_swat_dozer_medic_policia_federale",
				"ene_swat_dozer_policia_federale_r870",
				"ene_swat_dozer_policia_federale_saiga",
				"ene_swat_dozer_policia_federale_m249",
				"ene_swat_dozer_policia_federale_minigun",
				"ene_shield_1",
				"ene_shield_2",
				"ene_shield_gensec",	
				"ene_zeal_swat_shield",
				"ene_sniper_1",	
				"ene_zeal_sniper",
				"ene_medic_mp5",
				"ene_tazer_1",	
				"ene_spook_1",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_city_3",
				"ene_bulldozer_1",
				"ene_bulldozer_1_hard",
				"ene_bulldozer_2",
				"ene_bulldozer_3",
				"ene_bulldozer_minigun",
				"ene_bulldozer_medic",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_city_heavy_g36",
				"ene_city_heavy_r870",
				"ene_zeal_swat_heavy_sc",
				"ene_zeal_swat_heavy_r870",
				"ene_zeal_swat_heavy_benelli",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_3",
				"ene_swat_heavy_1",
				"ene_swat_heavy_r870",
				"ene_policia_01",
				"ene_policia_02",
				"ene_policia_03",
				"ene_policia_04",
				"ene_fbi_1",
				"ene_fbi_2",
				"ene_fbi_3",
				"ene_grenadier_1",
				"ene_bex_security_01",
				"ene_bex_security_02",
				"ene_bex_security_03",
				"ene_bex_security_suit_01",
				"ene_bex_security_suit_02",
				"ene_bex_security_suit_03",
				"civ_male_it_guy",
				"ene_veteran_enrique_1",
				"ene_veteran_enrique_2",
				"civ_male_bex_bank_manager",
				"civ_male_bex_business",
				"civ_male_mariachi_01",
				"civ_male_mariachi_02",
				"civ_male_mariachi_03",
				"civ_male_mariachi_04"
			}
		}
	--fully custom
		char_map.sharks = {
			path = "units/pd2_mod_sharks/characters/",
			list = {
				"ene_murky_cs_cop_c45",
				"ene_murky_cs_cop_mp5",
				"ene_murky_cs_cop_r870",
				"ene_murky_cs_cop_raging_bull",
				"ene_murky_security_c45",
				"ene_murky_security_mp5",
				"ene_murky_security_r870",
				"ene_murky_security_raging_bull",
				"ene_murky_elite_guard_1",
				"ene_murky_elite_guard_2",
				"ene_murky_elite_guard_3",
				"ene_fbi_3",
				"ene_fbi_1",
				"ene_fbi_2",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_swat_heavy_1",
				"ene_swat_heavy_r870",
				"ene_murky_shield_yellow",
				"ene_murky_shield_fbi",
				"ene_murky_shield_city",
				"ene_zeal_swat_shield",
				"ene_titan_rifle",
				"ene_titan_shotgun",
				"ene_titan_sniper",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_city_3",
				"ene_zeal_swat_heavy",
				"ene_zeal_swat_heavy_r870",
				"ene_zeal_swat_heavy_benelli",
				"ene_murky_fbi_tank_m249",
				"ene_murky_fbi_tank_benelli",
				"ene_murky_fbi_tank_medic",
				"ene_murky_fbi_tank_saiga",
				"ene_murky_fbi_tank_r870",
				"ene_murky_fbi_tank_r870_hard",
				"ene_murky_spook",
				"ene_murky_veteran_1",
				"ene_murky_veteran_2",
				"ene_grenadier_1",
				"ene_murky_medic_m4",
				"ene_murky_tazer",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_3",
				"ene_murky_sniper",
				"ene_murky_sniper_2"
			}
		}

		char_map.omnia = {
			path = "units/pd2_mod_omnia/characters/",
			list = {
				"ene_omnia_hrt_1",
				"ene_omnia_hrt_2",
				"ene_omnia_hrt_3",
				"ene_omnia_crew",
				"ene_omnia_crew_2",
				"ene_omnia_city",
				"ene_omnia_city_2",
				"ene_omnia_city_3",
				"ene_omnia_heavy",
				"ene_omnia_heavy_r870",
				"ene_bulldozer_1",
				"ene_bulldozer_2",
				"ene_bulldozer_3",
				"ene_bulldozer_minigun",
				"ene_omnia_spook",
				"ene_grenadier_1",
				"ene_omnia_medic",
				"ene_omnia_taser",
				"ene_omnia_sniper",
				"ene_omnia_sniper_2",
				"ene_omnia_shield"					
			}
		}

		char_map.nypd = {
			path = "units/pd2_mod_nypd/characters/",
			list = {
				"ene_shield_1",
				"ene_sniper_1",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_fbi_heavy_r870_sc",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_shield_gensec",
				"ene_city_heavy_g36",
				"ene_city_heavy_r870",
				"ene_sniper_3",
				"ene_spook_1",
				"ene_bulldozer_1",
				"ene_bulldozer_1_hard",
				"ene_bulldozer_2",
				"ene_nypd_heavy_m4",					
				"ene_nypd_medic",
				"ene_tazer_1",
				"ene_grenadier_1",
				"ene_fbi_2",	
				"ene_fbi_3",	
				"ene_nypd_veteran_cop_1",		
				"ene_nypd_veteran_cop_2",										
				"ene_nypd_heavy_r870",
				"ene_nypd_swat_1",
				"ene_nypd_swat_2",
				"ene_nypd_swat_3",
				"ene_nypd_shield",
				"ene_nypd_murky_1",
				"ene_nypd_murky_2",
				"ene_security_1",	
				"ene_security_2",	
				"ene_security_3",	
				"ene_security_gensec_1",	
				"ene_security_gensec_2",	
				"ene_security_gensec_3",					
				"ene_cop_1",
				"ene_cop_2",
				"ene_cop_3",
				"ene_cop_4"
			}
		}

		char_map.lapd = {
			path = "units/pd2_mod_lapd/characters/",
			list = {
				"ene_shield_1",
				"ene_shield_2",
				"ene_cop_1",
				"ene_cop_2",
				"ene_cop_3",
				"ene_cop_4",				
				"ene_sniper_1",
				"ene_sniper_3",				
				"ene_tazer_1",
				"ene_spook_1",	
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_3",
				"ene_fbi_2",
				"ene_fbi_swat_3",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_bulldozer_3",
				"ene_city_shield",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_fbi_heavy_r870_sc",
				"ene_city_heavy_g36",
				"ene_city_heavy_r870_sc",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_3",
				"ene_swat_heavy_1",
				"ene_swat_heavy_r870",
				"ene_lapd_veteran_cop_1",
				"ene_lapd_veteran_cop_2"
			}
		}

		char_map.bravo = {
			path = "units/pd2_mod_bravo/characters/",
			list = {
				"ene_bravo_guard_1",
				"ene_bravo_guard_2",
				"ene_bravo_guard_3",
				"ene_bravo_dmr",
				"ene_bravo_lmg",
				"ene_bravo_rifle",
				"ene_bravo_bulldozer",
				"ene_bravo_shotgun",
				"ene_bravo_dmr_ru",
				"ene_bravo_lmg_ru",
				"ene_bravo_rifle_ru",
				"ene_bravo_shotgun_ru",
				"ene_bravo_dmr_murky",
				"ene_bravo_lmg_murky",
				"ene_bravo_rifle_murky",
				"ene_bravo_shotgun_murky",
				"ene_bravo_dmr_mex",
				"ene_bravo_lmg_mex",
				"ene_bravo_rifle_mex",
				"ene_bravo_shotgun_mex"
			}
		}

		char_map.dave = {
			path = "units/pd2_mod_dave/characters/",
			list = {
				"ene_big_dave"
			}
		}
		
		char_map.halloween = {
			path = "units/pd2_mod_halloween/characters/",
			list = {
				"ene_skele_swat",
				"ene_skele_swat_2",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_city_3",
				"ene_zeal_swat_heavy_sc",
				"ene_zeal_swat_heavy_r870_sc",
				"ene_zeal_swat_heavy_benelli",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_3",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_sniper_1",
				"ene_sniper_2",
				"ene_sniper_3",
				"ene_shield_1",
				"ene_shield_2",
				"ene_bulldozer_1",
				"ene_bulldozer_1_hard",
				"ene_bulldozer_2",
				"ene_bulldozer_3",
				"ene_medic_mp5",
				"ene_zeal_fbi_m4",
				"ene_zeal_fbi_mp5",
				"ene_zeal_medic",
				"ene_zeal_swat_shield",
				"ene_zeal_bulldozer",
				"ene_zeal_bulldozer_2",
				"ene_zeal_bulldozer_3",
				"ene_zeal_cloaker",
				"ene_grenadier_1",
				"ene_zeal_tazer",
				"ene_zeal_sniper",
				"ene_shield_gensec",
				"ene_fbi_heavy_1_sc",
				"ene_fbi_heavy_r870_sc",
				"ene_city_heavy_g36",
				"ene_city_heavy_r870_sc",
				"ene_swat_heavy_1_sc",
				"ene_swat_heavy_r870_sc",
				"ene_spook_1",
				"ene_tazer_1",
				"ene_headless_hatman",				
				"ene_spook_cloak_1",	
				"ene_omnia_lpf",
				"ene_fbi_titan_1",
				"ene_titan_sniper",
				"ene_titan_taser",
				"ene_veteran_cop_1",
				"ene_phalanx_1_assault"
			}
		}
		
		char_map.reapers = {
			path = "units/pd2_mod_reapers/characters/",
			list = {
				"ene_security_1",
				"ene_security_2",
				"ene_security_3",
				"ene_security_4",
				"ene_cop_1",
				"ene_cop_2",
				"ene_cop_3",
				"ene_cop_4",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_fbi_swat_3",
				"ene_fbi_heavy_1",
				"ene_fbi_heavy_r870",
				"ene_city_heavy_g36",
				"ene_city_heavy_r870",
				"ene_swat_heavy_1",
				"ene_swat_heavy_r870",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_3",
				"ene_fbi_1",
				"ene_fbi_2",
				"ene_fbi_3",
				"ene_drak_hrt_1",
				"ene_drak_hrt_2",
				"ene_akan_veteran_1",
				"ene_akan_veteran_2",
				"ene_akan_veteran_subject",
				"ene_sniper_1",
				"ene_tazer_1",
				"ene_sniper_2",
				"ene_sniper_3",
				"ene_shield_2",
				"ene_shield_1",
				"ene_city_shield",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_bulldozer_1_hard",
				"ene_bulldozer_1",
				"ene_bulldozer_2",
				"ene_bulldozer_3",
				"ene_bulldozer_mini",
				"ene_bulldozer_medic",
				"ene_spook_1",
				"ene_zeal_city_1",
				"ene_zeal_city_2",
				"ene_zeal_city_3",
				"ene_zeal_swat_heavy",
				"ene_zeal_swat_heavy_r870",
				"ene_zeal_swat_heavy_benelli",
				"ene_zeal_swat_shield",
				"ene_drak_medic",
				"ene_zeal_sniper",
				"ene_subject_enforcer",
				"ene_grenadier_1",
				"ene_akan_medic_bob",
				"ene_akan_medic_zdann",	
				"ene_akan_lpf",
				"ene_vip_2",
				"ene_titan_shotgun",
				"ene_titan_rifle",
				"ene_fbi_titan_1",
				"ene_phalanx_1_assault",										
				"ene_spook_cloak_1",										
				"ene_titan_sniper",
				"ene_titan_taser"
			}
		}

	return char_map
end