if Restoration.options.restoration_mrender == true then
function MenuNodeGui:_create_menu_item(row_item)
	local safe_rect = self:_scaled_size()
	local align_x = safe_rect.width * self._align_line_proportions
	if row_item.gui_panel then
		self.item_panel:remove(row_item.gui_panel)
	end
	if alive(row_item.gui_pd2_panel) then
		row_item.gui_pd2_panel:parent():remove(row_item.gui_pd2_panel)
	end
	if row_item.item:parameters().back then
		row_item.item:parameters().back = false
		row_item.item:parameters().pd2_corner = true
	end
	if row_item.item:parameters().gui_node_custom then
		self:gui_node_custom(row_item)
	elseif row_item.item:parameters().back then
		row_item.gui_panel = self._item_panel_parent:panel({
			layer = self.layers.items,
			w = 30,
			h = 30
		})
		row_item.unselected = row_item.gui_panel:bitmap({
			visible = false,
			texture = "guis/textures/menu_unselected",
			x = 0,
			y = 0,
			valign = nil,
			halign = nil,
			h = row_item.gui_panel:h(),
			w = row_item.gui_panel:w(),
			layer = -1
		})
		row_item.selected = row_item.gui_panel:bitmap({
			visible = false,
			texture = "guis/textures/menu_selected",
			x = 0,
			y = 0,
			valign = nil,
			halign = nil,
			h = row_item.gui_panel:h(),
			w = row_item.gui_panel:w(),
			layer = 0
		})
		row_item.shadow = row_item.gui_panel:bitmap({
			visible = false,
			texture = "guis/textures/headershadowdown",
			layer = self.layers.items
		})
		row_item.shadow_bottom = row_item.gui_panel:bitmap({
			visible = false,
			texture = "guis/textures/headershadowdown",
			rotation = 180,
			layer = self.layers.items
		})
		row_item.arrow_selected = row_item.gui_panel:bitmap({
			blend_mode = "add",
			visible = false,
			texture = "guis/textures/menu_arrows",
			texture_rect = {
				0,
				0,
				24,
				24
			},
			x = 0,
			y = 0,
			valign = nil,
			halign = nil,
			h = row_item.gui_panel:w(),
			w = row_item.gui_panel:w(),
			layer = self.layers.items
		})
		row_item.arrow_unselected = row_item.gui_panel:bitmap({
			blend_mode = "add",
			visible = true,
			texture = "guis/textures/menu_arrows",
			texture_rect = {
				24,
				0,
				24,
				24
			},
			x = 0,
			y = 0,
			valign = nil,
			halign = nil,
			h = row_item.gui_panel:w(),
			w = row_item.gui_panel:w(),
			layer = self.layers.items
		})
	elseif row_item.item:parameters().pd2_corner then
		row_item.gui_panel = self._item_panel_parent:panel({
			layer = self.layers.items,
			w = 3,
			h = 3
		})
		row_item.gui_pd2_panel = self.ws:panel():panel({
			layer = self.layers.items
		})
		local row_item_panel = managers.menu:is_pc_controller() and row_item.gui_pd2_panel or row_item.gui_panel
		row_item.gui_text = row_item_panel:text({
			font_size = tweak_data.menu.pd2_large_font_size,
			x = 0,
			y = 0,
			align = "right",
			vertical = "bottom",
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.button_stage_3,
			layer = 0,
			text = utf8.to_upper(row_item.text),
			blend_mode = "add",
			render_template = Idstring("VertexColorTextured")
		})
		local _, _, w, h = row_item.gui_text:text_rect()
		row_item.gui_text:set_size(math.round(w), math.round(h))
		if managers.menu:is_pc_controller() then
			row_item.gui_text:set_rightbottom(row_item.gui_pd2_panel:w(), row_item.gui_pd2_panel:h())
		else
			row_item.gui_text:set_rotation(360)
			row_item.gui_text:set_right(row_item.gui_pd2_panel:w())
		end
		if MenuBackdropGUI and managers.menu:is_pc_controller() then
			local bg_text = row_item.gui_pd2_panel:text({
				text = utf8.to_upper(row_item.text),
				h = 90,
				align = "right",
				vertical = "bottom",
				font_size = tweak_data.menu.pd2_massive_font_size,
				font = tweak_data.menu.eroded_font,
				color = tweak_data.screen_colors.button_stage_3,
				alpha = 0.4,
				layer = -1,
				rotation = 360
			})
			bg_text:set_right(row_item.gui_text:right())
			bg_text:set_center_y(row_item.gui_text:center_y())
			bg_text:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_text)
		end
	elseif row_item.type == "level" then
		row_item.gui_panel = self:_text_item_part(row_item, self.item_panel, self:_right_align())
		row_item.gui_panel:set_text(utf8.to_upper(row_item.gui_panel:text()))
		row_item.gui_level_panel = self._item_panel_parent:panel({
			visible = false,
			layer = self.layers.items,
			x = 0,
			y = 0,
			w = self:_left_align(),
			h = self._item_panel_parent:h()
		})
		local level_data = row_item.item:parameters().level_id
		level_data = tweak_data.levels[level_data]
		local description = level_data and level_data.briefing_id and managers.localization:text(level_data.briefing_id) or "Missing description text"
		local image = level_data and level_data.loading_image or "guis/textures/menu/missing_level"
		row_item.level_title = row_item.gui_level_panel:text({
			layer = 1,
			text = utf8.to_upper(row_item.gui_panel:text()),
			font = self.font,
			font_size = self.font_size,
			color = row_item.color,
			align = "left",
			vertical = "top",
			wrap = false,
			word_wrap = false,
			w = 50,
			h = 128
		})
		row_item.level_text = row_item.gui_level_panel:text({
			layer = 1,
			text = utf8.to_upper(description),
			font = tweak_data.menu.small_font,
			font_size = tweak_data.menu.small_font_size,
			color = row_item.color,
			align = "left",
			vertical = "top",
			wrap = true,
			word_wrap = true,
			w = 50,
			h = 128
		})
		self:_align_normal(row_item)
	elseif row_item.type == "chat" then
		row_item.gui_panel = self.item_panel:panel({
			w = self.item_panel:w(),
			h = 100
		})
		row_item.chat_output = row_item.gui_panel:gui(Idstring("guis/chat/textscroll"), {
			layer = self.layers.items,
			h = 120,
			w = 500,
			valign = "grow",
			halign = "grow"
		})
		row_item.chat_input = row_item.gui_panel:gui(Idstring("guis/chat/chat_input"), {
			h = 25,
			w = 500,
			layer = self.layers.items,
			valign = "bottom",
			halign = "grow",
			y = 125
		})
		row_item.chat_input:script().enter_callback = callback(self, self, "_cb_chat", row_item)
		row_item.chat_input:script().esc_callback = callback(self, self, "_cb_unlock", row_item)
		row_item.chat_input:script().typing_callback = callback(self, self, "_cb_lock", row_item)
		row_item.border = row_item.gui_panel:rect({
			visible = false,
			layer = self.layers.items,
			color = tweak_data.hud.prime_color,
			w = 800,
			h = 2
		})
		self:_align_chat(row_item)
	elseif row_item.type == "friend" then
		local cot_align = row_item.align == "right" and "left" or row_item.align == "left" and "right" or row_item.align
		row_item.gui_panel = self.item_panel:panel({
			w = self.item_panel:w()
		})
		row_item.color_mod = (row_item.item:parameters().signin_status == "uninvitable" or row_item.item:parameters().signin_status == "not_signed_in") and 0.75 or 1
		row_item.friend_name = self:_text_item_part(row_item, row_item.gui_panel, self:_right_align())
		row_item.friend_name:set_color(row_item.friend_name:color() * row_item.color_mod)
		row_item.signin_status = self:_text_item_part(row_item, row_item.gui_panel, self:_left_align())
		row_item.signin_status:set_align(cot_align)
		row_item.signin_status:set_color(row_item.signin_status:color() * row_item.color_mod)
		local status_text = managers.localization:text("menu_friends_" .. row_item.item:parameters().signin_status)
		row_item.signin_status:set_text(utf8.to_upper(status_text))
		self:_align_friend(row_item)
	elseif row_item.type == "weapon_expand" or row_item.type == "weapon_upgrade_expand" then
		row_item.item:setup_gui(self, row_item)
	elseif not row_item.item:setup_gui(self, row_item) then
		local cot_align = row_item.align == "right" and "left" or row_item.align == "left" and "right" or row_item.align
		row_item.gui_panel = self:_text_item_part(row_item, self.item_panel, self:_right_align() + (row_item.is_expanded and 20 or 0))
		row_item.current_of_total = self:_text_item_part(row_item, self.item_panel, self:_right_align(), cot_align)
		row_item.current_of_total:set_font_size(20)
		row_item.current_of_total:set_visible(false)
		if row_item.item:parameters().current then
			row_item.current_of_total:set_visible(true)
			row_item.current_of_total:set_color(row_item.color)
			row_item.current_of_total:set_text("(" .. row_item.item:parameters().current .. "/" .. row_item.item:parameters().total .. ")")
		end
		if row_item.help_text then
		end
		if row_item.item:parameters().trial_buy then
			self:_setup_trial_buy(row_item)
		end
		if row_item.item:parameters().fake_disabled then
			self:_setup_fake_disabled(row_item)
		end
		if row_item.item:parameters().icon then
			row_item.icon = self.item_panel:bitmap({
				texture = row_item.item:parameters().icon,
				rotation = row_item.item:parameters().icon_rotation or 360,
				visible = row_item.item:icon_visible(),
				layer = self.layers.items + 1
			})
		end
		self:_align_normal(row_item)
	end
	local visible = row_item.item:menu_unselected_visible(self, row_item) and not row_item.item:parameters().back
	row_item.menu_unselected = self.item_panel:bitmap({
		visible = false,
		texture = "guis/textures/menu_unselected",
		x = 0,
		y = 0,
		layer = self.layers.items - 2
	})
	row_item.menu_unselected:set_color(row_item.item:parameters().is_expanded and Color(0.5, 0.5, 0.5) or Color.white)
end

function MenuNodeGui:_create_marker(node)
	self._marker_data = {}
	self._marker_data.marker = self.item_panel:panel({
		x = 0,
		y = 0,
		w = 1280,
		h = 10,
		layer = self.layers.marker
	})
	self._marker_data.gradient = self._marker_data.marker:bitmap({
		texture = "guis/textures/menu_selected",
		x = 0,
		y = 0,
		layer = 0,
		blend_mode = "add",
		alpha = self.marker_alpha or 0.6
	})
	if self.marker_color then
		self._marker_data.gradient:set_color(self.marker_color)
	end
end

function MenuNodeGui:_align_marker(row_item)
	if self.marker_color or row_item.marker_color then
		self._marker_data.gradient:set_color(row_item.item:enabled() and (row_item.marker_color or self.marker_color) or self.marker_disabled_color or row_item.disabled_color)
	end
	if row_item.item:parameters().pd2_corner then
		self._marker_data.marker:set_visible(false)
		self._marker_data.gradient:set_visible(false)
		self._marker_data.gradient:set_rotation(360)
		self._marker_data.marker:set_height(64 * row_item.gui_text:height() / 32)
		self._marker_data.gradient:set_height(64 * row_item.gui_text:height() / 32)
		self._marker_data.marker:set_w(self:_scaled_size().width - row_item.menu_unselected:x())
		self._marker_data.gradient:set_w(self._marker_data.marker:w())
		self._marker_data.marker:set_world_right(row_item.gui_text:world_right())
		self._marker_data.marker:set_world_center_y(row_item.gui_text:world_center_y() - 2)
		return
	end
	self._marker_data.marker:show()
	self._marker_data.gradient:set_rotation(0)
	self._marker_data.marker:set_height(64 * row_item.gui_panel:height() / 32)
	self._marker_data.gradient:set_height(64 * row_item.gui_panel:height() / 32)
	self._marker_data.marker:set_left(row_item.menu_unselected:x())
	self._marker_data.marker:set_center_y(row_item.gui_panel:center_y())
	local item_enabled = row_item.item:enabled()
	if item_enabled then
	else
	end
	if row_item.item:parameters().back then
		self._marker_data.marker:set_visible(false)
	else
		self._marker_data.marker:set_visible(true)
		if self._marker_data.back_marker then
			self._marker_data.back_marker:set_visible(false)
		end
	end
	if row_item.type == "upgrade" then
		self._marker_data.marker:set_left(self:_mid_align())
	elseif row_item.type == "friend" then
		if row_item.align == "right" then
			self._marker_data.marker:move(-100, 0)
		else
			local _, _, w, _ = row_item.signin_status:text_rect()
			self._marker_data.marker:set_left(self:_left_align() - w - self._align_line_padding)
		end
	elseif row_item.type == "server_column" then
		self._marker_data.marker:set_left(row_item.gui_panel:x())
	elseif row_item.type == "customize_controller" then
	else
		if row_item.type == "nothing" then
			if row_item.type == "slider" then
				self._marker_data.marker:set_left(self:_left_align() - row_item.gui_slider:width())
			elseif row_item.type == "kitslot" or row_item.type == "multi_choice" then
				if row_item.choice_panel then
					self._marker_data.marker:set_left(row_item.arrow_left:left() - self._align_line_padding + row_item.gui_panel:x())
				end
			elseif row_item.type == "toggle" then
				if row_item.gui_option then
					local x, y, w, h = row_item.gui_option:text_rect()
					self._marker_data.marker:set_left(self:_left_align() - w - self._align_line_padding + row_item.gui_panel:x())
				else
					self._marker_data.marker:set_left(row_item.gui_icon:x() - self._align_line_padding + row_item.gui_panel:x())
				end
			end
		else
		end
	end
	self._marker_data.marker:set_w(self:_scaled_size().width - self._marker_data.marker:left())
	self._marker_data.gradient:set_w(self._marker_data.marker:w())
	self._marker_data.gradient:set_visible(true)
	if row_item.type == "chat" then
		self._marker_data.gradient:set_visible(false)
	end
end
end
