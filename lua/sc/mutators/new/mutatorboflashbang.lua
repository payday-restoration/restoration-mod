--Unbreakable flashbang from DS diff as mutator
MutatorBoFlashbang = MutatorBoFlashbang or class(BaseMutator)
MutatorBoFlashbang._type = "MutatorBoFlashbang"
MutatorBoFlashbang.name_id = "mutator_bo_flashbang"
MutatorBoFlashbang.desc_id = "mutator_bo_flashbang_desc"
MutatorBoFlashbang.has_options = true
MutatorBoFlashbang.reductions = {
	money = 0,
	exp = 0
}
MutatorBoFlashbang.disables_achievements = false
MutatorBoFlashbang.categories = {"gameplay"}
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
local starvr = math.rand(1)
local its_bover = 0.02
-- he-he
if not easterless and starvr <= its_bover then
MutatorBoFlashbang.icon_coords = {
	3,
	2
}
else
MutatorBoFlashbang.icon_coords = {
	4,
	2
}
end

function MutatorBoFlashbang:name()
	local name = MutatorBoFlashbang.super.name(self)

	if self:_mutate_name("flashbang_cooking_time") then
		return string.format("%s - %.3f", name, tonumber(self:value("flashbang_cooking_time")))
	end
		
	return name
end

function MutatorBoFlashbang:register_values(mutator_manager)
	self:register_value("flashbang_cooking_time", 2.5 , "fct")
end

function MutatorBoFlashbang:get_flashbang_cooking_time()
	return self:value("flashbang_cooking_time")
end

function MutatorBoFlashbang:_min_flashbang_cooking_time()
	return 0.25
end

function MutatorBoFlashbang:_max_flashbang_cooking_time()
	return 2.5
end

function MutatorBoFlashbang:modify_value(id, value)
	if id == "GroupAIStateBase:SpawnSpecialFlashbang" then	
		return "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
	end
	
	return value
end

function MutatorBoFlashbang:setup(data)
	tweak_data.group_ai.flash_grenade.light_color = Vector3(255, 165, 0)
	tweak_data.group_ai.flash_grenade.timer = self:get_flashbang_cooking_time()
end

function MutatorBoFlashbang:setup_options_gui(node)
	local params = {
		name = "aaaaflashbang_cooking_time_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_flashbang_cooking_time",
		update_callback = callback(self, self, "_update_flashbang_cooking_time")
	}
	local data_node = {
		show_value = true,
		step = 0.25,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = self:_min_flashbang_cooking_time(),
		max = self:_max_flashbang_cooking_time()
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_flashbang_cooking_time())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorBoFlashbang:_update_flashbang_cooking_time(item)
	self:set_value("flashbang_cooking_time", item:value())
end

function MutatorBoFlashbang:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("flashbang_cooking_time")

		if slider then
			slider:set_value(self:get_flashbang_cooking_time())
		end		
	end
end

function MutatorBoFlashbang:options_fill()
	return self:_get_percentage_fill(self:_min_flashbang_cooking_time(), self:_max_flashbang_cooking_time(), self:get_flashbang_cooking_time())
end