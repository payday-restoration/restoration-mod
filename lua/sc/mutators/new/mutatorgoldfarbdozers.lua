-- Just be careful you don't meet two Russian Titandozers
MutatorGoldfarbDozers = MutatorGoldfarbDozers or class(BaseMutator)
MutatorGoldfarbDozers._type = "MutatorGoldfarbDozers"
MutatorGoldfarbDozers.name_id = "mutator_goldfarbdozers"
MutatorGoldfarbDozers.desc_id = "mutator_goldfarbdozers_desc"
MutatorGoldfarbDozers.has_options = true
MutatorGoldfarbDozers.reductions = {
	money = 0,
	exp = 0,
}
MutatorGoldfarbDozers.disables_achievements = false
MutatorGoldfarbDozers.categories = {
	"crime_spree",
}
MutatorGoldfarbDozers.icon_coords = {
	6,
	4,
}
MutatorGoldfarbDozers.check_groups = {
	"CS_tanks",
	"GREEN_tanks",
	"BLACK_tanks",
	"SKULL_tanks",
	"TIT_tanks",
}

-- Would have liked to use booleans rather than "on" and "off"
-- _mutate_name() returns false if mutator invalid, and using nil instead of false results in value() returning the default
function MutatorGoldfarbDozers:register_values(mutator_manager)
	self:register_value("always_pairs", "on", "ap")
end

function MutatorGoldfarbDozers:setup()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if difficulty_index <= 5 then
		tweak_data.group_ai.special_unit_spawn_limits.tank = 2
	else
		tweak_data.group_ai.special_unit_spawn_limits.tank = 4
	end

	local amount_min = self:value("always_pairs") == "on" and 2 or 1
	local unit_categories = tweak_data.group_ai.unit_categories
	local enemy_spawn_groups = tweak_data.group_ai.enemy_spawn_groups
	local check_groups = self.check_groups or {
		"CS_tanks",
		"GREEN_tanks",
		"BLACK_tanks",
		"SKULL_tanks",
		"TIT_tanks",
	}
	for _, id in pairs(check_groups) do
		local group = enemy_spawn_groups[id]
		if group and group.spawn then
			if type(group.amount) == "number" then
				group.amount = group.amount + 1
			else
				group.amount = table.collect(group.amount, function(val) return val + 1 end)
			end

			for _, enemy in pairs(group.spawn) do
				if unit_categories[enemy.unit] and unit_categories[enemy.unit].special_type == "tank" then
					enemy.amount_min = amount_min
					enemy.amount_max = 2
					enemy.freq = 0.5
				end
			end
		end
	end
end

function MutatorGoldfarbDozers:setup_options_gui(node)
	local params = {
		name = "goldfarbdozers_always_pairs",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_goldfarbdozers_always_pairs_toggle",
		update_callback = callback(self, self, "_toggle_always_pairs")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:value("always_pairs") == "on" and "on" or "off")
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorGoldfarbDozers:reset_to_default()
	self:clear_values()

	local node = self._node
	if not node then
		return
	end

	local always_pairs = node:item("goldfarbdozers_always_pairs")
	if always_pairs then
		always_pairs:set_value(self:value("always_pairs") == "on" and "on" or "off")
	end
end

function MutatorGoldfarbDozers:options_fill()
	local always_pairs = self:value("always_pairs")
	if always_pairs == "off" then
		return 0
	end

	return 1
end

function MutatorGoldfarbDozers:name()
	local name = MutatorGoldfarbDozers.super.name(self)
	local mutated_name = self:_mutate_name("always_pairs")
	if mutated_name == "on" then
		local always = managers.localization:text("menu_mutator_goldfarbdozers_always_pairs")
		return string.format("%s - %s", name, always)
	elseif mutated_name == "off" then
		local sometimes = managers.localization:text("menu_mutator_goldfarbdozers_sometimes_pairs")
		return string.format("%s - %s", name, sometimes)
	end

	return name
end

function MutatorGoldfarbDozers:_toggle_always_pairs(item)
	self:set_value("always_pairs", item:value() == "on" and "on" or "off")
end
