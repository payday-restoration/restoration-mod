local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"	
	elseif difficulty_index == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
	else
		jerome_dude = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
	end

	if difficulty_index <= 5 then
		ponr_value = 360	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end
	
if Global.game_settings and Global.game_settings.one_down then
	australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
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
	},
	[100208] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100209] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100212] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100213] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100304] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100305] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100309] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100311] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103339] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103340] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103341] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103342] = {
		values = {
            enemy = australian_sniper
		}
	}
}