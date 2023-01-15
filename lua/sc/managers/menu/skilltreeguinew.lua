--I feel bad for borrowing more stuff from Pixy, but I imagine he doesn't care as long as we credit.--
local image_transparency = 0.5
local adjust_aspect_ratio = true

local function make_fine_text(text_gui)
	local x, y, w, h = text_gui:text_rect()

	text_gui:set_size(w, h)
	text_gui:set_position(math.round(text_gui:x()), math.round(text_gui:y()))
end

local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local IS_WIN_32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not IS_WIN_32
local TOP_ADJUSTMENT = NOT_WIN_32 and 45 or 45
local BOT_ADJUSTMENT = NOT_WIN_32 and 45 or 45
local BIG_PADDING = 13.5
local PADDING = 10
local PAGE_TREE_OVERLAP = 2
local SKILLS_WIDTH_PERCENT = 0.7
local PAGE_TAB_H = medium_font_size + 10

function NewSkillTreeGui:setbgimg(page, init)
	local bgpanels = { "_bg_image1", "_bg_image2", "_bg_image3", "_bg_image4", "_bg_image5" }

	if init then
		if self._fullscreen_ws then
			managers.gui_data:destroy_workspace(self._fullscreen_ws)
		end
		self._fullscreen_ws = nil
		self._fullscreen_panel = nil
		self._bg_image1 = nil
		self._bg_image2 = nil
		self._bg_image3 = nil
		self._bg_image4 = nil
		self._bg_image5 = nil

		self._fullscreen_ws = managers.gui_data:create_fullscreen_workspace()
		self._fullscreen_panel = self._fullscreen_ws:panel():panel({name = "fullscreen"})

		self._bg_image1 = self._fullscreen_panel:bitmap({
			name = "bg_image1",
			texture = "guis/textures/pd2/skilltree/bg_mastermind",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image2 = self._fullscreen_panel:bitmap({
			name = "bg_image2",
			texture = "guis/textures/pd2/skilltree/bg_enforcer",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image3 = self._fullscreen_panel:bitmap({
			name = "bg_image3",
			texture = "guis/textures/pd2/skilltree/bg_technician",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image4 = self._fullscreen_panel:bitmap({
			name = "bg_image4",
			texture = "guis/textures/pd2/skilltree/bg_ghost",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image5 = self._fullscreen_panel:bitmap({
			name = "bg_image5",
			texture = "guis/textures/pd2/skilltree/bg_fugitive",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})
	end


	for i, panel in ipairs(bgpanels) do
		self[panel]:set_alpha(image_transparency)
		local aspect = self._fullscreen_panel:w() / self._fullscreen_panel:h()
		local texture_width = self[panel]:texture_width()
		local texture_height = self[panel]:texture_height()

	if adjust_aspect_ratio == true then
		local correct_height = self._fullscreen_panel:w() / (16/9) -- actual menu aspect ratio
		self[panel]:set_size(correct_height, correct_height)
	else
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh
		self[panel]:set_size(dw * self._fullscreen_panel:w(), dh * self._fullscreen_panel:h())
	end

		self[panel]:set_right(self._fullscreen_panel:w())
		self[panel]:set_center_y(self._fullscreen_panel:h() / 2)
	end

	for i, panel in ipairs(bgpanels) do
		self[panel]:set_visible(false)
	end

	if page == 1 then
		self._bg_image1:set_visible(true)
	elseif page == 2 then
		self._bg_image2:set_visible(true)
	elseif page == 3 then
		self._bg_image3:set_visible(true)
	elseif page == 4 then
		self._bg_image4:set_visible(true)
	elseif page == 5 then
		self._bg_image5:set_visible(true)
	end
end

Hooks:PreHook( NewSkillTreeGui , "init" , "gibskillbg_init" , function( self , params )
	NewSkillTreeGui:setbgimg(1, true)
end)

Hooks:PostHook( NewSkillTreeGui , "set_active_page" , "gibskillbg_setpage" , function( self , params )
	NewSkillTreeGui:setbgimg(self._active_page, false)
end)

Hooks:PostHook( NewSkillTreeGui , "close" , "gibtest2" , function( self , params )
	NewSkillTreeGui:setbgimg(0, false)
end)

function NewSkillTreeGui:_setup()
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end

	self._panel = self._ws:panel():panel({
		name = "SkillTreePanel",
		layer = self._init_layer
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	WalletGuiObject.set_wallet(self._panel)

	local skilltree_text = self._panel:text({
		vertical = "top",
		name = "TitleText",
		align = "left",
		text = managers.localization:to_upper_text("menu_st_skilltree"),
		font = large_font,
		font_size = large_font_size,
		color = tweak_data.screen_colors.text
	})
	local x, y, w, h = skilltree_text:text_rect()

	skilltree_text:set_size(w, h)

	local title_bg_text = self._fullscreen_panel:text({
		name = "TitleTextBg",
		vertical = "top",
		h = 90,
		alpha = 0.4,
		align = "left",
		blend_mode = "add",
		layer = 1,
		text = skilltree_text:text(),
		font = massive_font,
		font_size = massive_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})
	local x, y = managers.gui_data:safe_to_full_16_9(skilltree_text:world_x(), skilltree_text:world_center_y())

	title_bg_text:set_world_left(x)
	title_bg_text:set_world_center_y(y)
	title_bg_text:move(-13, 9)
	MenuBackdropGUI.animate_bg_text(self, title_bg_text)

	if managers.menu:is_pc_controller() then
		local back_button = self._panel:text({
			name = "BackButton",
			blend_mode = "add",
			text = managers.localization:to_upper_text("menu_back"),
			font = large_font,
			font_size = large_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})

		make_fine_text(back_button)
		back_button:set_right(self._panel:w())
		back_button:set_bottom(self._panel:h())

		local back_bg_text = self._fullscreen_panel:text({
			name = "TitleTextBg",
			vertical = "top",
			h = 90,
			alpha = 0.4,
			align = "right",
			blend_mode = "add",
			layer = 1,
			text = back_button:text(),
			font = massive_font,
			font_size = massive_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

		back_bg_text:set_world_right(x)
		back_bg_text:set_world_center_y(y)
		back_bg_text:move(13, 0)
		MenuBackdropGUI.animate_bg_text(self, back_bg_text)
	end

	local skills_panel = self._panel:panel({
		name = "SkillsRootPanel",
		layer = 1,
		w = self._panel:w() * SKILLS_WIDTH_PERCENT,
		h = self._panel:h() - (TOP_ADJUSTMENT + BOT_ADJUSTMENT)
	})

	skills_panel:set_top(TOP_ADJUSTMENT)
	skills_panel:set_left(0)

	local tab_panel = skills_panel:panel({
		name = "TabPanel",
		h = PAGE_TAB_H
	})

	tab_panel:set_top(0)
	tab_panel:set_left(0)

	local page_panel = skills_panel:panel({
		name = "PagePanel",
		h = skills_panel:h() - PAGE_TAB_H + PAGE_TREE_OVERLAP
	})

	page_panel:set_top(tab_panel:bottom() - PAGE_TREE_OVERLAP)
	page_panel:set_left(0)

	local tree_title_panel = page_panel:panel({
		name = "TreeTitlePanel",
		h = large_font_size
	})

	tree_title_panel:set_bottom(page_panel:h())
	tree_title_panel:set_left(0)

	local tree_panel = page_panel:panel({
		name = "TreePanel",
		h = tree_title_panel:top()
	})

	tree_panel:set_top(0)
	tree_panel:set_left(0)

	local info_panel = self._panel:panel({
		name = "InfoRootPanel",
		layer = 1,
		w = self._panel:w() * (1 - SKILLS_WIDTH_PERCENT) - BIG_PADDING,
		h = tree_panel:h()
	})

	info_panel:set_world_top(tree_panel:world_y())
	info_panel:set_right(self._panel:w())

	local skillset_panel = info_panel:panel({
		name = "SkillSetPanel"
	})
	local skillset_text = skillset_panel:text({
		name = "SkillSetText",
		blend_mode = "add",
		layer = 1,
		text = utf8.to_upper(self._skilltree:get_skill_switch_name(self._skilltree:get_selected_skill_switch(), true)),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})

	make_fine_text(skillset_text)
	skillset_panel:set_h(skillset_text:bottom())

	self._skillset_panel = skillset_panel
	local skillpoints_panel = info_panel:panel({
		name = "SkillPointsPanel",
		y = skillset_panel:bottom() + PADDING
	})
	local skillpoints_title_text = skillpoints_panel:text({
		name = "SkillPointsTitleText",
		blend_mode = "add",
		layer = 1,
		text = managers.localization:to_upper_text("menu_skillpoints"),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.text
	})
	local skillpoints_points_text = skillpoints_panel:text({
		name = "SkillPointsPointsText",
		blend_mode = "add",
		layer = 1,
		text = tostring(self._skilltree:points()),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(skillpoints_title_text)
	make_fine_text(skillpoints_points_text)
	skillpoints_points_text:set_right(skillpoints_panel:w())
	skillpoints_panel:set_h(skillpoints_title_text:bottom())

	self._skill_points_title_text = skillpoints_title_text
	self._skill_points_text = skillpoints_points_text
	local color = self._skilltree:points() > 0 and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1

	self._skill_points_title_text:set_color(color)
	self._skill_points_text:set_color(color)

	local description_panel_bg = info_panel:rect({
		y = skillpoints_panel:bottom() + PADDING,
		h = info_panel:h() - (skillpoints_panel:bottom() + PADDING),
		alpha = 0.4,
		layer = 0,
		color = Color.black
	})
	local description_panel = info_panel:panel({
		name = "DescriptionPanel",
		layer = 1,
		y = skillpoints_panel:bottom() + PADDING,
		h = info_panel:h() - (skillpoints_panel:bottom() + PADDING),
	})
	local description_text = description_panel:text({
		text = "",
		name = "DescriptionText",
		wrap = true,
		blend_mode = "add",
		word_wrap = true,
		font = small_font,
		font_size = small_font_size
	})

	description_text:grow(-PADDING, -PADDING)
	description_text:move(PADDING / 2, PADDING / 2)

	self._tab_items = {}
	self._tree_items = {}
	self._active_page = 0
	self._active_tree_item = nil
	self._active_tier_item = nil
	self._selected_item = nil
	local pages = managers.skilltree:get_pages()
	local page_data = nil
	local tab_x = 0
	local page_tree_title_panel, page_tree_panel = nil

	for index, page in ipairs(tweak_data.skilltree.skill_pages_order) do
		page_data = pages[page]

		if page_data and tweak_data.skilltree.skilltree[page] then
			page_tree_title_panel = tree_title_panel:panel()
			page_tree_panel = tree_panel:panel()
			local tree = NewSkillTreePage:new(page, page_data, page_tree_title_panel, page_tree_panel, self._fullscreen_panel, self)

			table.insert(self._tree_items, tree)

			local tab_item = NewSkillTreeTabItem:new(tab_panel, page, tab_x, index, self, tree)
			tab_x = tab_item:next_page_position()

			table.insert(self._tab_items, tab_item)
		end
	end

	self._selected_page = self._tree_items[1]
	self._legend_buttons = {}
	local legends_panel = self._panel:panel({
		name = "LegendsPanel",
		w = self._panel:w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})

	legends_panel:set_righttop(self._panel:w(), 0)
	legends_panel:text({
		text = "",
		name = "LegendText",
		align = "right",
		blend_mode = "add",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.text
	})

	local legend_panel_reset_skills = self._panel:panel({
		name = "LegendPanelResetSkills",
		w = self._panel:w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})

	legend_panel_reset_skills:set_righttop(self._panel:w() - 2, tweak_data.menu.pd2_medium_font_size)
	legend_panel_reset_skills:text({
		text = "RESET SKILLS",
		name = "LegendTextResetSkills",
		align = "right",
		blend_mode = "add",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.text
	})
	BoxGuiObject:new(tree_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	BoxGuiObject:new(description_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	local black_rect = self._fullscreen_panel:rect({
		layer = 1,
		color = Color(0.4, 0, 0, 0)
	})
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h()
	})

	local function func(o)
		over(0.6, function (p)
			o:set_alpha(p)
		end)
	end

	blur:animate(func)
	self:set_active_page(1)
	self:_rec_round_object(self._panel)
end

function NewSkillTreeGui:_update_description(item)
	local desc_panel = self._panel:child("InfoRootPanel"):child("DescriptionPanel")
	local text = desc_panel:child("DescriptionText")
	local tier = item:tier()
	local skill_id = item:skill_id()
	local tweak_data_skill = tweak_data.skilltree.skills[skill_id]
	local skill_stat_color = tweak_data.screen_colors.resource
	local color_replace_table = {}
	local points = self._skilltree:points() or 0
	local basic_cost = self._skilltree:get_skill_points(skill_id, 1) or 0
	local pro_cost = self._skilltree:get_skill_points(skill_id, 2) or 0
	local talent = tweak_data.skilltree.skills[skill_id]
	local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
	local step = self._skilltree:next_skill_step(skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_descs = tweak_data.upgrades.skill_descs[skill_id] or {
		0,
		0
	}
	local basic_color_index = 1
	local pro_color_index = 2 + (skill_descs[1] or 0)
	local max_deflection_add = managers.player:upgrade_value("player", "max_deflection_add", 0) or 0
	local yakuza_deflection = max_deflection_add > 0 or nil
	local max_deflection = tweak_data.upgrades.max_deflection + max_deflection_add

	if step > 1 then
		basic_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
		color_replace_table[basic_color_index] = tweak_data.screen_colors.risk
	else
		basic_cost = managers.localization:text(basic_cost == 1 and "st_menu_point" or "st_menu_point_plural", {
			points = basic_cost
		})
	end

	if step > 2 then
		pro_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
		color_replace_table[pro_color_index] = tweak_data.screen_colors.risk
	else
		pro_cost = managers.localization:text(pro_cost == 1 and "st_menu_point" or "st_menu_point_plural", {
			points = pro_cost
		})
	end

	local macroes = {
		basic = basic_cost,
		pro = pro_cost,
		deflection = max_deflection * 100 .. "%" .. (yakuza_deflection and " " .. managers.localization:text("menu_yakuza_deflection_add") or "")
	}

	for i, d in pairs(skill_descs) do
		macroes[i] = d
	end

	local skill_btns = tweak_data.upgrades.skill_btns[skill_id]

	if skill_btns then
		for i, d in pairs(skill_btns) do
			macroes[i] = d()
		end
	end

	local basic_cost = managers.skilltree:skill_cost(tier, 1)
	local aced_cost = managers.skilltree:skill_cost(tier, 2)
	local skill_string = managers.localization:to_upper_text(tweak_data_skill.name_id)
	local cost_string = managers.localization:to_upper_text(basic_cost == 1 and "st_menu_skill_cost_singular" or "st_menu_skill_cost", {
		basic = basic_cost,
		aced = aced_cost
	})
	local desc_string = managers.localization:text(tweak_data.skilltree.skills[skill_id].desc_id, macroes)
	color_replace_table = {}
	local skill_step = 1
	for color_id in string.gmatch(desc_string, "#%{(.-)%}#") do
		if color_id == "owned" then
			if step > skill_step then
				table.insert(color_replace_table, tweak_data.screen_colors.skill_color)
			else
				table.insert(color_replace_table, tweak_data.screen_colors.item_stage_2)
			end
			skill_step = skill_step + 1
			--table.insert(color_replace_table, tweak_data.screen_colors[color_id])
		else
			table.insert(color_replace_table, tweak_data.screen_colors[color_id])
		end
	end
	desc_string = desc_string:gsub("#%{(.-)%}#", "##")
	if not color_replace_table[1] then
		color_replace_table = tweak_data.screen_colors.skill_color
	end

	local full_string = skill_string .. "\n\n" .. desc_string

	if (_G.IS_VR or managers.user:get_setting("show_vr_descs")) and tweak_data.vr.skill_descs_addons[skill_id] then
		local addon_data = tweak_data.vr.skill_descs_addons[skill_id]
		local vr_addon = managers.localization:text(addon_data.text_id, addon_data.macros)
		full_string = full_string .. "\n\n" .. managers.localization:text("menu_vr_skill_addon") .. "\n" .. vr_addon
	end

	text:set_text(full_string)
	managers.menu_component:make_color_text(text, color_replace_table)
	text:set_font_size(small_font_size)

	local _, _, _, h = text:text_rect()

	while h > desc_panel:h() - text:top() do
		text:set_font_size(text:font_size() * 0.98)

		_, _, _, h = text:text_rect()
	end
end