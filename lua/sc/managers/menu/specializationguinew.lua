local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function filter_hide_unavailable_items(item)
	local dlc = tweak_data:get_raw_value("skilltree", "specializations", item.specialization_id, "dlc")

	if dlc and not managers.dlc:is_dlc_unlocked(dlc) and tweak_data:get_raw_value("lootdrop", "global_values", dlc, "hide_unavailable") then
		return false
	end

	return true
end

local MOUSEOVER_COLOR = tweak_data.screen_colors.button_stage_2
local BUTTON_COLOR = tweak_data.screen_colors.button_stage_3
local S_FONT = tweak_data.menu.pd2_small_font
local S_FONT_SIZE = tweak_data.menu.pd2_small_font_size
local M_FONT = tweak_data.menu.pd2_medium_font
local M_FONT_SIZE = tweak_data.menu.pd2_medium_font_size

function SpecializationGuiNew:update_detail_panels(item)
	self._details_panel:clear()
	BoxGuiObject:new(self._details_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	if #self._scroll_list:items() <= 0 then
		return
	end

	local selected_item = self._scroll_list:selected_item()

	selected_item:set_horizontal_index(self._scroll_horizontal_index)
	self._details_panel:rect({
		alpha = 0.5,
		layer = 0,
		color = Color.black
	})

	local y_pos = 0
	local margin = 10
	local title_text = self._details_panel:text({
		name = "details_title",
		layer = 1,
		text = managers.localization:text(selected_item.specialization_data.name_id),
		font = M_FONT,
		font_size = S_FONT_SIZE
	})

	make_fine_text(title_text)
	title_text:set_center_x(self._details_panel:w() / 2)
	title_text:set_y(y_pos + margin)

	y_pos = title_text:bottom()
	local specialization_descs_tweak = tweak_data.upgrades.specialization_descs[selected_item.specialization_id]
	local text_params = {
		text = "",
		wrap = true,
		word_wrap = true,
		layer = 1,
		x = margin,
		w = self._details_panel:w() - margin * 2,
		font = M_FONT,
		font_size = S_FONT_SIZE
	}
	local is_dlc_locked = selected_item:is_dlc_locked()

	if is_dlc_locked then
		local dlc = tweak_data:get_raw_value("skilltree", "specializations", selected_item.specialization_id, "dlc")

		if dlc and not managers.dlc:is_dlc_unlocked(dlc) then
			local unlock_id = tweak_data:get_raw_value("lootdrop", "global_values", dlc, "unlock_id") or "bm_menu_dlc_locked"

			if tweak_data:get_raw_value("lootdrop", "global_values", dlc, "hide_unavailable") then
				unlock_id = "bm_menu_dlc_locked"
			end

			text_params.text = managers.localization:to_upper_text(unlock_id)
			text_params.color = tweak_data.screen_colors.important_1
			local lock_text = self._details_panel:text(text_params)

			ExtendedPanel.make_fine_text(lock_text)
			lock_text:set_y(y_pos + margin)

			y_pos = lock_text:bottom()
			text_params.color = Color.white
		end
	end

	if self._scroll_horizontal_index == 0 then
		local desc_string = managers.localization:text(selected_item.specialization_data.desc_id)
		desc_string = desc_string:gsub("\n\n", "\n")

		local resource_color = {}
		for color_id in string.gmatch(desc_string, "#%{(.-)%}#") do
			table.insert(resource_color, tweak_data.screen_colors[color_id])
		end
		desc_string = desc_string:gsub("#%{(.-)%}#", "##")

		local desc_text = self._details_panel:text({
			name = "details_desc",
			wrap = true,
			word_wrap = true,
			layer = 1,
			x = margin,
			w = self._details_panel:w() - margin * 2,
			text = desc_string,
			font = M_FONT,
			font_size = S_FONT_SIZE
		})

		managers.menu_component:add_colors_to_text_object(desc_text, unpack(resource_color))
		ExtendedPanel.make_fine_text(desc_text)
		desc_text:set_y(y_pos + margin)

		y_pos = desc_text:bottom()
		local current_tier = managers.skilltree:get_specialization_value(selected_item.specialization_id, "tiers", "current_tier")

		for index, spec_data in ipairs(selected_item.specialization_data) do
			if index % 2 ~= 0 then
				local specialization_description = specialization_descs_tweak and specialization_descs_tweak[index] or {}
				local multi_choice_specialization_descs = {}
				local choice_data = nil

				if spec_data.multi_choice then
					local choice_index = managers.skilltree:get_specialization_value(selected_item.specialization_id, "choices", index)

					if choice_index and choice_index > 0 then
						multi_choice_specialization_descs = tweak_data:get_raw_value("upgrades", "multi_choice_specialization_descs", selected_item.specialization_id, index, choice_index) or {}
						choice_data = spec_data.multi_choice[choice_index]
					end
				end

				local locked = current_tier < index
				local macroes = {
					BTN_ABILITY = managers.localization:btn_macro("throw_grenade"),
					CLONED_CARD = managers.localization:text("menu_deck_multichoice_no_choice")
				}

				for i, d in pairs(specialization_description) do
					macroes[i] = d
				end

				local choice_macroes = {
					BTN_ABILITY = managers.localization:btn_macro("throw_grenade"),
					CLONED_CARD = choice_data and choice_data.name_id and managers.localization:text(choice_data.name_id) or managers.localization:text("menu_deck_multichoice_no_choice")
				}

				for i, d in pairs(multi_choice_specialization_descs) do
					choice_macroes[i] = d
				end

				local desc_string = ""
				local has_desc = false

				if not choice_data or not choice_data.skip_tier_desc and not choice_data.skip_tier_name then
					desc_string = desc_string .. ((spec_data.short_id or spec_data.desc_id) and managers.localization:text(spec_data.short_id or spec_data.desc_id, macroes) or "") .. " "
					has_desc = true
				end

				if choice_data and (choice_data.short_id or choice_data.desc_id) and not is_dlc_locked then
					desc_string = desc_string .. managers.localization:text(choice_data.short_id or choice_data.desc_id, choice_macroes)
					has_desc = true
				end

				text_params.text = has_desc and managers.localization:text("menu_specialization_tier") .. " " .. index .. ": " .. desc_string or ""
				text_params.text = text_params.text:gsub("\n\n", " ")
				text_params.text = text_params.text:gsub("\n", " ")
				text_params.alpha = locked and 0.75 or 1
				local ability_text = self._details_panel:text(text_params)

				managers.menu_component:add_colors_to_text_object(ability_text, tweak_data.screen_colors.resource)
				ExtendedPanel.make_fine_text(ability_text)
				ability_text:set_y(y_pos + margin)

				y_pos = ability_text:bottom()
			end
		end
	else
		local spec_data = selected_item.specialization_data[self._scroll_horizontal_index]
		local specialization_description = specialization_descs_tweak and specialization_descs_tweak[self._scroll_horizontal_index] or {}
		local multi_choice_specialization_descs = {}
		local choice_data = nil

		if spec_data.multi_choice then
			local choice_index = managers.skilltree:get_specialization_value(selected_item.specialization_id, "choices", self._scroll_horizontal_index)

			if choice_index and choice_index > 0 then
				multi_choice_specialization_descs = tweak_data:get_raw_value("upgrades", "multi_choice_specialization_descs", selected_item.specialization_id, self._scroll_horizontal_index, choice_index) or {}
				choice_data = spec_data.multi_choice[choice_index]
			end
		end

		local macroes = {
			BTN_ABILITY = managers.localization:btn_macro("throw_grenade")
		}

		for i, d in pairs(specialization_description) do
			macroes[i] = d
		end

		local choice_macroes = {
			BTN_ABILITY = managers.localization:btn_macro("throw_grenade")
		}

		for i, d in pairs(multi_choice_specialization_descs) do
			choice_macroes[i] = d
		end

		local text_string = ""
		local name_id = spec_data.name_id
		local desc_id = spec_data.desc_id
		text_string = text_string .. string.format("%s:\n%s", managers.localization:text(name_id), managers.localization:text(desc_id, macroes))

		if choice_data and not is_dlc_locked then
			local choice_string = ""
			local choice_name_id = choice_data.name_id
			local choice_desc_id = choice_data.desc_id

			if choice_name_id then
				choice_string = choice_string .. string.format("%s:\n%s", managers.localization:text(choice_name_id), managers.localization:text(choice_desc_id, choice_macroes))
			else
				choice_string = choice_string .. string.format("%s", managers.localization:text(choice_desc_id, choice_macroes))
			end

			if choice_data.shorten_desc then
				choice_string = choice_string:gsub("\n\n", "\n")
			end

			if choice_data.skip_tier_desc then
				text_string = choice_string
			elseif choice_data.skip_tier_name then
				text_string = choice_string .. "\n\n" .. managers.localization:text(desc_id, macroes)
			else
				text_string = text_string .. "\n\n" .. choice_string
			end
		end

		if _G.IS_VR or managers.user:get_setting("show_vr_descs") then
			local vr_desc_data = tweak_data:get_raw_value("vr", "specialization_descs_addons", selected_item.specialization_id, self._scroll_horizontal_index)

			if vr_desc_data then
				local vr_string = managers.localization:text("menu_vr_skill_addon") .. " " .. managers.localization:text(vr_desc_data.desc_id, vr_desc_data.macros)
				text_string = text_string .. string.format("\n\n%s", vr_string)
			end
		end

		text_params.text = text_string
		local ability_text = self._details_panel:text(text_params)

		managers.menu_component:add_colors_to_text_object(ability_text, tweak_data.screen_colors.resource)
		ExtendedPanel.make_fine_text(ability_text)
		ability_text:set_y(y_pos + margin)

		y_pos = ability_text:bottom()
	end
end