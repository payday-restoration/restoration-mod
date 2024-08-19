local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	--OMNIA Crewman on DS
	if difficulty == 8 then
		omnia_crewman_1 = "units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew"
		omnia_crewman_2 = "units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2"
		omnia_sniper_1 = "units/pd2_mod_omnia/characters/ene_omnia_sniper/ene_omnia_sniper"
		omnia_sniper_2 = "units/pd2_mod_omnia/characters/ene_omnia_sniper_2/ene_omnia_sniper_2"
	end

local o_sniper_1 = {
	values = {
        enemy = omnia_sniper_1
	}
}
local o_sniper_2 = {
	values = {
        enemy = omnia_sniper_2
	}
}
local o_guard_1 = {
	values = {
        enemy = omnia_crewman_1
	}
}
local o_guard_2 = {
	values = {
        enemy = omnia_crewman_2
	}
}	

return {
	--Omnia Scripted Spawns
	--Snipers
	[100584] = o_sniper_1,
	[100587] = o_sniper_1,
	[100604] = o_sniper_2,
	[100622] = o_sniper_1,
	[100618] = o_sniper_2,
	[100626] = o_sniper_2,
	--Guards
	[100085] = o_guard_2,
	[100220] = o_guard_2,
	[100711] = o_guard_1,
	[100718] = o_guard_1,
	[100719] = o_guard_1,
	[100724] = o_guard_2,
	[100725] = o_guard_2,
	[100739] = o_guard_1,
	[100694] = o_guard_2,
	[100695] = o_guard_2,
	[100755] = o_guard_1,
	[100769] = o_guard_1,
	[100770] = o_guard_2,
	[100826] = o_guard_2,
	[100827] = o_guard_1,
	[100891] = o_guard_1,
	[100892] = o_guard_2,
	[100899] = o_guard_2,
	[100903] = o_guard_1,
	[100904] = o_guard_1
}