local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 330
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 300
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 270
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 240
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 210
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 180
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[104979] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- Replace bulldozers with their murky counterparts
	--1st chopper, right after the ambush
	[103095] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		}
	},
	[103097] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		}
	},
	[103087] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103096] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[102190] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[100621] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--2nd chopper, when the gang is in the slaughterhouse
	[103088] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		}
	},
	[103090] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		}
	},
	[103091] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103092] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103093] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[103094] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli" --thank me later, :))))))))))))))))))
		}
	},
	--gensec van
	[101241] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		}
	},
	[101242] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[101243] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--security guards
	[101375] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
		}
	},
	[101376] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
		}
	},
	--murky shotgunners
	[103084] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[103086] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101082] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101083] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101827] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101829] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101904] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101906] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101857] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	[101852] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		}
	},
	--disables the Swat Turret
	[100305] = {
		values = {
            enabled = false
		}
	}
}