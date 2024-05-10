local timer_achievement = 20
local solo = Global.game_settings and Global.game_settings.single_player

if solo then
	timer_achievement = 200
end
local sniper_trigger_times = {
	values = {
        trigger_times = 0
	}
}
local medium_interval = {
	values = {
			interval = 15
		}
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
	-- Increase spawn group intervals in pipe arena
	[105278] = medium_interval,
	[102086] = medium_interval,
	[103986] = medium_interval,
	[101777] = medium_interval,
	[101778] = medium_interval
}