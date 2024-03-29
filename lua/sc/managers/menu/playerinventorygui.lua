local IS_WIN_32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not IS_WIN_32
local TOP_ADJUSTMENT = NOT_WIN_32 and 50 or 55
local BOT_ADJUSTMENT = NOT_WIN_32 and 40 or 60
local join_stinger_binding = "menu_respec_tree_all"

local function _animate(objects, scale, anim_time)
	local anims = {}

	for _, object in pairs(objects) do
		if object then
			local data = {
				sw = object.gui:width(),
				sh = object.gui:height(),
				ew = object.shape[3] * scale,
				eh = object.shape[4] * scale,
				sf = object.gui.font_scale and object.gui:font_scale() or scale,
				ef = scale
			}

			if object.font_scale then
				data.sf = data.sf
				data.ef = data.ef * object.font_scale
			end

			table.insert(anims, {
				object = object,
				data = data
			})
		end
	end

	if anim_time == 0 then
		for _, anim in ipairs(anims) do
			local cx, cy = anim.object.gui:center()

			anim.object.gui:set_size(anim.data.ew, anim.data.eh)
			anim.object.gui:set_center(cx, cy)

			if anim.object.gui.set_font_scale then
				anim.object.gui:set_font_scale(anim.data.ef)
			end
		end

		return
	end

	local time = 0

	while anim_time > time do
		local dt = coroutine.yield()
		time = time + dt
		local p = time / anim_time

		for _, anim in ipairs(anims) do
			local cx, cy = anim.object.gui:center()

			anim.object.gui:set_size(math.lerp(anim.data.sw, anim.data.ew, p), math.lerp(anim.data.sh, anim.data.eh, p))
			anim.object.gui:set_center(cx, cy)

			if anim.object.gui.set_font_scale then
				anim.object.gui:set_font_scale(math.lerp(anim.data.sf, anim.data.ef, p))
			end
		end
	end
end

local function select_anim(o, box, instant)
	_animate({
		box.image_object,
		box.animate_text and box.text_object
	}, 1, instant and 0 or 0.2)
end

local function unselect_anim(o, box, instant)
	_animate({
		box.image_object,
		box.animate_text and box.text_object
	}, 0.8, instant and 0 or 0.2)
end

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function PlayerInventoryGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	self._panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()
	self._show_all_panel = self._ws:panel():panel({
		visible = false,
		w = self._ws:panel():w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})

	self._show_all_panel:set_righttop(self._ws:panel():w(), 0)

	local show_all_text = self._show_all_panel:text({
		blend_mode = "add",
		text = managers.localization:to_upper_text(managers.menu:is_pc_controller() and "menu_show_all" or "menu_legend_show_all", {
			BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")
		}),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size
	})

	make_fine_text(show_all_text)
	show_all_text:set_right(self._show_all_panel:w())
	show_all_text:set_center_y(self._show_all_panel:h() / 2)

	if not managers.menu:is_pc_controller() then
		self._show_all_panel:set_bottom(self._ws:panel():h())
	end

	show_all_text:set_world_position(math.round(show_all_text:world_x()), math.round(show_all_text:world_y()))

	self._boxes = {}
	self._boxes_by_name = {}
	self._boxes_by_layer = {}
	self._mod_boxes = {}
	self._max_layer = 1
	self._data = node:parameters().menu_component_data or {
		selected_box = "character"
	}
	self._node:parameters().menu_component_data = self._data
	self._input_focus = 1

	WalletGuiObject.set_wallet(self._panel)

	local y = TOP_ADJUSTMENT
	local title_string = "menu_player_inventory"
	local title_text = self._panel:text({
		name = "title",
		layer = 1,
		text = managers.localization:to_upper_text(title_string),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(title_text)

	local back_button = self._panel:text({
		vertical = "bottom",
		name = "back_button",
		align = "right",
		layer = 1,
		text = managers.localization:to_upper_text("menu_back"),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})

	make_fine_text(back_button)
	back_button:set_right(self._panel:w())
	back_button:set_bottom(self._panel:h())
	back_button:set_visible(managers.menu:is_pc_controller())

	if MenuBackdropGUI then
		local massive_font = tweak_data.menu.pd2_massive_font
		local massive_font_size = tweak_data.menu.pd2_massive_font_size
		local bg_text = self._fullscreen_panel:text({
			vertical = "top",
			h = 90,
			align = "left",
			alpha = 0.4,
			text = title_text:text(),
			font = massive_font,
			font_size = massive_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(title_text:world_x(), title_text:world_center_y())

		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)

		if managers.menu:is_pc_controller() then
			local bg_back = self._fullscreen_panel:text({
				name = "back_button",
				vertical = "bottom",
				h = 90,
				alpha = 0.4,
				align = "right",
				layer = 0,
				text = back_button:text(),
				font = massive_font,
				font_size = massive_font_size,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

			bg_back:set_world_right(x)
			bg_back:set_world_center_y(y)
			bg_back:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_back)
		end
	end

	local padding_x = 10
	local padding_y = 0
	local x = self._panel:w() - 500
	local y = TOP_ADJUSTMENT + tweak_data.menu.pd2_small_font_size
	local width = self._panel:w() - x
	local height = 540
	local combined_width = width - padding_x * 2
	local combined_height = height - padding_y * 3
	local box_width = combined_width / 3
	local box_height = combined_height / 4
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local primary_box_data = {
		name = "primary",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_primaries"),
		text = player_loadout_data.primary.info_text,
		image = player_loadout_data.primary.item_texture,
		bg_image = player_loadout_data.primary.item_bg_texture,
		text_selected_color = player_loadout_data.primary.info_text_color,
		use_background = player_loadout_data.primary.item_bg_texture and true or false,
		akimbo_gui_data = player_loadout_data.primary.akimbo_gui_data,
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.white:with_alpha(0.75),
		clbks = {
			left = callback(self, self, "open_primary_menu"),
			right = callback(self, self, "preview_primary"),
			up = callback(self, self, "previous_primary"),
			down = callback(self, self, "next_primary")
		}
	}
	local secondary_box_data = {
		name = "secondary",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_secondaries"),
		text = player_loadout_data.secondary.info_text,
		image = player_loadout_data.secondary.item_texture,
		bg_image = player_loadout_data.secondary.item_bg_texture,
		text_selected_color = player_loadout_data.secondary.info_text_color,
		use_background = player_loadout_data.secondary.item_bg_texture and true or false,
		akimbo_gui_data = player_loadout_data.secondary.akimbo_gui_data,
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.white:with_alpha(0.75),
		clbks = {
			left = callback(self, self, "open_secondary_menu"),
			right = callback(self, self, "preview_secondary"),
			up = callback(self, self, "previous_secondary"),
			down = callback(self, self, "next_secondary")
		}
	}
	local melee_box_data = {
		name = "melee",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_melee_weapons"),
		text = player_loadout_data.melee_weapon.info_text,
		image = player_loadout_data.melee_weapon.item_texture,
		dual_image = not player_loadout_data.melee_weapon.item_texture and {
			player_loadout_data.melee_weapon.dual_texture_1,
			player_loadout_data.melee_weapon.dual_texture_2
		},
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			left = callback(self, self, "open_melee_menu"),
			right = callback(self, self, "preview_melee"),
			up = callback(self, self, "previous_melee"),
			down = callback(self, self, "next_melee")
		}
	}
	local throwable_box_data = {
		name = "throwable",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_grenades"),
		text = player_loadout_data.grenade.info_text,
		image = player_loadout_data.grenade.item_texture,
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			left = callback(self, self, "open_throwable_menu"),
			right = callback(self, self, "preview_throwable"),
			up = callback(self, self, "previous_throwable"),
			down = callback(self, self, "next_throwable")
		}
	}
	local armor_box_data = {
		name = "armor",
		redirect_box = "outfit_armor",
		can_select = false,
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_armors"),
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		data = player_loadout_data.outfit,
		clbks = {
			create = callback(self, self, "create_outfit_box")
		}
	}
	local deployable_box_data = {
		name = "deployable",
		redirect_box = "deployable_primary",
		can_select = false,
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_deployables"),
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		data = player_loadout_data.deployable,
		clbks = {
			create = callback(self, self, "create_deployable_box")
		}
	}
	local mask_box_data = {
		name = "mask",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("bm_menu_masks"),
		text = player_loadout_data.mask.info_text,
		image = player_loadout_data.mask.item_texture,
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			left = callback(self, self, "open_mask_menu"),
			right = callback(self, self, "preview_mask"),
			up = callback(self, self, "previous_mask"),
			down = callback(self, self, "next_mask")
		}
	}
	local character_box_data = {
		alpha = 1,
		name = "character",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("menu_preferred_character"),
		text = player_loadout_data.character.info_text,
		image = player_loadout_data.character.item_texture,
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			right = false,
			left = callback(self, self, "open_character_menu"),
			up = callback(self, self, "previous_character"),
			down = callback(self, self, "next_character")
		}
	}
	local infamy_box_data = {
		name = "infamy",
		alpha = 1,
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("menu_infamytree"),
		text = managers.localization:to_upper_text("menu_infamytree"),
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			down = false,
			up = false,
			right = false,
			left = callback(self, self, "open_infamy_menu")
		}
	}
	local crew_box_data = {
		image = "guis/dlcs/mom/textures/pd2/crewmanagement_icon",
		name = "crew",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("menu_crew_management"),
		text = managers.localization:to_upper_text("menu_crew_management"),
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			down = false,
			up = false,
			right = false,
			left = callback(self, self, "open_crew_menu")
		}
	}
	local skill_box_data = {
		image = false,
		name = "skilltree",
		bg_blend_mode = "normal",
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("menu_st_skilltree"),
		text = managers.localization:text("menu_st_skill_switch_set", {
			skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)
		}),
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			right = false,
			left = callback(self, self, "open_skilltree_menu"),
			up = callback(self, self, "previous_skilltree"),
			down = callback(self, self, "next_skilltree")
		}
	}
	local texture_rect_x = 0
	local texture_rect_y = 0
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	local specialization_data = tweak_data.skilltree.specializations[current_specialization]
	local specialization_text = specialization_data and managers.localization:text(specialization_data.name_id) or " "
	local guis_catalog = "guis/"

	if specialization_data then
		local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
		local force_icon = specialization_data.force_icon
		local tier_data = specialization_data[force_icon or max_tier]

		if tier_data then
			texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
			texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

			if tier_data.texture_bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
			end

			specialization_text = specialization_text .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")"
		end
	end

	local icon_atlas_texture = guis_catalog .. "textures/pd2/specialization/icons_atlas"
	local specialization_box_data = {
		name = "specialization",
		bg_blend_mode = "normal",
		image_size_mul = 0.8,
		w = box_width,
		h = box_height,
		unselected_text = managers.localization:to_upper_text("menu_specialization"),
		text = specialization_text,
		image = icon_atlas_texture,
		image_rect = {
			texture_rect_x * 64,
			texture_rect_y * 64,
			64,
			64
		},
		select_anim = select_anim,
		unselect_anim = unselect_anim,
		bg_color = Color.black:with_alpha(0.05),
		clbks = {
			right = false,
			left = callback(self, self, "open_specialization_menu"),
			up = callback(self, self, "previous_specialization"),
			down = callback(self, self, "next_specialization")
		}
	}

	if managers.network:session() then
		character_box_data.alpha = 0.2
		character_box_data.clbks = {
			right = false
		}
		infamy_box_data.alpha = 0.2
		infamy_box_data.clbks = {
			right = false
		}

		if not Network:is_server() then
			crew_box_data.alpha = 0.2
			crew_box_data.clbks = {
				right = false
			}
		end
	end

	local primary_box = self:create_box(primary_box_data)
	local secondary_box = self:create_box(secondary_box_data)
	local melee_box = self:create_box(melee_box_data)
	local throwable_box = self:create_box(throwable_box_data)
	local armor_box = self:create_box(armor_box_data)
	local deployable_box = self:create_box(deployable_box_data)
	local mask_box = self:create_box(mask_box_data)
	local character_box = self:create_box(character_box_data)
	local infamy_box = self:create_box(infamy_box_data)
	local crew_box = self:create_box(crew_box_data)
	local skill_box = self:create_box(skill_box_data)
	local specialization_box = self:create_box(specialization_box_data)
	local box_matrix = {
		{
			"character",
			"primary",
			"skilltree"
		},
		{
			"mask",
			"secondary",
			"specialization"
		},
		{
			"armor",
			"throwable",
			"crew"
		},
		{
			"deployable",
			"melee",
			"infamy"
		}
	}

	self:sort_boxes_by_matrix(box_matrix)

	local character_panel = self._panel:panel({
		name = "character_panel"
	})
	local weapons_panel = self._panel:panel({
		name = "weapons_panel"
	})
	local eqpt_skills_panel = self._panel:panel({
		name = "eqpt_skills_panel"
	})

	local function get_matrix_column_boxes(column)
		local boxes = {}

		for _, row in ipairs(box_matrix) do
			if row[column] and self._boxes_by_name[row[column]] then
				table.insert(boxes, self._boxes_by_name[row[column]])
			end
		end

		return boxes
	end

	for i, column_panel in ipairs({
		character_panel,
		weapons_panel,
		eqpt_skills_panel
	}) do
		local boxes = get_matrix_column_boxes(i)

		if #boxes > 0 then
			local first = boxes[1].panel
			local last = boxes[#boxes].panel

			column_panel:set_shape(first:left(), first:top(), box_width, last:bottom() - first:top())
		end
	end

	character_panel:rect({
		alpha = 0.4,
		color = Color.black
	})
	weapons_panel:rect({
		alpha = 0.4,
		color = Color.black
	})
	eqpt_skills_panel:rect({
		alpha = 0.4,
		color = Color.black
	})

	local column_one_box_panel = self._panel:panel({
		name = "column_one_box_panel"
	})

	column_one_box_panel:set_shape(character_panel:shape())

	local column_two_box_panel = self._panel:panel({
		name = "column_two_box_panel"
	})

	column_two_box_panel:set_shape(weapons_panel:shape())

	local column_three_box_panel = self._panel:panel({
		name = "column_three_box_panel"
	})

	column_three_box_panel:set_shape(eqpt_skills_panel:shape())

	self._column_one_box = BoxGuiObject:new(column_one_box_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	self._column_two_box = BoxGuiObject:new(column_two_box_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	self._column_three_box = BoxGuiObject:new(column_three_box_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	local character_text = self._panel:text({
		name = "character_text",
		blend_mode = "add",
		text = managers.localization:to_upper_text("menu_player_column_one_title"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})
	local weapons_text = self._panel:text({
		name = "weapons_text",
		blend_mode = "add",
		text = managers.localization:to_upper_text("menu_player_column_two_title"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})
	local eqpt_skills_text = self._panel:text({
		name = "eqpt_skills_text",
		blend_mode = "add",
		text = managers.localization:to_upper_text("menu_player_column_three_title"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(character_text)
	make_fine_text(weapons_text)
	make_fine_text(eqpt_skills_text)
	character_text:set_rightbottom(character_panel:right(), character_panel:top())
	weapons_text:set_rightbottom(weapons_panel:right(), weapons_panel:top())
	eqpt_skills_text:set_rightbottom(eqpt_skills_panel:right(), eqpt_skills_panel:top())

	local alias_text = self._panel:text({
		name = "alias_text",
		blend_mode = "add",
		x = 2,
		y = TOP_ADJUSTMENT,
		text = tostring(managers.network.account:username() or managers.blackmarket:get_preferred_character_real_name()),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(alias_text)

	local player_panel = self._panel:panel({
		name = "player_panel",
		h = 290,
		w = 320,
		x = 0,
		y = TOP_ADJUSTMENT + tweak_data.menu.pd2_small_font_size
	})
	self._player_panel = player_panel

	self._player_panel:rect({
		alpha = 0.4,
		layer = -100,
		color = Color.black
	})

	self._player_box_panel = self._panel:panel({
		name = "player_box_panel"
	})

	self._player_box_panel:set_shape(player_panel:shape())

	self._player_box = BoxGuiObject:new(self._player_box_panel, {
		sides = {
			1,
			1,
			2,
			1
		}
	})
	local next_level_data = managers.experience:next_level_data() or {}
	local player_level = managers.experience:current_level()
	local player_rank = managers.experience:current_rank()
	local is_infamous = player_rank > 0
	local size = 96
	local player_level_panel = player_panel:panel({
		name = "player_level_panel",
		y = 10,
		x = 10,
		w = size,
		h = size
	})

	player_level_panel:bitmap({
		texture = "guis/textures/pd2/endscreen/exp_ring",
		alpha = 0.4,
		w = size,
		h = size,
		color = Color.white
	})
	player_level_panel:bitmap({
		texture = "guis/textures/pd2/endscreen/exp_ring",
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		color = Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1),
		w = size,
		h = size
	})
	player_level_panel:text({
		vertical = "center",
		align = "center",
		text = tostring(player_level),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size
	})
	player_level_panel:bitmap({
		texture = "guis/textures/pd2/exp_ring_purple",
		name = "bg_infamy_progress_circle",
		alpha = 1,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 15,
		h = size,
		w = size,
		color = Color(managers.experience:get_prestige_xp_percentage_progress(), 1, 1)
	})

	local detection_panel = player_panel:panel({
		name = "detection_panel",
		x = 0,
		layer = 0,
		y = player_level_panel:top(),
		w = size - tweak_data.menu.pd2_small_font_size * 2,
		h = size - tweak_data.menu.pd2_small_font_size * 2
	})
	local detection_ring_left_bg = detection_panel:bitmap({
		blend_mode = "add",
		name = "detection_left_bg",
		alpha = 0.2,
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		layer = 0,
		w = detection_panel:w(),
		h = detection_panel:h()
	})
	local detection_ring_right_bg = detection_panel:bitmap({
		blend_mode = "add",
		name = "detection_right_bg",
		alpha = 0.2,
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		layer = 0,
		w = detection_panel:w(),
		h = detection_panel:h()
	})

	detection_ring_right_bg:set_texture_rect(64, 0, -64, 64)

	local detection_ring_left = detection_panel:bitmap({
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		name = "detection_left",
		alpha = 0.5,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		w = detection_panel:w(),
		h = detection_panel:h()
	})
	local detection_ring_right = detection_panel:bitmap({
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		name = "detection_right",
		alpha = 0.5,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		w = detection_panel:w(),
		h = detection_panel:h()
	})

	detection_ring_right:set_texture_rect(64, 0, -64, 64)

	local detection_ring_left2 = detection_panel:bitmap({
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		name = "detection_left2",
		alpha = 0.5,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		w = detection_panel:w(),
		h = detection_panel:h()
	})
	local detection_ring_right2 = detection_panel:bitmap({
		texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
		name = "detection_right2",
		alpha = 0.5,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		w = detection_panel:w(),
		h = detection_panel:h()
	})

	detection_ring_right2:set_texture_rect(64, 0, -64, 64)

	local detection_value = detection_panel:text({
		alpha = 1,
		name = "detection_value",
		h = 64,
		text = "",
		w = 64,
		blend_mode = "add",
		visible = true,
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size
	})
	local detection_text = player_panel:text({
		name = "detection_text",
		alpha = 1,
		visible = true,
		blend_mode = "add",
		y = player_level_panel:top(),
		text = managers.localization:to_upper_text("bm_menu_stats_detection"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size
	})

	make_fine_text(detection_text)
	detection_text:set_right(player_panel:w() - 10)
	detection_panel:set_center_x(detection_text:center_x())
	detection_panel:set_right(math.min(detection_panel:right(), detection_text:right()))
	detection_panel:set_top(detection_text:bottom() + 5)

	self._player_stats_panel = player_panel:panel({
		name = "player_stats_panel",
		x = 10,
		h = 180,
		w = player_panel:w() - 20
	})

	self._player_stats_panel:set_bottom(player_panel:h() - 10)
	self:setup_player_stats(self._player_stats_panel)

	local info_panel = self._panel:panel({
		name = "info_panel",
		x = 0,
		y = player_panel:bottom() + 10,
		w = player_panel:w(),
		h = self._panel:h() - player_panel:top() - BOT_ADJUSTMENT - player_panel:h() - 10
	})

	BoxGuiObject:new(info_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	info_panel:rect({
		alpha = 0.4,
		layer = -100,
		color = Color.black
	})

	local info_content_panel = info_panel:panel({
		layer = 1
	})

	info_content_panel:grow(-20, -20)
	info_content_panel:move(10, 10)

	self._info_text = info_content_panel:text({
		text = "",
		wrap = true,
		word_wrap = true,
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})
	self._info_panel = info_content_panel:panel({
		layer = 1
	})

	self:set_info_text("")

	self._legends_panel = self._panel:panel({
		name = "legends_panel",
		w = self._panel:w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})
	self._legends = {}

	if managers.menu:is_pc_controller() then
		self._legends_panel:set_righttop(self._panel:w(), 0)

		if not managers.menu:is_steam_controller() then
			local panel = self._legends_panel:panel({
				visible = false,
				name = "select"
			})
			local icon = panel:bitmap({
				texture = "guis/textures/pd2/mouse_buttons",
				name = "icon",
				h = 23,
				blend_mode = "add",
				w = 17,
				texture_rect = {
					1,
					1,
					17,
					23
				}
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:to_upper_text("menu_mouse_select"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_left(icon:right() + 2)
			text:set_center_y(icon:center_y())
			panel:set_w(text:right())

			self._legends.select = panel
			local panel = self._legends_panel:panel({
				visible = false,
				name = "preview"
			})
			local icon = panel:bitmap({
				texture = "guis/textures/pd2/mouse_buttons",
				name = "icon",
				h = 23,
				blend_mode = "add",
				w = 17,
				texture_rect = {
					18,
					1,
					17,
					23
				}
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:to_upper_text("menu_mouse_preview"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_left(icon:right() + 2)
			text:set_center_y(icon:center_y())
			panel:set_w(text:right())

			self._legends.preview = panel
			local panel = self._legends_panel:panel({
				visible = false,
				name = "switch"
			})
			local icon = panel:bitmap({
				texture = "guis/textures/pd2/mouse_buttons",
				name = "icon",
				h = 23,
				blend_mode = "add",
				w = 17,
				texture_rect = {
					35,
					1,
					17,
					23
				}
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:to_upper_text("menu_mouse_switch"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_left(icon:right() + 2)
			text:set_center_y(icon:center_y())
			panel:set_w(text:right())

			self._legends.switch = panel
		else
			local panel = self._legends_panel:panel({
				visible = false,
				name = "select"
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:steam_btn("grip_l") .. " " .. managers.localization:to_upper_text("menu_mouse_select"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_center_y(panel:h() / 2)
			panel:set_w(text:right())

			self._legends.select = panel
			local panel = self._legends_panel:panel({
				visible = false,
				name = "preview"
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:steam_btn("grip_r") .. " " .. managers.localization:to_upper_text("menu_mouse_preview"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_center_y(panel:h() / 2)
			panel:set_w(text:right())

			self._legends.preview = panel
			local panel = self._legends_panel:panel({
				visible = false,
				name = "switch"
			})
			local text = panel:text({
				blend_mode = "add",
				text = managers.localization:btn_macro("previous_page") .. managers.localization:btn_macro("next_page") .. " " .. managers.localization:to_upper_text("menu_mouse_switch"),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(text)
			text:set_center_y(panel:h() / 2)
			panel:set_w(text:right())

			self._legends.switch = panel
		end

		local panel = self._legends_panel:panel({
			visible = false,
			name = "hide_all"
		})
		local text = panel:text({
			blend_mode = "add",
			text = managers.localization:to_upper_text("menu_hide_all", {
				BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")
			}),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(text)
		text:set_center_y(panel:h() / 2)
		panel:set_w(text:right())

		self._legends.hide_all = panel
	else
		self._legends_panel:set_righttop(self._panel:w(), 0)
		self._legends_panel:text({
			text = "",
			name = "text",
			vertical = "bottom",
			align = "right",
			blend_mode = "add",
			halign = "right",
			valign = "bottom",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.text
		})
	end

	self._text_buttons = {}
	local alias_show_button, alias_hide_button, column_one_show_button, column_one_hide_button, column_two_show_button, column_two_hide_button, column_three_show_button, column_three_hide_button = nil

	local function alias_hide_func()
		if alive(alias_show_button) then
			alias_show_button:hide()
		end

		if alive(alias_hide_button) then
			alias_hide_button:show()
		end

		if alive(self._player_panel) then
			self._player_panel:hide()
		end

		if alive(self._player_box_panel) then
			self._player_box:create_sides(self._player_box_panel, {
				sides = {
					0,
					0,
					2,
					0
				}
			})
		end

		if alive(info_panel) then
			info_panel:hide()
		end
	end

	local function alias_show_func()
		if alive(alias_show_button) then
			alias_show_button:show()
		end

		if alive(alias_hide_button) then
			alias_hide_button:hide()
		end

		if alive(self._player_panel) then
			self._player_panel:show()
		end

		if alive(self._player_box_panel) then
			self._player_box:create_sides(self._player_box_panel, {
				sides = {
					1,
					1,
					2,
					1
				}
			})
		end

		if alive(info_panel) then
			info_panel:show()
		end
	end

	local function column_one_hide_func()
		if alive(column_one_show_button) then
			column_one_show_button:hide()
		end

		if alive(column_one_hide_button) then
			column_one_hide_button:show()
		end

		if alive(character_panel) then
			character_panel:hide()
		end

		if alive(column_one_box_panel) then
			self._column_one_box:create_sides(column_one_box_panel, {
				sides = {
					0,
					0,
					2,
					0
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[1] and self._boxes_by_name[boxes[1]]

			if box then
				box.panel:hide()
			end
		end
	end

	local function column_one_show_func()
		if alive(column_one_show_button) then
			column_one_show_button:show()
		end

		if alive(column_one_hide_button) then
			column_one_hide_button:hide()
		end

		if alive(character_panel) then
			character_panel:show()
		end

		if alive(column_one_box_panel) then
			self._column_one_box:create_sides(column_one_box_panel, {
				sides = {
					1,
					1,
					2,
					1
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[1] and self._boxes_by_name[boxes[1]]

			if box then
				box.panel:show()
			end
		end
	end

	local function column_two_hide_func()
		if alive(column_two_show_button) then
			column_two_show_button:hide()
		end

		if alive(column_two_hide_button) then
			column_two_hide_button:show()
		end

		if alive(weapons_panel) then
			weapons_panel:hide()
		end

		if alive(column_two_box_panel) then
			self._column_two_box:create_sides(column_two_box_panel, {
				sides = {
					0,
					0,
					2,
					0
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[2] and self._boxes_by_name[boxes[2]]

			if box then
				box.panel:hide()
			end
		end

		for _, box in ipairs(self._boxes_by_layer[2]) do
			box.panel:hide()
		end
	end

	local function column_two_show_func()
		if alive(column_two_show_button) then
			column_two_show_button:show()
		end

		if alive(column_two_hide_button) then
			column_two_hide_button:hide()
		end

		if alive(weapons_panel) then
			weapons_panel:show()
		end

		if alive(column_two_box_panel) then
			self._column_two_box:create_sides(column_two_box_panel, {
				sides = {
					1,
					1,
					2,
					1
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[2] and self._boxes_by_name[boxes[2]]

			if box then
				box.panel:show()
			end
		end

		for _, box in ipairs(self._boxes_by_layer[2]) do
			box.panel:show()
		end
	end

	local function column_three_hide_func()
		if alive(column_three_show_button) then
			column_three_show_button:hide()
		end

		if alive(column_three_hide_button) then
			column_three_hide_button:show()
		end

		if alive(eqpt_skills_panel) then
			eqpt_skills_panel:hide()
		end

		if alive(column_three_box_panel) then
			self._column_three_box:create_sides(column_three_box_panel, {
				sides = {
					0,
					0,
					2,
					0
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[3] and self._boxes_by_name[boxes[3]]

			if box then
				box.panel:hide()
			end
		end

		for _, box in ipairs(self._boxes_by_layer[3]) do
			if alive(box.panel) then
				box.panel:hide()
			end
		end
	end

	local function column_three_show_func()
		if alive(column_three_show_button) then
			column_three_show_button:show()
		end

		if alive(column_three_hide_button) then
			column_three_hide_button:hide()
		end

		if alive(eqpt_skills_panel) then
			eqpt_skills_panel:show()
		end

		if alive(column_three_box_panel) then
			self._column_three_box:create_sides(column_three_box_panel, {
				sides = {
					1,
					1,
					2,
					1
				}
			})
		end

		local box = nil

		for _, boxes in ipairs(box_matrix) do
			box = boxes[3] and self._boxes_by_name[boxes[3]]

			if box then
				box.panel:show()
			end
		end

		for _, box in ipairs(self._boxes_by_layer[3]) do
			if alive(box.panel) then
				box.panel:show()
			end
		end
	end

	self._show_hide_data = {
		panels = {
			self._player_panel,
			character_panel,
			weapons_panel,
			eqpt_skills_panel
		},
		show_funcs = {
			alias_show_func,
			column_one_show_func,
			column_two_show_func,
			column_three_show_func
		},
		hide_funcs = {
			alias_hide_func,
			column_one_hide_func,
			column_two_hide_func,
			column_three_hide_func
		}
	}

	if managers.menu:is_pc_controller() then
		local show_string = managers.localization:to_upper_text("menu_button_hide")
		local hide_string = managers.localization:to_upper_text("menu_button_show")
		alias_show_button = self:create_text_button({
			alpha = 0.1,
			left = alias_text:right() + 2,
			top = alias_text:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = show_string,
			clbk = alias_hide_func
		})
		alias_hide_button = self:create_text_button({
			disabled = true,
			left = alias_show_button:left(),
			top = alias_show_button:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = hide_string,
			clbk = alias_show_func
		})
		column_one_show_button = self:create_text_button({
			alpha = 0.1,
			right = character_text:left() - 2,
			top = character_text:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = show_string,
			clbk = column_one_hide_func
		})
		column_one_hide_button = self:create_text_button({
			disabled = true,
			right = column_one_show_button:right(),
			top = column_one_show_button:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = hide_string,
			clbk = column_one_show_func
		})
		column_two_show_button = self:create_text_button({
			alpha = 0.1,
			right = weapons_text:left() - 2,
			top = weapons_text:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = show_string,
			clbk = column_two_hide_func
		})
		column_two_hide_button = self:create_text_button({
			disabled = true,
			right = column_two_show_button:right(),
			top = column_two_show_button:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = hide_string,
			clbk = column_two_show_func
		})
		column_three_show_button = self:create_text_button({
			alpha = 0.1,
			right = eqpt_skills_text:left() - 2,
			top = eqpt_skills_text:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = show_string,
			clbk = column_three_hide_func
		})
		column_three_hide_button = self:create_text_button({
			disabled = true,
			right = column_three_show_button:right(),
			top = column_three_show_button:top(),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = hide_string,
			clbk = column_three_show_func
		})
		local alias_big_panel = self._panel:panel({
			name = "alias_big_panel"
		})

		alias_big_panel:set_w(self._player_panel:w())
		alias_big_panel:set_x(self._player_panel:x())

		local column_one_big_panel = self._panel:panel({
			name = "column_one_big_panel"
		})

		column_one_big_panel:set_w(character_panel:w())
		column_one_big_panel:set_x(character_panel:x())

		local column_two_big_panel = self._panel:panel({
			name = "column_two_big_panel"
		})

		column_two_big_panel:set_w(weapons_panel:w())
		column_two_big_panel:set_x(weapons_panel:x())

		local column_three_big_panel = self._panel:panel({
			name = "column_three_big_panel"
		})

		column_three_big_panel:set_w(eqpt_skills_panel:w())
		column_three_big_panel:set_x(eqpt_skills_panel:x())

		self._change_alpha_table = {
			{
				panel = alias_big_panel,
				button = alias_show_button
			},
			{
				panel = column_one_big_panel,
				button = column_one_show_button
			},
			{
				panel = column_two_big_panel,
				button = column_two_show_button
			},
			{
				panel = column_three_big_panel,
				button = column_three_show_button
			}
		}
	end

	self._multi_profile_item = MultiProfileItemGui:new(self._ws, self._panel)

	if #managers.infamy:get_unlocked_join_stingers() > 0 then
		local selected_join_stinger = managers.infamy:selected_join_stinger()
		self._select_join_stinger_button = self:create_text_button({
			right = column_one_box_panel:left() - 5,
			bottom = column_one_box_panel:bottom() - 0,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:to_upper_text("menu_join_stinger_title", {
				button = managers.localization:btn_macro(join_stinger_binding),
				join_stinger = managers.localization:text("menu_" .. tostring(selected_join_stinger) .. "_name")
			}),
			clbk = callback(self, self, "select_join_stinger"),
			binding = join_stinger_binding
		})
	end

	self:_round_everything()
	self:_update_selected_box(true)
	self:update_detection()
	self:_update_player_stats()
	self:_update_mod_boxes()

	local deployable_secondary = self._boxes_by_name.deployable_secondary

	if deployable_secondary then
		deployable_secondary.links = self._boxes_by_name.deployable.links
	end

	local outfit_player_style = self._boxes_by_name.outfit_player_style

	if outfit_player_style then
		outfit_player_style.links = self._boxes_by_name.armor.links
	end
end

function PlayerInventoryGui:_update_specialization_box()
	local box = self._boxes_by_name.specialization

	if box then
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		local texture_rect_x = 0
		local texture_rect_y = 0
		local specialization_text = specialization_data and managers.localization:text(specialization_data.name_id) or " "
		local guis_catalog = "guis/"

		if specialization_data then
			local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			local force_icon = specialization_data.force_icon
			local tier_data = specialization_data[force_icon or max_tier]

			if tier_data then
				texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
				texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

				if tier_data.texture_bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
				end

				specialization_text = specialization_text .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")"
			end
		end

		local icon_atlas_texture = guis_catalog .. "textures/pd2/specialization/icons_atlas"

		self:update_box(box, {
			text = specialization_text,
			image = icon_atlas_texture,
			image_rect = {
				texture_rect_x * 64,
				texture_rect_y * 64,
				64,
				64
			}
		}, true)
	end
end

local function format_round(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.1f", num):gsub("%.?0+$", "")
end

local function format_round_2(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num)
end

local function format_round_3(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num):gsub("%.?0+$", "")
end

--Can't figure out how "color_ranges" is read for multiple colors so have some ugly workaround
function PlayerInventoryGui:set_info_text(text, color_ranges, recursive, resource_color)
	self._info_text:set_text(text)

	local default_font_size = tweak_data.menu.pd2_small_font_size

	self._info_text:set_font_size(default_font_size)
	
	local start_ci, end_ci, first_ci = nil

	if resource_color then
		local text_dissected = utf8.characters(text)
		local idsp = Idstring("#")
		start_ci = {}
		end_ci = {}
		first_ci = true

		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end

					first_ci = not first_ci
				end
			end
		end

		if #start_ci == #end_ci then
			for i = 1, #start_ci do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end

		text = string.gsub(text, "##", "")
	end

	self._info_text:set_text(text)
	self._info_text:set_alpha(1)

	if resource_color then
		self._info_text:clear_range_color(1, utf8.len(text))

		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Missing ##'s in :set_info_text() string!", id, new_string, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				self._info_text:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and (resource_color[i] or tweak_data.screen_colors.skill_color) or (resource_color or tweak_data.screen_colors.skill_color))
			end
		end
	end

	if color_ranges then
		if color_ranges.add_colors_to_text_object then
			managers.menu_component:add_colors_to_text_object(self._info_text, unpack(color_ranges))
		else
			for _, color_range in ipairs(color_ranges) do
				self._info_text:set_range_color(color_range.start, color_range.stop, color_range.color)
			end
		end
	end

	local _, _, _, h = self._info_text:text_rect()

	self._info_text:set_h(h)

	local min_font_size = math.max(math.min(6, default_font_size), math.ceil(default_font_size * 0.7))

	if self._info_panel:parent():h() < self._info_text:bottom() then
		local font_size = self._info_text:font_size()

		while self._info_panel:parent():h() < self._info_text:bottom() and min_font_size < font_size do
			self._info_text:set_font_size(font_size)

			local _, _, _, h = self._info_text:text_rect()

			self._info_text:set_h(h)

			font_size = font_size - 1
		end

		if not recursive and self._info_panel:parent():h() < self._info_text:bottom() then
			print("[PlayerInventoryGui] Info text dynamic font sizer failed")

			local x = self._info_text:world_left() + 1
			local y = self._info_panel:parent():world_bottom() - self._info_text:line_height()
			local index = self._info_text:point_to_index(x, y)
			local text = self._info_text:text()
			text = utf8.sub(text, 1, index)
			local last = utf8.sub(text, -1)

			while last == " " or last == "\n" do
				last = utf8.sub(text, -2, -1)

				if last ~= "." then
					text = utf8.sub(text, 1, -2)
				end
			end

			text = text .. "..."

			return self:set_info_text(text, color_ranges, true)
		end
	end

	self._info_panel:set_top(self._info_text:bottom())
	self._info_panel:set_h(self._info_panel:parent():h() - self._info_panel:top())
end

function PlayerInventoryGui:_get_melee_weapon_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local stats_data = managers.blackmarket:get_melee_weapon_stats(name)
	local multiple_of = {}
	local has_non_special = managers.player:has_category_upgrade("player", "non_special_melee_multiplier")
	local has_special = managers.player:has_category_upgrade("player", "melee_damage_multiplier")
	local non_special = managers.player:upgrade_value("player", "non_special_melee_multiplier", 1) - 1
	local special = managers.player:upgrade_value("player", "melee_damage_multiplier", 1) - 1

	for i, stat in ipairs(self._stats_shown) do
		local skip_rounding = stat.num_decimals
		base_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}
		mods_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}
		skill_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}

		if stat.name == "damage" then
			local base_min = stats_data.min_damage * tweak_data.gui.stats_present_multiplier
			local base_max = stats_data.max_damage * tweak_data.gui.stats_present_multiplier
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1)
			local skill_mul = dmg_mul * ((has_non_special and has_special and math.max(non_special, special) or 0) + 1) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
			skill_stats[stat.name] = {
				min_value = skill_min,
				max_value = skill_max,
				value = (skill_min + skill_max) / 2,
				skill_in_effect = skill_min > 0 or skill_max > 0
			}
		elseif stat.name == "damage_effect" then
			local base_min = stats_data.min_damage_effect
			local base_max = stats_data.max_damage_effect
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1) - 1
			local gst_skill = managers.player:upgrade_value("player", "melee_knockdown_mul", 1) - 1
			local skill_mul = (1 + dmg_mul) * (1 + gst_skill) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			skill_stats[stat.name] = {
				skill_min = skill_min,
				skill_max = skill_max,
				min_value = skill_min,
				max_value = skill_max,
				value = (skill_min + skill_max) / 2,
				skill_in_effect = skill_min > 0 or skill_max > 0
			}
		elseif stat.name == "attack_speed" then
			local base = tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t / (tweak_data.blackmarket.melee_weapons[name].anim_speed_mult or 1)
			base = base / (tweak_data.blackmarket.melee_weapons[name].stats.speed_mult or 1)
			local skill = managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "impact_delay" then
			local base = (tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].melee_damage_delay and tweak_data.blackmarket.melee_weapons[name].melee_damage_delay / (tweak_data.blackmarket.melee_weapons[name].anim_speed_mult or 1)) or 0
			base = base / (tweak_data.blackmarket.melee_weapons[name].stats.speed_mult or 1)
			local skill = managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "charge_time" then
			local base = stats_data.charge_time
			local skill = managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "cleave" then
			local base = (tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].stats.cleave) or 1
			base_stats[stat.name] = {
				min_value = base,
				max_value = base,
				value = base
			}
		elseif stat.name == "range" then
			local base_min = stats_data.range
			local base_max = stats_data.range
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
		elseif stat.name == "concealment" then
			local base = managers.blackmarket:_calculate_melee_weapon_concealment(name)
			local skill = managers.blackmarket:concealment_modifier("melee_weapons")
			base_stats[stat.name] = {
				min_value = base,
				max_value = base,
				value = base
			}
			skill_stats[stat.name] = {
				min_value = skill,
				max_value = skill,
				value = skill,
				skill_in_effect = skill > 0
			}
		end

		if stat.multiple_of then
			table.insert(multiple_of, {
				stat.name,
				stat.multiple_of
			})
		end

		base_stats[stat.name].real_value = base_stats[stat.name].value
		mods_stats[stat.name].real_value = mods_stats[stat.name].value
		skill_stats[stat.name].real_value = skill_stats[stat.name].value
		base_stats[stat.name].real_min_value = base_stats[stat.name].min_value
		mods_stats[stat.name].real_min_value = mods_stats[stat.name].min_value
		skill_stats[stat.name].real_min_value = skill_stats[stat.name].min_value
		base_stats[stat.name].real_max_value = base_stats[stat.name].max_value
		mods_stats[stat.name].real_max_value = mods_stats[stat.name].max_value
		skill_stats[stat.name].real_max_value = skill_stats[stat.name].max_value
	end

	for i, data in ipairs(multiple_of) do
		local multiplier = data[1]
		local stat = data[2]
		base_stats[multiplier].min_value = base_stats[stat].real_min_value * base_stats[multiplier].real_min_value
		base_stats[multiplier].max_value = base_stats[stat].real_max_value * base_stats[multiplier].real_max_value
		base_stats[multiplier].value = (base_stats[multiplier].min_value + base_stats[multiplier].max_value) / 2
	end

	for i, stat in ipairs(self._stats_shown) do
		if not stat.index then
			if skill_stats[stat.name].value and base_stats[stat.name].value then
				skill_stats[stat.name].value = base_stats[stat.name].value * skill_stats[stat.name].value
				base_stats[stat.name].value = base_stats[stat.name].value
			end

			if skill_stats[stat.name].min_value and base_stats[stat.name].min_value then
				skill_stats[stat.name].min_value = base_stats[stat.name].min_value * skill_stats[stat.name].min_value
				base_stats[stat.name].min_value = base_stats[stat.name].min_value
			end

			if skill_stats[stat.name].max_value and base_stats[stat.name].max_value then
				skill_stats[stat.name].max_value = base_stats[stat.name].max_value * skill_stats[stat.name].max_value
				base_stats[stat.name].max_value = base_stats[stat.name].max_value
			end
		end
	end

	return base_stats, mods_stats, skill_stats
end

function PlayerInventoryGui:_get_armor_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({
		armors = name
	}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_risk = math.round(detection_risk * 100)
	local bm_armor_tweak = tweak_data.blackmarket.armors[name]
	local upgrade_level = bm_armor_tweak.upgrade_level

	for i, stat in ipairs(self._stats_shown) do
		base_stats[stat.name] = {
			value = 0
		}
		mods_stats[stat.name] = {
			value = 0
		}
		skill_stats[stat.name] = {
			value = 0
		}

		if stat.name == "armor" then
			local base = tweak_data.player.damage.ARMOR_INIT
			local mod = managers.player:body_armor_value("armor", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = (base_stats[stat.name].value + managers.player:body_armor_skill_addend(name) * tweak_data.gui.stats_present_multiplier) * managers.player:body_armor_skill_multiplier(name) - base_stats[stat.name].value
			}
		elseif stat.name == "health" then
			local base = tweak_data.player.damage.HEALTH_INIT
			local mod = managers.player:health_skill_addend()
			base_stats[stat.name] = {
				value = (base + mod) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = base_stats[stat.name].value * managers.player:health_skill_multiplier() - base_stats[stat.name].value
			}
		elseif stat.name == "concealment" then
			base_stats[stat.name] = {
				value = managers.player:body_armor_value("concealment", upgrade_level)
			}
			skill_stats[stat.name] = {
				value = managers.blackmarket:concealment_modifier("armors", upgrade_level)
			}
		elseif stat.name == "movement" then
			local base = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 100 * tweak_data.gui.stats_present_multiplier
			local movement_penalty = managers.player:body_armor_value("movement", upgrade_level)
			local base_value = movement_penalty * base
			base_stats[stat.name] = {
				value = base_value
			}
			local skill_mod = managers.player:movement_speed_multiplier(false, false, upgrade_level, 1)
			local val = base * skill_mod
			val = Utl.round(val, 2)
			base_value = Utl.round(base_value, 2)
			local skill_value = val - base_value
			skill_stats[stat.name] = {
				value = skill_value,
				skill_in_effect = skill_value > 0
			}
		elseif stat.name == "dodge" then
			local base = 0
			local mod = managers.player:body_armor_value("dodge", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * 100
			}
			skill_stats[stat.name] = {
				value = managers.player:skill_dodge_chance(false, false, false, name, detection_risk) * 100
			}
		elseif stat.name == "deflection" then
			local base = 0
			local mod = managers.player:body_armor_value("deflection", upgrade_level, 0)
			base_stats[stat.name] = {value = (base + mod) * 100}
			skill_stats[stat.name] = {value = managers.player:get_deflection_from_skills() * 100}
		elseif stat.name == "damage_shake" then
			local base = tweak_data.gui.armor_damage_shake_base
			local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
			local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
			local base_value = base
			local mod_value = base / mod - base_value
			local skill_value = base / mod / skill - base_value - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
			base_stats[stat.name] = {
				value = (base_value + mod_value) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = skill_value * tweak_data.gui.stats_present_multiplier
			}
		elseif stat.name == "stamina" then
			local stamina_data = tweak_data.player.movement_state.stamina
			local base = stamina_data.STAMINA_INIT
			local mod = managers.player:body_armor_value("stamina", upgrade_level)
			local skill = managers.player:stamina_multiplier()
			local base_value = base
			local mod_value = base * mod - base_value
			local skill_value = base * mod * skill - base_value - mod_value
			base_stats[stat.name] = {
				value = base_value + mod_value
			}
			skill_stats[stat.name] = {
				value = skill_value
			}
		elseif stat.name == "crit" then
			local base = 0
			local mod = managers.player:body_armor_value("crit", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * 100
			}
			skill_stats[stat.name] = {
				value = managers.player:critical_hit_chance(detection_risk) * 100
			}
		end

		skill_stats[stat.name].skill_in_effect = skill_stats[stat.name].skill_in_effect or skill_stats[stat.name].value ~= 0
	end

	if managers.player:has_category_upgrade("player", "armor_to_health_conversion") then
		local conversion_ratio = managers.player:upgrade_value("player", "armor_to_health_conversion") * 0.01
		local converted_armor = (base_stats.armor.value + skill_stats.armor.value) * conversion_ratio
		local skill_in_effect = converted_armor ~= 0
		skill_stats.armor.value = skill_stats.armor.value - converted_armor
		skill_stats.health.value = skill_stats.health.value + converted_armor
		skill_stats.armor.skill_in_effect = skill_in_effect
		skill_stats.health.skill_in_effect = skill_in_effect
	end

	return base_stats, mods_stats, skill_stats
end

function PlayerInventoryGui:setup_player_stats(panel)
	local data = {
		{
			name = "armor"
		},
		{
			name = "health"
		},
		{
			name = "deflection"
		},
		{
			name = "dodge",
			procent = true,
			revert = true
		},
		{
			index = true,
			name = "concealment"
		},
		{
			procent = true,
			name = "movement"
		},
		{
			name = "stamina"
		},
		{
			name = "crit",
			procent = true,
			revert = true
		}
	}
	local stats_panel = panel:child("stats_panel")

	if alive(stats_panel) then
		panel:remove(stats_panel)

		stats_panel = nil
	end

	stats_panel = panel:panel({
		name = "stats_panel"
	})
	local panel = stats_panel:panel({
		h = 20,
		layer = 1,
		w = stats_panel:w()
	})
	self._player_stats_shown = data
	self._player_stats_titles = {
		total = stats_panel:text({
			x = 135,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))
		}),
		base = stats_panel:text({
			alpha = 0.75,
			x = 200,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))
		}),
		skill = stats_panel:text({
			alpha = 0.75,
			x = 259,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.resource,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))
		})
	}
	local x = 0
	local y = 20
	local text_panel = nil
	local text_columns = {
		{
			size = 100,
			name = "name"
		},
		{
			size = 60,
			name = "total",
			align = "right"
		},
		{
			align = "right",
			name = "base",
			blend = "add",
			alpha = 0.75,
			size = 60
		},
		{
			align = "right",
			name = "skill",
			blend = "add",
			alpha = 0.75,
			size = 60,
			color = tweak_data.screen_colors.resource
		}
	}
	self._player_stats_texts = {}
	self._player_stats_panel = stats_panel:panel()

	for i, stat in ipairs(data) do
		panel = self._player_stats_panel:panel({
			name = "weapon_stats",
			h = 20,
			x = 0,
			layer = 1,
			y = y,
			w = self._player_stats_panel:w()
		})

		if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
			panel:rect({
				name = tostring(i),
				color = Color.black:with_alpha(0.4)
			})
		end

		x = 2
		y = y + 20
		self._player_stats_texts[stat.name] = {}

		for _, column in ipairs(text_columns) do
			text_panel = panel:panel({
				layer = 0,
				x = x,
				w = column.size,
				h = panel:h()
			})
			self._player_stats_texts[stat.name][column.name] = text_panel:text({
				text = "0",
				layer = 1,
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				align = column.align,
				alpha = column.alpha,
				blend_mode = column.blend,
				color = column.color or tweak_data.screen_colors.text
			})
			x = x + column.size

			if column.name == "name" then
				self._player_stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
			end
		end
	end
end

function PlayerInventoryGui:_update_info_weapon(name)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = name == "primary" and "primaries" or "secondaries"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local equipped_slot = managers.blackmarket:equipped_weapon_slot(category)
	local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(equipped_item.weapon_id, category, equipped_slot)
	local text_string = string.format("##%s##  %s", player_loadout_data[name].info_text, managers.experience:cash_string(managers.money:get_weapon_slot_sell_value(category, equipped_slot)))

	self:set_info_text(text_string, {
		player_loadout_data[name].info_text_color or tweak_data.screen_colors.text,
		add_colors_to_text_object = true
	})

	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[equipped_item.weapon_id].stats_modifiers

	for _, stat in ipairs(self._stats_shown) do
		self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

		local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
		local base = base_stats[stat.name].value

		self._stats_texts[stat.name].total:set_alpha(1)
		self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
		self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
		self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
		self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")

		if base < value then
			self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
		elseif value < base then
			self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
		else
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end

		if stat.percent then
			if math.round(value) >= 100 then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
			end
		elseif stat.name == "concealment" then --Sets concealment text to purple when maxed.
			if base_stats.concealment.value + mods_stats.concealment.value + skill_stats.concealment.value >= tweak_data.concealment_cap then
				self._stats_texts.concealment.total:set_color(tweak_data.screen_colors.stat_maxed)
			end
		elseif stat.index then
			--nothing
		elseif tweak_stats[stat.name] then
			local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
			local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

			if stat.offset then
				local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
				max_stat = max_stat - offset
			end

			if without_skill >= max_stat then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
			end
		end
	end
end

function PlayerInventoryGui:_update_info_melee(name)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = "melee_weapons"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(equipped_item)
	local text_string = string.format("%s", player_loadout_data.melee_weapon.info_text)

	self:set_info_text(text_string)

	local value, value_min, value_max = nil

	for _, stat in ipairs(self._stats_shown) do
		if stat.range then
			value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
			value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
		end

		value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
		local base, base_min, base_max, skill, skill_min, skill_max = nil

		if stat.range then
			base_min = base_stats[stat.name].min_value
			base_max = base_stats[stat.name].max_value
			skill_min = skill_stats[stat.name].min_value
			skill_max = skill_stats[stat.name].max_value
		end

		base = base_stats[stat.name].value
		skill = skill_stats[stat.name].value
		if stat.name == "range" then
			base = base / 100
			skill = skill / 100
			value = value / 100
		end
		local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
		local equip_text = value and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(value, stat.round_value)) or format_round(value, stat.round_value)
		local base_text = base and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(base, stat.round_value)) or format_round(base, stat.round_value)
		local skill_text = skill_stats[stat.name].value and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(skill_stats[stat.name].value, stat.round_value)) or format_round(skill_stats[stat.name].value, stat.round_value)
		local base_min_text = base_min and format_round(base_min, true)
		local base_max_text = base_max and format_round(base_max, true)
		local value_min_text = value_min and format_round(value_min, true)
		local value_max_text = value_max and format_round(value_max, true)
		local skill_min_text = skill_min and format_round(skill_min, true)
		local skill_max_text = skill_max and format_round(skill_max, true)

		if stat.range then
			if base_min ~= base_max then
				base_text = base_min_text .. " (" .. base_max_text .. ")"
			end

			if value_min ~= value_max then
				equip_text = value_min_text .. " (" .. value_max_text .. ")"
			end

			if skill_min ~= skill_max then
				skill_text = skill_min_text .. " (" .. skill_max_text .. ")"
			end
		end

		if stat.suffix then
			base_text = base_text .. tostring(stat.suffix)
			equip_text = equip_text .. tostring(stat.suffix)
			skill_text = skill_text .. tostring(stat.suffix)
		end

		if stat.prefix then
			base_text = tostring(stat.prefix) .. base_text
			equip_text = tostring(stat.prefix) .. equip_text
			skill_text = tostring(stat.prefix) .. skill_text
		end

		self._stats_texts[stat.name].total:set_alpha(1)
		self._stats_texts[stat.name].total:set_text(equip_text)
		self._stats_texts[stat.name].base:set_text(base_text)
		self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. skill_text or "")

		local positive = value ~= 0 and base < value
		local negative = value ~= 0 and value < base

		if stat.inverse then
			local temp = positive
			positive = negative
			negative = temp
		end

		if stat.range then
			if positive then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
			elseif negative then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
			end
		elseif positive then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
		elseif negative then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
		else
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end
	end
end

function PlayerInventoryGui:_update_stats(name)
	if name == self._current_stat_shown then
		return
	end

	self._current_stat_shown = name

	self:set_info_text("")
	self._info_panel:clear()

	if name == "primary" or name == "secondary" then
		local stats = {
			{
				round_value = true,
				name = "magazine",
				stat_name = "extra_ammo"
			},
			{
				round_value = true,
				name = "totalammo",
				stat_name = "total_ammo_mod"
			},
			{
				round_value = true,
				name = "fire_rate"
			},
			{
				name = "damage"
			},
			{
				percent = true,
				name = "spread",
				offset = true,
				revert = true
			},
			{
				percent = true,
				name = "recoil",
				offset = true,
				revert = true
			},
			{
				index = true,
				name = "concealment"
			}
		}

		table.insert(stats, {
			inverted = true,
			name = "reload"
		})
		self:set_weapon_stats(self._info_panel, stats)
		self:_update_info_weapon(name)
	elseif name == "outfit_armor" then
		self:_update_info_armor(name)
	elseif name == "outfit_player_style" then
		self:_update_info_player_style(name)
	elseif name == "melee" then
		self:set_melee_stats(self._info_panel, {
			{
				range = true,
				name = "damage"
			},
			{
				range = true,
				name = "damage_effect",
				multiple_of = "damage"
			},
			{
				range = true,
				name = "cleave",
			},
			{
				inverse = true,
				name = "attack_speed",
				num_decimals = 1,
				suffix = managers.localization:text("menu_seconds_suffix_short")
			},
			{
				inverse = true,
				name = "charge_time",
				num_decimals = 1,
				suffix = managers.localization:text("menu_seconds_suffix_short")
			},
			{
				inverse = true,
				name = "impact_delay",
				num_decimals = 1,
				suffix = managers.localization:text("menu_seconds_suffix_short")
			},
			{
				name = "range",
				num_decimals = 2,
				suffix = "m"
			},
			{
				index = true,
				name = "concealment"
			}
		})
		self:_update_info_melee(name)
	elseif name == "skilltree" then
		local skilltrees = {}

		for _, tree in ipairs(tweak_data.skilltree.skill_pages_order) do
			table.insert(skilltrees, {
				name = tree,
				name_s = managers.localization:to_upper_text(tweak_data.skilltree.skilltree[tree].name_id)
			})
		end

		self:set_skilltree_stats(self._info_panel, skilltrees)
		self:_update_info_skilltree(name)
	elseif name == "specialization" then
		self:_update_info_specialization(name)
	elseif name == "character" then
		self:_update_info_character(name)
	elseif name == "mask" then
		self:_update_info_mask(name)
	elseif name == "throwable" then
		self:_update_info_throwable(name)
	elseif name == "deployable_primary" then
		self:_update_info_deployable(name, 1)
	elseif name == "deployable_secondary" then
		self:_update_info_deployable(name, 2)
	elseif name == "infamy" then
		self:_update_info_infamy(name)
	elseif name == "crew" then
		self:_update_info_crew(name)
	else
		local box = self._boxes_by_name[name]
		local stats = {
			{
				round_value = true,
				name = "magazine",
				stat_name = "extra_ammo"
			},
			{
				round_value = true,
				name = "totalammo",
				stat_name = "total_ammo_mod"
			},
			{
				round_value = true,
				name = "fire_rate"
			},
			{
				name = "damage"
			},
			{
				percent = true,
				name = "spread",
				offset = true,
				revert = true
			},
			{
				percent = true,
				name = "recoil",
				offset = true,
				revert = true
			},
			{
				index = true,
				name = "concealment"
			}
		}

		table.insert(stats, {
			inverted = true,
			name = "reload"
		})

		if box and box.params and box.params.mod_data then
			if box.params.mod_data.selected_tab == "weapon_cosmetics" then
				local cosmetics = managers.blackmarket:get_weapon_cosmetics(box.params.mod_data.category, box.params.mod_data.slot)

				if cosmetics then
					local c_td = tweak_data.blackmarket.weapon_skins[cosmetics.id] or {}

					if c_td.default_blueprint then
						self:set_weapon_stats(self._info_panel, stats)
					end

					self:_update_info_weapon_cosmetics(name, cosmetics)
				end
			else
				self:set_weapon_mods_stats(self._info_panel, stats)
				self:_update_info_weapon_mod(box)
			end
		else
			self:_update_info_generic(name)
		end
	end
end

function PlayerInventoryGui:_update_info_weapon_cosmetics(name, cosmetics)
	local c_td = tweak_data.blackmarket.weapon_skins[cosmetics.id] or {}
	local quality_id = tweak_data.economy.qualities[cosmetics.quality] and tweak_data.economy.qualities[cosmetics.quality].name_id and cosmetics.quality or "mint"
	local quality_text = managers.localization:text(tweak_data.economy.qualities[quality_id].name_id)
	local name_text = managers.localization:text(c_td.name_id)
	local info_text = managers.localization:to_upper_text("menu_cash_safe_result", {
		quality = quality_text,
		name = name_text
	})

	if cosmetics.bonus then
		local bonus = tweak_data.blackmarket.weapon_skins[cosmetics.id] and tweak_data.blackmarket.weapon_skins[cosmetics.id].bonus

		if bonus and not c_td.default_blueprint then
			local bonus_tweak = tweak_data.economy.bonuses[bonus]
			local bonus_value = bonus_tweak.exp_multiplier and bonus_tweak.exp_multiplier * 100 - 100 .. "%" or bonus_tweak.money_multiplier and bonus_tweak.money_multiplier * 100 - 100 .. "%"
			info_text = info_text .. "\n" .. managers.localization:text("dialog_new_tradable_item_bonus", {
				bonus = managers.localization:text(bonus_tweak.name_id, {
					team_bonus = bonus_value
				})
			})
		end
	end

	self:set_info_text(info_text, {
		tweak_data.economy.rarities[c_td.rarity].color,
		add_colors_to_text_object = true
	})

	if c_td.default_blueprint then
		local box = self._boxes_by_name[name]
		local category = box.params.mod_data.category
		local slot = box.params.mod_data.slot
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(c_td.weapon_id, category, slot, c_td.default_blueprint)
		local crafted = managers.blackmarket:get_crafted_category_slot(category, slot)
		local tweak_stats = tweak_data.weapon.stats
		local modifier_stats = tweak_data.weapon[crafted.weapon_id].stats_modifiers

		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local base = base_stats[stat.name].value

			self._stats_texts[stat.name].total:set_alpha(1)
			self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
			self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
			self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")

			if base < value then
				self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
			elseif value < base then
				self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			end

			if stat.percent then
				if math.round(value) >= 100 then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.index then
				-- Nothing
			elseif tweak_stats[stat.name] then
				local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

				if stat.offset then
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
					max_stat = max_stat - offset
				end

				if without_skill >= max_stat then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
				end
			end
		end
	end
end

--Colored desc support
function PlayerInventoryGui:_update_info_throwable(name)
	local throwable_id, amount = managers.blackmarket:equipped_projectile()
	local projectile_data = throwable_id and tweak_data.blackmarket.projectiles[throwable_id]
	local text_string = ""

	if projectile_data then
		local is_perk_throwable = tweak_data.blackmarket.projectiles[throwable_id].base_cooldown and not tweak_data.blackmarket.projectiles[throwable_id].base_cooldown_no_perk
		local amount = is_perk_throwable and 1 or math.round(tweak_data.blackmarket.projectiles[throwable_id].max_amount *  managers.player:upgrade_value("player", "throwables_multiplier", 1))
		local has_short_desc = managers.localization:exists(projectile_data.desc_id .. "_short")

		text_string = text_string .. managers.localization:text(projectile_data.name_id) .. " (x" .. tostring(amount) .. ")" .. "\n\n"

		if self:_should_show_description() then
			text_string = text_string .. managers.localization:text((has_short_desc and projectile_data.desc_id .. "_short") or projectile_data.desc_id) .. "\n"
		end
	end

	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end

function PlayerInventoryGui:_update_info_specialization(name)
	local text_string = ""
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	local specialization_data = tweak_data.skilltree.specializations[current_specialization]

	if specialization_data then
		local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
		text_string = managers.localization:text(specialization_data.name_id) .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")\n"

		if current_tier < max_tier then
			local current_points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "current_points")
			local points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "points")
			text_string = text_string .. managers.localization:text("menu_st_progress", {
				progress = string.format("%i/%i", current_points, points)
			}) .. "\n"
		end

		if self:_should_show_description() and specialization_data.desc_id then
			text_string = text_string .. "\n" .. managers.localization:text(specialization_data.desc_id)
		end
	end
	
	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end

function PlayerInventoryGui:_update_info_deployable(name, slot)
	local deployable_id = managers.blackmarket:equipped_deployable(slot)
	local equipment_data = deployable_id and tweak_data.equipments[deployable_id]
	local deployable_data = deployable_id and tweak_data.blackmarket.deployables[deployable_id]
	local text_string = ""

	if deployable_data and equipment_data then
		local amount = equipment_data.quantity[1] or 1
		local amount_2 = nil
		local has_short_desc = managers.localization:exists(deployable_data.desc_id .. "_short")
		local deployable_uses = nil

		if deployable_id == "doctor_bag" then
			deployable_uses = tweak_data.upgrades.doctor_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "amount_increase") or 0)
		elseif deployable_id == "ammo_bag" then
			deployable_uses = tweak_data.upgrades.ammo_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "ammo_increase") or 0)
		elseif deployable_id == "trip_mine" then
			amount_2 = (equipment_data.quantity[2] or 1) + (managers.player:equiptment_upgrade_value("shape_charge", "quantity") or 0)
		elseif deployable_id == "ecm_jammer" then
			local mult_1 = managers.player:has_category_upgrade(deployable_id, "duration_multiplier") and managers.player:equiptment_upgrade_value(deployable_id, "duration_multiplier") or 1
			local mult_2 = managers.player:has_category_upgrade(deployable_id, "duration_multiplier_2") and managers.player:equiptment_upgrade_value(deployable_id, "duration_multiplier_2") or 1
			deployable_uses = tweak_data.upgrades.ecm_jammer_base_battery_life * mult_1 * mult_2
		elseif deployable_id == "sentry_gun_silent" then
			deployable_id = "sentry_gun"
		end

		if deployable_id == "sentry_gun" then
			local ammo_cost = { --SentryGunBase isn't loaded outside of gameplay so I gotta dupe the cost table here, maybe I'll move it to tweak_data
				0.4,
				0.35,
				0.3
			}
			local cost_reduction = managers.player:has_category_upgrade(deployable_id, "cost_reduction") and managers.player:equiptment_upgrade_value(deployable_id, "cost_reduction") or 1
			deployable_uses = ammo_cost[cost_reduction] * 100 .. "%"
		end

		amount = amount + (managers.player:equiptment_upgrade_value(deployable_id, "quantity") or 0)

		if slot and slot > 1 then
			amount = math.ceil(amount / 2)
			if amount_2 then
				amount_2 = math.ceil(amount_2 / 2)
			end
		end

		text_string = text_string .. managers.localization:text(deployable_data.name_id) .. " (x" .. tostring(amount) .. (amount_2 and ( "|x" .. tostring(amount_2)) or "" ) .. ")" .. "\n\n"

		if self:_should_show_description() then
			text_string = text_string .. managers.localization:text(((has_short_desc and deployable_data.desc_id .. "_short") or deployable_data.desc_id), {
				BTN_INTERACT = managers.localization:btn_macro("interact", true),
				BTN_USE_ITEM = managers.localization:btn_macro("use_item", true),
				deployable_uses = deployable_uses
			}) .. "\n"
		end
	end

	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end