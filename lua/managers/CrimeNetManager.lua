if not restoration.Options:GetValue("HUD/UI/Crimenet") then return end

local is_win32 = SystemInfo:platform() == Idstring("WIN32")
local is_ps3 = SystemInfo:platform() == Idstring("PS3")
local is_x360 = SystemInfo:platform() == Idstring("X360")
local is_xb1 = SystemInfo:platform() == Idstring("XB1")
local is_ps4 = SystemInfo:platform() == Idstring("PS4")

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
	
	local num_contracts_text = self._panel:text( { name="num_contracts_text", text=managers.localization:text("cn_menu_num_contracts", {contracts="", friends=""}), align="left", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=28 } )
	self:make_fine_text( num_contracts_text )
	num_contracts_text:set_left( 15 )
	num_contracts_text:set_top( 15 )
	
	local num_contracts_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = num_contracts_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	num_contracts_text_bg:set_left( num_contracts_text:left()-5 )
	num_contracts_text_bg:set_top( num_contracts_text:top()-5 )
	
	num_contracts_text:set_w( num_contracts_text_bg:w() )
	
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
	local job_plan_loud_icon, job_plan_loud_text, job_plan_stealth_icon, job_plan_stealth_text

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

	local function mul_to_procent_string(multiplier)
		local pro = math.round(multiplier * 100)
		local procent_string
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
	
	local crime_net_text = self._panel:text( { name="crime_net_text", text=managers.localization:text("menu_crimenet"), align="right", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_large_font_size, font=tweak_data.menu.pd2_large_font, color=tweak_data.screen_colors.text, layer=28 } )
	self:make_fine_text( crime_net_text )
	crime_net_text:set_right( self._panel:w() - 15 )
	crime_net_text:set_top( 15 )
	
	local crime_net_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = crime_net_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	crime_net_text_bg:set_right( crime_net_text:right()+5 )
	crime_net_text_bg:set_top( crime_net_text:top()-5 )

	self._map_size_w = 2048
	self._map_size_h = 1024
	
	self._panel:text( { name = "cyber_text", text = "92839429043203489320489541458861681864561321638433203489320489023489023480915134789321321864891392392839429043203489320489023489029283942904320348932048902341651861681890234809239283942904320348932048902348902348092392839429043203489320489023489023480923348092348902928394290432034893204890234890234809239283942904320348932048902348902348092392839429043203489323489023480923",
							wrap = true, x = 20, y = 20, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, color = Color.white:with_alpha( 0.2 ), layer = 1, visible = true, w = 60 } )
	local _,_,_,h = self._panel:child( "cyber_text" ):text_rect()
	self._panel:child( "cyber_text" ):set_h( h )
	
	self._panel:text( { name = "text_indicator1", text = "LT: 100.566", x = 0, y = 0, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	self._panel:text( { name = "text_indicator2", text = "LT: 100.566", x = 0, y = 0, align="right", halign="right", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	
	self._panel:bitmap( { name="cross_indicator1", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ) } )
	self._panel:bitmap( { name="cross_indicator2", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 90 } )
	self._panel:bitmap( { name="cross_indicator3", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 180 } )
	self._panel:bitmap( { name="cross_indicator4", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 270 } )
	
	self._panel:rect( { name="v_rect", color = Color.white:with_alpha( 0.05 ), w = 100, h = self._panel:h() - 16, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator2", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = self._panel:h() - 2 - 8, layer = 5 } ):hide()
	self._panel:rect( { name="h_rect", color = Color.white:with_alpha( 0.05 ), w = self._panel:w() - 16, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator2", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = self._panel:w() - 2 - 8, y = 0, layer = 5 } ):hide()
	
	-- self._panel:rect( { color = Color.red, w = 5, h = 5, x = self._panel:w()/2, y = self._panel:h()/2, layer = 10 } )

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
	local start_position

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

--[[ TODO update function to work with current
function CrimeNetManager:_find_online_games_win32( friends_only )
	local f = function( info )
		-- print( "info in function" )
		-- print( inspect( info ) )
		-- print( inspect( info.room_list ) )
		managers.network.matchmake:search_lobby_done()
		
		local room_list = info.room_list
		local attribute_list = info.attribute_list
		
		local dead_list = {}
		for id,_ in pairs( self._active_server_jobs ) do
			dead_list[ id ] = true
		end	
		
		for i,room in ipairs( room_list ) do
			local name_str = tostring( room.owner_name )
			local attributes_numbers = attribute_list[ i ].numbers
			local attributes_mutators = attribute_list[i].mutators
			-- print( "managers.network.matchmake:is_server_ok", managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) )
			if managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) then
				-- print( "room.room_id", type( room.room_id ) ) 
				dead_list[ room.room_id ] = nil
				local host_name = name_str
				-- print( "attributes_numbers[ 1 ]", attributes_numbers[ 1 ] )
				
				local level_id = tweak_data.levels:get_level_name_from_index( attributes_numbers[ 1 ]%1000 )
				local name_id = level_id and tweak_data.levels[ level_id ] and tweak_data.levels[ level_id ].name_id
				local level_name = name_id and managers.localization:text( name_id ) or "LEVEL NAME ERROR"
				local difficulty_id = attributes_numbers[2]
				local difficulty = tweak_data:index_to_difficulty( difficulty_id )
				local job_id = tweak_data.narrative:get_job_name_from_index( math.floor(attributes_numbers[1]/1000) )
				
				local kick_option = attributes_numbers[8]
				local job_plan = attributes_numbers[10]
				local drop_in = attributes_numbers[6]
				local permission = attributes_numbers[3]
				local min_level = attributes_numbers[7]

				local state_string_id = tweak_data:index_to_server_state( attributes_numbers[4] )
				local state_name = state_string_id and managers.localization:text( "menu_lobby_server_state_"..state_string_id ) or "blah"
				local state = attributes_numbers[4]
				local num_plrs = attributes_numbers[5]
				
				
				local is_friend = false
				
				if Steam:logged_on() and Steam:friends() then
					for _, friend in ipairs( Steam:friends() ) do
						if friend:id() == room.owner_id then
							is_friend = true
							break
						end
					end
				end
				
				if name_id then -- Check that the tweak data for the level exists
					if not self._active_server_jobs[ room.room_id ] then
						if (table.size( self._active_jobs ) + table.size( self._active_server_jobs )) < tweak_data.gui.crime_net.job_vars.total_active_jobs then
							self._active_server_jobs[ room.room_id ] =  { added = false, alive_time = 0 }
							-- print( "ADD", name_str )
							-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
							-- self:_crimenet_gui():add_server_job( { id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name } )
							managers.menu_component:add_crimenet_server_job( { room_id = room.room_id, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						end
					else
						managers.menu_component:update_crimenet_server_job( { room_id = room.room_id, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						-- print( "Found same, need update", name_str )
						-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
					end
				end
		
						local item = new_node:item( room.room_id )
						if not item then -- ..i ) then
							print( "ADD", name_str )
							local params = 
							{
								name		= room.room_id, --..i,
								text_id		= name_str,
								room_id		= room.room_id,
								-- columns		= { "" .. j, host_data.host_name, level_name, state_name }, -- host_rpc:to_string() },
								columns		= { string.upper( host_name ), string.upper( level_name ), string.upper( state_name ), tostring( num_plrs ) .. "/4 " },
								-- rpc			= host_rpc,
								level_name  = level_id, -- host_data.level_name,
								real_level_name = level_name,
								level_id	= level_id,
								state_name	= state_name,
								difficulty	= difficulty,
								host_name	= host_name,
								state		= state,
								num_plrs	= num_plrs,
								callback	= "connect_to_lobby",
								localize	= "false"
							}
							
							local new_item = new_node:create_item( { type = "ItemServerColumn" }, params )
							new_node:add_item( new_item )
						else
							if item:parameters().real_level_name ~= level_name then
								item:parameters().columns[2] = string.upper( level_name )
								item:parameters().level_name = level_id
								item:parameters().real_level_name = level_name
							end
							
							if item:parameters().state ~= state then
								item:parameters().columns[3] = state_name
								item:parameters().state = state
								item:parameters().state_name = state_name
							end
							
							if item:parameters().difficulty ~= difficulty then
								item:parameters().difficulty = difficulty
							end
							
							if item:parameters().room_id ~= room.room_id then
								item:parameters().room_id = room.room_id
							end
							
							if item:parameters().num_plrs ~= num_plrs then
								item:parameters().num_plrs = num_plrs
								item:parameters().columns[4] = tostring( num_plrs ) .. "/4 "
							end
						end
			end
		end
	
		for id,_ in pairs( dead_list ) do
			-- print( "Remove a dead", id )
			self._active_server_jobs[ id ] = nil
			-- self:_crimenet_gui():remove_job( id )
			managers.menu_component:remove_crimenet_gui_job( id )
		end
		
		-- print( "After update", inspect( self._active_server_jobs ) )
		-- self._active_server_jobs
		-- managers.menu:active_menu().logic:refresh_node( "play_online", true, info, friends_only )
	end
	
	managers.network.matchmake:register_callback( "search_lobby", f )
	managers.network.matchmake:search_lobby( friends_only )

	local usrs_f = function( success, amount )
		print( "usrs_f", success, amount )
		
		if success then
			managers.menu_component:set_crimenet_players_online( amount )
		end
	end
	
	Steam:sa_handler():concurrent_users_callback( usrs_f )
	Steam:sa_handler():get_concurrent_users()
end
--]]

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

function CrimeNetGui:_create_locations()
	self._locations = deep_clone( self._tweak_data.locations ) or {}
	tweak_data.gui:create_narrative_locations( self._locations )
	self:_create_polylines()
	
	self:_add_location( "vlad", { x=359, y=711, radius=60, type="circle" } )
	self:_add_location( "vlad", { x=1039, y=777, w=162, h=116, type="box" } )
	
	
	self:_add_location( "the_elephant", { x=930, y=271, radius=20, type="circle" } )
	self:_add_location( "the_elephant", { x=1313, y=271, radius=20, type="circle" } )
	self:_add_location( "the_elephant", { x=1120, y=355, radius=10, type="circle" } )
	self:_add_location( "the_elephant", { x=745, y=524, radius=13, type="circle" } )
	
	
	self:_add_location( "hector", { x=1545, y=51, w=358, h=354, type="box" } )
	self:_add_location( "hector", { x=255, y=63, w=397, h=270, type="box" } )
	self:_add_location( { text = "DOWNTOWN", x = 1300/(2048*1.5)*self._map_size_w, y = 450/(1024*1.1)*self._map_size_h } )
	self:_add_location( { text = "THE WHITEHOUSE", x = 1550/(2048*1.5)*self._map_size_w, y = 940/(1024*1.1)*self._map_size_h } )
	self:_add_location( { text = "UNION STATION", x = 2100/(2048*1.5)*self._map_size_w, y = 600/(1024*1.1)*self._map_size_h } )
end

function CrimeNetGui:_add_location( contact, data )
	do return end
	self._locations[contact] = self._locations[contact] or {}
	table.insert( self._locations[contact], data ) 
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
	
	local num_jobs = -4
	
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
	
	self._panel:child( "cyber_text" ):set_y( 0 - math.mod( math.floor( Application:time() )*20, self._panel:child( "cyber_text" ):line_height() * 10 ) )
	
	
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

function CrimeNetGui:set_players_online( players )
	local players_string = managers.money:add_decimal_marks_to_string( string.format( "%.3d", players ) )
end

function CrimeNetGui:toggle_legend()
	managers.menu_component:post_event( "menu_enter" )
end

function CrimeNetGui:mouse_pressed( o, button, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	
	-- if not self._panel:inside( x, y ) then
	-- 	return
	-- end
	--[[
	if self._text_box and self._text_box:visible() then
		if self:mouse_button_click( button ) then
			for i,panel in ipairs( self._text_box._text_box_buttons_panel:children() ) do
				if panel.child and panel:inside( x, y ) then
					if self._text_box:get_focus_button() == 1 then
						self:start_job()
					end
					return true
				end
			end
			
			if self._text_box:check_close( x, y ) then
				self._text_box:set_visible( false )
				for id,job in pairs( self._jobs ) do
					job.expanded = false
				end
				return true
			end
			if self._text_box:check_grab_scroll_bar( x, y ) then
				return true
			end
		elseif self:button_wheel_scroll_down( button ) then
			if self._text_box:mouse_wheel_down( x, y ) then
				return true
			end
		elseif self:button_wheel_scroll_up( button ) then
			if self._text_box:mouse_wheel_up( x, y ) then
				return true
			end
		end
	end
	]]
	
	if self:mouse_button_click( button ) then
		if( self._panel:child("back_button"):inside( x, y ) ) then
			managers.menu:back()
			return
		end
		if( self._panel:child("legends_button"):inside( x, y ) ) then
			self:toggle_legend()
			return
		end
		if self._panel:child("filter_button") and self._panel:child("filter_button"):inside( x, y ) then
			managers.menu_component:post_event( "menu_enter" )
			managers.menu:open_node( "crimenet_filters", {} )
			return
		end
		
		if self:check_job_pressed( x, y ) then
			return true
		end
		
		
		if self._panel:inside( x, y ) then
			self._released_map = nil
			-- self._grabbed_map = { x = x - self._pan_panel:x(), y = y - self._pan_panel:y() } 
			-- self._grabbed_map = { x = -self._panel:x() + x, y = -self._panel:y() + y }
			self._grabbed_map = { x = x, y = y, dirs = {} }
		end
		
	elseif self:button_wheel_scroll_down( button ) then
		if( self._one_scroll_out_delay ) then
			self._one_scroll_out_delay = nil
			-- return true		-- disabling for now
		end
		self:_set_zoom( "out", x, y )
		return true
	elseif self:button_wheel_scroll_up( button ) then
		if( self._one_scroll_in_delay ) then
			self._one_scroll_in_delay = nil
			-- return true		-- disabling for now
		end
		self:_set_zoom( "in", x, y )
		return true
	end
	
	return true
end
--[[
function CrimeNetGui:start_job()
	for id,job in pairs( self._jobs ) do
		if job.expanded then
			if job.preset_id then
				-- MenuCallbackHandler:start_job( job.job_id )
				MenuCallbackHandler:start_job( job )
				self:remove_job( job.preset_id )
				return true
			else
				print( "Is a server, don't want to join", id, job.side_panel:child("host_name"):text() == "WWWWWWWWWWWWµQQW" )
				-- if job.host_name:text() == "WWWWWWWWWWWWµQQW" or job.host_name:text() == "Gaspode" then
					managers.network.matchmake:join_server_with_check( id )
				-- end
				return
			end
		end
	end
end
]]
function CrimeNetGui:mouse_released( o, button, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	if( not self:mouse_button_click( button ) ) then
		return
	end

	if self._grabbed_map and #self._grabbed_map.dirs > 0 then
		local dx, dy = 0, 0
		for _,values in ipairs( self._grabbed_map.dirs ) do
			dx = dx + values[1]
			dy = dy + values[2]
		end
		dx = dx/#self._grabbed_map.dirs
		dy = dy/#self._grabbed_map.dirs
				
		self._released_map = { t = 2, dx = dx, dy = dy }
		self._grabbed_map = nil
	end 
		
	-- return self._text_box:release_scroll_bar()
end
--[[
function CrimeNetGui:_get_pan_panel_border()
	return self._pan_panel_border * self._zoom
end
]]
function CrimeNetGui:_set_map_position( mx, my )
	--[[
	local x = math.clamp( self._map_panel:x() + mx, self._fullscreen_panel:w() - self._map_panel:w(), 0 ) 
	local y = math.clamp( self._map_panel:y() + my, self._fullscreen_panel:h() - self._map_panel:h(), 0 )
	
	self._pan_panel:set_position( x, y )]]
	
	-- local x = self._map_panel:x() + mx
	-- local y = self._map_panel:y() + my
	
	local x = self._map_x + mx
	local y = self._map_y + my
	
	self._pan_panel:set_position( x, y )
	if self._pan_panel:left() > 0 then
		self._pan_panel:set_left( 0 )
	end
	
	if self._pan_panel:right() < self._fullscreen_panel:w() then
		self._pan_panel:set_right( self._fullscreen_panel:w() )
	end
	
	if self._pan_panel:top() > 0 then
		self._pan_panel:set_top( 0 )
	end
	
	if self._pan_panel:bottom() < self._fullscreen_panel:h() then
		self._pan_panel:set_bottom( self._fullscreen_panel:h() )
	end
	self._map_x, self._map_y = self._pan_panel:position()
	
	self._pan_panel:set_position( math.round(self._map_x), math.round(self._map_y) )
	x, y = self._map_x, self._map_y
	
	self._map_panel:set_shape( self._pan_panel:shape() )
	self._pan_panel:set_position( managers.gui_data:full_16_9_to_safe( x, y ) )
	
	
	local full_16_9 = managers.gui_data:full_16_9_size()
	
	local w_ratio = self._fullscreen_panel:w() / self._map_panel:w()
	local h_ratio = self._fullscreen_panel:h() / self._map_panel:h()
	local panel_x = -(self._map_panel:x() / self._fullscreen_panel:w()) * w_ratio
	local panel_y = -(self._map_panel:y() / self._fullscreen_panel:h()) * h_ratio
	
	
	local cross_indicator_h1 = self._fullscreen_panel:child( "cross_indicator_h1" )
	local cross_indicator_h2 = self._fullscreen_panel:child( "cross_indicator_h2" )
	local cross_indicator_v1 = self._fullscreen_panel:child( "cross_indicator_v1" )
	local cross_indicator_v2 = self._fullscreen_panel:child( "cross_indicator_v2" )
	
	--[[local line_indicator_h1 = self._fullscreen_panel:child( "line_indicator_h1" )
	local line_indicator_h2 = self._fullscreen_panel:child( "line_indicator_h2" )
	local line_indicator_v1 = self._fullscreen_panel:child( "line_indicator_v1" )
	local line_indicator_v2 = self._fullscreen_panel:child( "line_indicator_v2" )]]
		
	cross_indicator_h1:set_y( full_16_9.convert_y + (self._panel:h() * panel_y) )
	cross_indicator_h2:set_bottom( self._fullscreen_panel:child( "cross_indicator_h1" ):y() + (self._panel:h() * h_ratio) )
	cross_indicator_v1:set_x( full_16_9.convert_x + (self._panel:w() * panel_x) )
	cross_indicator_v2:set_right( self._fullscreen_panel:child( "cross_indicator_v1" ):x() + (self._panel:w() * w_ratio) )
	
	--[[line_indicator_h1:set_position( cross_indicator_v1:x(), cross_indicator_h1:y() )
	line_indicator_h2:set_position( cross_indicator_v1:x(), cross_indicator_h2:y() )
	line_indicator_v1:set_position( cross_indicator_v1:x(), cross_indicator_h1:y() )
	line_indicator_v2:set_position( cross_indicator_v2:x(), cross_indicator_h1:y() )
	
	line_indicator_h1:set_w( cross_indicator_v2:x() - cross_indicator_v1:x() )
	line_indicator_h2:set_w( cross_indicator_v2:x() - cross_indicator_v1:x() )
	line_indicator_v1:set_h( cross_indicator_h2:y() - cross_indicator_h1:y() )
	line_indicator_v2:set_h( cross_indicator_h2:y() - cross_indicator_h1:y() )]]
end

function CrimeNetGui:mouse_moved( o, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	-- self._pan_panel:child( "test" ):set_position( -self._panel:x() - self._pan_panel:x() + x, -self._panel:y() - self._pan_panel:y() + y )
	
	if managers.menu:is_pc_controller() then
		if( self._panel:child("back_button"):inside( x, y ) ) then
			if not self._back_highlighted then
				self._back_highlighted = true
				self._panel:child("back_button"):set_color( tweak_data.screen_color_yellow_selected )
				managers.menu_component:post_event( "highlight" )
			end
			return false, "arrow"
		elseif self._back_highlighted then
			self._back_highlighted = false
			self._panel:child("back_button"):set_color( tweak_data.screen_color_yellow )
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
			mx = math.lerp( mx, 0, 1 - self._map_panel:x()/-self:_get_pan_panel_border() )
		end
		if right and self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			mx = math.lerp( mx, 0, 1 - (self._fullscreen_panel:w() - self._map_panel:right())/-self:_get_pan_panel_border() )
		end
		if up and self._map_panel:y() > -self:_get_pan_panel_border() then
			my = math.lerp( my, 0, 1 - self._map_panel:y()/-self:_get_pan_panel_border() )
		end
		if down and self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			my = math.lerp( my, 0, 1 - (self._fullscreen_panel:h() - self._map_panel:bottom())/-self:_get_pan_panel_border() )
		end
		
		table.insert( self._grabbed_map.dirs, 1, { mx, my } )
		self._grabbed_map.dirs[ 10 ] = nil
		
		self:_set_map_position( mx, my )
				
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
	
	for id, job in pairs( self._jobs ) do
		local inside = (job.marker_panel:child("select_panel"):inside( x, y ) and self._panel:inside( x, y ))
		inside_any_job = inside_any_job or inside
		
		if( inside ) then
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
		
			math_x = job_x - x
			math_y = job_y - y
			
			dist = math_x * math_x + math_y * math_y
			
			if( dist < closest_dist ) then
				closest_job = job
				closest_dist = dist
				
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
	end
	
	for id,job in pairs( self._jobs ) do
		local inside = ((job == closest_job) and 1) or (inside_any_job and 2) or 3
		
		self:update_job_gui( job, inside )
	end
	-- local inside_any_job = self:check_job_mouse_over( x, y )
	
	--[[
	local inside_any_job = false
	for id,job in pairs( self._jobs ) do
		local inside = (job.marker_panel:inside( x, y ) and self._panel:inside( x, y ))
		inside_any_job = inside_any_job or inside
		if job.mouse_over ~= inside then
			job.mouse_over = inside
			job.marker_panel:set_alpha(job.mouse_over and 1 or 0.8 )
			job.stars_panel:set_alpha( job.mouse_over and 1 or 0.8 )
			
			if( job.peers_panel ) then
				job.peers_panel:set_alpha( job.mouse_over and 1 or 0.8 )
			end
			
			local animate_show = function( o )
				local start_alpha = o:alpha()
				
				over( 0.3 * (1-start_alpha), function(p) o:set_alpha( math.lerp( start_alpha, 1, p ) ) end )
			end
			local animate_hide = function( o )
				local start_alpha = o:alpha()
				
				over( 0.3 * (start_alpha), function(p) o:set_alpha( math.lerp( start_alpha, 0, p ) ) end )
			end
			job.host_name:stop()
			job.info_text:stop()
			job.host_name:animate( job.mouse_over and animate_hide or animate_show )
			job.info_text:animate( job.mouse_over and animate_show or animate_hide )
			
			
			-- job.marker_rect:set_color( job.marker_rect:color():with_alpha( job.mouse_over and 0.9 or 0.5 ) )
			-- job.host_name:set_visible( job.mouse_over )
			-- job.stars_panel:set_visible( job.mouse_over  )
			-- job.info_panel:set_visible( job.mouse_over )
		end
		if job.expanded then
			-- if job.mouse_over_info ~= job.info_panel:inside( x, y ) then
				-- job.mouse_over_info = job.info_panel:inside( x, y )
				-- job.info_rect:set_color( Color.blue:with_alpha( job.mouse_over_info and 0.9 or 0.5 ) )
					-- job.info_panel:set_visible( job.mouse_over )
			-- end
		end
	end
	]]
	-- print( "CrimeNetGui:mouse_moved" )
	
	if not managers.menu:is_pc_controller() then		
		local to_left 	= x
		local to_right 	= self._panel:w() - x - 19
		local to_top 		= y
		local to_bottom	= self._panel:h() - y - 23
		
		local panel_border = self._pan_panel_border
		to_left 	= 1 - math.clamp( to_left   / panel_border, 0, 1 )
		to_right 	= 1 - math.clamp( to_right  / panel_border, 0, 1 )
		to_top 		= 1 - math.clamp( to_top    / panel_border, 0, 1 )
		to_bottom	= 1 - math.clamp( to_bottom / panel_border, 0, 1 )
		
		-- print( "to_left", to_left, "to_right", to_right, "to_top", to_top, "to_bottom", to_bottom )
		-- print( managers.mouse_pointer:mouse_move_x(), managers.mouse_pointer:mouse_move_y() )
		
		local mouse_pointer_move_x = managers.mouse_pointer:mouse_move_x()
		local mouse_pointer_move_y = managers.mouse_pointer:mouse_move_y()
		
		local mp_left 	= -math.min( 0, mouse_pointer_move_x )
		local mp_right 	= -math.max( 0, mouse_pointer_move_x )
		local mp_top 		= -math.min( 0, mouse_pointer_move_y )
		local mp_bottom = -math.max( 0, mouse_pointer_move_y )
		
		local push_x = mp_left * to_left + mp_right * to_right
		local push_y = mp_top * to_top + mp_bottom * to_bottom
		
		if( push_x ~= 0 or push_y ~= 0 ) then
			self:_set_map_position( push_x, push_y )
		end
		
		--[[
		if self._panel:world_left() - x > -self._pan_panel_border then
			local mx = math.lerp( 0, 1 - (x - self._panel:world_left()) / self._pan_panel_border, speed )
			self:_set_map_position( mx, 0 )
		end
		if self._panel:world_right() - x < self._pan_panel_border then
			local mx = math.lerp( 0, 1 - (self._panel:world_right() - x) / self._pan_panel_border, speed )
			self:_set_map_position( -mx, 0 )
		end
		if self._panel:world_top() - y > -self._pan_panel_border then
			local my = math.lerp( 0, 1 - (y - self._panel:world_top()) / self._pan_panel_border, speed )
			self:_set_map_position( 0, my )
		end
		if self._panel:world_bottom() - y < self._pan_panel_border then
			local my = math.lerp( 0, 1 - (self._panel:world_bottom() - y) / self._pan_panel_border, speed )
			self:_set_map_position( 0, -my )
		end]]
		
	end
	
	if inside_any_job then
		return false, "arrow"
	end
	
	if self._panel:inside( x, y ) then		
		return false, "hand"
	end	
end

function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local level_id = data.level_id
	local level_data = tweak_data.levels[level_id]
	local narrative_data = data.job_id and tweak_data.narrative:job_data(data.job_id)
	local is_special = type == "special" or type == "crime_spree"
	local is_server = type == "server"
	local is_crime_spree = type == "crime_spree"
	local is_professional = narrative_data and narrative_data.professional
	local got_job = data.job_id and true or false
	local x = fixed_x
	local y = fixed_y
	local location = fixed_location
	if is_special then
		x = data.x
		y = data.y
		if x and y then
			local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
			local th = math.max(self._map_panel:child("map"):texture_height(), 1)
			x = math.round(x / tw * self._map_size_w)
			y = math.round(y / th * self._map_size_h)
		end
	end
	if not x and not y then
		x, y, location = self:_get_job_location(data)
	end
	if location and location[3] then
		Application:error("[CrimeNetGui:_create_job_gui] Location already taken!", x, y)
	end
	local color = Color.white
	local friend_color = tweak_data.screen_colors.friend_color
	local regular_color = tweak_data.screen_colors.regular_color
	local pro_color = tweak_data.screen_colors.pro_color
	local side_panel = self._pan_panel:panel({layer = 26, alpha = 0})
	local heat_glow
	local stars_panel = side_panel:panel({
		name = "stars_panel",
		layer = -1,
		visible = true,
		w = 100
	})
	local num_stars = 0
	local star_size = 16
	local job_num = 0
	local job_cash = 0
	local difficulty_name = side_panel:text({
		name = "difficulty_name",
		text = "",
		vertical = "center",
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local one_down_label = one_down_active and side_panel:text({
		name = "one_down_label",
		vertical = "center",
		blend_mode = "add",
		layer = 0,
		text = managers.localization:to_upper_text("menu_one_down"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.one_down
	})
	local heat_name = side_panel:text({
		name = "heat_name",
		text = "",
		vertical = "center",
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local got_heat = false
	local range_colors = {}
	local text_string = managers.localization:to_upper_text("menu_exp_short")
	local mul_to_procent_string = function(multiplier)
		local pro = math.round(multiplier * 100)
		local procent_string
		if pro == 0 and multiplier ~= 0 then
			procent_string = string.format("%0.2f", math.abs(multiplier * 100))
		else
			procent_string = tostring(math.abs(pro))
		end
		return (multiplier < 0 and " -" or " +") .. procent_string .. "%"
	end

	local got_heat_text = false
	local has_ghost_bonus = managers.job:has_ghost_bonus()
	if has_ghost_bonus then
		do
			local ghost_bonus_mul = managers.job:get_ghost_bonus()
			local job_ghost_string = mul_to_procent_string(ghost_bonus_mul)
			local s = utf8.len(text_string)
			text_string = text_string .. job_ghost_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.ghost_color
			})
			got_heat_text = true
		end
		local skill_bonus = managers.player:get_skill_exp_multiplier()
		skill_bonus = skill_bonus - 1
		if skill_bonus > 0 then
			local s = utf8.len(text_string)
			local skill_string = mul_to_procent_string(skill_bonus)
			text_string = text_string .. skill_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.skill_color
			})
			got_heat_text = true
		end
		local infamy_bonus = managers.player:get_infamy_exp_multiplier()
		infamy_bonus = infamy_bonus - 1
		if infamy_bonus > 0 then
			local s = utf8.len(text_string)
			local infamy_string = mul_to_procent_string(infamy_bonus)
			text_string = text_string .. infamy_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.lootdrop.global_values.infamy.color
			})
			got_heat_text = true
		end
		local limited_bonus = tweak_data:get_value("experience_manager", "limited_bonus_multiplier") or 1
		limited_bonus = limited_bonus - 1
		if limited_bonus > 0 then
			local s = utf8.len(text_string)
			local limited_string = mul_to_procent_string(limited_bonus)
			text_string = text_string .. limited_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.button_stage_2
			})
			got_heat_text = true
		end
	end
	local job_heat = managers.job:get_job_heat(data.job_id) or 0
	local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1
	if data.job_id then
		local x = 0
		local y = 0
		local job_stars = math.ceil( tweak_data.narrative.jobs[ data.job_id ].jc/10 )
		local difficulty_stars = data.difficulty_id-2
		local job_and_difficulty_stars = job_stars
		local start_difficulty = 1
		local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or 6
		for i = 1, 7 do -- job_stars + difficulty_stars
			stars_panel:bitmap( { texture = "guis/textures/pd2/crimenet_star", x = x, y = y, blend_mode="normal", layer = 0, color=((i>job_stars) and Color.black) or ((i>job_stars) and Color.red) or color  } )
			x = x + 13
			
			num_stars = num_stars + 1
		end
		for i = start_difficulty, num_difficulties do
			stars_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_star",
				x = x,
				y = y,
				w = 12,
				h = 16,
				texture_rect = {
					0,
					0,
					12,
					16
				},
				alpha = i > difficulty_stars and 0.5 or 1,
				blend_mode = i > difficulty_stars and "normal" or "add",
				layer = 0,
				color = i > difficulty_stars and Color.black or Color.red
			})
			x = x + 13
			num_stars = num_stars + 1
		end
		job_num = #tweak_data.narrative:job_chain(data.job_id)
		local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, job_num, data.job_id)
		job_cash = managers.experience:cash_string(math.round(total_payout))
		local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty_id]])
		difficulty_name:set_text(difficulty_string)
		difficulty_name:set_color(difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
		local heat_alpha = math.abs(job_heat) / 100
		local heat_size = 1
		local heat_color = managers.job:get_job_heat_color(data.job_id)
		heat_glow = self._pan_panel:bitmap({
			texture = "guis/textures/pd2/hot_cold_glow",
			layer = 11,
			w = 256 * heat_size,
			h = 256 * heat_size,
			blend_mode = "add",
			color = heat_color,
			alpha = 0
		})
		if job_heat_mul ~= 0 then
			local s = utf8.len(text_string)
			local heat_string = mul_to_procent_string(job_heat_mul)
			text_string = text_string .. heat_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				heat_color
			})
			got_heat = true
			got_heat_text = true
			heat_glow:set_alpha(heat_alpha)
		end
	end
	heat_name:set_text(text_string)
	for i, range in ipairs(range_colors) do
		if i == 1 then
			local s, e, c = unpack(range)
			heat_name:set_range_color(0, e, c)
		else
			heat_name:set_range_color(unpack(range))
		end
	end
	local job_tweak = tweak_data.narrative:job_data(data.job_id)
	local host_string = data.host_name or is_professional and managers.localization:to_upper_text("cn_menu_pro_job") or " "
	local job_string = data.job_id and managers.localization:to_upper_text(job_tweak.name_id) or data.level_name or "NO JOB"
	local contact_string = utf8.to_upper(data.job_id and managers.localization:text(tweak_data.narrative.contacts[job_tweak.contact].name_id)) or "BAIN"
	contact_string = contact_string .. ": "
	local info_string = managers.localization:to_upper_text("cn_menu_contract_short_" .. (job_num > 1 and "plural" or "singular"), {days = job_num, money = job_cash})
	info_string = info_string .. (data.state_name and " / " .. data.state_name or "")
	if is_special then
		job_string = data.name_id and managers.localization:to_upper_text(data.name_id) or ""
		info_string = data.desc_id and managers.localization:to_upper_text(data.desc_id) or ""

		if is_crime_spree then
			if managers.crime_spree:in_progress() then
				info_string = "cn_crime_spree_help_continue"
			else
				info_string = "cn_crime_spree_help_start"
			end

			info_string = managers.localization:to_upper_text(info_string) or ""
		end
	end
	local job_plan_icon

	if is_server and data.job_plan and data.job_plan ~= -1 then
		local texture = data.job_plan == 1 and "guis/textures/pd2/cn_playstyle_loud" or "guis/textures/pd2/cn_playstyle_stealth"
		job_plan_icon = side_panel:bitmap({
			name = "job_plan_icon",
			h = 16,
			w = 16,
			alpha = 1,
			blend_mode = "normal",
			y = 2,
			x = 0,
			layer = 0,
			texture = texture,
			color = Color.white
		})
	end
	local host_name = side_panel:text({
		name = "host_name",
		text = host_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = data.is_friend and friend_color or is_server and regular_color or pro_color,
		blend_mode = "add",
		layer = 0
	})
	local job_name = side_panel:text({
		name = "job_name",
		text = job_string,
		vertical = "center",
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_color_yellow,
		blend_mode = "add",
		layer = 0
	})
	local contact_name = side_panel:text({
		name = "contact_name",
		text = contact_string,
		vertical = "center",
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_color_yellow,
		blend_mode = "add",
		layer = 0
	})
	local info_name = side_panel:text({
		name = "info_name",
		text = info_string,
		vertical = "center",
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_color_yellow,
		blend_mode = "add",
		layer = 0
	})

	if data.mutators then
		job_name:set_color(tweak_data.screen_colors.mutators_color_text)
		contact_name:set_color(tweak_data.screen_colors.mutators_color_text)
		info_name:set_color(tweak_data.screen_colors.mutators_color_text)
	end

	if is_crime_spree or data.is_crime_spree then
		job_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		contact_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		info_name:set_color(tweak_data.screen_colors.crime_spree_risk)

		if is_crime_spree then
			stars_panel:text({
				name = "spree_level",
				vertical = "center",
				blend_mode = "normal",
				layer = 0,
				text = managers.localization:to_upper_text("menu_cs_level", {
					level = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
				}),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.crime_spree_risk
			})
		end
	end

	if data.is_skirmish then
		job_name:set_color(tweak_data.screen_colors.skirmish_color)
	end

	stars_panel:set_w(star_size * math.min(11, #stars_panel:children()))
	stars_panel:set_h(star_size)

	local focus = self._pan_panel:bitmap({
		name = "focus",
		texture = "guis/textures/crimenet_map_circle",
		layer = 10,
		color = color:with_alpha(0.6),
		blend_mode = "add"
	})
	
	do
		local x = job_plan_icon and job_plan_icon:right() + 2 or 0
		local _, _, w, h = host_name:text_rect()
		host_name:set_size(w, h)
		host_name:set_position(x, 0)
		if not is_server then
		end
	end
	local _, _, w, h = job_name:text_rect()
	job_name:set_size(w, h)
	job_name:set_position(0, host_name:bottom() - 2)

	local _, _, w, h = contact_name:text_rect()
	contact_name:set_size(w, h)
	contact_name:set_top(job_name:top())
	contact_name:set_right(0)

	local _, _, w, h = info_name:text_rect()
	info_name:set_size(w, h - 4)
	info_name:set_top(contact_name:bottom() - 4)
	info_name:set_right(0)

	local _, _, w, h = difficulty_name:text_rect()
	difficulty_name:set_size(w, h)
	difficulty_name:set_top(info_name:bottom() - 4)
	difficulty_name:set_right(0)

	local _, _, w, h = heat_name:text_rect()
	heat_name:set_size(w, h - 4)
	heat_name:set_top(difficulty_name:bottom() - 4)
	heat_name:set_right(0)

	if one_down_active then
		local _, _, w, h = one_down_label:text_rect()

		one_down_label:set_size(w, h - 4)
		one_down_label:set_top(difficulty_name:bottom() - 4)
		one_down_label:set_right(0)
	end

	if not got_heat_text then
		heat_name:set_text(" ")
		heat_name:set_w(1)
		heat_name:set_position(0, host_name:bottom() - 4)
	end

	if is_special then
		contact_name:set_text(" ")
		contact_name:set_size(0, 0)
		contact_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif data.is_crime_spree then
		local text = ""

		if tweak_data:server_state_to_index("in_lobby") < data.state then
			local mission_data = managers.crime_spree:get_mission(data.crime_spree_mission)

			if mission_data then
				local tweak = tweak_data.levels[mission_data.level.level_id]
				text = managers.localization:text(tweak and tweak.name_id or "No level")
			else
				text = "No mission ID"
			end
		else
			text = managers.localization:text("menu_lobby_server_state_in_lobby")
		end

		job_name:set_text(utf8.to_upper(text))

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif data.is_skirmish then
		local is_weekly = data.skirmish == SkirmishManager.LOBBY_WEEKLY
		local text = managers.localization:text(is_weekly and "menu_weekly_skirmish" or "menu_skirmish")

		job_name:set_text(utf8.to_upper(text))

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif not got_job then
		job_name:set_text(data.state_name or managers.localization:to_upper_text("menu_lobby_server_state_in_lobby"))
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	end

	stars_panel:set_position(0, job_name:bottom())
	side_panel:set_h(math.round(host_name:h() + job_name:h() + stars_panel:h()))
	side_panel:set_w(300)

	self._num_layer_jobs = (self._num_layer_jobs + 1) % 1
	local marker_panel = self._pan_panel:panel({
		w = 36,
		h = 66,
		layer = 11 + self._num_layer_jobs * 3,
		alpha = 0
	})

	local select_panel = marker_panel:panel({
		name = "select_panel",
		w = 36,
		h = 38,
		x = -2,
		y = 0
	})

	local glow_panel = self._pan_panel:panel({
		w = 960,
		h = 192,
		layer = 10,
		alpha = 0
	})

	local glow_center = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 192,
		h = 192,
		blend_mode = "add",
		alpha = 0.55,
		color = data.pulse_color or is_professional and pro_color or regular_color
	})

	local glow_stretch = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 960,
		h = 75,
		blend_mode = "add",
		alpha = 0.55,
		color = data.pulse_color or is_professional and pro_color or regular_color
	})

	local glow_center_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 175,
		h = 175,
		blend_mode = "normal",
		alpha = 0.7,
		color = Color.black,
		layer = -1
	})

	local glow_stretch_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 990,
		h = 75,
		blend_mode = "normal",
		alpha = 0.75,
		color = Color.black,
		layer = -1
	})

	glow_center:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_center_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)

	if not is_special or not data.icon then
	end
	
	--marker_panel:set_halign( "scale" )	
	--marker_panel:set_valign( "scale" )
	
	--local marker_rect = marker_panel:rect( { color = (is_server and Color( 0.8, 0.8, 0.5) or Color( 0.5, 0.5, 0.8)):with_alpha( 0.5 ) } )
	--local marker_rect = marker_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map_dot", color = (is_server and Color( 1, 1, 0.2) or Color( 0.2, 0.2, 1)):with_alpha( 0.5 ), w = 40, h = 40, x = -4, y = -4 } )
	--local timer_rect = marker_panel:rect( { color = Color.green:with_alpha( 0.5 ) } )
	--local timer_rect = marker_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map_dot", color = Color.green:with_alpha( 0.5 ), w = 40, h = 40, x = -4, y = -4 } )
	
	--local marker_rect = marker_panel:bitmap( { name="marker_rect", texture = "guis/textures/pd2/crimenet_marker", color=color:with_alpha(0.5), w=64, h=64 } )
	
	local marker_dot_texture = (data.icon or "guis/textures/pd2/crimenet_marker_" .. (is_server and "join" or "host")) .. (is_professional and "_pro" or "")
	local marker_dot = marker_panel:bitmap({
		name = "marker_dot",
		texture = marker_dot_texture,
		color = color:with_alpha(0.7),
		w = 32,
		h = 64,
		x = 2,
		y = 2,
		layer = 1
	})

	if is_professional then
		marker_panel:bitmap({
			name = "marker_pro_outline",
			texture = "guis/textures/pd2/crimenet_marker_pro_outline",
			w = 64,
			h = 64,
			x = 0,
			y = 0,
			rotation = 0,
			layer = 0,
			alpha = 1,
			blend_mode = "add"
		})
	end

	if data.mutators then
		marker_dot:set_color(tweak_data.screen_colors.mutators_color)
	end

	if data.is_crime_spree then
		marker_dot:set_color(tweak_data.screen_colors.crime_spree_risk)
	end

	if data.is_skirmish then
		marker_dot:set_color(tweak_data.screen_colors.skirmish_color)
	end

	local timer_rect, peers_panel
	local icon_panel = self._pan_panel:panel({
		layer = 26,
		alpha = 1,
		h = 64,
		w = 18
	})

	if data.job_id and managers.job:is_job_ghostable(data.job_id) then
		local ghost_icon = icon_panel:bitmap({
			name = "ghost_icon",
			texture = "guis/textures/pd2/cn_minighost",
			blend_mode = "add",
			color = tweak_data.screen_colors.ghost_color
		})
		local y = 0
		for i = 1, #icon_panel:children() - 1 do
			y = math.max(y, icon_panel:children()[i]:bottom())
		end
		ghost_icon:set_y(y)
	end

	if one_down_active then
		local one_down_icon = icon_panel:bitmap({
			blend_mode = "add",
			name = "one_down_icon",
			texture = "guis/textures/pd2/cn_mini_onedown",
			rotation = 360,
			color = tweak_data.screen_colors.one_down
		})

		one_down_icon:set_top(side_icons_top)
		one_down_icon:set_right(next_icon_right)

		next_icon_right = next_icon_right - 12
	end

	if is_server then
		peers_panel = self._pan_panel:panel({
			layer = 11 + self._num_layer_jobs * 3,
			visible = true,
			w = 32,
			h = 62,
			alpha = 0
		})
		local cx = 0
		local cy = 0
		for i = 1, 4 do
			cx = 3 + 6 * (i - 1)
			cy = 8
			local player_marker = peers_panel:bitmap({
				name = tostring(i),
				texture = "guis/textures/pd2/crimenet_marker_peerflag",
				w = 8,
				h = 16,
				color = color,
				layer = 2,
				blend_mode = "normal",
				visible = i <= data.num_plrs
			})
			player_marker:set_position(cx, cy)

			if data.mutators then
				player_marker:set_color(tweak_data.screen_colors.mutators_color)
			end

			if data.is_crime_spree then
				player_marker:set_color(tweak_data.screen_colors.crime_spree_risk)
			end

			if data.is_skirmish then
				player_marker:set_color(tweak_data.screen_colors.skirmish_color)
			end
		end

		local kick_none_icon = icon_panel:bitmap({
			name = "kick_none_icon",
			texture = "guis/textures/pd2/cn_kick_marker",
			blend_mode = "add",
			alpha = 0
		})

		local kick_vote_icon = icon_panel:bitmap({
			name = "kick_vote_icon",
			texture = "guis/textures/pd2/cn_votekick_marker",
			blend_mode = "add",
			alpha = 0
		})

		local y = 0

		for i = 1, #icon_panel:children() - 1 do
			y = math.max(y, icon_panel:children()[i]:bottom())
		end

		kick_none_icon:set_y(y)
		kick_vote_icon:set_y(y)

	elseif not is_special then
		timer_rect = marker_panel:bitmap({
			name = "timer_rect",
			texture = "guis/textures/pd2/crimenet_timer",
			color = Color.white,
			w = 32,
			h = 32,
			x = 1,
			y = 2,
			render_template = "VertexColorTexturedRadial",
			layer = 2
		})
		timer_rect:set_texture_rect(32, 0, -32, 32)
	end
	--local x = marker_panel:x() + marker_panel:w()/2
	--local y = marker_panel:y() + marker_panel:h()-2
	--local info_panel = self._panel:panel( { w = 200, h = 200, x = x, y = y, visible = false, layer = 2 } )
	--local info_rect = info_panel:rect( { color = Color.blue:with_alpha( 0.5 ), layer = 0 } )
	--local name = info_panel:text( { text = managers.localization:text( level_data.name_id ), align="left", halign="left", vertical="top", hvertical="top",
					--font = tweak_data.menu.default_font, font_size = 24, layer = 1 } )
	marker_panel:set_center(x * self._zoom, y * self._zoom)
	focus:set_center(marker_panel:center())
	glow_panel:set_world_center(marker_panel:child("select_panel"):world_center())

	if heat_glow then
		heat_glow:set_world_center(marker_panel:child("select_panel"):world_center())
	end

	local num_containers = managers.job:get_num_containers()
	local middle_container = math.ceil(num_containers / 2)
	local job_container_index = managers.job:get_job_container_index(data.job_id) or middle_container
	local diff_containers = job_container_index - middle_container
	if diff_containers == 0 then
		if job_heat_mul < 0 then
			diff_containers = -1
		elseif job_heat_mul > 0 then
			diff_containers = 1
		end
	end

	local container_panel

	if diff_containers ~= 0 and job_heat_mul ~= 0 then
		container_panel = self._pan_panel:panel({
			layer = 11 + self._num_layer_jobs * 3,
			alpha = 0
		})

		container_panel:set_w(math.abs(num_containers - middle_container) * 10 + 6)
		container_panel:set_h(8)
		container_panel:set_center_x(marker_panel:center_x())
		container_panel:set_bottom(marker_panel:top())
		container_panel:set_x(math.round(container_panel:x()))
		local texture = "guis/textures/pd2/blackmarket/stat_plusminus"
		--[[if not (diff_containers > 0) or not {
			0,
			0,
			8,
			8
		} then
			local texture_rect = {
				8,
				0,
				8,
				8
			}
		end]]
		local texture_rect = {
			0,
			0,
			8,
			8
		}
		if not (diff_containers > 0) then
			texture_rect = {
					8,
					0,
					8,
					8
				}
		end
		for i = 1, math.abs(diff_containers) do
			container_panel:bitmap({
				texture = texture,
				texture_rect = texture_rect,
				x = (i - 1) * 10 + 3
			})
		end
	end

	local text_on_right = x < self._map_size_w - 200

	if text_on_right then
		side_panel:set_left(marker_panel:right())
	else
		job_name:set_text(contact_name:text() .. job_name:text())
		contact_name:set_text("")
		contact_name:set_w(0)
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		host_name:set_right(side_panel:w())
		job_name:set_right(side_panel:w())
		contact_name:set_left(side_panel:w())
		info_name:set_left(side_panel:w())
		difficulty_name:set_left(side_panel:w())
		heat_name:set_left(side_panel:w())
		stars_panel:set_right(side_panel:w())
		side_panel:set_right(marker_panel:left())
	end

	side_panel:set_top(marker_panel:top() - job_name:top() + 1)

	if icon_panel then
		if text_on_right then
			icon_panel:set_right(marker_panel:left() + 2)
		else
			icon_panel:set_left(marker_panel:right() - 2)
		end
		icon_panel:set_top(math.round(marker_panel:top() + 1))
	end

	if peers_panel then
		peers_panel:set_center_x(marker_panel:center_x())
		peers_panel:set_center_y(marker_panel:center_y())
	end

	if not Application:production_build() or peers_panel then
	end

	local callout
	if narrative_data and narrative_data.crimenet_callouts and 0 < #narrative_data.crimenet_callouts then
		local variant = math.random(#narrative_data.crimenet_callouts)
		callout = narrative_data.crimenet_callouts[variant]
	end

	if location then
		location[3] = true
	end

	managers.menu:post_event("job_appear")
	local job = {
		room_id = data.room_id,
		info = data.info,
		job_id = data.job_id,
		host_id = data.host_id,
		level_id = level_id,
		level_data = level_data,
		marker_panel = marker_panel,
		peers_panel = peers_panel,
		kick_option = data.kick_option,
		job_plan = data.job_plan,
		container_panel = container_panel,
		is_friend = data.is_friend,
		marker_dot = marker_dot,
		timer_rect = timer_rect,
		side_panel = side_panel,
		icon_panel = icon_panel,
		focus = focus,
		difficulty = data.difficulty,
		difficulty_id = data.difficulty_id,
		one_down = data.one_down,
		num_plrs = data.num_plrs,
		job_x = x,
		job_y = y,
		state = data.state,
		layer = 11 + self._num_layer_jobs * 3,
		glow_panel = glow_panel,
		callout = callout,
		text_on_right = text_on_right,
		location = location,
		heat_glow = heat_glow,
		mutators = data.mutators,
		is_crime_spree = data.crime_spree and data.crime_spree >= 0,
		crime_spree = data.crime_spree,
		crime_spree_mission = data.crime_spree_mission,
		color_lerp = data.color_lerp,
		server_data = data,
		mods = data.mods,
		is_skirmish = data.skirmish and data.skirmish > 0,
		skirmish = data.skirmish,
		skirmish_wave = data.skirmish_wave,
		skirmish_weekly_modifiers = data.skirmish_weekly_modifiers
	}

	if is_crime_spree or data.is_crime_spree then
		stars_panel:set_visible(false)

		local spree_panel = side_panel:panel({
			visible = true,
			name = "spree_panel",
			layer = -1,
			h = tweak_data.menu.pd2_small_font_size
		})

		spree_panel:set_bottom(side_panel:h())

		local level = is_crime_spree and managers.crime_spree:spree_level() or tonumber(data.crime_spree)

		if level >= 0 then
			local spree_level = spree_panel:text({
				halign = "left",
				vertical = "center",
				layer = 1,
				align = "left",
				y = 0,
				x = 0,
				valign = "center",
				text = managers.experience:cash_string(level or 0, "") .. managers.localization:get_default_macro("BTN_SPREE_TICKET"),
				color = tweak_data.screen_colors.crime_spree_risk,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
		end
	end

	if data.is_skirmish then
		stars_panel:set_visible(false)

		local skirmish_panel = side_panel:panel({
			visible = true,
			name = "skirmish_panel",
			layer = -1,
			h = tweak_data.menu.pd2_small_font_size
		})

		skirmish_panel:set_bottom(side_panel:h())

		local wave = data.skirmish_wave
		local text = nil

		if data.state == tweak_data:server_state_to_index("in_game") then
			text = managers.localization:to_upper_text("menu_skirmish_wave_number", {
				wave = wave
			})
		else
			text = managers.localization:to_upper_text("menu_lobby_server_state_" .. tweak_data:index_to_server_state(data.state))
		end

		local skirmish_wave = skirmish_panel:text({
			layer = 1,
			vertical = "center",
			blend_mode = "add",
			align = "left",
			halign = "left",
			valign = "center",
			text = text,
			color = tweak_data.screen_colors.skirmish_color,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		})
	end

	self:update_job_gui(job, 3)

	return job
end
