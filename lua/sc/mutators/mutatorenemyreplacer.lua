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
	table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
	table.insert(unit_types_black.murkywater, classic_medic_unit_name)
	table.insert(unit_types_black.nypd, classic_mini_unit_name)
	table.insert(unit_types_black.lapd, classic_mini_unit_name)				
	else		
	table.insert(unit_types_black.america, mini_unit_name)
	table.insert(unit_types_black.russia, mini_unit_name)
	table.insert(unit_types_black.zombie, mini_unit_name)
	table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))		
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
	table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
	table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	table.insert(unit_types.nypd, classic_medic_unit_name)
	table.insert(unit_types.lapd, classic_medic_unit_name)
	
	table.insert(unit_types_black.america, classic_medic_unit_name)
	table.insert(unit_types_black.russia, classic_medic_unit_name)
	table.insert(unit_types_black.zombie, classic_medic_unit_name)
	table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
	table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	table.insert(unit_types_black.nypd, classic_medic_unit_name)
	table.insert(unit_types_black.lapd, classic_medic_unit_name)

	table.insert(unit_types_skull.america, classic_medic_unit_name)
	table.insert(unit_types_skull.russia, classic_medic_unit_name)
	table.insert(unit_types_skull.zombie, classic_medic_unit_name)
	table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
	table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	table.insert(unit_types_skull.nypd, classic_medic_unit_name)
	table.insert(unit_types_skull.lapd, classic_medic_unit_name)			
	else
	table.insert(unit_types.america, medic_unit_name)
	table.insert(unit_types.russia, medic_unit_name)
	table.insert(unit_types.zombie, medic_unit_name)
	table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
	table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	table.insert(unit_types.nypd, medic_unit_name)
	table.insert(unit_types.lapd, medic_unit_name)
	
	table.insert(unit_types_black.america, medic_unit_name)
	table.insert(unit_types_black.russia, medic_unit_name)
	table.insert(unit_types_black.zombie, medic_unit_name)
	table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
	table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
	table.insert(unit_types_black.nypd, medic_unit_name)
	table.insert(unit_types_black.lapd, medic_unit_name)

	table.insert(unit_types_skull.america, medic_unit_name)
	table.insert(unit_types_skull.russia, medic_unit_name)
	table.insert(unit_types_skull.zombie, medic_unit_name)
	table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_medic/ene_swat_dozer_policia_federale_medic"))
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
MutatorMememanOnly.incompatibility_tags = {
	"replaces_units"
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
				Idstring("units/pd2_mod_dave/characters/ene_big_dave/ene_big_dave"),
				Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
				Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2"),
				Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
				Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2")					
			}		
			end		
		end
	end
end	

MutatorMoreDonutsPlus = MutatorMoreDonutsPlus or class(BaseMutator)
MutatorMoreDonutsPlus._type = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.name_id = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.desc_id = "MutatorMoreDonutsPlus_desc"
MutatorMoreDonutsPlus.reductions = {
	money = 0.5, --Because you're essentially committing a major atrocity by enabling this mutator.
	exp = 0.5
}
MutatorMoreDonutsPlus.disables_achievements = true
MutatorMoreDonutsPlus.categories = {"enemies"}
MutatorMoreDonutsPlus.incompatibility_tags = {
	"replaces_units"
}
MutatorMoreDonutsPlus.icon_coords = {
	6,
	1
}	

function MutatorMoreDonutsPlus:setup(data)
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)	
end

function MutatorMoreDonutsPlus:modify_unit_categories(group_ai_tweak, difficulty_index)	
	group_ai_tweak.special_unit_spawn_limits = {
	tank = 0,
	taser = 0,
	spooc = 0,
	shield = 0,
	medic = math.huge
}
for group, units_data in pairs(group_ai_tweak.unit_categories) do
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
	
	else
		for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")					
			}		
			end		
		end
	end
end		

MutatorJungleInferno = MutatorJungleInferno or class(BaseMutator)
MutatorJungleInferno._type = "MutatorJungleInferno"
MutatorJungleInferno.name_id = "MutatorJungleInferno"
MutatorJungleInferno.desc_id = "MutatorJungleInferno_desc"
MutatorJungleInferno.reductions = {
	money = 0,
	exp = 0
}
MutatorJungleInferno.incompatibility_tags = {
	"replaces_units"
}		
MutatorJungleInferno.disables_achievements = true
MutatorJungleInferno.categories = {"enemies"}
MutatorJungleInferno.icon_coords = {
	6,
	1
}	

function MutatorJungleInferno:setup(data)
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)
	tweak_data.character.summers.announce_incomming = nil
	tweak_data.character.summers.ends_assault_on_death = false --never ending assaults ;^)
	tweak_data.character.summers.spawn_sound_event = "cloaker_spawn"		
end

function MutatorJungleInferno:modify_unit_categories(group_ai_tweak, difficulty_index)	
	group_ai_tweak.special_unit_spawn_limits = {
	tank = 0,
	taser = 0,
	spooc = 0,
	shield = 0,
	medic = 0,
	summers = 24
}
for group, units_data in pairs(group_ai_tweak.unit_categories) do
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
	
	else
		for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")					
			}		
			end		
		end
	end
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")							
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")							
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
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")			
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale")			
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")					
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")					
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),			
					Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")					
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")						
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")							
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3")							
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")							
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")						
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump")
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
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
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
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc")
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
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
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")					
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
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
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
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

MutatorZombieOutbreak = MutatorZombieOutbreak or class(BaseMutator)
MutatorZombieOutbreak._type = "MutatorZombieOutbreak"
MutatorZombieOutbreak.name_id = "mutator_zombie_outbreak"
MutatorZombieOutbreak.desc_id = "mutator_zombie_outbreak_desc"
MutatorZombieOutbreak.has_options = false
MutatorZombieOutbreak.reductions = {
	money = 0.35,
	exp = 0.35
}
MutatorZombieOutbreak.disables_achievements = false
MutatorZombieOutbreak.categories = {
	"enemies"
}
MutatorZombieOutbreak.incompatibility_tags = {
	"replaces_units"
}
MutatorZombieOutbreak.icon_coords = {
	6,
	1
}

function MutatorZombieOutbreak:setup()
	if not PackageManager:loaded("packages/zombieassets") then
		PackageManager:load("packages/zombieassets")
	end
	if not PackageManager:loaded("packages/zombieassetsnew") then
		PackageManager:load("packages/zombieassetsnew")
	end
	if not PackageManager:loaded("levels/narratives/bain/hvh/world_sounds") then
		PackageManager:load("levels/narratives/bain/hvh/world_sounds")
	end
	local group_ai_tweak = tweak_data.group_ai
	for k, v in pairs(group_ai_tweak.unit_categories or {}) do
		if v.unit_types and v.unit_types.zombie then
			group_ai_tweak.unit_categories[k].unit_types.america = {}
			group_ai_tweak.unit_categories[k].unit_types.russia = {}
			-- group_ai_tweak.unit_categories[k].unit_types.zombie = {}
			group_ai_tweak.unit_categories[k].unit_types.murkywater = {}
			group_ai_tweak.unit_categories[k].unit_types.nypd = {}
			group_ai_tweak.unit_categories[k].unit_types.lapd = {}

			group_ai_tweak.unit_categories[k].unit_types.america = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.russia = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.zombie = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.murkywater = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.nypd = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.lapd = deep_clone(v.unit_types.zombie)
		end
	end
end

MutatorFactionsReplacer = MutatorFactionsReplacer or class(BaseMutator)
MutatorFactionsReplacer._type = "MutatorFactionsReplacer"
MutatorFactionsReplacer.name_id = "mutator_faction_override"
MutatorFactionsReplacer.desc_id = "mutator_faction_override_desc"
MutatorFactionsReplacer.has_options = true
MutatorFactionsReplacer.reductions = {
	money = 0.35,
	exp = 0.35
}
MutatorFactionsReplacer.disables_achievements = false
MutatorFactionsReplacer.categories = {
	"enemies"
}
MutatorFactionsReplacer.incompatibility_tags = {
	"replaces_units"
}
MutatorFactionsReplacer.icon_coords = {
	6,
	1
}

function MutatorFactionsReplacer:register_values(mutator_manager)
	self:register_value("faction_override", self:default_faction_override(), "oe")
end

function MutatorFactionsReplacer:name(lobby_data)
	local name = MutatorFactionsReplacer.super.name(self)

	if self:_mutate_name("faction_override") then
		return string.format("%s - %s", name, managers.localization:text("mutator_faction_override_" .. tostring(self:value("faction_override"))))
	else
		return name
	end
end

function MutatorFactionsReplacer:get_faction_override()
	return self:value("faction_override")
end

-- Lines 54-56
function MutatorFactionsReplacer:default_faction_override()
	return "america"
end

function MutatorFactionsReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "faction_selector_choice",
		text_id = "mutator_faction_override_select",
		filter = true,
		update_callback = callback(self, self, "_update_selected_faction")
	}

	local data_node = {
		{
			value = "america",
			text_id = "mutator_faction_override_america",
			_meta = "option"
		},
		{
			value = "russia",
			text_id = "mutator_faction_override_russia",
			_meta = "option"
		},
		{
			value = "zombie",
			text_id = "mutator_faction_override_zombie",
			_meta = "option"
		},
		{
			value = "murkywater",
			text_id = "mutator_faction_override_murkywater",
			_meta = "option"
		},
		{
			value = "nypd",
			text_id = "mutator_faction_override_nypd",
			_meta = "option"
		},
		{
			value = "lapd",
			text_id = "mutator_faction_override_lapd",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_faction_override())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorFactionsReplacer:_update_selected_faction(item)
	self:set_value("faction_override", item:value())
end

function MutatorFactionsReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("faction_selector_choice")

		if slider then
			slider:set_value(self:default_faction_override())
		end
	end
end