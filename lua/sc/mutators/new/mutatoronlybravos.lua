--Bravo Spawns at all times (or RNG dependent) --
MutatorBravosOnly = MutatorBravosOnly or class(BaseMutator)
MutatorBravosOnly._type = "MutatorBravosOnly"
MutatorBravosOnly.name_id = "mutator_bravos_only"
MutatorBravosOnly.desc_id = "mutator_bravos_only_desc"
MutatorBravosOnly.has_options = true
MutatorBravosOnly.reductions = {
	money = 0,
	exp = 0,
}
MutatorBravosOnly.disables_achievements = false
MutatorBravosOnly.categories = {
	"enemies",
}
MutatorBravosOnly.incompatibility_tags = {
	"replaces_units",
}
MutatorBravosOnly.icon_coords = {
	5,
	3,
}

function MutatorBravosOnly:register_values(mutator_manager)
	self:register_value("bravo_replacement", "all", "br")
	self:register_value("bravo_replacement_chance", 0, "brc")
	self:register_value("bravo_replacement_chance_max", 100, "brcm")
	self:register_value("bravo_replacement_chance_increase", 25, "brci")
	self:register_value("bravo_replacement_chance_increase_min_assaults", 0, "brcima")
	self:register_value("bravo_replacement_mode_13_threshold", 100, "brmtt")
end

function MutatorBravosOnly:get_bravo_replacement(id)
	restoration:warn("MutatorBravosOnly:get_bravo_replacement() is deprecated, prefer value method instead!")
	return self:value("bravo_replacement" .. tostring(id or ""))
end

function MutatorBravosOnly:modify_value(id, value)
	if id ~= "GroupAIStateBesiege:SpawningUnit" then
		return value
	end

	-- Modifiers manager already handles Bravo replacement if set to "all"
	local bravo_replacement = self:value("bravo_replacement")
	if bravo_replacement ~= "random" then
		return value
	end

	local replacement_chance = self._bravo_replacement_chance or 0
	if replacement_chance <= 0 then
		return value
	end

	local typ = type(value)
	local unit_name = typ == "string" and Idstring(value) or typ == "userdata" and value or "motherfucker"
	local replacement = managers.modifiers._unit_table[unit_name:key()]
	if not replacement then
		return value
	end

	if math.random(100) <= replacement_chance then
		return replacement
	end

	return value
end

function MutatorBravosOnly:OnAssaultRegrouping(assault_number)
	local bravo_replacement = self:value("bravo_replacement")
	if bravo_replacement ~= "random" then
		return
	end

	assault_number = assault_number or 1
	local min_assaults = self:value("bravo_replacement_chance_increase_min_assaults") or 0
	if assault_number < min_assaults then
		return
	end

	local chance_increase = self:value("bravo_replacement_chance_increase") or 0
	if chance_increase <= 0 then
		return
	end

	local chance_current = self._bravo_replacement_chance or 0
	local chance_max = self:value("bravo_replacement_chance_max") or 1
	self._bravo_replacement_chance = math.min(chance_current + chance_increase, chance_max)
end

function MutatorBravosOnly:OnDifficultyValueChanged(current_value, manual_value)
	if restoration.always_bravos then
		return
	end

	local bravo_replacement = self:value("bravo_replacement")
	if bravo_replacement ~= "mode_13" then
		return
	end

	local new_value = (current_value or 0) + (manual_value or 0.1)
	local mode_13_threshold = (self:value("bravo_replacement_mode_13_threshold") or 100) * 0.01
	if new_value > mode_13_threshold then
		restoration.always_bravos = "mutator_mode_13"
	end
end

function MutatorBravosOnly:setup(data)
	local bravo_replacement = self:value("bravo_replacement")
	if bravo_replacement == "all" then
		restoration.always_bravos = "mutator_all"
	end

	self._bravo_replacement_chance = self:value("bravo_replacement_chance") or 0
end

function MutatorBravosOnly:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "bravo_replacement_choice",
		text_id = "menu_bravo_replacement_choice",
		filter = true,
		update_callback = callback(self, self, "_update_bravo_replacement"),
	}
	local data_node = {
		{
			value = "all",
			text_id = "menu_mutator_bravo_replacement_all",
			_meta = "option",
		},
		{
			value = "random",
			text_id = "menu_mutator_bravo_replacement_random",
			_meta = "option",
		},
		{
			value = "mode_13",
			text_id = "menu_mutator_bravo_replacement_mode_13",
			_meta = "option",
		},
		type = "MenuItemMultiChoice",
	}
	local replacement_choice_item = node:create_item(data_node, params)

	replacement_choice_item:set_value(self:value("bravo_replacement"))
	node:add_item(replacement_choice_item)

	params = {
		name = "bravo_replacement_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_chance"),
	}
	data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = 0,
		max = 100,
	}
	local replacement_chance_item = node:create_item(data_node, params)

	replacement_chance_item:set_value(self:value("bravo_replacement_chance"))
	node:add_item(replacement_chance_item)

	params = {
		name = "bravo_replacement_increase_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_increase_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_chance_increase"),
	}
	data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = 0,
		max = 100,
	}
	local replacement_chance_increase_item = node:create_item(data_node, params)

	replacement_chance_increase_item:set_value(self:value("bravo_replacement_chance_increase"))
	node:add_item(replacement_chance_increase_item)

	params = {
		name = "bravo_replacement_max_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_max_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_chance_max"),
	}
	data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = 0,
		max = 100,
	}
	local replacement_chance_max_item = node:create_item(data_node, params)

	replacement_chance_max_item:set_value(self:value("bravo_replacement_chance_max"))
	node:add_item(replacement_chance_max_item)

	params = {
		name = "bravo_replacement_increase_min_assaults_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_increase_min_assaults_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_chance_increase_min_assaults"),
	}
	data_node = {
		show_value = true,
		step = 1,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 0,
		min = 1,
		max = 5,
	}
	local replacement_chance_increase_min_assaults_item = node:create_item(data_node, params)

	replacement_chance_increase_min_assaults_item:set_value(self:value("bravo_replacement_chance_increase_min_assaults"))
	node:add_item(replacement_chance_increase_min_assaults_item)

	params = {
		name = "bravo_replacement_mode_13_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_mode_13_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_mode_13_threshold"),
	}
	data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 0,
		min = 0,
		max = 100,
	}
	local replacement_mode_13_threshold_item = node:create_item(data_node, params)

	replacement_mode_13_threshold_item:set_value(self:value("bravo_replacement_mode_13_threshold"))
	node:add_item(replacement_mode_13_threshold_item)

	self._node = node

	return replacement_choice_item
end

function MutatorBravosOnly:reset_to_default()
	self:clear_values()

	local node = self._node
	if not node then
		return
	end

	-- Should probably rework to just use the same names for both items and values
	local item_name_values = {
		["bravo_replacement_choice"] = "bravo_replacement",

		["bravo_replacement_slider"] = "bravo_replacement_chance",
		["bravo_replacement_increase_slider"] = "bravo_replacement_chance_increase",
		["bravo_replacement_max_slider"] = "bravo_replacement_chance_max",
		["bravo_replacement_increase_min_assaults_slider"] = "bravo_replacement_chance_increase_min_assaults",

		["bravo_replacement_mode_13_slider"] = "bravo_replacement_mode_13_threshold",
	}
	for item_name, value_name in pairs(item_name_values) do
		local item = node:item(item_name)
		if item then
			item:set_value(self:value(value_name))
		end
	end
end

function MutatorBravosOnly:options_fill()
	local bravo_replacement = self:value("bravo_replacement")
	if bravo_replacement == "all" then
		return 1
	end

	if bravo_replacement == "mode_13" then
		return self:_get_percentage_fill(0, 100, self:value("bravo_replacement_mode_13_threshold"))
	end

	return self:_get_percentage_fill(0, 100, self:value("bravo_replacement_chance"))
end

function MutatorBravosOnly:name()
	local name = MutatorBravosOnly.super.name(self)
	local mutated_name = self:_mutate_name("bravo_replacement")
	if mutated_name == "all" then
		local all = managers.localization:text("menu_mutator_bravo_replacement_all")
		return string.format("%s - %s", name, all)
	elseif mutated_name == "random" then
		local random_chance = managers.localization:text("menu_mutator_bravo_replacement_random")
		local base_chance = self:value("bravo_replacement_chance")
		local max_chance = self:value("bravo_replacement_chance_max")
		if base_chance == max_chance then
			return string.format("%s - %s (%.0f%%)", name, random_chance, base_chance)
		end
		return string.format("%s - %s (%.0f%% - %.0f%%)", name, random_chance, base_chance, max_chance)
	elseif mutated_name == "mode_13" then
		local mode_13 = managers.localization:text("menu_mutator_bravo_replacement_mode_13")
		local mode_13_threshold = self:value("bravo_replacement_mode_13_threshold")
		return string.format("%s - %s (%.0f%%)", name, mode_13, mode_13_threshold)
	end

	return name
end

function MutatorBravosOnly:_update_bravo_replacement(item)
	self:set_value("bravo_replacement", item:value())
end

function MutatorBravosOnly:_update_bravo_replacement_chance(item)
	local chance = item:value()
	self:set_value("bravo_replacement_chance", chance)
	local chance_max = self:value("bravo_replacement_chance_max") or 1
	if chance > chance_max then
		self:set_value("bravo_replacement_chance_max", chance)
	end
end

function MutatorBravosOnly:_update_bravo_replacement_chance_increase(item)
	self:set_value("bravo_replacement_chance_increase", item:value())
end

function MutatorBravosOnly:_update_bravo_replacement_chance_max(item)
	local chance = self:value("bravo_replacement_chance") or 0
	local chance_max = math.max(chance, item:value())
	self:set_value("bravo_replacement_chance_max", chance_max)
end

function MutatorBravosOnly:_update_bravo_replacement_chance_increase_min_assaults(item)
	self:set_value("bravo_replacement_chance_increase_min_assaults", math.round(item:value()))
end

function MutatorBravosOnly:_update_bravo_replacement_mode_13_threshold(item)
	self:set_value("bravo_replacement_mode_13_threshold", math.round(item:value(), 5))
end

