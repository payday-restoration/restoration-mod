--[[
This GUI is a brand new one for the game for our manual purposes

It's WIP and this iteration as of this upload is cookie cutter of me setting up the menu backdrop

Can't figure out how to make it scale to current resolution?  And giving it a proper opening and closing animation, right now it just pops init

Improve or change how you want, since I can't work on it more right now, later

~Martini, 9:00 AM MT 8/12/17

]]--

require "lib/managers/menu/MenuBackdropGUI"

IngameManualGui = IngameManualGui or class()

function IngameManualGui:init( workspace )
	self._backdrop = MenuBackdropGUI:new( workspace )
	self._backdrop:create_black_borders()
	--local res = RenderSettings.resolution
	self._active = false
	self._workspace = workspace
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
end

function IngameManualGui:make_fine_text( text )
	local x,y,w,h = text:text_rect()
	text:set_size( w, h )
	text:set_position( math.round( text:x() ), math.round( text:y() ) )
	-- text:set_position( math.round( x ), math.round( y ) )
end

function IngameManualGui:close()
	self._backdrop:close()
	self._backdrop = nil
end


