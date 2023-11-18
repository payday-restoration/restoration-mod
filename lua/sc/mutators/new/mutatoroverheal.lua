--Allow LPF/Winters overheal all units (expect cloakers and gangsters, bikers, etc.) and set specific overheal mult for them

MutatorOverheal = MutatorOverheal or class(BaseMutator)
MutatorOverheal._type = "MutatorOverheal"
MutatorOverheal.name_id = "mutator_overheal"
MutatorOverheal.desc_id = "mutator_overheal_desc"
MutatorOverheal.has_options = true
MutatorOverheal.reductions = {
	money = 0,
	exp = 0
}
MutatorOverheal.disables_achievements = false
MutatorOverheal.categories = {"gameplay","enemies"}
MutatorOverheal.icon_coords = {
	8,
	4
}


function MutatorOverheal:register_values(mutator_manager)
	self:register_value("overheal_mult_override", 1.5 , "omo")
	self:register_value("captain_overheal_mult_override", false, "como")
end

function MutatorOverheal:setup(data)
	local char_tweak = tweak_data.character
	local new_overheal_mult = self:get_overheal_mult_override()
	local overheal_captains = self:get_captain_overheal_mult_override()
	local overheal_checklist = {
		"cop",
		"cop_female",
		"dave",
		"fbi",
		"swat",
		"hrt",
		"fbi_swat",
		"city_swat",
		"weekend",
		"city_swat_titan",
		"city_swat_titan_assault",
		"shield",
		"phalanx_minion",
		"phalanx_minion_assault"
	}
	
	--Do not override overheal mult if mutator value is lower than tweakdata one
	for _, unit in ipairs(overheal_checklist) do
		if char_tweak[unit].overheal_mult < new_overheal_mult then
			char_tweak[unit].overheal_mult = new_overheal_mult
		end
	end
	
	char_tweak.security.overheal_mult = new_overheal_mult
	char_tweak.gensec.overheal_mult = new_overheal_mult
	char_tweak.fbi_vet.overheal_mult = new_overheal_mult
	char_tweak.fbi_vet_boss.overheal_mult = new_overheal_mult
	char_tweak.meme_man.overheal_mult = new_overheal_mult
	char_tweak.meme_man_shield.overheal_mult = new_overheal_mult
	char_tweak.vetlod.overheal_mult = new_overheal_mult
	char_tweak.heavy_swat.overheal_mult = new_overheal_mult
	char_tweak.fbi_swat_vet.overheal_mult = new_overheal_mult
	char_tweak.fbi_heavy_swat.overheal_mult = new_overheal_mult
	char_tweak.city_swat_guard.overheal_mult = new_overheal_mult
	char_tweak.weekend_guard.overheal_mult = new_overheal_mult
	char_tweak.weekend_lmg.overheal_mult = new_overheal_mult 
	
	--Medics will also get this lol
	char_tweak.medic.overheal_mult = new_overheal_mult
	char_tweak.medic.no_omnia_heal = false
	char_tweak.taser.overheal_mult = new_overheal_mult
	char_tweak.boom.overheal_mult = new_overheal_mult
	
	char_tweak.hrt_titan.overheal_mult = new_overheal_mult
	char_tweak.taser_titan.overheal_mult = new_overheal_mult
	char_tweak.heavy_swat_sniper.overheal_mult = new_overheal_mult
	char_tweak.marshal_marksman.overheal_mult = new_overheal_mult
	char_tweak.marshal_shield.overheal_mult = new_overheal_mult
	char_tweak.marshal_shield_break.overheal_mult = new_overheal_mult
	char_tweak.weekend_dmr.overheal_mult = new_overheal_mult
	
	char_tweak.snowman_boss.overheal_mult = new_overheal_mult
	char_tweak.piggydozer.overheal_mult = new_overheal_mult
	char_tweak.tank.overheal_mult = new_overheal_mult
	char_tweak.tank_black.overheal_mult = new_overheal_mult
	char_tweak.tank_skull.overheal_mult = new_overheal_mult
	char_tweak.tank_titan.overheal_mult = new_overheal_mult
	char_tweak.tank_medic.overheal_mult = new_overheal_mult
	char_tweak.tank_medic.no_omnia_heal = false
	char_tweak.tank_hw_black.overheal_mult = new_overheal_mult
	char_tweak.tank_hw.overheal_mult = new_overheal_mult
	char_tweak.tank_mini.overheal_mult = new_overheal_mult
	
	if overheal_captains == "on" then -- If player wanna buff captains too
	-- Doc is LPF but now he can buff everyone. Have fun :^)
	char_tweak.summers.overheal_mult = new_overheal_mult
	char_tweak.summers.no_omnia_heal = false
	char_tweak.taser_summers.overheal_mult = new_overheal_mult
	char_tweak.taser_summers.no_omnia_heal = false
	char_tweak.boom_summers.overheal_mult = new_overheal_mult
	char_tweak.boom_summers.no_omnia_heal = false
	-- Buff big bois
	char_tweak.spring.overheal_mult = new_overheal_mult
	char_tweak.spring.no_omnia_heal = false
	char_tweak.headless_hatman.overheal_mult = new_overheal_mult
	char_tweak.headless_hatman.no_omnia_heal = false
	end
	
end

function MutatorOverheal:name()
	local name = MutatorOverheal.super.name(self)

	if self:_mutate_name("overheal_mult_override") then
		return string.format("%s - %.0f%%", name, tonumber(self:value("overheal_mult_override"))*100)
	end
		
	return name
end

function MutatorOverheal:get_overheal_mult_override()
	return self:value("overheal_mult_override")
end

function MutatorOverheal:get_captain_overheal_mult_override()
	return self:value("captain_overheal_mult_override")
end

function MutatorOverheal:_min_overheal_mult()
	return 1.25
end

function MutatorOverheal:_max_overheal_mult()
	return 3
end

function MutatorOverheal:setup_options_gui(node)
	local params = {
		name = "overheal_mult_override_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_overheal_mult_override",
		update_callback = callback(self, self, "_update_overheal_mult_override")
	}
	local data_node = {
		show_value = true,
		step = 0.25,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		min = self:_min_overheal_mult(),
		max = self:_max_overheal_mult()
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_overheal_mult_override())
	node:add_item(new_item)

	
	local params = {
		name = "captains_overheal_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_overheal_mult_override_toggle",
		update_callback = callback(self, self, "_toggle_captain_overheal_mult_override")
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

	new_item:set_value(self:get_captain_overheal_mult_override() and "on" or "off")
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorOverheal:_toggle_captain_overheal_mult_override(item)
	self:set_value("captain_overheal_mult_override", item:value())
end

function MutatorOverheal:_update_overheal_mult_override(item)
	self:set_value("overheal_mult_override", item:value())
end

function MutatorOverheal:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("overheal_mult_override_slider")

		if slider then
			slider:set_value(self:get_overheal_mult_override())
		end
		
		local toggle = self._node:item("captains_overheal_toggle")

		if toggle then
			toggle:set_value(self:get_captain_overheal_mult_override() and "on" or "off")
		end
		
	end
end

function MutatorOverheal:options_fill()
	return self:_get_percentage_fill(self:_min_overheal_mult(), self:_max_overheal_mult(), self:get_overheal_mult_override())
end