local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
	if tweak_data:difficulty_to_index(difficulty) == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
	end
	if tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		titan_swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
	end
end

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		vault_guard = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
	end
	

return {
	--security guard instead of beat cop
	[104001] = {
		values = {
            enemy = vault_guard
		}
	},
	--Pro Job Spawns
	[105119] = {
		values = {
            enemy = titan_dozer
		}
	},
	[106858] = {
		values = {
            enemy = titan_taser
		}
	},
	[101885] = {
		values = {
            enemy = woman_spooc
		}
	},
	[103136] = {
		values = {
            enemy = woman_spooc
		}
	},
	[103143] = {
		values = {
            enemy = woman_spooc
		}
	},
	[103151] = {
		values = {
            enemy = woman_spooc
		}
	},
	[100617] = {
		values = {
            enemy = woman_spooc
		}
	},
	[100618] = {
		values = {
            enemy = woman_spooc
		}
	},
	[106873] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[106856] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100620] = {
		values = {
            enemy = titan_taser
		}
	},
	[100621] = {
		values = {
            enemy = titan_taser
		}
	},
	[103163] = {
		values = {
            enemy = titan_taser
		}
	},
	[103231] = {
		values = {
            enemy = titan_taser
		}
	},
	[102575] = {
		values = {
            enemy = titan_taser
		}
	},
	[104317] = {
		values = {
            enemy = titan_taser
		}
	},
	[104318] = {
		values = {
            enemy = titan_taser
		}
	},
	[104319] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[104330] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[104510] = {
		values = {
            enemy = woman_spooc
		}
	},
	[104631] = {
		values = {
            enemy = woman_spooc
		}
	},
	[100570] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[103395] = {
		values = {
            enemy = woman_spooc
		}
	},
	[103463] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[103465] = {
		values = {
            enemy = titan_shield
		}
	},
	[103466] = {
		values = {
            enemy = titan_taser
		}
	},
	[103693] = {
		values = {
            enemy = titan_shield
		}
	},
	[103697] = {
		values = {
            enemy = titan_shield
		}
	},
	[103603] = {
		values = {
            enemy = titan_dozer
		}
	}
}