MutatorFactionReplacer = MutatorFactionReplacer or class(BaseMutator)
MutatorFactionReplacer._type = "MutatorFactionReplacer"
MutatorFactionReplacer.name_id = "mutator_faction_replace"
MutatorFactionReplacer.desc_id = "mutator_faction_replace_desc"
MutatorFactionReplacer.has_options = true
MutatorFactionReplacer.reductions = {
	money = 0,
	exp = 0
}
MutatorFactionReplacer.disables_achievements = false
MutatorFactionReplacer.categories = {
	"enemies"
}
MutatorFactionReplacer.incompatibility_tags = {
	"replaces_units"
}
MutatorFactionReplacer.icon_coords = {
	7,
	5
}

function MutatorFactionReplacer:register_values(mutator_manager)
	self:register_value("faction_replace", "america", "fr")
end

function MutatorFactionReplacer:name(lobby_data)
	local name = MutatorFactionReplacer.super.name(self)

	if self:_mutate_name("faction_replace") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_faction_replace_" .. tostring(self:value("faction_replace"))))
	else
		return name
	end
end

function MutatorFactionReplacer:get_faction_override()
	return self:value("faction_replace")
end

function MutatorFactionReplacer:modify_value(id, value)
	if id == "LevelsTweakData:GetFactionOverride" then
		value = self:get_faction_override()
	end
	
	return value
end

function MutatorFactionReplacer:setup_options_gui(node)
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

function MutatorFactionReplacer:_update_faction(item)
	self:set_value("faction_replace", item:value())
end