local gensec_agents = {
	"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
	"units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
}
local gensec_swat = {
	"units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
	"units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local gensec_guards = ((pro_job and difficulty <= 6) and gensec_agents or difficulty >= 7 and gensec_swat)
local gensec_dozer = (difficulty >= 6 and "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc")
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 420) or 540
		
local gensec = {
	values = {
        enemy = gensec_guards
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
	[100279] = gensec,
	[100281] = gensec,
	[100280] = gensec,
	[100282] = gensec,
	[100283] = gensec,
	[100284] = gensec,
	[100285] = gensec,
	[100286] = gensec,
	[100287] = gensec,
	[100288] = gensec,
	[100289] = gensec,
	[100290] = gensec,
	[100291] = gensec,
	[100292] = gensec,
	[100293] = gensec,
	[100294] = gensec,
	[100295] = gensec,
	[100296] = gensec,
	[100297] = gensec,
	[100298] = gensec,
	[100299] = gensec,
	[100300] = gensec,
	[100301] = gensec,
	[100302] = gensec,
	--Protection Teams (seems to be unused???? Still, it's better to replace it)
	[100522] = gensec,
	[100523] = gensec,
	[100526] = gensec,
	[100527] = gensec,
	[100530] = gensec,
	[100531] = gensec,
	[100532] = gensec,
	[100534] = gensec,
	[100535] = gensec,
	[100536] = gensec,
	[100538] = gensec,
	[100539] = gensec,
	[100540] = gensec,
	[100542] = gensec,
	[100543] = gensec,
	[100544] = gensec,
	[100524] = gensec,
	[100525] = gensec,
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