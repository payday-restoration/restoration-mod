--Cloakers have tendency to spawn in groups
MutatorSpoocSquad = MutatorSpoocSquad or class(BaseMutator)
MutatorSpoocSquad._type = "MutatorSpoocSquad"
MutatorSpoocSquad.name_id = "mutator_spoocsquad"
MutatorSpoocSquad.desc_id = "mutator_spoocsquad_desc"
MutatorSpoocSquad.reductions = {
	money = 0,
	exp = 0
}
MutatorSpoocSquad.disables_achievements = false
MutatorSpoocSquad.categories = {"crime_spree"}
MutatorSpoocSquad.icon_coords = {
	6,
	4
}
 
function MutatorSpoocSquad:setup()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--Clonker squads	
	if difficulty_index <= 6 then
		tweak_data.group_ai.enemy_spawn_groups.FBI_spoocs = {
		amount = {2, 2},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = tweak_data.group_ai._tactics.spooc,
				rank = 1
			}
		}
	}
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.FBI_spoocs = {
		amount = {2, 3},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 2,
				amount_max = 3,
				tactics = tweak_data.group_ai._tactics.spooc,
				rank = 1
			}
		}
	}	
	else
		tweak_data.group_ai.enemy_spawn_groups.FBI_spoocs = {
		amount = {3, 3},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 3,
				amount_max = 3,
				tactics = tweak_data.group_ai._tactics.spooc,
				rank = 1
			}
		}			
	}
	end
end