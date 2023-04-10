local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

jerome_dude = ""
smg_dude = ""

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"
		smg_dude = "units/payday2/characters/ene_security_2/ene_security_2"	
	elseif tweak_data:difficulty_to_index(difficulty) == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
		smg_dude = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		jerome_dude = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
		smg_dude = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
	end

return {
	--Shotgun Man in Sec Room
	[100211] = {
		values = {
			enemy = jerome_dude	
		}
	},
	[102096] = {
		values = {
			enemy = smg_dude
		}
	}
}