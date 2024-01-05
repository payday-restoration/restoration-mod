local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	--security rooms should always have the shotgun guard
	if difficulty_index <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"
		smg_dude = "units/payday2/characters/ene_security_2/ene_security_2"	
	elseif difficulty_index == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
		smg_dude = "units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"	
	else
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
	},
	-- Set difficulty
	[100648] = {
		difficulty = 0.5
	},
	[101961] = {
		values = {
			difficulty = 0.5
		}
	},
	[100812] = {
		values = {
			difficulty = 0.5
		},
		on_executed = {
			{ id = 101495, delay = 0 }
		}
	}
}