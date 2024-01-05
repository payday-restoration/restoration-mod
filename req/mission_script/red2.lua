local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local ambush_doors_chance = 85
local ambush_amount = 1
local dozer_vault = 4
local both_window_swats_only = true
local chance_dozer_vault_1 = math.rand(1)
local chance_dozer_vault_2 = math.rand(1)
local chance_dozer_vault_3 = math.rand(1)
local chance_dozer_vault_4 = math.rand(1)
local chance_dozer_vault_5 = math.rand(1)
local dozer_table = {
	dozer_green = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
	dozer_black = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
	dozer_skull = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}


--If we're in Pro Job, then do this shit below
if shadow_fucked_me_hard then
	    ambush_amount = 2
	--titan dozer replaces some dozers on Mayhem above	
	if difficulty_index >= 6 then
		titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
	--Titan cloakers replace scripted cloakers
	--One additional dozer in the vault
	--Ambush is more deadly
	if difficulty_index == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		ambush_doors_chance = 100
		ambush_amount = 3
		dozer_vault = 5
	end
	--Titan units replace some of the scripted spawns
	if difficulty_index >= 5 then
		titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		titan_swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
	end
end

	if difficulty_index >= 6 then
		both_window_swats_only = false --disables tazer_only and cloaker_only scripts on higher difficulties
	end	

	--Setting up random vault dozers for Mayhem+, that's rad!
	if difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_vault_1 < 0.35 then
			vault_dozer_1 = dozer_table.dozer_skull
		elseif chance_dozer_vault_1 < 0.70 then
			vault_dozer_1 = dozer_table.dozer_black
		else
			vault_dozer_1 = dozer_table.dozer_green
		end
		
		if chance_dozer_vault_2 < 0.25 then
			vault_dozer_2 = dozer_table.dozer_skull
		elseif chance_dozer_vault_2 < 0.50 then
			vault_dozer_2 = dozer_table.dozer_black
		else
			vault_dozer_2 = dozer_table.dozer_green
		end
		
		if chance_dozer_vault_3 < 0.25 then
			vault_dozer_3 = dozer_table.dozer_skull
		elseif chance_dozer_vault_3 < 0.50 then
			vault_dozer_3 = dozer_table.dozer_black
		else
			vault_dozer_3 = dozer_table.dozer_green
		end
		
		if chance_dozer_vault_4 < 0.25 then
			vault_dozer_4 = dozer_table.dozer_skull
		elseif chance_dozer_vault_4 < 0.50 then
			vault_dozer_4 = dozer_table.dozer_black
		else
			vault_dozer_4 = dozer_table.dozer_green
		end
		
		if chance_dozer_vault_5 < 0.25 then
			vault_dozer_5 = dozer_table.dozer_skull
		elseif chance_dozer_vault_5 < 0.50 then
			vault_dozer_5 = dozer_table.dozer_black
		else
			vault_dozer_5 = dozer_table.dozer_green
		end
	end

	if difficulty_index == 8 then
		if chance_dozer_vault_1 < 0.25 then
			vault_dozer_1 = dozer_table.dozer_zeal_black
		elseif chance_dozer_vault_1 < 0.50 then
			vault_dozer_1 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_vault_1 < 0.75 then
			vault_dozer_1 = dozer_table.dozer_titan
		else
			vault_dozer_1 = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_vault_2 < 0.25 then
			vault_dozer_2 = dozer_table.dozer_zeal_black
		elseif chance_dozer_vault_2 < 0.50 then
			vault_dozer_2 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_vault_2 < 0.75 then
			vault_dozer_2 = dozer_table.dozer_titan
		else
			vault_dozer_2 = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_vault_3 < 0.25 then
			vault_dozer_3 = dozer_table.dozer_zeal_black
		elseif chance_dozer_vault_3 < 0.50 then
			vault_dozer_3 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_vault_3 < 0.75 then
			vault_dozer_3 = dozer_table.dozer_titan
		else
			vault_dozer_3 = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_vault_4 < 0.25 then
			vault_dozer_4 = dozer_table.dozer_zeal_black
		elseif chance_dozer_vault_4 < 0.50 then
			vault_dozer_4 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_vault_4 < 0.75 then
			vault_dozer_4 = dozer_table.dozer_titan
		else
			vault_dozer_4 = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_vault_5 < 0.25 then
			vault_dozer_5 = dozer_table.dozer_zeal_black
		elseif chance_dozer_vault_5 < 0.50 then
			vault_dozer_5 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_vault_5 < 0.75 then
			vault_dozer_5 = dozer_table.dozer_titan
		else
			vault_dozer_5 = dozer_table.dozer_zeal_benelli
		end
	end

	if difficulty_index <= 6 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
	elseif difficulty_index == 7 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"	
	else
		vault_guard = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
	end
	
return {
	-- Disable forced manager flee objective
	[100665] = {
		values = {
			enabled = false
		}
	},
	--Higher diffs forces both scripted window cloaker and taser spawns
	[100875] = {
		values = {
			enabled = both_window_swats_only
		}
	},
	[102245] = {
		values = {
			enabled = both_window_swats_only
		}
	},
	[102271] = {
		values = {
			enabled = both_window_swats_only
		}
	},
	[102276] = {
		values = {
			enabled = both_window_swats_only
		}
	},
	--Vault Spawn Stuff
	--why there's a beat cop instead of guard? I dunno
	[104001] = {
		values = {
            enemy = vault_guard
		}
	},
	--DOZER RANDOMIZER IN THE VAULT!, You better get trip mines like in PDTH or suffer
	[100763] = {
		values = {
            enemy = vault_dozer_1
		}
	},
	[104131] = {
		values = {
            enemy = vault_dozer_2
		}
	},
	[104132] = {
		values = {
            enemy = vault_dozer_3
		}
	},
	[104169] = {
		values = {
            enemy = vault_dozer_4
		}
	},
	[104170] = {
		values = {
            enemy = vault_dozer_5
		}
	},
	--Pro Job spawns and stuff
	--Basement Doors
	[100528] = {
		values = {
            chance = ambush_doors_chance
		}
	},
	[100529] = {
		values = {
            amount = ambush_amount
		}
	},
	--DSPJ has all vault dozer spawns enabled
	[100225] = {
		values = {
            amount = dozer_vault
		}
	},
	--Spawn replacements
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
	[106869] = {
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
	[102897] = {
		values = {
            enemy = woman_spooc
		}
	},
	[102899] = {
		values = {
            enemy = woman_spooc
		}
	},
	[102903] = {
		values = {
            enemy = woman_spooc
		}
	},
	[102904] = {
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
            enemy = titan_shield
		}
	},
	[104631] = {
		values = {
            enemy = titan_shield
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