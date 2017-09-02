if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function ElementSpawnEnemyGroup:spawn_groups()
		local opt = {}
		for cat_name, team in pairs(tweak_data.group_ai.enemy_spawn_groups) do
			if cat_name ~= "single_spooc" or cat_name ~= "Phalanx" then
			table.insert(opt, cat_name)
		end
		end
		return opt
	end

end