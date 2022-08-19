--I feel bad for borrowing more stuff from Pixy, but I imagine he doesn't care as long as we credit.--
local image_transparency = 0.5
local adjust_aspect_ratio = true

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

local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size

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