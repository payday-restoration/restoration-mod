local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local gensec_rifle = ((pro_job and difficulty <= 6) and "units/payday2/characters/ene_city_guard_1/ene_city_guard_1" or difficulty >= 7 and "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
local gensec_smg = ((pro_job and difficulty <= 6) and "units/payday2/characters/ene_city_guard_2/ene_city_guard_2" or difficulty >= 7 and "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc")
local gensec_dozer = (difficulty >= 6 and "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc")
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