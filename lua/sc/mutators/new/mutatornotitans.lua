--No Titans--
MutatorNoTitans = MutatorNoTitans or class(BaseMutator)
MutatorNoTitans._type = "MutatorNoTitans"
MutatorNoTitans.name_id = "mutator_notitans"
MutatorNoTitans.desc_id = "mutator_notitans_desc"
MutatorNoTitans.reductions = {
	money = 0,
	exp = 0
}
MutatorNoTitans.disables_achievements = true
MutatorNoTitans.categories = {"enemies"}
MutatorNoTitans.icon_coords = {
	4,
	3
}	

function MutatorNoTitans:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local access_type_walk_only = {walk = true}
	local access_type_all = {walk = true, acrobatic = true}	

	if not PackageManager:loaded("packages/miscassetsmutators") then
		PackageManager:load("packages/miscassetsmutators")
	end
	
	--Titan Cloaker--
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1")
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
				},	
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				},
				fbi = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				}												
			},
			access = access_type_all,
			special_type = "spooc"
		}
	else
		tweak_data.group_ai.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker")
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
				}				
			},
			access = access_type_all,
			special_type = "spooc"
		}
	end		
	--No Titan Spoocs for you, Autumn!
	tweak_data.group_ai.unit_categories.Titan_Spooc = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},
			russia = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")				
			},
			zombie = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},					
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},
			federales = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},				
			nypd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},	
			lapd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			},
			fbi = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
			}		
		},
		access = access_type_all,
		special_type = "spooc",
		ignore_spawn_cap = true
	}
	
	--Have "ZEAL" Cloakers act as Hatman's minions on DS
	tweak_data.group_ai.unit_categories.HVH_Boss_Spooc = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
			},	
			lapd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
			},
			fbi = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc")
			}		
		},
		access = access_type_all,
		special_type = "spooc",
		ignore_spawn_cap = true
	}
	
	--OMNIA Tasers replaces their titan counterparts in Spring's squad on DS
	tweak_data.group_ai.unit_categories.Taser_Titan = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},
			zombie = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},					
			russia = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},
			federales = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},				
			nypd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},	
			lapd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			},
			fbi = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser")
			}			
		},
		access = access_type_all,
		special_type = "taser",
		ignore_spawn_cap = true
	}
	
	--OMNIA Shields replace their titan counterparts in Winters' squad
	tweak_data.group_ai.unit_categories.Phalanx_minion_new = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},
			russia = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},
			zombie = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},					
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},
			federales = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},				
			nypd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},
			lapd = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			},
			fbi = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
			}			
		},
		access = access_type_all,
		special_type = "shield",
		ignore_spawn_cap = true
	}
	
	--OMNIA Grenadiers replace Titan Snipers in Winters' squad (why not?)
	tweak_data.group_ai.unit_categories.Phalanx_sniper = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},
			russia = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},
			zombie = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},					
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},
			federales = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},				
			nypd = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},
			lapd = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			},
			fbi = {
				Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			}			
		},
		access = access_type_all,
		special_type = "boom",
		ignore_spawn_cap = true
	}
	
	--Titan Shotgunner replacing Heavy SWAT R870--
	tweak_data.group_ai.unit_categories.CS_heavy_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc")				
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")						
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc")						
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")		
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")					
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870")					
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")					
			},
			fbi = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc")				
			}			
		},
		access = access_type_all
	}	

	--Titan Tasers--
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc")						
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1")						
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1")					
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1")					
				},
				fbi = {
					Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc")					
				}				
			},
			access = access_type_all,
			special_type = "taser"
		}
	else
		tweak_data.group_ai.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc")						
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1")						
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1")					
				},										
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc")						
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc")								
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc")					
				}				
			},
			access = access_type_all,
			special_type = "taser"
		}				
	end					
	
	--Titan HRTs and Vet Cops replacing HRT mp5/m4--
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")						
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3")							
				},
				fbi = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")							
				}			
			},
			access = access_type_all
		}
	else
		tweak_data.group_ai.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")						
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_drak_hrt_1/ene_drak_hrt_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_drak_hrt_2/ene_drak_hrt_2")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")							
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")							
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")						
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")					
				}				
			},
			access = access_type_all
		}																
	end				
	
	--Titan HRTs replacing HRT w/ mp5--
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")							
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3")						
				},
				fbi = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")						
				}				
			},
			access = access_type_all
		}		
	else
		tweak_data.group_ai.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_drak_hrt_2/ene_drak_hrt_2")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
				}			
			},
			access = access_type_all
		}
	end				

	--Titan SWAT--
	if difficulty_index <= 4 then
		tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"),	
					Idstring("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc")										
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1")							
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"),		
					Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1")										
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1")								
				},
				fbi = {
					Idstring("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"),	
					Idstring("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc")										
				}			
			},
			access = access_type_all
		}
	else
		tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},
				fbi = {
					Idstring("units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc")
				}				
			},
			access = access_type_all
		}			
	end
	
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.GS_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1")
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1")
				},
				fbi = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1")
				}					
			},
			access = access_type_all
		}	
	else
		tweak_data.group_ai.unit_categories.GS_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				}				
			},
			access = access_type_all
		}
	end	
	
	--Titan Shotgunners
	tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")				
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3")							
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3")						
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3")				
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3")				
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3")					
			},
			fbi = {
				Idstring("units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")					
			}				
		},
		access = access_type_all
	}			
	
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.GS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"),
					Idstring("units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc")					
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3")					
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3")					
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3")					
				},
				fbi = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3")		
				}					
			},
			access = access_type_all
		}					
	else
		tweak_data.group_ai.unit_categories.GS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
				}				
			},
			access = access_type_all
		}
	end		

	--Titan Shields--
	tweak_data.group_ai.unit_categories.FBI_shield = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1")
			},		
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc")
			}			
		},
		access = access_type_all,
		special_type = "shield"
	}		
	
	--GenSec/Zeal Shield
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.GS_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec")								
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield")									
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec")								
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield")								
				},
				fbi = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield")							
				}				
			},
			access = access_type_all,
			special_type = "shield"
		}
	else
		tweak_data.group_ai.unit_categories.GS_shield = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},								
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				}			
			},
			access = access_type_all,
			special_type = "shield"
		}
	end	
		--Reinforce Shields
		tweak_data.group_ai.unit_categories.GS_shield_defend = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},								
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc")
				}			
			},
			access = access_type_all,
			special_type = nil
		}
	
	--Titan Tank--
	if difficulty_index <= 7 then
		tweak_data.group_ai.unit_categories.TIT_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")								
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")								
				},
				fbi = {
					Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")								
				}			
			},
			access = access_type_all,
			special_type = "tank"
		}
	else
		tweak_data.group_ai.unit_categories.TIT_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc")								
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1")
				},						
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc")							
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc")								
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc")								
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}	
	end
	
	--OMNIA LPF/DRAK Enforcer--
	if difficulty_index <= 6 then
		tweak_data.group_ai.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_bob/ene_akan_medic_bob")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				fbi = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				}			
			},
			access = access_type_all,
			special_type = "medic"
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_zdann/ene_akan_medic_zdann")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")						
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5")					
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
				},
				lapd = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				fbi = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				}				
			},
			access = access_type_all,
			special_type = "medic"
		}					
	else
		tweak_data.group_ai.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic")							
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5")						
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				}			
			},
			access = access_type_all,
			special_type = "medic"
		}	
	end		

	--Titan Grenadier
	if difficulty_index <= 7 then 
	   tweak_data.group_ai.unit_categories.boom_M4203 = {
		    unit_types = {
			    america = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    russia = {
			    	Idstring("units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    zombie = {
			    	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    murkywater = {
			    	Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    federales = {
			    	Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    nypd = {
			    	Idstring("units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    lapd = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    fbi = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    }			
		    },
		    access = access_type_all,
		    special_type = "boom"
	    }
	else 
	   tweak_data.group_ai.unit_categories.boom_M4203 = {
		    unit_types = {
			    america = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    russia = {
			    	Idstring("units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    zombie = {
			    	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    murkywater = {
			    	Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    federales = {
			    	Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    nypd = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    lapd = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    fbi = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    }			
		    },
		    access = access_type_all,
		    special_type = "boom"
	    }
	end	
	
	--Titan Snipers
	tweak_data.group_ai.enemy_spawn_groups.titan_snipers = {}
	
end	
