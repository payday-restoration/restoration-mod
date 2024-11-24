local omnia_guards = {
	"units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew",
	"units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2",
	"units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew",
	"units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2",
	"units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
	"units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"
}
local omnia_snipers = {
	"units/pd2_mod_omnia/characters/ene_omnia_sniper/ene_omnia_sniper",
	"units/pd2_mod_omnia/characters/ene_omnia_sniper_2/ene_omnia_sniper_2",
	"units/pd2_mod_omnia/characters/ene_omnia_sniper/ene_omnia_sniper",
	"units/pd2_mod_omnia/characters/ene_omnia_sniper_2/ene_omnia_sniper_2",
	"units/pd2_dlc_vip/characters/ene_titan_sniper_scripted/ene_titan_sniper_scripted"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local omnia_crewman = (difficulty == 8 and omnia_guards)
local omnia_sniper = (difficulty == 8 and omnia_snipers)

local o_sniper = {
	values = {
        enemy = omnia_sniper
	}
}
local o_guard = {
	values = {
        enemy = omnia_crewman
	}
}

return {
	--Omnia Scripted Spawns
	--Snipers
	[100584] = o_sniper,
	[100587] = o_sniper,
	[100604] = o_sniper,
	[100622] = o_sniper,
	[100618] = o_sniper,
	[100626] = o_sniper,
	--Guards
	[100085] = o_guard,
	[100220] = o_guard,
	[100711] = o_guard,
	[100718] = o_guard,
	[100719] = o_guard,
	[100724] = o_guard,
	[100725] = o_guard,
	[100739] = o_guard,
	[100694] = o_guard,
	[100695] = o_guard,
	[100755] = o_guard,
	[100769] = o_guard,
	[100770] = o_guard,
	[100826] = o_guard,
	[100827] = o_guard,
	[100891] = o_guard,
	[100892] = o_guard,
	[100899] = o_guard,
	[100903] = o_guard,
	[100904] = o_guard
}