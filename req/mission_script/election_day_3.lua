local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local jerome_dude = (difficulty == 8 and "units/payday2/characters/ene_city_guard_3/ene_city_guard_3" or difficulty == 7 and "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3") or "units/payday2/characters/ene_security_3/ene_security_3"	
local australian_sniper = (pro_job and "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300

local tsniper = {
	values = {
        enemy = australian_sniper
	}
}

return {
	--Pro Job PONR 
	[104701] = {
		ponr = ponr_value
	},
	[104650] = {
		ponr = ponr_value
	},
	--Shotgun Man in Sec Room
	[104279] = {
		values = {
			enemy = jerome_dude	
		}
	},
	--The thing i mentioned above
	[100208] = tsniper,
	[100209] = tsniper,
	[100212] = tsniper,
	[100213] = tsniper,
	[100304] = tsniper,
	[100305] = tsniper,
	[100309] = tsniper,
	[100311] = tsniper,
	[103339] = tsniper,
	[103340] = tsniper,
	[103341] = tsniper,
	[103342] = tsniper
}