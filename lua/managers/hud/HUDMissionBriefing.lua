local maps = {
    greenharvest_stage1 = true,
    escape_overpass_ghrv = true,
    escape_garage_ghrv = true,
	highrise = true,
	nomercy = true
}

if restoration.Options:GetValue("HUD/UI/Loadouts") then
function HUDMissionBriefing:init(hud, workspace)
	self._backdrop = MenuBackdropGUI:new(workspace)
	self._backdrop:create_black_borders()
	self._hud = hud
	self._workspace = workspace
	self._singleplayer = Global.game_settings.single_player
	local bg_font = tweak_data.menu.eroded_font
	local num_player_slots = _G.BigLobbyGlobals and BigLobbyGlobals:num_player_slots() or 4
	local title_font = tweak_data.menu.medium_font
	local content_font = tweak_data.menu.default_font
	local text_font = tweak_data.menu.default_font
	local bg_font_size = tweak_data.menu.pd2_massive_font_size
	local title_font_size = 36
	local content_font_size = 32
	local text_font_size = tweak_data.menu.default_font_size
	local interupt_stage = managers.job:interupt_stage()
	self._background_layer_one = self._backdrop:get_new_background_layer()
	self._background_layer_two = self._backdrop:get_new_background_layer()
	self._background_layer_three = self._backdrop:get_new_background_layer()
	self._foreground_layer_one = self._backdrop:get_new_foreground_layer()
	self._backdrop:set_panel_to_saferect(self._background_layer_one)
	self._backdrop:set_panel_to_saferect(self._foreground_layer_one)
	self._ready_slot_panel = self._foreground_layer_one:panel({
		name = "player_slot_panel",
		w = self._foreground_layer_one:w() / 2,
		h = text_font_size * num_player_slots + 20
	})
	self._ready_slot_panel:set_bottom(self._foreground_layer_one:h())
	--self._ready_slot_panel:set_right(self._foreground_layer_one:w())
	if not self._singleplayer then
		local voice_icon, voice_texture_rect = tweak_data.hud_icons:get_icon_data("mugshot_talk")
		local infamy_icon, infamy_rect = tweak_data.hud_icons:get_icon_data("infamy_icon")
		for i = 1, num_player_slots do
			local color_id = i
			local color = tweak_data.chat_colors[color_id]
			local slot_panel = self._ready_slot_panel:panel({
				name = "slot_" .. tostring(i),
				h = text_font_size,
				y = (i - 1) * text_font_size + 10,
				--x = 10,
				w = self._ready_slot_panel:w() - 20
			})
			local criminal = slot_panel:text( { name="criminal", font_size=text_font_size, font=text_font, color=color, text="", align="left", vertical="center" } )
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
				font = text_font,
				font_size = text_font_size,
				color = color,
				align = "left",
				vertical = "center",
				w = 256,
				h = text_font_size,
				layer = 1
			})
			local status = slot_panel:text({
				name = "status",
				visible = false,
				text = "  ",
				font = text_font,
				font_size = text_font_size,
				align = "left",
				vertical = "center",
				w = 256,
				h = text_font_size,
				layer = 1,
				--blend_mode = "add",
				color = color
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
				--blend_mode = "add",
				w = detection:w(),
				h = detection:h()
			})
			local detection_ring_right_bg = detection:bitmap({
				name = "detection_right_bg",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				alpha = 0.2,
				--blend_mode = "add",
				w = detection:w(),
				h = detection:h()
			})
			detection_ring_right_bg:set_texture_rect(detection_ring_right_bg:texture_width(), 0, -detection_ring_right_bg:texture_width(), detection_ring_right_bg:texture_height())
			local detection_ring_left = detection:bitmap({
				name = "detection_left",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				render_template = "VertexColorTexturedRadial",
				--blend_mode = "add",
				layer = 1,
				w = detection:w(),
				h = detection:h()
			})
			local detection_ring_right = detection:bitmap({
				name = "detection_right",
				texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
				render_template = "VertexColorTexturedRadial",
				--blend_mode = "add",
				layer = 1,
				w = detection:w(),
				h = detection:h()
			})
			detection_ring_right:set_texture_rect(detection_ring_right:texture_width(), 0, -detection_ring_right:texture_width(), detection_ring_right:texture_height())
			local detection_value = slot_panel:text({
				name = "detection_value",
				font_size = text_font_size,
				font = text_font,
				color = color,
				text = " ",
				--blend_mode = "add",
				align = "left",
				vertical = "center"
			})
			--detection:set_left(status:w() + 4)
			--detection_value:set_left(detection:right() + 2)
			--detection_value:set_visible(detection:visible())
			--name:set_left(voice:right() + 2)
			--status:set_right(name:w() + 2)
			--infamy:set_left(name:x())
			local _, _, w, _ = criminal:text_rect()
			voice:set_left( w + 2 )
			criminal:set_w( w )
			criminal:set_align( "right" )
			criminal:set_text( "" )			
			name:set_left( voice:right() + 2 )
			local x, y, w, h = name:text_rect()
			status:set_left( name:x() + w)
			local x, y, w, h = status:text_rect()
			detection:set_left(status:x() + w)
			detection_value:set_left(detection:right() + 2)
			detection_value:set_visible(detection:visible())
		end
	end
	if not managers.job:has_active_job() then
		return
	end
	self._current_contact_data = managers.job:current_contact_data()
	self._current_level_data = managers.job:current_level_data()
	self._current_stage_data = managers.job:current_stage_data()
	self._current_job_data = managers.job:current_job_data()
	self._current_job_chain = managers.job:current_job_chain_data()
	self._job_class = self._current_job_data and self._current_job_data.jc or 0
	local show_contact_gui = true
	if managers.crime_spree:is_active() then
		self._backdrop:set_pattern("guis/textures/pd2/mission_briefing/bain/bd_pattern", 0.1, "add")
		show_contact_gui = false
	end
	self._current_contact = managers.job:current_contact_id()
	if show_contact_gui then
		local image, pattern = self:set_contact_info(self._current_contact, interupt_stage)
		local contact_image = self._background_layer_two:bitmap( { name="contact_image", texture=image, w=720, h=720 } )
		if pattern then
			self._backdrop:set_pattern(pattern, 0.1, "add")
		end
	end
	local padding_y = 70
	self._paygrade_panel = self._background_layer_one:panel({
		h = 70,
		w = 210
	})
	local pg_text = self._foreground_layer_one:text({
		name = "pg_text",
		text = managers.localization:text("menu_paygrade"),
		y = 0,
		h = 32,
		align = "right",
		vertical = "center",
		font_size = content_font_size,
		font = content_font,
		color = tweak_data.screen_colors.text
	})
	local df_text = self._foreground_layer_one:text({
		name = "df_text",
		text = managers.localization:text("menu_diffgrade"),
		y = 35,
		h = 32,
		align = "right",
		vertical = "center",
		font_size = content_font_size,
		font = content_font,
		color = tweak_data.screen_colors.text
	})
	
	self._paygrade_panel:bitmap( { name="paygrade_icon", texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect={ 32, 0, 32, 32 }, x=0, y=0, w=32, h=32 } )
	self._paygrade_panel:bitmap( { name="diff_icon", texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect={ 0, 0, 32, 32 }, x=0, y=35, w=32, h=32, color=tweak_data.screen_color_red } )
	
	local _, _, w, h = pg_text:text_rect()
	pg_text:set_size(w, h)
	local job_stars = managers.job:current_job_stars()
	local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
	local difficulty_stars = managers.job:current_difficulty_stars()
	local filled_star_rect = {
		0,
		32,
		32,
		32
	}
	local empty_star_rect = {
		32,
		32,
		32,
		32
	}
	local num_stars = 0
	local x = 35
	local y = 0
	local star_size = 35
	local panel_w = 0
	local panel_h = 0
	local risk_color = tweak_data.screen_colors.risk
	local risks = {
		"risk_swat",
		"risk_fbi",
		"risk_death_squad"
	}
	if not Global.SKIP_OVERKILL_290 then
		table.insert(risks, "risk_murder_squad")
	end
	for i = 1, 6 do
		local alpha = (i<=job_stars) and 1 or 0.25
		local rect = (i<=job_stars) and filled_star_rect or empty_star_rect
		self._paygrade_panel:bitmap( { texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect=rect, x=x, y=y, w=32, h=32, color=Color.white, alpha=alpha } )
		x = x + star_size
		num_stars = num_stars + 1
	end
	x = 35
	for i = 1, 6 do
		local alpha = (i>difficulty_stars) and 0.25 or 1
		local rect = (i>difficulty_stars) and empty_star_rect or filled_star_rect
		self._paygrade_panel:bitmap( { texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect=rect, color=tweak_data.screen_color_red, x=x, y=35, w=32, h=32, alpha=alpha } )
		
		x = x + star_size
		num_stars = num_stars + 1
	end
	self._paygrade_panel:set_w( 7  * star_size )
	self._paygrade_panel:set_right(self._background_layer_one:w())
	pg_text:set_right( self._paygrade_panel:left() )
	df_text:set_right( self._paygrade_panel:left() )
	
	
	self._job_schedule_panel = self._background_layer_one:panel({
		h = 90,
		w = self._background_layer_one:w() / 2
	})
	self._job_schedule_panel:set_right(self._foreground_layer_one:w())
	self._job_schedule_panel:set_top(self._paygrade_panel:bottom() + 90 )
	if interupt_stage then
		self._job_schedule_panel:set_alpha(0.2)
		if not tweak_data.levels[interupt_stage].bonus_escape then
			self._interupt_panel = self._background_layer_one:panel({
				h = 125,
				w = self._background_layer_one:w() / 2
			})
			local interupt_text = self._interupt_panel:text({
				name = "job_text",
				text = utf8.to_upper(managers.localization:text("menu_escape")),
				h = 80,
				align = "left",
				vertical = "top",
				font_size = 70,
				font = bg_font,
				color = tweak_data.screen_colors.important_1,
				layer = 5
			})
			local _, _, w, h = interupt_text:text_rect()
			interupt_text:set_size(w, h)
			interupt_text:rotate(-15)
			interupt_text:set_center(self._interupt_panel:w() / 2, self._interupt_panel:h() / 2)
			self._interupt_panel:set_shape(self._job_schedule_panel:shape())
		end
	end
	local num_stages = self._current_job_chain and #self._current_job_chain or 0
	local day_color = tweak_data.screen_colors.item_stage_1
	local chain = self._current_job_chain and self._current_job_chain or {}
	local js_w = self._job_schedule_panel:w() / 7
	local js_h = self._job_schedule_panel:h()
	for i = 1, 14 do
		local day_font = text_font
		local day_font_size = text_font_size
		day_color = tweak_data.screen_colors.item_stage_1
		
		day_color = tweak_data.screen_color_white:with_alpha( ( (i > num_stages) and 0.1 ) or ( (i < managers.job:current_stage()) and 0.5 ) or 1 )
		
		local day_text = self._job_schedule_panel:text({
			name = "day_" .. tostring(i),
			text = ("D" .. tostring(i) ),
			align = "center",
			vertical = "center",
			font_size = day_font_size,
			font = day_font,
			w = js_w,
			h = js_h,
			color = day_color
		})
		
		local poly = self._job_schedule_panel:polyline( { name="day_poly_"..tostring(i), color=day_color, blend_mode="add", x=1+((i-1)%7)*78, y=10+math.floor((i-1)/7)*55, w=73, h=50 } )
		poly:set_points( { Vector3( 0, 0 ), Vector3( 73, 0 ), Vector3( 73, 50 ), Vector3( 0, 50 ) } )
		poly:set_closed( true )
		
		poly = self._job_schedule_panel:polyline( { name="day_poly2_"..tostring(i), color=day_color:with_alpha(day_color.alpha*0.5), blend_mode="add", x=1+((i-1)%7)*78, y=10+math.floor((i-1)/7)*55, w=73, h=50 } )
		poly:set_points( { Vector3( 1, 1 ), Vector3( 72, 1 ), Vector3( 72, 49 ), Vector3( 1, 49 ) } )
		poly:set_closed( true )
		
		day_text:set_center( self._job_schedule_panel:child( "day_poly_"..tostring(i) ):center() )
		day_text:move( -25, -14 )
		
		local ghost = self._job_schedule_panel:bitmap({
			name = "ghost_" .. tostring(i),
			texture = "guis/textures/pd2/cn_minighost",
			w = 16,
			h = 16,
			blend_mode = "add",
			color = tweak_data.screen_colors.ghost_color
		})
		ghost:set_center(day_text:center_x(), day_text:center_y() + day_text:h() * 0.25)
		local ghost_visible = i <= num_stages and managers.job:is_job_stage_ghostable(managers.job:current_real_job_id(), i)
		ghost:set_visible(ghost_visible)
		if ghost_visible then
			self:_apply_ghost_color(ghost, i, not Network:is_server())
		end
	end
	for i = 1, managers.job:current_stage() or 0 do
		local stage_marker = self._job_schedule_panel:bitmap( { name="stage_done_" .. tostring(i), texture="guis/textures/pd2/mission_briefing/calendar_stamp", texture_rect={i==managers.job:current_stage() and 64 or 0, 0, 64, 64}, w=80, h=70, layer=1, rotation=math.rand(-10, 10) } )
		stage_marker:set_center( self._job_schedule_panel:child("day_poly_"..tostring(i)):center() )
		stage_marker:move(math.random(4) - 2, math.random(4) - 2)
	end
	if managers.job:has_active_job() then
		local payday_stamp = self._job_schedule_panel:bitmap({
			name = "payday_stamp",
			texture = "guis/textures/restoration/mission_briefing/calendar_payday",
			texture_rect = {
				0,
				0,
				64,
				64
			},
			w = 96,
			h = 70,
			layer = 2,
			rotation = math.rand(-5, 5)
		})
		payday_stamp:set_center( self._job_schedule_panel:child("day_poly_"..tostring(num_stages)):center() )
		payday_stamp:move(math.random(4) - 2, math.random(4) - 2)
		if payday_stamp:rotation() == 0 then
			payday_stamp:set_rotation(1)
		end
	end
	local job_overview_text = self._foreground_layer_one:text({
		name = "job_overview_text",
		text = managers.localization:text("menu_job_overview"),
		h = content_font_size,
		align = "left",
		vertical = "bpttom",
		font_size = content_font_size,
		font = content_font,
		color = tweak_data.screen_color_blue
	})
	local _, _, w, h = job_overview_text:text_rect()
	job_overview_text:set_size(w, h)
	job_overview_text:set_leftbottom(self._job_schedule_panel:left(), self._job_schedule_panel:top())

	local text = utf8.to_upper(managers.localization:text(self._current_job_data.name_id))
	local text_align, text_len
	if managers.crime_spree:is_active() then
		local level_id = Global.game_settings.level_id
		local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
		local mission = managers.crime_spree:get_mission()
		text = managers.localization:to_upper_text(name_id) .. ": "
		text_len = utf8.len(text)
		local mission_text = mission and mission.add or 0
		text = text .. "+" .. mission_text
		text_align = "right"
	end

	local job_text = self._foreground_layer_one:text({
		name = "job_text",
		text = text,
		align = text_align or "left",
		vertical = "top",
		font_size = title_font_size,
		font = title_font,
		color = tweak_data.screen_colors.text
	})
	if managers.crime_spree:is_active() then
		job_text:set_range_color(text_len, utf8.len(text), tweak_data.screen_colors.crime_spree_risk)
	end
	if not text_align then
		local big_text = self._background_layer_three:text({
			name = "job_text",
			text = text,
			align = "left",
			vertical = "top",
			font_size = bg_font_size,
			font = bg_font,
			color = tweak_data.screen_color_blue,
			alpha = 0.4
		})
		big_text:set_world_center_y(self._foreground_layer_one:child("job_text"):world_center_y())
		big_text:set_world_x(self._foreground_layer_one:child("job_text"):world_x())
		big_text:move(-13, 9)
		self._backdrop:animate_bg_text(big_text)
	end
	--[[local text = utf8.to_upper(managers.localization:text(self._current_job_data.name_id))
	local text_align, text_len
	if managers.crime_spree:is_active() then
		local level_id = Global.game_settings.level_id
		local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
		local mission = managers.crime_spree:get_mission()
		text = managers.localization:to_upper_text(name_id) .. ": "
		text_len = utf8.len(text)
		local mission_text = mission and mission.add or 0
		text = text .. "+" .. mission_text
		text_align = "right"
	end

	local job_text = self._foreground_layer_one:text({
		name = "job_text",
		text = text,
		align = text_align or "left",
		vertical = "top",
		font_size = title_font_size,
		font = title_font,
		color = tweak_data.screen_colors.text
	})
	local _, _, w, h = job_text:text_rect()
	job_text:set_size(w, h)
	if managers.crime_spree:is_active() then
		job_text:set_range_color(text_len, utf8.len(text), tweak_data.screen_colors.crime_spree_risk)
	end
	if not text_align then
		local big_text = self._background_layer_three:text({
			name = "job_text",
			text = text,
			align = text_align or "left",
			vertical = "top",
			font_size = bg_font_size,
			font = bg_font,
			color = tweak_data.screen_color_blue,
			alpha = 0.4
		})
		big_text:set_world_center_y(self._foreground_layer_one:child("job_text"):world_center_y())
		big_text:set_world_x(self._foreground_layer_one:child("job_text"):world_x())
		big_text:move(-13, 9)
		self._backdrop:animate_bg_text(big_text)
	end
	local big_text = self._background_layer_three:text({
		name = "job_text",
		text = text,
		align = "left",
		vertical = "top",
		font_size = bg_font_size,
		font = bg_font,
		color = tweak_data.screen_color_blue,
		alpha = 0.4
	})
	local _, _, w, h = big_text:text_rect()
	big_text:set_size(w, h)
	big_text:set_world_center_y(self._foreground_layer_one:child("job_text"):world_center_y())
	big_text:set_world_x(self._foreground_layer_one:child("job_text"):world_x())
	big_text:move(-13, 9)
	self._backdrop:animate_bg_text(big_text)]]
	
	if managers.job:current_job_data().name_id == "heist_rvd" then
		local day_1_text = self._job_schedule_panel:child("day_poly_1")
		local day_1_sticker = self._job_schedule_panel:bitmap({
			texture = "guis/dlcs/rvd/textures/pd2/mission_briefing/day2",
			h = 48,
			w = 96,
			rotation = 360,
			layer = 3
		})

		day_1_sticker:set_center(day_1_text:center())
		day_1_sticker:move(math.random(4) - 2, math.random(4) - 2)

		local day_2_text = self._job_schedule_panel:child("day_poly_2")
		local day_2_sticker = self._job_schedule_panel:bitmap({
			texture = "guis/dlcs/rvd/textures/pd2/mission_briefing/day1",
			h = 48,
			w = 96,
			rotation = 360,
			layer = 3
		})

		day_2_sticker:set_center(day_2_text:center())
		day_2_sticker:move(math.random(4) - 2, math.random(4) - 2)
	end
	
	if managers.crime_spree:is_active() then
		self._paygrade_panel:set_visible(false)
		self._job_schedule_panel:set_visible(false)
		pg_text:set_visible(false)
		job_overview_text:set_visible(false)
		df_text:set_visible(false)
	end
	
	if managers.skirmish:is_skirmish() then
		self._paygrade_panel:set_visible(false)
		pg_text:set_visible(false)
 		local min, max = managers.skirmish:wave_range()
		local wave_range_text = self._foreground_layer_one:text({
			name = "wave_range",
			vertical = "center",
			h = 32,
			align = "right",
			text = managers.localization:to_upper_text("menu_skirmish_wave_range", {
				min = min,
				max = max
			}),
			y = padding_y,
			font_size = content_font_size,
			font = content_font,
			color = tweak_data.screen_colors.skirmish_color
		})
 		managers.hud:make_fine_text(wave_range_text)
		wave_range_text:set_right(self._background_layer_one:w())
		df_text:set_visible(false)
	end
	
	if managers.skirmish:is_skirmish() then
		text = managers.skirmish:is_weekly_skirmish() and managers.localization:to_upper_text("menu_weekly_skirmish") or managers.localization:to_upper_text("menu_skirmish")
	end
	
	if managers.skirmish:is_skirmish() then
		self._job_schedule_panel:set_visible(false)
 		self._skirmish_progress = SkirmishBriefingProgress:new(self._background_layer_one, {
			x = self._job_schedule_panel:x(),
			y = self._job_schedule_panel:y(),
			w = self._job_schedule_panel:width(),
			h = self._job_schedule_panel:height()
		})
	end
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
	--slot:child("status"):set_font_size(tweak_data.menu.pd2_small_font_size)
	slot:child("name"):set_color(slot:child("name"):color():with_alpha(1))
	slot:child("name"):set_text(params.name)
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
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
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
	slot:child("name"):set_text(peer:name() .. "  ")
	slot:child("status"):set_visible(true)
	slot:child("status"):set_text(managers.localization:text("menu_waiting_is_joining"))
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
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
	slot:child("status"):set_visible(true)
	slot:child("status"):set_alpha(1)
	slot:child("status"):set_color(slot:child("status"):color():with_alpha(1))
	slot:child("status"):set_text(managers.localization:text("menu_waiting_is_ready"))
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
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
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
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
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
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
	local x, y, w, h = slot:child("name"):text_rect()
	slot:child("status"):set_left( slot:child("name"):x() + w)
	local x, y, w, h = slot:child("status"):text_rect()
	slot:child("detection"):set_left(slot:child("status"):x() + w + 2)
	slot:child("detection_value"):set_left(slot:child("detection"):right() + 2)
	slot:child("name"):set_x(slot:child("infamy"):x())
	slot:child("infamy"):set_visible(false)
	slot:child("detection"):set_visible(false)
	slot:child("detection_value"):set_visible(slot:child("detection"):visible())
end

function HUDMissionBriefing:set_contact_info(contact, interupt)
    local set_image = {
        bain = "guis/textures/restoration/mission_briefing/bain",
        hoxton = "guis/textures/restoration/mission_briefing/hoxton",
        classic = "guis/textures/restoration/mission_briefing/classic",
        hector = "guis/textures/restoration/mission_briefing/hector",
        interupt = "guis/textures/pd2/mission_briefing/interupt/contact",
        jimmy = "guis/textures/restoration/mission_briefing/jimmy",
        locke = "guis/textures/restoration/mission_briefing/locke",
        the_butcher = "guis/textures/restoration/mission_briefing/butcher",
        the_dentist = "guis/textures/restoration/mission_briefing/dentist",
        the_elephant = "guis/textures/pd2/mission_briefing/the_elephant/the_elephant",
        vlad = "guis/textures/pd2/mission_briefing/vlad/contact",
		the_continental = "guis/textures/restoration/mission_briefing/the_continental",
		events = "guis/textures/restoration/mission_briefing/event",
		shatter = "guis/textures/restoration/mission_briefing/shatter",
		sin = "guis/textures/pd2/mission_briefing/hector/contact"
    }
	local image = "guis/textures/restoration/mission_briefing/classic"
	if set_image[contact] then
            image = set_image[contact]
    end
    local set_pattern = {
        classic = "guis/textures/pd2/mission_briefing/bain/bd_pattern",
        events = "guis/textures/pd2/mission_briefing/bain/bd_pattern",
        hoxton = "guis/textures/pd2/mission_briefing/bain/bd_pattern",
        jimmy = "guis/dlcs/berry/textures/pd2/mission_briefing/bd_pattern",
        locke = "guis/dlcs/berry/textures/pd2/mission_briefing/bd_pattern",
        the_butcher = "guis/dlcs/the_bomb/textures/pd2/mission_briefing/bd_pattern",
        the_dentist = "guis/dlcs/big_bank/textures/pd2/mission_briefing/bd_pattern",
		the_continental = "guis/textures/pd2/mission_briefing/bain/bd_pattern",
		shatter = "guis/textures/restoration/mission_briefing/shatter_pattern",
		sin = "guis/textures/pd2/mission_briefing/hector/bd_pattern"
    }
	local pattern = "guis/textures/pd2/mission_briefing/".. contact .."/bd_pattern"
	if set_pattern[contact] then
            pattern = set_pattern[contact]
    end
	if interupt then
		image = "guis/textures/pd2/mission_briefing/interupt/contact"
		pattern = "guis/textures/pd2/mission_briefing/interupt/bd_pattern"
	end
	return image, pattern
	end
end
 
--[[if not Global.level_data.level_id or not maps[Global.level_data.level_id] then
    return
end]]--
 
local init_actual = HUDMissionBriefing.init
if not restoration.Options:GetValue("HUD/UI/Loadouts") then
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
        --self._contact_image = bg2:bitmap( { name="contact_image", texture="guis/textures/restoration/mission_briefing/shatter", w=720, h=720 } )
        self._contact_image = bg2:video( { name="contact_image", video = "movies/contact_shatter1", width = 1280, height = 720, blend_mode="add", loop=true, alpha=1 } ) -- , color = tweak_data.screen_color_yellow } )
    end
    bg2:stop()
    bg2:animate(making_video)
 
    self._backdrop:set_pattern( "guis/textures/restoration/mission_briefing/shatter_pattern", 0.10, "add" )
end
end