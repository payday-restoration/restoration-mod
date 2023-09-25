--Just be careful of not meeting two Russian Titandozers
ModifierDozerPairs = ModifierDozerPairs or class(BaseModifier)
ModifierDozerPairs._type = "ModifierDozerPairs"
ModifierDozerPairs.name_id = "none"
ModifierDozerPairs.desc_id = "menu_cs_modifier_dozerpairs"


function ModifierDozerPairs:init(data)
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