local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

gensec_rifle = ""
gensec_smg = ""
gensec_heavy = ""
gensec_dozer = ""

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
		gensec_heavy = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
		gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_heavy = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_heavy = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end

	if tweak_data:difficulty_to_index(difficulty) <= 3 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 4 or tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 780
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 740
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 690
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[100329] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	--GenSec Scripted Spawns
	--Drivers
	[100279] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100281] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100280] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100282] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100283] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100284] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100285] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100286] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100287] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100288] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100289] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100290] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100291] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100292] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100293] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100294] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100295] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100296] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100297] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100298] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100299] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100300] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100301] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100302] = {
		values = {
            enemy = gensec_smg
		}
	},
	--Protection Teams (seems to be unused???? Still, it's better to replace it)
	[100522] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100523] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100526] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100527] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100530] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100531] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100532] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100534] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100535] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100536] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100538] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100539] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100540] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100542] = {
		values = {
            enemy = gensec_heavy
		}
	},
	[100543] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100544] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100524] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100525] = {
		values = {
            enemy = gensec_rifle
		}
	},
	--Van Bulldozers
	[102058] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[102068] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[102057] = {
		values = {
            enemy = gensec_dozer
		}
	}
}