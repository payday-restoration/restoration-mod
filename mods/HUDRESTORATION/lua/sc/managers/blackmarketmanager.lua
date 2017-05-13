if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	--fire rate multiplier blackmarket statchart stuff	
	function BlackMarketManager:fire_rate_multiplier(name, categories, silencer, detection_risk, current_state, blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local tweak_data = tweak_data.weapon
		local weapon = tweak_data[name]
		local factory = tweak_data.factory[factory_id]
		local default_blueprint = factory.default_blueprint			
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
		local multiplier = 1
		local rof_multiplier = 1
		self._block_eq_aced = nil
	
		for part_id, stats in pairs(custom_stats) do
			if stats.rof_mult then
				rof_multiplier = rof_multiplier * stats.rof_mult
			end
		end
		multiplier = rof_multiplier

 		multiplier = multiplier + (1 - managers.player:upgrade_value(name, "fire_rate_multiplier", 1))
 		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1))
		for _, category in ipairs(categories) do
			multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)
		end
									
		return multiplier
	end


end