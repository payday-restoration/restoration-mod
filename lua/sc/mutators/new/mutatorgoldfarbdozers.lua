--Just be careful of not meeting two Russian Titandozers
MutatorGoldfarbDozers = MutatorGoldfarbDozers or class(BaseMutator)
MutatorGoldfarbDozers._type = "MutatorGoldfarbDozers"
MutatorGoldfarbDozers.name_id = "mutator_goldfarbdozers"
MutatorGoldfarbDozers.desc_id = "mutator_goldfarbdozers_desc"
MutatorGoldfarbDozers.reductions = {
	money = 0,
	exp = 0
}
MutatorGoldfarbDozers.disables_achievements = false
MutatorGoldfarbDozers.categories = {"crime_spree"}
MutatorGoldfarbDozers.icon_coords = {
	6,
	4
}
 
function MutatorGoldfarbDozers:setup()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--Dozer Pairs, not a pretty way to do it but it works
	if difficulty_index <= 5 then
		tweak_data.group_ai.enemy_spawn_groups.GREEN_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.GREEN_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		tweak_data.group_ai.enemy_spawn_groups.GREEN_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.GREEN_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.GREEN_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.GREEN_tank_DW,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.5,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}					
			}
		}	
	else
		tweak_data.group_ai.enemy_spawn_groups.GREEN_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.GREEN_tank_DW,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.ELITE_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}		
			}
		}			
	end

	if difficulty_index <= 5 then
		tweak_data.group_ai.enemy_spawn_groups.BLACK_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.BLACK_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		tweak_data.group_ai.enemy_spawn_groups.BLACK_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.BLACK_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.BLACK_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.BLACK_tank_DW,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.5,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}	
			}
		}	
	else
		tweak_data.group_ai.enemy_spawn_groups.BLACK_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.BLACK_tank_DW,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = tweak_data.group_ai._tactics.ELITE_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}		
			}
		}			
	end
	
	if difficulty_index <= 5 then
		tweak_data.group_ai.enemy_spawn_groups.SKULL_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.SKULL_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		tweak_data.group_ai.enemy_spawn_groups.SKULL_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.SKULL_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.SKULL_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.SKULL_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.5,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}	
	else
		tweak_data.group_ai.enemy_spawn_groups.SKULL_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.SKULL_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_R870",
					freq = 1,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.ELITE_swat_shotgun,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}	
			}
		}			
	end
	
	if difficulty_index <= 5 then
		tweak_data.group_ai.enemy_spawn_groups.TIT_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.TIT_tank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 1,
					tactics = tweak_data.group_ai._tactics.FBI_heavy,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		tweak_data.group_ai.enemy_spawn_groups.TIT_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.TIT_tank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 1,
					tactics = tweak_data.group_ai._tactics.FBI_heavy,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.TIT_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.TIT_tank,
					rank = 3
				},
				{
					unit = "GS_heavy_G36_w",
					freq = 1,
					amount_min = 1,
					tactics = tweak_data.group_ai._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}	
	else
		tweak_data.group_ai.enemy_spawn_groups.TIT_tanks = {
			amount = {4, 5},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.TIT_tank,
					rank = 3
				},
				{
					unit = "GS_heavy_R870",
					freq = 1,
					amount_min = 1,
					tactics = tweak_data.group_ai._tactics.ELITE_heavy_shotgun,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}			
	end
end
