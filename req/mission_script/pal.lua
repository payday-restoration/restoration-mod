local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 120
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 90
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 60
	end

if Global.game_settings and Global.game_settings.one_down then	
	if tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		titan_shield_pj = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end	
end

return {
	--Pro Job PONR
	[102644] = {
		ponr = ponr_value
	},
	[102654] = {
		ponr = ponr_value
	},
    [102551] = {
        ponr_end = true
    },
	--Replace shields that cover the manhole with titan counterparts on Overkill-DS PJ
	[100036] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100039] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100044] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[101848] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[101908] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[101911] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100642] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100777] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100795] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[101804] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[101883] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[102098] = {
		values = {
            enemy = titan_shield_pj
		}
	}
}