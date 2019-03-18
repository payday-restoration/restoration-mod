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

	function BlackMarketManager:damage_multiplier(name, categories, silencer, detection_risk, current_state, blueprint)
		local multiplier = 1
		if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
			return multiplier
		end
		for _, category in ipairs(categories) do
			multiplier = multiplier + (1 - managers.player:upgrade_value(category, "damage_multiplier", 1))
		end
		if name ~= "saw" then
			multiplier = multiplier + (1 - managers.player:upgrade_value(name, "damage_multiplier", 1))
		end
		multiplier = multiplier + (1 - managers.player:upgrade_value("player", "passive_damage_multiplier", 1))
		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "passive_damage_multiplier", 1))
		if silencer then
			multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "silencer_damage_multiplier", 1))
		end
		local detection_risk_damage_multiplier = managers.player:upgrade_value("player", "detection_risk_damage_multiplier")
		multiplier = multiplier - managers.player:get_value_from_risk_upgrade(detection_risk_damage_multiplier, detection_risk)
		if managers.player:has_category_upgrade("player", "overkill_health_to_damage_multiplier") then
			local damage_ratio = managers.player:upgrade_value("player", "overkill_health_to_damage_multiplier", 1) - 1
			multiplier = multiplier + damage_ratio
		end
		if current_state and not current_state:in_steelsight() then
			for _, category in ipairs(categories) do
				multiplier = multiplier + (1 - managers.player:upgrade_value(category, "hip_fire_damage_multiplier", 1))
			end
		end
		if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
			multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "modded_damage_multiplier", 1))
		end
		multiplier = multiplier + (1 - managers.player:get_property("trigger_happy", 1))
		return self:_convert_add_to_mul(multiplier)
	end


end