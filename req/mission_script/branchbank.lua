--I love Majima so much
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
--Why not have a blackdozer in one of the choppers, yeah?
local bulldozer_1 = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
local bulldozer_2 = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local teargaschopper = 1
local teargas = 1
local teargasmayhem = 2
local vaultdoor = 66
local copcars = 1
local snipers = 1

	--Same in DS
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
	
	if difficulty_index >= 7 then
		copcars = 2
	end

	--More snipers cause 1 sniper on higher diffs is not enough
	if difficulty_index == 6 or difficulty_index == 7 then
		snipers = 2
	elseif difficulty_index == 8 then
		snipers = 3
	end

--If we're in Pro Job, do this stuff below
if pro_job then
	teargas = 2
	teargasmayhem = 3
	teargaschopper = 2
	vaultdoor = 100
	--the only time Omnia Bendozer spawns outside of Spring's squad (if it's not Murkywater)
	if difficulty_index == 8 then
		bulldozer_1 = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		titanswat =  "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
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
	--Pro Job PONR, triggers when the van loot secure is on, should probably trigger when the vault opens instead
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
	--Restores unused cloaker ambush spawns+Titan Cloaker on DSPJ
	[105571] = {
		values = {
			enabled = true,
			enemy = woman_spooc
		}
	},
	[105584] = {
		values = {
			enabled = true,
			enemy = woman_spooc
		}
	},
	[105607] = {
		values = {
			enabled = true,
			enemy = woman_spooc
		}
	},
	--More cop cars arrive on DW+ (similiar to Firestarter Day 3)
	[103879] = {
		values = {
			amount = copcars
		}
	},
	--more snipers on high diffs
	[101200] = {
		values = {
			amount = snipers
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
	--Made Tear Gas heli have loopable spawn
	--set this to 100% so it will always trigger the chance of tear gas heli squad
	[105496] = { 
		values = {
			chance = 100
		}
	},
	[100631] = {
		on_executed = {
			{id = 101747, delay = 150, delay_rand = 120}
		}
	},
	--the heli1 spawn's trigger_times is set to 1 for some reason, switching to 0 to make the chopper still spawn after once
	[101424] = {
		values = {
			trigger_times = 0
		}
	},
	--kill chopper spawns once heli squad deploys tear gas
	[102297] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(105610)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
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
		},
		on_executed = {
			{id = 105496, delay = 15}
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