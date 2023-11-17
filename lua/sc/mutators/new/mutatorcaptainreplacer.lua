MutatorCaptainReplacer = MutatorCaptainReplacer or class(BaseMutator)
MutatorCaptainReplacer._type = "MutatorCaptainReplacer"
MutatorCaptainReplacer.name_id = "mutator_captain_replace"
MutatorCaptainReplacer.desc_id = "mutator_captain_replace_desc"
MutatorCaptainReplacer.has_options = true
MutatorCaptainReplacer.reductions = {
	money = 0,
	exp = 0
}
MutatorCaptainReplacer.disables_achievements = false
MutatorCaptainReplacer.categories = {
	"enemies"
}
MutatorCaptainReplacer.icon_coords = {
	2,
	2
}

function MutatorCaptainReplacer:register_values(mutator_manager)
	self:register_value("captain_replace", "winter", "cr")
end

function MutatorCaptainReplacer:name(lobby_data)
	local name = MutatorCaptainReplacer.super.name(self)

	if self:_mutate_name("captain_replace") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_captain_replace_" .. tostring(self:value("captain_replace"))))
	else
		return name
	end
end

function MutatorCaptainReplacer:modify_value(id, value)
	if id == "GroupAITweakData:CaptainReplace" then
		return self:get_captain_override()
	end
		return value
end

function MutatorCaptainReplacer:get_captain_override()
	return self:value("captain_replace")
end

function MutatorCaptainReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "captain_selector_choice",
		text_id = "menu_mutator_captain_replace",
		filter = true,
		update_callback = callback(self, self, "_update_captain_override")
	}
	local data_node = {
		{
			value = "winter",
			text_id = "menu_mutator_captain_replace_winter",
			_meta = "option"
		},
		{
			value = "summer",
			text_id = "menu_mutator_captain_replace_summer",
			_meta = "option"
		},
		{
			value = "spring",
			text_id = "menu_mutator_captain_replace_spring",
			_meta = "option"
		},
		{
			value = "autumn",
			text_id = "menu_mutator_captain_replace_autumn",
			_meta = "option"
		},
		{
			value = "hvh",
			text_id = "menu_mutator_captain_replace_hvh",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_captain_override())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorCaptainReplacer:_update_captain_override(item)
	self:set_value("captain_replace", item:value())
end

function MutatorCaptainReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("captain_selector_choice")

		if slider then
			slider:set_value(self:get_captain_override())
		end
	end
end