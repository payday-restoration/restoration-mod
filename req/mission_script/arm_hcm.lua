local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
local gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
local gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
local fbiagent_1 = "units/payday2/characters/ene_fbi_1/ene_fbi_1"
local fbiagent_2 = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
local fbiagent_3 = "units/payday2/characters/ene_fbi_3/ene_fbi_3"

	--GenSec red dudes are replaced with GenSec SWAT on DW and above
	if difficulty >= 7 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end
	
	--Proper diff scaling for dozers, also gets rids of ZEAL Dozers in GenSec vans cause elementspawneenemydummy diff scaling moment
	if difficulty == 5 or difficulty == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif difficulty == 7 or difficulty == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end
	
	--Force Bruce replacing fbi_1 cause he's an elite version of him
	if difficulty == 8 then
		fbiagent_1 = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
	end	
	
	--If we're in Pro Job, change some of the spawns
	if pro_job then
		hunt_projob = true
		--Ready Team Agents replace Fbi_2 and 3
		fbiagent_2 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		fbiagent_3 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
	
	if difficulty == 6 then
		--Skully boy starts to spawn on Mayhem now cause I like placing Skullies like that one map editor man in Reservoir Dogs Day 2
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
	end	
	
	--FTSU Agents on Mayhem below
	if difficulty <= 6 then
		gensec_rifle = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
		gensec_smg = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
	end
end	
		
	--Due to how bag requirements are handled (less on lower diffs, more on high diffs) have less time on lower but more time on higher diffs
	if difficulty <= 5 then
		ponr_value = 300
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 420	
	else
		ponr_value = 540	
	end
local gensec_1 = {
	values = {
        enemy = gensec_rifle
	}
}
local gensec_2 = {
	values = {
        enemy = gensec_smg
	}
}
local gensec_tank = {
	values = {
        enemy = gensec_dozer
	}
}
local fbi_1 = {
	values = {
        enemy = fbiagent_1
	}
}
local fbi_2 = {
	values = {
        enemy = fbiagent_2
	}
}
local fbi_3 = {
	values = {
        enemy = fbiagent_3
	}
}
return {
	--Pro Job PONR+Hunt (Endless assault), triggers when van/chopper arrives cause that's better
	[100329] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--FBI Agents, you don't want to see Zeal HRT from FBI Suvs
	[100514] = fbi_3,
	[100515] = fbi_2,
	[100520] = fbi_1,
	[100521] = fbi_2,
	[100547] = fbi_3,
	[100551] = fbi_3,
	[100560] = fbi_1,
	[100562] = fbi_3,
	[100563] = fbi_2,
	[100564] = fbi_3,
	[100566] = fbi_1,
	[100567] = fbi_2,
	[100568] = fbi_1,
	[100569] = fbi_2,
	[100570] = fbi_3,
	[100571] = fbi_2,
	[100572] = fbi_1,
	[100573] = fbi_3,
	--GenSec Scripted Spawns
	--Drivers
	[100279] = gensec_2,
	[100281] = gensec_1,
	[100280] = gensec_2,
	[100282] = gensec_2,
	[100283] = gensec_1,
	[100284] = gensec_1,
	[100285] = gensec_2,
	[100286] = gensec_2,
	[100287] = gensec_2,
	[100288] = gensec_2,
	[100289] = gensec_1,
	[100290] = gensec_2,
	[100291] = gensec_2,
	[100292] = gensec_2,
	[100293] = gensec_1,
	[100294] = gensec_1,
	[100295] = gensec_2,
	[100296] = gensec_2,
	[100297] = gensec_2,
	[100298] = gensec_2,
	[100299] = gensec_1,
	[100300] = gensec_1,
	[100301] = gensec_1,
	[100302] = gensec_2,
	--Protection Teams (seems to be unused???? Still, it's better to replace it)
	[100522] = gensec_2,
	[100523] = gensec_2,
	[100526] = gensec_2,
	[100527] = gensec_2,
	[100530] = gensec_1,
	[100531] = gensec_2,
	[100532] = gensec_2,
	[100534] = gensec_2,
	[100535] = gensec_2,
	[100536] = gensec_1,
	[100538] = gensec_1,
	[100539] = gensec_1,
	[100540] = gensec_2,
	[100542] = gensec_2,
	[100543] = gensec_2,
	[100544] = gensec_1,
	[100524] = gensec_1,
	[100525] = gensec_1,
	--Van Bulldozers
	[103750] = gensec_tank,
	[103751] = gensec_tank,
	[103752] = gensec_tank,
	[103753] = gensec_tank,
	[103754] = gensec_tank,
	[103755] = gensec_tank,
	[103756] = gensec_tank,
	[103757] = gensec_tank,
	[103758] = gensec_tank,
	[103759] = gensec_tank,
	[103760] = gensec_tank,
	[103761] = gensec_tank
}
