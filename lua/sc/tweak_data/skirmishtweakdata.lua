function SkirmishTweakData:_init_special_unit_spawn_limits()
	self.special_unit_spawn_limits = {
		{
			tank = 0,
			taser = 0,
			boom = 0,
			spooc = 0,
			shield = 5,
			medic = 0,
			spring = 0,
			autumn = 0,
			summers = 0
		},
		{
			tank = 0,
			taser = 4,
			boom = 2,
			spooc = 0,
			shield = 5,
			medic = 3,
			spring = 0,
			autumn = 0,
			summers = 0
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
		25,
		25,
		28,
		31,
		33,
		35,
		37,
		38,
		39,
		40,
		60
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
		10,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		20,
		30
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
		--Wave 1
		SKM_Light_Swat_W1 = {
			0.3, --Unused
			0.3, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_Heavy_Swat_W1 = {
			0.5, --Unused
			0.5, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W1 = {
			0.2, --Unused
			0.2, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 2
		SKM_Light_Swat_W2 = {
			0, --Unused
			0, --Wave 1
			0.25, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W2 = {
			0, --Unused
			0, --Wave 1
			0.4, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W2 = {
			0, --Unused
			0, --Wave 1
			0.15, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Tazers_W2 = {
			0, --Unused
			0, --Wave 1
			0.14, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W2 = {
			0, --Unused
			0, --Wave 1
			0.06, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 3
		SKM_Light_Swat_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.22, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.35, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.13, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Tazers_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.12, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.06, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W3 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0.12, --...
			0,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 4
		SKM_Light_Swat_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.3,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.25,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.1,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Tazers_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.1,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.05,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.1,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_BLACK_Tank_W4 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0.1,
			0,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 5
		SKM_Light_Swat_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.3,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.25,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.1,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Tazers_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.06,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.04,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.1,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_BLACK_Tank_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.05,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_GREEN_Tank_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.05,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_single_spooc_W5 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0.05,
			0,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},		
		--Wave 6
		SKM_Light_Swat_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.3,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.2,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.06,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_Booms_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.04,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},		
		SKM_Tazers_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.06,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.04,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.1,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_BLACK_Tank_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.045,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_GREEN_Tank_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.045,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_SKULL_Tank_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.045,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_TIT_Tank_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.015,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_single_spooc_W6 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0.05,
			0,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 7
		SKM_Light_Swat_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.3,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.2,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.06,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_Booms_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.04,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},		
		SKM_Tazers_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.06,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.04,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.1,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_BLACK_Tank_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.045,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_GREEN_Tank_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.045,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_SKULL_Tank_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.045,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_TIT_Tank_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.015,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_single_spooc_W7 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0.05,
			0,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		--Wave 8
		SKM_Light_Swat_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.3,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Heavy_Swat_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.2,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.06,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Shields_Booms_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.04,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},		
		SKM_Tazers_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.06,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_Booms_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.04,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_HRTs_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.1,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_BLACK_Tank_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.045,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_GREEN_Tank_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.045,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},	
		SKM_SKULL_Tank_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.045,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_TIT_Tank_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.015,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		},
		SKM_single_spooc_W8 = {
			0, --Unused
			0, --Wave 1
			0, --Wave 2
			0, --...
			0,
			0,
			0,
			0,
			0.05,
			0,
			0, --"Wave 10" (Inactive, needs map edits)
			0  --Scales ever closer to over time post wave 10.
		}				
	}

	local reenforce_groups = {
		nil
	}
	local recon_groups = {
		nil
	}	

	tweak_data.group_ai.skirmish.assault.groups = assault_groups
	tweak_data.group_ai.skirmish.reenforce.groups = reenforce_groups
	tweak_data.group_ai.skirmish.recon.groups = recon_groups
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
	self.wave_modifiers[6] = {{class = "ModifierDozerMedic"}}
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