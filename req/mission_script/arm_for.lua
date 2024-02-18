local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	--High PONR Timer to work with ponr player scaling
	if difficulty_index <= 5 then
		ponr_value = 1080
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020	
	end

--set up the murky bravo guards via table so it will look clean and cool
local guard_replacement = {
	elite_guard_1 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	elite_guard_2 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	elite_guard_3 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
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
	--Pro Job PONR 
	[105046] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	--replace guards with Bravo guards cause the turret and ammo are important shit to cover
	[100670] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100671] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100672] = {
		values = {
            enemy = guard_replacement.elite_guard_2
		}
	},
	[100673] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100674] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100675] = {
		values = {
            enemy = guard_replacement.elite_guard_3
		}
	},
	[100676] = {
		values = {
            enemy = guard_replacement.elite_guard_2
		}
	},
	[100677] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100678] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[100679] = {
		values = {
            enemy = guard_replacement.elite_guard_2
		}
	},
	[102127] = {
		values = {
            enemy = guard_replacement.elite_guard_3
		}
	},
	[103124] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	},
	[103033] = {
		values = {
            enemy = guard_replacement.elite_guard_3
		}
	},
	[105209] = {
		values = {
            enemy = guard_replacement.elite_guard_3
		}
	},
	[105241] = {
		values = {
            enemy = guard_replacement.elite_guard_1
		}
	}
}