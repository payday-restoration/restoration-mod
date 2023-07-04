local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_1 = 330
		ponr_value_2 = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_1 = 300
		ponr_value_2 = 660
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_1 = 270
		ponr_value_2 = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_1 = 240
		ponr_value_2 = 600
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_1 = 210
		ponr_value_2 = 570
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_1 = 180
		ponr_value_2 = 540
	end
	
if tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		titan_shield_pj = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end	
end

return {
	--Pro Job PONR 
	[102644] = {
		ponr = ponr_value_1
	},
	[102654] = {
		ponr = ponr_value_1
	},
	[101899] = {
		ponr = ponr_value_2
	},
	[101907] = {
		ponr = ponr_value_2
	},
	--Replace shields that cover the manhole with titan counterparts on Mayhem-DS PJ
	[100670] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100670] = {
		values = {
            enemy = titan_shield_pj
		}
	},
	[100670] = {
		values = {
            enemy = titan_shield_pj
		}
	},
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