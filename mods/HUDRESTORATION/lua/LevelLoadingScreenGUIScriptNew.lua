--[[
-- The code below was originally in a GUI xml but was moved here since the loading thread can't access script from within GUI xml.
LevelLoadingScreenGuiScript = LevelLoadingScreenGuiScript or class()

function LevelLoadingScreenGuiScript:init( scene_gui, res, progress, base_layer )
	self._scene_gui = scene_gui
	self._res = res
	self._base_layer = base_layer
	
	self._level_tweak_data = arg.load_level_data.level_tweak_data
	self._gui_tweak_data = arg.load_level_data.gui_tweak_data
	self._menu_tweak_data = arg.load_level_data.menu_tweak_data
	self._scale_tweak_data = arg.load_level_data.scale_tweak_data
	self._coords = arg.load_level_data.controller_coords or false
		
	self._gui_data = arg.load_level_data.gui_data
	self._workspace_size = self._gui_data.workspace_size
	self._saferect_size = self._gui_data.saferect_size
	
	local challenges = arg.load_level_data.challenges
		
	local safe_rect_pixels = self._gui_data.safe_rect_pixels
	local safe_rect = self._gui_data.safe_rect
	local aspect_ratio = self._gui_data.aspect_ratio
	self._safe_rect_pixels = safe_rect_pixels
	self._safe_rect = safe_rect
	
	self._gui_data_manager = GuiDataManager:new( self._scene_gui, res, safe_rect_pixels, safe_rect, aspect_ratio )
	self._back_drop_gui = MenuBackdropGUI:new( nil, self._gui_data_manager, true )
	self._back_drop_gui:set_pattern( "guis/textures/loading/loading_foreground", 1 )
	
	-- local panel = self._back_drop_gui:get_new_background_layer()
	-- self._back_drop_gui:set_abstract_background_layers( 3 )
	
	local base_panel = self._back_drop_gui:get_new_base_layer()
	local level_image = base_panel:bitmap( { texture = self._gui_data.bg_texture, layer = 0, blend_mode = "add" } )
	level_image:set_alpha( 0.5 )
	
	print( "self._gui_data.bg_texture", self._gui_data.bg_texture )
	
	level_image:set_size( level_image:parent():h() * (level_image:texture_width() / level_image:texture_height()), level_image:parent():h() )
	level_image:set_position( 0, 0 )
	-- level_image:set_debug( true )
	
	local background_fullpanel = self._back_drop_gui:get_new_background_layer()
	local background_safepanel = self._back_drop_gui:get_new_background_layer()
	
	self._back_drop_gui:set_panel_to_saferect( background_safepanel )
	-- background_safepanel:set_debug( true )
	
	self._indicator = background_safepanel:bitmap( { name = "indicator", texture = "guis/textures/icon_loading", layer = 0 } )
		
	self._level_title_text = background_safepanel:text( { y = 0, text_id = "debug_loading_level", font = "fonts/font_large_mf", font_size = 36, color = Color.white, align="left", halign="left", vertical="bottom", layer = 0, h = 36 } )
	self._level_title_text:set_text( utf8.to_upper( self._level_title_text:text() ) )
	
	local _,_,w,h = self._level_title_text:text_rect()
	self._level_title_text:set_size( w, h )
	
	self._indicator:set_right( self._indicator:parent():w() )
	self._level_title_text:set_right( self._indicator:left() )
	
	local bg_loading_text = background_fullpanel:text( { y = 0, text_id = "debug_loading_level", font = "fonts/font_eroded", font_size = 80, h = 80, color = Color( 0.3, 97/255, 214/255, 255/255 ), align = "right", vertical = "top", layer = 0 } )
	bg_loading_text:set_text( utf8.to_upper( bg_loading_text:text() ) )
	
	local x, y = self._level_title_text:world_right(), self._level_title_text:world_center_y()
	bg_loading_text:set_world_right( x )
	bg_loading_text:set_world_center_y( y )
	bg_loading_text:move( 13, 3 )	

	self._back_drop_gui:animate_bg_text( bg_loading_text )
	
	if self._coords then
		self._controller = background_safepanel:bitmap( { texture="guis/textures/controller", layer = 1, w=512, h=256 } )
		self._controller:set_center( background_safepanel:w()/2, background_safepanel:h()/2 )
		
		for id, data in pairs( self._coords ) do
			data.text = background_safepanel:text( { name = id, text = data.string, font_size = 24, font = "fonts/font_medium_mf", 
												align=data.align, vertical=data.vertical, 
												halign="center", valign="center" } )
			
			local _,_,w,h = data.text:text_rect()
			data.text:set_size( w, h )
			
			if data.x then
				local x = self._controller:x() + data.x
				local y = self._controller:y() + data.y
				if data.align == "left" then
					data.text:set_left( x )
				elseif data.align == "right" then
					data.text:set_right( x )
				elseif data.align == "center" then
					data.text:set_center_x( x )
				end
				if data.vertical == "top" then
					data.text:set_top( y )
				elseif data.vertical == "bottom" then
					data.text:set_bottom( y )
				else
					data.text:set_center_y( y )
				end
			end
		end
		
		-- self._bg = background_fullpanel:rect( { visible = false, color = Color( 1, 0.1, 0.1, 0.1 ) } )
	end
	-- local _,_,w,h = bg_loading_text:text_rect()
	-- bg_loading_text:set_size( w, h )
	-- bg_loading_text:set_center_y( self._level_title_text:center_y() + safe_rect_pixels.y + 3 )
	-- bg_loading_text:set_right( self._level_title_text:right() + safe_rect_pixels.x + 10 )
	
	
	-- OLD
	
	self._tips_head_line = background_safepanel:text( { text_id = "tip_tips", font = "fonts/font_small_shadow_mf", font_size = 14 * self._scale_tweak_data.small_font_multiplier, color = Color.white, align="left", vertical="bottom", layer = base_layer + 1, h = 585} )
	self._tips_text = background_safepanel:text( { text_id = arg.load_level_data.tip_id, font = "fonts/font_small_shadow_mf", font_size = 14 * self._scale_tweak_data.small_font_multiplier, color = Color.white, align="left", vertical="bottom", wrap=true, word_wrap=true, layer = base_layer + 1 } ) -- align_s="left" vertical_s="bottom" layer="1" wrap="false" word_wrap="false" w="512" h="16" />
	self._tips_text:set_text( string.upper( self._tips_text:text() ) )
		
	self._level_title_text = background_safepanel:text( { y = 0, text_id = "debug_loading_level", font = "fonts/font_medium_shadow_mf", font_size = 32 * self._scale_tweak_data.default_font_multiplier, color = Color.white, align="left", vertical="bottom", layer = base_layer + 1, h = 30 } )
	self._level_title_text:set_text( string.upper( (self._level_tweak_data.name and self._level_tweak_data.name or "") .. " > " .. self._level_title_text:text() ) )
			

	-- self:setup( res, progress )
end
]]--