local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local blow_the_wall_chance = 50
	
	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value = 1080
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020	
	end
	
	if difficulty == 6 or difficulty == 7 then
		blow_the_wall_chance = 80
	elseif difficulty == 8 then
		blow_the_wall_chance = 100
	end
	
	--Increase the time lock timers on mayhem above
	if difficulty >= 6 then
		timelock_normal = 240
		timelock_fast = 210
	end

--IF we're in Pro Job, then do the stuff below
if pro_job then
	--Have Heavies be a thing from the start, with FBI Heavies spawning from Hard and Titan Snipers on Overkill above
		swat_normal = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_hard = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_overkill = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
	
	--Titan snipers in C4 route for DSPJ
	if difficulty == 8 then
		titan_sniper_c4 = "units/pd2_dlc_vip/characters/ene_titan_sniper_scripted/ene_titan_sniper_scripted"
	end

	--Increase the time lock timers on all diffs
	if difficulty <= 5 then
		timelock_normal = 240
		timelock_fast = 210
	else
		timelock_normal = 300
		timelock_fast = 270
	end	
end

local timelock_access = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
}	
local swat_n = {
	values = {
        enemy = swat_normal
	}
}
local swat_h = {
	values = {
        enemy = swat_hard
	}
}
local swat_ovk = {
	values = {
        enemy = swat_overkill
	}
}
local titan_sniper = {
	values = {
        enemy = titan_sniper_c4
	}
}

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
	--Pro Job PONR. Heli and van timers increased
	--Helicopter
	--Spawn Defend Shields when the chopper arrives
	[105804] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 300,
		on_executed = {
			{ id = 400035, delay = 0 },
			{ id = 400036, delay = 0 },
			{ id = 400037, delay = 0 }
		}
	},
	--Van
	[103405] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 300
	},
	--C4 route
	[101373] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Bus
	[104782] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Elevator
	[101391] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	}, 
	-- Make server hack guranteed when solo
	[104494] = {
		pre_func = function (self)
			if table.size(managers.network:session():peers()) == 0 then
				self._chance = 100
			end
		end
	},
	--Disable Titan Cams
	[106265] = {
		values = {
			enabled = false
		}
	},
	--Prevent shields/dozers from disabling the timelock (Are we living in PDTH?)
	[101195] = timelock_access,
	[102268] = timelock_access,
	--Trigger dozers if the manager has been killed
	--Spawn beat cops after 5 seconds of cops arrival
	--enable spawngroups after 20 seconds
	[101967] = {
		on_executed = {
			{ id = 400001, delay = 20 },
			{ id = 400002, delay = 20 },
			{ id = 400046, delay = 200 },
			{ id = 400047, delay = 200 },
			{ id = 400049, delay = 5 },
			{ id = 100129, delay = 20 },
			{ id = 100115, delay = 18 }
		}
	},
	[100109] = {
		on_executed = {
			{ id = 100129, remove = true },
			{ id = 100115, remove = true }
		}
	},
	--Trigger custom c4 route spawns
	[101377] = {
		on_executed = {
			{ id = 400014, delay = 5 },
			{ id = 400015, delay = 5 }
		}
	},	
	--Trigger ambush cloakers when the gates open on loud
	[104397] = {
		on_executed = {
			{ id = 400042, delay = 0 }
		}
	},
	--Disable Bravos/Cloakers/Dozers spawns on startup
	[100017] = {
		on_executed = {
			{ id = 400034, delay = 3 },
			{ id = 400045, delay = 3 }
		}
	},
	--Enable Bravos/Cloakers on loud
	[100023] = {
		on_executed = {
			{ id = 400020, delay = 0 }
		}
	},
	--Spawn Bravos when opening the elevator
	[105806] = {
		on_executed = {
			{ id = 400018, delay = 0 }
		}
	},
	--Spawn Bravos when the bus crashes
	[105810] = {
		on_executed = {
			{ id = 400019, delay = 0 }
		}
	},
	--More chance for blowing up the wall/also faster time to trigger
	[102451] = {
		values = {
            chance = blow_the_wall_chance
		},
		on_executed = {
			{ id = 104386, delay = 60 }
		}
	},
	[102469] = {
		values = {
            chance = blow_the_wall_chance
		},
		on_executed = {
			{ id = 104388, delay = 60 }
		}
	},
	--Titan Snipers replace C4 route snipers on DSPJ
	[102883] = titan_sniper,
	[102893] = titan_sniper,
	[102898] = titan_sniper,
	[102901] = titan_sniper,
	--More timelock timer on higher diifs and Pro Jobs
	[103137] = {
		values = {
            time = timelock_normal
		}
	},
	[100170] = {
		values = {
            time = timelock_fast
		}
	},
	-- Enable roof spawns
	[100006] = {
		values = {
			spawn_groups = { 100019, 100007, 100692 }
		}
	},
	-- Roof spawn intervals
	[100007] = {
		values = {
			interval = 20
		}
	},
	[100692] = {
		values = {
			interval = 20
		}
	},
	--Harasser Tweaks
	[100883] = swat_n,
	[100884] = swat_h,
	[100885] = swat_ovk,
	[100332] = swat_n,
	[100334] = swat_h,
	[100336] = swat_ovk,
	[100906] = swat_n,
	[100907] = swat_h,
	[100908] = swat_ovk,
	[100922] = swat_n,
	[100923] = swat_h,
	[100924] = swat_ovk,
	[100938] = swat_n,
	[100939] = swat_h,
	[100940] = swat_ovk,
	[100954] = swat_n,
	[100955] = swat_h,
	[100956] = swat_ovk,
	[100969] = swat_n,
	[100970] = swat_h,
	[100971] = swat_ovk,
	-- Reinforce groups in front of the vault
	[105844] = {
		reinforce = {
			{
				name = "meetingroom",
				force = 2,
				position = Vector3(-3400, 1000, -600)
			},
			{
				name = "outside_vault",
				force = 2,
				position = Vector3(-3000, 500, -1000)
			}
		}
	}
}