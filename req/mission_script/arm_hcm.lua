local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
local gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
local gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
local fbiagent_1 = "units/payday2/characters/ene_fbi_1/ene_fbi_1"
local fbiagent_2 = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
local fbiagent_3 = "units/payday2/characters/ene_fbi_3/ene_fbi_3"

	--GenSec red dudes are replaced with GenSec SWAT on DW and above
	if difficulty_index >= 7 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end
	
	--Proper diff scaling for dozers, also gets rids of ZEAL Dozers in GenSec vans cause elementspawneenemydummy diff scaling moment
	if difficulty_index == 5 or difficulty_index == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif difficulty_index == 7 or difficulty_index == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end
	
	--Force Bruce replacing fbi_1 cause he's an elite version of him
	if difficulty_index == 8 then
		fbiagent_1 = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
	end	
	
	--If we're in Pro Job, change some of the spawns
	if shadow_fucked_me_hard then
		--Ready Team Agents replace Fbi_2 and 3
		fbiagent_2 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		fbiagent_3 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
	
	if difficulty_index == 6 then
		--Skully boy starts to spawn on Mayhem now cause I like placing Skullies like that one map editor man in Reservoir Dogs Day 2
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
	--Pro Job PONR, triggers when van/chopper arrives cause that's better
	[100329] = {
		ponr = ponr_value
	},
	--FBI Agents, you don't want to see Zeal HRT from FBI Suvs
	[100514] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100515] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100520] = {
		values = {
            enemy = fbiagent_1
		}
	},
	[100521] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100547] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100551] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100560] = {
		values = {
            enemy = fbiagent_1
		}
	},
	[100562] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100563] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100564] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100566] = {
		values = {
            enemy = fbiagent_1
		}
	},
	[100567] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100568] = {
		values = {
            enemy = fbiagent_1
		}
	},
	[100569] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100570] = {
		values = {
            enemy = fbiagent_3
		}
	},
	[100571] = {
		values = {
            enemy = fbiagent_2
		}
	},
	[100572] = {
		values = {
            enemy = fbiagent_1
		}
	},
	[100573] = {
		values = {
            enemy = fbiagent_3
		}
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
