if Restoration.options.restoration_loadouts == true then
function HUDMissionBriefing:init( hud, workspace )
	self._backdrop = MenuBackdropGUI:new( workspace )
	self._backdrop:create_black_borders()
	
	self._hud = hud
	self._workspace = workspace
	
	--self._workspace:panel():set_debug( false )
	
	
	self._current_contact = managers.job:current_contact_id()
	self._singleplayer = Global.game_settings.single_player
	
	local bg_font = tweak_data.menu.eroded_font
	local title_font = tweak_data.menu.default_font
	local content_font = tweak_data.menu.medium_font
	local text_font = tweak_data.menu.pd2_small_font
	
	local bg_font_size = tweak_data.menu.pd2_massive_font_size
	local title_font_size = tweak_data.menu.pd2_large_font_size
	local content_font_size = tweak_data.menu.pd2_medium_font_size + 4
	local player_font_size = tweak_data.menu.pd2_medium_font_size
	local text_font_size = tweak_data.menu.pd2_small_font_size
	
	local interupt_stage = managers.job:interupt_stage()
	
	
	-- local saferect_shape = self._backdrop:saferect_shape()
	
	self._background_layer_one = self._backdrop:get_new_background_layer()
	self._background_layer_two = self._backdrop:get_new_background_layer()			-- allocating layers in MenuBackdropGUI, calendar do not use layer two or three, but still uses 3 layers
	self._background_layer_three = self._backdrop:get_new_background_layer()		-- other gui elements still uses these
	self._foreground_layer_one = self._backdrop:get_new_foreground_layer()
	
	self._backdrop:set_panel_to_saferect( self._background_layer_one )
	self._backdrop:set_panel_to_saferect( self._foreground_layer_one )
	
	self._ready_slot_panel = self._foreground_layer_one:panel( { name="player_slot_panel", w=self._foreground_layer_one:w()/2, h=text_font_size*4+20 } )
	self._ready_slot_panel:set_bottom( self._foreground_layer_one:h() - 70 )
	self._ready_slot_panel:set_right( self._foreground_layer_one:w() )
	
	
	--if not self._singleplayer then
		local voice_icon, voice_texture_rect = tweak_data.hud_icons:get_icon_data("mugshot_talk")
		local infamy_icon, infamy_rect = tweak_data.hud_icons:get_icon_data("infamy_icon")
		for i = 1, 4 do
			local color_id = i
			local color = tweak_data.chat_colors[color_id]
			local slot_panel = self._ready_slot_panel:panel({
				name = "slot_" .. tostring(i),
				h = player_font_size,
				y = (i - 1) * player_font_size,
				x = 10,
				w = self._ready_slot_panel:w() -- 20
			})
			local criminal = slot_panel:text({
				name = "criminal",
				font_size = player_font_size,
				font = content_font,
				color = color,
				text = tweak_data.gui.LONGEST_CHAR_NAME,
				blend_mode = "add",
				align = "left",
				vertical = "center"
			})
			local voice = slot_panel:bitmap({
				name = "voice",
				texture = voice_icon,
				visible = false,
				layer = 2,
				texture_rect = voice_texture_rect,
				w = voice_texture_rect[3],
				h = voice_texture_rect[4],
				color = color,
				x = 10
			})
			local name = slot_panel:text({
				name = "name",
				text = managers.localization:text("menu_lobby_player_slot_available") .. "  ",
				font = content_font,
				font_size = player_font_size,
				color = color:with_alpha(0.5),
				align = "left",
				vertical = "center",
				w = 356,
				h = player_font_size,
				layer = 1,
				blend_mode = "add"
			})
			local status = slot_panel:text({
				name = "status",
				visible = true,
				text = "  ",
				font = content_font,
				font_size = player_font_size,
				align = "center",
				vertical = "center",
				w = 256,
				h = player_font_size,
				layer = 1,
				blend_mode = "add",
				color = tweak_data.screen_colors.text:with_alpha(0.5)
			})
			local infamy = slot_panel:bitmap({
				name = "infamy",
				texture = infamy_icon,
				texture_rect = infamy_rect,
				visible = false,
				layer = 2,
				color = color,
				y = 1
			})
			local detection = slot_panel:panel({
				name = "detection",
				layer = 2,
				visible = false,
				w = slot_panel:h(),
				h = slot_panel:h()
			})
			local detection_ring_left_bg = detection:bitmap({
				name = "detection_left_bg",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				alpha = 0.2,
				blend_mode = "add",
				w = detection:w(),
				h = detection:h()
			})
			local detection_ring_right_bg = detection:bitmap({
				name = "detection_right_bg",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				alpha = 0.2,
				blend_mode = "add",
				w = detection:w(),
				h = detection:h()
			})
			detection_ring_right_bg:set_texture_rect(detection_ring_right_bg:texture_width(), 0, -detection_ring_right_bg:texture_width(), detection_ring_right_bg:texture_height())
			local detection_ring_left = detection:bitmap({
				name = "detection_left",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				render_template = "VertexColorTexturedRadial",
				blend_mode = "add",
				layer = 1,
				w = detection:w(),
				h = detection:h()
			})
			local detection_ring_right = detection:bitmap({
				name = "detection_right",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				render_template = "VertexColorTexturedRadial",
				blend_mode = "add",
				layer = 1,
				w = detection:w(),
				h = detection:h()
			})
			detection_ring_right:set_texture_rect(detection_ring_right:texture_width(), 0, -detection_ring_right:texture_width(), detection_ring_right:texture_height())
			local detection_value = slot_panel:text({
				name = "detection_value",
				font_size = text_font_size,
				font = content_font,
				color = color,
				text = " ",
				blend_mode = "add",
				align = "left",
				vertical = "center"
			})
			detection:set_right(slot_panel:w() - 30)
			detection_value:set_left(detection:right() + 2)
			detection_value:set_visible(detection:visible())
			local _, _, w, _ = criminal:text_rect()
			voice:set_left(w + 2)
			criminal:set_w(w)
			criminal:set_align("right")
			criminal:set_text("")
			name:set_left(voice:right() + 2)
			--local xn, yn, wn, hn = name:text_rect()
			--status:set_left(wn + 20)
			infamy:set_left(name:x())
			infamy:set_center_y(name:h() / 2)
		end
	--end
	if( not managers.job:has_active_job() ) then
		return
	end
	
	self._current_contact_data = managers.job:current_contact_data()
	self._current_level_data = managers.job:current_level_data()
	self._current_stage_data = managers.job:current_stage_data()
	self._current_job_data = managers.job:current_job_data()
	self._current_map = managers.job:current_level_id()
	self._job_class = self._current_job_data and self._current_job_data.jc or 0
	
	if self._current_contact == "shatter" or self._current_contact == "shatter_demo" then
		function making_video()
					self._contact_image = self._background_layer_two:bitmap( { name="contact_image", texture="guis/textures/pd2/mission_briefing/shatter/contact", w=720, h=720 } )
					self._contact_image = self._background_layer_two:video( { name="contact_image", video = "movies/menu", width = 1280, height = 720, blend_mode="add", loop=true, alpha=1, color = tweak_data.screen_color_red } ) -- , color = tweak_data.screen_color_yellow } )
					
		end
		self._background_layer_two:stop()
		self._background_layer_two:animate(making_video)
	
		local contact_pattern = "guis/textures/pd2/mission_briefing/shatter/bd_pattern"
		if( contact_pattern ) then
			self._backdrop:set_pattern( "guis/textures/pd2/mission_briefing/shatter/bd_pattern", 0.10, "add" )
		end
	
	else 
		local contact_gui = self._background_layer_two:gui( self._current_contact_data.assets_gui, {} )
	
		local contact_pattern = contact_gui:has_script() and contact_gui:script().pattern
		if( contact_pattern ) then
			self._backdrop:set_pattern( contact_pattern, 0.10, "add" )
		end
	
	end
	--[[local contact_pattern = contact_gui:has_script() and contact_gui:script().pattern
	local contact_video = contact_gui:has_script() and contact_gui:script().contact_video
	if( contact_pattern ) then
		self._backdrop:set_pattern( contact_pattern, 0.10, "add" )
	end
	if(contact_video) then
		log("[RESTORATION] YISSSS")
		--self._background_layer_one:stop()
		--contact_video = self._background_layer_two:bitmap( { name="contact_image", texture="guis/textures/pd2/mission_briefing/hector/hector", w=720, h=720 } )--making_video()
	end
	if self._current_contact_data.name_id == "heist_contact_the_elephant" then
		self._backdrop:set_pattern( "guis/textures/pd2/lootscreen/bg_looping", 0.10, "add" )
		--self._background_layer_two.contact_video:set_height(200)
	end
	
	--local contact_gui_id = Idstring( "guis/mission_briefing/preload_contact_"..tostring(self._current_contact) )
	-- local stage_gui_id = Idstring( "guis/mission_briefing/preload_stage_"..tostring(self._current_stage_data.level_id) )
	
	--self._preloaded_contact_gui = self._workspace:panel():gui( contact_gui_id, {} )
	-- self._preloaded_stage_gui = self._workspace:panel():gui( stage_gui_id, {} )]]
	
	local padding_y = 70
	-------------------------- Paygrade
	self._paygrade_panel = self._background_layer_one:panel( {h=2*35, w=6*35})  --, y=padding_y} )
	
	local pg_text = self._foreground_layer_one:text( { name="pg_text", text="Pay Grade: ", h=32, align="right", vertical="center", font_size=content_font_size, font=content_font, color=tweak_data.screen_colors.text } )
	local df_text = self._foreground_layer_one:text( { name="df_text", text="Difficulty: ", y=35, h=32, align="right", vertical="center", font_size=content_font_size, font=content_font, color=tweak_data.screen_colors.text } )
	local _, _, w, h = pg_text:text_rect()
	pg_text:set_size( w, h )
	self._paygrade_panel:bitmap( { name="paygrade_icon", texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect={ 32, 0, 32, 32 }, x=0, y=0, w=32, h=32 } )
	self._paygrade_panel:bitmap( { name="difficulty_icon", texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect={ 0, 0, 32, 32 }, x=0, y=35, w=32, h=32, color=tweak_data.screen_color_red } )
	local paygrade = math.ceil( self._job_class / 6 )
	local difficulty = Global.game_settings.difficulty or "normal"
	
	local job_stars = managers.job:current_job_stars()
	local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
	local difficulty_stars = job_and_difficulty_stars - job_stars
	
	
	local filled_star_rect = { 0, 32, 32, 32 }
	local empty_star_rect = { 32, 32, 32, 32 }
	
	local num_stars = 0
	local x = 35
	local y = 0
	local star_size = 35
	
	for i = 1, 6 do
		local alpha = (i>job_stars) and 0.25 or 1
		local star_texture = (i>job_stars) and empty_star_rect or filled_star_rect
		local color = Color.white
		self._paygrade_panel:bitmap( { texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect=star_texture, x=x, y=y, w=32, h=32, alpha=1, color=tweak_data.screen_color_white, alpha=alpha } )
		x = x + star_size
		num_stars = num_stars + 1
	end

	x = 35
	for i = 1, 4 do
		local alpha = (i>difficulty_stars) and 0.25 or 1
		local star_texture = (i>difficulty_stars) and empty_star_rect or filled_star_rect
		self._paygrade_panel:bitmap( { texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect=star_texture, color=tweak_data.screen_color_red, x=x, y=35, w=32, h=32, alpha=1 } )
		
		x = x + star_size
		num_stars = num_stars + 1
	end
	
	self._paygrade_panel:set_w( 7  * star_size )
	self._paygrade_panel:set_right( self._background_layer_one:w() )
	
	
	pg_text:set_right( self._paygrade_panel:left() )
	df_text:set_right( self._paygrade_panel:left() )
	
	-------------------------- Job Schedule
	self._job_schedule_panel = self._background_layer_one:panel( {h=140, w=self._background_layer_one:w()/2} )
	
	self._job_schedule_panel:set_right( self._foreground_layer_one:w() )
	--self._job_schedule_panel:set_top( padding_y + content_font_size + 15 ) -- self._paygrade_panel:bottom() + 90 )
	self._job_schedule_panel:set_top( self._paygrade_panel:bottom() + 10 )
	-- Set up some info for interupted stage
	if interupt_stage then
		self._job_schedule_panel:set_alpha( 0.2 )
		
		self._interupt_panel = self._background_layer_one:panel( {h=125, w=self._background_layer_one:w()/2} )
		local interupt_text = self._interupt_panel:text( { name="job_text", text=utf8.to_upper( managers.localization:text("menu_escape") ), h=80, align="left", vertical="top", font_size=70, font=bg_font, color=tweak_data.screen_colors.important_1, layer = 5 } )
		local _,_,w,h = interupt_text:text_rect()
		interupt_text:set_size( w, h )
		interupt_text:rotate( -15 )
		interupt_text:set_center( self._interupt_panel:w()/2, self._interupt_panel:h()/2 )
		self._interupt_panel:set_shape( self._job_schedule_panel:shape() )		
	end
	
	local num_stages = self._current_job_data and #self._current_job_data.chain or 0
	local day_color = tweak_data.screen_colors.item_stage_1
	
	local js_w = self._job_schedule_panel:w() / 7
	local js_h = self._job_schedule_panel:h()
	for i=1, 14 do
		local day_font = content_font
		local day_font_size = text_font_size + 4
		day_color = tweak_data.screen_colors.item_stage_1
		
		--[[if i > num_stages then
			day_color = tweak_data.screen_colors.item_stage_3
		-- elseif i < managers.job:current_stage() then
		elseif i == managers.job:current_stage() then
			day_font = content_font
			day_font_size = content_font_size
		end]]
		day_color = tweak_data.screen_color_white:with_alpha( ( (i > num_stages) and 0.1 ) or ( (i < managers.job:current_stage()) and 0.5 ) or 1 )
		--self._job_schedule_panel:bitmap( { name="day_rect_"..tostring(i), texture="guis/textures/pd2/mission_briefing/calendar_box", x=1+((i-1)%7)*78, y=10+math.floor((i-1)/7)*55, w=73, h=50, color=day_color, blend_mode="add" } )
		
		
		local poly = self._job_schedule_panel:polyline( { name="day_poly_"..tostring(i), color=day_color, blend_mode="add", x=1+((i-1)%7)*78, y=10+math.floor((i-1)/7)*55, w=73, h=50 } )
		poly:set_points( { Vector3( 0, 0 ), Vector3( 73, 0 ), Vector3( 73, 50 ), Vector3( 0, 50 ) } )
		poly:set_closed( true )

		poly = self._job_schedule_panel:polyline( { name="day_poly2_"..tostring(i), color=day_color:with_alpha(day_color.alpha*0.5), blend_mode="add", x=1+((i-1)%7)*78, y=10+math.floor((i-1)/7)*55, w=73, h=50 } )
		poly:set_points( { Vector3( 1, 1 ), Vector3( 72, 1 ), Vector3( 72, 49 ), Vector3( 1, 49 ) } )
		poly:set_closed( true )
		
		
		local day_text = self._job_schedule_panel:text( { name="day_"..tostring(i), text=("D" .. tostring(i) ), align="left", vertical="center", font_size=day_font_size, font=day_font, w=js_w, h=js_h, color=day_color, blend_mode="add" } )
		
		day_text:set_center( self._job_schedule_panel:child( "day_poly_"..tostring(i) ):center() )
		day_text:move( 10, -14 )
	end
	
	for i=1, managers.job:current_stage() or 0 do
		local stage_marker = self._job_schedule_panel:bitmap( { name="stage_done_" .. tostring(i), texture="guis/textures/pd2/mission_briefing/calendar_stamp", texture_rect={i==managers.job:current_stage() and 64 or 0, 0, 64, 64}, w=80, h=64, layer=1, rotation=math.rand(-10, 10) } )
		stage_marker:set_center( self._job_schedule_panel:child("day_poly_"..tostring(i)):center() )
		stage_marker:move( math.random(4)-2, math.random(4)-2 )
	end
	
	if( managers.job:has_active_job() ) then
		local payday_stamp = self._job_schedule_panel:bitmap( { name="payday_stamp", texture="guis/textures/pd2/mission_briefing/calendar_xo", texture_rect={ 80*2, 0, 96, 64 }, w=96, h=64, layer=2, rotation=math.rand(-5, 5) } )
		payday_stamp:set_center( self._job_schedule_panel:child("day_poly_"..tostring(num_stages)):center() )
		payday_stamp:move( math.random(4)-2-7, math.random(4)-2+8 )
		
		if( payday_stamp:rotation() == 0 ) then
			payday_stamp:set_rotation( 1 )
		end
	end
	
	local job_overview_text = self._foreground_layer_one:text( { name="job_overview_text", text=managers.localization:text("menu_job_overview"), h=content_font_size, align="left", vertical="bottom", font_size=content_font_size, font=content_font, color=tweak_data.screen_colors.button_stage_2 } )
	local _, _, w, h = job_overview_text:text_rect()
	job_overview_text:set_size( w, h )
	job_overview_text:set_leftbottom( self._job_schedule_panel:left(), self._job_schedule_panel:top() )
	
	if pg_text:left() <= job_overview_text:right() + 15 then
		pg_text:move( 0, -pg_text:h() )
		self._paygrade_panel:move( 0, -pg_text:h() )
	end
	
	
	local job_text = self._foreground_layer_one:text( { name="job_text", text=utf8.to_upper(managers.localization:text(self._current_job_data.name_id)), align="left", halign="left", vertical="bottom", font_size=36, font=title_font, color=tweak_data.screen_colors.text } )
	local _, _, w, h = job_text:text_rect()
	job_text:set_size( w, h )
	
	local big_text = self._background_layer_three:text( { name="job_text", text=utf8.to_upper(managers.localization:text(self._current_job_data.name_id)), align = "right", vertical = "top", font_size=bg_font_size, font=bg_font, color=tweak_data.screen_color_blue, alpha=0.4 } )
	local _, _, w, h = big_text:text_rect()
	big_text:set_size( w, h )
	big_text:set_world_center_y( self._foreground_layer_one:child("job_text"):world_center_y() )
	big_text:set_world_x( self._foreground_layer_one:child("job_text"):world_x() )
	big_text:move( -13, 9 )
	
	self._backdrop:animate_bg_text( big_text )
	
	--[[
	local briefing_dialog = managers.job:current_stage_data().briefing_dialog or managers.job:current_level_data().briefing_dialog
	if briefing_dialog then
		self._delayed_dialog = true
		managers.enemy:add_delayed_clbk( "HUDMissionBriefing_brf_dialog", 
			function()
				Application:debug(managers.job:current_level_data().briefing_dialog)
				
				self._delayed_dialog = nil
				managers.dialog:queue_dialog( managers.job:current_level_data().briefing_dialog, { skip_idle_check=true } ) -- managers.job:current_level_data().briefing_dialog, {} ) 
			end, Application:time() + 2 )
	end]]
end

function HUDMissionBriefing:set_player_slot(nr, params)
	print("set_player_slot( nr, params )", nr, params)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(nr))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):stop()
	slot:child("status"):set_alpha(1)
	slot:child("status"):set_color(slot:child("status"):color():with_alpha(1))
	slot:child("name"):set_color(slot:child("name"):color():with_alpha(1))
	slot:child("name"):set_text(params.name)
	slot:child("criminal"):set_color(slot:child("criminal"):color():with_alpha(1))
	slot:child("criminal"):set_text(managers.localization:to_upper_text("menu_" .. tostring(params.character)))
	local name_len = utf8.len(slot:child("name"):text())
	local experience = (params.rank > 0 and managers.experience:rank_string(params.rank) .. "-" or "") .. tostring(params.level)
	slot:child("name"):set_text(slot:child("name"):text() .. " (" .. experience .. ")  ")
	if params.rank > 0 then
		slot:child("infamy"):set_visible(true)
		slot:child("name"):set_x(slot:child("infamy"):right())
	else
		slot:child("infamy"):set_visible(false)
	end
	if params.status then
		slot:child("status"):set_text(params.status)
	end
	local xn, yn, wn, hn = slot:child("name"):text_rect()
	slot:child("status"):set_x(wn + 25)
end

function HUDMissionBriefing:set_slot_joining(peer, peer_id)
	print("set_slot_joining( peer, peer_id )", peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("voice"):set_visible(false)
	slot:child("infamy"):set_visible(false)
	slot:child("status"):stop()
	slot:child("status"):set_alpha(1)
	slot:child("status"):set_color(slot:child("status"):color():with_alpha(1))
	slot:child("criminal"):set_color(slot:child("criminal"):color():with_alpha(1))
	slot:child("criminal"):set_text(managers.localization:to_upper_text("menu_" .. tostring(peer:character())))
	slot:child("name"):set_text(peer:name() .. "  ")
	slot:child("status"):set_visible(true)
	slot:child("status"):set_text(managers.localization:text("menu_waiting_is_joining"))
	local xn, yn, wn, hn = slot:child("name"):text_rect()
	slot:child("status"):set_x(wn + 25)
	local animate_joining = function(o)
		local t = 0
		while true do
			t = (t + coroutine.yield()) % 1
			o:set_alpha(0.3 + 0.7 * math.sin(t * 180))
		end
	end

	slot:child("status"):animate(animate_joining)
end

function HUDMissionBriefing:set_slot_ready(peer, peer_id)
	print("set_slot_ready( peer, peer_id )", peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):stop()
	slot:child("status"):set_blend_mode("add")
	slot:child("status"):set_visible(true)
	slot:child("status"):set_alpha(1)
	slot:child("status"):set_color(slot:child("status"):color():with_alpha(1))
	slot:child("status"):set_text(managers.localization:text("menu_waiting_is_ready"))
	managers.menu_component:flash_ready_mission_briefing_gui()
	local xn, yn, wn, hn = slot:child("name"):text_rect()
	slot:child("status"):set_x(wn + 25)
end

function HUDMissionBriefing:set_slot_not_ready(peer, peer_id)
	print("set_slot_not_ready( peer, peer_id )", peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):stop()
	slot:child("status"):set_visible(true)
	slot:child("status"):set_alpha(1)
	slot:child("status"):set_color(slot:child("status"):color():with_alpha(1))
	slot:child("status"):set_text(managers.localization:text("menu_waiting_is_not_ready"))
	local xn, yn, wn, hn = slot:child("name"):text_rect()
	slot:child("status"):set_x(wn + 25)
end

function HUDMissionBriefing:set_dropin_progress(peer_id, progress_percentage, mode)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):stop()
	slot:child("status"):set_visible(true)
	slot:child("status"):set_alpha(1)
	local status_text = mode == "join" and "menu_waiting_is_joining" or "debug_loading_level"
	slot:child("status"):set_text(utf8.to_upper(managers.localization:text(status_text) .. " " .. tostring(progress_percentage) .. "%"))
	local xn, yn, wn, hn = slot:child("name"):text_rect()
	slot:child("status"):set_x(wn + 25)
end

function HUDMissionBriefing:remove_player_slot_by_peer_id(peer, reason)
	print("remove_player_slot_by_peer_id( peer, reason )", peer, reason)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer:id()))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):stop()
	slot:child("status"):set_alpha(1)
	slot:child("criminal"):set_text("")
	slot:child("name"):set_text(utf8.to_upper(managers.localization:text("menu_lobby_player_slot_available")))
	slot:child("status"):set_text("")
	slot:child("status"):set_visible(false)
	slot:child("voice"):set_visible(false)
	slot:child("name"):set_x(slot:child("infamy"):x())
	slot:child("infamy"):set_visible(false)
	slot:child("detection"):set_visible(false)
	slot:child("detection_value"):set_visible(slot:child("detection"):visible())
end
end

 
if Restoration.options.restoration_loadouts == false then

local init_actual = HUDMissionBriefing.init
function HUDMissionBriefing:init(hud, workspace, ...)
 
    self._current_contact = managers.job:current_contact_id()
 
    init_actual(self, hud, workspace, ...)
 
    if self._current_contact ~= "shatter" then
        return
    end
 
    local bg2 = self._background_layer_two
    -- Unlikely to ever happen, but just in case
    if not alive(bg2) then
        return
    end
 
    -- Wipe everything on self._background_layer_two. Removing them while iterating is probably not a wise idea (may cause
    -- instability), so copy the references over to a new, temporary table first
    local tmp = {}
    for _, panel in pairs(bg2:children() or {}) do
        table.insert(tmp, panel)
    end
    for index, panel in ipairs(tmp) do
        bg2:remove(panel)
    end
    tmp = nil
 
    function making_video()
        self._contact_image = bg2:bitmap( { name="contact_image", texture="guis/textures/pd2/mission_briefing/shatter/bd_pattern", w=720, h=720 } )
        self._contact_image = bg2:video( { name="contact_image", video = "movies/menu", width = 1280, height = 720, blend_mode="add", loop=true, alpha=1, color = tweak_data.screen_color_red } ) -- , color = tweak_data.screen_color_yellow } )
    end
    bg2:stop()
    bg2:animate(making_video)
 
    self._backdrop:set_pattern( "guis/textures/pd2/mission_briefing/shatter/contact", 0.10, "add" )
end
end
