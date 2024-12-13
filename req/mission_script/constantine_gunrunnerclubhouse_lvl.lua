local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 480 or (difficulty == 6 or difficulty == 7) and 450) or 420
local spring = "units/pd2_dlc_vip/characters/ene_spring/ene_spring"
local spring_minion_1 = (difficulty == 8 and "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun" or (difficulty == 7 or difficulty == 6) and "units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2") or "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
local spring_minion_2 = (difficulty >= 6 and "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle") or "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
local spring_minion_3 = (difficulty >= 6 and "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun") or "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
local spring_minion_4 = (difficulty >= 6 and "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper") or "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
local minions_table = {
		spring_minion_2,
		spring_minion_2,
		spring_minion_2,
		spring_minion_3,
		spring_minion_3,
		spring_minion_3,
		spring_minion_4,
		spring_minion_4
}
local Captain = {
	values = {
        enemy = spring
	}
}
local Minion_1 = {
	values = {
        enemy = spring_minion_1
    }
}
local Minion_2 = {
	values = {
        enemy = minions_table
    }
}
return {
	--Pro Job PONR+Hunt (Endless Assault)
	[100437] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--Spring squad
	--Spring himself
	[100402] = {
		values = {
            enemy = spring
		}
	},
	--Minions
	[100229] = Minion_1,
	[100221] = Minion_1,
	[100224] = Minion_1,
	[100229] = Minion_1,
	[100218] = Minion_2,
	[100258] = Minion_2,
	[100261] = Minion_2,
	[100270] = Minion_2,
	[100264] = Minion_2,
	[100222] = Minion_2,
	[100262] = Minion_2,
	[100265] = Minion_2,
	[100269] = Minion_2,
	[100225] = Minion_2,
	[100230] = Minion_2
}
