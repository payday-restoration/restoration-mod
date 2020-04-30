function BlackMarketManager:equipped_armor(chk_armor_kit, chk_player_state)
	if chk_player_state and managers.player:current_state() == "civilian" then
		return self._defaults.armor
	end
	local armor
	for armor_id, data in pairs(tweak_data.blackmarket.armors) do
		armor = Global.blackmarket_manager.armors[armor_id]
		if armor.equipped and armor.unlocked and armor.owned then
			local forced_armor = self:forced_armor()
			if forced_armor then
				return forced_armor
			end
			return armor_id
		end
	end
	return self._defaults.armor
end

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

function BlackMarketManager:_calculate_weapon_concealment(weapon)
	local factory_id = weapon.factory_id
	local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factory_id)
	local blueprint = weapon.blueprint
	local base_stats = tweak_data.weapon[weapon_id].stats
	local modifiers_stats = tweak_data.weapon[weapon_id].stats_modifiers
	local bonus = 0

	if not base_stats or not base_stats.concealment then
		return 0
	end

	local bonus_stats = {}

	if weapon.cosmetics and weapon.cosmetics.id and weapon.cosmetics.bonus and not managers.job:is_current_job_competitive() and not managers.weapon_factory:has_perk("bonus", factory_id, blueprint) then
		bonus_stats = tweak_data:get_raw_value("economy", "bonuses", tweak_data.blackmarket.weapon_skins[weapon.cosmetics.id].bonus, "stats") or {}
	end

	local parts_stats = managers.weapon_factory:get_stats(factory_id, blueprint)

	return math.min((base_stats.concealment + bonus + (parts_stats.concealment or 0) + (bonus_stats.concealment or 0)) * (modifiers_stats and modifiers_stats.concealment or 1), tweak_data.concealment_cap)
end

function BlackMarketManager:get_silencer_concealment_modifiers(weapon)
	local factory_id = weapon.factory_id
	local blueprint = weapon.blueprint
	local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factory_id)
	local base_stats = tweak_data.weapon[weapon_id].stats
	local bonus = 0

	if not base_stats or not base_stats.concealment then
		return 0
	end

	local silencer = managers.weapon_factory:has_perk("silencer", weapon.factory_id, blueprint)
	local current_concealment = self:calculate_weapon_concealment(weapon)

	if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_increase") then
		bonus = managers.player:upgrade_value("player", "silencer_concealment_increase", 0)
	end

	if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_penalty_decrease") then
		local stats = managers.weapon_factory:get_perk_stats("silencer", factory_id, blueprint)

		if stats and stats.concealment then
			bonus = bonus + math.min(managers.player:upgrade_value("player", "silencer_concealment_penalty_decrease", 0), math.abs(stats.concealment))
		end
	end

	if current_concealment + bonus > tweak_data.concealment_cap then
		return tweak_data.concealment_cap - current_concealment
	end

	return bonus
end