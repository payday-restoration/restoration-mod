--Cloakers have tendency to spawn in groups
ModifierSpoocSquad = ModifierSpoocSquad or class(BaseModifier)
ModifierSpoocSquad._type = "ModifierSpoocSquad"
ModifierSpoocSquad.name_id = "none"
ModifierSpoocSquad.desc_id = "menu_cs_modifier_spoocsquad"


function ModifierSpoocSquad:init(data)
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