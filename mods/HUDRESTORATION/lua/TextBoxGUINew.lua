--[[function TextBoxGui:add_background()
	if alive(self._fullscreen_ws) then
		Overlay:gui():destroy_workspace(self._fullscreen_ws)
		self._fullscreen_ws = nil
	end
	self._fullscreen_ws = Overlay:gui():create_screen_workspace()
	self._background = self._fullscreen_ws:panel():rect( { name = "bg", color = Color.black:with_alpha(0.4), layer=0, blend_mode="normal", valign = "grow" } )
	self._background2 = self._fullscreen_ws:panel():rect({
		name = "bg",
		color = Color.black,
		alpha = 0,
		layer = 0,
		blend_mode = "normal",
		halign = "grow",
		valign = "grow"
	})
	--self._background:set_render_template( Idstring( "gaussian_blur" ) ) -- BROKEN AF, DO NOT USE
end

function TextBoxGui:_create_text_box(ws, title, text, content_data, config)
	self._ws = ws
	self._init_layer = self._ws:panel():layer()
	if alive(self._text_box) then
		ws:panel():remove(self._text_box)
		self._text_box = nil
	end
	if self._info_box then
		self._info_box:close()
		self._info_box = nil
	end
	self._text_box_focus_button = nil
	local scaled_size = managers.gui_data:scaled_size()
	local type = config and config.type
	local preset = type and self.PRESETS[type]
	
	local stats_list = content_data and content_data.stats_list
	local stats_text = content_data and content_data.stats_text
	local button_list = content_data and content_data.button_list
	local focus_button = content_data and content_data.focus_button
	
	local use_indicator = config and config.use_indicator or false
	local no_close_legend = config and config.no_close_legend
	local no_scroll_legend = config and config.no_scroll_legend
	self._no_scroll_legend = no_scroll_legend
	local only_buttons = config and config.only_buttons
	local use_minimize_legend = config and config.use_minimize_legend or false
	local w = preset and preset.w or config and config.w or scaled_size.width / 2.25
	local h = preset and preset.h or config and config.h or scaled_size.height / 2
	local x = preset and preset.x or config and config.x or 0
	local y = preset and preset.y or config and config.y or 0
	local bottom = preset and preset.bottom or config and config.bottom
	
	local forced_h = preset and preset.forced_h or config and config.forced_h or false
	local title_font = preset and preset.title_font or config and config.title_font or tweak_data.menu.default_font
	local title_font_size = preset and preset.title_font_size or config and config.title_font_size or tweak_data.menu.topic_font_size
	local font = preset and preset.font or config and config.font or tweak_data.menu.small_font_noshadow
	local font_size = preset and preset.font_size or config and config.font_size or 14
	local use_text_formating = preset and preset.use_text_formating or config and config.use_text_formating or false
	local text_formating_color = preset and preset.text_formating_color or config and config.text_formating_color or Color.white
	local text_formating_color_table = preset and preset.text_formating_color_table or config and config.text_formating_color_table or nil
	local is_title_outside = preset and preset.is_title_outside or config and config.is_title_outside or false
	local text_blend_mode = preset and preset.text_blend_mode or config and config.text_blend_mode or "normal"
	self._allow_moving = config and config.allow_moving or false
	local preset_or_config_y = y ~= 0
	
	title = title and utf8.to_upper(title)
	if text then
	end
	
	local main = ws:panel():panel({
		visible = self._visible,
		x = x,
		y = y,
		w = w,
		h = h,
		layer = self._init_layer,
		valign = "center"
	})
	self._panel = main
	self._panel_h = self._panel:h()
	self._panel_w = self._panel:w()
	
	if bottom then
		main:set_bottom( bottom )
	elseif y == 0 then 
		main:set_center_y( scaled_size.height/2 )
	end
	
	local title_text = main:text({
		name = "title",
		text = title or "none",
		layer = 1,
		wrap = false,
		word_wrap = false,
		visible = title and true or false,
		font = title_font,
		font_size = title_font_size,
		align = "left",
		halign = "left",
		vertical = "top",
		valign = "top"--,
		--x = 10,
		--y = 10,
		--rotation = 360
	})
	local _, _, tw, th = title_text:text_rect()
	title_text:set_size(tw, th)
	--th = th + 10
	--if is_title_outside then
	--	th = 0
	--end
	self._indicator = main:bitmap({
		name = "indicator",
		texture = "guis/textures/icon_loading",
		visible = use_indicator,
		layer = 1
	})
	self._indicator:set_right(main:w())
	local top_line = main:bitmap({
		name = "top_line",
		texture = "guis/textures/headershadow",
		layer = 0,
		color = Color.white,
		w = main:w(),
		y = 0
	})
	top_line:set_bottom(th)
	local bottom_line = main:bitmap({
		name = "bottom_line",
		texture = "guis/textures/headershadow",
		rotation = 180,
		layer = 0,
		color = Color.white,
		w = main:w(),
		y = 100
	})
	bottom_line:set_top(main:h() - th)
	--top_line:hide()
	--bottom_line:hide()
	local lower_static_panel = main:panel({
		name = "lower_static_panel",
		x = 0,
		y = 0,
		w = main:w(),
		h = 0,
		layer = 0
	})
	self:_create_lower_static_panel(lower_static_panel)
	local info_area = main:panel({
		name = "info_area",
		x = 0,
		y = math.round( th ),
		w = main:w(),
		h = main:h() - th * 2,
		layer = 0
	})
	local info_bg = info_area:bitmap({ 
		name="info_bg", 
		texture = "guis/textures/textboxbg", 
		layer = 0, 
		color = Color.white, 
		w = info_area:w(), 
		h = info_area:h() 
	})
	local buttons_panel = self:_setup_buttons_panel(info_area, button_list, focus_button, only_buttons)
	local scroll_panel = info_area:panel({
		name = "scroll_panel",
		x = 10,
		w = info_area:w() - buttons_panel:w() - 10*3,
		h = info_area:h(),
		layer = 1
	})
	local has_stats = stats_list and #stats_list > 0
	local stats_panel = self:_setup_stats_panel(scroll_panel, stats_list, stats_text)
	local text = scroll_panel:text({
		name = "text",
		text = text or "none",
		layer = 1,
		wrap = true,
		word_wrap = true,
		visible = text and true or false,
		w = scroll_panel:w() - math.round(stats_panel:w()) - (has_stats and 20 or 0),
		x = math.round(stats_panel:w()) + (has_stats and 20 or 0),
		font = font,
		font_size = font_size,
		align = "left",
		halign = "left",
		vertical = "top",
		valign = "top",
		blend_mode = text_blend_mode
	})
	local _,_,ttw,tth = text:text_rect()
	text:set_h( tth )
	scroll_panel:set_h( forced_h or math.max( tth, stats_panel:h() ) )
	if use_text_formating then
		local text_string = text:text()
		local text_dissected = utf8.characters(text_string)
		local idsp = Idstring("#")
		local start_ci = {}
		local end_ci = {}
		local first_ci = true
		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]
				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end
					first_ci = not first_ci
				end
			end
		end
		if #start_ci ~= #end_ci then
		else
			for i = 1, #start_ci do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end
		text_string = string.gsub(text_string, "##", "")
		text:set_text(text_string)
		text:clear_range_color(1, utf8.len(text_string))
		if #start_ci ~= #end_ci then
			Application:error("TextBoxGui: Not even amount of ##'s in skill description string!", #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				text:set_range_color(start_ci[i], end_ci[i], text_formating_color_table and text_formating_color_table[i] or text_formating_color)
			end
		end
	end
	local scroll_up_indicator_shade = main:bitmap( { name = "scroll_up_indicator_shade", texture = "guis/textures/headershadow", rotation = 180, layer = 5, color = Color.white, w = main:w() - buttons_panel:w(), y = 100 } )
	scroll_up_indicator_shade:set_top( top_line:bottom() - 6 )
	local texture, rect = tweak_data.hud_icons:get_icon_data( "scroll_up" )
	local scroll_up_indicator_arrow = main:bitmap( { name = "scroll_up_indicator_arrow", texture = texture, texture_rect = rect, layer = 3, color = Color.white } )
	scroll_up_indicator_arrow:set_lefttop( scroll_panel:right() + 2 , scroll_up_indicator_shade:top() + 8 )
		
	local scroll_down_indicator_shade = main:bitmap( { name = "scroll_down_indicator_shade", texture = "guis/textures/headershadow", layer = 5, color = Color.white, w = main:w() - buttons_panel:w(), y = 100 } )
	scroll_down_indicator_shade:set_bottom( bottom_line:top() + 6 )
	local texture, rect = tweak_data.hud_icons:get_icon_data( "scroll_dn" )
	local scroll_down_indicator_arrow = main:bitmap( { name = "scroll_down_indicator_arrow", texture = texture, texture_rect = rect, layer = 3, color = Color.white } )
	scroll_down_indicator_arrow:set_leftbottom( scroll_panel:right() + 2, scroll_down_indicator_shade:bottom() - 8 )
	self._info_box = BoxGuiObject:new(info_area, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	local bar_h = scroll_down_indicator_arrow:top() - scroll_up_indicator_arrow:bottom()
	local texture, rect = tweak_data.hud_icons:get_icon_data( "scrollbar" )
	local scroll_bar = main:bitmap( { name = "scroll_bar", texture = texture, texture_rect = rect, layer = 4, h = bar_h, color = Color.white } )
	self._scroll_bar_box_class = BoxGuiObject:new(main, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	self._scroll_bar_box_class:set_aligns("scale", "scale")
	scroll_bar:set_bottom( scroll_down_indicator_arrow:top() )
	scroll_bar:set_center_x( scroll_down_indicator_arrow:center_x() )
	local legend_minimize = main:text({
		text = "MINIMIZE",
		name = "legend_minimize",
		layer = 1,
		visible = use_minimize_legend,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		halign = "left",
		valign = "top"
	})
	local _, _, lw, lh = legend_minimize:text_rect()
	legend_minimize:set_size(lw, lh)
	legend_minimize:set_bottom(top_line:bottom() - 4)
	legend_minimize:set_right(top_line:right())
	local legend_close = main:text({
		text = "CLOSE",
		name = "legend_close",
		layer = 1,
		visible = not no_close_legend,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		halign = "left",
		valign = "top"
	})
	local _, _, lw, lh = legend_close:text_rect()
	legend_close:set_size(lw, lh)
	legend_close:set_top(bottom_line:top() + 4)
	local legend_scroll = main:text({
		text = "SCROLL WITH",
		name = "legend_scroll",
		layer = 1,
		visible = not no_scroll_legend,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		halign = "right",
		valign = "top"
	})
	local _, _, lw, lh = legend_scroll:text_rect()
	legend_scroll:set_size(lw, lh)
	legend_scroll:set_righttop(scroll_panel:right(), bottom_line:top() + 4)
	self._scroll_panel = scroll_panel
	self._text_box = main
	self:_set_scroll_indicator()
	return main
end

function TextBoxGui:_set_button_selected( index, is_selected )
	local button_panel = self._text_box_buttons_panel:child( index - 1 )
	-- print( button_panel )
	if( button_panel ) then
		local button_text = button_panel:child( "button_text" )
		local unselected = button_panel:child( "unselected" )
		local selected = self._text_box_buttons_panel:child( "selected" )
		
		
		if( is_selected ) then
			button_text:set_color( tweak_data.dialog.SELECTED_BUTTON_TEXT_COLOR )
			button_text:set_font( tweak_data.menu.default_font_no_outline_id )
			selected:set_size( unselected:size() )
			selected:set_center_y( button_panel:center_y() )
		else
			button_text:set_color( tweak_data.dialog.BUTTON_TEXT_COLOR )
			button_text:set_font( tweak_data.menu.default_font_id )
		end
	end
end

function TextBoxGui:_setup_buttons_panel(info_area, button_list, focus_button, only_buttons)
	local has_buttons = button_list and #button_list > 0
	local buttons_panel = info_area:panel({
		name = "buttons_panel",
		x = 10,
		w = has_buttons and 100 or 0,
		h = info_area:h(),
		layer = 1
	})
	buttons_panel:set_right(info_area:w())
	self._text_box_buttons_panel = buttons_panel
	if has_buttons then
		local button_text_config = {
			x = 10,
			name = "button_text",
			font = tweak_data.menu.default_font,
			font_size = tweak_data.menu.default_font_size,
			--vertical = "left",
			align = "left",
			layer = 2,
			wrap = "true",
			word_wrap = "true",
			blend_mode = "normal",
			color = tweak_data.dialog.BUTTON_TEXT_COLOR
		}
		local max_w = 0
		local max_h = 0
		if button_list then
			for i, button in ipairs(button_list) do
				local button_panel = buttons_panel:panel({
					name = button.id_name,
					y = 100,
					h = 20,
					halign = "grow"
				})
				button_text_config.text = utf8.to_upper(button.text or "")
				local text = button_panel:text(button_text_config)
				local _, _, w, h = text:text_rect()
				max_w = math.max(max_w, w)
				max_h = math.max(max_h, h)
				text:set_size(w, h)
				button_panel:set_h(h + 2)
				text:set_left(button_panel:left() + 10)
				--button_panel:set_bottom(i * h)
				button_panel:set_bottom( buttons_panel:h() - (#button_list-i) * h )
				local unselected = button_panel:bitmap( { name = "unselected", texture = "guis/textures/menu_unselected", x = 0, y = 0, layer = 0 } )
							
				unselected:set_h( 64 * button_panel:h()/32 )
				unselected:set_center_y( button_panel:h()/2 )
				unselected:set_w( button_panel:w() )
			end
			--buttons_panel:set_h(#button_list * max_h)
			buttons_panel:set_bottom(info_area:h())
		end
		if not only_buttons or not info_area:w() then
		end
		buttons_panel:set_w(math.max(max_w + 10, 100))
		buttons_panel:set_right(info_area:w())
		local buttons_rect = buttons_panel:rect( { visible = true, name = "buttons_rect", layer = -1, color = Color.black:with_alpha( 0.35 ) } )
		self._target_alpha[ buttons_rect:key() ] = 0.35
		local selected = buttons_panel:bitmap( { visible = true, name="selected", texture = "guis/textures/menu_selected", x = 0, y = 0, layer = 1 } )
		self:set_focus_button(focus_button)
	end
	return buttons_panel
end]]--

--[[
TextBoxGui.o_create_text_box = TextBoxGui._create_text_box

function TextBoxGui:_create_text_box (...)
	TextBoxGui:o_create_text_box (...)

self._panel:rect( { color=Color(0.5, 0, 0, 0), layer=-1 } )
self._panel:polyline( { color=tweak_data.screen_color_white:with_alpha(0.5), blend_mode="add", line_width=1, closed=true, points={ Vector3( 0, 0, 0 ), Vector3( self._panel:w(), 0, 0 ), Vector3( self._panel:w(), self._panel:h(), 0 ), Vector3( 0, self._panel:h(), 0 ) } } )

end]]--
