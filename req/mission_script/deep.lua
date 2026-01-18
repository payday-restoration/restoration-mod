local solo = Global.game_settings and Global.game_settings.single_player
local timer_achievement = (solo and 200) or 20

local sniper_trigger_times = {
	values = {
        trigger_times = 0
	},
}
local medium_interval = {
	values = {
			interval = 20
		},
}
local catwalk_spawn = {
	values = {
		interval = 20
	},	
}
local lab_spawn = {
	values = {
		interval = 30
	},
}
local bridge_spawn = {
	values = {
		interval = 20
	},
}
local slide_gate = {
	values = {
		interval = 20 
	},
}
return {
	-- Increase PONR timers, seriously there are a lot of skulldozers on high diffs especially with 2 pushover minidozers at the end on DS (luckily they are bendozers)
	[102646] = {
		values = {
			time_normal = 300,
			time_hard = 300,
			time_overkill = 300,
			time_overkill_145 = 300,
			time_easy_wish = 300,
			time_overkill_290 = 300,
			time_sm_wish = 300
		},
		on_executed = {
		{ id = 101623, delay = 299.8 }
		}
	},
	[104949] = {
		on_executed = {
		{ id = 104945, delay = 180 }
		}
	},
	-- Timer for achievement is increased in solo offline
	[103532] = {
		values = {
			timer = timer_achievement
		}
	},
	[103542] = {
		values = {
			time = timer_achievement
		}
	},
	--Fixed snipers being able to spawn only once
	[100368] = sniper_trigger_times,
	[100369] = sniper_trigger_times,
	[100370] = sniper_trigger_times,
	[100371] = sniper_trigger_times,
	[100372] = sniper_trigger_times,
	[100373] = sniper_trigger_times,
	[100374] = sniper_trigger_times,
	[100375] = sniper_trigger_times,
	[100376] = sniper_trigger_times,
	[100377] = sniper_trigger_times,
	-- spawn group intervals in pipe arena
	[105278] = medium_interval,
	[102086] = medium_interval,
	[103986] = medium_interval,
	[101777] = medium_interval,
	[101778] = medium_interval,
	-- catwalk spawngroup 
	[100132] = catwalk_spawn,
	-- lab spawngroup 
	[104573] = lab_spawn,
	-- bridge spawngroups 
	[101770] = bridge_spawn, 
	[101775] = bridge_spawn,
	[101776] = bridge_spawn,
	[101769] = bridge_spawn,
	-- slide gate spawngroups 
	[104030] = slide_gate,

}