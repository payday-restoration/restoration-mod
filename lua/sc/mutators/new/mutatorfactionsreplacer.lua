MutatorFactionsReplacer = MutatorFactionsReplacer or class(BaseMutator)
MutatorFactionsReplacer._type = "MutatorFactionsReplacer"
MutatorFactionsReplacer.name_id = "mutator_faction_replace"
MutatorFactionsReplacer.desc_id = "mutator_faction_replace_desc"
MutatorFactionsReplacer.has_options = true
MutatorFactionsReplacer.reductions = {
	money = 0,
	exp = 0
}
MutatorFactionsReplacer.disables_achievements = false
MutatorFactionsReplacer.categories = {
	"enemies"
}
MutatorFactionsReplacer.icon_coords = {
	2,
	2
}

function MutatorFactionsReplacer:register_values(mutator_manager)
	self:register_value("faction_replace", "america", "fr")
end

function MutatorFactionsReplacer:name(lobby_data)
	local name = MutatorFactionsReplacer.super.name(self)

	if self:_mutate_name("faction_replace") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_faction_replace_" .. tostring(self:value("faction_replace"))))
	else
		return name
	end
end

function MutatorFactionsReplacer:get_faction_override()
	return self:value("faction_replace")
end

function MutatorFactionsReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "faction_selector_choice",
		text_id = "menu_mutator_faction_replace",
		filter = true,
		update_callback = callback(self, self, "_update_faction")
	}
	local data_node = {
		{
			value = "america",
			text_id = "menu_mutator_faction_replace_america",
			_meta = "option"
		},
		{
			value = "murkywater",
			text_id = "menu_mutator_faction_replace_murkywater",
			_meta = "option"
		},
		{
			value = "russia",
			text_id = "menu_mutator_faction_replace_russia",
			_meta = "option"
		},
		{
			value = "federales",
			text_id = "menu_mutator_faction_replace_federales",
			_meta = "option"
		},
		{
			value = "zombie",
			text_id = "menu_mutator_faction_replace_zombie",
			_meta = "option"
		},
		{
			value = "nypd",
			text_id = "menu_mutator_faction_replace_nypd",
			_meta = "option"
		},
		{
			value = "lapd",
			text_id = "menu_mutator_faction_replace_lapd",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_faction_override())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorFactionsReplacer:_update_faction(item)
	self:set_value("faction_replace", item:value())
end