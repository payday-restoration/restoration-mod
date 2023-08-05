local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		sfpd_dozer = "units/pd2_mod_fbi/characters/ene_bulldozer_3/ene_bulldozer_3"
	end	
	
	if tweak_data:difficulty_to_index(difficulty) == 7 then
		sfpd_sniper = "units/pd2_mod_fbi/characters/ene_sniper_3/ene_sniper_3"
	end

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540	
	end

return {
	--Pro Job PONR 
	[100818] = {
		ponr = ponr_value
	},
	--SFPD Specials
	[102870] = {
		values = {
            enemy = sfpd_dozer
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
	[100374] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[101190] = {
		reinforce = {
			{
				name = "store_front1",
				force = 3,
				position = Vector3(-2000, 300, -10)
			},
			{
				name = "store_front2",
				force = 3,
				position = Vector3(-1000, 300, -10)
			}
		}
	},
	[101647] = {
		reinforce = {
			{
				name = "store_front2"
			},
			{
				name = "back_alley",
				force = 3,
				position = Vector3(-1400, 4900, 540)
			}
		}
	}
}