if Global.game_settings and Global.game_settings.one_down and not managers.groupai:state():whisper_mode() then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1050
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1020
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 990
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 960
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 930
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 900
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[102845] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	[100670] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100671] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100672] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[100673] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100674] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100675] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[100676] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[100677] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100678] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[100679] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"
		}
	},
	[102127] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[103124] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	},
	[103033] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[105209] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
		}
	},
	[105241] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"
		}
	}
}