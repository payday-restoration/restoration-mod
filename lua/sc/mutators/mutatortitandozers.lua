MutatorTitandozers = MutatorTitandozers or class(BaseMutator)
MutatorTitandozers._type = "MutatorTitandozers"
MutatorTitandozers.name_id = "mutator_titandozers"
MutatorTitandozers.desc_id = "mutator_titandozers_desc"
MutatorTitandozers.reductions = {
	money = 0,
	exp = 0
}
MutatorTitandozers.disables_achievements = false
MutatorTitandozers.categories = {
	"holiday"
}
MutatorTitandozers.incompatibility_tags = {
	"holiday_effect"
}
MutatorTitandozers.icon_coords = {
	1,
	3
}
MutatorTitandozers.load_priority = -10
 
function MutatorTitandozers:setup()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if restoration then
		restoration.force_halloween = true
	end
	
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.america[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.russia[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.zombie[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.murkywater[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.federales[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.nypd[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.lapd[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	tweak_data.group_ai.unit_categories.BLACK_tank.unit_types.fbi[1] = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
	
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.america[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.russia[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.zombie[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.murkywater[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.federales[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.nypd[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.lapd[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	tweak_data.group_ai.unit_categories.TIT_tank.unit_types.fbi[1] = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
	
	--Replace Spring, not a pretty way to do it but it works
	if difficulty_index <= 5 then
		tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = {
			amount = 1,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = {
			amount = 3,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = {
			amount = 5,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc_Normal",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}	
	else
		tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = {
			amount = 7,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}					
			}
		}			
	end	
end

--Wipe the function
function MutatorTitandozers:modify_unit_categories(group_ai_tweak, difficulty_index)
end

--Wipe the function
function MutatorTitandozers:_get_unit_group_titandozer(difficulty_index)
end