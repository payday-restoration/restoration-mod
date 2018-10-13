if Restoration.options.restoration_hud_global == true then
function HUDStatsScreen:init()
	self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
	self._full_hud_panel:clear()
	local x_margine = 10
	local y_margine = 10
	local left_panel = self._full_hud_panel:panel({
		name = "left_panel",
		valign = "scale",
		w = self._full_hud_panel:w() / 3
	})
	left_panel:set_x(-left_panel:w())
	local blur_bg = left_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = left_panel:w(),
		h = left_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		x = x_margine,
		y = y_margine,
		w = left_panel:w() - x_margine,
		h = left_panel:h() - y_margine * 2
	})
	local leftbox = HUDBGBox_create(left_panel, {
		valign = "scale",
		x = x_margine,
		y = y_margine,
		w = left_panel:w() - x_margine,
		h = left_panel:h() - y_margine * 2
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	leftbox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	leftbox:child("bg"):set_alpha(1)
	local objectives_title = left_panel:text({
		layer = 1,
		name = "objectives_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_objective")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	local x, y = managers.gui_data:corner_safe_to_full(0, 0)
	objectives_title:set_position(math.round(x), math.round(y))
	objectives_title:set_valign({
		math.round(y) / managers.gui_data:full_scaled_size().h,
		0
	})
	managers.hud:make_fine_text(objectives_title)
	local pad = 8
	local objectives_panel = left_panel:panel({
		layer = 1,
		name = "objectives_panel",
		x = math.round(objectives_title:x() + pad),
		y = math.round(objectives_title:bottom()),
		w = left_panel:w() - (objectives_title:x() + pad)
	})
	objectives_panel:set_valign({
		math.round(y) / managers.gui_data:full_scaled_size().h,
		0
	})
	
	local challenges_wrapper_panel = left_panel:panel({
		visible = true,
		layer = 1,
		valign = {0.5, 0.5},
		name = "challenges_wrapper_panel",
		x = 0,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height / 2),
		w = left_panel:w()
	})
	local _, by = managers.gui_data:corner_safe_to_full(0, managers.gui_data:corner_scaled_size().height)
	challenges_wrapper_panel:set_bottom(by)
	challenges_wrapper_panel:set_valign({
		by / managers.gui_data:full_scaled_size().h,
		0
	})
	local last_completed_challenge_title = challenges_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "last_completed_challenge_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text_id = "victory_last_completed_challenge",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	last_completed_challenge_title:set_position(math.round(x), 0)
	managers.hud:make_fine_text(last_completed_challenge_title)
	local challenges_panel = challenges_wrapper_panel:panel({
		layer = 1,
		valign = "center",
		name = "challenges_panel",
		x = math.round(objectives_title:x() + pad),
		y = last_completed_challenge_title:bottom(),
		w = left_panel:w() - (last_completed_challenge_title:x() + pad)
	})
	local near_completion_title = challenges_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "near_completion_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text_id = "menu_near_completion_challenges",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	near_completion_title:set_position(math.round(x), math.round(challenges_wrapper_panel:h() / 3))
	managers.hud:make_fine_text(near_completion_title)
	local near_completion_panel = challenges_wrapper_panel:panel({
		layer = 1,
		valign = "center",
		name = "near_completion_panel",
		x = math.round(objectives_title:x() + pad),
		y = near_completion_title:bottom(),
		w = left_panel:w() - (near_completion_title:x() + pad)
	})
	local bottom_panel = self._full_hud_panel:panel({
		visible = false,
		name = "bottom_panel",
		h = y + 90,
		w = self._full_hud_panel:w() / 3 - x_margine * 2
	})
	bottom_panel:set_y(self._full_hud_panel:h())
	bottom_panel:set_x(self._full_hud_panel:w() / 3 + x_margine)
	local blur_bg = bottom_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = bottom_panel:w(),
		h = bottom_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		h = bottom_panel:h() - y_margine
	})
	local bottombox = HUDBGBox_create(bottom_panel, {
		valign = "scale",
		h = bottom_panel:h() - y_margine
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	bottombox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.6))
	bottombox:child("bg"):set_alpha(1)
	local right_panel = self._full_hud_panel:panel({
		name = "right_panel",
		valign = "scale",
		w = self._full_hud_panel:w() / 3
	})
	right_panel:set_x(self._full_hud_panel:w())
	local blur_bg = right_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = right_panel:w(),
		h = right_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		y = y_margine,
		h = right_panel:h() - y_margine * 2,
		w = right_panel:w() - x_margine
	})
	local rightbox = HUDBGBox_create(right_panel, {
		valign = "scale",
		y = y_margine,
		h = right_panel:h() - y_margine * 2,
		w = right_panel:w() - x_margine
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	rightbox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	rightbox:child("bg"):set_alpha(1)
	local days_title = right_panel:text({
		layer = 1,
		x = 20,
		y = y,
		name = "days_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "DAY 1 OF 3",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	managers.hud:make_fine_text(days_title)
	days_title:set_w(right_panel:w())
	local day_wrapper_panel = right_panel:panel({
		visible = true,
		layer = 1,
		name = "day_wrapper_panel",
		x = 0,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height),
		w = right_panel:w()
	})
	day_wrapper_panel:set_position(days_title:x() + pad, days_title:bottom())
	day_wrapper_panel:set_w(right_panel:w() - x - day_wrapper_panel:x())
	local day_title = day_wrapper_panel:text({
		layer = 0,
		x = 0,
		y = 0,
		name = "day_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "BLUH!",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	managers.hud:make_fine_text(day_title)
	day_title:set_w(day_wrapper_panel:w())
	local paygrade_title = day_wrapper_panel:text({
		name = "paygrade_title",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.hud_stats.loot_size,
		text = managers.localization:to_upper_text("menu_lobby_difficulty_title"),
		color = tweak_data.screen_colors.text
	})
	managers.hud:make_fine_text(paygrade_title)
	paygrade_title:set_top(math.round(day_title:bottom()))
	local job_data = managers.job:current_job_data()
		if job_data then
			local job_stars = managers.job:current_job_stars()
			local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
			
			local risk_color = Color(255, 255, 204, 0)/255
			local filled_star_rect = { 0, 32, 32, 32 }
			local empty_star_rect = { 32, 32, 32, 32 }
						
			local cy = paygrade_title:center_y()
			local sx = paygrade_title:right() + 8
			-- local sx = 0
			for i = 1, 10 do -- job_and_difficulty_stars do
				local x = sx + (i-1)*18
				local alpha = (i>job_and_difficulty_stars) and 0.25 or 1
				local color = ((i>job_and_difficulty_stars) or (i<=job_stars)) and Color.white or risk_color 
				local star = day_wrapper_panel:bitmap( { texture="guis/textures/pd2/mission_briefing/difficulty_icons", texture_rect=filled_star_rect, x=x, y=0, w=18, h=18, alpha=alpha, color = color } )
				star:set_center_y( math.round( cy ) )
			end
		end
	local day_payout = day_wrapper_panel:text({
		layer = 0,
		x = 0,
		y = 0,
		name = "day_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "BLUH!",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	day_payout:set_text(utf8.to_upper(managers.localization:text("hud_day_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	managers.hud:make_fine_text(day_payout)
	day_payout:set_w(day_wrapper_panel:w())
	day_payout:set_y(math.round(paygrade_title:bottom()))
	local bains_plan = day_wrapper_panel:text({
		name = "bains_plan",
		text = managers.localization:to_upper_text("menu_description"),
		font = tweak_data.hud_stats.objective_desc_font,
		font_size = tweak_data.hud_stats.day_description_size + 2,
		color = Color(1, 1, 1, 1),
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		h = 128
	})
	managers.hud:make_fine_text(bains_plan)
	bains_plan:set_y(math.round(day_payout:bottom() + 20))
	local day_description = day_wrapper_panel:text({
		name = "day_description",
		text = "sdsd",
		font = tweak_data.hud_stats.objective_desc_font,
		font_size = tweak_data.hud_stats.day_description_size,
		color = Color(1, 1, 1, 1),
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		h = 128
	})
	day_description:set_y(math.round(bains_plan:bottom()))
	day_description:set_h(day_wrapper_panel:h())
	do
		local is_level_ghostable = managers.job:is_level_ghostable(managers.job:current_level_id())
		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		local ghost_icon = right_panel:bitmap({
			name = "ghost_icon",
			texture = "guis/textures/pd2/cn_minighost",
			w = 16,
			h = 16,
			blend_mode = "add"
		})
		local ghostable_text = day_wrapper_panel:text({
			name = "ghostable_text",
			text = managers.localization:text("menu_ghostable_stage"),
			align = "left",
			vertical = "top",
			blend_mode = "add",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text
		})
		local x, y, w, h = ghostable_text:text_rect()
		ghostable_text:set_size(w, h)
		ghost_icon:set_left(days_title:right())
		ghost_icon:set_center_y(days_title:center_y())
		ghostable_text:set_y(day_description:top() + 10)
		ghostable_text:set_left(day_description:left())
		ghost_icon:set_visible(is_level_ghostable)
		ghost_icon:set_color(is_whisper_mode and Color.white or tweak_data.screen_colors.important_1)
		ghostable_text:set_visible(is_level_ghostable and is_whisper_mode)
	end

	local loot_wrapper_panel = right_panel:panel({
		visible = true,
		layer = 1,
		name = "loot_wrapper_panel",
		x = -15,
		y = 0 + math.round(managers.gui_data:full_scaled_size().height / 2),
		h = math.round(managers.gui_data:full_scaled_size().height / 2),
		w = right_panel:w()
	})
	--loot_wrapper_panel:set_position(days_title:x(), challenges_wrapper_panel:y())
	--loot_wrapper_panel:set_valign("center")
	local secured_loot_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "secured_loot_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_secured_loot")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	secured_loot_title:set_position(math.round(x), 0)
	managers.hud:make_fine_text(secured_loot_title)
	local mission_bags_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "mission_bags_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_mission_bags")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	mission_bags_title:set_position(math.round(x + pad), secured_loot_title:bottom())
	managers.hud:make_fine_text(mission_bags_title)
	local mission_bags_panel = loot_wrapper_panel:panel({
		visible = true,
		name = "mission_bags_panel",
		x = 0,
		y = 0,
		h = 44,
		w = right_panel:w()
	})
	mission_bags_panel:set_left(mission_bags_title:right())
	mission_bags_panel:set_position(mission_bags_panel:x(), mission_bags_panel:y())
	local mission_bags_payout = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "mission_bags_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	mission_bags_payout:set_position(mission_bags_title:left(), mission_bags_panel:bottom())
	managers.hud:make_fine_text(mission_bags_payout)
	mission_bags_payout:set_w(loot_wrapper_panel:w())
	local bonus_bags_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "bonus_bags_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_bonus_bags")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	bonus_bags_title:set_position(math.round(x + pad), mission_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(bonus_bags_title)
	local bonus_bags_panel = loot_wrapper_panel:panel({
		visible = true,
		name = "bonus_bags_panel",
		x = 0,
		y = 0,
		h = 44,
		w = left_panel:w()
	})
	bonus_bags_panel:set_lefttop(bonus_bags_title:leftbottom())
	bonus_bags_panel:set_position(bonus_bags_panel:x(), bonus_bags_panel:y())
	bonus_bags_panel:grow(-bonus_bags_panel:x(), 0)
	local bonus_bags_payout = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "bonus_bags_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	bonus_bags_payout:set_position(bonus_bags_title:left(), bonus_bags_panel:bottom())
	managers.hud:make_fine_text(bonus_bags_payout)
	bonus_bags_payout:set_w(loot_wrapper_panel:w())
	local instant_cash_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "instant_cash_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_instant_cash")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	instant_cash_title:set_position(math.round(x + pad), bonus_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(instant_cash_title)
	local instant_cash_text = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "instant_cash_text",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = managers.experience:cash_string(0),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	instant_cash_text:set_position(instant_cash_title:left(), instant_cash_title:bottom())
	managers.hud:make_fine_text(instant_cash_text)
	instant_cash_text:set_w(loot_wrapper_panel:w())
	
	local ext_inventory_panel = right_panel:panel({
		layer = 1,
		valign = {0.5, 0.5},
		name = "ext_inventory_panel",
		x = 20,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height / 2),
		w = left_panel:w()
	})
	ext_inventory_panel:set_w(right_panel:w() - x - ext_inventory_panel:x())
	local _, by = managers.gui_data:corner_safe_to_full(0, managers.gui_data:corner_scaled_size().height)
	ext_inventory_panel:set_bottom(by)
	ext_inventory_panel:set_valign({
		by / managers.gui_data:full_scaled_size().h,
		0
	})
	local profile_wrapper_panel = right_panel:panel( { layer = 1, valign = {1/2,1/2}, name = "profile_wrapper_panel", x = 20, y = y + math.round( managers.gui_data:scaled_size().height/2 ), h = math.round( managers.gui_data:scaled_size().height/2 ), w = left_panel:w() } )
	profile_wrapper_panel:set_w( right_panel:w() - x - profile_wrapper_panel:x() )
	local _, by = managers.gui_data:corner_safe_to_full( 0, managers.gui_data:corner_scaled_size().height ) -- + managers.gui_data:corner_scaled_size().y/2 )
	profile_wrapper_panel:set_bottom( by )
	profile_wrapper_panel:set_valign( {by/managers.gui_data:full_scaled_size().h,0} )
	self:_rec_round_object(left_panel)
	self:_rec_round_object(right_panel)
	self:_rec_round_object(bottom_panel)
	
	-- managers.localization:text( "menu_cash", { money=managers.money:total_string() } )
	
	
	--local loot_text = right_panel:text( { layer = 1, name = "loot_text", color = Color.white, font_size = tweak_data.hud_stats.objectives_title_size, font= tweak_data.hud_stats.objectives_font, text="$250.000", align = "right", vertical = "top", w = right_panel:w()/3, h = 32 } )
	--loot_text:set_position( math.round( -x ), math.round( y ) )
	
	--local small_loot_text = right_panel:text( { layer = 1, name = "small_loot_text", color = Color.white, font_size = tweak_data.hud_stats.objectives_title_size, font= tweak_data.hud_stats.objectives_font, text="$250.000", align = "right", vertical = "top", w = right_panel:w()/3, h = 32 } )
	--small_loot_text:set_position( math.round( -x ), math.round( y + 28 ) )
	
	--local total_loot_text = right_panel:text( { layer = 1, name = "total_loot_text", color = Color.white, font_size = tweak_data.hud_stats.objectives_title_size, font= tweak_data.hud_stats.objectives_font, text="$250.000", align = "right", vertical = "top", w = right_panel:w()/3, h = 32 } )
	--total_loot_text:set_position( math.round( -x ), math.round( y + 60 ) )
end

function HUDStatsScreen:show()
	local safe = managers.hud.STATS_SCREEN_SAFERECT
	local full = managers.hud.STATS_SCREEN_FULLSCREEN
	managers.hud:show(full)
	local left_panel = self._full_hud_panel:child("left_panel")
	local right_panel = self._full_hud_panel:child("right_panel")
	--right_panel:child( "loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_loot_value() ) )
	--right_panel:child( "small_loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_small_loot_value() ) )
	--right_panel:child( "total_loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_value() ) )
	local bottom_panel = self._full_hud_panel:child("bottom_panel")
	left_panel:stop()
	self:_create_stats_screen_profile(right_panel:child("profile_wrapper_panel"))
	self:_create_stats_screen_objectives(left_panel:child("objectives_panel"))
	self:_create_stats_ext_inventory(right_panel:child("ext_inventory_panel"))
	self:_update_stats_screen_loot(right_panel:child("loot_wrapper_panel"))
	self:_update_stats_screen_day(right_panel)
	self:_create_stats_screen_challenges( left_panel:child( "challenges_wrapper_panel" ):child( "challenges_panel" ), left_panel:child( "challenges_wrapper_panel" ):child( "near_completion_panel" ) )
	local teammates_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("teammates_panel")
	local objectives_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("objectives_panel")
	local chat_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("chat_panel")
	left_panel:animate(callback(self, self, "_animate_show_stats_left_panel"), right_panel, bottom_panel, teammates_panel, objectives_panel, chat_panel)
	self._showing_stats_screen = true
	if managers.groupai:state() and not self._whisper_listener then
		self._whisper_listener = "HUDStatsScreen_whisper_mode"
		managers.groupai:state():add_listener(self._whisper_listener, {
			"whisper_mode"
		}, callback(self, self, "on_whisper_mode_changed"))
	end
end

function HUDStatsScreen:loot_value_updated()
	local right_panel = self._full_hud_panel:child( "right_panel" )
	--right_panel:child( "loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_loot_value() ) )
	--right_panel:child( "small_loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_small_loot_value() ) )
	--right_panel:child( "total_loot_text" ):set_text( managers.experience:cash_string( managers.loot:get_real_total_value() ) )
	
	local left_panel = self._full_hud_panel:child( "left_panel" )
	self:_update_stats_screen_loot( right_panel:child( "loot_wrapper_panel" ) )
end

function HUDStatsScreen:_create_stats_screen_objectives( panel )
	panel:clear()
	local x, y = 0, 0
	local panel_w = panel:w() - x
	for i,data in pairs( managers.objectives:get_active_objectives() ) do
		local obj_panel = panel:panel( { name = "obj_panel", x = x, y = y, w = panel_w } )
		-- obj_panel:set_debug( true )
		local obj_title = obj_panel:text( { name = "title", text = utf8.to_upper( data.text ), font = tweak_data.hud.medium_font, font_size = tweak_data.hud.active_objective_title_font_size, color = Color.white, align = "left", vertical = "top", wrap = true, word_wrap = true, h = tweak_data.hud.active_objective_title_font_size } )
		managers.hud:make_fine_text( obj_title )
		obj_title:set_w( obj_title:w() + 1 )
		local obj_description = obj_panel:text( { name = "description", text = data.description, font = tweak_data.hud_stats.objective_desc_font, font_size = 24, color = Color(1, 1, 1, 1), align = "left", vertical = "top", wrap = true, word_wrap = true, h = 128 } )
		managers.hud:make_fine_text( obj_description )
		obj_description:set_h( obj_description:h() + 10 )
		obj_panel:set_h( obj_title:h() + obj_description:h() )
		obj_description:set_lefttop( obj_title:leftbottom() )
		y = math.ceil( y + obj_panel:h() )
	end
	
	local completed_objectives = managers.objectives:get_completed_objectives()
	for i,id in ipairs( managers.objectives:get_completed_objectives_ordered() ) do
		if i <= 11 then
			local data = completed_objectives[ id ]
			local obj_panel = panel:panel( { name = "obj_panel", x = x, y = y, w = panel_w, h = 16 } )
			-- obj_panel:set_debug( true )
			local obj_title = obj_panel:text( { name = "title", text = utf8.to_upper( (i == 11 and "...") or data.text ), font = tweak_data.hud.medium_font, font_size = tweak_data.hud.completed_objective_title_font_size, color = Color( 0.5, 0.5, 0.5 ), align = "left", vertical = "top", wrap = true, word_wrap = true, w = obj_panel:w(), h = tweak_data.hud.completed_objective_title_font_size } )
			managers.hud:make_fine_text( obj_title )
			-- print( "obj_title:h()", obj_title:x(), obj_title:y(), obj_title:w(), obj_title:h() )
			obj_panel:set_h( obj_title:h() )
			y = math.ceil( y + obj_panel:h() )
		end
	end
end

function HUDStatsScreen:_create_stats_screen_challenges( challenges_panel, near_completion_panel )
	challenges_panel:clear()
	if managers.challenges then
	local last_comleted_title_text = challenges_panel:text( { name = "last_comleted_title_text", text = utf8.to_upper( managers.challenges:get_last_comleted_title_text() ), font_size = tweak_data.menu.loading_challenge_name_font_size, font= tweak_data.hud_stats.objectives_font } )
	managers.hud:make_fine_text( last_comleted_title_text )
	local last_comleted_description_text = challenges_panel:text( { name = "last_comleted_description_text", text = utf8.to_upper( managers.challenges:get_last_comleted_description_text() ), font_size = tweak_data.hud.small_font_size, font = tweak_data.hud.small_font, y = last_comleted_title_text:bottom(), wrap = true, word_wrap = true } )
	managers.hud:make_fine_text( last_comleted_description_text )
	-- utf8.to_upper( managers.challenges:get_last_comleted_title_text() )
	-- utf8.to_upper( managers.challenges:get_last_comleted_description_text() )
	
	near_completion_panel:clear()
	
	local challenges = managers.challenges:get_near_completion()
	challenges = { challenges[1], challenges[2], challenges[3] }
	
	local w = near_completion_panel:w() - 8
	local y = 0
	for i,challenge in ipairs( challenges ) do
		local text = near_completion_panel:text( { text = utf8.to_upper( challenge.name ), y = y, font = tweak_data.hud.medium_font, font_size = tweak_data.menu.loading_challenge_name_font_size, color = Color.white, align="left", layer = 1 } )
		managers.hud:make_fine_text( text )
		y = y + text:h()
		
		local c_panel = near_completion_panel:panel( { w = w, h = 22, y = y } )
		local bg_bar = c_panel:rect( { x = 0, y = 0, w = c_panel:w(), h = c_panel:h(), color = Color.black:with_alpha( 0.5 ), align="center", halign="center", vertical="center", layer = 1 } )
		local bar = c_panel:gradient( { orientation = "vertical", gradient_points = { 0, Color( 1,255/255,168/255,0), 1, Color( 1,154/255,102/255,0) },
										x = 2, y = 2, w = (bg_bar:w() - 4) * (challenge.amount/challenge.count), h = bg_bar:h() - 4, layer = 2, align="center", halign="center", vertical="center", } )
		local progress_text = c_panel:text( { font_size = tweak_data.menu.loading_challenge_progress_font_size, font = tweak_data.hud.medium_font, x = 0, y = 0, h = bg_bar:h(), w = bg_bar:w(),
										align="center", halign="center", vertical="center", valign="center", color = Color.white, layer = 3,
										text = challenge.amount.."/"..challenge.count,
									} )
									
		y = y + c_panel:h()
	end
	
	--[[for i,challenge in ipairs( c_panels ) do
		local h = challenge.panel:h() + challenge.text:h()
		challenge.text:set_bottom( near_completion_title:bottom() + 42 * tweak_data.scale.loading_challenge_bar_scale + ( h + 16 * tweak_data.scale.loading_challenge_bar_scale ) * (i-1) )
		challenge.panel:set_top( challenge.text:bottom() )
		
		challenge.text:set_right( safe_rect_pixels.width )
		challenge.panel:set_left( near_completion_title:left() )
	end]]
	else
	local last_comleted_title_text = challenges_panel:text( { name = "last_comleted_title_text", text = utf8.to_upper( "YOU NEED PDTH HUD FOR CHALLENGES!" ), font_size = tweak_data.menu.loading_challenge_name_font_size, font= tweak_data.hud_stats.objectives_font } )
	managers.hud:make_fine_text( last_comleted_title_text )
	end
end

function HUDStatsScreen:_create_stats_ext_inventory(ext_inventory_panel)
	ext_inventory_panel:clear()
	local eq_h = 64 / (PlayerBase.USE_GRENADES and 3 or 2)
	local eq_w = 48
	local equipment = {
		{
			text = managers.localization:to_upper_text("hud_body_bags"),
			icon = "equipment_body_bag",
			amount = managers.player:get_body_bags_amount()
		}
	}
	local y
	for i, eq in ipairs(equipment) do
		y = ext_inventory_panel:h() - eq_h * i - 2 * (i - 1)
		local panel = ext_inventory_panel:panel({
			name = "panel" .. i,
			layer = 1,
			w = eq_w,
			h = eq_h,
			x = ext_inventory_panel:w() - eq_w,
			y = y
		})
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(eq.icon)
		local image = panel:bitmap({
			name = "image",
			texture = icon,
			texture_rect = texture_rect,
			visible = true,
			layer = 1,
			color = Color.white,
			w = panel:h(),
			h = panel:h(),
			x = -(panel:h() - panel:h()) / 2,
			y = -(panel:h() - panel:h()) / 2
		})
		local amount = panel:text({
			name = "amount",
			visible = true,
			text = tostring(13),
			font = "fonts/font_medium_mf",
			font_size = 22,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			x = -2,
			y = 2,
			w = panel:w(),
			h = panel:h()
		})
		self:_set_amount_string(amount, eq.amount)
		local text = ext_inventory_panel:text({
			name = "text" .. i,
			visible = true,
			text = eq.text,
			font = "fonts/font_medium_mf",
			font_size = 22,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			x = -2,
			y = 2,
			w = panel:w(),
			h = panel:h()
		})
		managers.hud:make_fine_text(text)
		text:set_y(math.round(panel:center_y() - text:h() / 2) + 2)
		text:set_right(math.round(panel:left() - 8))
	end
	--[[local title = ext_inventory_panel:text({
		name = "title",
		visible = true,
		text = managers.localization:to_upper_text("hud_extended_inventory"),
		font_size = tweak_data.hud_stats.loot_title_size,
		font = tweak_data.hud_stats.objectives_font,
		color = Color.white,
		align = "right",
		vertical = "center",
		layer = 2,
		x = -2,
		y = 2,
		w = ext_inventory_panel:w(),
		h = ext_inventory_panel:h()
	})
	managers.hud:make_fine_text(title)
	title:set_y(y - title:h() - 4)
	title:set_right(math.round(ext_inventory_panel:w()))]]--
end

end