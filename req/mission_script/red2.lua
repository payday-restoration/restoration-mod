local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local ambush_doors_chance = 85
local ambush_amount = 1
local both_window_swats_only = true
local stair_blockade_chance = 0
local swat_shotgunner = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"
local taser = (difficulty_index == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty_index == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
local chance_dozer_vault_1 = math.rand(1)
local chance_dozer_vault_2 = math.rand(1)
local chance_dozer_vault_3 = math.rand(1)
local chance_dozer_vault_4 = math.rand(1)
local chance_dozer_vault_5 = math.rand(1)
local enabled_chance_dozers_office = math.rand(1)
local dozer_table = {
	dozer_green = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
	dozer_black = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
	dozer_skull = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}

	if difficulty_index == 5 or difficulty_index == 6 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty_index == 7 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
	elseif difficulty_index == 8 then
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		swat_shotgunner = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end
	
	
	if enabled_chance_dozers_office < 0.45 then
		office_dozers = false
	else
		office_dozers = true
	end

--If we're in Pro Job, then do this stuff below
if pro_job then
	    ambush_amount = 2
		hunt_projob = true
	--titan dozer replaces some dozers on Mayhem above	
	if difficulty_index >= 6 then
		titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
	--Titan cloakers replace scripted cloakers
	--Ambush is more deadly
	if difficulty_index == 8 then
		cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		ambush_doors_chance = 100
		ambush_amount = 3
	end
	--Titan units replace some of the scripted spawns
	if difficulty_index >= 5 then
		titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		titan_swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		swat_shotgunner = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
end

	if difficulty_index >= 6 then
		both_window_swats_only = false --disables tazer_only and cloaker_only scripts on higher difficulties
	end	
	
	if difficulty_index >= 5 then
		stair_blockade_chance = 100 --100% to always spawn 3 tasers+1 heavy swat in staircase escape (145+ throwback)
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
	--Disable lobby shields on startup
	--Disable Overdrill PONR
	[100326] = { 
		on_executed = {
			{id = 400044, delay = 3},
			{id = 400049, delay = 3}
		}
	},
	--Enable lobby shields on loud
	[101300] = { 
		on_executed = {
			{id = 400043, delay = 0}
		}
	},
	--Enable Overdrill PONR if Overdrill gets activated
	[104136] = { 
		on_executed = {
			{id = 400045, delay = 0},
			{id = 400046, delay = 0}
		}
	},
	--Disable the right vault path
	[105498] = {
		values = {
			enabled = false
		}
	},
	--Trigger Hunt on Pro Jobs (Endless Assault)
	[102366] = {
		values = {
			enabled = hunt_projob
		}
	},
	--spawn lobby blockade shields+Pro Job PONR
	[101660] = { 
		on_executed = {
			{id = 400001, delay = 0},
			{id = 400002, delay = 0},
			{id = 400047, delay = 0},
			{id = 400048, delay = 0}
		}
	},
	--Use turret's chance to spawn lobby snipers instead
	[105914] = { 
		values = {
			chance = 45
		},
		on_executed = {
			{id = 105921, remove = true},
			{id = 400003, delay = 1},
			{id = 400004, delay = 2},
			{id = 400005, delay = 3},
			{id = 400006, delay = 4},
			{id = 400007, delay = 5},
			{id = 400008, delay = 6}
		}
	},
	--two extra possible dozers spawn on DW+ (PJ Only)
	[103705] = { 
		on_executed = {
			{id = 400024, delay = 15},
			{id = 400025, delay = 15}
		}
	},
	--one extra Bo Dozer
	[101953] = { 
		on_executed = {
			{id = 400020, delay = 1}
		}
	},
	--Make this Bo Dozer use custom set up AI_Hunt
	[105119] = { 
		on_executed = {
			{id = 400023, delay = 3}
		}
	},
	--MORE BANK GUARDS, HUH?! (Spawns extra blockade guards after opening the vault gates)
	--Spawn 2 defend shields on Overkill and above
	[100635] = {
		on_executed = {
			{id = 400010, delay = 0},
			{id = 400011, delay = 0},
			{id = 400012, delay = 0},
			{id = 400013, delay = 0},
			{id = 400014, delay = 0},
			{id = 400015, delay = 0},
			{id = 400016, delay = 0},
			{id = 400017, delay = 0},
			{id = 400018, delay = 0},
			{id = 400019, delay = 0},
			{id = 400041, delay = 0},
			{id = 400042, delay = 0}
		}
	},
	--Spawn two extra dozers on DS as a 193+ throwback
	[100850] = { 
		on_executed = {
			{id = 400021, delay = 20},
			{id = 400022, delay = 20}
		}
	},
	--Killing Bo The Manager results of spawning two angry dozers
	[100689] = {
		on_executed = {
			{id = 100682, delay = 0}
		}
	},
	--spawn 3 rushing cloakers after 50 seconds of starting the assault
	--spawn 2 scripted tasers after 90 seconds of starting the assault
	[103984] = { 
		on_executed = {
			{id = 400030, delay = 50},
			{id = 400031, delay = 50},
			{id = 400032, delay = 50},
			{id = 400037, delay = 90},
			{id = 400038, delay = 90}
		}
	},
	[102068] = {
		values = {
			elements = {
				103388,
				105162,
				400030
			}
		}
	},
	[102167] = { 
		values = {
			elements = {
				102130,
				105176,
				102135,
				400031,
				400032
			}
		}
	},
	--remove spawning the group and spawn 3 tasers+1 heavy swat as a 145+ throwback
	--Spawn 2 blackdozers as a sudden spawn on DS (50% chance)
	[103710] = { 
		values = {
			chance = stair_blockade_chance
		},
		on_executed = {
			{id = 101400, remove = true},
			{id = 400026, delay = 0},
			{id = 400027, delay = 0},
			{id = 400028, delay = 0},
			{id = 400029, delay = 0},
			{id = 400035, delay = 6},
			{id = 400036, delay = 6}
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
	--Spawn replacements
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
            enemy = cloaker
		}
	},
	[100618] = {
		values = {
            enemy = cloaker
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
            enemy = taser
		}
	},
	[103231] = {
		values = {
            enemy = taser
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
            enemy = cloaker
		}
	},
	[103463] = {
		values = {
            enemy = shield
		}
	},
	[103465] = {
		values = {
            enemy = swat_shotgunner
		}
	},
	[103466] = {
		values = {
            enemy = taser
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
	--if one of these dozers spawn in, disable dozers that spawn from elevator
	[103603] = {
		values = {
            enemy = titan_dozer,
			enabled = office_dozers
		},
		on_executed = {
			{id = 400053, delay = 0}
		}
	},
	[103390] = {
		values = {
            enabled = office_dozers
		},
		on_executed = {
			{id = 400053, delay = 0}
		}
	}
}