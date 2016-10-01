--Controls various fonts and settings.

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
	self._panel:set_top(175 + tweak_data.menu.pd2_medium_font_size)
	self._panel:grow(0, -self._panel:top())
	self._ready = managers.network:session():local_peer():waiting_for_player_ready()
	local ready_text = self:ready_text()
	self._ready_button = self._panel:text({
		name = "ready_button",
		text = ready_text,
		align = "right",
		vertical = "center",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.eroded_font,
		color = tweak_data.screen_colors.button_stage_3,
		layer = 1,
		blend_mode = "add"
	})
	local _, _, w, h = self._ready_button:text_rect()
	self._ready_button:set_size(w, h)
	if not managers.menu:is_pc_controller() then
	end
	self._ready_tick_box = self._panel:bitmap({
		name = "ready_tickbox",
		texture = "guis/textures/pd2/mission_briefing/gui_tickbox",
		layer = 1
	})
	self._ready_tick_box:set_rightbottom(self._panel:w(), self._panel:h())
	self._ready_tick_box:set_image(self._ready and "guis/textures/pd2/mission_briefing/gui_tickbox_ready" or "guis/textures/pd2/mission_briefing/gui_tickbox")
	self._ready_button:set_center_y(self._ready_tick_box:center_y())
	self._ready_button:set_right(self._ready_tick_box:left() - 5)
	local big_text = self._fullscreen_panel:text({
		name = "ready_big_text",
		text = ready_text,
		h = 90,
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.eroded_font,
		color = tweak_data.screen_colors.button_stage_2,
		alpha = 0.4
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
	WalletGuiObject.set_wallet(self._safe_workspace:panel(), 10)
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
	self._description_item = DescriptionItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_description")), 1, self._node:parameters().menu_component_data.saved_descriptions)
	table.insert(self._items, self._description_item)
	self._assets_item = AssetsItem:new(self._panel, managers.preplanning:has_current_level_preplanning() and managers.localization:to_upper_text("menu_preplanning") or utf8.to_upper(managers.localization:text("menu_assets")), 2, {}, nil, asset_data)
	table.insert(self._items, self._assets_item)
	self._new_loadout_item = NewLoadoutTab:new(self._panel, managers.localization:to_upper_text("menu_loadout"), 3, loadout_data)
	table.insert(self._items, self._new_loadout_item)
	if not Global.game_settings.single_player then
		self._team_loadout_item = TeamLoadoutItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_team_loadout")), 4)
		table.insert(self._items, self._team_loadout_item)
	end
	if tweak_data.levels[Global.level_data.level_id].music ~= "no_music" then
		self._jukebox_item = JukeboxItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_jukebox")), Global.game_settings.single_player and 4 or 5)
		table.insert(self._items, self._jukebox_item)
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
	if max_x < self._items[#self._items]._tab_text:right() then
		for i, tab in ipairs(self._items) do
			tab:reduce_to_small_font()
		end
	end
	self._selected_item = 0
	self:set_tab(self._node:parameters().menu_component_data.selected_tab, true)
	local box_panel = self._panel:panel()
	box_panel:set_shape(self._items[self._selected_item]:panel():shape())
	BoxGuiObject:new(box_panel, {
		sides = {
			1,
			1,
			2,
			1
		}
	})
	if managers.assets:is_all_textures_loaded() or #managers.assets:get_all_asset_ids(true) == 0 then
		self:create_asset_tab()
	end
	self._items[self._selected_item]:select(true)
	self._enabled = true
	self:flash_ready()
end