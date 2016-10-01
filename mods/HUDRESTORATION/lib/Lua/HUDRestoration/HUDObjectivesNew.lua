function HUDBGBox_create( panel, params, config )
	local box_panel = panel:panel( params )
	local color = config and config.color
	local blend_mode = config and config.blend_mode
	box_panel:rect( { name = "bg", halign="grow", valign="grow", blend_mode = "normal", alpha = 0, color = Color( 1, 0, 0, 0 ), layer = -1 } )
	
	local left_top = box_panel:bitmap( { halign="left", valign="top", name = "left_top", color = color, blend_mode = blend_mode, visible = true, layer = 0, texture = "guis/textures/pd2/hud_corner", x = 0, y = 0 } )
	
	local left_bottom = box_panel:bitmap( { halign="left", valign="bottom", color = color, rotation = -90, name = "left_bottom", blend_mode = blend_mode, visible = true, layer = 0, texture = "guis/textures/pd2/hud_corner", x = 0, y = 0 } )
	left_bottom:set_bottom( box_panel:h() )
	
	local right_top = box_panel:bitmap( { halign="right", valign="top", color = color, rotation = 90, name = "right_top", blend_mode = blend_mode, visible = true, layer = 0, texture = "guis/textures/pd2/hud_corner", x = 0, y = 0 } )
	right_top:set_right( box_panel:w() )
	
	local right_bottom = box_panel:bitmap( { halign="right", valign="bottom", color = color, rotation = 180, name = "right_bottom", blend_mode = blend_mode, visible = true, layer = 0, texture = "guis/textures/pd2/hud_corner", x = 0, y = 0 } )
	right_bottom:set_right( box_panel:w() )
	right_bottom:set_bottom( box_panel:h() )
	
	return box_panel
end

local box_speed = 1000
function HUDBGBox_animate_open_right( panel, wait_t, target_w, done_cb )
	panel:set_visible( false )
	panel:set_w( 8 )
	
	if panel:child( "bar_left" ) then	
		panel:child( "bar_left" ):set_x( 0 )
	end
	if panel:child( "bar_mid" ) then	
		panel:child( "bar_mid" ):set_x( 8 )
		panel:child( "bar_mid" ):set_w( 0 )
	end
	if panel:child( "bar_right" ) then	
		panel:child( "bar_right" ):set_x( 8 )
	end
	
	if wait_t then
		wait( wait_t )
	end
	panel:set_visible( true )
	local speed = box_speed
	local bg = panel:child( "bg" )
	bg:stop()
	bg:animate( callback( nil, _G, "HUDBGBox_animate_bg_attention" ) )
	local TOTAL_T = target_w/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (1 - t/TOTAL_T) * target_w + 16 )
		if panel:child( "bar_left" ) then	
			panel:child( "bar_left" ):set_x( 0 )
		end
		if panel:child( "bar_mid" ) then	
			panel:child( "bar_mid" ):set_x( 8 )
			panel:child( "bar_mid" ):set_w( (1 - t/TOTAL_T) * (target_w - 16) )
		end
		if panel:child( "bar_right" ) then	
			panel:child( "bar_right" ):set_x( 8 + (1 - t/TOTAL_T) * (target_w - 16) )
		end
	end
	
	panel:set_w( target_w )
	
	if panel:child( "bar_left" ) then	
		panel:child( "bar_left" ):set_x( 0 )
	end
	if panel:child( "bar_mid" ) then	
		panel:child( "bar_mid" ):set_x( 8 )
		panel:child( "bar_mid" ):set_w( (target_w - 16) )
	end
	if panel:child( "bar_right" ) then	
		panel:child( "bar_right" ):set_x( 8 + (target_w - 16) )
	end
	
	done_cb()
end

function HUDBGBox_animate_close_right( panel, done_cb )
	local speed = box_speed
	local cw = panel:w()
	local TOTAL_T = cw/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (t/TOTAL_T) * cw )
	end
	
	panel:set_w( 0 )
	
	done_cb()
end

function HUDBGBox_animate_open_left( panel, wait_t, target_w, done_cb, config )
	config = config or {}
	panel:set_visible( false )
	local right = panel:right()
	panel:set_w( 0 )
	panel:set_right( right )
	if wait_t then
		wait( wait_t )
	end
	panel:set_visible( true )
	local speed = box_speed
	local bg = panel:child( "bg" )
	bg:stop()
	bg:animate( callback( nil, _G, "HUDBGBox_animate_bg_attention" ), { color = config.attention_color, forever = config.attention_forever } )
	local TOTAL_T = target_w/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (1 - t/TOTAL_T) * target_w )
		panel:set_right( right )
	end
	
	panel:set_w( target_w )
	panel:set_right( right )
		
	done_cb()
end

function HUDBGBox_animate_close_left( panel, done_cb )
	local speed = box_speed
	local cw = panel:w()
	local right = panel:right()
	local TOTAL_T = cw/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (t/TOTAL_T) * cw )
		panel:set_right( right )
	end
	
	panel:set_w( 0 )
	panel:set_right( right )
	
	done_cb()
end

function HUDBGBox_animate_open_center( panel, wait_t, target_w, done_cb, config )
	config = config or {}
	panel:set_visible( false )
	local center_x = panel:center_x()
	panel:set_w( 0 )
	if wait_t then
		wait( wait_t )
	end
	panel:set_visible( true )
	local speed = box_speed
	local bg = panel:child( "bg" )
	bg:stop()
	bg:animate( callback( nil, _G, "HUDBGBox_animate_bg_attention" ), { color = config.attention_color, forever = config.attention_forever } )
	local TOTAL_T = target_w/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (1 - t/TOTAL_T) * target_w )
		panel:set_center_x( center_x )
	end
	
	panel:set_w( target_w )
	panel:set_center_x( center_x )
	
	if done_cb then
		done_cb()
	end
end

function HUDBGBox_animate_close_center( panel, done_cb )
	local center_x = panel:center_x()
	local cw = panel:w()
	local speed = box_speed
	local TOTAL_T = cw/speed
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		panel:set_w( (t/TOTAL_T) * cw )
		panel:set_center_x( center_x )
	end
	
	panel:set_w( 0 )
	panel:set_center_x( center_x )
	
	if done_cb then
		done_cb()
	end
end

function HUDBGBox_animate_bg_attention( bg, config )
	local color = config and config.color or Color.white
	local forever = config and config.forever or false
	local TOTAL_T = 3
	local t = TOTAL_T
	while t > 0 or forever do
		local dt = coroutine.yield()
		t = t - dt
		local cv = math.abs( ( (math.sin( (t) * 180 * 1 ) ) ) )
		bg:set_color( Color( 1, color.red * cv, color.green * cv, color.blue * cv ) )
	end
	bg:set_color( Color( 1, 0, 0, 0 ) )
end

--------------------------------------------------------------------------

HUDObjectives = HUDObjectives or class()

function HUDObjectives:init( hud )
	self._hud_panel = hud.panel
		
	if self._hud_panel:child( "objectives_panel" ) then	
		self._hud_panel:remove( self._hud_panel:child( "objectives_panel" ) )
	end
	
	local objectives_panel = self._hud_panel:panel( { visible = false, name = "objectives_panel", x = 0, y = 0, h = 100, w = 500, valign = "top" } )
	-- objectives_panel:set_debug( true )
	
	local icon_objectivebox = objectives_panel:bitmap( { halign="left", valign="top", name = "icon_objectivebox", blend_mode = "normal", visible = false, layer = 0, texture = "guis/textures/pd2/hud_icon_objectivebox", x = 0, y = 0, w = 24, h = 24 } )
	
	self._bg_box = HUDBGBox_create( objectives_panel, { w = 200, h = 38, x = 0, y = 0 }, {color = Color(0, 0, 0, 0)} ) -- HUDBGBox:new( objectives_panel, { w = 200, h = 40, y = 20 } )
	
	local bar_left = self._bg_box:bitmap( { halign="left", valign="top", name = "bar_left", blend_mode = "normal", color = Color( 80/255, 185/255, 240/255 ), visible = true, layer = 0, texture = "units/world/architecture/desert/des_bazaar_shop/des_bazaar_shop_df", x = 0, y = 0, w = 8, h = 32 } )
	local bar_mid = self._bg_box:bitmap( { halign="left", valign="top", name = "bar_mid", blend_mode = "normal", color = Color( 80/255, 185/255, 240/255 ), visible = true, layer = 0, texture = "units/world/architecture/desert/des_bazaar_shop/des_bazaar_shop_nm", x = 0, y = 0, w = 32, h = 32 } )
	local bar_right = self._bg_box:bitmap( { halign="left", valign="top", name = "bar_right", blend_mode = "normal", color = Color( 80/255, 185/255, 240/255 ), visible = true, layer = 0, texture = "units/world/architecture/desert/des_bazaar_stand/des_bazaar_stand_df", x = 0, y = 0, w = 8, h = 32 } )
	
	local objective_text = objectives_panel:text( { name = "objective_text", visible = false, layer = 2, color = Color( 0, 0, 0 ), text="", font_size = 20, font = tweak_data.hud.medium_font_noshadow, x = 0, y = 8, align = "left", vertical = "top" } )
	objective_text:set_x( self._bg_box:x() + 8 )
	objective_text:set_y( 6 )
	
	local amount_text = objectives_panel:text( { name = "amount_text", visible = true, layer = 2, color = Color( 0, 0, 0 ), text="1/4", font_size = 20, font = tweak_data.hud.medium_font_noshadow, x = 6, y = 0, align = "left", vertical = "top" } )
	amount_text:set_x( self._bg_box:x() + 8 )
	amount_text:set_y( 6 )
end

function HUDObjectives:activate_objective( data )

	self._active_objective_id = data.id
	
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	local objective_text = objectives_panel:child( "objective_text" )
	local amount_text = objectives_panel:child( "amount_text" )
	objective_text:set_text( utf8.to_upper( data.text ) )
	local _,_,w,_ = objective_text:text_rect()
	-- objectives_panel:child( "objectives_pad_panel" ):set_w( w + 12*2 )
	
	amount_text:set_x( objective_text:x() + 4 + w )
	objectives_panel:set_visible( true )
		
	self._bg_box:set_h( 38 )
	
	local w2 = 0
	
	amount_text:set_visible( false )
	if data.amount then
		self:update_amount_objective( data )
		local _, _, wide, _ = amount_text:text_rect()
		w2 = wide + 4
	end
		
	objective_text:set_visible( false )
	self._bg_box:stop()
	self._bg_box:animate( callback( nil, _G, "HUDBGBox_animate_open_right" ), 0.66, w + 8*2 + w2 + 8, callback( self, self, "open_right_done", data.amount and true or false ) )
	
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
	
	--local bg = self._bg_box:child( "bg" )
	--bg:stop()
	--bg:animate( callback( nil, _G, "HUDBGBox_animate_bg_attention" ) )
end

function HUDObjectives:complete_objective( data )
	-- print( "HUDObjectives:complete_objective", inspect( data ) )
	if data.id ~= self._active_objective_id then
		return
	end
		
	local objectives_panel = self._hud_panel:child( "objectives_panel" )
	-- objectives_panel:child( "objective_text" ):set_text( string.upper( "" ) )
	-- objectives_panel:set_visible( false )
	objectives_panel:stop()
	objectives_panel:animate( callback( self, self, "_animate_complete_objective" ) )
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
	objective_text:stop()
	objective_text:animate( callback( self, self, "_animate_show_text" ), amount_text )
end

function HUDObjectives:_animate_show_text( objective_text, amount_text )
	local TOTAL_T = 0.5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		
		local alpha = math.round( math.abs( ( (math.sin( (t) * 360 * 3 ) ) ) ) )
			
		--objective_text:set_alpha( alpha )
		--amount_text:set_alpha( alpha )
	end
	objective_text:set_alpha( 1 )
	amount_text:set_alpha( 1 )
end

function HUDObjectives:_animate_complete_objective( objectives_panel )
	local objective_text = objectives_panel:child( "objective_text" )
	local amount_text = objectives_panel:child( "amount_text" )
	local icon_objectivebox = objectives_panel:child( "icon_objectivebox" )
	icon_objectivebox:set_y( 0 )
	
	objective_text:set_alpha( 0 )
	amount_text:set_alpha( 0 )
	
	-- Flash text
	local TOTAL_T = 0.5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		
		local vis = math.round( math.abs( ( (math.cos( (t) * 360 * 3 ) ) ) ) )
				
		--objective_text:set_alpha( vis )
		--amount_text:set_alpha( vis )
	end
	objective_text:set_alpha( 1 )
	amount_text:set_alpha( 1 )
	objective_text:set_visible( false )
	amount_text:set_visible( false )
	
	-- Called when box is closed
	local done_cb = function()
		objectives_panel:child( "objective_text" ):set_text( utf8.to_upper( "" ) )
		objectives_panel:set_visible( false )	
	end
	
	-- Close box
	self._bg_box:stop()
	self._bg_box:animate( callback( nil, _G, "HUDBGBox_animate_close_right" ), done_cb )
end

function HUDObjectives:_animate_activate_objective( objectives_panel )
	self._bg_box:animate( callback( self, self, "_animate_icon_objectivebox" ) )
end

function HUDObjectives:_animate_icon_objectivebox( icon_objectivebox )
	local TOTAL_T = 5
	local t = TOTAL_T
	icon_objectivebox:set_x( 0 )
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		
		local curval = (TOTAL_T-t)
		local smt = math.round((1 + math.sin( curval * 450 * 2 )) * (12 * (t/TOTAL_T) ))
		
		local blink = 1 - (1 + math.sin( curval * math.pi * 200 ) )/2
		
		local col = Color( (255 - 175 * blink)/255, (255 - 70 * blink)/255, (255 - 15 * blink)/255 )
		
		if icon_objectivebox:child( "bar_left" ) then	
			icon_objectivebox:child( "bar_left" ):set_color( col )
		end
		if icon_objectivebox:child( "bar_mid" ) then
			icon_objectivebox:child( "bar_mid" ):set_color( col )
		end
		if icon_objectivebox:child( "bar_right" ) then
			icon_objectivebox:child( "bar_right" ):set_color( col )
		end
		
		icon_objectivebox:set_x( 0 + smt )
		if self._hud_panel and self._hud_panel:child( "objectives_panel" ) then
			local objectives_panel = self._hud_panel:child( "objectives_panel" )
			local objective_text = objectives_panel:child( "objective_text" )
			objective_text:set_x( 8 + smt )
			local amount_text = objectives_panel:child( "amount_text" )
			local _,_,w,_ = objective_text:text_rect()
			amount_text:set_x( objective_text:x() + 4 + w )
		end
		
	end
	icon_objectivebox:set_x( 0 )
	
	local col = Color( 80/255, 185/255, 240/255 )
	
	if icon_objectivebox:child( "bar_left" ) then	
		icon_objectivebox:child( "bar_left" ):set_color( col )
	end
	if icon_objectivebox:child( "bar_mid" ) then
		icon_objectivebox:child( "bar_mid" ):set_color( col )
	end
	if icon_objectivebox:child( "bar_right" ) then
		icon_objectivebox:child( "bar_right" ):set_color( col )
	end
		
	if self._hud_panel and self._hud_panel:child( "objectives_panel" ) then
		local objectives_panel = self._hud_panel:child( "objectives_panel" )
		local objective_text = objectives_panel:child( "objective_text" )
		objective_text:set_x( 8 )
		local amount_text = objectives_panel:child( "amount_text" )
		local _,_,w,_ = objective_text:text_rect()
		amount_text:set_x( objective_text:x() + 4 + w )
	end
	
end

HUDObjectives:init(managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2))
HUDObjectives:activate_objective( {
	id = HUDObjectives._active_objective_id or 1, 
	text = "Yo, hector wants you to burn money, again.", 
	current_amount = 4,
	amount = 20,
})
--HUDObjectives:remind_objective( HUDObjectives._active_objective_id or 1 )
