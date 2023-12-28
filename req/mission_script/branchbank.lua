local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local bulldozer_1 = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
local bulldozer_2 = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local teargaschopper = 1
local teargas = 1
local teargasmayhem = 2
local vaultdoor = 66

	if difficulty_index == 8 then
		bulldozer_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"
		bulldozer_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"
	end

	if difficulty_index <= 5 then
		ponr_value = 720
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 660	
	else
		ponr_value = 600
	end
	
if Global.game_settings and Global.game_settings.one_down then
	teargas = 2
	teargasmayhem = 3
	teargaschopper = 2
	vaultdoor = 100
	if difficulty_index == 8 then
		bulldozer_1 = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		bulldozer_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"
		titanswat =  "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		teargasmayhem = 4
	end
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
	[104452] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[104715] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[104716] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Special ambush chance increase
	[103072] = {
		values = {
			chance = 75
		}
	},
	[105563] = {
		values = {
			player_1 = true
		}
	},
	[105574] = {
		values = {
			player_1 = true
		}
	},
	-- Enable spawns sooner
	[103882] = {
		on_executed = {
			{ id = 100251, delay = 30 },
			{ id = 105774, delay = 20 }
		}
	},
	-- Enable all street reinforce spots when first responders arrive
	[104727] = {
		on_executed = {
			{ id = 100364, delay = 0 }
		}
	},
	[104728] = {
		on_executed = {
			{ id = 100364, delay = 0 }
		}
	},
	[104729] = {
		on_executed = {
			{ id = 100364, delay = 0 }
		}
	},
	[104730] = {
		on_executed = {
			{ id = 100364, delay = 0 }
		}
	},
	--Don't repeat the same dialog with chopper deploying units and/or telling about the tear gas
	[105362] = {
		values = {
			trigger_times = 1
		}
	},
	[105435] = {
		values = {
			trigger_times = 1
		}
	},
	--Pro Job Stuff
	--The vault door is always locked
	[100195] = {
		values = {
			chance = vaultdoor
		}
	},
	[100196] = {
		values = {
			chance = vaultdoor
		}
	},
	--2 tear gas choppers instead of 1
	[105610] = {
		values = {
			amount = teargaschopper
		}
	},
	--More rooms filled with tear gas
	[102195] = {
		values = {
			amount = teargas
		}
	},
	[101355] = {
		values = {
			amount = teargasmayhem
		}
	},
	--Heli spawns
	[101785] = {
		values = {
			enemy = bulldozer_1
		}
	},
	[101786] = {
		values = {
			enemy = bulldozer_2
		}
	},
	[101432] = {
		values = {
			enemy = titanswat
		}
	},
	[101433] = {
		values = {
			enemy = titanswat
		}
	}
}