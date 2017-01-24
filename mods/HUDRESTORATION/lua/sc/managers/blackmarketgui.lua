if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

function BlackMarketGui:choose_weapon_buy_callback(data)
	local blackmarket_items = managers.blackmarket:get_weapon_category(data.category) or {}
	local new_node_data = {}
	local weapon_tweak = tweak_data.weapon
	local x_id, y_id, x_level, y_level, x_unlocked, y_unlocked, x_skill, y_skill, x_gv, y_gv, x_sn, y_sn
	local item_categories = {}
	for _, item in ipairs(blackmarket_items) do
		local weapon_data = tweak_data.weapon[item.weapon_id]
		local category = weapon_data.recategorize or tweak_data.gui.buy_weapon_category_groups[weapon_data.category] or weapon_data.category
		item_categories[category] = item_categories[category] or {}
		table.insert(item_categories[category], item)
	end
	local sorted_categories = {}
	for category, items in pairs(item_categories) do
		table.insert(sorted_categories, category)
		table.sort(items, function(x, y)
			x_unlocked = x.unlocked
			y_unlocked = y.unlocked
			if x_unlocked ~= y_unlocked then
				return x_unlocked
			end
			x_id = x.weapon_id
			y_id = y.weapon_id
			x_gv = weapon_tweak[x_id].global_value
			y_gv = weapon_tweak[y_id].global_value
			x_sn = x_gv and tweak_data.lootdrop.global_values[x_gv].sort_number or 0
			y_sn = y_gv and tweak_data.lootdrop.global_values[y_gv].sort_number or 0
			if x_sn ~= y_sn then
				return x_sn < y_sn
			end
			x_skill = x.skill_based
			y_skill = y.skill_based
			if x_skill ~= y_skill then
				return y_skill
			end
			x_level = x.level or 0
			y_level = y.level or 0
			if x_level ~= y_level then
				return x_level < y_level
			end
			return x_id < y_id
		end)
	end
	table.sort(sorted_categories, function(x, y)
		return #item_categories[x] > #item_categories[y]
	end)
	local item_data
	for _, category in ipairs(sorted_categories) do
		local items = item_categories[category]
		item_data = {}
		for _, item in ipairs(items) do
			table.insert(item_data, item)
		end
		local name_id = managers.localization:to_upper_text("menu_" .. category)
		table.insert(new_node_data, {
			name = category,
			category = data.category,
			prev_node_data = data,
			name_localized = name_id,
			on_create_func_name = "populate_buy_weapon",
			on_create_data = item_data,
			identifier = self.identifiers.weapon
		})
	end
	new_node_data.buying_weapon = true
	new_node_data.topic_id = "bm_menu_buy_weapon_title"
	new_node_data.topic_params = {
		weapon_category = managers.localization:text("bm_menu_" .. data.category)
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

if GoonBase then
	Hooks:Add("BlackMarketGUIOnPopulateModsActionList", "sc_custom_icon", function(BlackMarketGui, data)
		if data.name then
			data.use_icon = tweak_data.weapon.factory.parts[data.name] and tweak_data.weapon.factory.parts[data.name].alt_icon
			if data.use_icon then
				data.bitmap_texture = data.use_icon
			end
		end
	end)
else
	function BlackMarketGui:populate_mods(data)
		local new_data = {}
		local default_mod = data.on_create_data.default_mod
		local crafted = managers.blackmarket:get_crafted_category(data.prev_node_data.category)[data.prev_node_data.slot]
		local global_values = crafted.global_values or {}
		local ids_id = Idstring(data.name)
		local cosmetic_kit_mod
		local cosmetics_blueprint = crafted.cosmetics and crafted.cosmetics.id and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id] and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id].default_blueprint or {}
		for i, c_mod in ipairs(cosmetics_blueprint) do
			if Idstring(tweak_data.weapon.factory.parts[c_mod].type) == ids_id then
				cosmetic_kit_mod = c_mod
			end
		end
		local gvs = {}
		local mod_t = {}
		local num_steps = #data.on_create_data
		local achievement_tracker = tweak_data.achievement.weapon_part_tracker
		local part_is_from_cosmetic
		local guis_catalog = "guis/"
		for index, mod_t in ipairs(data.on_create_data) do
			local mod_name = mod_t[1]
			local mod_default = mod_t[2]
			local mod_global_value = mod_t[3] or "normal"
			part_is_from_cosmetic = cosmetic_kit_mod == mod_name
			guis_catalog = "guis/"
			local bundle_folder = tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].texture_bundle_folder
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
			end
			new_data = {}
			new_data.type = tweak_data.weapon.factory.parts[mod_name] and tweak_data.weapon.factory.parts[mod_name].type
			new_data.name = mod_name or data.prev_node_data.name
			new_data.name_localized = (mod_name and managers.weapon_factory:get_part_name_by_part_id(mod_name)) or managers.localization:text( "bm_menu_no_mod" )
			new_data.category = data.category or data.prev_node_data and data.prev_node_data.category
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/mods/" .. new_data.name
			new_data.use_icon = tweak_data.weapon.factory.parts[mod_name] and tweak_data.weapon.factory.parts[mod_name].alt_icon
			if new_data.use_icon then
				new_data.bitmap_texture = new_data.use_icon 
			end
			new_data.slot = data.slot or data.prev_node_data and data.prev_node_data.slot
			new_data.global_value = mod_global_value
			new_data.unlocked = not crafted.customize_locked and part_is_from_cosmetic and 1 or mod_default or managers.blackmarket:get_item_amount(new_data.global_value, "weapon_mods", new_data.name, true)
			new_data.equipped = false
			new_data.stream = true
			new_data.default_mod = default_mod
			new_data.is_internal = tweak_data.weapon.factory:is_part_internal(new_data.name)
			new_data.free_of_charge = tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].is_a_unlockable
			new_data.unlock_tracker = achievement_tracker[new_data.name] or false
			if crafted.customize_locked then
				new_data.unlocked = type(new_data.unlocked) == "number" and -math.abs(new_data.unlocked) or new_data.unlocked
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = "guis/textures/pd2/lock_incompatible"
				new_data.dlc_locked = "bm_menu_cosmetic_locked_weapon"
			elseif not part_is_from_cosmetic and tweak_data.lootdrop.global_values[mod_global_value] and tweak_data.lootdrop.global_values[mod_global_value].dlc and not managers.dlc:is_dlc_unlocked(mod_global_value) then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = self:get_lock_icon(new_data)
				new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or "bm_menu_dlc_locked"
			end
			local weapon_id = managers.blackmarket:get_crafted_category(new_data.category)[new_data.slot].weapon_id
			new_data.price = managers.money:get_weapon_modify_price(weapon_id, new_data.name, new_data.global_value)
			new_data.can_afford = part_is_from_cosmetic or managers.money:can_afford_weapon_modification(weapon_id, new_data.name, new_data.global_value)
			local font, font_size
			local no_upper = false
			if not new_data.lock_texture and (not new_data.unlocked or new_data.unlocked == 0) then
				local selected_text, noselected_text
				if not new_data.dlc_locked and new_data.unlock_tracker then
					local text_id = "bm_menu_no_items"
					local progress = ""
					local stat = new_data.unlock_tracker.stat or false
					local max_progress = new_data.unlock_tracker.max_progress or 0
					local award = new_data.unlock_tracker.award or false
					if new_data.unlock_tracker.text_id then
						if max_progress > 0 and stat then
							local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
							if progress_left > 0 then
								progress = tostring(progress_left)
								text_id = new_data.unlock_tracker.text_id
								font = small_font
								font_size = small_font_size
								no_upper = true
							end
						elseif award then
							local achievement = managers.achievment:get_info(award)
							text_id = new_data.unlock_tracker.text_id
							font = small_font
							font_size = small_font_size
							no_upper = true
						end
						selected_text = managers.localization:text(text_id, {progress = progress})
					end
				end
				selected_text = selected_text or managers.localization:text("bm_menu_no_items")
				noselected_text = selected_text
				new_data.mid_text = {}
				new_data.mid_text.selected_text = selected_text
				new_data.mid_text.selected_color = tweak_data.screen_colors.text
				new_data.mid_text.noselected_text = noselected_text
				new_data.mid_text.noselected_color = tweak_data.screen_colors.text
				new_data.mid_text.vertical = "center"
				new_data.mid_text.font = font
				new_data.mid_text.font_size = font_size
				new_data.mid_text.no_upper = no_upper
				new_data.lock_texture = true
			end
			if mod_name then
				local forbid = managers.blackmarket:can_modify_weapon(new_data.category, new_data.slot, new_data.name)
				if forbid then
					if type(new_data.unlocked) == "number" then
						new_data.unlocked = -math.abs(new_data.unlocked)
					else
						new_data.unlocked = false
					end
					new_data.lock_texture = self:get_lock_icon(new_data, "guis/textures/pd2/lock_incompatible")
					new_data.mid_text = nil
					new_data.conflict = managers.localization:text("bm_menu_" .. tostring(tweak_data.weapon.factory.parts[forbid] and tweak_data.weapon.factory.parts[forbid].type or forbid))
				end
				local weapon = managers.blackmarket:get_crafted_category_slot(data.prev_node_data.category, data.prev_node_data.slot) or {}
				local gadget
				local mod_type = tweak_data.weapon.factory.parts[new_data.name].type
				local sub_type = tweak_data.weapon.factory.parts[new_data.name].sub_type
				local is_auto = weapon and tweak_data.weapon[weapon.weapon_id] and tweak_data.weapon[weapon.weapon_id].FIRE_MODE == "auto"
				if mod_type == "gadget" then
					gadget = sub_type
				end
				local silencer = sub_type == "silencer" and true
				local texture = managers.menu_component:get_texture_from_mod_type(mod_type, sub_type, gadget, silencer, is_auto)
				new_data.desc_mini_icons = {}
				if DB:has(Idstring("texture"), texture) then
					table.insert(new_data.desc_mini_icons, {
						texture = texture,
						right = 0,
						bottom = 0,
						w = 16,
						h = 16
					})
				end
				local is_gadget = false
				if not new_data.conflict and new_data.unlocked and not is_gadget and not new_data.dlc_locked then
					new_data.comparision_data = managers.blackmarket:get_weapon_stats_with_mod(new_data.category, new_data.slot, mod_name)
				end
				if managers.blackmarket:got_new_drop(mod_global_value, "weapon_mods", mod_name) then
					new_data.mini_icons = new_data.mini_icons or {}
					table.insert(new_data.mini_icons, {
						name = "new_drop",
						texture = "guis/textures/pd2/blackmarket/inv_newdrop",
						right = 0,
						top = 0,
						layer = 1,
						w = 16,
						h = 16,
						stream = false
					})
					new_data.new_drop_data = {
						new_data.global_value or "normal",
						"weapon_mods",
						mod_name
					}
				end
			end
			local active = true
			if mod_name and new_data.unlocked and not crafted.customize_locked and active then
				if type(new_data.unlocked) ~= "number" or new_data.unlocked > 0 then
					if new_data.can_afford then
						table.insert(new_data, "wm_buy")
					end
					table.insert(new_data, "wm_preview")
					if not new_data.is_internal then
						table.insert(new_data, "wm_preview_mod")
					end
				else
					table.insert(new_data, "wm_preview")
				end
				if managers.workshop and managers.workshop:enabled() and not table.contains(managers.blackmarket:skin_editor():get_excluded_weapons(), weapon_id) then
					table.insert(new_data, "w_skin")
				end
				local weapon_mod_tweak = tweak_data.weapon.factory.parts[mod_name]
				if weapon_mod_tweak and weapon_mod_tweak.is_a_unlockable ~= true then
					table.insert(new_data, "wm_buy_mod")
				end
			end
			data[index] = new_data
		end
		for i = 1, math.max(math.ceil(num_steps / 3), 3) * 3 do
			if not data[i] then
				new_data = {}
				new_data.name = "empty"
				new_data.name_localized = ""
				new_data.category = data.category
				new_data.slot = i
				new_data.unlocked = true
				new_data.equipped = false
				data[i] = new_data
			end
		end
		local weapon_blueprint = managers.blackmarket:get_weapon_blueprint(data.prev_node_data.category, data.prev_node_data.slot) or {}
		local equipped
		for i, mod in ipairs(data) do
			for _, weapon_mod in ipairs(weapon_blueprint) do
				if mod.name == weapon_mod and (not global_values[weapon_mod] or global_values[weapon_mod] == data[i].global_value) then
					equipped = i
				else
				end
			end
		end
		if equipped then
			data[equipped].equipped = true
			data[equipped].unlocked = not crafted.customize_locked and (data[equipped].unlocked or true)
			data[equipped].mid_text = crafted.customize_locked and data[equipped].mid_text or nil
			data[equipped].lock_texture = crafted.customize_locked and data[equipped].lock_texture or nil
			for i = 1, #data[equipped] do
				table.remove(data[equipped], 1)
			end
			data[equipped].price = 0
			data[equipped].can_afford = true
			if not crafted.customize_locked then
				table.insert(data[equipped], "wm_remove_buy")
				if not data[equipped].is_internal then
					table.insert(data[equipped], "wm_remove_preview_mod")
					table.insert(data[equipped], "wm_remove_preview")
				else
					table.insert(data[equipped], "wm_preview")
				end
				if managers.workshop and managers.workshop:enabled() and data.prev_node_data and not table.contains(managers.blackmarket:skin_editor():get_excluded_weapons(), data.prev_node_data.name) then
					table.insert(data[equipped], "w_skin")
				end
				local weapon_mod_tweak = tweak_data.weapon.factory.parts[data[equipped].name]
				if weapon_mod_tweak and weapon_mod_tweak.type ~= "bonus" and weapon_mod_tweak.is_a_unlockable ~= true then
					table.insert(data[equipped], "wm_buy_mod")
				end
			end
			local factory = tweak_data.weapon.factory.parts[data[equipped].name]
			if data.name == "sight" and factory and factory.texture_switch then
				if not crafted.customize_locked then
					table.insert(data[equipped], "wm_reticle_switch_menu")
				end
				local reticle_texture = managers.blackmarket:get_part_texture_switch(data[equipped].category, data[equipped].slot, data[equipped].name)
				if reticle_texture and reticle_texture ~= "" then
					data[equipped].mini_icons = data[equipped].mini_icons or {}
					table.insert(data[equipped].mini_icons, {
						texture = reticle_texture,
						right = 1,
						bottom = 1,
						layer = 2,
						w = 30,
						h = 30,
						stream = true,
						blend_mode = "add"
					})
				end
			end
			if not data[equipped].conflict then
				if false then
					if data[equipped].default_mod then
						data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_with_mod(data[equipped].category, data[equipped].slot, data[equipped].default_mod)
					else
						data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_without_mod(data[equipped].category, data[equipped].slot, data[equipped].name)
					end
				end
			end
		end
	end
end

end