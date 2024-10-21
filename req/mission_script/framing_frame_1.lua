local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local jerome_dude = (difficulty == 8 and "units/payday2/characters/ene_city_guard_3/ene_city_guard_3" or difficulty == 7 and "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3") or "units/payday2/characters/ene_security_3/ene_security_3"
local smg_dude = (difficulty == 8 and "units/payday2/characters/ene_city_guard_2/ene_city_guard_2" or difficulty == 7 and "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2") or "units/payday2/characters/ene_security_2/ene_security_2"

local participate_to_groupai = {
	values = {
        participate_to_group_ai = true
	}
}
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
	[101949] = participate_to_group_ai,
	[101950] = participate_to_group_ai,
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