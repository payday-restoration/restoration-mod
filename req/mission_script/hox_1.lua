local fbi_swats = {
    "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
    "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"
}
local gensec_swats = {
    "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
    "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
}
local zeal_swats = {
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
    "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
    "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local oops_all_titanswats = math.random() < 0.45
local swat = (difficulty == 8 and zeal_swats or difficulty == 7 and gensec_swats or (difficulty == 6 or difficulty == 5) and fbi_swats)
local swat_harasser = {
	values = {
        	enemy = swat
	}
}
return {
    --Diff scaling SWAT harrasers next to cop cars that replace beat cops on higher diffs
    [102029] = swat_harasser,
    [102031] = swat_harasser,
    [102033] = swat_harasser,
    [102035] = swat_harasser,
    [102037] = swat_harasser,
    [102039] = swat_harasser,
    [102041] = swat_harasser,
    [102043] = swat_harasser
}