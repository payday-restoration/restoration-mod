local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 960 or (difficulty == 6 or difficulty == 7) and 930) or 900

local fbi_access = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"fbi"})
			end
		end
}	
local window_spawn = {
	values = {
		interval = 30,
	},
}
local boat_spawn = {
	values = {
		interval = 30,
	},
}
local sniper_trigger_times = {
	values = {
		trigger_times = 0,
	},
}

local unused_sniper_trigger_times = deep_clone(sniper_trigger_times)
unused_sniper_trigger_times.values.enabled = true


return {
-- get rid of roof dozers (that are not even on the roof lmao)
	[100434] = {
		on_executed = {
			{ id = 100365, remove = true },
		},
	},
	--Pro Job PONR
	-- Butcher Crew backing you up
	-- Endless assault during rope objective
	-- a solution to end the assault :)
	[100914] = {
		ponr = ponr_value,
	},
	[100042] = {
		hunt = true,
	},
	[100926] = {
		on_executed = {
			{id = 400006, delay = 0},
		},
	},
	[100692] = {
		on_executed = {
			{ id = 400026, delay = 5},
		},
	},
	--The love story of 2 beat cops
	[101241] = fbi_access,
	[101242] = fbi_access,
	-- Gradually increase difficulty
	[100810] = {
		difficulty = 0.25
	},
	[101313] = {
		difficulty = 1
	},
	-- Spawn group intervals
	[100605] = window_spawn,
	[100177] = boat_spawn,
	[100737] = boat_spawn,
	-- make Snipers respawn and restore unused ones 
	[100525] = sniper_trigger_times,
	[100529] = sniper_trigger_times,
	[100534] = sniper_trigger_times,
	[100553] = sniper_trigger_times,
	[100557] = unused_sniper_trigger_times,
	[100520] = unused_sniper_trigger_times,
}
