local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
local gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
local gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"


	--GenSec red dudes are replaced with GenSec SWAT on DW and above
	if difficulty_index == 7 or difficulty_index == 8 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end

	--Proper diff scaling for dozers, also gets rids of ZEAL Dozers in GenSec vans cause elementspawneenemydummy diff scaling moment
	if difficulty_index == 5 or difficulty_index == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif difficulty_index == 7 or difficulty_index == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end
	
	--If we're in Pro Job, change some of the spawns
	if pro_job then
		hunt_projob = true
	--Skully boy starts to spawn on Mayhem now cause I like placing Skullies like that one map editor man in Reservoir Dogs Day 2
	if difficulty_index == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
	end
	--FTSU Agents on Mayhem below
	if difficulty_index <= 6 then
		gensec_rifle = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
		gensec_smg = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
	end
end	
		
	--Due to how bag requirements are handled (less on lower diffs, more on high diffs) have less time on lower but more time on higher diffs
	if difficulty_index <= 5 then
		ponr_value = 300
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 420	
	else
		ponr_value = 540	
	end

return {
	--Pro Job PONR+Hunt (Endless assault), triggers when van arrives cause that's better
	[101894] = {
		ponr = ponr_value,
		hunt = hunt_projob
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
	[101747] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101748] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101759] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101760] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101761] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101762] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101763] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101764] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101765] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101766] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101767] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101768] = {
		values = {
            enemy = gensec_dozer
		}
	}
}