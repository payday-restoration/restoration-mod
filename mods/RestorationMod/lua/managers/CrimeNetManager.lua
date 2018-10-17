

-- Lines: 1426 to 1936
function CrimeNetGui:init(ws, fullscreeen_ws, node)
	self._tweak_data = tweak_data.gui.crime_net
	self._crimenet_enabled = true

	managers.crimenet:set_getting_hacked(false)
	managers.menu_component:post_event("crime_net_startup")
	self._crimenet_ambience = managers.menu_component:post_event( "crimenet_ambience" )
	managers.menu_component:close_contract_gui()

	local no_servers = node:parameters().no_servers

	if no_servers then
		managers.crimenet:start_no_servers()
	else
		managers.crimenet:start()
	end

	managers.menu:active_menu().renderer.ws:hide()

	local safe_scaled_size = managers.gui_data:safe_scaled_size()
	self._ws = ws
	self._fullscreen_ws = fullscreeen_ws
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({name = "fullscreen"})
	self._panel = self._ws:panel():panel({name = "main"})
	local full_16_9 = managers.gui_data:full_16_9_size()

	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur_top",
		render_template = "VertexColorTexturedBlur3D",
		rotation = 360,
		x = 0,
		layer = 1001,
		w = self._fullscreen_ws:panel():w(),
		h = full_16_9.convert_y * 2,
		y = -full_16_9.convert_y
	})
	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur_right",
		render_template = "VertexColorTexturedBlur3D",
		rotation = 360,
		y = 0,
		layer = 1001,
		w = full_16_9.convert_x * 2,
		h = self._fullscreen_ws:panel():h(),
		x = self._fullscreen_ws:panel():w() - full_16_9.convert_x
	})
	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur_bottom",
		render_template = "VertexColorTexturedBlur3D",
		rotation = 360,
		x = 0,
		layer = 1001,
		w = self._fullscreen_ws:panel():w(),
		h = full_16_9.convert_y * 2,
		y = self._fullscreen_ws:panel():h() - full_16_9.convert_y
	})
	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur_left",
		render_template = "VertexColorTexturedBlur3D",
		rotation = 360,
		y = 0,
		layer = 1001,
		w = full_16_9.convert_x * 2,
		h = self._fullscreen_ws:panel():h(),
		x = -full_16_9.convert_x
	})
	self._panel:rect({
		blend_mode = "add",
		h = 2,
		y = 0,
		x = 0,
		layer = 1,
		w = self._panel:w(),
		color = tweak_data.screen_color_blue
	})
	self._panel:rect({
		blend_mode = "add",
		h = 2,
		y = 0,
		x = 0,
		layer = 1,
		w = self._panel:w(),
		color = tweak_data.screen_color_blue
	}):set_bottom(self._panel:h())
	self._panel:rect({
		blend_mode = "add",
		y = 0,
		w = 2,
		x = 0,
		layer = 1,
		h = self._panel:h(),
		color = tweak_data.screen_color_blue
	}):set_right(self._panel:w())
	self._panel:rect({
		blend_mode = "add",
		y = 0,
		w = 2,
		x = 0,
		layer = 1,
		h = self._panel:h(),
		color = tweak_data.screen_color_blue
	})

	self._rasteroverlay = self._fullscreen_panel:bitmap({
		texture = "guis/textures/crimenet_map_rasteroverlay",
		name = "rasteroverlay",
		layer = 3,
		wrap_mode = "wrap",
		blend_mode = "mul",
		texture_rect = {
			0,
			0,
			32,
			256
		},
		color = Color(1, 1, 1, 1),
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h()
	})

	--[[self._fullscreen_panel:bitmap({
		texture = "guis/textures/crimenet_map_vignette",
		name = "vignette",
		blend_mode = "mul",
		layer = 2,
		color = Color(1, 1, 1, 1),
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h()
	})]]--

	local bd_light = self._fullscreen_panel:bitmap({
		texture = "guis/textures/pd2/menu_backdrop/bd_light",
		name = "bd_light",
		layer = 4
	})

	bd_light:set_size(self._fullscreen_panel:size())
	bd_light:set_alpha(0)
	bd_light:set_blend_mode("add")

	-- Lines: 1470 to 1485
	local function light_flicker_animation(o)
		local alpha = 0
		local acceleration = 0
		local wanted_alpha = math.rand(1) * 0.3
		local flicker_up = true

		while true do
			wait(0.009, self._fixed_dt)
			over(0.045, function (p)
				o:set_alpha(math.lerp(alpha, wanted_alpha, p))
			end, self._fixed_dt)

			flicker_up = not flicker_up
			alpha = o:alpha()
			wanted_alpha = math.rand(flicker_up and alpha or 0.2, not flicker_up and alpha or 0.3)
		end
	end

	bd_light:animate(light_flicker_animation)

	local back_button = self._panel:text({
		vertical = "bottom",
		name = "back_button",
		blend_mode = "add",
		align = "right",
		layer = 40,
		text = managers.localization:to_upper_text("menu_back"),
		font_size = 36,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_yellow
	})

	self:make_fine_text(back_button)
	back_button:set_right(self._panel:w() - 10)
	back_button:set_bottom(self._panel:h() - 10)
	back_button:set_visible(managers.menu:is_pc_controller())

	local back_button_bg = self._panel:rect( { blend_mode="add", h=back_button:h() * 2, w = back_button:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_2, alpha=0.1 } )
	back_button_bg:set_right( back_button:right()+5 )
	back_button_bg:set_bottom( back_button:bottom()+5 )
	
	local map_coord_text = self._panel:text( { name="map_coord_text", text=utf8.to_upper( managers.localization:text("cn_menu_mapcoords", {zoom=1, x="000.00", y="000.00"}) ), align="left", vertical="bottom", h=tweak_data.menu.pd2_medium_font_size ,font_size=tweak_data.menu.pd2_medium_font_size, font=tweak_data.menu.default_font, color=tweak_data.screen_colors.button_stage_2, layer=28 } )
	self:make_fine_text( map_coord_text )
	map_coord_text:set_left( 15 )
	map_coord_text:set_bottom( self._panel:h() - 15 )

	local map_coord_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = map_coord_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_2, alpha=0.1 } )
	map_coord_text_bg:set_left( map_coord_text:left()-5 )
	map_coord_text_bg:set_bottom( map_coord_text:bottom()+5 )
	
	map_coord_text:set_w( map_coord_text_bg:w() )
	
	local blur_object = self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "controller_legend_blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = back_button:layer() - 1
	})

	blur_object:set_shape(back_button:shape())

	if not managers.menu:is_pc_controller() then
		blur_object:set_size(self._panel:w() * 0.5, tweak_data.menu.pd2_medium_font_size)
		blur_object:set_rightbottom(self._panel:w() - 2, self._panel:h() - 2)
	end

	--WalletGuiObject.set_wallet(self._panel)
	--WalletGuiObject.set_layer(30)
	--WalletGuiObject.move_wallet(10, -10)

	local text_id = Global.game_settings.single_player and "menu_crimenet_offline" or "cn_menu_num_players_offline"
	local num_players_text = self._panel:text({
		vertical = "top",
		name = "num_players_text",
		align = "left",
		layer = 40,
		text = managers.localization:to_upper_text(text_id, {amount = "1"}),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})

	self:make_fine_text(num_players_text)
	num_players_text:set_left(10)
	num_players_text:set_top(10)

	local blur_object = self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "num_players_blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = num_players_text:layer() - 1
	})

	blur_object:set_shape(num_players_text:shape())

	local legends_button = self._panel:text({
		name = "legends_button",
		blend_mode = "add",
		layer = 40,
		text = managers.localization:to_upper_text("menu_cn_legend_show", {BTN_X = managers.localization:btn_macro("menu_toggle_legends")}),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})

	self:make_fine_text(legends_button)
	legends_button:set_right(self._panel:w() - 10)
	legends_button:set_top(10)
	legends_button:set_align("right")

	local blur_object = self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "legends_button_blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = legends_button:layer() - 1
	})

	blur_object:set_shape(legends_button:shape())

	if managers.menu:is_pc_controller() then
		legends_button:set_color(tweak_data.screen_colors.button_stage_3)
	end

	local w, h = nil
	local mw = 0
	local mh = nil
	local legend_panel = self._panel:panel({
		name = "legend_panel",
		visible = false,
		x = 10,
		layer = 40,
		y = legends_button:bottom() + 4
	})
	local host_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_host",
		x = 10,
		y = 10
	})
	local host_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_icon:right() + 2,
		y = host_icon:top(),
		text = managers.localization:to_upper_text("menu_cn_legend_host")
	})
	mw = math.max(mw, self:make_fine_text(host_text))
	local join_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = host_text:bottom()
	})
	local join_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = join_icon:top(),
		text = managers.localization:to_upper_text("menu_cn_legend_join")
	})
	mw = math.max(mw, self:make_fine_text(join_text))

	self:make_color_text(join_text, tweak_data.screen_colors.regular_color)

	local friends_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = join_text:bottom(),
		color = tweak_data.screen_colors.friend_color
	})
	local friends_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = join_text:bottom(),
		text = managers.localization:to_upper_text("menu_cn_legend_friends")
	})
	mw = math.max(mw, self:make_fine_text(friends_text))

	self:make_color_text(friends_text, tweak_data.screen_colors.friend_color)

	if managers.crimenet:no_servers() or is_xb1 then
		join_icon:hide()
		join_text:hide()
		friends_text:hide()
		friends_text:set_bottom(host_text:bottom())
	end

	local risk_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_risklevel",
		x = 10,
		y = friends_text:bottom()
	})
	local risk_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = risk_icon:top(),
		text = managers.localization:to_upper_text("menu_cn_legend_risk"),
		color = tweak_data.screen_colors.risk
	})
	mw = math.max(mw, self:make_fine_text(risk_text))
	local ghost_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_minighost",
		x = 7,
		y = risk_text:bottom() + 2 + 2,
		color = tweak_data.screen_colors.ghost_color
	})
	local ghost_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = risk_text:bottom(),
		text = managers.localization:to_upper_text("menu_cn_legend_ghostable"),
		color = tweak_data.screen_colors.ghost_color
	})
	mw = math.max(mw, self:make_fine_text(ghost_text))
	local next_y = ghost_text:bottom()
	local mutated_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.mutators_color_text
	})
	local mutated_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = ghost_text:bottom(),
		text = managers.localization:to_upper_text("menu_cn_legend_mutated"),
		color = tweak_data.screen_colors.mutators_color_text
	})
	mw = math.max(mw, self:make_fine_text(mutated_text))
	next_y = mutated_text:bottom()
	local spree_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.crime_spree_risk
	})
	local spree_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("cn_crime_spree"),
		color = tweak_data.screen_colors.crime_spree_risk
	})
	mw = math.max(mw, self:make_fine_text(spree_text))
	next_y = spree_text:bottom()
	local skirmish_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.skirmish_color
	})
	local skirmish_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_skirmish"),
		color = tweak_data.screen_colors.skirmish_color
	})
	mw = math.max(mw, self:make_fine_text(skirmish_text))
	next_y = skirmish_text:bottom()
	local kick_none_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_kick_marker",
		x = 10,
		y = next_y + 2
	})
	local kick_none_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_kick_disabled")
	})
	mw = math.max(mw, self:make_fine_text(kick_none_text))
	local kick_vote_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_votekick_marker",
		x = 10,
		y = kick_none_text:bottom() + 2
	})
	local kick_vote_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = kick_none_text:bottom(),
		text = managers.localization:to_upper_text("menu_kick_vote")
	})
	mw = math.max(mw, self:make_fine_text(kick_vote_text))
	local last_text = kick_vote_text
	local job_plan_loud_icon, job_plan_loud_text, job_plan_stealth_icon, job_plan_stealth_text = nil

	if MenuCallbackHandler:bang_active() then
		job_plan_loud_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_playstyle_loud",
			x = 10,
			y = kick_vote_text:bottom() + 2
		})
		job_plan_loud_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = kick_vote_text:bottom(),
			text = managers.localization:to_upper_text("menu_plan_loud")
		})
		mw = math.max(mw, self:make_fine_text(job_plan_loud_text))
		job_plan_stealth_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_playstyle_stealth",
			x = 10,
			y = job_plan_loud_text:bottom() + 2
		})
		job_plan_stealth_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = job_plan_loud_text:bottom(),
			text = managers.localization:to_upper_text("menu_plan_stealth")
		})
		mw = math.max(mw, self:make_fine_text(job_plan_stealth_text))
		last_text = job_plan_stealth_text
	end

	if managers.crimenet:no_servers() or is_xb1 then
		kick_none_icon:hide()
		kick_none_text:hide()
		kick_vote_icon:hide()
		kick_vote_text:hide()
		kick_vote_text:set_bottom(ghost_text:bottom())

		if MenuCallbackHandler:bang_active() then
			job_plan_loud_icon:hide()
			job_plan_loud_text:hide()
			job_plan_stealth_icon:hide()
			job_plan_stealth_text:hide()
		end
	end

	legend_panel:set_size(host_text:left() + mw + 10, last_text:bottom() + 10)
	legend_panel:rect({
		alpha = 0.4,
		layer = -1,
		color = Color.black
	})
	BoxGuiObject:new(legend_panel, {sides = {
		1,
		1,
		1,
		1
	}})
	legend_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = legend_panel:w(),
		h = legend_panel:h()
	})
	legend_panel:set_right(self._panel:w() - 10)

	local w, h = nil
	local mw = 0
	local mh = nil
	local global_bonuses_panel = self._panel:panel({
		y = 10,
		name = "global_bonuses_panel",
		h = 30,
		layer = 40
	})

	-- Lines: 1661 to 1670
	local function mul_to_procent_string(multiplier)
		local pro = math.round(multiplier * 100)
		local procent_string = nil
		procent_string = pro == 0 and multiplier ~= 0 and string.format("%0.2f", math.abs(multiplier * 100)) or tostring(math.abs(pro))

		return procent_string, multiplier >= 0
	end

	local has_ghost_bonus = managers.job:has_ghost_bonus()

	if has_ghost_bonus then
		local ghost_bonus_mul = managers.job:get_ghost_bonus()
		local job_ghost_string = mul_to_procent_string(ghost_bonus_mul)
		local ghost_text = global_bonuses_panel:text({
			blend_mode = "add",
			align = "center",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:to_upper_text("menu_ghost_bonus", {exp_bonus = job_ghost_string}),
			color = tweak_data.screen_colors.ghost_color
		})
	end

	if false then
		local skill_bonus = managers.player:get_skill_exp_multiplier()
		skill_bonus = skill_bonus - 1

		if skill_bonus > 0 then
			local skill_string = mul_to_procent_string(skill_bonus)
			local skill_text = global_bonuses_panel:text({
				blend_mode = "add",
				align = "center",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				text = managers.localization:to_upper_text("menu_cn_skill_bonus", {exp_bonus = skill_string}),
				color = tweak_data.screen_colors.skill_color
			})
		end

		local infamy_bonus = managers.player:get_infamy_exp_multiplier()
		infamy_bonus = infamy_bonus - 1

		if infamy_bonus > 0 then
			local infamy_string = mul_to_procent_string(infamy_bonus)
			local infamy_text = global_bonuses_panel:text({
				blend_mode = "add",
				align = "center",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				text = managers.localization:to_upper_text("menu_cn_infamy_bonus", {exp_bonus = infamy_string}),
				color = tweak_data.lootdrop.global_values.infamy.color
			})
		end

		local limited_bonus = tweak_data:get_value("experience_manager", "limited_bonus_multiplier") or 1
		limited_bonus = limited_bonus - 1

		if limited_bonus > 0 then
			local limited_string = mul_to_procent_string(limited_bonus)
			local limited_text = global_bonuses_panel:text({
				blend_mode = "add",
				align = "center",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				text = managers.localization:to_upper_text("menu_cn_limited_bonus", {exp_bonus = limited_string}),
				color = tweak_data.screen_colors.button_stage_2
			})
		end
	end

	if #global_bonuses_panel:children() > 1 then
		for i, child in ipairs(global_bonuses_panel:children()) do
			child:set_alpha(0)
		end

		-- Lines: 1722 to 1744
		local function global_bonuses_anim(panel)
			local child_num = 1
			local viewing_child = panel:children()[child_num]
			local t = 0
			local dt = 0

			while alive(viewing_child) do
				if not self._crimenet_enabled then
					coroutine.yield()
				else
					viewing_child:set_alpha(0)
					over(0.5, function (p)
						viewing_child:set_alpha(math.sin(p * 90))
					end)
					viewing_child:set_alpha(1)
					over(4, function (p)
						viewing_child:set_alpha((math.cos(p * 360 * 2) + 1) * 0.5 * 0.2 + 0.8)
					end)
					over(0.5, function (p)
						viewing_child:set_alpha(math.cos(p * 90))
					end)
					viewing_child:set_alpha(0)

					child_num = child_num % #panel:children() + 1
					viewing_child = panel:children()[child_num]
				end
			end
		end

		global_bonuses_panel:animate(global_bonuses_anim)
	elseif #global_bonuses_panel:children() == 1 then

		-- Lines: 1749 to 1757
		local function global_bonuses_anim(panel)
			while alive(panel) do
				if not self._crimenet_enabled then
					coroutine.yield()
				else
					over(2, function (p)
						panel:set_alpha((math.sin(p * 360) + 1) * 0.5 * 0.2 + 0.8)
					end)
				end
			end
		end

		global_bonuses_panel:animate(global_bonuses_anim)
	end

	if not no_servers and not is_xb1 then
		local id = is_x360 and "menu_cn_friends" or "menu_cn_filter"
	elseif not no_servers and is_xb1 then
		local id = "menu_cn_smart_matchmaking"
		local smart_matchmaking_button = self._panel:text({
			name = "smart_matchmaking_button",
			blend_mode = "add",
			layer = 40,
			text = managers.localization:to_upper_text(id, {BTN_Y = managers.localization:btn_macro("menu_toggle_filters")}),
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.button_stage_3
		})

		self:make_fine_text(smart_matchmaking_button)
		smart_matchmaking_button:set_right(self._panel:w() - 10)
		smart_matchmaking_button:set_top(10)

		local blur_object = self._panel:bitmap({
			texture = "guis/textures/test_blur_df",
			name = "smart_matchmaking_button_blur",
			render_template = "VertexColorTexturedBlur3D",
			layer = smart_matchmaking_button:layer() - 1
		})

		blur_object:set_shape(smart_matchmaking_button:shape())
	end

	self._map_size_w = 2048
	self._map_size_h = 1024
	local aspect = 1.7777777777777777
	local sw = math.min(self._map_size_w, self._map_size_h * aspect)
	local sh = math.min(self._map_size_h, self._map_size_w / aspect)
	local dw = self._map_size_w / sw
	local dh = self._map_size_h / sh
	self._map_size_w = dw * 1280
	self._map_size_h = dh * 720
	local pw = self._map_size_w
	local ph = self._map_size_h
	self._pan_panel_border = 2.7777777777777777
	self._pan_panel_job_border_x = full_16_9.convert_x + self._pan_panel_border * 2
	self._pan_panel_job_border_y = full_16_9.convert_y + self._pan_panel_border * 2
	self._pan_panel = self._panel:panel({
		name = "pan",
		layer = 0,
		w = pw,
		h = ph
	})

	self._pan_panel:set_center(self._fullscreen_panel:w() / 2, self._fullscreen_panel:h() / 2)

	self._jobs = {}
	self._deleting_jobs = {}
	self._map_panel = self._fullscreen_panel:panel({
		name = "map",
		w = pw,
		h = ph
	})

	self._map_panel:bitmap({
		texture = "guis/textures/crimenet_map",
		name = "map",
		color = Color( 171 / 255, 181 / 255, 130 / 255 ),
		layer = 0,
		w = pw,
		h = ph
	})
	self._map_panel:child("map"):set_halign("scale")
	self._map_panel:child("map"):set_valign("scale")
	self._map_panel:set_shape(self._pan_panel:shape())

	self._map_x, self._map_y = self._map_panel:position()

	if not managers.menu:is_pc_controller() then
		managers.mouse_pointer:confine_mouse_pointer(self._panel)
		managers.menu:active_menu().input:activate_controller_mouse()
		managers.mouse_pointer:set_mouse_world_position(managers.gui_data:safe_to_full(self._panel:world_center()))
	end

	self.MIN_ZOOM = 1
	self.MAX_ZOOM = 9
	self._zoom = 1
	local cross_indicator_h1 = self._fullscreen_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/dottedline",
		name = "cross_indicator_h1",
		h = 2,
		alpha = 0.1,
		wrap_mode = "wrap",
		blend_mode = "add",
		layer = 17,
		w = self._fullscreen_panel:w(),
		color = tweak_data.screen_colors.crimenet_lines
	})
	local cross_indicator_h2 = self._fullscreen_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/dottedline",
		name = "cross_indicator_h2",
		h = 2,
		alpha = 0.1,
		wrap_mode = "wrap",
		blend_mode = "add",
		layer = 17,
		w = self._fullscreen_panel:w(),
		color = tweak_data.screen_colors.crimenet_lines
	})
	local cross_indicator_v1 = self._fullscreen_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/dottedline",
		name = "cross_indicator_v1",
		w = 2,
		alpha = 0.1,
		wrap_mode = "wrap",
		blend_mode = "add",
		layer = 17,
		h = self._fullscreen_panel:h(),
		color = tweak_data.screen_colors.crimenet_lines
	})
	local cross_indicator_v2 = self._fullscreen_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/dottedline",
		name = "cross_indicator_v2",
		w = 2,
		alpha = 0.1,
		wrap_mode = "wrap",
		blend_mode = "add",
		layer = 17,
		h = self._fullscreen_panel:h(),
		color = tweak_data.screen_colors.crimenet_lines
	})
	local line_indicator_h1 = self._fullscreen_panel:rect({
		blend_mode = "add",
		name = "line_indicator_h1",
		h = 2,
		w = 0,
		alpha = 0.1,
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines
	})
	local line_indicator_h2 = self._fullscreen_panel:rect({
		blend_mode = "add",
		name = "line_indicator_h2",
		h = 2,
		w = 0,
		alpha = 0.1,
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines
	})
	local line_indicator_v1 = self._fullscreen_panel:rect({
		blend_mode = "add",
		name = "line_indicator_v1",
		h = 0,
		w = 2,
		alpha = 0.1,
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines
	})
	local line_indicator_v2 = self._fullscreen_panel:rect({
		blend_mode = "add",
		name = "line_indicator_v2",
		h = 0,
		w = 2,
		alpha = 0.1,
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines
	})
	local fw = self._fullscreen_panel:w()
	local fh = self._fullscreen_panel:h()

	cross_indicator_h1:set_texture_coordinates(Vector3(0, 0, 0), Vector3(fw, 0, 0), Vector3(0, 2, 0), Vector3(fw, 2, 0))
	cross_indicator_h2:set_texture_coordinates(Vector3(0, 0, 0), Vector3(fw, 0, 0), Vector3(0, 2, 0), Vector3(fw, 2, 0))
	cross_indicator_v1:set_texture_coordinates(Vector3(0, 2, 0), Vector3(0, 0, 0), Vector3(fh, 2, 0), Vector3(fh, 0, 0))
	cross_indicator_v2:set_texture_coordinates(Vector3(0, 2, 0), Vector3(0, 0, 0), Vector3(fh, 2, 0), Vector3(fh, 0, 0))
	self:_create_locations()

	self._num_layer_jobs = 0
	local player_level = managers.experience:current_level()
	local positions_tweak_data = tweak_data.gui.crime_net.map_start_positions
	local start_position = nil

	for _, position in ipairs(positions_tweak_data) do
		if player_level <= position.max_level then
			start_position = position

			break
		end
	end

	if start_position then
		self:_goto_map_position(start_position.x, start_position.y)
	end

	self._special_contracts_id = {}

	self:add_special_contracts(node:parameters().no_casino, no_servers)

	if false and managers.features:can_announce("crimenet_hacked") then
		-- Nothing
	else
		managers.features:announce_feature("crimenet_welcome")

		if is_win32 then
			managers.features:announce_feature("thq_feature")
		end

		if is_win32 and SystemInfo:distribution() == Idstring("STEAM") and Steam:logged_on() and not managers.dlc:is_dlc_unlocked("pd2_clan") and math.random() < 0.2 then
			managers.features:announce_feature("join_pd2_clan")
		end

		if managers.dlc:is_dlc_unlocked("gage_pack_jobs") then
			managers.features:announce_feature("dlc_gage_pack_jobs")
		end
	end

	managers.challenge:fetch_challenges()
end

function CrimeNetGui:_create_polylines()
	local regions = tweak_data.gui.crime_net.regions
	
	if alive( self._region_panel ) then
		self._map_panel:remove( self._region_panel )
		self._region_panel = nil
	end
	self._region_panel = self._map_panel:panel( { halign="scale", valign="scale" } )
	self._region_locations = {}
	
	local xs
	local ys
	
	local num
	local vectors
	
	local my_polyline
	local tw = math.max( self._map_panel:child("map"):texture_width(), 1 )
	local th = math.max( self._map_panel:child("map"):texture_height(), 1 )
	
	local region_text_data
	local region_text
	local x, y
	for _, region in ipairs( regions ) do
		xs = region[1]
		ys = region[2]
		num = math.min( #xs, #ys )
		
		
		--[[vectors = {}
		my_polyline = self._region_panel:polyline( { line_width=2, alpha=0.6, layer=1, closed=region.closed, blend_mode="add", halign="scale", valign="scale", color=tweak_data.screen_colors.crimenet_lines } )
		for i=1, num do
			table.insert( vectors, Vector3( (xs[i]) / tw * self._map_size_w * self._zoom, (ys[i]) / th * self._map_size_h * self._zoom, 0 ) )
		end
		my_polyline:set_points( vectors )
		
		vectors = {}
		my_polyline = self._region_panel:polyline( { line_width=5, alpha=0.2, layer=1, closed=region.closed, blend_mode="add", halign="scale", valign="scale", color=tweak_data.screen_colors.crimenet_lines } )
		for i=1, num do
			table.insert( vectors, Vector3( (xs[i]) / tw * self._map_size_w * self._zoom, (ys[i]) / th * self._map_size_h * self._zoom, 0 ) )
		end
		my_polyline:set_points( vectors )]]
		
		
		region_text_data = region.text
		if region_text_data then
			x = region_text_data.x / tw * self._map_size_w * self._zoom
			y = region_text_data.y / th * self._map_size_h * self._zoom
			
			if region_text_data.title_id then
				region_text = self._region_panel:text( { font = tweak_data.menu.pd2_large_font, font_size = tweak_data.menu.pd2_large_font_size, text = managers.localization:to_upper_text(region_text_data.title_id), layer = 1, alpha = 0.6, blend_mode = "add", halign = "scale", valign = "scale", rotation=0 } )
				local _, _, w, h = region_text:text_rect()
				region_text:set_size( w, h )
				region_text:set_center( x, y )
				table.insert( self._region_locations, { object=region_text, size=region_text:font_size() } )
			end
			
			if region_text_data.sub_id then
				region_text = self._region_panel:text( { font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = managers.localization:to_upper_text(region_text_data.sub_id), align = "center", vertical = "center", layer = 1, alpha = 0.6, blend_mode = "add", halign = "scale", valign = "scale", rotation=0 } )
				local _, _, w, h = region_text:text_rect()
				region_text:set_size( w, h )
				
				if region_text_data.title_id then
					region_text:set_position( self._region_locations[ #self._region_locations ].object:left(), self._region_locations[ #self._region_locations ].object:bottom() - 5 )
				else
					region_text:set_center( x, y )
				end
				
				table.insert( self._region_locations, { object=region_text, size=region_text:font_size() } )
			end
		end
	end
	
	if Application:production_build() and tweak_data.gui.crime_net.debug_options.regions then
		for _, data in ipairs( tweak_data.gui.crime_net.locations ) do
			local location = data[1]
			if location and location.dots then
				for _, dot in ipairs( location.dots ) do
					self._region_panel:rect( { w=1, h=1, color=Color.red, x=dot[1] / tw * self._map_size_w * self._zoom, y=dot[2] / th * self._map_size_h * self._zoom, halign="scale", valign="scale", layer=1000 } )
				end
			end
		end
	end
	
	--[[
	if Application:production_build() and tweak_data.gui.crime_net.debug_options.regions then
		regions = tweak_data.gui.crime_net.locations
		for _, region_data in ipairs( regions ) do
			local region = region_data[1]
			xs = region[1]
			ys = region[2]
			num = math.min( #xs, #ys )
			
			vectors = {}
			my_polyline = self._region_panel:polyline( { line_width=2, alpha=0.5, layer=2, closed=true, blend_mode="add", halign="scale", valign="scale", color=Color.red } )
			for i=1, num do
				table.insert( vectors, Vector3( xs[i] / tw * self._map_size_w * self._zoom, ys[i] / th * self._map_size_h * self._zoom, 0 ) )
			end
			my_polyline:set_points( vectors )
		end
	end]]
end

function CrimeNetGui:update(t, dt)
	if Global.debug_cn_locations and Application:production_build() and is_win32 then
		self._prev_loc = self._prev_loc or {}
		for i, d in pairs(self._locations[1][1].dots) do
			if d[3] and not self._prev_loc[i] then
				Application:debug("Location taken:", i, d[1], d[2])
			elseif not d[3] and self._prev_loc[i] then
				Application:debug("Location removed:", i)
			end
			self._prev_loc[i] = d[3]
		end
	end
	
	local x = (self._fullscreen_panel:child( "cross_indicator_v1" ):x() + self._fullscreen_panel:child( "cross_indicator_v2" ):x()) / 2
	local y = (self._fullscreen_panel:child( "cross_indicator_h1" ):y() + self._fullscreen_panel:child( "cross_indicator_h2" ):y()) / 2
	
	x = string.format( "%.1f", x )
	y = string.format( "%.1f", y )
	local zoom_string = string.format( "%.2f", self._zoom )
	self._panel:child("map_coord_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_mapcoords", {zoom=zoom_string, x=x, y=y} ) ) )
	
	--local num_jobs = -4
	
	--for i, d in pairs( self._jobs ) do
		--num_jobs = num_jobs + 1
	--end
	--[[
	
	
	local friends = (is_win32 and Steam:logged_on() and Steam:friends()) or {}				-- TODO: need to get friends for all platforms
	local num_friends_playing = 0
	
	for _, friend in ipairs( friends ) do
		if( friend:playing_this() ) then
			num_friends_playing = num_friends_playing + 1
		end
	end
	]]--
	--local num_jobs_string = string.format( "%03d", num_jobs )
	--local num_friends_playing_string = string.format( "%03d", num_friends_playing )
	--self._panel:child("num_contracts_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_num_contracts", {contracts=num_jobs_string, friends=num_friends_playing_string} ) ) )
	
	--self._panel:child( "cyber_text" ):set_y( 0 - math.mod( math.floor( Application:time() )*20, self._panel:child( "cyber_text" ):line_height() * 10 ) )
	
	
	self._rasteroverlay:set_texture_rect(0, -math.mod(Application:time() * 5, 32), 32, 640)
	if self._released_map then
		self._released_map.dx = math.lerp(self._released_map.dx, 0, dt * 2)
		self._released_map.dy = math.lerp(self._released_map.dy, 0, dt * 2)
		self:_set_map_position(self._released_map.dx, self._released_map.dy)
		if self._map_panel:x() >= -5 or -5 <= self._fullscreen_panel:w() - self._map_panel:right() then
			self._released_map.dx = 0
		end
		if -5 <= self._map_panel:y() or -5 <= self._fullscreen_panel:h() - self._map_panel:bottom() then
			self._released_map.dy = 0
		end
		self._released_map.t = self._released_map.t - dt
		if 0 > self._released_map.t then
			self._released_map = nil
		end
	end
	if not self._grabbed_map then
		local speed = 5
		if self._map_panel:x() > -self:_get_pan_panel_border() then
			local mx = math.lerp(0, -self:_get_pan_panel_border() - self._map_panel:x(), dt * speed)
			self:_set_map_position(mx, 0)
		end
		if self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			local mx = math.lerp(0, self:_get_pan_panel_border() - (self._map_panel:right() - self._fullscreen_panel:w()), dt * speed)
			self:_set_map_position(mx, 0)
		end
		if self._map_panel:y() > -self:_get_pan_panel_border() then
			local my = math.lerp(0, -self:_get_pan_panel_border() - self._map_panel:y(), dt * speed)
			self:_set_map_position(0, my)
		end
		if self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			local my = math.lerp(0, self:_get_pan_panel_border() - (self._map_panel:bottom() - self._fullscreen_panel:h()), dt * speed)
			self:_set_map_position(0, my)
		end
	end
	if not managers.menu:is_pc_controller() and managers.mouse_pointer:mouse_move_x() == 0 and managers.mouse_pointer:mouse_move_y() == 0 then
		local closest_job
		local closest_dist = 100000000
		local closest_job_x, closest_job_y = 0, 0
		local mouse_pos_x, mouse_pos_y = managers.mouse_pointer:modified_mouse_pos()
		local job_x, job_y
		local dist = 0
		local x, y
		for id, job in pairs(self._jobs) do
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
			x = job_x - mouse_pos_x
			y = job_y - mouse_pos_y
			dist = x * x + y * y
			if closest_dist > dist then
				closest_job = job
				closest_dist = dist
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
		if closest_job then
			closest_dist = math.sqrt(closest_dist)
			if closest_dist < self._tweak_data.controller.snap_distance then
				managers.mouse_pointer:force_move_mouse_pointer(math.lerp(mouse_pos_x, closest_job_x, dt * self._tweak_data.controller.snap_speed) - mouse_pos_x, math.lerp(mouse_pos_y, closest_job_y, dt * self._tweak_data.controller.snap_speed) - mouse_pos_y)
			end
		end
	end
	for index, special_contract in ipairs(tweak_data.gui.crime_net.special_contracts) do
		if self._jobs[special_contract.id] then
			self:update_job(special_contract.id, t, dt)
		end
	end
end