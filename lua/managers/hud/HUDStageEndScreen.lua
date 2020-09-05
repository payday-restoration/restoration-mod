
local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))

	return x, y, w, h
end

function HUDPackageUnlockedItem:init(panel, row, params, hud_stage_end_screen)
	local num_unlocks = math.clamp(params.unlocks, HUDPackageUnlockedItem.MIN_DISPLAYED, HUDPackageUnlockedItem.MAX_DISPLAYED)
	self._panel = panel:panel({
		w = panel:w() - 20,
		h = panel:h() * 0.5 - 15 - 10,
		x = 10,
		y = 40,
		alpha = 0
	})

	self._panel:move(0, self._panel:h() * (row - 1))
	if row > 2 then
		self._panel:hide()
	end
	if HUDPackageUnlockedItem.MAX_DISPLAYED < row then
		self._panel:hide()
	end

	local announcement = params.announcement
	local upgrade = params.upgrade
	local ghost_bonus = params.ghost_bonus
	local gage_assignment = params.gage_assignment
	local challenge_completed = params.challenge_completed
	local tango_mission_completed = params.tango_mission
	local bitmap_texture = "guis/textures/pd2/endscreen/test_icon_package"
	local text_string = ""
	local blend_mode = "normal"
	local post_event = "stinger_new_weapon"
	local wait_time = 0.35
	if announcement then
		bitmap_texture = "guis/textures/pd2/endscreen/announcement"
		text_string = managers.localization:to_upper_text("menu_es_announcement") .. "\n" .. managers.localization:to_upper_text(announcement)
		blend_mode = "add"
	elseif params.skirmish_wave then
		bitmap_texture = "guis/dlcs/skm/textures/pd2/endscreen/announcement_skm"
		local text_id = nil

		if params.success then
			if params.skirmish_wave == select(2, managers.skirmish:wave_range()) then
				text_id = "menu_skirmish_success_all_end_screen"
			else
				text_id = "menu_skirmish_success_end_screen"
			end
		else
			text_id = "menu_skirmish_fail_end_screen"
		end

		text_string = managers.localization:to_upper_text(text_id, {
			wave = params.skirmish_wave
		})

		if managers.skirmish:is_weekly_skirmish() and #managers.skirmish:unclaimed_rewards() > 0 then
			text_string = text_string .. " " .. managers.localization:to_upper_text("menu_skirmish_weekly_reward_end_screen")
		end
	elseif upgrade then
		local upgrade_def = tweak_data.upgrades.definitions[upgrade]

		if upgrade_def then
			local category = Idstring(upgrade_def.category)

			if category == Idstring("weapon") then
				local weapon_id = upgrade_def.weapon_id
				local weapon_name = managers.weapon_factory:get_weapon_name_by_factory_id(upgrade_def.factory_id)
				local weapon_class = managers.localization:text("menu_" .. tweak_data.weapon[upgrade_def.weapon_id].categories[1])
				local weapon_category = managers.localization:text("bm_menu_" .. (tweak_data.weapon[upgrade_def.weapon_id].use_data.selection_index == 2 and "primaries" or "secondaries"))
				bitmap_texture = managers.blackmarket:get_weapon_icon_path(weapon_id, nil)
				text_string = managers.localization:text("menu_es_package_weapon", {
					weapon = utf8.to_upper(weapon_name),
					type = utf8.to_upper(weapon_class),
					category = weapon_category,
					INVENTORY_MENU = managers.localization:text("menu_inventory")
				})
			elseif category == Idstring("armor") then
				local guis_catalog = "guis/"
				local bundle_folder = tweak_data.blackmarket.armors[upgrade_def.armor_id] and tweak_data.blackmarket.armors[upgrade_def.armor_id].texture_bundle_folder

				if bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
				end

				bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. upgrade_def.armor_id
				text_string = managers.localization:text("menu_es_package_armor", {
					armor = managers.localization:to_upper_text(upgrade_def.name_id)
				})
			elseif category == Idstring("grenade") then
				local guis_catalog = "guis/"
				local bundle_folder = tweak_data.blackmarket.projectiles[upgrade] and tweak_data.blackmarket.projectiles[upgrade].texture_bundle_folder

				if bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
				end

				bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/grenades/" .. upgrade
				text_string = managers.localization:text("menu_es_package_projectile", {
					projectile = managers.localization:to_upper_text(tweak_data.blackmarket.projectiles[upgrade].name_id)
				})
			elseif category == Idstring("melee_weapon") then
				local bm_tweak_data = tweak_data.blackmarket.melee_weapons[upgrade]
				local guis_catalog = "guis/"
				local bundle_folder = bm_tweak_data and bm_tweak_data.texture_bundle_folder

				if bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
				end

				bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. upgrade
				text_string = managers.localization:text("menu_es_package_melee_weapon", {
					melee_weapon = bm_tweak_data and managers.localization:to_upper_text(bm_tweak_data.name_id)
				})
			elseif category == Idstring("rep_upgrade") then
				bitmap_texture = "guis/textures/pd2/endscreen/" .. upgrade_def.category
				text_string = managers.localization:to_upper_text("menu_es_rep_upgrade", {
					point = upgrade_def.value or 2
				})
				blend_mode = "add"

				hud_stage_end_screen:give_skill_points(upgrade_def.value or 2)
			elseif DB:has(Idstring("texture"), "guis/textures/pd2/endscreen/" .. upgrade_def.category) then
				bitmap_texture = "guis/textures/pd2/endscreen/" .. upgrade_def.category
			else
				bitmap_texture = "guis/textures/pd2/endscreen/what_is_this"

				Application:error("[HUDPackageUnlockedItem] Unknown category detected!", upgrade_def.category, category)
			end
		end
	elseif ghost_bonus then
		local on_last_stage = managers.job:on_last_stage()
		bitmap_texture = "guis/textures/pd2/endscreen/stealth_bonus"
		local string_id = on_last_stage and "menu_es_ghost_bonus_job" or "menu_es_ghost_bonus_day"
		text_string = managers.localization:to_upper_text(string_id, {
			bonus = ghost_bonus
		})
		blend_mode = "add"
	elseif gage_assignment then
		local completed, progressed = managers.gage_assignment:get_latest_data()
		bitmap_texture = "guis/dlcs/gage_pack_jobs/textures/pd2/endscreen/gage_assignment"
		blend_mode = "add"
		local string_id = ""

		if table.size(completed) > 0 then
			string_id = "menu_es_gage_assignment_package_complete"
			post_event = "gage_package_win"
			wait_time = 0.6
		else
			string_id = "menu_es_gage_assignment_package"
		end

		text_string = managers.localization:to_upper_text(string_id, {})
	elseif challenge_completed then
		bitmap_texture = "guis/textures/pd2/endscreen/announcement"
		blend_mode = "add"
		text_string = managers.localization:to_upper_text("menu_es_challenge_completed", {})
	elseif tango_mission_completed then
		bitmap_texture = "guis/dlcs/tng/textures/pd2/blackmarket/icons/endscreen_icons/endscreen_gage_modpack"
		blend_mode = "add"
		text_string = managers.localization:to_upper_text("menu_es_tango_completed", {})
	else
		Application:debug("HUDPackageUnlockedItem: Something something unknown")
	end

	local bitmap = self._panel:bitmap({texture = bitmap_texture, blend_mode = blend_mode})
	local tw = bitmap:texture_width()
	local th = bitmap:texture_height()
	if th ~= 0 then
		local ratio = tw / th
		local size = self._panel:h() - 10
		local sw = math.max(size, size * ratio)
		local sh = math.max(size, size / ratio)
		bitmap:set_size(sw, sh)
		bitmap:set_center_x(self._panel:h() - 5)
		bitmap:set_center_y(self._panel:h() / 2)
		local text = self._panel:text({
			font = tweak_data.menu.medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
		    color = tweak_data.screen_color_yellow,
			text = text_string,
			x = bitmap:right() + 10,
			y = bitmap:top(),
			vertical = "center",
			wrap = true,
			word_wrap = true
		})
		text:grow(-text:x() - 5, -text:y() - 5)
		local _, _, _, h = text:text_rect()
		if h > text:h() then
			text:set_font(tweak_data.menu.pd2_small_font_id)
			text:set_font_size(tweak_data.menu.pd2_small_font_size)
		end
		text:set_position(math.round(text:x()), math.round(text:y()))
		managers.menu_component:make_color_text(text, tweak_data.screen_colors.ghost_color)
	end
	self._panel:animate(callback(self, self, "create_animation", {post_event = post_event, wait_time = wait_time}))
end

function HUDStageEndScreen:init(hud, workspace)
	self._backdrop = MenuBackdropGUI:new(workspace)

	if not _G.IS_VR then
		self._backdrop:create_black_borders()
	end

	self._hud = hud
	self._workspace = workspace
	self._singleplayer = Global.game_settings.single_player
	local bg_font = tweak_data.menu.pd2_massive_font
	local title_font = tweak_data.menu.pd2_large_font
	local content_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font
	local bg_font_size = tweak_data.menu.pd2_massive_font_size
	local title_font_size = tweak_data.menu.pd2_large_font_size
	local content_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size
	local massive_font = bg_font
	local large_font = title_font
	local medium_font = content_font
	local massive_font_size = bg_font_size
	local large_font_size = title_font_size
	local medium_font_size = content_font_size
	self._background_layer_safe = self._backdrop:get_new_background_layer()
	self._background_layer_full = self._backdrop:get_new_background_layer()
	self._foreground_layer_safe = self._backdrop:get_new_foreground_layer()
	self._foreground_layer_full = self._backdrop:get_new_foreground_layer()
	self._backdrop:set_panel_to_saferect(self._background_layer_safe)
	self._backdrop:set_panel_to_saferect(self._foreground_layer_safe)
	if managers.job:has_active_job() then
		local current_contact_data = managers.job:current_contact_data()
		local contact_gui = current_contact_data and self._background_layer_full:gui(current_contact_data.assets_gui, {empty = true})
		local contact_pattern = contact_gui and contact_gui:has_script() and contact_gui:script().pattern
		if contact_pattern then
			self._backdrop:set_pattern(contact_pattern)
		end
	end

	local padding_y = 0
	self._paygrade_panel = self._background_layer_safe:panel({
		h = 70,
		w = 210,
		y = padding_y
	})
	local pg_text = self._foreground_layer_safe:text({
		name = "pg_text",
		text = utf8.to_upper(managers.localization:text("menu_risk")),
		y = padding_y,
		h = 32,
		align = "right",
		vertical = "center",
		font_size = content_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_colors.text
	})
	local _, _, w, h = pg_text:text_rect()
	pg_text:set_size(w, h)
	local job_stars = managers.job:has_active_job() and managers.job:current_job_stars() or 1
	local job_and_difficulty_stars = managers.job:has_active_job() and managers.job:current_job_and_difficulty_stars() or 1
	local difficulty_stars = managers.job:has_active_job() and managers.job:current_difficulty_stars() or 0
	local risk_color = tweak_data.screen_colors.risk
	local risks = {
		"risk_swat",
		"risk_fbi",
		"risk_death_squad",
		"risk_easy_wish"
	}
	if not Global.SKIP_OVERKILL_290 then
		table.insert(risks, "risk_murder_squad")
		table.insert(risks, "risk_sm_wish")
	end
	local panel_w = 0
	local panel_h = 0
	local x = 0
	local y = 0
	for i, name in ipairs(risks) do
		local texture, rect = tweak_data.hud_icons:get_icon_data(name)
		local active = i <= difficulty_stars
		local color = active and risk_color or tweak_data.screen_colors.text
		local alpha = active and 1 or 0.25
		local risk = self._paygrade_panel:bitmap({
			name = name,
			texture = texture,
			texture_rect = rect,
			x = 0,
			y = 0,
			alpha = alpha,
			color = color
		})
		risk:set_position(x, y)
		x = x + risk:w() + 0
		panel_w = math.max(panel_w, risk:right())
		panel_h = math.max(panel_h, risk:h())
	end
	pg_text:set_color(risk_color)
	self._paygrade_panel:set_h(panel_h)
	self._paygrade_panel:set_w(panel_w)
	self._paygrade_panel:set_right(self._background_layer_safe:w())
	pg_text:set_right(self._paygrade_panel:left())
	pg_text:set_center_y(self._paygrade_panel:center_y())
	pg_text:set_y(math.round(pg_text:y()))

	if managers.skirmish:is_skirmish() then
		self._paygrade_panel:set_visible(false)
		pg_text:set_visible(false)

		local min, max = managers.skirmish:wave_range()
		local wave_range_text = self._foreground_layer_safe:text({
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
			font = tweak_data.menu.medium_font,
			color = tweak_data.screen_colors.skirmish_color
		})

		managers.hud:make_fine_text(wave_range_text)
		wave_range_text:set_right(self._background_layer_safe:w())
	end
	
	self._stage_name = managers.job:current_level_id() and managers.localization:to_upper_text(tweak_data.levels[managers.job:current_level_id()].name_id) or ""

	if managers.skirmish:is_skirmish() then
		if managers.skirmish:is_weekly_skirmish() then
			self._stage_name = managers.localization:to_upper_text("menu_weekly_skirmish")
		else
			self._stage_name = managers.localization:to_upper_text("menu_skirmish")
		end
	end

	self._foreground_layer_safe:text({
		name = "stage_text",
		text = self._stage_name,
		h = title_font_size,
		align = "left",
		vertical = "center",
		font_size = 36,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_colors.text
	})
	local bg_text = self._background_layer_full:text({
		name = "stage_text",
		text = self._stage_name,
		h = bg_font_size,
		align = "left",
		vertical = "top",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = bg_font,
		color = tweak_data.screen_color_blue,
		alpha = 0.4
	})
	bg_text:set_world_center_y(self._foreground_layer_safe:child("stage_text"):world_center_y())
	bg_text:set_world_x(self._foreground_layer_safe:child("stage_text"):world_x())
	bg_text:move(-13, 9)

	self._coins_backpanel = self._background_layer_safe:panel({
		name = "coins_backpanel",
		y = 70,
		w = self._background_layer_safe:w() / 2 - 10,
		h = self._background_layer_safe:h() / 2
	})
	self._coins_forepanel = self._foreground_layer_safe:panel({
		name = "coins_forepanel",
		y = 70,
		w = self._foreground_layer_safe:w() / 2 - 10,
		h = self._foreground_layer_safe:h() / 2
	})
	local level_progress_text = self._coins_forepanel:text({
		vertical = "top",
		name = "coin_progress_text",
		align = "left",
		y = 10,
		x = 10,
		text = managers.localization:to_upper_text("menu_es_coins_progress"),
		h = content_font_size + 2,
		font_size = content_font_size,
		font = content_font,
		color = tweak_data.screen_colors.text
	})
	local _, _, lw, lh = level_progress_text:text_rect()

	level_progress_text:set_size(lw, lh)

	local coins_bg_circle = self._coins_backpanel:bitmap({
		texture = "guis/textures/restoration/exp_ring",
		name = "bg_progress_circle",
		alpha = 0.6,
		blend_mode = "normal",
		h = self._coins_backpanel:h() - content_font_size,
		w = self._coins_backpanel:h() - content_font_size,
		y = content_font_size,
		color = Color.black
	})
	self._coins_circle = self._coins_backpanel:bitmap({
		texture = "guis/textures/restoration/exp_ring",
		name = "progress_circle",
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		h = self._coins_backpanel:h() - content_font_size,
		w = self._coins_backpanel:h() - content_font_size,
		y = content_font_size,
		color = Color(0, 1, 1)
	})
	self._coins_text = self._coins_forepanel:text({
		name = "coins_text",
		vertical = "center",
		align = "center",
		text = "",
		font_size = bg_font_size,
		font = bg_font,
		h = self._coins_backpanel:h() - content_font_size,
		w = self._coins_backpanel:h() - content_font_size,
		y = content_font_size,
		color = tweak_data.screen_colors.text
	})
	self._coins_box = BoxGuiObject:new(self._coins_backpanel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	self._backdrop:animate_bg_text(bg_text)
	self._lp_backpanel = self._background_layer_safe:panel({
		name = "lp_backpanel",
		w = self._background_layer_safe:w() / 2 - 10,
		h = self._background_layer_safe:h() / 2,
		y = 70
	})
	self._lp_forepanel = self._foreground_layer_safe:panel({
		name = "lp_forepanel",
		w = self._foreground_layer_safe:w() / 2 - 10,
		h = self._foreground_layer_safe:h() / 2,
		y = 70
	})
	local level_progress_text = self._lp_forepanel:text({
		name = "level_progress_text",
		text = managers.localization:to_upper_text("menu_es_level_progress"),
		align = "left",
		vertical = "top",
		h = content_font_size + 2,
		font_size = content_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_blue,
		x = 10,
		y = 10
	})
	local _, _, lw, lh = level_progress_text:text_rect()
	level_progress_text:set_size(lw, lh)
	local lp_bg_circle = self._lp_backpanel:bitmap({
		name = "bg_progress_circle",
		texture = "guis/textures/restoration/exp_ring",
		h = self._lp_backpanel:h() - content_font_size,
		w = self._lp_backpanel:h() - content_font_size,
		y = content_font_size,
		color = Color.black,
		alpha = 0.6,
		blend_mode = "normal"
	})
	self._lp_circle = self._lp_backpanel:bitmap({
		name = "progress_circle",
		texture = "guis/textures/restoration/exp_ring",
		h = self._lp_backpanel:h() - content_font_size,
		w = self._lp_backpanel:h() - content_font_size,
		y = content_font_size,
		color = Color(0, 1, 1),
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1
	})
	self._lp_text = self._lp_forepanel:text({
		name = "level_text",
		text = "",
		align = "center",
		vertical = "center",
		font_size = bg_font_size,
		font = bg_font,
		h = self._lp_backpanel:h() - content_font_size,
		w = self._lp_backpanel:h() - content_font_size,
		y = content_font_size,
		color = tweak_data.screen_color_yellow 
	})
	self._lp_curr_xp = self._lp_forepanel:text({
		name = "current_xp",
		text = managers.localization:to_upper_text("menu_es_current_xp"),
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_xp_gained = self._lp_forepanel:text({
		name = "xp_gained",
		text = managers.localization:to_upper_text("menu_es_xp_gained"),
		align = "left",
		vertical = "top",
		h = content_font_size,
		font_size = content_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_next_level = self._lp_forepanel:text({
		name = "next_level",
		text = managers.localization:to_upper_text("menu_es_next_level"),
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_skill_points = self._lp_forepanel:text({
		name = "skill_points",
		text = managers.localization:to_upper_text("menu_es_skill_points_gained"),
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_xp_curr = self._lp_forepanel:text({
		name = "c_xp",
		text = "",
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_xp_gain = self._lp_forepanel:text({
		name = "xp_g",
		text = "",
		align = "left",
		vertical = "top",
		h = content_font_size,
		font_size = content_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_xp_nl = self._lp_forepanel:text({
		name = "xp_nl",
		text = "",
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	self._lp_sp_gain = self._lp_forepanel:text({
		name = "sp_g",
		text = "0",
		align = "left",
		vertical = "center",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow
	})
	local _, _, cw, ch = self._lp_curr_xp:text_rect()
	local _, _, gw, gh = self._lp_xp_gained:text_rect()
	local _, _, nw, nh = self._lp_next_level:text_rect()
	local _, _, sw, sh = self._lp_skill_points:text_rect()
	ch = ch - 2
	nh = nh - 2
	sh = sh - 2
	local w = math.ceil(math.max(cw, gw, nw, sw)) + 20
	local squeeze_more_pixels = false
	if w > 170 then
		squeeze_more_pixels = true
	end
	self._num_skill_points_gained = 0
	self._lp_sp_info = self._lp_forepanel:text({
		name = "sp_info",
		text = managers.localization:text("menu_es_skill_points_info", {
			SKILL_MENU = managers.localization:to_upper_text("menu_skilltree")
		}),
		align = "left",
		vertical = "top",
		h = small_font_size,
		font_size = small_font_size,
		font = tweak_data.menu.medium_font,
		color = tweak_data.screen_color_yellow,
		wrap = true,
		word_wrap = true
	})
	self._lp_sp_info:grow(-self._lp_circle:right() - 10, 0)
	local _, _, iw, ih = self._lp_sp_info:text_rect()
	self._lp_sp_info:set_h(ih)
	self._lp_sp_info:set_leftbottom(self._lp_circle:right() + 0, self._lp_forepanel:h() - 10)
	local w = self._lp_forepanel:w() - self._lp_sp_info:x() - 90
	local number_text_x = self._lp_sp_info:left() + w
	self._lp_skill_points:set_size(sw, sh)
	self._lp_skill_points:set_left(self._lp_sp_info:left())
	self._lp_skill_points:set_bottom(self._lp_sp_info:top())
	self._lp_sp_gain:set_left(number_text_x)
	self._lp_sp_gain:set_top(self._lp_skill_points:top())
	self._lp_sp_gain:set_size(self._lp_forepanel:w() - self._lp_sp_gain:left() - 10, sh)
	self._lp_next_level:set_size(nw, nh)
	self._lp_next_level:set_left(self._lp_sp_info:left())
	self._lp_next_level:set_bottom(self._lp_skill_points:top())
	self._lp_xp_nl:set_left(number_text_x)
	self._lp_xp_nl:set_top(self._lp_next_level:top())
	self._lp_xp_nl:set_size(self._lp_forepanel:w() - self._lp_xp_nl:left() - 10, nh)
	self._lp_curr_xp:set_size(cw, ch)
	self._lp_curr_xp:set_left(self._lp_sp_info:left())
	self._lp_curr_xp:set_bottom(self._lp_next_level:top())
	self._lp_xp_curr:set_left(number_text_x)
	self._lp_xp_curr:set_top(self._lp_curr_xp:top())
	self._lp_xp_curr:set_size(self._lp_forepanel:w() - self._lp_xp_curr:left() - 10, ch)
	self._lp_xp_gained:set_size(gw, gh)
	self._lp_xp_gained:set_left(self._lp_curr_xp:left())
	self._lp_xp_gained:set_bottom(self._lp_curr_xp:top())
	self._lp_xp_gain:set_left(number_text_x)
	self._lp_xp_gain:set_top(self._lp_xp_gained:top())
	self._lp_xp_gain:set_size(self._lp_forepanel:w() - self._lp_xp_gain:left() - 10, gh)
	self._lp_xp_gained:set_bottom(math.round(self._lp_forepanel:h() / 2))
	self._lp_curr_xp:set_top(self._lp_xp_gained:bottom())
	self._lp_next_level:set_top(self._lp_curr_xp:bottom())
	self._lp_skill_points:set_top(self._lp_next_level:bottom())
	self._lp_sp_info:set_top(self._lp_skill_points:bottom())
	self._lp_xp_gain:set_top(self._lp_xp_gained:top())
	self._lp_xp_curr:set_top(self._lp_curr_xp:top())
	self._lp_xp_nl:set_top(self._lp_next_level:top())
	self._lp_sp_gain:set_top(self._lp_skill_points:top())
	if squeeze_more_pixels then
		lp_bg_circle:move(-20, 0)
		self._lp_circle:move(-20, 0)
		self._lp_text:move(-20, 0)
		self._lp_curr_xp:move(-30, 0)
		self._lp_xp_gained:move(-30, 0)
		self._lp_next_level:move(-30, 0)
		self._lp_skill_points:move(-30, 0)
		self._lp_sp_info:move(-30, 0)
	end
	self._box = BoxGuiObject:new(self._lp_backpanel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	WalletGuiObject.set_wallet(self._foreground_layer_safe)
	self._package_forepanel = self._foreground_layer_safe:panel({
		name = "package_forepanel",
		w = self._foreground_layer_safe:w() / 2 - 10,
		h = self._foreground_layer_safe:h() / 2 - 70 - 10,
		y = 70,
		alpha = 1
	})
	self._package_forepanel:set_right(self._foreground_layer_safe:w())
	self._package_forepanel:text({
		name = "title_text",
		font = tweak_data.menu.medium_font,
		font_size = content_font_size,
		text = "",
		color = tweak_data.screen_color_blue,
		x = 10,
		y = 10
	})
	local package_box_panel = self._foreground_layer_safe:panel()
	package_box_panel:set_shape(self._package_forepanel:shape())
	package_box_panel:set_layer(self._package_forepanel:layer())
	self._package_box = BoxGuiObject:new(package_box_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	self._package_items = {}
	self:clear_stage()
	if self._data then
		self:start_experience_gain()
	end
	for i, child in ipairs(self._lp_forepanel:children()) do
		if child.text then
			local text = child:text()
			child:set_text(string.gsub(text, ":", ""))
		end
	end

	local skip_panel = self._foreground_layer_safe:panel({
		name = "skip_forepanel",
		y = 70,
		w = self._foreground_layer_safe:w() / 2 - 10,
		h = self._foreground_layer_safe:h() / 2
	})
	local macros = {
		BTN_SPEED = managers.localization:btn_macro("menu_challenge_claim", true)
	}

	if not managers.menu:is_pc_controller() then
		macros.BTN_SPEED = managers.localization:get_default_macro("BTN_SWITCH_WEAPON")
	end

	self._skip_text = skip_panel:text({
		name = "skip_text",
		visible = false,
		alpha = 0.5,
		font = small_font,
		font_size = small_font_size,
		text = managers.localization:to_upper_text("menu_stageendscreen_speed_up", macros)
	})

	make_fine_text(self._skip_text)
	self._skip_text:set_right(skip_panel:w() - 10)
	self._skip_text:set_bottom(skip_panel:h() - 10)
end

function HUDStageEndScreen:level_up(level)
	local function level_text_func(o, ding_scale, level)
		local center_x, center_y = o:center()
		local size = tweak_data.menu.pd2_massive_font_size
		local ding_size = size * (1 + ding_scale)

		wait(0.1)
		o:set_text(tostring(level))
		self:give_skill_points(1)
	end

	local function text_ding_func(o)
		local TOTAL_T = 0.4
		local t = TOTAL_T
		local mul = 1
		local size = o:font_size()

		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			local ratio = math.max(t / TOTAL_T, 0)
			mul = mul + dt * 4

			o:set_font_size(size * mul)
			o:set_alpha(ratio)
			o:set_color(math.lerp(Color.white, tweak_data.screen_colors.button_stage_2, 1 - ratio))
		end

		o:parent():remove(o)
	end

	local function circle_ding_func(o)
		wait(0.15)

		local TOTAL_T = 0.6
		local t = TOTAL_T
		local mul = 1
		local c_x, c_y = o:center()
		local size = o:w()

		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			local ratio = math.max(t / TOTAL_T, 0)
			mul = mul + dt * 0.75

			o:set_size(size * mul, size * mul)
			o:set_center(c_x, c_y)
			o:set_alpha(ratio)
			o:set_color(math.lerp(Color.white, tweak_data.screen_colors.button_stage_2, 1 - ratio))
		end

		o:parent():remove(o)
	end

	local function package_func(o, data)
		local start_alpha = o:alpha()

		for _, item in pairs(self._package_items) do
			item:close()
		end

		self._package_items = {}

		wait(0.6)

		local new_items = {}

		if data.announcements then
			for i, announcement in ipairs(data.announcements) do
				table.insert(new_items, {
					announcement = announcement
				})
			end
		end

		if data.upgrades then
			for i, upgrade in ipairs(data.upgrades) do
				if not managers.upgrades:is_upgrade_locked(upgrade) then
					table.insert(new_items, {
						upgrade = upgrade
					})
				end
			end
		end

		self._package_forepanel:child("title_text"):set_text(managers.localization:to_upper_text("menu_es_package_unlocked_" .. (#new_items == 1 and "singular" or "plural")))

		if HUDPackageUnlockedItem.MAX_DISPLAYED < #new_items then
			Application:error(string.format("HUDStageEndScreen: Please, max %i announcements+upgrades per level in tweak_data.level_tree, rest will not be shown in gui!", HUDPackageUnlockedItem.MAX_DISPLAYED))
		end

		over(0.42, function (p)
			o:set_alpha(math.cos(652 * p) * math.rand(0.4, 0.8))
		end)
		over(0.04, function (p)
			o:set_alpha(math.step(o:alpha(), 1, p))
		end)
		o:set_alpha(1)

		local row = nil

		for i, item in ipairs(new_items) do
			row = i % HUDPackageUnlockedItem.MAX_DISPLAYED

			if self._package_items[row] then
				wait(0.23)
				self._package_items[row]:close()

				self._package_items[row] = nil

				wait(0.33)
			end

			item.unlocks = #new_items
			self._package_items[row] = HUDPackageUnlockedItem:new(o, math.clamp(item.unlocks, HUDPackageUnlockedItem.MIN_DISPLAYED, HUDPackageUnlockedItem.MAX_DISPLAYED) - row, item, self)

			wait(0.27)
		end
	end

	managers.menu_component:post_event("stinger_levelup")

	local ding_circle = self._lp_backpanel:bitmap({
		texture = "guis/textures/restoration/exp_ring",
		rotation = 360,
		blend_mode = "add",
		layer = 0,
		w = self._lp_circle:w(),
		h = self._lp_circle:h(),
		x = self._lp_circle:x(),
		y = self._lp_circle:y(),
		color = tweak_data.screen_color_yellow
	})

	ding_circle:animate(circle_ding_func)

	local ding_text = self._lp_forepanel:text({
		vertical = "center",
		align = "center",
		rotation = 360,
		blend_mode = "add",
		layer = 0,
		w = self._lp_text:w(),
		h = self._lp_text:h(),
		x = self._lp_text:x(),
		y = self._lp_text:y(),
		color = tweak_data.screen_color_yellow,
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		text = self._lp_text:text()
	})

	ding_text:animate(text_ding_func)
	self._lp_circle:set_color(Color(level == managers.experience:level_cap() and 1 or 0, 1, 1))
	self._lp_text:stop()
	self._lp_text:animate(level_text_func, 1, tostring(level))

	local package_unlocked = tweak_data.upgrades.level_tree[level]

	if package_unlocked then
		self._package_forepanel:stop()
		self._package_forepanel:animate(package_func, package_unlocked)
	end

	return package_unlocked
end

function HUDStageEndScreen:set_statistics( criminals_completed, success )
	print( "HUDStageEndScreen:set_statistics( criminals_completed, success )", criminals_completed, success )
	self._criminals_completed = criminals_completed
	self._success = success
	
	local stage_status = success and utf8.to_upper( managers.localization:text("menu_success" ) ) or utf8.to_upper( managers.localization:text("menu_failed" ) )
	self._foreground_layer_safe:child("stage_text"):set_text( self._stage_name .. ": " .. stage_status )
	self._background_layer_full:child("stage_text"):set_text( self._stage_name .. ": " .. stage_status )

	-- print( total_xp_bonus )
	-- self._end_xp = total_xp_bonus
	
	--[[
	time_played:set_text( string.upper( managers.statistics:session_time_played().." (H:M:S)" ) )
	completed_objectives:set_text( string.upper( "" ..comp_obj.. "%" ) )
	last_completed_challenge:set_text( string.upper( managers.challenges:get_last_comleted_title_text() ) )
	total_downed:set_text( string.upper( managers.statistics:total_downed() ) )
	favourite_weapon:set_text( string.upper(""..managers.statistics:session_favourite_weapon() ) )
	hit_accuracy:set_text( string.upper(managers.statistics:session_hit_accuracy().."%" ) )
	total_kills:set_text( string.upper( ""..managers.statistics:session_total_kills() ) )
	total_specials_kills:set_text( string.upper( ""..managers.statistics:session_total_specials_kills() ) )
	total_head_shots:set_text( string.upper(""..managers.statistics:session_total_head_shots() ) )
	completion_criminals_finished:set_text( string.upper(""..criminals_completed ) )
	completed_objectives_bonus:set_text( string.upper( "" ..comp_obj.. "%" ) )
	completed_civilians_killed_penalty:set_text( string.upper(""..total_civilian_kills ) )
	completion_criminals_finished_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	completed_objectives_bonus_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	completed_civilians_killed_penalty_xp:set_color( total_civilian_kills == 0 and Color.white or Color.red )
	completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	
	
	
	total_completion_bonus:set_text( managers.experience:cash_string( 0 ) .. xp_postfix )
	]]
end

--[[
function present_completion_bonus( o, cb )
	local t = (10/30)
	
	local xp_postfix = _xp_postfix
	
	-------
	wait( 0.5 )
	-------
	
	local total_xp_bonus = 0
	local criminals_bonus_xp_counter = 0
	while criminals_bonus_xp_counter < _criminals_bonus_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_criminals_bonus_xp - criminals_bonus_xp_counter)/8 )
		criminals_bonus_xp_counter = criminals_bonus_xp_counter + add_val
		completion_criminals_finished_xp:set_text( managers.experience:cash_string( math.round(criminals_bonus_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus + add_val
		total_completion_bonus:set_text( managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completion_criminals_finished_xp:set_text( managers.experience:cash_string( _criminals_bonus_xp ).._xp_postfix )
	
	-------
	wait( 0.5 )
	-------
	
	local objectives_bonus_xp_counter = 0
	while objectives_bonus_xp_counter < _objectives_bonus_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_objectives_bonus_xp - objectives_bonus_xp_counter)/8 )
		objectives_bonus_xp_counter = objectives_bonus_xp_counter + add_val
		completed_objectives_bonus_xp:set_text( managers.experience:cash_string( math.round(objectives_bonus_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus + add_val
		total_completion_bonus:set_text(managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completed_objectives_bonus_xp:set_text( managers.experience:cash_string( _objectives_bonus_xp ).._xp_postfix )
	
	-------
	wait( 0.5 )
	-------
	
	local civilians_penalty_xp_counter = 0
	while civilians_penalty_xp_counter < _civilians_penalty_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_civilians_penalty_xp - civilians_penalty_xp_counter)/8 )
		civilians_penalty_xp_counter = civilians_penalty_xp_counter + add_val
		completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( - math.round(civilians_penalty_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus - add_val
		total_completion_bonus:set_text( managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( - _civilians_penalty_xp ).._xp_postfix )
	total_completion_bonus:set_text( managers.experience:cash_string( _total_xp_bonus )..xp_postfix )
	
	-------
	wait( 0.1 )
	-------
	
	cb( _total_xp_bonus )
end
]]