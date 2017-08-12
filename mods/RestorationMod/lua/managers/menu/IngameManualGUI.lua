IngameManualGui = IngameManualGui or class()

IngameManualGui.PAGES = 8

function IngameManualGui:init( ws, fullscreen_ws )
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	
	self._manual_panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()
	
	self._active = true
	self:_setup_controller_input()
	
	local black_bg = self._fullscreen_panel:rect( { color=Color.black, layer=0, halign="scale", valign="scale", alpha=0 } )
	local fade_in_anim = function(o)
		over(0.35, function(p) o:set_alpha( p ) end )
	end
	black_bg:animate( fade_in_anim )
	
	
	local width = math.round( self._manual_panel:w() )
	local height = math.round( ( self._manual_panel:h() - (self._manual_panel:w() / 2) ) * 0.5 )
	--local polyline = self._manual_panel:polyline( { layer=4, points={ Vector3(0, height, 0), Vector3(width, height, 0), Vector3(width, self._manual_panel:h()-height, 0), Vector3(0, self._manual_panel:h()-height, 0) }, closed=true, rotation=360, color=tweak_data.screen_color_blue:with_alpha(0.5), blend_mode="add" } )
	
	self._manual_panel:rect( { w=width, h=1, x=0, y=height, layer=4 } )
	self._manual_panel:rect( { w=width, h=1, x=0, y=self._manual_panel:h()-height-1, layer=4 } )
	self._manual_panel:rect( { w=1, h=self._manual_panel:h()-height*2-2, x=0, y=height+1, layer=4 } )
	self._manual_panel:rect( { w=1, h=self._manual_panel:h()-height*2-2, x=self._manual_panel:w()-1, y=height+1, layer=4 } )
	
	
	self._manual_y = height
	
	self._page_counter = self._manual_panel:text( { font=tweak_data.menu.pd2_medium_font, font_size=tweak_data.menu.pd2_medium_font_size, text="1/"..tostring(self.PAGES), layer=4, align="center" } )
	
	self._zoom = 1
	self:open_manual_page( 1 )
end

function IngameManualGui:_setup_controller_input()
	self._left_axis_vector = Vector3()
	self._right_axis_vector = Vector3()
	
	self._ws:connect_controller( managers.menu:active_menu().input:get_controller(), true )
	self._manual_panel:axis_move( callback( self, self, "_axis_move" ) )
end

function IngameManualGui:_destroy_controller_unput()
	self._ws:disconnect_all_controllers()
	if alive( self._panel ) then
		self._manual_panel:axis_move( nil )
	end
end

function IngameManualGui:_axis_move( o, axis_name, axis_vector, controller )
	if axis_name == Idstring( "left" ) then
		mvector3.set( self._left_axis_vector, axis_vector )
	elseif axis_name == Idstring( "right" ) then
		mvector3.set( self._right_axis_vector, axis_vector )
	end
end

function IngameManualGui:update( t, dt )
	if managers.menu:is_pc_controller() then
		return
	end
	
	if mvector3.is_zero( self._left_axis_vector ) then
		-- self:stop_controller_move()
	else
		local x = mvector3.x( self._left_axis_vector )
		local y = mvector3.y( self._left_axis_vector )
		self:controller_move( -x * dt, y * dt )
	end
	
	if mvector3.is_zero( self._right_axis_vector ) then
	else
		local y = mvector3.y( self._right_axis_vector )
		self:controller_zoom( y * dt )
	end
end

function IngameManualGui:correct_position()
	if self._page:left() > 0 then
		self._page:set_left( 0 )
	elseif self._page:right() < self._page_panel:w() then
		self._page:set_right( self._page_panel:w() )
	end
	
	if self._page:top() > 0 then
		self._page:set_top( 0 )
	elseif self._page:bottom() < self._page_panel:h() then
		self._page:set_bottom( self._page_panel:h() )
	end
end

function IngameManualGui:controller_move( x, y )
	if self._loading then
		return
	end
	if not alive( self._page ) then
		return
	end
	local speed = 512
	
	self._page:move( x*speed, y*speed )
	self:correct_position()
end

function IngameManualGui:controller_zoom( y )
	if self._loading then
		return
	end
	if not alive( self._page ) then
		return
	end
	
	self._zoom = math.clamp( self._zoom + y * 2, 1, 2 )
	local w, h = self._manual_panel:size()
	local px, py = self._page:position()
	
	local x = w/2 - px
	local y = h/2 - py
	
	local sx = x / self._page:w()
	local sy = y / self._page:h()
	
	
	
	local aspect = self._page:texture_height() / math.max( self._page:texture_width(), 1 )
	local width = self._page_panel:w()
	local height = self._page_panel:h()
	
	self._page:set_size( width * self._zoom, width * aspect * self._zoom )
	self._page:set_position( w/2 - sx * self._page:w(), h/2 - sy * self._page:h() )
	self:correct_position()
end

function IngameManualGui:next_page()
	self:open_manual_page( self._current_page + 1 )
end

function IngameManualGui:previous_page()
	self:open_manual_page( self._current_page - 1 )
end

function IngameManualGui:input_focus()
	return 1
end

function IngameManualGui:open_manual_page( page )
	-- self._current_page = (page - 1) % self.PAGES + 1
	local new_page = math.clamp( page, 1, self.PAGES )
	if new_page == self._current_page then
		return
	end
	
	local path = "guis/textures/restoration/ingame_manual/page_"
	local lang_key = SystemInfo:language():key()
	local files = {
		[Idstring("french"):key()] = "_fr",
		[Idstring("spanish"):key()] = "_es",
	}
	self._zoom = 1
	
	self._current_page = new_page
	self._page_counter:set_text( tostring(self._current_page) .. "/" .. tostring(self.PAGES) )
	
	local new_page = path .. tostring(page) .. ( files[lang_key] or "" )
	print(new_page)
	if DB:has( Idstring( "texture" ), new_page ) then
		self._loading = new_page
		TextureCache:request( new_page, "NORMAL", callback( managers.menu_component, managers.menu_component, "ingame_manual_texture_done" ) )
	end
	
	self:remove_page()
	self._page = self._manual_panel:panel()
	local loading_text = self._page:text( { font=tweak_data.menu.pd2_large_font, font_size=tweak_data.menu.pd2_large_font_size, text=managers.localization:to_upper_text("debug_loading_level") } )
	local x, y, w, h = loading_text:text_rect()
	loading_text:set_size( w, h )
	
	local spinning_item = self._page:bitmap( { w=32, h=32, texture="guis/textures/icon_loading" } )
	
	loading_text:set_position( 10, self._manual_y+10 )
	spinning_item:set_left( loading_text:right() )
	spinning_item:set_center_y( loading_text:center_y() )
	--[[
	loading_text:set_center_y( self._page:h()/2 )
	loading_text:set_right( self._page:w()/2 )
	
	spinning_item:set_center_y( self._page:h()/2 )
	spinning_item:set_left( self._page:w()/2 )]]
	
	local spin_anim = function(o)
		local dt
		while( true ) do
			dt = coroutine.yield()
			
			o:rotate( 360 * dt )
		end
	end
	spinning_item:animate( spin_anim )
end


function IngameManualGui:remove_page()
	if self._page_panel then
		self._page_panel:parent():remove( self._page_panel )
		self._page_panel = nil
		self._page = nil
	end
	if self._page then
		self._page:parent():remove( self._page )
		self._page = nil
	end
end

function IngameManualGui:create_page( texture_ids )
	local new_page_panel = self._manual_panel:panel( { visible=false } )
	local texture = new_page_panel:bitmap( { name="texture", texture=texture_ids, layer=1 } )
	if not self._loading or Idstring(self._loading) ~= texture_ids then
		new_page_panel:parent():remove( new_page_panel )
		return
	end
	new_page_panel:show()
	
	self:remove_page()
	self._page_panel = new_page_panel
	self._page = texture
	
	
	local aspect = self._page:texture_height() / math.max( self._page:texture_width(), 1 )
	local width = self._manual_panel:w()
	local height = self._manual_panel:h()
	
	new_page_panel:set_h( width * aspect )
	new_page_panel:set_w( width )
	new_page_panel:set_center( self._manual_panel:w()/2, self._manual_panel:h()/2 )
	
	self._page:set_w( new_page_panel:w() )
	self._page:set_h( new_page_panel:h() )
	
	texture:set_size( self._page:w(), self._page:h() )
	
	self._loading = nil
end

function IngameManualGui:set_layer( layer )
	-- self._manual_panel:set_layer( layer )
end

function IngameManualGui:close()
	self:_destroy_controller_unput()
	
	self._ws:panel():remove(self._manual_panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
end


