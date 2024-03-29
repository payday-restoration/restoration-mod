--Bravo Spawns at all times (or RNG dependent) --
MutatorBravosOnly = MutatorBravosOnly or class(BaseMutator)
MutatorBravosOnly._type = "MutatorBravosOnly"
MutatorBravosOnly.name_id = "mutator_bravos_only"
MutatorBravosOnly.desc_id = "mutator_bravos_only_desc"
MutatorBravosOnly.has_options = true
MutatorBravosOnly.reductions = {
	money = 0,
	exp = 0
}
MutatorBravosOnly.disables_achievements = false
MutatorBravosOnly.categories = {"enemies"}
MutatorBravosOnly.incompatibility_tags = {
	"replaces_units"
}	
MutatorBravosOnly.icon_coords = {
	5,
	3
}

function MutatorBravosOnly:register_values(mutator_manager)
	self:register_value("bravo_replacement", "all", "br")
	self:register_value("bravo_replacement_chance", 0.25, "brc")
	--self:register_value("bravo_replacement_increase", false, "bri") -- maybe eventually I make replacement chance increase per survived assault
end

function MutatorBravosOnly:get_bravo_replacement(id)
	if not id then
		id = ""
	end
	return self:value("bravo_replacement"..tostring(id))
end

function MutatorBravosOnly:modify_value(id, value)
    local bravo_replacement = self:get_bravo_replacement()
	local bravo_replacement_percentage = self:get_bravo_replacement("_chance")
	--local bravo_replacement_increase = self:get_bravo_replacement("_increase")
	
	if id == "GroupAIStateBesiege:SpawningUnit" and bravo_replacement == "random" then
        local unit_name = tostring(value)
        local replacement = managers.modifiers._unit_table[unit_name] --dont make the same table twice!! just pull it from modifiersmanager

        if replacement then
            local replacement_chance = bravo_replacement_percentage

            if math.random(0,100) < replacement_chance then
                return replacement
            end
        end
    end

    return value
end

function MutatorBravosOnly:setup(data)
	local bravo_replacement = self:get_bravo_replacement()
	
	if bravo_replacement == "all" then
		if restoration then
			restoration.always_bravos = true
		end
	end
end


function MutatorBravosOnly:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "bravo_replacement_choice",
		text_id = "menu_bravo_replacement_choice",
		filter = true,
		update_callback = callback(self, self, "_update_bravo_replacement")
	}
	local data_node = {
		{
			value = "all",
			text_id = "menu_mutator_bravo_replacement_all",
			_meta = "option"
		},
		{
			value = "random",
			text_id = "menu_mutator_bravo_replacement_random",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_bravo_replacement())
	node:add_item(new_item)
	
	local params = {
		name = "bravo_replacement_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_bravo_replacement_slider",
		update_callback = callback(self, self, "_update_bravo_replacement_chance")
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

	new_item:set_value(self:get_bravo_replacement("_chance"))
	node:add_item(new_item)

	
	self._node = node

	return new_item
end

function MutatorBravosOnly:_update_bravo_replacement(item)
	self:set_value("bravo_replacement", item:value())
end

function MutatorBravosOnly:_update_bravo_replacement_chance(item)
	self:set_value("bravo_replacement_chance", item:value())
end