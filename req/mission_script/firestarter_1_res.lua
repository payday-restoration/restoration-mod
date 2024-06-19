local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
--table for Colombian gangsters
local gangster_table = {
	colombian_1 = "units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1",
	colombian_2 = "units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2",
	colombian_3 = "units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3",
	colombian_enforcer = "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"
}
local gangster_1 = {
	values = {
		enemy = gangster_table.colombian_1
	}
}
local gangster_2 = {
	values = {
		enemy = gangster_table.colombian_2
	}
}
local gangster_3 = {
	values = {
		enemy = gangster_table.colombian_3
	}
}
local gangster_enforcer = {
	values = {
		enemy = gangster_table.colombian_enforcer
	}
}
	
	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value = 1080	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020		
	end

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
	--replace gangsters with colombians via lua instead so I won't need to edit the mission file if we update Firestarter again
	[103949] = gangster_1,
	[101280] = gangster_1,
	[103186] = gangster_3,
	[103187] = gangster_2,
	[101295] = gangster_1,
	[101214] = gangster_3,
	[103946] = gangster_3,
	[100802] = gangster_1,
	[101047] = gangster_2,
	[100921] = gangster_2,
	[103955] = gangster_1,
	[103163] = gangster_1,
	[103164] = gangster_2,
	[102442] = gangster_2,
	[102682] = gangster_3,
	[102443] = gangster_2,
	[102445] = gangster_1,
	[100012] = gangster_3,
	[100013] = gangster_2,
	[103179] = gangster_3,
	[101023] = gangster_enforcer,
	[100756] = gangster_enforcer,
	[102330] = gangster_enforcer
}