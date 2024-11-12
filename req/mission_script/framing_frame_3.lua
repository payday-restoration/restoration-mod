local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job

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
local access_fix = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
}
return {
	--Pro Job PONR 
	[100930] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--PONR for stealth
	[104156] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value * 2
	},
	--prevent dozers/shields from disabling the power (Are we living in PDTH.....again?)
	[104699] = access_fix,
	[104700] = access_fix,
	[104701] = access_fix,
	[104702] = access_fix,
	[104703] = access_fix,
	[104704] = access_fix,
	[104705] = access_fix,
	[104706] = access_fix,
	[104707] = access_fix,
	[104708] = access_fix,
	--Spawn snipers after 150 seconds of starting the assault
	[103812] = { 
		on_executed = {
			{id = 400017, delay = 150}
		}
	},
	[100318] = { 
		on_executed = {
			{id = 105543, delay = 1}
		}
	},
	--fix vent covers not dropping when cloaker spawns in
	[104773] = {
		values = {
			elements = {
				104183
			}
		}
	},
	[104623] = {
		values = {
			elements = {
				104173
			}
		}
	},
	[104767] = {
		values = {
			elements = {
				104180
			}
		}
	},
	--Disable unnecceary invulnerability for patrol guard
	[105930] = {
		values = {
			invulnerable = false
		}
	},
	-- Fix power cut SO delay and add some random delay
	[104685] = {
		values = {
			base_delay = 15,
			base_delay_rand = 15
		}
	},
	-- Always have 3 power boxes to defend regardless of difficulty, cause 5 power boxes is already pain in the ass
	[104661] = {
		values = {
			amount = 3
		}
	},
	[105352] = {
		values = {
			amount = 3
		}
	},
	-- Don't play the "Ah, that's the vault guys" dialogue if vault has been opened in stealth
	--[[[105757] = {
		values = {
			enabled = false
		},
		on_executed = {
			{id = 105221, delay = 0}
		}
	},
	[100750] = {
		on_executed = {
			{id = 105757, delay = 0}
		}
	},	]]--
	--Activate zipline when wine is picked up
	[105900] = {
		values = {
			counter_target = 1
		}--[[,--This enable waypoint.
		on_executed = {
			{id = 104569, delay = 0}
		}]]--
	},
	--Wine now giving it's bag value if secured by zipline
	[105224] = {
		values = {
			operation = "secure"
		}
	}
}