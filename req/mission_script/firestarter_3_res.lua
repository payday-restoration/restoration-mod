local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local teargaschopper = (difficulty >= 6 and 2) or 1
local teargas = ((pro_job and difficulty >= 4) and 2) or 1
local teargasmayhem = ((pro_job and difficulty == 8) and 4) or 3
local vaultdoor = (difficulty == 8 and 100) or 45
local copcars = (difficulty >= 7 and 2) or 1
local snipers = (difficulty == 8 and 3 or (difficulty == 7 or difficulty == 6) and 2)
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
local bulldozer = ((pro_job and difficulty == 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
local titanswat = ((pro_job and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
local woman_spooc = ((pro_job and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")

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
local spooc = {
	values = {
		enabled = true,
		enemy = woman_spooc
	}
}

return {
	--Pro Job PONR, triggers when the fire is done, should probably trigger when the vault opens instead
	[100872] = {
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
	-- Enable max diff after 2 instead of 3 assault waves
	[101307] = {
		values = {
			amount = 2
		}
	},
	--Restores unused cloaker ambush spawns+Titan Cloaker on DSPJ
	[105571] = spooc,
	[105584] = spooc,
	[105607] = spooc,
	--more snipers on high diffs
	[101200] = {
		values = {
			amount = snipers
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
	--The vault door is always locked on DS
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
	--Pro Job Stuff
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
			enemy = bulldozer
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