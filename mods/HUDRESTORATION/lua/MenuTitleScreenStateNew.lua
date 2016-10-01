function MenuTitlescreenState:at_enter()
	if( not self._controller_list ) then
		self:setup()
		Application:stack_dump_error( "Shouldn't enter title more than once. Except when toggling freeflight." )
	end

	managers.music:post_event( "menu_music" )
	managers.menu:input_enabled( false )

	for index,controller in ipairs( self._controller_list ) do
		controller:enable()
	end
	
	managers.overlay_effect:play_effect( { color = Color.black, fade_in = 0, sustain = 0.1, fade_out = 0.4, blend_mode = "normal" } )
		
	managers.menu_scene:setup_camera()
	managers.menu_scene:set_scene_template( "lobby" )

	self._workspace:show()
	self._full_workspace:show()
	self._back_drop_gui:show()

	managers.user:set_index( nil )
	managers.controller:set_default_wrapper_index( nil )

	self._clbk_game_has_music_control_callback = callback( self, self, "clbk_game_has_music_control" )
	managers.platform:add_event_callback( "media_player_control", self._clbk_game_has_music_control_callback )

	self:reset_attract_video()
end

