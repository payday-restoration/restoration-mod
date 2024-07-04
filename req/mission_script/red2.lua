local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
local ambush_doors_chance = 85
local ambush_amount = 1
local cloaker_ambush_amount_vault_hallway = 1
local both_window_swats_only = true
local enable_right_path = false
local vent_spawngroup = false
local stair_blockade_chance = 0
local swat_shotgunner = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
local marioinatophat_is_in_fwb_chance = 0.15

	if math.random() < marioinatophat_is_in_fwb_chance then
		dave = "units/pd2_mod_dave/characters/ene_big_dave/ene_big_dave"
	end	

	if difficulty == 6 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
	elseif difficulty == 7 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
		cloaker_ambush_amount_vault_hallway = 2
	elseif difficulty == 8 then
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		swat_shotgunner = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
		cloaker_ambush_amount_vault_hallway = 3
	end

--If we're in Pro Job, then do this stuff below
if pro_job then
	    ambush_amount = 2
		hunt_projob = true
	--titan dozer replaces some dozers on Mayhem above	
	if difficulty >= 6 then
		titan_dozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	end
	--Titan cloakers replace scripted cloakers
	--Ambush is more deadly
	if difficulty == 8 then
		cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		ambush_doors_chance = 100
		ambush_amount = 3
	end
	--Titan units replace some of the scripted spawns
	if difficulty >= 5 then
		titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		titan_swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		swat_shotgunner = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
end

	if difficulty >= 6 then
		both_window_swats_only = false --disables tazer_only and cloaker_only scripts on higher difficulties
		enable_right_path = true
		vent_spawngroup = true
	end	
	
	if difficulty >= 5 then
		stair_blockade_chance = 100 --100% to always spawn 3 tasers+1 heavy swat in staircase escape (145+ throwback)
	end

	if difficulty <= 6 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
	elseif difficulty == 7 then
		vault_guard = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"	
	else
		vault_guard = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
	end
	
local cloaker = {
	values = {
        enemy = cloaker
	}
}
local taser = {
	values = {
		enemy = taser
	}
}
local taser_basement = {
	values = {
		enemy = taser,
		spawn_action = "e_sp_kick_enter"
	}
}
local swatsg = {
	values = {
		enemy = swat_shotgunner
	}
}
local shield = {
	values = {
		enemy = shield
	}
}
local titan_taser = {
	values = {
        enemy = titan_taser
	}
}
local titan_cloaker = {
	values = {
        enemy = woman_spooc
	}
}
local titan_shield = {
	values = {
        enemy = titan_shield
	}
}
local tswat1 = {
	values = {
		enemy = titan_swat_1
	}
}
local tswat2 = {
	values = {
		enemy = titan_swat_2
	}
}
local windows_swat = {
	values = {
		enabled = both_window_swats_only
	}
}
	
return {
	--Glock ready to shoot (15% chance)
	[103609] = {
		values = {
			enemy = dave
		}
	},
	--Re-enable unused guard that spawn with Bo on the balcony
	[100671] = {
		values = {
			enabled = true
		}
	},
	--More cloakers in vault hallway on higher diffs
	[103996] = {
		values = {
            amount = cloaker_ambush_amount_vault_hallway
		}
	},
	--Making sure that cloaker ambush in vault hallway works with alt vault entrance
	[101188] = {
		values = {
			toggle = "on"
		}
	},
	-- Disable forced manager flee objective
	[100665] = {
		values = {
			enabled = false
		}
	},
	--Pro Job PONR
	[100057] = { 
		on_executed = {
			{id = 400047, delay = 0},
			{id = 400048, delay = 0}
		}
	},
	--Disable lobby shields on startup
	--Disable surprise tank on startup
	--Disable Overdrill PONR
	[100326] = { 
		on_executed = {
			{id = 400044, delay = 3},
			{id = 400049, delay = 3},
			{id = 400057, delay = 3}
		}
	},
	--Enable lobby shields on loud
	--Enable surprise tank on loud
	[101300] = { 
		on_executed = {
			{id = 400043, delay = 0},
			{id = 400056, delay = 0}
		}
	},
	--Enable Overdrill PONR if Overdrill gets activated
	[104136] = { 
		on_executed = {
			{id = 400045, delay = 0},
			{id = 400046, delay = 0}
		}
	},
	--Enable the right vault path on mayhem above
	[105498] = {
		values = {
			enabled = enable_right_path
		}
	},
	--enable vault hallway vent spawns on mayhem and above instead on all diffs
	[105200] = {
		values = {
			enabled = vent_spawngroup
		}
	},
	--Trigger Hunt on Pro Jobs (Endless Assault)
	[102366] = {
		values = {
			enabled = hunt_projob
		}
	},
	--Let the cops finish their spawn anim before moving into SO spot
	[103720] = { 
		on_executed = {
			{id = 104029, delay = 2.75}
		}
	},
	[103721] = { 
		on_executed = {
			{id = 104071, delay = 2.75}
		}
	},
	[103722] = { 
		on_executed = {
			{id = 105734, delay = 2.75}
		}
	},
	[103723] = { 
		on_executed = {
			{id = 105736, delay = 2.75}
		}
	},
	[103724] = { 
		on_executed = {
			{id = 100226, delay = 2.75}
		}
	},
	[103732] = { 
		on_executed = {
			{id = 100077, delay = 2.75}
		}
	},
	[103737] = { 
		on_executed = {
			{id = 105732, delay = 2.75}
		}
	},
	[100619] = {
		values = {
			rules = {
				enemy_names = {
					"units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
					"units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
					"units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
					"units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"	
				}
			}
		}
	},
	--spawn lobby blockade shields+Pro Job PONR
	[101660] = { 
		on_executed = {
			{id = 400001, delay = 0},
			{id = 400002, delay = 0}
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
	--Use the unused area trigger to spawn the blackdozer
	[106042] = { 
		on_executed = {
			{id = 400055, delay = 15}
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
	--Spawn 2 blackdozers as a sudden spawn on DS if there are 3-4 players alive (50% chance)
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
			{id = 400053, delay = 0}
		}
	},
	--Higher diffs forces both scripted window cloaker and taser spawns
	[100875] = windows_swat,
	[102245] = windows_swat,
	[102271] = windows_swat,
	[102276] = windows_swat,
	--Vault Spawn Stuff
	--why there's a beat cop instead of guard? I dunno
	[104001] = {
		values = {
            enemy = vault_guard
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
	[106858] = titan_taser,
	[106869] = titan_taser,
	[100620] = titan_taser,
	[100621] = titan_taser,
	[102575] = titan_taser,
	[104317] = titan_taser,
	[104318] = titan_taser,
	[102382] = titan_taser,
	[101967] = titan_taser,
	[101885] = titan_cloaker,
	[103136] = titan_cloaker,
	[103143] = titan_cloaker,
	[103151] = titan_cloaker,
	[102897] = titan_cloaker,
	[102899] = titan_cloaker,
	[102903] = titan_cloaker,
	[102904] = titan_cloaker,
	[103693] = titan_shield,
	[103697] = titan_shield,
	[104510] = titan_shield,
	[104631] = titan_shield,
	[104319] = tswat1,
	[104330] = tswat1,
	[100570] = tswat2,
	[106873] = tswat1,
	[106856] = tswat2,
	[103535] = tswat1,
	[106855] = tswat2,
	[100617] = cloaker,
	[100618] = cloaker,
	[103395] = cloaker,
	[103163] = taser_basement,
	[103231] = taser_basement,
	[103466] = taser,
	[103463] = shield,
	[103465] = swatsg
}