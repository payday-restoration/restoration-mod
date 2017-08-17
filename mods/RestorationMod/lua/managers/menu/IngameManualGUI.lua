--[[

]]--

require "lib/managers/menu/MenuBackdropGUI"

IngameManualGui = IngameManualGui or class()

function IngameManualGui:init( workspace )
	managers.menu_component:play_transition(true)
	self._backdrop = MenuBackdropGUI:new( managers.gui_data:create_fullscreen_workspace() )
	self._backdrop:create_black_borders()
	--local res = RenderSettings.resolution
	self._active = false
	self._workspace = managers.gui_data:create_fullscreen_workspace()
	self._panel = self._workspace:panel():panel({})
	--[[self._workspace_size = {
		x = 0,
		y = 0,
		w = res.x,
		h = res.y
	}]]--
	local massive_font = tweak_data.menu.pd2_massive_font
	local large_font = tweak_data.menu.pd2_large_font
	local medium_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font
	
	local massive_font_size = tweak_data.menu.pd2_massive_font_size
	local large_font_size = tweak_data.menu.pd2_large_font_size
	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size
	
	self._background_layer_safe = self._backdrop:get_new_background_layer()
	self._background_layer_full = self._backdrop:get_new_background_layer()
	self._foreground_layer_safe = self._backdrop:get_new_foreground_layer()
	self._foreground_layer_full = self._backdrop:get_new_foreground_layer()
	
	self._baselayer_two = self._backdrop:get_new_base_layer()
	
	self._backdrop:set_panel_to_saferect( self._background_layer_safe )
	self._backdrop:set_panel_to_saferect( self._foreground_layer_safe )
	
	self._callback_handler = {}
	
	local manual_string = managers.localization:to_upper_text("menu_manual_header")
	local manual_text = self._foreground_layer_safe:text( { name="loot_text", text=manual_string, align="center", vertical="top", font_size=large_font_size, font=large_font, color=tweak_data.screen_colors.text } )
	self:make_fine_text( manual_text )
	
	local bg_text = self._background_layer_full:text( { text=manual_text:text(), h=90, align="left", vertical="top", font_size=massive_font_size, font=massive_font, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	self:make_fine_text( bg_text )
	
	local x, y = managers.gui_data:safe_to_full_16_9( manual_text:world_x(), manual_text:world_center_y() )
	bg_text:set_world_left( manual_text:world_x() )
	bg_text:set_world_center_y( manual_text:world_center_y() )
	bg_text:move( -13, 9 )

	self._panel:text( { name="back_button", text=utf8.to_upper( managers.localization:text("menu_back") ), align="right", vertical="bottom", font_size=large_font_size, font=large_font, color=tweak_data.screen_colors.button_stage_3 } )
	self:make_fine_text( self._panel:child("back_button") )
	self._panel:child("back_button"):set_right( self._panel:w() )
	self._panel:child("back_button"):set_bottom( self._panel:h() )
	self._panel:child("back_button"):set_visible( managers.menu:is_pc_controller() )
	
end

function IngameManualGui:mouse_moved(o, x, y)
	if self._panel:child("back_button"):inside(x, y) then
		used = true
		pointer = "link"
		if not self._back_button_highlighted then
			self._back_button_highlighted = true
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
			return used, pointer
		end
	elseif self._back_button_highlighted then
		self._back_button_highlighted = false
		self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
	end
end

function IngameManualGui:mouse_pressed(button, x, y)
	if self._panel:child("back_button"):inside(x, y) then
		managers.menu:back(true)
		return
	end
end

function IngameManualGui:make_fine_text( text )
	local x,y,w,h = text:text_rect()
	text:set_size( w, h )
	text:set_position( math.round( text:x() ), math.round( text:y() ) )
	-- text:set_position( math.round( x ), math.round( y ) )
end

function IngameManualGui:close()
	self._backdrop:close()
	managers.menu_component:play_transition(true)
	self._backdrop = nil
end