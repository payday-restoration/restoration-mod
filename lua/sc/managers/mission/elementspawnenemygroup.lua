groupsOLD = {
	"tac_shield_wall_charge",
	"FBI_spoocs",
	"tac_tazer_charge",
	"tac_tazer_flanking",
	"tac_shield_wall",
	"tac_swat_rifle_flank",
	"tac_shield_wall_ranged",
	"tac_bull_rush"
}

local job = Global.level_data and Global.level_data.level_id	

local old_finalize_values = ElementSpawnEnemyGroup._finalize_values
function ElementSpawnEnemyGroup:_finalize_values()
	old_finalize_values(self)
			
	local groups = self._values.preferred_spawn_groups
	-- If we have an ordinary spawn with exactly the old group elements, add all defined groups.
	if groups and #groups == #groupsOLD and table.contains_all(groups, groupsOLD) then
		for name,_ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
			if not table.contains(groups, name) then
				table.insert(groups, name)
			end
		end
	end
end
	
--Super ugly fix but it won't work without doing this garbage otherwise, ugh	
for _,h in pairs(restoration.bad_spawn_heists) do
	if job == h then
		function ElementSpawnEnemyGroup:spawn_groups()
			local opt = {}
			for cat_name, team in pairs(tweak_data.group_ai.enemy_spawn_groups) do
				table.insert(opt, cat_name)
			end
			return opt
		end		
		break
	end
end