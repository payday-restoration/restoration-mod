if Restoration.options.restoration_hud_global == true then

if Restoration.options.restoration_bag_style == 2 then
function HUDManager:set_teammate_carry_info( i, carry_id, value )
	--[[if i == HUDManager.PLAYER_PANEL then
		return
	end]]
	self._teammate_panels[ i ]:set_carry_info( carry_id, value )
end

function HUDManager:remove_teammate_carry_info( i )
	--[[if i == HUDManager.PLAYER_PANEL then
		return
	end]]
	self._teammate_panels[ i ]:remove_carry_info()
end

end

function HUDManager:_add_name_label(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	local last_id = self._hud.name_labels[#self._hud.name_labels] and self._hud.name_labels[#self._hud.name_labels].id or 0
	local id = last_id + 1
	local character_name = data.name
	local rank = 0
	local peer_id
	local is_husk_player = data.unit:base().is_husk_player
	if is_husk_player then
		peer_id = data.unit:network():peer():id()
		local level = data.unit:network():peer():level()
		rank = data.unit:network():peer():rank()
		if level then
			local experience = (rank > 0 and managers.experience:rank_string(rank) .. "-" or "") .. level
			data.name = data.name .. " (" .. experience .. ")"
		end
	end
	local panel = hud.panel:panel({
		name = "name_label" .. id
	})
	local radius = 24
	local interact = CircleBitmapGuiObject:new(panel, {
		use_bg = true,
		radius = radius,
		blend_mode = "add",
		color = Color.white,
		layer = 0
	})
	interact:set_visible(false)
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bag_rect = {
		2,
		34,
		20,
		17
	}
	local color_id = managers.criminals:character_color_id_by_unit(data.unit)
	local crim_color = tweak_data.chat_colors[color_id]
	local text = panel:text({
		name = "text",
		text = utf8.to_upper(data.name),
		font = "fonts/font_medium_shadow_mf",
		font_size = tweak_data.hud.name_label_font_size + 4,
		color = crim_color,
		align = "left",
		vertical = "top",
		layer = -1,
		w = 256,
		h = 18
	})
	local bag = panel:bitmap({
		name = "bag",
		texture = tabs_texture,
		texture_rect = bag_rect,
		visible = false,
		layer = 0,
		color = crim_color * 1.1,
		x = 1,
		y = 1
	})
	panel:text({
		name = "cheater",
		text = utf8.to_upper(managers.localization:text("menu_hud_cheater")),
		font = "fonts/font_medium_shadow_mf",
		font_size = tweak_data.hud.name_label_font_size + 4,
		color = tweak_data.screen_colors.pro_color,
		align = "center",
		visible = false,
		layer = -1,
		w = 256,
		h = 18
	})
	panel:text({
		name = "action",
		rotation = 360,
		visible = false,
		text = utf8.to_upper("Fixing"),
		font = "fonts/font_medium_shadow_mf",
		font_size = tweak_data.hud.name_label_font_size + 4,
		color = crim_color * 1.1,
		align = "left",
		vertical = "bottom",
		layer = -1,
		w = 256,
		h = 18
	})
	if rank > 0 then
		local infamy_icon = tweak_data.hud_icons:get_icon_data("infamy_icon")
		panel:bitmap({
			name = "infamy",
			texture = infamy_icon,
			layer = 0,
			w = 16,
			h = 32,
			color = crim_color
		})
	end
	self:align_teammate_name_label(panel, interact)
	table.insert(self._hud.name_labels, {
		movement = data.unit:movement(),
		panel = panel,
		text = text,
		id = id,
		peer_id = peer_id,
		character_name = character_name,
		interact = interact,
		bag = bag
	})
	return id
end

end
--------- SERVES NO PURRPOSE FOR NOW - D.A. ------------
--[[function HUDManager:set_weapon_ammo_by_unit( unit )
	local second_weapon_index = self._hud.selected_weapon == 1 and 2 or 1
	if second_weapon_index == unit:base():weapon_tweak_data().use_data.selection_index then
		self:_update_second_weapon_ammo_info( HUDManager.PLAYER_PANEL, unit )
	end
end

function HUDManager:_update_second_weapon_ammo_info( i, unit )
	--self._teammate_panels[ i ]:update_second_weapon_ammo_info( unit )
end

function HUDManager:_set_teammate_weapon_selected( i, id, icon )
	-- print( "_set_teammate_weapon_selected", i, id )
	-- Application:stack_dump()
	-- local icon = 
	self._teammate_panels[ i ]:set_weapon_selected( id, icon )
	
	-- THIS SHOULD BE REMOVED	
	for i,data in pairs( self._hud.weapons ) do
		-- local weapon = teammate_panel:child( "weapon"..i )
		if alive( data.bitmap ) then
			data.bitmap:set_visible( false and id == i )
		end
		self:set_weapon_ammo_by_unit( data.unit )
		if id == i then
			-- self:_set_hud_ammo( data.unit )
		end
		-- i = i + 1
	end
end]]