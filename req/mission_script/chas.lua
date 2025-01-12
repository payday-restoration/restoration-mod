local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer = (difficulty == 8 and 100) or 75
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 540 or (difficulty == 6 or difficulty == 7) and 480) or 420

local enable = {
	values = {
		enabled = true
	}
}
local sniper_trigger_times = {
	values = {
        trigger_times = 0
	}
}

return {
	--Pro Job PONR
	[100818] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--Should fix enemies getting stuck
	[101088] = enable,
	[101238] = enable,
	[100999] = enable,
	[101265] = enable,
	[101262] = enable,
	[101264] = enable,
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
	--Technically should fix softlock when blowtorch interactions are unavailable. Also player can't abuse keys in loud
	[102704] = {
		on_executed = {
			{id = 101278, delay = 0}
		}
	},
	--Allow plant c4 when escape sequence is started (At least this works when player picked up c4 before escape trigger)
	[102146] = {
		values = {
			enabled = false
		}
	},
	[100821] = {
		values = {
			trigger_times = 1
		}
	},
	[102127] = {
		values = {
			trigger_times = 1
		}
	},
	--Always comment that all c4 are placed (why it's chance based to begin with, Overkill...)
	[103810] = {
		values = {
            chance = 100
		}
	},
	-- Need for scripted dozer changes
	[103809] = {
		on_executed = {
			{id = 102869, delay = 0}
		}
	},
	-- 100% chance to spawn dozer on DS
	[102869] = {
		values = {
            chance = chance_dozer
		}
	},
	--Dozer gets repositioned to the boat loot drop point
	[102870] = {
		values = {
			position = Vector3(-4627, 5521, -400),
			rotation = Rotation(140, 0, -0)
		}
	},
	--Reinforce spots
	[101190] = {
		reinforce = {
			{
				name = "store_front1",
				force = 3,
				position = Vector3(-2000, 300, -10)
			},
			{
				name = "store_front2",
				force = 3,
				position = Vector3(-1000, 300, -10)
			}
		}
	},
	[101647] = {
		reinforce = {
			{
				name = "store_front2"
			},
			{
				name = "back_alley",
				force = 3,
				position = Vector3(-1400, 4900, 540)
			}
		}
	}
}