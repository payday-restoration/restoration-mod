local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
--table for Colombian gangsters
local gangster_table = {
	colombian_1 = "units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1",
	colombian_2 = "units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2",
	colombian_3 = "units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3",
	colombian_enforcer = "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"
}
	
	--High PONR Timer to work with ponr player scaling
	if difficulty_index <= 5 then
		ponr_value = 1080	
	elseif difficulty_index == 6 or difficulty_index == 7 then
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
	--do this shit instead so I won't need to edit the mission file if we update Firestarter again
	[103949] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[101280] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[103186] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[103187] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[101295] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[101214] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[103946] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[100802] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[101047] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[100921] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[103955] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[103163] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[103164] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[102442] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[102682] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[102443] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[102445] = {
		values = {
            enemy = gangster_table.colombian_1
		}
	},
	[100012] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[100013] = {
		values = {
            enemy = gangster_table.colombian_2
		}
	},
	[103179] = {
		values = {
            enemy = gangster_table.colombian_3
		}
	},
	[101023] = {
		values = {
            enemy = gangster_table.colombian_enforcer
		}
	},
	[100756] = {
		values = {
            enemy = gangster_table.colombian_enforcer
		}
	},
	[102330] = {
		values = {
            enemy = gangster_table.colombian_enforcer
		}
	}
}