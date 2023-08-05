local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		sfpd_dozer = "units/pd2_mod_fbi/characters/ene_bulldozer_3/ene_bulldozer_3"
		sfpd_swat_1 = "units/pd2_mod_fbi/characters/ene_city_swat_1/ene_city_swat_1"
		sfpd_swat_2 = "units/pd2_mod_fbi/characters/ene_city_swat_2/ene_city_swat_2"
		sfpd_swat_3 = "units/pd2_mod_fbi/characters/ene_city_swat_3/ene_city_swat_3"
		sfpd_swat_heavy_1 = "units/pd2_mod_fbi/characters/ene_city_heavy_g36/ene_city_heavy_g36"
	end	
	
	if tweak_data:difficulty_to_index(difficulty) == 7 then
		sfpd_sniper = "units/pd2_mod_fbi/characters/ene_sniper_3/ene_sniper_3"
	end


return {
	--SFPD Units
	[101767] = {
		values = {
            enemy = sfpd_dozer
		}
	},
	[101772] = {
		values = {
            enemy = sfpd_dozer
		}
	},
	[105006] = {
		values = {
            enemy = sfpd_swat_3
		}
	},
	[105011] = {
		values = {
            enemy = sfpd_swat_3
		}
	},
	[105015] = {
		values = {
            enemy = sfpd_swat_1
		}
	},
	[105018] = {
		values = {
            enemy = sfpd_swat_2
		}
	},
	[105023] = {
		values = {
            enemy = sfpd_swat_2
		}
	},
	[105035] = {
		values = {
            enemy = sfpd_swat_3
		}
	},
	[105040] = {
		values = {
            enemy = sfpd_swat_1
		}
	},
	[105044] = {
		values = {
            enemy = sfpd_swat_1
		}
	},
	[105047] = {
		values = {
            enemy = sfpd_swat_2
		}
	},
	[105052] = {
		values = {
            enemy = sfpd_swat_1
		}
	},
	[103732] = {
		values = {
            enemy = sfpd_swat_heavy_1
		}
	},
	[105056] = {
		values = {
            enemy = sfpd_swat_heavy_1
		}
	},
	[105061] = {
		values = {
            enemy = sfpd_swat_heavy_1
		}
	},
	[105065] = {
		values = {
            enemy = sfpd_swat_2
		}
	},
	[105068] = {
		values = {
            enemy = sfpd_swat_2
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
	[100374] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100375] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100376] = {
		values = {
            enemy = sfpd_sniper
		}
	},
	[100377] = {
		values = {
            enemy = sfpd_sniper
		}
	}
}