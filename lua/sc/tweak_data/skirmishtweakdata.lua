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
end

function SkirmishTweakData:_init_wave_phase_durations(tweak_data)
	local skirmish_data = tweak_data.group_ai.skirmish
	skirmish_data.assault.anticipation_duration = {{
		15,
		1
	}}
	skirmish_data.assault.build_duration = 15
	skirmish_data.assault.sustain_duration_min = {
		120,
		120,
		120
	}
	skirmish_data.assault.sustain_duration_max = {
		120,
		120,
		120
	}
	skirmish_data.assault.sustain_duration_balance_mul = {
		1,
		1,
		1,
		1
	}
	skirmish_data.assault.fade_duration = 5
	skirmish_data.assault.delay = {
		25,
		25,
		25
	}
end

function SkirmishTweakData:_init_spawn_group_weights(tweak_data)
	local skirmish_data = deep_clone(tweak_data.group_ai.besiege.assault)
	setmetatable(tweak_data.group_ai.skirmish.assault, skirmish_data)
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