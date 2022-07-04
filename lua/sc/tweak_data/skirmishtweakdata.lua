
Month = os.date("%m")
Day = os.date("%d")	
--This is probs unused, but setting to scaled DS values to be on the safe side.
function SkirmishTweakData:_init_special_unit_spawn_limits()
	self.special_unit_spawn_limits = {
		{
			tank = 4,
			taser = 5,
			boom = 3,
			spooc = 4,
			shield = 5,
			medic = 4,
			spring = 1,
			autumn = 1,
			summers = 1,
			phalanx_vip = 1
		}
	}
end

function SkirmishTweakData:_init_group_ai_data(tweak_data)
	local skirmish_data = deep_clone(tweak_data.group_ai.besiege)
	tweak_data.group_ai.skirmish = skirmish_data

	self.required_kills = {
		40,
		40,
		44,
		48,
		52,
		56,
		60,
		64,
		68,
		72,
		80,
		120
	}

	self.required_kills_balance_mul = {
		0.55,
		0.7,
		0.85,
		1
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
		20,
		20,
		20,
		20,
		25,
		25,
		25,
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

	skirmish_data.assault.hostage_hesitation_delay = {
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
		12,
		12,
		12,
		13,
		13,
		14,
		14,
		15,
		15,
		20,
		20,
		25
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
		0.55,
		0.7,
		0.85,
		1
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
		SKM_Light_Swat = {
			0.3, --Unused
			0.3, --Wave 1
			0.25, --Wave 2
			0.22, --...
			0.32,
			0.31,
			0.32,
			0.32,
			0.32,
			0.32,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_Heavy_Swat = {
			0.5, --Unused
			0.5, --Wave 1
			0.4, --Wave 2
			0.35, --...
			0.27,
			0.26,
			0.22,
			0.22,
			0.22,
			0.22,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields = {
			0.2, --Unused
			0.2, --Wave 1
			0.15, --Wave 2
			0.13, --...
			0.14,
			0.12,
			0.12,
			0.12,
			0.12,
			0.12,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_Tazers = {
			0, --Unused
			0, --Wave 1
			0.14, --Wave 2
			0.12, --...
			0.1,
			0.06,
			0.06,
			0.06,
			0.06,
			0.06,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms = {
			0, --Unused
			0, --Wave 1
			0.06, --Wave 2
			0.06, --...
			0.05,
			0.04,
			0.04,
			0.04,
			0.04,
			0.04,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_HRTs = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.12, --...
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_BLACK_Tank = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.02,
			0.02,
			0.015,
			0.015,
			0.015,
			0.015,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_GREEN_Tank = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.02,
			0.015,
			0.015,
			0.015,
			0.015,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_single_spooc = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.05,
			0.05,
			0.05,
			0.05,
			0.05,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_FBI_spoocs = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.05,
			0.05,
			0.05,
			0.05,
			0.05,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_Shields_Booms = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.04,
			0.04,
			0.04,
			0.04,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_SKULL_Tank = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.015,
			0.015,
			0.015,
			0.015,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_TIT_Tank = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.005,
			0.005,
			0.005,
			0.005,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		}
	}

	--This portion of the code will need to be cut and reworked once infinite is in progress.
	--Might be ideal to use/abuse lua virtual tables and vary them based on captain type.
	local wave_9_captain = math.random()
	
	
	if Month == "10" and restoration.Options:GetValue("OTHER/Holiday") then
	if wave_9_captain < 0.96 then --Spooky halloween boss.
		self.captain = "SKM_HVH_Boss_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.06
		assault_groups.SKM_Shields_Booms[10] = 0.04
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0
		assault_groups.SKM_GREEN_Tank[10] = 0.0
		assault_groups.SKM_SKULL_Tank[10] = 0.0
		assault_groups.SKM_TIT_Tank[10] = 0.0
		assault_groups.SKM_single_spooc[10] = 0.05
		assault_groups.SKM_FBI_spoocs[10] = 0.05
	elseif wave_9_captain < 0.24 then --autumn
		self.captain = "SKM_Cap_Autumn_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.14
		assault_groups.SKM_Shields_Booms[10] = 0.01
		assault_groups.SKM_Tazers[10] = 0.09
		assault_groups.SKM_Booms[10] = 0.01
		assault_groups.SKM_HRTs[10] = 0.1
		assault_groups.SKM_BLACK_Tank[10] = 0.015
		assault_groups.SKM_GREEN_Tank[10] = 0.015
		assault_groups.SKM_SKULL_Tank[10] = 0.015
		assault_groups.SKM_TIT_Tank[10] = 0.005
		assault_groups.SKM_single_spooc[10] = 0.0
		assault_groups.SKM_FBI_spoocs[10] = 0.0
	elseif wave_9_captain < 0.48 then --summers
		self.captain = "SKM_Cap_Summers_W9"
		assault_groups.SKM_Light_Swat[10] = 0.37
		assault_groups.SKM_Heavy_Swat[10] = 0.31
		assault_groups.SKM_Shields[10] = 0.05
		assault_groups.SKM_Shields_Booms[10] = 0.02
		assault_groups.SKM_Tazers[10] = 0.03
		assault_groups.SKM_Booms[10] = 0.02
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0075
		assault_groups.SKM_GREEN_Tank[10] = 0.0075
		assault_groups.SKM_SKULL_Tank[10] = 0.0075
		assault_groups.SKM_TIT_Tank[10] = 0.0025
		assault_groups.SKM_single_spooc[10] = 0.025
		assault_groups.SKM_FBI_spoocs[10] = 0.025
	elseif wave_9_captain < 0.72 then --winters
		self.captain = "SKM_Cap_Winters_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.0
		assault_groups.SKM_Shields_Booms[10] = 0.0
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.2
		assault_groups.SKM_BLACK_Tank[10] = 0.015
		assault_groups.SKM_GREEN_Tank[10] = 0.015
		assault_groups.SKM_SKULL_Tank[10] = 0.015
		assault_groups.SKM_TIT_Tank[10] = 0.005
		assault_groups.SKM_single_spooc[10] = 0.05
		assault_groups.SKM_FBI_spoocs[10] = 0.05
	else --spring
		self.captain = "SKM_Cap_Spring_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.06
		assault_groups.SKM_Shields_Booms[10] = 0.04
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0
		assault_groups.SKM_GREEN_Tank[10] = 0.0
		assault_groups.SKM_SKULL_Tank[10] = 0.0
		assault_groups.SKM_TIT_Tank[10] = 0.0
		assault_groups.SKM_single_spooc[10] = 0.05
		assault_groups.SKM_FBI_spoocs[10] = 0.05
	end
   else	
	if wave_9_captain < 0.24 then --autumn
		self.captain = "SKM_Cap_Autumn_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.14
		assault_groups.SKM_Shields_Booms[10] = 0.01
		assault_groups.SKM_Tazers[10] = 0.09
		assault_groups.SKM_Booms[10] = 0.01
		assault_groups.SKM_HRTs[10] = 0.1
		assault_groups.SKM_BLACK_Tank[10] = 0.015
		assault_groups.SKM_GREEN_Tank[10] = 0.015
		assault_groups.SKM_SKULL_Tank[10] = 0.015
		assault_groups.SKM_TIT_Tank[10] = 0.005
		assault_groups.SKM_single_spooc[10] = 0.0
		assault_groups.SKM_FBI_spoocs[10] = 0.0
	elseif wave_9_captain < 0.48 then --summers
		self.captain = "SKM_Cap_Summers_W9"
		assault_groups.SKM_Light_Swat[10] = 0.37
		assault_groups.SKM_Heavy_Swat[10] = 0.31
		assault_groups.SKM_Shields[10] = 0.05
		assault_groups.SKM_Shields_Booms[10] = 0.02
		assault_groups.SKM_Tazers[10] = 0.03
		assault_groups.SKM_Booms[10] = 0.02
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0075
		assault_groups.SKM_GREEN_Tank[10] = 0.0075
		assault_groups.SKM_SKULL_Tank[10] = 0.0075
		assault_groups.SKM_TIT_Tank[10] = 0.0025
		assault_groups.SKM_single_spooc[10] = 0.025
		assault_groups.SKM_FBI_spoocs[10] = 0.025
	elseif wave_9_captain < 0.72 then --winters
		self.captain = "SKM_Cap_Winters_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.0
		assault_groups.SKM_Shields_Booms[10] = 0.0
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.2
		assault_groups.SKM_BLACK_Tank[10] = 0.015
		assault_groups.SKM_GREEN_Tank[10] = 0.015
		assault_groups.SKM_SKULL_Tank[10] = 0.015
		assault_groups.SKM_TIT_Tank[10] = 0.005
		assault_groups.SKM_single_spooc[10] = 0.05
		assault_groups.SKM_FBI_spoocs[10] = 0.05
	elseif wave_9_captain < 0.96 then --spring
		self.captain = "SKM_Cap_Spring_W9"
		assault_groups.SKM_Light_Swat[10] = 0.35
		assault_groups.SKM_Heavy_Swat[10] = 0.25
		assault_groups.SKM_Shields[10] = 0.06
		assault_groups.SKM_Shields_Booms[10] = 0.04
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0
		assault_groups.SKM_GREEN_Tank[10] = 0.0
		assault_groups.SKM_SKULL_Tank[10] = 0.0
		assault_groups.SKM_TIT_Tank[10] = 0.0
		assault_groups.SKM_single_spooc[10] = 0.05
	else --Spooky halloween boss.
		self.captain = "SKM_HVH_Boss_W9"
		assault_groups.SKM_Light_Swat[10] = 0.325
		assault_groups.SKM_Heavy_Swat[10] = 0.3
		assault_groups.SKM_Shields[10] = 0.06
		assault_groups.SKM_Shields_Booms[10] = 0.04
		assault_groups.SKM_Tazers[10] = 0.06
		assault_groups.SKM_Booms[10] = 0.04
		assault_groups.SKM_HRTs[10] = 0.15
		assault_groups.SKM_BLACK_Tank[10] = 0.0
		assault_groups.SKM_GREEN_Tank[10] = 0.0
		assault_groups.SKM_SKULL_Tank[10] = 0.0
		assault_groups.SKM_TIT_Tank[10] = 0.0
		assault_groups.SKM_single_spooc[10] = 0.025
		assault_groups.SKM_FBI_spoocs[10] = 0.025
	end
  end	

	--Split assault group tweakdata into seperate groups for each wave.
	local real_assault_groups = {}
	for k, v in pairs(assault_groups) do
		for i = 0, 11, 1 do
			local group_name = k .. "_W" .. tostring(i)
			local chance_table = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
			chance_table[i+1] = assault_groups[k][i+1]
			--log(group_name .. " = " .. tostring(assault_groups[k][i+1]))
			real_assault_groups[group_name] = chance_table
		end
	end


	local reenforce_groups = {
		nil
	}
	local recon_groups = {
		nil
	}	
	
	tweak_data.group_ai.skirmish.assault.groups = real_assault_groups
	tweak_data.group_ai.skirmish.reenforce.groups = reenforce_groups
	tweak_data.group_ai.skirmish.recon.groups = recon_groups
	tweak_data.group_ai.skirmish.group_min_diff = {}
end

function SkirmishTweakData:_init_wave_modifiers()
	self.wave_modifiers = {}
	local health_damage_multipliers = {
		{
			damage = 0.75,
			health = 0.5
		},
		{
			damage = 0.8,
			health = 0.6
		},
		{
			damage = 0.85,
			health = 0.7
		},
		{
			damage = 0.9,
			health = 0.8
		},
		{
			damage = 0.95,
			health = 0.9
		},
		{
			damage = 1.0,
			health = 1.0
		}
	}
	self.wave_modifiers[1] = {
		{
			class = "ModifierEnemyHealthAndDamageByWave",
			data = {waves = health_damage_multipliers}
		}
	}
	self.wave_modifiers[2] = {{class = "ModifierNoHurtAnims"}}
	self.wave_modifiers[4] = {
		{
			class = "ModifierHealSpeed",
			data = {speed = 50}
		}
	}
	self.wave_modifiers[6] = {
		{
			class = "ModifierSniperAim",
			data = {speed = 2}
		}
	}
	self.wave_modifiers[8] = {
		{
			class = "ModifierShieldPhalanx",
			data = {}
		}
	}
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