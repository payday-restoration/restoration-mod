-- Allow non-bravo units throw grenades (except cloakers)
-- RAID: WW II "Total Carnage!" card is activated
MutatorGrenadeMayhem = MutatorGrenadeMayhem or class(BaseMutator)
MutatorGrenadeMayhem._type = "MutatorGrenadeMayhem"
MutatorGrenadeMayhem.name_id = "mutator_grenade_mayhem"
MutatorGrenadeMayhem.desc_id = "mutator_grenade_mayhem_desc"
MutatorGrenadeMayhem.has_options = true
MutatorGrenadeMayhem.reductions = {
	money = 0,
	exp = 0
}
MutatorGrenadeMayhem.disables_achievements = false
MutatorGrenadeMayhem.categories = {"gameplay","enemies"}
MutatorGrenadeMayhem.icon_coords = {
	2,
	1
}	

function MutatorGrenadeMayhem:register_values(mutator_manager)
	self:register_value("grenade_mayhem_usuals", true, "gmu")
	self:register_value("grenade_mayhem_thugs", false, "gmt")
	self:register_value("grenade_mayhem_specials", false, "gms")
	self:register_value("grenade_mayhem_bosses", false, "gmb")
	self:register_value("grenade_mayhem_captains", false, "gmc")
	--self:register_value("grenade_mayhem_sosa_cosplay", false, "gmsc")
end

function MutatorGrenadeMayhem:setup(data)
	local char_tweak = tweak_data.character
	local faction = tweak_data.levels:get_ai_group_type()
	local gm_usuals = self:get_grenade_mayhem_usuals()
	local gm_thugs = self:get_grenade_mayhem_thugs()
	local gm_specials = self:get_grenade_mayhem_specials()
	local gm_bosses = self:get_grenade_mayhem_bosses()
	local gm_captains = self:get_grenade_mayhem_captains()
	local sosa_cosplay = self:get_grenade_mayhem_sosa_cosplay()
	
	log("gm_usuals is "..tostring(gm_usuals).."gm_thugs is "..tostring(gm_thugs).."gm_specials is "..tostring(gm_specials).."gm_bosses is "..tostring(gm_bosses).."gm_captains is "..tostring(gm_captains))
	
	
	if gm_usuals then
		char_tweak.security.can_throw_frag = true
		char_tweak.gensec.can_throw_frag = true
		char_tweak.gensec_guard.can_throw_frag = true
		char_tweak.security_mex.can_throw_frag = true
		char_tweak.security_mex_no_pager.can_throw_frag = true
		char_tweak.cop.can_throw_frag = true
		char_tweak.cop_female.can_throw_frag = true
		char_tweak.dave.can_throw_frag = true
		char_tweak.fbi.can_throw_frag = true
		char_tweak.swat.can_throw_frag = true
		char_tweak.hrt.can_throw_frag = true
		char_tweak.heavy_swat.can_throw_frag = true
		char_tweak.fbi_swat.can_throw_frag = true
		char_tweak.fbi_heavy_swat.can_throw_frag = true
		char_tweak.city_swat.can_throw_frag = true
		char_tweak.city_swat_guard.can_throw_frag = true
		char_tweak.weekend_guard.can_throw_frag = true
        char_tweak.weekend_elite_guard.can_throw_frag = true
		char_tweak.city_swat_titan.can_throw_frag = true
		char_tweak.city_swat_titan_assault.can_throw_frag = true
		char_tweak.fbi_vet.can_throw_frag = true
		char_tweak.hrt_titan.can_throw_frag = true
	end
	
	if gm_thugs then
		char_tweak.gangster.can_throw_frag = true
		char_tweak.mobster.can_throw_frag = true
		char_tweak.biker.can_throw_frag = true
		char_tweak.biker_escape.can_throw_frag = true
		char_tweak.biker_guard.can_throw_frag = true
		char_tweak.tank_biker.can_throw_molotov = true
		char_tweak.tank_biker.grenade_toss_chance = 0.4
		char_tweak.bolivian.can_throw_frag = true
		char_tweak.bolivian_indoors.can_throw_frag = true
		char_tweak.bolivian_indoors_mex.can_throw_frag = true
		char_tweak.triad.can_throw_frag = true
		char_tweak.ranchmanager.can_throw_frag = true
		char_tweak.enforcer.can_throw_frag = true
	end
	
	if gm_specials then
		char_tweak.shield.can_throw_frag = true
		char_tweak.phalanx_minion_assault.can_throw_frag = true
		char_tweak.boom.can_throw_frag = true
		char_tweak.medic.can_throw_frag = true
		char_tweak.taser.can_throw_frag = true
		char_tweak.spooc.can_deploy_tear_gas = true
		char_tweak.spooc.chance_use_gas = 0.2
		char_tweak.spooc_titan.can_deploy_tear_gas = true
		char_tweak.spooc_titan.chance_use_gas = 0.2
		char_tweak.tank.can_throw_frag = true
		char_tweak.tank.grenade_toss_chance = 0.4
		char_tweak.tank_black.can_throw_frag = true
		char_tweak.tank_black.grenade_toss_chance = 0.4
		char_tweak.tank_skull.can_throw_frag = true
		char_tweak.tank_skull.grenade_toss_chance = 0.4
		char_tweak.tank_titan.can_throw_frag = true
		char_tweak.tank_titan.grenade_toss_chance = 0.4
		if faction == "russia" or faction == "federales" then
			char_tweak.tank_titan_assault.can_deploy_tear_gas = true
			char_tweak.tank_titan_assault.chance_use_gas = 0.4
		else
			char_tweak.tank_titan_assault.can_throw_frag = true
			char_tweak.tank_titan_assault.grenade_toss_chance = 0.4
		end
		char_tweak.tank_medic.can_throw_frag = true
		char_tweak.tank_medic.grenade_toss_chance = 0.4
		char_tweak.tank_hw.can_throw_frag = true
		char_tweak.tank_hw.grenade_toss_chance = 0.4
		char_tweak.tank_hw_black.can_throw_frag = true
		char_tweak.tank_hw_black.grenade_toss_chance = 0.4
		char_tweak.omnia_lpf.can_throw_frag = true
		char_tweak.heavy_swat_sniper.can_throw_frag = true
		char_tweak.taser_titan.can_throw_frag = true
		char_tweak.taser_titan_reaper.can_throw_frag = true
		char_tweak.enforcer_assault.can_throw_molotov = true
	end
	
	--[[if sosa_cosplay == "on" then
		char_tweak.boom.can_throw_frag = false
		char_tweak.boom.can_deploy_tear_gas = false
		char_tweak.boom.throwable = "launcher_m203"
		char_tweak.boom.throwable_on_sight = true
		char_tweak.boom.throwable_cooldown = 10	
	end
	--]]
	
	if gm_bosses then
		char_tweak.hector_boss.can_throw_frag = true
		char_tweak.mobster_boss.can_throw_frag = true
		char_tweak.drug_lord_boss.can_throw_frag = true
		char_tweak.biker_boss.can_throw_frag = true
		char_tweak.deep_boss.can_throw_frag = true
		char_tweak.fbi_vet_boss.can_throw_frag = true
	end
	
	if gm_captains then
		char_tweak.phalanx_vip.can_throw_frag = true
		char_tweak.phalanx_vip.grenade_toss_chance = 1
		char_tweak.phalanx_vip.grenade_cooldown = 12
		char_tweak.phalanx_minion.can_throw_frag = true
		char_tweak.summers.can_throw_molotov = true
		char_tweak.summers.grenade_toss_chance = 1
		char_tweak.summers.grenade_cooldown = 12
		char_tweak.taser_summers.can_throw_frag = true
		char_tweak.taser_summers.grenade_toss_chance = 0.4
		char_tweak.medic_summers.can_throw_frag = true
		char_tweak.medic_summers.grenade_toss_chance = 0.4
	end
	
end

function MutatorGrenadeMayhem:get_grenade_mayhem_usuals()
	return self:value("grenade_mayhem_usuals")
end

function MutatorGrenadeMayhem:get_grenade_mayhem_thugs()
	return self:value("grenade_mayhem_thugs")
end

function MutatorGrenadeMayhem:get_grenade_mayhem_specials()
	return self:value("grenade_mayhem_specials")
end

function MutatorGrenadeMayhem:get_grenade_mayhem_bosses()
	return self:value("grenade_mayhem_bosses")
end

function MutatorGrenadeMayhem:get_grenade_mayhem_captains()
	return self:value("grenade_mayhem_captains")
end

function MutatorGrenadeMayhem:get_grenade_mayhem_sosa_cosplay()
	return self:value("grenade_mayhem_sosa_cosplay")
end

function MutatorGrenadeMayhem:setup_options_gui(node)
	local params = {
		name = "grenade_mayhem_usuals_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_usuals_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_usuals")
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

	new_item:set_value(self:get_grenade_mayhem_usuals() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "grenade_mayhem_thugs_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_thugs_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_thugs")
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

	new_item:set_value(self:get_grenade_mayhem_thugs() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "grenade_mayhem_specials_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_specials_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_specials")
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

	new_item:set_value(self:get_grenade_mayhem_specials() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "grenade_mayhem_bosses_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_bosses_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_bosses")
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

	new_item:set_value(self:get_grenade_mayhem_bosses() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "grenade_mayhem_captains_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_captains_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_captains")
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

	new_item:set_value(self:get_grenade_mayhem_captains() and "on" or "off")
	node:add_item(new_item)
	
	--[[local params = {
		name = "grenade_mayhem_sosa_cosplay_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_grenade_mayhem_sosa_cosplay_toggle",
		update_callback = callback(self, self, "_toggle_grenade_mayhem_sosa_cosplay")
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

	new_item:set_value(self:get_grenade_mayhem_sosa_cosplay() and "on" or "off")
	node:add_item(new_item)
	--]]
	self._node = node

	return new_item
end

function MutatorGrenadeMayhem:_toggle_grenade_mayhem_usuals(item)
	self:set_value("grenade_mayhem_usuals", item:value() == "on")
end

function MutatorGrenadeMayhem:_toggle_grenade_mayhem_thugs(item)
	self:set_value("grenade_mayhem_thugs", item:value() == "on")
end

function MutatorGrenadeMayhem:_toggle_grenade_mayhem_specials(item)
	self:set_value("grenade_mayhem_specials", item:value() == "on")
end

function MutatorGrenadeMayhem:_toggle_grenade_mayhem_bosses(item)
	self:set_value("grenade_mayhem_bosses", item:value() == "on")
end

function MutatorGrenadeMayhem:_toggle_grenade_mayhem_captains(item)
	self:set_value("grenade_mayhem_captains", item:value() == "on")
end

--[[function MutatorGrenadeMayhem:_toggle_grenade_mayhem_sosa_cosplay(item)
	self:set_value("grenade_mayhem_sosa_cosplay", item:value())
end--]]

function MutatorGrenadeMayhem:reset_to_default()
	self:clear_values()

	if self._node then
		local toggle1 = self._node:item("grenade_mayhem_usuals_toggle")

		if toggle1 then
			toggle1:set_value(self:get_grenade_mayhem_usuals() and "on" or "off")
		end
		
		local toggle2 = self._node:item("grenade_mayhem_thugs_toggle")

		if toggle2 then
			toggle2:set_value(self:get_grenade_mayhem_thugs() and "on" or "off")
		end
		
		local toggle3 = self._node:item("grenade_mayhem_specials_toggle")

		if toggle3 then
			toggle3:set_value(self:get_grenade_mayhem_specials() and "on" or "off")
		end
		
		local toggle4 = self._node:item("grenade_mayhem_bosses_toggle")

		if toggle4 then
			toggle4:set_value(self:get_grenade_mayhem_bosses() and "on" or "off")
		end
		
		local toggle5 = self._node:item("grenade_mayhem_captains_toggle")

		if toggle5 then
			toggle5:set_value(self:get_grenade_mayhem_captains() and "on" or "off")
		end
		
		--[[local toggle6 = self._node:item("grenade_mayhem_sosa_cosplay")

		if toggle6 then
			toggle6:set_value(self:get_grenade_mayhem_sosa_cosplay() and "on" or "off")
		end--]]
	end
end

function MutatorGrenadeMayhem:options_fill()
	local total_fill = 0
	if self:get_grenade_mayhem_usuals() then
		total_fill = total_fill + 0.2
	end
	if self:get_grenade_mayhem_thugs() then
		total_fill = total_fill + 0.2
	end
	if self:get_grenade_mayhem_specials() then
		total_fill = total_fill + 0.2
	end
	if self:get_grenade_mayhem_bosses() then
		total_fill = total_fill + 0.2
	end
	if self:get_grenade_mayhem_captains() then
		total_fill = total_fill + 0.2
	end
	return total_fill
end
