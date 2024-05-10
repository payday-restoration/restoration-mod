local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
local gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
local gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"

	--GenSec red dudes are replaced with GenSec SWAT on DW and above
	if difficulty == 7 or difficulty == 8 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end

	--Proper diff scaling for dozers, also gets rids of ZEAL Dozers in GenSec vans cause elementspawneenemydummy diff scaling moment
	if difficulty == 5 or difficulty == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif difficulty == 7 or difficulty == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end
	
	--If we're in Pro Job, change some of the spawns
	if pro_job then
		hunt_projob = true
	--Skully boy starts to spawn on Mayhem now cause I like placing Skullies like that one map editor man in Reservoir Dogs Day 2
	if difficulty == 6 then
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

return {
	--Pro Job PONR+Hunt (Endless assault), triggers when van arrives cause that's better
	[101894] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
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
	[101747] = gensec_tank,
	[101748] = gensec_tank,
	[101759] = gensec_tank,
	[101760] = gensec_tank,
	[101761] = gensec_tank,
	[101762] = gensec_tank,
	[101763] = gensec_tank,
	[101764] = gensec_tank,
	[101765] = gensec_tank,
	[101766] = gensec_tank,
	[101767] = gensec_tank,
	[101768] = gensec_tank
}