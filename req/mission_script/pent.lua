local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if tweak_data:difficulty_to_index(difficulty) == 7 then
		sfpd_sniper = "units/pd2_mod_fbi/characters/ene_sniper_3/ene_sniper_3"
	end

if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1290
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1260
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1260
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1230
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1230
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1200
	end

return {
	--Pro Job PONR 
	[101226] = {
		ponr = ponr_value
	},
	--SFPD Specials
	[100368] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100369] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100370] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100371] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100372] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100373] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[103595] = {
		reinforce = {
			{
				name = "main_room",
				force = 3,
				position = Vector3(300, -1600, 12100)
			}
		}
	},
	[103831] = {
		reinforce = {
			{
				name = "main_room"
			},
			{
				name = "helipad",
				force = 3,
				position = Vector3(1600, -1600, 13100)
			}
		}
	}
}