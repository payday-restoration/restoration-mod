local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 90
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 70
	elseif difficulty_index == 8 then
		ponr_value = 60
	end

if Global.game_settings and Global.game_settings.one_down then	
	if difficulty_index == 5 or difficulty_index == 6 or difficulty_index == 7 or difficulty_index == 8 then
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
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
	--Fixes SWAT chopper that lands on Mitchell's roof not spawning at all (also fixes choppers having no sounds)
	[101688] = {
		values = {
			enabled = true
		trigger_list = {
			<table id="1" name="run_sequence" notify_unit_id="100603" notify_unit_sequence="swat" time="0"/>
			<table id="2" name="run_sequence" notify_unit_id="100603" notify_unit_sequence="heli_street_seventh_flyin" time="0"/>
			}	
		}
	},
	[101687] = {
		values = {
		trigger_list = {
			<table id="1" name="run_sequence" notify_unit_id="102724" notify_unit_sequence="swat" time="0"/>
			<table id="2" name="run_sequence" notify_unit_id="102724" notify_unit_sequence="heli_suburbia_flyin" time="0"/>
			}	
		}
	},
	[101689] = {
		values = {
		trigger_list = {
			<table id="1" name="run_sequence" notify_unit_id="100719" notify_unit_sequence="swat" time="0"/>
			<table id="2" name="run_sequence" notify_unit_id="100719" notify_unit_sequence="heli_street_fourth_flyin" time="0"/>
			}	
		}
	},
	--Bain no longer will remind to find Mitchell when players masked up or when the door has been crowbarred
	[102410] = {
		on_executed = {
            {id = 100096, delay = 0}
		}
	},
	[100551] = {
		on_executed = {
            {id = 100096, delay = 0}
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
	[101717] = {
		values = {
            enemy = australian_sniper
		}
	},
	[101718] = {
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