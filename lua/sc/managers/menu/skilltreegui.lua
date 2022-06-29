--Reset Perk Deck, original script by chip
-- modeled after SkillTreeGui:max_specialization
function SkillTreeGui:__rpd__reset_perk_deck(tree)
	if tree then
		local points_to_refund = managers.skilltree:__rpd__get_specialization_tree_points(tree)
		local perk_deck_name = managers.localization:text(tweak_data.skilltree.specializations[tree].name_id)
		local dialog_data = {
			title = managers.localization:text("rpd_menu_dialog_title"),
			text = managers.localization:text("rpd_menu_dialog_text", {
				perk_deck_name = perk_deck_name,
				points_to_refund = managers.experience:experience_string(points_to_refund)
			}),
			focus_button = 2,
			button_list = {
				{
					text = managers.localization:text("dialog_yes"),
					callback_func = callback(self, self, "__rpd__actually_reset_perk_deck", tree)
				},
				{
					cancel_button = true,
					text = managers.localization:text("dialog_no")
				}
			}
		}

		managers.system_menu:show(dialog_data)
	end
end

-- modeled after SkillTreeGui:_actually_max_specialization
function SkillTreeGui:__rpd__actually_reset_perk_deck(tree)
	managers.skilltree:__rpd__reset_specialization(tree)

	self:refresh_btns()
	self:refresh_spec_points()

	for _, tree_item in ipairs(self._spec_tree_items) do
		tree_item:refresh()

		for _, item in ipairs(tree_item:items()) do
			item:refresh()
		end
	end
end

-- add another button to the buttons available to the perk deck menu
local rpd_original_skilltreegui_setup = SkillTreeGui._setup
function SkillTreeGui:_setup(...)
	rpd_original_skilltreegui_setup(self, ...)

	-- add our reset button to the list
	if self._btns then
		local rpd_btn_x = 10 -- value taken from original setup
		local rpd_btn_data = {
			btn = "BTN_STICK_L", -- we need to have one set, left stick is not used in this menu
			name = "rpd_menu_button",
			prio = 3, -- same priority as the max perk deck button
			callback = callback(self, self, "__rpd__reset_perk_deck")
		}

		local btn = SpecializationGuiButtonItem:new(self._buttons, rpd_btn_data, rpd_btn_x)
		self._btns["rpd_reset_perk_deck"] = btn
	end

	-- force refresh so the reset button can show on the default selection
	self:refresh_btns()
end

-- inject our button in the list to show if applicable
local rpd_original_skilltreegui_show_btns = SkillTreeGui.show_btns
function SkillTreeGui:show_btns(...)
	local data = {...}

	-- only show the reset button if the selected perk deck has points allocated
	local item = self._selected_spec_item
	if item and item.tree then
		local tree = item:tree()
		local points = managers.skilltree:__rpd__get_specialization_tree_points(tree)
		if points > 0 then
			table.insert(data, "rpd_reset_perk_deck")
		end
	end
	
	return rpd_original_skilltreegui_show_btns(self, unpack(data))
end

