local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down

	--security rooms should always have the shotgun guard
	if difficulty <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"	
	elseif difficulty == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
	else
		jerome_dude = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
	end

	if difficulty <= 5 then
		ponr_value = 360	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end

--If we're in Pro Job, then replace some scripted heavy harrassers with Titan Snipers on ovk above 	
if pro_job then
	australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
end

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