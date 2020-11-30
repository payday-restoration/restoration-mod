function SkirmishTweakData:_init_special_unit_spawn_limits()
	self.special_unit_spawn_limits = {
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		},
		{
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			spring = 1,
			autumn = 1,
			summers = 1
		}
	}
end

function SkirmishTweakData:_init_group_ai_data(tweak_data)
	local skirmish_data = deep_clone(tweak_data.group_ai.besiege)
	tweak_data.group_ai.skirmish = skirmish_data

	self.required_kills = {
		20,
		15,
		17,
		19,
		21,
		23,
		25,
		27,
		29,
		31,
		40
	}

	self.required_kills_balance_mul = {
		1,
		1.33,
		1.66,
		2
	}
end

function SkirmishTweakData:_init_wave_phase_durations(tweak_data)
	local skirmish_data = tweak_data.group_ai.skirmish

	skirmish_data.assault.anticipation_duration = {
		{15, 1}
	}

	skirmish_data.assault.build_duration = 15
	skirmish_data.assault.sustain_duration_min = {
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999
	}

	skirmish_data.assault.sustain_duration_max = {
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999
	}

	skirmish_data.assault.sustain_duration_balance_mul = {
		1,
		1,
		1,
		1
	}

	skirmish_data.assault.fade_duration = 5
	skirmish_data.assault.delay = {
		30,
		30,
		30,
		30,
		30,
		30,
		30,
		30,
		30,
		30,
		30,
		30
	}

	skirmish_data.regroup.duration = {
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5
	}

	skirmish_data.hostage_hesitation_delay = {
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5
	}

	--Assaults have infinite resources, end based on kills.
	skirmish_data.assault.force_pool = {
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999,
		99999
	}

	--Temp
	skirmish_data.assault.force = {
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5
	}

	skirmish_data.recon.force = {
		4,
		4,
		4,
		4,
		4,
		4,
		4,
		4,
		4,
		4,
		4,
		4
	}

	skirmish_data.recon.interval = {
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5
	}

	skirmish_data.assault.force_balance_mul = {
		1,
		1.5,
		2,
		2.5
	}

	skirmish_data.assault.force_pool_balance_mul = {
		1,
		1,
		1,
		1
	}

	skirmish_data.reenforce.interval = {
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5,
		5
	}
end


function SkirmishTweakData:_init_spawn_group_weights(tweak_data)
	local assault_groups = {
		GS_swats = {
			0.9, --Unused
			0.9, --Wave 1
			0.9, --Wave 2
			0.9, --...
			0.9,
			0.9,
			0.9,
			0.9,
			0.9,
			0.9,
			0.9, --"Wave 10" (Inactive, needs map edits)
			0.9  --Scales ever closer to over time post wave 10.
		},
		FBI_heavys = {
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39,
			0.39
		},
		FBI_heavys_boom = {
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26,
			0.26
		},			
		FBI_shields = {
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18,
			0.18
		},
		FBI_shields_boom = {
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12
		},			
		FBI_tanks = {
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12
		},
		BLACK_tanks = {
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12
		},
		SKULL_tanks = {
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12
		},
		TIT_tanks = {
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04
		},					
		CS_tazers = {
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21,
			0.21
		},
		CS_booms = {
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14,
			0.14
		},			
		FBI_spoocs = {
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3,
			0.3
		}
	}

	local reenforce_groups = {
		FBI_defend_d = {
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1
		}
	}

	tweak_data.group_ai.skirmish.assault.groups = assault_groups
	tweak_data.group_ai.skirmish.reenforce.groups = reenforce_groups
end

function SkirmishTweakData:_init_wave_modifiers()
	self.wave_modifiers = {}
	local health_damage_multipliers = {
		{
			damage = 1,
			health = 1
		},
		{
			damage = 1,
			health = 1
		},
		{
			damage = 1,
			health = 1
		},
		{
			damage = 1.05,
			health = 1.2
		},
		{
			damage = 1.05,
			health = 1.2
		},
		{
			damage = 1.1,
			health = 1.4
		},
		{
			damage = 1.1,
			health = 1.4
		},
		{
			damage = 1.1,
			health = 1.4
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		},
		{
			damage = 1.15,
			health = 1.5
		}
	}
	self.wave_modifiers[1] = {
		{
			class = "ModifierEnemyHealthAndDamageByWave",
			data = {waves = health_damage_multipliers}
		},
		{class = "ModifierCloakerArrest"}
	}
	self.wave_modifiers[3] = {{class = "ModifierSkulldozers"}}
	self.wave_modifiers[5] = {{
		class = "ModifierHeavySniper",
		data = {spawn_chance = 5}
	}}
	self.wave_modifiers[7] = {{class = "ModifierDozerMedic"}}
	self.wave_modifiers[9] = {{class = "ModifierDozerMinigun"}}
end

function SkirmishTweakData:_init_weekly_modifiers()
	self.weekly_modifiers = {
		wsm01 = {
			icon = "crime_spree_cloaker_tear_gas",
			class = "ModifierCloakerTearGas",
			data = {
				diameter = 4,
				duration = 5,
				damage = 10
			}
		},
		wsm02 = {
			icon = "crime_spree_dozer_rage",
			class = "ModifierDozerRage",
			data = {damage = 10}
		},
		wsm03 = {
			icon = "crime_spree_medic_speed",
			class = "ModifierHealSpeed",
			data = {speed = 25}
		},
		wsm04 = {
			icon = "crime_spree_medic_rage",
			class = "ModifierMedicRage",
			data = {damage = 5}
		},
		wsm05 = {
			icon = "crime_spree_youre_that_ninja",
			class = "ModifierMedicAdrenaline",
			data = {damage = 100}
		},
		wsm06 = {
			icon = "crime_spree_more_dozers",
			class = "ModifierMoreDozers",
			data = {inc = 2}
		},
		wsm07 = {
			icon = "crime_spree_shield_phalanx",
			class = "ModifierShieldPhalanx",
			data = {}
		},
		wsm08 = {
			icon = "crime_spree_shield_reflect",
			class = "ModifierShieldReflect",
			data = {}
		},
		wsm09 = {
			icon = "crime_spree_ump_me_up",
			class = "ModifierHeavies",
			data = {}
		},
		wsm10 = {
			icon = "crime_spree_no_hurt",
			class = "ModifierNoHurtAnims",
			data = {}
		}
	}
end