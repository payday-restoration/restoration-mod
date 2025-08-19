-- Hotline Miami mutator idk. Disables ammo pickups or let you make them % chance based
MutatorNoAmmoDrop = MutatorNoAmmoDrop or class(BaseMutator)
MutatorNoAmmoDrop._type = "MutatorNoAmmoDrop"
MutatorNoAmmoDrop.name_id = "mutator_no_ammo_drops"
MutatorNoAmmoDrop.desc_id = "mutator_no_ammo_drops_desc"
MutatorNoAmmoDrop.has_options = true
MutatorNoAmmoDrop.reductions = {
	money = 0,
	exp = 0
}
MutatorNoAmmoDrop.disables_achievements = false
MutatorNoAmmoDrop.categories = {
	"gameplay"
}

MutatorNoAmmoDrop.icon_coords = {
	6,
	5
}

function MutatorNoAmmoDrop:register_values(mutator_manager)
	self:register_value("no_ammo_drops", true, "nad")
	self:register_value("ammo_drop_chance", 50, "nad_adc")
end

function MutatorNoAmmoDrop:name(lobby_data)
	local name = MutatorNoAmmoDrop.super.name(self)
	
	if self:get_no_ammo_drops() or self:get_ammo_drop_chance() == 0 then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_no_ammo_drops"))
	else
		local ammo_drop_chance = self:get_ammo_drop_chance()
		return string.format("%s - %s", name, tostring(ammo_drop_chance).."% "..managers.localization:text("menu_mutator_ammo_drop_chance_ingame"))
	end
	
end

function MutatorNoAmmoDrop:modify_value(id, value)
	if id == "CopDamage:NoAmmoDropChance" and not self:get_no_ammo_drops() then
		local ammo_drop_chance = self:get_ammo_drop_chance() / 100
		log("ammo_drop_chance is "..tostring(ammo_drop_chance))
		return ammo_drop_chance
	end
	return value
end

function MutatorNoAmmoDrop:setup()
	if self:get_no_ammo_drops() then
		local char_tweak = tweak_data.character
		local enemy = nil
		for _, name in pairs(char_tweak:enemy_list()) do
			enemy = char_tweak[name]
			if enemy then
				enemy.do_not_drop_ammo = true
			end
		end		
	end
end

function MutatorNoAmmoDrop:get_ammo_drop_chance()
	return self:value("ammo_drop_chance")
end

function MutatorNoAmmoDrop:get_no_ammo_drops()
	return self:value("no_ammo_drops")
end

function MutatorNoAmmoDrop:setup_options_gui(node)
	local params = {
		name = "no_ammo_drops_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_ammo_drop_chance",
		update_callback = callback(self, self, "_update_ammo_drop_chance")
	}
	local data_node = {
		show_value = true,
		step = 5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = 0,
		max = 100
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_ammo_drop_chance())
	node:add_item(new_item)

	
	local params = {
		name = "no_ammo_drops_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_no_ammo_drops",
		update_callback = callback(self, self, "_toggle_no_ammo_drops")
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

	new_item:set_value(self:get_no_ammo_drops() and "on" or "off")
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorNoAmmoDrop:_toggle_no_ammo_drops(item)
	self:set_value("no_ammo_drops", item:value() == "on")
end

function MutatorNoAmmoDrop:_update_ammo_drop_chance(item)
	self:set_value("ammo_drop_chance", item:value())
end

function MutatorNoAmmoDrop:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("no_ammo_drops_slider")

		if slider then
			slider:set_value(self:get_ammo_drop_chance())
		end
		
		local toggle = self._node:item("no_ammo_drops_toggle")

		if toggle then
			toggle:set_value(self:get_no_ammo_drops() and "on" or "off")
		end
		
	end
end

function MutatorNoAmmoDrop:options_fill()
	if self:get_no_ammo_drops() then
		return self:_get_percentage_fill(0,1,1)
	else
		return self:_get_percentage_fill(0, 100, self:get_ammo_drop_chance())
	end 
end
