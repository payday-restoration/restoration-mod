local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 90
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 70
	else
		ponr_value = 60
	end
	
	if Global.game_settings and Global.game_settings.single_player then
		ponr_value = ponr_value * 2 
	end

if Global.game_settings and Global.game_settings.one_down and difficulty_index >= 5 then	
	titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
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
	--Bain no longer will remind to find Mitchell when players masked up
	[102410] = {
		on_executed = {
            {id = 100096, delay = 0}
		}
	},
	--SWAT Van that crashes through Wilson's wall no longer deploys turret on higher diffs
	--Disables the turret
	[102821] = {
		values = {
			enabled = false
		}
	},
	[101965] = {
		values = {
			enabled = false
		}
	},
	--Forces the reinforcments to spawn instead
	[102819] = {
		values = {
			difficulty_overkill = "true",
			difficulty_overkill_145 = "true",
			difficulty_easy_wish = "true",
			difficulty_overkill_290 = "true",
			difficulty_sm_wish = "true"
		}
	},
	--Replace some Rooftop SWATs with Titan Snipers on Overkill-DS PJ
	[101735] = {
		values = {
            enemy = australian_sniper
		}
	},
	[101733] = {
		values = {
            enemy = australian_sniper
		}
	},
	--Replace shields that cover the manhole with titan counterparts on Overkill-DS PJ
	[100036] = {
		values = {
            enemy = titan_shield
		}
	},
	[100039] = {
		values = {
            enemy = titan_shield
		}
	},
	[100044] = {
		values = {
            enemy = titan_shield
		}
	},
	[101848] = {
		values = {
            enemy = titan_shield
		}
	},
	[101908] = {
		values = {
            enemy = titan_shield
		}
	},
	[101911] = {
		values = {
            enemy = titan_shield
		}
	},
	[100642] = {
		values = {
            enemy = titan_shield
		}
	},
	[100777] = {
		values = {
            enemy = titan_shield
		}
	},
	[100795] = {
		values = {
            enemy = titan_shield
		}
	},
	[101804] = {
		values = {
            enemy = titan_shield
		}
	},
	[101883] = {
		values = {
            enemy = titan_shield
		}
	},
	[102098] = {
		values = {
            enemy = titan_shield
		}
	}
}