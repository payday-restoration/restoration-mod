if Restoration.options.restoration_mrender == true then

function MenuPauseRenderer:open( ... )
	MenuPauseRenderer.super.super.open( self, ... )
		
	--self._menu_bg = self._fullscreen_panel:bitmap( { visible = true, texture = "guis/textures/ingame_menu_bg", valign = "center", y = managers.gui_data:y_safe_to_full( 0 ), w = self._fullscreen_panel:w(), h = managers.gui_data:scaled_size().height, color = Color.white:with_alpha( 0.75 ), blend_mode = "mulx2" } )
	self._menu_bg = self._fullscreen_panel:gradient( { visible = true, valign = "center", y = managers.gui_data:y_safe_to_full( 0 ), w = self._fullscreen_panel:w(), h = managers.gui_data:scaled_size().height, orientation = "vertical", 
														gradient_points = { 1, Color( 1, 0, 0, 0), 0, Color(0, 0, 0, 0.0), 0, Color( 0, 0, 0, 0 ) }, blend_mode = "mulx2" } )
														
	self._blur_bg = self._fullscreen_panel:bitmap( { name = "blur_bg", valign = "center", texture="guis/textures/test_blur_df", y = managers.gui_data:y_safe_to_full( 0 ), w = self._fullscreen_panel:w(), h = managers.gui_data:scaled_size().height, render_template="VertexColorTexturedBlur3D", layer=-1 } )
	
	self._top_rect = self._fullscreen_panel:rect( { valign = {0,1/2}, color = Color.black, w = self._fullscreen_panel:w(), h = managers.gui_data:y_safe_to_full( 0 ) } )
	self._bottom_rect = self._fullscreen_panel:rect( { valign = {1/2,1/2}, color = Color.black, y = managers.gui_data:y_safe_to_full( managers.gui_data:scaled_size().height ), w = self._fullscreen_panel:w(), h = managers.gui_data:y_safe_to_full( 0 ) } )
	
	MenuRenderer._create_framing( self )
end

function MenuPauseRenderer:show_node( node )
	local gui_class = MenuNodeGui
	if node:parameters().gui_class then
		gui_class = CoreSerialize.string_to_classtable( node:parameters().gui_class )
	end
	if not managers.menu:active_menu() then
		Application:error( "now everything is broken" )
	end
	local alignment
    if node:parameters().name == "jukebox_menu_playlist" or node:parameters().name == "jukebox_heist_playlist" or node:parameters().name == "base_lua_mods_menu" then
   	 alignment = "right"
    else
   	 alignment = "left"
    end
	local parameters = { 	font = tweak_data.menu.default_font_no_outline,
							row_item_color = tweak_data.menu.default_font_row_item_color, 
							row_item_hightlight_color = tweak_data.menu.default_hightlight_row_item_color, 
							row_item_blend_mode = "normal",
							font_size = tweak_data.menu.default_font_size,
							--texture = { texture = "guis/textures/menu_background", width = 1024, height = 512 }, --, padding = 50 },
							node_gui_class = gui_class, 
							spacing = node:parameters().spacing,
							marker_alpha = 0.6,
							marker_color = tweak_data.menu.default_font_row_item_color,
							align = alignment or "left",
							to_upper = true,
	 					}
	MenuPauseRenderer.super.super.show_node( self, node, parameters )
end

function MenuPauseRenderer:update( t, dt )
	MenuPauseRenderer.super.update( self, t, dt )
	local x, y = managers.mouse_pointer:modified_mouse_pos()
	y = math.clamp( y, 0 , managers.gui_data:scaled_size().height )
	y = y/managers.gui_data:scaled_size().height
	--self._menu_bg:set_gradient_points( { 0, Color( 1, 0, 0, 0), y, Color(0.0, 0.4, 0.2, 0.0), 1, Color( 1, 0, 0, 0 ) } )
	-- self._menu_bg:set_gradient_points( { 0, (tweak_data.screen_color_blue/4):with_alpha(0.75), y, (tweak_data.screen_color_blue/4):with_alpha(0.65), 1, (tweak_data.screen_color_blue/4):with_alpha(0.75) } )
	--self._menu_bg:set_gradient_points( { 0, (tweak_data.screen_colors.button_stage_2/4):with_alpha(0.75), y, (tweak_data.screen_colors.button_stage_3/4):with_alpha(0.65), 1, (tweak_data.screen_colors.button_stage_2/4):with_alpha(0.75) } )
	self._menu_bg:set_gradient_points( { 0, Color( 1, 0, 0, 0), (math.sin( t * 10 ) + 1)/2, Color(0.0, 0.4, 0.2, 0.0), 1, Color( 1, 0, 0, 0 ) } )
end

end
