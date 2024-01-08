local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local swat_normal = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"
local swat_hard = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
local swat_overkill = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"

	--So it will not crash
	if difficulty_index == 7 then
	   swat_overkill = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"
	elseif difficulty_index == 8 then
	   swat_overkill = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
	end

	if difficulty_index <= 5 then
		ponr_value = 360	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 330
	else
		ponr_value = 300		
	end

--IF we're in Pro Job, then do this shit below similiar to Big Bank	
if shadow_fucked_me_hard then
	swat_normal = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
	swat_hard = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
	swat_overkill = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
end

return {
	--Pro Job PONR 
	[100931] = {
		ponr = ponr_value
	},
	--Harasser Tweak Spawns
	[102732] = {
		values = {
            enemy = swat_normal
		}
	},
	[102733] = {
		values = {
            enemy = swat_hard
		}
	},
	[102742] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102428] = {
		values = {
            enemy = swat_normal
		}
	},
	[102429] = {
		values = {
            enemy = swat_hard
		}
	},
	[102430] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102444] = {
		values = {
            enemy = swat_normal
		}
	},
	[102445] = {
		values = {
            enemy = swat_hard
		}
	},
	[102446] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102460] = {
		values = {
            enemy = swat_normal
		}
	},
	[102461] = {
		values = {
            enemy = swat_hard
		}
	},
	[102462] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102762] = {
		values = {
            enemy = swat_normal
		}
	},
	[102763] = {
		values = {
            enemy = swat_hard
		}
	},
	[102764] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102778] = {
		values = {
            enemy = swat_normal
		}
	},
	[102779] = {
		values = {
            enemy = swat_hard
		}
	},
	[102780] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102794] = {
		values = {
            enemy = swat_normal
		}
	},
	[102795] = {
		values = {
            enemy = swat_hard
		}
	},
	[102796] = {
		values = {
            enemy = swat_overkill
		}
	},
	[102810] = {
		values = {
            enemy = swat_normal
		}
	},
	[102811] = {
		values = {
            enemy = swat_hard
		}
	},
	[102812] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103125] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103133] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103134] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103135] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103136] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103137] = {
		values = {
            enemy = swat_overkill
		}
	},
	[103138] = {
		values = {
            enemy = swat_overkill
		}
	}
}