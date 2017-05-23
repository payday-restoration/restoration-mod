if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local job = Global.level_data and Global.level_data.level_id
if job == "nomercy" then
--At some point I'll do something with this, probably add PDTH looking Grenadiers (maybe)
else

function GroupAITweakData:_init_unit_categories(difficulty_index)
	local access_type_walk_only = {walk = true}
	local access_type_all = {walk = true, acrobatic = true}
	local Net = _G.LuaNetworking
	local job_id = managers.job and managers.job:current_job_id()
	local tweak = job_id and tweak_data.narrative.jobs[job_id]
	local job = Global.level_data and Global.level_data.level_id
	Month = os.date("%m")
	if difficulty_index <= 2 then
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 1,
			boom = 0,
			spooc = 0,
			shield = 2,
			medic = 0,
			phalanx_minion = 0,
			tank_titan = 0,
			fbi_vet = 0,
			spring = 0
		}
	elseif difficulty_index == 3 then
		self.special_unit_spawn_limits = {
			tank = 2,
			taser = 2,
			boom = 0,
			spooc = 1,
			shield = 4,
			medic = 1,
			phalanx_minion = 0,
			tank_titan = 0,
			fbi_vet = 0,
			spring = 0
		}
	elseif difficulty_index == 4 then
		self.special_unit_spawn_limits = {
			tank = 2,
			taser = 3,
			boom = 1,
			spooc = 2,
			shield = 5,
			medic = 2,
			phalanx_minion = 0,
			tank_titan = 0,
			fbi_vet = 0,
			spring = 1
		}
	elseif difficulty_index == 5 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 3,
			shield = 5,
			medic = 3,
			phalanx_minion = 0,
			tank_titan = 0,
			fbi_vet = 2,
			spring = 1
		}
	elseif difficulty_index == 6 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			boom = 2,
			spooc = 4,
			shield = 5,
			medic = 3,
			phalanx_minion = 0,
			tank_titan = 0,
			fbi_vet = 3,
			spring = 1
		}
	elseif difficulty_index == 7 then
		self.special_unit_spawn_limits = {
			tank = 4,
			taser = 5,
			boom = 3,
			spooc = 4,
			shield = 6,
			medic = 4,
			phalanx_minion = 2,
			tank_titan = 1,
			fbi_vet = 4,
			spring = 1
		}
	else
		self.special_unit_spawn_limits = {
			tank = 5,
			taser = 6,
			boom = 4,
			spooc = 5,
			shield = 7,
			medic = 5,
			phalanx_minion = 3,
			tank_titan = 2,
			fbi_vet = 5,
			spring = 1
		}
	end
	self.unit_categories = {}
	if difficulty_index == 8 then
		self.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
				}
			},
			access = access_type_all,
			special_type = "spooc"
		}
	else
		self.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
				}
			},
			access = access_type_all,
			special_type = "spooc"
		}
	end
	self.unit_categories.CS_cop_C45_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			}
		},
		access = access_type_walk_only
	}
	self.unit_categories.CS_cop_stealth_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			russia = {	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
			}
		},
		access = access_type_walk_only
	}
	if difficulty_index == 8 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal")
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index == 6 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index == 8 then
		self.unit_categories.CS_heavy_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_heavy_M4_w = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				}
			},
			access = access_type_walk_only
		}
	else
		self.unit_categories.CS_heavy_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				}
			},
			access = access_type_all
		}
		self.unit_categories.CS_heavy_M4_w = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				}
			},
			access = access_type_walk_only
		}
	end
	if difficulty_index <= 3 then
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
				}
			},
			access = access_type_all,
			special_type = "taser"
		}
	else 
		self.unit_categories.CS_tazer = {
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
				}
			},
			access = access_type_all,
			special_type = "taser"
		}
	end
	if difficulty_index == 8 then
		self.unit_categories.CS_shield = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
				}
			},
			access = access_type_walk_only,
			special_type = "shield"
		}
	else
		self.unit_categories.CS_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
				}
			},
			access = access_type_walk_only,
			special_type = "shield"
		}
	end
	self.unit_categories.FBI_suit_C45_M4 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2")
			}
		},
		access = access_type_all
	}
	if difficulty_index <= 4 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
	elseif difficulty_index == 6 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
	elseif difficulty_index == 8 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 8 then
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				},
				russia = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump")
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_heavy_G36 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_heavy_G36 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_heavy_G36 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
				}
			},
			access = access_type_all
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_all
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_heavy_G36_w = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				}
			},
			access = access_type_walk_only
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_heavy_G36_w = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_heavy_G36_w = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870")
				}
			},
			access = access_type_walk_only
		}
	end
	if difficulty_index < 7 then
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
				}
			},
			access = access_type_walk_only,
			special_type = "shield"
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
				}
			},
			access = access_type_walk_only,
			special_type = "shield"
		}
	else
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
				}
			},
			access = access_type_walk_only,
			special_type = "shield"
		}
	end
	if job == "haunted" or job == "nail" or job == "help" or Month == "10" then
		if difficulty_index < 5 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		elseif difficulty_index < 7 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
					},
					russia = {
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		elseif difficulty_index < 8 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		else
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		end
	else
		if difficulty_index < 5 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		elseif difficulty_index < 7 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		elseif difficulty_index < 8 then
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2"),
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		else
			self.unit_categories.FBI_tank = {
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc_3/ene_zeal_bulldozer_sc_3"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc_3/ene_zeal_bulldozer_sc_3"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc_3/ene_zeal_bulldozer_sc_3"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
					}
				},
				access = access_type_all,
				special_type = "tank"
			}
		end
	end
	self.unit_categories.boom_M4203 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
			}
		},
		access = access_type_all,
		special_type = "boom"
	}
	self.unit_categories.medic_M4 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			},
			russia = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
			}
		},
		access = access_type_all,
		special_type = "medic"
	}
	self.unit_categories.medic_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			},
			russia = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			}
		},
		access = access_type_all,
		special_type = "medic"
	}
	self.unit_categories.Phalanx_minion = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			}
		},
		access = access_type_walk_only,
		special_type = "shield",
		is_captain = true
	}
	self.unit_categories.Phalanx_vip = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			}
		},
		access = access_type_walk_only,
		special_type = "shield",
		is_captain = true
	}
	self.unit_categories.Cap_Spring = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			}
		},
		max_amount = 1,
		access = access_type_walk_only,
		special_type = "spring"
	}
	self.unit_categories.Tank_Titan = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
			}
		},
		access = access_type_walk_only
	}
end

end

function GroupAITweakData:_init_enemy_spawn_groups(difficulty_index)
	self._tactics = {
		CS_cop = {
			"provide_coverfire",
			"provide_support",
			"ranged_fire"
		},
		CS_cop_stealth = {
			"flank",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_rifle = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			"deathguard"
		},
		CS_swat_shotgun = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_swat_heavy = {
			"smoke_grenade",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support"
		},
		CS_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		CS_swat_rifle_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_shotgun_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_heavy_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_shield_flank = {
			"flank",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		CS_tazer = {
			"flank",
			"charge",
			"flash_grenade",
			"smoke_grenade",
			"shield_cover",
			"murder"
		},
		CS_sniper = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},
		FBI_suit = {
			"flank",
			"ranged_fire",
			"flash_grenade"
		},
		FBI_suit_stealth = {
			"provide_coverfire",
			"provide_support",
			"flash_grenade",
			"flank"
		},
		FBI_swat_rifle = {
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"charge",
			"provide_support",
			"ranged_fire"
		},
		FBI_swat_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover",
			"deathguard"
		},
		FBI_shield = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		Phalanx_minion = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		Phalanx_vip = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		FBI_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_swat_shotgun_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		FBI_shield_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		FBI_tank = {
			"charge",
			"deathguard",
			"shield_cover",
			"smoke_grenade"
		},
		spooc = {
			"charge",
			"shield_cover",
			"smoke_grenade",
			"flash_grenade"
		},
		boom = {
			"flank",
			"charge",
			"flash_grenade",
			"smoke_grenade",
			"shield_cover",
			"murder"
		},
		Cap_spring = {
			"charge",
			"murder"
		},


		--Vanilla shit below
		swat_shotgun_rush = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"deathguard",
			"flash_grenade"
		},
		swat_shotgun_flank = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"flank",
			"deathguard"
		},
		swat_rifle = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},
		swat_rifle_flank = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"flank"
		},
		shield_wall_ranged = {
			"shield",
			"ranged_fire",
			"provide_support "
		},
		shield_support_ranged = {
			"shield_cover",
			"ranged_fire",
			"provide_coverfire"
		},
		shield_wall_charge = {
			"shield",
			"charge",
			"provide_support "
		},
		shield_support_charge = {
			"shield_cover",
			"charge",
			"provide_coverfire",
			"flash_grenade"
		},
		shield_wall = {
			"shield",
			"ranged_fire",
			"provide_support",
			"murder",
			"deathguard"
		},
		tazer_flanking = {
			"flanking",
			"charge",
			"provide_coverfire",
			"smoke_grenade",
			"murder"
		},
		tazer_charge = {
			"charge",
			"provide_coverfire",
			"murder"
		},
		tank_rush = {
			"charge",
			"provide_coverfire",
			"murder"
		}
	}
	self.enemy_spawn_groups = {}
	self.enemy_spawn_groups.CS_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_cops = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_stealth_a = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_cop_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_swats = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_swat_R870",
				freq = 0.5,
				amount_max = 2,
				tactics = self._tactics.CS_swat_shotgun,
				rank = 1
			},
			{
				unit = "CS_swat_MP5",
				freq = 0.33,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_heavys = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_heavy_M4",
				freq = 0.35,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_shields = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.CS_shield,
				rank = 3
			},
			{
				unit = "CS_cop_stealth_MP5",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			},
			{
				unit = "CS_heavy_M4_w",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_swat_heavy,
				rank = 2
			}
		}
	}
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 3,
					tactics_ = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 3,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_tazers = {
			amount = {3, 4},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 3,
					tactics_ = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 3,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	end
	self.enemy_spawn_groups.CS_tanks = {
		amount = {1, 2},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.FBI_tank,
				rank = 2
			},
			{
				unit = "CS_tazer",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_C45_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_d = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_heavy_G36",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 1
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "FBI_swat_R870",
					freq = 0.5,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_swat_R870",
					amount_min = 2,
					freq = 1,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_swats = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_swat_R870",
					amount_min = 2,
					freq = 1,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 4,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 4,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 2
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 3,
					amount_max = 4,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 3,
					amount_max = 4,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_tank,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 0.5,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_tank,
					rank = 3
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_tank,
					rank = 3
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				}
			}
		}
	end
	self.enemy_spawn_groups.Phalanx = {
		amount = {
			self.phalanx.minions.amount + 1,
			self.phalanx.minions.amount + 1
		},
		spawn = {
			{
				unit = "Phalanx_vip",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Phalanx_vip,
				rank = 2
			},
			{
				unit = "Phalanx_minion",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.Phalanx_minion,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.Cap_Spring = {
		amount = {3, 3},
		spawn = {
			{
				unit = "Cap_Spring",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Cap_spring,
				rank = 2
			},
			{
				unit = "Tank_Titan",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.Cap_spring,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.single_spooc = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_Medic = {
			amount = {2, 3},
			spawn = {
				{
					unit = "medic_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_Medic = {
			amount = {2, 3},
			spawn = {
				{
					unit = "medic_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_Medic = {
			amount = {3, 4},
			spawn = {
				{
					unit = "medic_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 3,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 3,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_Boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.boom,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.boom,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_Boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.boom,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.boom,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_Boom = {
			amount = {3, 4},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.boom,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 3,
					tactics = self._tactics.boom,
					rank = 1
				}
			}
		}
	end

	--Vanilla shit below--
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {3, 3},
			spawn = {
				{
					unit = "CS_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "CS_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "CS_heavy_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_rush,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {3, 3},
			spawn = {
				{
					unit = "CS_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "CS_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "CS_heavy_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_R870",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_shotgun_flank,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {3, 3},
			spawn = {
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "CS_heavy_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "CS_heavy_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {3, 3},
			spawn = {
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "CS_heavy_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "CS_heavy_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 3,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.swat_rifle_flank,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "CS_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_heavy_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "CS_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_ranged,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_ranged,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "CS_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_heavy_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "CS_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_swat_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_heavy_R870",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_support_charge,
					rank = 2
				},
				{
					unit = "FBI_shield",
					freq = 2,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.shield_wall_charge,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 4,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 4,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 4,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 4,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.shield_wall,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {2, 2},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.tazer_flanking,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {1, 1},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {2, 2},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.tazer_charge,
					rank = 3
				}
			}
		}
	end
	if difficulty_index <= 2 then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {1, 1},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 3 then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {1, 1},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 4 then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {1, 1},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 5 then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {1, 1},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {1, 1},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {2, 2},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.tank_rush,
					rank = 3
				}
			}
		}
	end
end

function GroupAITweakData:_init_task_data(difficulty_index, difficulty)
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.max_nr_simultaneous_boss_types = 0
	self.difficulty_curve_points = {0.5}
	if difficulty_index <= 2 then
		self.smoke_and_flash_grenade_timeout = {19, 20}
	elseif difficulty_index == 3 then
		self.smoke_and_flash_grenade_timeout = {18, 19}
	elseif difficulty_index == 4 then
		self.smoke_and_flash_grenade_timeout = {17, 18}
	elseif difficulty_index == 5 then
		self.smoke_and_flash_grenade_timeout = {16, 17}
	elseif difficulty_index == 6 then
		self.smoke_and_flash_grenade_timeout = {15, 16}
	elseif difficulty_index == 7 then
		self.smoke_and_flash_grenade_timeout = {14, 15}
	else
		self.smoke_and_flash_grenade_timeout = {13, 14}
	end
	if difficulty_index < 6 then
		self.smoke_grenade_lifetime = 12
	else
		self.smoke_grenade_lifetime = 12
	end
	self.flash_grenade_lifetime = 7.5
	self.flash_grenade = {
		timer = 2.5,
		range = 1000,
		light_color = Vector3(255, 0, 0),
		light_range = 0,
		light_specular = 1,
		beep_speed = {0, 0},
		beep_fade_speed = 0,
		beep_multi = 0
	}
	if difficulty_index < 6 then
		self.flash_grenade.timer = 2.5
	else
		self.flash_grenade.timer = 2.5
	end
	self.optimal_trade_distance = {0, 0}
	self.bain_assault_praise_limits = {1, 3}
	if difficulty_index <= 2 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {180, 300},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {60, 120},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {45, 60},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	end
	self.besiege.regroup.duration = {
		15,
		15,
		15
	}
	self.besiege.assault = {}
	self.besiege.assault.anticipation_duration = {
		{30, 1},
		{30, 1},
		{45, 0.5}
	}
	self.besiege.assault.build_duration = 35
	self.besiege.assault.sustain_duration_min = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_max = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_balance_mul = {
		1,
		1.1,
		1.2,
		1.3,
		1.4,
		1.5,
		1.6,
		1.7,
		1.8,
		1.9,
		2,
		2.1,
		2.2,
		2.4,
		2.5
	}
	self.besiege.assault.fade_duration = 35
	if difficulty_index <= 2 then
		self.besiege.assault.delay = {
			80,
			70,
			30
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.delay = {
			45,
			35,
			20
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.delay = {
			40,
			30,
			20
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.delay = {
			30,
			20,
			15
		}
	else
		self.besiege.assault.delay = {
			20,
			15,
			10
		}
	end
	if difficulty_index <= 5 then
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.hostage_hesitation_delay = {
			15,
			15,
			15
		}
	else
		self.besiege.assault.hostage_hesitation_delay = {
			10,
			10,
			10
		}
	end
	if is_console then
		self.besiege.assault.force = {
			0,
			4,
			7
		}
		self.besiege.assault.force_pool = {
			0,
			60,
			100
		}
	else
		self.besiege.assault.force = {
			0,
			7,
			9
		}
		self.besiege.assault.force_pool = {
			0,
			20,
			50
		}
	end
	if is_console then
		if difficulty_index <= 2 then
			self.besiege.assault.force_balance_mul = {
				1,
				1.1,
				1.2,
				1.3,
				1.4,
				1.5,
				1.6,
				1.7,
				1.8,
				1.9,
				2,
				2.1,
				2.2,
				2.3,
				2.4,
				2.5
			}
			self.besiege.assault.force_pool_balance_mul = {
				1,
				1.1,
				1.2,
				1.3,
				1.4,
				1.5,
				1.6,
				1.7,
				1.8,
				1.9,
				2,
				2.1,
				2.2,
				2.3,
				2.4,
				2.5
			}
		elseif difficulty_index == 3 then
			self.besiege.assault.force_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8,
				2,
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8,
				2,
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4
			}
		elseif difficulty_index == 4 then
			self.besiege.assault.force_balance_mul = {
				1.6,
				1.8,
				2,
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4,
				4.2,
				4.4
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.6,
				1.8,
				2,
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4,
				4.2,
				4.4
			}
		elseif difficulty_index == 5 then
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8,
				3.2,
				3.6,
				4,
				4.4,
				4.8,
				5.2,
				5.6,
				6,
				6.4,
				6.8,
				7.2
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4,
				4.2,
				4.4,
				4.6,
				4.8,
				5
			}
		else
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8,
				3.2,
				3.6,
				4,
				4.4,
				4.8,
				5.2,
				5.6,
				6,
				6.4,
				6.8,
				7.2
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8,
				3,
				3.2,
				3.4,
				3.6,
				3.8,
				4,
				4.2,
				4.4,
				4.6,
				4.8,
				5
			}
		end
	elseif difficulty_index <= 2 then
		self.besiege.assault.force_balance_mul = {
			0.9,
			1.5,
			2,
			2.25,
			2.5,
			2.75,
			3,
			3.25,
			3.5,
			3.75,
			4,
			4.25,
			4.5,
			4.75,
			5
		}
		self.besiege.assault.force_pool_balance_mul = {
			1,
			1.5,
			2,
			2.5,
			3,
			3.5,
			4,
			4.5,
			5,
			5.5,
			6,
			6.5,
			7,
			7.5,
			8
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.force_balance_mul = {
			1,
			1.4,
			1.6,
			1.9,
			2.2,
			2.5,
			2.8,
			3.1,
			3.4,
			3.7,
			4,
			4.3,
			4.6,
			4.9,
			5.2
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.2,
			1.4,
			1.6,
			1.9,
			2.2,
			2.5,
			2.8,
			3.1,
			3.4,
			3.7,
			4,
			4.3,
			4.6,
			4.9,
			5.2
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.force_balance_mul = {
			1.4,
			1.8,
			2,
			2.4,
			2.8,
			3.2,
			3.6,
			4,
			4.4,
			4.8,
			5.2,
			5.6,
			6,
			6.4,
			6.8
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.7,
			2,
			2.2,
			2.5,
			2.8,
			3.1,
			3.4,
			3.7,
			4,
			4.3,
			4.6,
			4.9,
			5.2,
			5.5,
			5.8
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.force_balance_mul = {
			2,
			2.5,
			2.9,
			3.2,
			3.5,
			3.8,
			4.1,
			4.4,
			4.7,
			5,
			5.3,
			5.6,
			5.9,
			6.2,
			6.5
		}
		self.besiege.assault.force_pool_balance_mul = {
			2.2,
			2.4,
			2.6,
			3,
			3.4,
			3.8,
			4.2,
			4.6,
			5,
			5.4,
			5.8,
			6.2,
			6.6,
			7,
			7.4
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.force_balance_mul = {
			3,
			3.2,
			3.5,
			3.9,
			4.3,
			4.7,
			5.1,
			5.5,
			5.9,
			6.3,
			6.7,
			7.1,
			7.5,
			7.9,
			8.3
		}
		self.besiege.assault.force_pool_balance_mul = {
			2,
			4,
			6,
			8,
			10,
			12,
			14,
			16,
			18,
			20,
			22,
			24,
			26,
			28,
			30
		}
	elseif difficulty_index == 7 then
		self.besiege.assault.force_balance_mul = {
			3,
			3.2,
			3.5,
			3.9,
			4.3,
			4.7,
			5.1,
			5.5,
			5.9,
			6.3,
			6.7,
			7.1,
			7.5,
			7.9,
			8.3
		}
		self.besiege.assault.force_pool_balance_mul = {
			2,
			4,
			6,
			8,
			10,
			12,
			14,
			16,
			18,
			20,
			22,
			24,
			26,
			28,
			30
		}
	else
		self.besiege.assault.force_balance_mul = {
			4,
			4.2,
			4.5,
			4.9,
			5.3,
			5.7,
			6.1,
			6.5,
			6.9,
			7.3,
			7.7,
			8.1,
			8.5,
			8.9,
			9.3
		}
		self.besiege.assault.force_pool_balance_mul = {
			3,
			5,
			7,
			9,
			11,
			13,
			15,
			17,
			19,
			21,
			23,
			25,
			27,
			29,
			31
		}
	end
	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			CS_swats = {
				0,
				1,
				0.85
			},
			CS_shields = {
				0,
				0,
				0.15
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.groups = {
			CS_swats = {
				0,
				1,
				0
			},
			CS_heavys = {
				0,
				0.2,
				0.7
			},
			CS_shields = {
				0,
				0.02,
				0.2
			},
			CS_tazers = {
				0,
				0.05,
				0.15
			},
			CS_tanks = {
				0,
				0.01,
				0.05
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.1,
				1,
				1
			},
			FBI_heavys = {
				0.05,
				0.25,
				0.5
			},
			FBI_shields = {
				0.1,
				0.2,
				0.2
			},
			FBI_tanks = {
				0,
				0.1,
				0.15
			},
			FBI_spoocs = {
				0,
				0.1,
				0.2
			},
			FBI_Medic = {
				0.05,
				0.15,
				0.2
			},
			CS_tazers = {
				0.05,
				0.15,
				0.2
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				1,
				1
			},
			FBI_heavys = {
				0.1,
				0.5,
				0.75
			},
			FBI_shields = {
				0.1,
				0.3,
				0.4
			},
			FBI_tanks = {
				0,
				0.25,
				0.3
			},
			CS_tazers = {
				0.1,
				0.25,
				0.25
			},
			FBI_Medic = {
				0.1,
				0.25,
				0.25
			}
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				1,
				1
			},
			FBI_heavys = {
				0.1,
				0.5,
				0.75
			},
			FBI_shields = {
				0.1,
				0.3,
				0.4
			},
			FBI_tanks = {
				0,
				0.25,
				0.3
			},
			CS_tazers = {
				0.1,
				0.25,
				0.25
			},
			FBI_Medic = {
				0.1,
				0.25,
				0.25
			}
		}
	else
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				0.8,
				0.8
			},
			FBI_heavys = {
				0.1,
				0.3,
				0.4
			},
			FBI_shields = {
				0.1,
				0.5,
				0.4
			},
			FBI_tanks = {
				0.1,
				0.5,
				0.5
			},
			CS_tazers = {
				0.1,
				0.5,
				0.45
			},
			FBI_Medic = {
				0.1,
				0.5,
				0.45
			},
			FBI_spoocs = {
				0,
				0.45,
				0.45
			}
		}
	end
	self.besiege.assault.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.Phalanx = {
		0,
		0,
		0
	}
	--Captain stuff here--
	if job == "branchbank" or job == "firestarter_3" or job == "man" or job == "framing_frame_3" or job == "four_stores" or job == "alex_2" or job == "flat" then
		if difficulty_index <= 3 then
			self.besiege.assault.groups.Cap_Spring = {
				0,
				0,
				0
			}
		elseif difficulty_index == 4 then
			self.besiege.assault.groups.Cap_Spring = {
				0.025,
				0.025,
				0.025
			}
		elseif difficulty_index == 5 then
			self.besiege.assault.groups.Cap_Spring = {
				0.025,
				0.025,
				0.025
			}
		else
			self.besiege.assault.groups.Cap_Spring = {
				0.025,
				0.025,
				0.025
			}
		end
	end
	self.besiege.reenforce.interval = {
		10,
		20,
		30
	}
	if difficulty_index <= 2 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0.2,
				0
			},
			CS_defend_b = {
				0,
				1,
				1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0,
				0
			},
			CS_defend_b = {
				2,
				1,
				0
			},
			CS_defend_c = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0,
				0
			},
			CS_defend_b = {
				2,
				1,
				0
			},
			CS_defend_c = {
				0,
				0,
				1
			},
			FBI_defend_a = {
				0,
				1,
				0
			},
			FBI_defend_b = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				1,
				1,
				0
			},
			FBI_defend_c = {
				0,
				1,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}
	else
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				1,
				1,
				0
			},
			FBI_defend_c = {
				0,
				1,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}
	end
	self.besiege.recon.interval = {
		5,
		5,
		5
	}
	self.besiege.recon.interval_variation = 40
	if difficulty_index < 6 then
		self.besiege.recon.force = {
			2,
			4,
			6
		}
	else
		self.besiege.recon.force = {
			3,
			4,
			6
		}
	end
	if difficulty_index <= 2 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				1,
				0
			},
			CS_swats = {
				0,
				1,
				1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				0,
				0
			},
			CS_swats = {
				0,
				1,
				1
			},
			CS_tazers = {
				0,
				0.1,
				0.15
			},
			FBI_stealth_b = {
				0,
				0,
				0.1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				1,
				0.5,
				0
			},
			FBI_stealth_b = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.5,
				1,
				1
			},
			FBI_stealth_b = {
				0.25,
				0.5,
				1
			}
		}
	else
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.5,
				1,
				1
			},
			FBI_stealth_b = {
				0.25,
				0.5,
				1
			}
		}
	end
	self.besiege.recon.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.cloaker.groups = {
		single_spooc = {
			1,
			1,
			1
		}
	}
	self.street = deep_clone(self.besiege)
	self.phalanx.minions.min_count = 0
	self.phalanx.minions.amount = 10
	self.phalanx.minions.distance = 100
	self.phalanx.vip.health_ratio_flee = 0.05
	if difficulty_index == 4 then
		self.phalanx.vip.force_sprint = {true}
		self.phalanx.vip.assault_force_multiplier = {1.1}
		self.phalanx.vip.damage_reduction = {
			start = 0.000001,
			increase = 0,
			max = 0.000001,
			increase_intervall = 0
	}
	elseif difficulty_index == 5 then
		self.phalanx.vip.force_sprint = {true}
		self.phalanx.vip.assault_force_multiplier = {1.2}
		self.phalanx.vip.damage_reduction = {
			start = 0.000001,
			increase = 0,
			max = 0.000001,
			increase_intervall = 0
		}
	elseif difficulty_index == 6 then
		self.phalanx.vip.force_sprint = {true}
		self.phalanx.vip.assault_force_multiplier = {1.3}
		self.phalanx.vip.damage_reduction = {
			start = 0.000001,
			increase = 0,
			max = 0.000001,
			increase_intervall = 0
		}
	elseif difficulty_index == 7 then
		self.phalanx.vip.force_sprint = {true}
		self.phalanx.vip.assault_force_multiplier = {1.4}
		self.phalanx.vip.damage_reduction = {
			start = 0.000001,
			increase = 0,
			max = 0.000001,
			increase_intervall = 0
		}
	elseif difficulty_index == 8 then
		self.phalanx.vip.force_sprint = {true}
		self.phalanx.vip.assault_force_multiplier = {1.5}
		self.phalanx.vip.damage_reduction = {
			start = 0.000001,
			increase = 0,
			max = 0.000001,
			increase_intervall = 0
		}
	else
		self.phalanx.vip.force_sprint = nil
		self.phalanx.vip.assault_force_multiplier = {1}
		self.phalanx.vip.damage_reduction = {
			start = 0,
			increase = 0,
			max = 0,
			increase_intervall = 0
		}
	end
	self.phalanx.check_spawn_intervall = 120
	self.phalanx.chance_increase_intervall = 120
	if difficulty_index == 4 then
		self.phalanx.spawn_chance = {
			start = 0,
			increase = 0.05,
			decrease = 0.7,
			max = 1,
			respawn_delay = 1500
		}
	elseif difficulty_index == 5 then
		self.phalanx.spawn_chance = {
			start = 0.01,
			increase = 0.09,
			decrease = 0.7,
			max = 1,
			respawn_delay = 1200
		}
	elseif difficulty_index == 6 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 900
		}
	elseif difficulty_index == 7 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 600
		}
	elseif difficulty_index == 8 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 300
		}
	else
		self.phalanx.spawn_chance = {
			start = 0,
			increase = 0,
			decrease = 0,
			max = 0,
			respawn_delay = 120
		}
	end
	self.safehouse = deep_clone(self.besiege)
end

end