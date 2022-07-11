--Spawn Cap Multipliers
MutatorSpawnMult = MutatorSpawnMult or class(BaseMutator)
MutatorSpawnMult._type = "MutatorSpawnMult"
MutatorSpawnMult.name_id = "mutator_spawn_mult"
MutatorSpawnMult.desc_id = "mutator_spawn_mult_desc"
MutatorSpawnMult.has_options = true
MutatorSpawnMult.reductions = {
	money = 0,
	exp = 0
}
MutatorSpawnMult.disables_achievements = false
MutatorSpawnMult.categories = {
	"enemies"
}
MutatorSpawnMult.icon_coords = {
	4,
	1
}

function MutatorSpawnMult:register_values(mutator_manager)
	self:register_value("spawn_multiplier", 2, "hm")
end

function MutatorSpawnMult:setup()
	self:modify_group_tweak_data(tweak_data, self:get_spawn_multiplier())
end

function MutatorSpawnMult:name()
	local name = MutatorSpawnMult.super.name(self)

	if self:_mutate_name("spawn_multiplier") then
		return string.format("%s - %.0f%%", name, tonumber(self:value("spawn_multiplier")) * 100)
	else
		return name
	end
end

function MutatorSpawnMult:get_spawn_multiplier()
	return self:value("spawn_multiplier")
end

function MutatorSpawnMult:modify_group_tweak_data(tweak_data, multiplier)
	log("[Mutators] Mutating character spawns: ")
	if tweak_data then
		multiplier = multiplier or self:get_spawn_multiplier()
		
		log("[Mutators] Actually did stuff! ")

		--Tried all sorts of BS to make this work from directly manipulating the groupai state to even fucking with tweakdata, everything else seemed to work tho
	end
end

function MutatorSpawnMult:_min_mult()
	return 1.01
end

function MutatorSpawnMult:_max_mult()
	return 10
end

function MutatorSpawnMult:setup_options_gui(node)
	local params = {
		name = "enemy_spawn_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_enemy_spawn",
		update_callback = callback(self, self, "_update_spawn_multiplier")
	}
	local data_node = {
		show_value = true,
		step = 0.1,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = self:_min_mult(),
		max = self:_max_mult()
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_spawn_multiplier())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorSpawnMult:_update_spawn_multiplier(item)
	self:set_value("spawn_multiplier", item:value())
end

function MutatorSpawnMult:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("enemy_spawn_slider")

		if slider then
			slider:set_value(self:get_spawn_multiplier())
		end
	end
end

function MutatorSpawnMult:options_fill()
	return self:_get_percentage_fill(self:_min_mult(), self:_max_mult(), self:get_spawn_multiplier())
end