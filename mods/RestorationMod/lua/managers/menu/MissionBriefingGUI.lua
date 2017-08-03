if restoration.Options:GetValue("HUD/Loadouts") then
function MissionBriefingTabItem:init(panel, text, i)
	self._main_panel = panel
	self._panel = self._main_panel:panel({})
	self._index = i
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(i - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() + 5 or 0
	self._tab_string = text
	self._tab_string_prefix = ""
	self._tab_string_suffix = ""
	local tab_string = self._tab_string_prefix .. self._tab_string .. self._tab_string_suffix
	self._tab_text = self._main_panel:text({
		name = "tab_text_" .. tostring(self._index),
		text = tab_string,
		h = 32,
		x = offset,
		align = "center",
		vertical = "center",
		font_size = 30,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_blue_selected,
		layer = 1
	})
	local _, _, tw, th = self._tab_text:text_rect()
	self._tab_text:set_size(tw + 15, th + 10)
	self._tab_select_rect = self._main_panel:bitmap({
		name = "tab_select_rect_" .. tostring(self._index),
		texture = "guis/textures/pd2/shared_tab_box",
		layer = 0,
		color = tweak_data.screen_colors.text,
		visible = false
	})
	self._tab_select_rect:set_shape(self._tab_text:shape())
	self._panel:set_top(self._tab_text:bottom() - 3)
	self._panel:grow(0, -(self._panel:top() + 95))
	self._selected = true
	self:deselect()
end

function MissionBriefingTabItem:update_tab_position()
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(self._index - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() or 0
	self._tab_text:set_x(offset + 5)
	--self._tab_select_rect:set_shape(self._tab_text:shape())
end

function MissionBriefingTabItem:reduce_to_small_font()
	--self._tab_text:set_font(tweak_data.menu.pd2_small_font_id)
	self._tab_text:set_font_size(24)
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(self._index - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() or 0
	local x, y, w, h = self._tab_text:text_rect()
	self._tab_text:set_size(w + 15, h + 10)
	self._tab_text:set_x(offset + 5)
	self._tab_select_rect:set_shape(self._tab_text:shape())
	self._panel:set_top(self._tab_text:bottom() - 3)
	self._panel:set_h(self._main_panel:h())
	self._panel:grow(0, -(self._panel:top() + 95))
end

function MissionBriefingTabItem:select(no_sound)
	if self._selected then
		return
	end
	self:show()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_color_blue_selected)
		self._tab_text:set_blend_mode("normal")
	end
	self._selected = true
	if no_sound then
		return
	end
	managers.menu_component:post_event("menu_enter")
end
function MissionBriefingTabItem:deselect()
	if not self._selected then
		return
	end
	self:hide()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_color_blue_noselected)
		--self._tab_text:set_blend_mode("add")
	end
	self._selected = false
end
function MissionBriefingTabItem:mouse_moved(x, y)
	if not self._selected then
		if self._tab_text:inside(x, y) then
			if not self._highlighted then
				self._highlighted = true
				self._tab_text:set_color(tweak_data.screen_color_blue_highlighted)
				managers.menu_component:post_event("highlight")
			end
		elseif self._highlighted then
			self._tab_text:set_color(tweak_data.screen_color_blue_noselected)
			self._highlighted = false
		end
	end
	return self._selected, self._highlighted
end

function DescriptionItem:init(panel, text, i, saved_descriptions)
	DescriptionItem.super.init(self, panel, text, i)
	if not managers.job:has_active_job() then
		return
	end
	local stage_data = managers.job:current_stage_data()
	local level_data = managers.job:current_level_data()
	local name_id = stage_data.name_id or level_data.name_id
	local briefing_id = managers.job:current_briefing_id()
	local title_text = self._panel:text({
		name = "title_text",
		text = managers.localization:to_upper_text(name_id),
		font_size = 28,
		font = tweak_data.menu.default_font,
		y = 10,
		x = 10,
		color = tweak_data.screen_color_blue
	})
	local x, y, w, h = title_text:text_rect()
	title_text:set_size(w, h)
	title_text:set_position(math.round(title_text:x()), math.round(title_text:y()))
	local pro_text
	if managers.job:is_current_job_professional() then
		pro_text = self._panel:text({
			name = "pro_text",
			text = managers.localization:to_upper_text("cn_menu_pro_job"),
			font_size = 28,
			font = tweak_data.menu.default_font,
			color = tweak_data.screen_colors.pro_color
		})
		local x, y, w, h = pro_text:text_rect()
		pro_text:set_size(w, h)
		pro_text:set_position(title_text:right() + 10, title_text:y())
	end
	self._scroll_panel = self._panel:panel({
		x = 10,
		y = title_text:bottom()
	})
	self._scroll_panel:grow(-self._scroll_panel:x() - 10, -self._scroll_panel:y())
	local desc_string = managers.localization:text(briefing_id)
	local is_level_ghostable = managers.job:is_level_ghostable(managers.job:current_level_id()) and managers.groupai and managers.groupai:state():whisper_mode()
	if is_level_ghostable and Network:is_server() then
		desc_string = desc_string
	end
	local desc_text = self._scroll_panel:text({
		name = "description_text",
		text = desc_string,
		font_size = 14,
		font = tweak_data.menu.small_font,
		wrap = true,
		word_wrap = true,
		color = tweak_data.screen_colors.text
	})
	if saved_descriptions then
		local text = ""
		for i, text_id in ipairs(saved_descriptions) do
			text = text .. managers.localization:text(text_id) .. "\n"
		end
		desc_text:set_text(text)
	end
	self:_chk_add_scrolling()
end

function DescriptionItem:reduce_to_small_font()
	DescriptionItem.super.reduce_to_small_font(self)
	if not alive(self._scroll_panel) then
		return
	end
	local desc_text = self._scroll_panel:child("description_text")
	local title_text = self._panel:child("title_text")
	self._scroll_panel:set_h(self._panel:h())
	self._scroll_panel:set_y(title_text:bottom())
	self._scroll_panel:grow(0, -self._scroll_panel:y())
	local show_scroll_line_top = 0 > desc_text:top()
	local show_scroll_line_bottom = desc_text:bottom() > self._scroll_panel:h()
	if self._scroll_box then
		self._scroll_box:create_sides(self._scroll_panel, {
			sides = {
				0,
				0,
				show_scroll_line_top and 2 or 0,
				show_scroll_line_bottom and 2 or 0
			}
		})
	end
end

function MissionBriefingGui:init(saferect_ws, fullrect_ws, node)
	self._safe_workspace = saferect_ws
	self._full_workspace = fullrect_ws
	self._node = node
	self._fullscreen_panel = self._full_workspace:panel():panel()
	self._panel = self._safe_workspace:panel():panel({
		w = self._safe_workspace:panel():w() / 2,
		layer = 6
	})
	self._panel:set_right(self._safe_workspace:panel():w())
	self._panel:set_top( self._safe_workspace:panel():h()/2 )
	self._panel:grow( 0, -self._panel:top() )
	self._ready = managers.network:session():local_peer():waiting_for_player_ready()
	local ready_text = self:ready_text()
	self._ready_button = self._panel:text({
		name = "ready_button",
		text = ready_text,
		align = "right",
		vertical = "center",
		font_size = 36,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow,
		layer = 2,
		rotation = 360
	})
	local _, _, w, h = self._ready_button:text_rect()
	self._ready_button:set_size(w, h)
	self._ready_button:set_rightbottom( self._panel:w(), self._panel:h() )
	if not managers.menu:is_pc_controller() then
	end
	local big_text = self._fullscreen_panel:text({
		name = "ready_big_text",
		text = ready_text,
		h = 90,
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.eroded_font,
		color = tweak_data.screen_color_yellow,
		alpha = 0.4,
		layer = 1,
		rotation = 360
	})
	local _, _, w, h = big_text:text_rect()
	big_text:set_size(w, h)
	local x, y = managers.gui_data:safe_to_full_16_9(self._ready_button:world_right(), self._ready_button:world_center_y())
	big_text:set_world_right(x)
	big_text:set_world_center_y(y)
	big_text:move(13, -3)
	big_text:set_layer(self._ready_button:layer() - 1)
	if MenuBackdropGUI then
		MenuBackdropGUI.animate_bg_text(self, big_text)
	end
	self._node:parameters().menu_component_data = self._node:parameters().menu_component_data or {}
	self._node:parameters().menu_component_data.asset = self._node:parameters().menu_component_data.asset or {}
	self._node:parameters().menu_component_data.loadout = self._node:parameters().menu_component_data.loadout or {}
	local asset_data = self._node:parameters().menu_component_data.asset
	local loadout_data = self._node:parameters().menu_component_data.loadout
	if not managers.menu:is_pc_controller() then
		local prev_page = self._panel:text({
			name = "tab_text_0",
			y = 0,
			w = 0,
			h = tweak_data.menu.pd2_medium_font_size,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			layer = 2,
			text = managers.localization:get_default_macro("BTN_BOTTOM_L"),
			vertical = "top"
		})
		local _, _, w, h = prev_page:text_rect()
		prev_page:set_size(w, h + 10)
		prev_page:set_left(0)
		self._prev_page = prev_page
	end
	self._items = {}
	local index = 1
	self._description_item = DescriptionItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_description")), index, self._node:parameters().menu_component_data.saved_descriptions)
	table.insert(self._items, self._description_item)
	index = index + 1
	self._assets_item = AssetsItem:new(self._panel, managers.preplanning:has_current_level_preplanning() and managers.localization:to_upper_text("menu_preplanning") or utf8.to_upper(managers.localization:text("menu_assets")), index, {}, nil, asset_data)
	table.insert(self._items, self._assets_item)
	index = index + 1
	if managers.crime_spree:is_active() then
		local gage_assets_data = {}
		self._gage_assets_item = GageAssetsItem:new(self._panel, managers.localization:to_upper_text("menu_cs_gage_assets"), index)
		table.insert(self._items, self._gage_assets_item)
		index = index + 1
	end
	self._new_loadout_item = NewLoadoutTab:new(self._panel, managers.localization:to_upper_text("menu_loadout"), index, loadout_data)
	table.insert(self._items, self._new_loadout_item)
	index = index + 1
	if not Global.game_settings.single_player then
		self._team_loadout_item = TeamLoadoutItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_team_loadout")), index)
		table.insert(self._items, self._team_loadout_item)
		index = index + 1
	end
	if managers.mutators and managers.mutators:are_mutators_active() then
		self._mutators_item = MutatorsItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_mutators")), index)
		table.insert(self._items, self._mutators_item)
		index = index + 1
	end
	if tweak_data.levels[Global.level_data.level_id].music ~= "no_music" then
		self._jukebox_item = JukeboxItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_jukebox")), index)
		table.insert(self._items, self._jukebox_item)
		index = index + 1
	end
	local max_x = self._panel:w()
	if not managers.menu:is_pc_controller() then
		local next_page = self._panel:text({
			name = "tab_text_" .. tostring(#self._items + 1),
			y = 0,
			w = 0,
			h = tweak_data.menu.pd2_medium_font_size,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			layer = 2,
			text = managers.localization:get_default_macro("BTN_BOTTOM_R"),
			vertical = "top"
		})
		local _, _, w, h = next_page:text_rect()
		next_page:set_size(w, h + 10)
		next_page:set_right(self._panel:w())
		self._next_page = next_page
		max_x = next_page:left() - 5
	end
	self._reduced_to_small_font = not managers.menu:is_pc_controller()
	self:chk_reduce_to_small_font()
	self._selected_item = 0
	self:set_tab(self._node:parameters().menu_component_data.selected_tab, true)
	local box_panel = self._panel:panel()
	box_panel:set_shape(self._items[self._selected_item]:panel():shape())
	if managers.assets:is_all_textures_loaded() or #managers.assets:get_all_asset_ids(true) == 0 then
		self:create_asset_tab()
	end
	self._items[self._selected_item]:select(true)
	if managers.job:is_current_job_competitive() then
		self:set_description_text_id("menu_competitive_rules")
	end
	self._multi_profile_item = MultiProfileItemGui:new(self._safe_workspace, self._panel)
	self._multi_profile_item:panel():set_bottom(self._panel:h())
	self._multi_profile_item:panel():set_left(0)
	self._multi_profile_item:set_name_editing_enabled(false)
	local mutators_panel = self._safe_workspace:panel()
	self._lobby_mutators_text = mutators_panel:text({
		name = "mutated_text",
		text = managers.localization:to_upper_text("menu_mutators_lobby_wait_title"),
		align = "right",
		vertical = "top",
		font_size = 36,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_colors.mutators_color_text,
		layer = self._ready_button:layer()
	})
	local _, _, w, h = self._lobby_mutators_text:text_rect()
	self._lobby_mutators_text:set_size(w, h)
	self._lobby_mutators_text:set_top(tweak_data.menu.pd2_large_font_size)
	local mutators_active = managers.mutators:are_mutators_enabled() and managers.mutators:allow_mutators_in_level(managers.job:current_level_id())
	self._lobby_mutators_text:set_visible(mutators_active)
	self._enabled = true
	--self:flash_ready()
end

function MissionBriefingGui:ready_text()
	local legend = not managers.menu:is_pc_controller() and managers.localization:get_default_macro("BTN_Y") or ""
	return (self._ready and utf8.to_upper(managers.localization:text( "menu_waiting_is_ready" )) or utf8.to_upper(managers.localization:text( "menu_click_when_ready" )))
end

function MissionBriefingGui:on_ready_pressed(ready)
	if not managers.network:session() then
		return
	end
	local ready_changed = true
	if ready ~= nil then
		ready_changed = self._ready ~= ready
		self._ready = ready
	else
		self._ready = not self._ready
	end
	managers.network:session():local_peer():set_waiting_for_player_ready(self._ready)
	managers.network:session():chk_send_local_player_ready()
	managers.network:session():on_set_member_ready(managers.network:session():local_peer():id(), self._ready, ready_changed, false)
	local ready_text = self:ready_text()
	self._ready_button:set_text(ready_text)
	self._fullscreen_panel:child("ready_big_text"):set_text(ready_text)
	if ready_changed then
		if self._ready then
			if managers.menu:active_menu() and managers.menu:active_menu().logic and managers.menu:active_menu().logic:selected_node() then
				local item = managers.menu:active_menu().logic:selected_node():item("choose_jukebox_your_choice")
				if item then
					item:set_icon_visible(false)
				end
			end
			managers.menu_component:post_event("box_tick")
		else
			managers.menu_component:post_event("box_untick")
		end
	end
end

function MissionBriefingGui:mouse_pressed(button, x, y)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._displaying_asset then
		if button == Idstring("mouse wheel down") then
			self:zoom_asset("out")
			return
		elseif button == Idstring("mouse wheel up") then
			self:zoom_asset("in")
			return
		end
		self:close_asset()
		return
	end
	if button == Idstring("mouse wheel down") then
		self:next_tab(true)
		return
	elseif button == Idstring("mouse wheel up") then
		self:prev_tab(true)
		return
	end
	if button ~= Idstring("0") then
		return
	end
	if MenuCallbackHandler:is_overlay_enabled() then
		local fx, fy = managers.mouse_pointer:modified_fullscreen_16_9_mouse_pos()
		for peer_id = 1, CriminalsManager.MAX_NR_CRIMINALS do
			if managers.hud:is_inside_mission_briefing_slot(peer_id, "name", fx, fy) then
				local peer = managers.network:session() and managers.network:session():peer(peer_id)
				if peer then
					Steam:overlay_activate("url", tweak_data.gui.fbi_files_webpage .. "/suspect/" .. peer:user_id() .. "/")
					return
				end
			end
		end
	end
	for index, tab in ipairs(self._items) do
		local pressed, cost = tab:mouse_pressed(button, x, y)
		if pressed == true then
			self:set_tab(index)
		elseif type(pressed) == "number" then
			if cost then
				if type(cost) == "number" then
					self:open_asset_buy(pressed, tab:get_asset_id(pressed))
				end
			else
				self:open_asset(pressed)
			end
		end
	end
	if self._ready_button:inside(x, y) then
		self:on_ready_pressed()
	end
	if not self._ready then
		self._multi_profile_item:mouse_pressed(button, x, y)
	end
	return self._selected_item
end

function MissionBriefingGui:mouse_moved(x, y)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false, "arrow"
	end
	if self._displaying_asset then
		return false, "arrow"
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return false, "arrow"
	end
	local mouse_over_tab = false
	for _, tab in ipairs(self._items) do
		local selected, highlighted = tab:mouse_moved(x, y)
		if highlighted and not selected then
			mouse_over_tab = true
		end
	end
	if mouse_over_tab then
		return true, "link"
	end
	local fx, fy = managers.mouse_pointer:modified_fullscreen_16_9_mouse_pos()
	for peer_id = 1, CriminalsManager.MAX_NR_CRIMINALS do
		if managers.hud:is_inside_mission_briefing_slot(peer_id, "name", fx, fy) then
			return true, "link"
		end
	end
	if self._ready_button:inside(x, y) then
		if not self._ready_highlighted then
			self._ready_highlighted = true
			self._ready_button:set_color(tweak_data.screen_color_yellow_selected)
			managers.menu_component:post_event("highlight")
		end
		return true, "link"
	elseif self._ready_highlighted then
		self._ready_button:set_color(tweak_data.screen_color_yellow)
		self._ready_highlighted = false
	end
	if managers.hud._hud_mission_briefing and managers.hud._hud_mission_briefing._backdrop then
		managers.hud._hud_mission_briefing._backdrop:mouse_moved(x, y)
	end
	local u, p = self._multi_profile_item:mouse_moved(x, y)
	return u or false, p or "arrow"
end

function MissionBriefingGui:reload_loadout()
	self._node:parameters().menu_component_data = self._node:parameters().menu_component_data or {}
	self._node:parameters().menu_component_data.loadout = self._node:parameters().menu_component_data.loadout or {}
	local loadout_data = self._node:parameters().menu_component_data.loadout
	if SystemInfo:platform() == Idstring("X360") then
		if loadout_data.changing_loadout == "primary" and loadout_data.current_slot ~= managers.blackmarket:equipped_weapon_slot("primaries") then
			managers.blackmarket:preload_primary_weapon()
		elseif loadout_data.changing_loadout == "secondary" and loadout_data.current_slot ~= managers.blackmarket:equipped_weapon_slot("secondaries") then
			managers.blackmarket:preload_secondary_weapon()
		end
	end
	loadout_data.changing_loadout = nil
	loadout_data.current_slot = nil
	local index = self._new_loadout_item._index
	self._new_loadout_item:destroy()
	self._new_loadout_item = nil
	self._items[index] = nil
	self._new_loadout_item = NewLoadoutTab:new(self._panel, managers.localization:to_upper_text("menu_loadout"), index, loadout_data)
	self._items[index] = self._new_loadout_item
	self:chk_reduce_to_small_font()
	self:set_tab(self._node:parameters().menu_component_data.selected_tab, true)
	self._items[self._selected_item]:select(true)
end

function MissionBriefingGui:close()
	managers.music:track_listen_stop()
	self:close_asset()
	local requested_asset_textures = self._assets_item and self._assets_item:get_requested_textures()
	if requested_asset_textures then
		for key, data in pairs(requested_asset_textures) do
			managers.menu_component:unretrieve_texture(data.texture, data.index)
		end
	end
	if self._panel and alive(self._panel) then
		self._panel:parent():remove(self._panel)
	end
	if self._fullscreen_panel and alive(self._fullscreen_panel) then
		self._fullscreen_panel:parent():remove(self._fullscreen_panel)
	end
	local level_tweak = tweak_data.levels[managers.job:current_level_id()]
	if level_tweak and level_tweak.on_enter_clbks then
		for _, clbk in pairs(level_tweak.on_enter_clbks) do
			clbk()
		end
	end
	end
end
