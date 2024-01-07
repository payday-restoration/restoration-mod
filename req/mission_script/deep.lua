local timer_achievement = 20
local we_single_now = Global.game_settings and Global.game_settings.single_player

if we_single_now then
	timer_achievement = 200
end

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
	[100368] = {
		values = {
            trigger_times = 0
		}
	},
	[100369] = {
		values = {
            trigger_times = 0
		}
	},
	[100370] = {
		values = {
            trigger_times = 0
		}
	},
	[100371] = {
		values = {
            trigger_times = 0
		}
	},
	[100372] = {
		values = {
            trigger_times = 0
		}
	},
	[100373] = {
		values = {
            trigger_times = 0
		}
	},
	[100374] = {
		values = {
            trigger_times = 0
		}
	},
	[100375] = {
		values = {
            trigger_times = 0
		}
	},
	[100376] = {
		values = {
            trigger_times = 0
		}
	},
	[100377] = {
		values = {
            trigger_times = 0
		}
	},
	-- Increase spawn group intervals in pipe arena
	[105278] = {
		values = {
			interval = 15
		}
	},
	[102086] = {
		values = {
			interval = 15
		}
	},
	[103986] = {
		values = {
			interval = 15
		}
	},
	[101777] = {
		values = {
			interval = 15
		}
	},
	[101778] = {
		values = {
			interval = 15
		}
	}
}