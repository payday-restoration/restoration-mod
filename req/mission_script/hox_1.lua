local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local oops_all_titanswats = math.random() < 0.45
local swat_1 = ((pro_job and oops_all_titanswats and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle" or difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1" or difficulty == 7 and "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc" or (difficulty == 6 or difficulty == 5) and "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc")
local swat_2 = ((pro_job and oops_all_titanswats and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle" or difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3" or difficulty == 7 and "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc" or (difficulty == 6 or difficulty == 5) and "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
local swat_harasser_1 = {
	values = {
        	enemy = swat_1
	}
}
local swat_harasser_2 = {
	values = {
        	enemy = swat_2
	}
}
return {
    --Diff scaling SWAT harrasers next to cop cars that replace beat cops on higher diffs
    [102029] = swat_harasser_1,
    [102031] = swat_harasser_2,
    [102033] = swat_harasser_1,
    [102035] = swat_harasser_2,
    [102037] = swat_harasser_1,
    [102039] = swat_harasser_2,
    [102041] = swat_harasser_1,
    [102043] = swat_harasser_2
}