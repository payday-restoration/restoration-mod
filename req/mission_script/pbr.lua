local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 450
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 420	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 390
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 360
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 330	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 300		
	end
end

return {
	--Pro Job PONR 
	[100119] = {
		ponr = ponr_value
	},
	--replace most of the murkies with resmod versions
	--Left blockade
	[100620] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100621] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100619] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100622] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100630] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100631] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100632] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100634] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100638] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100639] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100642] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100644] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100649] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100652] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	--Right blockade
	[100660] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100662] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100669] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100670] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100671] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100689] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100690] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	--mfr blockade
	[100703] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100705] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100706] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100707] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100708] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100715] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100717] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100717] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	--mid blockade
	[100734] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100745] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100746] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100751] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	--ffr blockade
	[100090] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100760] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100764] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100765] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100769] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100775] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100777] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100778] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100779] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	--ffl blockade
	[100804] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100805] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100806] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100808] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100809] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100810] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	[100821] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100824] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100825] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"
		}
	},
	--slope forces
	[100373] = {
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault" --thank me later, >:)
		}
	},
	[100402] = {
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		}
	},
	[101498] = {
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		}
	},
	--the vault area
	[101245] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[101262] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[101263] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870"
		}
	},
	[101264] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"
		}
	},
	[101265] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"
		}
	},
	[101266] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"
		}
	},
	[101272] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"
		}
	},
	[101275] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"
		}
	}
}