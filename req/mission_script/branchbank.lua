local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local teargaschopper = (difficulty >= 6 and 2) or 1
local teargas = ((pro_job and difficulty >= 4) and 2) or 1
local teargasmayhem = ((pro_job and difficulty == 8) and 4) or 3
local vaultdoor = (difficulty == 8 and 100) or 45
local copcars = (difficulty >= 7 and 2) or 1
local snipers = (difficulty == 8 and 3 or (difficulty == 7 or difficulty == 6) and 2) or 1
local bulldozer = ((pro_job and difficulty == 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
local titanswat = ((pro_job and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
local woman_spooc = ((pro_job and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")

local ponr = {
	on_executed = {
		{ id = 400021, delay = 0, },
	},
}
local spooc = {
	values = {
		enabled = true,
		enemy = woman_spooc,
	},
}

return {
	-- Pro Job PONR
	-- Triggers once both A) whisper state is off (on alarm), and B) a player has entered the vault
	[105384] = ponr,
	[101321] = ponr,
	-- Special ambush chance increase
	[103072] = {
		values = {
			chance = 75,
		},
	},
	-- Allow special ambush with only 1 player
	[105563] = {
		values = {
			player_1 = true,
		},
	},
	[105574] = {
		values = {
			player_1 = true,
		},
	},
	-- Enable max diff after 2 instead of 3 assault waves
	[101307] = {
		values = {
			amount = 2,
		},
	},
	-- Restores unused Cloaker ambush spawns + Titan Cloaker on DSPJ
	[105571] = spooc,
	[105584] = spooc,
	[105607] = spooc,
	-- More cop cars arrive on DW+ (similar to Firestarter day 3)
	[103879] = {
		values = {
			amount = copcars,
		},
	},
	-- More snipers on high difficulties
	[101200] = {
		values = {
			amount = snipers,
		},
	},
	-- Enable spawns sooner
	[103882] = {
		on_executed = {
			{ id = 100251, delay = 30, },
			{ id = 105774, delay = 20, },
		},
	},
	-- Enable all street reinforce spots when first responders arrive
	[104727] = {
		on_executed = {
			{ id = 100364, delay = 0, },
		},
	},
	[104728] = {
		on_executed = {
			{ id = 100364, delay = 0, },
		},
	},
	[104729] = {
		on_executed = {
			{ id = 100364, delay = 0, },
		},
	},
	[104730] = {
		on_executed = {
			{ id = 100364, delay = 0, },
		},
	},
	-- Don't repeat the chopper incoming dialog
	[105362] = {
		values = {
			trigger_times = 1,
		},
	},
	[105435] = {
		values = {
			trigger_times = 1,
		},
	},
	-- Always trigger the tear gas heli
	[105496] = {
		values = {
			chance = 100,
		},
	},
	-- Make the tear gas heli loop
	[100631] = {
		on_executed = {
			{ id = 101747, delay = 150, delay_rand = 120, },
		},
	},
	-- The heli1 spawn's trigger_times is set to 1, set to 0 so it can loop
	[101424] = {
		values = {
			trigger_times = 0,
		},
	},
	-- Kill chopper spawns once heli squad deploys tear gas
	[102297] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(105610)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end,
	},
	-- The vault door is always locked on DS
	[100195] = {
		values = {
			chance = vaultdoor,
		},
	},
	[100196] = {
		values = {
			chance = vaultdoor,
		},
	},
	-- Pro Job stuff
	-- 2 tear gas choppers instead of 1
	[105610] = {
		values = {
			amount = teargaschopper,
		},
		on_executed = {
			{ id = 105496, delay = 15, },
		},
	},
	-- More rooms filled with tear gas
	[102195] = {
		values = {
			amount = teargas,
		},
	},
	[101355] = {
		values = {
			amount = teargasmayhem,
		},
	},
	-- Heli spawns
	[101785] = {
		values = {
			enemy = bulldozer,
		},
	},
	[101432] = {
		values = {
			enemy = titanswat,
		},
	},
	[101433] = {
		values = {
			enemy = titanswat,
		},
	}
}
