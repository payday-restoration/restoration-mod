local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local dw_ds = difficulty > 6
local dw_ds_pj = dw_ds and pro_job
local ds = difficulty == 8
local ds_pj = ds and pro_job
local woman_spooc = ds_pj and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"

local enable = {
	values = {
		enabled = true,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}
local trigger_once = {
	values = {
		trigger_times = 1,
	},
}
local trigger_unlimited = {
	values = {
		trigger_times = 0,
	},
}
local ponr = {
	on_executed = {
		{ id = 400021, delay = 0, },
	},
}
local snipers_amount = {
	values = {
		amount = 1,
		amount_random = ds_pj and 3 or dw_ds and 2 or difficulty > 3 and 1 or 0,
	},
}
local cop_cars_amount = {
	values = {
		amount = 1,
		amount_random = dw_ds and 1 or 0,
	},
	func = function(self)
		if math.random() < 0.3 then
			self._values.amount = (self._values.amount or 0) + 1
		end
	end,
}
local spooc = {
	values = {
		enabled = true,
		enemy = woman_spooc,
	},
}
local special_ambush_filter = {
	values = {
		player_1 = true,
	},
}
local special_ambush_chance = {
	values = {
		chance = 75,
	},
}
local initial_reenforce = {
	on_executed = {
		{ id = 100364, delay = 0, },
	},
}
local vault_door_lock_chance = {
	values = {
		chance = (dw_ds and 65 or 45) + (pro_job and 20 or 0),
	},
}
local tear_gas_amount = {
	values = {
		amount = 1,
		amount_random = ds_pj and 3 or dw_ds and 2 or 1,
	},
}
local skylights_chance = {
	values = {
		chance = (dw_ds and 70 or difficulty > 4 and 40 or 15) + (pro_job and 10 or 0)
	},
}

return {
	-- Pro Job PONR
	-- Triggers once both A) whisper state is off (on alarm), and B) a player has entered the vault
	[105384] = ponr,
	[101321] = ponr,
	-- Special ambush chance increase
	[103072] = special_ambush_chance,
	-- Allow special ambush with only 1 player
	[105563] = special_ambush_filter,
	[105574] = special_ambush_filter,
	-- DW Trailer Skulldozer spawn event
	-- Enable the Dozer when things go loud
	[100568] = {
		on_executed = {
			{ id = 400003, delay = 0 },
		},
	},
	-- Spawn him when the far van escape gets triggered on DW/DS
	[104452] = {
		on_executed = {
			{ id = 400001, delay = 0 },
		},
	},
	-- Restores unused Cloaker ambush spawns + Titan Cloaker on DSPJ
	[105571] = spooc,
	[105584] = spooc,
	[105607] = spooc,
	-- More cop cars can arrive (similar to Firestarter day 3)
	[103879] = cop_cars_amount,
	-- More snipers on high difficulties
	[101200] = snipers_amount,
	-- Enable spawns sooner
	[103882] = {
		on_executed = {
			{ id = 100251, delay = 30, },
			{ id = 105774, delay = 20, },
		},
	},
	-- Delay the initial diff increase when spawns are enabled
	[100251] = {
		on_executed = {
			{ id = 100438, delay = 30, },
		},
	},
	-- Enable all street reinforce spots when first responders arrive
	[104727] = initial_reenforce,
	[104728] = initial_reenforce,
	[104729] = initial_reenforce,
	[104730] = initial_reenforce,
	-- Replace scripted heli spawns with a random forced spawn group
	[101427] = {
		on_executed = {
			{ id = 101432, remove = true, },
			{ id = 101434, remove = true, },
			{ id = 101435, remove = true, },
			{ id = 400004, delay = 0, },
		},
	},
	[105613] = {
		on_executed = {
			{ id = 105614, remove = true, },
			{ id = 105615, remove = true, },
			{ id = 105621, remove = true, },
			{ id = 400005, delay = 0, },
		},
	},
	-- Don't repeat the chopper incoming dialog
	[105362] = trigger_once,
	[105435] = trigger_once,
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
	[101424] = trigger_unlimited,
	-- Forbid Shields and Dozers from deploying tear gas
	[102296] = {
		so_access_filter = { "swat", "fbi", "spooc", "taser", },
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
	[105610] = {
		on_executed = {
			{ id = 105496, delay = 15, },
		},
	},
	-- More rooms filled with tear gas
	[102195] = tear_gas_amount,
	[101355] = tear_gas_amount,
	-- Escape-specific tear gas points are always enabled instead
	[102256] = enable,
	[102271] = enable,
	[102272] = enable,
	-- The interior vault gate is locked more frequently on high difficulties and Pro Jobs
	[100195] = vault_door_lock_chance,
	[100196] = vault_door_lock_chance,
	-- Skylights are always chance-based
	[104324] = skylights_chance,
	[101930] = disable,
	[101934] = {
		values = {
			difficulty_easy_wish = true,
			difficulty_overkill_290 = true,
			difficulty_sm_wish = true,
		},
	},
}
