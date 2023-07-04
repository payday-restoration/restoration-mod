local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
		gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end

	if tweak_data:difficulty_to_index(difficulty) <= 4 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 780
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 740
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 690	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600	
	end
end

return {
	--Pro Job PONR 
	[100329] = {
		ponr = ponr_value
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
            enemy = gensec_smg
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
            enemy = gensec_smg
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
            enemy = gensec_smg
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
            enemy = gensec_smg
		}
	},
	[100296] = {
		values = {
            enemy = gensec_smg
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
            enemy = gensec_smg
		}
	},
	[100527] = {
		values = {
            enemy = gensec_smg
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
            enemy = gensec_smg
		}
	},
	[100542] = {
		values = {
            enemy = gensec_smg
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
	[103750] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103751] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103752] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103753] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103754] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103755] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103756] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103757] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103758] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103759] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103760] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[103761] = {
		values = {
            enemy = gensec_dozer
		}
	}
}
