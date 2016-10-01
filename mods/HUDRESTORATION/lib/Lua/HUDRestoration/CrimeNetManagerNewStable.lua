--Controls CRIME.NET ambience noise.
CrimeNetGui.oinit = CrimeNetGui.init
CrimeNetGui.oupdate = CrimeNetGui.update

function CrimeNetGui:init(...)
	
		CrimeNetGui:oinit(...)
	self._crimenet_ambience = managers.menu_component:post_event( "crimenet_ambience" )
	if self._panel:child("back_button") then
		self._panel:remove(self._panel:child("back_button"))
	end
	if self._panel:child("controller_legend_blur") then
		self._panel:remove(self._panel:child("controller_legend_blur"))
	end
	if self._panel:child("num_players_text") then
		self._panel:remove(self._panel:child("num_players_text"))
	end
	if self._panel:child("num_players_blur") then
		self._panel:remove(self._panel:child("num_players_blur"))
	end
	--[[if self._panel:child("legends_button") then
		self._panel:remove(self._panel:child("legends_button"))
	end]]
	if self._panel:child("legends_button_blur") then
		self._panel:remove(self._panel:child("legends_button_blur"))
	end
	
	
	local back_button = self._panel:text( { name="back_button", text=managers.localization:to_upper_text("menu_back"), align="right", vertical="bottom", font_size=tweak_data.menu.pd2_large_font_size, font=tweak_data.menu.pd2_large_font, color=tweak_data.hud.prime_color, layer=40, blend_mode="add" } )
	self:make_fine_text( back_button )
	back_button:set_right( self._panel:w() - 10 )
	back_button:set_bottom( self._panel:h() - 10 )
	back_button:set_visible( managers.menu:is_pc_controller() )
	
	local back_button_bg = self._panel:rect( { blend_mode="add", h=back_button:h() * 2, w = back_button:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	back_button_bg:set_right( back_button:right()+5 )
	back_button_bg:set_bottom( back_button:bottom()+5 )
	

	local map_coord_text = self._panel:text( { name="map_coord_text", text=utf8.to_upper( managers.localization:text("cn_menu_mapcoords", {zoom=1, x="000.00", y="000.00"}) ), align="left", vertical="bottom", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.button_stage_2, layer=28 } )
	self:make_fine_text( map_coord_text )
	map_coord_text:set_left( 15 )
	map_coord_text:set_bottom( self._panel:h() - 15 )

	local map_coord_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = map_coord_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	map_coord_text_bg:set_left( map_coord_text:left()-5 )
	map_coord_text_bg:set_bottom( map_coord_text:bottom()+5 )
	
	map_coord_text:set_w( map_coord_text_bg:w() )
	
	local num_contracts_text = self._panel:text( { name="num_contracts_text", text=managers.localization:text("cn_menu_num_contracts", {contracts="000", friends="000"}), align="left", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.button_stage_2, layer=28 } )
	self:make_fine_text( num_contracts_text )
	num_contracts_text:set_left( 15 )
	num_contracts_text:set_top( 15 )
	
	local num_contracts_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = num_contracts_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	num_contracts_text_bg:set_left( num_contracts_text:left()-5 )
	num_contracts_text_bg:set_top( num_contracts_text:top()-5 )
	
	num_contracts_text:set_w( num_contracts_text_bg:w() )
	
	
	local crime_net_text = self._panel:text( { name="crime_net_text", text=managers.localization:text("menu_crimenet"), align="right", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_large_font_size, font=tweak_data.menu.pd2_large_font, color=tweak_data.screen_colors.button_stage_2, layer=28 } )
	self:make_fine_text( crime_net_text )
	crime_net_text:set_right( self._panel:w() - 15 )
	crime_net_text:set_top( 15 )

	local crime_net_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = crime_net_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	crime_net_text_bg:set_right( crime_net_text:right()+5 )
	crime_net_text_bg:set_top( crime_net_text:top()-5 )
	
	
	self._panel:text( { name = "cyber_text", text = "92839429043203489320489541458861681864561321638433203489320489023489023480915134789321321864891392392839429043203489320489023489029283942904320348932048902341651861681890234809239283942904320348932048902348902348092392839429043203489320489023489023480923348092348902928394290432034893204890234890234809239283942904320348932048902348902348092392839429043203489323489023480923",
							wrap = true, x = 20, y = 20, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, color = Color.white:with_alpha( 0.2 ), layer = 1, visible = true, w = 60 } )
	local _,_,_,h = self._panel:child( "cyber_text" ):text_rect()
	self._panel:child( "cyber_text" ):set_h( h )
	
	self._panel:text( { name = "text_indicator1", text = "LT: 100.566", x = 0, y = 0, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	self._panel:text( { name = "text_indicator2", text = "LT: 100.566", x = 0, y = 0, align="right", halign="right", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	--[[self._panel:bitmap( { name="cross_indicator1", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ) } )
	self._panel:bitmap( { name="cross_indicator2", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 90 } )
	self._panel:bitmap( { name="cross_indicator3", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 180 } )
	self._panel:bitmap( { name="cross_indicator4", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 270 } )]]
	
	self._panel:rect( { name="v_rect", color = Color.white:with_alpha( 0.05 ), w = 100, h = self._panel:h() - 16, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator2", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = self._panel:h() - 2 - 8, layer = 5 } ):hide()
	self._panel:rect( { name="h_rect", color = Color.white:with_alpha( 0.05 ), w = self._panel:w() - 16, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator2", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = self._panel:w() - 2 - 8, y = 0, layer = 5 } ):hide()
end


function CrimeNetGui:update(...)
	
	CrimeNetGui:oupdate(...)

	local x = (self._fullscreen_panel:child( "cross_indicator_v1" ):x() + self._fullscreen_panel:child( "cross_indicator_v2" ):x()) / 2
	local y = (self._fullscreen_panel:child( "cross_indicator_h1" ):y() + self._fullscreen_panel:child( "cross_indicator_h2" ):y()) / 2
	
	x = string.format( "%.1f", x )
	y = string.format( "%.1f", y )
	local zoom_string = string.format( "%.2f", self._zoom )
	self._panel:child("map_coord_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_mapcoords", {zoom=zoom_string, x=x, y=y} ) ) )
	
	local num_jobs = 0
	
	for i, d in pairs( self._jobs ) do
		num_jobs = num_jobs + 1
	end
	
	
	
	local friends = (is_win32 and Steam:logged_on() and Steam:friends()) or {}				-- TODO: need to get friends for all platforms
	local num_friends_playing = 0
	
	for _, friend in ipairs( friends ) do
		if( friend:playing_this() ) then
			num_friends_playing = num_friends_playing + 1
		end
	end
	
	local num_jobs_string = string.format( "%03d", num_jobs )
	local num_friends_playing_string = string.format( "%03d", num_friends_playing )
	self._panel:child("num_contracts_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_num_contracts", {contracts=num_jobs_string, friends=num_friends_playing_string} ) ) )
	
	
	
	self._panel:child( "text_indicator1" ):set_text( string.format( "%.2f", self._panel:child( "v_indicator" ):x() + self._panel:child( "h_indicator" ):y() ) )
	self._panel:child( "text_indicator2" ):set_text( string.format( "%.2f", self._panel:child( "v_indicator" ):x() / self._panel:child( "h_indicator" ):y() ) )
	
	self._panel:child( "cyber_text" ):set_y( 200 - math.mod( math.floor( Application:time() )*20, self._panel:child( "cyber_text" ):line_height() * 10 ) )
	
end

function CrimeNetGui:mouse_moved(o, x, y)
	if not self._crimenet_enabled then
		return false
	end
	if managers.menu:is_pc_controller() then
		if self._panel:child("back_button"):inside(x, y) then
			if not self._back_highlighted then
				self._back_highlighted = true
				self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return true, "link"
		elseif self._back_highlighted then
			self._back_highlighted = false
			self._panel:child("back_button"):set_color(tweak_data.hud.prime_color)
		end
		if self._panel:child("legends_button"):inside(x, y) then
			if not self._legend_highlighted then
				self._legend_highlighted = true
				self._panel:child("legends_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return true, "link"
		elseif self._legend_highlighted then
			self._legend_highlighted = false
			self._panel:child("legends_button"):set_color(tweak_data.screen_colors.button_stage_3)
		end
		if self._panel:child("filter_button") then
			if self._panel:child("filter_button"):inside(x, y) then
				if not self._filter_highlighted then
					self._filter_highlighted = true
					self._panel:child("filter_button"):set_color(tweak_data.screen_colors.button_stage_2)
					managers.menu_component:post_event("highlight")
				end
				return true, "link"
			elseif self._filter_highlighted then
				self._filter_highlighted = false
				self._panel:child("filter_button"):set_color(tweak_data.screen_colors.button_stage_3)
			end
		end
	end
	if self._grabbed_map then
		local left = x > self._grabbed_map.x
		local right = not left
		local up = y > self._grabbed_map.y
		local down = not up
		local mx = x - self._grabbed_map.x
		local my = y - self._grabbed_map.y
		if left and self._map_panel:x() > -self:_get_pan_panel_border() then
			mx = math.lerp(mx, 0, 1 - self._map_panel:x() / -self:_get_pan_panel_border())
		end
		if right and self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			mx = math.lerp(mx, 0, 1 - (self._fullscreen_panel:w() - self._map_panel:right()) / -self:_get_pan_panel_border())
		end
		if up and self._map_panel:y() > -self:_get_pan_panel_border() then
			my = math.lerp(my, 0, 1 - self._map_panel:y() / -self:_get_pan_panel_border())
		end
		if down and self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			my = math.lerp(my, 0, 1 - (self._fullscreen_panel:h() - self._map_panel:bottom()) / -self:_get_pan_panel_border())
		end
		table.insert(self._grabbed_map.dirs, 1, {mx, my})
		self._grabbed_map.dirs[10] = nil
		self:_set_map_position(mx, my)
		self._grabbed_map.x = x
		self._grabbed_map.y = y
		return true, "grab"
	end
	local closest_job
	local closest_dist = 100000000
	local closest_job_x, closest_job_y = 0, 0
	local job_x, job_y
	local dist = 0
	local inside_any_job = false
	local math_x, math_y
	for id, job in pairs(self._jobs) do
		local inside = job.marker_panel:child("select_panel"):inside(x, y) and self._panel:inside(x, y)
		inside_any_job = inside_any_job or inside
		if inside then
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
			math_x = job_x - x
			math_y = job_y - y
			dist = math_x * math_x + math_y * math_y
			if closest_dist > dist then
				closest_job = job
				closest_dist = dist
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
	end
	for id, job in pairs(self._jobs) do
		local inside = job == closest_job and 1 or inside_any_job and 2 or 3
		self:update_job_gui(job, inside)
	end
	if not managers.menu:is_pc_controller() then
		local to_left = x
		local to_right = self._panel:w() - x - 19
		local to_top = y
		local to_bottom = self._panel:h() - y - 23
		local panel_border = self._pan_panel_border
		to_left = 1 - math.clamp(to_left / panel_border, 0, 1)
		to_right = 1 - math.clamp(to_right / panel_border, 0, 1)
		to_top = 1 - math.clamp(to_top / panel_border, 0, 1)
		to_bottom = 1 - math.clamp(to_bottom / panel_border, 0, 1)
		local mouse_pointer_move_x = managers.mouse_pointer:mouse_move_x()
		local mouse_pointer_move_y = managers.mouse_pointer:mouse_move_y()
		local mp_left = -math.min(0, mouse_pointer_move_x)
		local mp_right = -math.max(0, mouse_pointer_move_x)
		local mp_top = -math.min(0, mouse_pointer_move_y)
		local mp_bottom = -math.max(0, mouse_pointer_move_y)
		local push_x = mp_left * to_left + mp_right * to_right
		local push_y = mp_top * to_top + mp_bottom * to_bottom
		if push_x ~= 0 or push_y ~= 0 then
			self:_set_map_position(push_x, push_y)
		end
	end
	if inside_any_job then
		return true, "link"
	end
	if self._panel:inside(x, y) then
		return true, "hand"
	end
end