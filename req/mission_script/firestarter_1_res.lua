local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1080 or (difficulty == 6 or difficulty == 7) and 1050) or 1020
local colombian_table = {
		"units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1",
		"units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2",
		"units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3"
}
local gangsters = {
	values = {
		enemy = colombian_table
	}
}
local gangster_enforcer = {
	values = {
		enemy = "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"
	}
}

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}	

return {
	--Pro Job PONR 
	[101791] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Add missing hangar reinforce spots
	[103162] = {
		on_executed = {
			{ id = 101359, delay = 0 }
		}
	},
	[103211] = {
		on_executed = {
			{ id = 101360, delay = 0 }
		}
	},
	--replace some Mexican gangsters with colombians via lua instead so I won't need to edit the mission file if we update Firestarter again
	[103949] = gangsters,
	[101280] = gangsters,
	[103186] = gangsters,
	[103187] = gangsters,
	[101295] = gangsters,
	[101214] = gangsters,
	[103946] = gangsters,
	[100802] = gangsters,
	[101047] = gangsters,
	[100921] = gangsters,
	[103955] = gangsters,
	[103163] = gangsters,
	[103164] = gangsters,
	[102442] = gangsters,
	[102682] = gangsters,
	[102443] = gangsters,
	[102445] = gangsters,
	[100012] = gangsters,
	[100013] = gangsters,
	[103179] = gangsters,
	[101023] = gangster_enforcer,
	[100756] = gangster_enforcer,
	[102330] = gangster_enforcer
}