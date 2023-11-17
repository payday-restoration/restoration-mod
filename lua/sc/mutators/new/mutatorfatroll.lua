--Customazible damage grace--
MutatorFatRoll = MutatorFatRoll or class(BaseMutator)
MutatorFatRoll._type = "MutatorFatRoll"
MutatorFatRoll.name_id = "mutator_fatroll"
MutatorFatRoll.desc_id = "mutator_fatroll_desc"
MutatorFatRoll.has_options = true
MutatorFatRoll.reductions = {
	money = 0,
	exp = 0
}
MutatorFatRoll.disables_achievements = false
MutatorFatRoll.categories = {"gameplay"}
MutatorFatRoll.icon_coords = {
	2,
	3
}


function MutatorFatRoll:register_values(mutator_manager)
	self:register_value("fatroll", 0.25, "ft")
end

function MutatorFatRoll:setup(data)
	tweak_data.player.damage.MIN_DAMAGE_INTERVAL = self:get_fatroll()
	tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = self:get_fatroll()
end

function MutatorFatRoll:name()
	local name = MutatorFatRoll.super.name(self)

	if self:_mutate_name("fatroll") then
		return string.format("%s - %.3f", name, tonumber(self:value("fatroll")))
	else
		return name
	end
end

function MutatorFatRoll:get_fatroll()
	return self:value("fatroll")
end

function MutatorFatRoll:_min_grace()
	return 0
end

function MutatorFatRoll:_max_grace()
	return 0.25
end

function MutatorFatRoll:setup_options_gui(node)
	local params = {
		name = "fatroll_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_fatroll",
		update_callback = callback(self, self, "_update_fatroll")
	}
	local data_node = {
		show_value = true,
		step = 0.05,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = self:_min_grace(),
		max = self:_max_grace()
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_fatroll())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorFatRoll:_update_fatroll(item)
	self:set_value("fatroll", item:value())
end

function MutatorFatRoll:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("fatroll_slider")

		if slider then
			slider:set_value(self:get_fatroll())
		end
	end
end

function MutatorFatRoll:options_fill()
	return self:_get_percentage_fill(self:_min_grace(), self:_max_grace(), self:get_fatroll())
end