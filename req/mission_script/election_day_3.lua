local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"	
	elseif tweak_data:difficulty_to_index(difficulty) == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		jerome_dude = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
	end

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 450
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 420	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 390
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 360	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 330	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 300		
	end
end

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
	}
}