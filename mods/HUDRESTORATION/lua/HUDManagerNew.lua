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

function HUDManager:_setup_player_info_hud_pd2()
	print("_setup_player_info_hud_pd2")
	if not self:alive(PlayerBase.PLAYER_INFO_HUD_PD2) then
		return
	end
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	self:_create_teammates_panel(hud)
	self:_create_present_panel(hud)
	self:_create_interaction(hud)
	self:_create_progress_timer(hud)
	self:_create_objectives(hud)
	self:_create_hint(hud)
	self:_create_heist_timer(hud)
	self:_create_temp_hud(hud)
	self:_create_suspicion(hud)
	self:_create_hit_confirm(hud)
	self:_create_hit_direction(hud)
	self:_create_downed_hud()
	self:_create_custody_hud()
	self:_create_hud_chat()
	self:_create_assault_corner()
	--[[if self:alive( "guis/player_downed_hud" ) then
		log("[RESTORATION] YAY!")
	else
		log("[RESTORATION] DANGIT!")
	end]]
	if not self:exists(Idstring("guis/mask_off_hud")) then
		managers.hud:load_hud(Idstring("guis/mask_off_hud"), false, false, true, {})
	end
	if self:alive( "guis/mask_off_hud" ) then
		self:script("guis/mask_off_hud").mask_on_text:set_center_y( hud.panel:center_y()/1.5 )
		self:script("guis/mask_off_hud").mask_on_text:set_font( Idstring("fonts/font_medium_shadow_mf") )
		self:script("guis/mask_off_hud").mask_on_text:set_font_size(32)
	else
		log("[RESTORATION] DANGIT!")
	end

end

function HUDManager:add_waypoint(id, data)
	if self._hud.waypoints[id] then
		self:remove_waypoint(id)
	end
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	if not hud then
		self._hud.stored_waypoints[id] = data
		return
	end
	local waypoint_panel = hud.panel
	local icon = data.icon or "wp_standard"
	local text = ""
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(icon, {
		0,
		0,
		32,
		32
	})
	local bitmap = waypoint_panel:bitmap({
		name = "bitmap" .. id,
		texture = icon,
		texture_rect = texture_rect,
		layer = 0,
		w = texture_rect[3],
		h = texture_rect[4],
		blend_mode = data.blend_mode,
		rotation = 360
	})
	local arrow_icon, arrow_texture_rect = tweak_data.hud_icons:get_icon_data("wp_arrow")
	local arrow = waypoint_panel:bitmap({
		name = "arrow" .. id,
		texture = arrow_icon,
		texture_rect = arrow_texture_rect,
		color = data.color or Color.white:with_alpha(0.75),
		visible = false,
		layer = 0,
		w = arrow_texture_rect[3],
		h = arrow_texture_rect[4],
		blend_mode = data.blend_mode,
		rotation = 360
	})
	local distance
	if data.distance then
		distance = waypoint_panel:text({
			name = "distance" .. id,
			text = "16.5",
			color = data.color or Color(1, 1, 0.65882355, 0),
			font = "fonts/font_medium_shadow_mf",
			font_size = tweak_data.hud.default_font_size + 4,
			align = "center",
			vertical = "center",
			w = 128,
			h = 24,
			layer = 0,
			blend_mode = data.blend_mode,
			rotation = 360
		})
		distance:set_visible(false)
	end
	local timer = data.timer and waypoint_panel:text({
		name = "timer" .. id,
		text = (math.round(data.timer) < 10 and "0" or "") .. math.round(data.timer),
		font = tweak_data.hud.medium_font_noshadow,
		font_size = 32,
		align = "center",
		vertical = "center",
		w = 32,
		h = 32,
		layer = 0,
		rotation = 360
	})
	text = waypoint_panel:text({
		name = "text" .. id,
		text = utf8.to_upper(" " .. text),
		font = tweak_data.hud.small_font,
		font_size = tweak_data.hud.small_font_size,
		align = "center",
		vertical = "center",
		w = 512,
		h = 24,
		layer = 0,
		rotation = 360
	})
	local _, _, w, _ = text:text_rect()
	text:set_w(w)
	local w, h = bitmap:size()
	self._hud.waypoints[id] = {
		init_data = data,
		state = data.state or "present",
		present_timer = data.present_timer or 2,
		bitmap = bitmap,
		arrow = arrow,
		size = Vector3(w, h, 0),
		text = text,
		distance = distance,
		timer_gui = timer,
		timer = data.timer,
		pause_timer = not data.pause_timer and data.timer and 0,
		position = data.position,
		unit = data.unit,
		no_sync = data.no_sync,
		move_speed = 1,
		radius = data.radius or 160
	}
	self._hud.waypoints[id].init_data.position = data.position or data.unit:position()
	local slot = 1
	local t = {}
	for _, data in pairs(self._hud.waypoints) do
		if data.slot then
			t[data.slot] = data.text:w()
		end
	end
	for i = 1, 10 do
		if not t[i] then
			self._hud.waypoints[id].slot = i
			break
		end
	end
	self._hud.waypoints[id].slot_x = 0
	if self._hud.waypoints[id].slot == 2 then
		self._hud.waypoints[id].slot_x = t[1] / 2 + self._hud.waypoints[id].text:w() / 2 + 10
	elseif self._hud.waypoints[id].slot == 3 then
		self._hud.waypoints[id].slot_x = -t[1] / 2 - self._hud.waypoints[id].text:w() / 2 - 10
	elseif self._hud.waypoints[id].slot == 4 then
		self._hud.waypoints[id].slot_x = t[1] / 2 + t[2] + self._hud.waypoints[id].text:w() / 2 + 20
	elseif self._hud.waypoints[id].slot == 5 then
		self._hud.waypoints[id].slot_x = -t[1] / 2 - t[3] - self._hud.waypoints[id].text:w() / 2 - 20
	end
end