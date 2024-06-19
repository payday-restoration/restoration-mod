--Allow disable majority of outlines
MutatorNoOutlines = MutatorNoOutlines or class(BaseMutator)
MutatorNoOutlines._type = "MutatorNoOutlines"
MutatorNoOutlines.name_id = "mutator_no_outlines"
MutatorNoOutlines.desc_id = "mutator_no_outlines_desc"
MutatorNoOutlines.has_options = true
MutatorNoOutlines.reductions = {
	money = 0,
	exp = 0
}
MutatorNoOutlines.disables_achievements = false
MutatorNoOutlines.categories = {"gameplay"}
MutatorNoOutlines.icon_coords = {
	7,
	2
}

function MutatorNoOutlines:register_values(mutator_manager)
	self:register_value("no_outlines_enemies", false, "noe")
	self:register_value("no_outlines_objectives", false, "noo")
end

function MutatorNoOutlines:get_no_outlines_enemies()
	return self:value("no_outlines_enemies")
end

function MutatorNoOutlines:get_no_outlines_objectives()
	return self:value("no_outlines_objectives")
end

function MutatorNoOutlines:modify_value(id, value)
	local outlines_change_table = {
		"HuskPlayerMovement",
		"CopMovement",
		"MedicDamage",
		"TripMineBase",
		"ECMJammerBase",
		"CivilianBrain",
		"HUDManager",
		"AmmoClip",
		"ArrowBase",
		"SentryGunContour",
		"ContourExt"
	}
	for _, id_modifier in ipairs(outlines_change_table) do
		if id == id_modifier..":DisableOutlines" then
			value = true
		end	
	end
	if id == "ContourExt:DisableEnemyOutlines" or id == "CopDamage:DisableEnemyOutlines" then
		value = self:get_no_outlines_enemies()
	end
	if id == "ContourExt:DisableObjectiveOutlines" then
		value = self:get_no_outlines_objectives()
	end
	return value
end

function MutatorNoOutlines:setup(data)
	local no_outline = Vector3(0,0,0)
	local disable_objective_outlines = self:get_no_outlines_objectives()
	--idk why some contours are not disabled with countourext changes so need override colors just in case
	if disable_objective_outlines then
		tweak_data.contour.interactable.standard_color = no_outline
	end
	tweak_data.contour.character.downed_color = no_outline
	tweak_data.contour.character.friendly_color = no_outline
	tweak_data.contour.character_interactable.standard_color = no_outline
	tweak_data.contour.character_interactable.selected_color = no_outline
	tweak_data.contour.character.dangerous_color = no_outline
	tweak_data.contour.character.more_dangerous_color = no_outline
	tweak_data.contour.deployable.standard_color = no_outline
	tweak_data.contour.deployable.selected_color = no_outline
	tweak_data.contour.deployable.disabled_color = no_outline
	tweak_data.contour.deployable.active_color = no_outline
	tweak_data.contour.deployable.interact_color = no_outline
	tweak_data.contour.upgradable.standard_color = no_outline
	tweak_data.contour.upgradable.selected_color = no_outline
	tweak_data.contour.character.heal_color = no_outline
	tweak_data.contour.character.tmp_invulnerable_color = no_outline
	tweak_data.contour.character.vulnerable_color = no_outline
end

function MutatorNoOutlines:setup_options_gui(node)
	local params = {
		name = "no_outlines_enemies_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_no_outlines_enemies_toggle",
		update_callback = callback(self, self, "_toggle_no_outlines_enemies")
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

	new_item:set_value(self:get_no_outlines_enemies() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "no_outlines_objectives_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_no_outlines_objectives_toggle",
		update_callback = callback(self, self, "_toggle_no_outlines_objectives")
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

	new_item:set_value(self:get_no_outlines_objectives() and "on" or "off")
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorNoOutlines:_toggle_no_outlines_enemies(item)
	self:set_value("no_outlines_enemies", item:value() == "on")
end

function MutatorNoOutlines:_toggle_no_outlines_objectives(item)
	self:set_value("no_outlines_objectives", item:value() == "on")
end

function MutatorNoOutlines:reset_to_default()
	self:clear_values()

	if self._node then
		local toggle1 = self._node:item("no_outlines_enemies_toggle")

		if toggle1 then
			toggle:set_value(self:get_no_outlines_enemies() and "on" or "off")
		end
		
		local toggle2 = self._node:item("no_outlines_objectives_toggle")

		if toggle2 then
			toggle:set_value(self:get_no_outlines_objectives() and "on" or "off")
		end
		
	end
end

function MutatorNoOutlines:options_fill()
	local option_fill = 0
	if self:get_no_outlines_enemies() then
		option_fill = option_fill + 0.5
	end
	if self:get_no_outlines_objectives() then
		option_fill = option_fill + 0.5
	end
	return option_fill
end