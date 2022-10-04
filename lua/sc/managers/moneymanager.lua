--[

function MoneyManager:get_weapon_price(weapon_id)
	local pc = self:_get_weapon_pc(weapon_id)
	if not tweak_data.money_manager.weapon_cost[pc] then
		if pc and pc > #tweak_data.money_manager.weapon_cost then
			pc = #tweak_data.money_manager.weapon_cost
		else
			pc = 1
		end
	end
	if tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].bmp then
		pc = math.min(#tweak_data.money_manager.weapon_cost, tweak_data.weapon[weapon_id].bmp)
	end
	local cost = self:get_tweak_value("money_manager", "weapon_cost", pc)
	local cost_multiplier = 1
	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local category = weapon_tweak_data and weapon_tweak_data.categories[1]
	cost_multiplier = cost_multiplier * (category and tweak_data.upgrades.weapon_cost_multiplier[category] or 1)

	return math.round(cost * cost_multiplier)
end

function MoneyManager:get_weapon_price_modified(weapon_id)
	local pc = self:_get_weapon_pc(weapon_id)
	if not tweak_data.money_manager.weapon_cost[pc] then
		if pc and pc > #tweak_data.money_manager.weapon_cost then
			pc = #tweak_data.money_manager.weapon_cost
		else
			pc = 1
		end
	end
	if tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].bmp then
		pc = math.min(#tweak_data.money_manager.weapon_cost, tweak_data.weapon[weapon_id].bmp)
	end
	local cost = self:get_tweak_value("money_manager", "weapon_cost", pc)
	local cost_multiplier = 1
	cost_multiplier = cost_multiplier * managers.player:upgrade_value("player", "buy_cost_multiplier", 1)
	cost_multiplier = cost_multiplier * managers.player:upgrade_value("player", "crime_net_deal", 1)
	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local category = weapon_tweak_data and weapon_tweak_data.categories[1]
	cost_multiplier = cost_multiplier * (category and tweak_data.upgrades.weapon_cost_multiplier[category] or 1)

	return math.round(cost * cost_multiplier)
end

--]]