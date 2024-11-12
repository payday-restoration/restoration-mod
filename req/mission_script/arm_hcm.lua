local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local gensec_rifle = ((pro_job and difficulty <= 6) and "units/payday2/characters/ene_city_guard_1/ene_city_guard_1" or difficulty >= 7 and "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
local gensec_smg = ((pro_job and difficulty <= 6) and "units/payday2/characters/ene_city_guard_2/ene_city_guard_2" or difficulty >= 7 and "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc")
local gensec_dozer = (difficulty >= 6 and "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc")
local fbiagent_2 = (difficulty >= 7 and "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1")
local fbiagent_3 = (difficulty >= 7 and "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2")
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 420) or 540
	
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
	--FBI Agents, replace them with Ready Teams on DW+
	[100514] = fbi_3,
	[100515] = fbi_2,
	[100521] = fbi_2,
	[100547] = fbi_3,
	[100551] = fbi_3,
	[100562] = fbi_3,
	[100563] = fbi_2,
	[100564] = fbi_3,
	[100567] = fbi_2,
	[100569] = fbi_2,
	[100570] = fbi_3,
	[100571] = fbi_2,
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
