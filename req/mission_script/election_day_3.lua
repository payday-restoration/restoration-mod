local swat_overkill_table_pj = {
	"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local jerome_dude = (difficulty == 8 and "units/payday2/characters/ene_city_guard_3/ene_city_guard_3" or difficulty == 7 and "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3") or "units/payday2/characters/ene_security_3/ene_security_3"	
local swat_overkill = (pro_job and swat_overkill_table_pj)
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
local hunt_projob = pro_job

local swat_ovk_pj = {
	values = {
        enemy = swat_overkill
	}
}

return {
	--Pro Job PONR+Endless assault
	[104701] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	[104650] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--Shotgun Man in Sec Room
	[104279] = {
		values = {
			enemy = jerome_dude	
		}
	},
	--Titan SWATs replacing some harrasers on OVK PJ (with occasional Titan Sniper)
	[100208] = swat_ovk_pj,
	[100209] = swat_ovk_pj,
	[100212] = swat_ovk_pj,
	[100213] = swat_ovk_pj,
	[100304] = swat_ovk_pj,
	[100305] = swat_ovk_pj,
	[100309] = swat_ovk_pj,
	[100311] = swat_ovk_pj,
	[103339] = swat_ovk_pj,
	[103340] = swat_ovk_pj,
	[103341] = swat_ovk_pj,
	[103342] = swat_ovk_pj
}