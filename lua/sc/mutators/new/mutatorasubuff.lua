-- Allow ASU buff specials (except cloakers)

MutatorASUBuff = MutatorASUBuff or class(BaseMutator)
MutatorASUBuff._type = "MutatorASUBuff"
MutatorASUBuff.name_id = "mutator_asu_buff"
MutatorASUBuff.desc_id = "mutator_asu_buff_desc"
MutatorASUBuff.has_options = true
MutatorASUBuff.reductions = {
	money = 0,
	exp = 0
}
MutatorASUBuff.disables_achievements = false
MutatorASUBuff.categories = {"gameplay","enemies"}
MutatorASUBuff.icon_coords = {
	7,
	4
}	

function MutatorASUBuff:register_values(mutator_manager)
	self:register_value("captain_asu_buff", false, "cab")
	--self:register_value("range_asu_buff", false, "rab")
end

function MutatorASUBuff:setup(data)
	local char_tweak = tweak_data.character
	local captains_asu_buff = self:get_captain_asu_buff()
	local range_asu_buff = self:get_range_asu_buff()
	--Force ASU damage buff from DS
	tweak_data.asu_damage_buff = 20
	
	--[[
	if range_asu_buff == "on" then
	tweak_data.asu_buff_radius = tweak_data.asu_buff_radius * 2
	end
	--]]
	
	char_tweak.meme_man.no_asu = false
	char_tweak.meme_man_shield.no_asu = false
	char_tweak.medic.no_asu = false
	char_tweak.omnia_lpf.no_asu = false
	char_tweak.heavy_swat_sniper.no_asu = false
	char_tweak.marshal_shield.no_asu = false
	char_tweak.marshal_shield_break.no_asu = false
	char_tweak.tank.no_asu = false
	char_tweak.tank_black.no_asu = false
	char_tweak.tank_skull.no_asu = false
	char_tweak.tank_medic.no_asu = false
	char_tweak.tank_titan.no_asu = false
	char_tweak.tank_titan_assault.no_asu = false
	char_tweak.enforcer_assault.no_asu = false
	char_tweak.tank_mini.no_asu = false
	char_tweak.shield.no_asu = false
	char_tweak.phalanx_minion.no_asu = false
	char_tweak.phalanx_minion_assault.no_asu = false
	char_tweak.boom.no_asu = false
	char_tweak.taser.no_asu = false
	char_tweak.taser_titan.no_asu = false
	char_tweak.taser_titan_reaper.no_asu = false
	
	if captains_asu_buff == "on" then
	char_tweak.phalanx_vip.no_asu = false
	char_tweak.phalanx_vip_break.no_asu = false
	char_tweak.spring.no_asu = false
	char_tweak.summers.no_asu = false
	char_tweak.boom_summers.no_asu = false
	char_tweak.taser_summers.no_asu = false
	char_tweak.medic_summers.no_asu = false
	end
	
end

function MutatorASUBuff:get_captain_asu_buff()
	return self:value("captain_asu_buff")
end

function MutatorASUBuff:get_range_asu_buff()
	return self:value("range_asu_buff")
end

function MutatorASUBuff:setup_options_gui(node)
	local params = {
		name = "captain_asu_buff_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_captain_asu_buff_toggle",
		update_callback = callback(self, self, "_toggle_captain_asu_buff")
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

	new_item:set_value(self:get_captain_asu_buff() and "on" or "off")
	node:add_item(new_item)
	--[[
	local params = {
		name = "range_asu_buff_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_range_asu_buff_toggle",
		update_callback = callback(self, self, "_toggle_range_asu_buff")
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

	new_item:set_value(self:get_range_asu_buff() and "on" or "off")
	node:add_item(new_item)
	--]]
	self._node = node

	return new_item
end

function MutatorASUBuff:_toggle_captain_asu_buff(item)
	self:set_value("captain_asu_buff", item:value())
end
--[[
function MutatorASUBuff:_toggle_range_asu_buff(item)
	self:set_value("range_asu_buff", item:value())
end
--]]
function MutatorASUBuff:reset_to_default()
	self:clear_values()

	if self._node then
		local toggle = self._node:item("captain_asu_buff")

		if toggle then
			toggle:set_value(self:get_captain_asu_buff() and "on" or "off")
		end
		--[[
		toggle = self._node:item("range_asu_buff")
		if toggle then
			toggle:set_value(self:get_range_asu_buff() and "on" or "off")
		end
		--]]
	end
end

function MutatorASUBuff:options_fill()
	if self:get_captain_asu_buff() == "on" then
		return 1
	else
		return 0
	end
end
