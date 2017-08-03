if restoration.Options:GetValue("HUD/ObjectivesPanel") == true then
RestorationCore.log_shit("[RESTORATION] LOADED OBJECTIVES")
HUDObjectives = HUDObjectives or class()

function HUDObjectives:init( hud )
	self._hud_panel = hud.panel
		
	if self._hud_panel:child( "objectives_panel" ) then	
		self._hud_panel:remove( self._hud_panel:child( "objectives_panel" ) )
	end
	
	local objectives_panel = self._hud_panel:panel( { visible = false, name = "objectives_panel", x = 0, y = 0, h = 100, w = 500, valign = "top" } )
	-- objectives_panel:set_debug( true )
	
	local objectives_pad_panel = objectives_panel:panel( { name = "objectives_pad_panel", x = 0, y = 0, h = 64, w = 200 } )
	local objective_start = objectives_pad_panel:bitmap( { name = "objective_start", texture = "guis/textures/ammocounter", color = tweak_data.screen_color_blue, texture_rect = { 0, 0, 13, 64 }, layer = 0} )
	local objective_mid = objectives_pad_panel:bitmap( { name = "objective_mid", texture_rect = { 19, 0, 33, 64 }, color = tweak_data.screen_color_blue, layer = 0, texture = "guis/textures/ammocounter"} )
	local objective_end = objectives_pad_panel:bitmap( { name = "objective_end", texture_rect = { 52, 0, 12, 64 }, color = tweak_data.screen_color_blue, layer = 0, texture = "guis/textures/ammocounter"} )
	
	local objective_start_new = objectives_pad_panel:bitmap( { name = "objective_start_new", texture_rect = { 0, 0, 13, 64 }, color = Color.white:with_alpha( 0 ), layer = 1, texture = "guis/textures/ammocounter"} )
	local objective_mid_new = objectives_pad_panel:bitmap( { name = "objective_mid_new", texture_rect = { 19, 0, 33, 64 }, color = Color.white:with_alpha( 0 ), layer = 1, texture = "guis/textures/ammocounter"} )
	local objective_end_new = objectives_pad_panel:bitmap( { name = "objective_end_new", texture_rect = { 52, 0, 12, 64 }, color = Color.white:with_alpha( 0 ), layer = 1, texture = "guis/textures/ammocounter"} )
	
	objective_mid_new:set_x( objectives_pad_panel:h() )
	objective_end_new:set_x( objectives_pad_panel:h() * 2 )
	
	objective_mid:set_x( objectives_pad_panel:h() )
	objective_end:set_x( objectives_pad_panel:h() * 2 )
	
	local objective_text = objectives_panel:text( { name = "objective_text", visible = false, layer = 2, color = Color( 0, 0, 0 ), text="", font_size = 22, font = tweak_data.hud.medium_font_noshadow, x = 0, y = 10, align = "left", vertical = "top" } )
	objective_text:set_x( objectives_pad_panel:x() + 12 )
	objective_text:set_y( 21 )
	
	local amount_text = objectives_panel:text( { name = "amount_text", visible = true, layer = 2, color = Color( 0, 0, 0 ), text="99/99", font_size = 22, font = tweak_data.hud.medium_font_noshadow, x = 6, y = 0, align = "left", vertical = "top" } )
	amount_text:set_x( objectives_pad_panel:x() + 8 )
	amount_text:set_y( 21 )
end

function HUDObjectives:activate_objective( data )

	self._active_objective_id = data.id
	
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	local objective_text = objectives_panel:child( "objective_text" )
	local objectives_pad_panel = objectives_panel:child( "objectives_pad_panel" )
	local amount_text = objectives_panel:child( "amount_text" )
	objective_text:set_text( utf8.to_upper( data.text ) )
	local _,_,w,_ = objective_text:text_rect()
	local panel_w = w + 12*2 
	
	
	amount_text:set_x( objective_text:x() + 4 + w )
	objectives_panel:set_visible( true )
		
	
	local w2 = 0
	
	amount_text:set_visible( false )
	if data.amount then
		self:update_amount_objective( data )
		local _, _, wide, _ = amount_text:text_rect()
		w2 = wide + 4
	end
	objectives_pad_panel:set_w( panel_w + w2 )
	objectives_pad_panel:child( "objective_start" ):set_x( 0 )
	objectives_pad_panel:child( "objective_mid" ):set_x( 13 )
	objectives_pad_panel:child( "objective_mid" ):set_w( (panel_w + w2 - 20) )
	objectives_pad_panel:child( "objective_end" ):set_x( 13 + (panel_w + w2 - 20) )

	objectives_pad_panel:child( "objective_start_new" ):set_shape(objectives_pad_panel:child( "objective_start" ):shape())
	objectives_pad_panel:child( "objective_mid_new" ):set_shape(objectives_pad_panel:child( "objective_mid" ):shape())
	objectives_pad_panel:child( "objective_end_new" ):set_shape(objectives_pad_panel:child( "objective_end" ):shape())
	objective_text:set_visible( false )
	self:open_right_done( data.amount )
	objectives_panel:stop()
	objectives_panel:animate( callback( self, self, "_animate_activate_objective" ) )
	
end

function HUDObjectives:remind_objective( id )
	if id ~= self._active_objective_id then
		return
	end
	
	print( id, self, "LOL" )
	
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	objectives_panel:animate( callback( self, self, "_animate_activate_objective" ) )
	
end

function HUDObjectives:complete_objective( data )
	-- print( "HUDObjectives:complete_objective", inspect( data ) )
	if data.id ~= self._active_objective_id then
		return
	end
		
	--local objectives_panel = self._hud_panel:child( "objectives_panel" )
	--objectives_panel:child( "objective_text" ):set_text( string.upper( "" ) )
	--objectives_panel:set_visible( false )
end

function HUDObjectives:update_amount_objective( data )
	if data.id ~= self._active_objective_id then
		return
	end
		
	local current = data.current_amount or 0
	local amount = data.amount
	
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	-- objectives_panel:child( "amount_panel" ):child( "amount_text" ):set_text( current.."/"..amount)
	objectives_panel:child( "amount_text" ):set_text( current.."/"..amount)
end

function HUDObjectives:open_right_done( uses_amount )
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	local objective_text = objectives_panel:child( "objective_text" )
	local amount_text = objectives_panel:child( "amount_text" )
	amount_text:set_visible( uses_amount )
	objective_text:set_visible( true )
end

function HUDObjectives:_animate_show_text( objective_text, amount_text )
	objective_text:set_alpha( 1 )
	amount_text:set_alpha( 1 )
end

function HUDObjectives:_animate_complete_objective( objectives_panel )
	local objective_text = objectives_panel:child( "objective_text" )
	local amount_text = objectives_panel:child( "amount_text" )

	--objective_text:set_visible( false )
	--amount_text:set_visible( false )
end

function HUDObjectives:_animate_activate_objective( objectives_panel )
	local objectives_pad_panel = objectives_panel:child( "objectives_pad_panel" )
	local objective_start_new = objectives_pad_panel:child( "objective_start_new" )
	local objective_mid_new = objectives_pad_panel:child( "objective_mid_new" )
	local objective_end_new = objectives_pad_panel:child( "objective_end_new" )
	local TOTAL_T = 5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local a = (math.sin( t * 45 * 10 )) -- t / TOTAL_T
		objective_start_new:set_color( objective_start_new:color():with_alpha( a ) )
		objective_mid_new:set_color( objective_mid_new:color():with_alpha( a ) )
		objective_end_new:set_color( objective_end_new:color():with_alpha( a ) )
		objectives_panel:set_x(math.round((1 + math.sin((TOTAL_T - t) * 450 * 2)) * (24 * (t / TOTAL_T))))
	end
	objective_start_new:set_color( objective_start_new:color():with_alpha( 0 ) )
	objective_mid_new:set_color( objective_mid_new:color():with_alpha( 0 ) )
	objective_end_new:set_color( objective_end_new:color():with_alpha( 0 ) )
	-- print( "done" )
end

end