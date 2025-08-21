--asian man laughing at bruce willis flip flopping--
MutatorMasterDodger = MutatorMasterDodger or class(BaseMutator)
MutatorMasterDodger._type = "MutatorMasterDodger"
MutatorMasterDodger.name_id = "mutator_masterdodger"
MutatorMasterDodger.desc_id = "mutator_masterdodger_desc"
MutatorMasterDodger.has_options = true
MutatorMasterDodger.reductions = {
	money = 0,
	exp = 0
}
MutatorMasterDodger.disables_achievements = false
MutatorMasterDodger.categories = {"crime_spree"}

MutatorMasterDodger.icon_coords = {
	6,
	4
}

function MutatorMasterDodger:register_values(mutator_manager)
	self:register_value("masterdodger", 35, "nad_adc")
end

function MutatorMasterDodger:setup(data)
	tweak_data.character.fbi_vet.damage.bullet_dodge_chance = self:get_masterdodger()
end

function MutatorMasterDodger:name()
	local name = MutatorMasterDodger.super.name(self)

	if self:_mutate_name("masterdodger") then
		return string.format("%s - %.0f%%", name, tonumber(self:value("masterdodger")))
	else
		return name
	end
end

function MutatorMasterDodger:get_masterdodger()
	return self:value("masterdodger")
end

function MutatorMasterDodger:setup_options_gui(node)
	local params = {
		name = "masterdodger_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_masterdodger",
		update_callback = callback(self, self, "_update_masterdodger")
	}
	local data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 0,
		min = 0,
		max = 100
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_masterdodger())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorMasterDodger:_update_masterdodger(item)
	self:set_value("masterdodger", item:value())
end

function MutatorMasterDodger:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("masterdodger_slider")

		if slider then
			slider:set_value(self:get_masterdodger())
		end
	end
end

function MutatorMasterDodger:options_fill()
	return self:_get_percentage_fill(0, 100, self:get_masterdodger())
end