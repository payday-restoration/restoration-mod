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
--[[
function BlackMarketManager:fire_rate_multiplier(name, categories, silencer, detection_risk, current_state, blueprint)
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local tweak_data = tweak_data.weapon
	local weapon = tweak_data[name]
	local factory = tweak_data.factory[factory_id]
	local default_blueprint = factory and factory.default_blueprint			
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
]]--

function BlackMarketManager:visibility_modifiers()
	local skill_bonuses = 0
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "passive_concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "melee_concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "deep_pockets_concealment_modifier", 0)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]

	if armor_data.upgrade_level == 2 or armor_data.upgrade_level == 3 or armor_data.upgrade_level == 4 then
		skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "ballistic_vest_concealment", 0)
	elseif armor_data.upgrade_level == 5 then 
		skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "flak_jacket_concealment", 0)
	end
	
	local silencer_bonus = 0
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_primary())
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_secondary())
	skill_bonuses = skill_bonuses - silencer_bonus

	return skill_bonuses
end

function BlackMarketManager:concealment_modifier(type, upgrade_level)
	local modifier = 0

	if type == "armors" then
		modifier = modifier + managers.player:upgrade_value("player", "passive_concealment_modifier", 0)
		modifier = modifier + managers.player:upgrade_value("player", "concealment_modifier", 0)
		modifier = modifier + managers.player:upgrade_value("player", "deep_pockets_concealment_modifier", 0)

		if upgrade_level == 2 or upgrade_level == 3 or upgrade_level == 4 then
			modifier = modifier + managers.player:upgrade_value("player", "ballistic_vest_concealment", 0)
		elseif upgrade_level == 5 then
			modifier = modifier + managers.player:upgrade_value("player", "flak_jacket_concealment", 0)
		end
	elseif type == "melee_weapons" then
		modifier = modifier + managers.player:upgrade_value("player", "melee_concealment_modifier", 0)
	end

	return modifier
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
	if weapon then
		local factory_id = weapon.factory_id
		local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factory_id)
		local blueprint = weapon.blueprint
		local base_stats = weapon_id and tweak_data.weapon[weapon_id].stats
		local modifiers_stats = weapon_id and tweak_data.weapon[weapon_id].stats_modifiers
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
	else
		log("Somehow called this function without an argument to define a weapon")
		return 0
	end
end

function BlackMarketManager:get_silencer_concealment_modifiers(weapon)
	if weapon then
		local factory_id = weapon.factory_id
		local blueprint = weapon.blueprint
		local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factory_id)
		local base_stats = weapon_id and tweak_data.weapon[weapon_id].stats
		local bonus = 0
	
		if not base_stats or not base_stats.concealment then
			return 0
		end


		local silencer = managers.weapon_factory:has_perk("silencer", weapon.factory_id, blueprint)
		local current_concealment = self:calculate_weapon_concealment(weapon)
		
		--[[
		if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_increase") then
			bonus = managers.player:upgrade_value("player", "silencer_concealment_increase", 0)
		end
		--]]
		
		if managers.player:has_category_upgrade("player", "weapon_concealment_increase") then
			bonus = managers.player:upgrade_value("player", "weapon_concealment_increase", 0)
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
	else
		log("Somehow called this function without an argument to define a weapon")
		return 0
	end
end

Hooks:RegisterHook("BlackMarketManagerModifyGetInventoryCategory")
function BlackMarketManager.get_inventory_category(self, category)

	local t = {}

	for global_value, categories in pairs(self._global.inventory) do
		if categories[category] then

			for id, amount in pairs(categories[category]) do
				table.insert(t, {
					id = id,
					global_value = global_value,
					amount = amount
				})
			end

		end
	end

	Hooks:Call("BlackMarketManagerModifyGetInventoryCategory", self, category, t)

	return t

end

--Returns bonus to the stability stat from skills.
function BlackMarketManager:stability_index_addend(categories, silencer)
	local pm = managers.player

	--Weapon category specific buffs.
	local index = pm:upgrade_value("weapon", "recoil_index_addend", 0)

	for _, category in ipairs(categories) do
		index = index + pm:upgrade_value(category, "recoil_index_addend", 0)
	end

	--Teamwide buffs.
	if managers.player:has_team_category_upgrade("weapon", "recoil_index_addend") then
		index = index + pm:team_upgrade_value("weapon", "recoil_index_addend", 0)
	end

	for _, category in ipairs(categories) do
		if managers.player:has_team_category_upgrade(category, "recoil_index_addend") then
			index = index + pm:team_upgrade_value(category, "recoil_index_addend", 0)
		end
	end

	--Silencer stability boost.
	if self._silencer then
		index = index + pm:upgrade_value("weapon", "silencer_recoil_index_addend", 0)
	end

	return index
end

function BlackMarketManager:accuracy_index_addend(name, categories, silencer, current_state, fire_mode, blueprint)
	local pm = managers.player
	local index = 0

	for _, category in ipairs(categories) do
		index = index + pm:upgrade_value(category, "spread_index_addend", 0)
	end

	if silencer then
		index = index + pm:upgrade_value("weapon", "silencer_spread_index_addend", 0)
	end

	return index
end

-- if restoration.Options:GetValue("OTHER/PDTHChallenges") then
	Hooks:PostHook(BlackMarketManager, "save", "PDTHHudSaveChallenges", function(self, data)
		managers.challenges_res:save(data)
	end)
	Hooks:PostHook(BlackMarketManager, "load", "PDTHHudLoadChallenges", function(self, data)
		managers.challenges_res:load(data)
	end)
-- end

function BlackMarketManager:get_real_mask_id(mask_id, peer_id, char)
	if not tweak_data.blackmarket.masks[mask_id] then
		Application:error("[BlackMarketManager:get_real_mask_id] Missing mask:" .. mask_id .. ". Using dallas mask!")

		return "dallas"
	end

	local i_just_drank_my_toilet_water = not peer_id and math.rand(1) or 10
	if char and char == "wild" and i_just_drank_my_toilet_water <= 0.01 then
		local how_does_that_make_you_feel_lil_donnie = math.rand(1)
		return how_does_that_make_you_feel_lil_donnie <= 0.01 and "win_donald_mega" or "win_donald"
	end

	if tweak_data.blackmarket.masks[mask_id].characters then
		local character = self:get_real_character(char, peer_id)
		if not tweak_data.blackmarket.masks[mask_id].characters[character] and not Application:production_build() then
			for index, _ in pairs(tweak_data.blackmarket.masks[mask_id].characters) do
				character = index

				break
			end
		end

		print("[BlackMarketManager].get_real_mask_id", mask_id, character, tweak_data.blackmarket.masks[mask_id].characters[character])

		return tweak_data.blackmarket.masks[mask_id].characters[character] or "dallas"
	end

	if mask_id ~= "character_locked" then
		return mask_id
	end

	local character = self:get_real_character(char, peer_id)

	return tweak_data.blackmarket.masks[mask_id][character] or "dallas"
end
