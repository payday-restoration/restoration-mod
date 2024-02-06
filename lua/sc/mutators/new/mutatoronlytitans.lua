--Opposite of--
MutatorOnlyTitans = MutatorOnlyTitans or class(BaseMutator)
MutatorOnlyTitans._type = "MutatorOnlyTitans"
MutatorOnlyTitans.name_id = "mutator_onlytitans"
MutatorOnlyTitans.desc_id = "mutator_onlytitans_desc"
MutatorOnlyTitans.reductions = {
	money = 0,
	exp = 0
}
MutatorOnlyTitans.disables_achievements = true
MutatorOnlyTitans.categories = {"enemies"}
MutatorOnlyTitans.icon_coords = {
	4,
	3
}	

function MutatorOnlyTitans:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local access_type_walk_only = {walk = true}
	local access_type_all = {walk = true, acrobatic = true}	

	if not PackageManager:loaded("packages/miscassetsmutators") then
		PackageManager:load("packages/miscassetsmutators")
	end
	
	--Titan Cloaker--
		tweak_data.group_ai.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				federales = {
					Idstring("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},					
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				fbi = {
					Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				}				
			},
			access = access_type_all,
			special_type = "spooc"
		}
		
	--Titan Spoocs for Autumn
	tweak_data.group_ai.unit_categories.Autumn_Spooc = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1")				
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			}		
		},
		access = access_type_all,
		special_type = "spooc",
		ignore_spawn_cap = true
	}
	
	--Titan Spoocs for Hatman
	tweak_data.group_ai.unit_categories.HVH_Boss_Spooc_Normal = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			russia = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			murkywater = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			federales = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			nypd = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},	
			lapd = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			fbi = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			}		
		},
		access = access_type_all,
		special_type = "spooc",
		ignore_spawn_cap = true
	}
	
	--Titan tasers
	tweak_data.group_ai.unit_categories.OMNIA_Taser = {
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
	
	--Spring's Dozers
	tweak_data.group_ai.unit_categories.Tank_Ben = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			}			
		},
		access = access_type_all,
		special_type = "tank",
		ignore_spawn_cap = true
	}
	
	tweak_data.group_ai.unit_categories.OMNIA_Tank = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			}			
		},
		access = access_type_all,
		special_type = "tank",
		ignore_spawn_cap = true
	}
	
	
	--Vet Cops only
	tweak_data.group_ai.unit_categories.CS_cop_C45_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			}
		},
		access = access_type_all
	}	
	tweak_data.group_ai.unit_categories.CS_cop_C45_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			}
		},
		access = access_type_all
	}	
	tweak_data.group_ai.unit_categories.CS_cop_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			}
		},
		access = access_type_all
	}				
	tweak_data.group_ai.unit_categories.CS_cop_stealth_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			}
		},
		access = access_type_all
	}
	--Titan SWATs
	tweak_data.group_ai.unit_categories.CS_swat_MP5 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}
		},
		access = access_type_all
	}
	tweak_data.group_ai.unit_categories.CS_swat_R870 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			}		
		},
		access = access_type_all
	}
	
	tweak_data.group_ai.unit_categories.CS_swat_M4 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}
		},
		access = access_type_all
	}
	tweak_data.group_ai.unit_categories.CS_heavy_M4 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}			
		},
		access = access_type_all
	}
	
	--Titan Shotgunner replacing Heavy SWAT R870--
	tweak_data.group_ai.unit_categories.CS_heavy_R870 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			}			
		},
		access = access_type_all
	}	

	--Titan Tasers--
		tweak_data.group_ai.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")					
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser")						
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")								
				},						
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				federales = {
					Idstring("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser")				
				},										
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},	
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				},
				fbi = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")				
				}				
			},
			access = access_type_all,
			special_type = "taser"
		}
	
	--Vet Cops
	tweak_data.group_ai.unit_categories.FBI_suit_C45 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
			}		
		},
		access = access_type_all
	}
	
	--Vet Cops and ASU--
	if difficulty_index <= 6 then
		tweak_data.group_ai.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			}			
		},
		access = access_type_all
	}
	else
		tweak_data.group_ai.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			}				
		},
		access = access_type_all
	}																
	end				
	
	if difficulty_index <= 6 then
		tweak_data.group_ai.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			}			
		},
		access = access_type_all
	}
	else
		tweak_data.group_ai.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1"),
				Idstring("units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			},
			fbi = {
				Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
			}			
		},
		access = access_type_all
	}
	end
	
	--Titan SWAT--
		tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}				
			},
			access = access_type_all
		}
	
		tweak_data.group_ai.unit_categories.GS_swat_M4 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}				
			},
			access = access_type_all
		}
	
	--Titan Shotgunners
	tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			}				
		},
		access = access_type_all
	}			
	
		tweak_data.group_ai.unit_categories.GS_swat_R870 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			}				
			},
			access = access_type_all
		}	

	tweak_data.group_ai.unit_categories.GS_heavy_G36 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}				
			},
			access = access_type_all
		}
		
	tweak_data.group_ai.unit_categories.GS_heavy_G36_w = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_rifle/ene_titan_rifle")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")							
			}				
			},
			access = access_type_all
		}	

	tweak_data.group_ai.unit_categories.GS_heavy_R870 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")				
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			}				
			},
			access = access_type_all
		}

	--SWAT shields--
	tweak_data.group_ai.unit_categories.CS_shield = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},						
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},		
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			}			
		},
		access = access_type_all,
		special_type = "shield"
	}


	--FBI shields--
	tweak_data.group_ai.unit_categories.FBI_shield = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},						
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},		
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			}			
		},
		access = access_type_all,
		special_type = "shield"
	}		
	
	--GenSec/Zeal Shield
		tweak_data.group_ai.unit_categories.GS_shield = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},						
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},		
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			}			
			},
			access = access_type_all,
			special_type = "shield"
		}
		
		--Reinforce Shields
		tweak_data.group_ai.unit_categories.GS_shield_defend = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},						
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},					
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},		
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			}			
			},
			access = access_type_all,
			special_type = nil
		}
		
	--Titan Snipers for Grenadiers	
	tweak_data.group_ai.unit_categories.boom_M4203 = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			}
		},
		access = access_type_all
	}	
	
	--Titan Tank--
	tweak_data.group_ai.unit_categories.FBI_tank = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			}				
		},
		access = access_type_all,
		special_type = "tank"
	}
	
	--Titan Tank--
	tweak_data.group_ai.unit_categories.BLACK_tank = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			}				
		},
		access = access_type_all,
		special_type = "tank"
	}
	
	--Titan Tank--
	tweak_data.group_ai.unit_categories.SKULL_tank = {
			unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			russia = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			federales = {
				Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			fbi = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			}				
		},
		access = access_type_all,
		special_type = "tank"
	}
	
	--LPFs
	if difficulty_index <= 5 then
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
	else
	--Higher diffs have LPFs+Flmaer in Russian/Federales heists
		tweak_data.group_ai.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_lpf/ene_akan_lpf"),
					Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
				},					
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
				},
				federales = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_lpf/ene_akan_lpf"),
					Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")						
				},					
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				fbi = {
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				}			
			},
			access = access_type_all,
			special_type = "medic"
		}
	end
end
