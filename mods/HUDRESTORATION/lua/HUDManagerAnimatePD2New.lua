core:import( "CoreEvent" )
--This files contains gui animate functions

function HUDManager:_animate_activate_objective( objectives_panel )
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
	end
	objective_start_new:set_color( objective_start_new:color():with_alpha( 0 ) )
	objective_mid_new:set_color( objective_mid_new:color():with_alpha( 0 ) )
	objective_end_new:set_color( objective_end_new:color():with_alpha( 0 ) )
	-- print( "done" )
end

--[[function HUDManager:_animate_assault( assault_panel )
	local corner = assault_panel:child( "corner" )
	local corner2 = assault_panel:child( "corner2" )
	local assault_title = assault_panel:child( "assault_title" )
	while true do
		local a = 0.25 + (math.sin( Application:time()*750 )+1)/4
		-- print( "a", a, 1 - a )
		corner:set_color( corner:color():with_alpha( a ) )
		corner2:set_color( corner2:color():with_alpha( 0.25 ) )
		assault_title:set_color( Color( a, 0, 0.8-a ) )
		-- o:set_color( o:color():with_alpha( 0.5 + (math.sin( Application:time()*750 )+1)/4 ) )
		coroutine.yield()
	end]]