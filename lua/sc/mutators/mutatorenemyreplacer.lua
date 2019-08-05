if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--Minigun Dozers--
	MutatorMinidozers = MutatorMinidozers or class(BaseMutator)
	MutatorMinidozers._type = "MutatorMinidozers"
	MutatorMinidozers.name_id = "mutator_minidozers"
	MutatorMinidozers.desc_id = "mutator_minidozers_desc"
	MutatorMinidozers.reductions = {
		money = 0,
		exp = 0
	}
	MutatorMinidozers.disables_achievements = false
	MutatorMinidozers.categories = {"enemies"}
	MutatorMinidozers.icon_coords = {
		6,
		1
	}

	function MutatorMinidozers:setup(data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)

		local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
		
		local mini_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		local classic_mini_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		
		if difficulty_index <= 7 then 
		table.insert(unit_types_black.america, classic_mini_unit_name)
		table.insert(unit_types_black.russia, classic_mini_unit_name)
		table.insert(unit_types_black.zombie, classic_mini_unit_name)
		table.insert(unit_types_black.murkywater, classic_mini_unit_name)
		table.insert(unit_types_black.nypd, classic_mini_unit_name)
		table.insert(unit_types_black.lapd, classic_mini_unit_name)				
		else		
		table.insert(unit_types_black.america, mini_unit_name)
		table.insert(unit_types_black.russia, mini_unit_name)
		table.insert(unit_types_black.zombie, mini_unit_name)
		table.insert(unit_types_black.murkywater, mini_unit_name)
		table.insert(unit_types_black.nypd, mini_unit_name)
		table.insert(unit_types_black.lapd, mini_unit_name)		
		end
	end	
	
	--Medic Dozers--
	MutatorMedicdozers = MutatorMedicdozers or class(BaseMutator)
	MutatorMedicdozers._type = "MutatorMedicdozers"
	MutatorMedicdozers.name_id = "mutator_medicdozers"
	MutatorMedicdozers.desc_id = "mutator_medicdozers_desc"
	MutatorMedicdozers.reductions = {
		money = 0,
		exp = 0
	}
	MutatorMedicdozers.disables_achievements = false
	MutatorMedicdozers.categories = {"enemies"}
	MutatorMedicdozers.icon_coords = {
		6,
		1
	}

	function MutatorMedicdozers:setup(data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)

		local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
		local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
		local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types
		
		local medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		local classic_medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic")

		if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_medic_unit_name)
		table.insert(unit_types.russia, classic_medic_unit_name)
		table.insert(unit_types.zombie, classic_medic_unit_name)
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, classic_medic_unit_name)
		table.insert(unit_types.lapd, classic_medic_unit_name)
		
		table.insert(unit_types_black.america, classic_medic_unit_name)
		table.insert(unit_types_black.russia, classic_medic_unit_name)
		table.insert(unit_types_black.zombie, classic_medic_unit_name)
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, classic_medic_unit_name)
		table.insert(unit_types_black.lapd, classic_medic_unit_name)

		table.insert(unit_types_skull.america, classic_medic_unit_name)
		table.insert(unit_types_skull.russia, classic_medic_unit_name)
		table.insert(unit_types_skull.zombie, classic_medic_unit_name)
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, classic_medic_unit_name)
		table.insert(unit_types_skull.lapd, classic_medic_unit_name)			
		else
		table.insert(unit_types.america, medic_unit_name)
		table.insert(unit_types.russia, medic_unit_name)
		table.insert(unit_types.zombie, medic_unit_name)
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, medic_unit_name)
		table.insert(unit_types.lapd, medic_unit_name)
		
		table.insert(unit_types_black.america, medic_unit_name)
		table.insert(unit_types_black.russia, medic_unit_name)
		table.insert(unit_types_black.zombie, medic_unit_name)
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, medic_unit_name)
		table.insert(unit_types_black.lapd, medic_unit_name)

		table.insert(unit_types_skull.america, medic_unit_name)
		table.insert(unit_types_skull.russia, medic_unit_name)
		table.insert(unit_types_skull.zombie, medic_unit_name)
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, medic_unit_name)
		table.insert(unit_types_skull.lapd, medic_unit_name)					
		end		
	end
	
	MutatorMememanOnly = MutatorMememanOnly or class(BaseMutator)
	MutatorMememanOnly._type = "MutatorMememanOnly"
	MutatorMememanOnly.name_id = "mutator_mememanonly"
	MutatorMememanOnly.desc_id = "mutator_mememanonly_desc"
	MutatorMememanOnly.reductions = {
		money = 0,
		exp = 0
	}
	MutatorMememanOnly.disables_achievements = true
	MutatorMememanOnly.categories = {"enemies"}
	MutatorMememanOnly.icon_coords = {
		6,
		1
	}	
	
	function MutatorMememanOnly:setup(data)
		self._groups = self._groups or {}
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)

		self:modify_unit_categories(tweak_data.group_ai, difficulty_index)	
	end
	
	function MutatorMememanOnly:modify_unit_categories(group_ai_tweak, difficulty_index)	
		group_ai_tweak.special_unit_spawn_limits = {
		tank = math.huge,
		taser = 0,
		spooc = 0,
		shield = 0,
		medic = 0
	}
	for group, units_data in pairs(group_ai_tweak.unit_categories) do
		if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
		
		else
			for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
				group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2")					
				}		
				end		
			end
		end
	end

	--Titans Only--
	MutatorTitansOnly = MutatorTitansOnly or class(BaseMutator)
	MutatorTitansOnly._type = "MutatorTitansOnly"
	MutatorTitansOnly.name_id = "MutatorTitansOnly"
	MutatorTitansOnly.desc_id = "MutatorTitansOnly_desc"
	MutatorTitansOnly.reductions = {
		money = 0,
		exp = 0
	}
	MutatorTitansOnly.disables_achievements = true
	MutatorTitansOnly.categories = {"enemies"}
	MutatorTitansOnly.icon_coords = {
		6,
		1
	}	

	function MutatorTitansOnly:setup(data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local access_type_walk_only = {walk = true}
		local access_type_all = {walk = true, acrobatic = true}		
		
		--Titan Cloaker--
			tweak_data.group_ai.unit_categories.spooc = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")								
					},
					zombie = {
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					murkywater = {
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},	
					nypd = {
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					}						
				},
				access = access_type_all,
				special_type = "spooc"
			}
			--Titan HRTS
			tweak_data.group_ai.unit_categories.CS_swat_MP5 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},	
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					}					
				},
				access = access_type_all
			}	
			
		--Titan Shotgunner--
		tweak_data.group_ai.unit_categories.CS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")						
				},					
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")			
				},
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				lapd = {
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
						Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
					},
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")					
					}					
				},
				access = access_type_all,
				special_type = "taser"
			}
		
		--Titan HRTs and Vet Cops replacing HRT mp5/m4--
		if difficulty_index <= 6 then
			tweak_data.group_ai.unit_categories.FBI_suit_M4_MP5 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")					
					},
					zombie = {
						Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")					
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")					
					},
					zombie = {
						Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")					
					},							
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					}					
				},
				access = access_type_all
			}																
		end

		tweak_data.group_ai.unit_categories.FBI_heavy_G36_w = {
			unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")										
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")										
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")										
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")										
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")										
					},	
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")										
					}					
				},
				access = access_type_all
			}				
		
		--Titan HRTs replacing HRT w/ mp5--
			tweak_data.group_ai.unit_categories.FBI_suit_stealth_MP5 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
					},	
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
					}					
				},
				access = access_type_all
			}		
			--Titan SHIELDs replacing normal shields
			tweak_data.group_ai.unit_categories.CS_shield = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},		
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					}					
				},
				access = access_type_all,
				special_type = "shield"
			}
			--Titan SWAT replacing M4/MP5 swats
			tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
					},	
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
					}					
				},
				access = access_type_all
			}			
		
		--Titan Shotgunners replacing R870 SWATS
			tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
					},
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
					}					
				},
				access = access_type_all
			}				
		
		--Titan Snipers replacing Heavy SWATS--
			tweak_data.group_ai.unit_categories.FBI_heavy_R870 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
					},							
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
					},
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
					}						
				},
				access = access_type_all
			}					

		--Titan Shield replacing normal shields--
			tweak_data.group_ai.unit_categories.FBI_shield = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},						
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},		
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					}					
				},
				access = access_type_all,
				special_type = "shield"
			}
		--Titan Dozers--
		tweak_data.group_ai.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
				},
				zombie = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},				
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}					
			

		tweak_data.group_ai.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
				},
				zombie = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},				
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}					
		
		tweak_data.group_ai.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
				},
				zombie = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},				
				murkywater = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				nypd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				},
				lapd = {
					Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}		
		
		--OMNIA LPF--
			tweak_data.group_ai.unit_categories.medic_M4 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
					},
					zombie = {
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},					
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},	
					lapd = {
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					}					
				},
				access = access_type_all,
				special_type = "medic"
			}
		
	end	
	
	
	--No Titans--
	MutatorNoTitans = MutatorNoTitans or class(BaseMutator)
	MutatorNoTitans._type = "MutatorNoTitans"
	MutatorNoTitans.name_id = "mutator_notitans"
	MutatorNoTitans.desc_id = "mutator_notitans_desc"
	MutatorNoTitans.reductions = {
		money = 0.5,
		exp = 0.5
	}
	MutatorNoTitans.disables_achievements = true
	MutatorNoTitans.categories = {"enemies"}
	MutatorNoTitans.icon_coords = {
		6,
		1
	}	

	function MutatorNoTitans:setup(data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local access_type_walk_only = {walk = true}
		local access_type_all = {walk = true, acrobatic = true}		
		
		--Titan Cloaker--
		if difficulty_index <= 7 then
			tweak_data.group_ai.unit_categories.spooc = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
					},	
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
					}						
				},
				access = access_type_all,
				special_type = "spooc"
			}
		else
			tweak_data.group_ai.unit_categories.spooc = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")							
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
					},
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
					}						
				},
				access = access_type_all,
				special_type = "spooc"
			}
		end		
		
		--Titan HRTs and Vet Cops replacing blue SWATs--
		if difficulty_index <= 5 then
			tweak_data.group_ai.unit_categories.CS_swat_MP5 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")						
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")				
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")					
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murkywater_light/ene_murkywater_light")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1")							
					},	
					lapd = {
						Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1")							
					}					
				},
				access = access_type_all
			}	
		else
			tweak_data.group_ai.unit_categories.CS_swat_MP5 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
						Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")						
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")							
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")								
					},							
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
					},
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
					}					
				},
				access = access_type_all
			}	
		end		
		
		--Titan Shotgunner replacing Heavy SWAT R870--
		tweak_data.group_ai.unit_categories.CS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")					
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")						
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870")			
				},
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870")					
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2")				
				}					
			},
			access = access_type_all
		}	

		--Titan Tasers--
		if difficulty_index <= 4 then
			tweak_data.group_ai.unit_categories.CS_tazer = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")					
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1")							
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer")						
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1")						
					},
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1")					
					}					
				},
				access = access_type_all,
				special_type = "taser"
			}
		elseif difficulty_index == 5 then
			tweak_data.group_ai.unit_categories.CS_tazer = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")								
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")							
					},
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")						
					}					
				},
				access = access_type_all,
				special_type = "taser"
			}	
		elseif difficulty_index == 6 or difficulty_index == 7 then
			tweak_data.group_ai.unit_categories.CS_tazer = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")								
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")							
					},
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")						
					}					
				},
				access = access_type_all,
				special_type = "taser"
			}			
		else
			tweak_data.group_ai.unit_categories.CS_tazer = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")						
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),
						Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")							
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")									
					},	
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")								
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")					
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")						
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")								
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")							
					},							
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4")						
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")						
					},	
					lapd = {
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")						
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4")							
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")							
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3")						
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5")
					},
					lapd = {
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
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
						Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")										
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")					
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),		
						Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4"),	
						Idstring("units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4")							
					},
					nypd = {
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4")								
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
						Idstring("units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1")							
					}					
				},
				access = access_type_all
			}
		elseif difficulty_index == 5 then
			tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")									
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")				
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")							
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4")						
					},
					nypd = {
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")								
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")							
					}					
				},
				access = access_type_all
			}			
		elseif difficulty_index == 6 then
			tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
						Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
					}					
				},
				access = access_type_all
			}			
		elseif difficulty_index == 7 then
			tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1")
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")
					}					
				},
				access = access_type_all
			}	
		else
			tweak_data.group_ai.unit_categories.FBI_swat_M4 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1")
					},						
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
					},	
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
					}					
				},
				access = access_type_all
			}
		end
		
		--Titan Shotgunners
		if difficulty_index <= 5 then
			tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")					
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump")								
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3")							
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_ump/ene_murky_heavy_ump")						
					},
					nypd = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")					
					},
					lapd = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")			
					}					
				},
				access = access_type_all
			}				
		elseif difficulty_index == 6 then
			tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")					
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")							
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3")							
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump")						
					},
					nypd = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")			
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")					
					}				
				},
				access = access_type_all
			}
		elseif difficulty_index == 7 then
			tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")					
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")							
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3")								
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump")							
					},
					nypd = {
						Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")				
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
						Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")				
					}					
				},
				access = access_type_all
			}					
		else
			tweak_data.group_ai.unit_categories.FBI_swat_R870 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3")
					},						
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
					},
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3")
					}					
				},
				access = access_type_all
			}
		end		
		
		--Titan Snipers--
		if difficulty_index <= 6 then
			tweak_data.group_ai.unit_categories.FBI_heavy_R870 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
					},							
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
					}						
				},
				access = access_type_all
			}					
		elseif difficulty_index == 7 then
			tweak_data.group_ai.unit_categories.FBI_heavy_R870 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
					},							
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
					}					
				},
				access = access_type_all
			}			
		else
			tweak_data.group_ai.unit_categories.FBI_heavy_R870 = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc")
					},							
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc")
					},	
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc")
					}					
				},
				access = access_type_all
			}
		end			

		--Titan Shields--
		if difficulty_index <= 6 then
			tweak_data.group_ai.unit_categories.FBI_shield = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
					},		
					lapd = {
						Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
					}					
				},
				access = access_type_all,
				special_type = "shield"
			}		
		elseif difficulty_index == 7 then
			tweak_data.group_ai.unit_categories.FBI_shield = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec")								
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")								
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")							
					},						
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec")								
					},	
					lapd = {
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec")								
					}					
				},
				access = access_type_all,
				special_type = "shield"
			}
		else
			tweak_data.group_ai.unit_categories.FBI_shield = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
					},								
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
					},	
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
					}					
				},
				access = access_type_all,
				special_type = "shield"
			}
		end
		
		--Titan Tank--
		tweak_data.group_ai.unit_categories.TIT_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3")					
				},
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")							
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")								
				}							
			},
			access = access_type_all,
			special_type = "tank"
		}		
		
		--OMNIA LPF--
		if difficulty_index <= 6 then
			tweak_data.group_ai.unit_categories.medic_M4 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")
					},					
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
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
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")							
					},					
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")						
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					},	
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					}					
				},
				access = access_type_all,
				special_type = "medic"
			}					
		else
			tweak_data.group_ai.unit_categories.medic_M4 = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")						
					},					
					murkywater = {
						Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic")						
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					},
					lapd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					}					
				},
				access = access_type_all,
				special_type = "medic"
			}	
		end					
		
	end	
	
end