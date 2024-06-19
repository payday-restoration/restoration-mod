local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local spring = "units/pd2_dlc_vip/characters/ene_spring/ene_spring"
local spring_minion_1 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
local spring_minion_2 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
local spring_minion_3 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
local spring_minion_4 = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"

	if difficulty == 6 or difficulty == 7 then
		spring_minion_1 = "units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2"
	elseif difficulty == 8 then
		spring_minion_1 = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
	end

	if difficulty >= 6 then
		spring_minion_2 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
		spring_minion_3 = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"
		spring_minion_4 = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper"
	end	

	if pro_job then
		hunt_projob = true
	end

	if difficulty <= 5 then
		ponr_value = 480	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 450
	else
		ponr_value = 420
	end

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
        enemy = spring_minion_2
    }
}
local Minion_3 = {
	values = {
        enemy = spring_minion_3
    }
}
local Minion_4 = {
	values = {
        enemy = spring_minion_4
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
	[100222] = Minion_3,
	[100262] = Minion_3,
	[100265] = Minion_3,
	[100269] = Minion_3,
	[100225] = Minion_4,
	[100230] = Minion_4
}
