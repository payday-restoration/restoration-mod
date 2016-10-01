if Restoration.options.restoration_mrender == true then
function CrimeNetContractGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel({layer = 51})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({layer = 50})

	self._node = node
	local job_data = self._node:parameters().menu_component_data
	self._customizable = job_data.customize_contract or false
	local is_win_32 = SystemInfo:platform() == Idstring("WIN32")
	local is_nextgen = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1")
	local width = 900
	local height = 580
	if not is_win_32 then
		width = 900
		height = is_nextgen and 550 or 525
	end
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h(),
		render_template = "VertexColorTexturedBlur3D"
	})
	local func = function(o)
		local start_blur = 0
		over(0.6, function(p)
			o:set_alpha(math.lerp(start_blur, 1, p))
		end)
	end
	blur:animate(func)
	self._contact_text_header = self._panel:text({
		text = " ",
		align = "left",
		vertical = "top",
		font_size = tweak_data.menu.large_font,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_yellow
	})
	do
		local x, y, w, h = self._contact_text_header:text_rect()
		self._contact_text_header:set_size(width, h)
		self._contact_text_header:set_center_x(self._panel:w() * 0.5)
	end
	self._contract_panel = self._panel:panel({
		h = height,
		w = width,
		layer = 1,
		x = self._contact_text_header:x(),
		y = self._contact_text_header:bottom()
	})
	self._contract_panel:set_center_y(self._panel:h() * 0.5)
	self._contact_text_header:set_bottom(self._contract_panel:top())
		self._contract_panel:rect({
		color = Color.black,
		alpha = 0.80,
		layer = 0
	})
	if not job_data.job_id then
		local bottom = self._contract_panel:bottom()
		self._contract_panel:set_h(160)
		self._contract_panel:set_bottom(bottom)
		self._contact_text_header:set_bottom(self._contract_panel:top())
		local host_name = job_data.host_name or ""
		local num_players = job_data.num_plrs or 1
		local server_text = managers.localization:to_upper_text("menu_lobby_server_title") .. " " .. host_name
		local players_text = managers.localization:to_upper_text("menu_players_online", {
			COUNT = tostring(num_players)
		})
		self._contact_text_header:set_text(server_text .. "\n" .. players_text)
		self._contact_text_header:set_font(tweak_data.menu.pd2_medium_font_id)
		self._contact_text_header:set_font_size(tweak_data.menu.pd2_medium_font_size)
		local x, y, w, h = self._contact_text_header:text_rect()
		self._contact_text_header:set_size(width, h)
		self._contact_text_header:set_top(self._contract_panel:top())
		self._contact_text_header:move(10, 10)
		BoxGuiObject:new(self._contract_panel, {
			sides = {
				0,
				0,
				0,
				0
			}
		})
		self._step = 1
		self._steps = {}
		return
	end
	BoxGuiObject:new(self._contract_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	self._contract_panel:polyline( { 
	color=tweak_data.screen_color_blue:with_alpha(0.5), 
	blend_mode="add", 
	line_width=1, 
	closed=true, 
	points={ Vector3( 0, 0, 0 ), 
	Vector3( self._contract_panel:w(), 0, 0 ), 
	Vector3( self._contract_panel:w(), self._contract_panel:h(), 0 ), 
	Vector3( 0, self._contract_panel:h(), 0 ) } } )
	job_data.job_id = job_data.job_id or "ukrainian_job"
	local narrative = tweak_data.narrative:job_data(job_data.job_id)
	local narrative_chains = tweak_data.narrative:job_chain(job_data.job_id)
	local w = is_win_32 and 389 or 356
	local text_w = width - w
	local font_size = tweak_data.menu.pd2_small_font_size
	local font = tweak_data.menu.medium_font
	local risk_color = tweak_data.screen_colors.risk
	self._contact_text_header:set_text(managers.localization:to_upper_text("menu_cn_contract_title", {
		job = managers.localization:text(narrative.name_id)
	}))
	local contract_text = self._contract_panel:text({
		text = managers.localization:text(narrative.briefing_id),
		align = "left",
		vertical = "top",
		w = text_w,
		font_size = font_size,
		font = font,
		color = tweak_data.screen_colors.text,
		wrap = true,
		wrap_word = true,
		x = 10,
		y = 10
	})
	do
		local _, _, _, h = contract_text:text_rect()
		local scale = 1
		if h + contract_text:top() > math.round(self._contract_panel:h() * 0.5) - font_size then
			scale = (math.round(self._contract_panel:h() * 0.5) - font_size) / (h + contract_text:top())
		end
		contract_text:set_font_size(font_size * scale)
		self:make_fine_text(contract_text)
	end
	local contact_w = width - (text_w + 20) - 10
	local contact_h = contact_w / 1.7777778
	local is_job_ghostable = managers.job:is_job_ghostable(job_data.job_id)
	if is_job_ghostable then
		local min_ghost_bonus, max_ghost_bonus = managers.job:get_job_ghost_bonus(job_data.job_id)
		local min_ghost = math.round(min_ghost_bonus * 100)
		local max_ghost = math.round(max_ghost_bonus * 100)
		local min_string, max_string
		if min_ghost == 0 and min_ghost_bonus ~= 0 then
			min_string = string.format("%0.2f", math.abs(min_ghost_bonus * 100))
		else
			min_string = tostring(math.abs(min_ghost))
		end
		if max_ghost == 0 and max_ghost_bonus ~= 0 then
			max_string = string.format("%0.2f", math.abs(max_ghost_bonus * 100))
		else
			max_string = tostring(math.abs(max_ghost))
		end
		local ghost_bonus_string = min_ghost_bonus == max_ghost_bonus and min_string or min_string .. "-" .. max_string
		local ghostable_text = self._contract_panel:text({
			text = managers.localization:to_upper_text("menu_ghostable_job", {bonus = ghost_bonus_string}),
			blend_mode = "add",
			align = "left",
			vertical = "top",
			w = text_w,
			font_size = font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.ghost_color,
			wrap = true,
			wrap_word = true
		})
		ghostable_text:set_position(contract_text:x(), contract_text:bottom() + 10)
		self:make_fine_text(ghostable_text)
	end
	local contact_panel = self._contract_panel:panel({
		w = contact_w,
		h = contact_h,
		x = text_w + 20,
		y = 10
	})
	local contact_image = contact_panel:rect({
		color = Color(0.3, 0, 0, 0)
	})
	local crimenet_videos = narrative.crimenet_videos
	if crimenet_videos then
		local variant = math.random(#crimenet_videos)
		contact_panel:video({
			video = "movies/" .. crimenet_videos[variant],
			width = contact_panel:w(),
			height = contact_panel:h(),
			blend_mode = "add",
			loop = true,
			color = tweak_data.screen_color_blue
		})
	end
	local contact_text = self._contract_panel:text({
		text = managers.localization:text(tweak_data.narrative.contacts[narrative.contact].name_id),
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_white
	})
	do
		local x, y, w, h = contact_text:text_rect()
		contact_text:set_size(w, h)
	end
	contact_text:set_position(contact_panel:left(), contact_panel:bottom() + 5)
	BoxGuiObject:new(contact_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	local modifiers_text = self._contract_panel:text({
		name = "modifiers_text",
		text = managers.localization:to_upper_text("menu_cn_modifiers"),
		font = tweak_data.menu.default_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		x = 10,
		color = tweak_data.screen_color_blue,
		align = "left",
		vertical = "top",
		w = text_w
	})
	self:make_fine_text(modifiers_text)
	modifiers_text:set_bottom(math.round(self._contract_panel:h() * 0.5))
	local ghost_bonus_mul = managers.job:get_ghost_bonus()
	local skill_bonus = managers.player:get_skill_exp_multiplier()
	local infamy_bonus = managers.player:get_infamy_exp_multiplier()
	local limited_bonus = tweak_data:get_value("experience_manager", "limited_bonus_multiplier") or 1
	local job_ghost = math.round(ghost_bonus_mul * 100)
	local job_ghost_string = tostring(math.abs(job_ghost))
	local has_ghost_bonus = ghost_bonus_mul > 0
	if job_ghost == 0 and ghost_bonus_mul ~= 0 then
		job_ghost_string = string.format("%0.2f", math.abs(ghost_bonus_mul * 100))
	end
	local ghost_color = tweak_data.screen_colors.ghost_color
	local ghost_warning_text = self._contract_panel:text({
		name = "ghost_color_warning_text",
		text = managers.localization:to_upper_text("menu_ghost_bonus", {exp_bonus = job_ghost_string}),
		font = font,
		font_size = font_size,
		color = ghost_color,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		w = text_w,
		blend_mode = "normal"
	})
	self:make_fine_text(ghost_warning_text)
	ghost_warning_text:set_top(modifiers_text:bottom())
	ghost_warning_text:set_left(20)
	ghost_warning_text:set_visible(has_ghost_bonus)
	local job_heat_value = managers.job:get_job_heat(job_data.job_id)
	local ignore_heat = job_heat_value > 0 and self._customizable
	local job_heat_mul = ignore_heat and 0 or managers.job:get_job_heat_multipliers(job_data.job_id) - 1
	local job_heat = math.round(job_heat_mul * 100)
	local job_heat_string = tostring(math.abs(job_heat))
	local is_job_heated = job_heat ~= 0 or job_heat_mul ~= 0
	if job_heat == 0 and job_heat_mul ~= 0 then
		job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
	else
	end
	self._is_job_heated = is_job_heated
	local heat_color = managers.job:get_job_heat_color(job_data.job_id)
	local heat_warning_text = self._contract_panel:text({
		name = "heat_warning_text",
		text = managers.localization:to_upper_text("menu_heat_" .. (job_heat_mul > 0 and "warm" or job_heat_mul < 0 and "cold" or "ok"), {job_heat = job_heat_string}),
		font = font,
		font_size = font_size,
		color = heat_color,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		w = text_w,
		blend_mode = "normal"
	})
	self:make_fine_text(heat_warning_text)
	if not has_ghost_bonus or not ghost_warning_text:bottom() then
	end
	heat_warning_text:set_top((modifiers_text:bottom()))
	heat_warning_text:set_left(20)
	heat_warning_text:set_visible(is_job_heated)
	self._heat_color = heat_color
	local pro_warning_text = self._contract_panel:text({
		name = "pro_warning_text",
		text = managers.localization:to_upper_text("menu_pro_warning"),
		font = font,
		font_size = font_size,
		color = tweak_data.screen_colors.pro_color,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		w = text_w,
		blend_mode = "normal"
	})
	self:make_fine_text(pro_warning_text)
	pro_warning_text:set_h(pro_warning_text:h())
	pro_warning_text:set_left(20)
	if (not is_job_heated or not heat_warning_text:bottom()) and (not has_ghost_bonus or not ghost_warning_text:bottom()) then
	end
	pro_warning_text:set_top((modifiers_text:bottom()))
	pro_warning_text:set_visible(narrative.professional)
	modifiers_text:set_visible(heat_warning_text:visible() or pro_warning_text:visible() or ghost_warning_text:visible())
	local risk_title = self._contract_panel:text({
		font = tweak_data.menu.default_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		text = managers.localization:to_upper_text("menu_risk"),
		color = tweak_data.screen_color_blue,
		x = 10
	})
	self:make_fine_text(risk_title)
	risk_title:set_top((pro_warning_text:visible() and pro_warning_text:bottom() or heat_warning_text:visible() and heat_warning_text:bottom() or ghost_warning_text:visible() and ghost_warning_text:bottom() or math.round(self._contract_panel:h() * 0.5)) + 5)
	local menu_risk_id = "menu_risk_pd"
	if job_data.difficulty == "hard" then
		menu_risk_id = "menu_risk_swat"
	elseif job_data.difficulty == "overkill" then
		menu_risk_id = "menu_risk_fbi"
	elseif job_data.difficulty == "overkill_145" then
		menu_risk_id = "menu_risk_special"
	elseif job_data.difficulty == "overkill_290" then
		menu_risk_id = "menu_risk_elite"
	end
	local risk_stats_panel = self._contract_panel:panel({
		name = "risk_stats_panel",
		w = text_w,
		x = 10
	})
	risk_stats_panel:set_h(risk_title:h() + 5)
	local plvl = managers.experience:current_level()
	local player_stars = math.max(math.ceil(plvl / 10), 1)
	local job_stars = math.ceil(narrative.jc / 10)
	local difficulty_stars = job_data.difficulty_id - 2
	local job_and_difficulty_stars = job_stars + difficulty_stars
	local rsx = 15
	local risks = {
		"risk_pd",
		"risk_swat",
		"risk_fbi",
		"risk_death_squad"
	}
	if not Global.SKIP_OVERKILL_290 then
		table.insert(risks, "risk_murder_squad")
	end
	local max_x = 0
	local max_y = 0
	for i, name in ipairs(risks) do
		if i ~= 1 then
			local texture, rect = tweak_data.hud_icons:get_icon_data(name)
			local active = false
			local color = active and i ~= 1 and risk_color or Color.white
			local alpha = active and 1 or 0.25
			local risk = self._contract_panel:bitmap({
				name = name,
				texture = texture,
				texture_rect = rect,
				x = 0,
				y = 0,
				alpha = alpha,
				color = color
			})
			risk:set_x(rsx)
			risk:set_top(math.round(risk_title:bottom()))
			rsx = rsx + risk:w() + 2
			local stat = managers.statistics:completed_job(job_data.job_id, tweak_data:index_to_difficulty(i + 1))
			local risk_stat = risk_stats_panel:text({
				name = name,
				font = font,
				font_size = font_size,
				text = tostring(stat),
				align = "center"
			})
			self:make_fine_text(risk_stat)
			risk_stat:set_world_center_x(risk:world_center_x() - 1)
			risk_stat:set_x(math.round(risk_stat:x()))
			local this_difficulty = i == difficulty_stars + 1
			active = i <= difficulty_stars + 1
			color = Color.white
			alpha = 0.5
			risk_stat:set_color(color)
			risk_stat:set_alpha(alpha)
			max_y = math.max(max_y, risk:bottom())
			max_x = math.max(max_x, risk:right() + 5)
			max_x = math.max(max_x, risk_stat:right() + risk_stats_panel:left() + 10)
		end
	end
	risk_stats_panel:set_top(math.round(max_y + 2))
	local stat = managers.statistics:completed_job(job_data.job_id, tweak_data:index_to_difficulty(difficulty_stars + 2))
	local risk_text = self._contract_panel:text({
		name = "risk_text",
		w = text_w - max_x,
		text = managers.localization:to_upper_text(menu_risk_id) .. " " .. managers.localization:to_upper_text("menu_stat_job_completed", {
			stat = tostring(stat)
		}) .. " ",
		font = font,
		font_size = font_size,
		color = risk_color,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		x = max_x
	})
	risk_text:set_top(math.round(risk_title:bottom() + 4))
	risk_text:set_h(risk_stats_panel:bottom() - risk_text:top())
	risk_text:hide()
	local potential_rewards_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text(self._customizable and "menu_potential_rewards_min" or "menu_potential_rewards", {
			BTN_Y = managers.localization:btn_macro("menu_modify_item")
		}),
		color = managers.menu:is_pc_controller() and self._customizable and tweak_data.screen_colors.button_stage_3 or tweak_data.screen_colors.text,
		x = 10,
		blend_mode = "add"
	})
	self:make_fine_text(potential_rewards_title)
	potential_rewards_title:set_top(math.round(risk_stats_panel:bottom() + 4))
	local jobpay_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
		color = tweak_data.screen_colors.text,
		x = 20
	})
	self:make_fine_text(jobpay_title)
	jobpay_title:set_top(math.round(potential_rewards_title:bottom()))
	self._potential_rewards_title = potential_rewards_title
	local experience_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_experience"),
		color = tweak_data.screen_colors.text,
		x = 20
	})
	self:make_fine_text(experience_title)
	experience_title:set_top(math.round(jobpay_title:bottom()))
	local sx = math.max(jobpay_title:right(), experience_title:right())
	sx = sx + 8
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
	local contract_visuals = job_data.contract_visuals or {}
	local cy = experience_title:center_y()
	local total_xp, dissected_xp = managers.experience:get_contract_xp_by_stars(job_data.job_id, job_stars, difficulty_stars, narrative.professional, #narrative_chains, {
		ignore_heat = job_heat_value > 0 and self._customizable,
		mission_xp = contract_visuals.min_mission_xp and contract_visuals.min_mission_xp[difficulty_stars + 1]
	})
	local base_xp, risk_xp, heat_base_xp, heat_risk_xp, ghost_base_xp, ghost_risk_xp = unpack(dissected_xp)
	local job_xp, add_xp, heat_add_xp, ghost_add_xp = self:_create_xp_appendices(sx, cy)
	cy = jobpay_title:center_y()
	local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #narrative_chains, job_data.job_id)
	local job_cash = self._contract_panel:text({
		name = "job_cash",
		font = font,
		font_size = font_size,
		text = managers.experience:cash_string(0),
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(job_cash)
	job_cash:set_x(sx)
	job_cash:set_center_y(math.round(cy))
	local add_cash = self._contract_panel:text({
		name = "job_add_cash",
		font = font,
		font_size = font_size,
		text = "",
		color = risk_color
	})
	add_cash:set_text(" +" .. managers.experience:cash_string(math.round(0)))
	self:make_fine_text(add_cash)
	add_cash:set_x(math.round(job_cash:right()))
	add_cash:set_center_y(math.round(cy))
	local payday_money = math.round(total_payout)
	local payday_text = self._contract_panel:text({
		name = "payday_text",
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		text = managers.localization:to_upper_text("menu_payday", {
			MONEY = managers.experience:cash_string(0)
		}),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(payday_text)
	payday_text:set_bottom(self._contract_panel:h() - 10)
	if not is_win_32 then
		payday_text:move(0, 5)
	end
	self._briefing_event = narrative.briefing_event
	if self._briefing_event then
		self._briefing_len_panel = self._contract_panel:panel({
			w = contact_image:w(),
			h = font_size * 2 + 20
		})
		self._briefing_len_panel:rect({
			name = "duration",
			w = 0,
			color = tweak_data.screen_colors.button_stage_3:with_alpha(0.2),
			alpha = 0.6,
			blend_mode = "add",
			halign = "grow",
			valign = "grow"
		})
		self._briefing_len_panel:text({
			name = "text",
			font = font,
			font_size = font_size,
			text = "",
			color = tweak_data.screen_colors.text,
			x = 10,
			y = 10,
			layer = 1,
			blend_mode = "add"
		})
		local button_text = self._briefing_len_panel:text({
			name = "button_text",
			font = font,
			font_size = font_size,
			text = " ",
			color = tweak_data.screen_colors.text,
			x = 10,
			y = 10,
			layer = 1,
			blend_mode = "add"
		})
		local _, _, _, h = button_text:text_rect()
		self._briefing_len_panel:set_h(h * 2 + 20)
		if managers.menu:is_pc_controller() then
			button_text:set_color(tweak_data.screen_colors.button_stage_3)
		end
		BoxGuiObject:new(self._briefing_len_panel, {
			sides = {
				0,
				0,
				0,
				0
			}
		})
		self._briefing_len_panel:polyline( { 
	color=tweak_data.screen_color_blue:with_alpha(0.5), 
	blend_mode="add", 
	line_width=1, 
	closed=true, 
	points={ Vector3( 0, 0, 0 ), 
	Vector3( self._briefing_len_panel:w(), 0, 0 ), 
	Vector3( self._briefing_len_panel:w(), self._briefing_len_panel:h(), 0 ), 
	Vector3( 0, self._briefing_len_panel:h(), 0 ) } } )
		self._briefing_len_panel:set_position(contact_text:left(), contact_text:bottom() + 10)
	end
	local days_multiplier = 0
	for i = 1, #narrative_chains do
		local day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", i) or tweak_data:get_value("experience_manager", "day_multiplier", i)
		days_multiplier = days_multiplier + (day_mul - 1)
	end
	days_multiplier = 1 + days_multiplier / #narrative_chains
	local last_day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", #narrative_chains) or tweak_data:get_value("experience_manager", "day_multiplier", #narrative_chains)
	self._data = {}
	self._data.job_cash = base_payout
	self._data.add_job_cash = risk_payout
	self._data.experience = base_xp
	self._data.add_experience = risk_xp
	self._data.heat_experience = heat_base_xp
	self._data.heat_add_experience = heat_risk_xp
	self._data.ghost_experience = ghost_base_xp
	self._data.ghost_add_experience = ghost_risk_xp
	self._data.num_stages_string = tostring(#narrative_chains) .. " x "
	self._data.payday_money = payday_money
	self._data.counted_job_cash = 0
	self._data.counted_job_xp = 0
	self._data.counted_risk_cash = 0
	self._data.counted_risk_xp = 0
	self._data.counted_heat_xp = 0
	self._data.counted_ghost_xp = 0
	self._data.counted_payday_money = 0
	self._data.stars = {
		job_and_difficulty_stars = job_and_difficulty_stars,
		job_stars = job_stars,
		difficulty_stars = difficulty_stars
	}
	self._data.gui_objects = {}
	self._data.gui_objects.risk_stats_panel = risk_stats_panel
	self._data.gui_objects.risk_text = risk_text
	self._data.gui_objects.payday_text = payday_text
	self._data.gui_objects.job_cash = job_cash
	self._data.gui_objects.job_add_cash = add_cash
	self._data.gui_objects.heat_add_xp = heat_add_xp
	self._data.gui_objects.ghost_add_xp = ghost_add_xp
	self._data.gui_objects.add_xp = add_xp
	self._data.gui_objects.job_xp = job_xp
	self._data.gui_objects.risks = {
		"risk_pd",
		"risk_swat",
		"risk_fbi",
		"risk_death_squad"
	}
	if not Global.SKIP_OVERKILL_290 then
		table.insert(self._data.gui_objects.risks, "risk_murder_squad")
	end
	self._data.gui_objects.num_stars = 10
	self._wait_t = 0
	local reached_level_cap = managers.experience:reached_level_cap()
	local levelup_text = reached_level_cap and managers.localization:to_upper_text("menu_reached_level_cap") or managers.localization:to_upper_text("menu_levelup", {
		levels = string.format("%0.1d%%", 0)
	})
	local potential_level_up_text = self._contract_panel:text({
		layer = 3,
		name = "potential_level_up_text",
		blend_mode = "normal",
		visible = true,
		text = levelup_text,
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.hud_stats.potential_xp_color
	})
	self:make_fine_text(potential_level_up_text)
	potential_level_up_text:set_top(math.round(heat_add_xp:top()))
	self:_update_xp_appendices()
	self._data.gui_objects.potential_level_up_text = potential_level_up_text
	self._step = 1
	self._steps = {
		"set_time",
		"start_sound",
		"start_counter",
		"count_job_base",
		"end_counter",
		"count_difficulty_stars",
		"start_counter",
		"count_job_payday",
		"end_counter",
		"free_memory"
	}
	if self._customizable then
		if self._briefing_len_panel then
			self._briefing_len_panel:hide()
		end
		if not is_win_32 and not is_nextgen then
			contact_panel:hide()
			contact_text:set_top(contact_panel:top())
			contact_text:set_text("")
		end
		local premium_text = self._contract_panel:text({
			name = "premium_text",
			text = "  ",
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.button_stage_3,
			blend_mode = "add",
			wrap = true,
			word_wrap = true
		})
		premium_text:set_top(contact_text:bottom() + 10)
		premium_text:set_left(contact_text:left())
		premium_text:set_w(contact_image:w())
		self._contact_text_header:set_text(managers.localization:to_upper_text("menu_cn_premium_buy_desc") .. ": " .. managers.localization:to_upper_text(narrative.name_id))
		self._step = 1
		self._steps = {
			"start_sound",
			"set_all",
			"free_memory"
		}
	end
	self._current_job_star = 0
	self._current_difficulty_star = 0
	self._post_event_params = {
		show_subtitle = false,
		listener = {
			clbk = callback(self, self, "sound_event_callback"),
			duration = true,
			end_of_event = true
		}
	}
	if not managers.menu:is_pc_controller() then
		managers.menu:active_menu().input:deactivate_controller_mouse()
	end
	self:_rec_round_object(self._panel)
	self._potential_show_max = false
end
end
