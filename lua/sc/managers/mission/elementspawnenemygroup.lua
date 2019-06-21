if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
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

	local old_finalize_values = ElementSpawnEnemyGroup._finalize_values
	function ElementSpawnEnemyGroup:_finalize_values()
		old_finalize_values(self)
		
		local job = Global.level_data and Global.level_data.level_id
		
		local groups = self._values.preferred_spawn_groups
		--Ugly fix for levels with fucky spawngroups, but it works
		if job == "Victor Romeo" or job == "hardware_store" or job == "hntn" or job == "bookmakers_office" then
			for name,_ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
				if not table.contains(groups, name) then
					table.insert(groups, name)
				end
			end	
		else
		-- If we have an ordinary spawn with exactly the old group elements, add all defined groups.
			if groups and #groups == #groupsOLD and table.contains_all(groups, groupsOLD) then
				for name,_ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
					if not table.contains(groups, name) then
						table.insert(groups, name)
					end
				end
			end
		end
	end
end